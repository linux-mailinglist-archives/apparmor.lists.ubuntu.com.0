Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BD88882CD02
	for <lists+apparmor@lfdr.de>; Sat, 13 Jan 2024 15:24:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rOevj-00033C-9B; Sat, 13 Jan 2024 14:24:11 +0000
Received: from mail.ispras.ru ([83.149.199.84])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <pchelkin@ispras.ru>)
 id 1rOcvv-0002JG-Lp
 for apparmor@lists.ubuntu.com; Sat, 13 Jan 2024 12:16:15 +0000
Received: from localhost.ispras.ru (unknown [10.10.165.8])
 by mail.ispras.ru (Postfix) with ESMTPSA id E84F740762E4;
 Sat, 13 Jan 2024 12:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru E84F740762E4
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: John Johansen <john.johansen@canonical.com>
Date: Sat, 13 Jan 2024 15:15:52 +0300
Message-ID: <20240113121556.12948-3-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240113121556.12948-1-pchelkin@ispras.ru>
References: <20240113121556.12948-1-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Jan 2024 14:24:04 +0000
Subject: [apparmor] [PATCH 2/2] apparmor: fix namespace check in serialized
	stream headers from the same policy load
X-BeenThere: apparmor@lists.ubuntu.com
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: AppArmor discussion <apparmor.lists.ubuntu.com>
List-Unsubscribe: <https://lists.ubuntu.com/mailman/options/apparmor>,
 <mailto:apparmor-request@lists.ubuntu.com?subject=unsubscribe>
List-Archive: <https://lists.ubuntu.com/archives/apparmor>
List-Post: <mailto:apparmor@lists.ubuntu.com>
List-Help: <mailto:apparmor-request@lists.ubuntu.com?subject=help>
List-Subscribe: <https://lists.ubuntu.com/mailman/listinfo/apparmor>,
 <mailto:apparmor-request@lists.ubuntu.com?subject=subscribe>
Cc: lvc-project@linuxtesting.org, Paul Moore <paul@paul-moore.com>,
 linux-kernel@vger.kernel.org, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, Fedor Pchelkin <pchelkin@ispras.ru>,
 linux-security-module@vger.kernel.org,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Per commit 04dc715e24d0 ("apparmor: audit policy ns specified in policy
load"), profiles in a single load must specify the same namespace. It is
supposed to be detected inside aa_replace_profiles() and verify_header(),
but seems not to be implemented correctly in the second function.

Consider we have the following profile load

  profile :ns1:profile1 ... {}
  profile :ns2:profile2 ... {}

The profiles specify different policy namespaces but if they are loaded as
a single binary where the serialized stream headers contain different
namespace values, it eventually leads to the profiles specified with
different namespaces be included into the same one without any specific
indication to user.

*ns is assigned NULL in verify_header(), and the branch indicating an
"invalid ns change" message is a dead code.

Moreover, some of *ns strings is leaked as they are allocated every time
verify_header() reads a namespace string.

Actually, *ns is already assigned NULL in aa_unpack(), before the multiple
profiles unpacking loop. So make verify_header() check if every new
unpacked namespace declaration differs from the previous one in the same
load.

Note that similar to the namespace check in aa_replace_profiles(), if
one profile in the load specifies some namespace declaration in the header
and the other one doesn't specify any namespace in the header - it is also
considered invalid, e.g. the following multiple profiles load will fail
after this patch

  profile profile1 ... {}
  profile :ns:profile2 ... {}

Found by Linux Verification Center (linuxtesting.org).

Fixes: dd51c8485763 ("apparmor: provide base for multiple profiles to be replaced at once")
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 security/apparmor/policy_unpack.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 54f7b4346506..5bd8ab7f1c88 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -1120,7 +1120,6 @@ static int verify_header(struct aa_ext *e, int start, const char **ns)
 {
 	int error = -EPROTONOSUPPORT;
 	const char *name = NULL;
-	*ns = NULL;
 
 	/* get the interface version */
 	if (!aa_unpack_u32(e, &e->version, "version")) {
@@ -1142,20 +1141,35 @@ static int verify_header(struct aa_ext *e, int start, const char **ns)
 		return error;
 	}
 
-	/* read the namespace if present */
+	/* read the namespace if present and check it against policy load
+	 * namespace specified in the data start header
+	 */
 	if (aa_unpack_str(e, &name, "namespace")) {
 		if (*name == '\0') {
 			audit_iface(NULL, NULL, NULL, "invalid namespace name",
 				    e, error);
 			return error;
 		}
+
+		/* don't allow different namespaces be specified in the same
+		 * policy load set
+		 */
+		error = -EACCES;
 		if (*ns && strcmp(*ns, name)) {
-			audit_iface(NULL, NULL, NULL, "invalid ns change", e,
+			audit_iface(NULL, NULL, NULL,
+				    "policy load has mixed namespaces", e,
 				    error);
-		} else if (!*ns) {
+			return error;
+		} else if (!*ns && start) {
+			/* fill current policy load namespace at data start */
 			*ns = kstrdup(name, GFP_KERNEL);
 			if (!*ns)
 				return -ENOMEM;
+		} else if (!*ns) {
+			audit_iface(NULL, NULL, NULL,
+				    "policy load has mixed namespaces", e,
+				    error);
+			return error;
 		}
 	}
 
-- 
2.43.0



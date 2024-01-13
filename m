Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D6182CD01
	for <lists+apparmor@lfdr.de>; Sat, 13 Jan 2024 15:24:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rOeve-000335-0z; Sat, 13 Jan 2024 14:24:09 +0000
Received: from mail.ispras.ru ([83.149.199.84])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <pchelkin@ispras.ru>)
 id 1rOcvs-0002J4-So
 for apparmor@lists.ubuntu.com; Sat, 13 Jan 2024 12:16:13 +0000
Received: from localhost.ispras.ru (unknown [10.10.165.8])
 by mail.ispras.ru (Postfix) with ESMTPSA id 2D59540755C7;
 Sat, 13 Jan 2024 12:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 2D59540755C7
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: John Johansen <john.johansen@canonical.com>
Date: Sat, 13 Jan 2024 15:15:51 +0300
Message-ID: <20240113121556.12948-2-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240113121556.12948-1-pchelkin@ispras.ru>
References: <20240113121556.12948-1-pchelkin@ispras.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Jan 2024 14:24:03 +0000
Subject: [apparmor] [PATCH 1/2] apparmor: rename the data start flag inside
	verify_header
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

The current `required` flag indicates the packed data start thus requiring
the header to be unpacked at this position.

For the purposes of verify_header() refinement, rename that flag to
`start` so that it can be used with this meaning in other part of the
function.

Found by Linux Verification Center (linuxtesting.org).

Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 security/apparmor/policy_unpack.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index a91b30100b77..54f7b4346506 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -1111,12 +1111,12 @@ static struct aa_profile *unpack_profile(struct aa_ext *e, char **ns_name)
 /**
  * verify_header - unpack serialized stream header
  * @e: serialized data read head (NOT NULL)
- * @required: whether the header is required or optional
+ * @start: whether the header is located at the start of data
  * @ns: Returns - namespace if one is specified else NULL (NOT NULL)
  *
  * Returns: error or 0 if header is good
  */
-static int verify_header(struct aa_ext *e, int required, const char **ns)
+static int verify_header(struct aa_ext *e, int start, const char **ns)
 {
 	int error = -EPROTONOSUPPORT;
 	const char *name = NULL;
@@ -1124,7 +1124,8 @@ static int verify_header(struct aa_ext *e, int required, const char **ns)
 
 	/* get the interface version */
 	if (!aa_unpack_u32(e, &e->version, "version")) {
-		if (required) {
+		/* the header is required at the start of data */
+		if (start) {
 			audit_iface(NULL, NULL, NULL, "invalid profile format",
 				    e, error);
 			return error;
-- 
2.43.0



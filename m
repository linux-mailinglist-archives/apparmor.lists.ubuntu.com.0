Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9DF901995
	for <lists+apparmor@lfdr.de>; Mon, 10 Jun 2024 05:47:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sGW0C-0005SR-1l; Mon, 10 Jun 2024 03:47:24 +0000
Received: from flow3-smtp.messagingengine.com ([103.168.172.138])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jcalmels@3xx0.net>) id 1sGFyK-00022s-HR
 for apparmor@lists.ubuntu.com; Sun, 09 Jun 2024 10:40:24 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailflow.nyi.internal (Postfix) with ESMTP id C56CA2001CA;
 Sun,  9 Jun 2024 06:40:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 09 Jun 2024 06:40:23 -0400
X-ME-Sender: <xms:l4ZlZpAnNuuxKPDr2Cd6FBTRHnbQHjA9iJqJ4vtInMEttqloUvxL3w>
 <xme:l4ZlZnhUUG5XLMuxwvF80Ztx7mxdiLYJkN9_fky8qYyIzQrHsQIGX186FBjOqQ6no
 AUWoGLH52kM3Rf3MZc>
X-ME-Received: <xmr:l4ZlZkkfGAqHkbW_x8-j2v_acbqpImowU9kXZ95ojAtc5RRkNQjTGleBF0HboqHBacD1A9zHgRg8_pAIMZjUemRvghpdz9qZz344rHcQr0Y1pQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtjedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeflohhn
 rghthhgrnhcuvegrlhhmvghlshcuoehjtggrlhhmvghlshesfeiggidtrdhnvghtqeenuc
 ggtffrrghtthgvrhhnpeeiueeukeeitddvheeiveeiiedvhfeljeeiteeggedtteeiueet
 iefhudfgvddvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehjtggrlhhmvghlshesfeiggidtrdhnvght
X-ME-Proxy: <xmx:l4ZlZjxUkGLqs4oogIXztRVN01SaUztAQoyf4JRjSNo3W1Ff2FE5Tw>
 <xmx:l4ZlZuSJtY7q7t2kw7m88WXzlCDmeh5426CQ8jJ2JXo_CLz32Ee2BA>
 <xmx:l4ZlZmYqRTSIK4t09w7Ut9EkpHVDxBdVpRJrKxp9ntVw67oszXyFTA>
 <xmx:l4ZlZvRCMGICE2VMFlgubWMv7nGxzwWG6vWPlCu8SgaPTi-k1iZ6lQ>
 <xmx:l4ZlZsCGVIS4MEQvAhrZIJNWsOX2P9j682pJAC79bR95XH88HzCOxkbV>
Feedback-ID: i76614979:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Jun 2024 06:40:19 -0400 (EDT)
From: Jonathan Calmels <jcalmels@3xx0.net>
To: brauner@kernel.org,	ebiederm@xmission.com,
 Jonathan Corbet <corbet@lwn.net>,	Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>,	"Serge E. Hallyn" <serge@hallyn.com>,
 KP Singh <kpsingh@kernel.org>,	Matt Bobrowski <mattbobrowski@google.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>,	Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@google.com>,	Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>,	Luis Chamberlain <mcgrof@kernel.org>,
 Kees Cook <kees@kernel.org>,	Joel Granados <j.granados@samsung.com>,
 John Johansen <john.johansen@canonical.com>,
 David Howells <dhowells@redhat.com>,	Jarkko Sakkinen <jarkko@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,	Mykola Lysenko <mykolal@fb.com>,
 Shuah Khan <shuah@kernel.org>
Date: Sun,  9 Jun 2024 03:43:35 -0700
Message-ID: <20240609104355.442002-3-jcalmels@3xx0.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240609104355.442002-1-jcalmels@3xx0.net>
References: <20240609104355.442002-1-jcalmels@3xx0.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.138; envelope-from=jcalmels@3xx0.net;
 helo=flow3-smtp.messagingengine.com
X-Mailman-Approved-At: Mon, 10 Jun 2024 03:47:22 +0000
Subject: [apparmor] [PATCH v2 2/4] capabilities: Add securebit to restrict
	userns caps
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
Cc: Jonathan Calmels <jcalmels@3xx0.net>, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, containers@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This patch adds a new capability security bit designed to constrain a
task’s userns capability set to its bounding set. The reason for this is
twofold:

- This serves as a quick and easy way to lock down a set of capabilities
  for a task, thus ensuring that any namespace it creates will never be
  more privileged than itself is.
- This helps userspace transition to more secure defaults by not requiring
  specific logic for the userns capability set, or libcap support.

Example:

    # capsh --secbits=$((1 << 8)) --drop=cap_sys_rawio -- \
            -c 'unshare -r grep Cap /proc/self/status'
    CapInh: 0000000000000000
    CapPrm: 000001fffffdffff
    CapEff: 000001fffffdffff
    CapBnd: 000001fffffdffff
    CapAmb: 0000000000000000
    CapUNs: 000001fffffdffff

Signed-off-by: Jonathan Calmels <jcalmels@3xx0.net>
---
 include/linux/securebits.h      |  1 +
 include/uapi/linux/securebits.h | 11 ++++++++++-
 kernel/user_namespace.c         |  5 +++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/include/linux/securebits.h b/include/linux/securebits.h
index 656528673983..5f9d85cd69c3 100644
--- a/include/linux/securebits.h
+++ b/include/linux/securebits.h
@@ -5,4 +5,5 @@
 #include <uapi/linux/securebits.h>
 
 #define issecure(X)		(issecure_mask(X) & current_cred_xxx(securebits))
+#define iscredsecure(cred, X)	(issecure_mask(X) & cred->securebits)
 #endif /* !_LINUX_SECUREBITS_H */
diff --git a/include/uapi/linux/securebits.h b/include/uapi/linux/securebits.h
index d6d98877ff1a..2da3f4be4531 100644
--- a/include/uapi/linux/securebits.h
+++ b/include/uapi/linux/securebits.h
@@ -52,10 +52,19 @@
 #define SECBIT_NO_CAP_AMBIENT_RAISE_LOCKED \
 			(issecure_mask(SECURE_NO_CAP_AMBIENT_RAISE_LOCKED))
 
+/* When set, user namespace capabilities are restricted to their parent's bounding set. */
+#define SECURE_USERNS_STRICT_CAPS			8
+#define SECURE_USERNS_STRICT_CAPS_LOCKED		9  /* make bit-8 immutable */
+
+#define SECBIT_USERNS_STRICT_CAPS (issecure_mask(SECURE_USERNS_STRICT_CAPS))
+#define SECBIT_USERNS_STRICT_CAPS_LOCKED \
+			(issecure_mask(SECURE_USERNS_STRICT_CAPS_LOCKED))
+
 #define SECURE_ALL_BITS		(issecure_mask(SECURE_NOROOT) | \
 				 issecure_mask(SECURE_NO_SETUID_FIXUP) | \
 				 issecure_mask(SECURE_KEEP_CAPS) | \
-				 issecure_mask(SECURE_NO_CAP_AMBIENT_RAISE))
+				 issecure_mask(SECURE_NO_CAP_AMBIENT_RAISE) | \
+				 issecure_mask(SECURE_USERNS_STRICT_CAPS))
 #define SECURE_ALL_LOCKS	(SECURE_ALL_BITS << 1)
 
 #endif /* _UAPI_LINUX_SECUREBITS_H */
diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 7e624607330b..53848e2b68cd 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -10,6 +10,7 @@
 #include <linux/cred.h>
 #include <linux/securebits.h>
 #include <linux/security.h>
+#include <linux/capability.h>
 #include <linux/keyctl.h>
 #include <linux/key-type.h>
 #include <keys/user-type.h>
@@ -42,6 +43,10 @@ static void dec_user_namespaces(struct ucounts *ucounts)
 
 static void set_cred_user_ns(struct cred *cred, struct user_namespace *user_ns)
 {
+	/* Limit userns capabilities to our parent's bounding set. */
+	if (iscredsecure(cred, SECURE_USERNS_STRICT_CAPS))
+		cred->cap_userns = cap_intersect(cred->cap_userns, cred->cap_bset);
+
 	/* Start with the capabilities defined in the userns set. */
 	cred->cap_bset = cred->cap_userns;
 	cred->cap_permitted = cred->cap_userns;
-- 
2.45.2



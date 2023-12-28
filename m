Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id EACBE81FE4B
	for <lists+apparmor@lfdr.de>; Fri, 29 Dec 2023 09:53:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rJ8bl-0005Kg-Dg; Fri, 29 Dec 2023 08:52:46 +0000
Received: from mail.ispras.ru ([83.149.199.84])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <pchelkin@ispras.ru>)
 id 1rIswC-0006p7-FH
 for apparmor@lists.ubuntu.com; Thu, 28 Dec 2023 16:08:48 +0000
Received: from localhost.ispras.ru (unknown [10.10.165.11])
 by mail.ispras.ru (Postfix) with ESMTPSA id F145540F1DDC;
 Thu, 28 Dec 2023 16:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru F145540F1DDC
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: John Johansen <john.johansen@canonical.com>
Date: Thu, 28 Dec 2023 19:07:43 +0300
Message-ID: <20231228160744.1301-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 29 Dec 2023 08:52:40 +0000
Subject: [apparmor] [PATCH] apparmor: avoid crash when parsed profile name
	is empty
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

When processing a packed profile in unpack_profile() described like

 "profile :ns::samba-dcerpcd /usr/lib*/samba/{,samba/}samba-dcerpcd {...}"

a string ":samba-dcerpcd" is unpacked as a fully-qualified name and then
passed to aa_splitn_fqname().

aa_splitn_fqname() treats ":samba-dcerpcd" as only containing a namespace.
Thus it returns NULL for tmpname, meanwhile tmpns is non-NULL. Later
aa_alloc_profile() crashes as the new profile name is NULL now.

general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 6 PID: 1657 Comm: apparmor_parser Not tainted 6.7.0-rc2-dirty #16
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.2-3-gd478f380-rebuilt.opensuse.org 04/01/2014
RIP: 0010:strlen+0x1e/0xa0
Call Trace:
 <TASK>
 ? strlen+0x1e/0xa0
 aa_policy_init+0x1bb/0x230
 aa_alloc_profile+0xb1/0x480
 unpack_profile+0x3bc/0x4960
 aa_unpack+0x309/0x15e0
 aa_replace_profiles+0x213/0x33c0
 policy_update+0x261/0x370
 profile_replace+0x20e/0x2a0
 vfs_write+0x2af/0xe00
 ksys_write+0x126/0x250
 do_syscall_64+0x46/0xf0
 entry_SYSCALL_64_after_hwframe+0x6e/0x76
 </TASK>
---[ end trace 0000000000000000 ]---
RIP: 0010:strlen+0x1e/0xa0

It seems such behaviour of aa_splitn_fqname() is expected and checked in
other places where it is called (e.g. aa_remove_profiles). Well, there
is an explicit comment "a ns name without a following profile is allowed"
inside.

AFAICS, nothing can prevent unpacked "name" to be in form like
":samba-dcerpcd" - it is passed from userspace.

Deny the whole profile set replacement in such case and inform user with
EPROTO and an explaining message.

Found by Linux Verification Center (linuxtesting.org).

Fixes: 04dc715e24d0 ("apparmor: audit policy ns specified in policy load")
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 security/apparmor/policy_unpack.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index e0af1e9f40ee..70d448048773 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -835,6 +835,10 @@ static struct aa_profile *unpack_profile(struct aa_ext *e, char **ns_name)
 
 	tmpname = aa_splitn_fqname(name, strlen(name), &tmpns, &ns_len);
 	if (tmpns) {
+		if (!tmpname) {
+			info = "empty profile name";
+			goto fail;
+		}
 		*ns_name = kstrndup(tmpns, ns_len, GFP_KERNEL);
 		if (!*ns_name) {
 			info = "out of memory";
-- 
2.43.0



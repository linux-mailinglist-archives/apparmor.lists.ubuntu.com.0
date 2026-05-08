Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGg+M0Sf/WmwgQAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 08 May 2026 10:31:00 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8144F4F3BC7
	for <lists+apparmor@lfdr.de>; Fri, 08 May 2026 10:31:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wLGbf-0007zC-O1; Fri, 08 May 2026 08:30:47 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <maciek.borzecki@gmail.com>)
 id 1wLGbe-0007y6-7n
 for apparmor@lists.ubuntu.com; Fri, 08 May 2026 08:30:46 +0000
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-bc66ad3742fso299516366b.1
 for <apparmor@lists.ubuntu.com>; Fri, 08 May 2026 01:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778229045; x=1778833845; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mtwV3yAjstDDR+F+7JtcUVlavMFP8GHDGMCXkZjGy7Q=;
 b=b0cV2CWqI+DUhiEC5V2FpB85CEaHS/LC0OU+7IrbXMZV9oFKUD11SprWCjyv3Cwbtm
 WB4bS6dxvR1irfsX7Rc9R4TJOOxX+lVWTwoJfrysjVoaQnRzFqA31fOHaDUlIvLJxk+v
 woCvkNpVoKN2UKyV3vHr+9Lz2xvM+svr+2ilEPo5+L5jTCjo5aLDGjfNKvGOLhFkh7p1
 i2CfhNxCaH7uqv5bC6Lz9g3mPM+knuX2RrZxdU7ujK9ubs3qTiL6LHgX1SoryrCq001h
 1RaF20XBYj14FscxR+TXN/55GPLtREWp+Xd9O5ux5YFmryVbs+qWjF3Ww3VsxxOPNHmc
 Kt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778229045; x=1778833845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mtwV3yAjstDDR+F+7JtcUVlavMFP8GHDGMCXkZjGy7Q=;
 b=bQs4QUN2gPbm8qPiDFxin3cJRAj7wlmz9m4QLozkPsNOMjB8BIH1R5Ea2Cs8Ux3Mwa
 f0KMVlpw+5wsTQXGTs5PZIUkLrAu+oV2WSKmtsJUj3B3FH981j6mG/uPgMTEetOOuEcj
 ISRj1w1CFq2FjxSZkz5XAUNSk7IOYpQslAvANFI9k2R554Gmww5HLbsdqZGmqI/Acxcl
 GzNAnGEovQwUId4BcBQnodI2Cc9uHidAE+BQ7rgYiy7qSKIs0/NymS3Fw0tHbb/jfWC+
 JflJ+2UM2dMuFVtPuRaN13XGRG+qYxcWvOxZhrbOU1W0V6nxrmuH9eV6SRotNopZu24l
 BwvQ==
X-Gm-Message-State: AOJu0YwkSyBr8w6NP5apBssb7SuY5QrN55SJ/vpsmUR2MWpqm2nQylsD
 2HhIy/jRu3uYAKoFvQNCHZszvyC+XrdBctVEthGsMkZ4ayz5tPzkC+iGvqfS9F+F
X-Gm-Gg: Acq92OHTaK6PXSSmKYE1qevZAo/Ap+wdZP8NGC7wgiYEtF9fe0837qOY4RkalhDnTYU
 xm0581AXzojM1mxJZUbX8QEbgpSXH8FMc/42y8gWDAgtIOLWq/QzZjhmq0nAfozcGLU4XnZ7rCp
 Q0mCu7ESTmzn0wczm1SS/zZwzfa5yqjHBB2r+palhE7l3g3nwht4QpPQPmWxtqtAtNiKGvlY9lC
 NSmWtfgihfFRa78VkDPJBttUMkm2RBE/muecxMrbuhpXgRKCCty0xEPMumYATWNKB0K3OKxhrBf
 nRGV4Wh7MlEylUAoUaXrAo8gUdBND6Ic8znmaPy9IIGj+inT9fghYRMFCaEee0YiG+2NJjfWlHO
 L2/t5ddRSn6qt6dzGWtysJMZXcqAgbdZ68L6N5vaFUpNnWx1iQb1fIoxDPpnVB/MDdmV8jJu7rq
 QA4pzd6ZW3dByGwFnzh7UfLpiIB0KG8Kok9Tn6dzZyqgmMFUxKvHOhn1vyY2EnowyUMFpQkbnYv
 aOoeZMOAA==
X-Received: by 2002:a17:907:5c2:b0:bbd:6abc:2621 with SMTP id
 a640c23a62f3a-bcaac9377bbmr89071566b.37.1778229044676; 
 Fri, 08 May 2026 01:30:44 -0700 (PDT)
Received: from carrack.localdomain (93-159-24-237.cgnat.inetia.pl.
 [93.159.24.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac09c878fsm50561066b.16.2026.05.08.01.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 01:30:44 -0700 (PDT)
From: Maciek Borzecki <maciek.borzecki@gmail.com>
To: apparmor@lists.ubuntu.com
Date: Fri,  8 May 2026 10:30:16 +0200
Message-ID: <132278115c63b431d299ea252cc38c2a8a26f1b5.1778226393.git.maciek.borzecki@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.218.44;
 envelope-from=maciek.borzecki@gmail.com; helo=mail-ej1-f44.google.com
Subject: [apparmor] [PATCH] apparmor: fix uninitialised pointer passed to
	audit_log_untrustedstring()
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 8144F4F3BC7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[gmail.com:-];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FROM_NEQ_ENVFROM(0.00)[maciekborzecki@gmail.com,apparmor-bounces@lists.ubuntu.com];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action

Commit 4a134723f9f1 ("apparmor: move check for aa_null file to cover all cases")
intrdouced a small bug, where path_name() may pass a potentially uninitialized
*name to aa_audit_file() if the path->dentry had been replaced with
aa_null.dentry earlier on. This can lead to page fault like one observed on
7.0.2 openSUSE Tumbleweed kernel:

[51692.242756] [  T24690] BUG: unable to handle page fault for address: 0000000f00000003
[51692.242762] [  T24690] #PF: supervisor read access in kernel mode
[51692.242763] [  T24690] #PF: error_code(0x0000) - not-present page
[51692.242765] [  T24690] PGD 0 P4D 0
[51692.242768] [  T24690] Oops: Oops: 0000 [#1] SMP NOPTI
[51692.242772] [  T24690] CPU: 3 UID: 1020 PID: 24690 Comm: snap-confine Tainted: G           O        7.0.2-1-default #1 PREEMPT(full) openSUSE Tumbleweed  ab90b4c9940707f9cafa19bdad80b2cec52dbe51
[51692.242775] [  T24690] Tainted: [O]=OOT_MODULE
[51692.242777] [  T24690] Hardware name: Framework Laptop 13 (AMD Ryzen 7040Series)/FRANMDCP05, BIOS 03.18 01/08/2026
[51692.242778] [  T24690] RIP: 0010:strlen+0x4/0x30
[51692.242783] [  T24690] Code: f7 75 ec 31 c0 e9 17 9f 00 ff 48 89 f8 e9 0f 9f 00 ff 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa <80> 3f 00 74 18 48 89 f8 0f 1f 40 00 48 83 c0 01 80 38 00 75 f7 48
[51692.242785] [  T24690] RSP: 0018:ffffd015eb1e3608 EFLAGS: 00010282
[51692.242787] [  T24690] RAX: 0000000000000000 RBX: ffff89796198a360 RCX: 0000000000000000
[51692.242788] [  T24690] RDX: 00000000000000d1 RSI: 0000000f00000003 RDI: 0000000f00000003
[51692.242790] [  T24690] RBP: ffffffffb7ede090 R08: 00000000000005f5 R09: 0000000000000000
[51692.242791] [  T24690] R10: 0000000000000000 R11: 0000000000000000 R12: ffffd015eb1e3700
[51692.242792] [  T24690] R13: ffff8977a22bc380 R14: ffffffffb7ec5190 R15: ffff8977a0c8aa80
[51692.242794] [  T24690] FS:  0000000000000000(0000) GS:ffff897f640d8000(0000) knlGS:0000000000000000
[51692.242796] [  T24690] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[51692.242797] [  T24690] CR2: 0000000f00000003 CR3: 00000006ad15f000 CR4: 0000000000f50ef0
[51692.242799] [  T24690] PKRU: 55555554
[51692.242800] [  T24690] Call Trace:
[51692.242802] [  T24690]  <TASK>
[51692.242804] [  T24690]  audit_log_untrustedstring+0x1d/0x40
[51692.242811] [  T24690]  common_lsm_audit+0x71/0x1d0
[51692.242816] [  T24690]  aa_audit+0x5a/0x170
[51692.242819] [  T24690]  aa_audit_file+0x18a/0x1b0
[51692.242825] [  T24690]  path_name+0xd2/0x100
[51692.242829] [  T24690]  profile_path_perm.part.0+0x58/0xb0
[51692.242832] [  T24690]  aa_path_perm+0xef/0x150
[51692.242837] [  T24690]  apparmor_file_open+0x153/0x2e0
[51692.242840] [  T24690]  security_file_open+0x46/0xd0
[51692.242844] [  T24690]  do_dentry_open+0xe9/0x4d0
[51692.242848] [  T24690]  vfs_open+0x30/0x100

While here, initialise variables which are passed down to path_name().

Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 security/apparmor/file.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index 694e157149e85e47961f8217f8dc8afc80db16e3..c9d55fe1086f90085189020d920f9f8c834b1a5f 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -157,10 +157,10 @@ static int path_name(const char *op, const struct cred *subj_cred,
 
 	/* don't reaudit files closed during inheritance */
 	if (unlikely(path->dentry == aa_null.dentry))
-		error = -EACCES;
-	else
-		error = aa_path_name(path, flags, buffer, name, &info,
-				     labels_profile(label)->disconnected);
+		return -EACCES;
+
+	error = aa_path_name(path, flags, buffer, name, &info,
+			     labels_profile(label)->disconnected);
 	if (error) {
 		fn_for_each_confined(label, profile,
 			aa_audit_file(subj_cred,
@@ -250,7 +250,7 @@ static int profile_path_perm(const char *op, const struct cred *subj_cred,
 			     struct path_cond *cond, int flags,
 			     struct aa_perms *perms)
 {
-	const char *name;
+	const char *name = NULL;
 	int error;
 
 	if (profile_unconfined(profile))
@@ -328,7 +328,7 @@ static int profile_path_link(const struct cred *subj_cred,
 			     struct path_cond *cond)
 {
 	struct aa_ruleset *rules = profile->label.rules[0];
-	const char *lname, *tname = NULL;
+	const char *lname = NULL, *tname = NULL;
 	struct aa_perms lperms = {}, perms;
 	const char *info = NULL;
 	u32 request = AA_MAY_LINK;
-- 
2.54.0



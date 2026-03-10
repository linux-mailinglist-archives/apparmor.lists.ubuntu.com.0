Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKZyKyFEsGmshgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 10 Mar 2026 17:17:37 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8C9254840
	for <lists+apparmor@lfdr.de>; Tue, 10 Mar 2026 17:17:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vzzlr-0006eh-7E; Tue, 10 Mar 2026 16:17:23 +0000
Received: from mail.avm.de ([212.42.244.119])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <phahn-oss@avm.de>) id 1vzvgN-0005hW-Ej
 for apparmor@lists.ubuntu.com; Tue, 10 Mar 2026 11:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
 t=1773143724; bh=vGrPLNOiClPR9kf2JYtGEgONwIn4sxqTHiWcc1kKKyY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=vGHDpooj3kbLZ+8D0plCbMeYqQhZctChcZoWM2Oz3ppzOc10y+IZamI2t1Up6x5Oz
 ZOQWpS5VxsHODQ5E0bYLhrVtG85jFVZABrb+vIZU9NfiYqywilzOFMSb7wFF9KlZxk
 XMjhpb+uZFDFGYC7810AK5hKKVXc3NZ47/tNCbvg=
Received: from [212.42.244.71] (helo=mail.avm.de)
 by mail.avm.de with ESMTP (eXpurgate 4.55.2)
 (envelope-from <phahn-oss@avm.de>)
 id 69b006ab-2367-7f0000032729-7f0000019cec-1
 for <multiple-recipients>; Tue, 10 Mar 2026 12:55:23 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
 by mail.avm.de (Postfix) with ESMTPS;
 Tue, 10 Mar 2026 12:55:23 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-b4-is_err_or_null-v1-5-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2182; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=vGrPLNOiClPR9kf2JYtGEgONwIn4sxqTHiWcc1kKKyY=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAXmFi2noeXj0abdUjIB9kKoSnFcuerTTnqGw
 aIV0JkIMuiJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAF5gAKCRA0LQZT0ays
 25ZYCACJTZVo2gUPO+X2etWPNlTUp7ClEwWSNg3dPZBa5w0Z7EuwahYUGGyy8BKX2Xr3Nw3eStQ
 sVKw7MXxWmXWt5UTxCuTdRP3F8qkFihhAcyZGnaWXtsHW80RrqCOvZyrn/d1kQqYEpMpKbZIZxv
 /EpbwmWT4XeRvGuaEWqQ2bbe/QDrikm2suvUw6m77AVK8ag0Unhi8yF7km5ZQPmNxRG0b7wRfDu
 f9v8qAqM0yTILYLsa5pGAGuQ+9RoWhRyw/Vp6w7DPGkGl5Ft2gyZ5dwPzpx69OognVNti4fm1g6
 tztjOPF3hTnYGvxjbl6RQZRancjyqct71KnXaO98GUCNnx9j
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143723-8ECA1E1F-59018045/0/0
X-purgate-type: clean
X-purgate-size: 2184
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
Received-SPF: pass client-ip=212.42.244.119; envelope-from=phahn-oss@avm.de;
 helo=mail.avm.de
X-Mailman-Approved-At: Tue, 10 Mar 2026 16:17:18 +0000
Subject: [apparmor] [PATCH 05/61] smb: Prefer IS_ERR_OR_NULL over manual
	NULl check
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
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, Steve French <sfrench@samba.org>,
 Bharath SM <bharathsm@microsoft.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 7F8C9254840
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[avm.de : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[avm.de:s=mail];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:bpf@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:cocci@inria.fr,m:dm-devel@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:gfs2@lists.linux.dev,m:intel-gfx@lists.freedesktop.org,m:intel-wired-lan@lists.osuosl.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-block@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-ext4@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-mm@kvack.org,m:linux-modules@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-phy@l
 ists.infradead.org,m:linux-pm@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-sctp@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-trace-kernel@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:netdev@vger.kernel.org,m:ntfs3@lists.linux.dev,m:samba-technical@lists.samba.org,m:sched-ext@lists.linux.dev,m:target-devel@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:v9fs@lists.linux.dev,m:phahn-oss@avm.de,m:tom@talpey.com,m:sprasad@microsoft.com,m:pc@manguebit.org,m:sfrench@samba.org,m:bharathsm@microsoft.com,m:ronniesahlberg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[phahn-oss@avm.de,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[phahn-oss@avm.de,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[avm.de:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.943];
	RCPT_COUNT_GT_50(0.00)[60];
	FREEMAIL_CC(0.00)[talpey.com,microsoft.com,manguebit.org,samba.org,gmail.com];
	TAGGED_RCPT(0.00)[apparmor];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo,avm.de:mid,avm.de:email,samba.org:email,manguebit.org:email]
X-Rspamd-Action: no action

Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
check.

Change generated with coccinelle.

To: Steve French <sfrench@samba.org>
To: Paulo Alcantara <pc@manguebit.org>
To: Ronnie Sahlberg <ronniesahlberg@gmail.com>
To: Shyam Prasad N <sprasad@microsoft.com>
To: Tom Talpey <tom@talpey.com>
To: Bharath SM <bharathsm@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 fs/smb/client/cifsglob.h | 2 +-
 fs/smb/client/connect.c  | 2 +-
 fs/smb/client/readdir.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index 6f9b6c72962b09260542b711d4c64e7dc42c7845..fb731b2609465ebe50742936b458aba210ecbd4a 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -1336,7 +1336,7 @@ void cifs_put_tlink(struct tcon_link *tlink);
 static inline struct tcon_link *
 cifs_get_tlink(struct tcon_link *tlink)
 {
-	if (tlink && !IS_ERR(tlink))
+	if (!IS_ERR_OR_NULL(tlink))
 		atomic_inc(&tlink->tl_count);
 	return tlink;
 }
diff --git a/fs/smb/client/connect.c b/fs/smb/client/connect.c
index 3bad2c5c523dbd1d4b1ab253567984612be0f348..aa12d327894b270b59ea30be0e6d77b4188fc98f 100644
--- a/fs/smb/client/connect.c
+++ b/fs/smb/client/connect.c
@@ -2895,7 +2895,7 @@ cifs_get_tcon(struct cifs_ses *ses, struct smb3_fs_context *ctx)
 void
 cifs_put_tlink(struct tcon_link *tlink)
 {
-	if (!tlink || IS_ERR(tlink))
+	if (IS_ERR_OR_NULL(tlink))
 		return;
 
 	if (!atomic_dec_and_test(&tlink->tl_count) ||
diff --git a/fs/smb/client/readdir.c b/fs/smb/client/readdir.c
index be22bbc4a65a03ec64b87d8505d1496279f22efc..3e9260cca196ea8ab17aad82c4824ec5e468e2e7 100644
--- a/fs/smb/client/readdir.c
+++ b/fs/smb/client/readdir.c
@@ -165,7 +165,7 @@ cifs_prime_dcache(struct dentry *parent, struct qstr *name,
 			inode = ERR_PTR(-ENOMEM);
 		alias = d_splice_alias(inode, dentry);
 		d_lookup_done(dentry);
-		if (alias && !IS_ERR(alias))
+		if (!IS_ERR_OR_NULL(alias))
 			dput(alias);
 	}
 	dput(dentry);

-- 
2.43.0



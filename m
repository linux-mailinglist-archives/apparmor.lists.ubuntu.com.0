Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJmlJtQXs2mDSAAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 12 Mar 2026 20:45:24 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D5027844A
	for <lists+apparmor@lfdr.de>; Thu, 12 Mar 2026 20:45:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w0ly4-0004wF-Or; Thu, 12 Mar 2026 19:45:12 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <richard@nod.at>) id 1w0lmz-0002RO-EQ
 for apparmor@lists.ubuntu.com; Thu, 12 Mar 2026 19:33:45 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4DE582C14A8;
 Thu, 12 Mar 2026 20:33:44 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id yCwNT8mwVvHB; Thu, 12 Mar 2026 20:33:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8A34D2C14AA;
 Thu, 12 Mar 2026 20:33:43 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3HN7guaAFMsE; Thu, 12 Mar 2026 20:33:43 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id ABF4A2C14A6;
 Thu, 12 Mar 2026 20:33:42 +0100 (CET)
Date: Thu, 12 Mar 2026 20:33:42 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Philipp Hahn <phahn-oss@avm.de>
Message-ID: <1584421372.26258.1773344022512.JavaMail.zimbra@nod.at>
In-Reply-To: <20260310-b4-is_err_or_null-v1-48-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-48-bd63b656022d@avm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF148
 (Linux)/8.8.12_GA_3809)
Thread-Topic: Prefer IS_ERR_OR_NULL over manual NULL check
Thread-Index: 0l8CyewQmrWlgaG6N3QgQFfukutRbA==
Received-SPF: permerror client-ip=116.203.167.152; envelope-from=richard@nod.at;
 helo=lithops.sigma-star.at
X-Mailman-Approved-At: Thu, 12 Mar 2026 19:45:11 +0000
Subject: Re: [apparmor] [PATCH 48/61] mtd: Prefer IS_ERR_OR_NULL over manual
	NULL check
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
Cc: linux-hyperv <linux-hyperv@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, kvm@vger.kernel.org,
 linux-sh <linux-sh@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-mips <linux-mips@vger.kernel.org>, gfs2 <gfs2@lists.linux.dev>,
 linux-mm <linux-mm@kvack.org>, linux-sctp@vger.kernel.org,
 target-devel@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-cifs <linux-cifs@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>,
 linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-rockchip <linux-rockchip@lists.infradead.org>, iommu@lists.linux.dev,
 intel-wired-lan@lists.osuosl.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-input@vger.kernel.org, linux-ext4 <linux-ext4@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, dm-devel@lists.linux.dev,
 linux-pm <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 apparmor <apparmor@lists.ubuntu.com>,
 linux-sound <linux-sound@vger.kernel.org>,
 linux-block <linux-block@vger.kernel.org>, linux-gpio@vger.kernel.org,
 ceph-devel <ceph-devel@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>, sched-ext@lists.linux.dev,
 cocci <cocci@inria.fr>, linux-nfs <linux-nfs@vger.kernel.org>,
 ntfs3 <ntfs3@lists.linux.dev>, linux-s390 <linux-s390@vger.kernel.org>,
 v9fs <v9fs@lists.linux.dev>, linux-usb@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-bluetooth@vger.kernel.org,
 LSM <linux-security-module@vger.kernel.org>,
 tipc-discussion@lists.sourceforge.net, linux-modules@vger.kernel.org,
 netdev <netdev@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>,
 linux-trace-kernel <linux-trace-kernel@vger.kernel.org>,
 linux-erofs <linux-erofs@lists.ozlabs.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phahn-oss@avm.de,m:linux-hyperv@vger.kernel.org,m:vigneshr@ti.com,m:kvm@vger.kernel.org,m:linux-sh@vger.kernel.org,m:samba-technical@lists.samba.org,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:gfs2@lists.linux.dev,m:linux-mm@kvack.org,m:linux-sctp@vger.kernel.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:linux-phy@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:iommu@lists.linux.dev,m:intel-wired-lan@lists.osuosl.org,m:linux-arm-kernel@lists.infradead.org,m:linux-input@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-media@vger.kernel.org,m:dm-devel@lists.linux.dev,m:linux-pm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:linux-sound@vger.kernel.org,m:l
 inux-block@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:sched-ext@lists.linux.dev,m:cocci@inria.fr,m:linux-nfs@vger.kernel.org,m:ntfs3@lists.linux.dev,m:linux-s390@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:linux-modules@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	DMARC_NA(0.00)[nod.at];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[richard@nod.at,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FROM_NEQ_ENVFROM(0.00)[richard@nod.at,apparmor-bounces@lists.ubuntu.com];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_GT_50(0.00)[56];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nod.at:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 50D5027844A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

----- Urspr=C3=BCngliche Mail -----
> Von: "Philipp Hahn" <phahn-oss@avm.de>
> -=09if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
> +=09if (!IS_ERR_OR_NULL(gpiomtd->nwp))

No, please don't.

This makes reading the code not easier.

Thanks,
//richard


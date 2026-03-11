Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A8QIrLasmlMQQAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 12 Mar 2026 16:24:34 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 37785274520
	for <lists+apparmor@lfdr.de>; Thu, 12 Mar 2026 16:24:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w0hRr-0003Pv-Ah; Thu, 12 Mar 2026 14:55:39 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2)
 (envelope-from <linux+apparmor=lists.ubuntu.com@armlinux.org.uk>)
 id 1w07FJ-0000Mj-KG
 for apparmor@lists.ubuntu.com; Wed, 11 Mar 2026 00:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G+5qjaihAOE3Wva2YLY8jATPGvyCa7CiJLk7V/SbO+c=; b=v5WQ+aGF0sps0WNhC7Zp3i4qfq
 0Hb0SCVWpSXvSr7WdAe2bPHF4KfJ/Ed1eiaiCb8D0oCv1z5xwK7JuLf0tC0l8hY2t6eWn1tcNZSpg
 QYrAEXTacs2n4b4dGxTmR/QZFsu7Xre8GI0M2CDH+d6uoN0gFUU9MJ/Uqp3GyqqaO1XmybhsS5lVz
 KPXBqq6BLZCCQzpQ8jMEzm8MnKJZE/MMCDQxbCe0qlHGv5pHIS812K52VRhLCysEP1IhQjrayukQi
 lGpFnxogge7mHLP+wP8QrSVC+xUyVfKJNzw96REdhpsHijJHvcSndISQsei/F/gJP6wWuF34GUcce
 0I/0wllQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55974)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w07FF-000000005dP-41aF;
 Wed, 11 Mar 2026 00:16:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w07FB-000000005hj-1vhz; Wed, 11 Mar 2026 00:16:09 +0000
Date: Wed, 11 Mar 2026 00:16:09 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Philipp Hahn <phahn-oss@avm.de>
Message-ID: <abC0Se_cstwTWp9r@shell.armlinux.org.uk>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-38-bd63b656022d@avm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-b4-is_err_or_null-v1-38-bd63b656022d@avm.de>
Received-SPF: none client-ip=78.32.30.218;
 envelope-from=linux+apparmor=lists.ubuntu.com@armlinux.org.uk;
 helo=pandora.armlinux.org.uk
X-Mailman-Approved-At: Thu, 12 Mar 2026 14:55:33 +0000
Subject: Re: [apparmor] [PATCH 38/61] net: Prefer IS_ERR_OR_NULL over manual
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
Cc: Taras Chornyi <taras.chornyi@plvision.eu>, linux-hyperv@vger.kernel.org,
 kvm@vger.kernel.org, linux-sh@vger.kernel.org, samba-technical@lists.samba.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-sctp@vger.kernel.org,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Quan Nguyen <quan@os.amperecomputing.com>, linux-phy@lists.infradead.org,
 Paolo Abeni <pabeni@redhat.com>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-cifs@vger.kernel.org,
 Igor Russkikh <irusskikh@marvell.com>, linux-scsi@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Pavan Chebbi <pavan.chebbi@broadcom.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, intel-wired-lan@lists.osuosl.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, linux-ext4@vger.kernel.org,
 Potnuri Bharat Teja <bharat@chelsio.com>, linux-media@vger.kernel.org,
 dm-devel@lists.linux.dev, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Keyur Chudgar <keyur@os.amperecomputing.com>,
 apparmor@lists.ubuntu.com, linux-sound@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 Michael Chan <mchan@broadcom.com>, ceph-devel@vger.kernel.org,
 linux-omap@vger.kernel.org, sched-ext@lists.linux.dev, cocci@inria.fr,
 linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>, linux-s390@vger.kernel.org,
 v9fs@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 tipc-discussion@lists.sourceforge.net, linux-modules@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Tony Nguyen <anthony.l.nguyen@intel.com>,
 bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 linux-btrfs@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [2.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	DATE_IN_PAST(1.00)[39];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[plvision.eu,vger.kernel.org,lists.samba.org,foss.st.com,lists.freedesktop.org,lists.linux.dev,kvack.org,lists.infradead.org,os.amperecomputing.com,redhat.com,marvell.com,lunn.ch,broadcom.com,intel.com,st-md-mailman.stormreply.com,lists.osuosl.org,kernel.org,chelsio.com,lists.ubuntu.com,inria.fr,google.com,lists.sourceforge.net,gmail.com,lists.ozlabs.org,davemloft.net];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS(0.00)[m:phahn-oss@avm.de,m:taras.chornyi@plvision.eu,m:linux-hyperv@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-sh@vger.kernel.org,m:samba-technical@lists.samba.org,m:alexandre.torgue@foss.st.com,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:gfs2@lists.linux.dev,m:linux-mm@kvack.org,m:linux-sctp@vger.kernel.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:quan@os.amperecomputing.com,m:linux-phy@lists.infradead.org,m:pabeni@redhat.com,m:linux-clk@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:irusskikh@marvell.com,m:linux-scsi@vger.kernel.org,m:andrew+netdev@lunn.ch,m:pavan.chebbi@broadcom.com,m:przemyslaw.kitszel@intel.com,m:amd-gfx@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:iommu@lists.linux.dev,m:intel-wired-lan@lists.osuosl.org,m:linux-arm-kernel@lists.infradead.org,m:linux-input@vger.kernel.org,m:kuba@kernel.org,m:linux-ext4@vger.ke
 rnel.org,m:bharat@chelsio.com,m:linux-media@vger.kernel.org,m:dm-devel@lists.linux.dev,m:linux-pm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:keyur@os.amperecomputing.com,m:apparmor@lists.ubuntu.com,m:linux-sound@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:mchan@broadcom.com,m:ceph-devel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:sched-ext@lists.linux.dev,m:cocci@inria.fr,m:linux-nfs@vger.kernel.org,m:ntfs3@lists.linux.dev,m:edumazet@google.com,m:linux-s390@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:iyappan@os.amperecomputing.com,m:tipc-discussion@lists.sourceforge.net,m:linux-modules@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:anthony.l.nguyen@intel.com,m:bpf@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux
 -erofs@lists.ozlabs.org,m:davem@davemloft.net,m:linux-btrfs@vger.kernel.org,m:hkallweit1@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[72];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[apparmor,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 37785274520
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 12:49:04PM +0100, Philipp Hahn wrote:
> diff --git a/drivers/net/mdio/mdio-xgene.c b/drivers/net/mdio/mdio-xgene.c
> index a8f91a4b7fed0927ee14e408000cd3a2bfb9b09a..09b30b563295c6085dc1358ac361301e5cf6b2a8 100644
> --- a/drivers/net/mdio/mdio-xgene.c
> +++ b/drivers/net/mdio/mdio-xgene.c
> @@ -265,7 +265,7 @@ struct phy_device *xgene_enet_phy_register(struct mii_bus *bus, int phy_addr)
>  	struct phy_device *phy_dev;
>  
>  	phy_dev = get_phy_device(bus, phy_addr, false);
> -	if (!phy_dev || IS_ERR(phy_dev))
> +	if (IS_ERR_OR_NULL(phy_dev))

As noted in reply to your cover message, the check for NULL here is
incorrect - get_phy_device() returns either a valid pointer or an
error pointer, but never NULL.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


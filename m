Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGOVFn9GuWmK+QEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 17 Mar 2026 13:18:07 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 044CE2A9B14
	for <lists+apparmor@lfdr.de>; Tue, 17 Mar 2026 13:18:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w2TMy-0002DU-De; Tue, 17 Mar 2026 12:17:56 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <alex@shazbot.org>) id 1w2G9J-0006r8-W4
 for apparmor@lists.ubuntu.com; Mon, 16 Mar 2026 22:10:58 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailflow.phl.internal (Postfix) with ESMTP id 96E81138028E;
 Mon, 16 Mar 2026 18:10:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Mon, 16 Mar 2026 18:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1773699056;
 x=1773706256; bh=pZj8f0JboyjKt94J8KB7OLIiCOoml43GOZ4w8rDpLPA=; b=
 eyO5nsRGgscBaSPTlSrjx8D8qsmxFZTD+YBT90C8JLtkSU+JG9otBsGP68/aDjfq
 Ip8/CY7pDqj8uLfl6tk9PaoCLmHFx9BmC+OLDsgQIKz5wruWwvglBIFTzX8Bgo1G
 D7tyDhfcq/yYvbxAZYbPlVlov+W1BUQwVVZx34myYfSzzczy+o0TvO2AJR+dEy1d
 h9Fy4zA0IHy3AyAu2lJw7cTPeRVsoH7Q9DZJUhPGVmEq8IZ5byXvr46eUf3RwYLV
 Pd21rN+O2sxo21UD0KoApMpHYwnhY5vI1CKlHqs6nb1Q0ON5mjBcz18/WvPyI4M2
 g7ed/wORmv3aHNEvlM9NEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773699056; x=
 1773706256; bh=pZj8f0JboyjKt94J8KB7OLIiCOoml43GOZ4w8rDpLPA=; b=g
 uCypQjfxr+Zi7JxdTC/p3wGQ4VV0q/Wv3rf4QuOSSvRwPZ4hwWoKXSQwRlJppx/A
 eTD/kX8ytMBkqeeAHXi8QojGoDJPwhemKEl1A5BQyy+VTfQ0kjCklEhRU0D9TNU6
 QzoouUhJdY7Fi24kVLMS4vkfF5Xif+sxcGuZ+ZH9bmNOAZhg/6jHFnuxjrIUYo4Y
 sJAjmQ/c58h+MsTVokuL8c2t4xBbVGwnTgXIvKplEwnaY81NNzKXbPGa+zPU58N/
 vwQ/zZfUYT5zYdyXfBWrfC5sZSkqzhpuD1WACxXIM/TD7Jh2N1ZXy8qS+O1DtSBY
 h24uS6YuZ9c79L+rKNYRA==
X-ME-Sender: <xms:73-4aYdtUUIQC679P0YPl8k6UZ10Tz8-qTD319yDZEtXusdBhZuXRA>
 <xme:73-4aTUav9FvduIIOmc0jldmINr5W_MhUsWQFGzP1fBm1dpf8ggOxSMvCMHniLmCu
 LbRPk360ujIo39hLA6fsP95YlnCLki5WcrUsiuRyEwh6NcxWlxF>
X-ME-Received: <xmr:73-4aSY56rJyFtQwMFw-H9dfM29zbbMWxWkWrpi3kYaZ1kbqDyXdf5bHU5U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvleelheegucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfgjfhfogggtgfesthejre
 dtredtvdenucfhrhhomheptehlvgigucghihhllhhirghmshhonhcuoegrlhgvgiesshhh
 rgiisghothdrohhrgheqnecuggftrfgrthhtvghrnhepvdekfeejkedvudfhudfhteekud
 fgudeiteetvdeukedvheetvdekgfdugeevueeunecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomheprghlvgigsehshhgriigsohhtrdhorhhgpdhnsg
 gprhgtphhtthhopeehhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphhhrghh
 nhdqohhsshesrghvmhdruggvpdhrtghpthhtoheprghmugdqghhfgieslhhishhtshdrfh
 hrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrphhprghrmhhorheslhhishht
 shdruhgsuhhnthhurdgtohhmpdhrtghpthhtohepsghpfhesvhhgvghrrdhkvghrnhgvlh
 drohhrghdprhgtphhtthhopegtvghphhdquggvvhgvlhesvhhgvghrrdhkvghrnhgvlhdr
 ohhrghdprhgtphhtthhopegtohgttghisehinhhrihgrrdhfrhdprhgtphhtthhopegumh
 dquggvvhgvlheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegurhhiqdgu
 vghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepgh
 hfshdvsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:73-4aQltNdDVIdEqvCmz7Mlt0qW50NA4CHgJQUMNlacMN4MGiVKHfA>
 <xmx:73-4acHdFw15OLpR73_B1AdIXJMG-pYssiD_C0T2dj2N-8ux7fVHFg>
 <xmx:73-4aU6P6J2BtdvPwSPzfrUNjz9-qYacHOOWBucSAMlha23fXDTcIg>
 <xmx:73-4aaO5YEqAXlnOLRO88GZx1RbxPW8QtXAeqZQNaqmxlgOL7PgFkQ>
 <xmx:8H-4abIvs_QYur641c9BpnDuFQ6ssCC-7-o-rPLEHWyRxStBDxJEr6SL>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Mar 2026 18:10:52 -0400 (EDT)
Date: Mon, 16 Mar 2026 16:10:50 -0600
From: Alex Williamson <alex@shazbot.org>
To: Philipp Hahn <phahn-oss@avm.de>
Message-ID: <20260316161050.01c82973@shazbot.org>
In-Reply-To: <20260310-b4-is_err_or_null-v1-46-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-46-bd63b656022d@avm.de>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=103.168.172.138; envelope-from=alex@shazbot.org;
 helo=flow-a3-smtp.messagingengine.com
X-Mailman-Approved-At: Tue, 17 Mar 2026 12:17:54 +0000
Subject: Re: [apparmor] [PATCH 46/61] vfio: Prefer IS_ERR_OR_NULL over
 manual NULL check
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
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org,
 samba-technical@lists.samba.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, gfs2@lists.linux.dev, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-media@vger.kernel.org, dm-devel@lists.linux.dev, alex@shazbot.org,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 apparmor@lists.ubuntu.com, linux-sound@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-omap@vger.kernel.org,
 sched-ext@lists.linux.dev, cocci@inria.fr, linux-nfs@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-s390@vger.kernel.org, v9fs@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-modules@vger.kernel.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	DMARC_POLICY_SOFTFAIL(0.10)[shazbot.org : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[alex@shazbot.org,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS(0.00)[m:phahn-oss@avm.de,m:linux-hyperv@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-sh@vger.kernel.org,m:samba-technical@lists.samba.org,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:gfs2@lists.linux.dev,m:linux-mm@kvack.org,m:linux-sctp@vger.kernel.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-phy@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:iommu@lists.linux.dev,m:intel-wired-lan@lists.osuosl.org,m:linux-arm-kernel@lists.infradead.org,m:linux-input@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-media@vger.kernel.org,m:dm-devel@lists.linux.dev,m:alex@shazbot.org,m:linux-pm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:linux-sound@vger.kernel.org,m:linux-block@vger.kernel.org,
 m:linux-gpio@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:sched-ext@lists.linux.dev,m:cocci@inria.fr,m:linux-nfs@vger.kernel.org,m:ntfs3@lists.linux.dev,m:linux-s390@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:linux-modules@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.950];
	RCPT_COUNT_GT_50(0.00)[55];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,avm.de:email]
X-Rspamd-Queue-Id: 044CE2A9B14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 10 Mar 2026 12:49:12 +0100
Philipp Hahn <phahn-oss@avm.de> wrote:

> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Alex Williamson <alex@shazbot.org>
> Cc: kvm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  drivers/vfio/vfio_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 742477546b15d4dbaf9ebcfb2e67627db71521e0..d71922dfde5885967398deddec3e9e04b05adfec 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -923,7 +923,7 @@ vfio_ioctl_device_feature_mig_device_state(struct vfio_device *device,
>  
>  	/* Handle the VFIO_DEVICE_FEATURE_SET */
>  	filp = device->mig_ops->migration_set_state(device, mig.device_state);
> -	if (IS_ERR(filp) || !filp)
> +	if (IS_ERR_OR_NULL(filp))
>  		goto out_copy;
>  
>  	return vfio_ioct_mig_return_fd(filp, arg, &mig);
> 

As others have expressed in general, this doesn't seem to be cleaner
and tends to mask that we consider IS_ERR() and NULL as separate cases
in the goto.  This code looks like it could use some refactoring, and
likely that refactoring should handle the IS_ERR() and NULL cases
separately, but conflating them here is not an improvement.  Thanks,

Alex


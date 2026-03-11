Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMrTJR/esmmtQQAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 12 Mar 2026 16:39:11 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 704BB274AE5
	for <lists+apparmor@lfdr.de>; Thu, 12 Mar 2026 16:39:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w0hRp-0003OF-4f; Thu, 12 Mar 2026 14:55:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <mhiramat@kernel.org>) id 1w0Blg-0001qv-Jd
 for apparmor@lists.ubuntu.com; Wed, 11 Mar 2026 05:06:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3382160054;
 Wed, 11 Mar 2026 04:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C9CC4CEF7;
 Wed, 11 Mar 2026 04:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773205158;
 bh=hs7h01zebVZ3Cw5TSlyQoCCjwzUa+l8Cgq+3i/i+v4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R7QWHNq5KYIpTwVo6Up5GHHSOdSE2gpk5GaKkIBbqjAR4gbzmNPFWIlQW10KkTPof
 EwepFELDieEhDwLa7MFg7ekO96kgeq0l/+LlK0SmYNrKgD9B5JFn2p8cKdN19q4bAB
 ZH5nM61a+EeP1bfo59H2leGLnAv8MA9DVbVTjKyoY75UQZCsrcqb+6U4ml2aryZAOd
 53HkEOSnemZkK807SePgE6JYJ0qIK9ypnQbQrEKCx7cEo9CjlroOKs6BchxOV0buhD
 E4Ehzc8FteV6XUFhu9KE6nGI0Pkr7s204WVgcSsEwXmzro7D3LuhuKd0AU39V1R3Ja
 2cWkRLISF31UQ==
Date: Wed, 11 Mar 2026 13:59:11 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Philipp Hahn <phahn-oss@avm.de>
Message-Id: <20260311135911.ced50d67e940cdf933a98d1a@kernel.org>
In-Reply-To: <20260310-b4-is_err_or_null-v1-57-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-57-bd63b656022d@avm.de>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=172.105.4.254; envelope-from=mhiramat@kernel.org;
 helo=tor.source.kernel.org
X-Mailman-Approved-At: Thu, 12 Mar 2026 14:55:34 +0000
Subject: Re: [apparmor] [PATCH 57/61] reset: Prefer IS_ERR_OR_NULL over
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
 linux-media@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 apparmor@lists.ubuntu.com, linux-sound@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-omap@vger.kernel.org,
 sched-ext@lists.linux.dev, cocci@inria.fr, linux-nfs@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-s390@vger.kernel.org, v9fs@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-modules@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[34];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MV_CASE(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phahn-oss@avm.de,m:linux-hyperv@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-sh@vger.kernel.org,m:samba-technical@lists.samba.org,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:gfs2@lists.linux.dev,m:linux-mm@kvack.org,m:linux-sctp@vger.kernel.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-phy@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:iommu@lists.linux.dev,m:intel-wired-lan@lists.osuosl.org,m:linux-arm-kernel@lists.infradead.org,m:linux-input@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-media@vger.kernel.org,m:dm-devel@lists.linux.dev,m:linux-pm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:linux-sound@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-gpio@vger.k
 ernel.org,m:ceph-devel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:sched-ext@lists.linux.dev,m:cocci@inria.fr,m:linux-nfs@vger.kernel.org,m:ntfs3@lists.linux.dev,m:linux-s390@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:linux-modules@vger.kernel.org,m:p.zabel@pengutronix.de,m:netdev@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mhiramat@kernel.org,apparmor-bounces@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	NEURAL_HAM(-0.00)[-0.992];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,apparmor-bounces@lists.ubuntu.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,avm.de:email]
X-Rspamd-Queue-Id: 704BB274AE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 10 Mar 2026 12:49:23 +0100
Philipp Hahn <phahn-oss@avm.de> wrote:

> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Semantich change: Previously the code only printed the warning on error,
> but not when the pointer was NULL. Now the warning is printed in both
> cases!
> 
> Change found with coccinelle.
> 
> To: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  drivers/reset/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index fceec45c8afc1e74fe46311bdc023ff257e8d770..649bb4ebabb20a09349ccbfc62f8280621df450e 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -715,7 +715,7 @@ EXPORT_SYMBOL_GPL(reset_control_bulk_acquire);
>   */
>  void reset_control_release(struct reset_control *rstc)
>  {
> -	if (!rstc || WARN_ON(IS_ERR(rstc)))
> +	if (WARN_ON(IS_ERR_OR_NULL(rstc)))

This changes the behavior when rstc == NULL.
WARN_ON does not hit when rstc == NULL in the original code.

Thanks,

>  		return;
>  
>  	if (reset_control_is_array(rstc))
> 
> -- 
> 2.43.0
> 
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>


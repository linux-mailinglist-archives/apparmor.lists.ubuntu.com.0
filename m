Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC4fEGMTzmmnkgYAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 02 Apr 2026 08:57:39 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC1F384CF5
	for <lists+apparmor@lfdr.de>; Thu, 02 Apr 2026 08:57:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w8BH5-0000V4-1w; Thu, 02 Apr 2026 06:11:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <gregkh@linuxfoundation.org>) id 1w8BH4-0000Uv-As
 for apparmor@lists.ubuntu.com; Thu, 02 Apr 2026 06:11:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DA9B161855;
 Thu,  2 Apr 2026 06:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F304BC19423;
 Thu,  2 Apr 2026 06:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1775109699;
 bh=9iKDwLBnLpVlDY+q2+q2E8iMIhFsJRxsw6x7j9KzIA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AiiyRIoPbDvNWYLmSUA/tu/cuVxbhueWnCt+Wt1ld4ZVihIQJWnlpnMysZ3EysOq4
 qMrQBv47HmwwoBJnExjEgDxqjVB32+xuvysboYhTQm4nCL10UH4sQfUSOpPGYbJyyg
 KD8jBqHrjNtxA8l+Pr8bKqywdB00h0Xh7zKAq1EI=
Date: Thu, 2 Apr 2026 08:01:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Keerthana K <keerthana.kalyanasundaram@broadcom.com>
Message-ID: <2026040249-fable-sasquatch-4864@gregkh>
References: <20260402054700.2798707-1-keerthana.kalyanasundaram@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402054700.2798707-1-keerthana.kalyanasundaram@broadcom.com>
Received-SPF: pass client-ip=172.105.4.254;
 envelope-from=gregkh@linuxfoundation.org; helo=tor.source.kernel.org
Subject: Re: [apparmor] [PATCH v6.1] apparmor: fix unprivileged local user
 can do privileged policy management
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
Cc: sashal@kernel.org, ajay.kaher@broadcom.com, paul@paul-moore.com,
 Salvatore Bonaccorso <carnil@debian.org>,
 Qualys Security Advisory <qsa@qualys.com>, linux-kernel@vger.kernel.org,
 apparmor@lists.ubuntu.com, jmorris@namei.org, stable@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 vamsi-krishna.brahmajosyula@broadcom.com, alexey.makhalov@broadcom.com,
 tapas.kundu@broadcom.com, yin.ding@broadcom.com, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [4.69 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:keerthana.kalyanasundaram@broadcom.com,m:sashal@kernel.org,m:ajay.kaher@broadcom.com,m:paul@paul-moore.com,m:carnil@debian.org,m:qsa@qualys.com,m:linux-kernel@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:stable@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:vamsi-krishna.brahmajosyula@broadcom.com,m:alexey.makhalov@broadcom.com,m:tapas.kundu@broadcom.com,m:yin.ding@broadcom.com,m:serge@hallyn.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,apparmor-bounces@lists.ubuntu.com];
	GREYLIST(0.00)[pass,body];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[apparmor];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,canonical.com:email]
X-Rspamd-Queue-Id: DAC1F384CF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 05:47:00AM +0000, Keerthana K wrote:
> From: John Johansen <john.johansen@canonical.com>
> 
> commit 6601e13e82841879406bf9f369032656f441a425 upstream.

<snip>

Does your group/company/whatever actually use apparmor?  If so, this
isn't the only commit that needs to be backported.  I'm waiting on a
"correct" set of 6.1.y patches from John before applying all of them to
6.1.y and then I can take the patch series that he gave me for 5.10.y
and 5.15.y and will queue them up.

So thanks for this backport, but it's not going to help resolve all of
the recent fixes that went in as part of this series by just applying
one of them.

thanks,

greg k-h


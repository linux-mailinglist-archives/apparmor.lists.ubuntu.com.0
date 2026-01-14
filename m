Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 81961D21B3E
	for <lists+apparmor@lfdr.de>; Thu, 15 Jan 2026 00:07:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vg9xC-0005vG-4Z; Wed, 14 Jan 2026 23:07:06 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <code@tyhicks.com>) id 1vg9x9-0005v3-SI
 for apparmor@lists.ubuntu.com; Wed, 14 Jan 2026 23:07:04 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id CDCC2EC0233;
 Wed, 14 Jan 2026 18:07:02 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Wed, 14 Jan 2026 18:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
 cc:cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1768432022; x=1768518422; bh=JqXbI4hfna
 hqHP8ovvr0A/yQIz/lnIGy7YTC0uxhFl8=; b=EABanqV6lkedKc0XP32wGyuViG
 fm0Vlrs53+B5yzbJRkLXqJdeel173ug2NR+R/N/7aWI80DxN7H2vdhN1hP5fY6cf
 TeaYtUpfnObHTkP9r59EVwWnj3ui4yEDOrCDzDdZQNLT/vxzVVLpzH9kDkUCZpjp
 VE6dOXKTxIo4bYBl/f3n0RX/Wld1Sl+/AQbqxapHYHJaZU4qodbhuUpW68n5OFXM
 vUy8kxKWWqViDXuOCWSuB3DF27iF2gu+QVnA2Q1f7KkOty/L4Y2Qvxl0wn6TuVgF
 +/BQ7mLJ6wdsYPeluI57VK2qMfCoHqB4fjw+zoS1Do/1xRfIjdt6s0A8aM/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1768432022; x=1768518422; bh=JqXbI4hfnahqHP8ovvr0A/yQIz/lnIGy7YT
 C0uxhFl8=; b=Z+5oa8RZWVLP6BBASamjCQ3teUhHrsz7xkFw5Y6DzVexqK60ooT
 vONcKgyt4ZJdzQNfsRorVEA999+cWFiukL2OJhypafsiyYJZH2M/YyHua9hxeQyY
 Kt0C2c3kZyhoRbgDJsBusE4dNoS/Mn4z5Yrtq8qAkKFZze89grKMW0zdXYqEMJI1
 jV7U3YV3HtqWOuWFETIHbFcWuQ5XMmCllIiAw6G4ISz4P86QoPdGssjKW+qvVY+w
 pgu96++iR4Re4HXG8f4FCs6ogSAT2yARMOOmBbFbLNgPYZUCVf6eZLTMhNN3lwF7
 9jER03T3UenkQPw7W3xc+xbdbdcjaCEzyRw==
X-ME-Sender: <xms:liFoadMTU1UckKDPhqQb_b0LadUnHv9q53PE-dd8yNOPYCsl_s23sQ>
 <xme:liFoaV-iRhHjY-xiIgUAFMWeExYIMKysgDjH4wnStdlIN68w4OVFRIx5rt4typc6I
 PdYmMiSoa9LPHo5sNQTuVbgzHexHhqIbE73RGSTiuOoxc-I0qnlP9Cr>
X-ME-Received: <xmr:liFoaZ5y0RazASg2Si-0sFG4Tn1-PovrhxrgAhk-wzyA4PRns-7CPyo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeggeeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfihlhgvrhcu
 jfhitghkshcuoegtohguvgesthihhhhitghkshdrtghomheqnecuggftrfgrthhtvghrnh
 epvdehvddttdfhfefhtdfgleehfeeggfdujeeuveekudevkedvgeejtddtfefgleeinecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghouggvse
 hthihhihgtkhhsrdgtohhmpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhu
 thdprhgtphhtthhopehrhigrnhdrlhgvvgestggrnhhonhhitggrlhdrtghomhdprhgtph
 htthhopegrphhprghrmhhorheslhhishhtshdruhgsuhhnthhurdgtohhm
X-ME-Proxy: <xmx:liFoaU0Kqrn3_uGNkeysmbqoeHXUG8NnMEFapFGqh0txMvb7x6HPHA>
 <xmx:liFoaYAOagHv7-6iYrkeF1T3FIEkTV_4RTO2XWjpfykevnVxa1R4Dg>
 <xmx:liFoae0Xx9690GHRabl_hurMRa9CQGKKHykCgr76f9bxYS4D8CiRCQ>
 <xmx:liFoaavQVCogVGxHrfYOz0JupgSvvUjHmQIcbnr4_eY709vlFnXo-Q>
 <xmx:liFoabgvu8LQoPkg0H1JNNcMT_V2DNLpjgE1p02ROSMw59sj4SqYONdx>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Jan 2026 18:07:02 -0500 (EST)
Date: Wed, 14 Jan 2026 17:06:59 -0600
From: Tyler Hicks <code@tyhicks.com>
To: Ryan Lee <ryan.lee@canonical.com>
Message-ID: <aWghkyAXnXru7-sQ@yaupon>
References: <20260114173226.14956-1-ryan.lee@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114173226.14956-1-ryan.lee@canonical.com>
Received-SPF: pass client-ip=103.168.172.150; envelope-from=code@tyhicks.com;
 helo=fout-a7-smtp.messagingengine.com
Subject: Re: [apparmor] [PATCH] apparmor: fix boolean argument in
 apparmor_mmap_file
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
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 2026-01-14 09:32:24, Ryan Lee wrote:
> The previous value of GFP_ATOMIC is an int and not a bool, potentially
> resulting in UB when being assigned to a bool. In addition, the mmap hook
> is called outside of locks (i.e. in a non-atomic context), so we can pass
> a fixed constant value of false instead to common_mmap.
> 
> Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
> ---
>  security/apparmor/lsm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 08757f372972..320e4e1e1748 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -826,7 +826,7 @@ static int common_mmap(const char *op, struct file *file, unsigned long prot,
>  static int apparmor_mmap_file(struct file *file, unsigned long reqprot,
>  			      unsigned long prot, unsigned long flags)
>  {
> -	return common_mmap(OP_FMMAP, file, prot, flags, GFP_ATOMIC);
> +	return common_mmap(OP_FMMAP, file, prot, flags, false);

With all callers of common_mmap() now passing false for in_atomic,
shouldn't we drop in_atomic from the common_mmap() function definition?

Tyler

>  }
>  
>  static int apparmor_file_mprotect(struct vm_area_struct *vma,
> -- 
> 2.43.0
> 
> 


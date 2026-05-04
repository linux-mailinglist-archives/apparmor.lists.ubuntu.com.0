Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL1iIPHy+GnJ3QIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 21:26:41 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C404C337B
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 21:26:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wJyvt-00086M-C3; Mon, 04 May 2026 19:26:21 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1wJyvs-00086C-4G
 for apparmor@lists.ubuntu.com; Mon, 04 May 2026 19:26:20 +0000
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 09F0B3F601
 for <apparmor@lists.ubuntu.com>; Mon,  4 May 2026 19:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1777922780;
 bh=wYojf+rNDJehR44NT3SffdAO43ZRdqkQQa9EipwMsv4=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=f3SDaTL34wlg4f0Ne7pnflFvRSOnHSamPFRYFIbP6VmxcaZdBpOmBJNOkTf9s+BBP
 gO3hhkURmizkr35b+o5hJnLB+b9uwdcogqG4x6gs4s9wl/rvcJugvs5UUw+rJy0Vlo
 gEXaoDECkneCSnZWqOt/JjsTmNCyc5fG3LIj0j0Tcz9K2Re1q4FDTNHBDXOGn1QA4f
 wAUcIYwsYIyEQajX781WNRcV/WXHOi+1a6fLslV2JPZEY7n0Je8I1HVoQAtgbWZkW9
 0pxP9YTJFIX5ft7OOnmaIzKOGiGF2IF/1Yh1HTvulNVQXnTmW5U7nh1RpEvvC5JB2t
 iHb82t/ipsg+uf81vWgrF4jr3IaFsEgMXzPd75XxFtdv5Ur+aaCTD3QhNXmz+mTXBR
 AzIu51sdhqvtqqd88xoqf4EIXt+VBb7OFkGc6HzLdQ16r8/c00Q6Jc3/6tH6zPtt/7
 XIGe0bz7M+EHzR7KOxqTJan7P0JnQyePi5m4N2d2yrzjWbzLN3lRLpukp4ZMq8KvHi
 N2IRo1Oa8CRYuXM/kWB5r9xF/xZpRy5h+gffO9Jp/Dh/jrSyB69q60IOIAd8uFvV3r
 cIP4/qB8mcirDjrhSER8IpQawq3JOaZIFLpYrGaLqgR0m3Xi1OucjfDfQm7Z78nelB
 /VvcAJDc+fxoAB2kI3cmHOdU=
Received: by mail-yx1-f69.google.com with SMTP id
 956f58d0204a3-65c62ca395cso1641524d50.1
 for <apparmor@lists.ubuntu.com>; Mon, 04 May 2026 12:26:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777922779; cv=none;
 d=google.com; s=arc-20240605;
 b=BSMv537NEQnoqfPBijo0kUFVh+R1sOdi5nSHKFKQftM3y5ojDONEcwU9DpdptcvZPL
 2eHYqqeEifvsY4L1E5HrlJSvscY9UNRADU/JIO+vzz14fFG3+hA8qNk0X7+No8HjyL6D
 keUHfvzxaOgfeQdpR2Mp9T8THkaWas9s1ssKkIUKBF3MPCdV692jDsO0oGJNQwHDvUms
 KQlJCc4FVVYjhfLaa+M6XRsXlwuOCpBHUKRMGqLJvcMB/XoEyeYF44Hr8zqT2zpH3IP2
 5vlfTeW4sK/qQyR3tMtZcHBYA1LlF7rKTrb2PY/ZpTYz05kaaX6v1715eKLSmVEyNavR
 jfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version;
 bh=wYojf+rNDJehR44NT3SffdAO43ZRdqkQQa9EipwMsv4=;
 fh=3T5Wv/w4ScmaDyEH8hw/uHCvG6gGqW000H39xR4qxxM=;
 b=b9zsXligs0bkOVKr7I/UYJkNoGNcAU2uLdR6hwTHzKTTWaUCMZUBBP9i4EQxKmZird
 ApGZ+QacbeaZfQRL/0XIL9RzVeII7P0Ad53kUI/zTiNNlpKteEf5GJ0m0a826ag1japq
 s+vkh1KjTjY6a+Dpmeqn9xPbguUbobCd2bnuZTQ+Bad6bzlyzOr0kvRC0Qpe+NQUpWTQ
 RJFy3K9xB2SpB08hYj2ueP/6SVZ/d4vq2mWtY188fjKf4vTUTLvV96laP4v83gIA5j3T
 SsQRWSmbDyMI5ALCus4onH5lm1wI5EeSR49vYg8rZsOpM+YEuwfa2VPWQF6QgMchlljm
 FGIw==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777922779; x=1778527579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wYojf+rNDJehR44NT3SffdAO43ZRdqkQQa9EipwMsv4=;
 b=lmgrmTY2HL/L8ARnLvfTH+JnT4sfJ/mQ0zKTdHbn3OxgeS1kQhox0WintZ59rSESFA
 MsLEXcyBURNw84Yv1oJPbZGt6yKXgr4tDqcmiOEOBxNdWgXmEzb6Xaz7q8mKaLPhw7bT
 YMkwrQZm/xjc1/fWatTBWVAJcoYYKQeVYE89ZyreSmDP84wNP8k4vmz7h17Im7fwlDNN
 Trt73nYvrsRB5E52/ogoBodDu4jXh1cUZQDP44R18DBk5XZNNV+fgi3hfqlctUJDhw34
 rtb/TU2xYcEHfAA/XH4nlYjMJnQgWZDxkpTeiAeVh6jkWnJI+uLUHKkZlBZ0IGQKgCAT
 6bnQ==
X-Gm-Message-State: AOJu0YyFdrz6vgLcPUdvmjU1HABt51h3TISnRHgz5TDTGjtgSU9xsTh1
 yf/44K2fe1ibwV3KzLeZ1Y8Vhtxr8ZoCsnf26flTOmSgEl3H+NbhYYJvmJ1qQsep1J5g9krVeuh
 PMswdPftZfc8iu7rEN694dp4/mlPQaFfEc6M9eHg39ptxvFgrk1HyAkJcawwkzlF9lJDRGJXzzb
 ECp3WGQe16L5mxYjehn3oGeCr/K17Kd55RrAWT4O+fOmhr9dN1CJmH
X-Gm-Gg: AeBDievDhBQtTy7IQHDthSholNZHwL0l0PSzP2neG9Bf7JHIkzaMIw8GGgeHY7Osk7H
 WjplqNfa2/r3y1znLPMT7PfTVXak5ADzlQJShyd65P4gasg+sjI9RlggegXFAR2EF2LpzQCqTR9
 kDU/3GUEnArkfFs0BZQ7cwKqH7HZRAsZJpi4BG4y6G6JY2idl/JXrNJKgoMrKYSqbtA/df2Jz/R
 Z9FDvRIu2dJpasupv+dJSAntV0wEeQnFOuPy/AEPA3lRMtYUlapSUYfUPsPulDgbRuAQlugaUsO
 lA==
X-Received: by 2002:a05:690e:1c9:b0:654:1dfe:ca8e with SMTP id
 956f58d0204a3-65c3dbffc7emr8870735d50.65.1777922778774; 
 Mon, 04 May 2026 12:26:18 -0700 (PDT)
X-Received: by 2002:a05:690e:1c9:b0:654:1dfe:ca8e with SMTP id
 956f58d0204a3-65c3dbffc7emr8870708d50.65.1777922778335; Mon, 04 May 2026
 12:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260504063241.368579-1-me@zygoon.pl>
In-Reply-To: <20260504063241.368579-1-me@zygoon.pl>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Mon, 4 May 2026 12:26:06 -0700
X-Gm-Features: AVHnY4J7LAFKYJKQ04sMR7McpUU7yNprfR_GC6T5_Q1lPYs9eZVyBCDEnvdMhu4
Message-ID: <CAKCV-6vSOPbaRJE3qE905yQpQNdHSkc2HuMsgfHVujaSELjgZA@mail.gmail.com>
To: Zygmunt Krynicki <me@zygoon.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH] apparmor: fail policy unpack on accept2
 allocation failure
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
X-Rspamd-Queue-Id: 12C404C337B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.61 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS(0.00)[m:me@zygoon.pl,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,canonical.com:dkim,canonical.com:email]

On Sun, May 3, 2026 at 11:33=E2=80=AFPM Zygmunt Krynicki <me@zygoon.pl> wro=
te:
>
> unpack_pdb() may need to allocate a missing ACCEPT2 table for older polic=
y
> data. If that allocation failed, it set an error message but jumped to th=
e
> success path, returning a policydb with the required table missing.
>
> Return -ENOMEM through the normal failure path when the ACCEPT2 allocatio=
n
> fails. Remove the now-unused out label.
>
> Fixes: 2e12c5f06017 ("apparmor: add additional flags to extended permissi=
on.")
>
> Signed-off-by: Zygmunt Krynicki <me@zygoon.pl>
> ---
>  security/apparmor/policy_unpack.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy=
_unpack.c
> index 9f45d5513d2ca..9084d3d0cffdc 100644
> --- a/security/apparmor/policy_unpack.c
> +++ b/security/apparmor/policy_unpack.c
> @@ -1054,7 +1054,8 @@ static int unpack_pdb(struct aa_ext *e, struct aa_p=
olicydb **policy,
>                 pdb->dfa->tables[YYTD_ID_ACCEPT2] =3D kvzalloc(tsize, GFP=
_KERNEL);
>                 if (!pdb->dfa->tables[YYTD_ID_ACCEPT2]) {
>                         *info =3D "failed to alloc dfa flags table";
> -                       goto out;
> +                       error =3D -ENOMEM;
> +                       goto fail;
>                 }
>                 pdb->dfa->tables[YYTD_ID_ACCEPT2]->td_lolen =3D noents;
>                 pdb->dfa->tables[YYTD_ID_ACCEPT2]->td_flags =3D tdflags;
> @@ -1079,7 +1080,6 @@ static int unpack_pdb(struct aa_ext *e, struct aa_p=
olicydb **policy,
>          * - move free of unneeded trans table here, has to be done
>          *   after perm mapping.
>          */
> -out:
>         *policy =3D pdb;
>         return 0;
>
> --
> 2.53.0
>
>

A search for usage of the ACCEPT2 table turned up
file.c:aa_lookup_condperms, which dereferences the table through the
ACCEPT_TABLE2 macro without checking if it is NULL first. Thus, this
appears to be a lurking NULL pointer dereference.

Reviewed-by: Ryan Lee <ryan.lee@canonical.com>


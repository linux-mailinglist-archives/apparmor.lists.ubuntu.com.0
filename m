Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id q+wvFAf0+Gk73gIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 21:31:19 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E52224C3430
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 21:31:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wJz0a-0000X3-Ng; Mon, 04 May 2026 19:31:12 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1wJz0Z-0000Wt-2u
 for apparmor@lists.ubuntu.com; Mon, 04 May 2026 19:31:11 +0000
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5298C3F601
 for <apparmor@lists.ubuntu.com>; Mon,  4 May 2026 19:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1777923070;
 bh=Wr6hJYuVhxxeqbJyLuXatURrvD9B4v8rmITA7Tj7SPE=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=qdaCr5cLwHk2XqP724dT9jFZ0FP4GpWGWipc7Yjr24JpO4IpVysgyHtl9BsZ88m7r
 q/HbrtSw7hjcZmxpG/QgPNG1D2OK1jV0i05px+VZcHvO/KAcpUo3J4eO0SIUSuLNkt
 SsOQ5LOe8BAqj42vm9LFdJa4neP4bzNeJD1NLiVz8H3qT7NFa+hg0dK9jIumTZBniH
 zbZZZ+wqo04bgq96KISL7m63/hHTxp2AvKkVCLpQsaty4tqWDuEWH7lMq7dg4uE3PD
 1rVdwmBuU1WEnHuZPKBraSDJA7ByotuZZ+SwjOSwJUaHjEdY66p8NK6IT1hPNM8Hzc
 lOtisacYIo7QvPdzHYCDQ4uaaIPqqSA/z/Jkyef0YUTct6afBDILkh0K13ZByJDyxi
 W9ZHhsX9lyjSBkk0Z66q6OvPIXgyYvHecOl6dB+dismd+UJbvYvkZ2SzlTQglVaQ1k
 VH0qVYyqGY7DKnyJ0dryt+ZNV33ts1nw+Jo/UGKAH1k5JgYGBiGqWTdSAmI3tNcHJp
 e71HOU0LBiyjH1CZG6BPJjm4yIiVbl1CFKbdF3AsMCemZ1yW5XdeyGTvRqJadEHPno
 hctXfhPGMkDE9VrPfsZTzJNPtbzIn9ifleLQeq4XzgAEs4KQwvoJvKmIxkHvq2fwY0
 lvIxqZyPY72Kg+i7Ytbwm6zs=
Received: by mail-yx1-f72.google.com with SMTP id
 956f58d0204a3-65c3132b7e5so5623266d50.2
 for <apparmor@lists.ubuntu.com>; Mon, 04 May 2026 12:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777923069; cv=none;
 d=google.com; s=arc-20240605;
 b=SRHKIjM4wheSLATvtO2HtHNJGkdB1pNfCw+womUQtsbXSi7uaq0F5TE4yUxxqmhK2I
 4sbpWtHL77uZ/lmZXlJlgR4EOqjSENybMGFph9P1lqHQRUsXQJXm/5ayOy1VjoDz4eb8
 8k5xXn/jhIUfxLaVSHSRrHrPmZQy30TXR9u9fO5Zmie10jYKnHJEblTbiek7fINlhGh4
 mY02X18cQOUaqLF8rX9b3qiCLXAJxWGNcKmH7QDzq2A04Q0W3XIOK0m+hMe35A7LPyz9
 VjoW3QkvQaVI7wK4yATXlNds7xIXFeAbnu9CQsop3bgnNDcsDt+e8vLSQOk7OGXk66AN
 f+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version;
 bh=Wr6hJYuVhxxeqbJyLuXatURrvD9B4v8rmITA7Tj7SPE=;
 fh=3T5Wv/w4ScmaDyEH8hw/uHCvG6gGqW000H39xR4qxxM=;
 b=DSjFi+5xpuxqymlH3ZAcna4tpUmhIo/5DuAGpHzoCC0K3dub5aY+ker2OK5ewL+PD0
 9XccCE992ftjzwtCou6cMl+R6WLYffqs0B3Wkl7UEeDUSH6dv6Z6le55xmBhktFmLiyM
 A2PI00N4GtSrBQyALzzanMqi4giQX7oZTrh+PpSHGPGo+L5esReWAToi93fpB3c8WX7C
 xOgtlkskDHI/75nxwkCv6sxVpJiMlABtTwF9FUxy7SBb1/w5qQ5lCMDz7XABxRQxJsPL
 1OyBLOEwDEuQ+gC/EIfciOW1YvSj5uxoOYojWMb87aKRKsYYAgaJyCgzxMU2RcjW78Qo
 j2CA==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777923069; x=1778527869;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Wr6hJYuVhxxeqbJyLuXatURrvD9B4v8rmITA7Tj7SPE=;
 b=DAWZgnOe0krBfRr6OlaV2UusgBUxR32gULgmZgp3Rh3laiQJrgQT1CCMAMF3bxLGci
 Z3qGi50QfqKCocs5kL8gvrdjFmjcfXUsDqnMrPlJGOAXivhS4ZCSmr44FH8qByv9NXuj
 TMiaHkEKmHwZx2ES4Rnmt8kjWjxFxld3pGRfDWuHON1yEW72BpqfXyOgvikEuWVZ5Qyh
 awiHIubl+AGmghk+PG6bbkoaWkEIXHIj64L/ibSAWBu1UlLszMn6JAilNpRwWt2j28Yy
 e2SjNOLAukEQAC/siuqaaIdfbbZCR/fMeG3gjOSTM/Rr8THZwNXmUB7wax3tX2vIucb4
 taPg==
X-Gm-Message-State: AOJu0YzVSTQ1BwsZK13Vdna1qSYWCNf9RqS+LB8VW30m3tbge/qxu2No
 aol+8SDX6n5WaCtyMctlW1nVzf/I988ef9cCWSieHaGBSbwRD+NwhpC5xXyKigYLyTUUgyazmFE
 5GJv/2xOlJ7LRF6IEipVC/Fd138dUuIl2wVSJ4j+KbLU6wVyoWWS7Nshr+xCGfPYCoC3Tt8vQmC
 qvs3IP2YVlT6weUuFQcUXfgaq1AjGVzfrHBZ8NCTGKX+BbGHCwaqSeefBF195t
X-Gm-Gg: AeBDies4Fe9utObkealbt+2fRv/KF3YE2Qf5cFfdfEWJXln771j9GdAFw/MoukPAEOl
 vl3gue4JhRgDPhzabEWZIrR+cEl51X3h3ZKxPEvJyZgI4kdc6svDbbCRgIyRBo7kiSSlPz3QSxR
 ZNCL0AZUL5Sb8VVSfW0TL2lWhx4w+TQ0yOOl9SCCx19AJ9Xc4nZH45vbiYoTznHUtOMz1yJhEDp
 KyGQHkS91xbg9AMvPUjPr/lho9u281kzSsjYz/tixrTHQ22qsojO251oiLKMAKjR/lvhC8AHBQY
 CA==
X-Received: by 2002:a05:690e:484c:b0:651:e0cd:5877 with SMTP id
 956f58d0204a3-65c3d9fab08mr7332500d50.18.1777923069270; 
 Mon, 04 May 2026 12:31:09 -0700 (PDT)
X-Received: by 2002:a05:690e:484c:b0:651:e0cd:5877 with SMTP id
 956f58d0204a3-65c3d9fab08mr7332476d50.18.1777923068881; Mon, 04 May 2026
 12:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260504111402.18714-1-me@zygoon.pl>
In-Reply-To: <20260504111402.18714-1-me@zygoon.pl>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Mon, 4 May 2026 12:30:57 -0700
X-Gm-Features: AVHnY4L1NmNaNHJ_-PLx7y0CDeKGle7BI3zedb3x03Rz5nuInRR1F29P94-LaBE
Message-ID: <CAKCV-6vMKw70em=6=Vznd2tZopO+tdugrcZ7LM0r8r06eC-cQA@mail.gmail.com>
To: Zygmunt Krynicki <me@zygoon.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH] apparmor: release exe file resources on path
	failure
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
X-Rspamd-Queue-Id: E52224C3430
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.61 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS(0.00)[m:me@zygoon.pl,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,canonical.com:dkim,canonical.com:email,zygoon.pl:email]

On Mon, May 4, 2026 at 4:14=E2=80=AFAM Zygmunt Krynicki <me@zygoon.pl> wrot=
e:
>
> get_current_exe_path() takes both an exe_file reference and a path
> reference before resolving the path name. If aa_path_name() failed, it
> returned immediately and leaked both references.
>
> Route the failure through the common cleanup path so fput() and path_put(=
)
> always run after the references are acquired.
>
> Fixes: 8d34e16f7f2b ("apparmor: userns: Add support for execpath in usern=
s")
> Signed-off-by: Zygmunt Krynicki <me@zygoon.pl>
> ---
>  security/apparmor/task.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/security/apparmor/task.c b/security/apparmor/task.c
> index 0db0e81b46001..6445cb5f85266 100644
> --- a/security/apparmor/task.c
> +++ b/security/apparmor/task.c
> @@ -313,9 +313,12 @@ static const char *get_current_exe_path(char *buffer=
, int buffer_size)
>         p =3D exe_file->f_path;
>         path_get(&p);
>
> -       if (aa_path_name(&p, FLAG_VIEW_SUBNS, buffer, &path_str, NULL, NU=
LL))
> -               return ERR_PTR(-ENOMEM);
> +       if (aa_path_name(&p, FLAG_VIEW_SUBNS, buffer, &path_str, NULL, NU=
LL)) {
> +               path_str =3D ERR_PTR(-ENOMEM);
> +               goto out;
> +       }
>
> +out:
>         fput(exe_file);
>         path_put(&p);
>
> --
> 2.53.0
>
>

Reviewed-by: Ryan Lee <ryan.lee@canonical.com>


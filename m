Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF8953E444
	for <lists+apparmor@lfdr.de>; Mon,  6 Jun 2022 13:56:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nyBLK-00026G-5p; Mon, 06 Jun 2022 11:56:22 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jon.tourville@canonical.com>) id 1nyBLH-000267-N4
 for apparmor@lists.ubuntu.com; Mon, 06 Jun 2022 11:56:19 +0000
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4B45E3FBF6
 for <apparmor@lists.ubuntu.com>; Mon,  6 Jun 2022 11:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1654516579;
 bh=9qb4HKZCZZVK9rQPOlV1DlQN/O9p307sqcdRy0D4cXg=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=vkyFbKi5cu9S4Jv0ziXukOt/2w23lgNDVrvbCg4R85mmM/1t5EyVzEuZOJgR0sGes
 ecAA/pJ45QeHNU72cbxgyh9AJ4ioLoxOM1wI3Ca9mJ+YDqpHT4csK6rVsqzidKObUE
 F3s1A+RvCTzAGtgrbHXk6R51zUwaRyx4aYZpbFPi9HA4M8g+vWBpTpclmQo0m3sRun
 DUsELgz2Oqfxk+qysL6wDIldXBMsAhx0vXtS0p30Tq13HRWwWsHv2bqvq4sN+wo/fH
 8WLQ9bi74oYSyE4vxEScOGaK9KwRwtQOLbfxwAz/gh95vywcVS4aJleTwKR3U9nLxP
 DI3StrEnc4LHg==
Received: by mail-yb1-f197.google.com with SMTP id
 i17-20020a259d11000000b0064cd3084085so12307428ybp.9
 for <apparmor@lists.ubuntu.com>; Mon, 06 Jun 2022 04:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9qb4HKZCZZVK9rQPOlV1DlQN/O9p307sqcdRy0D4cXg=;
 b=wfcSiGJIppTYpkxfrt3S4szKHKwsSJ9ZWKnGhRbj497xW819Vy7PswF09IOjPysKJ1
 3+vtKhJ9VhMM0zfiEW/mkQFLC05gQ4KxKQC9KKpyCaBf9NSJXC+nE3ANMWp+mMqOcK6c
 ZsDLoIfeYqYhx4tA44S8sSQHaqDKlKtReHLSb1jUtt7osAq7mJGIz7wmC0W9JI4QcF+b
 x1zFSsK4sRItXlbcIRFXZJg+NDoEAprUKpADVxbAcLxjj0mX7YNKKDz4Z+xBY8mvasUU
 PbLZ2/aBjouOoKicwLvZ5guJhR3NusiCzc9sPnYVOMWQ7RmPEKEEAv5YV/uEBiQJ+pPd
 2B4w==
X-Gm-Message-State: AOAM531N8M9iTJkutEgkvgNNDS2jHKQCbq+hWE7YruUZnJVRuaPkWwei
 BnLDDmX1Ia0F2YfuEkz/F0sTgQRaCOULO+CC4AA2dcPh+I9FAD9KVG0E6COqPsBl9tATjAzb9Ir
 ONKrVqqzv5kwlHuLIg0Ca3n4oWoroR/cCVcOv1PTWMNyRMNVSDn324A==
X-Received: by 2002:a25:5986:0:b0:663:b781:7bd0 with SMTP id
 n128-20020a255986000000b00663b7817bd0mr1746030ybb.191.1654516578266; 
 Mon, 06 Jun 2022 04:56:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8fmfS63tfETcuewXM4r07SvYh8GjEdkhrss75VYTZKCg6e4piRfr3hgO3/sUDpnl1aJeGdXcf/OqJLH8vfvo=
X-Received: by 2002:a25:5986:0:b0:663:b781:7bd0 with SMTP id
 n128-20020a255986000000b00663b7817bd0mr1746008ybb.191.1654516578039; Mon, 06
 Jun 2022 04:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220512173520.855917-1-jon.tourville@canonical.com>
 <6b57724644bc6cb5b0972d89813b5090caab8f66.camel@canonical.com>
In-Reply-To: <6b57724644bc6cb5b0972d89813b5090caab8f66.camel@canonical.com>
From: Jon Tourville <jon.tourville@canonical.com>
Date: Mon, 6 Jun 2022 06:56:07 -0500
Message-ID: <CAHSjLmwwnWvxhxzbb6EorTRMVLdyT7gQmoFhXgAg67c0bk_6oQ@mail.gmail.com>
To: Georgia Garcia <georgia.garcia@canonical.com>
Content-Type: multipart/alternative; boundary="000000000000e8d35f05e0c6286b"
Subject: Re: [apparmor] [PATCH] apparmor: use zstd compression for profile
	data
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

--000000000000e8d35f05e0c6286b
Content-Type: text/plain; charset="UTF-8"

zstd_compress_bound returns the worst case scenario so that the buffer will
be guaranteed to be large enough. I will look into reallocating the buffer
since the worst case could very well be larger than the original size.
Thanks,

Jon

On Fri, Jun 3, 2022 at 4:59 PM Georgia Garcia <georgia.garcia@canonical.com>
wrote:

> On Thu, 2022-05-12 at 12:35 -0500, Jon Tourville wrote:
> > +       out_len = zstd_compress_cctx(ctx, out, out_len, src, slen,
> &params);
> > +       if (zstd_is_error(out_len)) {
> > +               ret = -EINVAL;
> > +               goto cleanup;
> >         }
> >
> > -       *dst = dstbuf;
> > -       *dlen = strm.total_out;
> > +       *dst = out;
> > +       *dlen = out_len;
>
> Hi Jon,
>
> Should the dst/out buffer be realloced to match the out_len returned by
> zstd_compress_cctx? Or is the estimation made by zstd_compress_bound
> accurate?
>
> Regards,
> Georgia
>
>

--000000000000e8d35f05e0c6286b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">zstd_compress_bound returns the worst case scenario so tha=
t the buffer will be guaranteed to be large enough. I will look into reallo=
cating the buffer since the worst case could very well be larger than the o=
riginal size. Thanks,<br><div><br></div><div>Jon</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 3, 2022 =
at 4:59 PM Georgia Garcia &lt;<a href=3D"mailto:georgia.garcia@canonical.co=
m">georgia.garcia@canonical.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Thu, 2022-05-12 at 12:35 -0500, Jon Tou=
rville wrote:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0out_len =3D zstd_compress_cctx(ctx, out, o=
ut_len, src, slen, &amp;params);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (zstd_is_error(out_len)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVA=
L;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*dst =3D dstbuf;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*dlen =3D strm.total_out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*dst =3D out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*dlen =3D out_len;<br>
<br>
Hi Jon,<br>
<br>
Should the dst/out buffer be realloced to match the out_len returned by<br>
zstd_compress_cctx? Or is the estimation made by zstd_compress_bound<br>
accurate?<br>
<br>
Regards,<br>
Georgia<br>
<br>
</blockquote></div>

--000000000000e8d35f05e0c6286b--


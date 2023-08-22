Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 603377848F5
	for <lists+apparmor@lfdr.de>; Tue, 22 Aug 2023 20:02:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qYVhb-0003iM-ST; Tue, 22 Aug 2023 18:02:03 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <georgia.garcia@canonical.com>) id 1qYVhZ-0003iF-Lp
 for apparmor@lists.ubuntu.com; Tue, 22 Aug 2023 18:02:01 +0000
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 76E4D3F18C
 for <apparmor@lists.ubuntu.com>; Tue, 22 Aug 2023 18:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1692727321;
 bh=uUMjsMH7sxt1CrJqNCDsYCZoGIumwjRtpyiqj3YtGGk=;
 h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
 Content-Type:MIME-Version;
 b=QR+HhNj1T3QYhi9tVqOf0crYA37Kh0EaVD2knU6AbXrwm59kPrb7T6LzJD37hrLFF
 O4LSSld1emeXzAHBEh9nwRWrrXwThmEhrrVjmrmOHohNghW4mJsadyj2CjU/6FYJTJ
 6dvqVwdXu3P5r0GD43gyGtA3tQC1ygPF5pVAHDap9jAvY9xmBm6eSUobGQh6TQXmnT
 6A22ERQxmyZ9A5WrnCVGD7GtmvF8blXyuusy38op92om5s+gR3E7io73LaH94ubRFb
 q4uivJPujM+HsHOUiUJP5h1yRtOW/bBhGo9g6/fVCV0SUxVDno9CF6rdKQSD7IF+tj
 6GdpBwB2JmOIQ==
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-6bc59b0fff5so5199495a34.0
 for <apparmor@lists.ubuntu.com>; Tue, 22 Aug 2023 11:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692727320; x=1693332120;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uUMjsMH7sxt1CrJqNCDsYCZoGIumwjRtpyiqj3YtGGk=;
 b=IsUlBznCz3jGhqNOFJrP/08eHbGl46/gh/PmW648gM5ThDXqniQl0Z+MKX+oenuflP
 6rmDV81tsFni7fugHxMhjgM0ecAjGdimC1omgzgYauwQzMFhknBnTK27DmJcb+Mn90Bw
 IHrNqPPVUQSb0fGmHBQm11ss1YRul12k8Ya7F8A6er1gVqL894bLsxYeESzqnkp43xiE
 nz2lGSjfY1J2zy3yWfv+2ueHaHZ3VzjQpb1vh06vGVN4Oj6F8VAdBKFcbiaiWSqGS7pJ
 eXJAwq17SHg7+ujLeEuQi1ArGkmPpurNKcdEOr9VPtZNmXdS5JXCNMmFJ9iAGCFylXB+
 W06g==
X-Gm-Message-State: AOJu0Yx6Us25LiyVGuQBTyxk5x/EVdTX/aO3QyBZYNMJmiqbPpJDIRDu
 OSxf1Mhym2xGd9xjtNZliTWk2EjnydPiD1lmSHFiZciFhLRh9MveVbW7k0snU1/WsPoRKuI4mAG
 ro+LUmDKvsMfofZ0otUx0JinQ8fVWvQgzMAoWuw==
X-Received: by 2002:a05:6830:2003:b0:6b8:f730:7ab4 with SMTP id
 e3-20020a056830200300b006b8f7307ab4mr11716750otp.0.1692727320329; 
 Tue, 22 Aug 2023 11:02:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpOu5pNMNEVJv2v9tlpWBAicHmDl8VxetAakTElBvq/7IDwb8/USIQa16uR98dLEp/fqMxoQ==
X-Received: by 2002:a05:6830:2003:b0:6b8:f730:7ab4 with SMTP id
 e3-20020a056830200300b006b8f7307ab4mr11716732otp.0.1692727320082; 
 Tue, 22 Aug 2023 11:02:00 -0700 (PDT)
Received: from ?IPv6:2001:1284:f01c:1de7:8c3d:2bdb:e48e:7637?
 ([2001:1284:f01c:1de7:8c3d:2bdb:e48e:7637])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a9d7c82000000b006b89dafb721sm4770847otn.78.2023.08.22.11.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 11:01:59 -0700 (PDT)
Message-ID: <19f2433fbb761e3af70c2e2824da3c026096f776.camel@canonical.com>
From: Georgia Garcia <georgia.garcia@canonical.com>
To: John Johansen <john.johansen@canonical.com>
Date: Tue, 22 Aug 2023 15:01:56 -0300
In-Reply-To: <2b1955a6-1f0d-081a-c173-730f25a51275@canonical.com>
References: <20230821183724.2588567-1-georgia.garcia@canonical.com>
 <2b1955a6-1f0d-081a-c173-730f25a51275@canonical.com>
Organization: Canonical
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
Subject: Re: [apparmor] [PATCH -next] apparmor: fix invalid reference on
 profile->disconnected
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

On Tue, 2023-08-22 at 10:13 -0700, John Johansen wrote:
> On 8/21/23 11:37, Georgia Garcia wrote:
> > profile->disconnected was storing an invalid reference to the
> > disconnected path. Fix it by duplicating the string using
> > aa_unpack_strdup and freeing accordingly.
> >=20
> This is going to need the Fixes tag
>=20
> Fixes: 72c8a768641d ("apparmor: allow profiles to provide info to disconn=
ected paths")

Thanks!

>=20
> > Signed-off-by: Georgia Garcia <georgia.garcia@canonical.com>
>=20
> the patch certainly addresses the issue, and I can add the Fixes tag, but=
 unless
> there is something I am missing I think we should avoid the intermediate =
variable
> as noted below
>=20
> > ---
> >   security/apparmor/policy.c        | 1 +
> >   security/apparmor/policy_unpack.c | 5 +++--
> >   2 files changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
> > index 4817c1b30105..d7525f228c43 100644
> > --- a/security/apparmor/policy.c
> > +++ b/security/apparmor/policy.c
> > @@ -255,6 +255,7 @@ void aa_free_profile(struct aa_profile *profile)
> >  =20
> >   	aa_put_ns(profile->ns);
> >   	kfree_sensitive(profile->rename);
> > +	kfree_sensitive(profile->disconnected);
> >  =20
> >   	free_attachment(&profile->attach);
> >  =20
> > diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/poli=
cy_unpack.c
> > index d2d740bb5618..8b2ad42c80ba 100644
> > --- a/security/apparmor/policy_unpack.c
> > +++ b/security/apparmor/policy_unpack.c
> > @@ -804,7 +804,7 @@ static struct aa_profile *unpack_profile(struct aa_=
ext *e, char **ns_name)
> >   	const char *info =3D "failed to unpack profile";
> >   	size_t ns_len;
> >   	struct rhashtable_params params =3D { 0 };
> > -	char *key =3D NULL;
> > +	char *key =3D NULL, *disconnected =3D NULL;
> >   	struct aa_data *data;
> >   	int error =3D -EPROTO;
> >   	kernel_cap_t tmpcap;
> > @@ -870,7 +870,8 @@ static struct aa_profile *unpack_profile(struct aa_=
ext *e, char **ns_name)
> >   	}
> >  =20
> >   	/* disconnected attachment string is optional */
> > -	(void) aa_unpack_str(e, &profile->disconnected, "disconnected");
> > +	(void) aa_unpack_strdup(e, &disconnected, "disconnected");
> > +	profile->disconnected =3D disconnected;
>=20
> is there any reason you added the intermediate step of unpacking to &disc=
onnected instead of just directly to the value as before?

profile->disconnected is const and but the second argument of
aa_unpack_strdup is not, so the compiler throws an error saying
"incompatible pointer type".

> >  =20
> >   	/* per profile debug flags (complain, audit) */
> >   	if (!aa_unpack_nameX(e, AA_STRUCT, "flags")) {
>=20



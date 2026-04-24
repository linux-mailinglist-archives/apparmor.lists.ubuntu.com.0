Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA+nEN1f62kCMAAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 24 Apr 2026 14:19:41 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F2545E51C
	for <lists+apparmor@lfdr.de>; Fri, 24 Apr 2026 14:19:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wGFVK-0004oy-Mt; Fri, 24 Apr 2026 12:19:30 +0000
Received: from mail-qv1-f46.google.com ([209.85.219.46])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <phx0fer@gmail.com>) id 1wGDDV-0007zp-Ol
 for apparmor@lists.ubuntu.com; Fri, 24 Apr 2026 09:52:57 +0000
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-8a151012558so82526296d6.3
 for <apparmor@lists.ubuntu.com>; Fri, 24 Apr 2026 02:52:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777024376; cv=none;
 d=google.com; s=arc-20240605;
 b=F+UYwz/tfwifgHztkT3Cgzdd1s1+y4ZCCXF1OT1Blv5CWU+C1mgWthyaBHurvGsiq7
 kp/yUh2tF8eme7RVlWZgLfczaiA6IiQosn4+neyLQrce72jVZhMNSzZYS+oG5MeqRhSZ
 Db3HgrVNKOaf1vl6kHxOldvpUuXWYlAlF86qc4JzoAx75+0zU3PoUE6560PCFnBdLfnL
 qJt7pgHoFa5DBq+jtk+8aoX8Jvo01RFxY+dDp6XLW/SiyDnhvVQPGVMt8iRTM5e9/Qbg
 Q3jHx8fBDRkY9wEYml/S68eP4U5Yl/KIBnyiBa08oG5pLxXyo4+Egxz0G2qAzGCOI2rU
 DNEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=hKb/vK1BjpPFdvL4ny+gwWWNUROcsi898naU28/Ggoo=;
 fh=GDLzk/hupgLaMEy8y6oA1P/c7VeHx/V/hSEx/sj+uZ4=;
 b=DjMEnZVkm4UZALuuysQ0sl5IzayNZfAX5YAr4/0IhMuCyyY/a3/nLwDr86GEFv8FHl
 KLvsrxHlCrTv+AiVJLhM/LEGZXB35sgwwkkz1ILoXcmoBKEkGsDBiSHOl48DXZN13RlT
 LrcTBzbpoSSp5oyMJJKJSVOh0HAXe01w3CVnkoJC7WqeNRDutFkHB6DFtyjxEAHO58Gx
 mK0zLmdZK+18PxEQ8qQiSG7SeRYt5ia89MsSB4kfltGa7lzbTDDoM/Pp2o35ENpUdh9J
 32kAgTm3mbiy8IO4YNToAXGJH634A8jPBAu8H2wkzQYDez3YoWahELxihE3gW+hvUsky
 uf0g==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777024376; x=1777629176; darn=lists.ubuntu.com;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hKb/vK1BjpPFdvL4ny+gwWWNUROcsi898naU28/Ggoo=;
 b=GMM0f9DB6yVGe+gtCV8h2Bmwgwr14JSxyIXLiVg/tz6bbZpYpi2hRXa12m+mx30TFG
 lfFW79cXqqp2JewCvPVrdJpcBsT/VGFtGFo+MRoMeoOHr1h3B1hxmsP9ZUZFyBRpdOxO
 +waR8VAnkR4NjJ/QzK4WxTGuQkwCcNkVWSM5WkvAdvgFQjUBf0K0sLBDIeEZR5yId0Nm
 2NRVHnFA8EWtVgTqqxY5+OIba65BP/hk5p98pTW+q8oSpz1X3BdOqC0ph+/K8p5DPs4+
 M7kBnDdTCO/6DuLUdfJAYfdTXH8sXD78f7G9pvL8bxfZfZxcr62ejHGzzxdj+0AF7INc
 FAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777024376; x=1777629176;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hKb/vK1BjpPFdvL4ny+gwWWNUROcsi898naU28/Ggoo=;
 b=CKHzguLmyCk6Y7H3CMb5ffY5WFJhS/qOeA4kP7gnosbO4kcrSkj5oOGi/jSNkR5tgl
 H8zVY6O3Yy7NHZPuI02rQg+BwSsDvfDbXkz4x1J1PgI4AkiXere36x9fQxcFel9u9SB/
 kVgthFy8ONpcHS5kiNPRarbT2hQo9wo51Dkx+TB1hCMMsNpNdodDrVK4K06+JdOd2971
 tk3iT6W+nh10OFpMtiq9wBesLEQZ/Y8GJw/wiq+smm3jUQjkc1t8oY2RQ92uknkd5T7V
 wSI3HoYURtjx9zinOvd3RHlUCcHjmIpkI/+To5qp6u8ZhrzajuNu/hchIOE5pbZnk/qs
 MCgQ==
X-Gm-Message-State: AOJu0YwdDkuY+nw5EdTbdffQ6MR2Vcv1QwZF8qd3rPdXc0pK3fof3Ajm
 lOY2QqfynbRo5ryJxxOG/qhXyO95X5tjQGL9KvNHS2ZoHy7nSUN+ukmjEraVRK+d6VZlRogfAKI
 Weq08Ce6JM38FfPWIwrDq3GcruYWK9kwXejtCXas=
X-Gm-Gg: AeBDieuoLULeUuEQF5+u7kUIpGsxu7WzKYm8KPO1MhHrqPTH3FG0Z/ke7UOOh4ObwYl
 L1gQP2SUZm/YvJi/UrD9wr52UhQ/dsoyHR4TKowWGOQv8AlYbUV8u2VIYoTjSPiaV1PV4HR1wqq
 G42LIKjvK5tRpyw9UpZcOWbFKE7d6EE3HrUgvLDVJy1Ew4Rwd0xU5IBLiRxC9E74NPDTy2kbuXj
 QV/G1XCkUrPnJQ1zVr69JwrYIkxHvuQvxwuwHSyLYzkhNXv5n9kqXyJcm2vRG47AwGdGVDr1jwa
 VZe6UYWcD10fcQfNbswpWuqsKynYxA==
X-Received: by 2002:a05:6214:29e9:b0:8ac:a611:740e with SMTP id
 6a1803df08f44-8b0280ee523mr472722236d6.28.1777024376473; Fri, 24 Apr 2026
 02:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260413090313.79315-1-phx0fer@gmail.com>
 <6310cc11dd67ff2fb928a08fed9a6e11ac884e7b.camel@canonical.com>
In-Reply-To: <6310cc11dd67ff2fb928a08fed9a6e11ac884e7b.camel@canonical.com>
From: phx <phx0fer@gmail.com>
Date: Fri, 24 Apr 2026 17:52:43 +0800
X-Gm-Features: AQROBzBBifYIqFd10cEXW44r-RhoGnOH-NLipF6qPqYZTx5NVkKklku9492ZyNU
Message-ID: <CAKvCo-zf17t5qwDmKN8whysM+pwoOjkUq+uu1hr1OJ5xh6UY-w@mail.gmail.com>
To: Georgia Garcia <georgia.garcia@canonical.com>
Content-Type: multipart/alternative; boundary="000000000000b78b87065031ba01"
Received-SPF: pass client-ip=209.85.219.46; envelope-from=phx0fer@gmail.com;
 helo=mail-qv1-f46.google.com
X-Mailman-Approved-At: Fri, 24 Apr 2026 12:19:29 +0000
Subject: Re: [apparmor] [PATCH] apparmor: Fix wrong dentry in
 RENAME_EXCHANGE uid check
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
X-Rspamd-Queue-Id: F1F2545E51C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.61 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:georgia.garcia@canonical.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phx0fer@gmail.com,apparmor-bounces@lists.ubuntu.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[phx0fer@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,canonical.com:email]

--000000000000b78b87065031ba01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. Will respin with the Fixes tag added.

On Thu, Apr 23, 2026 at 1:24=E2=80=AFAM Georgia Garcia <georgia.garcia@cano=
nical.com>
wrote:

> Hello,
>
> On Mon, 2026-04-13 at 17:03 +0800, Dudu Lu wrote:
> > In apparmor_path_rename(), when handling RENAME_EXCHANGE, the
> > cond_exchange structure is supposed to carry the attributes of the
> > *new* dentry (since it is used to authorize moving new_dentry to the
> > old location). However, line 412 reads:
> >
> >     vfsuid =3D i_uid_into_vfsuid(idmap, d_backing_inode(old_dentry));
> >
> > This fetches the uid of old_dentry instead of new_dentry. As a result,
> > the RENAME_EXCHANGE permission check uses the wrong file owner, which
> > can allow a rename that should be denied (if old_dentry's owner has
> > more privileges) or deny one that should be allowed.
> >
> > Note that cond_exchange.mode on the line above correctly uses
> > new_dentry. Only the uid lookup is wrong.
> >
> > Fix by changing old_dentry to new_dentry in the i_uid_into_vfsuid call.
> >
>
> This looks correct to me, but could you add a Fixes tag?
>
> Fixes: 5e26a01e56fd ("apparmor: use type safe idmapping helpers")
>
> Thank you,
> Georgia
>
> > Signed-off-by: Dudu Lu <phx0fer@gmail.com>
> > ---
> >  security/apparmor/lsm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> > index c1d42fc72fdb..e8de919fbea6 100644
> > --- a/security/apparmor/lsm.c
> > +++ b/security/apparmor/lsm.c
> > @@ -409,7 +409,7 @@ static int apparmor_path_rename(const struct path
> *old_dir, struct dentry *old_d
> >                       struct path_cond cond_exchange =3D {
> >                               .mode =3D
> d_backing_inode(new_dentry)->i_mode,
> >                       };
> > -                     vfsuid =3D i_uid_into_vfsuid(idmap,
> d_backing_inode(old_dentry));
> > +                     vfsuid =3D i_uid_into_vfsuid(idmap,
> d_backing_inode(new_dentry));
> >                       cond_exchange.uid =3D vfsuid_into_kuid(vfsuid);
> >
> >                       error =3D aa_path_perm(OP_RENAME_SRC, current_cre=
d(),
>
>

--000000000000b78b87065031ba01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the review. Will respin with the Fixes tag adde=
d.=C2=A0=C2=A0</div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 23, 2026 at 1:24=E2=80=AFAM=
 Georgia Garcia &lt;<a href=3D"mailto:georgia.garcia@canonical.com">georgia=
.garcia@canonical.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hello,<br>
<br>
On Mon, 2026-04-13 at 17:03 +0800, Dudu Lu wrote:<br>
&gt; In apparmor_path_rename(), when handling RENAME_EXCHANGE, the<br>
&gt; cond_exchange structure is supposed to carry the attributes of the<br>
&gt; *new* dentry (since it is used to authorize moving new_dentry to the<b=
r>
&gt; old location). However, line 412 reads:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0vfsuid =3D i_uid_into_vfsuid(idmap, d_backing_inode=
(old_dentry));<br>
&gt; <br>
&gt; This fetches the uid of old_dentry instead of new_dentry. As a result,=
<br>
&gt; the RENAME_EXCHANGE permission check uses the wrong file owner, which<=
br>
&gt; can allow a rename that should be denied (if old_dentry&#39;s owner ha=
s<br>
&gt; more privileges) or deny one that should be allowed.<br>
&gt; <br>
&gt; Note that cond_exchange.mode on the line above correctly uses<br>
&gt; new_dentry. Only the uid lookup is wrong.<br>
&gt; <br>
&gt; Fix by changing old_dentry to new_dentry in the i_uid_into_vfsuid call=
.<br>
&gt; <br>
<br>
This looks correct to me, but could you add a Fixes tag?<br>
<br>
Fixes: 5e26a01e56fd (&quot;apparmor: use type safe idmapping helpers&quot;)=
<br>
<br>
Thank you,<br>
Georgia<br>
<br>
&gt; Signed-off-by: Dudu Lu &lt;<a href=3D"mailto:phx0fer@gmail.com" target=
=3D"_blank">phx0fer@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 security/apparmor/lsm.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c<br>
&gt; index c1d42fc72fdb..e8de919fbea6 100644<br>
&gt; --- a/security/apparmor/lsm.c<br>
&gt; +++ b/security/apparmor/lsm.c<br>
&gt; @@ -409,7 +409,7 @@ static int apparmor_path_rename(const struct path =
*old_dir, struct dentry *old_d<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0struct path_cond cond_exchange =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mode =3D d_backing_inode(new_dent=
ry)-&gt;i_mode,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0};<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0vfsuid =3D i_uid_into_vfsuid(idmap, d_backing_inode(old_dentry));<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0vfsuid =3D i_uid_into_vfsuid(idmap, d_backing_inode(new_dentry));<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0cond_exchange.uid =3D vfsuid_into_kuid(vfsuid);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0error =3D aa_path_perm(OP_RENAME_SRC, current_cred(),<br>
<br>
</blockquote></div>

--000000000000b78b87065031ba01--


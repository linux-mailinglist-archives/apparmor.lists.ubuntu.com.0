Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 549AAA2CAC5
	for <lists+apparmor@lfdr.de>; Fri,  7 Feb 2025 19:05:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tgSjc-0005Cj-CC; Fri, 07 Feb 2025 18:05:48 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tgSja-0005Cc-Rl
 for apparmor@lists.ubuntu.com; Fri, 07 Feb 2025 18:05:46 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 96E3A3F1D4
 for <apparmor@lists.ubuntu.com>; Fri,  7 Feb 2025 18:05:46 +0000 (UTC)
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ab6fe8d375eso249226766b.2
 for <apparmor@lists.ubuntu.com>; Fri, 07 Feb 2025 10:05:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738951546; x=1739556346;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l0Zgygg2Rw0FeHOdwTwhVqgrfyu5KNWWxawNpjCbEyw=;
 b=ZL9iIKW123M0aNHAK+tstrY/jvh4xSdaJ+I5YC6Qy2Yyeer+nIwfmxQ8CCBqKLGi6/
 0nfgSSahmc44IKGxtv5xqOc0JBbphlGHGC36/Cq2q/MOJ8HcXzoV4cZ3XcERX83Ctz6A
 gYdVvsjyWxMiBif6mn06OKs4cZDr8qqpqCfxGyMWoi/b9wCY9CcWH6XNiz2MTa6Xtaqg
 4cTo2OQX/mmcc0Lp0hfRyL3K8kh2O9xdVUKo8izCXugngmmjvGP9rmHpncnnof93XIqH
 Q4e4qsoZqtTlVwjEuTd4SDFaE5it3Hbhcqhg4Rk1Lu2dAwL3NYBcvImKZd0fjXvRIhBi
 ep9w==
X-Gm-Message-State: AOJu0Yw6yDmYTcQSwJ8rNfynH7R7yYIPT+DDKMeKiRSf07fdOTy+XRIa
 emwnyNxO+053fjsCyfCb8Q94FZe9MNf3jiqx8gpK6MRfUJaMCgp7CzI2/TTRe7szAkGCAuG2gko
 gpbtHWFdAdx1mMUmw/4tQ0IgOqaDZDLJkXkwBzZ63VJvwMX3F2Ha5i53tfR23y4kh5/32T5rsqL
 CR6KVboeul6hQFmJSgd1mfcDbPxz+ykDs3sOOk8ttUVsMYiakJpHvbPHj/
X-Gm-Gg: ASbGncvaAbGDk6jOPr88YkmVrRX7ZD31kUs99iXjp8ygntoHLsmfJ5hxwiYxiKnI60E
 sPXu67V8z2Dv55xd3xlmmu/UJRQBbDp2J3Tmx84KT4tpDa6+i1V60kO92nkAm
X-Received: by 2002:a17:907:7ea4:b0:ab7:9823:b76f with SMTP id
 a640c23a62f3a-ab79823b7famr123800166b.30.1738951546093; 
 Fri, 07 Feb 2025 10:05:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPWXlFEzwgjhPxwD2mv/n3QXL+SA9owSFiu437D5AUf0j/owDr+yi3Ouja+8w+Opbg5voHNJUX7jKmj2N9dNU=
X-Received: by 2002:a17:907:7ea4:b0:ab7:9823:b76f with SMTP id
 a640c23a62f3a-ab79823b7famr123786766b.30.1738951545110; Fri, 07 Feb 2025
 10:05:45 -0800 (PST)
MIME-Version: 1.0
References: <BN7PR11MB278887F249FC486A72D9D665FFF12@BN7PR11MB2788.namprd11.prod.outlook.com>
In-Reply-To: <BN7PR11MB278887F249FC486A72D9D665FFF12@BN7PR11MB2788.namprd11.prod.outlook.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Fri, 7 Feb 2025 10:05:34 -0800
X-Gm-Features: AWEUYZl4leE0i3GDflHvMUANXnpQTQv4UtenpQeH3ItTy_soJzl3xbfI05jx4os
Message-ID: <CAKCV-6sTBaJiCG4xb63+oActonpJXCF1Lk7LJ3uZc=f8bN2VBw@mail.gmail.com>
To: Ian Merin <Ian.Merin@entrust.com>
Content-Type: multipart/alternative; boundary="00000000000020d9c5062d913513"
Subject: Re: [apparmor] policy variables not working as intended
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
Cc: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--00000000000020d9c5062d913513
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ian,

Can you check if the rule

@{lib}/**.so* mr,

works for you?

If so, the issue is that your use of the variable creates a rule that
starts with two slashes, which currently isn't collapsed down into a single
slash. You can check https://gitlab.com/apparmor/apparmor/-/issues/450 for
more information.

Ryan


On Fri, Feb 7, 2025 at 9:50=E2=80=AFAM Ian Merin <Ian.Merin@entrust.com> wr=
ote:

> I=E2=80=99ve looked for documentation on variables to determine if I am u=
sing them
> incorrectly but I cannot find very much information about variables.
>
>
>
> I have created a variable @{lib}=3D/{,usr/}lib{,64}/
>
>
>
> And created a rule as such
>
>
>
> /@{lib}/**.so* mr,
>
>
>
> This rule appears to do nothing.  If I substitute the value of @{lib} int=
o
> the rule:
>
>
>
> /{,usr/}lib{,64}/**.so* mr,
>
>
>
> It works exactly as I expect it to.  I have tried every possible
> combination of slashes for the variable with no luck.  As far as I can
> tell, on  apparmor and libapparmor v 3.1.2
>
>
>
> Thanks,
>
>
>
> Ian
> *Any email and files/attachments transmitted with it are intended solely
> for the use of the individual or entity to whom they are addressed. If th=
is
> message has been sent to you in error, you must not copy, distribute or
> disclose of the information it contains. Please notify Entrust immediatel=
y
> and delete the message from your system.*
>
>

--00000000000020d9c5062d913513
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ian,<br><br>Can you check if the rule<br><br>@{lib}/**.=
so* mr,<br><br>works for you?<br><br><div>If so, the issue is that your use=
 of the variable creates a rule that starts with two slashes, which current=
ly isn&#39;t collapsed down into a single slash. You can check <a href=3D"h=
ttps://gitlab.com/apparmor/apparmor/-/issues/450" target=3D"_blank">https:/=
/gitlab.com/apparmor/apparmor/-/issues/450</a> for more information.</div><=
div><br></div><div>Ryan</div></div><br><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 7, 2025 at 9:50=E2=80=AFAM Ian=
 Merin &lt;<a href=3D"mailto:Ian.Merin@entrust.com" target=3D"_blank">Ian.M=
erin@entrust.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div>





<div lang=3D"EN-US">
<div>
<p class=3D"MsoNormal">I=E2=80=99ve looked for documentation on variables t=
o determine if I am using them incorrectly but I cannot find very much info=
rmation about variables.=C2=A0
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I have created a variable @{lib}=3D/{,usr/}lib{,64}/=
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">And created a rule as such<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><a href=3D"mailto:/@%7blib%7d/**.so*" target=3D"_bla=
nk">/@{lib}/**.so*</a> mr,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">This rule appears to do nothing.=C2=A0 If I substitu=
te the value of @{lib} into the rule:<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">/{,usr/}lib{,64}/**.so* mr,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">It works exactly as I expect it to.=C2=A0 I have tri=
ed every possible combination of slashes for the variable with no luck.=C2=
=A0 As far as I can tell, on =C2=A0apparmor and libapparmor v 3.1.2<u></u><=
u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Ian <u></u><u></u></p>
</div>
<i>Any email and files/attachments transmitted with it are intended solely =
for the use of the individual or entity to whom they are addressed. If this=
 message has been sent to you in error, you must not copy, distribute or di=
sclose of the information it contains.
<u>Please notify Entrust immediately and delete the message from your syste=
m.</u></i><br>
<br>
</div>

</div></blockquote></div>

--00000000000020d9c5062d913513--


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D4502A2CB68
	for <lists+apparmor@lfdr.de>; Fri,  7 Feb 2025 19:37:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tgTDp-00086A-3j; Fri, 07 Feb 2025 18:37:01 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tgTDm-000860-Qz
 for apparmor@lists.ubuntu.com; Fri, 07 Feb 2025 18:36:58 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4C4F93F687
 for <apparmor@lists.ubuntu.com>; Fri,  7 Feb 2025 18:36:58 +0000 (UTC)
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ab78f142c55so99550766b.0
 for <apparmor@lists.ubuntu.com>; Fri, 07 Feb 2025 10:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738953417; x=1739558217;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TbdyHpvtlxQGIMBHCaBS6T1nkMWPsKp766LafFz4BtE=;
 b=WD5mtU2q2iO/H/mao6p7C4oKfNQbH+qugQnePhimMOSFPKw60Ng97B4gpGDtbm+gGb
 VMoXD6hd34+s6I8duL15rInCGOJT9bQlCHMDfS37IdcT1p3OdOBMy0qoQWmkMQbubR87
 IQldsBdIGmnk/ewQ1eXaGn9GHFl4c3RBrNo5Q+hQSV/bdnHNfSSlYMjLO9DeewVdrKu4
 FdNKoJkjnZcIvhLcoL6zpjq3DjMvxjVRNYk4lQk8avi9tT2XBh6C30oUj3pUgpY1JjoO
 1aTgz3gF0X21xLZI9pcwbbK+Gk/L00cK2yXvs1OgCJjYyEuXr5dlHl/hefEhrAYtoRDR
 tHxg==
X-Gm-Message-State: AOJu0YwmoFEjE/SQrfPt+t3+4oTymsw3zoMlQ0SgK6P+nnyM4oZ3FTJL
 HbOV0Wk9IibuUmRhpSylQch71dceiqZHH0gSYEx2S5aVwknK/VEX0Id6bv3tRKsf0Xlzb5DnPji
 FUX8BgDeg/TlKeFqyyLhc8QTVGwMu7AeJVs1hDnAO3TnRgbE1uIMgDgBZZIvdee/WR2Fp0txW0G
 0Oc2RquLSCyvr4vR4WtkG8EYVwkoUGtcg9ClKKu3SXXP3tuyKqUqbMA2Xi
X-Gm-Gg: ASbGncvUGBNqgYS5hoyiuV4lIW9Em1Q0ZCq8We971mt/9mpoy/BclrpRJTz+9moofGT
 1MDD+zitxN6VnOfFFQcIqodzzxZhBnv4FyeU51sH6ZoKA2YIU8jRXlpglOxQi
X-Received: by 2002:a17:907:d08d:b0:ab7:6d49:2c03 with SMTP id
 a640c23a62f3a-ab789c60410mr414867566b.19.1738953417445; 
 Fri, 07 Feb 2025 10:36:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKRsbDG/NzKXNOl+WaYKDhTjmBuKhEawWLXyJg2psW/91hPEBgmRlVTVWaydqeQ1soJ2tMMGtCe7EGQsLmTBM=
X-Received: by 2002:a17:907:d08d:b0:ab7:6d49:2c03 with SMTP id
 a640c23a62f3a-ab789c60410mr414865166b.19.1738953417017; Fri, 07 Feb 2025
 10:36:57 -0800 (PST)
MIME-Version: 1.0
References: <BN7PR11MB278887F249FC486A72D9D665FFF12@BN7PR11MB2788.namprd11.prod.outlook.com>
 <CAKCV-6sTBaJiCG4xb63+oActonpJXCF1Lk7LJ3uZc=f8bN2VBw@mail.gmail.com>
 <BN7PR11MB2788EFFC07BEC96E0FBF414CFFF12@BN7PR11MB2788.namprd11.prod.outlook.com>
In-Reply-To: <BN7PR11MB2788EFFC07BEC96E0FBF414CFFF12@BN7PR11MB2788.namprd11.prod.outlook.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Fri, 7 Feb 2025 10:36:46 -0800
X-Gm-Features: AWEUYZmmpmMA-tryK6pVsv8-Xu9RRbFFk2IALfhsMUlmxOH5VWRb8GEJEjh-eAI
Message-ID: <CAKCV-6ueZsNmQDsVXsgkD3oW3KT1=yRWXsot=H54ZVnpXqW8rg@mail.gmail.com>
To: Ian Merin <Ian.Merin@entrust.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [EXTERNAL] Re: policy variables not working as
	intended
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

Hi Ian,

That is a typo in the apparmor.d man page, and the @{HOME} usage in
the example should not be preceded by a backslash. Thanks for pointing
this out.

Ryan

On Fri, Feb 7, 2025 at 10:28=E2=80=AFAM Ian Merin <Ian.Merin@entrust.com> w=
rote:
>
> That worked!  I swear I tried every possible combination of leading slash=
es yesterday with no luck, but this format does appear to work for me.
>
>
>
> The reason I did it this way is because the example on https://manpages.u=
buntu.com/manpages/focal/man5/apparmor.d.5.html defines
>
>
>
> @{HOME} =3D /home/*/ /root/
>
> [=E2=80=A6]
>
> /@{HOME}/.foo_file  rw,
>
>
>
>
>
> Is the example incorrect?
>
>
>
> Thanks,
>
>
>
> Ian
>
>
>
>
>
>
>
> From: Ryan Lee <ryan.lee@canonical.com>
> Sent: Friday, February 7, 2025 1:06 PM
> To: Ian Merin <Ian.Merin@entrust.com>
> Cc: apparmor@lists.ubuntu.com
> Subject: [EXTERNAL] Re: [apparmor] policy variables not working as intend=
ed
>
>
>
> Hi Ian, Can you check if the rule @{lib}/**.=E2=80=8Aso* mr, works for yo=
u? If so, the issue is that your use of the variable creates a rule that st=
arts with two slashes, which currently isn't collapsed down into a single s=
lash. You can check https:=E2=80=8A//gitlab.=E2=80=8Acom/apparmor/apparmor/=
-/issues/450
>
> Hi Ian,
>
> Can you check if the rule
>
> @{lib}/**.so* mr,
>
> works for you?
>
> If so, the issue is that your use of the variable creates a rule that sta=
rts with two slashes, which currently isn't collapsed down into a single sl=
ash. You can check https://gitlab.com/apparmor/apparmor/-/issues/450 for mo=
re information.
>
>
>
> Ryan
>
>
>
> On Fri, Feb 7, 2025 at 9:50=E2=80=AFAM Ian Merin <Ian.Merin@entrust.com> =
wrote:
>
> I=E2=80=99ve looked for documentation on variables to determine if I am u=
sing them incorrectly but I cannot find very much information about variabl=
es.
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
o the rule:
>
>
>
> /{,usr/}lib{,64}/**.so* mr,
>
>
>
> It works exactly as I expect it to.  I have tried every possible combinat=
ion of slashes for the variable with no luck.  As far as I can tell, on  ap=
parmor and libapparmor v 3.1.2
>
>
>
> Thanks,
>
>
>
> Ian
>
> Any email and files/attachments transmitted with it are intended solely f=
or the use of the individual or entity to whom they are addressed. If this =
message has been sent to you in error, you must not copy, distribute or dis=
close of the information it contains. Please notify Entrust immediately and=
 delete the message from your system.


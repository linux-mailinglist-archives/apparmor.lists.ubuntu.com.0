Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E347FABCA6F
	for <lists+apparmor@lfdr.de>; Mon, 19 May 2025 23:56:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uH8TS-0001V1-6n; Mon, 19 May 2025 21:56:42 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <gabriel.totev@zetier.com>)
 id 1uH8TP-0001Ug-PB
 for apparmor@lists.ubuntu.com; Mon, 19 May 2025 21:56:39 +0000
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7c5e39d1db2so313905185a.3
 for <apparmor@lists.ubuntu.com>; Mon, 19 May 2025 14:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747691798; x=1748296598;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EOXEar3JMt8I5wIbojUBGclJ2Cwt6fvo5ECJsqLXQfs=;
 b=AYYwMZggPkkF9GgF7IS7sXs5/ChrTewuEt3mrKaT/x20G9K/TBmk6vSKSVD0J4j+s8
 lV9xF3y4o0JDVx4I+DXyMcgMQMCAwMArfCT28os737SapUsere2tSln+Pi1D8n5MBGVQ
 o3+0gWKp2FwpRqg1MUMY3S+4L75Wx5i5Scq6IpTDzA1s9QXJzt8oY09qMuOF6QbxtRl2
 2ShD2lKpWEkwAQ+547ChtN7SzhXR37H/RbrCYOSY3c7N2sB/2912sKlRrk5wAT/hTXxV
 g7giL5zAjqliqQzevRnxuFmf0wLGg0bJrtyYG3RbGGM3ycdT/+t8gYFWB29Nxc/7UENp
 cqhA==
X-Gm-Message-State: AOJu0YzNEKFsIrX5Xk51pNI9f65olKA5DxSn67H8QFTb+56Hw+DI1L/I
 +4KASATFUTrquF1+m0aunnLLlpW61oSJlOtLYEy1BzcD0YCQMrAFUMBJP99l1aFKJKIquArXLig
 vweAcIbo=
X-Gm-Gg: ASbGnctuHVSrfYr+M7RDwmkKTL7h2Hs70+sC0NiUqmk+MRocMtcCitAB6/xS9pgae1F
 pwET64LXnO6gSoyPGvHRItHdBMSdVmX2jLk2JL56x79etM/EMGwhNyAYAP+tqXj3AlGaQZyk37G
 onP4qUdvSc1xzFbPP7c4PWvYc0DHi3V72liKo1hM/WpjtTMObYbidbbn8P5iMF+6HFp6KsZTJh1
 RPH3kFsbg6I6Qz1ejfhUxLGRSoPg7NiqSwvor+ne62epWd9s7NvfFa9cdzkaxCeKjaZ3+XfL0Fs
 dKQWcfWgGf2cAkQX+Ac/ZhOw//VxMfxxwnzAavduQjNESAnljbJEDoFoXtoX/fwiQA==
X-Google-Smtp-Source: AGHT+IEeehA3260v/sJrplNOZECEEJwqIceBm8RU+ybEqdrPBGXdNY+WO7ZTIA9CiXoD1PBDCEBmkQ==
X-Received: by 2002:a05:622a:4c0c:b0:494:8930:9fb7 with SMTP id
 d75a77b69052e-494ae23bb3amr225583471cf.0.1747691798406; 
 Mon, 19 May 2025 14:56:38 -0700 (PDT)
Received: from localhost ([65.222.209.234]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae528466sm60835491cf.67.2025.05.19.14.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 14:56:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 17:56:37 -0400
Message-Id: <DA0H1BQ9UO2G.3ATO7SJM7L25X@gabriel.zetier.com>
From: "Gabriel Totev" <gabriel.totev@zetier.com>
To: "John Johansen" <john.johansen@canonical.com>
X-Mailer: aerc 0.8.2
References: <20250416224209.904863-1-gabriel.totev@zetier.com>
 <cddd7197-4286-4e44-b143-88fdc263c631@canonical.com>
In-Reply-To: <cddd7197-4286-4e44-b143-88fdc263c631@canonical.com>
Received-SPF: pass client-ip=209.85.222.170;
 envelope-from=gabriel.totev@zetier.com; helo=mail-qk1-f170.google.com
Subject: Re: [apparmor] [PATCH 1/2] apparmor: shift ouid when mediating hard
 links in userns
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 dillon@zetier.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sat May 17, 2025 at 4:40 AM EDT, John Johansen wrote:
> On 4/16/25 15:42, Gabriel Totev wrote:
> > When using AppArmor profiles inside an unprivileged container,
> > the link operation observes an unshifted ouid.
> > (tested with LXD and Incus)
> >=20
> > For example, root inside container and uid 1000000 outside, with
> > `owner /root/link l,` profile entry for ln:
> >=20
> > /root$ touch chain && ln chain link
> > =3D=3D> dmesg
> > apparmor=3D"DENIED" operation=3D"link" class=3D"file"
> > namespace=3D"root//lxd-feet_<var-snap-lxd-common-lxd>" profile=3D"linki=
t"
> > name=3D"/root/link" pid=3D1655 comm=3D"ln" requested_mask=3D"l" denied_=
mask=3D"l"
> > fsuid=3D1000000 ouid=3D0 [<=3D=3D should be 1000000] target=3D"/root/ch=
ain"
> >=20
> > Fix by mapping inode uid of old_dentry in aa_path_link() rather than
> > using it directly, similarly to how it's mapped in __file_path_perm()
> > later in the file.
>
> so unfortunately this isn't correct. Yes some mapping needs to be
> done but it needs to be relative to different policy namespaces. I
> need to spend some time on this

Not sure I understand... I based this patch and its sibling on similar
code for making path_cond structs from the lsm.c functions:
- apparmor_path_rename()
- apparmor_file_open()
- common_perm_cond()
- common_perm_rm()

Are hard links (and Unix sockets) different in terms of figuring out the
correct uid? Or should all these functions be updated to be relative to
policy namespaces? Perhaps they already are and I can't tell? (not sure
what this would look like or how uids would be affected)

I'm by no means an AppArmor expert but I'd like to understand and if
possible help get this fixed as it prevent Snaps from running correctly
in LXD/Incus containers. I've built and tested with these patches and it
seems to work: Snaps now don't attract spurious denials and the ouid
from my example above gets the correct value of 1000000 rather than 0.
However, I can't be totally sure I'm not introducing any regressions or
vulnerabilities.

If there's anything I can do to help with this effort, please let me know!

> >=20
> > Signed-off-by: Gabriel Totev <gabriel.totev@zetier.com>
> > ---
> >   security/apparmor/file.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/security/apparmor/file.c b/security/apparmor/file.c
> > index 5c984792cbf0..ecd36199337c 100644
> > --- a/security/apparmor/file.c
> > +++ b/security/apparmor/file.c
> > @@ -430,9 +430,11 @@ int aa_path_link(const struct cred *subj_cred,
> >   {
> >   	struct path link =3D { .mnt =3D new_dir->mnt, .dentry =3D new_dentry=
 };
> >   	struct path target =3D { .mnt =3D new_dir->mnt, .dentry =3D old_dent=
ry };
> > +	struct inode *inode =3D d_backing_inode(old_dentry);
> > +	vfsuid_t vfsuid =3D i_uid_into_vfsuid(mnt_idmap(target.mnt), inode);
> >   	struct path_cond cond =3D {
> > -		d_backing_inode(old_dentry)->i_uid,
> > -		d_backing_inode(old_dentry)->i_mode
> > +		.uid =3D vfsuid_into_kuid(vfsuid),
> > +		.mode =3D inode->i_mode,
> >   	};
> >   	char *buffer =3D NULL, *buffer2 =3D NULL;
> >   	struct aa_profile *profile;



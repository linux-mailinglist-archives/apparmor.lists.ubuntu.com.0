Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEED9068BB
	for <lists+apparmor@lfdr.de>; Thu, 13 Jun 2024 11:29:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sHgly-0000Yj-Sl; Thu, 13 Jun 2024 09:29:34 +0000
Received: from mail-yb1-f173.google.com ([209.85.219.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1sHRmi-0001ux-8E
 for apparmor@lists.ubuntu.com; Wed, 12 Jun 2024 17:29:20 +0000
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dfe41f7852cso127841276.1
 for <apparmor@lists.ubuntu.com>; Wed, 12 Jun 2024 10:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718213359; x=1718818159;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=60lvPuusqxavVhRXfVcmrSoiIVupdLi0rpCh21972os=;
 b=nbohvTr5AQ92RY12i1NH8ugPO1mmDXO/JBmvbgqDqm4co6aL9OAH9Bckpl6r/40MIZ
 wXxRHluOJCPeZoX17IZPHeTdWjeMNq1q05CXQQTBYnleBVnjooisxtgkMw378CRkGlqv
 nVTOVAA1zhFt1LAfqfAPTSdeLPHR/RqF1xCfJGItrgLSogaVUc4gDkjxwFqavAZWVgqF
 SViLpz74g1KdZkF+hb4qXcgJ+3MBnpVMz8d9xEJfcckwM/pm+YyjMk2TdPUhNT5dAXK4
 x2LPH6O2EUQWIYi/rnY7mT+nNupS5+OSV4pCL0BsIOhO1vrno0jtWkxHaq8nOPG4cZxF
 f5PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeyMVVVjzjPK7ighLxdtW9RKH0oQsqNFBDhlhfO8y+b18A/bf+06Jf7bN6R+EQWvz8SAcKnLAUD58urxthIC1D0E6bIL7lCvUG
X-Gm-Message-State: AOJu0YxuIxx+sjLqErTLoqRLsWGfoNWaNXOfb7ZAQBsflfp52teVoWvI
 hvK5MMNc/ge5nHgn8w7a5frRCMAWBjOSPKIT4pFItFeacIIXRJ0TXTq7/qnOfGHoamca8ajsHIQ
 DwA/N8VPUKWUeC1QZic94VmTh5Td3VgcKqNQj
X-Google-Smtp-Source: AGHT+IEhGQzLLgCG9zMe0EWuDP1y2oVPtsHywKe/9At+CIXkctODudh6oHfrQfYIPwmYuFhbkIgUb9iq6CY+5R6qw6E=
X-Received: by 2002:a25:7:0:b0:de6:1695:13a3 with SMTP id
 3f1490d57ef6-dfe62f1a60dmr2505543276.0.1718213358736; 
 Wed, 12 Jun 2024 10:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240609104355.442002-1-jcalmels@3xx0.net>
 <20240609104355.442002-5-jcalmels@3xx0.net>
 <CAHC9VhT5XWbhoY2Nw5jQz4GxpDriUdHw=1YsQ4xLVUtSnFxciA@mail.gmail.com>
 <z2bgjrzeq7crqx24chdbxnaanuhczbjnq6da3xw6al6omjj5xz@mqbzzzfva5sw>
 <887a3658-2d8d-4f9e-98f2-27124bb6f8e6@canonical.com>
 <CAHC9VhQFNPJTOct5rUv3HT6Z2S20mYdW75seiG8no5=fZd7JjA@mail.gmail.com>
 <uuvwcdsy7o4ulmrdzwffr6uywfacmlkjrontmjdj44luantpok@dtatxaa6tzyv>
 <CAHC9VhRnthf8+KgfuzFHXWEAc9RShDO0G_g0kc1OJ-UTih1ywg@mail.gmail.com>
 <rgzhcsblub7wedm734n56cw2qf6czjb4jgck6l5miur6odhovo@n5tgrco74zce>
In-Reply-To: <rgzhcsblub7wedm734n56cw2qf6czjb4jgck6l5miur6odhovo@n5tgrco74zce>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 12 Jun 2024 13:29:06 -0400
Message-ID: <CAHC9VhRGJTND25MFk4gR-FGxoLhMmgUrMpz_YoMFOwL6kr28zQ@mail.gmail.com>
To: Jonathan Calmels <jcalmels@3xx0.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.173; envelope-from=paul@paul-moore.com;
 helo=mail-yb1-f173.google.com
X-Mailman-Approved-At: Thu, 13 Jun 2024 09:29:33 +0000
Subject: Re: [apparmor] [PATCH v2 4/4] bpf,
	lsm: Allow editing capabilities in BPF-LSM hooks
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
Cc: Matt Bobrowski <mattbobrowski@google.com>,
 Joel Granados <j.granados@samsung.com>, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 David Howells <dhowells@redhat.com>, Song Liu <song@kernel.org>,
 keyrings@vger.kernel.org, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 linux-security-module@vger.kernel.org, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 John Fastabend <john.fastabend@gmail.com>, James Morris <jmorris@namei.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 KP Singh <kpsingh@kernel.org>, containers@lists.linux.dev,
 Hao Luo <haoluo@google.com>, brauner@kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, linux-kernel@vger.kernel.org,
 Eduard Zingerman <eddyz87@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>,
 ebiederm@xmission.com, Jiri Olsa <jolsa@kernel.org>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Jun 12, 2024 at 4:15=E2=80=AFAM Jonathan Calmels <jcalmels@3xx0.net=
> wrote:
> On Tue, Jun 11, 2024 at 06:38:31PM GMT, Paul Moore wrote:
> > On Tue, Jun 11, 2024 at 6:15=E2=80=AFPM Jonathan Calmels <jcalmels@3xx0=
.net> wrote:

...

> > > Arguably, if we do want fine-grained userns policies, we need LSMs to
> > > influence the userns capset at some point.
> >
> > One could always use, or develop, a LSM that offers additional
> > controls around exercising capabilities.  There are currently four
> > in-tree LSMs, including the capabilities LSM, which supply a
> > security_capable() hook that is used by the capability-based access
> > controls in the kernel; all of these hook implementations work
> > together within the LSM framework and provide an additional level of
> > control/granularity beyond the existing capabilities.
>
> Right, but the idea was to have a simple and easy way to reuse/trigger
> as much of the commoncap one as possible from BPF. If we're saying we
> need to reimplement and/or use a whole new framework, then there is
> little value.

I can appreciate how allowing direct manipulation of capability bits
from a BPF LSM looks attractive, but my hope is that our discussion
here revealed that as you look deeper into making it work there are a
number of pitfalls which prevent this from being a safe option for
generalized systems.

> TBH, I don't feel strongly about this, which is why it is absent from
> v1. However, as John pointed out, we should at least be able to modify
> the blob if we want flexible userns caps policies down the road.

As discussed in this thread, there are existing ways to provide fine
grained control over exercising capabilities that can be safely used
within the LSM framework.  I don't want to speak to what John is
envisioning, but he should be aware of these mechanisms, and if I
recall he did voice a level of concern about the same worries I
mentioned.

I'm happy to discuss ways in which we can adjust the LSM hooks/layer
to support different approaches to capability controls, but one LSM
directly manipulating the state of another is going to be a no vote
from me.

--=20
paul-moore.com


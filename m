Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAE2909C74
	for <lists+apparmor@lfdr.de>; Sun, 16 Jun 2024 10:15:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sIl31-0001r5-Ri; Sun, 16 Jun 2024 08:15:35 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1sHrTV-0004fa-4t
 for apparmor@lists.ubuntu.com; Thu, 13 Jun 2024 20:55:13 +0000
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6319bf71f28so9112467b3.1
 for <apparmor@lists.ubuntu.com>; Thu, 13 Jun 2024 13:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718312112; x=1718916912;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mcXAwgD8G/DtMBTj2XjZiXsT2OTNX1kHEG3gcoNV7As=;
 b=CGCK24Yu0qLJzvLi9a+tkoUMi/49CMEXWzw3yKE0YJDHbrfKAEcZnpzUlxBANDhK+j
 j1ro/W0VflMQc0SmEM/vYC8HfOpZXbbTNCBRU+NESfM9VmW4w3zT+IXAhGt0FhV7VCQ+
 FmDsjet1SV5gxmRRHMINWXgPAf83Eu9bPavvEEYSSmPnS54rDNIAIy9gQ9iZpihL3J8f
 KgQiKL/EzP80IbPD2HL456+7j7jcnM6l0AFzRRBBED7ZAypbJHWeNxjQM8zwMjuIYzWq
 sJ54u7X6Rk3eA6kdeuiwx58iCIpdYrKKfXKaTYbWV9VeuOrTWb9AOQ9p+kW+b6dHPiUY
 cElA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFMgJLIbsITJ8zsl3OWFEgxu0XBQsM2dk4zrxKwMxim8FKLi78FJtTQk41/cXc1LlBVe0H1Abf/sqCVK9Bpg0n5ypHsAUnbEBw
X-Gm-Message-State: AOJu0Yz1gzgN1tX/1oihelZS3W4raJ1PsF8MfvcKYSBYKCCpaBKki3eV
 k+uOisdbFXiM/7EU11GLZOx71b2VqdFG1JZ5MDe4D5FCNQ7CAGAvpjfiSXAm01a+3LIH/lOxlaP
 xajuFjifgfJwiWpsZWLNCjuggsoXkE8lFpBsc
X-Google-Smtp-Source: AGHT+IGDrzqvYL8x8To8WRZC5EK4ZE7eYh19cN6eIrPp+Dp9L8DQSAkqnp5RVfEyty6oWnZormmtfNXBsvqkuSccnaA=
X-Received: by 2002:a81:910f:0:b0:62f:ad9c:cd4 with SMTP id
 00721157ae682-6322470facfmr6187707b3.41.1718312111715; Thu, 13 Jun 2024
 13:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240609104355.442002-5-jcalmels@3xx0.net>
 <CAHC9VhT5XWbhoY2Nw5jQz4GxpDriUdHw=1YsQ4xLVUtSnFxciA@mail.gmail.com>
 <z2bgjrzeq7crqx24chdbxnaanuhczbjnq6da3xw6al6omjj5xz@mqbzzzfva5sw>
 <887a3658-2d8d-4f9e-98f2-27124bb6f8e6@canonical.com>
 <CAHC9VhQFNPJTOct5rUv3HT6Z2S20mYdW75seiG8no5=fZd7JjA@mail.gmail.com>
 <uuvwcdsy7o4ulmrdzwffr6uywfacmlkjrontmjdj44luantpok@dtatxaa6tzyv>
 <CAHC9VhRnthf8+KgfuzFHXWEAc9RShDO0G_g0kc1OJ-UTih1ywg@mail.gmail.com>
 <rgzhcsblub7wedm734n56cw2qf6czjb4jgck6l5miur6odhovo@n5tgrco74zce>
 <CAHC9VhRGJTND25MFk4gR-FGxoLhMmgUrMpz_YoMFOwL6kr28zQ@mail.gmail.com>
 <ba8d88c8-a251-4c1f-8653-1082b0a101dd@canonical.com>
 <zwh766li4dwx5be6uxnxl2lhtxb4jsiua4atilpqvoeuksgz2h@v3pna3o3ewkp>
In-Reply-To: <zwh766li4dwx5be6uxnxl2lhtxb4jsiua4atilpqvoeuksgz2h@v3pna3o3ewkp>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 13 Jun 2024 16:55:00 -0400
Message-ID: <CAHC9VhTaD+LxEL8hMdbvFFJgU1xbEtmN7gSwSdKRS=hX_uVnVQ@mail.gmail.com>
To: Jonathan Calmels <jcalmels@3xx0.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.179; envelope-from=paul@paul-moore.com;
 helo=mail-yw1-f179.google.com
X-Mailman-Approved-At: Sun, 16 Jun 2024 08:15:33 +0000
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

On Thu, Jun 13, 2024 at 4:45=E2=80=AFAM Jonathan Calmels <jcalmels@3xx0.net=
> wrote:
> On Wed, Jun 12, 2024 at 08:54:28PM GMT, John Johansen wrote:
> > On 6/12/24 10:29, Paul Moore wrote:
> > > On Wed, Jun 12, 2024 at 4:15=E2=80=AFAM Jonathan Calmels <jcalmels@3x=
x0.net> wrote:
> > > > On Tue, Jun 11, 2024 at 06:38:31PM GMT, Paul Moore wrote:
> > > > > On Tue, Jun 11, 2024 at 6:15=E2=80=AFPM Jonathan Calmels <jcalmel=
s@3xx0.net> wrote:
> > >
> > > ...
> > >
> > > > > > Arguably, if we do want fine-grained userns policies, we need L=
SMs to
> > > > > > influence the userns capset at some point.
> > > > >
> > > > > One could always use, or develop, a LSM that offers additional
> > > > > controls around exercising capabilities.  There are currently fou=
r
> > > > > in-tree LSMs, including the capabilities LSM, which supply a
> > > > > security_capable() hook that is used by the capability-based acce=
ss
> > > > > controls in the kernel; all of these hook implementations work
> > > > > together within the LSM framework and provide an additional level=
 of
> > > > > control/granularity beyond the existing capabilities.
> > > >
> > > > Right, but the idea was to have a simple and easy way to reuse/trig=
ger
> > > > as much of the commoncap one as possible from BPF. If we're saying =
we
> > > > need to reimplement and/or use a whole new framework, then there is
> > > > little value.
> > >
> > > I can appreciate how allowing direct manipulation of capability bits
> > > from a BPF LSM looks attractive, but my hope is that our discussion
> > > here revealed that as you look deeper into making it work there are a
> > > number of pitfalls which prevent this from being a safe option for
> > > generalized systems.
> > >
> > > > TBH, I don't feel strongly about this, which is why it is absent fr=
om
> > > > v1. However, as John pointed out, we should at least be able to mod=
ify
> > > > the blob if we want flexible userns caps policies down the road.
> > >
> > > As discussed in this thread, there are existing ways to provide fine
> > > grained control over exercising capabilities that can be safely used
> > > within the LSM framework.  I don't want to speak to what John is
> > > envisioning, but he should be aware of these mechanisms, and if I
> > > recall he did voice a level of concern about the same worries I
> > > mentioned.
> > >
> >
> > sorry, I should have been more clear. I envision LSMs being able to
> > update their own state in the userns hook.
> >
> > Basically the portion of the patch that removes const from the
> > userns hook.
>
> Yes, pretty sure we'll need this regardless.
>
> > An LSM updating the capset is worrysome for all the reasons you
> > pointed out, and I think a few more. I haven't had a chance to really
> > look at v2 yet, so I didn't want to speak directly on the bpf part of
> > the patch without first giving a good once over.


> > > I'm happy to discuss ways in which we can adjust the LSM hooks/layer
> > > to support different approaches to capability controls, but one LSM
> > > directly manipulating the state of another is going to be a no vote
> > > from me.
> >
> > I might not be as hard no as Paul here, I am always willing to listen
> > to arguments, but it would have to be a really good argument to
> > modify the capset, when there are multiple LSMs in play on a system.
>
> The way I see it, it's more about enhancing the capability LSM with BPF
> hooks and have it modify its own state dynamically, not so much
> crosstalk between two distinct LSM frameworks (say one where the BPF
> LSM implements a lot of things like capable()).

As I mentioned previously, if you want to do something with the
capability sets you simply need to do it within the confines of
security/commoncap.c.  If you're really set on the "MUST BE BPF!" way
of life, and you can convince Serge (capabilities maintainer) that it
would be a good idea, you could propose a dedicated BPF hook within
the capabilities LSM.  I'm not sure how wise that would be, but it
would resolve a lot of the LSM ordering/stacking issues that we've
discussed.

> If we think there is no way we can come up with something that's safe
> enough, and that the risks outweigh the benefits, fine by me, we can
> drop this patch from the series.

To be clear, this patch is not acceptable at this point in time.  With
the understanding that I haven't looked that closely at the rest of
the patchset, it looks fairly well contained to the capabilities code
which means it is largely up to Serge, not me.

I will mention that you should update the audit code to recognize the
new capability set, look at kernel/auditsc.c for more information.

--=20
paul-moore.com


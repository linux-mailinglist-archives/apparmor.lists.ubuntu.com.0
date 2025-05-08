Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 739DEAB0B6E
	for <lists+apparmor@lfdr.de>; Fri,  9 May 2025 09:18:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uDI02-0001hK-6X; Fri, 09 May 2025 07:18:26 +0000
Received: from mail-yw1-f175.google.com ([209.85.128.175])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <bulgarabulgara769@gmail.com>)
 id 1uD3AH-00082A-Fu
 for apparmor@lists.ubuntu.com; Thu, 08 May 2025 15:28:01 +0000
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-7082e46880eso10616767b3.1
 for <apparmor@lists.ubuntu.com>; Thu, 08 May 2025 08:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746718080; x=1747322880;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SiddRBQDCaEieoMGYIPQkcaPtfEKHid+cx+b7hxZFek=;
 b=o9zhlknOVpIj1q5WC+AXtabSM6DvO4QysBhkk7VD7YMCld7cA/m/pByu1MI8Pd2E2z
 BVN1ikG0fzVLDQJU110cISnLAGQbgyuV6sY0RyYejhhA90zci532pKwbWkxWcSUKrgRh
 IsoXZ5xMjkjZ7EUy1LzMv0QS+mXNFNL/FBIXGPspS0Z2xPjWkd2fFExupyS0OQMyus/8
 nMpZLyCf7Yv9F+1lhl5QEE2bh48475HykBEE1WfVQB/HTQQRUz0wc9OLGhmR/EZzo8fC
 /atBu86LHTQvJfqj0p8h5DmLzN/JghA28JWxNqp7IdVmMWDxo8cRkISZxEP1BVnru5ts
 P8Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYM7/D4PUqFA0kzA1ZyKOV1BBUFxKuE3Jr/4MUAUXi//e33mHRmJSYh3A7qilnlqPDSHF9lgCq0g==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yyo/iVvqklhlwkvCemkfy37Cuc7NlRV9X2FUVPpUH4tjLVpq5Vr
 T3B++tAD9sY8R7XhlSzDkRjvi6xIJxFZi1d3k0BsjZzewRDzr2Rm4Nd5+jslRI/IMDT1Df97d3p
 8VPZ1Opu3N4HkiVJzWP7j96DzfOE=
X-Gm-Gg: ASbGncukoTOJj6EMmJBs8wg5DfkYanM6WjZHmfG0l1F3oAJrcatTB2fepygLHexC5Xy
 ZeU6ilAa0RTgia0p6mtLIteBf6kkORlzX3Ul52vxs5QW3W345dY1+wzY47vSZQLqUhdPkEF15er
 ovrq5cQilt1Smob9H60pvjfYyrX+9QP9EAukjsu1R9baYajQ==
X-Google-Smtp-Source: AGHT+IGvLRzRonl6ASSuEuVLGoY2/UgTJ+uxzV3RUaWFAs5NqOmNf0bwgH4c0gTvT3jpEzRqR46297QswN+UZLO9rdM=
X-Received: by 2002:a05:690c:6c8a:b0:6fd:97a7:1474 with SMTP id
 00721157ae682-70a1d9f9351mr121837557b3.11.1746718079972; Thu, 08 May 2025
 08:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-3-maxime.belair@canonical.com>
 <9c68743f-5efa-4a77-a29b-d3e8f2b2a462@I-love.SAKURA.ne.jp>
 <6d785712-6d8e-491c-86d4-1cbe5895778f@canonical.com>
 <75c0385c-b649-46b0-907f-903e2217f460@I-love.SAKURA.ne.jp>
 <07a496b2-ed1f-4a18-88d1-7be36dba3a8a@canonical.com>
 <75c7424b-fec9-469b-8f73-50ab86948a24@I-love.SAKURA.ne.jp>
In-Reply-To: <75c7424b-fec9-469b-8f73-50ab86948a24@I-love.SAKURA.ne.jp>
From: Eddie Bulgara <bulgarabulgara769@gmail.com>
Date: Thu, 8 May 2025 08:27:49 -0700
X-Gm-Features: AX0GCFvDfm4zY1uL9XPSi7CyFegC5fc7-WFnlmoOjKn3Pgyo054h58H19vCsef8
Message-ID: <CAJ_ZCCnQQOYbGmbtdevaWiE_sBU4gZvhuMT7QWtb_RZy4S6o+Q@mail.gmail.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Content-Type: multipart/alternative; boundary="000000000000adfedf0634a17ec0"
Received-SPF: pass client-ip=209.85.128.175;
 envelope-from=bulgarabulgara769@gmail.com; helo=mail-yw1-f175.google.com
X-Mailman-Approved-At: Fri, 09 May 2025 07:18:24 +0000
Subject: Re: [apparmor] [PATCH 2/3] lsm: introduce
	security_lsm_manage_policy hook
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
Cc: paul@paul-moore.com, kees@kernel.org, linux-api@vger.kernel.org,
 stephen.smalley.work@gmail.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--000000000000adfedf0634a17ec0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025, 8:20=E2=80=AFAM Tetsuo Handa <
penguin-kernel@i-love.sakura.ne.jp> wrote:

> On 2025/05/08 23:44, John Johansen wrote:
> > On 5/8/25 05:55, Tetsuo Handa wrote:
> >> On 2025/05/08 17:25, John Johansen wrote:
> >>> That is fine. But curious I am curious what the interface would look
> like to fit TOMOYO's
> >>> needs.
> >>
> >> Stream (like "FILE *") with restart from the beginning (like
> rewind(fp)) support.
> >> That is, the caller can read/write at least one byte at a time, and
> written data
> >> is processed upon encountering '\n'.
> >>
> >
> > that can be emulated within the current sycall, where the lsm maintains
> a buffer.
>
> That cannot be emulated, for there is no event that is automatically
> triggered when
> the process terminates (i.e. implicit close() upon exit()) in order to
> release the
> buffer the LSM maintains.
>
> > Are you asking to also read data back out as well, that could be added,
> but doing
> > a syscall per byte here or through the fs is going to have fairly high
> overhead.
>
> At least one byte means arbitrary bytes; that is, the caller does not nee=
d
> to read
> or write the whole policy at one syscall.
>
> >
> > Without understanding the requirement it would seem to me, that it woul=
d
> be
> > better to emulate that file buffer manipulation in userspace similar sa=
y
> C++
> > stringstreams, and then write the syscall when done.
>
> The size of the whole policy in byte varies a lot.
>
>
>

--000000000000adfedf0634a17ec0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 8, 2025, 8:20=E2=80=AFA=
M Tetsuo Handa &lt;<a href=3D"mailto:penguin-kernel@i-love.sakura.ne.jp">pe=
nguin-kernel@i-love.sakura.ne.jp</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On 2025/05/08 23:44, John Johansen wrote:<br>
&gt; On 5/8/25 05:55, Tetsuo Handa wrote:<br>
&gt;&gt; On 2025/05/08 17:25, John Johansen wrote:<br>
&gt;&gt;&gt; That is fine. But curious I am curious what the interface woul=
d look like to fit TOMOYO&#39;s<br>
&gt;&gt;&gt; needs.<br>
&gt;&gt;<br>
&gt;&gt; Stream (like &quot;FILE *&quot;) with restart from the beginning (=
like rewind(fp)) support.<br>
&gt;&gt; That is, the caller can read/write at least one byte at a time, an=
d written data<br>
&gt;&gt; is processed upon encountering &#39;\n&#39;.<br>
&gt;&gt;<br>
&gt; <br>
&gt; that can be emulated within the current sycall, where the lsm maintain=
s a buffer.<br>
<br>
That cannot be emulated, for there is no event that is automatically trigge=
red when<br>
the process terminates (i.e. implicit close() upon exit()) in order to rele=
ase the<br>
buffer the LSM maintains.<br>
<br>
&gt; Are you asking to also read data back out as well, that could be added=
, but doing<br>
&gt; a syscall per byte here or through the fs is going to have fairly high=
 overhead.<br>
<br>
At least one byte means arbitrary bytes; that is, the caller does not need =
to read<br>
or write the whole policy at one syscall.<br>
<br>
&gt; <br>
&gt; Without understanding the requirement it would seem to me, that it wou=
ld be<br>
&gt; better to emulate that file buffer manipulation in userspace similar s=
ay C++<br>
&gt; stringstreams, and then write the syscall when done.<br>
<br>
The size of the whole policy in byte varies a lot.<br>
<br>
<br>
</blockquote></div>

--000000000000adfedf0634a17ec0--


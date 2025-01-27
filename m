Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E815A21BBB
	for <lists+apparmor@lfdr.de>; Wed, 29 Jan 2025 12:05:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1td5t9-0004ej-RK; Wed, 29 Jan 2025 11:05:43 +0000
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mjguzik@gmail.com>) id 1tcWKP-0005sw-8q
 for apparmor@lists.ubuntu.com; Mon, 27 Jan 2025 21:07:29 +0000
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5d982de9547so9413336a12.2
 for <apparmor@lists.ubuntu.com>; Mon, 27 Jan 2025 13:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738012048; x=1738616848;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ph4LsKdDXKgKXX7RKxCai5H4EMt0LF9SZ1cKR8yZ6Ok=;
 b=n57YedAS4M8XJVq3leU223rHSas9OApB6z4ORlbiBaWMhsDldoQSyTA6cl4P4Jfvby
 qFNwg57IbF7H2VDcXaG3P01i3dS/ARbJ2RNcgkIigAk0UIPpkjOoN8S8DwUcWCy8u5Iy
 O7wMYW7sG9+iIH2qFV8hnRGLJtwYfPXTo870NMNghzkvTzdUu1Z+fQRIAboXpgpzmQ80
 tcEDeh6ZXaPeAjjnIlh7dNsD91WziTfy+H9JW8Y2pWXHI9Sgml6nqvP1jT0XWmmwn7AJ
 8dRas4rGVTeSYdiVZHdhD1e3vY6bAFbXSZgXHKnbr0y03pBcBg8OJRSngc+AATuOKsc9
 SBaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQY4D6pVmUm37+HA/Zn0yaS6xbuyH0NOm+SwYg1ackQTR9/09n9ziZCJ1Sa20MOQ7LKt5hKpWLoA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxU95EZogSCN+F3HhqHewfnuqMpFdLgZsSfQOpkSaGzS6Z6Mj1J
 OuZUVV0JSA2EPiyndOCzNnb/N3K1ARzkOJSbjzs1oHqpDZNapFG+pmq5KHhFGBq8lKa6pEr1zLs
 +BBWvKGIenClYQER0/oCCAvd925w=
X-Gm-Gg: ASbGncsWBOOlDWT+KgKSMLto3ZohCsK0CIxZDG/pZhKdNPZyb/S2Tdz97OwqVBCbewD
 OQkVXQlm01QzBc62EDLar/3vmfGMolsgiDxIMryfdRrdpT19ErEP2f5cAOKSm
X-Google-Smtp-Source: AGHT+IGmodn64v6jg9Cv8nLWcX0huPpc7OBi3YIaBJcUH/6N3ZHtxeWvia8KzgFkiOs4wChlFb2f5eK+DOEq55qyDA0=
X-Received: by 2002:a05:6402:2548:b0:5d3:e79b:3b4c with SMTP id
 4fb4d7f45d1cf-5db7db2bfebmr39227226a12.31.1738012048458; Mon, 27 Jan 2025
 13:07:28 -0800 (PST)
MIME-Version: 1.0
References: <20250127205404.3116679-1-mjguzik@gmail.com>
 <CAKCV-6sRcOOcLOqc62PyUKqbmmqTOje8vf0kDhLdNKaa4r57_Q@mail.gmail.com>
In-Reply-To: <CAKCV-6sRcOOcLOqc62PyUKqbmmqTOje8vf0kDhLdNKaa4r57_Q@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 27 Jan 2025 22:07:15 +0100
X-Gm-Features: AWEUYZkLfzdxeZl9uzdwZlGdlO-dXeXwY2yysO_AO2CXFVB_zMJPJu1dfcnNRaY
Message-ID: <CAGudoHGswaubt5-rYNBy-whuf1_+F_gji_RshfM=hmXFF-58qg@mail.gmail.com>
To: Ryan Lee <ryan.lee@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.44; envelope-from=mjguzik@gmail.com;
 helo=mail-ed1-f44.google.com
X-Mailman-Approved-At: Wed, 29 Jan 2025 11:05:41 +0000
Subject: Re: [apparmor] [PATCH] apparmor: use the condition in AA_BUG_FMT
	even with debug disabled
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
 paul@paul-moore.com, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, Jan 27, 2025 at 9:59=E2=80=AFPM Ryan Lee <ryan.lee@canonical.com> w=
rote:
>
> For the record, a previous patch that removes the sock variable was
> previously accepted:
> https://lists.ubuntu.com/archives/apparmor/2025-January/013449.html
> (patch) and https://lists.ubuntu.com/archives/apparmor/2025-January/01346=
3.html
> (ack from John Johansen)
>

That makes sense, but imo the posted patch is still warranted -- all
other debug macros (WARN_ON, VM_WARN_ON etc.) are expected to evaluate
the condition.

--=20
Mateusz Guzik <mjguzik gmail.com>


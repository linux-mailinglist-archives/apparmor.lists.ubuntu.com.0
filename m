Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA3AA21BB4
	for <lists+apparmor@lfdr.de>; Wed, 29 Jan 2025 12:05:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1td5tA-0004ew-2s; Wed, 29 Jan 2025 11:05:44 +0000
Received: from mail-yb1-f171.google.com ([209.85.219.171])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1tcnkJ-00057R-6l
 for apparmor@lists.ubuntu.com; Tue, 28 Jan 2025 15:43:23 +0000
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e39f43344c5so8249677276.1
 for <apparmor@lists.ubuntu.com>; Tue, 28 Jan 2025 07:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738079001; x=1738683801;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4CM+Y34LzyqTPbJa964bMKTZoegb6ZCbeVLJYvxkr2Y=;
 b=Ba2XY+WcA+kgk14xW3aEKi+gmR0/emyEk8aYDYnD5FHqKrINeR4bzLMJMd/huDPraw
 gkPwOs95kXdBmrawHS0JbcNx0DbJd4pz0osYJe3CPhxmvc3Y5o4lkccu6EGt80zMxRH9
 BojSQFW3Rc8RtmtTNpSdezLrl42zv/JepI49Riy1KbIwrhDyFAJo3m0m4eiTgnfC8sXt
 0BUjDUgZLoHfm2IwTPKmM41rU2aKyeNBnolNMDXqprcap8skfwNPzQ4gNLWHB5HZIPcb
 VaHszpHBN3VeNgH9yx6JDJpGKKC5u7+6C7DcRoWa/vS9plCX+9jZzQHV5rpi7Az+0cVC
 AESg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIVeVXoV67nwrtvR6jns1tHN+vu9qvMsxSpBXrXhXhSsRP603dd40yVftMbsLgssvFoG+R3sqM0g==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yxg+fLM31+IhCPyg5InKt48OQL8TEBtGx5zgwtN9Ny3nfgcaU6e
 4nc5p7IUA1dGIlYNZCoEKHChnGUauhXH7EtRW1e30riYaqmuKlw2KjYO5LV/o823A0VvrkuOouw
 ElF+Z8txp6dPz/GSth0ymN+WhNI98+IAj+gUA
X-Gm-Gg: ASbGncuMlwll6INeDWlcBwVft2BVapG+rCHcy2yrpT/tttdIEzpNvgBlcYddpgJpMMR
 NOJR86WjuwwNDcNGMdN54U+4wedppGfLJvtVIGL21wPTtoUAph5RBOk3IbotXxoPYG4vOkTM=
X-Google-Smtp-Source: AGHT+IGuLqrmdoXiE8apV7tzhOJZ5Xm1OF/NxWm8Kjkh7RMoG05FR1MdO9WMx2ebniwyt0o5rEC0Jv+xP432BtVJDY0=
X-Received: by 2002:a05:690c:4d02:b0:6ef:6646:b50a with SMTP id
 00721157ae682-6f6eb6b2881mr361409457b3.20.1738079001445; Tue, 28 Jan 2025
 07:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
 <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
 <f4lfo2fb7ajogucsvisfd5sg2avykavmkizr6ycsllcrco4mo3@qt2zx4zp57zh>
 <87jzag9ugx.fsf@intel.com> <Z5epb86xkHQ3BLhp@casper.infradead.org>
 <u2fwibsnbfvulxj6adigla6geiafh2vuve4hcyo4vmeytwjl7p@oz6xonrq5225>
In-Reply-To: <u2fwibsnbfvulxj6adigla6geiafh2vuve4hcyo4vmeytwjl7p@oz6xonrq5225>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Jan 2025 10:43:10 -0500
X-Gm-Features: AWEUYZkHRaUuCTQsu1U9C5jhigmIE9c2_8OmkE_i2Qv7ILXtAaTfDLC5EcLBZNk
Message-ID: <CAHC9VhQnB_bsQaezBfAcA0bE7Zoc99QXrvO1qjpHA-J8+_doYg@mail.gmail.com>
To: Joel Granados <joel.granados@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.171; envelope-from=paul@paul-moore.com;
 helo=mail-yb1-f171.google.com
X-Mailman-Approved-At: Wed, 29 Jan 2025 11:05:41 +0000
Subject: Re: [apparmor] [PATCH v2] treewide: const qualify ctl_tables where
	applicable
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
Cc: linux-aio@kvack.org, linux-hyperv@vger.kernel.org,
 Corey Minyard <cminyard@mvista.com>, Kees Cook <kees@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, keyrings@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org,
 codalist@coda.cs.cmu.edu, Alexander Gordeev <agordeev@linux.ibm.com>,
 io-uring@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-security-module@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-serial@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-trace-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 apparmor@lists.ubuntu.com, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 linux-raid@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 openipmi-developer@lists.sourceforge.net, intel-xe@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, fsverity@lists.linux.dev,
 linux-nfs@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Song Liu <song@kernel.org>, kexec@lists.infradead.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 linux-xfs@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Jan 28, 2025 at 6:22=E2=80=AFAM Joel Granados <joel.granados@kernel=
.org> wrote:
> On Mon, Jan 27, 2025 at 03:42:39PM +0000, Matthew Wilcox wrote:
> > On Mon, Jan 27, 2025 at 04:55:58PM +0200, Jani Nikula wrote:
> > > You could have static const within functions too. You get the rodata
> > > protection and function local scope, best of both worlds?
> >
> > timer_active is on the stack, so it can't be static const.
> >
> > Does this really need to be cc'd to such a wide distribution list?
> That is a very good question. I removed 160 people from the original
> e-mail and left the ones that where previously involved with this patch
> and left all the lists for good measure. But it seems I can reduce it
> even more.
>
> How about this: For these treewide efforts I just leave the people that
> are/were involved in the series and add two lists: linux-kernel and
> linux-hardening.
>
> Unless someone screams, I'll try this out on my next treewide.

I'm not screaming about it :) but anything that touches the LSM,
SELinux, or audit code (or matches the regex in MAINTAINERS) I would
prefer to see on the associated mailing list.

--=20
paul-moore.com


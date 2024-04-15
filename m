Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FD58A5697
	for <lists+apparmor@lfdr.de>; Mon, 15 Apr 2024 17:38:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rwOPa-0001R4-CA; Mon, 15 Apr 2024 15:38:26 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1rwN9t-0000CI-O8
 for apparmor@lists.ubuntu.com; Mon, 15 Apr 2024 14:18:09 +0000
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6157c30fbc9so32213407b3.0
 for <apparmor@lists.ubuntu.com>; Mon, 15 Apr 2024 07:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713190688; x=1713795488;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mqqqjCa8OZ82zdxbWAvkpK8zvR3ppQ2NndSIF2x4rXo=;
 b=kRMiBQf6bbaB8KXoUho/feMvrfgt144puRR/A3AGIXtBIwUuDHXEM9u1+N2Dya7iFE
 nVTdlp69qZ9PihXxPzcTIlckALvVUfVM4ZcZONAUAsw3LbkN74NEEwyc4LQknjEaKdAv
 YqD08MdYcYx/b98ZLDFRzkRK91/ekzLATdT4dAlJNM1qyMT/AVPAvLirGHL+xzVJfD8G
 2aDwzN4Sd0bs0Df1WOVfRVF5KOLY0JiLYEBiviDacqiUkk0gICMKzDIIkNDyG96r+6TZ
 lRFX2atnMTSUJVsHRwQg4kgX0Cu0fvC/m5YL9Cnao0ymuG7WgCssQkFyOXwghsnyMX6O
 0TRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHzbjplyuF8m9hcM9zkyXpvmWnrtHZx06eUz4EYIGVbWQAV9R65MdNXaWZteqqPM8qyyGyf4XkudtY/Jr8I3fwhFBryNHN5ib5
X-Gm-Message-State: AOJu0YwCLAfqtUm8eE94b/tZiA716wuDgc+NL6pg1/VRKQPmCnNB5mJK
 j+4nh9ijTVg6R4bk1II6eraRW4xBDPuiebE2IFuFnLan02/1dFNjfXfqG8p8XI9JmkzNI54zwHb
 yWqbEUWdWA3OQH4XabqU+6x4GSdU0orFwXV14
X-Google-Smtp-Source: AGHT+IFLkqpounEUU/2bE6dJh6q9whX/HjDtCGadHGTvaVHifyPAFZys4Iq+yJ+GbVJMCc2FKsEdAoulZVngTb0CJTg=
X-Received: by 2002:a0d:eb02:0:b0:615:3996:5c86 with SMTP id
 u2-20020a0deb02000000b0061539965c86mr9873358ywe.21.1713190688256; Mon, 15 Apr
 2024 07:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
 <CGME20240328155911eucas1p23472e0c6505ca73df5c76fe019fdd483@eucas1p2.samsung.com>
 <20240328-jag-sysctl_remset_misc-v1-2-47c1463b3af2@samsung.com>
 <20240415134406.5l6ygkl55yvioxgs@joelS2.panther.com>
In-Reply-To: <20240415134406.5l6ygkl55yvioxgs@joelS2.panther.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 15 Apr 2024 10:17:57 -0400
Message-ID: <CAHC9VhTE+85xLytWD8LYrmdV8xcXdi-Tygy5fVvokaLCfk9bUQ@mail.gmail.com>
To: Joel Granados <j.granados@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.176; envelope-from=paul@paul-moore.com;
 helo=mail-yw1-f176.google.com
X-Mailman-Approved-At: Mon, 15 Apr 2024 15:38:25 +0000
Subject: Re: [apparmor] [PATCH 2/7] security: Remove the now superfluous
 sentinel element from ctl_table array
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Atish Patra <atishp@atishpatra.org>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, keyrings@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-security-module@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Anup Patel <anup@brainfault.org>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 apparmor@lists.ubuntu.com, Paul Walmsley <paul.walmsley@sifive.com>,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, Muchun Song <muchun.song@linux.dev>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Pavel Begunkov <asml.silence@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, Apr 15, 2024 at 9:44=E2=80=AFAM Joel Granados <j.granados@samsung.c=
om> wrote:
>
> Hey
>
> This is the only patch that I have not seen added to the next tree.
> I'll put this in the sysctl-next
> https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git/log/?h=
=3Dsysctl-next
> for testing. Please let me know if It is lined up to be upstream through
> another path.

I was hoping to see some ACKs from the associated LSM maintainers, but
it's minor enough I'll go ahead and pull it into the lsm/dev tree this
week.  I'll send a note later when I do the merge.

--=20
paul-moore.com


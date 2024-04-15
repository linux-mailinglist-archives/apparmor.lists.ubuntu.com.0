Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 550A28A663A
	for <lists+apparmor@lfdr.de>; Tue, 16 Apr 2024 10:36:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rweIB-0005su-FK; Tue, 16 Apr 2024 08:35:51 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1rwRbU-0006uq-4G
 for apparmor@lists.ubuntu.com; Mon, 15 Apr 2024 19:02:56 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-6eb7d1a5d39so984060a34.2
 for <apparmor@lists.ubuntu.com>; Mon, 15 Apr 2024 12:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713207774; x=1713812574;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qnuzy4YohZRKFHiloeA4mVaIUDCwUMILHZ7C0FksI2Q=;
 b=SXToMtZfLYqfMCxiKm9QWp6K+vBje+4rPTQizkPsKbp+ewJh8hFItGeQjr9rrSCZh1
 EEa9ASADZxLpODAl+60Fh+717QPe4G2o5w+xUho9JbuKDoqZcUxKsYL5Vd4SwsSB+b5n
 X8++LT3kp2sD8OPD91ZP2ds+K1F7IqdTt18q7+JgMmv6zCMeT/EtQP0x0olozpNyCLbG
 LMquf4Z/sb0wKfJJzFu2oKkDhX818hxxajkCUDyxxZllZgzYxh8g5Ov/q85O8v/dfJgU
 ALJz3GtoZ29UmBJwukGmYyMoYJ0fjsFOHpmcDWOk25nCUXCSTBvWbF54UXnIL9hR5X81
 ez8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5qcw5hkmZd0nOqAOmBGf2LKotnYMvWM1c55vCa4s4WOcs7pzxnLb8be72pZCoCWTeGHFk8YS/M4wng6d1PbTS7JdD9J/f82xy
X-Gm-Message-State: AOJu0YyRdHCImTZQKyaqrI8X5EKiMh7E1jrhGkbRWH3PMtzocpqNOfHA
 7/8wmzZM/6mXUQsRki6D/2Skgk8QTLou3ecpVg4divPqP2M9RXNYYteeRJ6emXFM/U/y7kRfRgh
 DUwE64Szs8RPXwybqE01oWxhObaZzjzdWdC2d
X-Google-Smtp-Source: AGHT+IEZFN4hbYjCj1ww/D1sjvqe8pOqx7vvJkr0xZqROOpJDxITAIMHtAwtRNrZa/YLYN0XY/RRnGvMJysW4KwpFmQ=
X-Received: by 2002:a05:6830:1484:b0:6ea:386a:44d8 with SMTP id
 s4-20020a056830148400b006ea386a44d8mr11138794otq.3.1713207774198; Mon, 15 Apr
 2024 12:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
 <CGME20240328155911eucas1p23472e0c6505ca73df5c76fe019fdd483@eucas1p2.samsung.com>
 <20240328-jag-sysctl_remset_misc-v1-2-47c1463b3af2@samsung.com>
 <20240415134406.5l6ygkl55yvioxgs@joelS2.panther.com>
 <CAHC9VhTE+85xLytWD8LYrmdV8xcXdi-Tygy5fVvokaLCfk9bUQ@mail.gmail.com>
In-Reply-To: <CAHC9VhTE+85xLytWD8LYrmdV8xcXdi-Tygy5fVvokaLCfk9bUQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 15 Apr 2024 15:02:43 -0400
Message-ID: <CAHC9VhT1ykCKnijSbsgPXO9o-5_LHAtSm=q=cdQ8N9QH+WA+tw@mail.gmail.com>
To: Joel Granados <j.granados@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.45; envelope-from=paul@paul-moore.com;
 helo=mail-ot1-f45.google.com
X-Mailman-Approved-At: Tue, 16 Apr 2024 08:35:50 +0000
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

On Mon, Apr 15, 2024 at 10:17=E2=80=AFAM Paul Moore <paul@paul-moore.com> w=
rote:
> On Mon, Apr 15, 2024 at 9:44=E2=80=AFAM Joel Granados <j.granados@samsung=
.com> wrote:
> >
> > Hey
> >
> > This is the only patch that I have not seen added to the next tree.
> > I'll put this in the sysctl-next
> > https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git/log/?=
h=3Dsysctl-next
> > for testing. Please let me know if It is lined up to be upstream throug=
h
> > another path.
>
> I was hoping to see some ACKs from the associated LSM maintainers, but
> it's minor enough I'll go ahead and pull it into the lsm/dev tree this
> week.  I'll send a note later when I do the merge.

... and now it's merged, it should be in the next cut of the
linux-next tree.  Thanks!

--=20
paul-moore.com


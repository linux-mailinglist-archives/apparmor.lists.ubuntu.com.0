Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBB1B44020
	for <lists+apparmor@lfdr.de>; Thu,  4 Sep 2025 17:13:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uuBeG-0002yE-NC; Thu, 04 Sep 2025 15:13:16 +0000
Received: from mail-pj1-f41.google.com ([209.85.216.41])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1uuBeF-0002y0-7d
 for apparmor@lists.ubuntu.com; Thu, 04 Sep 2025 15:13:15 +0000
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-32b6108f2d5so789845a91.3
 for <apparmor@lists.ubuntu.com>; Thu, 04 Sep 2025 08:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756998793; x=1757603593;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zWu8/uT79TLkFHaoOripy/trgu/RnF6WTT4bI5QB+j8=;
 b=sCFimPRlR0RfD6iINirlx55YOxZQQt+8GKg5Hg+Q5lMHzuJZHyxvpFi+GZm+WkOXZK
 DFsdSLpEHjnfo2EeUzyyJAfvdh4gxCcFPidtn3DKFTdm/VkWpU9q8pAEi6ef53Q8KA3t
 ILf2L2mw5BPpL6FIbDdbV+8EpjRRLYcds2E6vd8oLQP0q93smo8X7sNcunenFs/yT7/p
 jAPQp2g6BfKcEDqUjAUkd8teucatgwb6QLJel4z9HtGAaBkrDVLAAEYeZguJsRwoqfoT
 4H2jCLWphf1d4s3jhy+uCezALKJ8JsKhTixcGCVnzSnm5KBdqBT+yp8FFeO+y5wPg72p
 EUAw==
X-Gm-Message-State: AOJu0YzesUHoosyuElB7SNIrnFfLJp+8m24vIZVuBfuQSelduLNOPXcj
 QPtO8F2MX+Rm6fTLl671/G0rsO2Uv/aexYKzECyG43IdrpEzbbcdKlK8jtVKk7L2AoGiZm6LsZp
 CzP2wTFtcShOAT7XnzAcX2/fqruufQds2XALYX7YEyVYIoKcEWHXWWg==
X-Gm-Gg: ASbGnctkQmFn12mSw6lJMBF7zeONohLRZyNLbwKxWTaYfFmWO7YnEa2Rs4C6yjNnkNQ
 GFF74m7fPBp9imckHdmGci2pzs8Q0vVhET+MDHG+68Yo6DarDH1mvLIMB1yfLu6+LcjW0ijv7+s
 oKRkFCaBIWMru25u59i9bFhXTm45A9flAcZmQRdZERt/1zrDn20I2aC4EJ5nzDl7CgKTN3EJ259
 +w5NofZCn2FWqsY9g==
X-Google-Smtp-Source: AGHT+IGqcMqHHAT75zSTTPlBqCVyFcn6AnTIKyagfTnT5D4zUa/iS7NyI7Sait1maUMEoXcJ2nw24OBTrZDWN8ZihOE=
X-Received: by 2002:a17:90b:2ec7:b0:327:e59d:2cc2 with SMTP id
 98e67ed59e1d1-32815436083mr27618387a91.10.1756998792394; Thu, 04 Sep 2025
 08:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <68b93e3c.a00a0220.eb3d.0000.GAE@google.com>
 <68b9ab18.050a0220.192772.0008.GAE@google.com>
In-Reply-To: <68b9ab18.050a0220.192772.0008.GAE@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 4 Sep 2025 11:12:59 -0400
X-Gm-Features: Ac12FXzmdDvybcxdLMeRBs2OONbitrTJM6yCl57blUt8t099sFu8t2Ati4PBkBs
Message-ID: <CAHC9VhR6+cHx+FvonHtAvuNZ-Ls77HjGnU5k5VR7qy1BUSaxdA@mail.gmail.com>
To: syzbot <syzbot+bb185b018a51f8d91fd2@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.216.41; envelope-from=paul@paul-moore.com;
 helo=mail-pj1-f41.google.com
Subject: Re: [apparmor] [syzbot] [kernel?] INFO: trying to register
 non-static key in skb_dequeue (4)
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, edumazet@google.com,
 eric.dumazet@gmail.com, jmorris@namei.org, kuba@kernel.org, pabeni@redhat.com,
 serge@hallyn.com, selinux@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 apparmor@lists.ubuntu.com, luto@kernel.org, tglx@linutronix.de,
 netdev@vger.kernel.org, stephen.smalley.work@gmail.com, omosnace@redhat.com,
 eparis@redhat.com, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, horms@kernel.org, davem@davemloft.net
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Sep 4, 2025 at 11:07=E2=80=AFAM syzbot
<syzbot+bb185b018a51f8d91fd2@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this issue to:
>
> commit eb59d494eebd4c5414728a35cdea6a0ba78ff26e
> Author: Casey Schaufler <casey@schaufler-ca.com>
> Date:   Sat Aug 16 17:28:58 2025 +0000
>
>     audit: add record for multiple task security contexts
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D1199fe6258=
0000
> start commit:   5d50cf9f7cf2 Add linux-next specific files for 20250903
> git tree:       linux-next
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D1399fe6258=
0000
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1599fe6258000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D7d2429dff5531=
d80
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Dbb185b018a51f8d=
91fd2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D15b9a312580=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D16819e6258000=
0
>
> Reported-by: syzbot+bb185b018a51f8d91fd2@syzkaller.appspotmail.com
> Fixes: eb59d494eebd ("audit: add record for multiple task security contex=
ts")
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisect=
ion

The timing on this is amusing, I got the sysbot report just as I
merged a fix for this provided by Eric Dumazet :)

https://lore.kernel.org/audit/20250904072537.2278210-1-edumazet@google.com

The commit has the appropriate syzbot tags so this should close out
automatically.

--=20
paul-moore.com


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2BCB15956
	for <lists+apparmor@lfdr.de>; Wed, 30 Jul 2025 09:11:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uh0xZ-0003Wp-BC; Wed, 30 Jul 2025 07:10:45 +0000
Received: from mail-qv1-f46.google.com ([209.85.219.46])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <glider@google.com>) id 1ugJ2g-0006Eg-Kb
 for apparmor@lists.ubuntu.com; Mon, 28 Jul 2025 08:17:06 +0000
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-7073075c767so28493426d6.3
 for <apparmor@lists.ubuntu.com>; Mon, 28 Jul 2025 01:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753690625; x=1754295425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oVOsc6ibl2c4BxKOGSlypnNZvk85m52BrD53itvnuCs=;
 b=HKaaFoHkbRGtEU9dPpWET/Xke2f4XRjQocaqj7a2cb/PWwpVLWuYPNYYYDu5MbRDba
 bxioIUfMXc2vC/C4ZylH5FGjalmjUDQSgl2EVBF3UY/qZAIq57Mnd267hsV6Ma04uuFz
 Dc4t1DRmXwj+1FBxP0JJkumvK+nLbiipHVZLq33NHUKMdNccTcJOhvYphAkYpmN4Nfpt
 70X446OH8/hQXEbGO6yM3J+FGYuCT26w1tuXxKD2ZvMf1eA7MeIdJ1kFX7R4aQklJVL8
 tYDejJsqBE6MXejjx7xU9VNO/fEHaLjq1yGr5w802KBe2XuvouPjb7CPJfcwxyi/KPqQ
 GbSw==
X-Gm-Message-State: AOJu0YxDGbeJV97RpHT+PxrgRK0wRoka4G0HctSxGzs0P8XwRszdcEti
 nmhDtpuVcfDWBdc1kg9mxG4kr5Iucr1LXU542yAbpU+vnI4LelyVIjAMHXaGkysdfVlgvR2ZCTN
 2jF6yFZ5SkWtNe8q/52WDtPlIhGXqKiYJgQY6OKCS
X-Gm-Gg: ASbGncvZaVwTi3jK7nOC/IrRBB+E9HWQoF4wA72oVBua6LxJmYtHnSv5j5DBUjNfaEt
 GYSUrKJzHpXwSztF7z2/HZhfeHFE40/9CHGEXTFusaYoQ1FceI8JmSUSSaG2syhePXbpoegJK5Z
 mLjvB7CSeyrgMJ57XR8AuUJz4NWwKfpxxHx0J1RweC5D83H7dVFfrO9PaZ1rhhFrON444yUfPAN
 RoIFiltwQuKYpxgIjK9KPd2uUkZn8hrRws4Gg==
X-Google-Smtp-Source: AGHT+IGJVja+BOlBDSueHM4xwgtmGAcntpknGmQBU6g6I7fWUhaq1g+6fNhuHcvRNLAtk8WzaUNpyzvQMZ0Hf40qYp8=
X-Received: by 2002:a05:6214:5290:b0:704:95c6:f5f1 with SMTP id
 6a1803df08f44-707205c02c1mr132327006d6.34.1753690625039; Mon, 28 Jul 2025
 01:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <687e09e3.a70a0220.693ce.00eb.GAE@google.com>
In-Reply-To: <687e09e3.a70a0220.693ce.00eb.GAE@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 28 Jul 2025 10:16:28 +0200
X-Gm-Features: Ac12FXyuIo8mg0__JhxicCkBMBx-2UyW5BATXdwFGTnJezh5fbSE4P26Te_FKXc
Message-ID: <CAG_fn=WSae7yjaHh=_iUc7eFALHX1vLQFMw8ryfas4-ijgFTiQ@mail.gmail.com>
To: john.johansen@canonical.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.46; envelope-from=glider@google.com;
 helo=mail-qv1-f46.google.com
X-Mailman-Approved-At: Wed, 30 Jul 2025 07:10:43 +0000
Subject: Re: [apparmor] [syzbot] [apparmor?] linux-next test error: WARNING
	in apparmor_unix_stream_connect
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
Cc: sfr@canb.auug.org.au, paul@paul-moore.com, john@apparmor.net,
 apparmor@lists.ubuntu.com, jmorris@namei.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-security-module@vger.kernel.org,
 linux-next@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, Jul 21, 2025 at 11:35=E2=80=AFAM syzbot
<syzbot+cd38ee04bcb3866b0c6d@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:

John, do you have an idea what's going on?
This is pretty likely to be related to your "apparmor: make sure unix
socket labeling is correctly updated." patch.


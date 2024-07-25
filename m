Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 433F293CAD1
	for <lists+apparmor@lfdr.de>; Fri, 26 Jul 2024 00:23:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sX6rm-0007d0-Dl; Thu, 25 Jul 2024 22:23:18 +0000
Received: from mail-ed1-f48.google.com ([209.85.208.48])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <torvalds@linuxfoundation.org>)
 id 1sX4oU-0005La-BI
 for apparmor@lists.ubuntu.com; Thu, 25 Jul 2024 20:11:46 +0000
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5a2ffc3447fso1625053a12.1
 for <apparmor@lists.ubuntu.com>; Thu, 25 Jul 2024 13:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721938306; x=1722543106;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HYXza095pMOoHpnczk24pBNsoS9nyihsTN3J/3umgZw=;
 b=vX7LmQhf+HkgpNmABkT/dYWpuvv+t+ddJY7zAu4HLA92kttD2AGgzyZb81U1Cntsxz
 21zu2Dl7e9RH/vTIAhzo9Z/mOSecUx0TIOP+kslizHG21tErNK/5INTOUzUU3OF/jhQl
 IyBQ9A4Ir53U6nIa/OH9glP2/x0neG5mV90qEKu+uvuB+DwFxdtGQM4urRFRoBESRy2a
 PUyCdRzW5wlxE7jhbseWEd2ydLXwzivlSKWaqdyac+fo3CF82zZ/SWKJekKYBtWPDw3w
 I7HRxQzw4YktV8DjECdizmsE9dMt0Das3O2y03BDF0lqMp54adNyn3RPDoknC1W9l2ki
 rLkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt75UMSxdVmWJTcTbp408s2zwHHMwiBI2ixsJMZvY7D2NkF16jkvElKyAl0Zzw0zM3NYpyi6+GsxnWMo0NNWaTFYvv5cOdE0Md
X-Gm-Message-State: AOJu0YzlKILOol0Fm9sDee71/+iFuajt5SiHFSSC/0aBL39ix0BinpeX
 yVAQd0kheYJpGwWHn1sbK9nouj/mqo6V6ptH3sW23swnf1okhY6HcNZA3Z9mxpgjrlRwRfja6rk
 Wgok=
X-Google-Smtp-Source: AGHT+IFL8GEfuLIGc6+Y+DLHzequZUwp44cqPWDeeHJXu4FF4IbaYDKWs5+oc/6rb4nLiEHETZY/og==
X-Received: by 2002:a17:907:9403:b0:a7a:bc34:a4c4 with SMTP id
 a640c23a62f3a-a7acb8232e5mr262302066b.48.1721938305707; 
 Thu, 25 Jul 2024 13:11:45 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab260besm103912066b.4.2024.07.25.13.11.44
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jul 2024 13:11:45 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5a156557026so1635789a12.2
 for <apparmor@lists.ubuntu.com>; Thu, 25 Jul 2024 13:11:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUIj14O9tPZEPIOR6xZugGmgEl3IngkjINSJgo8pbnZl9Rcz1oeFPVFZ4g0ul73GfJmKWuDAXRABjmTo8rJOVpoVgknJk2UFyLS
X-Received: by 2002:a50:a686:0:b0:5a1:1:27a9 with SMTP id
 4fb4d7f45d1cf-5ac63b59c17mr2468749a12.18.1721938304541; 
 Thu, 25 Jul 2024 13:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20240724210020eucas1p2db4a3e71e4b9696804ac8f1bad6e1c61@eucas1p2.samsung.com>
 <20240724210014.mc6nima6cekgiukx@joelS2.panther.com>
In-Reply-To: <20240724210014.mc6nima6cekgiukx@joelS2.panther.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 25 Jul 2024 13:11:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiHHDGQ03qJc+yZKmUpmKOgbz26Tq=XBrYcmNww8L_V0A@mail.gmail.com>
Message-ID: <CAHk-=wiHHDGQ03qJc+yZKmUpmKOgbz26Tq=XBrYcmNww8L_V0A@mail.gmail.com>
To: Joel Granados <j.granados@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.208.48;
 envelope-from=torvalds@linuxfoundation.org; helo=mail-ed1-f48.google.com
X-Mailman-Approved-At: Thu, 25 Jul 2024 22:23:16 +0000
Subject: Re: [apparmor] [GIT PULL] sysctl constification changes for
	v6.11-rc1
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
Cc: Kees Cook <kees@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-sctp@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 mptcp@lists.linux.dev, lvs-devel@vger.kernel.org, coreteam@netfilter.org,
 Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org,
 bridge@lists.linux.dev, apparmor@lists.ubuntu.com, linux-xfs@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 =?UTF-8?B?VGhvbWFzIFdlae+/vXNjaHVo?= <linux@weissschuh.net>,
 linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, 24 Jul 2024 at 14:00, Joel Granados <j.granados@samsung.com> wrote:
>
> This is my first time sending out a semantic patch, so get back to me if
> you have issues or prefer some other way of receiving it.

Looks fine to me.

Sometimes if it's just a pure scripting change, people send me the
script itself and just ask me to run it as a final thing before the
rc1 release or something like that.

But since in practice there's almost always some additional manual
cleanup, doing it this way with the script documented in the commit is
typically the right way to go.

This time it was details like whitespace alignment, sometimes it's
"the script did 95%, but there was another call site that also needed
updating", or just a documentation update to go in together with the
change or whatever.

Anyway, pulled and just going through my build tests now.

              Linus


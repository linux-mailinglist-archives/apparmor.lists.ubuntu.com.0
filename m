Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 713C33C7345
	for <lists+apparmor@lfdr.de>; Tue, 13 Jul 2021 17:30:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1m3KMB-0006vp-QZ; Tue, 13 Jul 2021 15:29:59 +0000
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <sswarnas@gmail.com>) id 1m3KMA-0006vg-PT
 for apparmor@lists.ubuntu.com; Tue, 13 Jul 2021 15:29:58 +0000
Received: by mail-pf1-f182.google.com with SMTP id m83so12299993pfd.0
 for <apparmor@lists.ubuntu.com>; Tue, 13 Jul 2021 08:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=730ih8veRz1wTWNfid5QI3rfJPhpqtJ1dPAPyQy1nlw=;
 b=QCWst0Ca9mHreQvRzGBJPMTKAYWfHGcMBqeZTxsY+F+luxOTZYILv2ICE04Sdr3vOa
 c2XH1k+jQuTJBS9conpPiuGAa2xVeM4IeH0EKpxTd9OzAAAn+gChokYijkpOZtWO+FNs
 BZkXy6OCcEyADfMHMS/ZhwuapEbhv+KQulJLU2Ex49WDEJjfH/9o2RPVSpNxOhy92J4I
 AygtmC9H4nx/gP1i9obDkrqZ7NH/4rxk07kYYvbZAOjljT8Rs1s6YE+2IJphydnGMxUa
 BCl8plv4trlwVVB83Jl4FWbcK6Y/SG81Y94Pdh9UYQVEWRJmeBOJatXvmOt7BPChL71p
 70ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=730ih8veRz1wTWNfid5QI3rfJPhpqtJ1dPAPyQy1nlw=;
 b=gXjBWFII7GCPVjq/paeKhsi0QmccTuv6WpMnKIM79DGuHGAJVclo4jQPeVGc+KK/h8
 sr6DsnJDz7PNoAdXWZ3BgKoRjgjZ9jIpQk6CtnhWdaLEFnsB2DAnr1aau6WjfvkXjEeK
 PBuH59P7t0afiVIUm+vSud6vowKzuK4IKmvvn7onQiccaQDScGIEr59rmPeL9WqRr5p1
 y9bxzuLgadbxEUoiptigC76zHcWGOEA1zYvubFrbZvmmEGPLW4IGJ1ULLLhang8M971D
 cjaYTnW5adI0f6B536eQ4yRL43AfGjOvjXgDOWBAbLIdTJisJy9A5gDE8nlo4Zj60qvt
 0jDQ==
X-Gm-Message-State: AOAM530AJClpyXCTQL4mXOpVQLfeJaw10C0a0kfwQQo999/y7du2Qt9B
 5FabrWMeW+6HmCnecATMWZ5eexda4YtXZJ8j+Yt3BkP+AoU=
X-Google-Smtp-Source: ABdhPJyhJ5zvn0IPsqiPDfZnbsEVUXM2ENB8sfKrsy9vHvlUJls0Y0fr+BYxSI0oIyQtK9PB7+8GwBm/UqLrabQQaQo=
X-Received: by 2002:a63:338d:: with SMTP id z135mr4817520pgz.314.1626190195903; 
 Tue, 13 Jul 2021 08:29:55 -0700 (PDT)
MIME-Version: 1.0
From: swarna latha <sswarnas@gmail.com>
Date: Tue, 13 Jul 2021 11:29:44 -0400
Message-ID: <CAJs3c4ycmJ-7QPHBSFOET+gomO4Svd953ELRs8s=T=f9L5xPUA@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.210.182; envelope-from=sswarnas@gmail.com;
 helo=mail-pf1-f182.google.com
Subject: [apparmor] Regarding apparmor logging
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
Content-Type: multipart/mixed; boundary="===============6556617083989139666=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============6556617083989139666==
Content-Type: multipart/alternative; boundary="000000000000f6cf2e05c702e801"

--000000000000f6cf2e05c702e801
Content-Type: text/plain; charset="UTF-8"

Hi,

I would like to redirect the apparmor logs from journalctl to my log file,
so that i
get only apparmor logs, i can act on.

Can you please let me know if there is any config option for this, or point
me to the code where I can specify my log file.

Thanks in advance,
Swarna

--000000000000f6cf2e05c702e801
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div><br></div><div>I would like to redirect the ap=
parmor logs from journalctl to my log file, so that i</div><div>get only ap=
parmor logs, i can act on.</div><div><br></div><div>Can you please let me k=
now if there is any config option for this, or point me to the code where I=
 can specify my log file.</div><div><br></div><div>Thanks in advance,</div>=
<div>Swarna</div></div>

--000000000000f6cf2e05c702e801--


--===============6556617083989139666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============6556617083989139666==--


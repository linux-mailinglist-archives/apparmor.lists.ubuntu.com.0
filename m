Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B540836272E
	for <lists+apparmor@lfdr.de>; Fri, 16 Apr 2021 19:49:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lXSag-0004QM-FO; Fri, 16 Apr 2021 17:49:14 +0000
Received: from mail-lj1-f171.google.com ([209.85.208.171])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1lXSaa-0004Q8-4n
 for apparmor@lists.ubuntu.com; Fri, 16 Apr 2021 17:49:08 +0000
Received: by mail-lj1-f171.google.com with SMTP id u20so31963978lja.13
 for <apparmor@lists.ubuntu.com>; Fri, 16 Apr 2021 10:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Cc5YOpdGiDgQ4NrRoHOTJyGYiFDCGNeOGwOWp2m+9eU=;
 b=vg+BeJtW9uBjbQZmmdczeOcWmFufrtfYKu9C1kR5TNcBEn8zQ8fJRp50tUC2Pb4P9L
 ZPbDvONVMHIiE7YFfNnYSr5+G4suTEWYMMVujY5RI5Doap2kCVPzzryB5PND9L22ZCkm
 AUXkC1H5X8XIqycyhPN1Yph5Oe6HOU+EcU5gtGYl97haDdp8URZU3yLBEyGnwLwCi57p
 O1SNIE92LpXSFSX3oV2UWJbRR3ItljowIcpuyGTI/w/XD8G88CBcV9IlOAWe3n7CvJN4
 5RTy8h4g8AusRrRlBDPNmPslR9WkZRxF9NyMryOSsAca4CrPX6bpU7nntZa9sFQyAL7V
 JSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Cc5YOpdGiDgQ4NrRoHOTJyGYiFDCGNeOGwOWp2m+9eU=;
 b=gn21tEEljlvTY0M5yqNQQMynwPywcy6Y8vCytroJNM9TjG4Lr29DqoVj38ZLGoGEuP
 SqOh/ipm/q4MxtE+NgP/ronk4hHCCc+DY7YcjVmu45XOePSa7siRaS2XLwqNP9gunAsD
 OqLIxV2H2oeaPFPSEBp4iIfpAdTQ/YsLdn55TWyLum+vRp9Mo4Hpn5SZt4fOcFVpLchp
 E7A39W/y5M5MVAppIcjrWO/U/lZiLfIC+A8HeOYALvOvygXv4nQZpYFhu26up5b8szpQ
 OKj6xaep0WlgMPZ49BUB/IQu78g9g5kKlo1vlj7X08rKpnDL+4dtl60zPkq181Y4XeEg
 V8yg==
X-Gm-Message-State: AOAM532ju0y/WYPiea7cn9ITj/oV1CjiZYjXdIuzDslVC8GRaaXqLBGX
 FX1rrnPHCxkkdEsbjj5QIYm8W2yCx/9bpj9wGcMn6XX4LJA=
X-Google-Smtp-Source: ABdhPJwnrwQxCywZ4hFskZ0xLkL7AV6Fa4c7k0CHc01n/U319CH+n9RVjNql6T5RYvUrk7zTT508c2SAY75GaBqkSRM=
X-Received: by 2002:a2e:2206:: with SMTP id i6mr3394095lji.273.1618595346555; 
 Fri, 16 Apr 2021 10:49:06 -0700 (PDT)
MIME-Version: 1.0
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Fri, 16 Apr 2021 23:18:55 +0530
Message-ID: <CAODFaZ4afdxmm8b0oTTerRWZr+=2LW6_ueT6Y3HuL=mdYRs84A@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.208.171;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lj1-f171.google.com
Subject: [apparmor] Apparmor: Profile optimization
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

SGkgQWxsLAoKV2UgaGF2ZSBvYnNlcnZlZCBmZXcgY29uZmlndXJhdGlvbiBmaWxlcyBhcmUgcHJl
c2VudCBpbiAvdG1wIHdoaWNoIGFyZQpuZWVkZWQgZm9yIGNlcnRhaW4gcHJvY2Vzc2VzLgpGb3Ig
ZXhhbXBsZSwgZmV3IG9mIHRoZSBmaWxlcyBhcmUgaGlkZGVuIGZpbGVzIGxvY2F0ZWQgaW4gL3Rt
cC8uCgpJbiB0aGF0IGNhc2UsIHNoYWxsIHdlIGFkZCBiZWxvdyBlbnRyeQoKL3RtcC8qKiBydywK
Cm9yIERvIHdlIG5lZWQgdG8gYWRkIGVudHJpZXMgZm9yIGZpbGUgc3BlY2lmaWMgYXMgYmVsb3cK
Ci90bXAvZmlsZS50eHQgciwKL3RtcC8uaW5pdF9jb21wbGV0ZSBydywKCldoaWNoIHdvdWxkIGJl
IHRoZSBiZXN0IHdheSBmb3Igc2VjdXJpdHkgY29uY2VybiBlc3BlY2lhbGx5IGZvcgplbWJlZGRl
ZCBkZXZpY2VzID8KUGxlYXNlIGFkdmlzZS4KClRoYW5rcwpNdXJhbGkuUwoKLS0gCkFwcEFybW9y
IG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBv
ciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGlu
Zm8vYXBwYXJtb3IK

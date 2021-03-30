Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF0634F034
	for <lists+apparmor@lfdr.de>; Tue, 30 Mar 2021 19:54:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lRIZF-0003Oj-QT; Tue, 30 Mar 2021 17:54:17 +0000
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1lRIZC-0003Oc-Dh
 for apparmor@lists.ubuntu.com; Tue, 30 Mar 2021 17:54:14 +0000
Received: by mail-lj1-f174.google.com with SMTP id o16so6832241ljp.3
 for <apparmor@lists.ubuntu.com>; Tue, 30 Mar 2021 10:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=vg6T2G1hcUGTit4UOlLU1uhM8SoT3vmcFO07XYxDKe8=;
 b=RkLcPlGuSG9sYga81+vodfjthxeVCLf/P4zIQZliNYgdtaX2E7OJ5vk32tHhQfemPd
 UTL8buiyB1S+gXM8tsIpB2Gk21N3+xy0cYGpKXQV2s9zwEsYMrYemyusuY55aFm8ClSK
 So3nyukskdvbiJ9Qi61w9kQpY57foJA5TgxJuopIJ0csHeETw6KdVo7IzoTN5TZbhoBF
 Wu0jd0wr7/3BOH7YUDionRE7N0jj2Kt8vwOG6uWz/X0pyoGvT6kFxWLI7nxzf+Th6srn
 r4vivzOUCqTiQ6XB5GFKhT4UCLQFbg3pKtriYYZklQessWodGsD0OJdYa+Az8fq67msU
 ACHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vg6T2G1hcUGTit4UOlLU1uhM8SoT3vmcFO07XYxDKe8=;
 b=pFy2SFjCG/UYF6RawT/nqaOiXC4Pud4EOWhjLWhvwtpXB68PhP6dhOX9FrJC/VIxeb
 08GjaTPR6ye+TIOnoUFb/muEk8Hjzt3vKsWzM0d3pxduMqQ1bMbFar8eqE+mN9TTTHj0
 +oqdngG/y//vNFh76AWITDO3fU2nBxxfF/5HFOUUaHmure2Rr27vINUypIMc7lCQwkLm
 U5cWFFyl9idmfLgTVHPI7ptSxViMj3k9b/cuy4OBN1n9L+Pwry16DnDEWbXX9NbUQoV5
 iX3gXgHo6OMc1YM7SXnt4LNLg07s5DfAQPvrHLqVm0V7rWTatHxe0bAcCvR7vBknamPV
 Ug0g==
X-Gm-Message-State: AOAM5335TID1d6VTNNrXEY4+4dugtnofpiitGG/YnrqwbGu6GGc+2wsN
 R5spUE4mTgI4Wy3wPclU5THbLDXjvCUcRoIII7Y3zXpw4hs=
X-Google-Smtp-Source: ABdhPJwFZTZBjUee0gQBQsM3RjlPytbz8mTRuJKuOAk7+JN7IBYQNEuECHgmUU0h12GfhLCJGCOB4nzka7IATtRCQU4=
X-Received: by 2002:a05:651c:212a:: with SMTP id
 a42mr21252785ljq.505.1617126853217; 
 Tue, 30 Mar 2021 10:54:13 -0700 (PDT)
MIME-Version: 1.0
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Tue, 30 Mar 2021 23:24:01 +0530
Message-ID: <CAODFaZ7317Aop=dzf+_BuFSqNQ-4BjLCv5AnwhC=y5BGQGfB7w@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.208.174;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lj1-f174.google.com
Subject: [apparmor] Reg.Apparmor vs Hardening
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

SGkgQWxsLAoKQXMgcGVyIG15IHVuZGVyc3RhbmRpbmcgd2l0aCB0aGUgaGVscCBvZiBBcHBhcm1v
ciBwcm9maWxlIHdlIGFyZQpyZXN0cmljdGluZyB0aGUgYWNjZXNzIHRvIHRoZSBwcm9jZXNzIGlu
IHRlcm1zIG9mCml0cyByZXNvdXJjZXMvbmFtZXNwYWNlcy4KCkl0IGxvb2tzIHNpbWlsYXIgdG8g
aGFyZGVuaW5nIHdoZXJlIHdlIGFyZSByZXN0cmljdGluZyB0aGUgcmVzb3VyY2VzIHRvIHByb2Nl
c3MuCgpEb2VzIGl0IG1lYW4sIHRlY2huaWNhbGx5IEhhcmRlbmluZyBhbmQgQXBwYXJtb3IgcHJv
ZmlsZXMgbG9vayB0aGUKc2FtZSBvciBkaWZmZXJlbnQ/IENhbiB5b3UgcGxlYXNlIHNoYXJlIHlv
dXIgY29tbWVudHMuCgpUaGFua3MKTXVyYWxpLlMKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QK
QXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUg
YXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

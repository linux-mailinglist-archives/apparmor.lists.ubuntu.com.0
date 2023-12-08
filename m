Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF9180A211
	for <lists+apparmor@lfdr.de>; Fri,  8 Dec 2023 12:21:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rBYui-0005Zw-3g; Fri, 08 Dec 2023 11:21:00 +0000
Received: from mail-4022.proton.ch ([185.70.40.22])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <alexandre@pujol.io>)
 id 1rBYuS-0005ZQ-FG
 for apparmor@lists.ubuntu.com; Fri, 08 Dec 2023 11:20:46 +0000
Date: Fri, 08 Dec 2023 11:20:28 +0000
To: apparmor@lists.ubuntu.com
From: Alexandre Pujol <alexandre@pujol.io>
Message-ID: <e17adca2-97ed-49d4-9c28-f6d495259881@pujol.io>
In-Reply-To: <a0e4e1ce-0a2e-4deb-9abb-8c6a149ef14d@canonical.com>
References: <8cc5da00-8ad0-49ce-b475-75537e03b7f3@pujol.io>
 <a0e4e1ce-0a2e-4deb-9abb-8c6a149ef14d@canonical.com>
Feedback-ID: 84792040:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] what is the best way to write apparmor dbus rules
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Thanks John,

Following your advice, I rewritten all my old dbus rules. I have added=20
over 30 new dbus specific abstractions [1]. As I have the endpoint, they=20
are all labelled with they corresponding apparmor profile. These=20
abstractions should be used by profiles that simply need to talk to a=20
given interface, so I restricted the allowed method.

For example, most common polkit communication can be allowed with:
```
   include <abstractions/bus/org.freedesktop.PolicyKit1>
```

They will be still some polishing work to do but we finally have a good=20
base.

[1]:=20
https://github.com/roddhjav/apparmor.d/tree/main/apparmor.d/abstractions/bu=
s

Regards,
Alex



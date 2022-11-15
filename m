Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F73629C23
	for <lists+apparmor@lfdr.de>; Tue, 15 Nov 2022 15:31:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ouwy3-0004B1-CC; Tue, 15 Nov 2022 14:31:15 +0000
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <sonixxfx@gmail.com>) id 1ouwy1-0004Aj-DG
 for apparmor@lists.ubuntu.com; Tue, 15 Nov 2022 14:31:13 +0000
Received: by mail-pf1-f182.google.com with SMTP id b29so14229632pfp.13
 for <apparmor@lists.ubuntu.com>; Tue, 15 Nov 2022 06:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tZaCR5fW6ZAnPi0P4W6YUW069/1GQZ3W2oGq2a2OWgs=;
 b=CcierRXY/fw0SGZ/e5RKRBZNfWlMzCzdtVWbwkcsAvA4GXSk7YGmtwvT7SikMKV5wO
 kb7MunWhWJ/9tdUNnHB77Kzn8DTXQGnj+CSZf49LRRq3B3y/EhwnOLbZ5TFSF0W4z8cV
 GEhltAWvzLByb6isZ3llrfLHFbJezU49cuDBm9qJ3Uw86hleleYIMqXtw1U+N6tOsCaH
 MymEH0wYlCnWiUYhrmC5pVX6v4AMHWvU8Xz/8zIt77UVf2ypqZw/RM9tyqLjEa6GmOom
 mpfdsaMkGThA/GwWtRXHhLr21Xl2zH+APgqVvcsOK/1RzairrL2vfMXr8ECYLjRAddxy
 Bntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tZaCR5fW6ZAnPi0P4W6YUW069/1GQZ3W2oGq2a2OWgs=;
 b=B6GZzsCQjeRY5Uix9k5nsae7OPgOSLh5T/fdRDcZhOSXKTZQ3K0NQtKQ9DFsixqrRH
 RF+2cVwHJRN9dCWvwHXi5Sa+Fb5bwp40kHhGMj5IKY5fxzzPqvDTSyQ8PrGTrFwo3YvP
 TtDPJTz/M3yV4KQoTUSGETlxLzKvB4OjGNLgrKNMyeVzdmctyShiJtyrWbuCI8lI0xZm
 cAryaVHcSukKVvcerAtfW0twS107L2uzNefuqrhQJnkA51NmLhOQYgn+4ig/bME8p+jA
 DFDeXLdC6OGadWOLw6x8oskfShStPMy8ag9i4tydVUmE1NshDDRyocwSPqkS/PirOpp5
 OWGw==
X-Gm-Message-State: ANoB5pkz3zumdaAs9R2sKnjOr0FxgzxR0xHFLrJrVB6Xh3cqCj2SvpVs
 k/il+OW0Ow6yCPclheK84Tm6dfkewlgPjpgyd0n6t03tNBMLOw==
X-Google-Smtp-Source: AA0mqf45yaaD0DxbpszyAzBny8ZS34pqonH6fT1puTpwOYMNVpr4sCbkyBNjAL/kL7WLX28c2FwH5W8e4asmoN/HV2g=
X-Received: by 2002:a65:620e:0:b0:43c:6413:322c with SMTP id
 d14-20020a65620e000000b0043c6413322cmr16415613pgv.472.1668522671078; Tue, 15
 Nov 2022 06:31:11 -0800 (PST)
MIME-Version: 1.0
From: Sonixxfx <sonixxfx@gmail.com>
Date: Tue, 15 Nov 2022 15:30:59 +0100
Message-ID: <CAKO675mVM316f3jdy+6Fz4MKAkKP+rmEJKqhGPiBPiuM=3jAzQ@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: multipart/alternative; boundary="0000000000001c029f05ed8335fe"
Received-SPF: pass client-ip=209.85.210.182; envelope-from=sonixxfx@gmail.com;
 helo=mail-pf1-f182.google.com
Subject: [apparmor] Snaps are blocked by Apparmor on Ubuntu 22.04
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

--0000000000001c029f05ed8335fe
Content-Type: text/plain; charset="UTF-8"

Hi,

I was trying Apparmor today, but now my snaps won't run anymore. I have
tried a couple of things to solve it, including disabling Apparmor, but it
didn't help.
When i try to start Brave for example dmesg shows me:

brave_brave.desktop[9095]: snap-confine has elevated permissions and is not
confined but should be. Refusing to continue to avoid permission escalation
attacks
brave_brave.desktop[9095]: Please make sure that the snapd.apparmor service
is enabled and started.

These messages are also shown when I have Apparmor enabled and started.

Can someone tell me how I can resolve this?

Thanks,

Ben

--0000000000001c029f05ed8335fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I was trying Apparmor today, but no=
w my snaps won&#39;t run anymore. I have tried a couple of things to solve =
it, including=C2=A0disabling=C2=A0Apparmor, but it didn&#39;t help.</div><d=
iv>When i try to start Brave for example dmesg shows me:</div><div><br></di=
v><div>brave_brave.desktop[9095]: snap-confine has elevated permissions and=
 is not confined but should be. Refusing to continue to avoid permission es=
calation attacks<br>brave_brave.desktop[9095]: Please make sure that the sn=
apd.apparmor service is enabled and started.<br></div><div><br></div><div>T=
hese messages are also shown when I have Apparmor enabled and started.</div=
><div><br></div><div>Can someone tell me how I can resolve this?</div><div>=
<br></div><div>Thanks,</div><div><br></div><div>Ben</div></div>

--0000000000001c029f05ed8335fe--


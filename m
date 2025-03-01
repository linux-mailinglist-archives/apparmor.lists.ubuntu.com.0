Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C24A4AB1A
	for <lists+apparmor@lfdr.de>; Sat,  1 Mar 2025 14:02:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1toMU7-00049T-2d; Sat, 01 Mar 2025 13:02:27 +0000
Received: from mail-lf1-f49.google.com ([209.85.167.49])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <vindrg@gmail.com>) id 1toMU5-00049J-6q
 for apparmor@lists.ubuntu.com; Sat, 01 Mar 2025 13:02:25 +0000
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5485646441cso2989042e87.2
 for <apparmor@lists.ubuntu.com>; Sat, 01 Mar 2025 05:02:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740834144; x=1741438944;
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4H2sTOl9qw+sHLZcIjVvfI8Y0sb/0r1z+BlKbjqJ/PY=;
 b=AHAdEa8LDULdM8cmSBP4fF4SEGFZJaIcSZ2z13vGIcvMFf7Hk50pTha2bfA5PBUDpC
 zaJrrc3UXr9he4uZqyTuVMaRRnrc+kArOCXo9yQ/6rXYbcopi1oxJN0/cWP0plsBIDGV
 U+fyhVyA92zP4B/c49mDsISCkAKptWAkqg5JbdaVjbIcBwbbxdxddX4fvmmnCz/+g08H
 HaGyKN1P8DWXNfSXyFen95iUX1HFL7+zDtbTMRgm4F51L1aLlq14LN+vTw/oi9fd/6Fk
 9sWOdwX1UYH+NhYu04JmgepVOSFiLYbv/z9dgKLvPp++mmS72rMPrIo46Ay6AU9KDuLQ
 fqUg==
X-Gm-Message-State: AOJu0YxhcwG77Br69qO57fPODymyJbP8dj8PyTqJ2/TM+3a26ok0AyK/
 hTDBBfsHM0S8hT1QBwXEG+lRf/6q41HS+hpN6BBL9h5cWxuKmEukKMJUCdRk
X-Gm-Gg: ASbGncs5e6hF2vNwq6i1kHC7MKDyN3b5nK5Ca4wH4casqDD4IiKx1n2UvzUv438mrfx
 tE9T/G4B9uHN715mBSG9kixaoMqY6704zmamK6U9LSoWsTdBVZmRPaS/bKnEthYXvr+r0gfyDbX
 43f4NCL3PaBmK0B0qxnAykSru6YjiklESSaVjoM5xrp8hpz4JDlsLTdKXrkE7t7BnM5BsTSFCsQ
 9hNhlanlStcinGOnwau3mdvvrobDnmzEjcU9g2wUMiXs1Y2mj0ujeVYZt7rQ5cn6UK4djcSHa0D
 AuyKynmBS6Ik3yx0FjOp4o3pDkJDZE8HLzNgpFQM/NNlrUvbdwIyOg==
X-Google-Smtp-Source: AGHT+IFwZni546/C2d7CcgnTZLffToDTK7uZgSq8wDh1tDhvjQA3fEmygtLnEomRkm5F3Ez2JlZh/A==
X-Received: by 2002:a19:5516:0:b0:549:5769:6afc with SMTP id
 2adb3069b0e04-54957696cd6mr1774575e87.3.1740834143761; 
 Sat, 01 Mar 2025 05:02:23 -0800 (PST)
Received: from [192.168.1.10] (mail.dargis.net. [62.80.227.49])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494e52a47asm540844e87.152.2025.03.01.05.02.22
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Mar 2025 05:02:23 -0800 (PST)
Message-ID: <dc80dadc-3ebd-4a63-a13a-6427d91d4908@gmail.com>
Date: Sat, 1 Mar 2025 15:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
Content-Language: en-US
From: Vincas Dargis <vindrg@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.167.49; envelope-from=vindrg@gmail.com;
 helo=mail-lf1-f49.google.com
Subject: [apparmor] What's about all these new "uncofined" profiles with
	just "userns"?
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

Hi,

After some AppArmor upgrade in Sid I've discovered that "firefox" profile is now duplicate.

Also, started to see some strange "flatpak", "busybox" errors in bash terminal...

1. Apparently, now there are bunch of new profiles, like /etc/apparmor.d/firefox, that conflicted with my own 
/etc/apparmor.d/usr.bin.firefox.

2. Apparently, my long-practiced "tradition" to invoke `aa-enforce /etc/apparmor.d/*` after every apparmor[-profiles] 
package upgrade (due to usr.bin.ping-and-friends becoming "complain" again), is now seemingly ill-advised? Enforcing all 
these new, almost-empty "uncofined" profiles makes sort of havoc...

So,

a). Could some one please bring me back into the loop, what's it all about?

b). How should user enable proper custom firefox profile correctly?

	aa-disable /etc/apparmor.d/firefox, and enforce /etc/apparmor.d/usr.bin.firefox?

	Or overwrite /etc/apparmor.d/firefox after every upgrade?

	Or is there some sort of new overriding feature I don't know to make these new profiles inactive while custom one active?

Thanks.


[0] 
https://salsa.debian.org/apparmor-team/apparmor/-/blob/8c785a5fb707253fb46213e0648d19b64631de83/profiles/apparmor.d/firefox




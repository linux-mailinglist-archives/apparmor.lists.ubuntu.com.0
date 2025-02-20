Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 026E4A3E1AB
	for <lists+apparmor@lfdr.de>; Thu, 20 Feb 2025 18:00:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tl9uQ-0007TR-MV; Thu, 20 Feb 2025 17:00:22 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tl9uO-0007RR-JE
 for apparmor@lists.ubuntu.com; Thu, 20 Feb 2025 17:00:20 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1A3413F27D
 for <apparmor@lists.ubuntu.com>; Thu, 20 Feb 2025 17:00:20 +0000 (UTC)
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5e08dfe2283so1211487a12.2
 for <apparmor@lists.ubuntu.com>; Thu, 20 Feb 2025 09:00:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740070819; x=1740675619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1+R5dSnLmkLrCSsHubsYPGzyhiMbEqSaxQd2VPje36U=;
 b=QG5gmp1pFn4kQNVyCV+/NaojJX9s7CwlceOXEy3WskKEy4FtqoCrlR+02uxQw/llEo
 AYAsrhi8qeCaWg8crQaCVKqaRtq6KqYnpI4yNANo0+gPdgTwTjd+wADNaosb6lRV8VOd
 7UzSkpqp3Wg7DZfLjv4q2s8wslcfm5erPQBokGovBBLQ0VoFGsE4s23K4mdO1jwyxo4E
 vQcaImKWNUxwsucwHF0VF8Eb9F+536i1f3WyHas4MI9P03oXvz8+aNRhl/obVMzx1yBp
 sBVnCUgNHHyqjhl1Jpk6nhYV7cbFH230SGwCqwZM898XQoGTxGib7KfXWfrf+JmoOGNF
 7zcQ==
X-Gm-Message-State: AOJu0YwAyRbrOoA1a8hCYRTkjbJ4RWxEVeTkgZQKvACdhd8ZBmb/WwMG
 fN5crovSjD+V/66g+ma1avy57UdXyCEwR3K3tVstuaylkFttx6orC61FuDSWEfp79zJdYErQzps
 phRTcEPzj57/0G5eL6gRtVfK5vuIJTlyViDwkXcch3HPpjD8VAbHFsKjz/i8svKKIR5t7CRMljU
 UjAOoOCBh3KI8Vqpgm0ElbNfn9vge133DV4CiShjYngTYwukXB
X-Gm-Gg: ASbGncvoa11BZ1W5oC4RlmPSQmBWOG3WZtNmgJxQskxYlHH9At4Yb/Z1XQ+YT+c/wQN
 Xf4RSXJPIVX7Jmvh2l4Mm9PuBC43aOz3bK31UYEzQaJJ4sPW4u2+JArxJLSHN
X-Received: by 2002:a05:6402:350d:b0:5e0:2d53:b2a with SMTP id
 4fb4d7f45d1cf-5e035ff9ca1mr60891879a12.3.1740070819509; 
 Thu, 20 Feb 2025 09:00:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHz+dmWaDRKx8X+cJe9rX+K+bCAB1tBWorQDZIAXwuRXn6rA1S1kT2cnosdwWmzFkCaOla9i8wsb/NBs4ZAaso=
X-Received: by 2002:a05:6402:350d:b0:5e0:2d53:b2a with SMTP id
 4fb4d7f45d1cf-5e035ff9ca1mr60891773a12.3.1740070819021; Thu, 20 Feb 2025
 09:00:19 -0800 (PST)
MIME-Version: 1.0
References: <CAM0LVXntUf3Cqid9dWZOtAoSyLVLJC+m5HUnoci3=JRbsWJC1A@mail.gmail.com>
In-Reply-To: <CAM0LVXntUf3Cqid9dWZOtAoSyLVLJC+m5HUnoci3=JRbsWJC1A@mail.gmail.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Thu, 20 Feb 2025 09:00:07 -0800
X-Gm-Features: AWEUYZlmMrKGaH0GPDSw4wPj_V55IBNfzJRngyCaig5M7CFR2wOli8DNFUzIk0Q
Message-ID: <CAKCV-6s5rz=3FpQ5MkSpn-B+VjaE5TpZFJ=_p6E1H5-LsQ-rnw@mail.gmail.com>
To: Jordan Esh <esh.jordan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] Ubuntu 25.04 wpa_supplicant profile requests denied
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
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi Jordan,

This is an issue that was reported in Launchpad at
https://bugs.launchpad.net/ubuntu/+source/apparmor/+bug/2098838. We
are aware of what's broken and am working on a fixed AppArmor package
that should resolve this breakage.

Ryan


On Thu, Feb 20, 2025 at 5:49=E2=80=AFAM Jordan Esh <esh.jordan@gmail.com> w=
rote:
>
> I have recently upgraded to Ubuntu 25.04 (Plucky Puffin) on my laptop, an=
d have been unable to successfully enable Wi-Fi.
> After doing some digging, it seems that the configuration in the wpa_supp=
licant profile for AppArmor might be the issue, as requests to create a net=
link socket and open the HW device are being denied.
> I'm new to AppArmor, but if somebody could point me in the right directio=
n, I'm happy to test some changes to the profile and open a PR on GitLab. A=
ny help would be greatly appreciated :)
>
> Device: ThinkPad-E470
> AppArmor: amd64 4.1.0~beta5-0ubuntu2
> Distro: Ubuntu 25.04
> Kernel 6.12.0-15-generic
>
> Relevant dmesg output:
>>
>> [ 8667.092192] audit: type=3D1400 audit(1740054455.567:405): apparmor=3D=
"DENIED" operation=3D"create" class=3D"net" profile=3D"wpa_supplicant" pid=
=3D13506 comm=3D"wpa_supplicant" family=3D"netlink" sock_type=3D"raw" proto=
col=3D0 requested=3D"create" denied=3D"create"
>> [ 8667.092289] audit: type=3D1400 audit(1740054455.568:408): apparmor=3D=
"DENIED" operation=3D"open" class=3D"file" profile=3D"wpa_supplicant" name=
=3D"/sys/devices/pci0000:00/0000:00:1d.3/0000:05:00.0/ieee80211/phy0/name" =
pid=3D13506 comm=3D"wpa_supplicant" requested_mask=3D"r" denied_mask=3D"r" =
fsuid=3D0 ouid=3D0
>> [ 8667.092303] audit: type=3D1400 audit(1740054455.568:409): apparmor=3D=
"DENIED" operation=3D"create" class=3D"net" profile=3D"wpa_supplicant" pid=
=3D13506 comm=3D"wpa_supplicant" family=3D"inet" sock_type=3D"dgram" protoc=
ol=3D0 requested=3D"create" denied=3D"create"
>> [ 9502.961011] audit: type=3D1107 audit(1740055291.439:410): pid=3D1323 =
uid=3D101 auid=3D4294967295 ses=3D4294967295 subj=3Dunconfined msg=3D'appar=
mor=3D"DENIED" operation=3D"dbus_method_call" bus=3D"system" path=3D"/fi/w1=
/wpa_supplicant1" interface=3D"org.freedesktop.DBus.Properties" member=3D"G=
etAll" name=3D":1.287" mask=3D"receive" pid=3D15679 label=3D"wpa_supplicant=
" peer_pid=3D13634 peer_label=3D"unconfined"
>
>
> wpa_supplicant systemctl status output:
>>
>> Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplicant[15679]: socket(PF_IN=
ET,SOCK_DGRAM): Permission denied
>> Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplicant[15679]: socket(PF_IN=
ET,SOCK_DGRAM): Permission denied
>> Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0: Fail=
ed to initialize driver interface
>> Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0: CTRL=
-EVENT-DSCP-POLICY clear_all
>> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: netlink: Fai=
led to open netlink socket: Permission denied
>> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: Failed to in=
itialize driver 'nl80211'
>> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: socket(PF_IN=
ET,SOCK_DGRAM): Permission denied
>> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: socket(PF_IN=
ET,SOCK_DGRAM): Permission denied
>> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0: Fail=
ed to initialize driver interface
>> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0: CTRL=
-EVENT-DSCP-POLICY clear_all
>
>
> NetworkManager systemctl status output:
>>
>> Feb 20 23:43:39 jordan-ThinkPad-E470 NetworkManager[16051]: <error> [174=
0055419.5700] device (wlp5s0): Couldn't initialize supplicant interface: GD=
Bus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplicant couldn't grab =
this interface.
>> Feb 20 23:43:49 jordan-ThinkPad-E470 NetworkManager[16051]: <warn>  [174=
0055429.5650] device (wlp5s0): re-acquiring supplicant interface (#2).
>> Feb 20 23:43:49 jordan-ThinkPad-E470 NetworkManager[16051]: <error> [174=
0055429.5660] device (wlp5s0): Couldn't initialize supplicant interface: GD=
Bus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplicant couldn't grab =
this interface.
>> Feb 20 23:43:59 jordan-ThinkPad-E470 NetworkManager[16051]: <warn>  [174=
0055439.5657] device (wlp5s0): re-acquiring supplicant interface (#3).
>> Feb 20 23:43:59 jordan-ThinkPad-E470 NetworkManager[16051]: <error> [174=
0055439.5714] device (wlp5s0): Couldn't initialize supplicant interface: GD=
Bus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplicant couldn't grab =
this interface.
>> Feb 20 23:44:09 jordan-ThinkPad-E470 NetworkManager[16051]: <warn>  [174=
0055449.5719] device (wlp5s0): re-acquiring supplicant interface (#4).
>> Feb 20 23:44:09 jordan-ThinkPad-E470 NetworkManager[16051]: <error> [174=
0055449.5763] device (wlp5s0): Couldn't initialize supplicant interface: GD=
Bus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplicant couldn't grab =
this interface.
>> Feb 20 23:44:19 jordan-ThinkPad-E470 NetworkManager[16051]: <warn>  [174=
0055459.5658] device (wlp5s0): re-acquiring supplicant interface (#5).
>> Feb 20 23:44:19 jordan-ThinkPad-E470 NetworkManager[16051]: <error> [174=
0055459.5712] device (wlp5s0): Couldn't initialize supplicant interface: GD=
Bus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplicant couldn't grab =
this interface.
>> Feb 20 23:44:19 jordan-ThinkPad-E470 NetworkManager[16051]: <info>  [174=
0055459.5713] device (wlp5s0): supplicant interface keeps failing, giving u=
p
>
>


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E83F17E3B27
	for <lists+apparmor@lfdr.de>; Tue,  7 Nov 2023 12:34:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1r0KM0-0002yP-UG; Tue, 07 Nov 2023 11:34:45 +0000
Received: from mail-4323.proton.ch ([185.70.43.23])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <alexandre@pujol.io>)
 id 1r0KLp-0002xg-VH
 for apparmor@lists.ubuntu.com; Tue, 07 Nov 2023 11:34:34 +0000
Date: Tue, 07 Nov 2023 11:34:07 +0000
To: apparmor <apparmor@lists.ubuntu.com>
From: Alexandre Pujol <alexandre@pujol.io>
Message-ID: <8cc5da00-8ad0-49ce-b475-75537e03b7f3@pujol.io>
Feedback-ID: 84792040:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: [apparmor]  what is the best way to write apparmor dbus rules
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

Hi all,

I am working on rewriting dbus rules for the apparmor.d [0] projects.=20
And it let me to the general question on what is the best way to write=20
dbus rule in apparmor.

The current implementation could be summed up as simply adding to a=20
profile whatever dbus rule has been raised in the log. It is simple as=20
it is mostly automatic (thanks to `aa-log -r`). However, it can generate=20
a lot of rule [1] and, it is not maintainable.

I had a look at how dbus are managed on flatpak [2] and snap [3], and I=20
was wondering if a similar construction could be used in apparmor profile.

For instance, the profile polkitd [4] owns the interface=20
org.freedesktop.PolicyKit1*, so the rules in the polkitd profile could=20
be setup as:

```
   dbus (bind) bus=3Dsystem name=3Dorg.freedesktop.PolicyKit1,

   dbus (send,receive) bus=3Dsystem
        interface=3Dorg.freedesktop.PolicyKit1*
        peer=3D(name=3D:*),
```

while program sending request to polkitd could have rules such as:
```
   dbus send bus=3Dsystem
        interface=3Dorg.freedesktop.PolicyKit1*
        peer=3D(name=3D:*, label=3Dpolkitd),
```


I am not an expert in dbus at all, therefore I was wondering if such a=20
setup could be useful. Do we need more/less restriction in the rule? Do=20
any of you have other recommendations on how these dbus rules should be=20
managed.

Regards,
Alex

[0]: https://github.com/roddhjav/apparmor.d
[1]:=20
https://github.com/roddhjav/apparmor.d/blob/4df3f2e52f846d66dd9bf0e45dce406=
3e315005d/apparmor.d/groups/gnome/gnome-shell#L59-L462
[2]: https://docs.flatpak.org/en/latest/sandbox-permissions.html#gvfs-acces=
s
[3]: https://forum.snapcraft.io/t/the-dbus-interface/2038
[4]:=20
https://github.com/roddhjav/apparmor.d/blob/4df3f2e52f846d66dd9bf0e45dce406=
3e315005d/apparmor.d/groups/freedesktop/polkitd



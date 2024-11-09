Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEF99CD659
	for <lists+apparmor@lfdr.de>; Fri, 15 Nov 2024 06:00:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tBoRc-0002RK-Ct; Fri, 15 Nov 2024 05:00:32 +0000
Received: from mail.w13.tutanota.de ([185.205.69.213])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mikolaj_archusr@tutamail.com>)
 id 1t9jbh-0006hk-6s
 for apparmor@lists.ubuntu.com; Sat, 09 Nov 2024 11:26:21 +0000
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
 by mail.w13.tutanota.de (Postfix) with ESMTP id 71B633792604
 for <apparmor@lists.ubuntu.com>; Sat,  9 Nov 2024 12:26:20 +0100 (CET)
Date: Sat, 9 Nov 2024 12:26:20 +0100 (CET)
From: mikolaj_archusr@tutamail.com
To: Apparmor <apparmor@lists.ubuntu.com>
Message-ID: <OBFfBQm--R-9@tutamail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_276497_925656319.1731151580460"
Received-SPF: pass client-ip=185.205.69.213;
 envelope-from=mikolaj_archusr@tutamail.com; helo=mail.w13.tutanota.de
X-Mailman-Approved-At: Fri, 15 Nov 2024 05:00:30 +0000
Subject: [apparmor] Apparmor profile acting as in enforce mode when set to
 complain mode
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

------=_Part_276497_925656319.1731151580460
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,
I recently started experimenting with AppArmor and have successfully create=
d profiles for several applications. However, I encountered an issue while =
profiling Steam. Specifically, Steam fails to launch when AppArmor is enabl=
ed. Below is the error output from Steam:
```
steam.sh[204656]: Running Steam on arch rolling 64-bit
steam.sh[204656]: STEAM_RUNTIME is enabled automatically
setup.sh[204732]: Steam runtime environment up-to-date!
steam-runtime-check-requirements[206680]: W: Child process exited with code=
 1: bwrap: setting up uid map: Permission denied

steam.sh[204656]: Error: Steam now requires user namespaces to be enabled.

This requirement is the same as for Flatpak, which has more detailed
information available:
https://github.com/flatpak/flatpak/wiki/User-namespace-requirements
```

From the URL provided in the output, I quickly figured out It is an issue r=
elated to bubblewrap.

Below is the output of bwrap when it's profile is set to complain mode:
```
=C2=A0>> bwrap --bind / / --ro-bind /usr /usr --dev /dev --proc /proc --dir=
 /tmp --unshare-user
--unshare-net --unshare-pid /bin/bash --expose-pids
bwrap: setting up uid map: Permission denied
```

Here is the AppArmor profile I have configured for bwrap:
```
abi <abi/4.0>,
include <tunables/global>

profile bwrap /usr/bin/bwrap flags=3D(complain) {
=C2=A0 userns,

=C2=A0 # Site-specific additions and overrides. See local/README for detail=
s.
=C2=A0 include if exists <local/bwrap>
}
```

I also verified that `/proc/sys/kernel/unprivileged_userns_clone` is set to=
 `1`.
```
=C2=A0>> cat /proc/sys/kernel/unprivileged_userns_clone
1
```

From `/sys/kernel/security/apparmor/profiles` I can see that `bwrap` is set=
 to complain mode, so It should not be restricted in any way.
I suspect this may be an issue with my configuration rather than a bug in A=
ppArmor itself. If anyone has insights or suggestions for resolving this, I=
 would greatly appreciate your help.
Thank you in advance!

------=_Part_276497_925656319.1731151580460
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
<div dir=3D"auto">Hello,<br></div><div dir=3D"auto">I recently started expe=
rimenting with AppArmor and have successfully created profiles for several =
applications. However, I encountered an issue while profiling Steam. Specif=
ically, Steam fails to launch when AppArmor is enabled. Below is the error =
output from Steam:<br></div><div dir=3D"auto">```<br></div><div dir=3D"auto=
">steam.sh[204656]: Running Steam on arch rolling 64-bit<br></div><div dir=
=3D"auto">steam.sh[204656]: STEAM_RUNTIME is enabled automatically<br></div=
><div dir=3D"auto">setup.sh[204732]: Steam runtime environment up-to-date!<=
br></div><div dir=3D"auto">steam-runtime-check-requirements[206680]: W: Chi=
ld process exited with code 1: bwrap: setting up uid map: Permission denied=
<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">steam.sh[204656]: E=
rror: Steam now requires user namespaces to be enabled.<br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">This requirement is the same as for F=
latpak, which has more detailed<br></div><div dir=3D"auto">information avai=
lable:<br></div><div dir=3D"auto"><a href=3D"https://github.com/flatpak/fla=
tpak/wiki/User-namespace-requirements" rel=3D"noopener noreferrer" target=
=3D"_blank">https://github.com/flatpak/flatpak/wiki/User-namespace-requirem=
ents</a><br></div><div dir=3D"auto">```<br></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">From the URL provided in the output, I quickly figured =
out It is an issue related to bubblewrap.<br></div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Below is the output of bwrap when it's profile is set=
 to complain mode:<br></div><div dir=3D"auto">```<br></div><div dir=3D"auto=
">&nbsp;&gt;&gt; bwrap --bind / / --ro-bind /usr /usr --dev /dev --proc /pr=
oc --dir /tmp --unshare-user<br></div><div dir=3D"auto">--unshare-net --uns=
hare-pid /bin/bash --expose-pids<br></div><div dir=3D"auto">bwrap: setting =
up uid map: Permission denied<br></div><div dir=3D"auto">```<br></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Here is the AppArmor profile I hav=
e configured for bwrap:<br></div><div dir=3D"auto">```<br></div><div dir=3D=
"auto">abi &lt;abi/4.0&gt;,<br></div><div dir=3D"auto">include &lt;tunables=
/global&gt;<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">profile =
bwrap /usr/bin/bwrap flags=3D(complain) {<br></div><div dir=3D"auto">&nbsp;=
 userns,<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">&nbsp; # Si=
te-specific additions and overrides. See local/README for details.<br></div=
><div dir=3D"auto">&nbsp; include if exists &lt;local/bwrap&gt;<br></div><d=
iv dir=3D"auto">}<br></div><div dir=3D"auto">```<br></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">I also verified that `/proc/sys/kernel/unprivi=
leged_userns_clone` is set to `1`.<br></div><div dir=3D"auto">```<br></div>=
<div dir=3D"auto">&nbsp;&gt;&gt; cat /proc/sys/kernel/unprivileged_userns_c=
lone<br></div><div dir=3D"auto">1<br></div><div dir=3D"auto">```<br></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">From `/sys/kernel/security/app=
armor/profiles` I can see that `bwrap` is set to complain mode, so It shoul=
d not be restricted in any way.<br></div><div dir=3D"auto">I suspect this m=
ay be an issue with my configuration rather than a bug in AppArmor itself. =
If anyone has insights or suggestions for resolving this, I would greatly a=
ppreciate your help.<br></div><div dir=3D"auto">Thank you in advance!<br></=
div>  </body>
</html>

------=_Part_276497_925656319.1731151580460--


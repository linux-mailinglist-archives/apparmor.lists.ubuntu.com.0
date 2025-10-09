Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F29D9BC928A
	for <lists+apparmor@lfdr.de>; Thu, 09 Oct 2025 15:01:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v6qGS-0002K9-GI; Thu, 09 Oct 2025 13:01:00 +0000
Received: from smtp-relay-services-1.internal ([10.131.114.214]
 helo=smtp-relay-services-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <noreply@launchpad.net>)
 id 1v6qGM-0002Io-0x
 for apparmor@lists.ubuntu.com; Thu, 09 Oct 2025 13:00:54 +0000
Received: from scripts.lp.internal (scripts.lp.internal [10.131.215.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id D4CE143126
 for <apparmor@lists.ubuntu.com>; Thu,  9 Oct 2025 13:00:53 +0000 (UTC)
Received: from scripts.lp.internal (localhost [127.0.0.1])
 by scripts.lp.internal (Postfix) with ESMTP id B5CD97F4DF
 for <apparmor@lists.ubuntu.com>; Thu,  9 Oct 2025 13:00:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Oct 2025 12:52:08 -0000
From: Nathan Teodosio <1777070@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=apparmor; component=main;
 status=Confirmed; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=firefox; component=main;
 status=Won't Fix; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: bionic
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: aquina b4ptx cboltz elindarie janitor jjohansen
 osomon sdeziel seth-arnold skunk xavpaice
X-Launchpad-Bug-Reporter: Xav Paice (xavpaice)
X-Launchpad-Bug-Modifier: Nathan Teodosio (nteodosio)
References: <152904811695.1951.15951974184045199043.malonedeb@chaenomeles.canonical.com>
Message-Id: <176001433077.4018110.562354781903414745.launchpad@juju-98d295-prod-launchpad-2>
X-Launchpad-Message-Rationale: Subscriber of Duplicate @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bff9b0558f8357613643d9a74c009da18fafa917";
 Instance="launchpad-scripts"
X-Launchpad-Hash: 77682e18177b36e9b55a3efd9067ee4ea0fa7904
Subject: [apparmor] [Bug 1777070] Re: firefox plugin libwidevinecdm.so
	crashes due to apparmor denial
X-BeenThere: apparmor@lists.ubuntu.com
X-Mailman-Version: 2.1.20
List-Id: AppArmor discussion <apparmor.lists.ubuntu.com>
List-Unsubscribe: <https://lists.ubuntu.com/mailman/options/apparmor>,
 <mailto:apparmor-request@lists.ubuntu.com?subject=unsubscribe>
List-Archive: <https://lists.ubuntu.com/archives/apparmor>
List-Post: <mailto:apparmor@lists.ubuntu.com>
List-Help: <mailto:apparmor-request@lists.ubuntu.com?subject=help>
List-Subscribe: <https://lists.ubuntu.com/mailman/listinfo/apparmor>,
 <mailto:apparmor-request@lists.ubuntu.com?subject=subscribe>
Reply-To: Bug 1777070 <1777070@bugs.launchpad.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

** Changed in: firefox (Ubuntu)
       Status: Confirmed =3D> Won't Fix

--=20
You received this bug notification because you are a member of AppArmor
Developers, which is subscribed to a duplicate bug report (1859361).
https://bugs.launchpad.net/bugs/1777070

Title:
  firefox plugin libwidevinecdm.so crashes due to apparmor denial

Status in apparmor package in Ubuntu:
  Confirmed
Status in firefox package in Ubuntu:
  Won't Fix

Bug description:
  Ubuntu 18.04, Firefox 60.0.1+build2-0ubuntu0.18.04.1

  Running firefix, then going to netflix.com and attempting to play a
  movie.  The widevinecdm plugin crashes, the following is found in
  syslog:

 =20
  Jun 15 19:13:22 xplt kernel: [301351.553043] audit: type=3D1400 audit(152=
9046802.585:246): apparmor=3D"DENIED" operation=3D"file_mmap" profile=3D"/u=
sr/lib/firefox/firefox{,*[^s][^h]}" name=3D"/home/xav/.mozilla/firefox/wiav=
okxk.default-1510977878171/gmp-widevinecdm/1.4.8.1008/libwidevinecdm.so" pi=
d=3D16118 comm=3D"plugin-containe" requested_mask=3D"m" denied_mask=3D"m" f=
suid=3D1000 ouid=3D1000
  Jun 15 19:13:22 xplt kernel: [301351.553236] audit: type=3D1400 audit(152=
9046802.585:247): apparmor=3D"DENIED" operation=3D"ptrace" profile=3D"/usr/=
lib/firefox/firefox{,*[^s][^h]}" pid=3D24714 comm=3D"firefox" requested_mas=
k=3D"trace" denied_mask=3D"trace" peer=3D"/usr/lib/firefox/firefox{,*[^s][^=
h]}"
  Jun 15 19:13:22 xplt kernel: [301351.553259] plugin-containe[16118]: segf=
ault at 0 ip 00007fcdfdaa76af sp 00007ffc1ff03e28 error 6 in libxul.so[7fcd=
fb77a000+6111000]
  Jun 15 19:13:22 xplt snmpd[2334]: error on subcontainer 'ia_addr' insert =
(-1)
  Jun 15 19:13:22 xplt /usr/lib/gdm3/gdm-x-session[6549]: ###!!! [Parent][M=
essageChannel::Call] Error: Channel error: cannot send/recv
  Jun 15 19:13:24 xplt kernel: [301353.960182] audit: type=3D1400 audit(152=
9046804.994:248): apparmor=3D"DENIED" operation=3D"file_mmap" profile=3D"/u=
sr/lib/firefox/firefox{,*[^s][^h]}" name=3D"/home/xav/.mozilla/firefox/wiav=
okxk.default-1510977878171/gmp-widevinecdm/1.4.8.1008/libwidevinecdm.so" pi=
d=3D16135 comm=3D"plugin-containe" requested_mask=3D"m" denied_mask=3D"m" f=
suid=3D1000 ouid=3D1000
  Jun 15 19:13:24 xplt kernel: [301353.960373] audit: type=3D1400 audit(152=
9046804.994:249): apparmor=3D"DENIED" operation=3D"ptrace" profile=3D"/usr/=
lib/firefox/firefox{,*[^s][^h]}" pid=3D24714 comm=3D"firefox" requested_mas=
k=3D"trace" denied_mask=3D"trace" peer=3D"/usr/lib/firefox/firefox{,*[^s][^=
h]}"
  Jun 15 19:13:24 xplt kernel: [301353.960398] plugin-containe[16135]: segf=
ault at 0 ip 00007fe3b57f46af sp 00007ffe6dc0b488 error 6 in libxul.so[7fe3=
b34c7000+6111000]
  Jun 15 19:13:28 xplt kernel: [301357.859177] audit: type=3D1400 audit(152=
9046808.895:250): apparmor=3D"DENIED" operation=3D"file_mmap" profile=3D"/u=
sr/lib/firefox/firefox{,*[^s][^h]}" name=3D"/home/xav/.mozilla/firefox/wiav=
okxk.default-1510977878171/gmp-widevinecdm/1.4.8.1008/libwidevinecdm.so" pi=
d=3D16139 comm=3D"plugin-containe" requested_mask=3D"m" denied_mask=3D"m" f=
suid=3D1000 ouid=3D1000
  Jun 15 19:13:28 xplt kernel: [301357.859328] audit: type=3D1400 audit(152=
9046808.895:251): apparmor=3D"DENIED" operation=3D"ptrace" profile=3D"/usr/=
lib/firefox/firefox{,*[^s][^h]}" pid=3D24714 comm=3D"firefox" requested_mas=
k=3D"trace" denied_mask=3D"trace" peer=3D"/usr/lib/firefox/firefox{,*[^s][^=
h]}"
  Jun 15 19:13:28 xplt kernel: [301357.859349] plugin-containe[16139]: segf=
ault at 0 ip 00007fcf32ae06af sp 00007ffeb8a136c8 error 6 in libxul.so[7fcf=
307b3000+6111000]
  Jun 15 19:13:25 xplt /usr/lib/gdm3/gdm-x-session[6549]: ###!!! [Parent][M=
essageChannel::Call] Error: Channel error: cannot send/recv
  Jun 15 19:13:29 xplt /usr/lib/gdm3/gdm-x-session[6549]: ERROR block_reap:=
328: [hamster] bad exit code 1
  Jun 15 19:13:29 xplt /usr/lib/gdm3/gdm-x-session[6549]: ###!!! [Parent][M=
essageChannel::Call] Error: Channel error: cannot send/recv
  Jun 15 19:13:29 xplt kernel: [301358.227635] audit: type=3D1400 audit(152=
9046809.263:252): apparmor=3D"DENIED" operation=3D"file_mmap" profile=3D"/u=
sr/lib/firefox/firefox{,*[^s][^h]}" name=3D"/home/xav/.mozilla/firefox/wiav=
okxk.default-1510977878171/gmp-widevinecdm/1.4.8.1008/libwidevinecdm.so" pi=
d=3D16188 comm=3D"plugin-containe" requested_mask=3D"m" denied_mask=3D"m" f=
suid=3D1000 ouid=3D1000
  Jun 15 19:13:29 xplt kernel: [301358.227811] audit: type=3D1400 audit(152=
9046809.263:253): apparmor=3D"DENIED" operation=3D"ptrace" profile=3D"/usr/=
lib/firefox/firefox{,*[^s][^h]}" pid=3D24714 comm=3D"firefox" requested_mas=
k=3D"trace" denied_mask=3D"trace" peer=3D"/usr/lib/firefox/firefox{,*[^s][^=
h]}"
  Jun 15 19:13:29 xplt kernel: [301358.227844] plugin-containe[16188]: segf=
ault at 0 ip 00007fe5667c66af sp 00007fffe8cc0da8 error 6 in libxul.so[7fe5=
64499000+6111000]
  Jun 15 19:13:31 xplt kernel: [301360.574177] audit: type=3D1400 audit(152=
9046811.608:254): apparmor=3D"DENIED" operation=3D"file_mmap" profile=3D"/u=
sr/lib/firefox/firefox{,*[^s][^h]}" name=3D"/home/xav/.mozilla/firefox/wiav=
okxk.default-1510977878171/gmp-widevinecdm/1.4.8.1008/libwidevinecdm.so" pi=
d=3D16192 comm=3D"plugin-containe" requested_mask=3D"m" denied_mask=3D"m" f=
suid=3D1000 ouid=3D1000
  Jun 15 19:13:31 xplt kernel: [301360.574326] audit: type=3D1400 audit(152=
9046811.608:255): apparmor=3D"DENIED" operation=3D"ptrace" profile=3D"/usr/=
lib/firefox/firefox{,*[^s][^h]}" pid=3D24714 comm=3D"firefox" requested_mas=
k=3D"trace" denied_mask=3D"trace" peer=3D"/usr/lib/firefox/firefox{,*[^s][^=
h]}"
  Jun 15 19:13:31 xplt kernel: [301360.574352] plugin-containe[16192]: segf=
ault at 0 ip 00007f83507606af sp 00007ffdb3d22f08 error 6 in libxul.so[7f83=
4e433000+6111000]
  Jun 15 19:13:35 xplt kernel: [301364.313727] audit: type=3D1400 audit(152=
9046815.349:256): apparmor=3D"DENIED" operation=3D"file_mmap" profile=3D"/u=
sr/lib/firefox/firefox{,*[^s][^h]}" name=3D"/home/xav/.mozilla/firefox/wiav=
okxk.default-1510977878171/gmp-widevinecdm/1.4.8.1008/libwidevinecdm.so" pi=
d=3D16206 comm=3D"plugin-containe" requested_mask=3D"m" denied_mask=3D"m" f=
suid=3D1000 ouid=3D1000
  Jun 15 19:13:35 xplt kernel: [301364.313896] audit: type=3D1400 audit(152=
9046815.349:257): apparmor=3D"DENIED" operation=3D"ptrace" profile=3D"/usr/=
lib/firefox/firefox{,*[^s][^h]}" pid=3D24714 comm=3D"firefox" requested_mas=
k=3D"trace" denied_mask=3D"trace" peer=3D"/usr/lib/firefox/firefox{,*[^s][^=
h]}"
  Jun 15 19:13:35 xplt kernel: [301364.313967] plugin-containe[16206]: segf=
ault at 0 ip 00007f5ff6f746af sp 00007fff60c9c768 error 6 in libxul.so[7f5f=
f4c47000+6111000]
  Jun 15 19:13:35 xplt /usr/lib/gdm3/gdm-x-session[6549]: message repeated =
3 times: [ ###!!! [Parent][MessageChannel::Call] Error: Channel error: cann=
ot send/recv]

  If I run Firefox from the snap (rev 60.0.2-1) there's no problem.

To manage notifications about this bug go to:
https://bugs.launchpad.net/ubuntu/+source/apparmor/+bug/1777070/+subscripti=
ons



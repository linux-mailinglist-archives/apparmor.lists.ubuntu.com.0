Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id BA798B3D04
	for <lists+apparmor@lfdr.de>; Mon, 16 Sep 2019 16:59:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1i9sTL-0003LM-33; Mon, 16 Sep 2019 14:59:23 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1i9sTJ-0003LG-CF
 for apparmor@lists.ubuntu.com; Mon, 16 Sep 2019 14:59:21 +0000
Received: from ackee.canonical.com ([91.189.89.26])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i9sTJ-0003NS-8L
 for <apparmor@lists.ubuntu.com>; Mon, 16 Sep 2019 14:59:21 +0000
Received: from ackee.canonical.com (localhost [IPv6:::1])
 by ackee.canonical.com (Postfix) with ESMTP id 34E36E08EA
 for <apparmor@lists.ubuntu.com>; Mon, 16 Sep 2019 14:59:21 +0000 (UTC)
Content-Type: multipart/mixed; boundary="===============3287575547369875441=="
MIME-Version: 1.0
X-Launchpad-Message-Rationale: Reviewer @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
X-Launchpad-Notification-Type: code-review
Message-Id: <156864596105.5940.7000443989613601220.launchpad@ackee.canonical.com>
X-Launchpad-Branch: ~sdeziel/apparmor-profiles/+git/apparmor-profiles:apt-cacher-ng
X-Launchpad-Project: apparmor-profiles
To: mp+372819@code.launchpad.net
From: =?utf-8?q?Simon_D=C3=A9ziel?= <simon@sdeziel.info>
Date: Mon, 16 Sep 2019 14:59:21 -0000
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 0573e50579fe985ec478c0f086b4a87ec87497b9
Subject: [apparmor] [Merge]
 ~sdeziel/apparmor-profiles/+git/apparmor-profiles:apt-cacher-ng into
 apparmor-profiles:master
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
Reply-To: mp+372819@code.launchpad.net
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============3287575547369875441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Simon D=C3=A9ziel has proposed merging ~sdeziel/apparmor-profiles/+git/appa=
rmor-profiles:apt-cacher-ng into apparmor-profiles:master.

Requested reviews:
  AppArmor Developers (apparmor-dev)

For more details, see:
https://code.launchpad.net/~sdeziel/apparmor-profiles/+git/apparmor-profile=
s/+merge/372819

On startup, apt-cacher-ng triggers this:

audit: type=3D1400 audit(1568645586.446:36): apparmor=3D"DENIED" operation=
=3D"open" profile=3D"/usr/sbin/apt-cacher-ng" name=3D"/etc/ssl/openssl.cnf"=
 pid=3D29939 comm=3D"apt-cacher-ng" requested_mask=3D"r" denied_mask=3D"r" =
fsuid=3D108 ouid=3D0
-- =

Your team AppArmor Developers is requested to review the proposed merge of =
~sdeziel/apparmor-profiles/+git/apparmor-profiles:apt-cacher-ng into apparm=
or-profiles:master.

--===============3287575547369875441==
Content-Disposition: inline; filename="review-diff.txt"
MIME-Version: 1.0
Content-Type: text/x-diff; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

diff --git a/ubuntu/19.10/usr.sbin.apt-cacher-ng b/ubuntu/19.10/usr.sbin.ap=
t-cacher-ng
index f2824f6..53832b8 100644
--- a/ubuntu/19.10/usr.sbin.apt-cacher-ng
+++ b/ubuntu/19.10/usr.sbin.apt-cacher-ng
@@ -7,6 +7,7 @@
 /usr/sbin/apt-cacher-ng {
   #include <abstractions/base>
   #include <abstractions/nameservice>
+  #include <abstractions/openssl>
   #include <abstractions/user-tmp>
 =

   /etc/apt-cacher-ng/ r,

--===============3287575547369875441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============3287575547369875441==--


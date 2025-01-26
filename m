Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B02E1A1C6F1
	for <lists+apparmor@lfdr.de>; Sun, 26 Jan 2025 09:05:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tbxeC-0002Lg-P7; Sun, 26 Jan 2025 08:05:36 +0000
Received: from smtp-relay-services-1.internal ([10.131.114.214]
 helo=smtp-relay-services-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <noreply@launchpad.net>)
 id 1tbxeB-0002LS-45
 for apparmor@lists.ubuntu.com; Sun, 26 Jan 2025 08:05:35 +0000
Received: from scripts.lp.internal (scripts.lp.internal [10.131.215.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id EC2164C07E
 for <apparmor@lists.ubuntu.com>; Sun, 26 Jan 2025 08:05:34 +0000 (UTC)
Received: from scripts.lp.internal (localhost [127.0.0.1])
 by scripts.lp.internal (Postfix) with ESMTP id D398E7E4EB
 for <apparmor@lists.ubuntu.com>; Sun, 26 Jan 2025 08:05:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jan 2025 07:55:50 -0000
From: Guy de Winton <1117804@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=apparmor; status=Confirmed; importance=Low;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=audit; component=main;
 status=Confirmed; importance=Low; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=linux; component=main;
 status=Incomplete; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: apparmor cscc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bigon guydewinton intrigeri jjohansen jttoivon
 seth-arnold talkless tyhicks ubuntu-kernel-bot
X-Launchpad-Bug-Reporter: Tyler Hicks (tyhicks)
X-Launchpad-Bug-Modifier: Guy de Winton (guydewinton)
References: <20130206233135.28570.36525.malonedeb@soybean.canonical.com>
Message-Id: <173787815069.3044288.4352376050826519855.malone@juju-98d295-prod-launchpad-3>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4d55102f8b4a0cc5b78cab67520e07e127d0612e";
 Instance="launchpad-scripts"
X-Launchpad-Hash: 5a2146a5eecdb3d42d24167e7ae1b749d9d27f51
Subject: [apparmor] [Bug 1117804] Re: ausearch doesn't show AppArmor denial
	messages
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
Reply-To: Bug 1117804 <1117804@bugs.launchpad.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

I have just encountered this issue (while trying to figure out why aa-
genprof could not correctly profile a script). This is a pretty crazy
issue to be remaining open for so long... one of the two major LSM
systems not logging correctly and therefore having logs not appear in
ausearch (not to mention preventing tools like aa-genprof from working
correctly).

Has this been fixed? I am running Debian 12, so I might be locked into
time warp from 3000 years ago... I am on v3.0.8... I have noticed that
the most recent v3 release was posted a few days before this message.
Has v4 fixed this problem? Are there work around?

I would say this is an extremely critical bug which prevents AppArmor
from being a viable utility. (I am studying for a LF SysAdmin cert and
would regard myself to be something of a newbie at this level of
Linuxing, so please forgive me if I am missing something...)

--=20
You received this bug notification because you are a member of AppArmor
Developers, which is subscribed to the bug report.
https://bugs.launchpad.net/bugs/1117804

Title:
  ausearch doesn't show AppArmor denial messages

Status in AppArmor:
  Confirmed
Status in audit package in Ubuntu:
  Confirmed
Status in linux package in Ubuntu:
  Incomplete

Bug description:
  The following command should display all AVC denials:

  ausearch -m avc

  However, it doesn't work with AppArmor denials. Here's a quick test
  case to generate a denial, search for it with ausearch, and see that
  no messages are displayed:

  $ aa-exec -p /usr/sbin/tcpdump cat /proc/self/attr/current
  cat: /proc/self/attr/current: Permission denied
  $ sudo ausearch -m avc -c cat
  <no matches>

  ausearch claims that there are no matches, but there's a matching
  audit message if you look in audit.log:

  type=3DAVC msg=3Daudit(1360193426.539:64): apparmor=3D"DENIED"
  operation=3D"open" parent=3D8253 profile=3D"/usr/sbin/tcpdump"
  name=3D"/proc/8485/attr/current" pid=3D8485 comm=3D"cat" requested_mask=
=3D"r"
  denied_mask=3D"r" fsuid=3D1000 ouid=3D1000

To manage notifications about this bug go to:
https://bugs.launchpad.net/apparmor/+bug/1117804/+subscriptions



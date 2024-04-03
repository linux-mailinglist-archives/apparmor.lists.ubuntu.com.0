Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF1C897AD2
	for <lists+apparmor@lfdr.de>; Wed,  3 Apr 2024 23:34:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rs8Ey-0006Vr-8S; Wed, 03 Apr 2024 21:33:52 +0000
Received: from smtp-relay-services-1.internal ([10.131.114.214]
 helo=smtp-relay-services-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <noreply@launchpad.net>)
 id 1rs8Ex-0006Rs-F3
 for apparmor@lists.ubuntu.com; Wed, 03 Apr 2024 21:33:51 +0000
Received: from juju-98d295-prod-launchpad-16.localdomain (scripts.lp.internal
 [10.131.215.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 90D3E472FD
 for <apparmor@lists.ubuntu.com>; Wed,  3 Apr 2024 21:33:07 +0000 (UTC)
Received: from [10.131.215.246] (localhost [127.0.0.1])
 by juju-98d295-prod-launchpad-16.localdomain (Postfix) with ESMTP id
 6A5D485F2C
 for <apparmor@lists.ubuntu.com>; Wed,  3 Apr 2024 20:41:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Apr 2024 20:33:28 -0000
From: =?utf-8?b?1JzQsNOAdNC1ciDihazQsNGA0YHSu9GDbtGVa9GW?=
 <1928360@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=snappy; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=ubuntukylin; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=im-config; component=main;
 status=Fix Released; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=language-selector;
 component=main; status=Fix Released; importance=Undecided;
 assignee=gunnarhj@ubuntu.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: feng-kylin gunnarhj jamesh janitor seth-arnold
X-Launchpad-Bug-Reporter: Gunnar Hjalmarsson (gunnarhj)
X-Launchpad-Bug-Modifier: =?utf-8?b?1JzQsNOAdNC1ciDihazQsNGA0YHSu9GDbtGVa9GWICh3eGwp?=
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
Message-Id: <171217640854.140888.11946562543733900825.launchpad@juju-98d295-prod-launchpad-7>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="aec24aef7a9042c99ef3e238d8b0ca01df9e1a9f";
 Instance="launchpad-scripts"
X-Launchpad-Hash: b6d4838034190ca23fed89e146cd022e5a4028ff
Subject: [apparmor] [Bug 1928360] Re: Switch to Fcitx 5 for Chinese
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
Reply-To: Bug 1928360 <1928360@bugs.launchpad.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

** No longer affects: lubuntu-default-settings

--=20
You received this bug notification because you are a member of AppArmor
Developers, which is subscribed to the bug report.
https://bugs.launchpad.net/bugs/1928360

Title:
  Switch to Fcitx 5 for Chinese

Status in Snappy:
  Invalid
Status in Ubuntu Kylin:
  In Progress
Status in im-config package in Ubuntu:
  Fix Released
Status in language-selector package in Ubuntu:
  Fix Released

Bug description:
  In Debian 11 Fcitx 5 will be the default IM framework for Chinese on
  non-GNOME desktops. I can think it's time to make the equivalent
  changes in Ubuntu 21.10 as well.

  I'd appreciate input on the topic from the Ubuntu Kylin team as well
  as other Chinese speaking users.

To manage notifications about this bug go to:
https://bugs.launchpad.net/snappy/+bug/1928360/+subscriptions



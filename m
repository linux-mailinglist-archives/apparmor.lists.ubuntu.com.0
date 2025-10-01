Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F7BBAF7D4
	for <lists+apparmor@lfdr.de>; Wed, 01 Oct 2025 09:50:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v3rbf-00052m-SE; Wed, 01 Oct 2025 07:50:35 +0000
Received: from smtp-relay-services-0.internal ([10.131.114.58]
 helo=smtp-relay-services-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <noreply@launchpad.net>)
 id 1v3rbd-00052R-GK
 for apparmor@lists.ubuntu.com; Wed, 01 Oct 2025 07:50:33 +0000
Received: from scripts.lp.internal (scripts.lp.internal [10.131.215.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 488DE421AF
 for <apparmor@lists.ubuntu.com>; Wed,  1 Oct 2025 07:50:33 +0000 (UTC)
Received: from scripts.lp.internal (localhost [127.0.0.1])
 by scripts.lp.internal (Postfix) with ESMTP id 21C277EA32
 for <apparmor@lists.ubuntu.com>; Wed,  1 Oct 2025 07:50:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Oct 2025 07:45:24 -0000
From: handsome_feng <1928360@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=snappy; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=ubuntukylin; status=Fix Released; importance=Undecided;
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
X-Launchpad-Bug-Modifier: handsome_feng (feng-kylin)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
Message-Id: <175930472710.1054494.17244294456235319285.launchpad@juju-98d295-prod-launchpad-4>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8f35df7956d277b113de8d286a4ca280c7b8ebdf";
 Instance="launchpad-scripts"
X-Launchpad-Hash: 3cb49f6b70724df2420e157b76873d62241fecc9
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

** Changed in: ubuntukylin
       Status: In Progress =3D> Fix Released

--=20
You received this bug notification because you are a member of AppArmor
Developers, which is subscribed to the bug report.
https://bugs.launchpad.net/bugs/1928360

Title:
  Switch to Fcitx 5 for Chinese

Status in Snappy:
  Invalid
Status in Ubuntu Kylin:
  Fix Released
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



Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9B278EF76
	for <lists+apparmor@lfdr.de>; Thu, 31 Aug 2023 16:21:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qbiXP-0001Yc-8L; Thu, 31 Aug 2023 14:20:47 +0000
Received: from smtp-relay-services-1.internal ([10.131.114.214]
 helo=smtp-relay-services-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <noreply@launchpad.net>)
 id 1qbiXL-0001YR-K9
 for apparmor@lists.ubuntu.com; Thu, 31 Aug 2023 14:20:43 +0000
Received: from juju-98d295-prod-launchpad-16.localdomain (unknown
 [10.131.215.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id E176B444BB
 for <apparmor@lists.ubuntu.com>; Thu, 31 Aug 2023 14:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1693491642;
 bh=BhivZHPR43SNUuz8oiUQd1ZlPHhzyBZlmghLqTRrURE=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=gAU+8IO+VtmK+JFYZfeEaRbOFjQzPCkXI+MLG1U3MAJm+Tc4/bELlwhiMREocDi7u
 XPq8fVP8I7Ec9kfeVPgRsI0ZgXCSIlynzVmTUPChxwqlxkAfypRvXbMypwp6JeMYEg
 Lz9+8c+UWUbdmbKH4ro4zaprMGUt1kWItbefVsWe2QUm2qXfOdJKO7eck2ZenrlRMp
 sQeRm+PAH7Kcqvnrard2TSwRoMctnJUPaxnGBZ6pD7aPPFG3hHL7av9uacru56tWDz
 g4g1tg2IYkX6eAsEDPiwGXvzx5QWhvMiylaratL4CEJU6xuPhrW6qs2CwOk0qw8l40
 +N0r2/WMZ0qog==
Received: from [10.131.215.246] (localhost [127.0.0.1])
 by juju-98d295-prod-launchpad-16.localdomain (Postfix) with ESMTP id
 B75C97EB92
 for <apparmor@lists.ubuntu.com>; Thu, 31 Aug 2023 14:20:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 31 Aug 2023 14:11:41 -0000
From: Michael Vogt <2025030@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=snapd; status=Fix Released; importance=Critical;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alexmurray jjohansen mvo ondrak the-meulengracht
X-Launchpad-Bug-Reporter: Michael Vogt (mvo)
X-Launchpad-Bug-Modifier: Michael Vogt (mvo)
References: <168776916667.3467192.8196122685826530923.malonedeb@juju-98d295-prod-launchpad-7>
Message-Id: <169349110208.1990148.6902658452060901857.launchpad@juju-98d295-prod-launchpad-2>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5e6925a96ee17ce45a766139d74108c2c83abbc9";
 Instance="launchpad-scripts"
X-Launchpad-Hash: c407c3a12512e9d3beb3a6706a3f82ce974e4d82
Subject: [apparmor] [Bug 2025030] Re: apparmor_parser -O no-expr-simplify
	problematic
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
Reply-To: Bug 2025030 <2025030@bugs.launchpad.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

** Changed in: snapd
       Status: In Progress =3D> Fix Released

** Changed in: snapd
   Importance: Undecided =3D> Critical

--=20
You received this bug notification because you are a member of AppArmor
Developers, which is subscribed to the bug report.
https://bugs.launchpad.net/bugs/2025030

Title:
  apparmor_parser -O no-expr-simplify problematic

Status in snapd:
  Fix Released

Bug description:
  There was a recent issue with a core refresh that caused breakage.
  Upon further investigation it turns out that the apparmor_parser uses
  an substantial of memory.

  Upon some more investigation it turns out that that -O no-expr-
  simplify makes both time to compile and memory usage increase 10x.
  Tested with 22.04 but I see the same ballpark results with 16.04:

  $ /usr/bin/time --verbose apparmor_parser -S 2.59/profiles/snap.screenly-=
client.command-executor > /dev/null
      Command being timed: "apparmor_parser -S 2.59/profiles/snap.screenly-=
client.command-executor"
      User time (seconds): 4.32
      Maximum resident set size (kbytes): 117392

  $ /usr/bin/time --verbose apparmor_parser  -O no-expr-simplify -S 2.59/pr=
ofiles/snap.screenly-client.command-executor > /dev/null
      Command being timed: "apparmor_parser -O no-expr-simplify -S 2.59/pro=
files/snap.screenly-client.command-executor"
      User time (seconds): 40.64
      Maximum resident set size (kbytes): 1015816

  Profile is attached.

 =20
  It seems like we seriously need to consider dropping "-O no-expr-simplify=
".=20

  For context:
  https://bugs.launchpad.net/ubuntu-rtm/+source/apparmor/+bug/1383858
  is why it was added in the first place

  And some recent work to make things faster:
  https://gitlab.com/apparmor/apparmor/-/merge_requests/711

To manage notifications about this bug go to:
https://bugs.launchpad.net/snapd/+bug/2025030/+subscriptions



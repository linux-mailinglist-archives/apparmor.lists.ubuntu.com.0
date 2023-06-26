Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0E8741D81
	for <lists+apparmor@lfdr.de>; Thu, 29 Jun 2023 03:07:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qEg7v-0006Xa-EP; Thu, 29 Jun 2023 01:07:15 +0000
Received: from smtp-relay-services-1.internal ([10.131.114.214]
 helo=smtp-relay-services-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <noreply@launchpad.net>) id 1qDkLO-0007wc-OM
 for apparmor@lists.ubuntu.com; Mon, 26 Jun 2023 11:25:18 +0000
Received: from scripts-1.lp.internal (scripts.lp.internal [10.131.66.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 4E4663F738
 for <apparmor@lists.ubuntu.com>; Mon, 26 Jun 2023 11:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1687778716;
 bh=G4XkkqvmWaORVHGyCf7Uvqii9jL+9Hd4gQrsfQM9EMI=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=GA5BxKue6W+se305XsWtihAG3vQkILa6ux7CLjzeBoNDOdGO36gpWrEOd0suFNNDb
 8/kovxa8kWFiQSPEmal9Vtb7WanwzCxrw/CPeS8gkw8ODxUheyPsOUFs1HH6h8HZh0
 wEAUujXUm4D8Tahm9HhLWgsI4Zl2SUhbKk+iGHlBNs0rq9YTdITJ2lm2YsX+gHtbvV
 mQiCx0ThfNzGTu05C+Czfa0JK3b+hg9EFiDB+fUTMdseGXco6dpL1G4oGP0NQ6du6V
 0Cm038RkYnJMmpFh+WEt16uRDK+xLry+smFAx4uCEm6xbDUFQDDEA2xXCTrjc8KqV6
 kEYHdVbSOGReQ==
Received: from
 juju-4112d9-prod-launchpad-manual-servers-36.openstack.prodstack5.lan
 (localhost [127.0.0.1])
 by scripts-1.lp.internal (Postfix) with ESMTP id E66833F0F8
 for <apparmor@lists.ubuntu.com>; Mon, 26 Jun 2023 11:25:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Jun 2023 11:19:59 -0000
From: Michael Vogt <2025030@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=snapd; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Private
X-Launchpad-Bug-Private: yes
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jjohansen mvo
X-Launchpad-Bug-Reporter: Michael Vogt (mvo)
X-Launchpad-Bug-Modifier: Michael Vogt (mvo)
References: <168776916667.3467192.8196122685826530923.malonedeb@juju-98d295-prod-launchpad-7>
Message-Id: <168777839904.3575278.6003351652734794722.malone@juju-98d295-prod-launchpad-7>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="aedf8597c50c1abc5fb7f9e871e686dfcb381fde"; Instance="production"
X-Launchpad-Hash: d5089f1a80ec313dd65e258f14c5a7a76823bd03
X-Mailman-Approved-At: Thu, 29 Jun 2023 01:07:14 +0000
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

I did a quick experiment in our "interfaces-many-snap-provided" test to
see what impact the options have. I ran spread with:

$ spread -shell-after -v qemu:ubuntu-22.04-64:tests/main/interfaces-
many-snap-provided

And inside spread (on 22.04) compiled the profiles with/without no-expr-
simplify:

With "no-expr-simplify"
# /usr/bin/time -f '%E real, %M max-mem'  apparmor_parser -O no-expr-simpli=
fy -S /var/lib/snapd/apparmor/profiles/snap.{test-snapd-policy-app-consumer=
,test-snapd-policy-app-provider-classic}.* >/dev/null
0:22.07 real, 22908 max-mem

Without "no-expr-simplify"
# /usr/bin/time -f '%E real, %M max-mem'  apparmor_parser -S /var/lib/snapd=
/apparmor/profiles/snap.{test-snapd-policy-app-consumer,test-snapd-policy-a=
pp-provider-classic}.* >/dev/null
0:49.45 real, 13720 max-mem

Which seems to indicate that there is a trade-off here and moving away
from "no-expr-simplify" will make the installs/refreshes slower but also
reduces memory usage. It also seems like our normal tests do not catch
the memory explosion that we saw here.

--=20
You received this bug notification because you are a member of AppArmor
Developers, which is subscribed to the bug report.
https://bugs.launchpad.net/bugs/2025030

Title:
  apparmor_parser -O no-expr-simplify problematic

Status in snapd:
  New

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



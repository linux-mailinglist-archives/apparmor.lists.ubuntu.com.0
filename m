Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9435A74A2F3
	for <lists+apparmor@lfdr.de>; Thu,  6 Jul 2023 19:15:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qHSZV-0003i5-4y; Thu, 06 Jul 2023 17:15:13 +0000
Received: from smtp-relay-services-0.internal ([10.131.114.58]
 helo=smtp-relay-services-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <noreply@launchpad.net>) id 1qHSZS-0003hy-FB
 for apparmor@lists.ubuntu.com; Thu, 06 Jul 2023 17:15:10 +0000
Received: from scripts-1.lp.internal (scripts.lp.internal [10.131.66.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 1A2663F481
 for <apparmor@lists.ubuntu.com>; Thu,  6 Jul 2023 17:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1688663710;
 bh=T2WoQlrZo9M5qlSSjtZzbJHf9xDSCcBs0Emxd94iWY0=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=FHa/WZ2nH7A2T/ZWoDLPxIUfUT8JHaoPUTz/OF7s2sE2dfhGjVfvLCdGpabqXkgNQ
 CSRa7+Hw7p0FYA/JYW/7+YO6HkcdyqOUFwO51WlS/VPAIaiX+4BclHbjqfmihE0x1u
 k1lXE1gC7xwOLmitZhNRhnz2ELtEf1YVtfcc1pIwoUcuKkAHaN7B/2i1ofQIS56vOi
 /5kzVezpILexkNE9URnv7OVelt46L8WtnffYRiR2vyedAqiwJEusD1zoz3uyT7lwzk
 URVuoEEw+F9iH6kKqeNMCI0SoXAwu9N/flYP4ytg+YJz2poZUmDrQfYOZWL9h4gjWP
 ++MclJYmr2cAQ==
Received: from
 juju-4112d9-prod-launchpad-manual-servers-36.openstack.prodstack5.lan
 (localhost [127.0.0.1])
 by scripts-1.lp.internal (Postfix) with ESMTP id 06E4A404AD
 for <apparmor@lists.ubuntu.com>; Thu,  6 Jul 2023 17:15:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Jul 2023 17:07:04 -0000
From: Ondrej Kubik <2025030@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=snapd; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alexmurray jjohansen mvo ondrak the-meulengracht
X-Launchpad-Bug-Reporter: Michael Vogt (mvo)
X-Launchpad-Bug-Modifier: Ondrej Kubik (ondrak)
References: <168776916667.3467192.8196122685826530923.malonedeb@juju-98d295-prod-launchpad-7>
 <168844060626.2114408.6280408965707597775.malone@juju-98d295-prod-launchpad-7>
Message-Id: <CAM+TqApEhHyK1MY4rXL7majkgBV1wQV7MkmQsjueWjS_bRpfdw@mail.gmail.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="beda0e9dd2b131780db60fe479d4b43618b27243"; Instance="production"
X-Launchpad-Hash: d9881c67652b050f66489f0edc223b155b9b0d15
Subject: Re: [apparmor] [Bug 2025030] Re: apparmor_parser -O
	no-expr-simplify problematic
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

@Alex Murray <alex.murray@canonical.com>  github action is good idea to
optimise on the interface level and PR I open is trying to do that (though
I have done it manually)
But this has limitation as this optimisation can be done only per interface.
Preprocessing the full profile has the potential to optimise
cross-interfaces when multiple interfaces could define the same expression.
But one can argue that apparmor_parser should have this as the first step
before even parsing the profile, dummy dedupe and simplification of the
profile before building the tree.
it seems a lot cheaper as pre-processing step


On Tue, 4 Jul 2023 at 04:25, John Johansen <2025030@bugs.launchpad.net>
wrote:

> so I think this is largely because the apparmor version snap is using is
> not running rule deduplication on mount rules.
>
> --
> You received this bug notification because you are subscribed to the bug
> report.
> https://bugs.launchpad.net/bugs/2025030
>
> Title:
>   apparmor_parser -O no-expr-simplify problematic
>
> Status in snapd:
>   In Progress
>
> Bug description:
>   There was a recent issue with a core refresh that caused breakage.
>   Upon further investigation it turns out that the apparmor_parser uses
>   an substantial of memory.
>
>   Upon some more investigation it turns out that that -O no-expr-
>   simplify makes both time to compile and memory usage increase 10x.
>   Tested with 22.04 but I see the same ballpark results with 16.04:
>
>   $ /usr/bin/time --verbose apparmor_parser -S
> 2.59/profiles/snap.screenly-client.command-executor > /dev/null
>       Command being timed: "apparmor_parser -S
> 2.59/profiles/snap.screenly-client.command-executor"
>       User time (seconds): 4.32
>       Maximum resident set size (kbytes): 117392
>
>   $ /usr/bin/time --verbose apparmor_parser  -O no-expr-simplify -S
> 2.59/profiles/snap.screenly-client.command-executor > /dev/null
>       Command being timed: "apparmor_parser -O no-expr-simplify -S
> 2.59/profiles/snap.screenly-client.command-executor"
>       User time (seconds): 40.64
>       Maximum resident set size (kbytes): 1015816
>
>   Profile is attached.
>
>
>   It seems like we seriously need to consider dropping "-O
> no-expr-simplify".
>
>   For context:
>   https://bugs.launchpad.net/ubuntu-rtm/+source/apparmor/+bug/1383858
>   is why it was added in the first place
>
>   And some recent work to make things faster:
>   https://gitlab.com/apparmor/apparmor/-/merge_requests/711
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/snapd/+bug/2025030/+subscriptions
>
>

--=20
You received this bug notification because you are a member of AppArmor
Developers, which is subscribed to the bug report.
https://bugs.launchpad.net/bugs/2025030

Title:
  apparmor_parser -O no-expr-simplify problematic

Status in snapd:
  In Progress

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



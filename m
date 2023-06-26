Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECE3741D80
	for <lists+apparmor@lfdr.de>; Thu, 29 Jun 2023 03:07:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qEg7v-0006XS-CV; Thu, 29 Jun 2023 01:07:15 +0000
Received: from smtp-relay-services-1.internal ([10.131.114.214]
 helo=smtp-relay-services-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <noreply@launchpad.net>) id 1qDj1M-00039s-9F
 for apparmor@lists.ubuntu.com; Mon, 26 Jun 2023 10:00:32 +0000
Received: from scripts-1.lp.internal (scripts.lp.internal [10.131.66.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 20C9D3F5B0
 for <apparmor@lists.ubuntu.com>; Mon, 26 Jun 2023 10:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1687773632;
 bh=eiNZMd6gdr/DQ/2v3y0h7Prc88q99irvxJwBTaq12CE=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=BSX6bZFASMok70dGxIXgaT5BqohDcEVvQCKxMiB1cnqf4jIxnZbd0mWsh++MdS8DV
 eomNfgBcOJDBCAUhpiA597/uQTZPBC9LRKu8INlVZsmyx7Duj0TVdioXlP8wdnvXFt
 JN27Z0RAqqFQBMaT1gnxEi5/4bC1JTozodp+CWnaIw7StQRG7Mt0aqtRF0dSF3utAO
 i+2amM+PcTKjKVWbU+04f7x0+w3O8IIos/dPlYb00qiHAVUmKPuRPHEpq6maw97iRp
 3OSdhW/TxIYS2cArUaG00e1UEH8cYttyaVEBEVy+h/4A7obK0gmexB3XTFfGYMhO0k
 lyu7xz9EU6k9g==
Received: from
 juju-4112d9-prod-launchpad-manual-servers-36.openstack.prodstack5.lan
 (localhost [127.0.0.1])
 by scripts-1.lp.internal (Postfix) with ESMTP id 0B34C3FFAA
 for <apparmor@lists.ubuntu.com>; Mon, 26 Jun 2023 10:00:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Jun 2023 09:52:48 -0000
From: John Johansen <2025030@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=snapd; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Private
X-Launchpad-Bug-Private: yes
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jjohansen mvo
X-Launchpad-Bug-Reporter: Michael Vogt (mvo)
X-Launchpad-Bug-Modifier: John Johansen (jjohansen)
References: <168776916667.3467192.8196122685826530923.malonedeb@juju-98d295-prod-launchpad-7>
Message-Id: <168777316837.3992824.11580102588630408301.malone@juju-98d295-prod-launchpad-4>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="aedf8597c50c1abc5fb7f9e871e686dfcb381fde"; Instance="production"
X-Launchpad-Hash: 4f56d57e3dcf70b7415b3ff84d1f9fcf5a774d8b
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

Yes, this is to be expected. The dfa build algorithm can have
exponential state explosive. Expr simplification is a technique to help
avoid/mitigate that from happening. There is no reason that expr
simplification shouldn't be done.

In the past Jamie had disabled it for a couple of reasons.

1. for very simple profiles it isn't needed, and causes compilation to
slow down a little, vs. not having it. (this was on click, with phones
slow processor).

2. expr simplification could in its own rights in the past could be
pathalogical as it makes multiple passes, working on simplifying
expressions to deal with this explosion issue. In these cases, while it
would reduce memory overhead of the compile it would slow down the
compile significantly.


Case 2 was taken care of but putting a hard cap on the number of passes sim=
plification will do, in upstream commit

2809060be parser: limit the number of passes expr tree simplification
does (MR: https://gitlab.com/apparmor/apparmor/merge_requests/246)

This was found to achieve the majority of simplification gains without
multiple passes where as few as a single change was made. And there is
of course MR 711 that mvo has already brought up. There is some other
work that will further improve expr simplification when it lands, so we
should see further performance improvements in the future.

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



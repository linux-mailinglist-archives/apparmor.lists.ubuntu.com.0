Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8C573EFE2
	for <lists+apparmor@lfdr.de>; Tue, 27 Jun 2023 02:55:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qDwz8-0001e4-Rt; Tue, 27 Jun 2023 00:55:10 +0000
Received: from smtp-relay-services-0.internal ([10.131.114.58]
 helo=smtp-relay-services-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <noreply@launchpad.net>) id 1qDwz7-0001dw-MN
 for apparmor@lists.ubuntu.com; Tue, 27 Jun 2023 00:55:09 +0000
Received: from scripts-1.lp.internal (scripts.lp.internal [10.131.66.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 7B9063F713
 for <apparmor@lists.ubuntu.com>; Tue, 27 Jun 2023 00:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1687827309;
 bh=gzpQA/eKOKj9BlAJN/kFFzdsD4rLmwwMBxhmx2zeiBk=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=UD+/HHgd5fCzfiXYnuShMM1alRaPsepbMLKF3Jy4I8Lx+67K3pzmTHpli+XK8oBdz
 AhwhZc/gQ8BVZddSV3TFYUaN2OdFT/Y4Eulb3byUWINBT5Lb7OGEsnljREA1Lx3Zwd
 Yd+jnl/obDcZKbbyrxLuOaUrbknZgQVUK9ddSZtkmlRdYi4We3Av6lYQhcw2r8Oj10
 lKH53Tmo94Pm4y4AxQ8z3KSFV916iB8cxYs63XA620Q56dc7pAcn6K6rd7uCv1luXf
 eZpYvGWC3JSPld4t0erWx7p/6/xW8mj64XAZXoKykIg5Ie33ux6J6nyZNfwPvr0kIa
 n3B6zRMlryi8Q==
Received: from
 juju-4112d9-prod-launchpad-manual-servers-36.openstack.prodstack5.lan
 (localhost [127.0.0.1])
 by scripts-1.lp.internal (Postfix) with ESMTP id 6E4353FFAD
 for <apparmor@lists.ubuntu.com>; Tue, 27 Jun 2023 00:55:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Jun 2023 00:46:20 -0000
From: John Johansen <2025030@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=snapd; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jjohansen mvo
X-Launchpad-Bug-Reporter: Michael Vogt (mvo)
X-Launchpad-Bug-Modifier: John Johansen (jjohansen)
References: <168776916667.3467192.8196122685826530923.malonedeb@juju-98d295-prod-launchpad-7>
Message-Id: <168782678051.403027.18211768657419436343.malone@juju-98d295-prod-launchpad-4>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="aedf8597c50c1abc5fb7f9e871e686dfcb381fde"; Instance="production"
X-Launchpad-Hash: ac3daa9d22a83e20387350dd560376b9b242a80b
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

sigh, that performance drop is more than I was expecting. I do have a
set of click/snap profiles I use for testing. Can you send me your set,
as it obviously is better for this

I will take a peek at the expr simplification series. Its not done, but
it has several patch in it that are, and we might be able to apply those
and get a bit of a boost without waiting on the completed set.

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



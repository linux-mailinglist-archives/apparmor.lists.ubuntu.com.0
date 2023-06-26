Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ABF741D82
	for <lists+apparmor@lfdr.de>; Thu, 29 Jun 2023 03:07:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qEg7v-0006XL-AC; Thu, 29 Jun 2023 01:07:15 +0000
Received: from smtp-relay-services-0.internal ([10.131.114.58]
 helo=smtp-relay-services-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <noreply@launchpad.net>) id 1qDi50-00082l-Nq
 for apparmor@lists.ubuntu.com; Mon, 26 Jun 2023 09:00:14 +0000
Received: from scripts-1.lp.internal (scripts.lp.internal [10.131.66.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id E31063F723
 for <apparmor@lists.ubuntu.com>; Mon, 26 Jun 2023 09:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1687770014;
 bh=FY0XspbBal4TDTSCmdpTBqVJ6CIfnuoXMVPez51PSwg=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=m5xjISItAvAXdnRfBVQuByeEVOKTUfa03UYLuXVZBj9NbaA+9CqvplHeMy/oRS4s7
 clxXC+lEBRFh4gcxT1i8qVoOIeopnX/3ppPZqxkDFJhr5QyWxDft3wTbLeBrRmXVnF
 dAaX3Au8rov8xqFjT1TccvClHwY04bilSLDHXxtWr5aKXH8emR4IEuMtJHYPIplDYB
 fyEmyu6uAfVf4CqwqV2Lfu+h0nz4Ndy6iPI0aXmVNbOgrXMuuTTkrFxU+vxcTshMo7
 /g11BzEcrzUKR1StpHiUl7wWlZ/0jLjg1GTLFcSQDw+ue8R3YocgzzRhq4MgDkiw2w
 /SU0s9lxLKliQ==
Received: from
 juju-4112d9-prod-launchpad-manual-servers-36.openstack.prodstack5.lan
 (localhost [127.0.0.1])
 by scripts-1.lp.internal (Postfix) with ESMTP id 066D13FFAE
 for <apparmor@lists.ubuntu.com>; Mon, 26 Jun 2023 09:00:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Jun 2023 08:53:34 -0000
From: Michael Vogt <2025030@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=snapd; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Private
X-Launchpad-Bug-Private: yes
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mvo
X-Launchpad-Bug-Reporter: Michael Vogt (mvo)
X-Launchpad-Bug-Modifier: Michael Vogt (mvo)
References: <168776916667.3467192.8196122685826530923.malonedeb@juju-98d295-prod-launchpad-7>
Message-Id: <168776961435.3947138.7968026855610636847.malone@juju-98d295-prod-launchpad-4>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="aedf8597c50c1abc5fb7f9e871e686dfcb381fde"; Instance="production"
X-Launchpad-Hash: 6a5f013f045b2f673e85ecb79ae79792976cb93e
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

Just another data point, it seems some expressions are quite
pathological, e.g. removing

/sys/devices/{,*pcie-controller/,platform/{soc,scb}/*.pcie/}pci[0-9a-f]*/**=
/config r,
/sys/devices/{,*pcie-controller/,platform/{soc,scb}/*.pcie/}pci[0-9a-f]*/**=
/revision r,
/sys/devices/{,*pcie-controller/,platform/{soc,scb}/*.pcie/}pci[0-9a-f]*/**=
/resource r,
/sys/devices/{,*pcie-controller/,platform/{soc,scb}/*.pcie/}pci[0-9a-f]*/**=
/irq r,
/sys/devices/{,*pcie-controller/,platform/{soc,scb}/*.pcie/}pci[0-9a-f]*/**=
/boot_vga r,
/sys/devices/{,*pcie-controller/,platform/{soc,scb}/*.pcie/}pci[0-9a-f]*/**=
/{,subsystem_}class r,
/sys/devices/{,*pcie-controller/,platform/{soc,scb}/*.pcie/}pci[0-9a-f]*/**=
/{,subsystem_}device r,
/sys/devices/{,*pcie-controller/,platform/{soc,scb}/*.pcie/}pci[0-9a-f]*/**=
/{,subsystem_}vendor r,
/sys/devices/**/drm{,_dp_aux_dev}/** r,

makes the profile generation go down from 44s -> 10s so it seems some
specific lines are most likly causing this issue.

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



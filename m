Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF07741D83
	for <lists+apparmor@lfdr.de>; Thu, 29 Jun 2023 03:07:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qEg7v-0006X9-8P; Thu, 29 Jun 2023 01:07:15 +0000
Received: from smtp-relay-services-1.internal ([10.131.114.214]
 helo=smtp-relay-services-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <noreply@launchpad.net>) id 1qDhs7-0007MA-Hy
 for apparmor@lists.ubuntu.com; Mon, 26 Jun 2023 08:46:55 +0000
Received: from juju-98d295-prod-launchpad-3.localdomain (unknown
 [10.131.215.183])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 2723D3F1E6
 for <apparmor@lists.ubuntu.com>; Mon, 26 Jun 2023 08:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1687769215;
 bh=zfrhxINMECXAfrIJfsbpnq1bBJ2sSkN3S4vOF16RQcg=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Subject:Message-Id;
 b=ouwdh7X7u0PEOedJL32/GlmVARS8jStZN/9bnlh5H8Ct9FdARrY5PwJTBNbdsiY6N
 PMNpNGCxqkZWfwWZZSA+opE8JZZXj/h8kLZMapSVyI0MiQPGQw9RdguJr/BOKEJDQD
 8giv1Uu+e5mZSkunxSVHnZTfn08l4nsezMqahkHF+TLkGTG9M1CL2CiU0IkrI4mz0d
 Ty6TUNvNZl1laEb5SmoI6UlJBABNYa82PCdenr/WojAghgWxA06yLFcYDnagqXB2AL
 mezpdoQM6KbXFvJsdokTSb36L6RaZWrMAfrOgd0SymGnfnggXSRC0fQCm3kIQ8DVgW
 KitoSWKIkYfnw==
Received: from [10.131.215.183] (localhost [127.0.0.1])
 by juju-98d295-prod-launchpad-3.localdomain (Postfix) with ESMTP id E831E7E96D
 for <apparmor@lists.ubuntu.com>; Mon, 26 Jun 2023 08:46:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Jun 2023 08:46:54 -0000
From: Launchpad Bug Tracker <2025030@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=snapd; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Private
X-Launchpad-Bug-Private: yes
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mvo
X-Launchpad-Bug-Reporter: Michael Vogt (mvo)
References: <168776916667.3467192.8196122685826530923.malonedeb@juju-98d295-prod-launchpad-7>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Message-Id: <168776921490.3949070.8917949975646837125.launchpad@juju-98d295-prod-launchpad-3>
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="aedf8597c50c1abc5fb7f9e871e686dfcb381fde";
 Instance="launchpad-appserver"
X-Launchpad-Hash: 3a71ef5a675fba0a67fbec176c4277df6d0a92ce
X-Mailman-Approved-At: Thu, 29 Jun 2023 01:07:14 +0000
Subject: [apparmor] [Bug 2025030] [NEW] apparmor_parser -O no-expr-simplify
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

You have been subscribed to a private bug by Michael Vogt (mvo):

There was a recent issue with a core refresh that caused breakage. Upon
further investigation it turns out that the apparmor_parser uses an
substantial of memory.

Upon some more investigation it turns out that that -O no-expr-simplify
makes both time to compile and memory usage increase 10x. Tested with
22.04 but I see the same ballpark results with 16.04:

$ /usr/bin/time --verbose apparmor_parser -S 2.59/profiles/snap.screenly-cl=
ient.command-executor > /dev/null
    Command being timed: "apparmor_parser -S 2.59/profiles/snap.screenly-cl=
ient.command-executor"
    User time (seconds): 4.32
    Maximum resident set size (kbytes): 117392

$ /usr/bin/time --verbose apparmor_parser  -O no-expr-simplify -S 2.59/prof=
iles/snap.screenly-client.command-executor > /dev/null
    Command being timed: "apparmor_parser -O no-expr-simplify -S 2.59/profi=
les/snap.screenly-client.command-executor"
    User time (seconds): 40.64
    Maximum resident set size (kbytes): 1015816

Profile is attached.


It seems like we seriously need to consider dropping "-O no-expr-simplify".=
=20

For context:
https://bugs.launchpad.net/ubuntu-rtm/+source/apparmor/+bug/1383858
is why it was added in the first place

And some recent work to make things faster:
https://gitlab.com/apparmor/apparmor/-/merge_requests/711

** Affects: snapd
     Importance: Undecided
         Status: New

--=20
apparmor_parser -O no-expr-simplify problematic
https://bugs.launchpad.net/bugs/2025030
You received this bug notification because you are a member of AppArmor Dev=
elopers, which is subscribed to the bug report.


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 200D982B599
	for <lists+apparmor@lfdr.de>; Thu, 11 Jan 2024 20:59:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rO1DR-0006Mc-0s; Thu, 11 Jan 2024 19:59:49 +0000
Received: from smtp-relay-services-1.internal ([10.131.114.214]
 helo=smtp-relay-services-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <noreply@launchpad.net>)
 id 1rO1D9-0006LJ-1X
 for apparmor@lists.ubuntu.com; Thu, 11 Jan 2024 19:59:32 +0000
Received: from juju-98d295-prod-launchpad-3.localdomain
 (appserver-2.lp.internal [10.131.215.183])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id C6FF23F658
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jan 2024 19:59:30 +0000 (UTC)
Received: from [10.131.215.183] (localhost [127.0.0.1])
 by juju-98d295-prod-launchpad-3.localdomain (Postfix) with ESMTP id 69A4F7E08F
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jan 2024 19:59:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jan 2024 19:59:30 -0000
From: Launchpad Bug Tracker <2049099@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=snapd; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: marcoppenheimer
X-Launchpad-Bug-Reporter: Marc Oppenheimer (marcoppenheimer)
References: <170500315357.2951651.15872417683793394378.malonedeb@juju-98d295-prod-launchpad-4>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Message-Id: <170500317038.2577901.13239766445887670659.launchpad@juju-98d295-prod-launchpad-3>
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e1eeab5b20e19239bd7d5f36676f7a52988db88b";
 Instance="launchpad-appserver"
X-Launchpad-Hash: debdf42e6a2b005c9975536c551b95170da0c0f1
Subject: [apparmor] [Bug 2049099] [NEW] AppArmor blocking snap install
	nested in LXD container
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
Reply-To: Bug 2049099 <2049099@bugs.launchpad.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

You have been subscribed to a public bug by Marc Oppenheimer (marcoppenheim=
er):

##### Context
I'm on a non-Ubuntu OS (Arch), trying to use Juju on LXD. In doing so, Juju=
 uses a snap inside an LXD container, and so needs the system to support ne=
sted AppArmor profiles. `juju-db` is the snap in question, if that helps.

##### Issue
When I try to do this, I get a bunch of AppArmor violations, that go way ov=
er my head. It's not clear to me what is causing these, but I **suspect** t=
hat Ubuntu patches some host-system AppArmor profiles to support this use-c=
ase, that isn't replicated on other OSs? Not sure, and I don't know who to =
ask or where to look.

##### Logs + Additional Info
`snappy-debug` journalctl logs - https://pastebin.canonical.com/p/N5wxYggMy=
z/
A rough grab from dmesg - https://pastebin.canonical.com/p/4JhTX38GBF/
Snapd installed using - https://aur.archlinux.org/cgit/aur.git/tree/PKGBUIL=
D?h=3Dsnapd
`juju-db` snap - https://github.com/juju/juju-db-snap/tree/5.3
`usr.lib.snapd.snap-confine` default on Arch, in case it's useful - https:/=
/pastebin.canonical.com/p/84WGfgrCz6/

##### Reproduce Steps
Assuming you're running on a vanilla (minimal tweaking) Arch machine with A=
ppArmor enabled:
```
cd /tmp && git clone https://aur.archlinux.org/snapd.git && cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket

# log-out, log-in

sudo snap install lxd --channel latest/edge
lxd init --auto

sudo snap install juju --channel 3.3/stable

juju bootstrap localhost lh --debug --bootstrap-timeout=3D180

# check snappy-debug or dmesg for AppArmor denials
```

** Affects: snapd
     Importance: Undecided
         Status: New

--=20
AppArmor blocking snap install nested in LXD container
https://bugs.launchpad.net/bugs/2049099
You received this bug notification because you are a member of AppArmor Dev=
elopers, which is subscribed to the bug report.


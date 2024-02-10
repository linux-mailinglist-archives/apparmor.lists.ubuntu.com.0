Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3DA8502A7
	for <lists+apparmor@lfdr.de>; Sat, 10 Feb 2024 06:37:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rYg2k-00074d-U9; Sat, 10 Feb 2024 05:36:51 +0000
Received: from smtp-relay-services-0.internal ([10.131.114.58]
 helo=smtp-relay-services-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <noreply@launchpad.net>)
 id 1rYg2e-00073u-Mu
 for apparmor@lists.ubuntu.com; Sat, 10 Feb 2024 05:36:46 +0000
Received: from juju-98d295-prod-launchpad-16.localdomain (scripts.lp.internal
 [10.131.215.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id CD3814A743
 for <apparmor@lists.ubuntu.com>; Sat, 10 Feb 2024 05:36:23 +0000 (UTC)
Received: from [10.131.215.246] (localhost [127.0.0.1])
 by juju-98d295-prod-launchpad-16.localdomain (Postfix) with ESMTP id
 0AD597E546
 for <apparmor@lists.ubuntu.com>; Sat, 10 Feb 2024 05:35:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Feb 2024 05:29:39 -0000
From: John Johansen <1117804@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=apparmor; status=Confirmed; importance=Low;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=audit; component=main;
 status=Confirmed; importance=Low; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=linux; component=main;
 status=Incomplete; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: apparmor cscc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bigon intrigeri jjohansen jttoivon seth-arnold
 talkless tyhicks ubuntu-kernel-bot
X-Launchpad-Bug-Reporter: Tyler Hicks (tyhicks)
X-Launchpad-Bug-Modifier: John Johansen (jjohansen)
References: <20130206233135.28570.36525.malonedeb@soybean.canonical.com>
Message-Id: <170754297953.1558531.10273578690614841835.malone@juju-98d295-prod-launchpad-7>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9643586c585856148a18782148972ae9c1179d06";
 Instance="launchpad-scripts"
X-Launchpad-Hash: 948b9fea6eecd3248a0df9c1bd535542f2b94a69
Subject: [apparmor] [Bug 1117804] Re: ausearch doesn't show AppArmor denial
	messages
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
Reply-To: Bug 1117804 <1117804@bugs.launchpad.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

responding to @intrigeri (sorry this got lost some how).

tldr: yes we are basically on the same page.

AppArmor does not fit into the 1400 range formats, every one of our
messages have some custom fields. Some of them could be
reformated/reworked to share more, but we would still need custom
fields.

Our message fields are in the common name=3Dvalue format. So in that sense
they do fit in.

Kernel side this is fairly easy, we use common lsm_audit for the
messages we share in common, the code provides a callback to add your
own fields. Basically all that is needed is patch to allow different
number ranges to be used.

Userspace there needs to be some patching so LSM specific fields are
known about.

Whether is best to allocate new fields in a single number (say 1500),
with no fixed number of fields to output or it better to split into a
range of based on message type, I am not picky. When 1500 was taken away
from us I think it was 1500-1505 that we used, but expect we wouldn't
use the same mappings today if we had a choice.

so we have the generic audit type that is carried { audit, allowed,
denied, killed, prompt, hint, status, error }

this could carried as a common field, or we could use an allocated block
for

we have rule class, which is another way things are broken down, its
things like { file, cap, network, dbus, ...} there are currently about
25 of them currently.

common fields that can occur within apparmor messages { operation, info,
error, namespace, profile, label }, some fields aren't output if not
needed. Eg. we are auditing an access to say /etc/shadow that is allowed
but we want an audit trail for error won't be output, if its a system
status message that is not generated by a profiles rule set, profile=3D
won't be used. This set does not lend itself to an audit range as they
each take on basically a string value.


Then within a given class there are set of fields, some of them are shared =
by several classes, but not all, and there are some that are only used by a=
 single class. Some examples would be, most mediation class share requested=
=3D and denied=3D the values are class depended even those may be shared by=
 a subset of classes.

--=20
You received this bug notification because you are a member of AppArmor
Developers, which is subscribed to the bug report.
https://bugs.launchpad.net/bugs/1117804

Title:
  ausearch doesn't show AppArmor denial messages

Status in AppArmor:
  Confirmed
Status in audit package in Ubuntu:
  Confirmed
Status in linux package in Ubuntu:
  Incomplete

Bug description:
  The following command should display all AVC denials:

  ausearch -m avc

  However, it doesn't work with AppArmor denials. Here's a quick test
  case to generate a denial, search for it with ausearch, and see that
  no messages are displayed:

  $ aa-exec -p /usr/sbin/tcpdump cat /proc/self/attr/current
  cat: /proc/self/attr/current: Permission denied
  $ sudo ausearch -m avc -c cat
  <no matches>

  ausearch claims that there are no matches, but there's a matching
  audit message if you look in audit.log:

  type=3DAVC msg=3Daudit(1360193426.539:64): apparmor=3D"DENIED"
  operation=3D"open" parent=3D8253 profile=3D"/usr/sbin/tcpdump"
  name=3D"/proc/8485/attr/current" pid=3D8485 comm=3D"cat" requested_mask=
=3D"r"
  denied_mask=3D"r" fsuid=3D1000 ouid=3D1000

To manage notifications about this bug go to:
https://bugs.launchpad.net/apparmor/+bug/1117804/+subscriptions



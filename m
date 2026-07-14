Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0KYXILOrVmrp/wAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 14 Jul 2026 23:35:47 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 10169759033
	for <lists+apparmor@lfdr.de>; Tue, 14 Jul 2026 23:35:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=launchpad.net header.s=20210803 header.b="r/vJgd3K";
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=launchpad.net (policy=none)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wjkmn-0005Rh-Dc; Tue, 14 Jul 2026 21:35:29 +0000
Received: from smtp-relay-services-1.internal ([10.131.114.214]
 helo=smtp-relay-services-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <noreply@launchpad.net>)
 id 1wjkmj-0005RA-VP
 for apparmor@lists.ubuntu.com; Tue, 14 Jul 2026 21:35:25 +0000
Received: from scripts.lp.internal (scripts.lp.internal [10.131.215.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 9129E3FD91
 for <apparmor@lists.ubuntu.com>; Tue, 14 Jul 2026 21:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1784064925;
 bh=5PNzcf8RYFlOx/GvQILIxvh/gXhLdz8mxTjEuQXDkZg=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=r/vJgd3K1dn8bqvNzJw0NhgKwIA/SphfNXr4vJzEylRJzCvkL5878pcClCP5cZMD1
 rgPd/Zg60KjGM7IIu/BomUTWzTwH4psDwmFIZtXD25jem+uCwc12mZZmHE0cF4Ek1g
 FfV718TEEnsLsZgWGTQM5EGokf9r4ZlKqJyES9HpTXcYIwKrr9RDF1bWOik/nlmsSF
 zL0Xb6JUrVPICr6UcyS1m4UB1NooS+fQsfp3FH6dFe/mlwwKMCLVvMpHB88GQXl7c2
 Ps2WbU0K/hxybVgRuaWSe6T8YLsMQ1muRb83OgYDsZ6WMAWTKHUGyyrUYCmMPRJcnc
 7xh1J3wydl4hw==
Received: from scripts.lp.internal (localhost [127.0.0.1])
 by scripts.lp.internal (Postfix) with ESMTP id 45D257E999
 for <apparmor@lists.ubuntu.com>; Tue, 14 Jul 2026 21:35:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 21:27:34 -0000
From: Alex Ramirez <1117804@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=apparmor; status=Confirmed; importance=Low;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=audit; component=main;
 status=In Progress; importance=Low; assignee=alex.ramirez@canonical.com; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=linux; component=main;
 status=Invalid; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=jammy; sourcepackage=audit;
 component=main; status=In Progress; importance=Low;
 assignee=alex.ramirez@canonical.com; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=noble; sourcepackage=audit;
 component=main; status=In Progress; importance=Low;
 assignee=alex.ramirez@canonical.com; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=questing;
 sourcepackage=audit; component=main; status=Won't Fix; importance=Low;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=resolute;
 sourcepackage=audit; component=main; status=In Progress; importance=Low;
 assignee=alex.ramirez@canonical.com; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=stonking;
 sourcepackage=audit; component=main; status=In Progress; importance=Low;
 assignee=alex.ramirez@canonical.com; 
X-Launchpad-Bug-Tags: apparmor cscc kernel-autoclosed kernel-autoclosed-invalid
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bigon guydewinton intrigeri jjohansen jttoivon
 kicchou prod-kernel-team-janitor seth-arnold talkless tyhicks
 ubuntu-kernel-bot xalares
X-Launchpad-Bug-Reporter: Tyler Hicks (tyhicks)
X-Launchpad-Bug-Modifier: Alex Ramirez (kicchou)
References: <20130206233135.28570.36525.malonedeb@soybean.canonical.com>
Message-Id: <178406445431.1449660.10128411121610885621.malone@juju-98d295-prod-launchpad-54>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7cbed6e13f6cda8233e876935bcf16273b753df1";
 Instance="launchpad-scripts"
X-Launchpad-Hash: ba3e1202fa2f2466008786c51107aaebd5dda7a0
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.49 / 15.00];
	SEM_URIBL(3.50)[bugs.launchpad.net:from_mime];
	R_DKIM_REJECT(1.00)[launchpad.net:s=20210803];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[launchpad.net : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[launchpad.net:-];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[1117804@bugs.launchpad.net];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1117804@bugs.launchpad.net,apparmor-bounces@lists.ubuntu.com];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10169759033

Hey folks,

This bug has been open for a while.

I've created a PPA with a patch that adjusts ausearch's filtering logic
to reveal the AppArmor messages:
https://launchpad.net/~kicchou/+archive/ubuntu/lp1117804

I'll be updating the LP bug soon with an SRU justification containing
that patch.

Best,
Alex

** Changed in: audit (Ubuntu Jammy)
       Status: Confirmed =3D> In Progress

** Changed in: audit (Ubuntu Resolute)
       Status: Confirmed =3D> In Progress

** Changed in: audit (Ubuntu Stonking)
       Status: Confirmed =3D> In Progress

** Changed in: audit (Ubuntu Noble)
       Status: Confirmed =3D> In Progress

** Changed in: audit (Ubuntu Noble)
     Assignee: (unassigned) =3D> Alex Ramirez (kicchou)

** Changed in: audit (Ubuntu Stonking)
     Assignee: (unassigned) =3D> Alex Ramirez (kicchou)

** Changed in: audit (Ubuntu Resolute)
     Assignee: (unassigned) =3D> Alex Ramirez (kicchou)

** Changed in: audit (Ubuntu Jammy)
     Assignee: (unassigned) =3D> Alex Ramirez (kicchou)

--=20
You received this bug notification because you are a member of AppArmor
Developers, which is subscribed to the bug report.
https://bugs.launchpad.net/bugs/1117804

Title:
  ausearch doesn't show AppArmor denial messages

Status in AppArmor:
  Confirmed
Status in audit package in Ubuntu:
  In Progress
Status in linux package in Ubuntu:
  Invalid
Status in audit source package in Jammy:
  In Progress
Status in audit source package in Noble:
  In Progress
Status in audit source package in Questing:
  Won't Fix
Status in audit source package in Resolute:
  In Progress
Status in audit source package in Stonking:
  In Progress

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



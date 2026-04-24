Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLSlJzgI62lvHgAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 24 Apr 2026 08:05:44 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EBA45A239
	for <lists+apparmor@lfdr.de>; Fri, 24 Apr 2026 08:05:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wG9fK-0005xG-Mg; Fri, 24 Apr 2026 06:05:26 +0000
Received: from smtp-relay-services-1.internal ([10.131.114.214]
 helo=smtp-relay-services-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <noreply@launchpad.net>)
 id 1wG9fJ-0005wY-IK
 for apparmor@lists.ubuntu.com; Fri, 24 Apr 2026 06:05:25 +0000
Received: from scripts.lp.internal (scripts.lp.internal [10.131.215.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 6777540DD4
 for <apparmor@lists.ubuntu.com>; Fri, 24 Apr 2026 06:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1777010725;
 bh=kA6BslA+dxMd/SC1CQE+OcY3f66MEZ3yFAgCXv56hP0=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=ovxxfOuuEkFWskzd7NFz8PhGhtU2/n+vTIHcCVUk4wki/5RNoBUr+9yDEOhL6HS+p
 RR9hM0cpXsJcl/PkubqkV5GJKtFQ+nFcd75ATqKHeOqzibHJ2wOoqvYoKs1PLbN6jc
 7nn9ms0mfGWWhV9Neva4Diybol9ovzGSQd0I6kWHnhUDXIjQ27TdfJa7GyljRjDGd4
 xCsmmBbBFVYqSWIESHfUW0T2YeGhb38gP3CXJayKDQU8R/N08dimWPzixjo9IZxOev
 8Dec55YCdS1Sf+cjrdmstmOK7dEEiaJq0M6H7im6WmB3KJJ9XD3LFNOgcrrqfm3fi3
 QW83eC/n+pXNw==
Received: from scripts.lp.internal (localhost [127.0.0.1])
 by scripts.lp.internal (Postfix) with ESMTP id 4A5BB7E071
 for <apparmor@lists.ubuntu.com>; Fri, 24 Apr 2026 06:05:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Apr 2026 05:59:18 -0000
From: =?utf-8?q?=F0=9F=A4=96_prod-kernel-team-janitor?=
 <1117804@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=apparmor; status=Confirmed; importance=Low;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=audit; component=main;
 status=Confirmed; importance=Low; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=linux; component=main;
 status=Invalid; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: apparmor cscc kernel-autoclosed kernel-autoclosed-invalid
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bigon guydewinton intrigeri jjohansen jttoivon
 prod-kernel-team-janitor seth-arnold talkless tyhicks ubuntu-kernel-bot
 xalares
X-Launchpad-Bug-Reporter: Tyler Hicks (tyhicks)
X-Launchpad-Bug-Modifier: =?utf-8?q?=F0=9F=A4=96_prod-kernel-team-janitor_=28prod-kernel-team-janitor=29?=
References: <20130206233135.28570.36525.malonedeb@soybean.canonical.com>
Message-Id: <177701035823.3502448.55481435516015344.malone@juju-98d295-prod-launchpad-4>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="84546f936f2aea981f70239b7fca4e5b7eea6136";
 Instance="launchpad-scripts"
X-Launchpad-Hash: 2f9eca865d9a525abd905db1e87d50870274f1b1
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
X-Rspamd-Queue-Id: 55EBA45A239
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	R_DKIM_REJECT(1.00)[launchpad.net:s=20210803];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[launchpad.net : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[launchpad.net:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[1117804@bugs.launchpad.net];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1117804@bugs.launchpad.net,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	NEURAL_HAM(-0.00)[-0.927];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[launchpad.net:url,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,bugs.launchpad.net:replyto]

The task "linux (Ubuntu)" has been closed automatically because
requested additional information has not been added.

If this issue is still present in a supported Ubuntu kernel, please
reopen the task and provide the requested information, and any other
updated details.

This action was performed by an automated process maintained by the
Ubuntu Kernel Team.

** Tags added: kernel-autoclosed kernel-autoclosed-invalid

** Changed in: linux (Ubuntu)
       Status: Incomplete =3D> Invalid

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
  Invalid

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



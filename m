Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pwciMLj2VmqgDgEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 15 Jul 2026 04:55:52 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 468F375A28E
	for <lists+apparmor@lfdr.de>; Wed, 15 Jul 2026 04:55:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=launchpad.net header.s=20210803 header.b=kCDu2rmv;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=launchpad.net (policy=none)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wjpmX-00064H-0c; Wed, 15 Jul 2026 02:55:33 +0000
Received: from smtp-relay-services-1.internal ([10.131.114.214]
 helo=smtp-relay-services-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <noreply@launchpad.net>)
 id 1wjpmT-000645-A3
 for apparmor@lists.ubuntu.com; Wed, 15 Jul 2026 02:55:29 +0000
Received: from scripts.lp.internal (scripts.lp.internal [10.131.215.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 723E140037
 for <apparmor@lists.ubuntu.com>; Wed, 15 Jul 2026 02:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1784084128;
 bh=jhQSkhPdSyApKZY3jQDgEYRAebAfxjoVGTfWv5Qx+aU=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=kCDu2rmvLLftfVaveR0Kd9wjzIJ3gP8ZjcbNIfwgyTuoI5HPLXP38/IVHZkaVPLHK
 BjO56vojUJAnDaU/ulzsDOaHIB1Xfx8jq3nv/sqDhPcszcuAZebTxp0jPRVq/nyjdc
 v0F1DB9sLUgfLZ30y6xfJdFE0Z3zhlwe8/Zs83Z1S+1wYzjn0InQ0ARYbDHm3dYkcN
 kyGhjnvypAQY88Hqi/cqqDzSROGm1P+/nUhhcIzosJCzT3bfX2bi1bE2cX4JJ0VmYj
 CrzZ9XTia9SBJWqB7EJRcljL9qRXbxdvR/3T6eBwdISa2NJathWSF6yfsMYqz7Zewr
 zq+H6RnFlXzOQ==
Received: from scripts.lp.internal (localhost [127.0.0.1])
 by scripts.lp.internal (Postfix) with ESMTP id 5D7587EB27
 for <apparmor@lists.ubuntu.com>; Wed, 15 Jul 2026 02:55:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 02:39:45 -0000
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
Message-Id: <178408318737.738033.7897198644086808417.launchpad@juju-98d295-prod-launchpad-56>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7cbed6e13f6cda8233e876935bcf16273b753df1";
 Instance="launchpad-scripts"
X-Launchpad-Hash: ab5617e6961aaf11ecd905de62f032f370cdd7fe
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[juju-98d295-prod-launchpad-56:mid,suse.com:url,bugs.launchpad.net:from_mime,bugs.launchpad.net:replyto,lists.ubuntu.com:from_smtp,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 468F375A28E

** Description changed:

  [ Impact ]
 =20
- =C2=A0* The following command should display all AVC denials: `ausearch
- --message AVC`; however, it doesn't work:
+ =C2=A0* The following command should display all AppArmor AVC events:
+ `ausearch --message AVC`; however, it doesn't work:
 =20
  ```
  yachie@virtual:/etc/apparmor.d$ ausearch --message AVC
  <no matches>
  ```
 =20
  =C2=A0* Users currently must inspect `/var/log/audit.log` to find the mis=
sing
  AppArmor AVC events:
 =20
  ```
  yachie@virtual:/etc/apparmor.d$ sudo cat /var/log/audit.log
  type=3DAVC msg=3Daudit(1774470501.870:1117918): apparmor=3D"DENIED" opera=
tion=3D"open" class=3D"file" profile=3D"rsyslogd" name=3D"/proc/2009624/cmd=
line" pid=3D106062 comm=3D"in:imuxsock" requested_mask=3D"r" denied_mask=3D=
"r" fsuid=3D0 ouid=3D0 FSUID=3D"root" OUID=3D"root"
  type=3DAVC msg=3Daudit(1774470501.927:1117919): apparmor=3D"DENIED" opera=
tion=3D"open" class=3D"file" profile=3D"rsyslogd" name=3D"/proc/2009636/cmd=
line" pid=3D106062 comm=3D"in:imuxsock" requested_mask=3D"r" denied_mask=3D=
"r" fsuid=3D0 ouid=3D0 FSUID=3D"root" OUID=3D"root"
  ```
 =20
  =C2=A0* The root cause is that `ausearch` is checking for a `tclass` fiel=
d in
  the AppArmor events, because the AppArmor is using event id `1400`
  (assigned to SELinux) instead of `1500`.
 =20
  =C2=A0* AppArmor events don't have a `tclass` field, so `ausearch` treats
  every AppArmor event as 'malformed' and hides them. We can reveal the
  'malformed' events with the `--debug` flag:
 =20
  =C2=A0```
  yachie@virtual:~$ ausearch --message AVC --debug
  ( ... a ton of unrelated events ... )
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.176:61=
6): apparmor=3D"AUDIT" operation=3D"change_onexec" class=3D"file" info=3D"c=
hange_profile unprivileged unconfined converted to stacking" profile=3D"unc=
onfined" name=3D"lsb_release" pid=3D5443 comm=3D"aa-exec"
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:61=
7): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/nsswitch.conf" pid=3D5443 comm=3D"bash" requested_mask=
=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:61=
8): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/passwd" pid=3D5443 comm=3D"bash" requested_mask=3D"r" d=
enied_mask=3D"r" fsuid=3D1000 ouid=3D0
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:61=
9): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/bash.bashrc" pid=3D5443 comm=3D"bash" requested_mask=3D=
"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
0): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/home/yachie/.bashrc" pid=3D5443 comm=3D"bash" requested_mas=
k=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D1000
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
1): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/home/yachie/.bash_history" pid=3D5443 comm=3D"bash" request=
ed_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D1000
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
2): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/home/yachie/.bash_history" pid=3D5443 comm=3D"bash" request=
ed_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D1000
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
3): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/inputrc" pid=3D5443 comm=3D"bash" requested_mask=3D"r" =
denied_mask=3D"r" fsuid=3D1000 ouid=3D0
  <no matches>
  =C2=A0```
 =20
  =C2=A0* This bug makes `auditd` very difficult to use on Ubuntu: having t=
he
  `auditd` package installed hides AVC events from the kernel log AND
  `ausearch` doesn't reveal them, making AppArmor events seemingly vanish
  unless you know where to look.
 =20
  [ Test plan ]
 =20
  # Install the relevant packages
  1. sudo apt install apparmor auditd
 =20
  # Run the reproducer
  2. aa-exec --profile=3Dlsb_release bash # generates a ton of denials; see=
 below:
  ```
  root@jammy-vm:~# aa-exec --profile lsb_release bash
  bash: /etc/bash.bashrc: Permission denied
  bash: /root/.bashrc: Permission denied
  bash-5.1#
  exit
  ```
 =20
  # Run `ausearch` and search for AVC events
  3. ausearch --message AVC
 =20
  3a. Unpatched package output (fail):
  ```
  root@jammy-vm:~# ausearch --message AVC
  <no matches>
  ```
 =20
  3b. Patched package output (success):
  ```
  root@jammy-vm:~# ausearch --message AVC
  ----
  time->Tue Jul 14 21:03:18 2026
  type=3DPROCTITLE msg=3Daudit(1784062998.789:100): proctitle=3D"bash"
  type=3DSYSCALL msg=3Daudit(1784062998.789:100): arch=3Dc000003e syscall=
=3D257 success=3Dno exit=3D-13 a0=3Dffffff9c a1=3D7f6a7274c150 a2=3D80000 a=
3=3D0 items=3D0 ppid=3D562 pid=3D3449 auid=3D4294967295 uid=3D0 gid=3D0 eui=
d=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dpts0 ses=3D42949=
67295 comm=3D"bash" exe=3D"/usr/bin/bash" subj=3Dlsb_release key=3D(null)
  type=3DAVC msg=3Daudit(1784062998.789:100): apparmor=3D"DENIED" operation=
=3D"open" profile=3D"lsb_release" name=3D"/etc/nsswitch.conf" pid=3D3449 co=
mm=3D"bash" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D0 ouid=3D0
  ----
  time->Tue Jul 14 21:03:18 2026
  type=3DPROCTITLE msg=3Daudit(1784062998.789:101): proctitle=3D"bash"
  type=3DSYSCALL msg=3Daudit(1784062998.789:101): arch=3Dc000003e syscall=
=3D257 success=3Dno exit=3D-13 a0=3Dffffff9c a1=3D7f6a7274c2ac a2=3D80000 a=
3=3D0 items=3D0 ppid=3D562 pid=3D3449 auid=3D4294967295 uid=3D0 gid=3D0 eui=
d=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dpts0 ses=3D42949=
67295 comm=3D"bash" exe=3D"/usr/bin/bash" subj=3Dlsb_release key=3D(null)
  type=3DAVC msg=3Daudit(1784062998.789:101): apparmor=3D"DENIED" operation=
=3D"open" profile=3D"lsb_release" name=3D"/etc/passwd" pid=3D3449 comm=3D"b=
ash" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D0 ouid=3D0
  ----
  ( ...continues )
  ```
 =20
  [ Where problems could occur ]
 =20
  =C2=A0* Currently, all AppArmor events are treated as 'malformed' SELinux
  events when they are actually well-formed AppArmor events.
 =20
  =C2=A0* This patch modifies the filtration behavior of `ausearch` by maki=
ng
  the `tclass` field optional, thus making AppArmor events be treated as
  well-formed SELinux events.
 =20
  =C2=A0* The regression risk with this patch is such that potentially well-
  formed events will be hidden by `ausearch` unintentionally, or truly
  malformed events will be allowed past the filter.
 =20
  =C2=A0* One major caveat is that regressions with respect to actual SELin=
ux
  events are difficult to test on Ubuntu; some malformed SELinux events
  would potenitally be allowed through the filter with this patch.
 =20
  [ Other info ]
 =20
  =C2=A0* Debian likely doesn't want this patch, as Debian officially won't=
 be
  making any changes until upstream does [3].
 =20
  =C2=A0* Upstream can't move the AppArmor event id to the `1500` range any
  time soon. AppArmor was moved to the `1400` range to align with the
  Linux kernel LSM infrastructure [2]
 =20
  =C2=A0* This patch comes from SUSE; they've been carrying it for well ove=
r a
  decade [4], and they seem to still be carrying it even after switching
  to SELinux by default [5].
 =20
  Targeted releases: All currently supported releases and all releases
  moving forward until AppArmor moves back to the `1500` event range.
 =20
  [1] Debian bug: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D872726
  [2] AA using 1400 reason: https://bugs.debian.org/cgi-bin/bugreport.cgi?b=
ug=3D872726#39
  [3] Debian `wontfix` closure: https://bugs.debian.org/cgi-bin/bugreport.c=
gi?bug=3D872726#88
  [4] SUSE KB: https://support.scc.suse.com/s/kb/audit-log-file-that-has-th=
e-apparmor-AVC-entries-that-ausearch-can-t-read-1583239408721?language=3Den=
_US
  [5] SUSE Patch: https://build.opensuse.org/projects/security/packages/aud=
it/files/audit-ausearch-do-not-require-tclass.patch
 =20
  [ Original bug (for posterity after over a decade) ]
 =20
  The following command should display all AVC denials:
 =20
  ausearch -m avc
 =20
  However, it doesn't work with AppArmor denials. Here's a quick test case
  to generate a denial, search for it with ausearch, and see that no
  messages are displayed:
 =20
  $ aa-exec -p /usr/sbin/tcpdump cat /proc/self/attr/current
  cat: /proc/self/attr/current: Permission denied
  $ sudo ausearch -m avc -c cat
  <no matches>
 =20
  ausearch claims that there are no matches, but there's a matching audit
  message if you look in audit.log:
 =20
  type=3DAVC msg=3Daudit(1360193426.539:64): apparmor=3D"DENIED"
  operation=3D"open" parent=3D8253 profile=3D"/usr/sbin/tcpdump"
  name=3D"/proc/8485/attr/current" pid=3D8485 comm=3D"cat" requested_mask=
=3D"r"
  denied_mask=3D"r" fsuid=3D1000 ouid=3D1000

** Description changed:

  [ Impact ]
 =20
  =C2=A0* The following command should display all AppArmor AVC events:
  `ausearch --message AVC`; however, it doesn't work:
 =20
  ```
  yachie@virtual:/etc/apparmor.d$ ausearch --message AVC
  <no matches>
  ```
 =20
  =C2=A0* Users currently must inspect `/var/log/audit.log` to find the mis=
sing
  AppArmor AVC events:
 =20
  ```
  yachie@virtual:/etc/apparmor.d$ sudo cat /var/log/audit.log
  type=3DAVC msg=3Daudit(1774470501.870:1117918): apparmor=3D"DENIED" opera=
tion=3D"open" class=3D"file" profile=3D"rsyslogd" name=3D"/proc/2009624/cmd=
line" pid=3D106062 comm=3D"in:imuxsock" requested_mask=3D"r" denied_mask=3D=
"r" fsuid=3D0 ouid=3D0 FSUID=3D"root" OUID=3D"root"
  type=3DAVC msg=3Daudit(1774470501.927:1117919): apparmor=3D"DENIED" opera=
tion=3D"open" class=3D"file" profile=3D"rsyslogd" name=3D"/proc/2009636/cmd=
line" pid=3D106062 comm=3D"in:imuxsock" requested_mask=3D"r" denied_mask=3D=
"r" fsuid=3D0 ouid=3D0 FSUID=3D"root" OUID=3D"root"
  ```
 =20
  =C2=A0* The root cause is that `ausearch` is checking for a `tclass` fiel=
d in
- the AppArmor events, because the AppArmor is using event id `1400`
- (assigned to SELinux) instead of `1500`.
+ the AppArmor events, because AppArmor is using event id `1400` (assigned
+ to SELinux) instead of `1500`.
 =20
  =C2=A0* AppArmor events don't have a `tclass` field, so `ausearch` treats
  every AppArmor event as 'malformed' and hides them. We can reveal the
  'malformed' events with the `--debug` flag:
 =20
  =C2=A0```
  yachie@virtual:~$ ausearch --message AVC --debug
  ( ... a ton of unrelated events ... )
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.176:61=
6): apparmor=3D"AUDIT" operation=3D"change_onexec" class=3D"file" info=3D"c=
hange_profile unprivileged unconfined converted to stacking" profile=3D"unc=
onfined" name=3D"lsb_release" pid=3D5443 comm=3D"aa-exec"
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:61=
7): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/nsswitch.conf" pid=3D5443 comm=3D"bash" requested_mask=
=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:61=
8): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/passwd" pid=3D5443 comm=3D"bash" requested_mask=3D"r" d=
enied_mask=3D"r" fsuid=3D1000 ouid=3D0
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:61=
9): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/bash.bashrc" pid=3D5443 comm=3D"bash" requested_mask=3D=
"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
0): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/home/yachie/.bashrc" pid=3D5443 comm=3D"bash" requested_mas=
k=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D1000
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
1): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/home/yachie/.bash_history" pid=3D5443 comm=3D"bash" request=
ed_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D1000
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
2): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/home/yachie/.bash_history" pid=3D5443 comm=3D"bash" request=
ed_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D1000
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
3): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/inputrc" pid=3D5443 comm=3D"bash" requested_mask=3D"r" =
denied_mask=3D"r" fsuid=3D1000 ouid=3D0
  <no matches>
  =C2=A0```
 =20
  =C2=A0* This bug makes `auditd` very difficult to use on Ubuntu: having t=
he
  `auditd` package installed hides AVC events from the kernel log AND
  `ausearch` doesn't reveal them, making AppArmor events seemingly vanish
  unless you know where to look.
 =20
  [ Test plan ]
 =20
  # Install the relevant packages
  1. sudo apt install apparmor auditd
 =20
  # Run the reproducer
  2. aa-exec --profile=3Dlsb_release bash # generates a ton of denials; see=
 below:
  ```
  root@jammy-vm:~# aa-exec --profile lsb_release bash
  bash: /etc/bash.bashrc: Permission denied
  bash: /root/.bashrc: Permission denied
  bash-5.1#
  exit
  ```
 =20
  # Run `ausearch` and search for AVC events
  3. ausearch --message AVC
 =20
  3a. Unpatched package output (fail):
  ```
  root@jammy-vm:~# ausearch --message AVC
  <no matches>
  ```
 =20
  3b. Patched package output (success):
  ```
  root@jammy-vm:~# ausearch --message AVC
  ----
  time->Tue Jul 14 21:03:18 2026
  type=3DPROCTITLE msg=3Daudit(1784062998.789:100): proctitle=3D"bash"
  type=3DSYSCALL msg=3Daudit(1784062998.789:100): arch=3Dc000003e syscall=
=3D257 success=3Dno exit=3D-13 a0=3Dffffff9c a1=3D7f6a7274c150 a2=3D80000 a=
3=3D0 items=3D0 ppid=3D562 pid=3D3449 auid=3D4294967295 uid=3D0 gid=3D0 eui=
d=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dpts0 ses=3D42949=
67295 comm=3D"bash" exe=3D"/usr/bin/bash" subj=3Dlsb_release key=3D(null)
  type=3DAVC msg=3Daudit(1784062998.789:100): apparmor=3D"DENIED" operation=
=3D"open" profile=3D"lsb_release" name=3D"/etc/nsswitch.conf" pid=3D3449 co=
mm=3D"bash" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D0 ouid=3D0
  ----
  time->Tue Jul 14 21:03:18 2026
  type=3DPROCTITLE msg=3Daudit(1784062998.789:101): proctitle=3D"bash"
  type=3DSYSCALL msg=3Daudit(1784062998.789:101): arch=3Dc000003e syscall=
=3D257 success=3Dno exit=3D-13 a0=3Dffffff9c a1=3D7f6a7274c2ac a2=3D80000 a=
3=3D0 items=3D0 ppid=3D562 pid=3D3449 auid=3D4294967295 uid=3D0 gid=3D0 eui=
d=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dpts0 ses=3D42949=
67295 comm=3D"bash" exe=3D"/usr/bin/bash" subj=3Dlsb_release key=3D(null)
  type=3DAVC msg=3Daudit(1784062998.789:101): apparmor=3D"DENIED" operation=
=3D"open" profile=3D"lsb_release" name=3D"/etc/passwd" pid=3D3449 comm=3D"b=
ash" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D0 ouid=3D0
  ----
  ( ...continues )
  ```
 =20
  [ Where problems could occur ]
 =20
  =C2=A0* Currently, all AppArmor events are treated as 'malformed' SELinux
  events when they are actually well-formed AppArmor events.
 =20
  =C2=A0* This patch modifies the filtration behavior of `ausearch` by maki=
ng
  the `tclass` field optional, thus making AppArmor events be treated as
  well-formed SELinux events.
 =20
  =C2=A0* The regression risk with this patch is such that potentially well-
  formed events will be hidden by `ausearch` unintentionally, or truly
  malformed events will be allowed past the filter.
 =20
  =C2=A0* One major caveat is that regressions with respect to actual SELin=
ux
  events are difficult to test on Ubuntu; some malformed SELinux events
  would potenitally be allowed through the filter with this patch.
 =20
  [ Other info ]
 =20
  =C2=A0* Debian likely doesn't want this patch, as Debian officially won't=
 be
  making any changes until upstream does [3].
 =20
  =C2=A0* Upstream can't move the AppArmor event id to the `1500` range any
  time soon. AppArmor was moved to the `1400` range to align with the
  Linux kernel LSM infrastructure [2]
 =20
  =C2=A0* This patch comes from SUSE; they've been carrying it for well ove=
r a
  decade [4], and they seem to still be carrying it even after switching
  to SELinux by default [5].
 =20
  Targeted releases: All currently supported releases and all releases
  moving forward until AppArmor moves back to the `1500` event range.
 =20
  [1] Debian bug: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D872726
  [2] AA using 1400 reason: https://bugs.debian.org/cgi-bin/bugreport.cgi?b=
ug=3D872726#39
  [3] Debian `wontfix` closure: https://bugs.debian.org/cgi-bin/bugreport.c=
gi?bug=3D872726#88
  [4] SUSE KB: https://support.scc.suse.com/s/kb/audit-log-file-that-has-th=
e-apparmor-AVC-entries-that-ausearch-can-t-read-1583239408721?language=3Den=
_US
  [5] SUSE Patch: https://build.opensuse.org/projects/security/packages/aud=
it/files/audit-ausearch-do-not-require-tclass.patch
 =20
  [ Original bug (for posterity after over a decade) ]
 =20
  The following command should display all AVC denials:
 =20
  ausearch -m avc
 =20
  However, it doesn't work with AppArmor denials. Here's a quick test case
  to generate a denial, search for it with ausearch, and see that no
  messages are displayed:
 =20
  $ aa-exec -p /usr/sbin/tcpdump cat /proc/self/attr/current
  cat: /proc/self/attr/current: Permission denied
  $ sudo ausearch -m avc -c cat
  <no matches>
 =20
  ausearch claims that there are no matches, but there's a matching audit
  message if you look in audit.log:
 =20
  type=3DAVC msg=3Daudit(1360193426.539:64): apparmor=3D"DENIED"
  operation=3D"open" parent=3D8253 profile=3D"/usr/sbin/tcpdump"
  name=3D"/proc/8485/attr/current" pid=3D8485 comm=3D"cat" requested_mask=
=3D"r"
  denied_mask=3D"r" fsuid=3D1000 ouid=3D1000

** Description changed:

  [ Impact ]
 =20
  =C2=A0* The following command should display all AppArmor AVC events:
  `ausearch --message AVC`; however, it doesn't work:
 =20
  ```
  yachie@virtual:/etc/apparmor.d$ ausearch --message AVC
  <no matches>
  ```
 =20
  =C2=A0* Users currently must inspect `/var/log/audit.log` to find the mis=
sing
  AppArmor AVC events:
 =20
  ```
  yachie@virtual:/etc/apparmor.d$ sudo cat /var/log/audit.log
  type=3DAVC msg=3Daudit(1774470501.870:1117918): apparmor=3D"DENIED" opera=
tion=3D"open" class=3D"file" profile=3D"rsyslogd" name=3D"/proc/2009624/cmd=
line" pid=3D106062 comm=3D"in:imuxsock" requested_mask=3D"r" denied_mask=3D=
"r" fsuid=3D0 ouid=3D0 FSUID=3D"root" OUID=3D"root"
  type=3DAVC msg=3Daudit(1774470501.927:1117919): apparmor=3D"DENIED" opera=
tion=3D"open" class=3D"file" profile=3D"rsyslogd" name=3D"/proc/2009636/cmd=
line" pid=3D106062 comm=3D"in:imuxsock" requested_mask=3D"r" denied_mask=3D=
"r" fsuid=3D0 ouid=3D0 FSUID=3D"root" OUID=3D"root"
  ```
 =20
  =C2=A0* The root cause is that `ausearch` is checking for a `tclass` fiel=
d in
  the AppArmor events, because AppArmor is using event id `1400` (assigned
  to SELinux) instead of `1500`.
 =20
  =C2=A0* AppArmor events don't have a `tclass` field, so `ausearch` treats
  every AppArmor event as 'malformed' and hides them. We can reveal the
  'malformed' events with the `--debug` flag:
 =20
  =C2=A0```
  yachie@virtual:~$ ausearch --message AVC --debug
  ( ... a ton of unrelated events ... )
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.176:61=
6): apparmor=3D"AUDIT" operation=3D"change_onexec" class=3D"file" info=3D"c=
hange_profile unprivileged unconfined converted to stacking" profile=3D"unc=
onfined" name=3D"lsb_release" pid=3D5443 comm=3D"aa-exec"
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:61=
7): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/nsswitch.conf" pid=3D5443 comm=3D"bash" requested_mask=
=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:61=
8): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/passwd" pid=3D5443 comm=3D"bash" requested_mask=3D"r" d=
enied_mask=3D"r" fsuid=3D1000 ouid=3D0
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:61=
9): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/bash.bashrc" pid=3D5443 comm=3D"bash" requested_mask=3D=
"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
0): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/home/yachie/.bashrc" pid=3D5443 comm=3D"bash" requested_mas=
k=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D1000
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
1): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/home/yachie/.bash_history" pid=3D5443 comm=3D"bash" request=
ed_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D1000
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
2): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/home/yachie/.bash_history" pid=3D5443 comm=3D"bash" request=
ed_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D1000
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
3): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/inputrc" pid=3D5443 comm=3D"bash" requested_mask=3D"r" =
denied_mask=3D"r" fsuid=3D1000 ouid=3D0
  <no matches>
  =C2=A0```
 =20
  =C2=A0* This bug makes `auditd` very difficult to use on Ubuntu: having t=
he
  `auditd` package installed hides AVC events from the kernel log AND
  `ausearch` doesn't reveal them, making AppArmor events seemingly vanish
  unless you know where to look.
 =20
  [ Test plan ]
 =20
  # Install the relevant packages
  1. sudo apt install apparmor auditd
 =20
  # Run the reproducer
  2. aa-exec --profile=3Dlsb_release bash # generates a ton of denials; see=
 below:
  ```
  root@jammy-vm:~# aa-exec --profile lsb_release bash
  bash: /etc/bash.bashrc: Permission denied
  bash: /root/.bashrc: Permission denied
  bash-5.1#
  exit
  ```
 =20
  # Run `ausearch` and search for AVC events
  3. ausearch --message AVC
 =20
  3a. Unpatched package output (fail):
  ```
  root@jammy-vm:~# ausearch --message AVC
  <no matches>
  ```
 =20
  3b. Patched package output (success):
  ```
  root@jammy-vm:~# ausearch --message AVC
  ----
  time->Tue Jul 14 21:03:18 2026
  type=3DPROCTITLE msg=3Daudit(1784062998.789:100): proctitle=3D"bash"
  type=3DSYSCALL msg=3Daudit(1784062998.789:100): arch=3Dc000003e syscall=
=3D257 success=3Dno exit=3D-13 a0=3Dffffff9c a1=3D7f6a7274c150 a2=3D80000 a=
3=3D0 items=3D0 ppid=3D562 pid=3D3449 auid=3D4294967295 uid=3D0 gid=3D0 eui=
d=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dpts0 ses=3D42949=
67295 comm=3D"bash" exe=3D"/usr/bin/bash" subj=3Dlsb_release key=3D(null)
  type=3DAVC msg=3Daudit(1784062998.789:100): apparmor=3D"DENIED" operation=
=3D"open" profile=3D"lsb_release" name=3D"/etc/nsswitch.conf" pid=3D3449 co=
mm=3D"bash" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D0 ouid=3D0
  ----
  time->Tue Jul 14 21:03:18 2026
  type=3DPROCTITLE msg=3Daudit(1784062998.789:101): proctitle=3D"bash"
  type=3DSYSCALL msg=3Daudit(1784062998.789:101): arch=3Dc000003e syscall=
=3D257 success=3Dno exit=3D-13 a0=3Dffffff9c a1=3D7f6a7274c2ac a2=3D80000 a=
3=3D0 items=3D0 ppid=3D562 pid=3D3449 auid=3D4294967295 uid=3D0 gid=3D0 eui=
d=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dpts0 ses=3D42949=
67295 comm=3D"bash" exe=3D"/usr/bin/bash" subj=3Dlsb_release key=3D(null)
  type=3DAVC msg=3Daudit(1784062998.789:101): apparmor=3D"DENIED" operation=
=3D"open" profile=3D"lsb_release" name=3D"/etc/passwd" pid=3D3449 comm=3D"b=
ash" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D0 ouid=3D0
  ----
  ( ...continues )
  ```
 =20
  [ Where problems could occur ]
 =20
  =C2=A0* Currently, all AppArmor events are treated as 'malformed' SELinux
  events when they are actually well-formed AppArmor events.
 =20
  =C2=A0* This patch modifies the filtration behavior of `ausearch` by maki=
ng
  the `tclass` field optional, thus making AppArmor events be treated as
  well-formed SELinux events.
 =20
  =C2=A0* The regression risk with this patch is such that potentially well-
  formed events will be hidden by `ausearch` unintentionally, or truly
  malformed events will be allowed past the filter.
 =20
  =C2=A0* One major caveat is that regressions with respect to actual SELin=
ux
  events are difficult to test on Ubuntu; some malformed SELinux events
- would potenitally be allowed through the filter with this patch.
+ would potentially be allowed through the filter with this patch, or
+ well-formed SELinux events hidden. This patch essentially trades
+ correctness in the AppArmor case for correctness in the SELinux case.
 =20
  [ Other info ]
 =20
  =C2=A0* Debian likely doesn't want this patch, as Debian officially won't=
 be
  making any changes until upstream does [3].
 =20
- =C2=A0* Upstream can't move the AppArmor event id to the `1500` range any
- time soon. AppArmor was moved to the `1400` range to align with the
- Linux kernel LSM infrastructure [2]
+ =C2=A0* Upstream `audit` can't move the AppArmor event id to the `1500` r=
ange
+ any time soon. AppArmor was moved to the `1400` range to align with the
+ Linux kernel LSM infrastructure [2].
 =20
  =C2=A0* This patch comes from SUSE; they've been carrying it for well ove=
r a
  decade [4], and they seem to still be carrying it even after switching
  to SELinux by default [5].
 =20
  Targeted releases: All currently supported releases and all releases
  moving forward until AppArmor moves back to the `1500` event range.
 =20
  [1] Debian bug: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D872726
  [2] AA using 1400 reason: https://bugs.debian.org/cgi-bin/bugreport.cgi?b=
ug=3D872726#39
  [3] Debian `wontfix` closure: https://bugs.debian.org/cgi-bin/bugreport.c=
gi?bug=3D872726#88
  [4] SUSE KB: https://support.scc.suse.com/s/kb/audit-log-file-that-has-th=
e-apparmor-AVC-entries-that-ausearch-can-t-read-1583239408721?language=3Den=
_US
  [5] SUSE Patch: https://build.opensuse.org/projects/security/packages/aud=
it/files/audit-ausearch-do-not-require-tclass.patch
 =20
  [ Original bug (for posterity after over a decade) ]
 =20
  The following command should display all AVC denials:
 =20
  ausearch -m avc
 =20
  However, it doesn't work with AppArmor denials. Here's a quick test case
  to generate a denial, search for it with ausearch, and see that no
  messages are displayed:
 =20
  $ aa-exec -p /usr/sbin/tcpdump cat /proc/self/attr/current
  cat: /proc/self/attr/current: Permission denied
  $ sudo ausearch -m avc -c cat
  <no matches>
 =20
  ausearch claims that there are no matches, but there's a matching audit
  message if you look in audit.log:
 =20
  type=3DAVC msg=3Daudit(1360193426.539:64): apparmor=3D"DENIED"
  operation=3D"open" parent=3D8253 profile=3D"/usr/sbin/tcpdump"
  name=3D"/proc/8485/attr/current" pid=3D8485 comm=3D"cat" requested_mask=
=3D"r"
  denied_mask=3D"r" fsuid=3D1000 ouid=3D1000

** Description changed:

  [ Impact ]
 =20
  =C2=A0* The following command should display all AppArmor AVC events:
  `ausearch --message AVC`; however, it doesn't work:
 =20
  ```
  yachie@virtual:/etc/apparmor.d$ ausearch --message AVC
  <no matches>
  ```
 =20
  =C2=A0* Users currently must inspect `/var/log/audit.log` to find the mis=
sing
  AppArmor AVC events:
 =20
  ```
  yachie@virtual:/etc/apparmor.d$ sudo cat /var/log/audit.log
  type=3DAVC msg=3Daudit(1774470501.870:1117918): apparmor=3D"DENIED" opera=
tion=3D"open" class=3D"file" profile=3D"rsyslogd" name=3D"/proc/2009624/cmd=
line" pid=3D106062 comm=3D"in:imuxsock" requested_mask=3D"r" denied_mask=3D=
"r" fsuid=3D0 ouid=3D0 FSUID=3D"root" OUID=3D"root"
  type=3DAVC msg=3Daudit(1774470501.927:1117919): apparmor=3D"DENIED" opera=
tion=3D"open" class=3D"file" profile=3D"rsyslogd" name=3D"/proc/2009636/cmd=
line" pid=3D106062 comm=3D"in:imuxsock" requested_mask=3D"r" denied_mask=3D=
"r" fsuid=3D0 ouid=3D0 FSUID=3D"root" OUID=3D"root"
  ```
 =20
  =C2=A0* The root cause is that `ausearch` is checking for a `tclass` fiel=
d in
  the AppArmor events, because AppArmor is using event id `1400` (assigned
  to SELinux) instead of `1500`.
 =20
  =C2=A0* AppArmor events don't have a `tclass` field, so `ausearch` treats
  every AppArmor event as 'malformed' and hides them. We can reveal the
  'malformed' events with the `--debug` flag:
 =20
  =C2=A0```
  yachie@virtual:~$ ausearch --message AVC --debug
  ( ... a ton of unrelated events ... )
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.176:61=
6): apparmor=3D"AUDIT" operation=3D"change_onexec" class=3D"file" info=3D"c=
hange_profile unprivileged unconfined converted to stacking" profile=3D"unc=
onfined" name=3D"lsb_release" pid=3D5443 comm=3D"aa-exec"
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:61=
7): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/nsswitch.conf" pid=3D5443 comm=3D"bash" requested_mask=
=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:61=
8): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/passwd" pid=3D5443 comm=3D"bash" requested_mask=3D"r" d=
enied_mask=3D"r" fsuid=3D1000 ouid=3D0
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:61=
9): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/bash.bashrc" pid=3D5443 comm=3D"bash" requested_mask=3D=
"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
0): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/home/yachie/.bashrc" pid=3D5443 comm=3D"bash" requested_mas=
k=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D1000
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
1): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/home/yachie/.bash_history" pid=3D5443 comm=3D"bash" request=
ed_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D1000
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
2): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/home/yachie/.bash_history" pid=3D5443 comm=3D"bash" request=
ed_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D1000
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
3): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/inputrc" pid=3D5443 comm=3D"bash" requested_mask=3D"r" =
denied_mask=3D"r" fsuid=3D1000 ouid=3D0
  <no matches>
  =C2=A0```
 =20
  =C2=A0* This bug makes `auditd` very difficult to use on Ubuntu: having t=
he
  `auditd` package installed hides AVC events from the kernel log AND
  `ausearch` doesn't reveal them, making AppArmor events seemingly vanish
  unless you know where to look.
 =20
  [ Test plan ]
 =20
  # Install the relevant packages
  1. sudo apt install apparmor auditd
 =20
  # Run the reproducer
  2. aa-exec --profile=3Dlsb_release bash # generates a ton of denials; see=
 below:
  ```
  root@jammy-vm:~# aa-exec --profile lsb_release bash
  bash: /etc/bash.bashrc: Permission denied
  bash: /root/.bashrc: Permission denied
  bash-5.1#
  exit
  ```
 =20
  # Run `ausearch` and search for AVC events
  3. ausearch --message AVC
 =20
  3a. Unpatched package output (fail):
  ```
  root@jammy-vm:~# ausearch --message AVC
  <no matches>
  ```
 =20
  3b. Patched package output (success):
  ```
  root@jammy-vm:~# ausearch --message AVC
  ----
  time->Tue Jul 14 21:03:18 2026
  type=3DPROCTITLE msg=3Daudit(1784062998.789:100): proctitle=3D"bash"
  type=3DSYSCALL msg=3Daudit(1784062998.789:100): arch=3Dc000003e syscall=
=3D257 success=3Dno exit=3D-13 a0=3Dffffff9c a1=3D7f6a7274c150 a2=3D80000 a=
3=3D0 items=3D0 ppid=3D562 pid=3D3449 auid=3D4294967295 uid=3D0 gid=3D0 eui=
d=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dpts0 ses=3D42949=
67295 comm=3D"bash" exe=3D"/usr/bin/bash" subj=3Dlsb_release key=3D(null)
  type=3DAVC msg=3Daudit(1784062998.789:100): apparmor=3D"DENIED" operation=
=3D"open" profile=3D"lsb_release" name=3D"/etc/nsswitch.conf" pid=3D3449 co=
mm=3D"bash" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D0 ouid=3D0
  ----
  time->Tue Jul 14 21:03:18 2026
  type=3DPROCTITLE msg=3Daudit(1784062998.789:101): proctitle=3D"bash"
  type=3DSYSCALL msg=3Daudit(1784062998.789:101): arch=3Dc000003e syscall=
=3D257 success=3Dno exit=3D-13 a0=3Dffffff9c a1=3D7f6a7274c2ac a2=3D80000 a=
3=3D0 items=3D0 ppid=3D562 pid=3D3449 auid=3D4294967295 uid=3D0 gid=3D0 eui=
d=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dpts0 ses=3D42949=
67295 comm=3D"bash" exe=3D"/usr/bin/bash" subj=3Dlsb_release key=3D(null)
  type=3DAVC msg=3Daudit(1784062998.789:101): apparmor=3D"DENIED" operation=
=3D"open" profile=3D"lsb_release" name=3D"/etc/passwd" pid=3D3449 comm=3D"b=
ash" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D0 ouid=3D0
  ----
  ( ...continues )
  ```
 =20
  [ Where problems could occur ]
 =20
  =C2=A0* Currently, all AppArmor events are treated as 'malformed' SELinux
  events when they are actually well-formed AppArmor events.
 =20
  =C2=A0* This patch modifies the filtration behavior of `ausearch` by maki=
ng
  the `tclass` field optional, thus making AppArmor events be treated as
  well-formed SELinux events.
 =20
  =C2=A0* The regression risk with this patch is such that potentially well-
  formed events will be hidden by `ausearch` unintentionally, or truly
  malformed events will be allowed past the filter.
 =20
  =C2=A0* One major caveat is that regressions with respect to actual SELin=
ux
  events are difficult to test on Ubuntu; some malformed SELinux events
  would potentially be allowed through the filter with this patch, or
  well-formed SELinux events hidden. This patch essentially trades
- correctness in the AppArmor case for correctness in the SELinux case.
+ correctness in the SELinux case for correctness in the AppArmor case.
 =20
  [ Other info ]
 =20
  =C2=A0* Debian likely doesn't want this patch, as Debian officially won't=
 be
  making any changes until upstream does [3].
 =20
  =C2=A0* Upstream `audit` can't move the AppArmor event id to the `1500` r=
ange
  any time soon. AppArmor was moved to the `1400` range to align with the
  Linux kernel LSM infrastructure [2].
 =20
  =C2=A0* This patch comes from SUSE; they've been carrying it for well ove=
r a
  decade [4], and they seem to still be carrying it even after switching
  to SELinux by default [5].
 =20
  Targeted releases: All currently supported releases and all releases
- moving forward until AppArmor moves back to the `1500` event range.
+ moving forward until AppArmor moves back to the `1500` event range or
+ Ubuntu switches to SELinux by default.
 =20
  [1] Debian bug: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D872726
  [2] AA using 1400 reason: https://bugs.debian.org/cgi-bin/bugreport.cgi?b=
ug=3D872726#39
  [3] Debian `wontfix` closure: https://bugs.debian.org/cgi-bin/bugreport.c=
gi?bug=3D872726#88
  [4] SUSE KB: https://support.scc.suse.com/s/kb/audit-log-file-that-has-th=
e-apparmor-AVC-entries-that-ausearch-can-t-read-1583239408721?language=3Den=
_US
  [5] SUSE Patch: https://build.opensuse.org/projects/security/packages/aud=
it/files/audit-ausearch-do-not-require-tclass.patch
 =20
  [ Original bug (for posterity after over a decade) ]
 =20
  The following command should display all AVC denials:
 =20
  ausearch -m avc
 =20
  However, it doesn't work with AppArmor denials. Here's a quick test case
  to generate a denial, search for it with ausearch, and see that no
  messages are displayed:
 =20
  $ aa-exec -p /usr/sbin/tcpdump cat /proc/self/attr/current
  cat: /proc/self/attr/current: Permission denied
  $ sudo ausearch -m avc -c cat
  <no matches>
 =20
  ausearch claims that there are no matches, but there's a matching audit
  message if you look in audit.log:
 =20
  type=3DAVC msg=3Daudit(1360193426.539:64): apparmor=3D"DENIED"
  operation=3D"open" parent=3D8253 profile=3D"/usr/sbin/tcpdump"
  name=3D"/proc/8485/attr/current" pid=3D8485 comm=3D"cat" requested_mask=
=3D"r"
  denied_mask=3D"r" fsuid=3D1000 ouid=3D1000

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
  [ Impact ]

  =C2=A0* The following command should display all AppArmor AVC events:
  `ausearch --message AVC`; however, it doesn't work:

  ```
  yachie@virtual:/etc/apparmor.d$ ausearch --message AVC
  <no matches>
  ```

  =C2=A0* Users currently must inspect `/var/log/audit.log` to find the
  missing AppArmor AVC events:

  ```
  yachie@virtual:/etc/apparmor.d$ sudo cat /var/log/audit.log
  type=3DAVC msg=3Daudit(1774470501.870:1117918): apparmor=3D"DENIED" opera=
tion=3D"open" class=3D"file" profile=3D"rsyslogd" name=3D"/proc/2009624/cmd=
line" pid=3D106062 comm=3D"in:imuxsock" requested_mask=3D"r" denied_mask=3D=
"r" fsuid=3D0 ouid=3D0 FSUID=3D"root" OUID=3D"root"
  type=3DAVC msg=3Daudit(1774470501.927:1117919): apparmor=3D"DENIED" opera=
tion=3D"open" class=3D"file" profile=3D"rsyslogd" name=3D"/proc/2009636/cmd=
line" pid=3D106062 comm=3D"in:imuxsock" requested_mask=3D"r" denied_mask=3D=
"r" fsuid=3D0 ouid=3D0 FSUID=3D"root" OUID=3D"root"
  ```

  =C2=A0* The root cause is that `ausearch` is checking for a `tclass` field
  in the AppArmor events, because AppArmor is using event id `1400`
  (assigned to SELinux) instead of `1500`.

  =C2=A0* AppArmor events don't have a `tclass` field, so `ausearch` treats
  every AppArmor event as 'malformed' and hides them. We can reveal the
  'malformed' events with the `--debug` flag:

  =C2=A0```
  yachie@virtual:~$ ausearch --message AVC --debug
  ( ... a ton of unrelated events ... )
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.176:61=
6): apparmor=3D"AUDIT" operation=3D"change_onexec" class=3D"file" info=3D"c=
hange_profile unprivileged unconfined converted to stacking" profile=3D"unc=
onfined" name=3D"lsb_release" pid=3D5443 comm=3D"aa-exec"
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:61=
7): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/nsswitch.conf" pid=3D5443 comm=3D"bash" requested_mask=
=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:61=
8): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/passwd" pid=3D5443 comm=3D"bash" requested_mask=3D"r" d=
enied_mask=3D"r" fsuid=3D1000 ouid=3D0
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:61=
9): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/bash.bashrc" pid=3D5443 comm=3D"bash" requested_mask=3D=
"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D0
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
0): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/home/yachie/.bashrc" pid=3D5443 comm=3D"bash" requested_mas=
k=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D1000
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
1): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/home/yachie/.bash_history" pid=3D5443 comm=3D"bash" request=
ed_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D1000
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
2): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/home/yachie/.bash_history" pid=3D5443 comm=3D"bash" request=
ed_mask=3D"r" denied_mask=3D"r" fsuid=3D1000 ouid=3D1000
  Malformed event skipped, rc=3D9. type=3DAVC msg=3Daudit(1776888566.177:62=
3): apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"lsb_re=
lease" name=3D"/etc/inputrc" pid=3D5443 comm=3D"bash" requested_mask=3D"r" =
denied_mask=3D"r" fsuid=3D1000 ouid=3D0
  <no matches>
  =C2=A0```

  =C2=A0* This bug makes `auditd` very difficult to use on Ubuntu: having t=
he
  `auditd` package installed hides AVC events from the kernel log AND
  `ausearch` doesn't reveal them, making AppArmor events seemingly
  vanish unless you know where to look.

  [ Test plan ]

  # Install the relevant packages
  1. sudo apt install apparmor auditd

  # Run the reproducer
  2. aa-exec --profile=3Dlsb_release bash # generates a ton of denials; see=
 below:
  ```
  root@jammy-vm:~# aa-exec --profile lsb_release bash
  bash: /etc/bash.bashrc: Permission denied
  bash: /root/.bashrc: Permission denied
  bash-5.1#
  exit
  ```

  # Run `ausearch` and search for AVC events
  3. ausearch --message AVC

  3a. Unpatched package output (fail):
  ```
  root@jammy-vm:~# ausearch --message AVC
  <no matches>
  ```

  3b. Patched package output (success):
  ```
  root@jammy-vm:~# ausearch --message AVC
  ----
  time->Tue Jul 14 21:03:18 2026
  type=3DPROCTITLE msg=3Daudit(1784062998.789:100): proctitle=3D"bash"
  type=3DSYSCALL msg=3Daudit(1784062998.789:100): arch=3Dc000003e syscall=
=3D257 success=3Dno exit=3D-13 a0=3Dffffff9c a1=3D7f6a7274c150 a2=3D80000 a=
3=3D0 items=3D0 ppid=3D562 pid=3D3449 auid=3D4294967295 uid=3D0 gid=3D0 eui=
d=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dpts0 ses=3D42949=
67295 comm=3D"bash" exe=3D"/usr/bin/bash" subj=3Dlsb_release key=3D(null)
  type=3DAVC msg=3Daudit(1784062998.789:100): apparmor=3D"DENIED" operation=
=3D"open" profile=3D"lsb_release" name=3D"/etc/nsswitch.conf" pid=3D3449 co=
mm=3D"bash" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D0 ouid=3D0
  ----
  time->Tue Jul 14 21:03:18 2026
  type=3DPROCTITLE msg=3Daudit(1784062998.789:101): proctitle=3D"bash"
  type=3DSYSCALL msg=3Daudit(1784062998.789:101): arch=3Dc000003e syscall=
=3D257 success=3Dno exit=3D-13 a0=3Dffffff9c a1=3D7f6a7274c2ac a2=3D80000 a=
3=3D0 items=3D0 ppid=3D562 pid=3D3449 auid=3D4294967295 uid=3D0 gid=3D0 eui=
d=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dpts0 ses=3D42949=
67295 comm=3D"bash" exe=3D"/usr/bin/bash" subj=3Dlsb_release key=3D(null)
  type=3DAVC msg=3Daudit(1784062998.789:101): apparmor=3D"DENIED" operation=
=3D"open" profile=3D"lsb_release" name=3D"/etc/passwd" pid=3D3449 comm=3D"b=
ash" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D0 ouid=3D0
  ----
  ( ...continues )
  ```

  [ Where problems could occur ]

  =C2=A0* Currently, all AppArmor events are treated as 'malformed' SELinux
  events when they are actually well-formed AppArmor events.

  =C2=A0* This patch modifies the filtration behavior of `ausearch` by maki=
ng
  the `tclass` field optional, thus making AppArmor events be treated as
  well-formed SELinux events.

  =C2=A0* The regression risk with this patch is such that potentially well-
  formed events will be hidden by `ausearch` unintentionally, or truly
  malformed events will be allowed past the filter.

  =C2=A0* One major caveat is that regressions with respect to actual SELin=
ux
  events are difficult to test on Ubuntu; some malformed SELinux events
  would potentially be allowed through the filter with this patch, or
  well-formed SELinux events hidden. This patch essentially trades
  correctness in the SELinux case for correctness in the AppArmor case.

  [ Other info ]

  =C2=A0* Debian likely doesn't want this patch, as Debian officially won't
  be making any changes until upstream does [3].

  =C2=A0* Upstream `audit` can't move the AppArmor event id to the `1500`
  range any time soon. AppArmor was moved to the `1400` range to align
  with the Linux kernel LSM infrastructure [2].

  =C2=A0* This patch comes from SUSE; they've been carrying it for well over
  a decade [4], and they seem to still be carrying it even after
  switching to SELinux by default [5].

  Targeted releases: All currently supported releases and all releases
  moving forward until AppArmor moves back to the `1500` event range or
  Ubuntu switches to SELinux by default.

  [1] Debian bug: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D872726
  [2] AA using 1400 reason: https://bugs.debian.org/cgi-bin/bugreport.cgi?b=
ug=3D872726#39
  [3] Debian `wontfix` closure: https://bugs.debian.org/cgi-bin/bugreport.c=
gi?bug=3D872726#88
  [4] SUSE KB: https://support.scc.suse.com/s/kb/audit-log-file-that-has-th=
e-apparmor-AVC-entries-that-ausearch-can-t-read-1583239408721?language=3Den=
_US
  [5] SUSE Patch: https://build.opensuse.org/projects/security/packages/aud=
it/files/audit-ausearch-do-not-require-tclass.patch

  [ Original bug (for posterity after over a decade) ]

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



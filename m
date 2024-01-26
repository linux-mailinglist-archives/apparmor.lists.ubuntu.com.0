Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A18783D4B4
	for <lists+apparmor@lfdr.de>; Fri, 26 Jan 2024 09:31:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rTHbr-000583-O8; Fri, 26 Jan 2024 08:30:47 +0000
Received: from smtp-relay-services-0.internal ([10.131.114.58]
 helo=smtp-relay-services-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <noreply@launchpad.net>)
 id 1rTHbe-00056R-Kl
 for apparmor@lists.ubuntu.com; Fri, 26 Jan 2024 08:30:36 +0000
Received: from juju-98d295-prod-launchpad-16.localdomain (scripts.lp.internal
 [10.131.215.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 1651F422AA
 for <apparmor@lists.ubuntu.com>; Fri, 26 Jan 2024 08:30:29 +0000 (UTC)
Received: from [10.131.215.246] (localhost [127.0.0.1])
 by juju-98d295-prod-launchpad-16.localdomain (Postfix) with ESMTP id
 D297C7E15F
 for <apparmor@lists.ubuntu.com>; Fri, 26 Jan 2024 08:30:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jan 2024 08:16:02 -0000
From: Maciej Borzecki <2049099@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=snapd; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: maciek-borzecki marcoppenheimer
X-Launchpad-Bug-Reporter: Marc Oppenheimer (marcoppenheimer)
X-Launchpad-Bug-Modifier: Maciej Borzecki (maciek-borzecki)
References: <170500315357.2951651.15872417683793394378.malonedeb@juju-98d295-prod-launchpad-4>
Message-Id: <170625696206.916273.10042018932425493615.malone@juju-98d295-prod-launchpad-2>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="666c6bd52ccc7c38c7d6806b807b117caa7d8b6e";
 Instance="launchpad-scripts"
X-Launchpad-Hash: 9ed96a0aebeeb254741874a01152500641eac9d0
Subject: [apparmor] [Bug 2049099] Re: AppArmor blocking snap install nested
	in LXD container
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

Also on Arch, for the record I see some of the denials even without
installing anything under LXD, simply launching a container is enough:

sty 26 09:03:27 galeon kernel: audit: type=3D1400 audit(1706256207.310:1706=
): apparmor=3D"DENIED" operation=3D"file_inherit" class=3D"net" namespace=
=3D"root//lxd-snapcraft_classic-meerkat_<var-snap-lxd-common-lxd>" profile=
=3D"/snap/snapd/20671/usr/lib/snapd/snap-confine" pid=3D3225810 comm=3D"sna=
p-confine" family=3D"netlink" sock_type=3D
"raw" protocol=3D15 requested_mask=3D"send receive" denied_mask=3D"send rec=
eive"                                                                      =
                                                                           =
                                                                           =
                        =20
sty 26 09:03:27 galeon kernel: audit: type=3D1400 audit(1706256207.320:1707=
): apparmor=3D"DENIED" operation=3D"file_inherit" class=3D"file" namespace=
=3D"root//lxd-snapcraft_classic-meerkat_<var-snap-lxd-common-lxd>" profile=
=3D"snap-update-ns.lxd" name=3D"/apparmor/.null" pid=3D3225828 comm=3D"6" r=
equested_mask=3D"wr" denied_mask=3D"wr" fsu
id=3D1000000 ouid=3D0                                                      =
                                                                           =
                                                                           =
                                                                           =
                      =20
sty 26 09:03:27 galeon kernel: audit: type=3D1400 audit(1706256207.457:1708=
): apparmor=3D"DENIED" operation=3D"file_inherit" class=3D"file" namespace=
=3D"root//lxd-snapcraft_classic-meerkat_<var-snap-lxd-common-lxd>" profile=
=3D"snap.lxd.hook.install" name=3D"/apparmor/.null" pid=3D3225810 comm=3D"s=
nap-exec" requested_mask=3D"wr" denied_ma
sk=3D"wr" fsuid=3D1000000 ouid=3D0
sty 26 09:03:27 galeon kernel: audit: type=3D1400 audit(1706256207.820:1709=
): apparmor=3D"DENIED" operation=3D"file_inherit" class=3D"net" namespace=
=3D"root//lxd-snapcraft_classic-meerkat_<var-snap-lxd-common-lxd>" profile=
=3D"/snap/snapd/20671/usr/lib/snapd/snap-confine" pid=3D3225872 comm=3D"sna=
p-confine" family=3D"unix" sock_type=3D"st
ream" protocol=3D0 requested_mask=3D"send receive" denied_mask=3D"send rece=
ive"
sty 26 09:03:27 galeon kernel: audit: type=3D1400 audit(1706256207.820:1710=
): apparmor=3D"DENIED" operation=3D"file_inherit" class=3D"net" namespace=
=3D"root//lxd-snapcraft_classic-meerkat_<var-snap-lxd-common-lxd>" profile=
=3D"/snap/snapd/20671/usr/lib/snapd/snap-confine" pid=3D3225872 comm=3D"sna=
p-confine" family=3D"unix" sock_type=3D"st
ream" protocol=3D0 requested_mask=3D"send receive" denied_mask=3D"send rece=
ive"
sty 26 09:03:27 galeon kernel: audit: type=3D1400 audit(1706256207.820:1711=
): apparmor=3D"DENIED" operation=3D"file_inherit" class=3D"file" namespace=
=3D"root//lxd-snapcraft_classic-meerkat_<var-snap-lxd-common-lxd>" profile=
=3D"snap.lxd.activate" name=3D"/apparmor/.null" pid=3D3225872 comm=3D"snap-=
exec" requested_mask=3D"wr" denied_mask=3D"
wr" fsuid=3D1000000 ouid=3D0
sty 26 09:03:27 galeon kernel: audit: type=3D1400 audit(1706256207.820:1712=
): apparmor=3D"DENIED" operation=3D"file_inherit" class=3D"file" namespace=
=3D"root//lxd-snapcraft_classic-meerkat_<var-snap-lxd-common-lxd>" profile=
=3D"snap.lxd.activate" name=3D"/apparmor/.null" pid=3D3225872 comm=3D"snap-=
exec" requested_mask=3D"wr" denied_mask=3D"
wr" fsuid=3D1000000 ouid=3D0
sty 26 09:03:27 galeon kernel: audit: type=3D1400 audit(1706256207.830:1713=
): apparmor=3D"DENIED" operation=3D"file_inherit" class=3D"file" namespace=
=3D"root//lxd-snapcraft_classic-meerkat_<var-snap-lxd-common-lxd>" profile=
=3D"/snap/snapd/20671/usr/lib/snapd/snap-confine" name=3D"/apparmor/.null" =
pid=3D3225872 comm=3D"aa-exec" requeste
d_mask=3D"wr" denied_mask=3D"wr" fsuid=3D1000000 ouid=3D0
sty 26 09:03:27 galeon kernel: audit: type=3D1400 audit(1706256207.830:1714=
): apparmor=3D"DENIED" operation=3D"file_inherit" class=3D"file" namespace=
=3D"root//lxd-snapcraft_classic-meerkat_<var-snap-lxd-common-lxd>" profile=
=3D"/snap/snapd/20671/usr/lib/snapd/snap-confine" name=3D"/apparmor/.null" =
pid=3D3225872 comm=3D"aa-exec" requeste
d_mask=3D"wr" denied_mask=3D"wr" fsuid=3D1000000 ouid=3D0
sty 26 09:03:28 galeon kernel: audit: type=3D1400 audit(1706256208.027:1715=
): apparmor=3D"STATUS" operation=3D"profile_replace" info=3D"same as curren=
t profile, skipping" label=3D"lxd-snapcraft_classic-meerkat_</var/snap/lxd/=
common/lxd>//&:lxd-snapcraft_classic-meerkat_<var-snap-lxd-common-lxd>:unco=
nfined" name=3D"/snap/snapd/206
71/usr/lib/snapd/snap-confine" pid=3D3225947 comm=3D"apparmor_parser"

Looking at the apparmor namespace, I'd say this is triggered by
processes executing already inside the container. AFAIU the image (say
ubuntu:22.04) contains a seed which installs lxd inside and so there may
be hooks and services of lxd being run inside the container.

--=20
You received this bug notification because you are a member of AppArmor
Developers, which is subscribed to the bug report.
https://bugs.launchpad.net/bugs/2049099

Title:
  AppArmor blocking snap install nested in LXD container

Status in snapd:
  New

Bug description:
  ##### Context
  I'm on a non-Ubuntu OS (Arch), trying to use Juju on LXD. In doing so, Ju=
ju uses a snap inside an LXD container, and so needs the system to support =
nested AppArmor profiles. `juju-db` is the snap in question, if that helps.

  ##### Issue
  When I try to do this, I get a bunch of AppArmor violations, that go way =
over my head. It's not clear to me what is causing these, but I **suspect**=
 that Ubuntu patches some host-system AppArmor profiles to support this use=
-case, that isn't replicated on other OSs? Not sure, and I don't know who t=
o ask or where to look.

  If any additional information is needed I'd be more than happy to
  provide.

  ###### `snappy-debug` journalctl logs
  [  411.702391] loop11: detected capacity change from 0 to 33408
  [  411.882088] audit: type=3D1400 audit(1704822630.613:257): apparmor=3D"=
STATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"snap-upda=
te-ns.snappy-debug" pid=3D8545 comm=3D"apparmor_parser"
  [  411.927376] audit: type=3D1400 audit(1704822630.659:258): apparmor=3D"=
STATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"snap.snap=
py-debug.scanlog" pid=3D8548 comm=3D"apparmor_parser"
  [  411.927408] audit: type=3D1400 audit(1704822630.659:259): apparmor=3D"=
STATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"snap.snap=
py-debug.audit-arch" pid=3D8546 comm=3D"apparmor_parser"
  [  411.927511] audit: type=3D1400 audit(1704822630.659:260): apparmor=3D"=
STATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"snap.snap=
py-debug.security" pid=3D8550 comm=3D"apparmor_parser"
  [  411.927592] audit: type=3D1400 audit(1704822630.659:261): apparmor=3D"=
STATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"snap.snap=
py-debug.snappy-debug" pid=3D8551 comm=3D"apparmor_parser"
  [  411.927637] audit: type=3D1400 audit(1704822630.659:262): apparmor=3D"=
STATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"snap.snap=
py-debug.id-range" pid=3D8547 comm=3D"apparmor_parser"
  [  411.928038] audit: type=3D1400 audit(1704822630.659:263): apparmor=3D"=
STATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"snap.snap=
py-debug.scmp-sys-resolver" pid=3D8549 comm=3D"apparmor_parser"
  [  412.245557] audit: type=3D1400 audit(1704822630.976:264): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" profile=3D"unconfined" name=3D"/var/lib/snapd/snap/snapd/20671/usr/li=
b/snapd/snap-confine" pid=3D8573 comm=3D"apparmor_parser"
  [  412.245562] audit: type=3D1400 audit(1704822630.976:265): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" profile=3D"unconfined" name=3D"/var/lib/snapd/snap/snapd/20671/usr/li=
b/snapd/snap-confine//mount-namespace-capture-helper" pid=3D8573 comm=3D"ap=
parmor_parser"
  [  412.251680] audit: type=3D1400 audit(1704822630.983:266): apparmor=3D"=
STATUS" operation=3D"profile_replace" profile=3D"unconfined" name=3D"snap-u=
pdate-ns.snappy-debug" pid=3D8575 comm=3D"apparmor_parser"
  [  436.594532] audit: type=3D1400 audit(1704822655.326:273): apparmor=3D"=
DENIED" operation=3D"open" class=3D"file" profile=3D"snap.juju.juju" name=
=3D"/var/lib/snapd/hostfs/etc/ca-certificates/extracted/tls-ca-bundle.pem" =
pid=3D8866 comm=3D"juju" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D100=
0 ouid=3D0
  [  436.955742] audit: type=3D1400 audit(1704822655.686:274): apparmor=3D"=
STATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"lxd_archi=
ve-var-snap-lxd-common-lxd-storage-pools-default-containers-juju-98527a-0" =
pid=3D8915 comm=3D"apparmor_parser"
  [  437.001597] audit: type=3D1400 audit(1704822655.733:275): apparmor=3D"=
STATUS" operation=3D"profile_remove" profile=3D"unconfined" name=3D"lxd_arc=
hive-var-snap-lxd-common-lxd-storage-pools-default-containers-juju-98527a-0=
" pid=3D8920 comm=3D"apparmor_parser"
  [  437.047127] audit: type=3D1400 audit(1704822655.779:276): apparmor=3D"=
STATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"lxd_archi=
ve-var-snap-lxd-common-lxd-storage-pools-default-containers-juju-98527a-0-r=
ootfs" pid=3D8924 comm=3D"apparmor_parser"
  [  438.662197] audit: type=3D1400 audit(1704822657.393:277): apparmor=3D"=
STATUS" operation=3D"profile_remove" profile=3D"unconfined" name=3D"lxd_arc=
hive-var-snap-lxd-common-lxd-storage-pools-default-containers-juju-98527a-0=
-rootfs" pid=3D8947 comm=3D"apparmor_parser"
  [  438.726353] lxdbr0: port 1(vethe8cdef92) entered blocking state
  [  438.726357] lxdbr0: port 1(vethe8cdef92) entered disabled state
  [  438.726363] vethe8cdef92: entered allmulticast mode
  [  438.726404] vethe8cdef92: entered promiscuous mode
  [  438.836408] audit: type=3D1400 audit(1704822657.566:278): apparmor=3D"=
STATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"lxd-juju-=
98527a-0_</var/snap/lxd/common/lxd>" pid=3D9022 comm=3D"apparmor_parser"
  [  438.936964] physF3pxUH: renamed from vethd8d1dfa0
  [  438.967393] eth0: renamed from physF3pxUH
  [  438.983981] lxdbr0: port 1(vethe8cdef92) entered blocking state
  [  438.983985] lxdbr0: port 1(vethe8cdef92) entered forwarding state
  [  439.220648] NOHZ tick-stop error: local softirq work is pending, handl=
er #200!!!
  [  439.262605] audit: type=3D1400 audit(1704822657.993:279): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"nvidia_modprobe" pid=3D9151 comm=3D"apparmor_parser"
  [  439.262990] audit: type=3D1400 audit(1704822657.993:280): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"lsb_release" pid=3D9150 comm=3D"apparmor_parser"
  [  439.263026] audit: type=3D1400 audit(1704822657.993:281): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"nvidia_modprobe//kmod" pid=3D9151 comm=3D"apparmor_parser"
  [  439.271998] audit: type=3D1400 audit(1704822658.003:282): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"tcpdump" pid=3D9154 comm=3D"apparmor_parser"
  [  439.275799] audit: type=3D1400 audit(1704822658.006:283): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"/usr/bin/man" pid=3D9153 comm=3D"apparmor_parser"
  [  439.275958] audit: type=3D1400 audit(1704822658.006:284): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"man_filter" pid=3D9153 comm=3D"apparmor_parser"
  [  439.276194] audit: type=3D1400 audit(1704822658.006:285): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"man_groff" pid=3D9153 comm=3D"apparmor_parser"
  [  439.325135] audit: type=3D1400 audit(1704822658.056:286): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"/usr/lib/NetworkManager/nm-dhcp-client.action" pid=3D9152 comm=3D"app=
armor_parser"
  [  439.325403] audit: type=3D1400 audit(1704822658.056:287): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"/usr/lib/NetworkManager/nm-dhcp-helper" pid=3D9152 comm=3D"apparmor_p=
arser"
  [  439.325644] audit: type=3D1400 audit(1704822658.056:288): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"/usr/lib/connman/scripts/dhclient-script" pid=3D9152 comm=3D"apparmor=
_parser"
  [  439.326140] audit: type=3D1400 audit(1704822658.056:289): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"/{,usr/}sbin/dhclient" pid=3D9152 comm=3D"apparmor_parser"
  [  439.356289] audit: type=3D1400 audit(1704822658.086:290): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"/usr/lib/snapd/snap-confine" pid=3D9155 comm=3D"apparmor_parser"
  [  439.356526] audit: type=3D1400 audit(1704822658.086:291): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"/usr/lib/snapd/snap-confine//mount-namespace-capture-helper" pid=3D91=
55 comm=3D"apparmor_parser"
  [  439.531185] audit: type=3D1400 audit(1704822658.263:292): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"snap-update-ns.lxd" pid=3D9178 comm=3D"apparmor_parser"
  [  439.593477] audit: type=3D1400 audit(1704822658.319:293): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"/snap/snapd/20290/usr/lib/snapd/snap-confine" pid=3D9177 comm=3D"appa=
rmor_parser"
  [  439.593486] audit: type=3D1400 audit(1704822658.319:294): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"/snap/snapd/20290/usr/lib/snapd/snap-confine//mount-namespace-capture=
-helper" pid=3D9177 comm=3D"apparmor_parser"
  [  439.594919] audit: type=3D1400 audit(1704822658.326:295): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"snap.lxd.activate" pid=3D9179 comm=3D"apparmor_parser"
  [  439.609341] audit: type=3D1400 audit(1704822658.339:296): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"snap.lxd.hook.install" pid=3D9185 comm=3D"apparmor_parser"
  [  439.617405] audit: type=3D1400 audit(1704822658.349:297): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"snap.lxd.benchmark" pid=3D9180 comm=3D"apparmor_parser"
  [  439.621261] audit: type=3D1400 audit(1704822658.353:298): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"snap.lxd.hook.remove" pid=3D9186 comm=3D"apparmor_parser"
  [  439.625205] audit: type=3D1400 audit(1704822658.356:299): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"snap.lxd.buginfo" pid=3D9181 comm=3D"apparmor_parser"
  [  439.625267] audit: type=3D1400 audit(1704822658.356:300): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"snap.lxd.check-kernel" pid=3D9182 comm=3D"apparmor_parser"
  [  439.625861] audit: type=3D1400 audit(1704822658.356:301): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"snap.lxd.lxc-to-lxd" pid=3D9188 comm=3D"apparmor_parser"
  [  439.626255] audit: type=3D1400 audit(1704822658.356:302): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"snap.lxd.migrate" pid=3D9190 comm=3D"apparmor_parser"
  [  439.626606] audit: type=3D1400 audit(1704822658.356:303): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"snap.lxd.lxc" pid=3D9187 comm=3D"apparmor_parser"
  [  439.627179] audit: type=3D1400 audit(1704822658.359:304): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"snap.lxd.lxd" pid=3D9189 comm=3D"apparmor_parser"
  [  439.639671] audit: type=3D1400 audit(1704822658.369:305): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"snap.lxd.hook.configure" pid=3D9184 comm=3D"apparmor_parser"
  [  439.642412] audit: type=3D1400 audit(1704822658.373:306): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"snap.lxd.daemon" pid=3D9183 comm=3D"apparmor_parser"
  [  439.645081] audit: type=3D1400 audit(1704822658.376:307): apparmor=3D"=
STATUS" operation=3D"profile_load" label=3D"lxd-juju-98527a-0_</var/snap/lx=
d/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined" na=
me=3D"snap.lxd.user-daemon" pid=3D9191 comm=3D"apparmor_parser"
  [  439.713482] NOHZ tick-stop error: local softirq work is pending, handl=
er #200!!!
  [  441.714898] audit: type=3D1400 audit(1704822660.446:308): apparmor=3D"=
STATUS" operation=3D"profile_replace" label=3D"lxd-juju-98527a-0_</var/snap=
/lxd/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined"=
 name=3D"/snap/snapd/20290/usr/lib/snapd/snap-confine" pid=3D9421 comm=3D"a=
pparmor_parser"
  [  441.756809] audit: type=3D1400 audit(1704822660.489:309): apparmor=3D"=
STATUS" operation=3D"profile_replace" label=3D"lxd-juju-98527a-0_</var/snap=
/lxd/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined"=
 name=3D"/snap/snapd/20290/usr/lib/snapd/snap-confine//mount-namespace-capt=
ure-helper" pid=3D9421 comm=3D"apparmor_parser"
  [  441.760434] audit: type=3D1400 audit(1704822660.493:310): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap-update-ns.lxd" pid=
=3D9423 comm=3D"apparmor_parser"
  [  441.762440] audit: type=3D1400 audit(1704822660.493:311): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.activate" pid=
=3D9424 comm=3D"apparmor_parser"
  [  441.762939] audit: type=3D1400 audit(1704822660.493:312): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.benchmark" pid=
=3D9425 comm=3D"apparmor_parser"
  [  441.763142] audit: type=3D1400 audit(1704822660.493:313): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.buginfo" pid=
=3D9426 comm=3D"apparmor_parser"
  [  441.763213] audit: type=3D1400 audit(1704822660.493:314): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.hook.remove" p=
id=3D9431 comm=3D"apparmor_parser"
  [  441.763364] audit: type=3D1400 audit(1704822660.493:315): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.check-kernel" =
pid=3D9427 comm=3D"apparmor_parser"
  [  441.763491] audit: type=3D1400 audit(1704822660.496:316): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.hook.install" =
pid=3D9430 comm=3D"apparmor_parser"
  [  441.763665] audit: type=3D1400 audit(1704822660.496:317): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.lxc-to-lxd" pi=
d=3D9433 comm=3D"apparmor_parser"
  [  441.763688] audit: type=3D1400 audit(1704822660.496:318): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.lxd" pid=3D943=
4 comm=3D"apparmor_parser"
  [  441.763742] audit: type=3D1400 audit(1704822660.496:319): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.migrate" pid=
=3D9435 comm=3D"apparmor_parser"
  [  441.763869] audit: type=3D1400 audit(1704822660.496:320): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.lxc" pid=3D943=
2 comm=3D"apparmor_parser"
  [  441.764036] audit: type=3D1400 audit(1704822660.496:321): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.hook.configure=
" pid=3D9429 comm=3D"apparmor_parser"
  [  441.764117] audit: type=3D1400 audit(1704822660.496:322): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.daemon" pid=3D=
9428 comm=3D"apparmor_parser"
  [  441.764418] audit: type=3D1400 audit(1704822660.496:323): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.user-daemon" p=
id=3D9436 comm=3D"apparmor_parser"
  [  442.313495] audit: type=3D1400 audit(1704822661.046:324): apparmor=3D"=
DENIED" operation=3D"file_inherit" class=3D"net" namespace=3D"root//lxd-juj=
u-98527a-0_<var-snap-lxd-common-lxd>" profile=3D"/snap/snapd/20290/usr/lib/=
snapd/snap-confine" pid=3D9458 comm=3D"snap-confine" family=3D"netlink" soc=
k_type=3D"raw" protocol=3D15 requested_mask=3D"send receive" denied_mask=3D=
"send receive"
  [  442.323720] audit: type=3D1400 audit(1704822661.056:325): apparmor=3D"=
DENIED" operation=3D"file_inherit" class=3D"file" namespace=3D"root//lxd-ju=
ju-98527a-0_<var-snap-lxd-common-lxd>" profile=3D"snap-update-ns.lxd" name=
=3D"/apparmor/.null" pid=3D9478 comm=3D"6" requested_mask=3D"wr" denied_mas=
k=3D"wr" fsuid=3D1000000 ouid=3D0
  [  442.477442] audit: type=3D1400 audit(1704822661.209:326): apparmor=3D"=
DENIED" operation=3D"file_inherit" class=3D"file" namespace=3D"root//lxd-ju=
ju-98527a-0_<var-snap-lxd-common-lxd>" profile=3D"snap.lxd.hook.install" na=
me=3D"/apparmor/.null" pid=3D9458 comm=3D"snap-exec" requested_mask=3D"wr" =
denied_mask=3D"wr" fsuid=3D1000000 ouid=3D0
  [  442.884305] audit: type=3D1400 audit(1704822661.616:327): apparmor=3D"=
DENIED" operation=3D"file_inherit" class=3D"net" namespace=3D"root//lxd-juj=
u-98527a-0_<var-snap-lxd-common-lxd>" profile=3D"/snap/snapd/20290/usr/lib/=
snapd/snap-confine" pid=3D9525 comm=3D"snap-confine" family=3D"unix" sock_t=
ype=3D"stream" protocol=3D0 requested_mask=3D"send receive" denied_mask=3D"=
send receive"
  [  442.884311] audit: type=3D1400 audit(1704822661.616:328): apparmor=3D"=
DENIED" operation=3D"file_inherit" class=3D"net" namespace=3D"root//lxd-juj=
u-98527a-0_<var-snap-lxd-common-lxd>" profile=3D"/snap/snapd/20290/usr/lib/=
snapd/snap-confine" pid=3D9525 comm=3D"snap-confine" family=3D"unix" sock_t=
ype=3D"stream" protocol=3D0 requested_mask=3D"send receive" denied_mask=3D"=
send receive"
  [  442.886474] audit: type=3D1400 audit(1704822661.616:329): apparmor=3D"=
DENIED" operation=3D"file_inherit" class=3D"file" namespace=3D"root//lxd-ju=
ju-98527a-0_<var-snap-lxd-common-lxd>" profile=3D"snap.lxd.activate" name=
=3D"/apparmor/.null" pid=3D9525 comm=3D"snap-exec" requested_mask=3D"wr" de=
nied_mask=3D"wr" fsuid=3D1000000 ouid=3D0
  [  442.886479] audit: type=3D1400 audit(1704822661.616:330): apparmor=3D"=
DENIED" operation=3D"file_inherit" class=3D"file" namespace=3D"root//lxd-ju=
ju-98527a-0_<var-snap-lxd-common-lxd>" profile=3D"snap.lxd.activate" name=
=3D"/apparmor/.null" pid=3D9525 comm=3D"snap-exec" requested_mask=3D"wr" de=
nied_mask=3D"wr" fsuid=3D1000000 ouid=3D0
  [  442.897436] audit: type=3D1400 audit(1704822661.629:331): apparmor=3D"=
DENIED" operation=3D"file_inherit" class=3D"file" namespace=3D"root//lxd-ju=
ju-98527a-0_<var-snap-lxd-common-lxd>" profile=3D"/snap/snapd/20290/usr/lib=
/snapd/snap-confine" name=3D"/apparmor/.null" pid=3D9525 comm=3D"aa-exec" r=
equested_mask=3D"wr" denied_mask=3D"wr" fsuid=3D1000000 ouid=3D0
  [  442.897439] audit: type=3D1400 audit(1704822661.629:332): apparmor=3D"=
DENIED" operation=3D"file_inherit" class=3D"file" namespace=3D"root//lxd-ju=
ju-98527a-0_<var-snap-lxd-common-lxd>" profile=3D"/snap/snapd/20290/usr/lib=
/snapd/snap-confine" name=3D"/apparmor/.null" pid=3D9525 comm=3D"aa-exec" r=
equested_mask=3D"wr" denied_mask=3D"wr" fsuid=3D1000000 ouid=3D0
  [  442.926817] NOHZ tick-stop error: local softirq work is pending, handl=
er #200!!!
  [  442.976813] NOHZ tick-stop error: local softirq work is pending, handl=
er #200!!!
  [  443.263929] audit: type=3D1400 audit(1704822661.996:333): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"/snap/snapd/20290/usr/l=
ib/snapd/snap-confine" pid=3D9602 comm=3D"apparmor_parser"
  [  443.263934] audit: type=3D1400 audit(1704822661.996:334): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"/snap/snapd/20290/usr/l=
ib/snapd/snap-confine//mount-namespace-capture-helper" pid=3D9602 comm=3D"a=
pparmor_parser"
  [  443.267568] audit: type=3D1400 audit(1704822661.999:335): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap-update-ns.lxd" pid=
=3D9604 comm=3D"apparmor_parser"
  [  443.270731] audit: type=3D1400 audit(1704822662.003:336): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.activate" pid=
=3D9605 comm=3D"apparmor_parser"
  [  443.270893] audit: type=3D1400 audit(1704822662.003:337): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.buginfo" pid=
=3D9607 comm=3D"apparmor_parser"
  [  443.271121] audit: type=3D1400 audit(1704822662.003:338): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.benchmark" pid=
=3D9606 comm=3D"apparmor_parser"
  [  443.271208] audit: type=3D1400 audit(1704822662.003:339): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.hook.install" =
pid=3D9611 comm=3D"apparmor_parser"
  [  443.271319] audit: type=3D1400 audit(1704822662.003:340): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.check-
  kernel" pid=3D9608 comm=3D"apparmor_parser"
  [  443.271426] audit: type=3D1400 audit(1704822662.003:341): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.hook.remove" p=
id=3D9612 comm=3D"apparmor_parser"
  [  443.271595] audit: type=3D1400 audit(1704822662.003:342): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.lxc" pid=3D961=
3 comm=3D"apparmor_parser"
  [  443.271815] audit: type=3D1400 audit(1704822662.003:343): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.lxc-to-lxd" pi=
d=3D9614 comm=3D"apparmor_parser"
  [  443.271827] audit: type=3D1400 audit(1704822662.003:344): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.lxd" pid=3D961=
5 comm=3D"apparmor_parser"
  [  443.271901] audit: type=3D1400 audit(1704822662.003:345): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.migrate" pid=
=3D9616 comm=3D"apparmor_parser"
  [  443.271915] audit: type=3D1400 audit(1704822662.003:346): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.daemon" pid=3D=
9609 comm=3D"apparmor_parser"
  [  443.272098] audit: type=3D1400 audit(1704822662.003:347): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.hook.configure=
" pid=3D9610 comm=3D"apparmor_parser"
  [  443.272532] audit: type=3D1400 audit(1704822662.003:348): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"snap.lxd.user-daemon" p=
id=3D9617 comm=3D"apparmor_parser"
  [  445.556120] audit: type=3D1400 audit(1704822664.286:349): apparmor=3D"=
STATUS" operation=3D"profile_replace" label=3D"lxd-juju-98527a-0_</var/snap=
/lxd/common/lxd>//&:lxd-juju-98527a-0_<var-snap-lxd-common-lxd>:unconfined"=
 name=3D"/usr/lib/snapd/snap-confine" pid=3D9767 comm=3D"apparmor_parser"
  [  445.570529] audit: type=3D1400 audit(1704822664.303:350): apparmor=3D"=
STATUS" operation=3D"profile_replace" info=3D"same as current profile, skip=
ping" label=3D"lxd-juju-98527a-0_</var/snap/lxd/common/lxd>//&:lxd-juju-985=
27a-0_<var-snap-lxd-common-lxd>:unconfined" name=3D"/usr/lib/snapd/snap-con=
fine//mount-namespace-capture-helper" pid=3D9767 comm=3D"apparmor_parser"

  ##### A rough grab from dmesg
  ~ =E2=9D=AF sudo journalctl --output=3Dshort --follow --all | sudo snappy=
-debug

  kernel.printk_ratelimit =3D 0
  =3D AppArmor =3D
  Time: Jan 09 17:50:55
  Log: apparmor=3D"DENIED" operation=3D"open" class=3D"file" profile=3D"sna=
p.juju.juju" name=3D"/var/lib/snapd/hostfs/etc/ca-certificates/extracted/tl=
s-ca-bundle.pem" pid=3D8866 comm=3D"juju" requested_mask=3D"r" denied_mask=
=3D"r" fsuid=3D1000 ouid=3D0
  File: /var/lib/snapd/hostfs/etc/ca-certificates/extracted/tls-ca-bundle.p=
em (read)
  Suggestions:
  * adjust program to read necessary files from $SNAP, $SNAP_DATA, $SNAP_CO=
MMON, $SNAP_USER_DATA or $SNAP_USER_COMMON
  * adjust snap to use snap layouts (https://forum.snapcraft.io/t/snap-layo=
uts/7207)

  =3D AppArmor =3D
  Time: Jan 09 17:51:01
  Log: apparmor=3D"DENIED" operation=3D"file_inherit" class=3D"net" namespa=
ce=3D"root//lxd-juju-98527a-0_<var-snap-lxd-common-lxd>" profile=3D"/snap/s=
napd/20290/usr/lib/snapd/snap-confine" pid=3D9458 comm=3D"snap-confine" fam=
ily=3D"netlink" sock_type=3D"raw" protocol=3D15 requested_mask=3D"send rece=
ive" denied_mask=3D"send receive"
  Suggestion:
  * add one of 'account-control, hardware-observe, kernel-crypto-api, netwo=
rk-control, network-observe, raw-input, unity7, x11' to 'plugs'

  =3D AppArmor =3D
  Time: Jan 09 17:51:01
  Log: apparmor=3D"DENIED" operation=3D"file_inherit" class=3D"file" namesp=
ace=3D"root//lxd-juju-98527a-0_<var-snap-lxd-common-lxd>" profile=3D"snap-u=
pdate-ns.lxd" name=3D"/apparmor/.null" pid=3D9478 comm=3D"6" requested_mask=
=3D"wr" denied_mask=3D"wr" fsuid=3D1000000 ouid=3D0
  File: /apparmor/.null (write)
  Suggestion:
  * adjust program to write to $SNAP_DATA, $SNAP_COMMON, $SNAP_USER_DATA or=
 $SNAP_USER_COMMON

  =3D AppArmor =3D
  Time: Jan 09 17:51:01
  Log: apparmor=3D"DENIED" operation=3D"file_inherit" class=3D"file" namesp=
ace=3D"root//lxd-juju-98527a-0_<var-snap-lxd-common-lxd>" profile=3D"snap.l=
xd.hook.install" name=3D"/apparmor/.null" pid=3D9458 comm=3D"snap-exec" req=
uested_mask=3D"wr" denied_mask=3D"wr" fsuid=3D1000000 ouid=3D0
  File: /apparmor/.null (write)
  Suggestion:
  * adjust program to write to $SNAP_DATA, $SNAP_COMMON, $SNAP_USER_DATA or=
 $SNAP_USER_COMMON

  =3D AppArmor =3D
  Time: Jan 09 17:51:01
  Log: apparmor=3D"DENIED" operation=3D"file_inherit" class=3D"net" namespa=
ce=3D"root//lxd-juju-98527a-0_<var-snap-lxd-common-lxd>" profile=3D"/snap/s=
napd/20290/usr/lib/snapd/snap-confine" pid=3D9525 comm=3D"snap-confine" fam=
ily=3D"unix" sock_type=3D"stream" protocol=3D0 requested_mask=3D"send recei=
ve" denied_mask=3D"send receive"

  =3D AppArmor =3D
  Time: Jan 09 17:51:01
  Log: apparmor=3D"DENIED" operation=3D"file_inherit" class=3D"file" namesp=
ace=3D"root//lxd-juju-98527a-0_<var-snap-lxd-common-lxd>" profile=3D"snap.l=
xd.activate" name=3D"/apparmor/.null" pid=3D9525 comm=3D"snap-exec" request=
ed_mask=3D"wr" denied_mask=3D"wr" fsuid=3D1000000 ouid=3D0
  File: /apparmor/.null (write)
  Suggestion:
  * adjust program to write to $SNAP_DATA, $SNAP_COMMON, $SNAP_USER_DATA or=
 $SNAP_USER_COMMON

  =3D AppArmor =3D
  Time: Jan 09 17:51:01
  Log: apparmor=3D"DENIED" operation=3D"file_inherit" class=3D"file" namesp=
ace=3D"root//lxd-juju-98527a-0_<var-snap-lxd-common-lxd>" profile=3D"/snap/=
snapd/20290/usr/lib/snapd/snap-confine" name=3D"/apparmor/.null" pid=3D9525=
 comm=3D"aa-exec" requested_mask=3D"wr" denied_mask=3D"wr" fsuid=3D1000000 =
ouid=3D0
  File: /apparmor/.null (write)
  Suggestion:
  * adjust program to write to $SNAP_DATA, $SNAP_COMMON, $SNAP_USER_DATA or=
 $SNAP_USER_COMMON

  ##### Snapd installed using -
  https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=3Dsnapd

  ##### `juju-db` snap - https://github.com/juju/juju-db-snap/tree/5.3

  ##### `usr.lib.snapd.snap-confine` default on Arch, in case it's useful
  https://pastebin.com/M5t6gySa

  ##### Reproduce Steps
  Assuming you're running on a vanilla (minimal tweaking) Arch machine with=
 AppArmor enabled:

  ```bash
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

To manage notifications about this bug go to:
https://bugs.launchpad.net/snapd/+bug/2049099/+subscriptions



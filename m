Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6RGHNOE2NWoUpAYAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 19 Jun 2026 14:32:33 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 639F76A5CBF
	for <lists+apparmor@lfdr.de>; Fri, 19 Jun 2026 14:32:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1waYOT-0003IZ-82; Fri, 19 Jun 2026 12:32:21 +0000
Received: from mail-106121.protonmail.ch ([79.135.106.121])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <hexlabsecurity@proton.me>)
 id 1waNm3-0002Im-5r
 for apparmor@lists.ubuntu.com; Fri, 19 Jun 2026 01:11:59 +0000
Date: Fri, 19 Jun 2026 01:11:45 +0000
To: John Johansen <john.johansen@canonical.com>,
 linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com
Message-ID: <20260619011138.264578-1-hexlabsecurity@proton.me>
Feedback-ID: 199661219:user:proton
X-Pm-Message-ID: 07f0b31b3d290527fbe6492402348c1c56250175
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=79.135.106.121;
 envelope-from=hexlabsecurity@proton.me; helo=mail-106121.protonmail.ch
X-Mailman-Approved-At: Fri, 19 Jun 2026 12:32:20 +0000
Subject: [apparmor] AppArmor: TCP Fast Open bypasses connect mediation (last
	unaddressed LSM)
X-BeenThere: apparmor@lists.ubuntu.com
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: AppArmor discussion <apparmor.lists.ubuntu.com>
List-Unsubscribe: <https://lists.ubuntu.com/mailman/options/apparmor>,
 <mailto:apparmor-request@lists.ubuntu.com?subject=unsubscribe>
List-Archive: <https://lists.ubuntu.com/archives/apparmor>
List-Post: <mailto:apparmor@lists.ubuntu.com>
List-Help: <mailto:apparmor-request@lists.ubuntu.com?subject=help>
List-Subscribe: <https://lists.ubuntu.com/mailman/listinfo/apparmor>,
 <mailto:apparmor-request@lists.ubuntu.com?subject=subscribe>
From: Bryam Vargas via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: Bryam Vargas <hexlabsecurity@proton.me>
Cc: Paul Moore <paul@paul-moore.com>, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 James Morris <jmorris@namei.org>, Matthieu Buffet <matthieu@buffet.re>,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Mikhail Ivanov <ivanov.mikhail1@huawei-partners.com>,
 Mickael Salaun <mic@digikod.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "Serge E . Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SEM_URIBL(3.50)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[paul-moore.com,vger.kernel.org,gmail.com,namei.org,buffet.re,google.com,huawei-partners.com,digikod.net,kernel.org,redhat.com,hallyn.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:paul@paul-moore.com,m:netdev@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:jmorris@namei.org,m:matthieu@buffet.re,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:ivanov.mikhail1@huawei-partners.com,m:mic@digikod.net,m:kuba@kernel.org,m:pabeni@redhat.com,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.ubuntu.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[hexlabsecurity@proton.me]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 639F76A5CBF

Hello John, and LSM folks,

I have been working on the Landlock TCP Fast Open connect bypass [1]. Steph=
en
Smalley's SELinux fix for the same issue [3] -- "Similar to Landlock, SELin=
ux was
not updated when TCP Fast Open support was introduced ..." -- made me go ba=
ck and
check the rest of the connect-mediating LSMs, since I had only been looking=
 at
Landlock. With Landlock [2], SELinux [3], and now TOMOYO [4] all getting fi=
xes,
AppArmor is the last one with the same gap and no fix yet.

Root cause (shared with the others)
-----------------------------------
security_socket_connect() has a single call site, net/socket.c (the connect=
(2)
syscall). TCP Fast Open performs an implicit connect inside sendmsg:

  tcp_sendmsg -> tcp_sendmsg_fastopen -> __inet_stream_connect(..., is_send=
msg=3D1)
              -> sk->sk_prot->connect()                 net/ipv4/{tcp.c,af_=
inet.c}

This never calls security_socket_connect(); the only LSM hook on the path i=
s
security_socket_sendmsg(). mptcp_sendmsg_fastopen reaches the same code and=
 is a
second producer.

AppArmor
--------
apparmor_socket_connect() requests AA_MAY_CONNECT; apparmor_socket_sendmsg(=
) (via
aa_sock_msg_perm) requests AA_MAY_SEND. These are distinct bits, and apparm=
or_parser
compiles them independently: "network send inet stream," yields accept mask=
 0x02
while "network connect inet stream," yields 0x40. So an egress-restriction =
profile
that grants send but not connect is bypassed by MSG_FASTOPEN.

Reproduced on 6.12.88 with apparmor active. Under a profile granting the in=
et/inet6
stream lifecycle except connect:

  aa-exec -p egress_restricted -- ./probe
  [TCP ] connect(2)=3DEACCES(blocked)  sendto(MSG_FASTOPEN)=3DOK(reached)  =
=3D> connection established
  [TCP6] connect(2)=3DEACCES(blocked)  sendto(MSG_FASTOPEN)=3DOK(reached)  =
=3D> connection established

(The coarse "network inet stream," idiom grants connect anyway, so this onl=
y bites the
fine-grained "allow send, deny connect" policy that the asymmetry is meant =
to serve.)

Fix
---
Same shape as the TOMOYO [4] and SELinux [3] fixes: in apparmor_socket_send=
msg (or
aa_sock_msg_perm), when MSG_FASTOPEN is set and msg_name carries a destinat=
ion on a
not-yet-connected stream socket, additionally require aa_sk_perm(OP_CONNECT=
,
AA_MAY_CONNECT, sk). I am happy to send that patch and the reproducer.

(A single core check in __inet_stream_connect(), gated on is_sendmsg, would=
 have
covered all five LSMs and both the TCP and MPTCP producers in one place -- =
the kernel
already mediates the analogous implicit-connect-on-send for AF_UNIX via
security_unix_may_send and for SCTP via security_sctp_bind_connect. But sin=
ce the
other four LSMs are taking per-hook fixes, AppArmor matching them is the co=
nsistent
move; mentioning the core option only in case it is preferred.)

[1] Landlock: LANDLOCK_ACCESS_NET_CONNECT_TCP bypass via TCP Fast Open (rep=
ort)
    https://lore.kernel.org/r/20260616201615.275032-1-hexlabsecurity@proton=
.me
[2] landlock: fix TCP Fast Open connection bypass (Matthieu Buffet)
    https://lore.kernel.org/r/20260617180526.15627-2-matthieu@buffet.re
[3] selinux: check connect-related permissions on TCP Fast Open (Stephen Sm=
alley)
    https://lore.kernel.org/r/20260618175513.112443-2-stephen.smalley.work@=
gmail.com
[4] tomoyo: Enforce connect policy in TCP Fast Open (Matthieu Buffet)
    https://lore.kernel.org/r/20260619002207.61104-1-matthieu@buffet.re

Thanks,
Bryam Vargas



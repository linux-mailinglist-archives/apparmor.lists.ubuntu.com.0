Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DhisHtKVMmrg2QUAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 17 Jun 2026 14:40:50 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF20699CD7
	for <lists+apparmor@lfdr.de>; Wed, 17 Jun 2026 14:40:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wZpZE-0004K3-Jv; Wed, 17 Jun 2026 12:40:28 +0000
Received: from smtp-01-out.s.azet.sk ([91.235.53.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <prvs=062398bbb0=pavol158@azet.sk>)
 id 1wZjV8-0002za-Bz
 for apparmor@lists.ubuntu.com; Wed, 17 Jun 2026 06:11:50 +0000
Received: from smtp-01-out.s.azet.sk (localhost [127.0.0.1])
 by email-be-04.e.etech.sk (Postfix) with ESMTP id 6308F203DD
 for <apparmor@lists.ubuntu.com>; Wed, 17 Jun 2026 08:11:49 +0200 (CEST)
X-Virus-Scanned: by AntiSpam at azet.sk
X-Spam-Flag: NO
MIME-Version: 1.0
X-MimeOLE: Azet.sk (WebMail Azet.sk v2.0)
X-Azet-Deliver: 1781676617.896779 (.12)
Message-ID: <178167670000.17640.3339611080314149287@mail-fe-12.e.etech.sk>
X-Originating-IP: 176.107.24.230
X-Priority: 3
Importance: Medium
X-MSMail-Priority: Medium
Date: Wed, 17 Jun 2026 08:11:46 +0200
X-Original-IP: 176.107.24.230
X-Mailer: Azet.sk (WebMail Azet.sk v2.0)
To: apparmor@lists.ubuntu.com
Content-Type: multipart/alternative; charset="utf-8";
 boundary="===============4175760289413033204=="
Content-Transfer-Encoding: quoted-printable
X-Azet-Flatted: 1
Received-SPF: pass client-ip=91.235.53.51;
 envelope-from=prvs=062398bbb0=pavol158@azet.sk; helo=smtp-01-out.s.azet.sk
X-Mailman-Approved-At: Wed, 17 Jun 2026 12:40:27 +0000
Subject: [apparmor] Updating snap applications is impossible if the home
 directory is encrypted using fscrypt via systemd-homed
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
From: =?utf-8?b?UGF2b2wgUG9sw6HEjWlr?= via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: =?utf-8?b?UGF2b2wgUG9sw6HEjWlr?= <pavol158@azet.sk>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.89 / 15.00];
	SEM_URIBL(3.50)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_EQ_FROM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.ubuntu.com,none];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_REPLYTO(0.00)[pavol158@azet.sk];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_mime,mail-fe-12.e.etech.sk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBF20699CD7

--===============4175760289413033204==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear developer of AppArmor =20
 =20
Can you please verify if this is also a related bug from AppArmor? =20
<https://bugs.launchpad.net/ubuntu/+source/snapd/+bug/2156939> =20
Updating snap applications is impossible if the home directory is
encrypted using fscrypt via systemd-homed =20
 =20
 =20
This bug of systemd-homed or AppArmor exist only if is encrypted home
folder with systemd-homed too =20
<https://bugs.launchpad.net/ubuntu/+source/flatpak/+bug/2150642> =20
 =20
Thanks =20
 =20
With regards Pavol Polacik
--===============4175760289413033204==
MIME-Version: 1.0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<style type=3D"text/css"></style>
                            <div id=3D"part_5e4d3f556a5b442e83dffa074b6d82d=
a"><div><div>Dear developer of AppArmor<br/><br/>Can you please verify if t=
his is also a related bug from AppArmor?<br/><a href=3D"https://bugs.launch=
pad.net/ubuntu/+source/snapd/+bug/2156939" target=3D"_blank">https://bugs.l=
aunchpad.net/ubuntu/+source/snapd/+bug/2156939</a><br/>Updating snap applic=
ations is impossible if the home directory is encrypted using fscrypt via s=
ystemd-homed<br/><br/><br/>This bug of systemd-homed or AppArmor exist only=
 if is encrypted home folder with systemd-homed too<br/><a href=3D"https://=
bugs.launchpad.net/ubuntu/+source/flatpak/+bug/2150642" target=3D"_blank">h=
ttps://bugs.launchpad.net/ubuntu/+source/flatpak/+bug/2150642</a><br/><br/>=
Thanks<br/><br/>With regards Pavol Polacik<br/>=C2=A0</div></div></div>
--===============4175760289413033204==--


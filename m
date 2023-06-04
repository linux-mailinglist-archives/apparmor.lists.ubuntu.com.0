Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 948D47213E0
	for <lists+apparmor@lfdr.de>; Sun,  4 Jun 2023 02:25:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q5bYg-0003yo-IX; Sun, 04 Jun 2023 00:25:22 +0000
Received: from greymarch.letopolis.de ([37.120.179.78])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jgs-apparmor@letopolis.de>) id 1q5bYb-0003yd-KW
 for apparmor@lists.ubuntu.com; Sun, 04 Jun 2023 00:25:17 +0000
Received: from [IPv6:2620:101:f000:3402::d39] (unknown
 [IPv6:2620:101:f000:3402::d39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest
 SHA384) (No client certificate requested)
 by greymarch.letopolis.de (Postfix) with ESMTPSA id D500B2402C9
 for <apparmor@lists.ubuntu.com>; Sun,  4 Jun 2023 02:25:16 +0200 (CEST)
Message-ID: <bc33f7d50138c93ebbe47739ef7c3afdf0fbcc80.camel@grosse-sundrup.com>
From: Jonas =?ISO-8859-1?Q?Gro=DFe?= Sundrup <jgs-apparmor@letopolis.de>
To: apparmor <apparmor@lists.ubuntu.com>
Date: Sat, 03 Jun 2023 20:25:15 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 
MIME-Version: 1.0
Subject: [apparmor] generally allow mount options
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi,

I'm currently trying to bind down some software that spawns processes
that will use mount. One instance of this produces the corresponding
line

apparmor=3D"DENIED" operation=3D"pivotroot" class=3D"mount" profile=3D"/mya=
pp"
name=3D"/tmp/" pid=3D185566 comm=3D"pv-bwrap" srcname=3D"/tmp/oldroot/"

in dmesg.

For this specific software, I'm basically using apparmor in a "do what
you want, but here are some deny-rules for you" fashion, so I'd like to
know what exactly the command would be to just generally allow this
class of operation.

just "mount,", as I have seen it with "signal,", doesn't seem to do the
trick. Is there a way of allowing this in general without hard-
specifying every path that exists?


Thanks,
Jonas


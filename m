Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 874CA7213E9
	for <lists+apparmor@lfdr.de>; Sun,  4 Jun 2023 02:42:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q5bpX-00052n-MG; Sun, 04 Jun 2023 00:42:47 +0000
Received: from greymarch.letopolis.de ([37.120.179.78])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jgs-apparmor@letopolis.de>) id 1q5bpW-00052g-KZ
 for apparmor@lists.ubuntu.com; Sun, 04 Jun 2023 00:42:46 +0000
Received: from [IPv6:2620:101:f000:3402::d39] (unknown
 [IPv6:2620:101:f000:3402::d39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest
 SHA384) (No client certificate requested)
 by greymarch.letopolis.de (Postfix) with ESMTPSA id DA3EE24043C;
 Sun,  4 Jun 2023 02:42:45 +0200 (CEST)
Message-ID: <5e5ba1e8265367304b09ff8bf4d2ede6eda68200.camel@grosse-sundrup.com>
From: Jonas =?ISO-8859-1?Q?Gro=DFe?= Sundrup <jgs-apparmor@letopolis.de>
To: John Johansen <john.johansen@canonical.com>, apparmor
 <apparmor@lists.ubuntu.com>
Date: Sat, 03 Jun 2023 20:42:44 -0400
In-Reply-To: <a60601c8-86a4-eddb-1998-f84d78022ff2@canonical.com>
References: <bc33f7d50138c93ebbe47739ef7c3afdf0fbcc80.camel@grosse-sundrup.com>
 <a60601c8-86a4-eddb-1998-f84d78022ff2@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 
MIME-Version: 1.0
Subject: Re: [apparmor] generally allow mount options
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

On Sat, 2023-06-03 at 17:32 -0700, John Johansen wrote:
>  =C2=A0=C2=A0 mount,=C2=A0=C2=A0 # allow all mount operations
> =C2=A0=C2=A0 pivot_root,=C2=A0=C2=A0 # allow all pivot roots
> =C2=A0=C2=A0 umount,=C2=A0 # allow unmounting
>=20
> you can then carve out specific rules if you need to with deny rules.
>=20

Thanks so much, that did exactly what I needed!


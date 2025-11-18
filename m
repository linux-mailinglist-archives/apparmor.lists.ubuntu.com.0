Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 352E8C760EA
	for <lists+apparmor@lfdr.de>; Thu, 20 Nov 2025 20:21:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vMADn-00013V-Ri; Thu, 20 Nov 2025 19:21:35 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vLHe0-00081a-8B
 for apparmor@lists.ubuntu.com; Tue, 18 Nov 2025 09:05:00 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.98) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vLHdz-000000028Hv-1ifL; Tue, 18 Nov 2025 10:04:59 +0100
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52]
 helo=[192.168.178.61]) by inpost2.zedat.fu-berlin.de (Exim 4.98)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1vLHdz-00000002TfY-0osH; Tue, 18 Nov 2025 10:04:59 +0100
Message-ID: <bc21bee14ca44077ae9323bfc251ad12390fa841.camel@physik.fu-berlin.de>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: deller@kernel.org, linux-kernel@vger.kernel.org,
 apparmor@lists.ubuntu.com,  John Johansen <john.johansen@canonical.com>,
 linux-security-module@vger.kernel.org
Date: Tue, 18 Nov 2025 10:04:58 +0100
In-Reply-To: <20250531150822.135803-1-deller@kernel.org>
References: <20250531150822.135803-1-deller@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.170.52
X-ZEDAT-Hint: PO
Received-SPF: pass client-ip=130.133.4.66;
 envelope-from=glaubitz@zedat.fu-berlin.de; helo=outpost1.zedat.fu-berlin.de
X-Mailman-Approved-At: Thu, 20 Nov 2025 19:21:33 +0000
Subject: Re: [apparmor] [PATCH 0/2] apparmor unaligned memory fixes
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
Cc: Helge Deller <deller@gmx.de>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi Helge,

On Sat, 2025-05-31 at 17:08 +0200, deller@kernel.org wrote:
> From: Helge Deller <deller@gmx.de>
>=20
> Two patches which fix unaligned memory accesses in apparmor.
> Both triggered on the parisc platform, which is much more
> memory alignment sensitive and will report violations.
> Please check and apply.
>=20
> Helge
>=20
> Helge Deller (2):
>   apparmor: Fix 8-byte alignment for initial dfa blob streams
>   apparmor: Fix unaligned memory accesses in KUnit test
>=20
>  security/apparmor/lsm.c                | 4 ++--
>  security/apparmor/policy_unpack_test.c | 6 ++++--
>  2 files changed, 6 insertions(+), 4 deletions(-)

Thanks for looking into this!

Unfortunately, the problem still persists on SPARC even with v6.18-rc6:

[   76.209476] Kernel unaligned access at TPC[8dabfc] aa_dfa_unpack+0x3c/0x=
6e0
[   76.301115] Kernel unaligned access at TPC[8dac0c] aa_dfa_unpack+0x4c/0x=
6e0
[   76.392697] Kernel unaligned access at TPC[8dacf0] aa_dfa_unpack+0x130/0=
x6e0
[   76.485440] Kernel unaligned access at TPC[8dacf0] aa_dfa_unpack+0x130/0=
x6e0
[   76.578179] Kernel unaligned access at TPC[8dacf0] aa_dfa_unpack+0x130/0=
x6e0

I have documented the problem here [1].

So, I suspect that your fix is incomplete.

Adrian

> [1] https://github.com/sparclinux/issues/issues/30

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


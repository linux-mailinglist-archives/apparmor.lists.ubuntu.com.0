Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 95259C760E1
	for <lists+apparmor@lfdr.de>; Thu, 20 Nov 2025 20:21:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vMADm-000137-7X; Thu, 20 Nov 2025 19:21:34 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vLK7Q-0005T0-GF
 for apparmor@lists.ubuntu.com; Tue, 18 Nov 2025 11:43:32 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.98) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vLK7P-00000003Z1j-396r; Tue, 18 Nov 2025 12:43:31 +0100
Received: from p5b13aa34.dip0.t-ipconnect.de ([91.19.170.52]
 helo=[192.168.178.61]) by inpost2.zedat.fu-berlin.de (Exim 4.98)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1vLK7P-00000002rfO-1lSd; Tue, 18 Nov 2025 12:43:31 +0100
Message-ID: <90513f85cc8d060ebccd3972cc7709e4b6f13f34.camel@physik.fu-berlin.de>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Helge Deller <deller@kernel.org>
Date: Tue, 18 Nov 2025 12:43:30 +0100
In-Reply-To: <aRxT78fdN5v2Ajyl@p100>
References: <20250531150822.135803-1-deller@kernel.org>
 <bc21bee14ca44077ae9323bfc251ad12390fa841.camel@physik.fu-berlin.de>
 <aRxT78fdN5v2Ajyl@p100>
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi Helge,

On Tue, 2025-11-18 at 12:09 +0100, Helge Deller wrote:
> My patch fixed two call sites, but I suspect you see another call site wh=
ich
> hasn't been fixed yet.
>=20
> Can you try attached patch? It might indicate the caller of the function =
and
> maybe prints the struct name/address which isn't aligned.
>=20
> Helge
>=20
>=20
> diff --git a/security/apparmor/match.c b/security/apparmor/match.c
> index c5a91600842a..b477430c07eb 100644
> --- a/security/apparmor/match.c
> +++ b/security/apparmor/match.c
> @@ -313,6 +313,9 @@ struct aa_dfa *aa_dfa_unpack(void *blob, size_t size,=
 int flags)
>  	if (size < sizeof(struct table_set_header))
>  		goto fail;
> =20
> +	if (WARN_ON(((unsigned long)data) & (BITS_PER_LONG/8 - 1)))
> +		pr_warn("dfa blob stream %pS not aligned.\n", data);
> +
>  	if (ntohl(*(__be32 *) data) !=3D YYTH_MAGIC)
>  		goto fail;

Here is the relevant output with the patch applied:

[   73.840639] ------------[ cut here ]------------
[   73.901376] WARNING: CPU: 0 PID: 341 at security/apparmor/match.c:316 aa=
_dfa_unpack+0x6cc/0x720
[   74.015867] Modules linked in: binfmt_misc evdev flash sg drm drm_panel_=
orientation_quirks backlight i2c_core configfs nfnetlink autofs4 ext4 crc16=
 mbcache jbd2 hid_generic usbhid sr_mod hid cdrom
sd_mod ata_generic ohci_pci ehci_pci ehci_hcd ohci_hcd pata_ali libata sym5=
3c8xx scsi_transport_spi tg3 scsi_mod usbcore libphy scsi_common mdio_bus u=
sb_common
[   74.428977] CPU: 0 UID: 0 PID: 341 Comm: apparmor_parser Not tainted 6.1=
8.0-rc6+ #9 NONE=20
[   74.536543] Call Trace:
[   74.568561] [<0000000000434c24>] dump_stack+0x8/0x18
[   74.633757] [<0000000000476438>] __warn+0xd8/0x100
[   74.696664] [<00000000004296d4>] warn_slowpath_fmt+0x34/0x74
[   74.771006] [<00000000008db28c>] aa_dfa_unpack+0x6cc/0x720
[   74.843062] [<00000000008e643c>] unpack_pdb+0xbc/0x7e0
[   74.910545] [<00000000008e7740>] unpack_profile+0xbe0/0x1300
[   74.984888] [<00000000008e82e0>] aa_unpack+0xe0/0x6a0
[   75.051226] [<00000000008e3ec4>] aa_replace_profiles+0x64/0x1160
[   75.130144] [<00000000008d4d90>] policy_update+0xf0/0x280
[   75.201057] [<00000000008d4fc8>] profile_replace+0xa8/0x100
[   75.274258] [<0000000000766bd0>] vfs_write+0x90/0x420
[   75.340594] [<00000000007670cc>] ksys_write+0x4c/0xe0
[   75.406932] [<0000000000767174>] sys_write+0x14/0x40
[   75.472126] [<0000000000406174>] linux_sparc_syscall+0x34/0x44
[   75.548802] ---[ end trace 0000000000000000 ]---
[   75.609503] dfa blob stream 0xfff0000008926b96 not aligned.
[   75.682695] Kernel unaligned access at TPC[8db2a8] aa_dfa_unpack+0x6e8/0=
x720
[   75.775337] Kernel unaligned access at TPC[8dac18] aa_dfa_unpack+0x58/0x=
720
[   75.866840] Kernel unaligned access at TPC[8dad00] aa_dfa_unpack+0x140/0=
x720
[   75.959481] Kernel unaligned access at TPC[8dad00] aa_dfa_unpack+0x140/0=
x720
[   76.052125] Kernel unaligned access at TPC[8dad00] aa_dfa_unpack+0x140/0=
x720
[   76.146188] ------------[ cut here ]------------
[   76.206858] WARNING: CPU: 0 PID: 341 at security/apparmor/match.c:316 aa=
_dfa_unpack+0x6cc/0x720
[   76.321326] Modules linked in: binfmt_misc evdev flash sg drm drm_panel_=
orientation_quirks backlight i2c_core configfs nfnetlink autofs4 ext4 crc16=
 mbcache jbd2 hid_generic usbhid sr_mod hid cdrom
sd_mod ata_generic ohci_pci ehci_pci ehci_hcd ohci_hcd pata_ali libata sym5=
3c8xx scsi_transport_spi tg3 scsi_mod usbcore libphy scsi_common mdio_bus u=
sb_common
[   76.734360] CPU: 0 UID: 0 PID: 341 Comm: apparmor_parser Tainted: G     =
   W           6.18.0-rc6+ #9 NONE=20
[   76.862518] Tainted: [W]=3DWARN
[   76.901396] Call Trace:
[   76.933421] [<0000000000434c24>] dump_stack+0x8/0x18
[   76.998616] [<0000000000476438>] __warn+0xd8/0x100
[   77.061522] [<00000000004296d4>] warn_slowpath_fmt+0x34/0x74
[   77.135867] [<00000000008db28c>] aa_dfa_unpack+0x6cc/0x720
[   77.207923] [<00000000008e643c>] unpack_pdb+0xbc/0x7e0
[   77.275405] [<00000000008e71dc>] unpack_profile+0x67c/0x1300
[   77.349749] [<00000000008e82e0>] aa_unpack+0xe0/0x6a0
[   77.416084] [<00000000008e3ec4>] aa_replace_profiles+0x64/0x1160
[   77.495003] [<00000000008d4d90>] policy_update+0xf0/0x280
[   77.565915] [<00000000008d4fc8>] profile_replace+0xa8/0x100
[   77.639116] [<0000000000766bd0>] vfs_write+0x90/0x420
[   77.705454] [<00000000007670cc>] ksys_write+0x4c/0xe0
[   77.771792] [<0000000000767174>] sys_write+0x14/0x40
[   77.836986] [<0000000000406174>] linux_sparc_syscall+0x34/0x44
[   77.913633] ---[ end trace 0000000000000000 ]---

The message is repeated multiple times.

Adrian


--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


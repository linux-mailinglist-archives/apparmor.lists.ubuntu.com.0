Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B948C3ACB
	for <lists+apparmor@lfdr.de>; Mon, 13 May 2024 06:45:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1s6NYb-0002w8-Jm; Mon, 13 May 2024 04:45:01 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <j.granados@samsung.com>)
 id 1s6EwK-0008DS-QM
 for apparmor@lists.ubuntu.com; Sun, 12 May 2024 19:32:58 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20240512193247euoutp028395386268472af00b4482601e7ec58b~O1LGim-aF2248722487euoutp024;
 Sun, 12 May 2024 19:32:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20240512193247euoutp028395386268472af00b4482601e7ec58b~O1LGim-aF2248722487euoutp024
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240512193246eucas1p1b803e1e209b64539505f5fda1778b4dc~O1LFSONbZ3234432344eucas1p1m;
 Sun, 12 May 2024 19:32:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 5A.97.09624.D5911466; Sun, 12
 May 2024 20:32:45 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20240512193245eucas1p103d1891d851a519d0ab83e586ccd2cad~O1LErWG9j3233532335eucas1p1u;
 Sun, 12 May 2024 19:32:45 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240512193245eusmtrp2908ef0acafe2b5b7a8df17de78204001~O1LEqceM60125201252eusmtrp2d;
 Sun, 12 May 2024 19:32:45 +0000 (GMT)
X-AuditID: cbfec7f2-bfbff70000002598-7b-6641195dba44
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 08.B2.08810.D5911466; Sun, 12
 May 2024 20:32:45 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240512193245eusmtip2a45a6ffabbaf52a5c4686fc913dd8737~O1LEbwfVT0200202002eusmtip2K;
 Sun, 12 May 2024 19:32:45 +0000 (GMT)
Received: from localhost (106.210.248.15) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 12 May 2024 20:32:44 +0100
Date: Sun, 12 May 2024 21:32:40 +0200
From: Joel Granados <j.granados@samsung.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Message-ID: <20240512193240.kholmilosdqjb52p@joelS2.panther.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="qt3jjettk7ey6stj"
Content-Disposition: inline
In-Reply-To: <8d1daa64-3746-46a3-b696-127a70cdf7e7@t-8ch.de>
X-Originating-IP: [106.210.248.15]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2WSfUybVRTGvX2/CqbLS4Fx6XQ6JmziQElMvApqSUbyLotfmS7RZJEK7xgZ
 LbUdG3NMQHCr42MNHw5QoQxWEGbBUirgCJNgKS2TKqRDxIJIt8k6Bq3brECR8jJd4n+/8zzn
 Ofec5PIxoZMU8dNlR1iFTJIRQQbiRpN3JOZAeOLBZ/JrX0D5Jg2BPAODJDI2FPHQSvdpDBlM
 DoCcphkKDRdJ0bfWOzxkM5YSSP+7nUCXeodwVNvmBWi053MSOS6uEsh22UqgsU4djq71l+DI
 6Ckkkbq+AENOzU0CLRTPkGig7QqOepa7KLT01zUeWrrnI1BBnRtD42onQCbNZqTWWXD0Q4eH
 EG9lPsv7EWcs5yGj0Wcx+pZPSEbvLqOYjsZc5kZHNWBGquoBYx+fwplbS2YeY9O6SMaj38qc
 LTJRrwveCUxIZTPSj7KKp19KDjw0ZtRT8pnwbJ2jkcwDXaFnQAAf0s/CpqZZ3hkQyBfSzQAO
 LesIrvgTQNVA54bjAdBXZAP3I+YlC+CMJgDrVmqJf7u8I1corjAAqFm5TvkjOB0JKz89x/Mz
 Se+CI65JzM8hdAL88q5nPYDR3RT8uleH+41gOhkaLpSvvyegxdBac5fkOAgOVc+u92B0Nvxj
 YmVtKH+Nt8AmH98vB6zNtJsvbawaAQtMxRt8EloMEzyOFwJhb8/bHO+Gns5BjONgODdooDh+
 BK52163fD+lyAPt8CxRXtAKozb+zMSkeFo7NbiQSYfPkJPAvBOlNcPxWELfnJlhmPIdxsgCq
 Tgm57ijY6nDharC95oHLah64rOa/yzg5Fo5XVpD/k5+C2vqbGMcvQp3uNq4BVAsIY7OU0jRW
 GSdjj8UqJVJlliwtNiVTqgdrv9/qG3R3gS/mFmP7AY8P+sETa+GZ9lYbEOGyTBkbESIQv//y
 QaEgVXL8A1aR+a4iK4NV9oMtfDwiTBCZ+hgrpNMkR9jDLCtnFfddHj9AlMc7XT13QGVY7D2r
 Str5inzK21J2qtHwmqcTDTufvDjaNu1gdl2/2l4RYk1wPbQ77NWURbnj9qx7x2L3kPKyfbWv
 d78luKJy3/Ztv+UmVg0F2ZtiOqO03/FNxFvxQXsam/cWE8s5bzxX59spFo25538iS9R7y8N9
 N7z77SfjzLlX6RTyb210c07Sz98XVqTukxynzG+mbQs+URW9YhMlrU6SH+mBey667ZuG0JLu
 +IAEOI0ydww+erR0PiZ3StLwePZ0zHnpx/MfTpSWffWwZqTnPYnqsBk5RL9OTES6hJvvZYjz
 ctJ/6Ru+sFoSSic8X5lcLW93qjyW2j3HGk7Y60xRoxG48pAkLhpTKCX/ABbPJLd4BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA2WSf1CTdRzH/T6/Nuxmj4D1ZabosDjMJkOg7zo0ODMf7fd5dpTyY+EDeLEN
 n20e2XmOH2kxkzWxchZs2maYBzJgCYHY0ofJKsep6Bk3kl9xYilumARSg9HlXf+97v3+vN+f
 733vI8TDSyixcLtKy3IqRYGEmkt4pjp8z2REpeXGD9yIRMW8hUT+cx0Uch4zYOhB8z4cNfI+
 gAb5PgH60aBE33nGMOR1HiCRo7+bRK1tFwhUVTcO0KWWLyjkO/k3ibxnPSS63FRLoCHXxwRy
 +ssoZLSW4mjQMkKiO/v7KHSu7icCtUyeFqCJ+0MYmvhzikSl1XdxdM04CBBveQwZazsJ9HOD
 n0xdzBzRdxFM51HIWBw6xnHiI4px3DUJmIav9jDDDYcBc/FzK2C6r/USzO8Tbozx2m9RjN+x
 mKkw8ILXRW9LUzi1TssuyVdrtKslW2QoQSqTI2lColwqW/VsxnMJSZKVa1K2sQXbd7LcyjXZ
 0ny+cpQs/DWqqPJyN6UHzgXlIEwI6UTonugE5WCuMJy2ATg8MoKFjCdgfeAKGeIIONldToWG
 RgHs/f7r2UQjgNbGtpkpgn4SHvr0s5k0Ra+AF2/14NMcSafAmnt+wXQAp5sF0FhRDKaNCDob
 NtoOzrCIToUe873ZFVUY7DrAUyFjPrxweICYZpzeCQftfwUDwiAvhMenhNNyWHBBt7sVhJ4q
 gaX8/lneDf0PhoARRJgfajI/1GT+rykkr4DNTT3U/+Snod06god4NaytvU1YgOAEiGR1GmWe
 UiOTahRKjU6VJ81RKx0geIBOfrzhNKi6OSp1AUwIXGBZMNl36hsvEBMqtYqVRIpSdzyfGy7a
 pnhvF8upszhdAatxgaTgN36CixfkqIPXrNJmyZLjk2SJyfL4JHnyKsnjog2FHyrC6TyFln2X
 ZQtZ7t8cJgwT67GTquGjd7L6bmyGbnC/3aP15L4qSvRHFQ30FC+b7F+S37GQSwqUke3s+bZ0
 BW5TPEV8e0oeHcbvffN6xgdcdarqJev42jOcjy9GvqbexqU1eHaszxR47Y24uE11v90uXbej
 b6uy3mWdPFs37+WNh6Rp+mxLh2n98t2YuYYviZPYywIx0kxXl2jD9XUW/9XSdn1g0earL0Sn
 U/vqkMtgOBKgYmN67P1pcf4x76JXYra8n2nelDPHYG3VpafvKdlIm678EdvZMFa0N+vRkl+Y
 6HnWLw9WuHedqa80Vb913o3NsdXP79fwJcdjzTdbj71jE1965IcXt1oFwJ7JtRBOp4TQ5Ctk
 y3FOo/gH5R3XohUEAAA=
X-CMS-MailID: 20240512193245eucas1p103d1891d851a519d0ab83e586ccd2cad
X-Msg-Generator: CA
X-RootMTR: 20240511095125eucas1p1e6cd077a31c94dcdda88967d4ffc9262
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240511095125eucas1p1e6cd077a31c94dcdda88967d4ffc9262
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
 <20240424201234.3cc2b509@kernel.org> <202405080959.104A73A914@keescook>
 <CGME20240511095125eucas1p1e6cd077a31c94dcdda88967d4ffc9262@eucas1p1.samsung.com>
 <8d1daa64-3746-46a3-b696-127a70cdf7e7@t-8ch.de>
Received-SPF: pass client-ip=210.118.77.12;
 envelope-from=j.granados@samsung.com; helo=mailout2.w1.samsung.com
X-Mailman-Approved-At: Mon, 13 May 2024 04:44:59 +0000
Subject: Re: [apparmor] [PATCH v3 00/11] sysctl: treewide: constify
 ctl_table argument of sysctl handlers
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
Cc: Dave Chinner <david@fromorbit.com>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, linux-sctp@vger.kernel.org,
 lvs-devel@vger.kernel.org, coreteam@netfilter.org,
 Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, bridge@lists.linux.dev,
 apparmor@lists.ubuntu.com, linux-xfs@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--qt3jjettk7ey6stj
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 11, 2024 at 11:51:18AM +0200, Thomas Wei=DFschuh wrote:
> Hi Kees,
>=20
> On 2024-05-08 10:11:35+0000, Kees Cook wrote:
> > On Wed, Apr 24, 2024 at 08:12:34PM -0700, Jakub Kicinski wrote:
> > > On Tue, 23 Apr 2024 09:54:35 +0200 Thomas Wei=DFschuh wrote:
> > > > The series was split from my larger series sysctl-const series [0].
> > > > It only focusses on the proc_handlers but is an important step to be
> > > > able to move all static definitions of ctl_table into .rodata.
> > >=20
> > > Split this per subsystem, please.
> >=20
> > I've done a few painful API transitions before, and I don't think the
> > complexity of these changes needs a per-subsystem constification pass. I
> > think this series is the right approach, but that patch 11 will need
> > coordination with Linus. We regularly do system-wide prototype changes
> > like this right at the end of the merge window before -rc1 comes out.
>=20
> That sounds good.
>=20
> > The requirements are pretty simple: it needs to be a obvious changes
> > (this certainly is) and as close to 100% mechanical as possible. I think
> > patch 11 easily qualifies. Linus should be able to run the same Coccine=
lle
> > script and get nearly the same results, etc. And all the other changes
> > need to have landed. This change also has no "silent failure" condition=
s:
> > anything mismatched will immediately stand out.
>=20
> Unfortunately coccinelle alone is not sufficient, as some helpers with
> different prototypes are called by handlers and themselves are calling
> handler and therefore need to change in the same commit.
> But if I add a diff for those on top of the coccinelle script to the
> changelog it should be obvious.
Judging by Kees' comment on "100% mechanical", it might be better just
having the diff and have Linus apply than rather than two step process?
Have not these types of PRs, so am interested in what folks think.

>=20
> > So, have patches 1-10 go via their respective subsystems, and once all
> > of those are in Linus's tree, send patch 11 as a stand-alone PR.
>=20
> Ack, I'll do that with the cover letter information requested by Joel.
>=20
> > (From patch 11, it looks like the seccomp read/write function changes
> > could be split out? I'll do that now...)
>=20
> Thanks!
>=20
> Thomas

--=20

Joel Granados

--qt3jjettk7ey6stj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmZBGVgACgkQupfNUreW
QU9Dtgv8D/HdnyHHjf9EvZYIA7HnMu2U/9l/w1ouqfAMmi7HS4Y98dZVBP5X3MEe
5neOWNwlQN6rncGIhaLJE+q0M7KL52ej3pWS72olJGcJamFdahPGRN444v49FvCk
bCwjbHxOysmwpLAF+XsnYlOGOJ5K0n9eDONYPI2Zg+ehDHMMGyAPx6P+d7rqJzOF
WUgIsUGC75GVbawyHRi25emp4svTsNh+cnsG6Fsh8LY0u8ixH1q58bUxOq5Qu8IG
aI6TCHU/1z0iFEBV1PAF/NsFx/GHFaJ2v01TDNwEX1J4vOWE8wopJaYDVudy8MGg
z8fMq6vlMSQnY3EkN6LKkFUJyS7vnRhowXaWBrY1DoB0zKLziXHhCpWU7JzN4U4N
guxBPD1pT8LhIPGBC5wRfKO9LLe8jNKwn7ugcLdCCxzygdPjWizk0M8QVxRnhGKO
unK/FP5KS6yFMxT9sppN6halqDwjuwon9WU7vbuINgn2VhTSM7u9/kUzcuq3N/Cu
Qk1K0rUf
=w318
-----END PGP SIGNATURE-----

--qt3jjettk7ey6stj--


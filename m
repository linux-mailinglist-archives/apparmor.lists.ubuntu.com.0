Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7737B4850
	for <lists+apparmor@lfdr.de>; Sun,  1 Oct 2023 17:11:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qmy6K-0002e4-K8; Sun, 01 Oct 2023 15:11:20 +0000
Received: from mx07-006a4e02.pphosted.com ([143.55.146.78])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paubert@iram.es>) id 1qmobX-0005ym-LJ
 for apparmor@lists.ubuntu.com; Sun, 01 Oct 2023 05:02:56 +0000
Received: from pps.filterd (m0316689.ppops.net [127.0.0.1])
 by m0316689.ppops.net (8.17.1.22/8.17.1.22) with ESMTP id 3914UFP5026780;
 Sun, 1 Oct 2023 07:02:19 +0200
Received: from sim.rediris.es (mta-out04.sim.rediris.es [130.206.24.46])
 by m0316689.ppops.net (PPS) with ESMTPS id 3texu6gh7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 01 Oct 2023 07:02:19 +0200 (MEST)
Received: from sim.rediris.es (localhost.localdomain [127.0.0.1])
 by sim.rediris.es (Postfix) with ESMTPS id EDE8B180084;
 Sun,  1 Oct 2023 07:02:16 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by sim.rediris.es (Postfix) with ESMTP id 4925B183220;
 Sun,  1 Oct 2023 07:02:16 +0200 (CEST)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out04.sim.rediris.es
Received: from sim.rediris.es ([127.0.0.1])
 by localhost (mta-out04.sim.rediris.es [127.0.0.1]) (amavis, port 10026)
 with ESMTP id Dld0OOiAMFpc; Sun,  1 Oct 2023 07:02:13 +0200 (CEST)
Received: from gp-workstation.iram.es (haproxy01.sim.rediris.es
 [130.206.24.69])
 by sim.rediris.es (Postfix) with ESMTPA id 96282180084;
 Sun,  1 Oct 2023 07:01:58 +0200 (CEST)
Date: Sun, 1 Oct 2023 07:01:56 +0200
From: Gabriel Paubert <paubert@iram.es>
To: Steve French <smfrench@gmail.com>
Message-ID: <20231001050156.GA3366643@gp-workstation.iram.es>
References: <20230928110554.34758-1-jlayton@kernel.org>
 <20230928110554.34758-2-jlayton@kernel.org>
 <6020d6e7-b187-4abb-bf38-dc09d8bd0f6d@app.fastmail.com>
 <af047e4a1c6947c59d4a13d4ae221c784a5386b4.camel@kernel.org>
 <20230928171943.GK11439@frogsfrogsfrogs>
 <6a6f37d16b55a3003af3f3dbb7778a367f68cd8d.camel@kernel.org>
 <636661.1695969129@warthog.procyon.org.uk>
 <CAH2r5ms14hPaz=Ex2a=Dj0Hz3XxYLRKFj_rHHekznTbNJ_wABQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAH2r5ms14hPaz=Ex2a=Dj0Hz3XxYLRKFj_rHHekznTbNJ_wABQ@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 36zzUCLp18nPYUNdv6OeNHkJL1ErgJPK
X-Proofpoint-GUID: 36zzUCLp18nPYUNdv6OeNHkJL1ErgJPK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-01_02,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=salida_notspam policy=salida score=0
 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=871 spamscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2309180000
 definitions=main-2310010040
X-Mailman-Approved-At: Sun, 01 Oct 2023 15:11:16 +0000
Subject: [apparmor] [OT] Re: [PATCH 86/87] fs: switch timespec64 fields in
 inode to discrete integers
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, Anders Larsen <al@alarsen.net>,
 Carlos Llamas <cmllamas@google.com>, Mattia Dongili <malattia@linux.it>,
 Yonghong Song <yonghong.song@linux.dev>, v9fs@li.sts.linux.dev,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 James Morris <jmorris@namei.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, linux-um@lists.infradead.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anton Altaparmakov <anton@tuxera.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kr oah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Kleikamp <shaggy@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 linux-mm@kvack.org, Joel Fernandes <joel@joelfernandes.org>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leon@kernel.org>,
 Hugh Dickins <hughd@google.com>, Andrii Nakryiko <andrii@kernel.org>,
 codalist@coda.cs.cmu.edu, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
 Todd Kjos <tkjos@android.com>, Vasily Gorbik <gor@linux.ibm.com>,
 selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, Yue Hu <huyue2@coolpad.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Martijn Coenen <maco@android.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
 Muchun Song <muchun.song@linux.dev>, linux-f2fs-devel@lists.sourceforge.net,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, gfs2@lists.linux.dev,
 "Eric W. Biederman" <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>,
 Brad Warrum <bwarrum@linux.ibm.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 linux-efi@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>,
 Alexei Starovoitov <ast@kernel.org>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-afs@lists.infradead.org, Ian Kent <raven@themaw.net>,
 Naohiro Aota <naohiro.aota@wdc.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
 Steve French <sfrench@samba.org>, platform-driver-x86@vger.kernel.or.g,
 coda@cs.cmu.edu,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 autofs@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Mark Gross <markgross@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org,
 Gao Xiang <xiang@kernel.org>, Johannes Thumshirn <jth@kernel.org>,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-nfs@vger.kernel.org,
 Olga Kornievskaia <kolga@netapp.com>, Song Liu <song@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, samba-technical@lists.samba.org,
 linux-xfs@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>,
 Netdev <netdev@vger.kernel.org>, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Chandan Babu R <chandan.babu@oracle.com>, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Neil Brown <neilb@suse.de>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Amir Goldstein <amir73il@gmail.com>, Bob Copeland <me@bobcopeland.com>,
 KP Singh <kpsingh@kernel.org>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, linux-ext4@vger.ker.nel.org,
 Dai Ngo <Dai.Ngo@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Salah Triki <salah.triki@gmail.com>, John Fastabend <john.fastabend@gmail.com>,
 Evgeniy Dushistov <dushistov@mail.ru>, linux-cifs@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, Chao Yu <chao@kernel.org>,
 apparmor@lists.ubuntu.com, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, Hans de Goede <hdegoede@redhat.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Ritu Agarwal <rituagar@linux.ibm.com>, Luis de Bethencourt <luisbg@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, David Sterba <dsterba@suse.cz>,
 linux-security-module@vger.kernel.org, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Johannes Berg <johannes@sipsolutions.net>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sat, Sep 30, 2023 at 09:50:41AM -0500, Steve French wrote:
> On Fri, Sep 29, 2023 at 3:06=E2=80=AFAM David Howells via samba-technic=
al
> <samba-technical@lists.samba.org> wrote:
> >
> >
> > Jeff Layton <jlayton@kernel.org> wrote:
> >
> > > Correct. We'd lose some fidelity in currently stored timestamps, bu=
t as
> > > Linus and Ted pointed out, anything below ~100ns granularity is
> > > effectively just noise, as that's the floor overhead for calling in=
to
> > > the kernel. It's hard to argue that any application needs that sort=
 of
> > > timestamp resolution, at least with contemporary hardware.
> >
> > Albeit with the danger of making Steve French very happy;-), would it=
 make
> > sense to switch internally to Microsoft-style 64-bit timestamps with =
their
> > 100ns granularity?
>=20
> 100ns granularity does seem to make sense and IIRC was used by various
> DCE standards in the 90s and 2000s (not just used for SMB2/SMB3 protoco=
l and
> various Windows filesystems)

Historically it probably comes from VMS, where system time and file
timestamps were a 64 bit integer counting in 100ns units starting on MJD
2400000.5 (Nov 17th 1858).

Gabriel

>=20
>=20
> --=20
> Thanks,
>=20
> Steve
 



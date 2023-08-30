Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6665C78F0BD
	for <lists+apparmor@lfdr.de>; Thu, 31 Aug 2023 17:56:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qbk1n-00038Y-VR; Thu, 31 Aug 2023 15:56:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jlayton@kernel.org>)
 id 1qb9OP-0004tt-J3
 for apparmor@lists.ubuntu.com; Wed, 30 Aug 2023 00:49:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 727CE61187;
 Wed, 30 Aug 2023 00:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15649C433C8;
 Wed, 30 Aug 2023 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693356547;
 bh=Y6mimTT4f5bHTNOgMAPJs7UzoDd9JcRrnEgta8s7/7g=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=R2eMjMGcVP6twJXzPd3GjCC/QAkoBXyIXwyF0PetiX1VDQJtkSU/FrVUdLPhlHeJk
 dBHqNW4EShjtZaWh7sFQvaiUl3mq77UH9KDN3DI2snJ6o1c+81N9JuEjNxovdv+bSx
 sgcIB4JoE+RW7C4bNpHemTP/NmKBpTL7+v/S4iHTHVlduZjb2wd1jti+ZtvOSZrtwV
 l+HJJMf2BwuQ5fHlwOGaHAX0BTHl6xVSRaJy3EeRODk9yD0xK9grM4eFB73+9nNR6U
 SUPRRhBT9hKA3cHo92ct+4AiPcoeZ/GYLow2fGYu2g/oM5lHg/5skk6mbUINrwlVsy
 FRJBQs41w8qcA==
Message-ID: <d73e7de5056a34578a193185770e46584450d8b7.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Date: Tue, 29 Aug 2023 20:48:48 -0400
In-Reply-To: <20230830001917.GC461907@ZenIV>
References: <20230705185812.579118-1-jlayton@kernel.org>
 <20230705185812.579118-3-jlayton@kernel.org>
 <20230830001917.GC461907@ZenIV>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 31 Aug 2023 15:56:14 +0000
Subject: Re: [apparmor] [PATCH v2 08/92] fs: new helper:
	simple_rename_timestamp
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
Cc: lucho@ionkov.net, rafael@kernel.org, djwong@kernel.org, al@alarsen.net,
 cmllamas@google.com, andrii@kernel.org, hughd@google.com,
 agordeev@linux.ibm.com, hch@lst.de, hubcap@omnibond.com, pc@manguebit.com,
 linux-xfs@vger.kernel.org, bvanassche@acm.org, jeffxu@chromium.org,
 mpe@ellerman.id.au, john@keeping.me.uk, yi.zhang@huawei.com, jmorris@namei.org,
 christophe.leroy@csgroup.eu, code@tyhicks.com, stern@rowland.harvard.edu,
 borntraeger@linux.ibm.com, devel@lists.orangefs.org, mirimmad17@gmail.com,
 sprasad@microsoft.com, jaharkes@cs.cmu.edu, linux-um@lists.infradead.org,
 npiggin@gmail.com, jlbec@evilplan.org, ericvh@kernel.org, surenb@google.com,
 trond.myklebust@hammerspace.com, anton@tuxera.com, brauner@kernel.org,
 wsa+renesas@sang-engineering.com, gregkh@linuxfoundation.org,
 stephen.smalley.work@gmail.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, lsahlber@redhat.com, senozhatsky@chromium.org,
 arve@android.com, chuck.lever@oracle.com, svens@linux.ibm.com,
 jolsa@kernel.org, jack@suse.com, tj@kernel.org, akpm@linux-foundation.org,
 linux-trace-kernel@vger.kernel.org, xu.xin16@zte.com.cn, shaggy@kernel.org,
 dhavale@google.com, penguin-kernel@i-love.sakura.ne.jp, zohar@linux.ibm.com,
 linux-mm@kvack.org, joel@joelfernandes.org, edumazet@google.com,
 sdf@google.com, jomajm@gmail.com, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, paul@paul-moore.com, leon@kernel.org,
 john.fastabend@gmail.com, mcgrof@kernel.org, chi.minghao@zte.com.cn,
 codalist@coda.cs.cmu.edu, selinux@vger.kernel.org, zhangpeng362@huawei.com,
 quic_ugoswami@quicinc.com, yhs@fb.com, yzaikin@google.com,
 linkinjeon@kernel.org, mhiramat@kernel.org, ecryptfs@vger.kernel.org,
 tkjos@android.com, madkar@cs.stonybrook.edu, gor@linux.ibm.com,
 yuzhe@nfschina.com, linuxppc-dev@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, miklos@szeredi.hu, huyue2@coolpad.com,
 jaegeuk@kernel.org, gargaditya08@live.com, maco@android.com,
 hirofumi@mail.parknet.co.jp, haoluo@google.com, tony.luck@intel.com,
 tytso@mit.edu, nico@fluxnic.net, linux-ntfs-dev@lists.sourceforge.net,
 muchun.song@linux.dev, roberto.sassu@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net, yang.yang29@zte.com.cn,
 gpiccoli@igalia.com, ebiederm@xmission.com, anna@kernel.org,
 quic_uaggarwa@quicinc.com, bwarrum@linux.ibm.com, mike.kravetz@oracle.com,
 jingyuwang_vip@163.com, linux-efi@vger.kernel.org, error27@gmail.com,
 martin@omnibond.com, trix@redhat.com, ocfs2-devel@lists.linux.dev,
 ast@kernel.org, sebastian.reichel@collabora.com, clm@fb.com,
 linux-mtd@lists.infradead.org, willy@infradead.org, marc.dionne@auristor.com,
 linux-afs@lists.infradead.org, raven@themaw.net, naohiro.aota@wdc.com,
 daniel@iogearbox.net, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, quic_linyyuan@quicinc.com, coda@cs.cmu.edu,
 slava@dubeyko.com, idryomov@gmail.com, pabeni@redhat.com, adobriyan@gmail.com,
 serge@hallyn.com, chengzhihao1@huawei.com, axboe@kernel.dk, amir73il@gmail.com,
 linuszeng@tencent.com, keescook@chromium.org, arnd@arndb.de,
 autofs@vger.kernel.org, rostedt@goodmis.org, yifeliu@cs.stonybrook.edu,
 dlemoal@kernel.org, eparis@parisplace.org, ceph-devel@vger.kernel.org,
 xiang@kernel.org, yijiangshan@kylinos.cn, dhowells@redhat.com,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, kolga@netapp.com,
 song@kernel.org, samba-technical@lists.samba.org, sfrench@samba.org,
 jk@ozlabs.org, netdev@vger.kernel.org, rpeterso@redhat.com,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, davem@davemloft.net,
 jfs-discussion@lists.sourceforge.net, princekumarmaurya06@gmail.com,
 ebiggers@google.com, neilb@suse.de, asmadeus@codewreck.org,
 linux_oss@crudebyte.com, me@bobcopeland.com, kpsingh@kernel.org,
 okanatov@gmail.com, almaz.alexandrovich@paragon-software.com,
 joseph.qi@linux.alibaba.com, hayama@lineo.co.jp, adilger.kernel@dilger.ca,
 mikulas@artax.karlin.mff.cuni.cz, shaozhengchao@huawei.com,
 chenzhongjin@huawei.com, ardb@kernel.org, anton.ivanov@cambridgegreys.com,
 agruenba@redhat.com, richard@nod.at, mark@fasheh.com, shr@devkernel.io,
 Dai.Ngo@oracle.com, cluster-devel@redhat.com, jgg@ziepe.ca, kuba@kernel.org,
 riel@surriel.com, salah.triki@gmail.com, dushistov@mail.ru,
 linux-cifs@vger.kernel.org, hca@linux.ibm.com, chao@kernel.org,
 apparmor@lists.ubuntu.com, josef@toxicpanda.com, Liam.Howlett@oracle.com,
 tom@talpey.com, hdegoede@redhat.com, linux-hardening@vger.kernel.org,
 aivazian.tigran@gmail.com, dchinner@redhat.com, dsterba@suse.com,
 xiubli@redhat.com, konishi.ryusuke@gmail.com, jgross@suse.com, jth@kernel.org,
 rituagar@linux.ibm.com, luisbg@kernel.org, martin.lau@linux.dev,
 v9fs@lists.linux.dev, fmdefrancesco@gmail.com, linux-unionfs@vger.kernel.org,
 lrh2000@pku.edu.cn, linux-security-module@vger.kernel.org,
 ezk@cs.stonybrook.edu, jefflexu@linux.alibaba.com, linux@treblig.org,
 hannes@cmpxchg.org, phillip@squashfs.org.uk, johannes@sipsolutions.net,
 sj1557.seo@samsung.com, dwmw2@infradead.org,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, 2023-08-30 at 01:19 +0100, Al Viro wrote:
> On Wed, Jul 05, 2023 at 02:58:11PM -0400, Jeff Layton wrote:
>=20
> > + * POSIX mandates that the old and new parent directories have their c=
time and
> > + * mtime updated, and that inodes of @old_dentry and @new_dentry (if a=
ny), have
> > + * their ctime updated.
>=20
> APPLICATION USAGE
> Some implementations mark for update the last file status change timestam=
p
> of renamed files and some do not. Applications which make use of the
> last file status change timestamp may behave differently with respect
> to renamed files unless they are designed to allow for either behavior.
>
> So for children POSIX permits rather than mandates.  Doesn't really matte=
r;
> Linux behaviour had been to touch ctime on children since way back, if
> not since the very beginning.

Mea culpa. You're quite correct. I'll plan to roll a small patch to
update the comment over this function.

Thanks!
--=20
Jeff Layton <jlayton@kernel.org>


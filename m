Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 462009372F6
	for <lists+apparmor@lfdr.de>; Fri, 19 Jul 2024 06:08:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sUeuW-0008DT-9a; Fri, 19 Jul 2024 04:08:00 +0000
Received: from mail-yb1-f169.google.com ([209.85.219.169])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1sUd7f-0006Kc-Hm
 for apparmor@lists.ubuntu.com; Fri, 19 Jul 2024 02:13:27 +0000
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e0365588ab8so1571913276.1
 for <apparmor@lists.ubuntu.com>; Thu, 18 Jul 2024 19:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721355206; x=1721960006;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X6xBCyZt4LBr3NtFQ/tQHQNxox1QnJWXPeKeevVBbMo=;
 b=GhUhSOoxHw3R5QDA6vW8/EGMk90zqCRPLwVsSxOwleivIeBP1nozgwAwrmlhMsJrlU
 vHfKMFSOHiJI6YkoBRGvarBemi5K9hqi/R8KlxPEvHgDARlcLL8AsTBmK7te+nTI1Epp
 uDOtPuGvOO6dpVMeHXO/BZDEcV1HvWMZNft2DEh8MNbdeeP3T6bVqXcgpAu7tjf/g+eW
 GE+E1gIbwts7hPbYqBFl/xZO8EaQCQmNm65U6SH/Osv4pDlQ7rF7m6ZFVZCOH3bIiSqz
 Ubi0a5fPUucRO2aBTPNl8/hiKPrb/pMqAnzPaPA86dzDgdaO/8oTtXjy1dv7HkN/Tj7q
 oEpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlRqND1Lc+jIiAhwRjKWWHMtyLitU3LJbJ4GDyyjd27xtCR5G7CQfYZkBK0U0iQmCNgnMke+5nRhsjU/AdnpCXo5efry2UXIxC
X-Gm-Message-State: AOJu0YyfnZzi9hxrM5tFh+Dp4DupU3AepmbuOwL0+ZdzMK4aYvxsG0N1
 MECW2OhUUUyDVbyGodkDPQVSXuctYBwmxtDg9PMjZAzif2KigSWTABD9LO7bxA5XoYdc5Nw7PPa
 I43uDFW+OkLtJYDYJmRtSL0dwCrsGRHmB1RCZ
X-Google-Smtp-Source: AGHT+IHwwjQ8DinlK2wiNjovzG9BbNQIqAzdn4+/PROiJook0A2yi5g37Z7O91pcNOMATN+y4DlCwQYj+RCQbJxAIt0=
X-Received: by 2002:a05:6902:725:b0:e05:f07f:7d2e with SMTP id
 3f1490d57ef6-e0640c4a3acmr4231663276.6.1721355206291; Thu, 18 Jul 2024
 19:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240711111908.3817636-1-xukuohai@huaweicloud.com>
 <CAHC9VhRohF+36PQbbEUiiiXjnmx-ZCphjOiAV5VTQwCejuejMA@mail.gmail.com>
In-Reply-To: <CAHC9VhRohF+36PQbbEUiiiXjnmx-ZCphjOiAV5VTQwCejuejMA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 18 Jul 2024 22:13:15 -0400
Message-ID: <CAHC9VhQ-NAfLahQ-eomBrjBUT9t3s6OSzzE4nRLy=fj2AmJVqA@mail.gmail.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.169; envelope-from=paul@paul-moore.com;
 helo=mail-yb1-f169.google.com
X-Mailman-Approved-At: Fri, 19 Jul 2024 04:07:59 +0000
Subject: Re: [apparmor] [PATCH bpf-next v4 00/20] Add return value range
	check for BPF LSM
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
Cc: Matt Bobrowski <mattbobrowski@google.com>, linux-kselftest@vger.kernel.org,
 Shung-Hsi Yu <shung-hsi.yu@suse.com>, Alexei Starovoitov <ast@kernel.org>,
 James Morris <jmorris@namei.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, Anna Schumaker <anna@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Edward Cree <ecree.xilinx@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E . Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 KP Singh <kpsingh@kernel.org>, Brendan Jackman <jackmanb@chromium.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 linux-integrity@vger.kernel.org, Hao Luo <haoluo@google.com>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, Eduard Zingerman <eddyz87@gmail.com>,
 linux-security-module@vger.kernel.org,
 Khadija Kamran <kamrankhadijadj@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, Jul 12, 2024 at 5:44=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> On Thu, Jul 11, 2024 at 7:13=E2=80=AFAM Xu Kuohai <xukuohai@huaweicloud.c=
om> wrote:
> > From: Xu Kuohai <xukuohai@huawei.com>
> >
> > LSM BPF prog returning a positive number attached to the hook
> > file_alloc_security makes kernel panic.
> >
> > Here is a panic log:
> >
> > [  441.235774] BUG: kernel NULL pointer dereference, address: 000000000=
00009
> > [  441.236748] #PF: supervisor write access in kernel mode
> > [  441.237429] #PF: error_code(0x0002) - not-present page
> > [  441.238119] PGD 800000000b02f067 P4D 800000000b02f067 PUD b031067 PM=
D 0
> > [  441.238990] Oops: 0002 [#1] PREEMPT SMP PTI
> > [  441.239546] CPU: 0 PID: 347 Comm: loader Not tainted 6.8.0-rc6-gafe0=
cbf23373 #22
> > [  441.240496] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS rel-1.15.0-0-g2dd4b4
> > [  441.241933] RIP: 0010:alloc_file+0x4b/0x190
> > [  441.242485] Code: 8b 04 25 c0 3c 1f 00 48 8b b0 30 0c 00 00 e8 9c fe=
 ff ff 48 3d 00 f0 ff fb
> > [  441.244820] RSP: 0018:ffffc90000c67c40 EFLAGS: 00010203
> > [  441.245484] RAX: ffff888006a891a0 RBX: ffffffff8223bd00 RCX: 0000000=
035b08000
> > [  441.246391] RDX: ffff88800b95f7b0 RSI: 00000000001fc110 RDI: f089cd0=
b8088ffff
> > [  441.247294] RBP: ffffc90000c67c58 R08: 0000000000000001 R09: 0000000=
000000001
> > [  441.248209] R10: 0000000000000001 R11: 0000000000000001 R12: 0000000=
000000001
> > [  441.249108] R13: ffffc90000c67c78 R14: ffffffff8223bd00 R15: fffffff=
ffffffff4
> > [  441.250007] FS:  00000000005f3300(0000) GS:ffff88803ec00000(0000) kn=
lGS:0000000000000000
> > [  441.251053] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  441.251788] CR2: 00000000000001a9 CR3: 000000000bdc4003 CR4: 0000000=
000170ef0
> > [  441.252688] Call Trace:
> > [  441.253011]  <TASK>
> > [  441.253296]  ? __die+0x24/0x70
> > [  441.253702]  ? page_fault_oops+0x15b/0x480
> > [  441.254236]  ? fixup_exception+0x26/0x330
> > [  441.254750]  ? exc_page_fault+0x6d/0x1c0
> > [  441.255257]  ? asm_exc_page_fault+0x26/0x30
> > [  441.255792]  ? alloc_file+0x4b/0x190
> > [  441.256257]  alloc_file_pseudo+0x9f/0xf0
> > [  441.256760]  __anon_inode_getfile+0x87/0x190
> > [  441.257311]  ? lock_release+0x14e/0x3f0
> > [  441.257808]  bpf_link_prime+0xe8/0x1d0
> > [  441.258315]  bpf_tracing_prog_attach+0x311/0x570
> > [  441.258916]  ? __pfx_bpf_lsm_file_alloc_security+0x10/0x10
> > [  441.259605]  __sys_bpf+0x1bb7/0x2dc0
> > [  441.260070]  __x64_sys_bpf+0x20/0x30
> > [  441.260533]  do_syscall_64+0x72/0x140
> > [  441.261004]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
> > [  441.261643] RIP: 0033:0x4b0349
> > [  441.262045] Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00=
 48 89 f8 48 89 f7 48 88
> > [  441.264355] RSP: 002b:00007fff74daee38 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000141
> > [  441.265293] RAX: ffffffffffffffda RBX: 00007fff74daef30 RCX: 0000000=
0004b0349
> > [  441.266187] RDX: 0000000000000040 RSI: 00007fff74daee50 RDI: 0000000=
00000001c
> > [  441.267114] RBP: 000000000000001b R08: 00000000005ef820 R09: 0000000=
000000000
> > [  441.268018] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000=
000000004
> > [  441.268907] R13: 0000000000000004 R14: 00000000005ef018 R15: 0000000=
0004004e8
> >
> > This is because the filesystem uses IS_ERR to check if the return value
> > is an error code. If it is not, the filesystem takes the return value
> > as a file pointer. Since the positive number returned by the BPF prog
> > is not a real file pointer, this misinterpretation causes a panic.
> >
> > Since other LSM modules always return either a negative error code
> > or a valid pointer, this specific issue only exists in BPF LSM. The
> > proposed solution is to reject LSM BPF progs returning unexpected
> > values in the verifier. This patch set adds return value check to
> > ensure only BPF progs returning expected values are accepted.
> >
> > Since each LSM hook has different excepted return values, we need to
> > know the expected return values for each individual hook to do the
> > check. Earlier versions of the patch set used LSM hook annotations
> > to specify the return value range for each hook. Based on Paul's
> > suggestion, current version gets rid of such annotations and instead
> > converts hook return values to a common pattern: return 0 on success
> > and negative error code on failure.
> >
> > Basically, LSM hooks are divided into two types: hooks that return a
> > negative error code and zero or other values, and hooks that do not
> > return a negative error code. This patch set converts all hooks of the
> > first type and part of the second type to return 0 on success and a
> > negative error code on failure (see patches 1-10). For certain hooks,
> > like ismaclabel and inode_xattr_skipcap, the hook name already imply
> > that returning 0 or 1 is the best choice, so they are not converted.
> > There are four unconverted hooks. Except for ismaclabel, which is not
> > used by BPF LSM, the other three are specified with a BTF ID list to
> > only return 0 or 1.
>
> Thank you for following up on your initial work with this patchset, Xu
> Kuohai.  It doesn't look like I'm going to be able to finish my review
> by the end of the day today, so expect that a bit later, but so far I
> think most of the changes look good and provide a nice improvement :)

You should have my feedback now, let me know if you have any questions.

One additional comment I might make is that you may either want to
wait until after v6.11-rc1 is released and I've had a chance to rebase
the lsm/{dev,next} branches and merge the patchsets which are
currently queued; there are a few patches queued up which will have an
impact on this work.  While it's an unstable branch, you can take a
peek at those queues patches in the lsm/dev-staging branch.

https://github.com/LinuxSecurityModule/kernel/blob/main/README.md

--=20
paul-moore.com


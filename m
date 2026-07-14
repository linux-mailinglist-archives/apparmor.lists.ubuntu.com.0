Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xnBeOMpaVmqM3wAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 14 Jul 2026 17:50:34 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8359B7569DC
	for <lists+apparmor@lfdr.de>; Tue, 14 Jul 2026 17:50:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wjfOj-0005uX-Ig; Tue, 14 Jul 2026 15:50:17 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jannh@google.com>) id 1wjfOh-0005uJ-00
 for apparmor@lists.ubuntu.com; Tue, 14 Jul 2026 15:50:15 +0000
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2ccdf36f63dso155485ad.0
 for <apparmor@lists.ubuntu.com>; Tue, 14 Jul 2026 08:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784044213; cv=none;
 d=google.com; s=arc-20260327;
 b=jdCdfwo5R1wG9Nw19kMAeujB0NqvOfz0K7DeZjqInGYX08HB9+OKEFFcoSuESMzJ1M
 CBgtURspNcyAnWYjxVoMTlhfLP3/qf6p2vWyXSouMPZL+oiWvmwk1LCR5k3gkJfEQ957
 ItOt5ZbivfqxcqiCX8fQwG6/b84dqjSm3ZRdIv32C33iDvgXA8ZNEPIR5c3RfVjUysK8
 /RNXg915TnDB8Tlak2GSnLqy15X7okLtFQWIIy40VRKC44ief41sax6Lat4qRWVZbnzi
 ZTqOO57IKW3lTgeseNh3zq1xNXX0REWAWPeIdxqx1dpZ0SlJZ/OknKb1uWcJWxvzP9mP
 RFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=/rWyxxEC2/b5ObWMmXsLIqh5IRJ8KXFgT7B0aamk7r4=;
 fh=QudyFtLK1x/J31qwPw8nwDAKJrE7Um2Z8ZONNby01jM=;
 b=b4C440cxeapEe4EduN3q8NZxsWv3S8/AD7+6zZWreniprFXqqg0L1X2UwBuKp2ZCIF
 kDrHkN7NKJVXft95BiyXwL8xI/8QOfbZuYTJYyXdadtQ/FDCSnR1UTlSN+raZnn07M/w
 vxXUY4ngME1qA3fACku78PY5H/RiaJdbl8UCYcXVr/5SzOi2NomeIRzyz/shxkcjyGEA
 8o/nG8QuvfQ6nvNOfKbbAeoga/QMiyU6ZvABFVoo1NHyKXzk9dnzS/HuhRODxy5+4hVW
 VX6Je03RzdtJ06kNAIs+Oylqsjj6OyWxTkUFHY9zVWzkztgG2njdso9C4VPpvLYWK7gj
 qH6Q==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784044213; x=1784649013;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/rWyxxEC2/b5ObWMmXsLIqh5IRJ8KXFgT7B0aamk7r4=;
 b=CjJ1DdkQUotiNg9CGDHvcjgydtJbldlcUC8CWzt5p3bjil8a0t975Xr/GwYFuOdJxE
 yodJqbST+LdyYgaHKZkMdW62XjUam9QecYa2AlzshRbvOHV76nst5gkC4+X91T5J8563
 h0cn8E0NDYPn45dKwbBdss9SouttllatWou5iYEIGSbzmGV5AK1SxTNGMmVc4XGtaQ/s
 YdXPSwBLoll1hT5XaKGHxKe4WjAYwW3R3EzZCPKSfkhk0R35ZCHufZEkeUjAD8jFkDlC
 +5NwY5+Ouru1d4zsU0BCPzQWPff0/L7njRPUhSASwWyhZXreNu5eHigoGVlKnwyKtRmx
 b38g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpYq1trh8qrIfaLrChjlTvtRKDgeEOsgL4nx2HH3dWguas4gVdjNV2lnhxJ4Dig2+q/BMlmZTr+eg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YyW1RZCAtHq7oNCDDYQJIpFUSL8OOx1Qj1w++2BA6N6N24Wvg9L
 2Wvr2so84eLsM0ILHTQeBxNOECzfI+JNtYe9yViCENs9Z6zhsdHmixAJjfVnNtqZxafhRz+NYVO
 0AWc741xb/upgEC4wSbr/4/DsFy1evwxoNbIQ1oic
X-Gm-Gg: AfdE7cloPnPCSxbABPnfCLGRdO4fmVRWsUwRoxL3RAH1HOcRpg6lGfHwmrAt+y7oWP8
 V2s8o498OolVlvXl2smaj5+iSV8/FJ0WnIuPVgYGFPkUeUj+8v2mnZCpkJ8HVRgFDiCo3zwuOCr
 sReX73TxXyeFNQJ/gH0qHcX1Go0A0iL0zuJ0gycDcnjfjIpLHRI9MUDxC3HUlHdBgXLEvnXVKA4
 PSHItYSfb30UomU7o2Zx8RIziMDP+5/Olc79CWolhj9UDAnXsMa3cfEPu1QdxJIxQ1PgJRA+kNz
 y3IhnU+UnMDCotKdy3KjJrUOeE4ig3eKH1YV4m2TW0ky+EqhkcyGXD34o+M=
X-Received: by 2002:a17:902:f650:b0:2c9:cb98:f4cf with SMTP id
 d9443c01a7336-2cee1c08775mr6155135ad.14.1784044212151; Tue, 14 Jul 2026
 08:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260714-fix-apparmor-cred-uaf-v1-1-be40e8c83b90@google.com>
In-Reply-To: <20260714-fix-apparmor-cred-uaf-v1-1-be40e8c83b90@google.com>
Date: Tue, 14 Jul 2026 17:49:33 +0200
X-Gm-Features: AUfX_myr5_i2q90iqI7qsglK2LEPEh05NbsE2UCogYzQh_lLbQr-oQzJy0sheX0
Message-ID: <CAG48ez2hcn2L2uC8bu_3wqKuX35cpQhmVxuNNdpmdJ_tQvShPQ@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>,
 John Johansen <john@apparmor.net>, 
 Georgia Garcia <georgia.garcia@canonical.com>, apparmor@lists.ubuntu.com, 
 Paul Moore <paul@paul-moore.com>, "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.214.177; envelope-from=jannh@google.com;
 helo=mail-pl1-f177.google.com
Subject: Re: [apparmor] [PATCH] apparmor: fix cred UAF caused by
	begin_current_label_crit_section()
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
From: Jann Horn via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: Jann Horn <jannh@google.com>
Cc: Christian Brauner <brauner@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 James Morris <jmorris@namei.org>, stable@vger.kernel.org,
 kernel list <linux-kernel@vger.kernel.org>,
 linux-security-module <linux-security-module@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.41 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[lists.ubuntu.com,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:john@apparmor.net,m:georgia.garcia@canonical.com,m:apparmor@lists.ubuntu.com,m:paul@paul-moore.com,m:serge@hallyn.com,m:brauner@kernel.org,m:peterz@infradead.org,m:jmorris@namei.org,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[jannh@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8359B7569DC

On Tue, Jul 14, 2026 at 5:39=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> I have a test case where I run aa-disable on a profile while a process
> using that profile is blocked on splice() from a FUSE passthrough file in=
to
> a full pipe; after the profile update, the pipe becomes empty, splice()
> resumes, the credentials go out of sync, and a subsequent getuid() syscal=
l
> results in a KASAN UAF splat.

To test this, you should run a kernel with KASAN.
CONFIG_RCU_STRICT_GRACE_PERIOD=3Dy might also be necessary to trigger a
KASAN warning.

Open two terminals A and B. In terminal A, write the following policy
into /etc/apparmor.d/credbug-test:
```
abi <abi/4.0>,
include <tunables/global>

profile credbug /tmp/credbug {
  /** rwm,
  mount,
  umount,
  capability sys_admin setuid,
}
```
and enable it:
```
user@vm:~$ sudo aa-enforce /tmp/credbug
Setting /tmp/credbug to enforce mode.
Warning: profile credbug represents multiple programs
user@vm:~$
```

In terminal B, build the reproducer and launch it with root privileges:
```
user@vm:~/apparmor-replace-label$ cat > credbug.c
#define _GNU_SOURCE
#include <pthread.h>
#include <assert.h>
#include <err.h>
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/fsuid.h>
#include <sys/mount.h>
#include <sys/prctl.h>
#include <linux/fuse.h>

#define SYSCHK(x) ({          \
  typeof(x) __res =3D (x);      \
  if (__res =3D=3D (typeof(x))-1) \
    err(1, "SYSCHK(" #x ")"); \
  __res;                      \
})

static int p[2];
static int fuse_fd;
static volatile int fuse_ready =3D 0;
static volatile int backing_id =3D -1;
static int last_credref_fd =3D -1;
static int drop_last_credref =3D 0;

static void *splice_thread_fn(void *dummy) {
  int backing_fd =3D SYSCHK(open("/tmp/credbug", O_RDONLY));

  // unshare creds
  setfsuid(1);
  setfsuid(0);

  last_credref_fd =3D SYSCHK(open("/", O_PATH));

  while (!fuse_ready) /*spin*/;
  struct fuse_backing_map backing_arg =3D { .fd =3D backing_fd  };
  backing_id =3D SYSCHK(ioctl(fuse_fd, FUSE_DEV_IOC_BACKING_OPEN, &backing_=
arg));

  int passthrough_fd =3D SYSCHK(open("/tmp/mntfile", O_RDONLY));
  off_t off0 =3D 0;
  // creds are changed in the middle of this
  splice(passthrough_fd, &off0, p[1], NULL, 1, 0);
  close(passthrough_fd);

  SYSCHK(ioctl(fuse_fd, FUSE_DEV_IOC_BACKING_CLOSE, &backing_id));
  drop_last_credref =3D 1;
  while (drop_last_credref) /*spin*/;
  sleep(1);
  getuid();
  return NULL;
}

#define READ(_obj) if (read(fuse_fd, &(_obj), sizeof(_obj)) !=3D
sizeof(_obj)) err(1, "failed to read " #_obj)
#define WRITE(_obj) if (write(fuse_fd, &(_obj), (_obj).h.len) !=3D
(_obj).h.len) err(1, "failed to write " #_obj)
static void *fuse_thread_fn(void *dummy) {
  while (1) {
    struct {
      struct fuse_in_header inh;
      union {
        struct fuse_init_in init_in;
        struct fuse_open_in open_in;
        struct fuse_read_in read_in;
        char pad[10000];
      };
    } buf;
    ssize_t read_res =3D read(fuse_fd, &buf, sizeof(buf));
    if (read_res =3D=3D -1) {
      if (errno =3D=3D ENODEV)
        return NULL;
    }
    assert(read_res >=3D sizeof(buf.inh));
    if (buf.inh.opcode =3D=3D FUSE_INIT) {
      printf("fuse: init\n");
      struct {
        struct fuse_out_header h;
        struct fuse_init_out b;
      } reply =3D {
        .h =3D { .len =3D sizeof(reply), .error =3D 0, .unique =3D buf.inh.=
unique },
        .b =3D {
          .major =3D buf.init_in.major, .minor =3D buf.init_in.minor,
          .max_stack_depth=3D1, .flags=3DFUSE_INIT_EXT, .flags2=3DFUSE_PASS=
THROUGH>>32
        }
      };
      WRITE(reply);
      fuse_ready =3D 1;
    } else if (buf.inh.opcode =3D=3D FUSE_GETATTR) {
      printf("fuse: getattr\n");
      struct {
        struct fuse_out_header h;
        struct fuse_attr_out b;
      } reply =3D {
        .h =3D { .len =3D sizeof(reply), .error =3D 0, .unique =3D buf.inh.=
unique },
        .b =3D {
          .attr_valid =3D FATTR_SIZE | FATTR_MODE,
          .attr =3D {
            .size =3D 0x1,
            .mode =3D 0100777
          }
        }
      };
      WRITE(reply);
    } else if (buf.inh.opcode =3D=3D FUSE_OPEN) {
      printf("fuse: open node 0x%lu\n", (unsigned long)buf.inh.nodeid);
      while (backing_id =3D=3D -1) /*spin*/;
      struct {
        struct fuse_out_header h;
        struct fuse_open_out b;
      } reply =3D {
        .h =3D { .len =3D sizeof(reply), .error =3D 0, .unique =3D buf.inh.=
unique },
        .b =3D { .open_flags =3D FOPEN_PASSTHROUGH, .backing_id =3D backing=
_id }
      };
      WRITE(reply);
    } else {
      printf("FUSE_<%d> unhandled\n", buf.inh.opcode);
      struct {
        struct fuse_out_header h;
      } reply =3D {
        .h =3D { .len =3D sizeof(reply), .error =3D -ENOSYS, .unique =3D
buf.inh.unique },
      };
      WRITE(reply);
    }
  }
}

int main(void) {
  // create a FUSE mount, and handle requests in a thread
  SYSCHK(close(SYSCHK(open("/tmp/mntfile", O_RDONLY|O_CREAT, 0666))));
  fuse_fd =3D SYSCHK(open("/dev/fuse", O_RDWR));
  char mount_data[4096];
  sprintf(mount_data, "fd=3D%d,rootmode=3D0100777,user_id=3D%d,group_id=3D%=
d",
fuse_fd, getuid(), getgid());
  SYSCHK(mount("blah", "/tmp/mntfile", "fuse", MS_NODEV|MS_NOSUID, mount_da=
ta));
  pthread_t fuse_thread;
  pthread_create(&fuse_thread, NULL, fuse_thread_fn, NULL);

  SYSCHK(pipe(p));
  SYSCHK(fcntl(p[1], F_SETPIPE_SZ, 0x1000));
  char buf[0x1000] =3D {};
  SYSCHK(write(p[1], buf, 0x1000));
  pthread_t splice_thread;
  pthread_create(&splice_thread, NULL, splice_thread_fn, NULL);
  getchar();
  read(p[0], buf, 0x1000);

  while (!drop_last_credref) /*spin*/;
  close(last_credref_fd);
  drop_last_credref =3D 0;

  pthread_join(splice_thread, NULL);
  SYSCHK(umount2("/tmp/mntfile", MNT_DETACH));
  pthread_join(fuse_thread, NULL);
}
user@vm:~/apparmor-replace-label$ gcc -o /tmp/credbug credbug.c
user@vm:~/apparmor-replace-label$ sudo /tmp/credbug
fuse: init
fuse: open node 0x1
```

While the reproducer is blocked, use terminal A to disable its profile:
```
user@vm:~$ sudo aa-disable /tmp/credbug
Disabling /tmp/credbug.
user@vm:~$
```

Then hit enter in terminal B to let the reproducer continue:
```

FUSE_<25> unhandled
FUSE_<18> unhandled
user@vm:~/apparmor-replace-label$
```

Now you should see a KASAN UAF splat in dmesg, when getuid() tries
accessing the creds:
```
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: slab-use-after-free in __ia32_sys_getuid+0x3d/0x80
Read of size 8 at addr ffff8881269a8950 by task credbug/696

CPU: 2 UID: 0 PID: 696 Comm: credbug Not tainted
7.2.0-rc3-00038-g3b029c035b34 #55 PREEMPT
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.17.0-debian-1.17.0-1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack+0x21/0x30
 dump_stack_lvl+0x76/0xa0
 print_address_description+0x7b/0x1f0
 print_report+0x5b/0x70
 kasan_report+0x16d/0x1a0
[...]
 __asan_load8+0x98/0xa0
 __ia32_sys_getuid+0x3d/0x80
 x64_sys_call+0x1cc1/0x3030
 do_syscall_64+0xd8/0x380
[...]
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
[...]
 </TASK>

Allocated by task 696:
 kasan_save_track+0x3a/0x70
 kasan_save_alloc_info+0x3c/0x50
 __kasan_slab_alloc+0x4e/0x60
 kmem_cache_alloc_noprof+0x25f/0x570
 prepare_creds+0x2b/0x4d0
 __sys_setfsuid+0x8b/0x190
 __x64_sys_setfsuid+0x1e/0x30
 x64_sys_call+0x955/0x3030
 do_syscall_64+0xd8/0x380
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Freed by task 70:
 kasan_save_track+0x3a/0x70
 kasan_save_free_info+0x46/0x60
 __kasan_slab_free+0x43/0x70
 kmem_cache_free+0x182/0x500
 put_cred_rcu+0x19e/0x210
 rcu_core+0x877/0xfd0
 rcu_core_si+0x9/0x10
 handle_softirqs+0x19f/0x550
 __irq_exit_rcu+0xab/0x180
 irq_exit_rcu+0x9/0x20
 sysvec_call_function+0x73/0x80
 asm_sysvec_call_function+0x1b/0x20

Last potentially related work creation:
 kasan_save_stack+0x3a/0x60
 kasan_record_aux_stack+0x99/0xb0
 call_rcu+0x51/0x5c0
 __put_cred+0x9a/0xc0
 __fput+0x425/0x540
 fput_close_sync+0x8a/0x140
 __x64_sys_close+0x55/0xe0
 x64_sys_call+0x26ce/0x3030
 do_syscall_64+0xd8/0x380
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

The buggy address belongs to the object at ffff8881269a88c0
 which belongs to the cache cred of size 184
The buggy address is located 144 bytes inside of
 freed 184-byte region [ffff8881269a88c0, ffff8881269a8978)
[...]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
```


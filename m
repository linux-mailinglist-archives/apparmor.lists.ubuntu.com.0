Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDBFBD1F04
	for <lists+apparmor@lfdr.de>; Mon, 13 Oct 2025 10:09:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v8DcZ-0001Rm-I3; Mon, 13 Oct 2025 08:09:31 +0000
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <stephen.smalley.work@gmail.com>)
 id 1v7EK9-0003As-Lw
 for apparmor@lists.ubuntu.com; Fri, 10 Oct 2025 14:42:25 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-33255011eafso2339836a91.1
 for <apparmor@lists.ubuntu.com>; Fri, 10 Oct 2025 07:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760107344; x=1760712144;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/1lnHPEdEWZo+CQq4FmAQbXLK0sMDF/The3o/4XWkFk=;
 b=GvmlGoL+YD/tk5Vq/NcqFJe17HR5ws7ApKnMRHAYEytq2PAlFvT8rlf94gEirxCqGT
 H5Euj6WHdaHaIFjw+64MI6Iqhijg3ntLQ5EwIuy4VyG11BGg2qnFM5c7RETSie2IeMTn
 rlVDkGp7T4EmQjyNzimY75WkbkHMKLQYFRRGblga2EoMzf9sn4M+rOwHsKZtOtmNeYp/
 olaZFYIXOsGeuDkSiklRvMvqUbKAxDvvbFUUDIH1tps5EOwXVLqbG+cK/1B3h0d75H6V
 3APQRNLodQoqCGwPkyrfU7/S9L8q6zgK1OvKuyw1j0nanFgJhlmN42GdV2J7UX3qx+PC
 dyzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0lRtLIuWC0vnMdR17lwcBlMVSPVEAERF0gN3sjKANU+yXjsWWdqiGBbvletIqJWpf2246qMwnpg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzZA/rvGrOgYSbERtU3vERemF8VSw7HpSFKZ+yvCrCHDRfrkY6I
 jbulHTRjNYyjRPDuFDXtTFmt62NnbDkCIseWadsuUZgDQvr7M9Ykygkg3O0/uKx9eAmfCg7gxU5
 Q1x0emVQJ5sAeFoOPhrU8VNTWZ/v9N3k=
X-Gm-Gg: ASbGncs5MqUQPyxzE6+nRh0QBxGMwlwQYuN/B5JQUvCbfrMSbQZlCkRPy/ZwLzA5Wqo
 JRokIszAmUSepajpCjhld1l773w5Ej+MmFQo8uBcyQuV1FO7iVj1MBmQFe/6Bpe5n/m5RSM9Ybz
 lgbKiT2JiUsmFFGqhYIUsSLztwOdQ3h/omztDvBH32iw659KAE5rowoOn6cZZZe/kLTotLk+Kox
 duEo6WZ2OkW8IPH0lBQjG/2bvk3ctSBk7g2
X-Google-Smtp-Source: AGHT+IFsXItlp5QPUTqsr8CSOUNYNVTKUJnhco/kz6hzhqLLhxhwLkRrKj2BGYxqo3gsOdsVV3rvBkk7udICunbK7f8=
X-Received: by 2002:a17:90b:1641:b0:330:4a1d:223c with SMTP id
 98e67ed59e1d1-33b5116a6a6mr16709971a91.15.1760107343707; Fri, 10 Oct 2025
 07:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20251010132610.12001-1-maxime.belair@canonical.com>
 <20251010132610.12001-5-maxime.belair@canonical.com>
 <CAEjxPJ6Xcwsic_zyLTPdHHaY9r7-ZTySzyELQ76aVZCFbh8FMQ@mail.gmail.com>
In-Reply-To: <CAEjxPJ6Xcwsic_zyLTPdHHaY9r7-ZTySzyELQ76aVZCFbh8FMQ@mail.gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Fri, 10 Oct 2025 10:42:12 -0400
X-Gm-Features: AS18NWDccWyH7c6wXJg45erB-Ave82Isew0ZMf5dyNnwkmOaYknftSjGFvm9TU4
Message-ID: <CAEjxPJ5hbGrDPv3bRb1hhBw3+w=wOR3vxW5n9FnNLL8Uv-f0YQ@mail.gmail.com>
To: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.216.45;
 envelope-from=stephen.smalley.work@gmail.com; helo=mail-pj1-f45.google.com
X-Mailman-Approved-At: Mon, 13 Oct 2025 08:09:30 +0000
Subject: Re: [apparmor] [PATCH v6 4/5] SELinux: add support for
	lsm_config_system_policy
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
Cc: Ondrej Mosnacek <omosnace@redhat.com>, paul@paul-moore.com, song@kernel.org,
 kees@kernel.org, linux-api@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp,
 rdunlap@infradead.org, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 mic@digikod.net, takedakn@nttdata.co.jp,
 SElinux list <selinux@vger.kernel.org>, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, Oct 10, 2025 at 9:58=E2=80=AFAM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> On Fri, Oct 10, 2025 at 9:27=E2=80=AFAM Maxime B=C3=A9lair
> <maxime.belair@canonical.com> wrote:
> >
> > Enable users to manage SELinux policies through the new hook
> > lsm_config_system_policy. This feature is restricted to CAP_MAC_ADMIN.
>
> (added selinux mailing list and Fedora/Red Hat SELinux kernel maintainer =
to cc)
>
> A couple of observations:
> 1. We do not currently require CAP_MAC_ADMIN for loading SELinux
> policy, since it was only added later for Smack and SELinux implements
> its own permission checks. When loading policy via selinuxfs, one
> requires uid-0 or CAP_DAC_OVERRIDE to write to /sys/fs/selinux/load
> plus the corresponding SELinux permissions, but this is just an
> artifact of the filesystem-based interface. I'm not opposed to using
> CAP_MAC_ADMIN for loading policy via the new system call but wanted to
> note it as a difference.
>
> 2. The SELinux namespaces support [1], [2] is based on instantiating a
> separate selinuxfs instance for each namespace; you load a policy for
> a namespace by mounting a new selinuxfs instance after unsharing your
> SELinux namespace and then write to its /sys/fs/selinux/load
> interface, only affecting policy for the new namespace. Your interface
> doesn't appear to support such an approach and IIUC will currently
> always load the init SELinux namespace's policy rather than the
> current process' SELinux namespace.

Actually, on second thought, checking CAP_MAC_ADMIN via capable() will
require the process to have that capability in the global/init
namespace, which IIUC would prevent systemd running in a non-init user
namespace from loading the SELinux policy at all. That's problematic
for a different reason since it would prevent us from using this
interface for loading the namespace policy using this system call.
>
> [1] https://github.com/stephensmalley/selinuxns
> [2] https://lore.kernel.org/selinux/20250814132637.1659-1-stephen.smalley=
.work@gmail.com/
>
> >
> > Signed-off-by: Maxime B=C3=A9lair <maxime.belair@canonical.com>
> > ---
> >  security/selinux/hooks.c            | 27 +++++++++++++++++++++++++++
> >  security/selinux/include/security.h |  7 +++++++
> >  security/selinux/selinuxfs.c        | 16 ++++++++++++----
> >  3 files changed, 46 insertions(+), 4 deletions(-)
> >
> > diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> > index e7a7dcab81db..3d14d4e47937 100644
> > --- a/security/selinux/hooks.c
> > +++ b/security/selinux/hooks.c
> > @@ -7196,6 +7196,31 @@ static int selinux_uring_allowed(void)
> >  }
> >  #endif /* CONFIG_IO_URING */
> >
> > +/**
> > + * selinux_lsm_config_system_policy - Manage a LSM policy
> > + * @op: operation to perform. Currently, only LSM_POLICY_LOAD is suppo=
rted
> > + * @buf: User-supplied buffer
> > + * @size: size of @buf
> > + * @flags: reserved for future use; must be zero
> > + *
> > + * Returns: number of written rules on success, negative value on erro=
r
> > + */
> > +static int selinux_lsm_config_system_policy(u32 op, void __user *buf,
> > +                                           size_t size, u32 flags)
> > +{
> > +       loff_t pos =3D 0;
> > +
> > +       if (op !=3D LSM_POLICY_LOAD || flags)
> > +               return -EOPNOTSUPP;
> > +
> > +       if (!selinux_null.dentry || !selinux_null.dentry->d_sb ||
> > +           !selinux_null.dentry->d_sb->s_fs_info)
> > +               return -ENODEV;
> > +
> > +       return __sel_write_load(selinux_null.dentry->d_sb->s_fs_info, b=
uf, size,
> > +                               &pos);
> > +}
> > +
> >  static const struct lsm_id selinux_lsmid =3D {
> >         .name =3D "selinux",
> >         .id =3D LSM_ID_SELINUX,
> > @@ -7499,6 +7524,8 @@ static struct security_hook_list selinux_hooks[] =
__ro_after_init =3D {
> >  #ifdef CONFIG_PERF_EVENTS
> >         LSM_HOOK_INIT(perf_event_alloc, selinux_perf_event_alloc),
> >  #endif
> > +       LSM_HOOK_INIT(lsm_config_system_policy, selinux_lsm_config_syst=
em_policy),
> > +
> >  };
> >
> >  static __init int selinux_init(void)
> > diff --git a/security/selinux/include/security.h b/security/selinux/inc=
lude/security.h
> > index e7827ed7be5f..7b779ea43cc3 100644
> > --- a/security/selinux/include/security.h
> > +++ b/security/selinux/include/security.h
> > @@ -389,7 +389,14 @@ struct selinux_kernel_status {
> >  extern void selinux_status_update_setenforce(bool enforcing);
> >  extern void selinux_status_update_policyload(u32 seqno);
> >  extern void selinux_complete_init(void);
> > +
> > +struct selinux_fs_info;
> > +
> >  extern struct path selinux_null;
> > +extern ssize_t __sel_write_load(struct selinux_fs_info *fsi,
> > +                               const char __user *buf, size_t count,
> > +                               loff_t *ppos);
> > +
> >  extern void selnl_notify_setenforce(int val);
> >  extern void selnl_notify_policyload(u32 seqno);
> >  extern int selinux_nlmsg_lookup(u16 sclass, u16 nlmsg_type, u32 *perm)=
;
> > diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.=
c
> > index 47480eb2189b..1f7e611d8300 100644
> > --- a/security/selinux/selinuxfs.c
> > +++ b/security/selinux/selinuxfs.c
> > @@ -567,11 +567,11 @@ static int sel_make_policy_nodes(struct selinux_f=
s_info *fsi,
> >         return ret;
> >  }
> >
> > -static ssize_t sel_write_load(struct file *file, const char __user *bu=
f,
> > -                             size_t count, loff_t *ppos)
> > +ssize_t __sel_write_load(struct selinux_fs_info *fsi,
> > +                        const char __user *buf, size_t count,
> > +                        loff_t *ppos)
> >
> >  {
> > -       struct selinux_fs_info *fsi;
> >         struct selinux_load_state load_state;
> >         ssize_t length;
> >         void *data =3D NULL;
> > @@ -605,7 +605,6 @@ static ssize_t sel_write_load(struct file *file, co=
nst char __user *buf,
> >                 pr_warn_ratelimited("SELinux: failed to load policy\n")=
;
> >                 goto out;
> >         }
> > -       fsi =3D file_inode(file)->i_sb->s_fs_info;
> >         length =3D sel_make_policy_nodes(fsi, load_state.policy);
> >         if (length) {
> >                 pr_warn_ratelimited("SELinux: failed to initialize seli=
nuxfs\n");
> > @@ -626,6 +625,15 @@ static ssize_t sel_write_load(struct file *file, c=
onst char __user *buf,
> >         return length;
> >  }
> >
> > +static ssize_t sel_write_load(struct file *file, const char __user *bu=
f,
> > +                             size_t count, loff_t *ppos)
> > +{
> > +       struct selinux_fs_info *fsi =3D file_inode(file)->i_sb->s_fs_in=
fo;
> > +
> > +       return __sel_write_load(fsi, buf, count, ppos);
> > +}
> > +
> > +
> >  static const struct file_operations sel_load_ops =3D {
> >         .write          =3D sel_write_load,
> >         .llseek         =3D generic_file_llseek,
> > --
> > 2.48.1
> >


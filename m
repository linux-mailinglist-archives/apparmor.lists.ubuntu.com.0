Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D6220766699
	for <lists+apparmor@lfdr.de>; Fri, 28 Jul 2023 10:13:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qPIbL-0002Cj-7g; Fri, 28 Jul 2023 08:13:31 +0000
Received: from mail-pg1-f202.google.com ([209.85.215.202])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from
 <3DbHCZAMKCKYYJLMUUMRK.IUSGVVGXSUXROYZY.aHaTZa.IUS@flex--sdf.bounces.google.com>)
 id 1qP5J8-0005xg-RB
 for apparmor@lists.ubuntu.com; Thu, 27 Jul 2023 18:01:51 +0000
Received: by mail-pg1-f202.google.com with SMTP id
 41be03b00d2f7-5634dbfb8b1so771715a12.1
 for <apparmor@lists.ubuntu.com>; Thu, 27 Jul 2023 11:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690480909; x=1691085709;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=zQhQ+VSPJiT/sF1vRnyh4Q/edWHny2NYyXr78uE6E6M=;
 b=MXN0RwiQuEoK59/406fj3hfB9GFLmNe746Z+h8t73hbQCE1d1qq/izbPkNLsJ6Px2M
 Vban7KRfw/LuyxsjsqlFIKu5xuwLJxZQjqwf6YOq26lb6AyvDNcUvqSG8vj6as2sTY+T
 qfo4dzt8M6QFxjvNpOCieikt35YsPF8NOsjN+Zeb0qqtrOHb1CID/EzxYvoLeNCRuhQk
 X6Zj6RiQh0RnXAkaWNvbvk6ESEeLk0T4UqTFWfarPMmqOQ4NKQ8QkhuhmZeO8Rwy6d3v
 qTa/LwBgOg5pPo63GPS7Rkndq7A3Pz0klfwoCUoBCvtZ6xPRb4mWucJ//Dab3DxcBzBf
 tMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690480909; x=1691085709;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zQhQ+VSPJiT/sF1vRnyh4Q/edWHny2NYyXr78uE6E6M=;
 b=Wzv/5mEUv1asI1p5wy2Cszh4bZmos/lx9xVWF5lSQ9i2GA3wtrNXvMbhL165COiO4Y
 yyMDqIzQ6DmEXiXhTJaL4PTI3zlWFOCGbI8DS2RVTGo8KBPXzFpACMGgzXgVJuFqFvIz
 j+2DkMVr2n5lEKmdc71ISCPPxiWQnKenUCFjy+Hd+1fu5/sUcFfdPei2LvpvbpOPvIgH
 6asLv38Go4L8hFrleFg37IFT/IZndf4Mci28cLmpdtxE98VXGoIMEF5nECW9L5w05bGQ
 t2TIi9NWvbPutUUOYnwBiiwROBf9j9gYq76cFSHZCc1oR1OAgue0GMzCOIclq4i28Y7J
 mlMA==
X-Gm-Message-State: ABy/qLYdT6L4hUfbQwWes1PoSBAQz0q8ayj0qNs7XllF4Boftdtxk9tm
 Tv3VOf6iYhxLGfux5c/ZM2pMQtw=
X-Google-Smtp-Source: APBJJlGroNGzDDua9ZSJVxJ3gwxUQcJeCDe6elRlqKhr2EYpQR+GDuPvk08ZnrYhFF5YheOlKnAjVj8=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a63:790a:0:b0:55a:b9bb:7ca with SMTP id
 u10-20020a63790a000000b0055ab9bb07camr29145pgc.10.1690480909118; Thu, 27 Jul
 2023 11:01:49 -0700 (PDT)
Date: Thu, 27 Jul 2023 11:01:47 -0700
In-Reply-To: <b41babb1-f0f2-dc2f-c2e3-1870107fbd9f@tessares.net>
Mime-Version: 1.0
References: <3076188eb88cca9151a2d12b50ba1e870b11ce09.1689693294.git.geliang.tang@suse.com>
 <CAHC9VhS_LKdkEmm5_J5y34RpaRcTbg8==fpz8pMThDCjF6nYtQ@mail.gmail.com>
 <b41babb1-f0f2-dc2f-c2e3-1870107fbd9f@tessares.net>
Message-ID: <ZMKxC+CFj4GbCklg@google.com>
From: Stanislav Fomichev <sdf@google.com>
To: Matthieu Baerts <matthieu.baerts@tessares.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 28 Jul 2023 08:13:29 +0000
Subject: Re: [apparmor] [RFC bpf-next v5] bpf: Force to MPTCP
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
Cc: Paul Moore <paul@paul-moore.com>, selinux@vger.kernel.org,
 netdev@vger.kernel.org, apparmor@lists.ubuntu.com,
 Alexei Starovoitov <ast@kernel.org>, Geliang Tang <geliang.tang@suse.com>,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, mptcp@lists.linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 07/27, Matthieu Baerts wrote:
> Hi Paul, Stanislav,
>=20
> On 18/07/2023 18:14, Paul Moore wrote:
> > On Tue, Jul 18, 2023 at 11:21=E2=80=AFAM Geliang Tang <geliang.tang@sus=
e.com> wrote:
> >>
> >> As is described in the "How to use MPTCP?" section in MPTCP wiki [1]:
> >>
> >> "Your app can create sockets with IPPROTO_MPTCP as the proto:
> >> ( socket(AF_INET, SOCK_STREAM, IPPROTO_MPTCP); ). Legacy apps can be
> >> forced to create and use MPTCP sockets instead of TCP ones via the
> >> mptcpize command bundled with the mptcpd daemon."
> >>
> >> But the mptcpize (LD_PRELOAD technique) command has some limitations
> >> [2]:
> >>
> >>  - it doesn't work if the application is not using libc (e.g. GoLang
> >> apps)
> >>  - in some envs, it might not be easy to set env vars / change the way
> >> apps are launched, e.g. on Android
> >>  - mptcpize needs to be launched with all apps that want MPTCP: we cou=
ld
> >> have more control from BPF to enable MPTCP only for some apps or all t=
he
> >> ones of a netns or a cgroup, etc.
> >>  - it is not in BPF, we cannot talk about it at netdev conf.
> >>
> >> So this patchset attempts to use BPF to implement functions similer to
> >> mptcpize.
> >>
> >> The main idea is add a hook in sys_socket() to change the protocol id
> >> from IPPROTO_TCP (or 0) to IPPROTO_MPTCP.
> >>
> >> [1]
> >> https://github.com/multipath-tcp/mptcp_net-next/wiki
> >> [2]
> >> https://github.com/multipath-tcp/mptcp_net-next/issues/79
> >>
> >> v5:
> >>  - add bpf_mptcpify helper.
> >>
> >> v4:
> >>  - use lsm_cgroup/socket_create
> >>
> >> v3:
> >>  - patch 8: char cmd[128]; -> char cmd[256];
> >>
> >> v2:
> >>  - Fix build selftests errors reported by CI
> >>
> >> Closes: https://github.com/multipath-tcp/mptcp_net-next/issues/79
> >> Signed-off-by: Geliang Tang <geliang.tang@suse.com>
> >> ---
> >>  include/linux/bpf.h                           |   1 +
> >>  include/linux/lsm_hook_defs.h                 |   2 +-
> >>  include/linux/security.h                      |   6 +-
> >>  include/uapi/linux/bpf.h                      |   7 +
> >>  kernel/bpf/bpf_lsm.c                          |   2 +
> >>  net/mptcp/bpf.c                               |  20 +++
> >>  net/socket.c                                  |   4 +-
> >>  security/apparmor/lsm.c                       |   8 +-
> >>  security/security.c                           |   2 +-
> >>  security/selinux/hooks.c                      |   6 +-
> >>  tools/include/uapi/linux/bpf.h                |   7 +
> >>  .../testing/selftests/bpf/prog_tests/mptcp.c  | 128 ++++++++++++++++-=
-
> >>  tools/testing/selftests/bpf/progs/mptcpify.c  |  17 +++
> >>  13 files changed, 187 insertions(+), 23 deletions(-)
> >>  create mode 100644 tools/testing/selftests/bpf/progs/mptcpify.c
> >=20
> > ...
> >=20
> >> diff --git a/security/security.c b/security/security.c
> >> index b720424ca37d..bbebcddce420 100644
> >> --- a/security/security.c
> >> +++ b/security/security.c
> >> @@ -4078,7 +4078,7 @@ EXPORT_SYMBOL(security_unix_may_send);
> >>   *
> >>   * Return: Returns 0 if permission is granted.
> >>   */
> >> -int security_socket_create(int family, int type, int protocol, int ke=
rn)
> >> +int security_socket_create(int *family, int *type, int *protocol, int=
 kern)
> >>  {
> >>         return call_int_hook(socket_create, 0, family, type, protocol,=
 kern);
> >>  }
> >=20
> > Using the LSM to change the protocol family is not something we want
> > to allow.  I'm sorry, but you will need to take a different approach.
>=20
> @Paul: Thank you for your feedback. It makes sense and I understand.
>=20
> @Stanislav: Despite the fact the implementation was smaller and reusing
> more code, it looks like we cannot go in the direction you suggested. Do
> you think what Geliang suggested before in his v3 [1] can be accepted?
>=20
> (Note that the v3 is the same as the v1, only some fixes in the selftests=
.)

We have too many hooks in networking, so something that doesn't add
a new one is preferable :-( Moreover, we already have a 'socket init'
hook, but it runs a bit late.

Is existing cgroup/sock completely unworkable? Is it possible to
expose some new bpf_upgrade_socket_to(IPPROTO_MPTCP) kfunc which would
call some new net_proto_family->upgrade_to(IPPROTO_MPTCP) to do the surgery=
?
Or is it too hacky?

Another option Alexei suggested is to add some fentry-like thing:

noinline int update_socket_protocol(int protocol)
{
	return protocol;
}
/* TODO: ^^^ add the above to mod_ret set */

int __sys_socket(int family, int type, int protocol)
{
	...

	protocol =3D update_socket_protocol(protocol);

	...
}

But it's also too problem specific it seems? And it's not cgroup-aware.


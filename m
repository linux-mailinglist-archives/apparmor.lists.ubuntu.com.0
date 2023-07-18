Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 830707581D6
	for <lists+apparmor@lfdr.de>; Tue, 18 Jul 2023 18:15:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qLnLg-0002Ug-Sv; Tue, 18 Jul 2023 16:14:52 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <paul@paul-moore.com>) id 1qLnLe-0002UY-DT
 for apparmor@lists.ubuntu.com; Tue, 18 Jul 2023 16:14:50 +0000
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-57764a6bf8cso60790167b3.3
 for <apparmor@lists.ubuntu.com>; Tue, 18 Jul 2023 09:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1689696889; x=1692288889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aIxbqWruk3tde8GVe4doC/LqINU6BWOqPPtRnKi722g=;
 b=WcRQ65n2jffvRfWCd/0smTGdkn4JwU1AcKC64qNQdLnF+Zl2LddiiFmy/exjJpDO2Q
 kYnOcXQ6NyJ0CamdYVCkvtRg5AdC0+AHUysEq4EqUaP6fvIeIGDWgA++zhM+A1TlH3Ww
 YZSugrPeUDvfPsEBOyxSbOoqoMz8vxjPGJYeBVSSQZZ1Pv57fAsOYMi2g7NLD1qfYcoI
 KunMLrJOhVQSatmpdU9b5b7PcE6Vv8isJ/ceXgrIR9SNbUHuMSVEGzYE9ir1wS2wscVm
 N0pvai/AjXhy70uf1ykJpI3E0j//MKVD5AJLcMS3iO1XJtPWOhc1z0qpHcSizch8FFz6
 g50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689696889; x=1692288889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aIxbqWruk3tde8GVe4doC/LqINU6BWOqPPtRnKi722g=;
 b=YeGY9/Mf4kZ+jtzinvW3a92oPycH31URgBQRVVRCeoIYATyzI8gqTpnTN6OB7Kgu/V
 xdePTWFaEOPdltWxwo90d356NzGSKe77D/ugaMBm4YS4ApWgBLYtw9BPZ4qwvBS5okWt
 cCVOcSzAvzmzkakw3p0md+X7UrfRBdKrC7xA3HgR9BeZp2YbU2VnZScbBkRvzQtAb4WB
 pUZ8rgR6M6bliYaHmY+rBAPzxpIV+bFsp1xSY64YoI5K3UD6LsNLPuPKnDXUeh50Wj/O
 ZeCL6yaLfYT/p+xHNTwcPmMhfX1wuoNdWGAngnMe1ycM4tzKugLg0cqONjubZvsE9i3s
 RXpg==
X-Gm-Message-State: ABy/qLYPdRrb0t7E60/fzhIWxEyVag49x3jCFi7z5KkDvjOGZyjnwj4f
 kk1sbcZIwmvOrKXH461+Q0DH2dAF8jPJD05rUPHr
X-Google-Smtp-Source: APBJJlFiIjBtpQQejWvrjQReyY+tBIxRJDFWVT5w7U/heJfhvIbpO+/96V065lnbgvZpVmD5IVL95oW37LKVsskcjTI=
X-Received: by 2002:a0d:d754:0:b0:582:98f9:a1e3 with SMTP id
 z81-20020a0dd754000000b0058298f9a1e3mr215180ywd.18.1689696889222; Tue, 18 Jul
 2023 09:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <3076188eb88cca9151a2d12b50ba1e870b11ce09.1689693294.git.geliang.tang@suse.com>
In-Reply-To: <3076188eb88cca9151a2d12b50ba1e870b11ce09.1689693294.git.geliang.tang@suse.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 18 Jul 2023 12:14:38 -0400
Message-ID: <CAHC9VhS_LKdkEmm5_J5y34RpaRcTbg8==fpz8pMThDCjF6nYtQ@mail.gmail.com>
To: Geliang Tang <geliang.tang@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: selinux@vger.kernel.org, netdev@vger.kernel.org, apparmor@lists.ubuntu.com,
 Alexei Starovoitov <ast@kernel.org>, linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, mptcp@lists.linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Jul 18, 2023 at 11:21=E2=80=AFAM Geliang Tang <geliang.tang@suse.co=
m> wrote:
>
> As is described in the "How to use MPTCP?" section in MPTCP wiki [1]:
>
> "Your app can create sockets with IPPROTO_MPTCP as the proto:
> ( socket(AF_INET, SOCK_STREAM, IPPROTO_MPTCP); ). Legacy apps can be
> forced to create and use MPTCP sockets instead of TCP ones via the
> mptcpize command bundled with the mptcpd daemon."
>
> But the mptcpize (LD_PRELOAD technique) command has some limitations
> [2]:
>
>  - it doesn't work if the application is not using libc (e.g. GoLang
> apps)
>  - in some envs, it might not be easy to set env vars / change the way
> apps are launched, e.g. on Android
>  - mptcpize needs to be launched with all apps that want MPTCP: we could
> have more control from BPF to enable MPTCP only for some apps or all the
> ones of a netns or a cgroup, etc.
>  - it is not in BPF, we cannot talk about it at netdev conf.
>
> So this patchset attempts to use BPF to implement functions similer to
> mptcpize.
>
> The main idea is add a hook in sys_socket() to change the protocol id
> from IPPROTO_TCP (or 0) to IPPROTO_MPTCP.
>
> [1]
> https://github.com/multipath-tcp/mptcp_net-next/wiki
> [2]
> https://github.com/multipath-tcp/mptcp_net-next/issues/79
>
> v5:
>  - add bpf_mptcpify helper.
>
> v4:
>  - use lsm_cgroup/socket_create
>
> v3:
>  - patch 8: char cmd[128]; -> char cmd[256];
>
> v2:
>  - Fix build selftests errors reported by CI
>
> Closes: https://github.com/multipath-tcp/mptcp_net-next/issues/79
> Signed-off-by: Geliang Tang <geliang.tang@suse.com>
> ---
>  include/linux/bpf.h                           |   1 +
>  include/linux/lsm_hook_defs.h                 |   2 +-
>  include/linux/security.h                      |   6 +-
>  include/uapi/linux/bpf.h                      |   7 +
>  kernel/bpf/bpf_lsm.c                          |   2 +
>  net/mptcp/bpf.c                               |  20 +++
>  net/socket.c                                  |   4 +-
>  security/apparmor/lsm.c                       |   8 +-
>  security/security.c                           |   2 +-
>  security/selinux/hooks.c                      |   6 +-
>  tools/include/uapi/linux/bpf.h                |   7 +
>  .../testing/selftests/bpf/prog_tests/mptcp.c  | 128 ++++++++++++++++--
>  tools/testing/selftests/bpf/progs/mptcpify.c  |  17 +++
>  13 files changed, 187 insertions(+), 23 deletions(-)
>  create mode 100644 tools/testing/selftests/bpf/progs/mptcpify.c

...

> diff --git a/security/security.c b/security/security.c
> index b720424ca37d..bbebcddce420 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -4078,7 +4078,7 @@ EXPORT_SYMBOL(security_unix_may_send);
>   *
>   * Return: Returns 0 if permission is granted.
>   */
> -int security_socket_create(int family, int type, int protocol, int kern)
> +int security_socket_create(int *family, int *type, int *protocol, int ke=
rn)
>  {
>         return call_int_hook(socket_create, 0, family, type, protocol, ke=
rn);
>  }

Using the LSM to change the protocol family is not something we want
to allow.  I'm sorry, but you will need to take a different approach.

--=20
paul-moore.com


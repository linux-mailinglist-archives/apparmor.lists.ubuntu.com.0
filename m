Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A92B76C7F8
	for <lists+apparmor@lfdr.de>; Wed,  2 Aug 2023 10:07:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qR6tD-00064f-NW; Wed, 02 Aug 2023 08:07:27 +0000
Received: from mail-lj1-f177.google.com ([209.85.208.177])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <alexei.starovoitov@gmail.com>) id 1qR1WP-0005Cw-CM
 for apparmor@lists.ubuntu.com; Wed, 02 Aug 2023 02:23:33 +0000
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2b9b50be31aso96748731fa.3
 for <apparmor@lists.ubuntu.com>; Tue, 01 Aug 2023 19:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690943012; x=1691547812;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3FguIqfO6fA0en1tAJcHc1To85beuh1CsHQRCqfyQt0=;
 b=d1uLtGhtE4ga7jedFfoU52u3XFP5LL4+sF4vs9hz0lH/pTqgkQTBLCKYzdU+lHBLvn
 5NadrBu9uulcQs/MVVEXgAnBrpUunlu/UZXaS3ilaDS66w0HMewijXOXN9eqEDQjQul2
 Y/TLS6Nhj+60BHQrXfhPPLeCQW4959KG5l0F4RiIWUGMzT8TJriVj9RGrmZ3m/jNF9mN
 VT0q3AIlC++O5J/3ELqS9WYwi5M+Yg0zQ5q0VuzOIlBNeJ7jWiNe6oWLXWGEMUnOYLV8
 WyQt+g3zhsi1/Xdht0ZsRqsJQQVmbPTuyx359Xwsqxpmyc+L/xgea/8PyaKcEoGn/M9+
 3eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690943012; x=1691547812;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3FguIqfO6fA0en1tAJcHc1To85beuh1CsHQRCqfyQt0=;
 b=l5aNCWTwryBOzdFWAXig1bxUHDNb6o58mDMkcu5oq17kdUF1mnZQZbkqqhBbPGZr5A
 fMtXgVLuWscf/oLo4XgpSwSR11wcueDHH0aTCs/8zZMOn64NPQO+WCvnGlgHC9N0FL61
 MlUl8gr4mibgucfryM7ILDRjkhIlUrWaNjr6/Z6tFXej1H+yby2pyuIpSV+za+tZ3kBe
 a8hlFttF0Bq0cW0V9b5nivDqz6I4Lor+t2ZCUQqEI5wAi6upw0oy9LKWTYjBdsrgmONg
 5TPD9H2dNC0Ou6aZauKCEYQ6fSjhA+x2PT8GbRcVqlr2rRNfgXK13LOou2GZ2zFlWbfV
 VJrA==
X-Gm-Message-State: ABy/qLZNPDU7R8fDZrX0ENkkLw18wnHW+1gMQFPHxdcVNrGWnl4qVmd2
 YnZGN27nakGa2hXtkYwbU+kSECZZ2tIDiwPYbnQ=
X-Google-Smtp-Source: APBJJlG8DpVQd1HX0sziPuWjT0LVfNpCxEMyII6e8Er09IIz5vcp1ZwFHDi/kyZCsVnrgHRgcFINXGCy73y0Os8s2MQ=
X-Received: by 2002:a2e:8ec3:0:b0:2a7:adf7:1781 with SMTP id
 e3-20020a2e8ec3000000b002a7adf71781mr3969470ljl.2.1690943012233; Tue, 01 Aug
 2023 19:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690624340.git.geliang.tang@suse.com>
 <20230801004323.l2npfegkq3srzff3@MacBook-Pro-8.local>
 <20230802021903.GA3070@bogon>
In-Reply-To: <20230802021903.GA3070@bogon>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 1 Aug 2023 19:23:21 -0700
Message-ID: <CAADnVQJRmXy_iFBsWLTTKBnmwPjSJP+7RLfJwB9GUb=GEFoMwg@mail.gmail.com>
To: Geliang Tang <geliang.tang@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.177;
 envelope-from=alexei.starovoitov@gmail.com; helo=mail-lj1-f177.google.com
X-Mailman-Approved-At: Wed, 02 Aug 2023 08:07:26 +0000
Subject: Re: [apparmor] [RFC bpf-next v7 0/6] bpf: Force to MPTCP
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
Cc: Alexei Starovoitov <ast@kernel.org>, James Morris <jmorris@namei.org>,
 Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 Paul Moore <paul@paul-moore.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Mat Martineau <martineau@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Florent Revest <revest@chromium.org>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, KP Singh <kpsingh@kernel.org>,
 Brendan Jackman <jackmanb@chromium.org>, Yonghong Song <yhs@fb.com>,
 Eric Paris <eparis@parisplace.org>, MPTCP Upstream <mptcp@lists.linux.dev>,
 Hao Luo <haoluo@google.com>, Network Development <netdev@vger.kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 LSM List <linux-security-module@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Matthieu Baerts <matthieu.baerts@tessares.net>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Aug 1, 2023 at 7:19=E2=80=AFPM Geliang Tang <geliang.tang@suse.com>=
 wrote:
>
> On Mon, Jul 31, 2023 at 05:43:23PM -0700, Alexei Starovoitov wrote:
> > On Sat, Jul 29, 2023 at 05:57:21PM +0800, Geliang Tang wrote:
> > >
> > > The main idea is to add a hook in sys_socket() to change the protocol=
 id
> > > from IPPROTO_TCP (or 0) to IPPROTO_MPTCP.
> >
> > I still think it's a hack, but its blast radius is nicely contained.
> > And since I cannot propose any better I'm ok with it.
> >
> > Patches 1-2 can be squashed into one.
> > Just like patches 3-6 as a single patch for selftests.
>
> Thanks Alexei. I'll squash patch 1 and patch 2 into one, and squash patch=
 3
> and patch 6 into one for selftests. But I prefer to keep patch 4 and patc=
h 5
> as is, since they were implemented in different times for different purpo=
ses.
> They were merged into MPTCP repo on May 17 for "run MPTCP sched tests in =
a
> dedicated ns" [1].

since they were sent to a different tree than don't send them here.
git will not like that during the merge window.


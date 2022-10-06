Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9275D5F7229
	for <lists+apparmor@lfdr.de>; Fri,  7 Oct 2022 02:07:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ogatb-0001bN-OT; Fri, 07 Oct 2022 00:07:19 +0000
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <keescook@chromium.org>) id 1ogSkF-0001Ky-18
 for apparmor@lists.ubuntu.com; Thu, 06 Oct 2022 15:25:07 +0000
Received: by mail-pf1-f171.google.com with SMTP id y136so2363433pfb.3
 for <apparmor@lists.ubuntu.com>; Thu, 06 Oct 2022 08:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date; bh=OtDkks39cgYVeSHQm8gd1cyY+JEJiwboAG4vuizNOOQ=;
 b=bwYKBKdRbKMXUGR+1Ba8s3APih/vqE4MzepUDPFpZZHmlwMDQPXFSRTr6JI2afx1mB
 5cCbkbKmfA/SsPQewwxLX0n1fuUOpqCqwDg8icP+4MjefbAGmbzfdCmtuHboewFG1cgf
 2Xuw32nN44/m5B/9jthRwgcr/98+HiByIIItU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=OtDkks39cgYVeSHQm8gd1cyY+JEJiwboAG4vuizNOOQ=;
 b=Ny08XXgCrXEutseI5Yb2KOU/izrrLktJxQ4UKi1mynuAd9+zpdqujI5O/xucOzD9m+
 Ot6M3yB4i1AAw+tvdBfPmkks34JV3NNrP+9ut4z+9Kar8/LNll4RAHitHGuYQyNVQGDO
 3wyJTGpLfAwBc1Sl+DexYIe0dbq1ZA6d3Huiu+aDgnxBwgSIaTupdjqVXQkRATILbUVt
 Saj6yzOjkEdtgKE4eS9gBE1X6WQBhJpwxrbSzw9fRE0a52ySJL1PLxFINj+LjkjdYEYE
 RmWyVddVhRaOmVLU5Uyot49hSgZX0Pxxj46nWXY18ku/dMp/vffOF+Lh7fYcsH9NvUrb
 9h3Q==
X-Gm-Message-State: ACrzQf3K63LRTYidBC7cZvdjRo9yWNYf4D17ieKV2gXSeWxHGKfLaBrX
 SGH5a5mWzONM6vu6MDPKPwnCiQ==
X-Google-Smtp-Source: AMsMyM5z1VQ/jYK2JD6/gNJiBdecIUmzcUy8MsflqoW0L8g/0cewBDfu6RFeroKPJlKOEYkHIn4RBA==
X-Received: by 2002:a05:6a00:22c9:b0:561:8635:7b35 with SMTP id
 f9-20020a056a0022c900b0056186357b35mr334380pfj.3.1665069905412; 
 Thu, 06 Oct 2022 08:25:05 -0700 (PDT)
Received: from [127.0.0.1] (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 73-20020a63054c000000b0042fe1914e26sm2006066pgf.37.2022.10.06.08.25.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 08:25:04 -0700 (PDT)
Date: Thu, 06 Oct 2022 08:25:01 -0700
From: Kees Cook <keescook@chromium.org>
To: Jann Horn <jannh@google.com>, Christian Brauner <brauner@kernel.org>
User-Agent: K-9 Mail for Android
In-Reply-To: <CAG48ez0sEkmaez9tYqgMXrkREmXZgxC9fdQD3mzF9cGo_=Tfyg@mail.gmail.com>
References: <20221006082735.1321612-1-keescook@chromium.org>
 <20221006082735.1321612-2-keescook@chromium.org>
 <20221006090506.paqjf537cox7lqrq@wittgenstein>
 <CAG48ez0sEkmaez9tYqgMXrkREmXZgxC9fdQD3mzF9cGo_=Tfyg@mail.gmail.com>
Message-ID: <86CE201B-5632-4BB7-BCF6-7CB2C2895409@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 07 Oct 2022 00:07:18 +0000
Subject: Re: [apparmor] [PATCH 1/2] fs/exec: Explicitly unshare fs_struct on
	exec
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
Cc: Micah Morton <mortonm@chromium.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrei Vagin <avagin@gmail.com>, linux-hardening@vger.kernel.org,
 Xin Long <lucien.xin@gmail.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Fenghua Yu <fenghua.yu@intel.com>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-fsdevel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Eric Paris <eparis@parisplace.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jorge Merlino <jorge.merlino@canonical.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Richard Haines <richard_c_haines@btinternet.com>,
 linux-security-module@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Prashanth Prahlad <pprahlad@redhat.com>, Todd Kjos <tkjos@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>



On October 6, 2022 7:13:37 AM PDT, Jann Horn <jannh@google=2Ecom> wrote:
>On Thu, Oct 6, 2022 at 11:05 AM Christian Brauner <brauner@kernel=2Eorg> =
wrote:
>> On Thu, Oct 06, 2022 at 01:27:34AM -0700, Kees Cook wrote:
>> > The check_unsafe_exec() counting of n_fs would not add up under a hea=
vily
>> > threaded process trying to perform a suid exec, causing the suid port=
ion
>> > to fail=2E This counting error appears to be unneeded, but to catch a=
ny
>> > possible conditions, explicitly unshare fs_struct on exec, if it ends=
 up
>>
>> Isn't this a potential uapi break? Afaict, before this change a call to
>> clone{3}(CLONE_FS) followed by an exec in the child would have the
>> parent and child share fs information=2E So if the child e=2Eg=2E, chan=
ges the
>> working directory post exec it would also affect the parent=2E But afte=
r
>> this change here this would no longer be true=2E So a child changing a
>> workding directoro would not affect the parent anymore=2E IOW, an exec =
is
>> accompanied by an unshare(CLONE_FS)=2E Might still be worth trying ofc =
but
>> it seems like a non-trivial uapi change but there might be few users
>> that do clone{3}(CLONE_FS) followed by an exec=2E
>
>I believe the following code in Chromium explicitly relies on this
>behavior, but I'm not sure whether this code is in active use anymore:
>
>https://source=2Echromium=2Eorg/chromium/chromium/src/+/main:sandbox/linu=
x/suid/sandbox=2Ec;l=3D101?q=3DCLONE_FS&sq=3D&ss=3Dchromium

Oh yes=2E I think I had tried to forget this existed=2E Ugh=2E Okay, so ba=
ck to the drawing board, I guess=2E The counting will need to be fixed=2E=
=2E=2E

It's possible we can move the counting after dethread -- it seems the earl=
y count was just to avoid setting flags after the point of no return, but i=
t's not an error condition=2E=2E=2E

--=20
Kees Cook


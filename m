Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DE55F722A
	for <lists+apparmor@lfdr.de>; Fri,  7 Oct 2022 02:07:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ogatb-0001ba-SE; Fri, 07 Oct 2022 00:07:19 +0000
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <keescook@chromium.org>) id 1ogXMF-0004A1-5w
 for apparmor@lists.ubuntu.com; Thu, 06 Oct 2022 20:20:39 +0000
Received: by mail-pj1-f50.google.com with SMTP id 70so2668312pjo.4
 for <apparmor@lists.ubuntu.com>; Thu, 06 Oct 2022 13:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date;
 bh=Rk5zz4A39+pbcgAoB20NzVrsEawygpTbgx4vBx4ppIs=;
 b=BYx3cjQRaQ61qD4kci8lj8sUlKGwxBQTGugOVwVFovwHCmI/LQDbCjb+DkICpsvW4m
 STdWXo4QVJpb8zGJImpu91r/m8zGJm3KZaeFnkzRlgCgjI+0GDcxB5MTmrhucCW633IN
 I6hYYHjSrLy5aixD/PhLwPqvTzNVP1wuQopiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=Rk5zz4A39+pbcgAoB20NzVrsEawygpTbgx4vBx4ppIs=;
 b=m7RKdLoujXf1oQB/S/Cb+3UQxPc66NajsHF0wfQcFlEZa83C95vSUd9N9hKd0tHqce
 AAKZd5jE50sx0H4tkW2JLfv6mIx+2SP+z1Fqinkd212J+DLdzZUu04oGRH6/aLfybEPV
 FoI9VUgOAenxK9NSD8efCGu6aCnEzhKMTXv0AMdC8zEl9inpQQla/47+dMNM+ntvMvHS
 +6WyAsZ3c81zvsQOrqBFbcVLKAHQ2VXvPBI0TfGQW/ujL/mq9D429dO1Ycb8TNd4tood
 4EleB2NrVOtNoFLtEtKwu9EmG5jmGo8UgeN8I+zfYugKRPPPr/Az3AaS/gJQtjmF6yLu
 XAQg==
X-Gm-Message-State: ACrzQf2VNHmT/lXLNWmJwAHUyri0d03xwH2HYz63Al3mFTXqSSMwmeVU
 ugH8vid4ONkAslOLHf3X49c7RA==
X-Google-Smtp-Source: AMsMyM6jQK6faWu8ciVNIyHuo5DdhGUHU792hu5M2+fkiWdd1JDFyJ7HN7J/+hDDUVtrL381rrTPHQ==
X-Received: by 2002:a17:902:864c:b0:179:fe02:611e with SMTP id
 y12-20020a170902864c00b00179fe02611emr1539895plt.10.1665087637621; 
 Thu, 06 Oct 2022 13:20:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a635b08000000b0045328df8bd0sm148201pgb.71.2022.10.06.13.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 13:20:36 -0700 (PDT)
Date: Thu, 6 Oct 2022 13:20:35 -0700
From: Kees Cook <keescook@chromium.org>
To: Jorge Merlino <jorge.merlino@canonical.com>
Message-ID: <202210061301.207A20C8E5@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202209131456.76A13BC5E4@keescook>
X-Mailman-Approved-At: Fri, 07 Oct 2022 00:07:18 +0000
Subject: Re: [apparmor] [PATCH] Fix race condition when exec'ing setuid files
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
 Fenghua Yu <fenghua.yu@intel.com>, Jann Horn <jannh@google.com>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Eric Paris <eparis@parisplace.org>,
 Thomas Gleixner <tglx@linutronix.de>, Christian Brauner <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Richard Haines <richard_c_haines@btinternet.com>,
 linux-security-module@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Prashanth Prahlad <pprahlad@redhat.com>, Todd Kjos <tkjos@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Sep 13, 2022 at 15:03:38 -0700, Kees Cook wrote:
> It seems quite unusual to have a high-load heavily threaded
> process decide to exec.

In looking at this a bunch more, I actually think everything is working
as intended. If a process is actively launching threads while also trying
to exec, they're going to create races for themselves.

So the question, then, is "why are they trying to exec while actively
spawning new threads?" That appears to be the core problem here, and as
far as I can tell, the kernel has behaved this way for a very long time.
I don't think the kernel should fix this, either, because it leads to a
very weird state for userspace, where the thread spawner may suddenly
die due to the exec happening in another thread. This really looks like
something userspace needs to handle correctly (i.e. don't try to exec
while actively spawning threads).

For example, here's a fix to the original PoC:

--- a.c.original        2022-10-06 13:07:13.279845619 -0700
+++ a.c 2022-10-06 13:10:27.702941645 -0700
@@ -8,8 +8,10 @@
        return NULL;
 }
 
+int stop_spawning;
+
 void *target(void *p) {
-       for (;;) {
+       while (!stop_spawning) {
                pthread_t t;
                if (pthread_create(&t, NULL, nothing, NULL) == 0)
                        pthread_join(t, NULL);
@@ -17,18 +19,26 @@
        return NULL;
 }
 
+#define MAX_THREADS    10
+
 int main(void)
 {
+       pthread_t threads[MAX_THREADS];
        struct timespec tv;
        int i;
 
-       for (i = 0; i < 10; i++) {
-               pthread_t t;
-               pthread_create(&t, NULL, target, NULL);
+       for (i = 0; i < MAX_THREADS; i++) {
+               pthread_create(&threads[i], NULL, target, NULL);
        }
        tv.tv_sec = 0;
        tv.tv_nsec = 100000;
        nanosleep(&tv, NULL);
+
+       /* Signal shut down, and collect spawners. */
+       stop_spawning = 1;
+       for (i = 0; i < MAX_THREADS; i++)
+               pthread_join(threads[i], NULL);
+
        if (execl("./b", "./b", NULL) < 0)
                perror("execl");
        return 0;


-- 
Kees Cook


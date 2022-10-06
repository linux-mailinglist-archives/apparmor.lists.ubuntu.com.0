Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6924C5F699F
	for <lists+apparmor@lfdr.de>; Thu,  6 Oct 2022 16:32:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ogRup-0006CY-P3; Thu, 06 Oct 2022 14:31:59 +0000
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <keescook@chromium.org>) id 1ogMEI-0004mT-D2
 for apparmor@lists.ubuntu.com; Thu, 06 Oct 2022 08:27:42 +0000
Received: by mail-pg1-f169.google.com with SMTP id bh13so1270828pgb.4
 for <apparmor@lists.ubuntu.com>; Thu, 06 Oct 2022 01:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=YtNry7EbJtDtEtddA9DqqPAajzIvH2ExTf+f1d2BLeE=;
 b=m3LijaQHN2fYQ2T7ERgZYDL+BgBTB6ceIx6mWj4l3PzhhegxpcZYfw0oJpq7U5aVp+
 ymLFLr4VKrZL1nDWxTEYN9WbYGJanBHvMdoknEBk1NqeBZm0YRTLCq1FzOsG/eN/Ivvc
 Zs1S1r5o12z/ZfBZ2oahpULeypLty4UAhN1eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=YtNry7EbJtDtEtddA9DqqPAajzIvH2ExTf+f1d2BLeE=;
 b=Mkkn3vMzUtyi4XWhxUrwNyprSo/yn0zeNM6kUI/vPx9NxhY0o+Ic2SKU6dQtNNyWLx
 k5icF3ialV9PBz4NkEQJqfVOJ58VDnxVpjf+07c3L3h9xnatxXSAqnrRGcFspAN47s1l
 ZgvPn50J8U5pBAHc7hlIlynpovR7HFdxffPgT3SOor3f0zY2c7bK6IN07Dew22JdBnTY
 Saj2xpwaMGgxeDHEczmTckRxyKjW7WsWLcRFdjinMv6f1E1RPSrMuQiV/V9aZ1SNgMuQ
 n/6mf8LxtMLNS9W+k88ilt/Y0LqIStB8tH2/2Zr1VDi+faA8QDNySQAcuaSNQsF0TAh7
 clgg==
X-Gm-Message-State: ACrzQf0HyTaS5VKlVY+wEFhshfXC66DAvgS3QUcZ2MrMBzNmyi5bdVY5
 30d5FMhpa5jfEmVwsY7IhT6iZg==
X-Google-Smtp-Source: AMsMyM4q9XFSyeeW5dDI6ls3ylAYRaVXWsGFe+w0sCZM05fMKSjTImuW/1lBuGiaytgnMKa0rdlF2w==
X-Received: by 2002:a63:6581:0:b0:434:9482:c243 with SMTP id
 z123-20020a636581000000b004349482c243mr3499412pgb.448.1665044860443; 
 Thu, 06 Oct 2022 01:27:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170902da8400b0017eb2d62bbesm6014743plx.99.2022.10.06.01.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 01:27:39 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Eric Biederman <ebiederm@xmission.com>
Date: Thu,  6 Oct 2022 01:27:33 -0700
Message-Id: <20221006082735.1321612-1-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735; h=from:subject;
 bh=8JXgAWBrUCWySpKU2akeepLoIo1ngoevmTcyBBHjAt0=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjPpF3qES4cYgipY9Yg66d58hnI1s34HzpasPEsrcs
 AdJZe+KJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYz6RdwAKCRCJcvTf3G3AJvuPD/
 sEFuqb2jJFVbuCOokYGoNQsjw0c9Jmc0XwKWYipIHX1SMMd2WkotpH8FIpOwZ4FyBWjaC7R1DvZeLq
 wpDvCMawMGqka4y/+7g515eraCONHoJNn0oj2fukbMyqECfinzpw5/d4oLtWkFvyiE4HCoYP/6kmKK
 0R8NWKCoSDvGWq7Usrp1Ra1BUXvG1UZHbw7j4g9ItLOqgALdmExlSixoeozIYoogVyhKH0WKOVKYth
 6CRkWQcZ/xYBwGsWX7qmIQbUWoTiCbt1fTDMB4IZf5Cn6zrxQL7XNaEUK5j1dcf9ZKTqux5G32e7Of
 81YIltR3K2wnhH4qLNhRec5guNWZ3ILs2c6YZDh2TFkb9rGX4cajkAKcAV/vMrP3Kjr9vZKHBdRtPd
 rsnr6zOL9FYSWR+4i8yhrgvEsVDvenhdlfscGxtpeM7wExsxxiICpUQTRZxDvkLJhahLlKMWnxHm1y
 N2eVoeyvRe9j7JMCjfOqfKyKLHBZfoqFWmfSVi88JV/Gr797J1kRDlGaszfz7SxKiINHJQK1POiTOc
 Eic3WPt1/rLSOcANGevkuLKRQkzZ0waIkzKR/ddRrxXv/kszRk/EvoQpjPnt81zaCBe+7jXDXKm4N3
 wH+iXTk/Lc17bTuykzisNHzRgsTueD8b0Epfk0nQ+rUUKSa20mimgCQla6rA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 06 Oct 2022 14:31:58 +0000
Subject: [apparmor] [PATCH 0/2] fs/exec: Explicitly unshare fs_struct on exec
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
 Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <keescook@chromium.org>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Eric Paris <eparis@parisplace.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Jorge Merlino <jorge.merlino@canonical.com>,
 "Christian Brauner \(Microsoft\)" <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Richard Haines <richard_c_haines@btinternet.com>,
 linux-security-module@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Prashanth Prahlad <pprahlad@redhat.com>, Todd Kjos <tkjos@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi,

These changes seek to address an issue reported[1] by Jorge Merlino where
high-thread-count processes would sometimes fail to setuid during a
setuid execve().

It looks to me like the solution is to explicitly do an unshare_fs(),
which should almost always be a no-op. Current testing seems to indicate
that only the swapper->init exec triggers this condition (and I'm unclear
on whether that's expected or undesirable). This has only received very
light testing so far, but I wanted to share it so other folks could look
it over.

Jorge, can you test with these patches? Your PoC triggered immediately
for me on an unpatched kernel, and did not trigger on a patched one.

I added this patch on top of the series to see if the code ever fired:

diff --git a/kernel/fork.c b/kernel/fork.c
index 53b7248f7a4b..3c197d9d8daa 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -3113,6 +3113,7 @@ int unshare_fs(void)
 	if (error || !new_fs)
 		return error;
 
+	pr_notice("UNSHARE of \"%s\" [%d]\n", current->comm, current->pid);
 	unshare_fs_finalize(&new_fs);
 
 	if (new_fs)

Thanks!

-Kees

[1] https://lore.kernel.org/lkml/20220910211215.140270-1-jorge.merlino@canonical.com/

Kees Cook (2):
  fs/exec: Explicitly unshare fs_struct on exec
  exec: Remove LSM_UNSAFE_SHARE

 fs/exec.c                  | 26 ++++------------
 fs/fs_struct.c             |  1 -
 include/linux/fdtable.h    |  1 +
 include/linux/fs_struct.h  |  1 -
 include/linux/security.h   |  5 ++-
 kernel/fork.c              | 62 ++++++++++++++++++++++++++------------
 security/apparmor/domain.c |  5 ---
 security/selinux/hooks.c   | 10 ------
 8 files changed, 51 insertions(+), 60 deletions(-)

-- 
2.34.1



Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B860CAAEE71
	for <lists+apparmor@lfdr.de>; Thu,  8 May 2025 00:05:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uCmtE-0002Vo-Do; Wed, 07 May 2025 22:05:20 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <penguin-kernel@I-love.SAKURA.ne.jp>)
 id 1uCmtC-0002Vf-Qx
 for apparmor@lists.ubuntu.com; Wed, 07 May 2025 22:05:19 +0000
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 547M4na7045537;
 Thu, 8 May 2025 07:04:49 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 547M4nL6045534
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 8 May 2025 07:04:49 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <470689f0-223e-4d26-a919-8d48f383883b@I-love.SAKURA.ne.jp>
Date: Thu, 8 May 2025 07:04:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>,
 Song Liu <song@kernel.org>
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-2-maxime.belair@canonical.com>
 <CAPhsuW4qY9B3KdhqrUOZoNBWQmO_RDwbH46my314WxrFwxbwkQ@mail.gmail.com>
 <aa3c41f9-6b25-4871-a4be-e08430e59730@canonical.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <aa3c41f9-6b25-4871-a4be-e08430e59730@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Anti-Virus-Server: fsav202.rs.sakura.ne.jp
X-Virus-Status: clean
Received-SPF: pass client-ip=202.181.97.72;
 envelope-from=penguin-kernel@I-love.SAKURA.ne.jp; helo=www262.sakura.ne.jp
Subject: Re: [apparmor] [PATCH 1/3] Wire up the lsm_manage_policy syscall
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
Cc: paul@paul-moore.com, kees@kernel.org, linux-api@vger.kernel.org,
 stephen.smalley.work@gmail.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 2025/05/08 0:37, Maxime Bélair wrote:
> Again, each module decides which operations to expose through this syscall. In many cases
> the operation will still require CAP_SYS_ADMIN or a similar capability, so environments
> that choose this interface remain secure while gaining its advantages.

If the interpretation of "flags" argument varies across LSMs, it sounds like ioctl()'s
"cmd" argument. Also, there is prctl() which can already carry string-ish parameters
without involving open(). Why can't we use prctl() instead of lsm_manage_policy() ?



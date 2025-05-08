Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6F8AAFE5B
	for <lists+apparmor@lfdr.de>; Thu,  8 May 2025 17:08:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uD2rO-0002dA-Ly; Thu, 08 May 2025 15:08:30 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <penguin-kernel@I-love.SAKURA.ne.jp>)
 id 1uD2rL-0002Y7-QW
 for apparmor@lists.ubuntu.com; Thu, 08 May 2025 15:08:28 +0000
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 548F7qGx083296;
 Fri, 9 May 2025 00:07:52 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 548F7o6P083277
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 9 May 2025 00:07:50 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <75c7424b-fec9-469b-8f73-50ab86948a24@I-love.SAKURA.ne.jp>
Date: Fri, 9 May 2025 00:07:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Johansen <john.johansen@canonical.com>,
 =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>,
 linux-security-module@vger.kernel.org
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-3-maxime.belair@canonical.com>
 <9c68743f-5efa-4a77-a29b-d3e8f2b2a462@I-love.SAKURA.ne.jp>
 <6d785712-6d8e-491c-86d4-1cbe5895778f@canonical.com>
 <75c0385c-b649-46b0-907f-903e2217f460@I-love.SAKURA.ne.jp>
 <07a496b2-ed1f-4a18-88d1-7be36dba3a8a@canonical.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <07a496b2-ed1f-4a18-88d1-7be36dba3a8a@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav402.rs.sakura.ne.jp
Received-SPF: pass client-ip=202.181.97.72;
 envelope-from=penguin-kernel@I-love.SAKURA.ne.jp; helo=www262.sakura.ne.jp
Subject: Re: [apparmor] [PATCH 2/3] lsm: introduce
	security_lsm_manage_policy hook
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
 linux-kernel@vger.kernel.org, mic@digikod.net, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 2025/05/08 23:44, John Johansen wrote:
> On 5/8/25 05:55, Tetsuo Handa wrote:
>> On 2025/05/08 17:25, John Johansen wrote:
>>> That is fine. But curious I am curious what the interface would look like to fit TOMOYO's
>>> needs.
>>
>> Stream (like "FILE *") with restart from the beginning (like rewind(fp)) support.
>> That is, the caller can read/write at least one byte at a time, and written data
>> is processed upon encountering '\n'.
>>
> 
> that can be emulated within the current sycall, where the lsm maintains a buffer.

That cannot be emulated, for there is no event that is automatically triggered when
the process terminates (i.e. implicit close() upon exit()) in order to release the
buffer the LSM maintains.

> Are you asking to also read data back out as well, that could be added, but doing
> a syscall per byte here or through the fs is going to have fairly high overhead.

At least one byte means arbitrary bytes; that is, the caller does not need to read
or write the whole policy at one syscall.

> 
> Without understanding the requirement it would seem to me, that it would be
> better to emulate that file buffer manipulation in userspace similar say C++
> stringstreams, and then write the syscall when done.

The size of the whole policy in byte varies a lot.



Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D96AA0ACBE
	for <lists+apparmor@lfdr.de>; Mon, 13 Jan 2025 01:00:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tX7sM-000338-KY; Mon, 13 Jan 2025 00:00:14 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <penguin-kernel@I-love.SAKURA.ne.jp>)
 id 1tX7sK-00032d-0w
 for apparmor@lists.ubuntu.com; Mon, 13 Jan 2025 00:00:12 +0000
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 50CNxBh9042985;
 Mon, 13 Jan 2025 08:59:11 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 50CNx7EL042956
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 13 Jan 2025 08:59:11 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <3c73cee2-a4aa-4e85-bafd-d5571e857849@I-love.SAKURA.ne.jp>
Date: Mon, 13 Jan 2025 08:59:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Paul Moore <paul@paul-moore.com>,
 Tanya Agarwal <tanyaagarwal25699@gmail.com>
References: <20250111.22fc32ae0729@gnoack.org>
 <20250112072925.1774-1-tanyaagarwal25699@gmail.com>
 <CAHC9VhRbZLtBZ8dH-kASnkQUehG4Cu=zd23A6Jj9zfnyeGOTsA@mail.gmail.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <CAHC9VhRbZLtBZ8dH-kASnkQUehG4Cu=zd23A6Jj9zfnyeGOTsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav105.rs.sakura.ne.jp
X-Virus-Status: clean
Received-SPF: pass client-ip=202.181.97.72;
 envelope-from=penguin-kernel@I-love.SAKURA.ne.jp; helo=www262.sakura.ne.jp
Subject: Re: [apparmor] [PATCH V2] security: fix typos and spelling errors
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
Cc: eric.snowberg@oracle.com, dmitry.kasatkin@gmail.com,
 stephen.smalley.work@gmail.com, roberto.sassu@huawei.com, jmorris@namei.org,
 zohar@linux.ibm.com, omosnace@redhat.com, mic@digikod.net,
 linux-security-module@vger.kernel.org, anupnewsmail@gmail.com,
 gnoack@google.com, skhan@linuxfoundation.org, linux-integrity@vger.kernel.org,
 takedakn@nttdata.co.jp, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 2025/01/13 1:36, Paul Moore wrote:
> Hi Tanya,
> 
> Ideally this patchset would be split into into seperate, independent
> patches, one for AppArmor, one for IMA/EVM, one for Landlock, one for
> SELinux, one for Smack, and one for TOMOYO.

I don't think we need to split this patchset into individual modules,
especially because this patchset does not affect the result of kernel build.
We sometimes need to do "git bisect", and reducing number of commits helps
saving building time and testing time for bisection.



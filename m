Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE7F67147A
	for <lists+apparmor@lfdr.de>; Wed, 18 Jan 2023 07:45:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pI2Ca-00074M-CD; Wed, 18 Jan 2023 06:45:40 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1pI2CY-00073u-Cf
 for apparmor@lists.ubuntu.com; Wed, 18 Jan 2023 06:45:38 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 3D00E3F17F; 
 Wed, 18 Jan 2023 06:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1674024336;
 bh=/AcMcv4vx8YNgercunSG8hfzVgdRUNSeg3Q9WLCPgG4=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Fe12ekiB/Oft0bu2fGNp2C3wmmWjyOy3D6BtqfqxawXtbtH6Ou9CbhaBO+EjV0/NQ
 ROL7kxLC6o3/BbxGJYOaa5/f7QkU5q+7EGQJfTOhNw/ub2LAOKM38btMpA3FiuYAuV
 jXUa5+0f7kizvicRwqmIFzCgxx5IjoM1V6InFUWrmzx7rwburCGHTOPZrNu4+18XMV
 utxVtdOO+gEw+++8Y0kzoNaKEzO8FIsaeZzgDtDLOgG0o90i9UwDlql2myHZ60RTkz
 v1c6F4RaGS6Sh4IfV8ES85tkCcABCSeGIEwJrhLESv/wNAuzxhvKN+rZmBwyBZl/wV
 ajRh+LMBHozzQ==
Message-ID: <81053742-0abf-1814-1077-b8c974623797@canonical.com>
Date: Tue, 17 Jan 2023 22:45:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Tyler Hicks <code@tyhicks.com>, Quanfa Fu <quanfafu@gmail.com>
References: <20230114164952.232653-1-quanfafu@gmail.com>
 <Y8dyfZIAhFfIvVBn@sequoia>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <Y8dyfZIAhFfIvVBn@sequoia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: make aa_set_current_onexec return
 void
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
Cc: paul@paul-moore.com, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 1/17/23 20:15, Tyler Hicks wrote:
> On 2023-01-15 00:49:52, Quanfa Fu wrote:
>> Change the return type to void since it always return 0, and no need
>> to do the checking in aa_set_current_onexec.
>>
>> Signed-off-by: Quanfa Fu <quanfafu@gmail.com>
> 
> This looks like a safe change to me. There's nothing to error check
> within aa_set_current_onexec() so returning void is fine.
> 
>    Reviewed-by: "Tyler Hicks (Microsoft)" <code@tyhicks.com>
> 

Looks good, I have pulled this into my tree

Acked-by: John Johansen <john.johansen@canonical.com>

> Tyler
> 
>> ---
>>   security/apparmor/domain.c       | 2 +-
>>   security/apparmor/include/task.h | 2 +-
>>   security/apparmor/task.c         | 5 +----
>>   3 files changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
>> index 6dd3cc5309bf..bbc9c8a87b8e 100644
>> --- a/security/apparmor/domain.c
>> +++ b/security/apparmor/domain.c
>> @@ -1446,7 +1446,7 @@ int aa_change_profile(const char *fqname, int flags)
>>   		}
>>   
>>   		/* full transition will be built in exec path */
>> -		error = aa_set_current_onexec(target, stack);
>> +		aa_set_current_onexec(target, stack);
>>   	}
>>   
>>   audit:
>> diff --git a/security/apparmor/include/task.h b/security/apparmor/include/task.h
>> index 13437d62c70f..01717fe432c3 100644
>> --- a/security/apparmor/include/task.h
>> +++ b/security/apparmor/include/task.h
>> @@ -30,7 +30,7 @@ struct aa_task_ctx {
>>   };
>>   
>>   int aa_replace_current_label(struct aa_label *label);
>> -int aa_set_current_onexec(struct aa_label *label, bool stack);
>> +void aa_set_current_onexec(struct aa_label *label, bool stack);
>>   int aa_set_current_hat(struct aa_label *label, u64 token);
>>   int aa_restore_previous_label(u64 cookie);
>>   struct aa_label *aa_get_task_label(struct task_struct *task);
>> diff --git a/security/apparmor/task.c b/security/apparmor/task.c
>> index 84d16a29bfcb..5671a716fcd2 100644
>> --- a/security/apparmor/task.c
>> +++ b/security/apparmor/task.c
>> @@ -93,9 +93,8 @@ int aa_replace_current_label(struct aa_label *label)
>>    * aa_set_current_onexec - set the tasks change_profile to happen onexec
>>    * @label: system label to set at exec  (MAYBE NULL to clear value)
>>    * @stack: whether stacking should be done
>> - * Returns: 0 or error on failure
>>    */
>> -int aa_set_current_onexec(struct aa_label *label, bool stack)
>> +void aa_set_current_onexec(struct aa_label *label, bool stack)
>>   {
>>   	struct aa_task_ctx *ctx = task_ctx(current);
>>   
>> @@ -103,8 +102,6 @@ int aa_set_current_onexec(struct aa_label *label, bool stack)
>>   	aa_put_label(ctx->onexec);
>>   	ctx->onexec = label;
>>   	ctx->token = stack;
>> -
>> -	return 0;
>>   }
>>   
>>   /**
>> -- 
>> 2.31.1
>>
>>



Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJmTIM8O6mn4sgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 23 Apr 2026 14:21:35 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8CD451E50
	for <lists+apparmor@lfdr.de>; Thu, 23 Apr 2026 14:21:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wFt3a-0003OH-OI; Thu, 23 Apr 2026 12:21:22 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <gongruiqi1@huawei.com>)
 id 1wFjF4-0003UX-9t
 for apparmor@lists.ubuntu.com; Thu, 23 Apr 2026 01:52:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=QjVoapmA6eCEER6DNFDJcYCiww5xLhiLyifdfAzhYUk=;
 b=ulNU9Q7XXknrmiYtBINRNGfWv5mcILMASEydzduEnDZZwHDbpWeUq5jlgnB4lDVLA+4trdx7b
 AzIrBxiGJqNDcUNPUrLaUXYUaSPCHkA1RIOMDM7k31I8XyfAtp9cdL5tYAT1R92PlXKoDfY+wbA
 RpedlSkY6WOjXBhNIu8ejp8=
Received: from mail.maildlp.com (unknown [172.19.163.127])
 by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4g1JpQ0gYrzmV7c;
 Thu, 23 Apr 2026 09:46:06 +0800 (CST)
Received: from kwepemk100018.china.huawei.com (unknown [7.202.194.66])
 by mail.maildlp.com (Postfix) with ESMTPS id 9659E402AB;
 Thu, 23 Apr 2026 09:52:30 +0800 (CST)
Received: from [10.67.108.67] (10.67.108.67) by kwepemk100018.china.huawei.com
 (7.202.194.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 23 Apr
 2026 09:52:30 +0800
Message-ID: <923f5188-a3b3-45cf-8b28-37f77a34544c@huawei.com>
Date: Thu, 23 Apr 2026 09:52:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Georgia Garcia <georgia.garcia@canonical.com>, John Johansen
 <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James Morris
 <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>
References: <20260403035119.2132418-1-gongruiqi1@huawei.com>
 <1b87ab3652ca165364e1bb86623f2b26a135dae7.camel@canonical.com>
Content-Language: en-US
From: GONG Ruiqi <gongruiqi1@huawei.com>
In-Reply-To: <1b87ab3652ca165364e1bb86623f2b26a135dae7.camel@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk100018.china.huawei.com (7.202.194.66)
Received-SPF: pass client-ip=113.46.200.223;
 envelope-from=gongruiqi1@huawei.com; helo=canpmsgout08.his.huawei.com
X-Mailman-Approved-At: Thu, 23 Apr 2026 12:21:20 +0000
Subject: Re: [apparmor] [PATCH] apparmor: Fix two bugs of
 aa_setup_dfa_engine's fail handling
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
Cc: linux-security-module@vger.kernel.org, zhaoyipeng <zhaoyipeng5@huawei.com>,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org, lujialin4@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [-1.61 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:georgia.garcia@canonical.com,m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:linux-security-module@vger.kernel.org,m:zhaoyipeng5@huawei.com,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:lujialin4@huawei.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[gongruiqi1@huawei.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[gongruiqi1@huawei.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,huawei.com:dkim,huawei.com:mid]
X-Rspamd-Queue-Id: 3E8CD451E50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Georgia,

On 4/23/2026 5:51 AM, Georgia Garcia wrote:
> ...
>> @@ -2486,7 +2487,6 @@ static int __init aa_setup_dfa_engine(void)
>>  
>>  fail:
>>  	aa_put_pdb(nullpdb);
>> -	aa_put_dfa(nulldfa);
> 
> This isn't right. aa_dfa_unpack does kref_init(&dfa->count), and later
> we have nullpdb->dfa = aa_get_dfa(nulldfa);
> So the second is put on aa_put_pdb but the first, from the init, does
> need to be put too.

Thanks for the feedback, and yes you're right. I didn't notice there's a
kref_init in aa_dfa_unpack...

I will submit a patch that only contains the first fix.

BR,
Ruiqi

> 
>>  	nullpdb = NULL;
>>  	nulldfa = NULL;
>>  	stacksplitdfa = NULL;
> 



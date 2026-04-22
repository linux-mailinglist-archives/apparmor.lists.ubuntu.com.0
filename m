Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ly1A4nF6GmYQAIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 22 Apr 2026 14:56:41 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C460F4464D5
	for <lists+apparmor@lfdr.de>; Wed, 22 Apr 2026 14:56:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wFX7t-0002ad-H6; Wed, 22 Apr 2026 12:56:21 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <gongruiqi1@huawei.com>)
 id 1wFRc4-0007ty-Dl
 for apparmor@lists.ubuntu.com; Wed, 22 Apr 2026 07:03:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=6zgAh1lwI3Dwph2UKuzgW+oG09QC3No/l5U0zh07Bik=;
 b=Vxed3IXDAj30Sh9HN80jbc0Tz6nKydaGcJFCz7qlHa4jaj8eC4O/t+wkGAts6nu+n7tD20Ku+
 JpXznascIQeQc/yPJgvZu1FFnI6qcaSGWdAqxJ0w/uO4Q37j/O/mRMfJNYhLxqOuRshcVWmWr+b
 0cfMUF02vinZKlZnIdu1JSg=
Received: from mail.maildlp.com (unknown [172.19.162.144])
 by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4g0qlG1ykYzRhTY;
 Wed, 22 Apr 2026 14:56:42 +0800 (CST)
Received: from kwepemk100018.china.huawei.com (unknown [7.202.194.66])
 by mail.maildlp.com (Postfix) with ESMTPS id C68064056D;
 Wed, 22 Apr 2026 15:03:04 +0800 (CST)
Received: from [10.67.108.67] (10.67.108.67) by kwepemk100018.china.huawei.com
 (7.202.194.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 22 Apr
 2026 15:03:04 +0800
Message-ID: <62855018-467c-4959-8c90-44e8ed33901d@huawei.com>
Date: Wed, 22 Apr 2026 15:03:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Johansen <john.johansen@canonical.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E . Hallyn"
 <serge@hallyn.com>
References: <20260403035119.2132418-1-gongruiqi1@huawei.com>
Content-Language: en-US
From: GONG Ruiqi <gongruiqi1@huawei.com>
In-Reply-To: <20260403035119.2132418-1-gongruiqi1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk100018.china.huawei.com (7.202.194.66)
Received-SPF: pass client-ip=113.46.200.221;
 envelope-from=gongruiqi1@huawei.com; helo=canpmsgout06.his.huawei.com
X-Mailman-Approved-At: Wed, 22 Apr 2026 12:56:20 +0000
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, lujialin4@huawei.com
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
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:lujialin4@huawei.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,huawei.com:email,huawei.com:dkim,huawei.com:mid]
X-Rspamd-Queue-Id: C460F4464D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Kindly ping.

On 4/3/2026 11:51 AM, GONG Ruiqi wrote:
> First, aa_dfa_unpack returns ERR_PTR not NULL when it fails, but
> aa_put_dfa only checks NULL for its input, which would cause invalid
> memory access in aa_put_dfa. Set nulldfa to NULL explicitly to fix that.
> 
> Second, aa_put_pdb calls aa_pdb_free_kref -> aa_free_pdb -> aa_put_dfa,
> i.e.  it will free nullpdb->dfa. But there's another aa_put_dfa(nulldfa)
> after aa_put_pdb(nullpdb), which would cause double free. Remove that
> redundant aa_put_dfa to fix that.
> 
> Fixes: 98b824ff8984 ("apparmor: refcount the pdb")
> Signed-off-by: GONG Ruiqi <gongruiqi1@huawei.com>
> ---
>  security/apparmor/lsm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index c1d42fc72fdb..be82ec1b9fd9 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -2465,6 +2465,7 @@ static int __init aa_setup_dfa_engine(void)
>  			    TO_ACCEPT2_FLAG(YYTD_DATA32));
>  	if (IS_ERR(nulldfa)) {
>  		error = PTR_ERR(nulldfa);
> +		nulldfa = NULL;
>  		goto fail;
>  	}
>  	nullpdb->dfa = aa_get_dfa(nulldfa);
> @@ -2486,7 +2487,6 @@ static int __init aa_setup_dfa_engine(void)
>  
>  fail:
>  	aa_put_pdb(nullpdb);
> -	aa_put_dfa(nulldfa);
>  	nullpdb = NULL;
>  	nulldfa = NULL;
>  	stacksplitdfa = NULL;



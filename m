Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC687751E5
	for <lists+apparmor@lfdr.de>; Wed,  9 Aug 2023 06:22:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qTai6-0002kX-Q0; Wed, 09 Aug 2023 04:22:14 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1qTai4-0002kK-K8
 for apparmor@lists.ubuntu.com; Wed, 09 Aug 2023 04:22:12 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 8070542834; 
 Wed,  9 Aug 2023 04:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1691554932;
 bh=DGpYgUa8dbFlzxVHEOICpko7jFA3qUT0Je0Vs6Bqyco=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=S9ADsMFrJYBMs+3E5mv3ZDYI41Lr5/EBWutCaDEDoF189psJMqEzAS/w+Iikb2slH
 ubhPVSKgQNEzycA7bGTuYYgEDZBZ25mUr4TMWbbnAigtjpdTjcsmCXvBV//PsUv/zp
 fdPjeNcr70sT9k4rmlR/sllfV3hp36OHyz+nAexo1h7384i5rvCNk2AAKtLw+Ebagv
 wIeI15hy2Ykr8Tg/DEN1iTarYA1Gjg57O8hykMFk0o7WBTygkXUXSD2+/BCI1IFf9Z
 4C82kdQgFhoLi9ejtQCXRnCH+Np+bnixIHiiTAbn5IIbAN+Op1IBGtOdvL9FthnxaE
 a5AjGExfXclCg==
Message-ID: <ea365010-1cb9-1bdb-3014-7e67a59daff2@canonical.com>
Date: Tue, 8 Aug 2023 21:22:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Xiu Jianfeng <xiujianfeng@huaweicloud.com>, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com, terrelln@fb.com
References: <20230809100244.342530-1-xiujianfeng@huaweicloud.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <20230809100244.342530-1-xiujianfeng@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH -next] apparmor: remove unneeded #ifdef in
 decompress_zstd()
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
 xiujianfeng@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 8/9/23 03:02, Xiu Jianfeng wrote:
> From: Xiu Jianfeng <xiujianfeng@huawei.com>
> 
> The whole function is guarded by CONFIG_SECURITY_APPARMOR_EXPORT_BINARY,
> so the #ifdef here is redundant, remove it.
> 

indeed

> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into apparmor-next


> ---
>   security/apparmor/apparmorfs.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index c198a8a2047b..7ee8f4bb7733 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -1314,7 +1314,6 @@ SEQ_RAWDATA_FOPS(compressed_size);
>   
>   static int decompress_zstd(char *src, size_t slen, char *dst, size_t dlen)
>   {
> -#ifdef CONFIG_SECURITY_APPARMOR_EXPORT_BINARY
>   	if (slen < dlen) {
>   		const size_t wksp_len = zstd_dctx_workspace_bound();
>   		zstd_dctx *ctx;
> @@ -1341,7 +1340,6 @@ static int decompress_zstd(char *src, size_t slen, char *dst, size_t dlen)
>   		kvfree(wksp);
>   		return ret;
>   	}
> -#endif
>   
>   	if (dlen < slen)
>   		return -EINVAL;



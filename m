Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKkDM0M/umlqTQIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 06:59:31 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC6F2B6164
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 06:59:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w2jwA-0004L1-Lz; Wed, 18 Mar 2026 05:59:22 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1w2jw9-0004Ks-Ki
 for apparmor@lists.ubuntu.com; Wed, 18 Mar 2026 05:59:21 +0000
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6E6A13FBAD
 for <apparmor@lists.ubuntu.com>; Wed, 18 Mar 2026 05:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1773813561;
 bh=HnYxWZf82VZYFToxxlKhf4jSSNuvzsDXOVG4cgFbtgw=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=osYvrhJ/6x8DCgS13rclDQ/qnvBn3Rt1LB13wnTu3JMi+Q5Ir0U6e0h+mnNBfd9wN
 UyFBoo77juXzo09Z+Qcvy5JTmIaBpP7EXS8V5zDklNgbDufbym5d/60Nwkyp9wVyPV
 s2pVthwHhWHLq4CKW9wb1UnAy5Uiu449hgGFsH9M7rCmI7apPr6FMLZJFithHKBWFP
 ummuDHIT4ox7NdgaR/MOQEfOPUX1HMPYh2lQIE9dJU/gun8unEDEF1jrzuklzCUx1d
 pDp0AufktKhBQcMKJOR5j36P84o6YRrHtp/EETqBuPIpzxsGBiPjZN8BhJZrHFiAUv
 d9VPV6mhy4tv9W1s5QvkoqBvD/9ESaHYdiRggW8gqAeIusWM12ZNqPJzQw7sJo5JuK
 Um4h6MwcjIW1IL/aGsi8seqXe7SJR1z/OUHLpaHpqE4wq4x1XBax/IYtaVDFP997vQ
 12bip3F5zBlpxUcHXjr5cuUM5aYR9iecz9HsR0+PrHOXJxKpgSJp4KUigEKcf4lth8
 IdmYo3QTEyRe5ZHxMwsfQjxC09VReRyEEGS9YJGgMpbyrrtaliTdp/6VL5o9BsP91P
 o7Q7zK8u9MiXtzyCtqWIvWi5tNPonCGJkHEQxyONuOfrBqCkhdliscF0SraUKTNptc
 ZDriHc3Es5cZzdEE+oLyXV7A=
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-35641c14663so708023a91.2
 for <apparmor@lists.ubuntu.com>; Tue, 17 Mar 2026 22:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773813560; x=1774418360;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HnYxWZf82VZYFToxxlKhf4jSSNuvzsDXOVG4cgFbtgw=;
 b=qRMttn6MA33S4AADsbWOUlkbBOSU9ZmOrQ6rtPsC5760xpmn0ubimsb8xMf8eq1vTR
 eePkEuQZngdTo95T0FUCDuz7333j0hFWyb/NZiFFei0ER1BlCcOXUKIpXBdk8f9zDDQN
 TmA8CtubSuZHwpF5Iz9r6jkbX/1kAyU05dAQbv1A8WJJqoliIKauALJWNvylwxAOnX6d
 yujT3Yar9Bsf5m4x9+bqHtiLAC03vKGnE3NZENFMIlmxg2XjPrxC9WmfJp4NRAvkLj1R
 lA9dbC9xzzJqdTsJNtkjRGvMSQBLn6iO+VxFfCDxNZuJ3pX4LtghWgtujpdxv5PhlM6+
 hHoQ==
X-Gm-Message-State: AOJu0YztT7BNX/AUBL6m/SW9K5n+PLgk2an9t+/+kuYM9dtI66csGqMF
 zr5g5C7oA5rmVlEiUrcZECyeJbZBdUg26LOyjJorBI8OKFdvznpPbOyn0q9Uz1Owp/gmrqppnxf
 6v8eByGJgHCB/AyUX322ZmYsn6+2sDwZlIrIGiNcXs3NR2AqfbEbqSCI/yB85r3M9M0ytWZ0SoZ
 eWHA==
X-Gm-Gg: ATEYQzzePtOZjYPJVaDD2ul2ul9r31FBH1vYtOzG/lnsI+PcY2cYZdUWs45EtwA2aoB
 QelY0jQxXvDj39VQcw7mNWhvpfowme6OKtLpOSBe4Y9C8WBGmfMP7AOBlVFHyWVhpj4/FY9+gxI
 pfsbcbOzFVfyRD/jt+GNEVHWC5lxbS07wM5mpGgcQNlwyH34/SKFOiNNp43EGqQOX1scnEB2nCD
 e/7XNpYY5nt4EmBn18cx6AJtjFZxJ1bpSYHUKyFFePzxAIitZFCvO9+e3QfdUQqmHxjK/97pv+e
 aAA1szu/z8yKHyUnZGMgWEYj9XDF9Pksr7ETnuLCSP4kHEJ+c9S+DTNj62s2rYDWy8zIaBd/OYk
 RV9QpSYsbQxEQJD1t17R8lf/S8vYSlJI4TiXKuA==
X-Received: by 2002:a17:903:984:b0:2ae:c88c:197 with SMTP id
 d9443c01a7336-2b06e34520fmr22225865ad.17.1773813560046; 
 Tue, 17 Mar 2026 22:59:20 -0700 (PDT)
X-Received: by 2002:a17:903:984:b0:2ae:c88c:197 with SMTP id
 d9443c01a7336-2b06e34520fmr22225675ad.17.1773813559709; 
 Tue, 17 Mar 2026 22:59:19 -0700 (PDT)
Received: from [192.168.192.71] ([50.39.102.197])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2b06e603b2asm14262025ad.55.2026.03.17.22.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 22:59:18 -0700 (PDT)
Message-ID: <717f90e0-41cc-4852-b3d7-5ea3b975bc95@canonical.com>
Date: Tue, 17 Mar 2026 22:59:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thorsten Blum <thorsten.blum@linux.dev>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
References: <20260204220734.1008069-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260204220734.1008069-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: Remove redundant if check in
	sk_peer_get_label
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
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thorsten.blum@linux.dev,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	DKIM_TRACE(0.00)[canonical.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,canonical.com:email,canonical.com:mid,linux.dev:email];
	NEURAL_HAM(-0.00)[-0.991];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: 9EC6F2B6164
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/4/26 14:07, Thorsten Blum wrote:
> Remove the redundant if check in sk_peer_get_label() and return
> ERR_PTR(-ENOPROTOOPT) directly.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into my tree

> ---
>   security/apparmor/lsm.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index a87cd60ed206..54343f7c96a4 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -1536,15 +1536,11 @@ static int apparmor_socket_sock_rcv_skb(struct sock *sk, struct sk_buff *skb)
>   static struct aa_label *sk_peer_get_label(struct sock *sk)
>   {
>   	struct aa_sk_ctx *ctx = aa_sock(sk);
> -	struct aa_label *label = ERR_PTR(-ENOPROTOOPT);
>   
>   	if (rcu_access_pointer(ctx->peer))
>   		return aa_get_label_rcu(&ctx->peer);
>   
> -	if (sk->sk_family != PF_UNIX)
> -		return ERR_PTR(-ENOPROTOOPT);
> -
> -	return label;
> +	return ERR_PTR(-ENOPROTOOPT);
>   }
>   
>   /**



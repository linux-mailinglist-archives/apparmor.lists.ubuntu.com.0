Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGidGAhHumlTTgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:32:40 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BA92B66BC
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:32:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w2kSC-0002se-HD; Wed, 18 Mar 2026 06:32:28 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1w2kSA-0002sX-U9
 for apparmor@lists.ubuntu.com; Wed, 18 Mar 2026 06:32:26 +0000
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B8A233FB77
 for <apparmor@lists.ubuntu.com>; Wed, 18 Mar 2026 06:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1773815546;
 bh=epmCUqv6SVCOMHsBhYMWL9iFUoQWgW1lR+M3UIYJn6o=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=R3BKFiI68P4OjLLx9FjahWPUfKXbPj1nqKkpv6YAfe2DkSl3U0dtgQrxfnPqwMw3h
 4FN//9Nhu1/cy6tMB7sqDpqYyW8X4G3CnOIaARUAPrfcKAwWuKHyTaEc7TkaEZBsOz
 +mbXBnj4ZDawYVvrPazetw7fkX0Xv90167LgahFd7dRAfLBK5lPrQwVbuUs5Fptx3f
 7GWUpMvqpwI1MC/fOaWbwGqMonXEQZg3Ox6QUylRWVfP1hlCg2ypBhVnzhYp0A2fEq
 W8nkSGK/OCU5q6ap1FWtV4APeiUWk4IZ2q+mbx+7UJmzzLesO7oJ0b7refuKssTMFd
 bAFvaLbOAc3YWuTkkvKdj7Lo4CBIwaCJ5fMDyisKvx+a16/2G5uLdZDqo/fN3nElPz
 puofeTbynDk/uvBEE8GAhyaGIJi0Fw5eE8lVKeIbCg1iO4yZyEdNwsFHuZPHqjjcwO
 D9M9wkzeeVmUfNWl22VDlsADs1/wf7K4/xGUVpqnkOM8nH8FjNCQu2YG2iE5K648vR
 AyeT9H5i4Banfjy7gfi9vVK7ouj3+yWX+P/VSG+yEFhm0reGXNoM5fLHwA+/h98JE/
 4kmgniJRPduXyrftoXZFpH2+f01iVIjpuQOztsP3LpIhzAbj+SQA70tJsmUXWrCx4w
 ZVoxVNmi6XHWIYZEYBMlHyYc=
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c741a9ef5f0so459311a12.1
 for <apparmor@lists.ubuntu.com>; Tue, 17 Mar 2026 23:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773815545; x=1774420345;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=epmCUqv6SVCOMHsBhYMWL9iFUoQWgW1lR+M3UIYJn6o=;
 b=EaHKbRY7TVeYWb3sP77VkPBpmAsa5vMwVIN+XnoIChvzCjAu6OSHHNMWQj6j82d943
 rEcFIa41EpQ9kAszI7F+4SoBAQefiGxyhPi2j25uQmBqQUBJAixs0i7AjvWn0h+FRUCZ
 iOTvemlf0GNAh/GDHwuSLBMRrl4RbMYNRDFd+kC0JgzxpJLIMjmakP69LUEVhetSqXui
 oVJHd1fGlqFd5ETUyxP2wecJKylOexnLToaiiMOxBet2YA4Jr7pW1lzLy6GyRQbFnNrw
 2fqpxgABkBofDygUX3k+PLZcwDCTDVEk3dNF7iJerHuMou54FWJOxXfNuU9uP7BvfVp5
 X5Yg==
X-Gm-Message-State: AOJu0YyTT+zLE1c9W3nTi8cC/MARWazHPs60z+0u6O9F+rZ6oXO4DJ+g
 XptpZ8ivc8wOTc0xQsheYmDHc0sQR/Dr3SnnEVGzPW6XUZIWHLxBaanrlbtm9jvob01EcoS8xJs
 Hn6j1niATJS4QY+hY30Xlm2Xc+DwrBLEkwLPfRYO8YxIAdpGInW9b+WCAUfasOuH8tPfbFnLSBG
 jbZA==
X-Gm-Gg: ATEYQzzH5hyKsHz20Ud+EQw8yEqEDNNKgB9mTFfTP5o3hu0timkKWLSWOKgrIBZzPx1
 SmcWnBRKAx1N3o8BEOW7yi62tsbnzesWV4JlFfvNFR2B6GKyqdU2khm1830rXjqdspJIvGT3Qgu
 Igea8uvxi1yh9QMVb962zf1mXamxhne809UvqSvfxpfxfocTHMzRVFoGpO45uT+PtxU/vk+A3T+
 HdyhKUZOItRo9Zjy1unKHdXU5lV+kLJo9dVcYLObFS2cDowC+1TDptngQ0ij720fyV0/pEgCGK7
 iPQ0c5SabnAW4WhJ4PD/ROadSYtyYm7Aq2zWwJFZVwnMrf8Ic9kXwQYdNjxsFokzvveSzoJnX6w
 HAnnLaoqp8IiEc0ifrpnIE3Iq2MBJ2YyEcNC93w==
X-Received: by 2002:a05:6a00:1c9f:b0:824:b304:2d1e with SMTP id
 d2e1a72fcca58-82a6a088027mr2117675b3a.8.1773815545379; 
 Tue, 17 Mar 2026 23:32:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c9f:b0:824:b304:2d1e with SMTP id
 d2e1a72fcca58-82a6a088027mr2117654b3a.8.1773815545044; 
 Tue, 17 Mar 2026 23:32:25 -0700 (PDT)
Received: from [192.168.192.71] ([50.39.102.197])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-82a6bdd776bsm1380585b3a.49.2026.03.17.23.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 23:32:24 -0700 (PDT)
Message-ID: <10bcdb0a-5e85-475f-bb02-658d892f1688@canonical.com>
Date: Tue, 17 Mar 2026 23:32:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thorsten Blum <thorsten.blum@linux.dev>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
References: <20260318002141.3362-3-thorsten.blum@linux.dev>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260318002141.3362-3-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH RESEND] apparmor: Remove redundant if check
 in sk_peer_get_label
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thorsten.blum@linux.dev,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	DKIM_TRACE(0.00)[canonical.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,canonical.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
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
X-Rspamd-Queue-Id: 09BA92B66BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/26 17:21, Thorsten Blum wrote:
> Remove the redundant if check in sk_peer_get_label() and return
> ERR_PTR(-ENOPROTOOPT) directly.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

this has now been pulled into my tree

> ---
>   security/apparmor/lsm.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index c1d42fc72fdb..f7bcfed40222 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -1528,15 +1528,11 @@ static int apparmor_socket_sock_rcv_skb(struct sock *sk, struct sk_buff *skb)
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



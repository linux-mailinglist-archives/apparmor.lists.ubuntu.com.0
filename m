Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBxZKoKBF2oUHggAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 28 May 2026 01:42:58 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9545EAFB8
	for <lists+apparmor@lfdr.de>; Thu, 28 May 2026 01:42:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wSNtZ-0004lm-WE; Wed, 27 May 2026 23:42:42 +0000
Received: from mail-qk1-f193.google.com ([209.85.222.193])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1wSNtY-0004lX-HF
 for apparmor@lists.ubuntu.com; Wed, 27 May 2026 23:42:40 +0000
Received: by mail-qk1-f193.google.com with SMTP id
 af79cd13be357-90caad2e944so1243909285a.2
 for <apparmor@lists.ubuntu.com>; Wed, 27 May 2026 16:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1779925359; x=1780530159; darn=lists.ubuntu.com; 
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :mime-version:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=ahn0OAmqt3NvDffvYvLmMgx13/Qe9oNxidNwtJQvEmM=;
 b=QZB621jQJXkgscWS5rGbVU1Tl189n068pBGT9v0Xjpur1k1yOLnTvTll0tSKyZcOi+
 T6fMk9F1eoWueM0mXi/vS8dwO9GNmLYgbyJHIhvnaPRHF4Lnbz7yHO/ATPzkh6YxvoLr
 eej7QiPAWv/e2HOsID7d9JE8GisIF7PtsvdMvAufHbQVFpHxNt/rqNI7l+a7ZpwXjmkS
 7E8oaJ3s9XWxFKjnaNcxGWPjeJta7GXcZvphONOXkcYfXGd0+ydHQq9rBCSrFPGwcu/m
 zkSzFtJQT5HS256elFgS2ju6/SGIII26FJYQOAmDehyEuCQY3Fe92TzQiqnnwsxFmKSu
 T4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779925359; x=1780530159;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ahn0OAmqt3NvDffvYvLmMgx13/Qe9oNxidNwtJQvEmM=;
 b=dWFzf6igtnl3Gcg1b4Bv6as6lVVoFcvIPgGEwH/H9n7Gi4r23h3S0TiHlKbfa9I8Mw
 y3AmIa41kc6/L/xNPi3v/1g1ZvyZC2Mq0tb0S14thJUIKPFQB6yRQ8cE6Kdl+2IzKddb
 5NDnUuZgjoIT8d0DYx3ZoMxvCspk3XrPPhei3sPj/2vOYeJyKG1b0KzaMleAzSrxFOn0
 8BcGXDkbPZQ5SQ/Rzp/E4e1fbFUHEXTHg2CYOf0TbGAr7vyV4l5GB8dD4a2JHV4fU+d1
 elA8XhIb21m86boMd18kQr4KSdGNHx4uVIsTrlrohW/C/WeBwvlJyKliBnfEfNvAyLxK
 haEg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8zHv27INLWbcgAt0RutVmoSkqVYnF1WqxXmCDgZrBq3KMS5e4Buqi/VY1KZOArxpQ9zK/auF3zvw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxpRyM4LsZ7vMne4f2Ao1enlJe5z5rNlYE+lXKkTvWzlhFapvM5
 mkEgdqq9hIdW0M4E6XYyLVMKLCuItPIirPboZQFNisilZOTH0q1JOG3N6sm0T1PBWg==
X-Gm-Gg: Acq92OFj7ZxmO50t+u3UMXMK2TeoqYo2ag5buXnM8xML5UyUSgqYZQARQMpTowL6sre
 eL9KHH1lj9jKNFAH6Y2LQ+SReBe4wamVKqFpAPBAyc3LKc2b9agx4GcLV/Ljofmu/N1SpTY/a+l
 mM8eTVT6IfAFYHOmwgs9HcQYCBuDg6DN5i7qszuH0XkLYGmuE2o31cnN27TI4zSoSiDN0yloKxX
 dbFYGsm8cRHkvhwdwUShzG0r4AkCz1dzuR5zO/KoMJy3h18/Zt7wJB49erR4WbN+xiWuSREvO4O
 fZOBqtpCImqGb6HsTb659wA1kPNmd9R5Tx09wysHkmdTplBk1z+a1TSbwm5JWMtlmw/8BRU46at
 78Be5XIhlu4xDqNVdemWcD+yqK7Tu7q6vBZI95W13Hg8kUAbv9DHsc71IYog5yTTwK2uXHlZI3w
 UcQ+5ATpDIPkoLYNLBvt+Kd32UI0J31r/2sSi7ypXyeFNM1QSMFRufRcgDCueLzwHPiwsxOisXh
 pMqTiLGXskaS8GIqg==
X-Received: by 2002:a05:620a:2809:b0:914:9bed:9439 with SMTP id
 af79cd13be357-914b499684cmr3819952385a.44.1779925359286; 
 Wed, 27 May 2026 16:42:39 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net.
 [71.126.255.178]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-914f86ff83fsm630942685a.14.2026.05.27.16.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 16:42:37 -0700 (PDT)
Date: Wed, 27 May 2026 19:42:36 -0400
Message-ID: <be755d49760dc9083ddd6d9a485c71fd@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260527_1931/pstg-lib:20260527_1608/pstg-pwork:20260527_1931
From: Paul Moore <paul@paul-moore.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 James Morris <jmorris@namei.org>, John Johansen <john.johansen@canonical.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>
References: <20260520-security-v1-3-831bd8e21dd0@kernel.org>
In-Reply-To: <20260520-security-v1-3-831bd8e21dd0@kernel.org>
Received-SPF: pass client-ip=209.85.222.193; envelope-from=paul@paul-moore.com;
 helo=mail-qk1-f193.google.com
Subject: Re: [apparmor] [PATCH 3/3] apparmor: replace get_zeroed_page() with
	kzalloc()
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
Cc: selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[paul-moore.com:s=google];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[paul-moore.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:jmorris@namei.org,m:john.johansen@canonical.com,m:omosnace@redhat.com,m:serge@hallyn.com,m:stephen.smalley.work@gmail.com,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-security-module@vger.kernel.org,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,namei.org,canonical.com,redhat.com,hallyn.com,gmail.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[paul-moore.com:-];
	NEURAL_HAM(-0.00)[-0.871];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo,paul-moore.com:url,paul-moore.com:email,paul-moore.com:mid]
X-Rspamd-Queue-Id: 9A9545EAFB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On May 20, 2026 "Mike Rapoport (Microsoft)" <rppt@kernel.org> wrote:
> 
> multi_transaction_new() allocates memory with get_zeroed_page() and uses
> it as struct multi_transaction.
> 
> The usage of that structure does not require struct page access and it is
> better to allocate multi_transaction objects with kzalloc() that provides
> better scalability and more debugging possibilities.
> 
> Replace use of get_zeroed_page() with kzalloc().
> 
> Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  security/apparmor/apparmorfs.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

I'll leave this for John and/or Georgia to review and ultimately decide
to merge, but it looks okay to me.

Reviewed-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com


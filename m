Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKG3B65JhGk/2QMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 05 Feb 2026 08:41:34 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EBBEF82E
	for <lists+apparmor@lfdr.de>; Thu, 05 Feb 2026 08:41:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vntzM-00059H-IX; Thu, 05 Feb 2026 07:41:20 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vntzL-00059A-7s
 for apparmor@lists.ubuntu.com; Thu, 05 Feb 2026 07:41:19 +0000
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 034C53F784
 for <apparmor@lists.ubuntu.com>; Thu,  5 Feb 2026 07:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1770277279;
 bh=zxCZUzd2xfkMizEOYKRbaOGQsI1X2IZR0QVgIaFzVaA=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=ZEgGfJku8lLHH2UimQ+yHYAMrObB65G6SoQ/NF7R53egv37sJw3Xbw8CLjFcCmq0j
 DYyRGSyt08spxlS6RbAZ/ZeONmup7Lb5sLtOcwi6iEdP94i/+wf2BdD1zvyxb7D5xx
 chxG311vmlk/dGwhKBKkwRe6u89pUxpagTvd7fNkS73Ml3tD7Hxu5h5xQ+hIWEK4lr
 XTu9Z+TN5On+B/qxs8MRceEukhrv3XOucUJFAH2p4EJP68EQKyL2+DKP6Z24ooK6cr
 z+N3SRlR/6XeG3erT1u5wH2mckixP6eCi05MzHBtZTzt6gG1meyuxFhe8Nt1XIAnXt
 Rxejw59iMh5i9fp3QGDwHevx2SFixMtQHH7fqQjXcZcCsTMQzsmpMRgpTnzldRvFZB
 O6TWWoOBB/qmlY3OD1LZG9X366epVvQMwIPcM/kpP5Z2wG+Il38Z5s9MvDq42S7q4G
 JUI0J3IGIAzhGifgaom8RQ4kmjWYwqZjlPYg51aVRYeXG7ITe8lUrOXS8krWRWUSqA
 Tgv1vfmGoSfUTaCQxK+nI8uY0iRyWA5OHaNEqKQvdZv6r8o7kvN6HBBZ83vv/m2+Vz
 7dfHU0YP7lkuHFriCqwXWAQwvRuGH84/I5ApD3FMmpVJXvRHTwiNoObZdJAhrdvOVV
 UtyeNTXDQwL2UlSJ9IXRW6KE=
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-34abd303b4aso1450042a91.1
 for <apparmor@lists.ubuntu.com>; Wed, 04 Feb 2026 23:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770277277; x=1770882077;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zxCZUzd2xfkMizEOYKRbaOGQsI1X2IZR0QVgIaFzVaA=;
 b=qhcaR4msm7AHQ8DcYjVC1K5RrCZTMi3tNkQHYv4yrhNCuyOb8zEbcy6E3P2hvi6RYF
 8kaOi7Wn3RI/G9tkhcpBriNlfVCem7gbFQmrBeks9GIyWzENB6/0MHDrC3G8g9xjqCga
 wIex6cl7d2VUx0IbPhb+KZhf/ecUidWKBgY7kulPeMc5dpE4e5nfHTQ3MQb3hIZrCghn
 XdE5PGehhxbi+8+oLbJXMvBR2fwvW0/vuBibTbK1exjOfMLx5TrfT77gqGBOFD/jed3W
 6qp+WWQsw17hrE+Rkyq7Sri+tt+Rt3F0pf2ZnwayI+wo09cF5ljL3RAim+tMp8a0PELP
 Gvzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV74JliCwGEU+2Rc944z513toMpVxyB+2gnn4rD6u/C/2QK4e88Aiz3WAOGd6uhFfpbisqsjWv5JQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzWO22sw8IrTHTWEipgqkQLDdctjgxj/Q6ZnI4cgAKbzST3jFuV
 6aJBdvXBl1obEv+APH6pqHIK5KVjWkrmgLuWwzUHt4xHVn9rGn+bfoOdtriLEBHUfYlV00dxglc
 IkASzZa//5GHv+Xx50wIzal3fXHRtqN6OkFZEveWH7Jjgq0aiHP8kYH1cq0pQSMru19fXS4jC9H
 arCDxJZJDRqA==
X-Gm-Gg: AZuq6aIW14QvCMGTOVsVEW56FFG/IAq+jDf8+gOugic6gK0PibJIZtQQ0QGigX1JcD1
 n3PelXhLe0YRmE2rKG8Xrx9upCIZ13N0ibLqsFpWAniUwhttvpYLUAFoTinTrCst5kCQsmYIL5h
 OSqrd+i93eU2q8L7yUudI5PZIiztkWdspEJo+Jr8oAwMD+n80dgw0GjPx4LoR6gTdOSRVfJRL9S
 tWh1NUEP9kmNZRHQyedduIEaKEDsRC2LHsuB+Xxjpupwx85b36cC5af0rEmNoa2QfFnsYYXGEV6
 OVu7Bi1O8H26ot9upgIdK0paRF3+xrI1/0ZtKBW9xV5aE5CtOxqOe2VplTJgH1h6tKbidEQ0EBK
 FOj+FXcl+MxwmrLS7LyEcKRAR
X-Received: by 2002:a17:90b:3c49:b0:353:356c:6840 with SMTP id
 98e67ed59e1d1-354870e76abmr4514902a91.14.1770277277743; 
 Wed, 04 Feb 2026 23:41:17 -0800 (PST)
X-Received: by 2002:a17:90b:3c49:b0:353:356c:6840 with SMTP id
 98e67ed59e1d1-354870e76abmr4514884a91.14.1770277277365; 
 Wed, 04 Feb 2026 23:41:17 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-3549c28204esm1621107a91.10.2026.02.04.23.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 23:41:16 -0800 (PST)
Message-ID: <1695a9cc-0d50-48f3-8c44-c84f3424924f@canonical.com>
Date: Wed, 4 Feb 2026 23:41:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ryota Sakamoto <sakamo.ryota@gmail.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
References: <20260125-add-apparmor-kunitconfig-v1-1-e815cec415df@gmail.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260125-add-apparmor-kunitconfig-v1-1-e815cec415df@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: add .kunitconfig
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakamo.ryota@gmail.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:sakamoryota@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,paul-moore.com,namei.org,hallyn.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	DKIM_TRACE(0.00)[canonical.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_ORG_HEADER(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Queue-Id: C6EBBEF82E
X-Rspamd-Action: no action

On 1/25/26 02:05, Ryota Sakamoto wrote:
> Add .kunitconfig file to the AppArmor directory to enable easy execution of
> KUnit tests.
> 
> AppArmor tests (CONFIG_SECURITY_APPARMOR_KUNIT_TEST) depend on
> CONFIG_SECURITY_APPARMOR which also depends on CONFIG_SECURITY and
> CONFIG_NET. Without explicitly enabling these configs in the .kunitconfig,
> developers will need to specify config manually.
> 
> With the .kunitconfig, developers can run the tests:
>    $ ./tools/testing/kunit/kunit.py run --kunitconfig security/apparmor
> 
> Signed-off-by: Ryota Sakamoto <sakamo.ryota@gmail.com>

Acked-by: John Johansen <john.johansen@canonical.com>

sorry, for the delay I actually pulled this in a while ago, but the initial reply seems
to have gone into the void.

> ---
>   security/apparmor/.kunitconfig | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/security/apparmor/.kunitconfig b/security/apparmor/.kunitconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..aa842a0266e9d33c3333ec2ea180206187b0eb4c
> --- /dev/null
> +++ b/security/apparmor/.kunitconfig
> @@ -0,0 +1,5 @@
> +CONFIG_KUNIT=y
> +CONFIG_NET=y
> +CONFIG_SECURITY=y
> +CONFIG_SECURITY_APPARMOR=y
> +CONFIG_SECURITY_APPARMOR_KUNIT_TEST=y
> 
> ---
> base-commit: d91a46d6805af41e7f2286e0fc22d498f45a682b
> change-id: 20260125-add-apparmor-kunitconfig-28aba43c1580
> 
> Best regards,



Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEhvIFn9hGl47QMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 05 Feb 2026 21:28:09 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCF0F724A
	for <lists+apparmor@lfdr.de>; Thu, 05 Feb 2026 21:28:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vo5xE-0006It-0N; Thu, 05 Feb 2026 20:27:56 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vo5xC-0006Ia-Qw
 for apparmor@lists.ubuntu.com; Thu, 05 Feb 2026 20:27:54 +0000
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4E1AE3F2B0
 for <apparmor@lists.ubuntu.com>; Thu,  5 Feb 2026 20:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1770323274;
 bh=MdlgQUxJx43tKVtI1P3n+Lb+NJO/HeQshepr17CRYt8=;
 h=Message-ID:Date:MIME-Version:Subject:From:To:References:
 In-Reply-To:Content-Type;
 b=eMhJefOV0u2pB06m8xg7S3DYku3yS6UuAXd0cEKucPZTgHNuoy3uLwsAiJZfHq7Cl
 pKVxl/rieBFaJwnMXOtRUmKpTgA+95Mx/E7Uj+ElInZ/tIRD5915pfU4tMuBv9oBqn
 erYjkpvlG6EPnPdZ3fHyRPzR3CFn9x4YEFgw5ic7poH43lfH0BeFsxxz5kFAqSCLkr
 TKBQkelBBppbgXbau+BLSsyhQOokB64kwxJtbUv9nI786nHrjKsDueqFaFcxDSZ09M
 Lhj1VWFABGTWuWmAnTbyEfAa5UPz6otqod96ap5VgK1P/Anv6UPnSaElmqYnlxsoJ0
 zQeaVtpKtZiCbeS+0PiXqxWOFTYfpe29J9Nq0RDDO3Yh+rtMHLkNIeWhhi1G6ip0Ac
 bNAiHyJSa9wROGooI6WGjMB/ZIF6zjcaMws7ul/GSHTI5LnGkjA55CoN//D64sUnrA
 8uSSQc1UXFVkMpsWJYfP6uGMlNuadm9yG8+qooNrUvVSmuXtrlEBpX9lsnJeHMyYkY
 7i3pWh52doe6tOp9SJs0O0yhplmafYuBHv/uEZzhN6BTWv5idJGPezbxXy0Lhaqzw6
 QnnoarDVm8t7GyXK9QRKJ9+RdZpEgV1olXShEtdUmkyy9l++iy2oI8bFW4nxh3Vxbi
 6E8rAZdDZmCjCna7zy9nOV10=
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-81ecb6279d9so1533054b3a.3
 for <apparmor@lists.ubuntu.com>; Thu, 05 Feb 2026 12:27:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770323272; x=1770928072;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:from:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MdlgQUxJx43tKVtI1P3n+Lb+NJO/HeQshepr17CRYt8=;
 b=UY0YlRpiJRfcj4CPjAFWz/+NPr3AAWA29jBGiO5E0nSV7OapZvP8dE7buzluL9ZNJM
 SBDasi15bZXWn82rAuDPKWt51Yc8CZHn30jK5PyNAkbUsTUXairE/twBiKlO61LpifC1
 dK5REMGiVS4ggLoTFhtNSThnKB9VAwV0Uc7AeucOOfJhgL76cTAALuAG7jyT/idRNMth
 qazdsgkJN5PeDywHzAE0kjuGeHuZ9XXDjAZyIRQILN4GXJQYUTH3ctD1BguTuKomxXHp
 QxFIHBeFSLLgLZ3i3r1oIgUk/D6F0j1ae2byb3PgVdmGVc4R1M4OyGeUH6tOuKgzVJPt
 uIMg==
X-Gm-Message-State: AOJu0Yz5j6JjAru5EGO/ijmWLgptUlzO6d5w2SckN8CNOrY2bS9SO1tv
 wLZ+CnU4+VCGPwhDUZPwGBSmrAj+3QVAXQ06Zu3g2QPo7Ttm8xLNXRMk3ySwGg/5SE82yxXqOyx
 Cs7d60/6RFSu9sJNtTyE1cx7tZCzgblkH8Mlb7eCgKmU37MKyTQXe3DigZh85EqR9+f3he/HFcW
 1vvUfIurWDJg==
X-Gm-Gg: AZuq6aLDAWnYHPHP5aiwr3VUpcvUEp2GW2QTr63LY/cK3QEmRnozuaNlkPC+APDxJRW
 HXnKBEZ56lLVHML8C2PbdU6jA5OjufoUeJCgtUdNujPFoHiTGHK2xvtuLNtmlh0b6Ex2UFJLf1l
 TqE5KZao7dT8TKXR8xtrKEXTobkP+5KyvhECbI7kuxrgvHMx7asLLXagt2YtGQCu1jG4EzDQTrG
 o9XfcrALJ2UMOln2t3QIJEPQXywHIqhKJBmr9gPstJCsr4cGxSMWRH7G5L6heCqYJFaGWM6tUVP
 nfhD9zFtWdqoRjuEJYUDOY+VtzfN7Oj4JXwY2Zb6kEVpHW/lB3o7JCUVnZFIEOtnYzhdH14p0Ts
 MGdDBqUDlVOWfrMJzynj4kDg2
X-Received: by 2002:a05:6a00:22cc:b0:823:15f5:946 with SMTP id
 d2e1a72fcca58-8244160a772mr315465b3a.14.1770323272590; 
 Thu, 05 Feb 2026 12:27:52 -0800 (PST)
X-Received: by 2002:a05:6a00:22cc:b0:823:15f5:946 with SMTP id
 d2e1a72fcca58-8244160a772mr315448b3a.14.1770323272090; 
 Thu, 05 Feb 2026 12:27:52 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-8244152456asm183551b3a.0.2026.02.05.12.27.51
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 12:27:51 -0800 (PST)
Message-ID: <dcb49520-c0cf-4e11-ba27-60f4c11590b7@canonical.com>
Date: Thu, 5 Feb 2026 12:27:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
References: <96e377ad-ab06-4f9d-93fa-b17e2160a1c5@canonical.com>
Content-Language: en-US
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <96e377ad-ab06-4f9d-93fa-b17e2160a1c5@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] Poll for AppArmor policy file type suffix
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:-];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[apparmor];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,canonical.com:mid]
X-Rspamd-Queue-Id: 2CCF0F724A
X-Rspamd-Action: no action

On 1/13/26 12:17, John Johansen wrote:
> A poll at the below linke has been created to help choose the file suffix that apparmor profile files should use
> 
> 
> https://strawpoll.com/e7ZJarmMLg3
> 
> Its rank choice, randomized entries, and it closes on Jan 31, 2026
> 

voting is now closed on the poll

.aap		40 points
.apparmor	39 points
.aaprof		36 points
.aapolicy	30 points
.aapol		20 points

so the winner is .aap

thank you everybody that took the time to vote



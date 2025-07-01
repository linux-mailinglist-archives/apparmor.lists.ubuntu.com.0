Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2FCAEF2F3
	for <lists+apparmor@lfdr.de>; Tue,  1 Jul 2025 11:16:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uWX6T-0003sM-NZ; Tue, 01 Jul 2025 09:16:37 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <maxime.belair@canonical.com>)
 id 1uWX6S-0003p7-K0
 for apparmor@lists.ubuntu.com; Tue, 01 Jul 2025 09:16:36 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 512533F2CB
 for <apparmor@lists.ubuntu.com>; Tue,  1 Jul 2025 09:16:32 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-450d244bfabso26717015e9.0
 for <apparmor@lists.ubuntu.com>; Tue, 01 Jul 2025 02:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751361392; x=1751966192;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dVcX/aApl1bOZ7xau++gCdWkwO+zwwT+04d8AsO394Y=;
 b=Q9iZRD/H/WQ4oQKmBZDvaLWtMTLapDh8JD+Vas1fot5NshBEuCpEfv2TxM+3W6oGQJ
 BK6fdlPUGAhk9SNW886VE3cG1hilr8RlH3Xjg+tTpsXwHHyh5I/e/kQQaZvv9f2XNJ+L
 ouIgGD15L1hZ6+xN/TjricakBf2niudY9M65XtC0dB7g2zR81Go+q8dS3zaJgo2ct9Jz
 lyN4RhSHttd31VSZpGRB+uEqktWup+/pO7eJphRRz22QABZcVUrF2Ks6h1GW9fpXr3T8
 84Z10LmYyaGwFejtRGo9Q9VSmtIgBbsKTsJfKkh70dtDzfOlas88kOE1IYmWmnI1213+
 s07A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUqJpNOGsZcKxUuXMfjGapXz5Fwgrfk1Ktkn7W6KNryNI35A7daW019+iWCqIdw5G94ToInndvPw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwbeVVAzI0Qhy9ABon4oLb9W+we3ijQUrw1zqXPWLeRHE3gX1RY
 218tbpjGXf4SvVPXD6TJzmWPxVWGtta3u2SvdmAIit9pMiBttH2mW4kD+xfkB4YlUJh0pm6L+8z
 eh6JupKWdpJN/HdtPeQpdtXCYHJsQ3ZAJgPqGb+h6/6SqFu7fq/rgrFWeKKfqjHP2DQAXwXtQKJ
 YXdQ==
X-Gm-Gg: ASbGncvhePeom38EBacH4EsAjfADtchLvnoMRJP7kcLZH1mq5yYgmrS/Hl3mDulZC9r
 A5eLKLTCSYCYFIqZUc7kZ6xiPG1SKr+qI73z9PLDjNmrO2n+4DdTrJP6zPked5r1ZAEDnX/Ucf4
 VdsfGZyGpL36cLkA2cQJM5Uroi7ZyMHLyUULtsp0THTw5AelbfJxqYMt+MjQICob4FVWsN1lnHg
 2AH5pqDDjZqDMaNPNRWLGjS+OJaCdjOQGzvM/NtMlha7K0rzV10duLTl5MS5HjWtPAT8QJ4pF9R
 yMhXTjPTcK3gsRnCQAuZSM8xYBzNuGRCY98yN3IaTcAe5akQgydqMA3SfZRroL9RmCnAyPuK71j
 Ysg==
X-Received: by 2002:a05:600c:1caa:b0:453:6150:de41 with SMTP id
 5b1f17b1804b1-453936a4bcbmr162957785e9.17.1751361391817; 
 Tue, 01 Jul 2025 02:16:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOOqyJLr4ZGrfOkvegHE3h2BS+hNoKU0ZEkODM/DAdkz3AR7uaEpoRcficw8Y2fcSj2XPNjA==
X-Received: by 2002:a05:600c:1caa:b0:453:6150:de41 with SMTP id
 5b1f17b1804b1-453936a4bcbmr162957165e9.17.1751361391309; 
 Tue, 01 Jul 2025 02:16:31 -0700 (PDT)
Received: from ?IPV6:2001:861:3280:410:2ef0:5dff:fe60:6274?
 ([2001:861:3280:410:2ef0:5dff:fe60:6274])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e52c99sm12500699f8f.49.2025.07.01.02.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 02:16:30 -0700 (PDT)
Message-ID: <6cd857e8-8f96-4ea1-81f6-e1895c208c20@canonical.com>
Date: Tue, 1 Jul 2025 11:16:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 linux-security-module@vger.kernel.org
References: <20250624143211.436045-1-maxime.belair@canonical.com>
 <20250624143211.436045-3-maxime.belair@canonical.com>
 <945bf443-32b4-4432-8702-41ff7b15e420@I-love.SAKURA.ne.jp>
Content-Language: en-US
From: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>
Autocrypt: addr=maxime.belair@canonical.com; keydata=
 xsDNBGWdWVYBDADTTxrLrewr4UPUa9CvBTsQFOLNM1D8rvhDyf0UWHD0Z3EuqePliDUpQ1FQ
 EaDAd1qEmsf4ybF8dWN37OC25iBmolZv+tzpRmlhTQtyBu/xWu5LwWIpLFhQq+9AkcHa4Za8
 2/ovK84K9u8RPN6Y9h/UOzAS23UI86T58KxzDHEHbRC5XA5VmOgcX71FQDalvMUaAHJV/WRe
 OifBAwPbapTmTuKEmuLXvDczKqAADKWHXi7JECpY+1Mpd9xRd9dWu7ooKQ+KmOFOZcOxKagY
 9+qK77wUzgDleDU8ihuzOWol+K5vZg0saiRJQm8l9mhIXrREloiUntScBraHBSqSy0kMuIK7
 bmIflfgDarYVXV5rxotIWu0guyn8kT/N+DKghi52/VbDdOBngwYLTBO3sZtIdw0pkhkwHDcl
 se+BThNz6xC0UXlSZrUBQ5RBruBSTXZHwZM9Oyhlf+S1EtZe2jO1R2hSZ0rrHJ/93LT5ARFd
 jGInAz6ocW0He8FB5nGjfQcAEQEAAc0sTWF4aW1lIELDqWxhaXIgPG1heGltZS5iZWxhaXJA
 Y2Fub25pY2FsLmNvbT7CwQ4EEwEKADgWIQTKdrj/a+71WSW+OmUnvE/6RFk5uAUCZZ1ZVgIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRAnvE/6RFk5uL/BC/98c45dc+GgTCgYO8YY
 lXJ/N9+QZyw5n4CBcXphBkd/xZkwlOgJ4bY5zHH3ukKBfuNB77RLRT+mzHwnCELXRqQOebtN
 ZhI2JDvdAwemyxsstj1lSadYhlRDjxLmphARRbiJ9q8g3MMhv/zLcM5ObFfSP4lQaxaiSEjw
 pAJNLR7d9rsMUYi/lWxQKDcjGaKnQkq5qDtLzoWw6pIf2VKGQDbibPdVTiedByIbF6x21LEQ
 rVNHTOnqoqC2X6JiSWz4pCuYRQM7bY1BW0ZUOWnshJNQqi8+4/A/h+Yss3vXp82+oKRw7Dls
 /B5MjR4yHdCBb8RWM0y0kghpvjMmp5Nbsh5XaDu2yv5qkxs4NHoklalUvBy34O2lx0ITVSGN
 pbzw93cUZtomDRtXder0cY6FPVNrN8aP6PljoYrobVDCb451nc1YrFEiMUG8jCfD85JpwK+S
 Ql9RccaMFTcPXe0rFWr7ecwjEtxDd6/Mu9tpW1mLMOKF5TJxrmVtbAIauPgKp0rOwM0EZZ1Z
 VgEMANEV0CsOdJHC9VROvdooRgl8Q7E19QdsCpDD1rziS1KeegSPo5n1uDsXoW88Rdpxqap0
 fcgECJxZfH4bgHr0G/pWHbbltfM7jdvdW+cXD/8wVBgzZrbysPa9WpaM/S/DXj2qVIng3O43
 izSedJ81iYyvi7i2e4YtZndGsz8DslaUDqBCHKvG5ydp/9W0Wj55SxYCmt1rdv5GUYULoVhI
 uevY8olct38tl7rSZxBpzez3rK3WCQkSN1uf8zzluDLWXEmJjafJfzO5YC6s+ScZ7kXEIcJC
 ttGXwVJWJF+Yq7EKaGoEMK+5e4SJgok6vrx3f+lKa3R70jqwAj1ulsvS3LRgrjtN8dhIuJdE
 aSNTkEO5TvrHzcDk/v5X7Tn7YOo4qheqC4k+PzNBI/Y4TGY6FJFskaii89wRVmSg3meRv9p4
 kT2XXtNueH/CWtwvSK3f+2u21DbNnknjSXg0lNlO380NwN1Q0BnDTPcASENd5T4gwxBw5GED
 H6yK2jn5bFMUxwARAQABwsD2BBgBCgAgFiEEyna4/2vu9VklvjplJ7xP+kRZObgFAmWdWVYC
 GwwACgkQJ7xP+kRZObiqjQwAlD/IBOVIkpuGjO7LoxpA8qe63AO1HygvGVOlFHLrw4ap+edK
 bUpmEzht20VQNtzyosBbXYDDrcFiSiTNoBKFYx7ekfQ+OwxzU0wOkUJ2m56EKAlUHotwnHm+
 s1FF7SFQO7oubKCZPSjPgex8XmY43uZXnKmsoFC0iJdB6a8wOPIk10VpaEfgrGdwUPeDchAX
 ZSAEPZRM0C2JDjghdIlVek0goTWh4RARJ/Mz73K0VZoqxecSArSglOqlpUO2YETJGB8kR6Ip
 uk605mf+aJoQq/8DtoYOTFFaTViKlKgVoNi0e1il6HkEhASyGQeQZkcq92O6ndDm//csiJT2
 oRAG5XUu5Q1PWG0oY4cZ6XN1z8nkj5Mj23SRhBwVjh2PY2p4cyFRTBrBDaNV38LHw6tVjdhk
 8YNqGOVqceueWdZmWbp8b88a0wzOcrPAvcxJ14FhMyMO9P7FblDYLNYr0oAYj+UyhxOPbRZz
 yriCIKEAbLqHTyj+RhbroZmv5q3X7iVq
In-Reply-To: <945bf443-32b4-4432-8702-41ff7b15e420@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] [PATCH v3 2/3] lsm: introduce
	security_lsm_config_*_policy hooks
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
Cc: paul@paul-moore.com, song@kernel.org, kees@kernel.org,
 linux-api@vger.kernel.org, stephen.smalley.work@gmail.com,
 rdunlap@infradead.org, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, mic@digikod.net, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>



On 6/25/25 03:08, Tetsuo Handa wrote:
> On 2025/06/24 23:30, Maxime Bélair wrote:
>> +config LSM_CONFIG_SELF_POLICY_MAX_BUFFER_SIZE
>> +	int "Maximum buffer size for lsm_config_self_policy"
>> +	range 16384 1073741824
>> +	depends on SECURITY
>> +	default 4194304
>> +	help
>> +	  The maximum size of the buffer argument of lsm_config_self_policy.
>> +
>> +	  The default value of 4194304 (4MiB) is reasonable and should be large
>> +	  enough to fit policies in for most cases.
>> +
> 
> Do we want to define LSM_CONFIG_{SELF,SYSTEM}_POLICY_MAX_BUFFER_SIZE as Kconfig?
> 
> If security_lsm_config_{self,system}_policy() are meant to be used by multiple
> LSM modules, the upper limit each LSM module wants to impose would vary. Also,
> 1073741824 is larger than KMALLOC_MAX_SIZE; kmalloc()-based memory copying
> functions will hit WARN_ON_ONCE_GFP() at __alloc_frozen_pages_noprof().
> 
> Since some of LSM modules might use vmalloc()-based memory copying functions from
> security_lsm_config_{self,system}_policy(), the upper limit should be imposed by
> individual LSM module which provides security_lsm_config_{self,system}_policy().
> 
That makes sense. I removed this global Kconfig and the maximum buffer
size is now defined per module.


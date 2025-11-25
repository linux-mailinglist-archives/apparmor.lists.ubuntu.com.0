Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 862DEC84113
	for <lists+apparmor@lfdr.de>; Tue, 25 Nov 2025 09:52:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vNomE-0008Rh-7B; Tue, 25 Nov 2025 08:51:58 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vNomC-0008Ra-Kw
 for apparmor@lists.ubuntu.com; Tue, 25 Nov 2025 08:51:56 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3EBEA3F102
 for <apparmor@lists.ubuntu.com>; Tue, 25 Nov 2025 08:51:56 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-295fbc7d4abso81947705ad.1
 for <apparmor@lists.ubuntu.com>; Tue, 25 Nov 2025 00:51:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764060715; x=1764665515;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=do/n2qEw9xtwp2lO9J2hvv0hPKIs2ILwjM5v6RpF4uc=;
 b=BBu9QZrwYB5VqAcDpUY3TDn3MVltsxhA9HRxq7YEc8Xp4fImkggOmIY23g7/UesydK
 O7R1sa83YVZkyFyPkC9hBB2W4kh/HDoQnesWCaGNDFxabboVsf5ftVeqPzzlaSQqy+eW
 Pf42Nc3GX5njJoJnRCN733cFdgobBHAoj8rdToqWVRC7yYqV8ZraxniFjeYYJNJPRz+A
 zFj5Txrf2wlhdLM8PZ2e9kpWUB0rI9r87qIJ0gp52Ga9RRiUUBWqpGc/zqdGGk0whMPK
 cLORlX6hpuAXagnKE9ivHdiculLtZCkYpwuWIdH5WZn+7XygJg3WWw1rvi3RtIC3/Kmz
 8PJw==
X-Gm-Message-State: AOJu0YzgYWxsv9G58PzOcvGU+QL1zlP5bzlKlzU+ccgmyUmT4GcOn4M/
 At3nYD2Calg1u0IoI1ZiuGSsWTSm8IR5yL8hi48epWaEkQUcd5MOI7aT1CYnx4juP2QWpfUwSDf
 3QjNperGjTn/3fr7yYBcLOkV/jh9Xrg2HBdbtjNj/RdHo9vUaZax7gNaG/J2Okznd5G8FCmHMz9
 yh4896pWb0wwF9
X-Gm-Gg: ASbGncshCJ6q8Hf+rup2kZXKpKqg0xHCauq7oOjRlHL7bSq/22HRMR72MjSFNjuTZ4N
 +kybTB8qH4HFcHYxhn03FXaBI46ZINSlz22sWoc+3V4bIYeYCJUBcgtLcDa112WVovGYdBD8tWr
 8whnMMoscPGby+XC5o42nLlMmAyHEztBPvOS7IvgHqRBs/PrmBr19rzYGIbIA0D+W7c8JEk94DU
 MmandzEsQgNqKCZy4Qbz0IquZlVau7tUjn7FgSmtbKB46z1b+Z0OK3FozuTnG9AtqWck4K9j/F1
 kNxI0AO0LKdYXJ301AyAt9SOMgmpYeRJVRIILFwJwIFjNvrDkP0BDvX8r6cQM6l0A28Eke+EplQ
 X3FS1UgvZT/Qh8FStLWvuNdwi
X-Received: by 2002:a17:902:c946:b0:297:c0f0:42d7 with SMTP id
 d9443c01a7336-29b6bf5f050mr195631885ad.41.1764060714531; 
 Tue, 25 Nov 2025 00:51:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHEOk6vPURuWLJ1tS7eBk4qyCjPK3/W3x5MvodFv6RnEmnBxMA2HBRATAT+yjPWcfGSJO9SA==
X-Received: by 2002:a17:902:c946:b0:297:c0f0:42d7 with SMTP id
 d9443c01a7336-29b6bf5f050mr195631685ad.41.1764060714162; 
 Tue, 25 Nov 2025 00:51:54 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-bd760dbc99asm15541452a12.30.2025.11.25.00.51.53
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 00:51:53 -0800 (PST)
Message-ID: <6886f5c4-c95f-4572-aa6c-a8341d692b2c@canonical.com>
Date: Tue, 25 Nov 2025 00:51:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <877bw9bta5.fsf@nixosThinkpad.mail-host-address-is-not-set>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <877bw9bta5.fsf@nixosThinkpad.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] Deny messages for systemd rule
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

On 11/1/25 09:40, engelflorian@posteo.de wrote:
> Hi all,
> 
> Why do I get this deny rule
> 
> AVC apparmor="DENIED" operation="exec" class="file" info="no new privs" error=-1 profile="/nix/store/ksz6ygnl9f1l6jff3mwmjsmw7qyyxa59-systemd-257.7/**" name="/nix/store/s71mkxsqwlhgjvpdjgnz6wrcah1wfbk3-dhcpcd-10.1.0/sbin/dhcpcd" pid=872 comm="(dhcpcd)" requested_mask="x" denied_mask="x" fsuid=999 ouid=0 target="/nix/store/s71mkxsqwlhgjvpdjgnz6wrcah1wfbk3-dhcpcd-10.1.0/**
> 
> for the profile
> 
> profile /nix/store/ksz6ygnl9f1l6jff3mwmjsmw7qyyxa59-systemd-257.7/** {
>    capability,
>    network,
>    mount,
>    remount,
>    umount,
>    pivot_root,
>    ptrace,
>    signal,
>    dbus,
>    unix,
>    /** rwmklPux,
> }
> 
> Shouldn't x be allowed?

This is denied because no-new privs is being enforced and the transition would result in a policy change that can not be proven at run time to not grant additional privileges.

Unfortunately the nnp api has it applied before the exec instead of at exec which is problematic for LSMs that allow policy transitions at exec.
To deal with this you can use a stacked transition that keeps the original confinement and adds the additional confinement.

   /** Pux -> &@{profile_name},

Currently apparmor doesn't allow overriding the nnp restriction. selinux has add a special capability to allow overriding nnp, and apparmor will have to add a similar capability to allow for certain situations where stacking doesn't work




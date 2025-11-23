Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ABDC7DABA
	for <lists+apparmor@lfdr.de>; Sun, 23 Nov 2025 03:09:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vMzWy-0004EQ-5p; Sun, 23 Nov 2025 02:08:48 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vMzWw-0004C2-Ew
 for apparmor@lists.ubuntu.com; Sun, 23 Nov 2025 02:08:46 +0000
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 08C383F2AB
 for <apparmor@lists.ubuntu.com>; Sun, 23 Nov 2025 02:08:46 +0000 (UTC)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7b8a12f0cb4so3349976b3a.3
 for <apparmor@lists.ubuntu.com>; Sat, 22 Nov 2025 18:08:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763863724; x=1764468524;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8a0z/wk/mu0JDwpB1nlChburcNktUNgCK6fbMb2S5Qg=;
 b=oNUZI9NMl9dUtpcuKU7uCVR7ApMeS2udBdlqpcaXBU70ZSfxGetiU00qJeAoxu2cU4
 YsIW8yOaY4EfqezdpLATo2MhSlvPqLLb2NhZFc56/XDxX14CQbEjpJguZlN6gekL4e0J
 sqij37CCac9xZWL/yzEdOv/cQ+aMsqbgOxk6HTs2DWFC8wEISLedmP8muU2yo9Sjb8Ln
 UkN+OSJna/aA7KkBbbXa26DxB3N1BYPECElIKv+Q/ct2YpcujUv2GhPXM6A8A8R5Za+m
 3PdL2Q9UMNwk09GBW1+qB9LaBj7KrCsD1hROPx7DaP5wUpX/UMYd/LFwKTK4XmdHFKDg
 pEsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLywqfVupr6d5fbHh+YLhJVvq3aDtjjM519DrOiwiHcMt7R9piGe3/znYHVRu6Fsn/ZbA1ciXaNQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yyt0INEckwOqdydExYs2Z9UXIPb+Y49BbIQaPaBPquKK1eoGQ8C
 jYPZ3p3MuIHrprlbyjUgKLgVC5SWNSTapadpSoCuY/qOavoXp+GI/bSgr2NqnOOUzmmT/UpVr1Q
 wKhk6tAOzBwnxztuSd/IvbMsiRCKVPeFS3lYEkqB4Hx5DH/2Em3u7+pCi+UoQcfSbollddE/++y
 Lkbg==
X-Gm-Gg: ASbGncvia33W34IQdT6nNii7jMbdqp9sufo9IqYf/CyCeySXgiQ4PurZF/R77OTADTE
 K/BLsdJ6hsCNs8hIedvVO30vhEOxU5d88z9Ra0xk+cAb9wlBOKZSjQj7Inb+urvuk+pmXGv8+80
 n3rTX8tgW6yJAgFwcVIWAE7Vai5Z/mBMuGDu02sQ6zqExFAidLeD78J5wyQV0ExqxBsWRYmtdMg
 v2I4w3jv3fy65QZVXuiUV0u4tOwQtOM6pUHgIW3xt1kJiz5GWMv0mse4poqBSK5Xn6YqbwIatGn
 9iJEPHxWvTq6quKG7b2OG1p5TIb4HjXwgtepz2NyMFyJg6uH7Ufm/eIyfbS1K+Xz7TS4OYodWD0
 b2fvKCv5rbvhOIj1ojvquxX6W
X-Received: by 2002:a05:6a00:2d0a:b0:7aa:5053:f42d with SMTP id
 d2e1a72fcca58-7c58e607616mr7156859b3a.22.1763863724193; 
 Sat, 22 Nov 2025 18:08:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5EdW7DViLURFiTiYnDZdHr/ASDQFEH7LIzlahpAsWvtIRd3Fq9k5rfNebu9eARHSIFcAxzw==
X-Received: by 2002:a05:6a00:2d0a:b0:7aa:5053:f42d with SMTP id
 d2e1a72fcca58-7c58e607616mr7156836b3a.22.1763863723731; 
 Sat, 22 Nov 2025 18:08:43 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7c3f155d053sm10164138b3a.62.2025.11.22.18.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Nov 2025 18:08:43 -0800 (PST)
Message-ID: <ba3d5651-fa68-4bb5-84aa-35576044e7b0@canonical.com>
Date: Sat, 22 Nov 2025 18:08:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Helge Deller <deller@gmx.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Helge Deller <deller@kernel.org>
References: <20250531150822.135803-1-deller@kernel.org>
 <bc21bee14ca44077ae9323bfc251ad12390fa841.camel@physik.fu-berlin.de>
 <aRxT78fdN5v2Ajyl@p100>
 <90513f85cc8d060ebccd3972cc7709e4b6f13f34.camel@physik.fu-berlin.de>
 <be9c143d-1d5e-4c5b-9078-4a7804489258@gmx.de>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <be9c143d-1d5e-4c5b-9078-4a7804489258@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] [PATCH 0/2] apparmor unaligned memory fixes
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

On 11/18/25 04:49, Helge Deller wrote:
> Hi Adrian,
> 
> On 11/18/25 12:43, John Paul Adrian Glaubitz wrote:
>> On Tue, 2025-11-18 at 12:09 +0100, Helge Deller wrote:
>>> My patch fixed two call sites, but I suspect you see another call site which
>>> hasn't been fixed yet.
>>>
>>> Can you try attached patch? It might indicate the caller of the function and
>>> maybe prints the struct name/address which isn't aligned.
>>>
>>> Helge
>>>
>>>
>>> diff --git a/security/apparmor/match.c b/security/apparmor/match.c
>>> index c5a91600842a..b477430c07eb 100644
>>> --- a/security/apparmor/match.c
>>> +++ b/security/apparmor/match.c
>>> @@ -313,6 +313,9 @@ struct aa_dfa *aa_dfa_unpack(void *blob, size_t size, int flags)
>>>       if (size < sizeof(struct table_set_header))
>>>           goto fail;
>>> +    if (WARN_ON(((unsigned long)data) & (BITS_PER_LONG/8 - 1)))
>>> +        pr_warn("dfa blob stream %pS not aligned.\n", data);
>>> +
>>>       if (ntohl(*(__be32 *) data) != YYTH_MAGIC)
>>>           goto fail;
>>
>> Here is the relevant output with the patch applied:
>>
>> [   73.840639] ------------[ cut here ]------------
>> [   73.901376] WARNING: CPU: 0 PID: 341 at security/apparmor/match.c:316 aa_dfa_unpack+0x6cc/0x720
>> [   74.015867] Modules linked in: binfmt_misc evdev flash sg drm drm_panel_orientation_quirks backlight i2c_core configfs nfnetlink autofs4 ext4 crc16 mbcache jbd2 hid_generic usbhid sr_mod hid cdrom
>> sd_mod ata_generic ohci_pci ehci_pci ehci_hcd ohci_hcd pata_ali libata sym53c8xx scsi_transport_spi tg3 scsi_mod usbcore libphy scsi_common mdio_bus usb_common
>> [   74.428977] CPU: 0 UID: 0 PID: 341 Comm: apparmor_parser Not tainted 6.18.0-rc6+ #9 NONE
>> [   74.536543] Call Trace:
>> [   74.568561] [<0000000000434c24>] dump_stack+0x8/0x18
>> [   74.633757] [<0000000000476438>] __warn+0xd8/0x100
>> [   74.696664] [<00000000004296d4>] warn_slowpath_fmt+0x34/0x74
>> [   74.771006] [<00000000008db28c>] aa_dfa_unpack+0x6cc/0x720
>> [   74.843062] [<00000000008e643c>] unpack_pdb+0xbc/0x7e0
>> [   74.910545] [<00000000008e7740>] unpack_profile+0xbe0/0x1300
>> [   74.984888] [<00000000008e82e0>] aa_unpack+0xe0/0x6a0
>> [   75.051226] [<00000000008e3ec4>] aa_replace_profiles+0x64/0x1160
>> [   75.130144] [<00000000008d4d90>] policy_update+0xf0/0x280
>> [   75.201057] [<00000000008d4fc8>] profile_replace+0xa8/0x100
>> [   75.274258] [<0000000000766bd0>] vfs_write+0x90/0x420
>> [   75.340594] [<00000000007670cc>] ksys_write+0x4c/0xe0
>> [   75.406932] [<0000000000767174>] sys_write+0x14/0x40
>> [   75.472126] [<0000000000406174>] linux_sparc_syscall+0x34/0x44
>> [   75.548802] ---[ end trace 0000000000000000 ]---
>> [   75.609503] dfa blob stream 0xfff0000008926b96 not aligned.
>> [   75.682695] Kernel unaligned access at TPC[8db2a8] aa_dfa_unpack+0x6e8/0x720
> 
> The non-8-byte-aligned address (0xfff0000008926b96) is coming from userspace
> (via the write syscall).
> Some apparmor userspace tool writes into the apparmor ".replace" virtual file with
> a source address which is not correctly aligned.

the userpace buffer passed to write(2) has to be aligned? Its certainly nice if it
is but the userspace tooling hasn't been treating it as aligned. With that said,
the dfa should be padded to be aligned. So this tripping in the dfa is a bug,
and there really should be some validation to catch it.

> You should be able to debug/find the problematic code with strace from userspace.
> Maybe someone with apparmor knowledge here on the list has an idea?
> 
This is likely an unaligned 2nd profile, being split out and loaded separately
from the rest of the container. Basically the loader for some reason (there
are a few different possible reasons) is poking into the container format and
pulling out the profile at some offset, this gets loaded to the kernel but
it would seem that its causing an issue with the dfa alignment within the container,
which should be aligned to the original container.

Kernel side, we are going to need to add some extra verification checks, it should
be catching this, as unaligned as part of the unpack. Userspace side, we will have
to verify my guess and fix the loader.





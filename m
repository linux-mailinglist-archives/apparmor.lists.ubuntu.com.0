Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CABFBCAB2D9
	for <lists+apparmor@lfdr.de>; Sun, 07 Dec 2025 09:44:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vSANL-00059D-Jq; Sun, 07 Dec 2025 08:44:15 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vSANJ-000592-HN
 for apparmor@lists.ubuntu.com; Sun, 07 Dec 2025 08:44:13 +0000
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DE2A33F129
 for <apparmor@lists.ubuntu.com>; Sun,  7 Dec 2025 08:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1765097052;
 bh=RaLR5hegrCH3Jg8Uw/361tsJ3PyXIqeRrVTsGyOxw1M=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=IsIUyx6v9oWV1tmX2eTVRa1U8WtnlGNY38EVgl+BpAos6e1nVXAyJfSKd3pE5IrY+
 ClTYF+EW9pXD7NaP/z+ajnFZ9KZhydXCla0Tt6A4MCm///oKQKzxhqTsulrOnWYfpa
 sr8987UcT/msq+fsqKrT0Ij7+4uAH1G/AXHWZJFSv8hkCV5r0Kk0frXecwRXexno3R
 2T0QsJT4SqVNNTd08EMnJkdyo7LWR8YXl2Bdkbef96YG97+rp/dpnHdWaBpoPz3Q1P
 w+6BuFLVg6RWu4UpdEtNdkLos7kg0YnayxMMkfc0lSLoCspSOhO6O77O9ZlAdagQFB
 TZPwZM9r0kfoO4wRA493ZZzwL349q61ZcA1RhFmxQMy+er+viCn6CtVLjeHv/l+jjf
 Gn+u/UTAwRzM6FDvAgg9d0NTJ7YVv1PUhUh4o7Oef2D0/oy9gRLgSZySdD/FY7vDkd
 jiaqqcPSP9q+CeYIsL9rzJiRT31mzbblOd1QI0kgWwhVF9F4aDycEcEJNGegu6/IXC
 evH48lVPmtChv3oApXidfas2ol2QQz5xrbRK/ZoZ2thMFLMgK1DnZxBEOMFcwD0aqp
 o+9VH4sfgqZ3pz0hw75bOq6/JNnvHNFu9lcqyd9p+3tAml+31Su+f1nkctUTF+9zbO
 Es2KGuQ0YsYbItOsN84vnN2E=
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7b90740249dso5328710b3a.0
 for <apparmor@lists.ubuntu.com>; Sun, 07 Dec 2025 00:44:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765097051; x=1765701851;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RaLR5hegrCH3Jg8Uw/361tsJ3PyXIqeRrVTsGyOxw1M=;
 b=rfremL4Iy4bXTw+N9wP+qADMe2jOV7y3JLhpkFHIFOVuM9GkDpAzxTAKkkIYUrLsnW
 NEyzHVPpJeIRKZyO7gn/dojQDfZdFJcHvvuD++D33aJxMZ7wDDwKwCEG3Ahz2URaxFeW
 FVhoZKYJWaitgDkRYrdh4m71ASIOg91NwKu0K4R1keexZdFIRtRWC50Ky5uSQHB2Oy8X
 RnuY6c7mMlX5FGHOfAE3i1fyY3YMu+BXLtbfhcrxUdy4lFhQeull15ONkX8VF0Ly3zn2
 FyiBdCeYisHSb6rN1Hw6So0aep65Ocs9fyIyg5sIb79FMZjtG1I2hFnD14ajZ+Wiio2Y
 VJZA==
X-Gm-Message-State: AOJu0YwbV7SMDSQJ/bzxtOmQ0Z3T0V1XtTp89uYlgTLZTR9gF6dt3mzN
 1ibr24rlqZ8+u1gI+nKmlphP8rBilLWcaelY84FQK7kqPV7sC9T0+vjuiBCFNY6v+RMMpc1hZSh
 F3GHOsM3pnYdyqbQD72qSDjUf5CnhDW2X1n7HPFc28mhfaPtM8iNpuiN0aqd56xP0DVIiPWiAy5
 eQHQ1+5qkMBA==
X-Gm-Gg: ASbGncu7NGBmzOapLPG4n2YsHJBO0BlCOgXJy7F5J2XEdZIQ7zedxSN9OlCFdY9vgRJ
 mliOcLG//KfdWw9veZwhuJfpeaTxX8YYFkYe3aRhuKhM7NLqrHvLldjP3S48TKkAd0D7raESxE6
 E5Y56ZXt9hjcmRPOGNweiyoeviZZBvZlMCrJCjmkm4IsXSeE3ZBp9oS9yQVEnFTq3gDIqVim4oD
 bOPP72ZdsDng93ASvjOmHVXbs4QuMV3RacEScJBOMC+R7KGuklCZeJZzTdjbdhmx1jjRHtVYgZ/
 iBdFRPzAO47Sr+UeG3ptTKZH7d6sT6K4WEBdgry3Rz6r74ZxSAOW69GkKMujiencNdiwn8dMRis
 fqymR5/vbw6gRx4bOs7rOtHeW
X-Received: by 2002:a05:6a00:a13:b0:792:f084:404f with SMTP id
 d2e1a72fcca58-7e8bb35f842mr4153187b3a.0.1765097050975; 
 Sun, 07 Dec 2025 00:44:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGf0Q9sXLws/tOnSUBZvZenrz0QcQXPR5KZFEfOpgmpb6CBe9DrVDtN1ljufmXJALrbSkIe+g==
X-Received: by 2002:a05:6a00:a13:b0:792:f084:404f with SMTP id
 d2e1a72fcca58-7e8bb35f842mr4153178b3a.0.1765097050507; 
 Sun, 07 Dec 2025 00:44:10 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7e7ecb848c8sm5157728b3a.9.2025.12.07.00.44.09
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Dec 2025 00:44:09 -0800 (PST)
Message-ID: <cd425800-a81b-494b-a51d-2d439e886063@canonical.com>
Date: Sun, 7 Dec 2025 00:44:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <7950efda-5bbf-4e50-96ff-a7c80c21ea56@app.fastmail.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <7950efda-5bbf-4e50-96ff-a7c80c21ea56@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] Questions about compat encoding in accept1 and
 accept2 tables
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

On 12/4/25 07:03, Zygmunt Krynicki wrote:
> Hello!
> 
> I've been trying to document some of the bit-patterns and magic values present in the code. Looking at the macros dfa_{user,other}_{allow,xbits,audit,quiet,xindex} in security/apparmor/policy_compat.c, defined as follows:
> 
> #define dfa_user_allow(dfa, state) (((ACCEPT_TABLE(dfa)[state]) & 0x7f) | \
>                                      ((ACCEPT_TABLE(dfa)[state]) & 0x80000000))
> #define dfa_user_xbits(dfa, state) (((ACCEPT_TABLE(dfa)[state]) >> 7) & 0x7f)
> #define dfa_user_audit(dfa, state) ((ACCEPT_TABLE2(dfa)[state]) & 0x7f)
> #define dfa_user_quiet(dfa, state) (((ACCEPT_TABLE2(dfa)[state]) >> 7) & 0x7f)
> #define dfa_user_xindex(dfa, state) \
>          (dfa_map_xindex(ACCEPT_TABLE(dfa)[state] & 0x3fff))
> 
> #define dfa_other_allow(dfa, state) ((((ACCEPT_TABLE(dfa)[state]) >> 14) & \
>                                        0x7f) |                           \
>                                       ((ACCEPT_TABLE(dfa)[state]) & 0x80000000))
> #define dfa_other_xbits(dfa, state) \
>          ((((ACCEPT_TABLE(dfa)[state]) >> 7) >> 14) & 0x7f)
> #define dfa_other_audit(dfa, state) (((ACCEPT_TABLE2(dfa)[state]) >> 14) & 0x7f)
> #define dfa_other_quiet(dfa, state) \
>          ((((ACCEPT_TABLE2(dfa)[state]) >> 7) >> 14) & 0x7f)
> #define dfa_other_xindex(dfa, state) \
>          dfa_map_xindex((ACCEPT_TABLE(dfa)[state] >> 14) & 0x3fff)
> 
> I came up with a C type definition, ignoring undefined ordering of bitfield encoding, for a conceptual structure with the two accept fields:
> 
> struct packed_perms {
>    union {
>      accept1 uint32_t;
>      struct {
>        union {
>          struct {
>            user_allow uint32_t : 7;
>            user_xbits uint32_t : 7;
>          };
>          user_xindex uint32_t : 14;
>        };
>        union {
>          struct {
>            other_allow uint32_t : 7;
>            other_xbits uint32_t : 7;
>          };
>          other_xindex uint32_t : 14;
>        };
>        _ uint32_t : 3;
>        change_profile uint32_t : 1; // allow bit shared between user and other.
>      };
>    };
>    union {
>      accept2 uint32_t;
>      struct {
>        user_audit uint32_t : 7;
>        user_quiet uint32_t : 7;
>        other_audit uint32_t : 7;
>        other_quiet uint32_t : 7;
>        _ uint32_t : 4;
>      };
>    };
> };
> 
> The following is true for kernel ABI v9+:
> 
> What strikes me is the overlap of the user_{allow,xbits} with the user_xindex field. All seven bits of user_allow are meaningful - as they encode "exec", "write", "read", "append", "link", "lock" and "exec-map". The user_xbits field is only used by map_xbits which effectively bitwise-ands it with the mask 0xfc80, or in binary 0b1111_1100_1000_0000. This selects the highest bit (exec-map) and a the upper six bits of user_xbits itself. The result is interpreted as the full 32bit permission set bit-map so the bits correspond to "rename" (0x80), "set-creds" (0x400), "get-creds" (0x800), "chmod" (0x1000), "chown" (0x2000), "chgrp" (0x4000) and "lock" (0xx8000) - all granted to aa_perms.allow.
> 
> How is this co-inhabited with xindex which uses the very same bits to derive, among other, an index into the transition table?
> 
The file state machines accept1/2 mapping uses a different encoding than the newer policydb which uses a flatter mapping. The policydb originally skipped the "xbits" due to limitations in the compiler, but once that limitation was fixed those bits started to be used. Internally (and then externally via perms table 32) the kernel moved to mapping these to a permission table, with accept 1 becoming an index into the table. The kernel does a mapping for both the file and policydb accept table permissions to the permission table.
Originally the 7 xbits encoded the exec type + the xindex (up to 12 entries) but only if the xtable type was set in the xbits. With the new mapping moving permissions from the accept tables to an external wider permission table, the xbits get remapped to a 32 bit entry with 8 bits being used for type info, and up to 24 being used for xindex.

The bits previously used by the 7 xbits are used for other permissions in the 32 bit fields. We actually have the start of a doc around this

https://gitlab.com/apparmor/apparmor/-/blob/master/documentation/Permission%20Layout.pdf?ref_type=heads





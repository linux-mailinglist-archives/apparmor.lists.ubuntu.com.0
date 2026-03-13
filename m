Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIdfLDd8s2lmXAAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 13 Mar 2026 03:53:43 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F1827CF01
	for <lists+apparmor@lfdr.de>; Fri, 13 Mar 2026 03:53:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w0seb-00081k-LZ; Fri, 13 Mar 2026 02:53:33 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1w0sea-00081V-3A
 for apparmor@lists.ubuntu.com; Fri, 13 Mar 2026 02:53:32 +0000
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DAFCB3F642
 for <apparmor@lists.ubuntu.com>; Fri, 13 Mar 2026 02:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1773370411;
 bh=036J7FAh9dW5Rw7p36KeFieANi2+44T6lLXY1uy7fLw=;
 h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type;
 b=J3U9WxWIhoXyXFHCOzeaT6mNhXEQiyPDg6l1v8mK610BPmNCY2eZw6Y34JTanAOx9
 GJzbhoy9tOGSLi4b/NeVwB27qKRB17FjrWA48OuPCpspaugNoSzZOhGRZgU3MI9MGy
 HCbb4KGNR1tUrp9nh81ASS7jWY+Wb4hBpjaDxVI86STIY0QCubZNiqye/9DvleHG9D
 o7BdvLeqcPu5LEw7bl6Zy4h81wZDM2MOtHbFTnVVtAKYX1GLXT6yUvVfB5ZA4sr/wI
 Wc0lJM7pqUIICmKVaaydEFW4Xpk31z67wolyEvjsgsZBT6CQOEzgWCqDI7MJIaczd7
 LUtUO472cvEkZos7/0FFTtdu8tUAqyQcFdDW1NIeHgBr2ZlHb9NLqfrxgtApk0xd/v
 5QDpjb8LOv9GFMeFD7cKsnGiA62IKVbnJRXO9GfdepAHIn94OZv8vmmbFeP38aCRIe
 eDAC9CNVwbyAxvjPLzFSjm0MDI7Mj8q4Pzx0hdc5C4ORPCkB4X2AqfUJXJSJc2TV83
 eljXSriCdFLbTE3FEKa9Dh3uzYp13LEGi+K/NNAzD7ZY0v+uvOkvMgIJTYbXbb6B1z
 1W2Zigi9c8w3CklFhISaEaiCMomAIq6MUhmkHEI070Yy7GKWcWEZBc1LXwG9nUnZ6N
 NDU6F8WbJYyD3zzYcmJygTJM=
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2aec8d85199so4231575ad.0
 for <apparmor@lists.ubuntu.com>; Thu, 12 Mar 2026 19:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773370410; x=1773975210;
 h=content-transfer-encoding:organization:autocrypt:subject:from:to
 :content-language:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=036J7FAh9dW5Rw7p36KeFieANi2+44T6lLXY1uy7fLw=;
 b=iyURQ1sqexQwwxuQu+bXkU2j9kbEChiVX9vr6BGtGFv9yqOOmkFrJOdQrOwCRmKv3A
 cF0nrt44V4zNJcBmccLMx4UBaSgwfHxvK7Vpr4DICgVK6+QH+110ojuHgezagO87IBhF
 IrbG9abHYsApn46ajkZMT5/ySU3Yiy4kUGB2fOeJhgB0xo3x1Q9gyCl2Qw/I88/7+ICc
 Xatqx2M7+8woa6D0IazSySU7yNPXlICUoB6kXtOA1Z3U2BLwB6eTjjSZZUcGk6+tkNRU
 gTyuZrUaUxXrymjyirXqq7s7FX0jXVv37eKJgor/A23P02ZOr15toxTs1pU5hur6qJOA
 8ZYQ==
X-Gm-Message-State: AOJu0YzcrGeaNbnkqpawcFz/YEgAwZWk36s0jCYwvhdl0dFogUualAi0
 ON4UY/rhRkmhSl44LUjznsqYcrOMWSo0YTrra8zMBkn+HnhCSwn95QhX9pdVzbNs/8sKuGAT8zg
 fVBa1wWFBCUkMy9fvk167DEp1VAqWB1YI1m8N1xd5zdTW9Glrv9GweUz+7VLoUg+KWzwGpPzBhg
 bzYUTQdpriEg==
X-Gm-Gg: ATEYQzzY/gvumpfeoZex/NVrXnRvCqnQK9Ykfl1IefPmJ8k4vmUC7qQD5rnrez+xLW/
 RtIflQXdBPTIRaEwYJ1EGXYgKnRoDTolEmktGtVkQEnDBnSEaL7mpWWbkThWsmrEE9Hy5vMUpRW
 JNXKsA/WtoJ9IyTCmSYrOPYimXICPVvnXL5CXh2u6A38Jd4+FbpnTsh4FAwhAYRu0m32+4NeiiF
 edLbZDd+qWGZ6uA9JviXqQVKnqgNYYd70txzmidovdZwywkB5Z4iAYiwelLsSmYoAzxR4rcr+KD
 Bw35y2SnVgeVdrv/NIJhO+zRWCrKPDUHI0si5gRSOoPVuEnWd/gg17fYoxuJNINl+tUf8laxbO0
 EngaYaZLYhTwwHMVreAnTngsv+75Rw2kywR4/QQ==
X-Received: by 2002:a17:902:ec88:b0:2ad:da28:8c7a with SMTP id
 d9443c01a7336-2aeca5008a5mr14898205ad.8.1773370409982; 
 Thu, 12 Mar 2026 19:53:29 -0700 (PDT)
X-Received: by 2002:a17:902:ec88:b0:2ad:da28:8c7a with SMTP id
 d9443c01a7336-2aeca5008a5mr14898055ad.8.1773370409417; 
 Thu, 12 Mar 2026 19:53:29 -0700 (PDT)
Received: from [192.168.192.85] ([50.39.102.197])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2aece56cca6sm5153625ad.3.2026.03.12.19.53.28
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 19:53:29 -0700 (PDT)
Message-ID: <6a9a4314-9be6-421e-8276-7a3d93c7bf78@canonical.com>
Date: Thu, 12 Mar 2026 19:53:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: apparmor <apparmor@lists.ubuntu.com>
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] AppArmor user's please update your kernels immediately
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
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[canonical.com:-];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.907];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 58F1827CF01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualys has performed a security audit on AppArmor, and discovered
several issues, covered the the following advisories

https://ubuntu.com/security/vulnerabilities/crackarmor
https://cdn2.qualys.com/advisory/2026/03/10/crack-armor.txt

There is a local privilege escalation that can only be
fully addressed by either updating your kernel or disabling apparmor.

patches have been merged into the main line kernel,

8e135b8aee5a0 apparmor: fix race between freeing data and fs accessing it
a0b7091c4de45 apparmor: fix race on rawdata dereference
39440b137546a apparmor: fix differential encoding verification
6601e13e82841 apparmor: fix unprivileged local user can do privileged policy management
5df0c44e8f5f6 apparmor: Fix double free of ns_name in aa_replace_profiles()
d352873bbefa7 apparmor: fix missing bounds check on DEFAULT table in verify_dfa()
8756b68edae37 apparmor: fix side-effect bug in match_char() macro usage
306039414932c apparmor: fix: limit the number of levels of policy namespaces
ab09264660f9d apparmor: replace recursive profile removal with iterative approach
e38c55d9f834e apparmor: fix memory leak in verify_header
9063d7e2615f4 apparmor: validate DFA start states are in bounds in unpack_pdb

backports have also been sent to the linux-distros security lists, and
the patches are rolling out to the stable, and long term release trees

Many distros already have kernel updates available.


We would like to thank Qualys for the initial report and their detailed
and tireless work on this.

The Linux kernel security team, the linux distros list for its support,
and the distros and individuals who providing testing, review and
feedback. There have been many people who have worked tirelessly to
fix, test, debug, and coordinate these updates to address these issues.


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E91766698
	for <lists+apparmor@lfdr.de>; Fri, 28 Jul 2023 10:13:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qPIbK-0002CQ-1f; Fri, 28 Jul 2023 08:13:30 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <matthieu.baerts@tessares.net>) id 1qP4uH-0004a7-C6
 for apparmor@lists.ubuntu.com; Thu, 27 Jul 2023 17:36:09 +0000
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-317786befa2so1257009f8f.3
 for <apparmor@lists.ubuntu.com>; Thu, 27 Jul 2023 10:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares.net; s=google; t=1690479369; x=1691084169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nZEdmXcGRVAYlxfEgnvOAfccfUnHNgUdBg+5krTA/eo=;
 b=140/ZYZn5bDqKWf+wtgvTuFeQqiCVUSA/6Q5OO7O0WeKyYsRVQMbnTuopDsK2fxe2p
 KLlyVMs5Zmtc/7UktSC3SpLCTEW/vdXLPvuFm5rxdQWHlUPJHFGUA+7+xXdsKl6AGPdj
 q4OJM/afLGrRgpOns2Z/bywNyao9qTe3Zm2kedU5th8Vzt5qv9z24IG8JI6LARbKoSy8
 Z7/LpOQafS6os04kr+lECyuqzVDEzbnEFVJAe9gqo9niWc6n57MhGFUkvDlErwhQLKCH
 1ZkrfgVwdaxa851gtWNyCHRnGJ/xZNu462YAT+niCH1guBT2WAIPvzkldt6z8Xt3eEnB
 pLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690479369; x=1691084169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nZEdmXcGRVAYlxfEgnvOAfccfUnHNgUdBg+5krTA/eo=;
 b=RFvSCGvJeW+znj5ivb3QBwV7bCUsWi9pVPJ7tjhzS/IoojPlisBt6Sh9/L0wp9DdwG
 Tz7A/vcynnFS94M6Rd5FXxcCcGTeTim5jv1srgBB1cZew3nyV/BZkeciuR/exa1OYK5m
 uVX+vDS71ggBcyZ7IVHP0wE5x+5KoOHMtN9R1txpTDEDt4kkDaIVPmCPXNqh/3F75hZK
 3kxhIBl0Tcl1s8FDP2YCOmtJPD2Ng3Ck2CrKaDF/KfCSmzcdpGQjiPaGm36umTQuK44n
 uqnVIZCqF6WNCgeRvob+UkpliaMaw2ZceeDRW647ef542gXHTzOos/yzDyVncbzaIWhT
 3OaQ==
X-Gm-Message-State: ABy/qLY7SBKu5a1VwKSMnBeNsFUn+YLYojgND31WZuN5DYojxbGkZwuP
 kYUarb4t7VseYS0Klbslhpz02Q==
X-Google-Smtp-Source: APBJJlGMk1Xbashk7NwJvWkofxfajDTbQ+0ipK5s7hbscVG6QYWNuqzGkgAhhPffQxv2ODQ5lOiWAw==
X-Received: by 2002:a5d:45d2:0:b0:313:fe1b:f441 with SMTP id
 b18-20020a5d45d2000000b00313fe1bf441mr2253468wrs.29.1690479368727; 
 Thu, 27 Jul 2023 10:36:08 -0700 (PDT)
Received: from ?IPV6:2a02:578:8593:1200:e411:185b:7f55:ef18?
 ([2a02:578:8593:1200:e411:185b:7f55:ef18])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a5d4b8a000000b003175f00e555sm2560128wrt.97.2023.07.27.10.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 10:36:08 -0700 (PDT)
Message-ID: <b41babb1-f0f2-dc2f-c2e3-1870107fbd9f@tessares.net>
Date: Thu, 27 Jul 2023 19:36:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Paul Moore <paul@paul-moore.com>, Geliang Tang <geliang.tang@suse.com>,
 Stanislav Fomichev <sdf@google.com>
References: <3076188eb88cca9151a2d12b50ba1e870b11ce09.1689693294.git.geliang.tang@suse.com>
 <CAHC9VhS_LKdkEmm5_J5y34RpaRcTbg8==fpz8pMThDCjF6nYtQ@mail.gmail.com>
From: Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <CAHC9VhS_LKdkEmm5_J5y34RpaRcTbg8==fpz8pMThDCjF6nYtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Jul 2023 08:13:29 +0000
Subject: Re: [apparmor] [RFC bpf-next v5] bpf: Force to MPTCP
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
Cc: selinux@vger.kernel.org, netdev@vger.kernel.org, apparmor@lists.ubuntu.com,
 Alexei Starovoitov <ast@kernel.org>, linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, mptcp@lists.linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi Paul, Stanislav,

On 18/07/2023 18:14, Paul Moore wrote:
> On Tue, Jul 18, 2023 at 11:21 AM Geliang Tang <geliang.tang@suse.com> wrote:
>>
>> As is described in the "How to use MPTCP?" section in MPTCP wiki [1]:
>>
>> "Your app can create sockets with IPPROTO_MPTCP as the proto:
>> ( socket(AF_INET, SOCK_STREAM, IPPROTO_MPTCP); ). Legacy apps can be
>> forced to create and use MPTCP sockets instead of TCP ones via the
>> mptcpize command bundled with the mptcpd daemon."
>>
>> But the mptcpize (LD_PRELOAD technique) command has some limitations
>> [2]:
>>
>>  - it doesn't work if the application is not using libc (e.g. GoLang
>> apps)
>>  - in some envs, it might not be easy to set env vars / change the way
>> apps are launched, e.g. on Android
>>  - mptcpize needs to be launched with all apps that want MPTCP: we could
>> have more control from BPF to enable MPTCP only for some apps or all the
>> ones of a netns or a cgroup, etc.
>>  - it is not in BPF, we cannot talk about it at netdev conf.
>>
>> So this patchset attempts to use BPF to implement functions similer to
>> mptcpize.
>>
>> The main idea is add a hook in sys_socket() to change the protocol id
>> from IPPROTO_TCP (or 0) to IPPROTO_MPTCP.
>>
>> [1]
>> https://github.com/multipath-tcp/mptcp_net-next/wiki
>> [2]
>> https://github.com/multipath-tcp/mptcp_net-next/issues/79
>>
>> v5:
>>  - add bpf_mptcpify helper.
>>
>> v4:
>>  - use lsm_cgroup/socket_create
>>
>> v3:
>>  - patch 8: char cmd[128]; -> char cmd[256];
>>
>> v2:
>>  - Fix build selftests errors reported by CI
>>
>> Closes: https://github.com/multipath-tcp/mptcp_net-next/issues/79
>> Signed-off-by: Geliang Tang <geliang.tang@suse.com>
>> ---
>>  include/linux/bpf.h                           |   1 +
>>  include/linux/lsm_hook_defs.h                 |   2 +-
>>  include/linux/security.h                      |   6 +-
>>  include/uapi/linux/bpf.h                      |   7 +
>>  kernel/bpf/bpf_lsm.c                          |   2 +
>>  net/mptcp/bpf.c                               |  20 +++
>>  net/socket.c                                  |   4 +-
>>  security/apparmor/lsm.c                       |   8 +-
>>  security/security.c                           |   2 +-
>>  security/selinux/hooks.c                      |   6 +-
>>  tools/include/uapi/linux/bpf.h                |   7 +
>>  .../testing/selftests/bpf/prog_tests/mptcp.c  | 128 ++++++++++++++++--
>>  tools/testing/selftests/bpf/progs/mptcpify.c  |  17 +++
>>  13 files changed, 187 insertions(+), 23 deletions(-)
>>  create mode 100644 tools/testing/selftests/bpf/progs/mptcpify.c
> 
> ...
> 
>> diff --git a/security/security.c b/security/security.c
>> index b720424ca37d..bbebcddce420 100644
>> --- a/security/security.c
>> +++ b/security/security.c
>> @@ -4078,7 +4078,7 @@ EXPORT_SYMBOL(security_unix_may_send);
>>   *
>>   * Return: Returns 0 if permission is granted.
>>   */
>> -int security_socket_create(int family, int type, int protocol, int kern)
>> +int security_socket_create(int *family, int *type, int *protocol, int kern)
>>  {
>>         return call_int_hook(socket_create, 0, family, type, protocol, kern);
>>  }
> 
> Using the LSM to change the protocol family is not something we want
> to allow.  I'm sorry, but you will need to take a different approach.

@Paul: Thank you for your feedback. It makes sense and I understand.

@Stanislav: Despite the fact the implementation was smaller and reusing
more code, it looks like we cannot go in the direction you suggested. Do
you think what Geliang suggested before in his v3 [1] can be accepted?

(Note that the v3 is the same as the v1, only some fixes in the selftests.)

Cheers,
Matt

[1] https://lore.kernel.org/r/cover.1688631200.git.geliang.tang@suse.com
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 37573769F98
	for <lists+apparmor@lfdr.de>; Mon, 31 Jul 2023 19:39:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qQWrn-00082K-0B; Mon, 31 Jul 2023 17:39:35 +0000
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <matthieu.baerts@tessares.net>) id 1qQTO7-0000RP-1u
 for apparmor@lists.ubuntu.com; Mon, 31 Jul 2023 13:56:43 +0000
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2b74fa5e7d7so66644201fa.2
 for <apparmor@lists.ubuntu.com>; Mon, 31 Jul 2023 06:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares.net; s=google; t=1690811802; x=1691416602;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=//IuSF4aR8dDqdSUTPXRXM7wMeZmyHZKY6Im4lg/WZA=;
 b=LmkI7deeD2ks/5C8RN/irm6cJromc4pVohQqFgm+kYIyM/FhhiHSbwR/wZtwbsAZ3Y
 nhki4BBNcC4SYzhXv3w+vyXgnRyrS7U0A9AjcHduigl4wz3qK60pzT+Vaf22lkMNnXS5
 GArHH+YQttOEsMC9C0qVcKcHFkAiGz5MNM5I5n0fmWRsHxGz79bc0Tr8CD0/zAm9qsGP
 YtW2dyqPXFmRSfc8iiyhVjq211n8k2vMr8jdS4zOzLnPAxWsHwnTZ3kB2uV22HNnL9C5
 V7jbptUdpJjN/bAWZzMx7/xvbs/CEKgqpYUZ/I0G8V2A4HzFtx+y+LqbFvaB18dskmWs
 zf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690811802; x=1691416602;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=//IuSF4aR8dDqdSUTPXRXM7wMeZmyHZKY6Im4lg/WZA=;
 b=BN/R4BoAFJ/Chk9SK5KAp2rOBgAzte9WkjAKlOaSMK6zxCgIrKYdkNpCMST9sTFEmV
 bcabWttY6awcjp7gvasstgUTKaeQhpGfgCsD1ZjhJwj4dwH1/rGbGXwZtVFybinN8yRb
 KBOWK/GWVEzfVPL/2p51NUlPRI9YNBmqZWvkGuQTtDXazv/UMoQKY2cPAxT2P5NndSDE
 1Rej/L7WpZNMnz29fKpIzgRAWhhsJLlQtS4hAuGUYCAGd7XfpliEmdX54+bN3fT/WFjF
 DnH1vIfTv3Ic+8i5ByZkI5vCro7QgUJfl19L1S2rqta/LKrNQJrJWtOFmrI2iY7Dw1tj
 G0UA==
X-Gm-Message-State: ABy/qLbpwFVQ/CN9F3QxEozf7anoytSDUMqH/2ugh81zSVwRQONzmxOs
 /Kdu92txGDDIrLuvjC7yLGVJsA==
X-Google-Smtp-Source: APBJJlHKc9Sq7znL8pmKS0GHJT9fHimiY4SCiPYkbNF+F1H/EbJPFLhADxI0WinnSPbnG2LtV5voIQ==
X-Received: by 2002:a2e:8192:0:b0:2b6:dfef:d526 with SMTP id
 e18-20020a2e8192000000b002b6dfefd526mr39265ljg.11.1690811801505; 
 Mon, 31 Jul 2023 06:56:41 -0700 (PDT)
Received: from ?IPV6:2a02:578:8593:1200:98dd:e30:7e10:82aa?
 ([2a02:578:8593:1200:98dd:e30:7e10:82aa])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a1709061cc900b0099b5a71b0bfsm6226337ejh.94.2023.07.31.06.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 06:56:41 -0700 (PDT)
Message-ID: <b1f63c3f-5a26-4c69-af8f-216eaac19b69@tessares.net>
Date: Mon, 31 Jul 2023 15:56:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Stanislav Fomichev <sdf@google.com>
References: <3076188eb88cca9151a2d12b50ba1e870b11ce09.1689693294.git.geliang.tang@suse.com>
 <CAHC9VhS_LKdkEmm5_J5y34RpaRcTbg8==fpz8pMThDCjF6nYtQ@mail.gmail.com>
 <b41babb1-f0f2-dc2f-c2e3-1870107fbd9f@tessares.net>
 <ZMKxC+CFj4GbCklg@google.com>
 <1023fdeb-a45a-2e9e-cd2e-7e44e655e8fc@tessares.net>
 <ZMPyCt2uozns776Q@google.com>
From: Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <ZMPyCt2uozns776Q@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 Jul 2023 17:39:33 +0000
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
Cc: Paul Moore <paul@paul-moore.com>, selinux@vger.kernel.org,
 netdev@vger.kernel.org, apparmor@lists.ubuntu.com,
 Alexei Starovoitov <ast@kernel.org>, Geliang Tang <geliang.tang@suse.com>,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, mptcp@lists.linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi Stanislav,

On 28/07/2023 18:51, Stanislav Fomichev wrote:
> On 07/28, Matthieu Baerts wrote:
>> Hi Stanislav,
>>
>> On 27/07/2023 20:01, Stanislav Fomichev wrote:
>>> On 07/27, Matthieu Baerts wrote:
>>>> Hi Paul, Stanislav,
>>>>
>>>> On 18/07/2023 18:14, Paul Moore wrote:
>>>>> On Tue, Jul 18, 2023 at 11:21 AM Geliang Tang <geliang.tang@suse.com> wrote:
>>>>>>
>>>>>> As is described in the "How to use MPTCP?" section in MPTCP wiki [1]:
>>>>>>
>>>>>> "Your app can create sockets with IPPROTO_MPTCP as the proto:
>>>>>> ( socket(AF_INET, SOCK_STREAM, IPPROTO_MPTCP); ). Legacy apps can be
>>>>>> forced to create and use MPTCP sockets instead of TCP ones via the
>>>>>> mptcpize command bundled with the mptcpd daemon."
>>>>>>
>>>>>> But the mptcpize (LD_PRELOAD technique) command has some limitations
>>>>>> [2]:
>>>>>>
>>>>>>  - it doesn't work if the application is not using libc (e.g. GoLang
>>>>>> apps)
>>>>>>  - in some envs, it might not be easy to set env vars / change the way
>>>>>> apps are launched, e.g. on Android
>>>>>>  - mptcpize needs to be launched with all apps that want MPTCP: we could
>>>>>> have more control from BPF to enable MPTCP only for some apps or all the
>>>>>> ones of a netns or a cgroup, etc.
>>>>>>  - it is not in BPF, we cannot talk about it at netdev conf.
>>>>>>
>>>>>> So this patchset attempts to use BPF to implement functions similer to
>>>>>> mptcpize.
>>>>>>
>>>>>> The main idea is add a hook in sys_socket() to change the protocol id
>>>>>> from IPPROTO_TCP (or 0) to IPPROTO_MPTCP.
>>>>>>
>>>>>> [1]
>>>>>> https://github.com/multipath-tcp/mptcp_net-next/wiki
>>>>>> [2]
>>>>>> https://github.com/multipath-tcp/mptcp_net-next/issues/79
>>>>>>
>>>>>> v5:
>>>>>>  - add bpf_mptcpify helper.
>>>>>>
>>>>>> v4:
>>>>>>  - use lsm_cgroup/socket_create
>>>>>>
>>>>>> v3:
>>>>>>  - patch 8: char cmd[128]; -> char cmd[256];
>>>>>>
>>>>>> v2:
>>>>>>  - Fix build selftests errors reported by CI
>>>>>>
>>>>>> Closes: https://github.com/multipath-tcp/mptcp_net-next/issues/79
>>>>>> Signed-off-by: Geliang Tang <geliang.tang@suse.com>
>>>>>> ---
>>>>>>  include/linux/bpf.h                           |   1 +
>>>>>>  include/linux/lsm_hook_defs.h                 |   2 +-
>>>>>>  include/linux/security.h                      |   6 +-
>>>>>>  include/uapi/linux/bpf.h                      |   7 +
>>>>>>  kernel/bpf/bpf_lsm.c                          |   2 +
>>>>>>  net/mptcp/bpf.c                               |  20 +++
>>>>>>  net/socket.c                                  |   4 +-
>>>>>>  security/apparmor/lsm.c                       |   8 +-
>>>>>>  security/security.c                           |   2 +-
>>>>>>  security/selinux/hooks.c                      |   6 +-
>>>>>>  tools/include/uapi/linux/bpf.h                |   7 +
>>>>>>  .../testing/selftests/bpf/prog_tests/mptcp.c  | 128 ++++++++++++++++--
>>>>>>  tools/testing/selftests/bpf/progs/mptcpify.c  |  17 +++
>>>>>>  13 files changed, 187 insertions(+), 23 deletions(-)
>>>>>>  create mode 100644 tools/testing/selftests/bpf/progs/mptcpify.c
>>>>>
>>>>> ...
>>>>>
>>>>>> diff --git a/security/security.c b/security/security.c
>>>>>> index b720424ca37d..bbebcddce420 100644
>>>>>> --- a/security/security.c
>>>>>> +++ b/security/security.c
>>>>>> @@ -4078,7 +4078,7 @@ EXPORT_SYMBOL(security_unix_may_send);
>>>>>>   *
>>>>>>   * Return: Returns 0 if permission is granted.
>>>>>>   */
>>>>>> -int security_socket_create(int family, int type, int protocol, int kern)
>>>>>> +int security_socket_create(int *family, int *type, int *protocol, int kern)
>>>>>>  {
>>>>>>         return call_int_hook(socket_create, 0, family, type, protocol, kern);
>>>>>>  }
>>>>>
>>>>> Using the LSM to change the protocol family is not something we want
>>>>> to allow.  I'm sorry, but you will need to take a different approach.
>>>>
>>>> @Paul: Thank you for your feedback. It makes sense and I understand.
>>>>
>>>> @Stanislav: Despite the fact the implementation was smaller and reusing
>>>> more code, it looks like we cannot go in the direction you suggested. Do
>>>> you think what Geliang suggested before in his v3 [1] can be accepted?
>>>>
>>>> (Note that the v3 is the same as the v1, only some fixes in the selftests.)
>>>
>>> We have too many hooks in networking, so something that doesn't add
>>> a new one is preferable :-(
>>
>> Thank you for your reply and the explanation, I understand.
>>
>>> Moreover, we already have a 'socket init' hook, but it runs a bit late.
>>
>> Indeed. And we cannot move it before the creation of the socket.
>>
>>> Is existing cgroup/sock completely unworkable? Is it possible to
>>> expose some new bpf_upgrade_socket_to(IPPROTO_MPTCP) kfunc which would
>>> call some new net_proto_family->upgrade_to(IPPROTO_MPTCP) to do the surgery?
>>> Or is it too hacky?
>>
>> I cannot judge if it is too hacky or not but if you think it would be
>> OK, please tell us :)
> 
> Maybe try and see how it goes? Doing the surgery to convert from tcp
> to mptcp is probably hard, but it seems that we should be able to
> do something like:
> 
> int upgrade_to(sock, sk) {
> 	if (sk is not a tcp one) return -EINVAL;
> 
> 	sk_common_release(sk);
> 	return inet6_create(net, sock, IPPROTO_MPTCP, false);
> }
> 
> ?
> 
> The only thing I'm not sure about is whether you can call inet6_create
> on a socket that has seen sk_common_release'd...

Oh sorry, now I better understand your suggestion and the fact it is
hacky. Good workaround, we can keep this in mind if there is no other
solutions to avoid these create-release-create operations.

>>> Another option Alexei suggested is to add some fentry-like thing:
>>>
>>> noinline int update_socket_protocol(int protocol)
>>> {
>>> 	return protocol;
>>> }
>>> /* TODO: ^^^ add the above to mod_ret set */
>>>
>>> int __sys_socket(int family, int type, int protocol)
>>> {
>>> 	...
>>>
>>> 	protocol = update_socket_protocol(protocol);
>>>
>>> 	...
>>> }
>>>
>>> But it's also too problem specific it seems? And it's not cgroup-aware.
>>
>> It looks like it is what Geliang did in his v6. If it is the only
>> acceptable solution, I guess we can do without cgroup support. We can
>> continue the discussions in his v6 if that's easier.
> 
> Ack, that works too, let's see how other people feel about it. I'm
> assuming in the bpf program we can always do bpf_get_current_cgroup_id()
> to filter by cgroup.

Good point, that works too and looks enough!

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net


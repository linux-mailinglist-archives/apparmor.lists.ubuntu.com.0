Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOOOH7uQdmksSAEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 25 Jan 2026 22:52:59 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DC88282944
	for <lists+apparmor@lfdr.de>; Sun, 25 Jan 2026 22:52:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vk82H-0007Ct-IL; Sun, 25 Jan 2026 21:52:45 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vk82F-0007Ch-Jr
 for apparmor@lists.ubuntu.com; Sun, 25 Jan 2026 21:52:43 +0000
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 61C183F29A
 for <apparmor@lists.ubuntu.com>; Sun, 25 Jan 2026 21:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1769377963;
 bh=GpuBhyMkWunFWYUKeClwdi+dFrCT+hfVgtANcyitUZQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=ASyJs61ewjuY9U//35RU/F6SbcGEmR/bdzbt0mRRkbyyt03AKdhvCS5PHbFEmFwGV
 3j+/tiwh6NNhWDY3T0zOePku3AhKLxI56xAQ0nvwtlBXelnmbdrChqbH2IG828aotm
 BIqMsD++6gsYYlttUqR0sMxSI9DF8jwDzS3TItzQOiYjGiKWa0LcWSa0RF8EbU6yuB
 Pj4pOMCBtDrAM1MWR/q5vrIoyj5Rw0sFd7JDXxy47nU8Me4FQvAtYLVFxYgMImTvJI
 RsszEnavHO7tcT/bmaBy/V4bdF8/+rkjyiECQDaX69WfGhk1J+n+DkFjQgCSGe7LCZ
 qRRQZg4TueLGO8VvsXizAIpKuybThyJtHDj1aSwY4cAFI5rXenhydCAlj3/cxQbjsr
 PrVdWP7oibwM0SsEqQCnQ/pjAOrx3w4sCJBqhbnSqCgd9W3yGB0Oz/G8X6DOF3endY
 3szw2fmEFGqTHS4m7j4e+F6F+tIKV95bWzQe6/mFlbwySW5gMUNpl0yVDT0K2sgF7K
 dcQu00b7e2iJkpJVCnwRK9Q/EweHhWVt2oSctd3UUKXwpeW93YNbM+BXypvOTYYepS
 OS/4Lhn3nyX/MVbE0m5G0q1s4XwL+n8CmRCDy4+b3q4dGDigL7kI3n9AfeGe+WnJew
 m/hm8yMkjb8cmQ4R8+NGcnwU=
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-81f3fb8c8caso8379502b3a.1
 for <apparmor@lists.ubuntu.com>; Sun, 25 Jan 2026 13:52:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769377961; x=1769982761;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GpuBhyMkWunFWYUKeClwdi+dFrCT+hfVgtANcyitUZQ=;
 b=VLL/PMenovL5s/t3UZxnSq4yn3m+Nprvq87n1DQkRHv3Hn7aGdrGxCL3nd+9QBvzEK
 Oi6GzMuzwAPhet3alM9LtLtXBcKUSw+U6xhdZcl7ONskm1OL68YLjEtDKs3Z9FB03O6H
 /gb6GiNRIhDh21/NANNCRqSti2clh4ITj72c+Ol5n3O+EaZFP1ZVwwzUFy2zn5w8WWgs
 Gh/05js8tMNHOxzWSg/Jn1GeEGLQO2msmjYviVYUqkCCk/3LawQTz/b8/4pYmVv0ENYc
 7IjsjaSUgfVLskSLcG4YVaEpR9K5BgYqHJF3tfN5V9PEj4Wt7ZvWKgFaSTDuk2tvVpSq
 SeSw==
X-Gm-Message-State: AOJu0YzzfMu64PUtYX15qmAwuclwzcinF/JPmnDsqwZo3+utS8TPIRe3
 90WrohfTc/IL43SXX2SSv90kZJPMynH3TpuaSLemRXyZY/aDgi7b4l/NQ967AHDCKc6KV73R0cF
 U3ilx85qWWdgQ83ysRSx/M2XDgHJLdckg5FPCy53MP8ivvLz/w65QWmXa7LwEY6bcxlK6/6Y2Zn
 mIklPI9lpezQ==
X-Gm-Gg: AZuq6aI8YKWq5HpjgFHhcQZ/D5fJjMU8hF5hB9IcEbzOfUmfKbFA0HtToTxPbAoQjCE
 TIqg4LVF1C2PWArdzN2inrlzFZEu4C7LdxJjnpuIIwEtWOg9JJ4x74Zd3dvLbYLPEODm/KLJrwP
 xB3ZtKdTnSxTXYXTWQOOnFUXUNZWsUnRAcD5NA9xO4RS1MA/Co+2413aRWlxlmPGNPm0LyEsy1i
 PuRe2svrcnPAEdANB7uvRymFlvgbW8ld82D1joOTvRKsVsf5RaaIRsjwJdQh1bjgMpl02xWRA+4
 1c3IpzFp7xASj6d6lNFQsAh2YZaEEB9ai4FOb9aBnOLI3mXEVjGY3VeAypGDnPQUXBJB8InxQPV
 3IS3DCL+HkBOzPA61MdiFVvLk
X-Received: by 2002:a05:6a00:14d5:b0:823:943:391b with SMTP id
 d2e1a72fcca58-823412d7d2amr1973347b3a.60.1769377961559; 
 Sun, 25 Jan 2026 13:52:41 -0800 (PST)
X-Received: by 2002:a05:6a00:14d5:b0:823:943:391b with SMTP id
 d2e1a72fcca58-823412d7d2amr1973343b3a.60.1769377961178; 
 Sun, 25 Jan 2026 13:52:41 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-8231873e763sm7567047b3a.55.2026.01.25.13.52.39
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jan 2026 13:52:40 -0800 (PST)
Message-ID: <45d32fe0-714e-4964-a943-d04ad22acec0@canonical.com>
Date: Sun, 25 Jan 2026 13:52:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <034d652f-ebdc-4d9a-8f7f-05c5596b23e5@ijzerbout.nl>
 <e4903a39-6883-43ad-90e7-824c035e6d52@canonical.com>
 <429c6e60-8ac7-43ce-a28c-02d29c26e63f@ijzerbout.nl>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <429c6e60-8ac7-43ce-a28c-02d29c26e63f@ijzerbout.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] Need assistance with DENIED userns_create for
 non-root podman inside an Incus container
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
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:mid,canonical.com:dkim,gitlab.com:url,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: DC88282944
X-Rspamd-Action: no action

On 1/25/26 06:23, Kees Bakker wrote:
> Op 25-01-2026 om 04:44 schreef John Johansen:
>> On 1/24/26 07:37, Kees Bakker wrote:
>>> Hi,
>>>
>>> My setup is a Ubuntu24 with an Incus server (6.20).
>>> One Incus container runs Fedora 43 where I want to run non-root podman.
>>>
>>> Inside the container
>>>
>>> [root@f43 ~]# sudo -u fedora -i
>>> [fedora@f43 ~]$ podman run -t -i hello-world
>>> cannot clone: Permission denied
>>> Error: cannot re-exec process
>>>
>>> On the Ubuntu24 host I see this in journalctl
>>>
>>> jan 24 16:33:41 rapper kernel: audit: type=1400 audit(1769268821.264:1554): apparmor="DENIED" operation="userns_create" class="namespace" info="Userns create restricted - failed to find unprivileged_userns profile" error=-13 namespace="root//incus-f43_<var-lib-incus>" profile="unconfined" pid=2332667 comm="podman" requested="userns_create" denied="userns_create" target="unprivileged_userns"
>>>
>>> My question, what do I have to do on the Ubuntu24 server to allow running non-root podman?
>>> Any help or suggestion is greatly appreciated.
>>
>> you are encountering the unprivileged user namespace restriction(1-5).
>>
>> You either need to confine the container, giving access to user namespaces, or you need to disable the restriction.
>>
>> to temporarily disable you can do
>>
>>   sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0
>>
>> to permanently disable
>>
>>   sudo bash -c "echo kernel.apparmor_restrict_unprivileged_userns=0 > /etc/sysctl.d/60-apparmor-namespace.conf"
>>
>>
>>
>> 1. https://gitlab.com/apparmor/apparmor/-/wikis/unprivileged_userns_restriction
>> 2. https://discourse.ubuntu.com/t/understanding-apparmor-user-namespace-restriction/58007
>> 3. https://discourse.ubuntu.com/t/plucky-puffin-release-notes/48687
>> 4. https://ubuntu.com/blog/ubuntu-23-10-restricted-unprivileged-user-namespaces
>> 5. https://discourse.ubuntu.com/t/spec-unprivileged-user-namespace-restrictions-via-apparmor-in-ubuntu-23-10/37626 
> 
> 
> A few months ago there was a discussion [1] about an identical problem. Two suggested solutions were:
> 
> # Manually create the unprivileged_userns profile, by using AppArmor on the host. Something like
> |sudo apparmor_parser -n 'incus-mycontainer_<var-lib-incus>' -r /etc/apparmor.d/unprivileged_userns|
> # Use your own AppArmor profile, with |raw.apparmor = profile|
> 
> So far I don't quite understand how to do either of the two.> Perhaps the above apparmor_parser isn't quite correct.
> 

the unprivileged_userns profile is special in that if present it is
the default profile that unconfined will transition to when it tries
to create a userns. The unprivileged_userns profile provided by
upstream and ubuntu grants broad privileges (like unconfined) but
strips capabilities from the container.

This allows user namespaces to be created, but not have privilege
within the container which is not what incus/lxd want. Adding the
ability to have capabilities in the container is a half step to
disabling the unprivileged user namespace restriction.  In that it
allows any unprivileged unconfined host application to create a user
namespace and have privilege within the user namespace.

Depending on how the container is setup, the unprivileged user
namespace restriction may still apply to unprivileged applications in
the container.

Generally speaking I wouldn't recommend modifying the
unprivileged_userns profile.  As that will group your containers in
with other applications, that would use that profile. Which can result
in ipc restrictions, and can also lead to issues with passing files
from the host to the container.

You are better off either

1. making an unconfined profile for your container, for selectively
    disability the restriction on your container. This profile can
    potentially be used to by-pass the restriction by other applications,
    see the Qualys three by-passes reference, but it is local so an
    attacker would have to know to look for it.

    profile mycontainer flags=(unconfined) {
       # required to allow unconfined to create userns's without
       # being subject to the restriction
       allow userns,
    }

2. disable the unprivileged user namespace restriction, as
    mentioned previously.


You could of course, confine the container with a full profile, but
that is going to be more work, and not something I recommend unless
you are more familiar with apparmor, and profiling.

The advantage of using an unconfined profile, or disabling the
restriction is that unconfined atm is the only part of apparmor
currently allowed to do object (fd) delegation which makes dealing
with things like containers a lot easier. This ability will come to
regular profiles, but getting all the pieces ready is still a wip.


> Also, when I create an Incus container with Ubuntu24 AND if I then install apparmor I can
> run rootless podman.
> 

right. Unprivileged user namespaces are kind of a double edged
sword. The are useful and can increase security when used correctly,
but they also open some kernel interfaces to unprivileged users, and
that has been used as the base for many root exploits. To be clear the
bugs exploited, aren't usually in unprivileged namespaces per say but
in other kernel subsystems that unprivileged user namespaces make
available.

You can use rootless podman, in an Incus container, or straight on the
host. With the restriction enabled you need to confine podman with a
profile that allows it to user the unprivileged user namespace. This
tells AppArmor that this is a known good application and to trust it.

> On the host, in the output of "aa-status --filter.mode=unconfined" there is
> 
>     :incus-dawarich_<var-lib-incus>:podman
>     :incus-forgejo-runner_<var-lib-incus>:podman
> 
> BTW In apparmor documentation I couldn't find what the meaning of the ":" is.
> 

it identifies an apparmor policy namespace. The name between the two
colon's is the namespace name. In this case its helps identify that it
has been setup by incus. Its possible it could be a random unique
identifier, but it really helps when who ever setups a namespace gives
it a name that helps identify it.

So in breaking down the above,

policy namespace = incus-forgejo-runner_<var-lib-incus
profile in the policy namespace = podman

The policy namespace allows the container to have its own set of
profiles that don't interact/interfere with the hosts profiles.

If you use aa-status within the container, you will find that it only
reports (ie. does not include the namespace)

   podman

this is because the container can not see the hosts policy or that it
is in a policy namespace.

> The thing is, I want Fedora43 in the Incus container to run podman.
> Fedora has no apparmor.
> 

right, it doesn't need to have apparmor, but you could install
apparmor if you really want.

How it will work is Fedora in the container will use the Ubuntu kernel
and boot with selinux disabled. As long as the unprivileged user
namespace restriction is disabled, there won't be any apparmor policy
loaded in the container, so podman should run as unconfined. While
Fedora in the container doesn't have aa-status, you can use ps -Z to
check this.

The caveat here is that the restriction needs to be disabled, you
can't just confine the container. The reason for this is atm the
restriction is globally enabled/disabled for unconfined (being able to
toggle it per ns is coming).  When applications are placed into a
policy namespace they will use the profiles in that namespace
including, a policy namespace specific version of unconfined.

This means unconfined applications within the container will have the
restriction applied unless, the host has disabled it.  There is a
caveat here, around apparmor confinement on the container.  Currently
the unprivileged user namespace restriction is not being performed

But if you disable the restriction on the host rootless podman in the
Fedora container should just work.




> [1] https://discuss.linuxcontainers.org/t/error-with-rootless-podman/24250/9
> 



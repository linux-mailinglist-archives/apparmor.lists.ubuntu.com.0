Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HDpWHo0Hdml3KwEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 25 Jan 2026 13:07:41 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F251380743
	for <lists+apparmor@lfdr.de>; Sun, 25 Jan 2026 13:07:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vjytk-00073Y-CU; Sun, 25 Jan 2026 12:07:20 +0000
Received: from bout4.ijzerbout.nl ([91.99.166.32])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <kees@ijzerbout.nl>) id 1vjyti-00072y-Q1
 for apparmor@lists.ubuntu.com; Sun, 25 Jan 2026 12:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
 t=1769342838; bh=MxzEKi06xfeVctcJCvrOZfXwOULBPXEV7rjxyr5Su0k=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=aP2iPEDXiHpYUX2efQFFzYccsSsoyIm8XcPBtxFmZ2lRnUz20IeUjE1LUwe7/H7FV
 Hdnqx7Fp6ga0WUUw8iAK5SY4XO8xauz9VB2OTRNMrgprhvBC61Od8Ob0zIi3rdEbfr
 0ZWDyVC/2Djd58C5kFXmFpWl8VgChUGjOAHqSUGebkjMRFaEv7bXEsfQs5X+fJdYm5
 5+MCWUH0Z+kqAwW1p/EPopdlw+CBEF5uPiLVHIj12KPgcJU1VMkq5XPsXgacxdECeI
 cI1j1hGt1DHae61EhqtrN/dOZQ8CBinPjuxinkcrClb+L8CUOGpuQvHScqqAo56Der
 cDOR8qFsnG0L/VDEJBz6foR3clNyiwgJdUa3Q25C9v8YwA84fES/3kMqyFMq7vOiv+
 l42wAvscqx0D21uYyQh+QOO/RMnv/wvNhWMOIFcCaIkVJnOJf+vg8GlsG9xKTUZDA6
 K1PImmb0yWQup8Vke7fhMQr5yU8w433i4poGiXCP+N8ykr+1oSE8kwE9+QxvSxLv6s
 WfPlaG2rADpGAqZOOYS6uBOhljQ+EwNx6bt20LJLx2QxQzgQvLWs0juyj4AHCWqLwN
 2o7vkaggVcAsS/okzbqfb2yO4NrOe0I+CXQxM17tGyizxK+blHZ94+K1sQoxTpdr6c
 2+mlCCbE5HvQRGeZhB0qDXNI=
Received: from [IPV6:2a10:3781:99:1:aaff:e11f:3a25:db5a] (unknown
 [IPv6:2a10:3781:99:1:aaff:e11f:3a25:db5a])
 by bout4.ijzerbout.nl (Postfix) with ESMTPSA id 36288414D8
 for <apparmor@lists.ubuntu.com>; Sun, 25 Jan 2026 13:07:18 +0100 (CET)
Message-ID: <ee6202a3-6e72-42c3-8374-4b8c709e70bd@ijzerbout.nl>
Date: Sun, 25 Jan 2026 13:07:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
To: apparmor@lists.ubuntu.com
References: <034d652f-ebdc-4d9a-8f7f-05c5596b23e5@ijzerbout.nl>
 <e4903a39-6883-43ad-90e7-824c035e6d52@canonical.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <e4903a39-6883-43ad-90e7-824c035e6d52@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=91.99.166.32; envelope-from=kees@ijzerbout.nl;
 helo=bout4.ijzerbout.nl
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
	DMARC_POLICY_ALLOW(-0.50)[ijzerbout.nl,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	R_DKIM_ALLOW(-0.20)[ijzerbout.nl:s=key];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[ijzerbout.nl:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@ijzerbout.nl,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:url,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: F251380743
X-Rspamd-Action: no action

Op 25-01-2026 om 04:44 schreef John Johansen:
> On 1/24/26 07:37, Kees Bakker wrote:
>> Hi,
>>
>> My setup is a Ubuntu24 with an Incus server (6.20).
>> One Incus container runs Fedora 43 where I want to run non-root podman.
>>
>> Inside the container
>>
>> [root@f43 ~]# sudo -u fedora -i
>> [fedora@f43 ~]$ podman run -t -i hello-world
>> cannot clone: Permission denied
>> Error: cannot re-exec process
>>
>> On the Ubuntu24 host I see this in journalctl
>>
>> jan 24 16:33:41 rapper kernel: audit: type=1400 
>> audit(1769268821.264:1554): apparmor="DENIED" 
>> operation="userns_create" class="namespace" info="Userns create 
>> restricted - failed to find unprivileged_userns profile" error=-13 
>> namespace="root//incus-f43_<var-lib-incus>" profile="unconfined" 
>> pid=2332667 comm="podman" requested="userns_create" 
>> denied="userns_create" target="unprivileged_userns"
>>
>> My question, what do I have to do on the Ubuntu24 server to allow 
>> running non-root podman?
>> Any help or suggestion is greatly appreciated.
>
> you are encountering the unprivileged user namespace restriction(1-5).
>
> You either need to confine the container, giving access to user 
> namespaces, or you need to disable the restriction.
>
> to temporarily disable you can do
>
>   sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0
>
> to permanently disable
>
>   sudo bash -c "echo kernel.apparmor_restrict_unprivileged_userns=0 > 
> /etc/sysctl.d/60-apparmor-namespace.conf"
>
>
>
> 1. 
> https://gitlab.com/apparmor/apparmor/-/wikis/unprivileged_userns_restriction
> 2. 
> https://discourse.ubuntu.com/t/understanding-apparmor-user-namespace-restriction/58007
> 3. https://discourse.ubuntu.com/t/plucky-puffin-release-notes/48687
> 4. 
> https://ubuntu.com/blog/ubuntu-23-10-restricted-unprivileged-user-namespaces
> 5. 
> https://discourse.ubuntu.com/t/spec-unprivileged-user-namespace-restrictions-via-apparmor-in-ubuntu-23-10/37626
>
>
Thank you for the links.
I now have quite a bit of reading to do :-)
-- 
Kees


Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICP9GYIndmlMMgEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 25 Jan 2026 15:24:02 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ABA80F85
	for <lists+apparmor@lfdr.de>; Sun, 25 Jan 2026 15:24:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vk11j-0000XR-QW; Sun, 25 Jan 2026 14:23:43 +0000
Received: from bout4.ijzerbout.nl ([91.99.166.32])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <kees@ijzerbout.nl>) id 1vk11j-0000XH-1e
 for apparmor@lists.ubuntu.com; Sun, 25 Jan 2026 14:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
 t=1769351022; bh=DSwogl+V/8t7eUyVaMEPWZGMWCSyijh3po0DIeuR+Hk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=jq3YFnDWAnwB9hSTNMwVzOOJSZT91zQoM+LUQkF5HK+4juOrWWBNFO8OwxBJLaKbZ
 JBeLReu5l8GnouWNb3fkFpFYIIQkHFR8QU09KeVuG+PYEayErIoJqYbSdI79H5AwF/
 NiD662d4+UFE5E38Kg0cO/ZxulwJ/E6StTibCeGQphFnIIao7owSHYdjKQyM9E7HJr
 Lnxhdvrslo6RUPzQgbMdl4TN0F2te4l1+yyCjo/dqxUSIU9rjyh90la9HJgh1kuKs7
 sSXVXyVawY/Yg0IjSmf5qXaCnfKcgLPaI0qy8JyTjX1aBxS1mwyFhIVPwe2an9Lu40
 X2K+DDiSjBsTPaaRacHhZtLUCwEfkFObyoOE7+8Fv3NHx8dTzEl1OuYMT5LkbVcPAI
 49McA97ZI9ERAjOoI48VGE08OGScHNQD4TIDYfm+AgwEufBbna+dWPVRUihg98CSdb
 Jzn65Lbj2JrRNCtanp+BmfM8tg2FhgIJlm21fK4QYstnVE87zwy3y3l7PfUZ0gMsMD
 1kudlX1tvT0g1Rjym+P3820xx7vuLZYR6lQLnz9JlLkwvFghQvaYD6YQOUUftCGuer
 V16LJP6Nm+x7CpHER7nke5Rarpu0fRUp814wZPhPoGmYqPMYHA/ZZVyruHxB9Hr4Pr
 bm1wNfFkOgVI3mJAah5KkM/M=
Received: from [IPV6:2a10:3781:99:1:aaff:e11f:3a25:db5a] (unknown
 [IPv6:2a10:3781:99:1:aaff:e11f:3a25:db5a])
 by bout4.ijzerbout.nl (Postfix) with ESMTPSA id 73C623EDC6
 for <apparmor@lists.ubuntu.com>; Sun, 25 Jan 2026 15:23:42 +0100 (CET)
Content-Type: multipart/alternative;
 boundary="------------y1litJHOb7m91ByDhJsVeBFV"
Message-ID: <429c6e60-8ac7-43ce-a28c-02d29c26e63f@ijzerbout.nl>
Date: Sun, 25 Jan 2026 15:23:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
To: apparmor@lists.ubuntu.com
References: <034d652f-ebdc-4d9a-8f7f-05c5596b23e5@ijzerbout.nl>
 <e4903a39-6883-43ad-90e7-824c035e6d52@canonical.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <e4903a39-6883-43ad-90e7-824c035e6d52@canonical.com>
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
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,ubuntu.com:url,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,f43:email]
X-Rspamd-Queue-Id: E9ABA80F85
X-Rspamd-Action: no action

This is a multi-part message in MIME format.
--------------y1litJHOb7m91ByDhJsVeBFV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

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


A few months ago there was a discussion [1] about an identical problem. 
Two suggested solutions were:

# Manually create the unprivileged_userns profile, by using AppArmor on 
the host. Something like
|sudo apparmor_parser -n 'incus-mycontainer_<var-lib-incus>' -r 
/etc/apparmor.d/unprivileged_userns|
# Use your own AppArmor profile, with |raw.apparmor = profile|

So far I don't quite understand how to do either of the two.
Perhaps the above apparmor_parser isn't quite correct.

Also, when I create an Incus container with Ubuntu24 AND if I then 
install apparmor I can
run rootless podman.

On the host, in the output of "aa-status --filter.mode=unconfined" there is

    :incus-dawarich_<var-lib-incus>:podman
    :incus-forgejo-runner_<var-lib-incus>:podman

BTW In apparmor documentation I couldn't find what the meaning of the 
":" is.

The thing is, I want Fedora43 in the Incus container to run podman.
Fedora has no apparmor.

[1] https://discuss.linuxcontainers.org/t/error-with-rootless-podman/24250/9

--------------y1litJHOb7m91ByDhJsVeBFV
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Op 25-01-2026 om 04:44 schreef John
      Johansen:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e4903a39-6883-43ad-90e7-824c035e6d52@canonical.com">On
      1/24/26 07:37, Kees Bakker wrote:
      <br>
      <blockquote type="cite">Hi,
        <br>
        <br>
        My setup is a Ubuntu24 with an Incus server (6.20).
        <br>
        One Incus container runs Fedora 43 where I want to run non-root
        podman.
        <br>
        <br>
        Inside the container
        <br>
        <br>
        [root@f43 ~]# sudo -u fedora -i
        <br>
        [fedora@f43 ~]$ podman run -t -i hello-world
        <br>
        cannot clone: Permission denied
        <br>
        Error: cannot re-exec process
        <br>
        <br>
        On the Ubuntu24 host I see this in journalctl
        <br>
        <br>
        jan 24 16:33:41 rapper kernel: audit: type=1400
        audit(1769268821.264:1554): apparmor="DENIED"
        operation="userns_create" class="namespace" info="Userns create
        restricted - failed to find unprivileged_userns profile"
        error=-13 namespace="root//incus-f43_&lt;var-lib-incus&gt;"
        profile="unconfined" pid=2332667 comm="podman"
        requested="userns_create" denied="userns_create"
        target="unprivileged_userns"
        <br>
        <br>
        My question, what do I have to do on the Ubuntu24 server to
        allow running non-root podman?
        <br>
        Any help or suggestion is greatly appreciated.
        <br>
      </blockquote>
      <br>
      you are encountering the unprivileged user namespace
      restriction(1-5).
      <br>
      <br>
      You either need to confine the container, giving access to user
      namespaces, or you need to disable the restriction.
      <br>
      <br>
      to temporarily disable you can do
      <br>
      <br>
        sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0
      <br>
      <br>
      to permanently disable
      <br>
      <br>
        sudo bash -c "echo
      kernel.apparmor_restrict_unprivileged_userns=0 &gt;
      /etc/sysctl.d/60-apparmor-namespace.conf"
      <br>
      <br>
      <br>
      <br>
      1.
<a class="moz-txt-link-freetext" href="https://gitlab.com/apparmor/apparmor/-/wikis/unprivileged_userns_restriction">https://gitlab.com/apparmor/apparmor/-/wikis/unprivileged_userns_restriction</a><br>
      2.
<a class="moz-txt-link-freetext" href="https://discourse.ubuntu.com/t/understanding-apparmor-user-namespace-restriction/58007">https://discourse.ubuntu.com/t/understanding-apparmor-user-namespace-restriction/58007</a><br>
      3.
      <a class="moz-txt-link-freetext" href="https://discourse.ubuntu.com/t/plucky-puffin-release-notes/48687">https://discourse.ubuntu.com/t/plucky-puffin-release-notes/48687</a>
      <br>
      4.
<a class="moz-txt-link-freetext" href="https://ubuntu.com/blog/ubuntu-23-10-restricted-unprivileged-user-namespaces">https://ubuntu.com/blog/ubuntu-23-10-restricted-unprivileged-user-namespaces</a><br>
      5.
<a class="moz-txt-link-freetext" href="https://discourse.ubuntu.com/t/spec-unprivileged-user-namespace-restrictions-via-apparmor-in-ubuntu-23-10/37626">https://discourse.ubuntu.com/t/spec-unprivileged-user-namespace-restrictions-via-apparmor-in-ubuntu-23-10/37626</a> </blockquote>
    <br>
    A few months ago there was a discussion [1] about an identical
    problem. Two suggested solutions were:<br>
    <br>
    <li>Manually create the unprivileged_userns profile, by using
      AppArmor on the host. Something like<br>
      <code>sudo apparmor_parser -n
        'incus-mycontainer_&lt;var-lib-incus&gt;' -r
        /etc/apparmor.d/unprivileged_userns</code></li>
    <li>Use your own AppArmor profile, with <code>raw.apparmor =
        profile</code></li>
    <br>
    So far I don't quite understand how to do either of the two.<br>
    Perhaps the above apparmor_parser isn't quite correct.<br>
    <br>
    Also, when I create an Incus container with Ubuntu24 AND if I then
    install apparmor I can<br>
    run rootless podman.<br>
    <br>
    On the host, in the output of "aa-status --filter.mode=unconfined"
    there is<br>
    <br>
       :incus-dawarich_&lt;var-lib-incus&gt;:podman<br>
       :incus-forgejo-runner_&lt;var-lib-incus&gt;:podman<br>
    <br>
    BTW In apparmor documentation I couldn't find what the meaning of
    the ":" is.<br>
    <br>
    The thing is, I want Fedora43 in the Incus container to run podman.<br>
    Fedora has no apparmor.<br>
    <br>
    [1]
    <a class="moz-txt-link-freetext" href="https://discuss.linuxcontainers.org/t/error-with-rootless-podman/24250/9">https://discuss.linuxcontainers.org/t/error-with-rootless-podman/24250/9</a><br>
    <br>
  </body>
</html>

--------------y1litJHOb7m91ByDhJsVeBFV--


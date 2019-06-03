Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 8039F339D3
	for <lists+apparmor@lfdr.de>; Mon,  3 Jun 2019 22:41:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hXtlH-0005tD-Rd; Mon, 03 Jun 2019 20:40:55 +0000
Received: from secure.zestysoft.com ([63.205.203.253])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@zestysoft.com>) id 1hXtlF-0005t7-Kt
 for apparmor@lists.ubuntu.com; Mon, 03 Jun 2019 20:40:53 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by secure.zestysoft.com (Postfix) with ESMTP id E7891ADC00F
 for <apparmor@lists.ubuntu.com>; Mon,  3 Jun 2019 13:40:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com E7891ADC00F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1559594449;
 bh=t7RyCZsZq3d3nR1lmhp8hZmYGjDZlI9Pi74BYRE8Tvk=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=eWadye/2wQJN02ui7YtJb2ckiIJn9f0Sla4ojsCZqb2mjdzBDyPtVMxnZE99IZHX1
 v5VRROSR2tATbZ2FYkYwjmit8bQ2c2uDDxkZ1sIOKhibM1ZOSdumG1Gg41PjurWePT
 ojlVRj1826ietu719eClUwbFKTPBStOaar4E0oNw=
X-Virus-Scanned: amavisd-new at zestysoft.com
Received: from secure.zestysoft.com ([127.0.0.1])
 by localhost (secure.zestysoft.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wlaDa7ZGcno for <apparmor@lists.ubuntu.com>;
 Mon,  3 Jun 2019 13:40:48 -0700 (PDT)
Received: from [172.20.3.88] (unknown [4.79.43.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by secure.zestysoft.com (Postfix) with ESMTPSA id 0AE39ADC00E
 for <apparmor@lists.ubuntu.com>; Mon,  3 Jun 2019 13:40:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com 0AE39ADC00E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1559594448;
 bh=t7RyCZsZq3d3nR1lmhp8hZmYGjDZlI9Pi74BYRE8Tvk=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=DOGM1bGueFI5LAwLpq8oSLIT/kWr4kgAPAQRAxasJAajZduKFPvSrLHtYRBdai958
 6/Xpiv/IIdQec23Bh4c6eQmDcASP3Yrra33GQiJn2EYDOz6Ct46Z6SJmWkxCV5S7bb
 x//cznYdnoPGFoL8fqonRJAdLkvgOctV7NQw7vsU=
To: apparmor@lists.ubuntu.com
References: <7979059d-044a-3f1a-83f9-8254a8a51daa@zestysoft.com>
 <20190525001053.GB6058@hunt>
 <734c73ce-1e25-cc3a-ed3d-7edae3ee94fc@canonical.com>
 <77776c98-473e-eb98-2fe6-c29a1bfa7e28@zestysoft.com>
 <859df47c-6c0d-0be4-4590-6b05ce0fd0a0@zestysoft.com>
 <7ec74901-7e32-b279-01b6-fddf38b7d1d1@zestysoft.com>
 <20190530190434.GA30663@horizon>
 <de0466db-4362-e25a-a334-59c88af82ac3@zestysoft.com>
 <d78ac3ce-24c1-631a-930d-b66613ee1fdf@zestysoft.com>
From: Ian <apparmor@zestysoft.com>
Message-ID: <22a9286c-d60e-466a-c261-b6500d2db820@zestysoft.com>
Date: Mon, 3 Jun 2019 13:40:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d78ac3ce-24c1-631a-930d-b66613ee1fdf@zestysoft.com>
Content-Language: en-US
Subject: Re: [apparmor] Attempting FullSystemPolicy with Ubuntu 18.04.2
	LTS...
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
Content-Type: multipart/mixed; boundary="===============8730279120449692299=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is a multi-part message in MIME format.
--===============8730279120449692299==
Content-Type: multipart/alternative;
 boundary="------------0B2E2D9FF1D91DFAA82F88A1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0B2E2D9FF1D91DFAA82F88A1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/31/19 2:59 PM, John wrote:
> Because when no-new-privs landed it was mandated that the LSMs not over ride it. No new-privs is not part of apparmor but the broader kernel, and was provided as a way to for a task to lockdown privileges to the current set.
>
> prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
>
> It was added with seccomp (3.5) so that the task could do setup and then lock its sandbox/security env down. At the time the LSMs were told it should apply to them as well. With seccomp use expanding and systemd now setting it this has unfortunately caused several problems for LSMs and selinux successfully added a setprivs ability that allows them to selectively override. AppArmor does currently allow transitions under no-new-privs but only when the transition is provable a subset of the tasks confinement (3.5 - 4.12 unconfined is allowed to transition to a profile, 4.13 - 4.16 is limited to strict subset of current confinement, basically you can extend a profile stack, 4.17 - 5.2 to a subset of confinement at the time nnp is set). We do have plans to add our own ability to have a permission to override no-new-privs but that has not landed upstream yet.
>
>
> >/Running pstree at the same time as apt shows the following order: 
> systemd, sshd, sshd, sshd, bash, sudo, bash, apt, gpgv (and http, 
> http), gpgv />//>/root at 1546-w-dev 
> <https://lists.ubuntu.com/mailman/listinfo/apparmor>:/etc/apparmor.d# 
> cat usr.lib.apt.methods.gpgv />/profile usr.lib.apt.methods.gpgv /usr/lib/apt/methods/gpgv 
> flags=(complain) { />/    #include <local/whitelist> />/} />//>//>/root at 1546-w-dev 
> <https://lists.ubuntu.com/mailman/listinfo/apparmor>:/etc/apparmor.d# 
> cat usr.bin.apt_key />/profile usr.bin.apt_key /usr/bin/apt-key flags=(complain) { />/    #include <local/whitelist> />/} />//>//>/Have I ran into this? 
> https://lists.ubuntu.com/archives/apparmor/2018-November/011846.html />//
> unfortunately, yes. I can point you at a test kernel for the nnp override but, I will need
> to get up a userspace that can work with it. I'll see what I can do this weekend.
>
>
if I use "/** px" for init-systemd and all other discrete profiles, am I 
correct in concluding that each child process does a domain transition?  
I.E. using that pstree output from above, by the time gpgv executes, the 
following transitions happen:

unconfined -> init-systemd -> usr.sbin.sshd -> bin.bash -> usr.bin.sudo 
-> bin.bash -> and so on?

Does the nnp issue occur after a certain depth is reached, or is 
something else triggering this?  What I don't get is that each process 
should have the same profile permission requests. Are there additional 
permissions I need to add to my "whitelist" file?

Also, if nnp locks things down, does that mean ux only works if the 
parent process is itself unconfined?  I.E. this isn't possible: 
unconfined -> px -> ux?  If that is possible, maybe I could somehow get 
apparmor to initially transition to ux before px?



--------------0B2E2D9FF1D91DFAA82F88A1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/31/19 2:59 PM, John wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d78ac3ce-24c1-631a-930d-b66613ee1fdf@zestysoft.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <pre>
Because when no-new-privs landed it was mandated that the LSMs not over ride it. No new-privs is not part of apparmor but the broader kernel, and was provided as a way to for a task to lockdown privileges to the current set.

prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);

It was added with seccomp (3.5) so that the task could do setup and then lock its sandbox/security env down. At the time the LSMs were told it should apply to them as well. With seccomp use expanding and systemd now setting it this has unfortunately caused several problems for LSMs and selinux successfully added a setprivs ability that allows them to selectively override. AppArmor does currently allow transitions under no-new-privs but only when the transition is provable a subset of the tasks confinement (3.5 - 4.12 unconfined is allowed to transition to a profile, 4.13 - 4.16 is limited to strict subset of current confinement, basically you can extend a profile stack, 4.17 - 5.2 to a subset of confinement at the time nnp is set). We do have plans to add our own ability to have a permission to override no-new-privs but that has not landed upstream yet.


&gt;<i> Running pstree at the same time as apt shows the following order: systemd, sshd, sshd, sshd, bash, sudo, bash, apt, gpgv (and http, http), gpgv
</i>&gt;<i> 
</i>&gt;<i>     <a href="https://lists.ubuntu.com/mailman/listinfo/apparmor">root at 1546-w-dev</a>:/etc/apparmor.d# cat usr.lib.apt.methods.gpgv
</i>&gt;<i>     profile usr.lib.apt.methods.gpgv /usr/lib/apt/methods/gpgv flags=(complain) {
</i>&gt;<i>         #include &lt;local/whitelist&gt;
</i>&gt;<i>     }
</i>&gt;<i> 
</i>&gt;<i> 
</i>&gt;<i>     <a href="https://lists.ubuntu.com/mailman/listinfo/apparmor">root at 1546-w-dev</a>:/etc/apparmor.d# cat usr.bin.apt_key
</i>&gt;<i>     profile usr.bin.apt_key /usr/bin/apt-key flags=(complain) {
</i>&gt;<i>         #include &lt;local/whitelist&gt;
</i>&gt;<i>     }
</i>&gt;<i> 
</i>&gt;<i> 
</i>&gt;<i> Have I ran into this?  <a href="https://lists.ubuntu.com/archives/apparmor/2018-November/011846.html">https://lists.ubuntu.com/archives/apparmor/2018-November/011846.html</a>
</i>&gt;<i> 
</i>
unfortunately, yes. I can point you at a test kernel for the nnp override but, I will need
to get up a userspace that can work with it. I'll see what I can do this weekend.


</pre>
    </blockquote>
    <p>if I use "/** px" for init-systemd and all other discrete
      profiles, am I correct in concluding that each child process does
      a domain transition?  I.E. using that pstree output from above, by
      the time gpgv executes, the following transitions happen:</p>
    <p>unconfined -&gt; init-systemd -&gt; usr.sbin.sshd -&gt; bin.bash
      -&gt; usr.bin.sudo -&gt; bin.bash -&gt; and so on?<br>
    </p>
    <p>Does the nnp issue occur after a certain depth is reached, or is
      something else triggering this?  What I don't get is that each
      process should have the same profile permission requests. Are
      there additional permissions I need to add to my "whitelist"
      file?  </p>
    <p>Also, if nnp locks things down, does that mean ux only works if
      the parent process is itself unconfined?  I.E. this isn't
      possible: unconfined -&gt; px -&gt; ux?  If that is possible,
      maybe I could somehow get apparmor to initially transition to ux
      before px?<br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------0B2E2D9FF1D91DFAA82F88A1--


--===============8730279120449692299==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8730279120449692299==--


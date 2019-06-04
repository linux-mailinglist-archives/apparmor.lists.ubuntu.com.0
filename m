Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B5833C4A
	for <lists+apparmor@lfdr.de>; Tue,  4 Jun 2019 02:02:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hXwu7-0007HH-Mn; Tue, 04 Jun 2019 00:02:15 +0000
Received: from secure.zestysoft.com ([63.205.203.253])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@zestysoft.com>) id 1hXwu5-0007H6-SL
 for apparmor@lists.ubuntu.com; Tue, 04 Jun 2019 00:02:14 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by secure.zestysoft.com (Postfix) with ESMTP id 24AF5ADC00F
 for <apparmor@lists.ubuntu.com>; Mon,  3 Jun 2019 17:02:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com 24AF5ADC00F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1559606530;
 bh=DWrQFQLJ64w0UG+vcnAWUQUJeL/C/eL/nGV2jYw0Pkc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=PnK5Yf5XIxw3mXU8014yRpbsP6IfQ/bHSB4LZ4sAolMmdE/mNYg+Ow0et0i+JAYF+
 8E+mcK64psTuTr6w4qGxzVatpClt1bNTZEI7Cki4Gob6pSz0jzfrki8f5xmhZ8TpYN
 qXAVTQjPDG4yutRNXRNXICWyxEd4ZtTBNSTM2P98=
X-Virus-Scanned: amavisd-new at zestysoft.com
Received: from secure.zestysoft.com ([127.0.0.1])
 by localhost (secure.zestysoft.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id voCTQJq1jC4N for <apparmor@lists.ubuntu.com>;
 Mon,  3 Jun 2019 17:02:08 -0700 (PDT)
Received: from [172.20.3.88] (unknown [4.79.43.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by secure.zestysoft.com (Postfix) with ESMTPSA id D241FADC00E
 for <apparmor@lists.ubuntu.com>; Mon,  3 Jun 2019 17:02:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com D241FADC00E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1559606527;
 bh=DWrQFQLJ64w0UG+vcnAWUQUJeL/C/eL/nGV2jYw0Pkc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=sibo6LvUAK9GPx8Z/xmaMrE1i9SHtFrmH8UfeQ/aYRPFNXWHQAAmUvox3hWA86tk3
 7bvHymUE2MP8rTAve3EryapUiH/8ZVfqSFmLl1No8urHzi9uqhG8NA/lIo/AbKXnC+
 ljZC8v8acripBVnXPRty17G9Gjc3+ebELIp+MyfU=
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
 <22a9286c-d60e-466a-c261-b6500d2db820@zestysoft.com>
From: Ian <apparmor@zestysoft.com>
Message-ID: <5938a8fb-8cd7-b5fd-e4fc-f6e58f4c085b@zestysoft.com>
Date: Mon, 3 Jun 2019 17:02:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <22a9286c-d60e-466a-c261-b6500d2db820@zestysoft.com>
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
Content-Type: multipart/mixed; boundary="===============5285702761982852450=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is a multi-part message in MIME format.
--===============5285702761982852450==
Content-Type: multipart/alternative;
 boundary="------------7C5450C2E3C881F8E26F6A4D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7C5450C2E3C881F8E26F6A4D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/3/18, /John Johansen/ wrote://

 > A task invoking the no_new_privs prct > 
https://www.kernel.org/doc/Documentation/prctl/no_new_privs.txt 
<https://www.kernel.org/doc/Documentation/prctl/no_new_privs.txt>

Okay, so I just did a strace on 'man' and see that it calls that 
function with the nnp parameter before attempting to execve the child 
processes that fail to execute.

Okay -- I get it now:  While nnp normally works fine if the executable 
is unconstrained, once apparmor assigns a security label to the 
executable, it's game over because the LSM system asks apparmor to do 
something it cannot -- prove the future profile transition has the same 
permissions.  I thought the child processes were asking for additional 
security, but that's not the case.

This means that since all non-kernel processes have a label with the 
FullSystemPolicy setup, this is an unavoidable problem -- there is no 
way to remove a label once assigned.  It's ironic that a function 
designed to help secure a system is what is responsible for preventing 
whitelisting.

I assume I'll run into a similar issue with selinux since this is a LSM 
label transition thing then? Man, this linux whitelisting search is 
turning out to be the holy grail.


--------------7C5450C2E3C881F8E26F6A4D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>
      On 11/3/18, <i>John Johansen</i> wrote:<i> </i></p>
    <p>&gt; A task invoking the no_new_privs prct
      <a
        href="https://www.kernel.org/doc/Documentation/prctl/no_new_privs.txt">&gt;
        https://www.kernel.org/doc/Documentation/prctl/no_new_privs.txt</a>
    </p>
    <p>Okay, so I just did a strace on 'man' and see that it calls that
      function with the nnp parameter before attempting to execve the
      child processes that fail to execute.</p>
    <p>Okay -- I get it now:  While nnp normally works fine if the
      executable is unconstrained, once apparmor assigns a security
      label to the executable, it's game over because the LSM system
      asks apparmor to do something it cannot -- prove the future
      profile transition has the same permissions.  I thought the child
      processes were asking for additional security, but that's not the
      case.<br>
    </p>
    <p>This means that since all non-kernel processes have a label with
      the FullSystemPolicy setup, this is an unavoidable problem --
      there is no way to remove a label once assigned.  It's ironic that
      a function designed to help secure a system is what is responsible
      for preventing whitelisting.<br>
    </p>
    <p>I assume I'll run into a similar issue with selinux since this is
      a LSM label transition thing then? Man, this linux whitelisting
      search is turning out to be the holy grail.</p>
  </body>
</html>

--------------7C5450C2E3C881F8E26F6A4D--


--===============5285702761982852450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5285702761982852450==--


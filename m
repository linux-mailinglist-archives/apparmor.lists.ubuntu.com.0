Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB7245B954
	for <lists+apparmor@lfdr.de>; Wed, 24 Nov 2021 12:42:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mpqfC-0004za-FE; Wed, 24 Nov 2021 11:42:10 +0000
Received: from smtp-1.1gb.com.ua ([195.234.4.10] helo=u1.1gb.ua)
 by huckleberry.canonical.com with esmtp (Exim 4.86_2)
 (envelope-from <me@beroal.in.ua>) id 1mpqfA-0004z9-G9
 for apparmor@lists.ubuntu.com; Wed, 24 Nov 2021 11:42:08 +0000
Received: from Spooler by u1.1gb.ua (Mercury/32 v4.52) ID MO003CF9;
 24 Nov 2021 13:42:06 +0200
Received: from spooler by mail-u1-robots.in-solve.hidden (Mercury/32 v4.52);
 24 Nov 2021 13:42:03 +0200
Received: from ul1.1gb.ua (195.234.4.24) by smtp-1.1gb.com.ua (Mercury/32
 v4.52) with ESMTP ID MG003CF7; 24 Nov 2021 13:41:57 +0200
Received: from [192.162.141.53] ([192.162.141.53]) (authenticated bits=0)
 by ul1.1gb.ua (8.14.9/8.14.9) with ESMTP id 1AOBfv0D004241
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
 Wed, 24 Nov 2021 13:41:58 +0200
Message-ID: <e3481d05-f7bf-df60-3054-181ab092798f@beroal.in.ua>
Date: Wed, 24 Nov 2021 13:41:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: beroal <me@beroal.in.ua>
References: <ec3bb2d2-7178-a65f-3a61-34aee8e0560c@beroal.in.ua>
 <20211116202044.GA1434906@millbarge>
 <52abb2cd-3d8a-76ce-54c3-24b4bcc79058@beroal.in.ua>
From: beroal <me@beroal.in.ua>
In-Reply-To: <52abb2cd-3d8a-76ce-54c3-24b4bcc79058@beroal.in.ua>
Subject: Re: [apparmor] give a permission to a specific process
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
Cc: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="===============5471009585485083307=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is a multi-part message in MIME format.
--===============5471009585485083307==
Content-Type: multipart/alternative;
 boundary="------------ejILVO9z10c1xBwKeCpisyQl"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------ejILVO9z10c1xBwKeCpisyQl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.11.21 17:21, beroal wrote:
> My plan is to make a daemon which allows a user to add file 
> permissions to /etc/apparmor.d/temp/$PROGRAM. And there will be 
> "include if exists <temp/$PROGRAM>" in /etc/apparmor.d/$PROGRAM.
>
> This plan creates a vulnerability though. A malicious user $U0 can 
> give a vulnerable program $E access to /home/$U1 and access /home/$U1 
> by controlling a process executing $E as $U1 (when $U1 uses $E) :-( .
>
If anybody's interested, I have a better plan. The daemon creates a 
temporary executable $E1 which `execv` to $E and a temporary profile 
containing permissions $R for $E1 where $E and $R are provided by a 
client. The client is supposed to execute $E1 themselves.
--------------ejILVO9z10c1xBwKeCpisyQl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 18.11.21 17:21, beroal wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:52abb2cd-3d8a-76ce-54c3-24b4bcc79058@beroal.in.ua">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      My plan is to make a daemon which allows a user to add file
      permissions to /etc/apparmor.d/temp/$PROGRAM. And there will be "<span
        class="text-bold hx_keyword-hl rounded-1 d-inline-block">include</span>
      <span class="text-bold hx_keyword-hl rounded-1 d-inline-block">if</span>
      <span class="text-bold hx_keyword-hl rounded-1 d-inline-block">exists</span>
      &lt;temp/$PROGRAM&gt;" in /etc/apparmor.d/$PROGRAM.
      <p>This plan creates a vulnerability though. A malicious user $U0
        can give a vulnerable program $E access to /home/$U1 and access
        /home/$U1 by controlling a process executing $E as $U1 (when $U1
        uses $E) :-( .<br>
      </p>
    </blockquote>
    If anybody's interested, I have a better plan. The daemon creates a
    temporary executable $E1 which `execv` to $E and a temporary profile
    containing permissions $R for $E1 where $E and $R are provided by a
    client. The client is supposed to execute $E1 themselves.<br>
  </body>
</html>
--------------ejILVO9z10c1xBwKeCpisyQl--



--===============5471009585485083307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5471009585485083307==--



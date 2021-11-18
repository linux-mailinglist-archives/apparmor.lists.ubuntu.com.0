Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A931C455F47
	for <lists+apparmor@lfdr.de>; Thu, 18 Nov 2021 16:21:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mnjEE-0002CY-Fn; Thu, 18 Nov 2021 15:21:34 +0000
Received: from smtp-1.1gb.com.ua ([195.234.4.10] helo=u1.1gb.ua)
 by huckleberry.canonical.com with esmtp (Exim 4.86_2)
 (envelope-from <me@beroal.in.ua>) id 1mnjEB-0002As-J7
 for apparmor@lists.ubuntu.com; Thu, 18 Nov 2021 15:21:31 +0000
Received: from Spooler by u1.1gb.ua (Mercury/32 v4.52) ID MO005D24;
 18 Nov 2021 17:21:32 +0200
Received: from spooler by mail-u1-robots.in-solve.hidden (Mercury/32 v4.52);
 18 Nov 2021 17:21:30 +0200
Received: from ul1.1gb.ua (195.234.4.24) by smtp-1.1gb.com.ua (Mercury/32
 v4.52) with ESMTP ID MG005D22; 18 Nov 2021 17:21:19 +0200
Received: from [192.162.141.53] ([192.162.141.53]) (authenticated bits=0)
 by ul1.1gb.ua (8.14.9/8.14.9) with ESMTP id 1AIFLH82010791
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 18 Nov 2021 17:21:18 +0200
Message-ID: <52abb2cd-3d8a-76ce-54c3-24b4bcc79058@beroal.in.ua>
Date: Thu, 18 Nov 2021 17:21:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Seth Arnold <seth.arnold@canonical.com>, beroal <me@beroal.in.ua>
References: <ec3bb2d2-7178-a65f-3a61-34aee8e0560c@beroal.in.ua>
 <20211116202044.GA1434906@millbarge>
From: beroal <me@beroal.in.ua>
In-Reply-To: <20211116202044.GA1434906@millbarge>
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
Content-Type: multipart/mixed; boundary="===============8751636566062435030=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is a multi-part message in MIME format.
--===============8751636566062435030==
Content-Type: multipart/alternative;
 boundary="------------gsiZendKMkMjjF7HcH7N0Zfd"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------gsiZendKMkMjjF7HcH7N0Zfd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.11.21 22:20, Seth Arnold wrote:
> On Tue, Nov 16, 2021 at 11:44:15AM +0200, beroal wrote:
>> Hi. I wonder whether AppArmor allows to give a permission to a specific
>> process. A use case: there are UI programs (editors, viewers) that need
>> temporary access to a file specified by a user (to edit, to view).
> Work is ongoing to allow delegation of privileges via 'portals'
> (similar in spirit to the "PowerBox" style of capability object systems
> http://wiki.c2.com/?PowerBox  ). I'm not sure if this is what you're
> really asking about, however...
Yes, PowerBox is what I have in mind. The idea is ancient, but I'm not 
aware of any implementation for Linux except for Plash 
http://plash.beasts.org/contents.html .

At first, I planned to have directories ~/.phome/$PROGRAM for every 
$PROGRAM. (Of course, $PROGRAM doesn't have access to the home directory 
except for ~/.phome/$PROGRAM. This is the whole point and is achieved 
through AppArmor.) This would require crazy file moving for files that 
are accessed by many programs. For example, when writing documents, 
archiving them, and then sending them by email.


>> Unfortunately, AppArmor profiles give permissions to executable files. For
>> example, if a user gives executable $E access to /tmp/$F, any user will have
>> access to /tmp/$F by executing $E. Hence a user need a feature which gives
>> permission $R to any process that executes executable $E **as a user $U**
>> where $R, $E, and $U are specified by the user. A feature which gives
>> permission $R to process $P would be nice too, but isn't essential. There is
>> a problem how a non-root can use this feature, but it's a separate topic.
>>
>> Does AppArmor have such a feature? Maybe, there is a better tool for this
>> use case?
> Do note that in your description, User A creates /tmp/$F. User B can
> access /tmp/$F through cat, vim, dd, cp, etc. even without using
> executable $E IFF the permissions on /tmp/$F allow it.

It's okay since I want to protect files against malicious programs, not 
malicious users. (Protecting from malicious users is simple --- 
classical Unix file permissions.) But then it's okay that any user has 
access to /tmp/$F. Thank you for pointing this out :-) .

My plan is to make a daemon which allows a user to add file permissions 
to /etc/apparmor.d/temp/$PROGRAM. And there will be "include if exists 
<temp/$PROGRAM>" in /etc/apparmor.d/$PROGRAM.

This plan creates a vulnerability though. A malicious user $U0 can give 
a vulnerable program $E access to /home/$U1 and access /home/$U1 by 
controlling a process executing $E as $U1 (when $U1 uses $E) :-( .

--------------gsiZendKMkMjjF7HcH7N0Zfd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 16.11.21 22:20, Seth Arnold wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20211116202044.GA1434906@millbarge">
      <pre class="moz-quote-pre" wrap="">On Tue, Nov 16, 2021 at 11:44:15AM +0200, beroal wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi. I wonder whether AppArmor allows to give a permission to a specific
process. A use case: there are UI programs (editors, viewers) that need
temporary access to a file specified by a user (to edit, to view).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Work is ongoing to allow delegation of privileges via 'portals'
(similar in spirit to the "PowerBox" style of capability object systems
<a class="moz-txt-link-freetext" href="http://wiki.c2.com/?PowerBox">http://wiki.c2.com/?PowerBox</a> ). I'm not sure if this is what you're
really asking about, however...</pre>
    </blockquote>
    Yes, PowerBox is what I have in mind. The idea is ancient, but I'm
    not aware of any implementation for Linux except for Plash
    <a class="moz-txt-link-freetext" href="http://plash.beasts.org/contents.html">http://plash.beasts.org/contents.html</a> .
    <p>At first, I planned to have directories ~/.phome/$PROGRAM for
      every $PROGRAM. (Of course, $PROGRAM doesn't have access to the
      home directory except for ~/.phome/$PROGRAM. This is the whole
      point and is achieved through AppArmor.) This would require crazy
      file moving for files that are accessed by many programs. For
      example, when writing documents, archiving them, and then sending
      them by email.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20211116202044.GA1434906@millbarge">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Unfortunately, AppArmor profiles give permissions to executable files. For
example, if a user gives executable $E access to /tmp/$F, any user will have
access to /tmp/$F by executing $E. Hence a user need a feature which gives
permission $R to any process that executes executable $E **as a user $U**
where $R, $E, and $U are specified by the user. A feature which gives
permission $R to process $P would be nice too, but isn't essential. There is
a problem how a non-root can use this feature, but it's a separate topic.

Does AppArmor have such a feature? Maybe, there is a better tool for this
use case?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Do note that in your description, User A creates /tmp/$F. User B can
access /tmp/$F through cat, vim, dd, cp, etc. even without using
executable $E IFF the permissions on /tmp/$F allow it.
</pre>
    </blockquote>
    <p>It's okay since I want to protect files against malicious
      programs, not malicious users. (Protecting from malicious users is
      simple --- classical Unix file permissions.) But then it's okay
      that any user has access to /tmp/$F. Thank you for pointing this
      out :-) .</p>
    <p>My plan is to make a daemon which allows a user to add file
      permissions to /etc/apparmor.d/temp/$PROGRAM. And there will be "<span
        class="text-bold hx_keyword-hl rounded-1 d-inline-block">include</span>
      <span class="text-bold hx_keyword-hl rounded-1 d-inline-block">if</span>
      <span class="text-bold hx_keyword-hl rounded-1 d-inline-block">exists</span>
      &lt;temp/$PROGRAM&gt;" in /etc/apparmor.d/$PROGRAM.</p>
    <p>This plan creates a vulnerability though. A malicious user $U0
      can give a vulnerable program $E access to /home/$U1 and access
      /home/$U1 by controlling a process executing $E as $U1 (when $U1
      uses $E) :-( .<br>
    </p>
  </body>
</html>
--------------gsiZendKMkMjjF7HcH7N0Zfd--



--===============8751636566062435030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8751636566062435030==--



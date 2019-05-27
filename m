Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D782BA86
	for <lists+apparmor@lfdr.de>; Mon, 27 May 2019 21:09:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hVKzO-0006Bv-LF; Mon, 27 May 2019 19:08:54 +0000
Received: from secure.zestysoft.com ([63.205.203.253])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@zestysoft.com>) id 1hVKzK-0006BR-Ub
 for apparmor@lists.ubuntu.com; Mon, 27 May 2019 19:08:51 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by secure.zestysoft.com (Postfix) with ESMTP id 593ABADC00F
 for <apparmor@lists.ubuntu.com>; Mon, 27 May 2019 12:08:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com 593ABADC00F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1558984128;
 bh=9/fauIUvQyYenpqbhU0YIeuNI7L+ZAt6gT90sA3P/98=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=q7G4XwS9vqGEnn3RX0XbZTG9Mq5j9kXmU8BfBtpbtJEzTcic9ilmj3H8OyvxkTGW7
 MAqc/KdZd1KVESkxM/N0uXrfEr2pHwyUFgO0vqF+s6OH0mHytdZXm6S+kCqGcGkCDe
 jHytfLltdkhNUeUlypvbBPQIC2VQpnMG6jaKm6z0=
X-Virus-Scanned: amavisd-new at zestysoft.com
Received: from secure.zestysoft.com ([127.0.0.1])
 by localhost (secure.zestysoft.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mu0hm0jMfx8j for <apparmor@lists.ubuntu.com>;
 Mon, 27 May 2019 12:08:45 -0700 (PDT)
Received: from [172.20.3.88] (unknown [4.79.43.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by secure.zestysoft.com (Postfix) with ESMTPSA id 02746ADC00E
 for <apparmor@lists.ubuntu.com>; Mon, 27 May 2019 12:08:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com 02746ADC00E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1558984125;
 bh=9/fauIUvQyYenpqbhU0YIeuNI7L+ZAt6gT90sA3P/98=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=G0PZ2cMYDa+vnK+aHPKM92xK/2UwaAW977FJhj3TyTQx1smiGVe2aNUAoJ2+QBJWE
 4gDlLtW+mrDukpwjUq03lqTg//NApF5mG0aMSs/wMjHouB3mhR/vpmlPuy4qPJOxU5
 RvQ9rQ5JPndkEuNkP/Rb5+yZ87eUStx59EiGmm3w=
To: apparmor@lists.ubuntu.com
References: <7979059d-044a-3f1a-83f9-8254a8a51daa@zestysoft.com>
 <20190525001053.GB6058@hunt>
 <734c73ce-1e25-cc3a-ed3d-7edae3ee94fc@canonical.com>
From: Ian <apparmor@zestysoft.com>
Message-ID: <77776c98-473e-eb98-2fe6-c29a1bfa7e28@zestysoft.com>
Date: Mon, 27 May 2019 12:08:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <734c73ce-1e25-cc3a-ed3d-7edae3ee94fc@canonical.com>
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
Content-Type: multipart/mixed; boundary="===============3369780324328455580=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is a multi-part message in MIME format.
--===============3369780324328455580==
Content-Type: multipart/alternative;
 boundary="------------70436F429B0E0D9794B5E105"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------70436F429B0E0D9794B5E105
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/24/19 6:16 PM, John Johansen wrote:
> On 5/24/19 5:10 PM, Seth Arnold wrote:
>> On Fri, May 24, 2019 at 03:28:21PM -0700, Ian wrote:
>>> It's like I'm only getting a few of these at a time -- I added this to the
>>> kernel boot parameter: 'audit_backlog_limit=65536' but that didn't seem to
>>> affect the number of these that I was shown. I assume some type of
>>> throttling might be occurring but there was no notice of this happening on
>>> the console.
>> Hello Ian,
>>
>> The audit_backlog_limit parameter likely only applies to the auditd
>> daemon. If your audit messages are written to dmesg instead, you'll
>> reach a different rate limiting method. (Though I thought that one would
>> include a message about printk rate limits being hit.)
>>
>> Regular printk message rate can be controlled via
>> /proc/sys/kernel/printk_ratelimit
>> /proc/sys/kernel/printk_ratelimit_burst
>> details are in the kernel source file Documentation/sysctl/kernel.txt
>>
> yes, if auditd isn't registered messages will go to the kernel ring
> buffer and printk_ratelimit is used.
>
> there is a warning message that audit messages are lost, however it
> may not always trigger. Depending on what triggered the loss, failure
> mode etc.

That was what I needed.  I thought I was limited to kernel boot 
parameters and apparently printk_ratelimit wasn't one of them.

>>> 2) If I want to worry about restricting binaries later, but only want to
>>> "whitelist" at this point in time, is there a generic profile that I can
>>> create that will grant all permissions?
>> We should probably write a tool to generate one appropriate for the system
>> it's on, since it's not obvious how to do this by hand. But "Allow
>> Everything" profiles probably shouldn't be the norm, so maybe a little
>> friction is worthwhile.
>>
>> Anyway, it would look something like:
>>
>> profile profilename /attachment/specification {
>>    network,
>>    signal,
>>    file,
>>    mount,
>>    pivot_root,
>>    ptrace,
>>    unix,
>>    dbus,
>> }
>>
> it happens enough that it is coming as a new feature, you unfortunately
> just can't use it yet

No worries, I used that list (plus 'umount', and 'capability') to quiet 
the audit output for systemd while it was doing things before 
transitioning.  At this point all I'm trying to do is mimic how the 
system currently boots without Apparmor enabled.  I'm not currently able 
to fully boot into the system since two services "systemd-resolved" and 
"sytemd-udevd" fail to finish loading.

For instance, if I add the kernel parameter "emergency" so that I boot 
directly to shell after initramfs, remount root as rw, and attempt to 
start the resolve service, I get this:

    # systemctl start systemd-resolved
    [  701.817178] systemd[1]: Starting Network Name Resolution...
    [  701.821550] systemd[411]: systemd-resolved.service: Failed to
    connect stdout to the journal socket, ignoring: No such file or
    directory
    [  701.904706] audit: type=1400 audit(1558982354.096:69):
    apparmor="ALLOWED" operation="sendmsg" info="Failed name lookup -
    disconnected path" error=-13 profile="init-systemd"
    name="run/systemd/notify" pid=411 comm="systemd-resolve"
    requested_mask="w" denied_mask="w" fsuid=10
    [  701.908775] audit: type=1400 audit(1558982354.096:70):
    apparmor="ALLOWED" operation="sendmsg" info="Failed name lookup -
    disconnected path" error=-13 profile="init-systemd"
    name="run/systemd/notify" pid=411 comm="systemd-resolve"
    requested_mask="r" denied_mask="r" fsuid=10
    [  701.912779] audit: type=1400 audit(1558982354.096:71):
    apparmor="ALLOWED" operation="sendmsg" info="Failed name lookup -
    disconnected path" error=-13 profile="init-systemd"
    name="run/systemd/notify" pid=411 comm="systemd-resolve"
    requested_mask="w" denied_mask="w" fsuid=10
    [  701.916948] audit: type=1400 audit(1558982354.096:72):
    apparmor="ALLOWED" operation="sendmsg" info="Failed name lookup -
    disconnected path" error=-13 profile="init-systemd"
    name="run/systemd/notify" pid=411 comm="systemd-resolve"
    requested_mask="r" denied_mask="r" fsuid=10
    [  791.827056] systemd[1]: systemd-resolved.service: Start operation
    timed out. Terminating.
    [  791.834261] audit: type=1400 audit(1558982444.024:73):
    apparmor="ALLOWED" operation="sendmsg" info="Failed name lookup -
    disconnected path" error=-13 profile="init-systemd"
    name="run/systemd/notify" pid=411 comm="systemd-resolve"
    requested_mask="w" denied_mask="w" fsuid=10
    [  791.857002] audit: type=1400 audit(1558982444.024:74):
    apparmor="ALLOWED" operation="sendmsg" info="Failed name lookup -
    disconnected path" error=-13 profile="init-systemd"
    name="run/systemd/notify" pid=411 comm="systemd-resolve"
    requested_mask="r" denied_mask="r" fsuid=10
    [  791.869512] audit: type=1400 audit(1558982444.048:75):
    apparmor="ALLOWED" operation="sendmsg" info="Failed name lookup -
    disconnected path" error=-13 profile="init-systemd"
    name="run/systemd/notify" pid=411 comm="systemd-resolve"
    requested_mask="w" denied_mask="w" fsuid=10
    [  791.874754] audit: type=1400 audit(1558982444.048:76):
    apparmor="ALLOWED" operation="sendmsg" info="Failed name lookup -
    disconnected path" error=-13 profile="init-systemd"
    name="run/systemd/notify" pid=411 comm="systemd-resolve"
    requested_mask="r" denied_mask="r" fsuid=10
    [  791.896770] systemd[1]: systemd-resolved.service: Failed with
    result 'timeout'.
    [  791.898386] systemd[1]: Failed to start Network Name Resolution.
    [  791.899824] systemd[1]: systemd-resolved.service: Service has no
    hold-off time, scheduling restart.
    [  791.901531] systemd[1]: systemd-resolved.service: Scheduled
    restart job, restart counter is at 1.
    Job for systemd-resolved.service failed because [  791.903237]
    systemd[1]: Stopped Network Name Resolution.
    a timeout was exceeded.
    See "systemctl status systemd-resolved.service" and "journalctl -xe"
    for details.

Mind you, this is with the init-systemd profile set to this:

    profile init-systemd /lib/systemd/systemd flags=(complain) {
    network,
    signal,
    file,
    mount,
    pivot_root,
    ptrace,
    unix,
    dbus,
    umount,
    capability,

    }

aa-status shows nothing enforcing:

    # aa-status
    apparmor module is loaded.
    1 profiles are loaded.
    0 profiles are in enforce mode.
    1 profiles are in complain mode.
    init-systemd
    7 processes have profiles defined.
    0 processes are in enforce mode.
    7 processes are in complain mode.
        init-systemd (1)
        init-systemd (321)
        init-systemd (322)
        init-systemd (323)
        init-systemd (324)
        init-systemd (451)
        init-systemd (454)
    0 processes are unconfined but have a profile defined.

#ps auxZ shows this:

    init-systemd (complain)         systemd+   457  0.1  0.1 70624  5120
    ?        Ss   11:51   0:00 /lib/systemd/systemd-resolved

Does apparmor have the same problem as selinux where there are "security 
aware" programs that don't properly honor enforcement settings, or is 
this an inheritance problem that I'm not correctly addressing?



--------------70436F429B0E0D9794B5E105
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/24/19 6:16 PM, John Johansen
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:734c73ce-1e25-cc3a-ed3d-7edae3ee94fc@canonical.com">
      <pre class="moz-quote-pre" wrap="">On 5/24/19 5:10 PM, Seth Arnold wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Fri, May 24, 2019 at 03:28:21PM -0700, Ian wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">It's like I'm only getting a few of these at a time -- I added this to the
kernel boot parameter: 'audit_backlog_limit=65536' but that didn't seem to
affect the number of these that I was shown. I assume some type of
throttling might be occurring but there was no notice of this happening on
the console.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hello Ian,

The audit_backlog_limit parameter likely only applies to the auditd
daemon. If your audit messages are written to dmesg instead, you'll
reach a different rate limiting method. (Though I thought that one would
include a message about printk rate limits being hit.)

Regular printk message rate can be controlled via
/proc/sys/kernel/printk_ratelimit
/proc/sys/kernel/printk_ratelimit_burst
details are in the kernel source file Documentation/sysctl/kernel.txt

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
yes, if auditd isn't registered messages will go to the kernel ring
buffer and printk_ratelimit is used.

there is a warning message that audit messages are lost, however it
may not always trigger. Depending on what triggered the loss, failure
mode etc.</pre>
    </blockquote>
    <p>That was what I needed.  I thought I was limited to kernel boot
      parameters and apparently printk_ratelimit wasn't one of them.
    </p>
    <blockquote type="cite"
      cite="mid:734c73ce-1e25-cc3a-ed3d-7edae3ee94fc@canonical.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">2) If I want to worry about restricting binaries later, but only want to
"whitelist" at this point in time, is there a generic profile that I can
create that will grant all permissions?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
We should probably write a tool to generate one appropriate for the system
it's on, since it's not obvious how to do this by hand. But "Allow
Everything" profiles probably shouldn't be the norm, so maybe a little
friction is worthwhile.

Anyway, it would look something like:

profile profilename /attachment/specification {
  network,
  signal,
  file,
  mount,
  pivot_root,
  ptrace,
  unix,
  dbus,
}

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
it happens enough that it is coming as a new feature, you unfortunately
just can't use it yet
</pre>
    </blockquote>
    <p>No worries, I used that list (plus 'umount', and 'capability') to
      quiet the audit output for systemd while it was doing things
      before transitioning.  At this point all I'm trying to do is mimic
      how the system currently boots without Apparmor enabled.  I'm not
      currently able to fully boot into the system since two services
      "systemd-resolved" and "sytemd-udevd" fail to finish loading.</p>
    <p>For instance, if I add the kernel parameter "emergency" so that I
      boot directly to shell after initramfs, remount root as rw, and
      attempt to start the resolve service, I get this:</p>
    <blockquote>
      <p># systemctl start
systemd-resolved                                                                                                                                                                                                                         
        <br>
        [  701.817178] systemd[1]: Starting Network Name
Resolution...                                                                                                                                                                                                                     
        <br>
        [  701.821550] systemd[411]: systemd-resolved.service: Failed to
        connect stdout to the journal socket, ignoring: No such file or
directory                                                                                                                                         
        <br>
        [  701.904706] audit: type=1400 audit(1558982354.096:69):
        apparmor="ALLOWED" operation="sendmsg" info="Failed name lookup
        - disconnected path" error=-13 profile="init-systemd"
        name="run/systemd/notify" pid=411 comm="systemd-resolve"
        requested_mask="w" denied_mask="w" fsuid=10<br>
        [  701.908775] audit: type=1400 audit(1558982354.096:70):
        apparmor="ALLOWED" operation="sendmsg" info="Failed name lookup
        - disconnected path" error=-13 profile="init-systemd"
        name="run/systemd/notify" pid=411 comm="systemd-resolve"
        requested_mask="r" denied_mask="r" fsuid=10<br>
        [  701.912779] audit: type=1400 audit(1558982354.096:71):
        apparmor="ALLOWED" operation="sendmsg" info="Failed name lookup
        - disconnected path" error=-13 profile="init-systemd"
        name="run/systemd/notify" pid=411 comm="systemd-resolve"
        requested_mask="w" denied_mask="w" fsuid=10<br>
        [  701.916948] audit: type=1400 audit(1558982354.096:72):
        apparmor="ALLOWED" operation="sendmsg" info="Failed name lookup
        - disconnected path" error=-13 profile="init-systemd"
        name="run/systemd/notify" pid=411 comm="systemd-resolve"
        requested_mask="r" denied_mask="r" fsuid=10<br>
        [  791.827056] systemd[1]: systemd-resolved.service: Start
        operation timed out.
Terminating.                                                                                                                                                                                       
        <br>
        [  791.834261] audit: type=1400 audit(1558982444.024:73):
        apparmor="ALLOWED" operation="sendmsg" info="Failed name lookup
        - disconnected path" error=-13 profile="init-systemd"
        name="run/systemd/notify" pid=411 comm="systemd-resolve"
        requested_mask="w" denied_mask="w" fsuid=10<br>
        [  791.857002] audit: type=1400 audit(1558982444.024:74):
        apparmor="ALLOWED" operation="sendmsg" info="Failed name lookup
        - disconnected path" error=-13 profile="init-systemd"
        name="run/systemd/notify" pid=411 comm="systemd-resolve"
        requested_mask="r" denied_mask="r" fsuid=10<br>
        [  791.869512] audit: type=1400 audit(1558982444.048:75):
        apparmor="ALLOWED" operation="sendmsg" info="Failed name lookup
        - disconnected path" error=-13 profile="init-systemd"
        name="run/systemd/notify" pid=411 comm="systemd-resolve"
        requested_mask="w" denied_mask="w" fsuid=10<br>
        [  791.874754] audit: type=1400 audit(1558982444.048:76):
        apparmor="ALLOWED" operation="sendmsg" info="Failed name lookup
        - disconnected path" error=-13 profile="init-systemd"
        name="run/systemd/notify" pid=411 comm="systemd-resolve"
        requested_mask="r" denied_mask="r" fsuid=10<br>
        [  791.896770] systemd[1]: systemd-resolved.service: Failed with
        result
'timeout'.                                                                                                                                                                                                 
        <br>
        [  791.898386] systemd[1]: Failed to start Network Name
Resolution.                                                                                                                                                                                                                
        <br>
        [  791.899824] systemd[1]: systemd-resolved.service: Service has
        no hold-off time, scheduling
restart.                                                                                                                                                                             
        <br>
        [  791.901531] systemd[1]: systemd-resolved.service: Scheduled
        restart job, restart counter is at
1.                                                                                                                                                                               
        <br>
        Job for systemd-resolved.service failed because [  791.903237]
        systemd[1]: Stopped Network Name
Resolution.                                                                                                                                                                        
        <br>
        a timeout was
exceeded.                                                                                                                                                                                                                                                            
        <br>
        See "systemctl status systemd-resolved.service" and "journalctl
        -xe" for
details.                                                                                                                                                                                                  
        <br>
      </p>
    </blockquote>
    <p>Mind you, this is with the init-systemd profile set to this:</p>
    <blockquote>
      <p>profile init-systemd /lib/systemd/systemd flags=(complain)
{                                                                                                                                                                                                                       
        <br>
               
network,                                                                                                                                                                                                                                                                   
        <br>
               
signal,                                                                                                                                                                                                                                                                    
        <br>
               
file,                                                                                                                                                                                                                                                                      
        <br>
               
mount,                                                                                                                                                                                                                                                                     
        <br>
               
pivot_root,                                                                                                                                                                                                                                                                
        <br>
               
ptrace,                                                                                                                                                                                                                                                                    
        <br>
               
unix,                                                                                                                                                                                                                                                                      
        <br>
               
dbus,                                                                                                                                                                                                                                                                      
        <br>
               
umount,                                                                                                                                                                                                                                                                    
        <br>
               
capability,                                                                                                                                                                                                                                                                
        <br>
                                                                                                                                                                                                                                                                                   
        <br>
        }</p>
    </blockquote>
    <p>aa-status shows nothing enforcing:</p>
    <blockquote>
      <p>#
aa-status                                                                                                                                                                                                                                                
        <br>
        apparmor module is
loaded.                                                                                                                                                                                                                                                         
        <br>
        1 profiles are
loaded.                                                                                                                                                                                                                                                             
        <br>
        0 profiles are in enforce
mode.                                                                                                                                                                                                                                                    
        <br>
        1 profiles are in complain
mode.                                                                                                                                                                                                                                                   
        <br>
          
init-systemd                                                                                                                                                                                                                                                                    
        <br>
        7 processes have profiles
defined.                                                                                                                                                                                                                                                 
        <br>
        0 processes are in enforce
mode.                                                                                                                                                                                                                                                   
        <br>
        7 processes are in complain
mode.                                                                                                                                                                                                                                                  
        <br>
           init-systemd
(1)                                                                                                                                                                                                                                                                
        <br>
           init-systemd
(321)                                                                                                                                                                                                                                                              
        <br>
           init-systemd
(322)                                                                                                                                                                                                                                                              
        <br>
           init-systemd
(323)                                                                                                                                                                                                                                                              
        <br>
           init-systemd
(324)                                                                                                                                                                                                                                                              
        <br>
           init-systemd
(451)                                                                                                                                                                                                                                                              
        <br>
           init-systemd
(454)                                                                                                                                                                                                                                                              
        <br>
        0 processes are unconfined but have a profile defined.</p>
    </blockquote>
    <p>#ps auxZ shows this:</p>
    <blockquote>
      <p>init-systemd (complain)         systemd+   457  0.1  0.1 
        70624  5120 ?        Ss   11:51   0:00
        /lib/systemd/systemd-resolved</p>
    </blockquote>
    <p>Does apparmor have the same problem as selinux where there are
      "security aware" programs that don't properly honor enforcement
      settings, or is this an inheritance problem that I'm not correctly
      addressing?<br>
    </p>
    <br>
  </body>
</html>

--------------70436F429B0E0D9794B5E105--


--===============3369780324328455580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============3369780324328455580==--


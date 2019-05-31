Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 834B431556
	for <lists+apparmor@lfdr.de>; Fri, 31 May 2019 21:28:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hWnBx-0008Qy-1G; Fri, 31 May 2019 19:27:53 +0000
Received: from secure.zestysoft.com ([63.205.203.253])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@zestysoft.com>) id 1hWnBu-0008QV-Cc
 for apparmor@lists.ubuntu.com; Fri, 31 May 2019 19:27:50 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by secure.zestysoft.com (Postfix) with ESMTP id 151CFADC00F
 for <apparmor@lists.ubuntu.com>; Fri, 31 May 2019 12:27:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com 151CFADC00F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1559330868;
 bh=Db55q+fYKvpd5mjv7F3coRKDyZi38e6XhzX3QsPgNFM=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=4XklPuihdoQWoUEcp7YJLSKJz2NME4XckVJhIge6Gf0SiH1SkfSpNH4VTbGVfcnR1
 tevOvdMaj8b0z643ltj7Ogm8iDCdb36KIzpNZwzgIJv+NAEPvXy/XNaF5qOKgBOUko
 JF9jZ0kozpb2DkaksVGyLYcJ2kYRUnKXYpCj8t+o=
X-Virus-Scanned: amavisd-new at zestysoft.com
Received: from secure.zestysoft.com ([127.0.0.1])
 by localhost (secure.zestysoft.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D-BBPVJ8rGTm for <apparmor@lists.ubuntu.com>;
 Fri, 31 May 2019 12:27:46 -0700 (PDT)
Received: from [172.20.3.88] (unknown [4.79.43.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by secure.zestysoft.com (Postfix) with ESMTPSA id 5C8DBADC00E
 for <apparmor@lists.ubuntu.com>; Fri, 31 May 2019 12:27:46 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com 5C8DBADC00E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1559330866;
 bh=Db55q+fYKvpd5mjv7F3coRKDyZi38e6XhzX3QsPgNFM=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=XDzBFJaHgMCzFFuFLwJHvAUGn5rCm0Sl9VWJYycIVWK9YB0aKdWcAHzI9KnZIgdMr
 8HYkU07Z/yVEhmtac0T3p7MVp4+75E+sjeWjFb9vI/gBlsRtmhLBZOnHDi5+1iJb4W
 EJtjzjuN57fjgBzzd1hdt6nhv7Zf8Li4Rx9lcX9o=
To: apparmor@lists.ubuntu.com
References: <7979059d-044a-3f1a-83f9-8254a8a51daa@zestysoft.com>
 <20190525001053.GB6058@hunt>
 <734c73ce-1e25-cc3a-ed3d-7edae3ee94fc@canonical.com>
 <77776c98-473e-eb98-2fe6-c29a1bfa7e28@zestysoft.com>
 <859df47c-6c0d-0be4-4590-6b05ce0fd0a0@zestysoft.com>
 <7ec74901-7e32-b279-01b6-fddf38b7d1d1@zestysoft.com>
 <20190530190434.GA30663@horizon>
From: Ian <apparmor@zestysoft.com>
Message-ID: <de0466db-4362-e25a-a334-59c88af82ac3@zestysoft.com>
Date: Fri, 31 May 2019 12:27:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190530190434.GA30663@horizon>
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
Content-Type: multipart/mixed; boundary="===============6303004847395176308=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is a multi-part message in MIME format.
--===============6303004847395176308==
Content-Type: multipart/alternative;
 boundary="------------579C848D83139B95807B4420"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------579C848D83139B95807B4420
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/30/19 12:04 PM, Simon McVittie wrote:
> On Thu, 30 May 2019 at 11:47:35 -0700, Ian wrote:
>> I did notice this in /var/log/syslog:
>>
>>      May 30 10:46:51 1546-w-dev dbus-daemon[9496]: [system] Activating systemd
>>      to hand-off: service name='org.freedesktop.hostname1' unit=
>>      'dbus-org.freedesktop.hostname1.service' requested by ':1.21' (uid=0 pid=
>>      10058 comm="/usr/sbin/NetworkManager --no-daemon " label=
>>      "usr.sbin.NetworkManager (complain)"
> This does not, in itself, indicate a bug. Whenever dbus-daemon logs an
> "interesting" action like service activation, it logs all the information
> it knows about the requesting process, which on AppArmor systems includes
> the AppArmor label.
>
> (complain) means the usr.sbin.NetworkManager profile is loaded in
> "complain" mode, meaning that if NM does anything that would violate its
> AppArmor policy, it will be logged as ALLOWED and allowed to happen,
> instead of being denied. If this is not what you wanted, please look
> more closely at your AppArmor policies.
>
>      smcv

Simon, thanks for clearing that one up.

I was able to get the system to fully boot by changing

       /** Px,

to

       /** px,

in the lib.systemd.systemd post chroot profile.

The only thing outstanding is some trouble I run into after the 
initramfs chroot transition but before the apparmor service starts:

    May 31 12:10:55 1546-w-dev audit[5162]: AVC apparmor="ALLOWED"
    operation="exec" info="profile transition not found" error=-13
    profile="init-sys
    temd" name="/usr/bin/unshare" pid=5162 comm="(spawn)"
    requested_mask="x" denied_mask="x" fsuid=0 ouid=0
    target="/usr/bin/unshare"
    May 31 12:10:54 1546-w-dev audit[5004]: AVC apparmor="ALLOWED"
    operation="exec" info="profile transition not found" error=-13
    profile="init-sys
    temd" name="/usr/bin/unshare" pid=5004 comm="(spawn)"
    requested_mask="x" denied_mask="x" fsuid=0 ouid=0
    target="/usr/bin/unshare"


    [   42.159486] apparmor[635]:  * Starting AppArmor profiles

    [   49.102218] [5004]: failed to execute '/usr/bin/unshare'
    '/usr/bin/unshare -m /usr/bin/snap auto-import --mount=/dev/sda1':
    Permission denied
    [   49.106734] systemd-udevd[699]: Process '/usr/bin/unshare -m
    /usr/bin/snap auto-import --mount=/dev/sda1' failed with exit code 2.

    [   49.119734] [5162]: failed to execute '/usr/bin/unshare'
    '/usr/bin/unshare -m /usr/bin/snap auto-import --mount=/dev/dm-1':
    Permission denied
    [   49.124361] systemd-udevd[5160]: Process '/usr/bin/unshare -m
    /usr/bin/snap auto-import --mount=/dev/dm-1' failed with exit code 2.

    [  *** ] A start job is running for AppArmor initialization (15s /
    no limit)

    [   56.349850] auditd[753]: Audit daemon rotating log files
    [  OK  ] Started AppArmor initialization.

The /usr/sbin/unshare profile exists:

    root@1546-w-dev:/etc/apparmor.d# cat usr.bin.unshare
    profile usr.bin.unshare /usr/bin/unshare
    flags=(complain,attach_disconnected) {
         #include <local/whitelist>
    }


    root@1546-w-dev:/etc/apparmor.d# cat local/whitelist
         network,
         signal,
         mount,
         pivot_root,
         ptrace,
         unix,
         dbus,
         umount,
         capability,
         / mrwlk,
         /** mrwlk,
         /** px,

As does /usr/bin/snap profile:

    root@1546-w-dev:/etc/apparmor.d# cat usr.bin.snap
    profile usr.bin.snap /usr/bin/snap
    flags=(complain,attach_disconnected) {
         #include <local/whitelist>
    }

aa-status shows both of these loaded under "complain".

Is this a timing thing?  Something attempting to load as apparmor 
transitions? I.E. apparmor is still loading profiles when 
/usr/bin/unshare is being executed?


--------------579C848D83139B95807B4420
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/30/19 12:04 PM, Simon McVittie
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20190530190434.GA30663@horizon">
      <pre class="moz-quote-pre" wrap="">On Thu, 30 May 2019 at 11:47:35 -0700, Ian wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I did notice this in /var/log/syslog:

    May 30 10:46:51 1546-w-dev dbus-daemon[9496]: [system] Activating systemd
    to hand-off: service name='org.freedesktop.hostname1' unit=
    'dbus-org.freedesktop.hostname1.service' requested by ':1.21' (uid=0 pid=
    10058 comm="/usr/sbin/NetworkManager --no-daemon " label=
    "usr.sbin.NetworkManager (complain)"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This does not, in itself, indicate a bug. Whenever dbus-daemon logs an
"interesting" action like service activation, it logs all the information
it knows about the requesting process, which on AppArmor systems includes
the AppArmor label.

(complain) means the usr.sbin.NetworkManager profile is loaded in
"complain" mode, meaning that if NM does anything that would violate its
AppArmor policy, it will be logged as ALLOWED and allowed to happen,
instead of being denied. If this is not what you wanted, please look
more closely at your AppArmor policies.

    smcv
</pre>
    </blockquote>
    <p>Simon, thanks for clearing that one up.<br>
    </p>
    <p>I was able to get the system to fully boot by changing</p>
    <blockquote>
      <p>  /** Px,<br>
      </p>
    </blockquote>
    <p>to</p>
    <blockquote>
      <p>  /** px,<br>
      </p>
    </blockquote>
    <p>in the lib.systemd.systemd post chroot profile.</p>
    <p>The only thing outstanding is some trouble I run into after the
      initramfs chroot transition but before the apparmor service
      starts:</p>
    <blockquote>
      <p>May 31 12:10:55 1546-w-dev audit[5162]: AVC apparmor="ALLOWED"
        operation="exec" info="profile transition not found" error=-13
        profile="init-sys<br>
        temd" name="/usr/bin/unshare" pid=5162 comm="(spawn)"
        requested_mask="x" denied_mask="x" fsuid=0 ouid=0
        target="/usr/bin/unshare"<br>
        May 31 12:10:54 1546-w-dev audit[5004]: AVC apparmor="ALLOWED"
        operation="exec" info="profile transition not found" error=-13
        profile="init-sys<br>
        temd" name="/usr/bin/unshare" pid=5004 comm="(spawn)"
        requested_mask="x" denied_mask="x" fsuid=0 ouid=0
        target="/usr/bin/unshare"<br>
      </p>
    </blockquote>
    <p><br>
    </p>
    <blockquote>
      <p>[   42.159486] apparmor[635]:  * Starting AppArmor profiles  <br>
      </p>
      <p>[   49.102218] [5004]: failed to execute '/usr/bin/unshare'
        '/usr/bin/unshare -m /usr/bin/snap auto-import
        --mount=/dev/sda1': Permission
denied                                                                                                                                  
        <br>
        [   49.106734] systemd-udevd[699]: Process '/usr/bin/unshare -m
        /usr/bin/snap auto-import --mount=/dev/sda1' failed with exit
        code
2.                                                                                                                                             
        <br>
                                                                                                                                                                                                             
        <br>
        [   49.119734] [5162]: failed to execute '/usr/bin/unshare'
        '/usr/bin/unshare -m /usr/bin/snap auto-import
        --mount=/dev/dm-1': Permission
denied                                                                                                                                  
        <br>
        [   49.124361] systemd-udevd[5160]: Process '/usr/bin/unshare -m
        /usr/bin/snap auto-import --mount=/dev/dm-1' failed with exit
        code 2.</p>
      <p>[  *** ] A start job is running for AppArmor initialization
        (15s / no limit)</p>
      <p>[   56.349850] auditd[753]: Audit daemon rotating log
files                                                                                                                                           
        <br>
        [  OK  ] Started AppArmor initialization.   <br>
      </p>
    </blockquote>
    <p>The /usr/sbin/unshare profile exists:<br>
    </p>
    <blockquote>
      <p><a class="moz-txt-link-abbreviated" href="mailto:root@1546-w-dev:/etc/apparmor.d#">root@1546-w-dev:/etc/apparmor.d#</a> cat usr.bin.unshare <br>
        profile usr.bin.unshare /usr/bin/unshare
        flags=(complain,attach_disconnected) {<br>
            #include &lt;local/whitelist&gt;<br>
        }<br>
      </p>
    </blockquote>
    <p><br>
    </p>
    <blockquote>
      <p><a class="moz-txt-link-abbreviated" href="mailto:root@1546-w-dev:/etc/apparmor.d#">root@1546-w-dev:/etc/apparmor.d#</a> cat local/whitelist <br>
            network,<br>
            signal,<br>
            mount,<br>
            pivot_root,<br>
            ptrace,<br>
            unix,<br>
            dbus,<br>
            umount,<br>
            capability,<br>
            / mrwlk,<br>
            /** mrwlk,<br>
            /** px,<br>
      </p>
    </blockquote>
    <p>As does /usr/bin/snap profile:</p>
    <blockquote>
      <p><a class="moz-txt-link-abbreviated" href="mailto:root@1546-w-dev:/etc/apparmor.d#">root@1546-w-dev:/etc/apparmor.d#</a> cat usr.bin.snap<br>
        profile usr.bin.snap /usr/bin/snap
        flags=(complain,attach_disconnected) {<br>
            #include &lt;local/whitelist&gt;<br>
        }<br>
      </p>
    </blockquote>
    <p>aa-status shows both of these loaded under "complain".</p>
    <p>Is this a timing thing?  Something attempting to load as apparmor
      transitions? I.E. apparmor is still loading profiles when
      /usr/bin/unshare is being executed?<br>
    </p>
  </body>
</html>

--------------579C848D83139B95807B4420--


--===============6303004847395176308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============6303004847395176308==--


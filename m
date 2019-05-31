Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CE6316DC
	for <lists+apparmor@lfdr.de>; Fri, 31 May 2019 23:59:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hWpZ0-0001E8-JT; Fri, 31 May 2019 21:59:50 +0000
Received: from secure.zestysoft.com ([63.205.203.253])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@zestysoft.com>) id 1hWpYx-0001Du-Vn
 for apparmor@lists.ubuntu.com; Fri, 31 May 2019 21:59:48 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by secure.zestysoft.com (Postfix) with ESMTP id C66DCADC00F
 for <apparmor@lists.ubuntu.com>; Fri, 31 May 2019 14:59:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com C66DCADC00F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1559339985;
 bh=bCQ75sJGRcHALgDOQiEsGmKmLL7W2I/Mn58R4l1vQNc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=CggSf0nXwa161O1PdMiFWQU8lU61vxWUUVY2F2LSaCAXvlaTdsfoL9dsBDOUjquKP
 ErEwxhfSlGPbaH4eEi7yQTVu+SVX5zRy8ljyDmv1Ws1Co98NVnIS/4G6B2ifGPXAXc
 esfbyYpagA92D0oC0jFHjSS/Q7lUdNc06TEviBs8=
X-Virus-Scanned: amavisd-new at zestysoft.com
Received: from secure.zestysoft.com ([127.0.0.1])
 by localhost (secure.zestysoft.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fs8gUfvuBkv7 for <apparmor@lists.ubuntu.com>;
 Fri, 31 May 2019 14:59:43 -0700 (PDT)
Received: from [172.20.3.88] (unknown [4.79.43.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by secure.zestysoft.com (Postfix) with ESMTPSA id AAED9ADC00E
 for <apparmor@lists.ubuntu.com>; Fri, 31 May 2019 14:59:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com AAED9ADC00E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1559339983;
 bh=bCQ75sJGRcHALgDOQiEsGmKmLL7W2I/Mn58R4l1vQNc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=flvyoMAq5iQOU2n3jlWrazJ78IPtPIe/H/Rts8fVSW0kP8F34sn3rS7qnaUNiBN/t
 z2XI5R49l7oIhIGU3WaX2UzwhfKldXgB3JZ6wnnyBDhIyWPtkJie1d7DzqC9gOLg9Y
 DgDAEH6GLMw+xpISJTtz770Z1BvS1X/bps8prF60=
To: apparmor@lists.ubuntu.com
References: <7979059d-044a-3f1a-83f9-8254a8a51daa@zestysoft.com>
 <20190525001053.GB6058@hunt>
 <734c73ce-1e25-cc3a-ed3d-7edae3ee94fc@canonical.com>
 <77776c98-473e-eb98-2fe6-c29a1bfa7e28@zestysoft.com>
 <859df47c-6c0d-0be4-4590-6b05ce0fd0a0@zestysoft.com>
 <7ec74901-7e32-b279-01b6-fddf38b7d1d1@zestysoft.com>
 <20190530190434.GA30663@horizon>
 <de0466db-4362-e25a-a334-59c88af82ac3@zestysoft.com>
From: Ian <apparmor@zestysoft.com>
Message-ID: <d78ac3ce-24c1-631a-930d-b66613ee1fdf@zestysoft.com>
Date: Fri, 31 May 2019 14:59:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <de0466db-4362-e25a-a334-59c88af82ac3@zestysoft.com>
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
Content-Type: multipart/mixed; boundary="===============1313929951172234785=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is a multi-part message in MIME format.
--===============1313929951172234785==
Content-Type: multipart/alternative;
 boundary="------------4E7E57B70542429D0C1EED5D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4E7E57B70542429D0C1EED5D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, 31 May 2019, Jamie wrote:
> On Fri, 31 May 2019, Ian wrote:
>
>>/The only thing outstanding is some trouble I run into after the initramfs />>/chroot transition but before the apparmor service starts: />>//>>/May 31 12:10:55 1546-w-dev audit[5162]: AVC apparmor="ALLOWED" />>/operation="exec" info="profile transition not found" error=-13 />>/profile="init-sys />>/temd" name="/usr/bin/unshare" pid=5162 comm="(spawn)" />>/requested_mask="x" denied_mask="x" fsuid=0 ouid=0 />>/target="/usr/bin/unshare" />>/May 31 12:10:54 1546-w-dev audit[5004]: AVC apparmor="ALLOWED" />>/operation="exec" info="profile transition not found" error=-13 />>/profile="init-sys />>/temd" name="/usr/bin/unshare" pid=5004 comm="(spawn)" />>/requested_mask="x" denied_mask="x" fsuid=0 ouid=0 />>/target="/usr/bin/unshare" />
>Notice it is /usr/bin/unshare here, but you mention below that
>'/usr/sbin/unshare' exists, but what you pasted looks correct. Is this a typo
>in the email or somewhere else?
>
>>/The /usr/sbin/unshare profile exists: />>//>>/root at 1546-w-dev 
<https://lists.ubuntu.com/mailman/listinfo/apparmor>:/etc/apparmor.d# 
cat usr.bin.unshare />>/profile usr.bin.unshare /usr/bin/unshare />>/flags=(complain,attach_disconnected) { />>/    #include <local/whitelist> />>/} /

Jamie,

That was a typo in the email. There is no /usr/sbin/unshare executable 
or profile.

After everything loads, if I restart the "lvm2-pvscan@8:1" service that 
I think is responsible for those errors during boot (systemctl shows it 
as failed), it all works correctly.

---


On a different topic, when I attempted to run 'apt update', this happens:

    type=AVC msg=audit(1559334318.936:8850): apparmor="ALLOWED" operation="exec" info="no new privs" error=-1 profile="usr.lib.apt.methods.gpgv" name="/usr/bin/apt-key" pid=11011 comm="gpgv" requested_mask="x" denied_mask="x" fsuid=104 ouid=0 target="usr.bin.apt_key"
    type=AVC msg=audit(1559334319.212:8851): apparmor="ALLOWED" operation="exec" info="no new privs" error=-1 profile="usr.lib.apt.methods.gpgv" name="/usr/bin/apt-key" pid=11013 comm="gpgv" requested_mask="x" denied_mask="x" fsuid=104 ouid=0 target="usr.bin.apt_key"
    type=AVC msg=audit(1559334319.228:8852): apparmor="ALLOWED" operation="exec" info="no new privs" error=-1 profile="usr.lib.apt.methods.gpgv" name="/usr/bin/apt-key" pid=11015 comm="gpgv" requested_mask="x" denied_mask="x" fsuid=104 ouid=0 target="usr.bin.apt_key"
    type=AVC msg=audit(1559334319.332:8853): apparmor="ALLOWED" operation="exec" info="no new privs" error=-1 profile="usr.lib.apt.methods.gpgv" name="/usr/bin/apt-key" pid=11017 comm="gpgv" requested_mask="x" denied_mask="x" fsuid=104 ouid=0 target="usr.bin.apt_key"


    W: An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: http://us.archive.ubuntu.com/ubuntu bionic InRelease: Couldn't execute /usr/bin/apt-key to check /var/lib/apt/lists/us.archive.ubuntu.com_ubuntu_dists_bionic_InRelease
    W: An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: http://us.archive.ubuntu.com/ubuntu bionic-updates InRelease: Couldn't execute /usr/bin/apt-key to check /var/lib/apt/lists/partial/us.archive.ubuntu.com_ubuntu_dists_bionic-updates_InRelease
    W: An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: http://security.ubuntu.com/ubuntu bionic-security InRelease: Couldn't execute /usr/bin/apt-key to check /var/lib/apt/lists/partial/security.ubuntu.com_ubuntu_dists_bionic-security_InRelease
    W: An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: http://us.archive.ubuntu.com/ubuntu bionic-backports InRelease: Couldn't execute /usr/bin/apt-key to check /var/lib/apt/lists/partial/us.archive.ubuntu.com_ubuntu_dists_bionic-backports_InRelease


It's not clear to me why it thinks I would be requesting new privs when 
all of the profiles I've created have the exact same priv requests.  
It's also odd that apparmor is stating "ALLOWED" but then still blocking 
the execution?

Running pstree at the same time as apt shows the following order: 
systemd, sshd, sshd, sshd, bash, sudo, bash, apt, gpgv (and http, http), 
gpgv

    root@1546-w-dev:/etc/apparmor.d# cat usr.lib.apt.methods.gpgv
    profile usr.lib.apt.methods.gpgv /usr/lib/apt/methods/gpgv
    flags=(complain) {
         #include <local/whitelist>
    }


    root@1546-w-dev:/etc/apparmor.d# cat usr.bin.apt_key
    profile usr.bin.apt_key /usr/bin/apt-key flags=(complain) {
         #include <local/whitelist>
    }


Have I ran into this? 
https://lists.ubuntu.com/archives/apparmor/2018-November/011846.html

    root@1546-w-dev:/etc/apparmor.d# uname -r
    4.15.0-50-generic

I see this problem with 'man' too.

I'm sooo close to getting this working...


--------------4E7E57B70542429D0C1EED5D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre style="white-space: pre-wrap; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">On Fri, 31 May 2019, Jamie wrote:
&gt; On Fri, 31 May 2019, Ian wrote:
&gt;
&gt;&gt;<i> The only thing outstanding is some trouble I run into after the initramfs
</i>&gt;&gt;<i> chroot transition but before the apparmor service starts:
</i>&gt;&gt;<i> 
</i>&gt;&gt;<i>    May 31 12:10:55 1546-w-dev audit[5162]: AVC apparmor="ALLOWED"
</i>&gt;&gt;<i>    operation="exec" info="profile transition not found" error=-13
</i>&gt;&gt;<i>    profile="init-sys
</i>&gt;&gt;<i>    temd" name="/usr/bin/unshare" pid=5162 comm="(spawn)"
</i>&gt;&gt;<i>    requested_mask="x" denied_mask="x" fsuid=0 ouid=0
</i>&gt;&gt;<i>    target="/usr/bin/unshare"
</i>&gt;&gt;<i>    May 31 12:10:54 1546-w-dev audit[5004]: AVC apparmor="ALLOWED"
</i>&gt;&gt;<i>    operation="exec" info="profile transition not found" error=-13
</i>&gt;&gt;<i>    profile="init-sys
</i>&gt;&gt;<i>    temd" name="/usr/bin/unshare" pid=5004 comm="(spawn)"
</i>&gt;&gt;<i>    requested_mask="x" denied_mask="x" fsuid=0 ouid=0
</i>&gt;&gt;<i>    target="/usr/bin/unshare"
</i>&gt;
&gt;Notice it is /usr/bin/unshare here, but you mention below that
&gt;'/usr/sbin/unshare' exists, but what you pasted looks correct. Is this a typo
&gt;in the email or somewhere else?
&gt;
&gt;&gt;<i> The /usr/sbin/unshare profile exists:
</i>&gt;&gt;<i> 
</i>&gt;&gt;<i>    <a href="https://lists.ubuntu.com/mailman/listinfo/apparmor">root at 1546-w-dev</a>:/etc/apparmor.d# cat usr.bin.unshare
</i>&gt;&gt;<i>    profile usr.bin.unshare /usr/bin/unshare
</i>&gt;&gt;<i>    flags=(complain,attach_disconnected) {
</i>&gt;&gt;<i>         #include &lt;local/whitelist&gt;
</i>&gt;&gt;<i>    }
</i>
</pre>
    Jamie,<br>
    <br>
    That was a typo in the email. There is no /usr/sbin/unshare
    executable or profile.<br>
    <br>
    After everything loads, if I restart the "lvm2-pvscan@8:1" service
    that I think is responsible for those errors during boot (systemctl
    shows it as failed), it all works correctly.<br>
    <br>
    --- <br>
    <br>
    <br>
    On a different topic, when I attempted to run 'apt update', this
    happens:<br>
    <br>
    <blockquote>
      <pre style="white-space: pre-wrap; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">type=AVC msg=audit(1559334318.936:8850): apparmor="ALLOWED" operation="exec" info="no new privs" error=-1 profile="usr.lib.apt.methods.gpgv" name="/usr/bin/apt-key" pid=11011 comm="gpgv" requested_mask="x" denied_mask="x" fsuid=104 ouid=0 target="usr.bin.apt_key"
type=AVC msg=audit(1559334319.212:8851): apparmor="ALLOWED" operation="exec" info="no new privs" error=-1 profile="usr.lib.apt.methods.gpgv" name="/usr/bin/apt-key" pid=11013 comm="gpgv" requested_mask="x" denied_mask="x" fsuid=104 ouid=0 target="usr.bin.apt_key"
type=AVC msg=audit(1559334319.228:8852): apparmor="ALLOWED" operation="exec" info="no new privs" error=-1 profile="usr.lib.apt.methods.gpgv" name="/usr/bin/apt-key" pid=11015 comm="gpgv" requested_mask="x" denied_mask="x" fsuid=104 ouid=0 target="usr.bin.apt_key"
type=AVC msg=audit(1559334319.332:8853): apparmor="ALLOWED" operation="exec" info="no new privs" error=-1 profile="usr.lib.apt.methods.gpgv" name="/usr/bin/apt-key" pid=11017 comm="gpgv" requested_mask="x" denied_mask="x" fsuid=104 ouid=0 target="usr.bin.apt_key"


W: An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: <a class="moz-txt-link-freetext" href="http://us.archive.ubuntu.com/ubuntu">http://us.archive.ubuntu.com/ubuntu</a> bionic InRelease: Couldn't execute /usr/bin/apt-key to check /var/lib/apt/lists/us.archive.ubuntu.com_ubuntu_dists_bionic_InRelease
W: An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: <a class="moz-txt-link-freetext" href="http://us.archive.ubuntu.com/ubuntu">http://us.archive.ubuntu.com/ubuntu</a> bionic-updates InRelease: Couldn't execute /usr/bin/apt-key to check /var/lib/apt/lists/partial/us.archive.ubuntu.com_ubuntu_dists_bionic-updates_InRelease
W: An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: <a class="moz-txt-link-freetext" href="http://security.ubuntu.com/ubuntu">http://security.ubuntu.com/ubuntu</a> bionic-security InRelease: Couldn't execute /usr/bin/apt-key to check /var/lib/apt/lists/partial/security.ubuntu.com_ubuntu_dists_bionic-security_InRelease
W: An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: <a class="moz-txt-link-freetext" href="http://us.archive.ubuntu.com/ubuntu">http://us.archive.ubuntu.com/ubuntu</a> bionic-backports InRelease: Couldn't execute /usr/bin/apt-key to check /var/lib/apt/lists/partial/us.archive.ubuntu.com_ubuntu_dists_bionic-backports_InRelease
</pre>
    </blockquote>
    <br>
    <p>It's not clear to me why it thinks I would be requesting new
      privs when all of the profiles I've created have the exact same
      priv requests.  It's also odd that apparmor is stating "ALLOWED"
      but then still blocking the execution?</p>
    <p>Running pstree at the same time as apt shows the following order:
      systemd, sshd, sshd, sshd, bash, sudo, bash, apt, gpgv (and http,
      http), gpgv
    </p>
    <blockquote>
      <p><a class="moz-txt-link-abbreviated" href="mailto:root@1546-w-dev:/etc/apparmor.d#">root@1546-w-dev:/etc/apparmor.d#</a> cat usr.lib.apt.methods.gpgv <br>
        profile usr.lib.apt.methods.gpgv /usr/lib/apt/methods/gpgv
        flags=(complain) {<br>
            #include &lt;local/whitelist&gt;<br>
        }</p>
      <p><br>
      </p>
      <p><a class="moz-txt-link-abbreviated" href="mailto:root@1546-w-dev:/etc/apparmor.d#">root@1546-w-dev:/etc/apparmor.d#</a> cat usr.bin.apt_key<br>
        profile usr.bin.apt_key /usr/bin/apt-key flags=(complain) {<br>
            #include &lt;local/whitelist&gt;<br>
        }</p>
    </blockquote>
    <p><br>
    </p>
    <p>Have I ran into this? 
      <a class="moz-txt-link-freetext" href="https://lists.ubuntu.com/archives/apparmor/2018-November/011846.html">https://lists.ubuntu.com/archives/apparmor/2018-November/011846.html</a></p>
    <blockquote>
      <p><a class="moz-txt-link-abbreviated" href="mailto:root@1546-w-dev:/etc/apparmor.d#">root@1546-w-dev:/etc/apparmor.d#</a> uname -r<br>
        4.15.0-50-generic<br>
      </p>
    </blockquote>
    <p>I see this problem with 'man' too.</p>
    <p>I'm sooo close to getting this working... <br>
    </p>
  </body>
</html>

--------------4E7E57B70542429D0C1EED5D--


--===============1313929951172234785==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============1313929951172234785==--


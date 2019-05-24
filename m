Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 120F02A14B
	for <lists+apparmor@lfdr.de>; Sat, 25 May 2019 00:28:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hUIfv-0006ZM-Rx; Fri, 24 May 2019 22:28:31 +0000
Received: from secure.zestysoft.com ([63.205.203.253])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@zestysoft.com>) id 1hUIft-0006ZG-64
 for apparmor@lists.ubuntu.com; Fri, 24 May 2019 22:28:29 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by secure.zestysoft.com (Postfix) with ESMTP id DA6D2ADC00F
 for <apparmor@lists.ubuntu.com>; Fri, 24 May 2019 15:28:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com DA6D2ADC00F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1558736905;
 bh=wddAZWr7h3izrkktYrBuvWXy9I80z2N5DLQb/bQhywo=;
 h=To:From:Subject:Date:From;
 b=obnrYOnTFhcxgWwVy/0nKKIqwopKvFYiJbTzD/WLUStW+xl/gASwxIr9YznzE+K6W
 RyLlHh7TknSI3h3o/70qa9IntiJfVSZ6YT2VFM0hhPRpvora284yKno0Si7X3Tf8Lx
 MI5ioQdv5EH8IJlA8TcXfw96qDKngsaSXy5WEy/U=
X-Virus-Scanned: amavisd-new at zestysoft.com
Received: from secure.zestysoft.com ([127.0.0.1])
 by localhost (secure.zestysoft.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pcz684mWaqSy for <apparmor@lists.ubuntu.com>;
 Fri, 24 May 2019 15:28:20 -0700 (PDT)
Received: from [172.20.3.88] (unknown [4.79.43.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by secure.zestysoft.com (Postfix) with ESMTPSA id 68D0BADC00E
 for <apparmor@lists.ubuntu.com>; Fri, 24 May 2019 15:28:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com 68D0BADC00E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1558736900;
 bh=wddAZWr7h3izrkktYrBuvWXy9I80z2N5DLQb/bQhywo=;
 h=To:From:Subject:Date:From;
 b=E7ptFsiOufvkpgdxnpvHwJeDaSGa9E9jh+rs9UXVSzjiohdrM/3dYNlFqrJUFvqM+
 Jqb8QGc0xK5EQ0PyNnJjr+dJKgiQB8MrItALJcf3FBdrouqE2HEH6BF+QF/XfsMpNf
 E7/ZjAp30Ce8UJPM+ILL2qUMTJpZ5aYtYBBPwIhQ=
To: apparmor@lists.ubuntu.com
From: Ian <apparmor@zestysoft.com>
Message-ID: <7979059d-044a-3f1a-83f9-8254a8a51daa@zestysoft.com>
Date: Fri, 24 May 2019 15:28:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [apparmor] Attempting FullSystemPolicy with Ubuntu 18.04.2 LTS...
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
Content-Type: multipart/mixed; boundary="===============7090822325804654264=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is a multi-part message in MIME format.
--===============7090822325804654264==
Content-Type: multipart/alternative;
 boundary="------------55BBED8B3CD1B4620795BB3E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------55BBED8B3CD1B4620795BB3E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

I've followed the wiki article here:

https://gitlab.com/apparmor/apparmor/wikis/FullSystemPolicy

However, I've got a number of questions I was hoping someone could help 
clarify for me.
First, let me walk through what I did after step 6 (reboot after 
update-initramfs -u):
 From the console during boot:

    Begin: Running /scripts/init-bottom ... Warning from stdin (line 1):
    /sbin/apparmor_parser: cannot use or update cache, disable, or
    forc[   36.264702] audit: type=1400 audit(1558716282.248:2):
    apparmor="STATUS" operation="profile_load" profile="unconfined"
    name="init-systemd"
    e-complain via stdin
    done.
    [   36.380094] audit: type=1400 audit(1558716282.360:3):
    apparmor="ALLOWED" operation="open" profile="init-systemd"
    name="/etc/ld.so.cache" pid=1 comm="init" requested_mask="r"
    denied_mask="r" fsuid=0 ouid=0
    [   36.383988] audit: type=1400 audit(1558716282.364:4):
    apparmor="ALLOWED" operation="open" profile="init-systemd"
    name="/lib/x86_64-linux-gnu/libc-2.27.so" pid=1 comm="init"
    requested_mask="r" denied_mask="r" fsuid=0 ouid=0
    [   36.389412] audit: type=1400 audit(1558716282.372:5):
    apparmor="ALLOWED" operation="file_mmap" profile="init-systemd"
    name="/lib/x86_64-linux-gnu/libc-2.27.so" pid=1 comm="init"
    requested_mask="rm" denied_mask="rm" fsuid=0 ouid=0
    [   36.393851] audit: type=1400 audit(1558716282.376:6):
    apparmor="ALLOWED" operation="open" profile="init-systemd"
    name="/lib/systemd/libsystemd-shared-237.so" pid=1 comm="init"
    requested_mask="r" denied_mask="r" fsuid=0 ouid=0
    [   36.397457] audit: type=1400 audit(1558716282.380:7):
    apparmor="ALLOWED" operation="file_mmap" profile="init-systemd"
    name="/lib/systemd/libsystemd-shared-237.so" pid=1 comm="init"
    requested_mask="rm" denied_mask="rm" fsuid=0 ouid=0
    [   36.401758] audit: type=1400 audit(1558716282.384:8):
    apparmor="ALLOWED" operation="open" profile="init-systemd"
    name="/lib/x86_64-linux-gnu/librt-2.27.so" pid=1 comm="init"
    requested_mask="r" denied_mask="r" fsuid=0 ouid=0
    [   36.409685] audit: type=1400 audit(1558716282.392:9):
    apparmor="ALLOWED" operation="file_mmap" profile="init-systemd"
    name="/lib/x86_64-linux-gnu/librt-2.27.so" pid=1 comm="init"
    requested_mask="rm" denied_mask="rm" fsuid=0 ouid=0
    [   36.413464] audit: type=1400 audit(1558716282.396:10):
    apparmor="ALLOWED" operation="open" profile="init-systemd"
    name="/lib/x86_64-linux-gnu/libseccomp.so.2.3.1" pid=1 comm="init"
    requested_mask="r" denied_mask="r" fsuid=0 ouid=0
    [   36.416835] audit: type=1400 audit(1558716282.400:11):
    apparmor="ALLOWED" operation="file_mmap" profile="init-systemd"
    name="/lib/x86_64-linux-gnu/libseccomp.so.2.3.1" pid=1 comm="init"
    requested_mask="rm" denied_mask="rm" fsuid=0 ouid=0


Now, since the init-systemd profile doesn't contain any rules, this is 
expected (and wanted).  However, I tried a number of things to get rid 
of them and only one of them worked.

First, to make sure I understand what those log entries are saying:

the "init" program is attempted to read and/or memory map certain files, 
however due to the init-systemd profile, if it wasn't set to complain, 
these actions would have been blocked.

My first thought was to create a new init profile .. something like:

    profile init /init flags=(complain) {

         # init in initramfs is at the root, not /sbin/

         /etc/ld.so.cache    r,

         /lib/**                    rm,

    }

however after adding a new apparmor_parser command to the apparmor 
script to load this in init-bottom, nothing changed after reboot.

So then I thought I needed to create a sub profile within the 
init-systemd profile for init, however, I probably didn't do this 
correctly, or it just won't work:

    /init        Cx -> init


    profile init flags=(complain) {

         /etc/ld.so.cache r,

         /lib/**                rm,

    }

Again, those same log entries returned.

What worked was to modify the init-systemd profile directly:

    profile init-systemd /lib/systemd/systemd flags=(complain) {

         /etc/ld.so.cache    r,
         /lib/**            rm,

    }

However, this isn't ideal because, I think, it means all things that 
systemd runs inherits these permissions, not just init.

I noticed something else too -- after that worked, I got a new list of 
additional audit messages:

    [   38.840399] audit: type=1400 audit(1558733899.848:5):
    apparmor="ALLOWED" operation="open" profile="init-systemd"
    name="/usr/lib/x86_64-linux-gnu/libip4tc.so.0.1.0" pid=1 comm="init"
    requested_mask="r" denied_mask="r" fsuid=0 ouid=0
    [   38.843656] audit: type=1400 audit(1558733899.848:6):
    apparmor="ALLOWED" operation="file_mmap" profile="init-systemd"
    name="/usr/lib/x86_64-linux-gnu/libip4tc.so.0.1.0" pid=1 comm="init"
    requested_mask="rm" denied_mask="rm" fsuid=0 ouid=0
    [   38.852170] audit: type=1400 audit(1558733899.860:7):
    apparmor="ALLOWED" operation="open" profile="init-systemd"
    name="/usr/lib/x86_64-linux-gnu/liblz4.so.1.7.1" pid=1 comm="init"
    requested_mask="r" denied_mask="r" fsuid=0 ouid=0
    [   38.855990] audit: type=1400 audit(1558733899.860:8):
    apparmor="ALLOWED" operation="file_mmap" profile="init-systemd"
    name="/usr/lib/x86_64-linux-gnu/liblz4.so.1.7.1" pid=1 comm="init"
    requested_mask="rm" denied_mask="rm" fsuid=0 ouid=0
    [   38.871219] audit: type=1400 audit(1558733899.876:9):
    apparmor="ALLOWED" operation="open" profile="init-systemd"
    name="/usr/lib/x86_64-linux-gnu/libargon2.so.0" pid=1 comm="init"
    requested_mask="r" denied_mask="r" fsuid=0 ouid=0
    [   38.888320] audit: type=1400 audit(1558733899.896:10):
    apparmor="ALLOWED" operation="file_mmap" profile="init-systemd"
    name="/usr/lib/x86_64-linux-gnu/libargon2.so.0" pid=1 comm="init"
    requested_mask="rm" denied_mask="rm" fsuid=0 ouid=0
    [   38.938441] audit: type=1400 audit(1558733899.944:11):
    apparmor="ALLOWED" operation="open" profile="init-systemd"
    name="/proc/filesystems" pid=1 comm="init" requested_mask="r"
    denied_mask="r" fsuid=0 ouid=0

It's like I'm only getting a few of these at a time -- I added this to 
the kernel boot parameter: 'audit_backlog_limit=65536' but that didn't 
seem to affect the number of these that I was shown. I assume some type 
of throttling might be occurring but there was no notice of this 
happening on the console.

So, now my questions:

1) Can I separate out the different "comm" matches into different 
profile files or do I need to maintain one monolithic file?

2) If I want to worry about restricting binaries later, but only want to 
"whitelist" at this point in time, is there a generic profile that I can 
create that will grant all permissions?

3) Why did this "Warning from stdin (line 1): /sbin/apparmor_parser: 
cannot use or update cache, disable, or for" disappear when I started to 
use profile files instead of echo for apparmor_parser?

4) Will I be able to retain the apparmor profile files that come with 
Ubuntu?  I assume I'll need to duplicate most of the stuff I've done in 
initramfs into /etc/apparmor.d somewhere?

5) How does apparmor handle multiple profiles that match on the same 
file?  Is the reason why my separate init profile file ignored because 
the init-systemd one already matched on it?

Appreciate any feedback.


--------------55BBED8B3CD1B4620795BB3E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    I've followed the wiki article here:<br>
    <p><a
        href="https://gitlab.com/apparmor/apparmor/wikis/FullSystemPolicy">https://gitlab.com/apparmor/apparmor/wikis/FullSystemPolicy</a></p>
    However, I've got a number of questions I was hoping someone could
    help clarify for me.<br>
    First, let me walk through what I did after step 6 (reboot after
    update-initramfs -u):<br>
    From the console during boot:
    <blockquote>Begin: Running /scripts/init-bottom ... Warning from
      stdin (line 1): /sbin/apparmor_parser: cannot use or update cache,
      disable, or forc[   36.264702] audit: type=1400
      audit(1558716282.248:2): apparmor="STATUS"
      operation="profile_load" profile="unconfined" name="init-systemd"<br>
      e-complain via
stdin                                                                                                                                                                                                                                                               
      <br>
done.                                                                                                                                                                                                                                                                              
      <br>
      [   36.380094] audit: type=1400 audit(1558716282.360:3):
      apparmor="ALLOWED" operation="open" profile="init-systemd"
      name="/etc/ld.so.cache" pid=1 comm="init" requested_mask="r"
      denied_mask="r" fsuid=0
ouid=0                                                                    
      <br>
      [   36.383988] audit: type=1400 audit(1558716282.364:4):
      apparmor="ALLOWED" operation="open" profile="init-systemd"
      name="/lib/x86_64-linux-gnu/libc-2.27.so" pid=1 comm="init"
      requested_mask="r" denied_mask="r" fsuid=0
      ouid=0                                                   <br>
      [   36.389412] audit: type=1400 audit(1558716282.372:5):
      apparmor="ALLOWED" operation="file_mmap" profile="init-systemd"
      name="/lib/x86_64-linux-gnu/libc-2.27.so" pid=1 comm="init"
      requested_mask="rm" denied_mask="rm" fsuid=0
      ouid=0                                            <br>
      [   36.393851] audit: type=1400 audit(1558716282.376:6):
      apparmor="ALLOWED" operation="open" profile="init-systemd"
      name="/lib/systemd/libsystemd-shared-237.so" pid=1 comm="init"
      requested_mask="r" denied_mask="r" fsuid=0
      ouid=0                                                <br>
      [   36.397457] audit: type=1400 audit(1558716282.380:7):
      apparmor="ALLOWED" operation="file_mmap" profile="init-systemd"
      name="/lib/systemd/libsystemd-shared-237.so" pid=1 comm="init"
      requested_mask="rm" denied_mask="rm" fsuid=0
      ouid=0                                         <br>
      [   36.401758] audit: type=1400 audit(1558716282.384:8):
      apparmor="ALLOWED" operation="open" profile="init-systemd"
      name="/lib/x86_64-linux-gnu/librt-2.27.so" pid=1 comm="init"
      requested_mask="r" denied_mask="r" fsuid=0
      ouid=0                                                  <br>
      [   36.409685] audit: type=1400 audit(1558716282.392:9):
      apparmor="ALLOWED" operation="file_mmap" profile="init-systemd"
      name="/lib/x86_64-linux-gnu/librt-2.27.so" pid=1 comm="init"
      requested_mask="rm" denied_mask="rm" fsuid=0
      ouid=0                                           <br>
      [   36.413464] audit: type=1400 audit(1558716282.396:10):
      apparmor="ALLOWED" operation="open" profile="init-systemd"
      name="/lib/x86_64-linux-gnu/libseccomp.so.2.3.1" pid=1 comm="init"
      requested_mask="r" denied_mask="r" fsuid=0
      ouid=0                                           <br>
      [   36.416835] audit: type=1400 audit(1558716282.400:11):
      apparmor="ALLOWED" operation="file_mmap" profile="init-systemd"
      name="/lib/x86_64-linux-gnu/libseccomp.so.2.3.1" pid=1 comm="init"
      requested_mask="rm" denied_mask="rm" fsuid=0
      ouid=0                                    <br>
    </blockquote>
    <br>
    <p>Now, since the init-systemd profile doesn't contain any rules,
      this is expected (and wanted).  However, I tried a number of
      things to get rid of them and only one of them worked.</p>
    <p>First, to make sure I understand what those log entries are
      saying:</p>
    <p>the "init" program is attempted to read and/or memory map certain
      files, however due to the init-systemd profile, if it wasn't set
      to complain, these actions would have been blocked.<br>
    </p>
    <p>My first thought was to create a new init profile .. something
      like:</p>
    <blockquote>
      <p>profile init /init flags=(complain) {</p>
      <p>    # init in initramfs is at the root, not /sbin/<br>
      </p>
      <p>    /etc/ld.so.cache    r,</p>
      <p>    /lib/**                    rm,</p>
      <p>}<br>
      </p>
    </blockquote>
    <p>however after adding a new apparmor_parser command to the
      apparmor script to load this in init-bottom, nothing changed after
      reboot.<br>
    </p>
    <p>So then I thought I needed to create a sub profile within the
      init-systemd profile for init, however, I probably didn't do this
      correctly, or it just won't work:<br>
    </p>
    <blockquote>
      <p>/init        Cx -&gt; init</p>
      <p><br>
      </p>
      <p>profile init flags=(complain) {</p>
      <p>    /etc/ld.so.cache r,</p>
      <p>    /lib/**                rm,<br>
      </p>
      <p>}</p>
    </blockquote>
    Again, those same log entries returned.<br>
    <br>
    What worked was to modify the init-systemd profile directly:<br>
    <blockquote>profile init-systemd /lib/systemd/systemd
      flags=(complain) {<br>
      <br>
          /etc/ld.so.cache    r,<br>
          /lib/**            rm,<br>
      <br>
      }<br>
    </blockquote>
    <p>However, this isn't ideal because, I think, it means all things
      that systemd runs inherits these permissions, not just init.<br>
    </p>
    <p>I noticed something else too -- after that worked, I got a new
      list of additional audit messages:</p>
    <blockquote>
      <p>[   38.840399] audit: type=1400 audit(1558733899.848:5):
        apparmor="ALLOWED" operation="open" profile="init-systemd"
        name="/usr/lib/x86_64-linux-gnu/libip4tc.so.0.1.0" pid=1
        comm="init" requested_mask="r" denied_mask="r" fsuid=0
        ouid=0                                          <br>
        [   38.843656] audit: type=1400 audit(1558733899.848:6):
        apparmor="ALLOWED" operation="file_mmap" profile="init-systemd"
        name="/usr/lib/x86_64-linux-gnu/libip4tc.so.0.1.0" pid=1
        comm="init" requested_mask="rm" denied_mask="rm" fsuid=0
        ouid=0                                   <br>
        [   38.852170] audit: type=1400 audit(1558733899.860:7):
        apparmor="ALLOWED" operation="open" profile="init-systemd"
        name="/usr/lib/x86_64-linux-gnu/liblz4.so.1.7.1" pid=1
        comm="init" requested_mask="r" denied_mask="r" fsuid=0
        ouid=0                                            <br>
        [   38.855990] audit: type=1400 audit(1558733899.860:8):
        apparmor="ALLOWED" operation="file_mmap" profile="init-systemd"
        name="/usr/lib/x86_64-linux-gnu/liblz4.so.1.7.1" pid=1
        comm="init" requested_mask="rm" denied_mask="rm" fsuid=0
        ouid=0                                     <br>
        [   38.871219] audit: type=1400 audit(1558733899.876:9):
        apparmor="ALLOWED" operation="open" profile="init-systemd"
        name="/usr/lib/x86_64-linux-gnu/libargon2.so.0" pid=1
        comm="init" requested_mask="r" denied_mask="r" fsuid=0
        ouid=0                                             <br>
        [   38.888320] audit: type=1400 audit(1558733899.896:10):
        apparmor="ALLOWED" operation="file_mmap" profile="init-systemd"
        name="/usr/lib/x86_64-linux-gnu/libargon2.so.0" pid=1
        comm="init" requested_mask="rm" denied_mask="rm" fsuid=0
        ouid=0                                     <br>
        [   38.938441] audit: type=1400 audit(1558733899.944:11):
        apparmor="ALLOWED" operation="open" profile="init-systemd"
        name="/proc/filesystems" pid=1 comm="init" requested_mask="r"
        denied_mask="r" fsuid=0 ouid=0    </p>
    </blockquote>
    <p>It's like I'm only getting a few of these at a time -- I added
      this to the kernel boot parameter: 'audit_backlog_limit=65536' but
      that didn't seem to affect the number of these that I was shown. 
      I assume some type of throttling might be occurring but there was
      no notice of this happening on the console.<br>
    </p>
    <p>So, now my questions:</p>
    <p>1) Can I separate out the different "comm" matches into different
      profile files or do I need to maintain one monolithic file?</p>
    <p>2) If I want to worry about restricting binaries later, but only
      want to "whitelist" at this point in time, is there a generic
      profile that I can create that will grant all permissions?</p>
    <p>3) Why did this "Warning from stdin (line 1):
      /sbin/apparmor_parser: cannot use or update cache, disable, or
      for" disappear when I started to use profile files instead of echo
      for apparmor_parser?</p>
    <p>4) Will I be able to retain the apparmor profile files that come
      with Ubuntu?  I assume I'll need to duplicate most of the stuff
      I've done in initramfs into /etc/apparmor.d somewhere?</p>
    <p>5) How does apparmor handle multiple profiles that match on the
      same file?  Is the reason why my separate init profile file
      ignored because the init-systemd one already matched on it?</p>
    <p>Appreciate any feedback.<br>
    </p>
  </body>
</html>

--------------55BBED8B3CD1B4620795BB3E--


--===============7090822325804654264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============7090822325804654264==--


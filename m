Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9D623AC57
	for <lists+apparmor@lfdr.de>; Mon,  3 Aug 2020 20:28:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k2fCJ-0000Wf-Ub; Mon, 03 Aug 2020 18:28:31 +0000
Received: from mail-ed1-f42.google.com ([209.85.208.42])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1k2eoP-0007dt-W2
 for apparmor@lists.ubuntu.com; Mon, 03 Aug 2020 18:03:50 +0000
Received: by mail-ed1-f42.google.com with SMTP id di22so20720966edb.12
 for <apparmor@lists.ubuntu.com>; Mon, 03 Aug 2020 11:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=u037KjtjTqi1tHMPGpqqR690VCHhIzm8YELnqZApmRw=;
 b=k7pvozDphPKPllQpz9Ja8C0qGS/9PgT8dsQX/bmXagsHlF0w3PyQWvPBvWxAewTPq5
 Eip3GbtefkzYI/v+cytwz0nOF9VJvi3jEfxOxB19oH38KW11bzGLCncQK6qk6V/9DiwZ
 2sq+I4xxALABXRz0Y8SZ09KXFJLk0ZDwyM3/ZPMovqIyZEo6eAH6XUO5KliWO7dRN7lz
 38GjrfHbaNhIPL0Ow6pCUTW5g0a7EW00HscaIwY/L3uzTp5JPq8tB+ImspvxkpYXw41P
 WCpBX8Tsk3e+UFRshFWqEKu3X/cZpkRQYitXKKE9d5cBbvGdLIzta2y8BQgIChj6yvhO
 qBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=u037KjtjTqi1tHMPGpqqR690VCHhIzm8YELnqZApmRw=;
 b=MWhDaaCUhW+7VOQnmLdUR0O91GOrK28mdsJ2C2lHREGnA7xd2kWgZ3PH/4oqQ0K6IC
 BXQm27UgABGCyV8DSJFgP1OoRqWouf0unNuw60Wmq/PX/TCZaC9F1QuEvhJtjyXr30p+
 A7do8uQv0X8GajCQedsFMzizdzSsYIEGIT3rLNVPxzY70SUilt+JJXxLbMsz3IHEhLWi
 jYMxWjyt/uWI+uPUPSyo3nUq6GI7opfNosqHLvOLUXOO/WBXQmd6SX9sD6+VRHswX2v5
 AQOqUDgMtAeiNm79zvLgHFEZxCVRFqbXLADW3AvZ8hoMsL4iTiKKDGLaXRa5B8cKesDg
 RB5Q==
X-Gm-Message-State: AOAM530xUhYJs02P9265d8o2A94wzj10nFUaOuo/wnQgEFy5jjvqRzgZ
 izCICMDd1YQGZbPNjl8BCM5Qgb0uCjyMtNwvS6M3yv3Z
X-Google-Smtp-Source: ABdhPJybXQv5arIecJMpeRTOg+2H25mtO3fKkRXcEQWn/ACfIOmJIOjykdMmMdUrA6a78ynAYb1pSg4zKRKbvV1F5Ss=
X-Received: by 2002:aa7:cc98:: with SMTP id p24mr17402804edt.333.1596477829129; 
 Mon, 03 Aug 2020 11:03:49 -0700 (PDT)
MIME-Version: 1.0
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Mon, 3 Aug 2020 14:03:38 -0400
Message-ID: <CAODFaZ5jftC-cEVxLSwNB_RX15AswxgUVaDTf35bUqXte1M7Nw@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.208.42;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-ed1-f42.google.com
X-Mailman-Approved-At: Mon, 03 Aug 2020 18:28:30 +0000
Subject: [apparmor] Apparmor: Query
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
Content-Type: multipart/mixed; boundary="===============8936571334767292464=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============8936571334767292464==
Content-Type: multipart/alternative; boundary="000000000000e5ab0705abfcf56c"

--000000000000e5ab0705abfcf56c
Content-Type: text/plain; charset="UTF-8"

Hi All,

I have successfully set up the apparmor in my Linux machine.

Requirement:

- Trying to find the list of capabilities needed for this below code which
runs in "unprivileged" mode [ nobody user ]
- The below code while executes, permission denied for write operation and
killing init process
cat /tmp/kill.sh
#!/bin/sh
echo "Exploring apparmor"
while [ 1 ]
do
cat /nvram/foo
echo "TEST" > /nvram/foo    => This operation won't be successful due to
permission issue.
killall root_process        =>  This operation won't be successful due to
permission issue.
sleep 5
done

ls -ltr /nvram/foo
-rw-r--r--    1 root     root             0 Aug  1 22:23 /nvram/foo

~# /tmp/kill.sh
~# su nobody
nobody@:/home/root$
nobody@/home/root$
nobody@:/home/root$
nobody@:/home/root$ /tmp/kill.sh &
[1] 18981
nobody@:/home/root$ Exploring apparmor
/tmp/kill.sh: line 6: /nvram/foo: Permission denied
killall: can't kill pid 4404: Operation not permitted


Analysis:

While running this process (complain) mode in apparmor, I assume the
required capabilities will be apparmor event logs.

Please note that, the process runs in "unprivileged (nobody) user.

For write operation while the process is running in nobody user mode, it
needs CAP_DAC_OVERRIDE capability to complete the write operation.

For kill operation, while the process is running in nobody user mode, it
needs CAP_KILL capability to complete the kill operation.


Query 1:

- But I do not see CAP_DAC_OVERRIDE and CAP_KILL in apparmor event logs.

Query 2:

- How apparmor identities how many capabilities are needed for the process?

Query 3:

- Does all system calls need capability when it runs in a non-root process,
how does apparmor mapping the linux capabilities?

Can someone please clarify these queries?

Thankx
Murali.S

--000000000000e5ab0705abfcf56c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br><br>I have successfully set up the apparmor in =
my Linux machine.<br><br>Requirement:<br><br>- Trying to find the list of c=
apabilities needed for this below code which runs in &quot;unprivileged&quo=
t; mode [ nobody user ]<br>- The below code while executes, permission deni=
ed for write operation and killing init process <br>cat /tmp/kill.sh<br>#!/=
bin/sh<br>echo &quot;Exploring apparmor&quot;<br>while [ 1 ]<br>do<br>cat /=
nvram/foo<br>echo &quot;TEST&quot; &gt; /nvram/foo =C2=A0 =C2=A0=3D&gt; Thi=
s operation won&#39;t be successful due to permission issue.<br>killall roo=
t_process =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D&gt; =C2=A0This operation won&#39;t=
 be successful due to permission issue.<br>sleep 5<br>done<br><br>ls -ltr /=
nvram/foo<br>-rw-r--r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 Aug =C2=A01 22:23 /nvram/foo<br><br>~# /t=
mp/kill.sh<br>~# su nobody<br>nobody@:/home/root$<br>nobody@/home/root$<br>=
nobody@:/home/root$<br>nobody@:/home/root$ /tmp/kill.sh &amp;<br>[1] 18981<=
br>nobody@:/home/root$ Exploring apparmor<br>/tmp/kill.sh: line 6: /nvram/f=
oo: Permission denied<br>killall: can&#39;t kill pid 4404: Operation not pe=
rmitted<br><br><br>Analysis:<br><br>While running this process (complain) m=
ode in apparmor, I assume the required capabilities will be apparmor event =
logs.<br><br>Please note that, the process runs in &quot;unprivileged (nobo=
dy) user.<br><br>For write operation while the process is running in nobody=
 user mode, it needs CAP_DAC_OVERRIDE capability to complete the write oper=
ation.<br><br>For kill operation, while the process is running in nobody us=
er mode, it needs CAP_KILL capability to complete the kill operation.<br><b=
r><br>Query 1:<br><br>- But I do not see CAP_DAC_OVERRIDE and CAP_KILL in a=
pparmor event logs.<br><br>Query 2:<br><br>- How apparmor identities how ma=
ny capabilities are needed for the process?<br><br>Query 3:<br><br>- Does a=
ll system calls need capability when it runs in a non-root process, how doe=
s apparmor mapping the linux capabilities?<br><br>Can someone please clarif=
y these queries?<div><br></div><div>Thankx</div><div>Murali.S<br><br><br><b=
r><br><br><br><br><br><br><br><br><br></div></div>

--000000000000e5ab0705abfcf56c--


--===============8936571334767292464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8936571334767292464==--


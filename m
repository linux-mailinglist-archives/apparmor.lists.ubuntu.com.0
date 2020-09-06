Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D5125F115
	for <lists+apparmor@lfdr.de>; Mon,  7 Sep 2020 01:31:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kF47n-0005m6-1m; Sun, 06 Sep 2020 23:31:07 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1kF47j-0005lx-Ur
 for apparmor@lists.ubuntu.com; Sun, 06 Sep 2020 23:31:03 +0000
Received: by mail-ed1-f50.google.com with SMTP id w1so11045411edr.3
 for <apparmor@lists.ubuntu.com>; Sun, 06 Sep 2020 16:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+fijuP4m8j0pUUUWR55/QYvw6M6k4tU13YNy0ozXcLI=;
 b=QvS5Xx0w2r7m7mDffsSdYXHQipc1pD+4soKbGeK7fHYz3Na/U1fBwB0BjuiGibnhpI
 pzFQz14MX2HCEM+PzMpHzU46elCtUrqWRFOPDag8QomnSzvlUGwj6dV/3YKVlHm0hlXw
 Tm+p6bBgZekfYbGy1wGfEP4v9X5LpXiZJ3huJeJ+04a35kFMdPPplQDAuxyXEGT2m9QH
 0RF9MlYgegl/LebvOXBbKbV67VJHeHGlt3BD+uv1gzg2RDNzLgDbPWsuqRSv/jUEgRk+
 /JW/13vQWjxt92t8hfxCvqpPMiNq2Bs9Ynx+ZwnUQg75yQihHNILPocZiHdZrNsPcvBW
 jCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+fijuP4m8j0pUUUWR55/QYvw6M6k4tU13YNy0ozXcLI=;
 b=WOFjCNMF2H39dHOuXL2QqeuXmEu8Y/4Zp6ub6IUEmJT8enRwuHh0xWqaCFoAmRuIs+
 9J/0LDnh+Yq9bZGe4GvIJ42zCDiCerX4L1A5hxGdERIfEnUO/du84IdLfQ5X77giAi29
 NVbKnjDcweCL5lknHYTyJz9vvE3Wr2ny67mw6hyGT0o/WctutuHiYiPU2MXG3RNSegf5
 FmOhEvuGmBrn6LrbjrssD7caUUp3HOr9vLDmgRWbjDgFHNkZwsWcbWQ+wOEaSIdiAPJE
 0i26aDGK7uMFmR1Unu6SWJIyajY3uja1URqGRGVeuT6AkaTivIgRRMdiXdhEf41GPb4m
 zoXQ==
X-Gm-Message-State: AOAM532U28s5jsC/eBaRwfr9DShf7lVxeA9SwjSMWRRUs2a+82Jog8sK
 e+Gu/CrUpc/bVCwyLVGcxZyqbZZkKvXx7F3A71M=
X-Google-Smtp-Source: ABdhPJxp7Q9jp47l1R3CMKOl9MsRq9KWiT5zEZfFMLdGgn+s7dLrHaonInhmaG4XLQJg2O8Bt6/ZIybyqrVum3r/ILE=
X-Received: by 2002:a50:fe07:: with SMTP id f7mr19840818edt.173.1599435063037; 
 Sun, 06 Sep 2020 16:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAODFaZ7xL+h_QM1k689LMKC4TV=JYMyZScoGPEaiYP9Vax9QeQ@mail.gmail.com>
 <411e496d-f59f-8fbb-7ed7-aa1eefb995b7@canonical.com>
In-Reply-To: <411e496d-f59f-8fbb-7ed7-aa1eefb995b7@canonical.com>
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Sun, 6 Sep 2020 19:30:52 -0400
Message-ID: <CAODFaZ4DubxnxxWR=AMgepm6eiGUjbJFu1rqeCXBOw+yu0GAsw@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Received-SPF: pass client-ip=209.85.208.50;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-ed1-f50.google.com
Subject: Re: [apparmor] Apparmor - Basic queries
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
Content-Type: multipart/mixed; boundary="===============7286392893750156860=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============7286392893750156860==
Content-Type: multipart/alternative; boundary="000000000000c610b605aead7e56"

--000000000000c610b605aead7e56
Content-Type: text/plain; charset="UTF-8"

Thanks for the explanation.

Can you please clarify the below queries.

1) After setting the process in compliant mode for the process, able to see
below logs.

2020 Sep 04 19:14:07 user kernel: audit: type=1400
audit(1599246847.756:1360): apparmor="ALLOWED" operation="capable"
 profile="Testing" pid=15084 comm="sh" capability=1  capname="dac_override"

comm shows "sh", it would be a shell script. I would like to find which
part of the code in the process needs dac_override capability.
I have cross checked the code, found a few instances but not able to
conclude which code really needs dac_override.
Do we have any method to find the corresponding code?

Does system() also could be pointed to comm="sh"?


2) Assume, my non-root process needs DAC_OVERRIDE to write a file which has
root permission.
  But this is only one instance in the code.

  In that case, if we enable DAC_OVERRIDE for this non-root process does it
show any security leak or just change the file permission as below
  chmod 777 <file>. Which option would be the best method for security?

3) To monitor the process behaviour using Apparmor, we need to restart the
process while monitoring the process for apparmor complain mode.
   In embedded products, some of the process will restart the system in
case of kill/restart the particular process.
   How can it be achievable for such a process using apparmor? or we could
not monitor those processes ?


Thanks
Murali.S

On Tue, Aug 25, 2020 at 2:18 AM John Johansen <john.johansen@canonical.com>
wrote:

> On 8/24/20 11:51 AM, Murali Selvaraj wrote:
> > Hi All,
> >
> > Please go through the below details and clarify with examples.
> >
> > Q1:How do we identify required capabilities from apparmor logs.
> >
> look for denials with the capname= field.
>
>
> > I am looking to find out the list of capabilities are used for the
> application/process using apparmor.
> > I have set up the apparmor and am able to see few capabilities NOT all
> CAPs in apparmor logs.
>
> AppArmor will only report on CAPs that make it to its module code. The
> kernel applies DAC and uid checks FIRST.
>
> eg. For capability DAC_OVERRIDE
>
>   the first check is if the task's uid == the object's (file's) uid if yes
> capability DAC override is not checked. If it they are different then the
> kernel will check the task's capability set, and if DAC_OVERRIDE is not in
> the set the operation will be denied and apparmor will never be consulted.
> Only if the operation requires DAC_OVERRIDE and the task's capability set
> has DAC_OVERRIDE will apparmor be checked.
>
> So the AppArmor profile's capability set is separate from the system set
> and Both have to allow the capability for it to be allowed.
>
> Also apparmor has a small 1 entry per cpu dedup cache so, that multipe
> requests to the same profile and capability will not be logged, if they are
> happening back to back (you just get one). Depending on your kernel there
> have been bugs in this caching so not all messages have always been
> correctly logged.
>
>
> > Do we have any simple exercise/method to find the required capabilities
> for the process specific from apparmor logs.
>
> No. We can come close by confining the application in a safe environment
> and exercising the application in complain mode. Or if you must deploy in a
> hostile environment in enforce mode, but you may have to restart the
> application due to denials changing code paths.
>
> > It will help us to set the required capabilities for the security reason.
> >
>
> AppArmor does not set capabilities but it can help you discover them
>
> > Q2:How do we know the process/application enough to cover  full code
> coverage for its required capabilities?
> >
> in short you don't, at least not without a lot of work. You can do code
> tracing and coverage based debug tools against the application to find what
> code has been exercised. And then you can do code analysis to ensure those
> covered parts get everything that could trigger capability requests. Even
> then you need to be careful to check the code to make sure its not using
> user defined data to set caps. If it does this you need to assume the user
> could request/set all ...
>
> > Do we have any suggested procedure/method to confirm the coverage of
> application, especially for real-time application?
> >
> Use tracing ftrace, .. or coverage tools like gcov
>
> > Q3:  In case of long run test cases, how to ensure all apparmor event
> logs are stored even uptime is more than 2 days?
> >
> Use auditd, you can control buffer sizes and whether messages can be
> dropped or whether system should panic if it can't log a message.
>
> > Do we have any configuration to keep apparmor logs for more than 2 days?
> >
>
> AppArmor does not directly control storage logs, instead it leverages the
> audit subsystem and your userspace auditing solution is in charge of that.
> So if you are using auditd (option with the most control of kernel
> messages) you would look at its options and configure it how you want/need.
> The other audit solutions rsyslog etc will messages from the kernel ring
> buffer and you again control how they are logged in the respective
> application config. I mention the difference as pulling from the ringbuffer
> doesn't provide all the same controls that auditd allows for from the audit
> subsystem.
>
>

--000000000000c610b605aead7e56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Thanks for the explanation.<br><br>Can you please clar=
ify the below queries.<br><br>1) After setting the process in compliant mod=
e for the process, able to see below logs.<br><br>2020 Sep 04 19:14:07 user=
 kernel: audit: type=3D1400 audit(1599246847.756:1360): apparmor=3D&quot;AL=
LOWED&quot; operation=3D&quot;capable&quot;<br>=C2=A0profile=3D&quot;Testin=
g&quot; pid=3D15084 comm=3D&quot;sh&quot; capability=3D1 =C2=A0capname=3D&q=
uot;dac_override&quot;<br><br>comm shows &quot;sh&quot;, it would be a shel=
l script. I would like to find which part of the code in the process needs =
dac_override capability.<br>I have cross checked the code, found a few inst=
ances but not able to conclude which code really needs dac_override.<br>Do =
we have any method to find the corresponding code?<br><br>Does system() als=
o could be pointed to comm=3D&quot;sh&quot;?<br><br><br>2) Assume, my non-r=
oot process needs DAC_OVERRIDE to write a file which has root permission.<b=
r>=C2=A0 But this is only one instance in the code. <br><br>=C2=A0 In that =
case, if we enable DAC_OVERRIDE for this non-root process does it show any =
security leak or just change the file permission as below<br>=C2=A0 chmod 7=
77 &lt;file&gt;. Which option would be the best method for security?<br><br=
>3) To monitor the process behaviour using Apparmor, we need to restart the=
 process while monitoring the process for apparmor complain mode.<br>=C2=A0=
 =C2=A0In embedded products, some of the process will restart the system in=
 case of kill/restart the particular process.<br>=C2=A0 =C2=A0How can it be=
 achievable for such a process using apparmor? or we could not monitor thos=
e processes ?<br><br><br>Thanks<br>Murali.S<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 25, 2020 at 2:18=
 AM John Johansen &lt;<a href=3D"mailto:john.johansen@canonical.com">john.j=
ohansen@canonical.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On 8/24/20 11:51 AM, Murali Selvaraj wrote:<br>
&gt; Hi All,<br>
&gt; <br>
&gt; Please go through the below details and clarify with examples.=C2=A0=
=C2=A0<br>
&gt; <br>
&gt; Q1:How do we identify required capabilities from apparmor logs.<br>
&gt; <br>
look for denials with the capname=3D field.<br>
<br>
<br>
&gt; I am looking to find out the list of capabilities are used for the app=
lication/process using apparmor.<br>
&gt; I have set up the apparmor and am able to see few capabilities NOT all=
 CAPs in apparmor logs.<br>
<br>
AppArmor will only report on CAPs that make it to its module code. The kern=
el applies DAC and uid checks FIRST.<br>
<br>
eg. For capability DAC_OVERRIDE<br>
<br>
=C2=A0 the first check is if the task&#39;s uid =3D=3D the object&#39;s (fi=
le&#39;s) uid if yes capability DAC override is not checked. If it they are=
 different then the kernel will check the task&#39;s capability set, and if=
 DAC_OVERRIDE is not in the set the operation will be denied and apparmor w=
ill never be consulted. Only if the operation requires DAC_OVERRIDE and the=
 task&#39;s capability set has DAC_OVERRIDE will apparmor be checked.<br>
<br>
So the AppArmor profile&#39;s capability set is separate from the system se=
t and Both have to allow the capability for it to be allowed.<br>
<br>
Also apparmor has a small 1 entry per cpu dedup cache so, that multipe requ=
ests to the same profile and capability will not be logged, if they are hap=
pening back to back (you just get one). Depending on your kernel there have=
 been bugs in this caching so not all messages have always been correctly l=
ogged.<br>
<br>
<br>
&gt; Do we have any simple exercise/method to find the required capabilitie=
s for the process specific from apparmor logs.<br>
<br>
No. We can come close by confining the application in a safe environment an=
d exercising the application in complain mode. Or if you must deploy in a h=
ostile environment in enforce mode, but you may have to restart the applica=
tion due to denials changing code paths.<br>
<br>
&gt; It will help us to set the required capabilities for the security reas=
on.<br>
&gt; <br>
<br>
AppArmor does not set capabilities but it can help you discover them<br>
<br>
&gt; Q2:How do we know the process/application enough to cover =C2=A0full c=
ode coverage for its required capabilities?<br>
&gt; <br>
in short you don&#39;t, at least not without a lot of work. You can do code=
 tracing and coverage based debug tools against the application to find wha=
t code has been exercised. And then you can do code analysis to ensure thos=
e covered parts get everything that could trigger capability requests. Even=
 then you need to be careful to check the code to make sure its not using u=
ser defined data to set caps. If it does this you need to assume the user c=
ould request/set all ...<br>
<br>
&gt; Do we have any suggested procedure/method to confirm the coverage of a=
pplication, especially for real-time application?<br>
&gt; <br>
Use tracing ftrace, .. or coverage tools like gcov<br>
<br>
&gt; Q3: =C2=A0In case of long run test cases, how to ensure all apparmor e=
vent logs are stored even uptime is more than 2 days?<br>
&gt; <br>
Use auditd, you can control buffer sizes and whether messages can be droppe=
d or whether system should panic if it can&#39;t log a message.<br>
<br>
&gt; Do we have any configuration to keep apparmor logs for more than 2 day=
s?<br>
&gt; <br>
<br>
AppArmor does not directly control storage logs, instead it leverages the a=
udit subsystem and your userspace auditing solution is in charge of that. S=
o if you are using auditd (option with the most control of kernel messages)=
 you would look at its options and configure it how you want/need. The othe=
r audit solutions rsyslog etc will messages from the kernel ring buffer and=
 you again control how they are logged in the respective application config=
. I mention the difference as pulling from the ringbuffer doesn&#39;t provi=
de all the same controls that auditd allows for from the audit subsystem.<b=
r>
<br>
</blockquote></div>

--000000000000c610b605aead7e56--


--===============7286392893750156860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============7286392893750156860==--


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B49168434AF
	for <lists+apparmor@lfdr.de>; Wed, 31 Jan 2024 04:54:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rV1g9-0007WU-MP; Wed, 31 Jan 2024 03:54:25 +0000
Received: from mail-ed1-f42.google.com ([209.85.208.42])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <murali.selvaraj2003@gmail.com>)
 id 1rV1g3-0007WB-Ep
 for apparmor@lists.ubuntu.com; Wed, 31 Jan 2024 03:54:19 +0000
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-55eed368b0bso961145a12.0
 for <apparmor@lists.ubuntu.com>; Tue, 30 Jan 2024 19:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706673258; x=1707278058;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R9lnQk9mj7uHozyEGMNhWZYIsLTCi+tnvA8bx4c+MFk=;
 b=N1fV5N4IugUCPaEPNRxWlWEBZKwKtBmJsKt7dMFgMQodKyRz2FgJsVWde1Uu0sSYgo
 qzW1INh0T+NVrhbizbBxF6UmQ65UtcasAaU2eS3gGgx9oimwyH2AmXSTdUCbo3RUpsJf
 B+SUvKD/nzc1Ebu7mAWVzuFJ+G/O+wZ+fKtwwOuPxoIT5EAgmiC4ABaUqPldMWp9CxJr
 VPnVnjQt5QBvyk8VHI+dl6i2cxRU/q2u9BdvReOvePEdmGNg1Cxz4MclbfELEzzMehTn
 3wIf4LpruFFlJP4TqPzVtl/v6foHlcfXnR8egfJZ0RYQvEXrVlh+rIR+5MC1R+3QQ/S7
 VWDw==
X-Gm-Message-State: AOJu0Yxrb7sS0gXdDrkgKZyX6GrC0gpV052JgpsQ+1DC0r6ewH+khxI7
 IwM8cmLfAJpmcd5YKOJbbqHTbVR2y4RjwQ5nWyz98bchLWTDg7q1OZSKBxXzZ+CXrKJUJosBqeQ
 DL13FqM3p61zh3MCwIURo9aw85ZNjvOVtn+I=
X-Google-Smtp-Source: AGHT+IFQ7m51W63eHW7IZlGNLwbEStSFs7HGiLt0I3ZE8tBuqT2iIjyTHwxnsUm5LiwMHDhi63vEqI/oViCilbrUhwE=
X-Received: by 2002:a50:ec96:0:b0:55f:18fa:eb59 with SMTP id
 e22-20020a50ec96000000b0055f18faeb59mr416329edr.16.1706673258410; Tue, 30 Jan
 2024 19:54:18 -0800 (PST)
MIME-Version: 1.0
References: <CAODFaZ47MYEqxL8AYErn5rsvsTz-xCr70SyTc=P=u8k=w7cCoQ@mail.gmail.com>
In-Reply-To: <CAODFaZ47MYEqxL8AYErn5rsvsTz-xCr70SyTc=P=u8k=w7cCoQ@mail.gmail.com>
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Tue, 30 Jan 2024 22:54:07 -0500
Message-ID: <CAODFaZ7eWUbHxrufXiEWiXDbA3Ew_9DDXxd=iqYJcmLSJOQfug@mail.gmail.com>
To: apparmor@lists.ubuntu.com, John Johansen <john.johansen@canonical.com>, 
 Seth Arnold <seth.arnold@canonical.com>
Content-Type: multipart/alternative; boundary="00000000000050b4d5061035d548"
Received-SPF: pass client-ip=209.85.208.42;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-ed1-f42.google.com
Subject: Re: [apparmor] systemd AppArmorProfile
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--00000000000050b4d5061035d548
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

Systemd provides this variable *AppArmorProfile=3D* for the unit files

I have enabled Apparmor support in systemd and confirmed it is enabled as
per below output.

# systemctl  --version
systemd 250 (250.5+)
-PAM -AUDIT -SELINUX *+APPARMOR* +IMA -SMACK -SECCOMP -GCRYPT -GNUTLS
-OPENSSL -ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD
-LIBCRYPTSETUP +LIBFDISK -PCRE2 -PWQUALITY -P11KIT -QRENCODE -BZIP2 -LZ4
-XZ -ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT
default-hierarchy=3Dhybrid

*test.service*
[Service]
Type=3Dforking
WorkingDirectory=3D/usr/local/
*AppArmorProfile=3D-foo*
ExecStart=3D/usr/bin/test
Restart=3Don-failure

During boot-up, profile "foo" is NOT loaded while executing
test.service. However, I am observing below logs

grep -rni DENIED /var/logs/messages.txt
431:1970 Jan 01 00:00:33 localhost: audit: type=3D1400 audit(33.089:2):
apparmor=3D"DENIED" operation=3D"change_onexec" info=3D"label not found" er=
ror=3D-2
profile=3D"unconfined" name=3D"foo" pid=3D2970 comm=3D"(sh)"

As per my understanding,  if prefixed by "-", all errors will be ignored.
But I am still observing the above logs.
Do we need to update this line *AppArmorProfile=3D-foo* in the unit file?

I would like to understand the difference between    *AppArmorProfile=3Dfoo
, * *AppArmorProfile=3D-foo ? *It looks to me, both behave the same.

Please share your views.

Thanks
Murali.S

On Tue, Jan 30, 2024 at 10:05=E2=80=AFPM Murali Selvaraj <
murali.selvaraj2003@gmail.com> wrote:

> Hi All,
>
> Systemd provides this variable *AppArmorProfile=3D* for the unit files
>
> I have enabled Apparmor support in systemd and confirmed it is enabled as
> per below output.
>
> # systemctl  --version
> systemd 250 (250.5+)
> -PAM -AUDIT -SELINUX *+APPARMOR* +IMA -SMACK -SECCOMP -GCRYPT -GNUTLS
> -OPENSSL -ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD
> -LIBCRYPTSETUP +LIBFDISK -PCRE2 -PWQUALITY -P11KIT -QRENCODE -BZIP2 -LZ4
> -XZ -ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT
> default-hierarchy=3Dhybrid
>
> *test.service*
> [Service]
> Type=3Dforking
> WorkingDirectory=3D/usr/local/
> *AppArmorProfile-=3Dfoo*
> ExecStart=3D/usr/bin/test
> Restart=3Don-failure
>
> During boot-up, profile "foo" is NOT loaded while executing
> test.service. However, I am observing below logs
>
> grep -rni DENIED /var/logs/messages.txt
> 431:1970 Jan 01 00:00:33 localhost: audit: type=3D1400 audit(33.089:2):
> apparmor=3D"DENIED" operation=3D"change_onexec" info=3D"label not found" =
error=3D-2
> profile=3D"unconfined" name=3D"foo" pid=3D2970 comm=3D"(sh)"
>
> As per my understanding,  if prefixed by "-", all errors will be ignored.
> But I am still observing the above logs.
> Do we need to update this line *AppArmorProfile-=3Dfoo* in the unit file?
>
> I would like to understand the difference between    *AppArmorProfile=3Df=
oo
> , * *AppArmorProfile-=3Dfoo ?*
>
> Please share your views.
>
> Thanks
> Murali.S
>
>

--00000000000050b4d5061035d548
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br><br>Systemd provides this variable=C2=A0<b>AppA=
rmorProfile=3D</b>=C2=A0for the unit files<br><br>I have enabled Apparmor s=
upport in systemd and confirmed it is enabled as per below output.<br><br>#=
 systemctl =C2=A0--version<br>systemd 250 (250.5+)<br>-PAM -AUDIT -SELINUX=
=C2=A0<b>+APPARMOR</b>=C2=A0+IMA -SMACK -SECCOMP -GCRYPT -GNUTLS -OPENSSL -=
ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD -LIBCRYPTSETUP +LI=
BFDISK -PCRE2 -PWQUALITY -P11KIT -QRENCODE -BZIP2 -LZ4 -XZ -ZLIB +ZSTD -BPF=
_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dhybrid<br><br><b>=
test.service</b><br>[Service]<br>Type=3Dforking<br>WorkingDirectory=3D/usr/=
local/<br><b>AppArmorProfile=3D-foo</b><br>ExecStart=3D/usr/bin/test<br>Res=
tart=3Don-failure<br><br>During boot-up, profile &quot;foo&quot; is NOT loa=
ded while executing test.service.=C2=A0However, I am observing below logs<b=
r><br>grep -rni DENIED /var/logs/messages.txt<br>431:1970 Jan 01 00:00:33 l=
ocalhost: audit: type=3D1400 audit(33.089:2): apparmor=3D&quot;DENIED&quot;=
 operation=3D&quot;change_onexec&quot; info=3D&quot;label not found&quot; e=
rror=3D-2 profile=3D&quot;unconfined&quot; name=3D&quot;foo&quot; pid=3D297=
0 comm=3D&quot;(sh)&quot;<br><br>As per my understanding, =C2=A0if prefixed=
 by &quot;-&quot;, all errors will be ignored. But I am still observing the=
 above logs.<br>Do we need to update this line=C2=A0<b>AppArmorProfile=3D-f=
oo</b>=C2=A0in the unit file?<div><br></div><div>I would like to understand=
 the difference between=C2=A0 =C2=A0=C2=A0<b>AppArmorProfile=3Dfoo ,=C2=A0<=
/b>=C2=A0<b>AppArmorProfile=3D-foo ? </b>It looks to me,<b>=C2=A0</b>both b=
ehave the same.<br><br>Please share your views.<div><br></div><div>Thanks</=
div><div>Murali.S</div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jan 30, 2024 at 10:05=E2=80=AFPM Mura=
li Selvaraj &lt;<a href=3D"mailto:murali.selvaraj2003@gmail.com">murali.sel=
varaj2003@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr">Hi All,<br><br>Systemd provides this va=
riable <b>AppArmorProfile=3D</b> for the unit files<br><br>I have enabled A=
pparmor support in systemd and confirmed it is enabled as per below output.=
<br><br># systemctl =C2=A0--version<br>systemd 250 (250.5+)<br>-PAM -AUDIT =
-SELINUX <b>+APPARMOR</b> +IMA -SMACK -SECCOMP -GCRYPT -GNUTLS -OPENSSL -AC=
L +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD -LIBCRYPTSETUP +LIBF=
DISK -PCRE2 -PWQUALITY -P11KIT -QRENCODE -BZIP2 -LZ4 -XZ -ZLIB +ZSTD -BPF_F=
RAMEWORK -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dhybrid<br><br><b>te=
st.service</b><br>[Service]<br>Type=3Dforking<br>WorkingDirectory=3D/usr/lo=
cal/<br><b>AppArmorProfile-=3Dfoo</b><br>ExecStart=3D/usr/bin/test<br>Resta=
rt=3Don-failure<br><br>During boot-up, profile &quot;foo&quot; is NOT loade=
d while executing test.service.=C2=A0However, I am observing below logs<br>=
<br>grep -rni DENIED /var/logs/messages.txt<br>431:1970 Jan 01 00:00:33 loc=
alhost: audit: type=3D1400 audit(33.089:2): apparmor=3D&quot;DENIED&quot; o=
peration=3D&quot;change_onexec&quot; info=3D&quot;label not found&quot; err=
or=3D-2 profile=3D&quot;unconfined&quot; name=3D&quot;foo&quot; pid=3D2970 =
comm=3D&quot;(sh)&quot;<br><br>As per my understanding, =C2=A0if prefixed b=
y &quot;-&quot;, all errors will be ignored. But I am still observing the a=
bove logs.<br>Do we need to update this line <b>AppArmorProfile-=3Dfoo</b> =
in the unit file?<div><br></div><div>I would like to understand the differe=
nce between=C2=A0 =C2=A0

<b>AppArmorProfile=3Dfoo ,=C2=A0</b>

<b>AppArmorProfile-=3Dfoo ?</b><br><br>Please share your views.<div><br></d=
iv><div>Thanks</div><div>Murali.S<br><br></div></div></div>
</blockquote></div>

--00000000000050b4d5061035d548--


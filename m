Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A0174843457
	for <lists+apparmor@lfdr.de>; Wed, 31 Jan 2024 04:05:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rV0ui-0003tb-7K; Wed, 31 Jan 2024 03:05:24 +0000
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <murali.selvaraj2003@gmail.com>)
 id 1rV0ue-0003t0-Ao
 for apparmor@lists.ubuntu.com; Wed, 31 Jan 2024 03:05:20 +0000
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5111ef545bfso2013168e87.1
 for <apparmor@lists.ubuntu.com>; Tue, 30 Jan 2024 19:05:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706670319; x=1707275119;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bws648MuxV/7AnO8yMyr+IPCmYyJyzrwbzB012Tp+cg=;
 b=GO/hp5JdagHFH9pPo9SvClQWb0GetMPsmp0SxmoFyg79KhpZNY4k743eznJBiQl85O
 3ahnct6Udo3YVlBT6EW+Qr7XCU6r1PAI2/6Ogrk1typYMJCav+VnlDPTyMPUU2I1/bYQ
 /SReWWOHKSt86FTr/jAkxIAYvWAm9i70puP15WcpRmwNWsabla+GQc95GSD+FdKLyW74
 vInmRan6mm/PvPnlmKT38S+csaUotP2I25wEe9TGj8ZTCs7mGwlp4M8waBXxH5W1npYF
 JGm0Ritzp3nLCaEj4sRw8CEWB+/B+Ttc9dGhK1Qu+ujOzZ5Tqdk3qLKBzlTBSDkExZ+X
 l/Hw==
X-Gm-Message-State: AOJu0YxDMKNbRn2UdEqJo0Pb9Qapd7uNqpbMIrSa85x8nwH2FMIOdtAs
 qrCBxV+Rb2UB9ZUPqsK0OoLC5VOpIbxpzzN+FpqQ3PPJniSak+BpzdrmBEJnFsghWH7of6fqDqS
 3UmtHrUXUxtYt0SlrbNPak1kWqPYqcvel4bw=
X-Google-Smtp-Source: AGHT+IFl0WF72czsDkhDakdd9UZLND7Jx7kHns5nCn/jHrwBdevOXvqNxAtymnGV+yzBESBHwlBAd+eVquHvFPumElQ=
X-Received: by 2002:a2e:9d9a:0:b0:2cc:d8ec:4e1 with SMTP id
 c26-20020a2e9d9a000000b002ccd8ec04e1mr270284ljj.22.1706670318733; Tue, 30 Jan
 2024 19:05:18 -0800 (PST)
MIME-Version: 1.0
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Tue, 30 Jan 2024 22:05:07 -0500
Message-ID: <CAODFaZ47MYEqxL8AYErn5rsvsTz-xCr70SyTc=P=u8k=w7cCoQ@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: multipart/alternative; boundary="00000000000018cce30610352610"
Received-SPF: pass client-ip=209.85.167.53;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lf1-f53.google.com
Subject: [apparmor] systemd AppArmorProfile
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

--00000000000018cce30610352610
Content-Type: text/plain; charset="UTF-8"

Hi All,

Systemd provides this variable *AppArmorProfile=* for the unit files

I have enabled Apparmor support in systemd and confirmed it is enabled as
per below output.

# systemctl  --version
systemd 250 (250.5+)
-PAM -AUDIT -SELINUX *+APPARMOR* +IMA -SMACK -SECCOMP -GCRYPT -GNUTLS
-OPENSSL -ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD
-LIBCRYPTSETUP +LIBFDISK -PCRE2 -PWQUALITY -P11KIT -QRENCODE -BZIP2 -LZ4
-XZ -ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT
default-hierarchy=hybrid

*test.service*
[Service]
Type=forking
WorkingDirectory=/usr/local/
*AppArmorProfile-=foo*
ExecStart=/usr/bin/test
Restart=on-failure

During boot-up, profile "foo" is NOT loaded while executing
test.service. However, I am observing below logs

grep -rni DENIED /var/logs/messages.txt
431:1970 Jan 01 00:00:33 localhost: audit: type=1400 audit(33.089:2):
apparmor="DENIED" operation="change_onexec" info="label not found" error=-2
profile="unconfined" name="foo" pid=2970 comm="(sh)"

As per my understanding,  if prefixed by "-", all errors will be ignored.
But I am still observing the above logs.
Do we need to update this line *AppArmorProfile-=foo* in the unit file?

I would like to understand the difference between    *AppArmorProfile=foo
, * *AppArmorProfile-=foo ?*

Please share your views.

Thanks
Murali.S

--00000000000018cce30610352610
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br><br>Systemd provides this variable <b>AppArmorP=
rofile=3D</b> for the unit files<br><br>I have enabled Apparmor support in =
systemd and confirmed it is enabled as per below output.<br><br># systemctl=
 =C2=A0--version<br>systemd 250 (250.5+)<br>-PAM -AUDIT -SELINUX <b>+APPARM=
OR</b> +IMA -SMACK -SECCOMP -GCRYPT -GNUTLS -OPENSSL -ACL +BLKID -CURL -ELF=
UTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD -LIBCRYPTSETUP +LIBFDISK -PCRE2 -PWQUAL=
ITY -P11KIT -QRENCODE -BZIP2 -LZ4 -XZ -ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON=
 +UTMP +SYSVINIT default-hierarchy=3Dhybrid<br><br><b>test.service</b><br>[=
Service]<br>Type=3Dforking<br>WorkingDirectory=3D/usr/local/<br><b>AppArmor=
Profile-=3Dfoo</b><br>ExecStart=3D/usr/bin/test<br>Restart=3Don-failure<br>=
<br>During boot-up, profile &quot;foo&quot; is NOT loaded while executing t=
est.service.=C2=A0However, I am observing below logs<br><br>grep -rni DENIE=
D /var/logs/messages.txt<br>431:1970 Jan 01 00:00:33 localhost: audit: type=
=3D1400 audit(33.089:2): apparmor=3D&quot;DENIED&quot; operation=3D&quot;ch=
ange_onexec&quot; info=3D&quot;label not found&quot; error=3D-2 profile=3D&=
quot;unconfined&quot; name=3D&quot;foo&quot; pid=3D2970 comm=3D&quot;(sh)&q=
uot;<br><br>As per my understanding, =C2=A0if prefixed by &quot;-&quot;, al=
l errors will be ignored. But I am still observing the above logs.<br>Do we=
 need to update this line <b>AppArmorProfile-=3Dfoo</b> in the unit file?<d=
iv><br></div><div>I would like to understand the difference between=C2=A0 =
=C2=A0

<b>AppArmorProfile=3Dfoo ,=C2=A0</b>

<b>AppArmorProfile-=3Dfoo ?</b><br><br>Please share your views.<div><br></d=
iv><div>Thanks</div><div>Murali.S<br><br></div></div></div>

--00000000000018cce30610352610--


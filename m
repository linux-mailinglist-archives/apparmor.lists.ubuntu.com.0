Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C37CB2584D3
	for <lists+apparmor@lfdr.de>; Tue,  1 Sep 2020 02:25:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kCu7K-0006DR-A6; Tue, 01 Sep 2020 00:25:42 +0000
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <sswarnas@gmail.com>) id 1kCu7I-0006DK-3n
 for apparmor@lists.ubuntu.com; Tue, 01 Sep 2020 00:25:40 +0000
Received: by mail-pf1-f179.google.com with SMTP id o68so1656664pfg.2
 for <apparmor@lists.ubuntu.com>; Mon, 31 Aug 2020 17:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jYCEutZvvZ7S3ge0tQDgzNQZqMcIID7qiqJtv0uUXbs=;
 b=EsX1RUybcWxX0SCvFSDjuhYwWHnF8zaTPc/ooJqzggZTKQrlXlBWkS4tgESih4x1Ig
 L8FOK9NtKYZ33wtkrujja9j07DETkJPzrB3F7Y6Rv9jykAfrG8LI3jzL0JOFUMWBq1NG
 rBbN1hbNrNeQp7ImtO9bcN0W1dNzWMw+AZbSQP8LQNlovccP1O24elMAPewx3BjbsVUG
 dUoFbP9Xt4ngD6RxQu2Sf9ALGTnhUQcYde7OmwbWzAHb9r1QVmksXTibbDTSGVqqSZqi
 6ZxR/2LdYEAYtkXtRKDXO6gLi6lKm8Mqr5Z7xSaTMM+2eRigKQGE2LO2HubS3mR6zfyy
 u/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jYCEutZvvZ7S3ge0tQDgzNQZqMcIID7qiqJtv0uUXbs=;
 b=TSyJr9KfIvzXI6Y7yz8GZFJXo5uiNwnE23TkuZrLKoidPAzXcsyea/43nbDwrrUhuB
 Yz6M3nWYZPsX2+PFK9iJZwEYqRofgUrv8qTEB7xBv53Qou5t+e7G20zK1L1yVhWWz9MM
 T+kygiC8kwxjc84jH/H5I8qXbBBpDSe4hFvcfoY5mwp/QWNR9M12ID4hU4kG8rnvwRBf
 /YannINBd9iNMGF12p7rbDA3Q41FNZkRBEIP4lgZR1a7m0GS/Ei428hy1Eh9lDPLa6t8
 n2lB1ngvPIsF54O2G5lOoThtvTq/GsXzkLIY4GcD7XEx2TB321Feu6xHRXTPzWGcaZft
 7Azw==
X-Gm-Message-State: AOAM532xcCunset/MIQXl6C4oHXTzEfr4avMyjc6AkXri9/9dNYUWBb9
 VRddbBjnyqpEO/UwcRxxLm3by/mYSSQwWzWGxPqFtGa1bUVvhA==
X-Google-Smtp-Source: ABdhPJxDOdfsVy10C0hqVoX9C9dWk3Lh4JxmJeE2gtwo9U4EEvx4pTxTYCWERLjCnwZXul9eEXUi+TgDsN5Me0jvcn8=
X-Received: by 2002:a62:3486:: with SMTP id b128mr3367137pfa.98.1598919937737; 
 Mon, 31 Aug 2020 17:25:37 -0700 (PDT)
MIME-Version: 1.0
From: swarna latha <sswarnas@gmail.com>
Date: Mon, 31 Aug 2020 20:25:26 -0400
Message-ID: <CAJs3c4ymSpu5esJ2BV4YGLxuug-OLsMOqite02qKgWS4HSFDNA@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.210.179; envelope-from=sswarnas@gmail.com;
 helo=mail-pf1-f179.google.com
Subject: [apparmor] Apparmor profile enforce issue,
	when changing from root to non-root
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
Content-Type: multipart/mixed; boundary="===============3267306157042032000=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============3267306157042032000==
Content-Type: multipart/alternative; boundary="000000000000e9c6a005ae358e95"

--000000000000e9c6a005ae358e95
Content-Type: text/plain; charset="UTF-8"

Hi,

We have a process which starts as root and then we drop the unused
privileges and run as non-root.

Captured the capabilities of the process with apparmor by putting the
profile in audit, complain mode and generated profile with logprof.

1. With the generated profile, the process is starting, if we run it in
root mode and does not change to non-root.
2. With the generated profile, the process is not starting if we try to
change to non-root.

For non-root mode, tried to add the capabilities manually, all the 36
capabilities it did not work. But if i add the capability, (which is to
grant all capabilities, the last one highlighted below) the process starts.

capability sys_module,
capability sys_pacct,
capability sys_time,
capability mknod,
capability lease,
capability audit_write,
capability audit_control,
capability mac_override,
capability mac_admin,
capability syslog,
capability wake_alarm,
capability block_suspend,
capability audit_read,
capability dac_override,
capability setgid,
capability setuid,
capability sys_admin,
capability chown,
capability dac_read_search,
capability fowner,
capability fsetid,
capability ipc_lock,
capability ipc_owner,
capability kill,
capability linux_immutable,
capability net_admin,
capability net_bind_service,
capability net_raw,
capability setfcap,
capability setpcap,
capability sys_boot,
capability sys_chroot,
capability sys_nice,
capability sys_ptrace,
capability sys_resource,
capability sys_rawio,
*#capability,*

Can someone please clarify this behaviour ?

Thanks,
Swarna

--000000000000e9c6a005ae358e95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>We have a process which starts as r=
oot and then we drop the unused privileges=C2=A0and run as non-root.</div><=
div><br></div><div>Captured the capabilities=C2=A0of the process with appar=
mor by putting the profile in audit, complain mode and generated profile wi=
th logprof.</div><div><br></div><div>1. With the generated profile, the pro=
cess is starting,=C2=A0if we run it in root mode and does not change to non=
-root.<br></div><div>2. With the generated profile, the process is not star=
ting if we try to change to non-root.</div><div><br></div><div>For non-root=
 mode, tried to add the capabilities manually, all the 36 capabilities it d=
id not work. But if i add the capability, (which is to grant all capabiliti=
es, the last one highlighted below) the process starts.</div><div><br></div=
><div>capability sys_module,<br>capability sys_pacct,<br>capability sys_tim=
e,<br>capability mknod,<br>capability lease,<br>capability audit_write,<br>=
capability audit_control,<br>capability mac_override,<br>capability mac_adm=
in,<br>capability syslog,<br>capability wake_alarm,<br>capability block_sus=
pend,<br>capability audit_read,<br>capability dac_override,<br>capability s=
etgid,<br>capability setuid,<br>capability sys_admin,<br>capability chown,<=
br>capability dac_read_search,<br>capability fowner,<br>capability fsetid,<=
br>capability ipc_lock,<br>capability ipc_owner,<br>capability kill,<br>cap=
ability linux_immutable,<br>capability net_admin,<br>capability net_bind_se=
rvice,<br>capability net_raw,<br>capability setfcap,<br>capability setpcap,=
<br>capability sys_boot,<br>capability sys_chroot,<br>capability sys_nice,<=
br>capability sys_ptrace,<br>capability sys_resource,<br>capability sys_raw=
io,<br><b>#capability,</b><br></div><div><br></div><div>Can someone please =
clarify this behaviour ?</div><div><br></div><div>Thanks,</div><div>Swarna<=
/div></div>

--000000000000e9c6a005ae358e95--


--===============3267306157042032000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============3267306157042032000==--


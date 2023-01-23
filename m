Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE306773E1
	for <lists+apparmor@lfdr.de>; Mon, 23 Jan 2023 02:48:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pJlw8-0000DY-IU; Mon, 23 Jan 2023 01:47:52 +0000
Received: from mail-qv1-f48.google.com ([209.85.219.48])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1pJlw7-0000DQ-8N
 for apparmor@lists.ubuntu.com; Mon, 23 Jan 2023 01:47:51 +0000
Received: by mail-qv1-f48.google.com with SMTP id h10so8142979qvq.7
 for <apparmor@lists.ubuntu.com>; Sun, 22 Jan 2023 17:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=bMCraFxAZw1JopNFQboynsy6RmZEaeLJfygimc8T2d4=;
 b=n5JgqMLig2kG7qi0AxVspwNBIyzdLLCgz+ZRqcbt0c3j4BJ/+QfcJXnesrNwceHk3f
 dBTJoul1HhjtJto6I57pVUpTWFEmUzd5xuu7NZpYTGxzBZhV392Nbwn1w68n1ceWP454
 krHsxP3zUwKYwqcpbLQmwM/wQzXH8y2J2cJq6FzmMxrjra9AS1LHZZIUaxc+a/nKXXMw
 2s7lCEpIq/UbA6W3KALPlPNCF23+qapj9hpGjkujAhMOIRurKhBlqnusTyAJRl+BktWw
 ETzOcU3PeVsyikdGZaMGqkvP2794rh4BWPuCLq5Y8LhwPKHpIMqqyYtLV4C2yraLyOtH
 f6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bMCraFxAZw1JopNFQboynsy6RmZEaeLJfygimc8T2d4=;
 b=SYRKePSDxxUNB1VIus3P4BTwqUZfjbzKy+UWszt8gHf9lJaz8F70o6Lx7jPEnX/qLm
 zKG1rV1cfi/kVsuD4faG3W7VE4+nT7hu3A386NpmD3hAqPlSI8zL3w9P/zJEsnhlNvZb
 8ce1rws4otDopV9vybeIJnVwq1AKtRnlMLiXdB9UbkhNxPUNX3tvlbD84lGebyHuprcb
 0+eOgrtrVObWc+0QvZx2xXtrIRms4xbdjKd1woHLQEk5i7Hic5hUNIx2mszsH+rVPHCU
 dHgexNwUHKML2e+g/0x6DqzDIyi6drj2eYxJXTYbCIHelqhPuJwDamL8Hw4d+f98Y9q2
 Jfdg==
X-Gm-Message-State: AFqh2kpWQa9LkqNfBeeA0Viw3z6FfHoFCZBi64iDxRMSMoUPv7Mx8W5m
 NAlVY9rHxyMiAd8J140SvD3rFLe9Pk35hr0lrKqD1wIzDQM=
X-Google-Smtp-Source: AMrXdXv3J3Yzi++bX9n4sl5fBaPKEYZxujlEhsDpCGrZDSQqz4uxJiiVCEJfLWbKqmCKhTxDhYy3h2d7CnNFYTCzmsw=
X-Received: by 2002:a05:6214:3185:b0:534:8fbc:47ba with SMTP id
 lb5-20020a056214318500b005348fbc47bamr1465456qvb.0.1674438469587; Sun, 22 Jan
 2023 17:47:49 -0800 (PST)
MIME-Version: 1.0
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Sun, 22 Jan 2023 20:47:38 -0500
Message-ID: <CAODFaZ7JFh28gax0rdqfSh_OiBG5M+Ny8OG0KTt0dtQFakKPAA@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: multipart/alternative; boundary="0000000000002d95fb05f2e4962d"
Received-SPF: pass client-ip=209.85.219.48;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-qv1-f48.google.com
Subject: [apparmor] Apparmor: global profile queries
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

--0000000000002d95fb05f2e4962d
Content-Type: text/plain; charset="UTF-8"

Hi All,

I am trying to use a global/system-wide Apparmor profile to restrict the
executing of any scripts from /tmp folder.
As a first step, I added this entry (audit deny /tmp/* x,) and I was
expecting Apparmor audit logs while executing the script from /tmp/ (sh
/tmp/foo.sh).
Can you please suggest the inputs to get "audit" logs while executing any
script from /tmp/ folder.

cat global
profile global /** flags=(attach_disconnected) {
   signal,
   ptrace,
   capability,

   *audit deny /tmp/* x,*
   allow / r,
   allow /** pix,
   allow /** rwlkm,
}

Thanks
Murali.S

--0000000000002d95fb05f2e4962d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br>I am trying to use a global/system-wide Ap=
parmor profile to restrict the executing of any scripts from /tmp folder. <=
br>As a first step, I added this entry (audit deny /tmp/* x,) and I was exp=
ecting Apparmor audit logs while executing the script from /tmp/ (sh /tmp/f=
oo.sh).<br>Can you please suggest the inputs to get &quot;audit&quot; logs =
while executing any script from /tmp/ folder.=C2=A0=C2=A0<br><div><br>cat g=
lobal<br>profile global /** flags=3D(attach_disconnected) {<br>=C2=A0 =C2=
=A0signal,<br>=C2=A0 =C2=A0ptrace,<br>=C2=A0 =C2=A0capability,<br><br>=C2=
=A0 =C2=A0<b>audit deny /tmp/* x,</b><br>=C2=A0 =C2=A0allow / r,<br>=C2=A0 =
=C2=A0allow /** pix,<br>=C2=A0 =C2=A0allow /** rwlkm,<br>}</div><div><br></=
div><div>Thanks</div><div>Murali.S<br><br></div></div></div>

--0000000000002d95fb05f2e4962d--


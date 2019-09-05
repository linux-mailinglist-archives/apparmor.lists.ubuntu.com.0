Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E23EA9CF0
	for <lists+apparmor@lfdr.de>; Thu,  5 Sep 2019 10:28:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1i5n84-00072h-9A; Thu, 05 Sep 2019 08:28:32 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <birger.solna@gmail.com>) id 1i5n81-00072P-7g
 for apparmor@lists.ubuntu.com; Thu, 05 Sep 2019 08:28:29 +0000
Received: by mail-io1-f44.google.com with SMTP id d25so2878023iob.6
 for <apparmor@lists.ubuntu.com>; Thu, 05 Sep 2019 01:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=MIyxuQ8a+OgyuQz5HEqtoYsxXkDPXBnOdtUHXSm5Vug=;
 b=ugruJvyFKI+LT5HMmvFjLO0B3hC+YCwHpM423N6yw3QHYCI15RjVWRV1X7OLqO0IOy
 fmA+2QtcniBptI6M7vYEsTy71m8fUHADVFtF47kfBfKM7IjN5VGU+aWGhSlqWP0B6fy5
 GoUyQrWrCBq/iUX13BI7+vawbLlfjJHhk0y9ZIYvFMglQnEAxO0+61jcchcxDBNq0nva
 1e0uKoQ65ZCjNY92KUgcRVg1LDkBkk3wTIr7wRf8kRjj6xY/y0TLBNTR+vTSjipPHzma
 J/Uo+Y1gu8DZAy6ICqe4RIje906fW3F84enhuGXMWxtzF8lB/MubB0NBJowTxTubpTFy
 38iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=MIyxuQ8a+OgyuQz5HEqtoYsxXkDPXBnOdtUHXSm5Vug=;
 b=LLn0953NIS7QQbMGjPUIeIBZved2ww1Hc4EbiMtVDh4OpNQRsAkbMySRF3fWndQKBg
 AZ795nWUgBnGC+2eu8qOJaosV69LAU7g0S+saLItu0yM5lyQ5Ia8Xz8swPIbxB0mEYnv
 u5SvHxekVZpQwcSdxf7+TYiZAS0XUY3hBL4QIm4zkhGPNiWMB8SdG0S8A8DvJpQFBOOf
 QB/Vs3qjY+SqiqB0Wo3UFsq2qiu6e0Ue+Lkxfk8WUEkL7fHx5TjCbkTa8ODJwUSHfdZQ
 EPZT2+O8qIg+n0vue+P7uCxHHP5emhFqxM7e3pPuZZl369G56tbWb4lwtVIXroe9FKBR
 n0lQ==
X-Gm-Message-State: APjAAAW74RRP98Z2Aa6D5Kl5AO6BuAk2dx/JWrmiRVX6VgPuUORppLKt
 J3uDqFdwAtyTEMYosOjp9Ep9pI0yq+O/08E7gpJG18rO
X-Google-Smtp-Source: APXvYqxZB5QDY6OTa8dbddLhEvz/svrg1VJBJNERrLrKL5DJtU1fwFQiI/G54HgPjbGGLJ+I9pjhhPyn+AYhGluuljg=
X-Received: by 2002:a02:7702:: with SMTP id g2mr2816330jac.92.1567672107070;
 Thu, 05 Sep 2019 01:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <CABRH9Vx7CSxROBCMV5fbNPN-Sct4kFB_D2TawAWt_0KqD_C6KQ@mail.gmail.com>
 <20190904231133.GA4082@hunt>
 <CAATJJ0JSALj=dL71fAge0vDgb11GFSy+hwFDAs=Q916bw-2bkQ@mail.gmail.com>
 <CABRH9VxNOCdEjZBzLgg6g3NWqneA9rUeRzPkadrX9KXjTZw6=Q@mail.gmail.com>
In-Reply-To: <CABRH9VxNOCdEjZBzLgg6g3NWqneA9rUeRzPkadrX9KXjTZw6=Q@mail.gmail.com>
From: Birger Birger <birger.solna@gmail.com>
Date: Thu, 5 Sep 2019 10:28:14 +0200
Message-ID: <CABRH9VzzN=SJi5vtEAcaDFwmgZzxDs5zLOXjXHrMbMeuxHX5kw@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Subject: [apparmor] Fwd:  apparmor & clamav
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
Content-Type: multipart/mixed; boundary="===============2417896274887129485=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============2417896274887129485==
Content-Type: multipart/alternative; boundary="00000000000010fba90591ca1bab"

--00000000000010fba90591ca1bab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

smb config
[global]
    workgroup =3D company
    realm =3D COMPANY.LOCAL
    netbios name =3D zentyal
    server string =3D Zentyal Server
    server role =3D dc
    server role check:inhibit =3D yes
    server services =3D -dns
    server signing =3D auto
    dsdb:schema update allowed =3D yes
    ldap server require strong auth =3D no
    drs:max object sync =3D 1200

    idmap_ldb:use rfc2307 =3D yes

    winbind enum users =3D yes
    winbind enum groups =3D yes
    template shell =3D /bin/bash
    template homedir =3D /home/%U

    rpc server dynamic port range =3D 49152-65535

    interfaces =3D lo,eth0,eth1
    bind interfaces only =3D yes

    map to guest =3D Bad User

    log level =3D 3
    log file =3D /var/log/samba/samba.log
    max log size =3D 100000

    include =3D /etc/samba/shares.conf

[netlogon]
    path =3D /var/lib/samba/sysvol/company.local/scripts
    browseable =3D no
    read only =3D yes

[sysvol]
    path =3D /var/lib/samba/sysvol
    read only =3D no

---------- Forwarded message ---------
Fr=C3=A5n: Birger Birger <birger.solna@gmail.com>
Date: tors 5 sep. 2019 kl 10:01
Subject: Fwd: [apparmor] apparmor & clamav
To: <apparmor@lists.ubuntu.com>


Hope this helps the troubleshooting. What do you think?

syslog
Sep  5 09:07:02 zentyal kernel: [77608.395063] audit: type=3D1400
audit(1567667222.149:32): apparmor=3D"DENIED" operation=3D"connect"
profile=3D"/usr/bin/freshclam" name=3D"/run/samba/winbindd/pipe" pid=3D1365=
6
comm=3D"freshclam" requested_mask=3D"wr" denied_mask=3D"wr" fsuid=3D0 ouid=
=3D0

kern log
Sep  5 09:07:02 zentyal kernel: [77608.395063] audit: type=3D1400
audit(1567667222.149:32): apparmor=3D"DENIED" operation=3D"connect"
profile=3D"/usr/bin/freshclam" name=3D"/run/samba/winbindd/pipe" pid=3D1365=
6
comm=3D"freshclam" requested_mask=3D"wr" denied_mask=3D"wr" fsuid=3D0 ouid=
=3D0

samba log
[2019/09/05 07:02:00.093952,  3]
../lib/ldb-samba/ldb_wrap.c:326(ldb_wrap_connect)
  ldb_wrap open of secrets.ldb
[2019/09/05 07:02:00.101494,  3]
../source4/dsdb/samdb/ldb_modules/schema_load.c:226(dsdb_schema_refresh)
  Schema refresh needed 2004 !=3D 2018
[2019/09/05 07:02:00.301221,  3]
../source4/smbd/service_stream.c:65(stream_terminate_connection)
  Terminating connection - 'ldapsrv_call_wait_done: call->wait_recv() -
NT_STATUS_LOCAL_DISCONNECT'
[2019/09/05 07:02:00.301309,  2]
../source4/smbd/process_standard.c:473(standard_terminate)
  standard_terminate: reason[ldapsrv_call_wait_done: call->wait_recv() -
NT_STATUS_LOCAL_DISCONNECT]
[2019/09/05 07:02:00.306703,  2]
../source4/smbd/process_standard.c:157(standard_child_pipe_handler)
  Child 7164 () exited with status 0
[2019/09/05 07:02:10.104443,  3]
../lib/ldb-samba/ldb_wrap.c:326(ldb_wrap_connect)
  ldb_wrap open of secrets.ldb
[2019/09/05 07:02:10.112086,  3]
../source4/dsdb/samdb/ldb_modules/schema_load.c:226(dsdb_schema_refresh)
  Schema refresh needed 2004 !=3D 2018
[2019/09/05 07:02:10.303645,  3]
../source4/smbd/service_stream.c:65(stream_terminate_connection)
  Terminating connection - 'ldapsrv_call_wait_done: call->wait_recv() -
NT_STATUS_LOCAL_DISCONNECT'
[2019/09/05 07:02:10.303735,  2]
../source4/smbd/process_standard.c:473(standard_terminate)
  standard_terminate: reason[ldapsrv_call_wait_done: call->wait_recv() -
NT_STATUS_LOCAL_DISCONNECT]
[2019/09/05 07:02:10.309144,  2]
../source4/smbd/process_standard.c:157(standard_child_pipe_handler)
  Child 7169 () exited with status 0
[2019/09/05 07:02:20.115943,  3]
../lib/ldb-samba/ldb_wrap.c:326(ldb_wrap_connect)
  ldb_wrap open of secrets.ldb
[2019/09/05 07:02:20.123510,  3]
../source4/dsdb/samdb/ldb_modules/schema_load.c:226(dsdb_schema_refresh)
  Schema refresh needed 2004 !=3D 2018
[2019/09/05 07:02:20.306510,  3]
../source4/smbd/service_stream.c:65(stream_terminate_connection)
  Terminating connection - 'ldapsrv_call_wait_done: call->wait_recv() -
NT_STATUS_LOCAL_DISCONNECT'
[2019/09/05 07:02:20.306599,  2]
../source4/smbd/process_standard.c:473(standard_terminate)
  standard_terminate: reason[ldapsrv_call_wait_done: call->wait_recv() -
NT_STATUS_LOCAL_DISCONNECT]
[2019/09/05 07:02:20.311951,  2]
../source4/smbd/process_standard.c:157(standard_child_pipe_handler)
  Child 7174 () exited with status 0
[2019/09/05 07:02:29.978362,  2]
../source4/dsdb/kcc/kcc_periodic.c:710(kccsrv_samba_kcc)
  Calling samba_kcc script
[2019/09/05 07:02:30.034350,  3]
../lib/ldb-samba/ldb_wrap.c:326(ldb_wrap_connect)
  ldb_wrap open of secrets.ldb
[2019/09/05 07:02:30.042180,  3]
../source4/dsdb/samdb/ldb_modules/schema_load.c:226(dsdb_schema_refresh)
  Schema refresh needed 2004 !=3D 2018
[2019/09/05 07:02:30.180387,  0]
../lib/util/util_runcmd.c:327(samba_runcmd_io_handler)
  /usr/sbin/samba_kcc: ldb_wrap open of secrets.ldb
[2019/09/05 07:02:30.195742,  3]
../source4/smbd/service_stream.c:65(stream_terminate_connection)
  Terminating connection - 'ldapsrv_call_wait_done: call->wait_recv() -
NT_STATUS_LOCAL_DISCONNECT'
[2019/09/05 07:02:30.195833,  2]
../source4/smbd/process_standard.c:473(standard_terminate)
  standard_terminate: reason[ldapsrv_call_wait_done: call->wait_recv() -
NT_STATUS_LOCAL_DISCONNECT]
[2019/09/05 07:02:30.201464,  2]
../source4/smbd/process_standard.c:157(standard_child_pipe_handler)
  Child 7183 () exited with status 0
[2019/09/05 07:02:30.314889,  3]
../lib/util/util_runcmd.c:291(samba_runcmd_io_handler)
  samba_runcmd_io_handler: Child /usr/sbin/samba_kcc exited 0
[2019/09/05 07:02:30.314929,  3]
../source4/dsdb/kcc/kcc_periodic.c:695(samba_kcc_done)
  Completed samba_kcc OK
[2019/09/05 07:02:40.070125,  3]
../lib/ldb-samba/ldb_wrap.c:326(ldb_wrap_connect)
  ldb_wrap open of secrets.ldb
[2019/09/05 07:02:40.077497,  3]
../source4/dsdb/samdb/ldb_modules/schema_load.c:226(dsdb_schema_refresh)
  Schema refresh needed 2004 !=3D 2018
[2019/09/05 07:02:40.295079,  3]
../source4/smbd/service_stream.c:65(stream_terminate_connection)
  Terminating connection - 'ldapsrv_call_wait_done: call->wait_recv() -
NT_STATUS_LOCAL_DISCONNECT'
[2019/09/05 07:02:40.295164,  2]
../source4/smbd/process_standard.c:473(standard_terminate)
  standard_terminate: reason[ldapsrv_call_wait_done: call->wait_recv() -
NT_STATUS_LOCAL_DISCONNECT]
[2019/09/05 07:02:40.300523,  2]
../source4/smbd/process_standard.c:157(standard_child_pipe_handler)
  Child 7189 () exited with status 0
[2019/09/05 07:02:50.083237,  3]
../lib/ldb-samba/ldb_wrap.c:326(ldb_wrap_connect)
  ldb_wrap open of secrets.ldb
[2019/09/05 07:02:50.090899,  3]
../source4/dsdb/samdb/ldb_modules/schema_load.c:226(dsdb_schema_refresh)
  Schema refresh needed 2004 !=3D 2018
[2019/09/05 07:02:50.299324,  3]
../source4/smbd/service_stream.c:65(stream_terminate_connection)
  Terminating connection - 'ldapsrv_call_wait_done: call->wait_recv() -
NT_STATUS_LOCAL_DISCONNECT'
[2019/09/05 07:02:50.299422,  2]
../source4/smbd/process_standard.c:473(standard_terminate)
  standard_terminate: reason[ldapsrv_call_wait_done: call->wait_recv() -
NT_STATUS_LOCAL_DISCONNECT]
[2019/09/05 07:02:50.304819,  2]
../source4/smbd/process_standard.c:157(standard_child_pipe_handler)
  Child 7194 () exited with status 0


---------- Forwarded message ---------
Fr=C3=A5n: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Date: tors 5 sep. 2019 kl 08:10
Subject: Re: [apparmor] apparmor & clamav
To: Seth Arnold <seth.arnold@canonical.com>
Cc: <apparmor@lists.ubuntu.com>


On Thu, Sep 5, 2019 at 1:11 AM Seth Arnold <seth.arnold@canonical.com>
wrote:
>
> On Wed, Sep 04, 2019 at 08:02:56PM +0200, Birger Birger wrote:
> > This looks promising to troubleshoot. Any ideas?
>
> Do you know what winbindd does with this pipe? Are there any local
> configuration changes that would have put this pipe in this directory?
>
> It feels a lot like a new name for the pipes listed in
> <abstractions/winbind>:
>
>   /tmp/.winbindd/pipe  rw,
>   /var/{lib,run}/samba/winbindd_privileged/pipe rw,
>
> Does this sound right? Or is this pipe something different from these?

I think I have seen this deny come up in other cases and never spotted
exactly where it came from.
But I wanted to use this chance and find the base config for it.
It turns out that it is even in the base samba config, and thereby I
agree with Seth that this might be another entry for the abstraction.

Here smb.conf (5)
       winbindd socket directory (G)
          This setting controls the location of the winbind daemon's socket=
.
          Except within automated test scripts, this should not be
altered, as the client tools (nss_winbind etc) do not honour this
parameter. Client tools must then be advised of the
          altered path with the WINBINDD_SOCKET_DIR environment varaible.
          Default: winbindd socket directory =3D /var/run/samba/winbindd

And since /var/run =3D> /run we see the reported deny.

cu
Christian

> Thanks
>
> > > On Sep 4, 2019, at 03:01, Birger Birger via clamav-users <
> > clamav-users@lists.clamav.net> wrote:
> > >
> >
> > From Ubuntu syslog:
> > > Sep 4 08:40:01 zentyal kernel: [345190.998397] audit: type=3D1400
> > audit(1567579201.044:83): apparmor=3D"DENIED" operation=3D"connect"
> > profile=3D"/usr/bin/freshclam" name=3D"/run/samba/winbindd/pipe" pid=3D=
1269
> > comm=3D"freshclam" requested_mask=3D"wr" denied_mask=3D"wr" fsuid=3D0 o=
uid=3D0
>
> --
> AppArmor mailing list
> AppArmor@lists.ubuntu.com
> Modify settings or unsubscribe at:
https://lists.ubuntu.com/mailman/listinfo/apparmor

--=20
AppArmor mailing list
AppArmor@lists.ubuntu.com
Modify settings or unsubscribe at:
https://lists.ubuntu.com/mailman/listinfo/apparmor

--00000000000010fba90591ca1bab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>smb config</div><div>[global]<br>=C2=A0 =C2=A0 workgr=
oup =3D company<br>=C2=A0 =C2=A0 realm =3D COMPANY.LOCAL<br>=C2=A0 =C2=A0 n=
etbios name =3D zentyal<br>=C2=A0 =C2=A0 server string =3D Zentyal Server<b=
r>=C2=A0 =C2=A0 server role =3D dc<br>=C2=A0 =C2=A0 server role check:inhib=
it =3D yes<br>=C2=A0 =C2=A0 server services =3D -dns<br>=C2=A0 =C2=A0 serve=
r signing =3D auto<br>=C2=A0 =C2=A0 dsdb:schema update allowed =3D yes<br>=
=C2=A0 =C2=A0 ldap server require strong auth =3D no<br>=C2=A0 =C2=A0 drs:m=
ax object sync =3D 1200<br><br>=C2=A0 =C2=A0 idmap_ldb:use rfc2307 =3D yes<=
br><br>=C2=A0 =C2=A0 winbind enum users =3D yes<br>=C2=A0 =C2=A0 winbind en=
um groups =3D yes<br>=C2=A0 =C2=A0 template shell =3D /bin/bash<br>=C2=A0 =
=C2=A0 template homedir =3D /home/%U<br><br>=C2=A0 =C2=A0 rpc server dynami=
c port range =3D 49152-65535<br><br>=C2=A0 =C2=A0 interfaces =3D lo,eth0,et=
h1<br>=C2=A0 =C2=A0 bind interfaces only =3D yes<br><br>=C2=A0 =C2=A0 map t=
o guest =3D Bad User<br><br>=C2=A0 =C2=A0 log level =3D 3<br>=C2=A0 =C2=A0 =
log file =3D /var/log/samba/samba.log<br>=C2=A0 =C2=A0 max log size =3D 100=
000<br><br>=C2=A0 =C2=A0 include =3D /etc/samba/shares.conf<br><br>[netlogo=
n]<br>=C2=A0 =C2=A0 path =3D /var/lib/samba/sysvol/company.local/scripts<br=
>=C2=A0 =C2=A0 browseable =3D no<br>=C2=A0 =C2=A0 read only =3D yes<br><br>=
[sysvol]<br>=C2=A0 =C2=A0 path =3D /var/lib/samba/sysvol<br>=C2=A0 =C2=A0 r=
ead only =3D no</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">---------- Forwarded message ---------<br>Fr=C3=A5n: <b=
 class=3D"gmail_sendername" dir=3D"auto">Birger Birger</b> <span dir=3D"aut=
o">&lt;<a href=3D"mailto:birger.solna@gmail.com">birger.solna@gmail.com</a>=
&gt;</span><br>Date: tors 5 sep. 2019 kl 10:01<br>Subject: Fwd: [apparmor] =
apparmor &amp; clamav<br>To:  &lt;<a href=3D"mailto:apparmor@lists.ubuntu.c=
om">apparmor@lists.ubuntu.com</a>&gt;<br></div><br><br><div dir=3D"ltr"><di=
v>Hope this helps the troubleshooting. What do you think?</div><div><br></d=
iv><div>syslog</div><div>Sep =C2=A05 09:07:02 zentyal kernel: [77608.395063=
] audit: type=3D1400 audit(1567667222.149:32): apparmor=3D&quot;DENIED&quot=
; operation=3D&quot;connect&quot; profile=3D&quot;/usr/bin/freshclam&quot; =
name=3D&quot;/run/samba/winbindd/pipe&quot; pid=3D13656 comm=3D&quot;freshc=
lam&quot; requested_mask=3D&quot;wr&quot; denied_mask=3D&quot;wr&quot; fsui=
d=3D0 ouid=3D0</div><div><br></div><div>kern log</div><div>Sep =C2=A05 09:0=
7:02 zentyal kernel: [77608.395063] audit: type=3D1400 audit(1567667222.149=
:32): apparmor=3D&quot;DENIED&quot; operation=3D&quot;connect&quot; profile=
=3D&quot;/usr/bin/freshclam&quot; name=3D&quot;/run/samba/winbindd/pipe&quo=
t; pid=3D13656 comm=3D&quot;freshclam&quot; requested_mask=3D&quot;wr&quot;=
 denied_mask=3D&quot;wr&quot; fsuid=3D0 ouid=3D0 <br></div><div><br></div><=
div>samba log</div><div>[2019/09/05 07:02:00.093952, =C2=A03] ../lib/ldb-sa=
mba/ldb_wrap.c:326(ldb_wrap_connect)<br>=C2=A0 ldb_wrap open of secrets.ldb=
<br>[2019/09/05 07:02:00.101494, =C2=A03] ../source4/dsdb/samdb/ldb_modules=
/schema_load.c:226(dsdb_schema_refresh)<br>=C2=A0 Schema refresh needed 200=
4 !=3D 2018<br>[2019/09/05 07:02:00.301221, =C2=A03] ../source4/smbd/servic=
e_stream.c:65(stream_terminate_connection)<br>=C2=A0 Terminating connection=
 - &#39;ldapsrv_call_wait_done: call-&gt;wait_recv() - NT_STATUS_LOCAL_DISC=
ONNECT&#39;<br>[2019/09/05 07:02:00.301309, =C2=A02] ../source4/smbd/proces=
s_standard.c:473(standard_terminate)<br>=C2=A0 standard_terminate: reason[l=
dapsrv_call_wait_done: call-&gt;wait_recv() - NT_STATUS_LOCAL_DISCONNECT]<b=
r>[2019/09/05 07:02:00.306703, =C2=A02] ../source4/smbd/process_standard.c:=
157(standard_child_pipe_handler)<br>=C2=A0 Child 7164 () exited with status=
 0<br>[2019/09/05 07:02:10.104443, =C2=A03] ../lib/ldb-samba/ldb_wrap.c:326=
(ldb_wrap_connect)<br>=C2=A0 ldb_wrap open of secrets.ldb<br>[2019/09/05 07=
:02:10.112086, =C2=A03] ../source4/dsdb/samdb/ldb_modules/schema_load.c:226=
(dsdb_schema_refresh)<br>=C2=A0 Schema refresh needed 2004 !=3D 2018<br>[20=
19/09/05 07:02:10.303645, =C2=A03] ../source4/smbd/service_stream.c:65(stre=
am_terminate_connection)<br>=C2=A0 Terminating connection - &#39;ldapsrv_ca=
ll_wait_done: call-&gt;wait_recv() - NT_STATUS_LOCAL_DISCONNECT&#39;<br>[20=
19/09/05 07:02:10.303735, =C2=A02] ../source4/smbd/process_standard.c:473(s=
tandard_terminate)<br>=C2=A0 standard_terminate: reason[ldapsrv_call_wait_d=
one: call-&gt;wait_recv() - NT_STATUS_LOCAL_DISCONNECT]<br>[2019/09/05 07:0=
2:10.309144, =C2=A02] ../source4/smbd/process_standard.c:157(standard_child=
_pipe_handler)<br>=C2=A0 Child 7169 () exited with status 0<br>[2019/09/05 =
07:02:20.115943, =C2=A03] ../lib/ldb-samba/ldb_wrap.c:326(ldb_wrap_connect)=
<br>=C2=A0 ldb_wrap open of secrets.ldb<br>[2019/09/05 07:02:20.123510, =C2=
=A03] ../source4/dsdb/samdb/ldb_modules/schema_load.c:226(dsdb_schema_refre=
sh)<br>=C2=A0 Schema refresh needed 2004 !=3D 2018<br>[2019/09/05 07:02:20.=
306510, =C2=A03] ../source4/smbd/service_stream.c:65(stream_terminate_conne=
ction)<br>=C2=A0 Terminating connection - &#39;ldapsrv_call_wait_done: call=
-&gt;wait_recv() - NT_STATUS_LOCAL_DISCONNECT&#39;<br>[2019/09/05 07:02:20.=
306599, =C2=A02] ../source4/smbd/process_standard.c:473(standard_terminate)=
<br>=C2=A0 standard_terminate: reason[ldapsrv_call_wait_done: call-&gt;wait=
_recv() - NT_STATUS_LOCAL_DISCONNECT]<br>[2019/09/05 07:02:20.311951, =C2=
=A02] ../source4/smbd/process_standard.c:157(standard_child_pipe_handler)<b=
r>=C2=A0 Child 7174 () exited with status 0<br>[2019/09/05 07:02:29.978362,=
 =C2=A02] ../source4/dsdb/kcc/kcc_periodic.c:710(kccsrv_samba_kcc)<br>=C2=
=A0 Calling samba_kcc script<br>[2019/09/05 07:02:30.034350, =C2=A03] ../li=
b/ldb-samba/ldb_wrap.c:326(ldb_wrap_connect)<br>=C2=A0 ldb_wrap open of sec=
rets.ldb<br>[2019/09/05 07:02:30.042180, =C2=A03] ../source4/dsdb/samdb/ldb=
_modules/schema_load.c:226(dsdb_schema_refresh)<br>=C2=A0 Schema refresh ne=
eded 2004 !=3D 2018<br>[2019/09/05 07:02:30.180387, =C2=A00] ../lib/util/ut=
il_runcmd.c:327(samba_runcmd_io_handler)<br>=C2=A0 /usr/sbin/samba_kcc: ldb=
_wrap open of secrets.ldb<br>[2019/09/05 07:02:30.195742, =C2=A03] ../sourc=
e4/smbd/service_stream.c:65(stream_terminate_connection)<br>=C2=A0 Terminat=
ing connection - &#39;ldapsrv_call_wait_done: call-&gt;wait_recv() - NT_STA=
TUS_LOCAL_DISCONNECT&#39;<br>[2019/09/05 07:02:30.195833, =C2=A02] ../sourc=
e4/smbd/process_standard.c:473(standard_terminate)<br>=C2=A0 standard_termi=
nate: reason[ldapsrv_call_wait_done: call-&gt;wait_recv() - NT_STATUS_LOCAL=
_DISCONNECT]<br>[2019/09/05 07:02:30.201464, =C2=A02] ../source4/smbd/proce=
ss_standard.c:157(standard_child_pipe_handler)<br>=C2=A0 Child 7183 () exit=
ed with status 0<br>[2019/09/05 07:02:30.314889, =C2=A03] ../lib/util/util_=
runcmd.c:291(samba_runcmd_io_handler)<br>=C2=A0 samba_runcmd_io_handler: Ch=
ild /usr/sbin/samba_kcc exited 0<br>[2019/09/05 07:02:30.314929, =C2=A03] .=
./source4/dsdb/kcc/kcc_periodic.c:695(samba_kcc_done)<br>=C2=A0 Completed s=
amba_kcc OK<br>[2019/09/05 07:02:40.070125, =C2=A03] ../lib/ldb-samba/ldb_w=
rap.c:326(ldb_wrap_connect)<br>=C2=A0 ldb_wrap open of secrets.ldb<br>[2019=
/09/05 07:02:40.077497, =C2=A03] ../source4/dsdb/samdb/ldb_modules/schema_l=
oad.c:226(dsdb_schema_refresh)<br>=C2=A0 Schema refresh needed 2004 !=3D 20=
18<br>[2019/09/05 07:02:40.295079, =C2=A03] ../source4/smbd/service_stream.=
c:65(stream_terminate_connection)<br>=C2=A0 Terminating connection - &#39;l=
dapsrv_call_wait_done: call-&gt;wait_recv() - NT_STATUS_LOCAL_DISCONNECT&#3=
9;<br>[2019/09/05 07:02:40.295164, =C2=A02] ../source4/smbd/process_standar=
d.c:473(standard_terminate)<br>=C2=A0 standard_terminate: reason[ldapsrv_ca=
ll_wait_done: call-&gt;wait_recv() - NT_STATUS_LOCAL_DISCONNECT]<br>[2019/0=
9/05 07:02:40.300523, =C2=A02] ../source4/smbd/process_standard.c:157(stand=
ard_child_pipe_handler)<br>=C2=A0 Child 7189 () exited with status 0<br>[20=
19/09/05 07:02:50.083237, =C2=A03] ../lib/ldb-samba/ldb_wrap.c:326(ldb_wrap=
_connect)<br>=C2=A0 ldb_wrap open of secrets.ldb<br>[2019/09/05 07:02:50.09=
0899, =C2=A03] ../source4/dsdb/samdb/ldb_modules/schema_load.c:226(dsdb_sch=
ema_refresh)<br>=C2=A0 Schema refresh needed 2004 !=3D 2018<br>[2019/09/05 =
07:02:50.299324, =C2=A03] ../source4/smbd/service_stream.c:65(stream_termin=
ate_connection)<br>=C2=A0 Terminating connection - &#39;ldapsrv_call_wait_d=
one: call-&gt;wait_recv() - NT_STATUS_LOCAL_DISCONNECT&#39;<br>[2019/09/05 =
07:02:50.299422, =C2=A02] ../source4/smbd/process_standard.c:473(standard_t=
erminate)<br>=C2=A0 standard_terminate: reason[ldapsrv_call_wait_done: call=
-&gt;wait_recv() - NT_STATUS_LOCAL_DISCONNECT]<br>[2019/09/05 07:02:50.3048=
19, =C2=A02] ../source4/smbd/process_standard.c:157(standard_child_pipe_han=
dler)<br>=C2=A0 Child 7194 () exited with status 0<br></div><div><br></div>=
<div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">-=
--------- Forwarded message ---------<br>Fr=C3=A5n: <b class=3D"gmail_sende=
rname" dir=3D"auto">Christian Ehrhardt</b> <span dir=3D"auto">&lt;<a href=
=3D"mailto:christian.ehrhardt@canonical.com" target=3D"_blank">christian.eh=
rhardt@canonical.com</a>&gt;</span><br>Date: tors 5 sep. 2019 kl 08:10<br>S=
ubject: Re: [apparmor] apparmor &amp; clamav<br>To: Seth Arnold &lt;<a href=
=3D"mailto:seth.arnold@canonical.com" target=3D"_blank">seth.arnold@canonic=
al.com</a>&gt;<br>Cc:  &lt;<a href=3D"mailto:apparmor@lists.ubuntu.com" tar=
get=3D"_blank">apparmor@lists.ubuntu.com</a>&gt;<br></div><br><br>On Thu, S=
ep 5, 2019 at 1:11 AM Seth Arnold &lt;<a href=3D"mailto:seth.arnold@canonic=
al.com" target=3D"_blank">seth.arnold@canonical.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Sep 04, 2019 at 08:02:56PM +0200, Birger Birger wrote:<br>
&gt; &gt; This looks promising to troubleshoot. Any ideas?<br>
&gt;<br>
&gt; Do you know what winbindd does with this pipe? Are there any local<br>
&gt; configuration changes that would have put this pipe in this directory?=
<br>
&gt;<br>
&gt; It feels a lot like a new name for the pipes listed in<br>
&gt; &lt;abstractions/winbind&gt;:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/tmp/.winbindd/pipe=C2=A0 rw,<br>
&gt;=C2=A0 =C2=A0/var/{lib,run}/samba/winbindd_privileged/pipe rw,<br>
&gt;<br>
&gt; Does this sound right? Or is this pipe something different from these?=
<br>
<br>
I think I have seen this deny come up in other cases and never spotted<br>
exactly where it came from.<br>
But I wanted to use this chance and find the base config for it.<br>
It turns out that it is even in the base samba config, and thereby I<br>
agree with Seth that this might be another entry for the abstraction.<br>
<br>
Here smb.conf (5)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0winbindd socket directory (G)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This setting controls the location of th=
e winbind daemon&#39;s socket.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Except within automated test scripts, th=
is should not be<br>
altered, as the client tools (nss_winbind etc) do not honour this<br>
parameter. Client tools must then be advised of the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 altered path with the WINBINDD_SOCKET_DI=
R environment varaible.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Default: winbindd socket directory =3D /=
var/run/samba/winbindd<br>
<br>
And since /var/run =3D&gt; /run we see the reported deny.<br>
<br>
cu<br>
Christian<br>
<br>
&gt; Thanks<br>
&gt;<br>
&gt; &gt; &gt; On Sep 4, 2019, at 03:01, Birger Birger via clamav-users &lt=
;<br>
&gt; &gt; <a href=3D"mailto:clamav-users@lists.clamav.net" target=3D"_blank=
">clamav-users@lists.clamav.net</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; From Ubuntu syslog:<br>
&gt; &gt; &gt; Sep 4 08:40:01 zentyal kernel: [345190.998397] audit: type=
=3D1400<br>
&gt; &gt; audit(1567579201.044:83): apparmor=3D&quot;DENIED&quot; operation=
=3D&quot;connect&quot;<br>
&gt; &gt; profile=3D&quot;/usr/bin/freshclam&quot; name=3D&quot;/run/samba/=
winbindd/pipe&quot; pid=3D1269<br>
&gt; &gt; comm=3D&quot;freshclam&quot; requested_mask=3D&quot;wr&quot; deni=
ed_mask=3D&quot;wr&quot; fsuid=3D0 ouid=3D0<br>
&gt;<br>
&gt; --<br>
&gt; AppArmor mailing list<br>
&gt; <a href=3D"mailto:AppArmor@lists.ubuntu.com" target=3D"_blank">AppArmo=
r@lists.ubuntu.com</a><br>
&gt; Modify settings or unsubscribe at: <a href=3D"https://lists.ubuntu.com=
/mailman/listinfo/apparmor" rel=3D"noreferrer" target=3D"_blank">https://li=
sts.ubuntu.com/mailman/listinfo/apparmor</a><br>
<br>
-- <br>
AppArmor mailing list<br>
<a href=3D"mailto:AppArmor@lists.ubuntu.com" target=3D"_blank">AppArmor@lis=
ts.ubuntu.com</a><br>
Modify settings or unsubscribe at: <a href=3D"https://lists.ubuntu.com/mail=
man/listinfo/apparmor" rel=3D"noreferrer" target=3D"_blank">https://lists.u=
buntu.com/mailman/listinfo/apparmor</a><br>
</div></div></div>
</div></div></div>

--00000000000010fba90591ca1bab--


--===============2417896274887129485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============2417896274887129485==--


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C64A2EEF7E
	for <lists+apparmor@lfdr.de>; Mon,  4 Nov 2019 23:21:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iRkjK-0007iO-OT; Mon, 04 Nov 2019 22:21:46 +0000
Received: from us-smtp-delivery-180.mimecast.com ([216.205.24.180])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <justin.dick@vizio.com>) id 1iQaeT-00061t-8X
 for apparmor@lists.ubuntu.com; Fri, 01 Nov 2019 17:23:57 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03lp2056.outbound.protection.outlook.com [104.47.40.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-DlLvjbycMw-kGOOf17-5VQ-1; Fri, 01 Nov 2019 13:23:54 -0400
Received: from MW2PR12MB2539.namprd12.prod.outlook.com (52.132.180.158) by
 MW2PR12MB2425.namprd12.prod.outlook.com (52.132.183.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Fri, 1 Nov 2019 17:23:50 +0000
Received: from MW2PR12MB2539.namprd12.prod.outlook.com
 ([fe80::3c98:bfb:1c2e:b14f]) by MW2PR12MB2539.namprd12.prod.outlook.com
 ([fe80::3c98:bfb:1c2e:b14f%5]) with mapi id 15.20.2408.016; Fri, 1 Nov 2019
 17:23:50 +0000
From: Justin Dick <Justin.Dick@vizio.com>
To: Tyler Hicks <tyhicks@canonical.com>
Thread-Topic: [EXTERNAL] Re: [apparmor] Missing /sys/kernel/security/apparmor
Thread-Index: AQHVjqZmI64cIr9FO0241lovDlGGBadznDMAgAL4X/I=
Date: Fri, 1 Nov 2019 17:23:49 +0000
Message-ID: <MW2PR12MB2539AC7FB0AFF0B5E9C96286E2620@MW2PR12MB2539.namprd12.prod.outlook.com>
References: <MW2PR12MB25397A228FC5D8FBBE30488AE2610@MW2PR12MB2539.namprd12.prod.outlook.com>,
 <20191030200059.GC4537@elm>
In-Reply-To: <20191030200059.GC4537@elm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [75.164.179.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1677e43c-1b25-466f-baa1-08d75ef042c8
x-ms-traffictypediagnostic: MW2PR12MB2425:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MW2PR12MB2425C10150B5FBFA66990FE0E2620@MW2PR12MB2425.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39850400004)(136003)(376002)(346002)(366004)(199004)(53754006)(189003)(51914003)(606006)(66476007)(316002)(76116006)(6506007)(76176011)(66066001)(53546011)(71200400001)(33656002)(7736002)(5660300002)(9686003)(19627405001)(15650500001)(86362001)(102836004)(71190400001)(478600001)(99286004)(7696005)(26005)(186003)(74316002)(55016002)(54896002)(6306002)(52536014)(81156014)(81166006)(236005)(66556008)(66946007)(64756008)(66446008)(8676002)(476003)(11346002)(2906002)(446003)(14444005)(256004)(4001150100001)(14454004)(966005)(229853002)(3846002)(8936002)(6116002)(4326008)(25786009)(6246003)(6436002)(105004)(486006)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW2PR12MB2425;
 H:MW2PR12MB2539.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j0+kUmRkbrISBrYuLwVytz3OeyEfibfSFLJei0ZpCDehmClsbWwiP033Jhd88ksn28PwxTRc68leHvikfU22dIpfV1cH2jR3uksPIM9sI3CuXpjfga5d9m7foOviqjP/xHPZpiiBM6At4QBBEwwKoPenGlwJ+2/Y50+DGL1iBMcehalyzDVLi+XIsQ+PosVYYcP6XsqA7boq+moMol5yuuvzCEi7dABcNp4ksiObv4/nFZhMDjLSXdeQFDNwrr4qLIpA8v+0bdFlFYuPciHYVTCvMvc2guHUnjo3CWFs96ck27ukt+0qCPwebyEClGb4X5Uto5rdkvaDzExiWM/3zAkm+efVQ6h/c1um8KPA/a8xIepzgm3oknJ7PWWnRKYGfbMrrS3wHBtO1LvYEkOPI+Rr+xZ+ClWLKQ2+RxiZjMtVJhGtHx3SY8MhGz9ynZiX2wLD53kpxqiFahHua+kSrNoAv6xHv9eQha1zcFfYAAE=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vizio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1677e43c-1b25-466f-baa1-08d75ef042c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 17:23:49.9349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de6e8d9c-bdf8-4e1d-9540-8bc6cb9cda82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JRzZ5Z9tLk4Ky966SUtygf4QWqsxt265cCUHgQBnxj5qipPXf9WRwAEZdmlWS/BXgEf0iXiom8LTZfYGxmmHzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2425
X-MC-Unique: DlLvjbycMw-kGOOf17-5VQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Mon, 04 Nov 2019 22:21:45 +0000
Subject: Re: [apparmor] [EXTERNAL] Re: Missing /sys/kernel/security/apparmor
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
Cc: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Content-Type: multipart/mixed; boundary="===============1559824712511414106=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============1559824712511414106==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MW2PR12MB2539AC7FB0AFF0B5E9C96286E2620MW2PR12MB2539namp_"

--_000_MW2PR12MB2539AC7FB0AFF0B5E9C96286E2620MW2PR12MB2539namp_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Thanks for the help, Tyler.  The manual mount worked perfectly; I'll work o=
n getting it into the boot process, or perhaps work on porting systemd.
________________________________
From: Tyler Hicks <tyhicks@canonical.com>
Sent: Wednesday, October 30, 2019 1:01 PM
To: Justin Dick <Justin.Dick@vizio.com>
Cc: apparmor@lists.ubuntu.com <apparmor@lists.ubuntu.com>
Subject: [EXTERNAL] Re: [apparmor] Missing /sys/kernel/security/apparmor

On 2019-10-29 22:28:42, Justin Dick wrote:
> Hello all -
>
> I'm trying to enable snapd on an embedded device, and looking into gettin=
g apparmor support sorted out. I'm working with kernel 3.10 and AFAIK have =
everything set up properly in the config. After boot, /sys/module/apparmor/=
parameters/enabled is 'Y', but /sys/kernel/security/ is completely empty. I=
've tried booting with no explicit flags set in the kernel boot parameters =
(relying on the kernel config defaults), and with setting "security=3Dappar=
mor apparmor=3D1". Nothing seems to help.
>
> Any ideas from anyone? I'm pasting the relevant entries in /proc/config.g=
z below.

You must mount securityfs as part of the boot process. You can do this
manually to verify that it works:

$ sudo mount -t securityfs securityfs /sys/kernel/security

If that works, you'll need to determine how to best make that happen in
early boot of your embedded device.

Tyler

>
> Thanks, all!
> Justin
>
> -sh-3.2# cat /proc/config.gz | gzip -d | grep SECURITY
> CONFIG_EXT4_FS_SECURITY=3Dy
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITYFS=3Dy
> CONFIG_SECURITY_NETWORK=3Dy
> # CONFIG_SECURITY_NETWORK_XFRM is not set
> CONFIG_SECURITY_PATH=3Dy
> # CONFIG_SECURITY_SELINUX is not set
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> CONFIG_SECURITY_APPARMOR=3Dy
> CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=3D1
> # CONFIG_SECURITY_YAMA is not set
> CONFIG_DEFAULT_SECURITY_APPARMOR=3Dy
> # CONFIG_DEFAULT_SECURITY_DAC is not set
> CONFIG_DEFAULT_SECURITY=3D"apparmor"
> -sh-3.2# ls /sys/kernel/security/
> -sh-3.2# cat /sys/module/apparmor/parameters/enabled
> Y
>

> --
> AppArmor mailing list
> AppArmor@lists.ubuntu.com
> Modify settings or unsubscribe at: https://lists.ubuntu.com/mailman/listi=
nfo/apparmor<https://lists.ubuntu.com/mailman/listinfo/apparmor>

--_000_MW2PR12MB2539AC7FB0AFF0B5E9C96286E2620MW2PR12MB2539namp_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Thanks for the help, Tyler.&nbsp; The manual mount worked perfectly; I'll w=
ork on getting it into the boot process, or perhaps work on porting systemd=
.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Tyler Hicks &lt;tyhic=
ks@canonical.com&gt;<br>
<b>Sent:</b> Wednesday, October 30, 2019 1:01 PM<br>
<b>To:</b> Justin Dick &lt;Justin.Dick@vizio.com&gt;<br>
<b>Cc:</b> apparmor@lists.ubuntu.com &lt;apparmor@lists.ubuntu.com&gt;<br>
<b>Subject:</b> [EXTERNAL] Re: [apparmor] Missing /sys/kernel/security/appa=
rmor</font>
<div>&nbsp;</div>
</div>
<div>On 2019-10-29 22:28:42, Justin Dick wrote:<br>
&gt; Hello all -<br>
&gt; <br>
&gt; I'm trying to enable snapd on an embedded device, and looking into get=
ting apparmor support sorted out. I'm working with kernel 3.10 and AFAIK ha=
ve everything set up properly in the config. After boot, /sys/module/apparm=
or/parameters/enabled is 'Y', but /sys/kernel/security/
 is completely empty. I've tried booting with no explicit flags set in the =
kernel boot parameters (relying on the kernel config defaults), and with se=
tting &quot;security=3Dapparmor apparmor=3D1&quot;. Nothing seems to help.<=
br>
&gt; <br>
&gt; Any ideas from anyone? I'm pasting the relevant entries in /proc/confi=
g.gz below.<br>
<br>
You must mount securityfs as part of the boot process. You can do this<br>
manually to verify that it works:<br>
<br>
$ sudo mount -t securityfs securityfs /sys/kernel/security<br>
<br>
If that works, you'll need to determine how to best make that happen in<br>
early boot of your embedded device.<br>
<br>
Tyler<br>
<br>
&gt; <br>
&gt; Thanks, all!<br>
&gt; Justin<br>
&gt; <br>
&gt; -sh-3.2# cat /proc/config.gz | gzip -d | grep SECURITY<br>
&gt; CONFIG_EXT4_FS_SECURITY=3Dy<br>
&gt; # CONFIG_SECURITY_DMESG_RESTRICT is not set<br>
&gt; CONFIG_SECURITY=3Dy<br>
&gt; CONFIG_SECURITYFS=3Dy<br>
&gt; CONFIG_SECURITY_NETWORK=3Dy<br>
&gt; # CONFIG_SECURITY_NETWORK_XFRM is not set<br>
&gt; CONFIG_SECURITY_PATH=3Dy<br>
&gt; # CONFIG_SECURITY_SELINUX is not set<br>
&gt; # CONFIG_SECURITY_SMACK is not set<br>
&gt; # CONFIG_SECURITY_TOMOYO is not set<br>
&gt; CONFIG_SECURITY_APPARMOR=3Dy<br>
&gt; CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=3D1<br>
&gt; # CONFIG_SECURITY_YAMA is not set<br>
&gt; CONFIG_DEFAULT_SECURITY_APPARMOR=3Dy<br>
&gt; # CONFIG_DEFAULT_SECURITY_DAC is not set<br>
&gt; CONFIG_DEFAULT_SECURITY=3D&quot;apparmor&quot;<br>
&gt; -sh-3.2# ls /sys/kernel/security/<br>
&gt; -sh-3.2# cat /sys/module/apparmor/parameters/enabled<br>
&gt; Y<br>
&gt; <br>
<br>
&gt; -- <br>
&gt; AppArmor mailing list<br>
&gt; AppArmor@lists.ubuntu.com<br>
&gt; Modify settings or unsubscribe at: <a href=3D"https://lists.ubuntu.com=
/mailman/listinfo/apparmor">
https://lists.ubuntu.com/mailman/listinfo/apparmor</a><br>
</div>
</body>
</html>

--_000_MW2PR12MB2539AC7FB0AFF0B5E9C96286E2620MW2PR12MB2539namp_--



--===============1559824712511414106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============1559824712511414106==--



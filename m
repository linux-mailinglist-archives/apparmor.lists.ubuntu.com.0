Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FA2EA46F
	for <lists+apparmor@lfdr.de>; Wed, 30 Oct 2019 20:51:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iPu0E-0005lh-D8; Wed, 30 Oct 2019 19:51:34 +0000
Received: from us-smtp-delivery-180.mimecast.com ([216.205.24.180])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <justin.dick@vizio.com>) id 1iPZyv-0007vi-3k
 for apparmor@lists.ubuntu.com; Tue, 29 Oct 2019 22:28:53 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2050.outbound.protection.outlook.com [104.47.46.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-seNFx4YeNVOo5bJ9ojFHow-1; Tue, 29 Oct 2019 18:28:50 -0400
Received: from MW2PR12MB2539.namprd12.prod.outlook.com (52.132.180.158) by
 MW2PR12MB2459.namprd12.prod.outlook.com (52.132.180.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.17; Tue, 29 Oct 2019 22:28:48 +0000
Received: from MW2PR12MB2539.namprd12.prod.outlook.com
 ([fe80::3c98:bfb:1c2e:b14f]) by MW2PR12MB2539.namprd12.prod.outlook.com
 ([fe80::3c98:bfb:1c2e:b14f%5]) with mapi id 15.20.2408.016; Tue, 29 Oct 2019
 22:28:42 +0000
From: Justin Dick <Justin.Dick@vizio.com>
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Thread-Topic: Missing /sys/kernel/security/apparmor
Thread-Index: AQHVjqZmI64cIr9FO0241lovDlGGBQ==
Date: Tue, 29 Oct 2019 22:28:42 +0000
Message-ID: <MW2PR12MB25397A228FC5D8FBBE30488AE2610@MW2PR12MB2539.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [75.164.179.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d8aa408-1468-4155-1aea-08d75cbf5ac2
x-ms-traffictypediagnostic: MW2PR12MB2459:
x-microsoft-antispam-prvs: <MW2PR12MB2459FB732F3DFBC2709F7A97E2610@MW2PR12MB2459.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(396003)(376002)(346002)(136003)(366004)(53754006)(199004)(189003)(6436002)(5640700003)(7736002)(7696005)(1730700003)(81166006)(81156014)(25786009)(2501003)(105004)(26005)(186003)(14454004)(102836004)(478600001)(6506007)(8936002)(55016002)(9686003)(54896002)(99286004)(74316002)(6916009)(2351001)(19627405001)(15650500001)(316002)(33656002)(64756008)(14444005)(3846002)(6116002)(2906002)(66446008)(476003)(486006)(66476007)(71200400001)(71190400001)(66556008)(66946007)(76116006)(66066001)(86362001)(52536014)(5660300002)(256004)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW2PR12MB2459;
 H:MW2PR12MB2539.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cU+SdAon7LjbccbBDxAZqo3Gg2i8x7iZlYkhUyu8R+yqNef0JY36LbFFE8f4MBmK05aHJScY6a7X+u8Pd/twtrYDe3s4R7fKji76Rs/hph+10HtDRTxQ7FfHtDxleR+AnaWRFXqSDezdcI71maYYnOU0kKxIA8ribFRnTco7o7VBzI1Ekcq07cxYgGemAstn4pFdfcyF4gxNPHouU9/8Pi3EUgMsyXjHmcJc2gDCHjqC4YiFkjqLe1iby9sdSddRpQQXG5GckFo2YZX0yHY/SsUxp9C5oCEQ6gVeJ3Yw2YBiRE/R7QJyfm5RAJVw2oyfcsSo7JKrlf9776zfo82gvHJsSGOvNn/PApgyBD2z+yfZ2L4yWRmdrYW9hb+Y8VUcNrIJ+RiPIYAPBvsGfv18rRPVjckvJDu/I7kSEhXGaHHFHZq/rocQ+ncJ1ZU6U1eZ
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vizio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8aa408-1468-4155-1aea-08d75cbf5ac2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 22:28:42.5125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de6e8d9c-bdf8-4e1d-9540-8bc6cb9cda82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jx3M8ZtxTGdzIXlN0YcHefUp9QHFse2nMfRdNoSsoFITMFd0LkUWYT20aBMBRE9mFTy58d7T0D27jDN2BNGwug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2459
X-MC-Unique: seNFx4YeNVOo5bJ9ojFHow-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Wed, 30 Oct 2019 19:51:32 +0000
Subject: [apparmor] Missing /sys/kernel/security/apparmor
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
Content-Type: multipart/mixed; boundary="===============3415635447379366600=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============3415635447379366600==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MW2PR12MB25397A228FC5D8FBBE30488AE2610MW2PR12MB2539namp_"

--_000_MW2PR12MB25397A228FC5D8FBBE30488AE2610MW2PR12MB2539namp_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hello all -

I'm trying to enable snapd on an embedded device, and looking into getting =
apparmor support sorted out.  I'm working with kernel 3.10 and AFAIK have e=
verything set up properly in the config.  After boot, /sys/module/apparmor/=
parameters/enabled is 'Y', but /sys/kernel/security/ is completely empty.  =
I've tried booting with no explicit flags set in the kernel boot parameters=
 (relying on the kernel config defaults), and with setting "security=3Dappa=
rmor apparmor=3D1".  Nothing seems to help.

Any ideas from anyone?  I'm pasting the relevant entries in /proc/config.gz=
 below.

Thanks, all!
Justin

-sh-3.2# cat /proc/config.gz | gzip -d | grep SECURITY
CONFIG_EXT4_FS_SECURITY=3Dy
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=3Dy
CONFIG_SECURITYFS=3Dy
CONFIG_SECURITY_NETWORK=3Dy
# CONFIG_SECURITY_NETWORK_XFRM is not set
CONFIG_SECURITY_PATH=3Dy
# CONFIG_SECURITY_SELINUX is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
CONFIG_SECURITY_APPARMOR=3Dy
CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=3D1
# CONFIG_SECURITY_YAMA is not set
CONFIG_DEFAULT_SECURITY_APPARMOR=3Dy
# CONFIG_DEFAULT_SECURITY_DAC is not set
CONFIG_DEFAULT_SECURITY=3D"apparmor"
-sh-3.2# ls /sys/kernel/security/
-sh-3.2# cat /sys/module/apparmor/parameters/enabled
Y


--_000_MW2PR12MB25397A228FC5D8FBBE30488AE2610MW2PR12MB2539namp_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hello all -</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I'm trying to enable snapd on an embedded device, and looking into getting =
apparmor support sorted out.&nbsp; I'm working with kernel 3.10 and AFAIK h=
ave everything set up properly in the config.&nbsp; After boot, /sys/module=
/apparmor/parameters/enabled is 'Y', but /sys/kernel/security/
 is completely empty.&nbsp; I've tried booting with no explicit flags set i=
n the kernel boot parameters (relying on the kernel config defaults), and w=
ith setting &quot;security=3Dapparmor apparmor=3D1&quot;.&nbsp; Nothing see=
ms to help.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Any ideas from anyone?&nbsp; I'm pasting the relevant entries in /proc/conf=
ig.gz below.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Thanks, all!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Justin</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span>-sh-3.2# cat /proc/config.gz | gzip -d | grep SECURITY<br>
</span>
<div>CONFIG_EXT4_FS_SECURITY=3Dy<br>
</div>
<div># CONFIG_SECURITY_DMESG_RESTRICT is not set<br>
</div>
<div>CONFIG_SECURITY=3Dy<br>
</div>
<div>CONFIG_SECURITYFS=3Dy<br>
</div>
<div>CONFIG_SECURITY_NETWORK=3Dy<br>
</div>
<div># CONFIG_SECURITY_NETWORK_XFRM is not set<br>
</div>
<div>CONFIG_SECURITY_PATH=3Dy<br>
</div>
<div># CONFIG_SECURITY_SELINUX is not set<br>
</div>
<div># CONFIG_SECURITY_SMACK is not set<br>
</div>
<div># CONFIG_SECURITY_TOMOYO is not set<br>
</div>
<div>CONFIG_SECURITY_APPARMOR=3Dy<br>
</div>
<div>CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=3D1<br>
</div>
<div># CONFIG_SECURITY_YAMA is not set<br>
</div>
<div>CONFIG_DEFAULT_SECURITY_APPARMOR=3Dy<br>
</div>
<div># CONFIG_DEFAULT_SECURITY_DAC is not set<br>
</div>
<div>CONFIG_DEFAULT_SECURITY=3D&quot;apparmor&quot;<br>
</div>
<div>-sh-3.2# ls /sys/kernel/security/<br>
</div>
<div>-sh-3.2# cat /sys/module/apparmor/parameters/enabled <br>
</div>
<div>Y<br>
</div>
<br>
</div>
</body>
</html>

--_000_MW2PR12MB25397A228FC5D8FBBE30488AE2610MW2PR12MB2539namp_--



--===============3415635447379366600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============3415635447379366600==--



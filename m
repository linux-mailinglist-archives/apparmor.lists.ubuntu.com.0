Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B47777C315
	for <lists+apparmor@lfdr.de>; Wed, 31 Jul 2019 15:15:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hsoRg-0007uG-Hn; Wed, 31 Jul 2019 13:15:08 +0000
Received: from mail-eopbgr1380042.outbound.protection.outlook.com
 ([40.107.138.42] helo=IND01-MA1-obe.outbound.protection.outlook.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <abhishekvijeev@iisc.ac.in>) id 1hsoRc-0007ty-K3
 for apparmor@lists.ubuntu.com; Wed, 31 Jul 2019 13:15:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wd2rwvf976Vn/SUW3h3uncGZ2lYkPhFdVqFkDf1C0E7YU2e6cLn0tpVS8rUJEvANjfGmYXwdkYGgYBCUpcRFQ6PhFGP6tInYHqI4Ifg6hooaRHirLbwzPxobtn5M3SBdJ2GeIAyR/v882ZaxrRRmlZ/2iqVKUrzV2xwHDGMMVwVrb/n0gqMS4CLwBV9oaC3LcuOv6pKjjdk4RhrMjy2HdW2X0p49igKdmRCGnM2aauaG2ULR1OpI/A3dYeFF66hv7KCKEiTCvwX8EQq+ssftmeAd9E/eLIf69XQhhuVWB3vJO37+qkxyRLpNAFmrx4HGGoF4VqpBGLpNYSxg2SVTwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EIk8Hbh7JX67gebn/95Ozlph4JjHNL/AUmK8YpFWL8=;
 b=X9B9Rwm6u9MgJHQYDZZ5p+QAVsq9txo8rQOkgTbvXhmmrSi2fWEot2D09GxTlC8qf5NycWJJXC3x+ve4J8+IeBsgElHRZZ8DzuYAiHjGUR89D/zChUumDlRv0P1rRAgUR1TuqmhSGWt+DUcoXN9fDxOYwYYxPDev5KK3JPy1ypYlmBTYRJmFgI6clWSja/DGzB2gfb+sxocBp4xmjSUOLN3/exiifIED3U4Bpt6jKo/f3EJfqhyrxRzhlwWDGZiMh92YCGrp1eWX6iNh9gdt7r6JXD8mrwgggxzxY9QwEKo6uyZ/8EhO49thIW9j746rlWpK08KCohZ+C+fqP5FerQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=iisc.ac.in;dmarc=pass action=none
 header.from=iisc.ac.in;dkim=pass header.d=iisc.ac.in;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iisc.ac.in;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EIk8Hbh7JX67gebn/95Ozlph4JjHNL/AUmK8YpFWL8=;
 b=uLWn5XOdbLy78DH9ZnbDdZv0kWlVSNJy5us4F0hz/sqebvFbsky1zZIGXakObjZsckmj5z45txk9x3QrxF0C6YtvNR5HnzGGDy/jaiFbSHDhRsqAt4D2T8NLSk9WX+OP4d+ij9tJWIZ4Mq8oqGusRKGrHxPsdzLMqcD/+dSULU8=
Received: from MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM (10.174.63.142) by
 MAXPR0101MB1115.INDPRD01.PROD.OUTLOOK.COM (52.134.131.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Wed, 31 Jul 2019 13:15:00 +0000
Received: from MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::59de:f1b2:6017:42c6]) by MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::59de:f1b2:6017:42c6%11]) with mapi id 15.20.2115.005; Wed, 31 Jul
 2019 13:15:00 +0000
From: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
To: Seth Arnold <seth.arnold@canonical.com>
Thread-Topic: [apparmor] Questions about AppArmor's Kernel Code
Thread-Index: AQHVQ7FiuL2/i98WSU25BWOuSi1nA6bdO70AgAP8vMGAAP1AAIAA5SPjgACpCgCAAPR02A==
Date: Wed, 31 Jul 2019 13:15:00 +0000
Message-ID: <PN1PR0101MB1133CA642E64F1F4EE7D4191FBDF0@PN1PR0101MB1133.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB1132042133609E595BCC6F0FFBC00@MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM>
 <9240f8b1-3b4a-ebad-85c3-5dfd938d8aa2@canonical.com>
 <PN1PR0101MB1133959D5B326EE0AAE60EA6FBDD0@PN1PR0101MB1133.INDPRD01.PROD.OUTLOOK.COM>
 <84a65fdd-a6eb-ce58-ffe1-080adb0936cf@canonical.com>
 <MAXPR0101MB1132051BC16EE16163A38898FBDC0@MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM>,
 <20190730222508.GA15178@hunt>
In-Reply-To: <20190730222508.GA15178@hunt>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abhishekvijeev@iisc.ac.in; 
x-originating-ip: [14.139.128.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec9252d0-06a2-40d4-95be-08d715b917c0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:MAXPR0101MB1115; 
x-ms-traffictypediagnostic: MAXPR0101MB1115:
x-microsoft-antispam-prvs: <MAXPR0101MB1115044088892F16843FC1EBFBDF0@MAXPR0101MB1115.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(366004)(396003)(376002)(199004)(189003)(446003)(8676002)(68736007)(486006)(11346002)(6916009)(2906002)(71200400001)(71190400001)(54896002)(66066001)(6506007)(53546011)(76176011)(7736002)(6606003)(99286004)(102836004)(33656002)(25786009)(476003)(4326008)(26005)(6436002)(19627405001)(229853002)(186003)(52536014)(6486002)(6116002)(81166006)(53936002)(74316002)(5660300002)(81156014)(478600001)(14454004)(9686003)(91956017)(76116006)(66476007)(66946007)(64756008)(66446008)(66556008)(66616009)(86362001)(5024004)(6512007)(107886003)(54906003)(256004)(6246003)(99936001)(14444005)(3846002)(316002)(786003)(8936002)(80872003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR0101MB1115;
 H:MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: iisc.ac.in does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0LwZMPjszZBoFRI7FXOHPMMRKopCoXD2eB5yRSkHqdZKnBJXYZ6sEPacJBKVb/cElQvjCD1uXZ5850zrlP9kYsnr7s65xUueGp+VupLQy255DVWn4wlM2ZEOs5H2XDdTiF/um4k1r03o7YZpVc6A6HlcOilthn9xc2Zl7A69RamPKRn46KEzoXwUdKRQRpBf2i8EcU4FDgBmCy2xfhODvkzEXC2Fbb1G31zmdYJz2dwtXmTYYCmgVuFxuVaAXS5uhomrfhddXwviYZUeTPrSKv9Av1xWgjQLuv2mx+5dwYSe3H9+mlFsvfBrZMm2Z49XIxi95ZdC1FiKrtP8C8JX8+pKfGyn90tWtjMaVIv2WDyYanVCdNg+SyBCqgAGPKF4Pu7m/E6hIwosprjwBJJqalUiePZR71vdVVUCRv/xugQ=
Content-Type: multipart/mixed;
 boundary="_004_PN1PR0101MB1133CA642E64F1F4EE7D4191FBDF0PN1PR0101MB1133_"
MIME-Version: 1.0
X-OriginatorOrg: iisc.ac.in
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9252d0-06a2-40d4-95be-08d715b917c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 13:15:00.6565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f15cd97-f6a7-41e3-b2c5-ad4193976476
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: abhishekvijeev@IISc.ac.in
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1115
Subject: Re: [apparmor] Questions about AppArmor's Kernel Code
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
Cc: Rakesh Rajan Beck <rakeshbeck@iisc.ac.in>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--_004_PN1PR0101MB1133CA642E64F1F4EE7D4191FBDF0PN1PR0101MB1133_
Content-Type: multipart/alternative;
	boundary="_000_PN1PR0101MB1133CA642E64F1F4EE7D4191FBDF0PN1PR0101MB1133_"

--_000_PN1PR0101MB1133CA642E64F1F4EE7D4191FBDF0PN1PR0101MB1133_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Seth,

I'll surely keep that in mind, thank you. Here's the diff for policy_unpack=
.c after incorporating the changes John suggested (strdup( )):

diff --git a/linux-5.2.1/security/apparmor/policy_unpack.c b/linux-5.2.1/se=
curity/apparmor/policy_unpack.c
index 73836fe94..e63203d29 100644
--- a/linux-5.2.1/security/apparmor/policy_unpack.c
+++ b/linux-5.2.1/security/apparmor/policy_unpack.c
@@ -741,19 +741,14 @@ static struct aa_profile *unpack_profile(struct aa_ex=
t *e, char **ns_name)
  profile->clabel =3D kzalloc (sizeof(struct custom_label), GFP_KERNEL);
  if (!profile->clabel)
  goto fail;
- if (!unpack_str(e, &name, NULL))
+ if (!unpack_strdup(e, &profile->clabel->label_name, NULL))
  goto fail;
- profile->clabel->label_name =3D kzalloc (strlen(name), GFP_KERNEL);
- if (!profile->clabel->label_name)
- goto fail;
-
- strcpy (profile->clabel->label_name, name);

  if (!unpack_u32(e, &(profile->clabel->allow_cnt), NULL))
  goto fail;


if (unpack_nameX(e, AA_STRUCT, "data_list"))
  {
  profile->clabel->allow_list =3D kzalloc(sizeof(struct data_list), GFP_KER=
NEL);
  if (!profile->clabel->allow_list)
@@ -762,15 +757,11 @@ static struct aa_profile *unpack_profile(struct aa_ex=
t *e, char **ns_name)

  for (i =3D 0; i < profile->clabel->allow_cnt; i++)
  {
- if (!unpack_str(e, &name, NULL))
- goto fail;
  struct data_list *new_node =3D kzalloc(sizeof(struct data_list), GFP_KERN=
EL);
  if (!new_node)
  goto fail;
- new_node->data =3D kzalloc(strlen(name), GFP_KERNEL);
- if (!new_node->data)
- goto fail;
- strcpy(new_node->data, name);
+ if (!unpack_strdup(e, &new_node->data, NULL))
+                    goto fail;
  INIT_LIST_HEAD(&(new_node->lh));
  list_add(&(new_node->lh), &(profile->clabel->allow_list->lh));
  }


I wrongly assumed that the kernel was crashing for the same reasons as befo=
re incorporating John's changes.

On inspecting the fresh crash logs (attached with this email), I found that=
 the crash was now occurring at a different
location - namely the apparmor_socket_sendmsg () function in apparmor/lsm.c=
. Here, I was trying to extract the
destination IP address from struct msghdr *msg, using the following code:

DECLARE_SOCKADDR(struct sockaddr_in *, usin, msg->msg_name);
if (usin)
{
printk (KERN_INFO "msg sent to %pi4, %d\n", usin->sin_addr.s_addr, usin->si=
n_port);
}

Removing this code resulted in a stable kernel, and I have fortunately not =
had a crash since (I'd like to watch for a couple of
more days before being confident that the issue is resolved). However, I'm =
not quite sure what caused the null pointer
de-reference (as suggested by the log file) since I have an explicit check =
against this. Is there a better way to obtain the destination
IP address from struct msghdr *msg?





________________________________
From: Seth Arnold <seth.arnold@canonical.com>
Sent: 31 July 2019 03:55:08
To: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
Cc: apparmor@lists.ubuntu.com <apparmor@lists.ubuntu.com>; Rakesh Rajan Bec=
k <rakeshbeck@iisc.ac.in>
Subject: Re: [apparmor] Questions about AppArmor's Kernel Code

On Tue, Jul 30, 2019 at 12:42:48PM +0000, Abhishek Vijeev wrote:
> Thank you for the correction John.
>
> Despite changing the code to use strdup( ), the kernel still crashes. I
> have attached the modified file for reference.
>
> Is there anything else that might be causing the crash?

Hello Abhishek,

Please consider sharing your modification via diffs; passing along entire
files is pretty difficult to read and understand your changes.

Also be sure to include the full kernel messages when trying to debug
crashes. That's the best lever any has to prise apart the problem.

Thanks

--_000_PN1PR0101MB1133CA642E64F1F4EE7D4191FBDF0PN1PR0101MB1133_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0"></p>
<div>Hi Seth,</div>
<div><br>
</div>
<div>I'll surely keep that in mind, thank you. Here's the diff for policy_u=
npack.c after incorporating the changes John suggested (strdup( )):</div>
<div><br>
</div>
<div>diff --git a/linux-5.2.1/security/apparmor/policy_unpack.c b/linux-5.2=
.1/security/apparmor/policy_unpack.c</div>
<div>index 73836fe94..e63203d29 100644</div>
<div>--- a/linux-5.2.1/security/apparmor/policy_unpack.c</div>
<div>&#43;&#43;&#43; b/linux-5.2.1/security/apparmor/policy_unpack.c</div>
<div>@@ -741,19 &#43;741,14 @@ static struct aa_profile *unpack_profile(str=
uct aa_ext *e, char **ns_name)</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>profile-&gt;clabel =3D k=
zalloc (sizeof(struct custom_label), GFP_KERNEL);</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>if (!profile-&gt;clabel)=
</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>goto fail;</div>
<div>-<span style=3D"white-space:pre"> </span>if (!unpack_str(e, &amp;name,=
 NULL))</div>
<div>&#43;<span style=3D"white-space:pre"> </span>if (!unpack_strdup(e, &am=
p;profile-&gt;clabel-&gt;label_name, NULL))</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>goto fail;</div>
<div>-<span style=3D"white-space:pre"> </span>profile-&gt;clabel-&gt;label_=
name =3D kzalloc (strlen(name), GFP_KERNEL);</div>
<div>-<span style=3D"white-space:pre"> </span>if (!profile-&gt;clabel-&gt;l=
abel_name)</div>
<div>-<span style=3D"white-space:pre"> </span>goto fail;</div>
<div>-<span style=3D"white-space:pre"> </span></div>
<div>-<span style=3D"white-space:pre"> </span>strcpy (profile-&gt;clabel-&g=
t;label_name, name);</div>
<div>&nbsp;</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>if (!unpack_u32(e, &amp;=
(profile-&gt;clabel-&gt;allow_cnt), NULL))</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>goto fail;</div>
<div>&nbsp;</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>&nbsp;</div>
<div><span style=3D"white-space:pre"></span>if (unpack_nameX(e, AA_STRUCT, =
&quot;data_list&quot;))&nbsp;</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>{</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>profile-&gt;clabel-&gt;a=
llow_list =3D kzalloc(sizeof(struct data_list), GFP_KERNEL);</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>if (!profile-&gt;clabel-=
&gt;allow_list)</div>
<div>@@ -762,15 &#43;757,11 @@ static struct aa_profile *unpack_profile(str=
uct aa_ext *e, char **ns_name)</div>
<div>&nbsp;</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>for (i =3D 0; i &lt; pro=
file-&gt;clabel-&gt;allow_cnt; i&#43;&#43;)</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>{</div>
<div>-<span style=3D"white-space:pre"> </span>if (!unpack_str(e, &amp;name,=
 NULL))</div>
<div>-<span style=3D"white-space:pre"> </span>goto fail;</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>struct data_list *new_no=
de =3D kzalloc(sizeof(struct data_list), GFP_KERNEL);</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>if (!new_node)</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>goto fail;</div>
<div>-<span style=3D"white-space:pre"> </span>new_node-&gt;data =3D kzalloc=
(strlen(name), GFP_KERNEL);</div>
<div>-<span style=3D"white-space:pre"> </span>if (!new_node-&gt;data)</div>
<div>-<span style=3D"white-space:pre"> </span>goto fail;</div>
<div>-<span style=3D"white-space:pre"> </span>strcpy(new_node-&gt;data, nam=
e);</div>
<div>&#43;<span style=3D"white-space:pre"> </span>if (!unpack_strdup(e, &am=
p;new_node-&gt;data, NULL))</div>
<div>&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; goto fail;</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>INIT_LIST_HEAD(&amp;(new=
_node-&gt;lh));</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>list_add(&amp;(new_node-=
&gt;lh), &amp;(profile-&gt;clabel-&gt;allow_list-&gt;lh));</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>}</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span></div>
<div>&nbsp;</div>
<div>I wrongly assumed that the kernel was crashing for the same reasons as=
 before incorporating John's changes.</div>
<div><br>
</div>
<div>On inspecting the fresh crash logs (attached with this email), I found=
 that the crash was now occurring at a&nbsp;<span style=3D"font-size: 12pt;=
">different&nbsp;</span></div>
<div><span style=3D"font-size: 12pt;">l</span><span style=3D"font-size: 12p=
t;">ocation -&nbsp;</span><span style=3D"font-size: 12pt;">namely the appar=
mor_socket_sendmsg&nbsp;</span><span style=3D"font-size: 12pt;">() function=
 in apparmor/lsm.c.
</span><span style=3D"font-size: 12pt;">Here,</span><span style=3D"font-siz=
e: 12pt;"> I was trying to extract the&nbsp;</span></div>
<div><span style=3D"font-size: 12pt;">destination&nbsp;</span><span style=
=3D"font-size: 12pt;">IP address from struct msghdr *msg, using the followi=
ng code:</span></div>
<div>&nbsp;</div>
<div>DECLARE_SOCKADDR(struct sockaddr_in *, usin, msg-&gt;msg_name);</div>
<div>if (usin)</div>
<div>{</div>
<div>printk (KERN_INFO &quot;msg sent to %pi4, %d\n&quot;, usin-&gt;sin_add=
r.s_addr, usin-&gt;sin_port);</div>
<div>}</div>
<div><br>
</div>
<div>Removing this code resulted in a stable kernel, and I have fortunately=
 not had a crash since (I'd like to watch for a couple of&nbsp;</div>
<div>more days before being confident that the issue is resolved). However,=
&nbsp;I'm not&nbsp;<span style=3D"font-size: 12pt;">quite sure what caused =
the null pointer&nbsp;</span></div>
<div><span style=3D"font-size: 12pt;">de-reference (as </span><span style=
=3D"font-size: 12pt;">suggested by</span><span style=3D"font-size: 12pt;"> =
the log file) since I have an explicit check against this.&nbsp;</span><spa=
n style=3D"font-size: 12pt;">Is there a better
 way to obtain the destination</span></div>
<div><span style=3D"font-size: 12pt;">IP address from struct msghdr *msg?</=
span></div>
<div><br>
</div>
<div></div>
<div><br>
</div>
<div><br>
</div>
<br>
<p></p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Seth Arnold &lt;seth.=
arnold@canonical.com&gt;<br>
<b>Sent:</b> 31 July 2019 03:55:08<br>
<b>To:</b> Abhishek Vijeev &lt;abhishekvijeev@iisc.ac.in&gt;<br>
<b>Cc:</b> apparmor@lists.ubuntu.com &lt;apparmor@lists.ubuntu.com&gt;; Rak=
esh Rajan Beck &lt;rakeshbeck@iisc.ac.in&gt;<br>
<b>Subject:</b> Re: [apparmor] Questions about AppArmor's Kernel Code</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, Jul 30, 2019 at 12:42:48PM &#43;0000, Abhi=
shek Vijeev wrote:<br>
&gt; Thank you for the correction John.<br>
&gt; <br>
&gt; Despite changing the code to use strdup( ), the kernel still crashes. =
I<br>
&gt; have attached the modified file for reference.<br>
&gt; <br>
&gt; Is there anything else that might be causing the crash?<br>
<br>
Hello Abhishek,<br>
<br>
Please consider sharing your modification via diffs; passing along entire<b=
r>
files is pretty difficult to read and understand your changes.<br>
<br>
Also be sure to include the full kernel messages when trying to debug<br>
crashes. That's the best lever any has to prise apart the problem.<br>
<br>
Thanks&nbsp; <br>
</div>
</span></font></div>
</body>
</html>

--_000_PN1PR0101MB1133CA642E64F1F4EE7D4191FBDF0PN1PR0101MB1133_--

--_004_PN1PR0101MB1133CA642E64F1F4EE7D4191FBDF0PN1PR0101MB1133_
Content-Type: application/octet-stream; name="dmesg_logs"
Content-Description: dmesg_logs
Content-Disposition: attachment; filename="dmesg_logs"; size=36882;
	creation-date="Wed, 31 Jul 2019 13:13:06 GMT";
	modification-date="Wed, 31 Jul 2019 13:13:06 GMT"
Content-Transfer-Encoding: base64

WyAgICAwLjAwMDAwMF0gTGludXggdmVyc2lvbiA1LjIuMSAocm9vdEAyYTMyNmU2NmFjYjIpIChn
Y2MgdmVyc2lvbiA3LjQuMCAoVWJ1bnR1IDcuNC4wLTF1YnVudHUxfjE4LjA0KSkgIzI5IFNNUCBX
ZWQgSnVsIDMxIDA0OjUwOjU2IFVUQyAyMDE5ClsgICAgMC4wMDAwMDBdIENvbW1hbmQgbGluZTog
Qk9PVF9JTUFHRT0vYm9vdC92bWxpbnV6LTUuMi4xIHJvb3Q9VVVJRD0zZDRlNTc1OS02MTkyLTQw
YjctYjBlYi1jMjM1ZWQ0YjZkZDkgcm8gY3Jhc2hrZXJuZWw9YXV0byBxdWlldCBzcGxhc2ggY3Jh
c2hrZXJuZWw9NTEyTS06MTkyTQpbICAgIDAuMDAwMDAwXSBLRVJORUwgc3VwcG9ydGVkIGNwdXM6
ClsgICAgMC4wMDAwMDBdICAgSW50ZWwgR2VudWluZUludGVsClsgICAgMC4wMDAwMDBdICAgQU1E
IEF1dGhlbnRpY0FNRApbICAgIDAuMDAwMDAwXSAgIEh5Z29uIEh5Z29uR2VudWluZQpbICAgIDAu
MDAwMDAwXSAgIENlbnRhdXIgQ2VudGF1ckhhdWxzClsgICAgMC4wMDAwMDBdIHg4Ni9mcHU6IFN1
cHBvcnRpbmcgWFNBVkUgZmVhdHVyZSAweDAwMTogJ3g4NyBmbG9hdGluZyBwb2ludCByZWdpc3Rl
cnMnClsgICAgMC4wMDAwMDBdIHg4Ni9mcHU6IFN1cHBvcnRpbmcgWFNBVkUgZmVhdHVyZSAweDAw
MjogJ1NTRSByZWdpc3RlcnMnClsgICAgMC4wMDAwMDBdIHg4Ni9mcHU6IFN1cHBvcnRpbmcgWFNB
VkUgZmVhdHVyZSAweDAwNDogJ0FWWCByZWdpc3RlcnMnClsgICAgMC4wMDAwMDBdIHg4Ni9mcHU6
IHhzdGF0ZV9vZmZzZXRbMl06ICA1NzYsIHhzdGF0ZV9zaXplc1syXTogIDI1NgpbICAgIDAuMDAw
MDAwXSB4ODYvZnB1OiBFbmFibGVkIHhzdGF0ZSBmZWF0dXJlcyAweDcsIGNvbnRleHQgc2l6ZSBp
cyA4MzIgYnl0ZXMsIHVzaW5nICdzdGFuZGFyZCcgZm9ybWF0LgpbICAgIDAuMDAwMDAwXSBCSU9T
LXByb3ZpZGVkIHBoeXNpY2FsIFJBTSBtYXA6ClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21l
bSAweDAwMDAwMDAwMDAwMDAwMDAtMHgwMDAwMDAwMDAwMDlmYmZmXSB1c2FibGUKWyAgICAwLjAw
MDAwMF0gQklPUy1lODIwOiBbbWVtIDB4MDAwMDAwMDAwMDA5ZmMwMC0weDAwMDAwMDAwMDAwOWZm
ZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwMDAw
ZjAwMDAtMHgwMDAwMDAwMDAwMGZmZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSBCSU9TLWU4
MjA6IFttZW0gMHgwMDAwMDAwMDAwMTAwMDAwLTB4MDAwMDAwMDBkZmZlZmZmZl0gdXNhYmxlClsg
ICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwZGZmZjAwMDAtMHgwMDAwMDAw
MGRmZmZmZmZmXSBBQ1BJIGRhdGEKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4MDAw
MDAwMDBmZWMwMDAwMC0weDAwMDAwMDAwZmVjMDBmZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBd
IEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwZmVlMDAwMDAtMHgwMDAwMDAwMGZlZTAwZmZmXSBy
ZXNlcnZlZApbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMGZmZmMwMDAw
LTB4MDAwMDAwMDBmZmZmZmZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBb
bWVtIDB4MDAwMDAwMDEwMDAwMDAwMC0weDAwMDAwMDAyMWZmZmZmZmZdIHVzYWJsZQpbICAgIDAu
MDAwMDAwXSBOWCAoRXhlY3V0ZSBEaXNhYmxlKSBwcm90ZWN0aW9uOiBhY3RpdmUKWyAgICAwLjAw
MDAwMF0gU01CSU9TIDIuNSBwcmVzZW50LgpbICAgIDAuMDAwMDAwXSBETUk6IGlubm90ZWsgR21i
SCBWaXJ0dWFsQm94L1ZpcnR1YWxCb3gsIEJJT1MgVmlydHVhbEJveCAxMi8wMS8yMDA2ClsgICAg
MC4wMDAwMDBdIEh5cGVydmlzb3IgZGV0ZWN0ZWQ6IEtWTQpbICAgIDAuMDAwMDAwXSBrdm0tY2xv
Y2s6IFVzaW5nIG1zcnMgNGI1NjRkMDEgYW5kIDRiNTY0ZDAwClsgICAgMC4wMDAwMDBdIGt2bS1j
bG9jazogY3B1IDAsIG1zciAxNTE4MDEwMDEsIHByaW1hcnkgY3B1IGNsb2NrClsgICAgMC4wMDAw
MDBdIGt2bS1jbG9jazogdXNpbmcgc2NoZWQgb2Zmc2V0IG9mIDQ5MTg4OTQyOTk3NTQgY3ljbGVz
ClsgICAgMC4wMDAwMDJdIGNsb2Nrc291cmNlOiBrdm0tY2xvY2s6IG1hc2s6IDB4ZmZmZmZmZmZm
ZmZmZmZmZiBtYXhfY3ljbGVzOiAweDFjZDQyZTRkZmZiLCBtYXhfaWRsZV9uczogODgxNTkwNTkx
NDgzIG5zClsgICAgMC4wMDAwMDNdIHRzYzogRGV0ZWN0ZWQgMzU5OS45OTggTUh6IHByb2Nlc3Nv
cgpbICAgIDAuMDAxMDYxXSBlODIwOiB1cGRhdGUgW21lbSAweDAwMDAwMDAwLTB4MDAwMDBmZmZd
IHVzYWJsZSA9PT4gcmVzZXJ2ZWQKWyAgICAwLjAwMTA2M10gZTgyMDogcmVtb3ZlIFttZW0gMHgw
MDBhMDAwMC0weDAwMGZmZmZmXSB1c2FibGUKWyAgICAwLjAwMTA2NV0gbGFzdF9wZm4gPSAweDIy
MDAwMCBtYXhfYXJjaF9wZm4gPSAweDQwMDAwMDAwMApbICAgIDAuMDAxMDcyXSBNVFJSIGRlZmF1
bHQgdHlwZTogdW5jYWNoYWJsZQpbICAgIDAuMDAxMDczXSBNVFJSIHZhcmlhYmxlIHJhbmdlcyBk
aXNhYmxlZDoKWyAgICAwLjAwMTA3NF0gRGlzYWJsZWQKWyAgICAwLjAwMTA3NV0geDg2L1BBVDog
TVRSUnMgZGlzYWJsZWQsIHNraXBwaW5nIFBBVCBpbml0aWFsaXphdGlvbiB0b28uClsgICAgMC4w
MDEwNzZdIENQVSBNVFJScyBhbGwgYmxhbmsgLSB2aXJ0dWFsaXplZCBzeXN0ZW0uClsgICAgMC4w
MDEwNzddIHg4Ni9QQVQ6IENvbmZpZ3VyYXRpb24gWzAtN106IFdCICBXVCAgVUMtIFVDICBXQiAg
V1QgIFVDLSBVQyAgClsgICAgMC4wMDEwODBdIGxhc3RfcGZuID0gMHhkZmZmMCBtYXhfYXJjaF9w
Zm4gPSAweDQwMDAwMDAwMApbICAgIDAuMDAxMTI0XSBmb3VuZCBTTVAgTVAtdGFibGUgYXQgW21l
bSAweDAwMDlmZmYwLTB4MDAwOWZmZmZdClsgICAgMC4wNDg5NDVdIGNoZWNrOiBTY2FubmluZyAx
IGFyZWFzIGZvciBsb3cgbWVtb3J5IGNvcnJ1cHRpb24KWyAgICAwLjA0ODk2MF0gQlJLIFsweDE1
MWEwMTAwMCwgMHgxNTFhMDFmZmZdIFBHVEFCTEUKWyAgICAwLjA0ODk2MV0gQlJLIFsweDE1MWEw
MjAwMCwgMHgxNTFhMDJmZmZdIFBHVEFCTEUKWyAgICAwLjA0ODk2Ml0gQlJLIFsweDE1MWEwMzAw
MCwgMHgxNTFhMDNmZmZdIFBHVEFCTEUKWyAgICAwLjA0ODk4NV0gQlJLIFsweDE1MWEwNDAwMCwg
MHgxNTFhMDRmZmZdIFBHVEFCTEUKWyAgICAwLjA0ODk4NV0gQlJLIFsweDE1MWEwNTAwMCwgMHgx
NTFhMDVmZmZdIFBHVEFCTEUKWyAgICAwLjA0OTAzN10gQlJLIFsweDE1MWEwNjAwMCwgMHgxNTFh
MDZmZmZdIFBHVEFCTEUKWyAgICAwLjA0OTA0NV0gQlJLIFsweDE1MWEwNzAwMCwgMHgxNTFhMDdm
ZmZdIFBHVEFCTEUKWyAgICAwLjA0OTA1Ml0gQlJLIFsweDE1MWEwODAwMCwgMHgxNTFhMDhmZmZd
IFBHVEFCTEUKWyAgICAwLjA0OTA2OF0gQlJLIFsweDE1MWEwOTAwMCwgMHgxNTFhMDlmZmZdIFBH
VEFCTEUKWyAgICAwLjA0OTI5OF0gUkFNRElTSzogW21lbSAweDMzNWQ5MDAwLTB4MzVhZTNmZmZd
ClsgICAgMC4wNDkzMDZdIEFDUEk6IEVhcmx5IHRhYmxlIGNoZWNrc3VtIHZlcmlmaWNhdGlvbiBk
aXNhYmxlZApbICAgIDAuMDQ5MzIyXSBBQ1BJOiBSU0RQIDB4MDAwMDAwMDAwMDBFMDAwMCAwMDAw
MjQgKHYwMiBWQk9YICApClsgICAgMC4wNDkzMjRdIEFDUEk6IFhTRFQgMHgwMDAwMDAwMERGRkYw
MDMwIDAwMDAzQyAodjAxIFZCT1ggICBWQk9YWFNEVCAwMDAwMDAwMSBBU0wgIDAwMDAwMDYxKQpb
ICAgIDAuMDQ5MzI4XSBBQ1BJOiBGQUNQIDB4MDAwMDAwMDBERkZGMDBGMCAwMDAwRjQgKHYwNCBW
Qk9YICAgVkJPWEZBQ1AgMDAwMDAwMDEgQVNMICAwMDAwMDA2MSkKWyAgICAwLjA0OTMzM10gQUNQ
STogRFNEVCAweDAwMDAwMDAwREZGRjA0ODAgMDAyMUZGICh2MDIgVkJPWCAgIFZCT1hCSU9TIDAw
MDAwMDAyIElOVEwgMjAxODAxMDUpClsgICAgMC4wNDkzMzZdIEFDUEk6IEZBQ1MgMHgwMDAwMDAw
MERGRkYwMjAwIDAwMDA0MApbICAgIDAuMDQ5MzM4XSBBQ1BJOiBGQUNTIDB4MDAwMDAwMDBERkZG
MDIwMCAwMDAwNDAKWyAgICAwLjA0OTM0MF0gQUNQSTogQVBJQyAweDAwMDAwMDAwREZGRjAyNDAg
MDAwMDZDICh2MDIgVkJPWCAgIFZCT1hBUElDIDAwMDAwMDAxIEFTTCAgMDAwMDAwNjEpClsgICAg
MC4wNDkzNDJdIEFDUEk6IFNTRFQgMHgwMDAwMDAwMERGRkYwMkIwIDAwMDFDQyAodjAxIFZCT1gg
ICBWQk9YQ1BVVCAwMDAwMDAwMiBJTlRMIDIwMTgwMTA1KQpbICAgIDAuMDQ5MzQ4XSBBQ1BJOiBM
b2NhbCBBUElDIGFkZHJlc3MgMHhmZWUwMDAwMApbICAgIDAuMDQ5NDk4XSBObyBOVU1BIGNvbmZp
Z3VyYXRpb24gZm91bmQKWyAgICAwLjA0OTQ5OV0gRmFraW5nIGEgbm9kZSBhdCBbbWVtIDB4MDAw
MDAwMDAwMDAwMDAwMC0weDAwMDAwMDAyMWZmZmZmZmZdClsgICAgMC4wNDk1MDVdIE5PREVfREFU
QSgwKSBhbGxvY2F0ZWQgW21lbSAweDIxZmZkMTAwMC0weDIxZmZmYmZmZl0KWyAgICAwLjA0OTYy
OF0gUmVzZXJ2aW5nIDE5Mk1CIG9mIG1lbW9yeSBhdCAzMzc2TUIgZm9yIGNyYXNoa2VybmVsIChT
eXN0ZW0gUkFNOiA4MTkxTUIpClsgICAgMC4wNDk4MjNdIFpvbmUgcmFuZ2VzOgpbICAgIDAuMDQ5
ODI0XSAgIERNQSAgICAgIFttZW0gMHgwMDAwMDAwMDAwMDAxMDAwLTB4MDAwMDAwMDAwMGZmZmZm
Zl0KWyAgICAwLjA0OTgyNV0gICBETUEzMiAgICBbbWVtIDB4MDAwMDAwMDAwMTAwMDAwMC0weDAw
MDAwMDAwZmZmZmZmZmZdClsgICAgMC4wNDk4MjVdICAgTm9ybWFsICAgW21lbSAweDAwMDAwMDAx
MDAwMDAwMDAtMHgwMDAwMDAwMjFmZmZmZmZmXQpbICAgIDAuMDQ5ODI2XSAgIERldmljZSAgIGVt
cHR5ClsgICAgMC4wNDk4MjZdIE1vdmFibGUgem9uZSBzdGFydCBmb3IgZWFjaCBub2RlClsgICAg
MC4wNDk4MjhdIEVhcmx5IG1lbW9yeSBub2RlIHJhbmdlcwpbICAgIDAuMDQ5ODI5XSAgIG5vZGUg
ICAwOiBbbWVtIDB4MDAwMDAwMDAwMDAwMTAwMC0weDAwMDAwMDAwMDAwOWVmZmZdClsgICAgMC4w
NDk4MjldICAgbm9kZSAgIDA6IFttZW0gMHgwMDAwMDAwMDAwMTAwMDAwLTB4MDAwMDAwMDBkZmZl
ZmZmZl0KWyAgICAwLjA0OTgzMF0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAxMDAwMDAwMDAt
MHgwMDAwMDAwMjFmZmZmZmZmXQpbICAgIDAuMDUwMTU0XSBaZXJvZWQgc3RydWN0IHBhZ2UgaW4g
dW5hdmFpbGFibGUgcmFuZ2VzOiAxMTQgcGFnZXMKWyAgICAwLjA1MDE1NF0gSW5pdG1lbSBzZXR1
cCBub2RlIDAgW21lbSAweDAwMDAwMDAwMDAwMDEwMDAtMHgwMDAwMDAwMjFmZmZmZmZmXQpbICAg
IDAuMDUwMTU1XSBPbiBub2RlIDAgdG90YWxwYWdlczogMjA5NzAzOApbICAgIDAuMDUwMTU2XSAg
IERNQSB6b25lOiA2NCBwYWdlcyB1c2VkIGZvciBtZW1tYXAKWyAgICAwLjA1MDE1Nl0gICBETUEg
em9uZTogMjEgcGFnZXMgcmVzZXJ2ZWQKWyAgICAwLjA1MDE1N10gICBETUEgem9uZTogMzk5OCBw
YWdlcywgTElGTyBiYXRjaDowClsgICAgMC4wNTAxODJdICAgRE1BMzIgem9uZTogMTQyNzIgcGFn
ZXMgdXNlZCBmb3IgbWVtbWFwClsgICAgMC4wNTAxODJdICAgRE1BMzIgem9uZTogOTEzMzkyIHBh
Z2VzLCBMSUZPIGJhdGNoOjYzClsgICAgMC4wNjA3NTBdICAgTm9ybWFsIHpvbmU6IDE4NDMyIHBh
Z2VzIHVzZWQgZm9yIG1lbW1hcApbICAgIDAuMDYwNzUyXSAgIE5vcm1hbCB6b25lOiAxMTc5NjQ4
IHBhZ2VzLCBMSUZPIGJhdGNoOjYzClsgICAgMC4wNzQ2NTFdIEFDUEk6IFBNLVRpbWVyIElPIFBv
cnQ6IDB4NDAwOApbICAgIDAuMDc0NjU1XSBBQ1BJOiBMb2NhbCBBUElDIGFkZHJlc3MgMHhmZWUw
MDAwMApbICAgIDAuMDc0Njk5XSBJT0FQSUNbMF06IGFwaWNfaWQgNCwgdmVyc2lvbiAzMiwgYWRk
cmVzcyAweGZlYzAwMDAwLCBHU0kgMC0yMwpbICAgIDAuMDc0NzAxXSBBQ1BJOiBJTlRfU1JDX09W
UiAoYnVzIDAgYnVzX2lycSAwIGdsb2JhbF9pcnEgMiBkZmwgZGZsKQpbICAgIDAuMDc0NzAyXSBB
Q1BJOiBJTlRfU1JDX09WUiAoYnVzIDAgYnVzX2lycSA5IGdsb2JhbF9pcnEgOSBsb3cgbGV2ZWwp
ClsgICAgMC4wNzQ3MDNdIEFDUEk6IElSUTAgdXNlZCBieSBvdmVycmlkZS4KWyAgICAwLjA3NDcw
NF0gQUNQSTogSVJROSB1c2VkIGJ5IG92ZXJyaWRlLgpbICAgIDAuMDc0NzA1XSBVc2luZyBBQ1BJ
IChNQURUKSBmb3IgU01QIGNvbmZpZ3VyYXRpb24gaW5mb3JtYXRpb24KWyAgICAwLjA3NDcxMF0g
c21wYm9vdDogQWxsb3dpbmcgNCBDUFVzLCAwIGhvdHBsdWcgQ1BVcwpbICAgIDAuMDc0NzI1XSBQ
TTogUmVnaXN0ZXJlZCBub3NhdmUgbWVtb3J5OiBbbWVtIDB4MDAwMDAwMDAtMHgwMDAwMGZmZl0K
WyAgICAwLjA3NDcyNl0gUE06IFJlZ2lzdGVyZWQgbm9zYXZlIG1lbW9yeTogW21lbSAweDAwMDlm
MDAwLTB4MDAwOWZmZmZdClsgICAgMC4wNzQ3MjZdIFBNOiBSZWdpc3RlcmVkIG5vc2F2ZSBtZW1v
cnk6IFttZW0gMHgwMDBhMDAwMC0weDAwMGVmZmZmXQpbICAgIDAuMDc0NzI3XSBQTTogUmVnaXN0
ZXJlZCBub3NhdmUgbWVtb3J5OiBbbWVtIDB4MDAwZjAwMDAtMHgwMDBmZmZmZl0KWyAgICAwLjA3
NDcyN10gUE06IFJlZ2lzdGVyZWQgbm9zYXZlIG1lbW9yeTogW21lbSAweGRmZmYwMDAwLTB4ZGZm
ZmZmZmZdClsgICAgMC4wNzQ3MjhdIFBNOiBSZWdpc3RlcmVkIG5vc2F2ZSBtZW1vcnk6IFttZW0g
MHhlMDAwMDAwMC0weGZlYmZmZmZmXQpbICAgIDAuMDc0NzI4XSBQTTogUmVnaXN0ZXJlZCBub3Nh
dmUgbWVtb3J5OiBbbWVtIDB4ZmVjMDAwMDAtMHhmZWMwMGZmZl0KWyAgICAwLjA3NDcyOF0gUE06
IFJlZ2lzdGVyZWQgbm9zYXZlIG1lbW9yeTogW21lbSAweGZlYzAxMDAwLTB4ZmVkZmZmZmZdClsg
ICAgMC4wNzQ3MjldIFBNOiBSZWdpc3RlcmVkIG5vc2F2ZSBtZW1vcnk6IFttZW0gMHhmZWUwMDAw
MC0weGZlZTAwZmZmXQpbICAgIDAuMDc0NzI5XSBQTTogUmVnaXN0ZXJlZCBub3NhdmUgbWVtb3J5
OiBbbWVtIDB4ZmVlMDEwMDAtMHhmZmZiZmZmZl0KWyAgICAwLjA3NDcyOV0gUE06IFJlZ2lzdGVy
ZWQgbm9zYXZlIG1lbW9yeTogW21lbSAweGZmZmMwMDAwLTB4ZmZmZmZmZmZdClsgICAgMC4wNzQ3
MzBdIFttZW0gMHhlMDAwMDAwMC0weGZlYmZmZmZmXSBhdmFpbGFibGUgZm9yIFBDSSBkZXZpY2Vz
ClsgICAgMC4wNzQ3MzFdIEJvb3RpbmcgcGFyYXZpcnR1YWxpemVkIGtlcm5lbCBvbiBLVk0KWyAg
ICAwLjA3NDczM10gY2xvY2tzb3VyY2U6IHJlZmluZWQtamlmZmllczogbWFzazogMHhmZmZmZmZm
ZiBtYXhfY3ljbGVzOiAweGZmZmZmZmZmLCBtYXhfaWRsZV9uczogNzY0NTUxOTYwMDIxMTU2OCBu
cwpbICAgIDAuMDc0NzM2XSBzZXR1cF9wZXJjcHU6IE5SX0NQVVM6ODE5MiBucl9jcHVtYXNrX2Jp
dHM6NCBucl9jcHVfaWRzOjQgbnJfbm9kZV9pZHM6MQpbICAgIDAuMDc0OTkzXSBwZXJjcHU6IEVt
YmVkZGVkIDU1IHBhZ2VzL2NwdSBzMTg4NDE2IHI4MTkyIGQyODY3MiB1NTI0Mjg4ClsgICAgMC4w
NzQ5OTZdIHBjcHUtYWxsb2M6IHMxODg0MTYgcjgxOTIgZDI4NjcyIHU1MjQyODggYWxsb2M9MSoy
MDk3MTUyClsgICAgMC4wNzQ5OTddIHBjcHUtYWxsb2M6IFswXSAwIDEgMiAzIApbICAgIDAuMDc1
MDEyXSBQViBxc3BpbmxvY2sgaGFzaCB0YWJsZSBlbnRyaWVzOiAyNTYgKG9yZGVyOiAwLCA0MDk2
IGJ5dGVzKQpbICAgIDAuMDc1MDE1XSBCdWlsdCAxIHpvbmVsaXN0cywgbW9iaWxpdHkgZ3JvdXBp
bmcgb24uICBUb3RhbCBwYWdlczogMjA2NDI0OQpbICAgIDAuMDc1MDE2XSBQb2xpY3kgem9uZTog
Tm9ybWFsClsgICAgMC4wNzUwMTZdIEtlcm5lbCBjb21tYW5kIGxpbmU6IEJPT1RfSU1BR0U9L2Jv
b3Qvdm1saW51ei01LjIuMSByb290PVVVSUQ9M2Q0ZTU3NTktNjE5Mi00MGI3LWIwZWItYzIzNWVk
NGI2ZGQ5IHJvIGNyYXNoa2VybmVsPWF1dG8gcXVpZXQgc3BsYXNoIGNyYXNoa2VybmVsPTUxMk0t
OjE5Mk0KWyAgICAwLjA4Mjg3Nl0gQ2FsZ2FyeTogZGV0ZWN0aW5nIENhbGdhcnkgdmlhIEJJT1Mg
RUJEQSBhcmVhClsgICAgMC4wODI4NzddIENhbGdhcnk6IFVuYWJsZSB0byBsb2NhdGUgUmlvIEdy
YW5kZSB0YWJsZSBpbiBFQkRBIC0gYmFpbGluZyEKWyAgICAwLjEwODQ5N10gTWVtb3J5OiA3OTIy
Mzc2Sy84Mzg4MTUySyBhdmFpbGFibGUgKDE0MzM5SyBrZXJuZWwgY29kZSwgMjM0OEsgcndkYXRh
LCA0MzI4SyByb2RhdGEsIDI1MTZLIGluaXQsIDUyNDhLIGJzcywgNDY1Nzc2SyByZXNlcnZlZCwg
MEsgY21hLXJlc2VydmVkKQpbICAgIDAuMTA4NzcyXSBTTFVCOiBIV2FsaWduPTY0LCBPcmRlcj0w
LTMsIE1pbk9iamVjdHM9MCwgQ1BVcz00LCBOb2Rlcz0xClsgICAgMC4xMDg3ODBdIEtlcm5lbC9V
c2VyIHBhZ2UgdGFibGVzIGlzb2xhdGlvbjogZW5hYmxlZApbICAgIDAuMTA4NzkxXSBmdHJhY2U6
IGFsbG9jYXRpbmcgNDE2NjAgZW50cmllcyBpbiAxNjMgcGFnZXMKWyAgICAwLjExODYyMF0gcmN1
OiBIaWVyYXJjaGljYWwgUkNVIGltcGxlbWVudGF0aW9uLgpbICAgIDAuMTE4NjIyXSByY3U6IAlS
Q1UgcmVzdHJpY3RpbmcgQ1BVcyBmcm9tIE5SX0NQVVM9ODE5MiB0byBucl9jcHVfaWRzPTQuClsg
ICAgMC4xMTg2MjJdIAlUYXNrcyBSQ1UgZW5hYmxlZC4KWyAgICAwLjExODYyM10gcmN1OiBSQ1Ug
Y2FsY3VsYXRlZCB2YWx1ZSBvZiBzY2hlZHVsZXItZW5saXN0bWVudCBkZWxheSBpcyAyNSBqaWZm
aWVzLgpbICAgIDAuMTE4NjIzXSByY3U6IEFkanVzdGluZyBnZW9tZXRyeSBmb3IgcmN1X2Zhbm91
dF9sZWFmPTE2LCBucl9jcHVfaWRzPTQKWyAgICAwLjEyMDQwOV0gTlJfSVJRUzogNTI0NTQ0LCBu
cl9pcnFzOiA0NTYsIHByZWFsbG9jYXRlZCBpcnFzOiAxNgpbICAgIDAuMTIwODQ3XSByYW5kb206
IGdldF9yYW5kb21fYnl0ZXMgY2FsbGVkIGZyb20gc3RhcnRfa2VybmVsKzB4MzNjLzB4NTIwIHdp
dGggY3JuZ19pbml0PTAKWyAgICAwLjEyODE5NV0gQ29uc29sZTogY29sb3VyIFZHQSsgODB4MjUK
WyAgICAwLjEyODIyM10gcHJpbnRrOiBjb25zb2xlIFt0dHkwXSBlbmFibGVkClsgICAgMC4xMjgz
NDFdIEFDUEk6IENvcmUgcmV2aXNpb24gMjAxOTA1MDkKWyAgICAwLjEyODgyN10gQVBJQzogU3dp
dGNoIHRvIHN5bW1ldHJpYyBJL08gbW9kZSBzZXR1cApbICAgIDAuMTI5MDc3XSB4MmFwaWMgZW5h
YmxlZApbICAgIDAuMTI5Mjc4XSBTd2l0Y2hlZCBBUElDIHJvdXRpbmcgdG8gcGh5c2ljYWwgeDJh
cGljLgpbICAgIDAuMTMwMzYwXSAuLlRJTUVSOiB2ZWN0b3I9MHgzMCBhcGljMT0wIHBpbjE9MiBh
cGljMj0tMSBwaW4yPS0xClsgICAgMC4xMzA0MDhdIGNsb2Nrc291cmNlOiB0c2MtZWFybHk6IG1h
c2s6IDB4ZmZmZmZmZmZmZmZmZmZmZiBtYXhfY3ljbGVzOiAweDMzZTQ1MWFiMWE2LCBtYXhfaWRs
ZV9uczogNDQwNzk1Mjc4NzIwIG5zClsgICAgMC4xMzA0NDFdIENhbGlicmF0aW5nIGRlbGF5IGxv
b3AgKHNraXBwZWQpIHByZXNldCB2YWx1ZS4uIDcxOTkuOTkgQm9nb01JUFMgKGxwaj0xNDM5OTk5
MikKWyAgICAwLjEzMDQ0NV0gcGlkX21heDogZGVmYXVsdDogMzI3NjggbWluaW11bTogMzAxClsg
ICAgMC4xMzA1NThdIExTTTogU2VjdXJpdHkgRnJhbWV3b3JrIGluaXRpYWxpemluZwpbICAgIDAu
MTMwNTg2XSBZYW1hOiBiZWNvbWluZyBtaW5kZnVsLgpbICAgIDAuMTMwNjM3XSBBcHBBcm1vcjog
QXBwQXJtb3IgaW5pdGlhbGl6ZWQKWyAgICAwLjEzMDYzOF0gVE9NT1lPIExpbnV4IGluaXRpYWxp
emVkClsgICAgMC4xMzE4NTBdIERlbnRyeSBjYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDEwNDg1
NzYgKG9yZGVyOiAxMSwgODM4ODYwOCBieXRlcykKWyAgICAwLjEzMjQ0M10gSW5vZGUtY2FjaGUg
aGFzaCB0YWJsZSBlbnRyaWVzOiA1MjQyODggKG9yZGVyOiAxMCwgNDE5NDMwNCBieXRlcykKWyAg
ICAwLjEzMjQ2MV0gTW91bnQtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAxNjM4NCAob3JkZXI6
IDUsIDEzMTA3MiBieXRlcykKWyAgICAwLjEzMjQ3MF0gTW91bnRwb2ludC1jYWNoZSBoYXNoIHRh
YmxlIGVudHJpZXM6IDE2Mzg0IChvcmRlcjogNSwgMTMxMDcyIGJ5dGVzKQpbICAgIDAuMTMyNTY5
XSAqKiogVkFMSURBVEUgcHJvYyAqKioKWyAgICAwLjEzMjYwM10gKioqIFZBTElEQVRFIGNncm91
cDEgKioqClsgICAgMC4xMzI2MDRdICoqKiBWQUxJREFURSBjZ3JvdXAyICoqKgpbICAgIDAuMTM0
NDkxXSBMYXN0IGxldmVsIGlUTEIgZW50cmllczogNEtCIDY0LCAyTUIgOCwgNE1CIDgKWyAgICAw
LjEzNDQ5Ml0gTGFzdCBsZXZlbCBkVExCIGVudHJpZXM6IDRLQiA2NCwgMk1CIDAsIDRNQiAwLCAx
R0IgNApbICAgIDAuMTM0NDkzXSBTcGVjdHJlIFYyIDogTWl0aWdhdGlvbjogRnVsbCBnZW5lcmlj
IHJldHBvbGluZQpbICAgIDAuMTM0NDkzXSBTcGVjdHJlIFYyIDogU3BlY3RyZSB2MiAvIFNwZWN0
cmVSU0IgbWl0aWdhdGlvbjogRmlsbGluZyBSU0Igb24gY29udGV4dCBzd2l0Y2gKWyAgICAwLjEz
NDQ5NF0gU3BlY3VsYXRpdmUgU3RvcmUgQnlwYXNzOiBWdWxuZXJhYmxlClsgICAgMC4xMzQ0OTdd
IE1EUzogVnVsbmVyYWJsZTogQ2xlYXIgQ1BVIGJ1ZmZlcnMgYXR0ZW1wdGVkLCBubyBtaWNyb2Nv
ZGUKWyAgICAwLjEzNDU5NV0gRnJlZWluZyBTTVAgYWx0ZXJuYXRpdmVzIG1lbW9yeTogMzZLClsg
ICAgMC4xMzg0MjVdIHNtcGJvb3Q6IENQVTA6IEludGVsKFIpIENvcmUoVE0pIGk3LTc3MDAgQ1BV
IEAgMy42MEdIeiAoZmFtaWx5OiAweDYsIG1vZGVsOiAweDllLCBzdGVwcGluZzogMHg5KQpbICAg
IDAuMTM4NDI1XSBQZXJmb3JtYW5jZSBFdmVudHM6IHVuc3VwcG9ydGVkIHA2IENQVSBtb2RlbCAx
NTggbm8gUE1VIGRyaXZlciwgc29mdHdhcmUgZXZlbnRzIG9ubHkuClsgICAgMC4xMzg0MjVdIHJj
dTogSGllcmFyY2hpY2FsIFNSQ1UgaW1wbGVtZW50YXRpb24uClsgICAgMC4xMzg0MjVdIE5NSSB3
YXRjaGRvZzogUGVyZiBOTUkgd2F0Y2hkb2cgcGVybWFuZW50bHkgZGlzYWJsZWQKWyAgICAwLjEz
ODQyNV0gc21wOiBCcmluZ2luZyB1cCBzZWNvbmRhcnkgQ1BVcyAuLi4KWyAgICAwLjEzODQyNV0g
eDg2OiBCb290aW5nIFNNUCBjb25maWd1cmF0aW9uOgpbICAgIDAuMTM4NDI1XSAuLi4uIG5vZGUg
ICMwLCBDUFVzOiAgICAgICMxClsgICAgMC4wMTM2MTNdIGt2bS1jbG9jazogY3B1IDEsIG1zciAx
NTE4MDEwNDEsIHNlY29uZGFyeSBjcHUgY2xvY2sKWyAgICAwLjEzODQyNV0gICMyClsgICAgMC4w
MTM2MTNdIGt2bS1jbG9jazogY3B1IDIsIG1zciAxNTE4MDEwODEsIHNlY29uZGFyeSBjcHUgY2xv
Y2sKWyAgICAwLjEzODQ4MF0gICMzClsgICAgMC4wMTM2MTNdIGt2bS1jbG9jazogY3B1IDMsIG1z
ciAxNTE4MDEwYzEsIHNlY29uZGFyeSBjcHUgY2xvY2sKWyAgICAwLjE0MDY5NV0gc21wOiBCcm91
Z2h0IHVwIDEgbm9kZSwgNCBDUFVzClsgICAgMC4xNDA2OTVdIHNtcGJvb3Q6IE1heCBsb2dpY2Fs
IHBhY2thZ2VzOiAxClsgICAgMC4xNDA2OTVdIHNtcGJvb3Q6IFRvdGFsIG9mIDQgcHJvY2Vzc29y
cyBhY3RpdmF0ZWQgKDI4Nzk5Ljk4IEJvZ29NSVBTKQpbICAgIDAuMTQyNDI3XSBkZXZ0bXBmczog
aW5pdGlhbGl6ZWQKWyAgICAwLjE0MjQ3Nl0geDg2L21tOiBNZW1vcnkgYmxvY2sgc2l6ZTogMTI4
TUIKWyAgICAwLjE0Mjg3Nl0gY2xvY2tzb3VyY2U6IGppZmZpZXM6IG1hc2s6IDB4ZmZmZmZmZmYg
bWF4X2N5Y2xlczogMHhmZmZmZmZmZiwgbWF4X2lkbGVfbnM6IDc2NDUwNDE3ODUxMDAwMDAgbnMK
WyAgICAwLjE0Mjg3Nl0gZnV0ZXggaGFzaCB0YWJsZSBlbnRyaWVzOiAxMDI0IChvcmRlcjogNCwg
NjU1MzYgYnl0ZXMpClsgICAgMC4xNDI4NzZdIHBpbmN0cmwgY29yZTogaW5pdGlhbGl6ZWQgcGlu
Y3RybCBzdWJzeXN0ZW0KWyAgICAwLjE0Mjg3Nl0gUE06IFJUQyB0aW1lOiAxMToyODozOSwgZGF0
ZTogMjAxOS0wNy0yOQpbICAgIDAuMTQzMDI3XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFt
aWx5IDE2ClsgICAgMC4xNDMwOTNdIGF1ZGl0OiBpbml0aWFsaXppbmcgbmV0bGluayBzdWJzeXMg
KGRpc2FibGVkKQpbICAgIDAuMTQzMTA4XSBhdWRpdDogdHlwZT0yMDAwIGF1ZGl0KDE1NjQ1NTc4
NjguNzYyOjEpOiBzdGF0ZT1pbml0aWFsaXplZCBhdWRpdF9lbmFibGVkPTAgcmVzPTEKWyAgICAw
LjE0MzEwOF0gY3B1aWRsZTogdXNpbmcgZ292ZXJub3IgbGFkZGVyClsgICAgMC4xNDMxMDhdIGNw
dWlkbGU6IHVzaW5nIGdvdmVybm9yIG1lbnUKWyAgICAwLjE0MzEwOF0gQUNQSTogYnVzIHR5cGUg
UENJIHJlZ2lzdGVyZWQKWyAgICAwLjE0MzEwOF0gYWNwaXBocDogQUNQSSBIb3QgUGx1ZyBQQ0kg
Q29udHJvbGxlciBEcml2ZXIgdmVyc2lvbjogMC41ClsgICAgMC4xNDMxMDhdIFBDSTogVXNpbmcg
Y29uZmlndXJhdGlvbiB0eXBlIDEgZm9yIGJhc2UgYWNjZXNzClsgICAgMC4xNDMzNTVdIEh1Z2VU
TEIgcmVnaXN0ZXJlZCAyLjAwIE1pQiBwYWdlIHNpemUsIHByZS1hbGxvY2F0ZWQgMCBwYWdlcwpb
ICAgIDAuMTQ2NTc2XSBBQ1BJOiBBZGRlZCBfT1NJKE1vZHVsZSBEZXZpY2UpClsgICAgMC4xNDY1
NzZdIEFDUEk6IEFkZGVkIF9PU0koUHJvY2Vzc29yIERldmljZSkKWyAgICAwLjE0NjU3Nl0gQUNQ
STogQWRkZWQgX09TSSgzLjAgX1NDUCBFeHRlbnNpb25zKQpbICAgIDAuMTQ2NTc2XSBBQ1BJOiBB
ZGRlZCBfT1NJKFByb2Nlc3NvciBBZ2dyZWdhdG9yIERldmljZSkKWyAgICAwLjE0NjU3Nl0gQUNQ
STogQWRkZWQgX09TSShMaW51eC1EZWxsLVZpZGVvKQpbICAgIDAuMTQ2NTc2XSBBQ1BJOiBBZGRl
ZCBfT1NJKExpbnV4LUxlbm92by1OVi1IRE1JLUF1ZGlvKQpbICAgIDAuMTQ2NTc2XSBBQ1BJOiBB
ZGRlZCBfT1NJKExpbnV4LUhQSS1IeWJyaWQtR3JhcGhpY3MpClsgICAgMC4xNTA4NjNdIEFDUEk6
IDIgQUNQSSBBTUwgdGFibGVzIHN1Y2Nlc3NmdWxseSBhY3F1aXJlZCBhbmQgbG9hZGVkClsgICAg
MC4xNTE5OTFdIEFDUEk6IEludGVycHJldGVyIGVuYWJsZWQKWyAgICAwLjE1MTk5OF0gQUNQSTog
KHN1cHBvcnRzIFMwIFM1KQpbICAgIDAuMTUxOTk5XSBBQ1BJOiBVc2luZyBJT0FQSUMgZm9yIGlu
dGVycnVwdCByb3V0aW5nClsgICAgMC4xNTIxNDhdIFBDSTogVXNpbmcgaG9zdCBicmlkZ2Ugd2lu
ZG93cyBmcm9tIEFDUEk7IGlmIG5lY2Vzc2FyeSwgdXNlICJwY2k9bm9jcnMiIGFuZCByZXBvcnQg
YSBidWcKWyAgICAwLjE1MjIyNF0gQUNQSTogRW5hYmxlZCAyIEdQRXMgaW4gYmxvY2sgMDAgdG8g
MDcKWyAgICAwLjE1NTQ0MF0gQUNQSTogUENJIFJvb3QgQnJpZGdlIFtQQ0kwXSAoZG9tYWluIDAw
MDAgW2J1cyAwMC1mZl0pClsgICAgMC4xNTU0NDNdIGFjcGkgUE5QMEEwMzowMDogX09TQzogT1Mg
c3VwcG9ydHMgW0FTUE0gQ2xvY2tQTSBTZWdtZW50cyBNU0kgSFBYLVR5cGUzXQpbICAgIDAuMTU1
NDU1XSBhY3BpIFBOUDBBMDM6MDA6IF9PU0M6IG5vdCByZXF1ZXN0aW5nIE9TIGNvbnRyb2w7IE9T
IHJlcXVpcmVzIFtFeHRlbmRlZENvbmZpZyBBU1BNIENsb2NrUE0gTVNJXQpbICAgIDAuMTU1NDYx
XSBhY3BpIFBOUDBBMDM6MDA6IGZhaWwgdG8gYWRkIE1NQ09ORklHIGluZm9ybWF0aW9uLCBjYW4n
dCBhY2Nlc3MgZXh0ZW5kZWQgUENJIGNvbmZpZ3VyYXRpb24gc3BhY2UgdW5kZXIgdGhpcyBicmlk
Z2UuClsgICAgMC4xNTU2ODJdIFBDSSBob3N0IGJyaWRnZSB0byBidXMgMDAwMDowMApbICAgIDAu
MTU1NjgzXSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFtpbyAgMHgwMDAwLTB4
MGNmNyB3aW5kb3ddClsgICAgMC4xNTU2ODRdIHBjaV9idXMgMDAwMDowMDogcm9vdCBidXMgcmVz
b3VyY2UgW2lvICAweDBkMDAtMHhmZmZmIHdpbmRvd10KWyAgICAwLjE1NTY4NV0gcGNpX2J1cyAw
MDAwOjAwOiByb290IGJ1cyByZXNvdXJjZSBbbWVtIDB4MDAwYTAwMDAtMHgwMDBiZmZmZiB3aW5k
b3ddClsgICAgMC4xNTU2ODZdIHBjaV9idXMgMDAwMDowMDogcm9vdCBidXMgcmVzb3VyY2UgW21l
bSAweGUwMDAwMDAwLTB4ZmRmZmZmZmYgd2luZG93XQpbICAgIDAuMTU1Njg2XSBwY2lfYnVzIDAw
MDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFtidXMgMDAtZmZdClsgICAgMC4xNTU3MjNdIHBjaSAw
MDAwOjAwOjAwLjA6IFs4MDg2OjEyMzddIHR5cGUgMDAgY2xhc3MgMHgwNjAwMDAKWyAgICAwLjE1
NjA0OF0gcGNpIDAwMDA6MDA6MDEuMDogWzgwODY6NzAwMF0gdHlwZSAwMCBjbGFzcyAweDA2MDEw
MApbICAgIDAuMTU2NDMzXSBwY2kgMDAwMDowMDowMS4xOiBbODA4Njo3MTExXSB0eXBlIDAwIGNs
YXNzIDB4MDEwMThhClsgICAgMC4xNTY2NjldIHBjaSAwMDAwOjAwOjAxLjE6IHJlZyAweDIwOiBb
aW8gIDB4ZDAwMC0weGQwMGZdClsgICAgMC4xNTY3NjFdIHBjaSAwMDAwOjAwOjAxLjE6IGxlZ2Fj
eSBJREUgcXVpcms6IHJlZyAweDEwOiBbaW8gIDB4MDFmMC0weDAxZjddClsgICAgMC4xNTY3NjJd
IHBjaSAwMDAwOjAwOjAxLjE6IGxlZ2FjeSBJREUgcXVpcms6IHJlZyAweDE0OiBbaW8gIDB4MDNm
Nl0KWyAgICAwLjE1Njc2Ml0gcGNpIDAwMDA6MDA6MDEuMTogbGVnYWN5IElERSBxdWlyazogcmVn
IDB4MTg6IFtpbyAgMHgwMTcwLTB4MDE3N10KWyAgICAwLjE1Njc2M10gcGNpIDAwMDA6MDA6MDEu
MTogbGVnYWN5IElERSBxdWlyazogcmVnIDB4MWM6IFtpbyAgMHgwMzc2XQpbICAgIDAuMTU2OTAw
XSBwY2kgMDAwMDowMDowMi4wOiBbODBlZTpiZWVmXSB0eXBlIDAwIGNsYXNzIDB4MDMwMDAwClsg
ICAgMC4xNTk5NzBdIHBjaSAwMDAwOjAwOjAyLjA6IHJlZyAweDEwOiBbbWVtIDB4ZTAwMDAwMDAt
MHhlN2ZmZmZmZiBwcmVmXQpbICAgIDAuMTk4NzQwXSBwY2kgMDAwMDowMDowMy4wOiBbODA4Njox
MDBlXSB0eXBlIDAwIGNsYXNzIDB4MDIwMDAwClsgICAgMC4xOTg3NDBdIHBjaSAwMDAwOjAwOjAz
LjA6IHJlZyAweDEwOiBbbWVtIDB4ZjAwMDAwMDAtMHhmMDAxZmZmZl0KWyAgICAwLjIwNjU4OF0g
cGNpIDAwMDA6MDA6MDMuMDogcmVnIDB4MTg6IFtpbyAgMHhkMDEwLTB4ZDAxN10KWyAgICAwLjIz
MDc2Ml0gcGNpIDAwMDA6MDA6MDQuMDogWzgwZWU6Y2FmZV0gdHlwZSAwMCBjbGFzcyAweDA4ODAw
MApbICAgIDAuMjM0NDI1XSBwY2kgMDAwMDowMDowNC4wOiByZWcgMHgxMDogW2lvICAweGQwMjAt
MHhkMDNmXQpbICAgIDAuMjM4NDY0XSBwY2kgMDAwMDowMDowNC4wOiByZWcgMHgxNDogW21lbSAw
eGYwNDAwMDAwLTB4ZjA3ZmZmZmZdClsgICAgMC4yNDI0NzldIHBjaSAwMDAwOjAwOjA0LjA6IHJl
ZyAweDE4OiBbbWVtIDB4ZjA4MDAwMDAtMHhmMDgwM2ZmZiBwcmVmXQpbICAgIDAuMjU4ODA3XSBw
Y2kgMDAwMDowMDowNS4wOiBbODA4NjoyNDE1XSB0eXBlIDAwIGNsYXNzIDB4MDQwMTAwClsgICAg
MC4yNTg4OTBdIHBjaSAwMDAwOjAwOjA1LjA6IHJlZyAweDEwOiBbaW8gIDB4ZDEwMC0weGQxZmZd
ClsgICAgMC4yNTg5MzNdIHBjaSAwMDAwOjAwOjA1LjA6IHJlZyAweDE0OiBbaW8gIDB4ZDIwMC0w
eGQyM2ZdClsgICAgMC4yNjI2NDJdIHBjaSAwMDAwOjAwOjA2LjA6IFsxMDZiOjAwM2ZdIHR5cGUg
MDAgY2xhc3MgMHgwYzAzMTAKWyAgICAwLjI2NjQyNV0gcGNpIDAwMDA6MDA6MDYuMDogcmVnIDB4
MTA6IFttZW0gMHhmMDgwNDAwMC0weGYwODA0ZmZmXQpbICAgIDAuMjkwNjgwXSBwY2kgMDAwMDow
MDowNy4wOiBbODA4Njo3MTEzXSB0eXBlIDAwIGNsYXNzIDB4MDY4MDAwClsgICAgMC4yOTA4OThd
IHBjaSAwMDAwOjAwOjA3LjA6IHF1aXJrOiBbaW8gIDB4NDAwMC0weDQwM2ZdIGNsYWltZWQgYnkg
UElJWDQgQUNQSQpbICAgIDAuMjkwOTA0XSBwY2kgMDAwMDowMDowNy4wOiBxdWlyazogW2lvICAw
eDQxMDAtMHg0MTBmXSBjbGFpbWVkIGJ5IFBJSVg0IFNNQgpbICAgIDAuMjkxMDc1XSBwY2kgMDAw
MDowMDowYi4wOiBbODA4NjoyNjVjXSB0eXBlIDAwIGNsYXNzIDB4MGMwMzIwClsgICAgMC4yOTQ0
NjVdIHBjaSAwMDAwOjAwOjBiLjA6IHJlZyAweDEwOiBbbWVtIDB4ZjA4MDUwMDAtMHhmMDgwNWZm
Zl0KWyAgICAwLjMxODc5N10gcGNpIDAwMDA6MDA6MGQuMDogWzgwODY6MjgyOV0gdHlwZSAwMCBj
bGFzcyAweDAxMDYwMQpbICAgIDAuMzIyNTU0XSBwY2kgMDAwMDowMDowZC4wOiByZWcgMHgxMDog
W2lvICAweGQyNDAtMHhkMjQ3XQpbICAgIDAuMzI2NDQ5XSBwY2kgMDAwMDowMDowZC4wOiByZWcg
MHgxNDogW2lvICAweGQyNDgtMHhkMjRiXQpbICAgIDAuMzMwNDQ4XSBwY2kgMDAwMDowMDowZC4w
OiByZWcgMHgxODogW2lvICAweGQyNTAtMHhkMjU3XQpbICAgIDAuMzM0MzMzXSBwY2kgMDAwMDow
MDowZC4wOiByZWcgMHgxYzogW2lvICAweGQyNTgtMHhkMjViXQpbICAgIDAuMzM4NDQ4XSBwY2kg
MDAwMDowMDowZC4wOiByZWcgMHgyMDogW2lvICAweGQyNjAtMHhkMjZmXQpbICAgIDAuMzQyNDQ3
XSBwY2kgMDAwMDowMDowZC4wOiByZWcgMHgyNDogW21lbSAweGYwODA2MDAwLTB4ZjA4MDdmZmZd
ClsgICAgMC4zNDc2MzldIEFDUEk6IFBDSSBJbnRlcnJ1cHQgTGluayBbTE5LQV0gKElSUXMgNSA5
IDEwICoxMSkKWyAgICAwLjM0NzgzOF0gQUNQSTogUENJIEludGVycnVwdCBMaW5rIFtMTktCXSAo
SVJRcyA1IDkgKjEwIDExKQpbICAgIDAuMzQ3OTA1XSBBQ1BJOiBQQ0kgSW50ZXJydXB0IExpbmsg
W0xOS0NdIChJUlFzIDUgKjkgMTAgMTEpClsgICAgMC4zNDc5NzFdIEFDUEk6IFBDSSBJbnRlcnJ1
cHQgTGluayBbTE5LRF0gKElSUXMgNSA5IDEwICoxMSkKWyAgICAwLjM1MDQ4M10gcGNpIDAwMDA6
MDA6MDIuMDogdmdhYXJiOiBzZXR0aW5nIGFzIGJvb3QgVkdBIGRldmljZQpbICAgIDAuMzUwNDgz
XSBwY2kgMDAwMDowMDowMi4wOiB2Z2FhcmI6IFZHQSBkZXZpY2UgYWRkZWQ6IGRlY29kZXM9aW8r
bWVtLG93bnM9aW8rbWVtLGxvY2tzPW5vbmUKWyAgICAwLjM1MDQ4M10gcGNpIDAwMDA6MDA6MDIu
MDogdmdhYXJiOiBicmlkZ2UgY29udHJvbCBwb3NzaWJsZQpbICAgIDAuMzUwNDgzXSB2Z2FhcmI6
IGxvYWRlZApbICAgIDAuMzUwNjMyXSBTQ1NJIHN1YnN5c3RlbSBpbml0aWFsaXplZApbICAgIDAu
MzUwNjQ2XSBsaWJhdGEgdmVyc2lvbiAzLjAwIGxvYWRlZC4KWyAgICAwLjM1MDY0Nl0gQUNQSTog
YnVzIHR5cGUgVVNCIHJlZ2lzdGVyZWQKWyAgICAwLjM1MDY0Nl0gdXNiY29yZTogcmVnaXN0ZXJl
ZCBuZXcgaW50ZXJmYWNlIGRyaXZlciB1c2JmcwpbICAgIDAuMzUwNjQ2XSB1c2Jjb3JlOiByZWdp
c3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIGh1YgpbICAgIDAuMzUwNjQ2XSB1c2Jjb3JlOiBy
ZWdpc3RlcmVkIG5ldyBkZXZpY2UgZHJpdmVyIHVzYgpbICAgIDAuMzUwNjQ2XSBFREFDIE1DOiBW
ZXI6IDMuMC4wClsgICAgMC4zNTA2NDZdIFBDSTogVXNpbmcgQUNQSSBmb3IgSVJRIHJvdXRpbmcK
WyAgICAwLjM1MDY0Nl0gUENJOiBwY2lfY2FjaGVfbGluZV9zaXplIHNldCB0byA2NCBieXRlcwpb
ICAgIDAuMzUwNjQ2XSBlODIwOiByZXNlcnZlIFJBTSBidWZmZXIgW21lbSAweDAwMDlmYzAwLTB4
MDAwOWZmZmZdClsgICAgMC4zNTA2NDZdIGU4MjA6IHJlc2VydmUgUkFNIGJ1ZmZlciBbbWVtIDB4
ZGZmZjAwMDAtMHhkZmZmZmZmZl0KWyAgICAwLjM1NDQyN10gTmV0TGFiZWw6IEluaXRpYWxpemlu
ZwpbICAgIDAuMzU0NDI3XSBOZXRMYWJlbDogIGRvbWFpbiBoYXNoIHNpemUgPSAxMjgKWyAgICAw
LjM1NDQyN10gTmV0TGFiZWw6ICBwcm90b2NvbHMgPSBVTkxBQkVMRUQgQ0lQU092NCBDQUxJUFNP
ClsgICAgMC4zNTQ0MjddIE5ldExhYmVsOiAgdW5sYWJlbGVkIHRyYWZmaWMgYWxsb3dlZCBieSBk
ZWZhdWx0ClsgICAgMC4zNTUxMTVdIGNsb2Nrc291cmNlOiBTd2l0Y2hlZCB0byBjbG9ja3NvdXJj
ZSBrdm0tY2xvY2sKWyAgICAwLjM2MzAxNl0gVkZTOiBEaXNrIHF1b3RhcyBkcXVvdF82LjYuMApb
ICAgIDAuMzYzMDMwXSBWRlM6IERxdW90LWNhY2hlIGhhc2ggdGFibGUgZW50cmllczogNTEyIChv
cmRlciAwLCA0MDk2IGJ5dGVzKQpbICAgIDAuMzYzMDYzXSAqKiogVkFMSURBVEUgaHVnZXRsYmZz
ICoqKgpbICAgIDAuMzYzMTI3XSBBcHBBcm1vcjogQXBwQXJtb3IgRmlsZXN5c3RlbSBFbmFibGVk
ClsgICAgMC4zNjMxNDhdIHBucDogUG5QIEFDUEkgaW5pdApbICAgIDAuMzYzMjA1XSBwbnAgMDA6
MDA6IFBsdWcgYW5kIFBsYXkgQUNQSSBkZXZpY2UsIElEcyBQTlAwMzAzIChhY3RpdmUpClsgICAg
MC4zNjMyNTNdIHBucCAwMDowMTogUGx1ZyBhbmQgUGxheSBBQ1BJIGRldmljZSwgSURzIFBOUDBm
MDMgKGFjdGl2ZSkKWyAgICAwLjM2MzcwN10gcG5wOiBQblAgQUNQSTogZm91bmQgMiBkZXZpY2Vz
ClsgICAgMC4zNjg4NDRdIGNsb2Nrc291cmNlOiBhY3BpX3BtOiBtYXNrOiAweGZmZmZmZiBtYXhf
Y3ljbGVzOiAweGZmZmZmZiwgbWF4X2lkbGVfbnM6IDIwODU3MDEwMjQgbnMKWyAgICAwLjM2ODg1
M10gcGNpX2J1cyAwMDAwOjAwOiByZXNvdXJjZSA0IFtpbyAgMHgwMDAwLTB4MGNmNyB3aW5kb3dd
ClsgICAgMC4zNjg4NTNdIHBjaV9idXMgMDAwMDowMDogcmVzb3VyY2UgNSBbaW8gIDB4MGQwMC0w
eGZmZmYgd2luZG93XQpbICAgIDAuMzY4ODU0XSBwY2lfYnVzIDAwMDA6MDA6IHJlc291cmNlIDYg
W21lbSAweDAwMGEwMDAwLTB4MDAwYmZmZmYgd2luZG93XQpbICAgIDAuMzY4ODU1XSBwY2lfYnVz
IDAwMDA6MDA6IHJlc291cmNlIDcgW21lbSAweGUwMDAwMDAwLTB4ZmRmZmZmZmYgd2luZG93XQpb
ICAgIDAuMzY4ODg4XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDIKWyAgICAwLjM2
ODk4OF0gdGNwX2xpc3Rlbl9wb3J0YWRkcl9oYXNoIGhhc2ggdGFibGUgZW50cmllczogNDA5NiAo
b3JkZXI6IDQsIDY1NTM2IGJ5dGVzKQpbICAgIDAuMzY5MDA0XSBUQ1AgZXN0YWJsaXNoZWQgaGFz
aCB0YWJsZSBlbnRyaWVzOiA2NTUzNiAob3JkZXI6IDcsIDUyNDI4OCBieXRlcykKWyAgICAwLjM2
OTA4OV0gVENQIGJpbmQgaGFzaCB0YWJsZSBlbnRyaWVzOiA2NTUzNiAob3JkZXI6IDgsIDEwNDg1
NzYgYnl0ZXMpClsgICAgMC4zNjkyMTJdIFRDUDogSGFzaCB0YWJsZXMgY29uZmlndXJlZCAoZXN0
YWJsaXNoZWQgNjU1MzYgYmluZCA2NTUzNikKWyAgICAwLjM2OTIzNF0gVURQIGhhc2ggdGFibGUg
ZW50cmllczogNDA5NiAob3JkZXI6IDUsIDEzMTA3MiBieXRlcykKWyAgICAwLjM2OTI1M10gVURQ
LUxpdGUgaGFzaCB0YWJsZSBlbnRyaWVzOiA0MDk2IChvcmRlcjogNSwgMTMxMDcyIGJ5dGVzKQpb
ICAgIDAuMzY5MzAxXSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDEKWyAgICAwLjM2
OTMyMV0gcGNpIDAwMDA6MDA6MDAuMDogTGltaXRpbmcgZGlyZWN0IFBDSS9QQ0kgdHJhbnNmZXJz
ClsgICAgMC4zNjkzMjhdIHBjaSAwMDAwOjAwOjAxLjA6IEFjdGl2YXRpbmcgSVNBIERNQSBoYW5n
IHdvcmthcm91bmRzClsgICAgMC4zNjkzNTZdIHBjaSAwMDAwOjAwOjAyLjA6IFZpZGVvIGRldmlj
ZSB3aXRoIHNoYWRvd2VkIFJPTSBhdCBbbWVtIDB4MDAwYzAwMDAtMHgwMDBkZmZmZl0KWyAgICAw
LjM3MDk4NV0gUENJOiBDTFMgMCBieXRlcywgZGVmYXVsdCA2NApbICAgIDAuMzcxMDEzXSBUcnlp
bmcgdG8gdW5wYWNrIHJvb3RmcyBpbWFnZSBhcyBpbml0cmFtZnMuLi4KWyAgICAwLjcxMDEwMl0g
RnJlZWluZyBpbml0cmQgbWVtb3J5OiAzNzkzMksKWyAgICAwLjcxMDExNl0gUENJLURNQTogVXNp
bmcgc29mdHdhcmUgYm91bmNlIGJ1ZmZlcmluZyBmb3IgSU8gKFNXSU9UTEIpClsgICAgMC43MTAx
MThdIHNvZnR3YXJlIElPIFRMQjogbWFwcGVkIFttZW0gMHhjZjAwMDAwMC0weGQzMDAwMDAwXSAo
NjRNQikKWyAgICAwLjcxMDE2OV0gY2xvY2tzb3VyY2U6IHRzYzogbWFzazogMHhmZmZmZmZmZmZm
ZmZmZmZmIG1heF9jeWNsZXM6IDB4MzNlNDUxYWIxYTYsIG1heF9pZGxlX25zOiA0NDA3OTUyNzg3
MjAgbnMKWyAgICAwLjcxMDI4Nl0gY2xvY2tzb3VyY2U6IFN3aXRjaGVkIHRvIGNsb2Nrc291cmNl
IHRzYwpbICAgIDAuNzEwMzQyXSBwbGF0Zm9ybSBydGNfY21vczogcmVnaXN0ZXJlZCBwbGF0Zm9y
bSBSVEMgZGV2aWNlIChubyBQTlAgZGV2aWNlIGZvdW5kKQpbICAgIDAuNzEwMzcyXSBjaGVjazog
U2Nhbm5pbmcgZm9yIGxvdyBtZW1vcnkgY29ycnVwdGlvbiBldmVyeSA2MCBzZWNvbmRzClsgICAg
MC43MTIxMjldIEluaXRpYWxpc2Ugc3lzdGVtIHRydXN0ZWQga2V5cmluZ3MKWyAgICAwLjcxMjEz
NF0gS2V5IHR5cGUgYmxhY2tsaXN0IHJlZ2lzdGVyZWQKWyAgICAwLjcxMjIyNV0gd29ya2luZ3Nl
dDogdGltZXN0YW1wX2JpdHM9MzYgbWF4X29yZGVyPTIxIGJ1Y2tldF9vcmRlcj0wClsgICAgMC43
MTMwMzNdIHpidWQ6IGxvYWRlZApbICAgIDAuNzEzMzg5XSBzcXVhc2hmczogdmVyc2lvbiA0LjAg
KDIwMDkvMDEvMzEpIFBoaWxsaXAgTG91Z2hlcgpbICAgIDAuNzEzNjcxXSBmdXNlOiBpbml0IChB
UEkgdmVyc2lvbiA3LjMxKQpbICAgIDAuNzE0NDQ3XSBkZWJ1Z19mbGFnIGRldmljZSBzdWNjZXNz
ZnVsbHkgcmVnaXN0ZXJlZApbICAgIDAuNzE1MzIzXSBLZXkgdHlwZSBhc3ltbWV0cmljIHJlZ2lz
dGVyZWQKWyAgICAwLjcxNTMyNF0gQXN5bW1ldHJpYyBrZXkgcGFyc2VyICd4NTA5JyByZWdpc3Rl
cmVkClsgICAgMC43MTUzNDNdIEJsb2NrIGxheWVyIFNDU0kgZ2VuZXJpYyAoYnNnKSBkcml2ZXIg
dmVyc2lvbiAwLjQgbG9hZGVkIChtYWpvciAyNDYpClsgICAgMC43MTU0ODNdIGlvIHNjaGVkdWxl
ciBtcS1kZWFkbGluZSByZWdpc3RlcmVkClsgICAgMC43MTU3NDFdIGludGVsX2lkbGU6IFBsZWFz
ZSBlbmFibGUgTVdBSVQgaW4gQklPUyBTRVRVUApbICAgIDAuNzE1ODE3XSBBQ1BJOiBBQyBBZGFw
dGVyIFtBQ10gKG9uLWxpbmUpClsgICAgMC43MTU4NDddIGlucHV0OiBQb3dlciBCdXR0b24gYXMg
L2RldmljZXMvTE5YU1lTVE06MDAvTE5YUFdSQk46MDAvaW5wdXQvaW5wdXQwClsgICAgMC43MTU4
NTZdIEFDUEk6IFBvd2VyIEJ1dHRvbiBbUFdSRl0KWyAgICAwLjcxNTg5NV0gaW5wdXQ6IFNsZWVw
IEJ1dHRvbiBhcyAvZGV2aWNlcy9MTlhTWVNUTTowMC9MTlhTTFBCTjowMC9pbnB1dC9pbnB1dDEK
WyAgICAwLjcxNTg5OV0gQUNQSTogU2xlZXAgQnV0dG9uIFtTTFBGXQpbICAgIDAuNzE2MjA2XSBT
ZXJpYWw6IDgyNTAvMTY1NTAgZHJpdmVyLCAzMiBwb3J0cywgSVJRIHNoYXJpbmcgZW5hYmxlZApb
ICAgIDAuNzE2OTcxXSBMaW51eCBhZ3BnYXJ0IGludGVyZmFjZSB2MC4xMDMKWyAgICAwLjcxODM3
NV0gbG9vcDogbW9kdWxlIGxvYWRlZApbICAgIDAuNzE4NDU3XSBhdGFfcGlpeCAwMDAwOjAwOjAx
LjE6IHZlcnNpb24gMi4xMwpbICAgIDAuNzE4ODI3XSBzY3NpIGhvc3QwOiBhdGFfcGlpeApbICAg
IDAuNzE5MDI2XSBzY3NpIGhvc3QxOiBhdGFfcGlpeApbICAgIDAuNzE5MDQ2XSBhdGExOiBQQVRB
IG1heCBVRE1BLzMzIGNtZCAweDFmMCBjdGwgMHgzZjYgYm1kbWEgMHhkMDAwIGlycSAxNApbICAg
IDAuNzE5MDQ2XSBhdGEyOiBQQVRBIG1heCBVRE1BLzMzIGNtZCAweDE3MCBjdGwgMHgzNzYgYm1k
bWEgMHhkMDA4IGlycSAxNQpbICAgIDAuNzE5MTIxXSBsaWJwaHk6IEZpeGVkIE1ESU8gQnVzOiBw
cm9iZWQKWyAgICAwLjcxOTEyMl0gdHVuOiBVbml2ZXJzYWwgVFVOL1RBUCBkZXZpY2UgZHJpdmVy
LCAxLjYKWyAgICAwLjcxOTE1OF0gUFBQIGdlbmVyaWMgZHJpdmVyIHZlcnNpb24gMi40LjIKWyAg
ICAwLjcxOTE3OV0gZWhjaV9oY2Q6IFVTQiAyLjAgJ0VuaGFuY2VkJyBIb3N0IENvbnRyb2xsZXIg
KEVIQ0kpIERyaXZlcgpbICAgIDAuNzE5MTgxXSBlaGNpLXBjaTogRUhDSSBQQ0kgcGxhdGZvcm0g
ZHJpdmVyClsgICAgMC43MTk2MjFdIGVoY2ktcGNpIDAwMDA6MDA6MGIuMDogRUhDSSBIb3N0IENv
bnRyb2xsZXIKWyAgICAwLjcxOTYyNF0gZWhjaS1wY2kgMDAwMDowMDowYi4wOiBuZXcgVVNCIGJ1
cyByZWdpc3RlcmVkLCBhc3NpZ25lZCBidXMgbnVtYmVyIDEKWyAgICAwLjcxOTczM10gZWhjaS1w
Y2kgMDAwMDowMDowYi4wOiBpcnEgMTksIGlvIG1lbSAweGYwODA1MDAwClsgICAgMC43MzQ3MTZd
IGVoY2ktcGNpIDAwMDA6MDA6MGIuMDogVVNCIDIuMCBzdGFydGVkLCBFSENJIDEuMDAKWyAgICAw
LjczNDgzNl0gdXNiIHVzYjE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0xZDZiLCBp
ZFByb2R1Y3Q9MDAwMiwgYmNkRGV2aWNlPSA1LjAyClsgICAgMC43MzQ4NDBdIHVzYiB1c2IxOiBO
ZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MywgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9MQpb
ICAgIDAuNzM0ODQyXSB1c2IgdXNiMTogUHJvZHVjdDogRUhDSSBIb3N0IENvbnRyb2xsZXIKWyAg
ICAwLjczNDg0NV0gdXNiIHVzYjE6IE1hbnVmYWN0dXJlcjogTGludXggNS4yLjEgZWhjaV9oY2QK
WyAgICAwLjczNDg0N10gdXNiIHVzYjE6IFNlcmlhbE51bWJlcjogMDAwMDowMDowYi4wClsgICAg
MC43MzUwNDBdIGh1YiAxLTA6MS4wOiBVU0IgaHViIGZvdW5kClsgICAgMC43MzUwNTBdIGh1YiAx
LTA6MS4wOiAxMiBwb3J0cyBkZXRlY3RlZApbICAgIDAuNzM1NTE2XSBlaGNpLXBsYXRmb3JtOiBF
SENJIGdlbmVyaWMgcGxhdGZvcm0gZHJpdmVyClsgICAgMC43MzU1NDBdIG9oY2lfaGNkOiBVU0Ig
MS4xICdPcGVuJyBIb3N0IENvbnRyb2xsZXIgKE9IQ0kpIERyaXZlcgpbICAgIDAuNzM1NTQ1XSBv
aGNpLXBjaTogT0hDSSBQQ0kgcGxhdGZvcm0gZHJpdmVyClsgICAgMC43MzY5NTVdIG9oY2ktcGNp
IDAwMDA6MDA6MDYuMDogT0hDSSBQQ0kgaG9zdCBjb250cm9sbGVyClsgICAgMC43MzY5NjNdIG9o
Y2ktcGNpIDAwMDA6MDA6MDYuMDogbmV3IFVTQiBidXMgcmVnaXN0ZXJlZCwgYXNzaWduZWQgYnVz
IG51bWJlciAyClsgICAgMC43MzcxMDRdIG9oY2ktcGNpIDAwMDA6MDA6MDYuMDogaXJxIDIyLCBp
byBtZW0gMHhmMDgwNDAwMApbICAgIDAuNzk1NjIwXSB1c2IgdXNiMjogTmV3IFVTQiBkZXZpY2Ug
Zm91bmQsIGlkVmVuZG9yPTFkNmIsIGlkUHJvZHVjdD0wMDAxLCBiY2REZXZpY2U9IDUuMDIKWyAg
ICAwLjc5NTYyNV0gdXNiIHVzYjI6IE5ldyBVU0IgZGV2aWNlIHN0cmluZ3M6IE1mcj0zLCBQcm9k
dWN0PTIsIFNlcmlhbE51bWJlcj0xClsgICAgMC43OTU2MjldIHVzYiB1c2IyOiBQcm9kdWN0OiBP
SENJIFBDSSBob3N0IGNvbnRyb2xsZXIKWyAgICAwLjc5NTYzM10gdXNiIHVzYjI6IE1hbnVmYWN0
dXJlcjogTGludXggNS4yLjEgb2hjaV9oY2QKWyAgICAwLjc5NTYzNl0gdXNiIHVzYjI6IFNlcmlh
bE51bWJlcjogMDAwMDowMDowNi4wClsgICAgMC43OTU5MTZdIGh1YiAyLTA6MS4wOiBVU0IgaHVi
IGZvdW5kClsgICAgMC43OTU5NTZdIGh1YiAyLTA6MS4wOiAxMiBwb3J0cyBkZXRlY3RlZApbICAg
IDAuNzk2OTc0XSBvaGNpLXBsYXRmb3JtOiBPSENJIGdlbmVyaWMgcGxhdGZvcm0gZHJpdmVyClsg
ICAgMC43OTcwMDJdIHVoY2lfaGNkOiBVU0IgVW5pdmVyc2FsIEhvc3QgQ29udHJvbGxlciBJbnRl
cmZhY2UgZHJpdmVyClsgICAgMC43OTcxNDBdIGk4MDQyOiBQTlA6IFBTLzIgQ29udHJvbGxlciBb
UE5QMDMwMzpQUzJLLFBOUDBmMDM6UFMyTV0gYXQgMHg2MCwweDY0IGlycSAxLDEyClsgICAgMC43
OTkzMTddIHNlcmlvOiBpODA0MiBLQkQgcG9ydCBhdCAweDYwLDB4NjQgaXJxIDEKWyAgICAwLjc5
OTQxNl0gc2VyaW86IGk4MDQyIEFVWCBwb3J0IGF0IDB4NjAsMHg2NCBpcnEgMTIKWyAgICAwLjc5
OTYyMF0gbW91c2VkZXY6IFBTLzIgbW91c2UgZGV2aWNlIGNvbW1vbiBmb3IgYWxsIG1pY2UKWyAg
ICAwLjgwMDk2MV0gcnRjX2Ntb3MgcnRjX2Ntb3M6IHJlZ2lzdGVyZWQgYXMgcnRjMApbICAgIDAu
ODAxMDY1XSBydGNfY21vcyBydGNfY21vczogYWxhcm1zIHVwIHRvIG9uZSBkYXksIDExNCBieXRl
cyBudnJhbQpbICAgIDAuODAxMDg2XSBpMmMgL2RldiBlbnRyaWVzIGRyaXZlcgpbICAgIDAuODAx
Mjg2XSBpbnB1dDogQVQgVHJhbnNsYXRlZCBTZXQgMiBrZXlib2FyZCBhcyAvZGV2aWNlcy9wbGF0
Zm9ybS9pODA0Mi9zZXJpbzAvaW5wdXQvaW5wdXQyClsgICAgMC44MDE0NThdIGRldmljZS1tYXBw
ZXI6IHVldmVudDogdmVyc2lvbiAxLjAuMwpbICAgIDAuODAxODE3XSBkZXZpY2UtbWFwcGVyOiBp
b2N0bDogNC40MC4wLWlvY3RsICgyMDE5LTAxLTE4KSBpbml0aWFsaXNlZDogZG0tZGV2ZWxAcmVk
aGF0LmNvbQpbICAgIDAuODAxODIzXSBpbnRlbF9wc3RhdGU6IENQVSBtb2RlbCBub3Qgc3VwcG9y
dGVkClsgICAgMC44MDI1OThdIGxlZHRyaWctY3B1OiByZWdpc3RlcmVkIHRvIGluZGljYXRlIGFj
dGl2aXR5IG9uIENQVXMKWyAgICAwLjgwMjg3MV0gaW50ZWxfcG1jX2NvcmUgaW50ZWxfcG1jX2Nv
cmUuMDogIGluaXRpYWxpemVkClsgICAgMC44MDM1MThdIE5FVDogUmVnaXN0ZXJlZCBwcm90b2Nv
bCBmYW1pbHkgMTAKWyAgICAwLjgxMzE0MV0gU2VnbWVudCBSb3V0aW5nIHdpdGggSVB2NgpbICAg
IDAuODEzMTU1XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDE3ClsgICAgMC44MTMy
OTFdIEtleSB0eXBlIGRuc19yZXNvbHZlciByZWdpc3RlcmVkClsgICAgMC44MTM2NDddIG1jZTog
VXNpbmcgMCBNQ0UgYmFua3MKWyAgICAwLjgxMzY1NV0gUkFTOiBDb3JyZWN0YWJsZSBFcnJvcnMg
Y29sbGVjdG9yIGluaXRpYWxpemVkLgpbICAgIDAuODEzNjY1XSBzY2hlZF9jbG9jazogTWFya2lu
ZyBzdGFibGUgKDgwMzk5MTM4NiwgOTYxMzQ3OSktPig5MTkxODE4MjEsIC0xMDU1NzY5NTYpClsg
ICAgMC44MTQxNDFdIHJlZ2lzdGVyZWQgdGFza3N0YXRzIHZlcnNpb24gMQpbICAgIDAuODE0MTQ3
XSBMb2FkaW5nIGNvbXBpbGVkLWluIFguNTA5IGNlcnRpZmljYXRlcwpbICAgIDAuODE1Mjk5XSBM
b2FkZWQgWC41MDkgY2VydCAnQnVpbGQgdGltZSBhdXRvZ2VuZXJhdGVkIGtlcm5lbCBrZXk6IDA0
YmFhOTQwYjE4M2ZiYzU1Y2ZkMWEzMWRiYTEyM2Y0MzNhNWQwNTInClsgICAgMC44MTUzMTBdIHpz
d2FwOiBsb2FkZWQgdXNpbmcgcG9vbCBsem8vemJ1ZApbICAgIDAuODIwNDczXSBLZXkgdHlwZSBi
aWdfa2V5IHJlZ2lzdGVyZWQKWyAgICAwLjgyMzA0MF0gS2V5IHR5cGUgZW5jcnlwdGVkIHJlZ2lz
dGVyZWQKWyAgICAwLjgyMzA0Ml0gQXBwQXJtb3I6IEFwcEFybW9yIHNoYTEgcG9saWN5IGhhc2hp
bmcgZW5hYmxlZApbICAgIDAuODIzMDQ2XSBpbWE6IE5vIFRQTSBjaGlwIGZvdW5kLCBhY3RpdmF0
aW5nIFRQTS1ieXBhc3MhClsgICAgMC44MjMwNDldIGltYTogQWxsb2NhdGVkIGhhc2ggYWxnb3Jp
dGhtOiBzaGExClsgICAgMC44MjMwNTJdIE5vIGFyY2hpdGVjdHVyZSBwb2xpY2llcyBmb3VuZApb
ICAgIDAuODIzMDU4XSBldm06IEluaXRpYWxpc2luZyBFVk0gZXh0ZW5kZWQgYXR0cmlidXRlczoK
WyAgICAwLjgyMzA1OF0gZXZtOiBzZWN1cml0eS5zZWxpbnV4ClsgICAgMC44MjMwNTldIGV2bTog
c2VjdXJpdHkuU01BQ0s2NApbICAgIDAuODIzMDU5XSBldm06IHNlY3VyaXR5LlNNQUNLNjRFWEVD
ClsgICAgMC44MjMwNTldIGV2bTogc2VjdXJpdHkuU01BQ0s2NFRSQU5TTVVURQpbICAgIDAuODIz
MDU5XSBldm06IHNlY3VyaXR5LlNNQUNLNjRNTUFQClsgICAgMC44MjMwNjBdIGV2bTogc2VjdXJp
dHkuYXBwYXJtb3IKWyAgICAwLjgyMzA2MF0gZXZtOiBzZWN1cml0eS5pbWEKWyAgICAwLjgyMzA2
MF0gZXZtOiBzZWN1cml0eS5jYXBhYmlsaXR5ClsgICAgMC44MjMwNjFdIGV2bTogSE1BQyBhdHRy
czogMHgxClsgICAgMC44MjMyMjhdIFBNOiAgIE1hZ2ljIG51bWJlcjogMTE6Mjc4OjQ4MApbICAg
IDAuODIzMzUxXSBydGNfY21vcyBydGNfY21vczogc2V0dGluZyBzeXN0ZW0gY2xvY2sgdG8gMjAx
OS0wNy0yOVQxMToyODozOSBVVEMgKDE1NjQzOTk3MTkpClsgICAgMC44Nzk0OThdIGF0YTIuMDA6
IEFUQVBJOiBWQk9YIENELVJPTSwgMS4wLCBtYXggVURNQS8xMzMKWyAgICAwLjg4MTY2OF0gc2Nz
aSAxOjA6MDowOiBDRC1ST00gICAgICAgICAgICBWQk9YICAgICBDRC1ST00gICAgICAgICAgIDEu
MCAgUFE6IDAgQU5TSTogNQpbICAgIDAuOTEyMTI2XSBzciAxOjA6MDowOiBbc3IwXSBzY3NpMy1t
bWMgZHJpdmU6IDMyeC8zMnggeGEvZm9ybTIgdHJheQpbICAgIDAuOTEyMTMxXSBjZHJvbTogVW5p
Zm9ybSBDRC1ST00gZHJpdmVyIFJldmlzaW9uOiAzLjIwClsgICAgMC45MTI2MTZdIHNyIDE6MDow
OjA6IEF0dGFjaGVkIHNjc2kgQ0QtUk9NIHNyMApbICAgIDAuOTEyNzQ4XSBzciAxOjA6MDowOiBB
dHRhY2hlZCBzY3NpIGdlbmVyaWMgc2cwIHR5cGUgNQpbICAgIDAuOTE3ODYwXSBGcmVlaW5nIHVu
dXNlZCBkZWNyeXB0ZWQgbWVtb3J5OiAyMDQwSwpbICAgIDAuOTE5MjUzXSBGcmVlaW5nIHVudXNl
ZCBrZXJuZWwgaW1hZ2UgbWVtb3J5OiAyNTE2SwpbICAgIDAuOTM0NTk2XSBXcml0ZSBwcm90ZWN0
aW5nIHRoZSBrZXJuZWwgcmVhZC1vbmx5IGRhdGE6IDIyNTI4awpbICAgIDAuOTM2NjAwXSBGcmVl
aW5nIHVudXNlZCBrZXJuZWwgaW1hZ2UgbWVtb3J5OiAyMDEySwpbICAgIDAuOTM4MDY3XSBGcmVl
aW5nIHVudXNlZCBrZXJuZWwgaW1hZ2UgbWVtb3J5OiAxODE2SwpbICAgIDAuOTY1NDI2XSB4ODYv
bW06IENoZWNrZWQgVytYIG1hcHBpbmdzOiBwYXNzZWQsIG5vIFcrWCBwYWdlcyBmb3VuZC4KWyAg
ICAwLjk2NTQyOV0geDg2L21tOiBDaGVja2luZyB1c2VyIHNwYWNlIHBhZ2UgdGFibGVzClsgICAg
MC45NzgyNTFdIHg4Ni9tbTogQ2hlY2tlZCBXK1ggbWFwcGluZ3M6IHBhc3NlZCwgbm8gVytYIHBh
Z2VzIGZvdW5kLgpbICAgIDAuOTc4MjU1XSBSdW4gL2luaXQgYXMgaW5pdCBwcm9jZXNzClsgICAg
MS4wMjY4MjNdIEFDUEk6IFZpZGVvIERldmljZSBbR0ZYMF0gKG11bHRpLWhlYWQ6IHllcyAgcm9t
OiBubyAgcG9zdDogbm8pClsgICAgMS4wMjY4OTJdIGlucHV0OiBWaWRlbyBCdXMgYXMgL2Rldmlj
ZXMvTE5YU1lTVE06MDAvTE5YU1lCVVM6MDAvUE5QMEEwMzowMC9MTlhWSURFTzowMC9pbnB1dC9p
bnB1dDQKWyAgICAxLjAzMjM0NV0gcGlpeDRfc21idXMgMDAwMDowMDowNy4wOiBTTUJ1cyBIb3N0
IENvbnRyb2xsZXIgYXQgMHg0MTAwLCByZXZpc2lvbiAwClsgICAgMS4wMzIzNzVdIGUxMDAwOiBJ
bnRlbChSKSBQUk8vMTAwMCBOZXR3b3JrIERyaXZlciAtIHZlcnNpb24gNy4zLjIxLWs4LU5BUEkK
WyAgICAxLjAzMjM3NV0gZTEwMDA6IENvcHlyaWdodCAoYykgMTk5OS0yMDA2IEludGVsIENvcnBv
cmF0aW9uLgpbICAgIDEuMDM0MDg1XSBhaGNpIDAwMDA6MDA6MGQuMDogdmVyc2lvbiAzLjAKWyAg
ICAxLjAzNDc3Nl0gYWhjaSAwMDAwOjAwOjBkLjA6IFNTUyBmbGFnIHNldCwgcGFyYWxsZWwgYnVz
IHNjYW4gZGlzYWJsZWQKWyAgICAxLjAzNDg4N10gYWhjaSAwMDAwOjAwOjBkLjA6IEFIQ0kgMDAw
MS4wMTAwIDMyIHNsb3RzIDEgcG9ydHMgMyBHYnBzIDB4MSBpbXBsIFNBVEEgbW9kZQpbICAgIDEu
MDM0ODg5XSBhaGNpIDAwMDA6MDA6MGQuMDogZmxhZ3M6IDY0Yml0IG5jcSBzdGFnIG9ubHkgY2Nj
IApbICAgIDEuMDM3NjYyXSBzY3NpIGhvc3QyOiBhaGNpClsgICAgMS4wMzc3MzFdIGF0YTM6IFNB
VEEgbWF4IFVETUEvMTMzIGFiYXIgbTgxOTJAMHhmMDgwNjAwMCBwb3J0IDB4ZjA4MDYxMDAgaXJx
IDIxClsgICAgMS4xOTQ0ODhdIHVzYiAyLTE6IG5ldyBmdWxsLXNwZWVkIFVTQiBkZXZpY2UgbnVt
YmVyIDIgdXNpbmcgb2hjaS1wY2kKWyAgICAxLjIzOTMzOV0gaW5wdXQ6IEltRXhQUy8yIEdlbmVy
aWMgRXhwbG9yZXIgTW91c2UgYXMgL2RldmljZXMvcGxhdGZvcm0vaTgwNDIvc2VyaW8xL2lucHV0
L2lucHV0NQpbICAgIDEuMzU2NDQxXSBhdGEzOiBTQVRBIGxpbmsgdXAgMy4wIEdicHMgKFNTdGF0
dXMgMTIzIFNDb250cm9sIDMwMCkKWyAgICAxLjM1NjYyOF0gYXRhMy4wMDogQVRBLTY6IFZCT1gg
SEFSRERJU0ssIDEuMCwgbWF4IFVETUEvMTMzClsgICAgMS4zNTY2MjldIGF0YTMuMDA6IDIwOTcx
NTIwMCBzZWN0b3JzLCBtdWx0aSAxMjg6IExCQTQ4IE5DUSAoZGVwdGggMzIpClsgICAgMS4zNTY5
NTNdIGF0YTMuMDA6IGNvbmZpZ3VyZWQgZm9yIFVETUEvMTMzClsgICAgMS4zNTcxMDJdIHNjc2kg
MjowOjA6MDogRGlyZWN0LUFjY2VzcyAgICAgQVRBICAgICAgVkJPWCBIQVJERElTSyAgICAxLjAg
IFBROiAwIEFOU0k6IDUKWyAgICAxLjM1NzMxM10gc2QgMjowOjA6MDogW3NkYV0gMjA5NzE1MjAw
IDUxMi1ieXRlIGxvZ2ljYWwgYmxvY2tzOiAoMTA3IEdCLzEwMCBHaUIpClsgICAgMS4zNTczMThd
IHNkIDI6MDowOjA6IFtzZGFdIFdyaXRlIFByb3RlY3QgaXMgb2ZmClsgICAgMS4zNTczMTldIHNk
IDI6MDowOjA6IFtzZGFdIE1vZGUgU2Vuc2U6IDAwIDNhIDAwIDAwClsgICAgMS4zNTczNDBdIHNk
IDI6MDowOjA6IFtzZGFdIFdyaXRlIGNhY2hlOiBlbmFibGVkLCByZWFkIGNhY2hlOiBlbmFibGVk
LCBkb2Vzbid0IHN1cHBvcnQgRFBPIG9yIEZVQQpbICAgIDEuMzU3MzkxXSBzZCAyOjA6MDowOiBB
dHRhY2hlZCBzY3NpIGdlbmVyaWMgc2cxIHR5cGUgMApbICAgIDEuMzU4MDA1XSAgc2RhOiBzZGEx
ClsgICAgMS4zNTgxODRdIHNkIDI6MDowOjA6IFtzZGFdIEF0dGFjaGVkIFNDU0kgZGlzawpbICAg
IDEuMzczMTg0XSBlMTAwMCAwMDAwOjAwOjAzLjAgZXRoMDogKFBDSTozM01IejozMi1iaXQpIDA4
OjAwOjI3OmU4OmJhOmExClsgICAgMS4zNzMxODddIGUxMDAwIDAwMDA6MDA6MDMuMCBldGgwOiBJ
bnRlbChSKSBQUk8vMTAwMCBOZXR3b3JrIENvbm5lY3Rpb24KWyAgICAxLjM3MzgyNl0gZTEwMDAg
MDAwMDowMDowMy4wIGVucDBzMzogcmVuYW1lZCBmcm9tIGV0aDAKWyAgICAxLjQ5OTI3Nl0gdXNi
IDItMTogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTgwZWUsIGlkUHJvZHVjdD0wMDIx
LCBiY2REZXZpY2U9IDEuMDAKWyAgICAxLjQ5OTI4Ml0gdXNiIDItMTogTmV3IFVTQiBkZXZpY2Ug
c3RyaW5nczogTWZyPTEsIFByb2R1Y3Q9MywgU2VyaWFsTnVtYmVyPTAKWyAgICAxLjQ5OTI4Nl0g
dXNiIDItMTogUHJvZHVjdDogVVNCIFRhYmxldApbICAgIDEuNDk5Mjg5XSB1c2IgMi0xOiBNYW51
ZmFjdHVyZXI6IFZpcnR1YWxCb3gKWyAgICAxLjUxNDczMF0gaGlkcmF3OiByYXcgSElEIGV2ZW50
cyBkcml2ZXIgKEMpIEppcmkgS29zaW5hClsgICAgMS41Mjk5MTVdIHVzYmNvcmU6IHJlZ2lzdGVy
ZWQgbmV3IGludGVyZmFjZSBkcml2ZXIgdXNiaGlkClsgICAgMS41Mjk5MThdIHVzYmhpZDogVVNC
IEhJRCBjb3JlIGRyaXZlcgpbICAgIDEuNTM2NjI3XSBpbnB1dDogVmlydHVhbEJveCBVU0IgVGFi
bGV0IGFzIC9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDowNi4wL3VzYjIvMi0xLzItMToxLjAv
MDAwMzo4MEVFOjAwMjEuMDAwMS9pbnB1dC9pbnB1dDYKWyAgICAxLjUzNzM2Ml0gaGlkLWdlbmVy
aWMgMDAwMzo4MEVFOjAwMjEuMDAwMTogaW5wdXQsaGlkcmF3MDogVVNCIEhJRCB2MS4xMCBNb3Vz
ZSBbVmlydHVhbEJveCBVU0IgVGFibGV0XSBvbiB1c2ItMDAwMDowMDowNi4wLTEvaW5wdXQwClsg
ICAgMS42NjM5NzhdIHJhbmRvbTogZmFzdCBpbml0IGRvbmUKWyAgICAxLjcyNDg4OV0gRVhUNC1m
cyAoc2RhMSk6IG1vdW50ZWQgZmlsZXN5c3RlbSB3aXRoIG9yZGVyZWQgZGF0YSBtb2RlLiBPcHRz
OiAobnVsbCkKWyAgICAxLjk5MzY4Nl0gTm90IGFjdGl2YXRpbmcgTWFuZGF0b3J5IEFjY2VzcyBD
b250cm9sIGFzIC9zYmluL3RvbW95by1pbml0IGRvZXMgbm90IGV4aXN0LgpbICAgIDMuMTExNjcx
XSBzeXN0ZW1kWzFdOiBJbnNlcnRlZCBtb2R1bGUgJ2F1dG9mczQnClsgICAgMy4yNTE0MjBdIHN5
c3RlbWRbMV06IHN5c3RlbWQgMjQwIHJ1bm5pbmcgaW4gc3lzdGVtIG1vZGUuICgrUEFNICtBVURJ
VCArU0VMSU5VWCArSU1BICtBUFBBUk1PUiArU01BQ0sgK1NZU1ZJTklUICtVVE1QICtMSUJDUllQ
VFNFVFVQICtHQ1JZUFQgK0dOVVRMUyArQUNMICtYWiArTFo0ICtTRUNDT01QICtCTEtJRCArRUxG
VVRJTFMgK0tNT0QgLUlETjIgK0lETiAtUENSRTIgZGVmYXVsdC1oaWVyYXJjaHk9aHlicmlkKQpb
ICAgIDMuMjUxNjYwXSBzeXN0ZW1kWzFdOiBEZXRlY3RlZCB2aXJ0dWFsaXphdGlvbiBvcmFjbGUu
ClsgICAgMy4yNTE2NzJdIHN5c3RlbWRbMV06IERldGVjdGVkIGFyY2hpdGVjdHVyZSB4ODYtNjQu
ClsgICAgMy4yODA2NTJdIHN5c3RlbWRbMV06IFNldCBob3N0bmFtZSB0byA8cm9zMj4uClsgICAg
My4zMDE4MTZdIHN5c3RlbWRbMV06IEZhaWxlZCB0byBidW1wIGZzLmZpbGUtbWF4LCBpZ25vcmlu
ZzogSW52YWxpZCBhcmd1bWVudApbICAgIDQuMTQ0MTE4XSByYW5kb206IGNybmcgaW5pdCBkb25l
ClsgICAgNS40OTMzNTFdIHN5c3RlbWRbMV06IC9saWIvc3lzdGVtZC9zeXN0ZW0vc3BpY2UtdmRh
Z2VudGQuc2VydmljZTo4OiBQSURGaWxlPSByZWZlcmVuY2VzIHBhdGggYmVsb3cgbGVnYWN5IGRp
cmVjdG9yeSAvdmFyL3J1bi8sIHVwZGF0aW5nIC92YXIvcnVuL3NwaWNlLXZkYWdlbnRkL3NwaWNl
LXZkYWdlbnRkLnBpZCBceGZmZmZmZmUyXHhmZmZmZmY4Nlx4ZmZmZmZmOTIgL3J1bi9zcGljZS12
ZGFnZW50ZC9zcGljZS12ZGFnZW50ZC5waWQ7IHBsZWFzZSB1cGRhdGUgdGhlIHVuaXQgZmlsZSBh
Y2NvcmRpbmdseS4KWyAgICA1LjUyNDE1NV0gc3lzdGVtZFsxXTogTGlzdGVuaW5nIG9uIEpvdXJu
YWwgU29ja2V0LgpbICAgIDUuNTI0MzcwXSBzeXN0ZW1kWzFdOiBSZWFjaGVkIHRhcmdldCBSZW1v
dGUgRmlsZSBTeXN0ZW1zLgpbICAgIDUuNTI0NzU5XSBzeXN0ZW1kWzFdOiBMaXN0ZW5pbmcgb24g
Sm91cm5hbCBBdWRpdCBTb2NrZXQuClsgICAgNS41MjQ5NTNdIHN5c3RlbWRbMV06IExpc3Rlbmlu
ZyBvbiBmc2NrIHRvIGZzY2tkIGNvbW11bmljYXRpb24gU29ja2V0LgpbICAgIDUuNjcyMzA0XSBF
WFQ0LWZzIChzZGExKTogcmUtbW91bnRlZC4gT3B0czogZXJyb3JzPXJlbW91bnQtcm8KWyAgICA1
Ljg2NTA1M10gc3lzdGVtZC1qb3VybmFsZFszMDldOiBSZWNlaXZlZCByZXF1ZXN0IHRvIGZsdXNo
IHJ1bnRpbWUgam91cm5hbCBmcm9tIFBJRCAxClsgICAgNS45NjU3OTZdIEFkZGluZyAyMDk3MTQ4
ayBzd2FwIG9uIC9zd2FwZmlsZS4gIFByaW9yaXR5Oi0yIGV4dGVudHM6NiBhY3Jvc3M6MjI2MDk4
OGsgRlMKWyAgICA2LjE5ODExNF0gbHA6IGRyaXZlciBsb2FkZWQgYnV0IG5vIGRldmljZXMgZm91
bmQKWyAgICA2LjIxNjcwNV0gcHBkZXY6IHVzZXItc3BhY2UgcGFyYWxsZWwgcG9ydCBkcml2ZXIK
WyAgICA5Ljg1NDY2N10gYXVkaXQ6IHR5cGU9MTQwMCBhdWRpdCgxNTY0Mzk5NzI4LjUyMzoyKTog
YXBwYXJtb3I9IlNUQVRVUyIgb3BlcmF0aW9uPSJwcm9maWxlX2xvYWQiIHByb2ZpbGU9InVuY29u
ZmluZWQiIG5hbWU9Ii9ob21lL2FiaGlzaGVrL3JvczJfd3Mvcm9zMl93cy9idWlsZC9kZW1vX25v
ZGVzX2NwcC9saXN0ZW5lciIgcGlkPTQyMiBjb21tPSJhcHBhcm1vcl9wYXJzZXIiClsgICAgOS45
Nzc5OTBdIGF1ZGl0OiB0eXBlPTE0MDAgYXVkaXQoMTU2NDM5OTcyOC42NDc6Myk6IGFwcGFybW9y
PSJTVEFUVVMiIG9wZXJhdGlvbj0icHJvZmlsZV9sb2FkIiBwcm9maWxlPSJ1bmNvbmZpbmVkIiBu
YW1lPSIvaG9tZS9hYmhpc2hlay9yb3MyX3dzL3JvczJfd3MvYnVpbGQvZGVtb19ub2Rlc19jcHAv
dGFsa2VyIiBwaWQ9NDMwIGNvbW09ImFwcGFybW9yX3BhcnNlciIKWyAgIDEwLjAyMjk3NF0gYXVk
aXQ6IHR5cGU9MTQwMCBhdWRpdCgxNTY0Mzk5NzI4LjY5NTo0KTogYXBwYXJtb3I9IlNUQVRVUyIg
b3BlcmF0aW9uPSJwcm9maWxlX2xvYWQiIHByb2ZpbGU9InVuY29uZmluZWQiIG5hbWU9Im52aWRp
YV9tb2Rwcm9iZSIgcGlkPTQ0MSBjb21tPSJhcHBhcm1vcl9wYXJzZXIiClsgICAxMC4wMjI5ODVd
IGF1ZGl0OiB0eXBlPTE0MDAgYXVkaXQoMTU2NDM5OTcyOC42OTU6NSk6IGFwcGFybW9yPSJTVEFU
VVMiIG9wZXJhdGlvbj0icHJvZmlsZV9sb2FkIiBwcm9maWxlPSJ1bmNvbmZpbmVkIiBuYW1lPSJu
dmlkaWFfbW9kcHJvYmUvL2ttb2QiIHBpZD00NDEgY29tbT0iYXBwYXJtb3JfcGFyc2VyIgpbICAg
MTAuMTg5MDI1XSBhdWRpdDogdHlwZT0xNDAwIGF1ZGl0KDE1NjQzOTk3MjguODU5OjYpOiBhcHBh
cm1vcj0iU1RBVFVTIiBvcGVyYXRpb249InByb2ZpbGVfbG9hZCIgcHJvZmlsZT0idW5jb25maW5l
ZCIgbmFtZT0iL3NiaW4vZGhjbGllbnQiIHBpZD00NDkgY29tbT0iYXBwYXJtb3JfcGFyc2VyIgpb
ICAgMTAuMTg5MDI4XSBhdWRpdDogdHlwZT0xNDAwIGF1ZGl0KDE1NjQzOTk3MjguODU5OjcpOiBh
cHBhcm1vcj0iU1RBVFVTIiBvcGVyYXRpb249InByb2ZpbGVfbG9hZCIgcHJvZmlsZT0idW5jb25m
aW5lZCIgbmFtZT0iL3Vzci9saWIvTmV0d29ya01hbmFnZXIvbm0tZGhjcC1jbGllbnQuYWN0aW9u
IiBwaWQ9NDQ5IGNvbW09ImFwcGFybW9yX3BhcnNlciIKWyAgIDEwLjE4OTAzMF0gYXVkaXQ6IHR5
cGU9MTQwMCBhdWRpdCgxNTY0Mzk5NzI4Ljg1OTo4KTogYXBwYXJtb3I9IlNUQVRVUyIgb3BlcmF0
aW9uPSJwcm9maWxlX2xvYWQiIHByb2ZpbGU9InVuY29uZmluZWQiIG5hbWU9Ii91c3IvbGliL05l
dHdvcmtNYW5hZ2VyL25tLWRoY3AtaGVscGVyIiBwaWQ9NDQ5IGNvbW09ImFwcGFybW9yX3BhcnNl
ciIKWyAgIDEwLjE4OTAzMl0gYXVkaXQ6IHR5cGU9MTQwMCBhdWRpdCgxNTY0Mzk5NzI4Ljg1OTo5
KTogYXBwYXJtb3I9IlNUQVRVUyIgb3BlcmF0aW9uPSJwcm9maWxlX2xvYWQiIHByb2ZpbGU9InVu
Y29uZmluZWQiIG5hbWU9Ii91c3IvbGliL2Nvbm5tYW4vc2NyaXB0cy9kaGNsaWVudC1zY3JpcHQi
IHBpZD00NDkgY29tbT0iYXBwYXJtb3JfcGFyc2VyIgpbICAgMTAuNDM4MzQzXSBhdWRpdDogdHlw
ZT0xNDAwIGF1ZGl0KDE1NjQzOTk3MjkuMTA3OjEwKTogYXBwYXJtb3I9IlNUQVRVUyIgb3BlcmF0
aW9uPSJwcm9maWxlX2xvYWQiIHByb2ZpbGU9InVuY29uZmluZWQiIG5hbWU9Ii91c3IvYmluL2V2
aW5jZSIgcGlkPTQ1OSBjb21tPSJhcHBhcm1vcl9wYXJzZXIiClsgICAxMC40MzgzNDVdIGF1ZGl0
OiB0eXBlPTE0MDAgYXVkaXQoMTU2NDM5OTcyOS4xMDc6MTEpOiBhcHBhcm1vcj0iU1RBVFVTIiBv
cGVyYXRpb249InByb2ZpbGVfbG9hZCIgcHJvZmlsZT0idW5jb25maW5lZCIgbmFtZT0iL3Vzci9i
aW4vZXZpbmNlLy9zYW5pdGl6ZWRfaGVscGVyIiBwaWQ9NDU5IGNvbW09ImFwcGFybW9yX3BhcnNl
ciIKWyAgIDExLjA5MzAzOF0gUkFQTCBQTVU6IEFQSSB1bml0IGlzIDJeLTMyIEpvdWxlcywgNSBm
aXhlZCBjb3VudGVycywgMTA3Mzc0MTgyNDAgbXMgb3ZmbCB0aW1lcgpbICAgMTEuMDkzMDQwXSBS
QVBMIFBNVTogaHcgdW5pdCBvZiBkb21haW4gcHAwLWNvcmUgMl4tMCBKb3VsZXMKWyAgIDExLjA5
MzA0MV0gUkFQTCBQTVU6IGh3IHVuaXQgb2YgZG9tYWluIHBhY2thZ2UgMl4tMCBKb3VsZXMKWyAg
IDExLjA5MzA0Ml0gUkFQTCBQTVU6IGh3IHVuaXQgb2YgZG9tYWluIGRyYW0gMl4tMCBKb3VsZXMK
WyAgIDExLjA5MzA0Ml0gUkFQTCBQTVU6IGh3IHVuaXQgb2YgZG9tYWluIHBwMS1ncHUgMl4tMCBK
b3VsZXMKWyAgIDExLjA5MzA0M10gUkFQTCBQTVU6IGh3IHVuaXQgb2YgZG9tYWluIHBzeXMgMl4t
MCBKb3VsZXMKWyAgIDExLjI5MjMyMF0gY3J5cHRkOiBtYXhfY3B1X3FsZW4gc2V0IHRvIDEwMDAK
WyAgIDExLjU4NjQwNl0gQVZYMiB2ZXJzaW9uIG9mIGdjbV9lbmMvZGVjIGVuZ2FnZWQuClsgICAx
MS41ODY0MDhdIEFFUyBDVFIgbW9kZSBieTggb3B0aW1pemF0aW9uIGVuYWJsZWQKWyAgIDEyLjE3
ODI1MV0gW2RybV0gVlJBTSAwODAwMDAwMApbICAgMTIuMTc4OTQ0XSBbVFRNXSBab25lICBrZXJu
ZWw6IEF2YWlsYWJsZSBncmFwaGljcyBtZW1vcnk6IDM5ODQzNjQgS2lCClsgICAxMi4xNzg5NDdd
IFtUVE1dIFpvbmUgICBkbWEzMjogQXZhaWxhYmxlIGdyYXBoaWNzIG1lbW9yeTogMjA5NzE1MiBL
aUIKWyAgIDEyLjE3ODk0OV0gW1RUTV0gSW5pdGlhbGl6aW5nIHBvb2wgYWxsb2NhdG9yClsgICAx
Mi4xNzg5NTldIFtUVE1dIEluaXRpYWxpemluZyBETUEgcG9vbCBhbGxvY2F0b3IKWyAgIDEyLjIw
MjU4NF0gZmJjb246IHZib3h2aWRlb2RybWZiIChmYjApIGlzIHByaW1hcnkgZGV2aWNlClsgICAx
Mi4yMDkxOTRdIENvbnNvbGU6IHN3aXRjaGluZyB0byBjb2xvdXIgZnJhbWUgYnVmZmVyIGRldmlj
ZSAyMzF4NjEKWyAgIDEyLjIxMjE1NV0gdmJveHZpZGVvIDAwMDA6MDA6MDIuMDogZmIwOiB2Ym94
dmlkZW9kcm1mYiBmcmFtZSBidWZmZXIgZGV2aWNlClsgICAxMi4yMjY1MjRdIFtkcm1dIEluaXRp
YWxpemVkIHZib3h2aWRlbyAxLjAuMCAyMDEzMDgyMyBmb3IgMDAwMDowMDowMi4wIG9uIG1pbm9y
IDAKWyAgIDE0LjI5MDczM10gc25kX2ludGVsOHgwIDAwMDA6MDA6MDUuMDogd2hpdGUgbGlzdCBy
YXRlIGZvciAxMDI4OjAxNzcgaXMgNDgwMDAKWyAgIDIyLjM4MjY1N10gZTEwMDA6IGVucDBzMyBO
SUMgTGluayBpcyBVcCAxMDAwIE1icHMgRnVsbCBEdXBsZXgsIEZsb3cgQ29udHJvbDogUlgKWyAg
IDIyLjM4Mjk0MV0gSVB2NjogQUREUkNPTkYoTkVUREVWX0NIQU5HRSk6IGVucDBzMzogbGluayBi
ZWNvbWVzIHJlYWR5ClsgICA4Ni43MDI3MTddIHJma2lsbDogaW5wdXQgaGFuZGxlciBkaXNhYmxl
ZApbIDE2MDEuODU0NjE3XSBjYW46IGNvbnRyb2xsZXIgYXJlYSBuZXR3b3JrIGNvcmUgKHJldiAy
MDE3MDQyNSBhYmkgOSkKWyAxNjAxLjg1NDczNl0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZh
bWlseSAyOQpbIDE2MDEuODU5NjM1XSBjYW46IHJhdyBwcm90b2NvbCAocmV2IDIwMTcwNDI1KQpb
IDE2MDEuODYyNzEyXSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDM4ClsgMTYwMS44
ODgxODRdIHNjdHA6IEhhc2ggdGFibGVzIGNvbmZpZ3VyZWQgKGJpbmQgMjU2LzI1NikKWyAxNjI1
LjczNTM4NV0gY2FuOiBicm9hZGNhc3QgbWFuYWdlciBwcm90b2NvbCAocmV2IDIwMTcwNDI1IHQp
ClsgNTQ3Ni45MTM2NjddIHVzYiAyLTE6IFVTQiBkaXNjb25uZWN0LCBkZXZpY2UgbnVtYmVyIDIK
WyA1NDc3LjM4ODI1NF0gdXNiIDItMTogbmV3IGZ1bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIg
MyB1c2luZyBvaGNpLXBjaQpbIDU0NzcuNzM5Nzk3XSB1c2IgMi0xOiBOZXcgVVNCIGRldmljZSBm
b3VuZCwgaWRWZW5kb3I9ODBlZSwgaWRQcm9kdWN0PTAwMjEsIGJjZERldmljZT0gMS4wMApbIDU0
NzcuNzM5ODA0XSB1c2IgMi0xOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVj
dD0zLCBTZXJpYWxOdW1iZXI9MApbIDU0NzcuNzM5ODA4XSB1c2IgMi0xOiBQcm9kdWN0OiBVU0Ig
VGFibGV0ClsgNTQ3Ny43Mzk4MTFdIHVzYiAyLTE6IE1hbnVmYWN0dXJlcjogVmlydHVhbEJveApb
IDU0NzcuNzU3NzA1XSBpbnB1dDogVmlydHVhbEJveCBVU0IgVGFibGV0IGFzIC9kZXZpY2VzL3Bj
aTAwMDA6MDAvMDAwMDowMDowNi4wL3VzYjIvMi0xLzItMToxLjAvMDAwMzo4MEVFOjAwMjEuMDAw
Mi9pbnB1dC9pbnB1dDcKWyA1NDc3Ljc1ODE4NV0gaGlkLWdlbmVyaWMgMDAwMzo4MEVFOjAwMjEu
MDAwMjogaW5wdXQsaGlkcmF3MDogVVNCIEhJRCB2MS4xMCBNb3VzZSBbVmlydHVhbEJveCBVU0Ig
VGFibGV0XSBvbiB1c2ItMDAwMDowMDowNi4wLTEvaW5wdXQwClsgNTQ4OC42NTE5MzRdIGFwcGFy
bW9yX3NvY2tldF9zZW5kbXNnOiBjdXJyZW50IHByb2Nlc3MgPSB0YWxrZXIsIGN1cnJlbnQgcGlk
ID0gMjE5MjkKWyA1NDg4LjY1MTkzN10gbXNnIHNlbnQgdG8gKG51bGwpLCAwClsgNTQ4OC42NTIw
MDFdIGFwcGFybW9yX3NvY2tldF9zZW5kbXNnOiBjdXJyZW50IHByb2Nlc3MgPSB0YWxrZXIsIGN1
cnJlbnQgcGlkID0gMjE5MjkKWyA1NDg4LjY1MjAwMl0gbXNnIHNlbnQgdG8gKG51bGwpLCAwClsg
NTQ4OC42NTI0NDRdIGFwcGFybW9yX3NvY2tldF9zZW5kbXNnOiBjdXJyZW50IHByb2Nlc3MgPSB0
YWxrZXIsIGN1cnJlbnQgcGlkID0gMjE5MjkKWyA1NDg4LjY1MjQ0NV0gbXNnIHNlbnQgdG8gKG51
bGwpLCAwClsgNTQ4OC42NTI0ODJdIGFwcGFybW9yX3NvY2tldF9zZW5kbXNnOiBjdXJyZW50IHBy
b2Nlc3MgPSB0YWxrZXIsIGN1cnJlbnQgcGlkID0gMjE5MjkKWyA1NDg4LjY1MjQ4M10gbXNnIHNl
bnQgdG8gKG51bGwpLCAwClsgNTQ4OC42NTI4ODNdIGFwcGFybW9yX3NvY2tldF9zZW5kbXNnOiBj
dXJyZW50IHByb2Nlc3MgPSB0YWxrZXIsIGN1cnJlbnQgcGlkID0gMjE5MjkKWyA1NDg4LjY1Mjg4
NF0gbXNnIHNlbnQgdG8gKG51bGwpLCAwClsgNTQ4OC42NTI5MTZdIGFwcGFybW9yX3NvY2tldF9z
ZW5kbXNnOiBjdXJyZW50IHByb2Nlc3MgPSB0YWxrZXIsIGN1cnJlbnQgcGlkID0gMjE5MjkKWyA1
NDg4LjY1MjkxN10gbXNnIHNlbnQgdG8gKG51bGwpLCAwClsgNTQ4OC42NTMxNzFdIGFwcGFybW9y
X3NvY2tldF9zZW5kbXNnOiBjdXJyZW50IHByb2Nlc3MgPSB0YWxrZXIsIGN1cnJlbnQgcGlkID0g
MjE5MjkKWyA1NDg4LjY1MzE3Ml0gbXNnIHNlbnQgdG8gKG51bGwpLCAwClsgNTQ4OC42NTMyMDNd
IGFwcGFybW9yX3NvY2tldF9zZW5kbXNnOiBjdXJyZW50IHByb2Nlc3MgPSB0YWxrZXIsIGN1cnJl
bnQgcGlkID0gMjE5MjkKWyA1NDg4LjY1MzIwNF0gbXNnIHNlbnQgdG8gKG51bGwpLCAwClsgNTQ4
OC42NzI4NDFdIGFwcGFybW9yX3NvY2tldF9zZW5kbXNnOiBjdXJyZW50IHByb2Nlc3MgPSB0YWxr
ZXIsIGN1cnJlbnQgcGlkID0gMjE5MjkKWyA1NDg4LjY3Mjg0N10gbXNnIHNlbnQgdG8gKG51bGwp
LCAwClsgNTQ4OC42NzI5NTVdIGFwcGFybW9yX3NvY2tldF9zZW5kbXNnOiBjdXJyZW50IHByb2Nl
c3MgPSB0YWxrZXIsIGN1cnJlbnQgcGlkID0gMjE5MjkKWyA1NDg4LjY3Mjk1N10gbXNnIHNlbnQg
dG8gKG51bGwpLCAwClsgNTQ4OC42Nzk2MzhdIGFwcGFybW9yX3NvY2tldF9zZW5kbXNnOiBjdXJy
ZW50IHByb2Nlc3MgPSB0YWxrZXIsIGN1cnJlbnQgcGlkID0gMjE5MjkKWyA1NDg4LjY3OTY0M10g
bXNnIHNlbnQgdG8gKG51bGwpLCAwClsgNTQ4OC42Nzk3NTBdIGFwcGFybW9yX3NvY2tldF9zZW5k
bXNnOiBjdXJyZW50IHByb2Nlc3MgPSB0YWxrZXIsIGN1cnJlbnQgcGlkID0gMjE5MjkKWyA1NDg4
LjY3OTc1M10gbXNnIHNlbnQgdG8gKG51bGwpLCAwClsgNTQ4OC42ODc1MDRdIGFwcGFybW9yX3Nv
Y2tldF9zZW5kbXNnOiBjdXJyZW50IHByb2Nlc3MgPSB0YWxrZXIsIGN1cnJlbnQgcGlkID0gMjE5
MjkK

--_004_PN1PR0101MB1133CA642E64F1F4EE7D4191FBDF0PN1PR0101MB1133_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--_004_PN1PR0101MB1133CA642E64F1F4EE7D4191FBDF0PN1PR0101MB1133_--


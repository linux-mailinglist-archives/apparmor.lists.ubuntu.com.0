Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AAF785C9
	for <lists+apparmor@lfdr.de>; Mon, 29 Jul 2019 09:05:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hrziK-0000vb-6M; Mon, 29 Jul 2019 07:04:56 +0000
Received: from mail-eopbgr1380054.outbound.protection.outlook.com
 ([40.107.138.54] helo=IND01-MA1-obe.outbound.protection.outlook.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <abhishekvijeev@iisc.ac.in>) id 1hrziH-0000vP-BY
 for apparmor@lists.ubuntu.com; Mon, 29 Jul 2019 07:04:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGlvG/PS0IxvutcTLZWpc/zAJtC5a4S1/QaS9CQLQv8I5LSIYCiZj4JVTF5L8wI2gDgYCGvIkrTNE75m4Yk5MR5pxRx/AbEVUgp5d1+aQD7PCbXhynvWFXSnscvfTVbfAQ34Zub/FDK/FGbzqXxYaj4vxZ3r/SlKwE4s3eB2m1hzOZ9xNCCzPPuIx7SXwgOI99ysSTmSf9T7D/EypKisblGnEZGtMh18rp2QM9lS3ffgAD5+2tAxqoRbxs0nmUG28lK1om0Srw4pKjWANL/OyE/zZAM00g+ZRnhHRvmGORoNyzN+X4UiEJlGCpAtoMuhOvjY6jZzpC7UH+/E9ndPeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVa9uRTtOFl3+P2dHpNKle4APs7uuQlqLcVrXu7Eelc=;
 b=ZUNmDYONsK1DIBuoGDiMgli7s1MPBXrS/3II3tcYDPBxX7W0GLI6/vXI127Ri3EAGtYBzYrStD0o2IgZ87Mip8+65MF4Gpsk/fW/nddABgEPt+YCdc9oW/3SBM5Yyizq9I/xa2LnV/lny+LskEVPl8FDY3NL/mr0Rv2i/bHIEP52D/jeQ/DTIr45d8bVN1BK8QryyIvvS2KoFIk4c2dZb3q455YiAyUWWKnmcQ7owcYd+UsP01uMZpfkxyQ2ml0sLNryoIRi9duzK3hdvG5qyPCkN47MCOhlrIomPTw1UFHVOxBphVhO/Te+Aj61ggpgHqdirQj0TnjucG1EVcq6VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=iisc.ac.in;dmarc=pass action=none
 header.from=iisc.ac.in;dkim=pass header.d=iisc.ac.in;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iisc.ac.in;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVa9uRTtOFl3+P2dHpNKle4APs7uuQlqLcVrXu7Eelc=;
 b=s/CaQ16so1sS4Tiw7XKd5HhKeUDjAZx5UFtNMyKo3HO6MSJoM7vYwF0KyMFIR7HMRTojT/ehw+9Iopa0en7ewoS/9rozqnvn20jRthBqHMLdCsv/CYavsYt9O1lhGaXj3i1PcwC0c6qySzQH4omF/9/Lmdz9xI8afqtjBu70xt0=
Received: from PN1PR0101MB1133.INDPRD01.PROD.OUTLOOK.COM (52.134.166.8) by
 PN1PR0101MB2080.INDPRD01.PROD.OUTLOOK.COM (52.134.162.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Mon, 29 Jul 2019 07:04:49 +0000
Received: from PN1PR0101MB1133.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e1f0:2dd0:ca3:cd8d]) by PN1PR0101MB1133.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e1f0:2dd0:ca3:cd8d%5]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 07:04:49 +0000
From: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
To: Casey Schaufler <casey@schaufler-ca.com>, "apparmor@lists.ubuntu.com"
 <apparmor@lists.ubuntu.com>
Thread-Topic: [apparmor] Questions about AppArmor's Kernel Code
Thread-Index: AQHVQ7FiuL2/i98WSU25BWOuSi1nA6bdF1cAgAQYYcU=
Date: Mon, 29 Jul 2019 07:04:49 +0000
Message-ID: <PN1PR0101MB1133B7777C9596E0DA98E23AFBDD0@PN1PR0101MB1133.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB1132042133609E595BCC6F0FFBC00@MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM>,
 <e13a05b3-19f0-7c4c-ec7e-e9353f3183f2@schaufler-ca.com>
In-Reply-To: <e13a05b3-19f0-7c4c-ec7e-e9353f3183f2@schaufler-ca.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abhishekvijeev@iisc.ac.in; 
x-originating-ip: [14.139.128.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 186d4ab3-c966-4ee7-7c07-08d713f30bf9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:PN1PR0101MB2080; 
x-ms-traffictypediagnostic: PN1PR0101MB2080:
x-microsoft-antispam-prvs: <PN1PR0101MB2080973CBBDF4078D06A8A31FBDD0@PN1PR0101MB2080.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(136003)(396003)(39850400004)(366004)(189003)(199004)(2501003)(68736007)(5660300002)(81156014)(19627405001)(486006)(81166006)(6306002)(54896002)(26005)(6506007)(53546011)(186003)(33656002)(6436002)(102836004)(8936002)(9686003)(446003)(7736002)(71190400001)(71200400001)(86362001)(476003)(11346002)(229853002)(8676002)(2906002)(76116006)(99286004)(6606003)(3846002)(66066001)(66946007)(64756008)(66446008)(76176011)(110136005)(7696005)(5024004)(316002)(14444005)(66476007)(6246003)(786003)(14454004)(107886003)(478600001)(55016002)(53936002)(4326008)(256004)(74316002)(6116002)(52536014)(25786009)(66556008)(80872003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:PN1PR0101MB2080;
 H:PN1PR0101MB1133.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: iisc.ac.in does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xd9cxeozSiuX1z1/w30gZl6yrXJptaD6jZVNxoY+p1Lvo+QLBTzm/KnRsh6QmyhW76CpzqPcEp+MJmAu9cs2feqWyiBJB/CqkLRYpKAJzIMOj8N5fz58Y1wOtQma9v9x1p4JjfIuanU/m6NNlcw84GP/fv2ZJjD1UGrg7nyUREPr52laLnSvyU5W5fqZ6x127tcNJhavTpCRJHCnNYFDqo0RXJ9aANMrUuLMkdF4OsRzY3GhTEXOIhPDdUoPUGhKuOvCXw+U2HXH2jpszYWNfVbd/Nyc6k2SrjJRS+FUM2dVqnjkrIZHDPRTXRr/ooPK7DjlvntDROsNhXcfJeSCiqTBU2DwckSGGbysbY2HbbnWzTDF0HsNeYBBJzqlpdhbp6OYFFwhFXu2B4jy6YN5Sk+AkYSiE9eBK1RB68QDkPU=
MIME-Version: 1.0
X-OriginatorOrg: iisc.ac.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 186d4ab3-c966-4ee7-7c07-08d713f30bf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 07:04:49.3755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f15cd97-f6a7-41e3-b2c5-ad4193976476
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: abhishekvijeev@IISc.ac.in
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB2080
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
Cc: Rakesh Rajan Beck <rakeshbeck@iisc.ac.in>
Content-Type: multipart/mixed; boundary="===============2990991131884991196=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============2990991131884991196==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_PN1PR0101MB1133B7777C9596E0DA98E23AFBDD0PN1PR0101MB1133_"

--_000_PN1PR0101MB1133B7777C9596E0DA98E23AFBDD0PN1PR0101MB1133_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Oh alright I understand, thank you Casey.


________________________________
From: Casey Schaufler <casey@schaufler-ca.com>
Sent: 26 July 2019 21:59
To: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>; apparmor@lists.ubuntu.com =
<apparmor@lists.ubuntu.com>
Cc: Rakesh Rajan Beck <rakeshbeck@iisc.ac.in>
Subject: Re: [apparmor] Questions about AppArmor's Kernel Code

On 7/26/2019 5:56 AM, Abhishek Vijeev wrote:
>
> Hi,
>
>
> I have a few questions about AppArmor's kernel code and would be grateful=
 if you could kindly answer them.?
>
>
> 1) Why does AppArmor maintain two separate security blobs in cred->securi=
ty as well as task-security for processes? For a simple project that requir=
es associating a security context with every task, would it suffice to use =
just one of these?
>
>
> 2) There has been a change in the way security blobs are accessed from ke=
rnel version 4.18 to 5.2. I see that in v5.2, the?security blob's address i=
s obtained by adding the size of the blob to the start address. Why has thi=
s change been made? (For reference:?https://github.com/torvalds/linux/blob/=
master/security/apparmor/include/cred.h#L24)
>
The change was made to allow multiple security modules to share the
blobs. The security module initialization replaces the size of the blobs
in apparmor_bob_sizes with their offsets in the blob. The addition you
see adds the offset, not the size.

>
> 3) I tried adding a custom field (pointer to a custom structure) to struc=
t aa_profile, at exactly this point -?https://github.com/torvalds/linux/blo=
b/master/security/apparmor/include/policy.h#L144. I have taken care to allo=
cate and free memory for the pointer at the appropriate places (allocation =
is performed here -?https://github.com/torvalds/linux/blob/master/security/=
apparmor/policy_unpack.c#L671?and freeing is performed?here -?https://githu=
b.com/torvalds/linux/blob/master/security/apparmor/policy.c#L205).?However,=
 while booting the kernel, it crashes?at the function 'security_prepare_cre=
ds( )', which I presume invokes 'apparmor_cred_prepare( )'. If I was, to as=
sume for a moment that there are no bugs with my memory allocation code, is=
 there any other reason why such a crash might have occurred??I have attach=
ed the kernel crash log?file?with this email for your kind?reference.?
>
>
> Thank you,
>
> Abhishek.
>
>
>
>

--_000_PN1PR0101MB1133B7777C9596E0DA98E23AFBDD0PN1PR0101MB1133_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI=
 Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Oh alright I understand, thank yo=
u Casey.</p>
<br>
<br>
<div style=3D"color: rgb(0, 0, 0);">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Casey Schaufler &lt;c=
asey@schaufler-ca.com&gt;<br>
<b>Sent:</b> 26 July 2019 21:59<br>
<b>To:</b> Abhishek Vijeev &lt;abhishekvijeev@iisc.ac.in&gt;; apparmor@list=
s.ubuntu.com &lt;apparmor@lists.ubuntu.com&gt;<br>
<b>Cc:</b> Rakesh Rajan Beck &lt;rakeshbeck@iisc.ac.in&gt;<br>
<b>Subject:</b> Re: [apparmor] Questions about AppArmor's Kernel Code</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 7/26/2019 5:56 AM, Abhishek Vijeev wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt;<br>
&gt; I have a few questions about AppArmor's kernel code and would be grate=
ful if you could kindly answer them.?<br>
&gt;<br>
&gt;<br>
&gt; 1) Why does AppArmor maintain two separate security blobs in cred-&gt;=
security as well as task-security for processes? For a simple project that =
requires associating a security context with every task, would it suffice t=
o use just one of these?<br>
&gt;<br>
&gt;<br>
&gt; 2) There has been a change in the way security blobs are accessed from=
 kernel version 4.18 to 5.2. I see that in v5.2, the?security blob's addres=
s is obtained by adding the size of the blob to the start address. Why has =
this change been made? (For reference:?https://github.com/torvalds/linux/bl=
ob/master/security/apparmor/include/cred.h#L24)<br>
&gt;<br>
The change was made to allow multiple security modules to share the<br>
blobs. The security module initialization replaces the size of the blobs<br=
>
in apparmor_bob_sizes with their offsets in the blob. The addition you<br>
see adds the offset, not the size.<br>
<br>
&gt;<br>
&gt; 3) I tried adding a custom field (pointer to a custom structure) to st=
ruct aa_profile, at exactly this point -?https://github.com/torvalds/linux/=
blob/master/security/apparmor/include/policy.h#L144. I have taken care to a=
llocate and free memory for the pointer
 at the appropriate places (allocation is performed here -?https://github.c=
om/torvalds/linux/blob/master/security/apparmor/policy_unpack.c#L671?and fr=
eeing is performed?here -?https://github.com/torvalds/linux/blob/master/sec=
urity/apparmor/policy.c#L205).?However,
 while booting the kernel, it crashes?at the function 'security_prepare_cre=
ds( )', which I presume invokes 'apparmor_cred_prepare( )'. If I was, to as=
sume for a moment that there are no bugs with my memory allocation code, is=
 there any other reason why such
 a crash might have occurred??I have attached the kernel crash log?file?wit=
h this email for your kind?reference.?<br>
&gt;<br>
&gt;<br>
&gt; Thank you,<br>
&gt;<br>
&gt; Abhishek.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_PN1PR0101MB1133B7777C9596E0DA98E23AFBDD0PN1PR0101MB1133_--


--===============2990991131884991196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============2990991131884991196==--


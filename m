Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D2119786CB
	for <lists+apparmor@lfdr.de>; Mon, 29 Jul 2019 09:58:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hs0YC-0004JO-28; Mon, 29 Jul 2019 07:58:32 +0000
Received: from mail-eopbgr1390048.outbound.protection.outlook.com
 ([40.107.139.48] helo=IND01-BO1-obe.outbound.protection.outlook.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <abhishekvijeev@iisc.ac.in>) id 1hs0Y0-0004Hk-UP
 for apparmor@lists.ubuntu.com; Mon, 29 Jul 2019 07:58:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UjbwHFZEJCsksFsa/yM+efOt+P2zQUlCZhwvW+vgPYZSRBCaTIj9E+K3MsUAp4KxeqD1xHAyxTa4mfy3xzjKKm6rxwMB2OndYbymf1dESv3u3P2ikqdMoehFU/i6j8D5CJkhvKNu9zm2nCVhl8ldCsHDwCA3llQzrIAvehli2gmntawlYQygyrNoRnvHJhNG+Y9vAxqGtzGeDffHyfrVf06xNG7MNoywlK9n7iqxKo4SnFkPThWInZZQLyVKlB7KIZCKjsNpQDjlnPxKGAbJomtjSwlUhAy37J3/pcoq16fm2Mw2xNV+zv4ZTfAIi0yuCp2DUoFsLWuQzYADnG/kiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWhT6YdtT9h3XVw4PD+jaPOf2Xk7y07tGp7UuDSHtKk=;
 b=AQGM/E7CnSfDYYCV4IQp92IZUojGKKZd0BCBaY4JpfTtpDoF/KUC7GIvX5kit8uyKc2At3JOwh8Ast2z+7FJL4dy7hNE6yhP94igym2485hVbajBkR0Lnz0+CIn5mqHLAQvUKPmQ321r/4ei/4rG/lrBt8d9TXwiXmEHOeJq7+NbkBxBr12mqR9FcU1C69Ypp1IlnsAoQO/nRKAF6w54rCbq/JiammPDEU+qWYub+Ouy8rzcKaPngWTD+Rj2oegGa+ETxXlj7zisGsgxjkT4WRtKWquHV3I8hiT6mpl4AbtlwROL+9vu5YjxaaVJhqLerQKGSkeZtyvsaMhm+4yxVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=iisc.ac.in;dmarc=pass action=none
 header.from=iisc.ac.in;dkim=pass header.d=iisc.ac.in;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iisc.ac.in;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWhT6YdtT9h3XVw4PD+jaPOf2Xk7y07tGp7UuDSHtKk=;
 b=wDakvVgzinqKOVE8ZqksM5eEPi3BdE7BA0TM/YwLrpo/wZh7rMgHg8/JGwxcZ8Sr7c/fJYOyHHjebkF8ONeuqF4myicZtmtX3knq5s3RIf/E//rxLQFOzjcqKsIJJTqp8ANpdTsVVmNzfLhzcQBOYG8Dwh+GTz3q++eV6jAUTvE=
Received: from PN1PR0101MB1133.INDPRD01.PROD.OUTLOOK.COM (52.134.166.8) by
 PN1PR0101MB1598.INDPRD01.PROD.OUTLOOK.COM (52.134.163.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 07:58:17 +0000
Received: from PN1PR0101MB1133.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e1f0:2dd0:ca3:cd8d]) by PN1PR0101MB1133.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e1f0:2dd0:ca3:cd8d%5]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 07:58:17 +0000
From: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
To: John Johansen <john.johansen@canonical.com>, "apparmor@lists.ubuntu.com"
 <apparmor@lists.ubuntu.com>
Thread-Topic: [apparmor] Questions about AppArmor's Kernel Code
Thread-Index: AQHVQ7FiuL2/i98WSU25BWOuSi1nA6bdO70AgAP8vME=
Date: Mon, 29 Jul 2019 07:58:17 +0000
Message-ID: <PN1PR0101MB1133959D5B326EE0AAE60EA6FBDD0@PN1PR0101MB1133.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB1132042133609E595BCC6F0FFBC00@MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM>,
 <9240f8b1-3b4a-ebad-85c3-5dfd938d8aa2@canonical.com>
In-Reply-To: <9240f8b1-3b4a-ebad-85c3-5dfd938d8aa2@canonical.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abhishekvijeev@iisc.ac.in; 
x-originating-ip: [14.139.128.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5094763-d9af-40c8-a825-08d713fa83ea
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:PN1PR0101MB1598; 
x-ms-traffictypediagnostic: PN1PR0101MB1598:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <PN1PR0101MB1598DA6A9A58AE91D93765F0FBDD0@PN1PR0101MB1598.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39850400004)(376002)(346002)(366004)(189003)(199004)(33656002)(5024004)(14444005)(6606003)(256004)(236005)(54896002)(6306002)(9686003)(99936001)(606006)(74316002)(55016002)(110136005)(19627405001)(316002)(53936002)(2906002)(786003)(6116002)(7736002)(66066001)(107886003)(3846002)(81166006)(81156014)(8676002)(8936002)(6246003)(68736007)(25786009)(66446008)(66556008)(76116006)(64756008)(66476007)(66576008)(99286004)(76176011)(6506007)(86362001)(478600001)(966005)(4326008)(53546011)(102836004)(7696005)(14454004)(26005)(52536014)(2501003)(66946007)(5660300002)(6436002)(486006)(476003)(446003)(11346002)(229853002)(71190400001)(71200400001)(186003)(80872003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:PN1PR0101MB1598;
 H:PN1PR0101MB1133.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: iisc.ac.in does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4gI26XtbkZSecXSd4zCY9igvl5y5Jp519Lb/OMgSu825OozWEWn9TEyqcDCMWQ5t1peZ8gpBeIs7uFSofDIDTGKwDZamCgUbHdBuFszLPI/r1J3jsmSnY4Y/oJwodh/LOdAnxFTbdihSg0/nF8/NN1quc3PbAVz6JAyT5xkxI5eXETngSIT+yYbClXCt5FFBi7eFzkm1UGxHHlUIl4fyWFXpAHHX6dq1IrKUo04vZ9rKhQPrGBogrIZ3m5C4RpLRou2yZyxQwTcK68yIGYXvAk7nOi/4Acx+8nCzZRfTgc8uMJiAor1Fm+i8CGf+o8vxUFRlD18szGMUVixOq+A6XvA45PZOn6mXNmhma3Y7SObzSI1i8zg3mRmBedHi4cpVh1olgrjCcrqK0Bry7WDN8d8gAyDxkuq+0mcoTuF2EHw=
Content-Type: multipart/mixed;
 boundary="_008_PN1PR0101MB1133959D5B326EE0AAE60EA6FBDD0PN1PR0101MB1133_"
MIME-Version: 1.0
X-OriginatorOrg: iisc.ac.in
X-MS-Exchange-CrossTenant-Network-Message-Id: f5094763-d9af-40c8-a825-08d713fa83ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 07:58:17.1570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f15cd97-f6a7-41e3-b2c5-ad4193976476
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: abhishekvijeev@IISc.ac.in
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB1598
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--_008_PN1PR0101MB1133959D5B326EE0AAE60EA6FBDD0PN1PR0101MB1133_
Content-Type: multipart/alternative;
	boundary="_000_PN1PR0101MB1133959D5B326EE0AAE60EA6FBDD0PN1PR0101MB1133_"

--_000_PN1PR0101MB1133959D5B326EE0AAE60EA6FBDD0PN1PR0101MB1133_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you for the explanation John.

I have attached the files we have modified. Every piece of code that we ins=
erted is enclosed
within comment lines 'Custom code begin' and 'Custom code end' so that it's=
 easy for you to find. Here
is a brief description of the changes made:

AppArmor Parser (user-space) - We modified the grammar of AppArmor's parser=
 to include additional
     grammar rules. These rules store data in class Profile

a) profile.h - 2 new structure definitions to store our custom data
  - class Profile now contains a member 'clabel'
b) parser_interface.c - Added code to sd_serialize_profile( ) that serializ=
es the additional custom
  data we added to class Profile during the parsing phase
AppArmor LSM (kernel) :


a) include/policy.h - 2 new structure definitions
              - struct aa_profile now contains a member 'clabel'

b) policy_unpack.c - Added code to unpack_profile( ) that unpacks the seria=
lized object sent from
user-space, and allocates kernel memory for the security structures added t=
o
aa_profile - namely, a label string and a linked list containing allow perm=
issions
c) policy.c - Added code to function aa_free_profile( ) that frees the allo=
cated memory


________________________________
From: John Johansen <john.johansen@canonical.com>
Sent: 27 July 2019 00:10:14
To: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>; apparmor@lists.ubuntu.com =
<apparmor@lists.ubuntu.com>
Cc: Rakesh Rajan Beck <rakeshbeck@iisc.ac.in>
Subject: Re: [apparmor] Questions about AppArmor's Kernel Code

On 7/26/19 5:56 AM, Abhishek Vijeev wrote:
> Hi,
>
>
> I have a few questions about AppArmor's kernel code and would be grateful=
 if you could kindly answer them.
>
>
> 1) Why does AppArmor maintain two separate security blobs in cred->securi=
ty as well as task-security for processes? For a simple project that requir=
es associating a security context with every task, would it suffice to use =
just one of these?
>
the task->security field is used to store task specific information, that i=
s not used for general mediation. Currently the information stored their is=
 for the change_hat and change_onexec apis and some info to track what the =
confinement was when no-newprivs was applied to the task.

cred->security is used to store the subjects label (type) for mediation.

Before the task->security field was reintroduce all the information was sto=
red off the cred in a intermediate structure. Doing so would cause use of t=
he change_hat and change_onexec api to change the cred of the task even whe=
n the confinement had not changed. The switch to using the task->security f=
ield was pre 4.18

>
> 2) There has been a change in the way security blobs are accessed from ke=
rnel version 4.18 to 5.2. I see that in v5.2, the security blob's address i=
s obtained by adding the size of the blob to the start address. Why has thi=
s change been made? (For reference: https://github.com/torvalds/linux/blob/=
master/security/apparmor/include/cred.h#L24)
>
see Casey's answer

>
> 3) I tried adding a custom field (pointer to a custom structure) to struc=
t aa_profile, at exactly this point - https://github.com/torvalds/linux/blo=
b/master/security/apparmor/include/policy.h#L144. I have taken care to allo=
cate and free memory for the pointer at the appropriate places (allocation =
is performed here - https://github.com/torvalds/linux/blob/master/security/=
apparmor/policy_unpack.c#L671 and freeing is performed here - https://githu=
b.com/torvalds/linux/blob/master/security/apparmor/policy.c#L205). However,=
 while booting the kernel, it crashes at the function 'security_prepare_cre=
ds( )', which I presume invokes 'apparmor_cred_prepare( )'. If I was, to as=
sume for a moment that there are no bugs with my memory allocation code, is=
 there any other reason why such a crash might have occurred? I have attach=
ed the kernel crash log file with this email for your kind reference.
>

I know the code points but to be able to comment beyond vague guesses I nee=
d to see your changes. I can give you the warning to not add your field aft=
er the current last field,

  struct aa_label label;

as it has a variable length field. While that is always 2 entries when its =
embedded in the profile the compiler will end up treating it as zero length=
 over lapping your new field with the start of the variable length array.

I do have a patch to address this using a union but I haven't landed it yet=
.

--_000_PN1PR0101MB1133959D5B326EE0AAE60EA6FBDD0PN1PR0101MB1133_
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
<div>Thank you for the explanation John.</div>
<div><br>
</div>
<div>I have attached the&nbsp;files we have&nbsp;modified. Every piece of c=
ode that we inserted is enclosed</div>
<div>within comment lines 'Custom code begin' and 'Custom code end' so that=
 it's easy for you to find. Here</div>
<div>is a brief description of the changes made:</div>
<div><br>
</div>
<div>AppArmor Parser (user-space) -&nbsp;We modified the grammar of AppArmo=
r's parser to include additional&nbsp;</div>
<div><span style=3D"white-space:pre"></span>&nbsp; &nbsp; &nbsp;grammar rul=
es. These rules store data in class Profile</div>
<div><br>
</div>
<div>a) profile.h&nbsp;- 2 new structure definitions to store our custom da=
ta</div>
<div><span style=3D"white-space:pre"></span>&nbsp; - class Profile now cont=
ains a member 'clabel'&nbsp;</div>
<div><span style=3D"white-space:pre"></span></div>
<div>b) parser_interface.c&nbsp;- Added code to sd_serialize_profile( ) tha=
t serializes the additional custom</div>
<div><span style=3D"white-space:pre"></span>&nbsp; data we added to class P=
rofile during the parsing phase</div>
<div><span style=3D"white-space:pre"></span></div>
<div><span style=3D"white-space:pre"></span></div>
<div>AppArmor LSM (kernel) :&nbsp; &nbsp; &nbsp;&nbsp;</div>
<div><br>
</div>
<div><br>
</div>
<div>a) include/policy.h&nbsp;- 2 new structure definitions</div>
<div><span style=3D"white-space:pre"></span>&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; - struct aa_profile now contains a member 'clabel'</div>
<div><br>
</div>
<div>b) policy_unpack.c<span style=3D"white-space:pre"> </span>- Added code=
 to unpack_profile( ) that unpacks the serialized object sent from&nbsp;</d=
iv>
<div><span style=3D"white-space:pre"></span>user-space, and allocates kerne=
l memory for the security structures added to&nbsp;</div>
<div><span style=3D"white-space:pre"></span>aa_profile - namely, a label st=
ring and a linked list containing allow permissions</div>
<div><span style=3D"white-space:pre"></span></div>
<div>c) policy.c&nbsp;- Added code to function aa_free_profile( ) that free=
s the allocated memory&nbsp;</div>
<br>
<p></p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> John Johansen &lt;joh=
n.johansen@canonical.com&gt;<br>
<b>Sent:</b> 27 July 2019 00:10:14<br>
<b>To:</b> Abhishek Vijeev &lt;abhishekvijeev@iisc.ac.in&gt;; apparmor@list=
s.ubuntu.com &lt;apparmor@lists.ubuntu.com&gt;<br>
<b>Cc:</b> Rakesh Rajan Beck &lt;rakeshbeck@iisc.ac.in&gt;<br>
<b>Subject:</b> Re: [apparmor] Questions about AppArmor's Kernel Code</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 7/26/19 5:56 AM, Abhishek Vijeev wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; <br>
&gt; I have a few questions about AppArmor's kernel code and would be grate=
ful if you could kindly answer them.&nbsp;<br>
&gt; <br>
&gt; <br>
&gt; 1) Why does AppArmor maintain two separate security blobs in cred-&gt;=
security as well as task-security for processes? For a simple project that =
requires associating a security context with every task, would it suffice t=
o use just one of these?<br>
&gt; <br>
the task-&gt;security field is used to store task specific information, tha=
t is not used for general mediation. Currently the information stored their=
 is for the change_hat and change_onexec apis and some info to track what t=
he confinement was when no-newprivs
 was applied to the task.<br>
<br>
cred-&gt;security is used to store the subjects label (type) for mediation.=
<br>
<br>
Before the task-&gt;security field was reintroduce all the information was =
stored off the cred in a intermediate structure. Doing so would cause use o=
f the change_hat and change_onexec api to change the cred of the task even =
when the confinement had not changed.
 The switch to using the task-&gt;security field was pre 4.18<br>
<br>
&gt; <br>
&gt; 2) There has been a change in the way security blobs are accessed from=
 kernel version 4.18 to 5.2. I see that in v5.2, the&nbsp;security blob's a=
ddress is obtained by adding the size of the blob to the start address. Why=
 has this change been made? (For reference:&nbsp;<a href=3D"https://github.=
com/torvalds/linux/blob/master/security/apparmor/include/cred.h#L24">https:=
//github.com/torvalds/linux/blob/master/security/apparmor/include/cred.h#L2=
4</a>)<br>
&gt; <br>
see Casey's answer<br>
<br>
&gt; <br>
&gt; 3) I tried adding a custom field (pointer to a custom structure) to st=
ruct aa_profile, at exactly this point -&nbsp;<a href=3D"https://github.com=
/torvalds/linux/blob/master/security/apparmor/include/policy.h#L144">https:=
//github.com/torvalds/linux/blob/master/security/apparmor/include/policy.h#=
L144</a>.
 I have taken care to allocate and free memory for the pointer at the appro=
priate places (allocation is performed here -&nbsp;<a href=3D"https://githu=
b.com/torvalds/linux/blob/master/security/apparmor/policy_unpack.c#L671">ht=
tps://github.com/torvalds/linux/blob/master/security/apparmor/policy_unpack=
.c#L671</a>&nbsp;and
 freeing is performed&nbsp;here -&nbsp;<a href=3D"https://github.com/torval=
ds/linux/blob/master/security/apparmor/policy.c#L205">https://github.com/to=
rvalds/linux/blob/master/security/apparmor/policy.c#L205</a>).&nbsp;However=
, while booting the kernel, it crashes&nbsp;at the function
 'security_prepare_creds( )', which I presume invokes 'apparmor_cred_prepar=
e( )'. If I was, to assume for a moment that there are no bugs with my memo=
ry allocation code, is there any other reason why such a crash might have o=
ccurred?&nbsp;I have attached the kernel
 crash log&nbsp;file&nbsp;with this email for your kind&nbsp;reference.&nbs=
p;<br>
&gt; <br>
<br>
I know the code points but to be able to comment beyond vague guesses I nee=
d to see your changes. I can give you the warning to not add your field aft=
er the current last field,<br>
<br>
&nbsp; struct aa_label label;<br>
<br>
as it has a variable length field. While that is always 2 entries when its =
embedded in the profile the compiler will end up treating it as zero length=
 over lapping your new field with the start of the variable length array.<b=
r>
<br>
I do have a patch to address this using a union but I haven't landed it yet=
.<br>
</div>
</span></font></div>
</body>
</html>

--_000_PN1PR0101MB1133959D5B326EE0AAE60EA6FBDD0PN1PR0101MB1133_--

--_008_PN1PR0101MB1133959D5B326EE0AAE60EA6FBDD0PN1PR0101MB1133_
Content-Type: text/x-chdr; name="policy.h"
Content-Description: policy.h
Content-Disposition: attachment; filename="policy.h"; size=9105;
	creation-date="Mon, 29 Jul 2019 07:45:02 GMT";
	modification-date="Mon, 29 Jul 2019 07:45:02 GMT"
Content-Transfer-Encoding: base64

LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLwovKgogKiBBcHBBcm1v
ciBzZWN1cml0eSBtb2R1bGUKICoKICogVGhpcyBmaWxlIGNvbnRhaW5zIEFwcEFybW9yIHBvbGlj
eSBkZWZpbml0aW9ucy4KICoKICogQ29weXJpZ2h0IChDKSAxOTk4LTIwMDggTm92ZWxsL1NVU0UK
ICogQ29weXJpZ2h0IDIwMDktMjAxMCBDYW5vbmljYWwgTHRkLgogKi8KCiNpZm5kZWYgX19BQV9Q
T0xJQ1lfSAojZGVmaW5lIF9fQUFfUE9MSUNZX0gKCiNpbmNsdWRlIDxsaW51eC9jYXBhYmlsaXR5
Lmg+CiNpbmNsdWRlIDxsaW51eC9jcmVkLmg+CiNpbmNsdWRlIDxsaW51eC9rcmVmLmg+CiNpbmNs
dWRlIDxsaW51eC9yaGFzaHRhYmxlLmg+CiNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgojaW5jbHVk
ZSA8bGludXgvc2xhYi5oPgojaW5jbHVkZSA8bGludXgvc29ja2V0Lmg+CgojaW5jbHVkZSAiYXBw
YXJtb3IuaCIKI2luY2x1ZGUgImF1ZGl0LmgiCiNpbmNsdWRlICJjYXBhYmlsaXR5LmgiCiNpbmNs
dWRlICJkb21haW4uaCIKI2luY2x1ZGUgImZpbGUuaCIKI2luY2x1ZGUgImxpYi5oIgojaW5jbHVk
ZSAibGFiZWwuaCIKI2luY2x1ZGUgIm5ldC5oIgojaW5jbHVkZSAicGVybXMuaCIKI2luY2x1ZGUg
InJlc291cmNlLmgiCgoKc3RydWN0IGFhX25zOwoKZXh0ZXJuIGludCB1bnByaXZpbGVnZWRfdXNl
cm5zX2FwcGFybW9yX3BvbGljeTsKCmV4dGVybiBjb25zdCBjaGFyICpjb25zdCBhYV9wcm9maWxl
X21vZGVfbmFtZXNbXTsKI2RlZmluZSBBUFBBUk1PUl9NT0RFX05BTUVTX01BWF9JTkRFWCA0Cgoj
ZGVmaW5lIFBST0ZJTEVfTU9ERShfcHJvZmlsZSwgX21vZGUpCQlcCgkoKGFhX2dfcHJvZmlsZV9t
b2RlID09IChfbW9kZSkpIHx8CVwKCSAoKF9wcm9maWxlKS0+bW9kZSA9PSAoX21vZGUpKSkKCiNk
ZWZpbmUgQ09NUExBSU5fTU9ERShfcHJvZmlsZSkJUFJPRklMRV9NT0RFKChfcHJvZmlsZSksIEFQ
UEFSTU9SX0NPTVBMQUlOKQoKI2RlZmluZSBLSUxMX01PREUoX3Byb2ZpbGUpIFBST0ZJTEVfTU9E
RSgoX3Byb2ZpbGUpLCBBUFBBUk1PUl9LSUxMKQoKI2RlZmluZSBQUk9GSUxFX0lTX0hBVChfcHJv
ZmlsZSkgKChfcHJvZmlsZSktPmxhYmVsLmZsYWdzICYgRkxBR19IQVQpCgojZGVmaW5lIHByb2Zp
bGVfaXNfc3RhbGUoX3Byb2ZpbGUpIChsYWJlbF9pc19zdGFsZSgmKF9wcm9maWxlKS0+bGFiZWwp
KQoKI2RlZmluZSBvbl9saXN0X3JjdShYKSAoIWxpc3RfZW1wdHkoWCkgJiYgKFgpLT5wcmV2ICE9
IExJU1RfUE9JU09OMikKCi8qCiAqIEZJWE1FOiBjdXJyZW50bHkgbmVlZCBhIGNsZWFuIHdheSB0
byByZXBsYWNlIGFuZCByZW1vdmUgcHJvZmlsZXMgYXMgYQogKiBzZXQuICBJdCBzaG91bGQgYmUg
ZG9uZSBhdCB0aGUgbmFtZXNwYWNlIGxldmVsLgogKiBFaXRoZXIsIHdpdGggYSBzZXQgb2YgcHJv
ZmlsZXMgbG9hZGVkIGF0IHRoZSBuYW1lc3BhY2UgbGV2ZWwgb3IgdmlhCiAqIGEgbWFyayBhbmQg
cmVtb3ZlIG1hcmtlZCBpbnRlcmZhY2UuCiAqLwplbnVtIHByb2ZpbGVfbW9kZSB7CglBUFBBUk1P
Ul9FTkZPUkNFLAkvKiBlbmZvcmNlIGFjY2VzcyBydWxlcyAqLwoJQVBQQVJNT1JfQ09NUExBSU4s
CS8qIGFsbG93IGFuZCBsb2cgYWNjZXNzIHZpb2xhdGlvbnMgKi8KCUFQUEFSTU9SX0tJTEwsCQkv
KiBraWxsIHRhc2sgb24gYWNjZXNzIHZpb2xhdGlvbiAqLwoJQVBQQVJNT1JfVU5DT05GSU5FRCwJ
LyogcHJvZmlsZSBzZXQgdG8gdW5jb25maW5lZCAqLwp9OwoKCi8qIHN0cnVjdCBhYV9wb2xpY3lk
YiAtIG1hdGNoIGVuZ2luZSBmb3IgYSBwb2xpY3kKICogZGZhOiBkZmEgcGF0dGVybiBtYXRjaAog
KiBzdGFydDogc2V0IG9mIHN0YXJ0IHN0YXRlcyBmb3IgdGhlIGRpZmZlcmVudCBjbGFzc2VzIG9m
IGRhdGEKICovCnN0cnVjdCBhYV9wb2xpY3lkYiB7CgkvKiBHZW5lcmljIHBvbGljeSBERkEgc3Bl
Y2lmaWMgcnVsZSB0eXBlcyB3aWxsIGJlIHN1YnNlY3Rpb25zIG9mIGl0ICovCglzdHJ1Y3QgYWFf
ZGZhICpkZmE7Cgl1bnNpZ25lZCBpbnQgc3RhcnRbQUFfQ0xBU1NfTEFTVCArIDFdOwoKfTsKCi8q
IHN0cnVjdCBhYV9kYXRhIC0gZ2VuZXJpYyBkYXRhIHN0cnVjdHVyZQogKiBrZXk6IG5hbWUgZm9y
IHJldHJpZXZpbmcgdGhpcyBkYXRhCiAqIHNpemU6IHNpemUgb2YgZGF0YSBpbiBieXRlcwogKiBk
YXRhOiBiaW5hcnkgZGF0YQogKiBoZWFkOiByZXNlcnZlZCBmb3Igcmhhc2h0YWJsZQogKi8Kc3Ry
dWN0IGFhX2RhdGEgewoJY2hhciAqa2V5OwoJdTMyIHNpemU7CgljaGFyICpkYXRhOwoJc3RydWN0
IHJoYXNoX2hlYWQgaGVhZDsKfTsKCi8vIEN1c3RvbSBjb2RlIGJlZ2luCnN0cnVjdCBkYXRhX2xp
c3QKewoJY2hhciAqZGF0YTsKCXN0cnVjdCBsaXN0X2hlYWQgbGg7Cn07CgpzdHJ1Y3QgY3VzdG9t
X2xhYmVsCnsKCWNoYXIgKmxhYmVsX25hbWU7CglpbnQgYWxsb3dfY250OwoJc3RydWN0IGRhdGFf
bGlzdCAqYWxsb3dfbGlzdDsKfTsKLy8gQ3VzdG9tIGNvZGUgZW5kCgoKLyogc3RydWN0IGFhX3By
b2ZpbGUgLSBiYXNpYyBjb25maW5lbWVudCBkYXRhCiAqIEBiYXNlIC0gYmFzZSBjb21wb25lbnRz
IG9mIHRoZSBwcm9maWxlIChuYW1lLCByZWZjb3VudCwgbGlzdHMsIGxvY2sgLi4uKQogKiBAbGFi
ZWwgLSBsYWJlbCB0aGlzIHByb2ZpbGUgaXMgYW4gZXh0ZW5zaW9uIG9mCiAqIEBwYXJlbnQ6IHBh
cmVudCBvZiBwcm9maWxlCiAqIEBuczogbmFtZXNwYWNlIHRoZSBwcm9maWxlIGlzIGluCiAqIEBy
ZW5hbWU6IG9wdGlvbmFsIHByb2ZpbGUgbmFtZSB0aGF0IHRoaXMgcHJvZmlsZSByZW5hbWVkCiAq
IEBhdHRhY2g6IGh1bWFuIHJlYWRhYmxlIGF0dGFjaG1lbnQgc3RyaW5nCiAqIEB4bWF0Y2g6IG9w
dGlvbmFsIGV4dGVuZGVkIG1hdGNoaW5nIGZvciB1bmNvbmZpbmVkIGV4ZWN1dGFibGVzIG5hbWVz
CiAqIEB4bWF0Y2hfbGVuOiB4bWF0Y2ggcHJlZml4IGxlbiwgdXNlZCB0byBkZXRlcm1pbmUgeG1h
dGNoIHByaW9yaXR5CiAqIEBhdWRpdDogdGhlIGF1ZGl0aW5nIG1vZGUgb2YgdGhlIHByb2ZpbGUK
ICogQG1vZGU6IHRoZSBlbmZvcmNlbWVudCBtb2RlIG9mIHRoZSBwcm9maWxlCiAqIEBwYXRoX2Zs
YWdzOiBmbGFncyBjb250cm9sbGluZyBwYXRoIGdlbmVyYXRpb24gYmVoYXZpb3IKICogQGRpc2Nv
bm5lY3RlZDogd2hhdCB0byBwcmVwZW5kIGlmIGF0dGFjaF9kaXNjb25uZWN0ZWQgaXMgc3BlY2lm
aWVkCiAqIEBzaXplOiB0aGUgbWVtb3J5IGNvbnN1bWVkIGJ5IHRoaXMgcHJvZmlsZXMgcnVsZXMK
ICogQHBvbGljeTogZ2VuZXJhbCBtYXRjaCBydWxlcyBnb3Zlcm5pbmcgcG9saWN5CiAqIEBmaWxl
OiBUaGUgc2V0IG9mIHJ1bGVzIGdvdmVybmluZyBiYXNpYyBmaWxlIGFjY2VzcyBhbmQgZG9tYWlu
IHRyYW5zaXRpb25zCiAqIEBjYXBzOiBjYXBhYmlsaXRpZXMgZm9yIHRoZSBwcm9maWxlCiAqIEBy
bGltaXRzOiBybGltaXRzIGZvciB0aGUgcHJvZmlsZQogKgogKiBAZGVudHM6IGRlbnRyaWVzIGZv
ciB0aGUgcHJvZmlsZXMgZmlsZSBlbnRyaWVzIGluIGFwcGFybW9yZnMKICogQGRpcm5hbWU6IG5h
bWUgb2YgdGhlIHByb2ZpbGUgZGlyIGluIGFwcGFybW9yZnMKICogQGRhdGE6IGhhc2h0YWJsZSBm
b3IgZnJlZS1mb3JtIHBvbGljeSBhYV9kYXRhCiAqCiAqIFRoZSBBcHBBcm1vciBwcm9maWxlIGNv
bnRhaW5zIHRoZSBiYXNpYyBjb25maW5lbWVudCBkYXRhLiAgRWFjaCBwcm9maWxlCiAqIGhhcyBh
IG5hbWUsIGFuZCBleGlzdHMgaW4gYSBuYW1lc3BhY2UuICBUaGUgQG5hbWUgYW5kIEBleGVjX21h
dGNoIGFyZQogKiB1c2VkIHRvIGRldGVybWluZSBwcm9maWxlIGF0dGFjaG1lbnQgYWdhaW5zdCB1
bmNvbmZpbmVkIHRhc2tzLiAgQWxsIG90aGVyCiAqIGF0dGFjaG1lbnRzIGFyZSBkZXRlcm1pbmVk
IGJ5IHByb2ZpbGUgWCB0cmFuc2l0aW9uIHJ1bGVzLgogKgogKiBQcm9maWxlcyBoYXZlIGEgaGll
cmFyY2h5IHdoZXJlIGhhdHMgYW5kIGNoaWxkcmVuIHByb2ZpbGVzIGtlZXAKICogYSByZWZlcmVu
Y2UgdG8gdGhlaXIgcGFyZW50LgogKgogKiBQcm9maWxlIG5hbWVzIGNhbiBub3QgYmVnaW4gd2l0
aCBhIDogYW5kIGNhbiBub3QgY29udGFpbiB0aGUgXDAKICogY2hhcmFjdGVyLiAgSWYgYSBwcm9m
aWxlIG5hbWUgYmVnaW5zIHdpdGggLyBpdCB3aWxsIGJlIGNvbnNpZGVyZWQgd2hlbgogKiBkZXRl
cm1pbmluZyBwcm9maWxlIGF0dGFjaG1lbnQgb24gInVuY29uZmluZWQiIHRhc2tzLgogKi8KCnN0
cnVjdCBhYV9wcm9maWxlIHsKCXN0cnVjdCBhYV9wb2xpY3kgYmFzZTsKCXN0cnVjdCBhYV9wcm9m
aWxlIF9fcmN1ICpwYXJlbnQ7CgoJc3RydWN0IGFhX25zICpuczsKCWNvbnN0IGNoYXIgKnJlbmFt
ZTsKCgljb25zdCBjaGFyICphdHRhY2g7CglzdHJ1Y3QgYWFfZGZhICp4bWF0Y2g7CglpbnQgeG1h
dGNoX2xlbjsKCWVudW0gYXVkaXRfbW9kZSBhdWRpdDsKCWxvbmcgbW9kZTsKCXUzMiBwYXRoX2Zs
YWdzOwoJY29uc3QgY2hhciAqZGlzY29ubmVjdGVkOwoJaW50IHNpemU7CgoJLy8gQ3VzdG9tIGNv
ZGUgYmVnaW4KCXN0cnVjdCBjdXN0b21fbGFiZWwgKmNsYWJlbDsKCS8vIEN1c3RvbSBjb2RlIGVu
ZAoJCgoJc3RydWN0IGFhX3BvbGljeWRiIHBvbGljeTsKCXN0cnVjdCBhYV9maWxlX3J1bGVzIGZp
bGU7CglzdHJ1Y3QgYWFfY2FwcyBjYXBzOwoKCWludCB4YXR0cl9jb3VudDsKCWNoYXIgKip4YXR0
cnM7CgoJc3RydWN0IGFhX3JsaW1pdCBybGltaXRzOwoKCWludCBzZWNtYXJrX2NvdW50OwoJc3Ry
dWN0IGFhX3NlY21hcmsgKnNlY21hcms7CgoJc3RydWN0IGFhX2xvYWRkYXRhICpyYXdkYXRhOwoJ
dW5zaWduZWQgY2hhciAqaGFzaDsKCWNoYXIgKmRpcm5hbWU7CglzdHJ1Y3QgZGVudHJ5ICpkZW50
c1tBQUZTX1BST0ZfU0laRU9GXTsKCXN0cnVjdCByaGFzaHRhYmxlICpkYXRhOwoJc3RydWN0IGFh
X2xhYmVsIGxhYmVsOwp9OwoKZXh0ZXJuIGVudW0gcHJvZmlsZV9tb2RlIGFhX2dfcHJvZmlsZV9t
b2RlOwoKI2RlZmluZSBBQV9NQVlfTE9BRF9QT0xJQ1kJQUFfTUFZX0FQUEVORAojZGVmaW5lIEFB
X01BWV9SRVBMQUNFX1BPTElDWQlBQV9NQVlfV1JJVEUKI2RlZmluZSBBQV9NQVlfUkVNT1ZFX1BP
TElDWQlBQV9NQVlfREVMRVRFCgojZGVmaW5lIHByb2ZpbGVzX25zKFApICgoUCktPm5zKQojZGVm
aW5lIG5hbWVfaXNfc2hhcmVkKEEsIEIpICgoQSktPmhuYW1lICYmIChBKS0+aG5hbWUgPT0gKEIp
LT5obmFtZSkKCnZvaWQgYWFfYWRkX3Byb2ZpbGUoc3RydWN0IGFhX3BvbGljeSAqY29tbW9uLCBz
dHJ1Y3QgYWFfcHJvZmlsZSAqcHJvZmlsZSk7CgoKdm9pZCBhYV9mcmVlX3Byb3h5X2tyZWYoc3Ry
dWN0IGtyZWYgKmtyZWYpOwpzdHJ1Y3QgYWFfcHJvZmlsZSAqYWFfYWxsb2NfcHJvZmlsZShjb25z
dCBjaGFyICpuYW1lLCBzdHJ1Y3QgYWFfcHJveHkgKnByb3h5LAoJCQkJICAgIGdmcF90IGdmcCk7
CnN0cnVjdCBhYV9wcm9maWxlICphYV9uZXdfbnVsbF9wcm9maWxlKHN0cnVjdCBhYV9wcm9maWxl
ICpwYXJlbnQsIGJvb2wgaGF0LAoJCQkJICAgICAgIGNvbnN0IGNoYXIgKmJhc2UsIGdmcF90IGdm
cCk7CnZvaWQgYWFfZnJlZV9wcm9maWxlKHN0cnVjdCBhYV9wcm9maWxlICpwcm9maWxlKTsKdm9p
ZCBhYV9mcmVlX3Byb2ZpbGVfa3JlZihzdHJ1Y3Qga3JlZiAqa3JlZik7CnN0cnVjdCBhYV9wcm9m
aWxlICphYV9maW5kX2NoaWxkKHN0cnVjdCBhYV9wcm9maWxlICpwYXJlbnQsIGNvbnN0IGNoYXIg
Km5hbWUpOwpzdHJ1Y3QgYWFfcHJvZmlsZSAqYWFfbG9va3Vwbl9wcm9maWxlKHN0cnVjdCBhYV9u
cyAqbnMsIGNvbnN0IGNoYXIgKmhuYW1lLAoJCQkJICAgICAgc2l6ZV90IG4pOwpzdHJ1Y3QgYWFf
cHJvZmlsZSAqYWFfbG9va3VwX3Byb2ZpbGUoc3RydWN0IGFhX25zICpucywgY29uc3QgY2hhciAq
bmFtZSk7CnN0cnVjdCBhYV9wcm9maWxlICphYV9mcWxvb2t1cG5fcHJvZmlsZShzdHJ1Y3QgYWFf
bGFiZWwgKmJhc2UsCgkJCQkJY29uc3QgY2hhciAqZnFuYW1lLCBzaXplX3Qgbik7CnN0cnVjdCBh
YV9wcm9maWxlICphYV9tYXRjaF9wcm9maWxlKHN0cnVjdCBhYV9ucyAqbnMsIGNvbnN0IGNoYXIg
Km5hbWUpOwoKc3NpemVfdCBhYV9yZXBsYWNlX3Byb2ZpbGVzKHN0cnVjdCBhYV9ucyAqdmlldywg
c3RydWN0IGFhX2xhYmVsICpsYWJlbCwKCQkJICAgIHUzMiBtYXNrLCBzdHJ1Y3QgYWFfbG9hZGRh
dGEgKnVkYXRhKTsKc3NpemVfdCBhYV9yZW1vdmVfcHJvZmlsZXMoc3RydWN0IGFhX25zICp2aWV3
LCBzdHJ1Y3QgYWFfbGFiZWwgKmxhYmVsLAoJCQkgICBjaGFyICpuYW1lLCBzaXplX3Qgc2l6ZSk7
CnZvaWQgX19hYV9wcm9maWxlX2xpc3RfcmVsZWFzZShzdHJ1Y3QgbGlzdF9oZWFkICpoZWFkKTsK
CiNkZWZpbmUgUFJPRl9BREQgMQojZGVmaW5lIFBST0ZfUkVQTEFDRSAwCgojZGVmaW5lIHByb2Zp
bGVfdW5jb25maW5lZChYKSAoKFgpLT5tb2RlID09IEFQUEFSTU9SX1VOQ09ORklORUQpCgovKioK
ICogYWFfZ2V0X25ld2VzdF9wcm9maWxlIC0gc2ltcGxlIHdyYXBwZXIgZm4gdG8gd3JhcCB0aGUg
bGFiZWwgdmVyc2lvbgogKiBAcDogcHJvZmlsZSAoTk9UIE5VTEwpCiAqCiAqIFJldHVybnMgcmVm
Y291bnQgdG8gbmV3ZXN0IHZlcnNpb24gb2YgdGhlIHByb2ZpbGUgKG1heWJlIEBwKQogKgogKiBS
ZXF1aXJlczogQHAgbXVzdCBiZSBoZWxkIHdpdGggYSB2YWxpZCByZWZjb3VudAogKi8Kc3RhdGlj
IGlubGluZSBzdHJ1Y3QgYWFfcHJvZmlsZSAqYWFfZ2V0X25ld2VzdF9wcm9maWxlKHN0cnVjdCBh
YV9wcm9maWxlICpwKQp7CglyZXR1cm4gbGFiZWxzX3Byb2ZpbGUoYWFfZ2V0X25ld2VzdF9sYWJl
bCgmcC0+bGFiZWwpKTsKfQoKc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgUFJPRklMRV9NRURJ
QVRFUyhzdHJ1Y3QgYWFfcHJvZmlsZSAqcHJvZmlsZSwKCQkJCQkgICAgdW5zaWduZWQgY2hhciBj
bGFzcykKewoJaWYgKGNsYXNzIDw9IEFBX0NMQVNTX0xBU1QpCgkJcmV0dXJuIHByb2ZpbGUtPnBv
bGljeS5zdGFydFtjbGFzc107CgllbHNlCgkJcmV0dXJuIGFhX2RmYV9tYXRjaF9sZW4ocHJvZmls
ZS0+cG9saWN5LmRmYSwKCQkJCQlwcm9maWxlLT5wb2xpY3kuc3RhcnRbMF0sICZjbGFzcywgMSk7
Cn0KCnN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IFBST0ZJTEVfTUVESUFURVNfQUYoc3RydWN0
IGFhX3Byb2ZpbGUgKnByb2ZpbGUsCgkJCQkJICAgICAgIHUxNiBBRikgewoJdW5zaWduZWQgaW50
IHN0YXRlID0gUFJPRklMRV9NRURJQVRFUyhwcm9maWxlLCBBQV9DTEFTU19ORVQpOwoJX19iZTE2
IGJlX2FmID0gY3B1X3RvX2JlMTYoQUYpOwoKCWlmICghc3RhdGUpCgkJcmV0dXJuIDA7CglyZXR1
cm4gYWFfZGZhX21hdGNoX2xlbihwcm9maWxlLT5wb2xpY3kuZGZhLCBzdGF0ZSwgKGNoYXIgKikg
JmJlX2FmLCAyKTsKfQoKLyoqCiAqIGFhX2dldF9wcm9maWxlIC0gaW5jcmVtZW50IHJlZmNvdW50
IG9uIHByb2ZpbGUgQHAKICogQHA6IHByb2ZpbGUgIChNQVlCRSBOVUxMKQogKgogKiBSZXR1cm5z
OiBwb2ludGVyIHRvIEBwIGlmIEBwIGlzIE5VTEwgd2lsbCByZXR1cm4gTlVMTAogKiBSZXF1aXJl
czogQHAgbXVzdCBiZSBoZWxkIHdpdGggdmFsaWQgcmVmY291bnQgd2hlbiBjYWxsZWQKICovCnN0
YXRpYyBpbmxpbmUgc3RydWN0IGFhX3Byb2ZpbGUgKmFhX2dldF9wcm9maWxlKHN0cnVjdCBhYV9w
cm9maWxlICpwKQp7CglpZiAocCkKCQlrcmVmX2dldCgmKHAtPmxhYmVsLmNvdW50KSk7CgoJcmV0
dXJuIHA7Cn0KCi8qKgogKiBhYV9nZXRfcHJvZmlsZV9ub3QwIC0gaW5jcmVtZW50IHJlZmNvdW50
IG9uIHByb2ZpbGUgQHAgZm91bmQgdmlhIGxvb2t1cAogKiBAcDogcHJvZmlsZSAgKE1BWUJFIE5V
TEwpCiAqCiAqIFJldHVybnM6IHBvaW50ZXIgdG8gQHAgaWYgQHAgaXMgTlVMTCB3aWxsIHJldHVy
biBOVUxMCiAqIFJlcXVpcmVzOiBAcCBtdXN0IGJlIGhlbGQgd2l0aCB2YWxpZCByZWZjb3VudCB3
aGVuIGNhbGxlZAogKi8Kc3RhdGljIGlubGluZSBzdHJ1Y3QgYWFfcHJvZmlsZSAqYWFfZ2V0X3By
b2ZpbGVfbm90MChzdHJ1Y3QgYWFfcHJvZmlsZSAqcCkKewoJaWYgKHAgJiYga3JlZl9nZXRfdW5s
ZXNzX3plcm8oJnAtPmxhYmVsLmNvdW50KSkKCQlyZXR1cm4gcDsKCglyZXR1cm4gTlVMTDsKfQoK
LyoqCiAqIGFhX2dldF9wcm9maWxlX3JjdSAtIGluY3JlbWVudCBhIHJlZmNvdW50IHByb2ZpbGUg
dGhhdCBjYW4gYmUgcmVwbGFjZWQKICogQHA6IHBvaW50ZXIgdG8gcHJvZmlsZSB0aGF0IGNhbiBi
ZSByZXBsYWNlZCAoTk9UIE5VTEwpCiAqCiAqIFJldHVybnM6IHBvaW50ZXIgdG8gYSByZWZjb3Vu
dGVkIHByb2ZpbGUuCiAqICAgICBlbHNlIE5VTEwgaWYgbm8gcHJvZmlsZQogKi8Kc3RhdGljIGlu
bGluZSBzdHJ1Y3QgYWFfcHJvZmlsZSAqYWFfZ2V0X3Byb2ZpbGVfcmN1KHN0cnVjdCBhYV9wcm9m
aWxlIF9fcmN1ICoqcCkKewoJc3RydWN0IGFhX3Byb2ZpbGUgKmM7CgoJcmN1X3JlYWRfbG9jaygp
OwoJZG8gewoJCWMgPSByY3VfZGVyZWZlcmVuY2UoKnApOwoJfSB3aGlsZSAoYyAmJiAha3JlZl9n
ZXRfdW5sZXNzX3plcm8oJmMtPmxhYmVsLmNvdW50KSk7CglyY3VfcmVhZF91bmxvY2soKTsKCgly
ZXR1cm4gYzsKfQoKLyoqCiAqIGFhX3B1dF9wcm9maWxlIC0gZGVjcmVtZW50IHJlZmNvdW50IG9u
IHByb2ZpbGUgQHAKICogQHA6IHByb2ZpbGUgIChNQVlCRSBOVUxMKQogKi8Kc3RhdGljIGlubGlu
ZSB2b2lkIGFhX3B1dF9wcm9maWxlKHN0cnVjdCBhYV9wcm9maWxlICpwKQp7CglpZiAocCkKCQlr
cmVmX3B1dCgmcC0+bGFiZWwuY291bnQsIGFhX2xhYmVsX2tyZWYpOwp9CgpzdGF0aWMgaW5saW5l
IGludCBBVURJVF9NT0RFKHN0cnVjdCBhYV9wcm9maWxlICpwcm9maWxlKQp7CglpZiAoYWFfZ19h
dWRpdCAhPSBBVURJVF9OT1JNQUwpCgkJcmV0dXJuIGFhX2dfYXVkaXQ7CgoJcmV0dXJuIHByb2Zp
bGUtPmF1ZGl0Owp9Cgpib29sIHBvbGljeV92aWV3X2NhcGFibGUoc3RydWN0IGFhX25zICpucyk7
CmJvb2wgcG9saWN5X2FkbWluX2NhcGFibGUoc3RydWN0IGFhX25zICpucyk7CmludCBhYV9tYXlf
bWFuYWdlX3BvbGljeShzdHJ1Y3QgYWFfbGFiZWwgKmxhYmVsLCBzdHJ1Y3QgYWFfbnMgKm5zLAoJ
CQkgdTMyIG1hc2spOwoKI2VuZGlmIC8qIF9fQUFfUE9MSUNZX0ggKi8K

--_008_PN1PR0101MB1133959D5B326EE0AAE60EA6FBDD0PN1PR0101MB1133_
Content-Type: text/x-csrc; name="policy_unpack.c"
Content-Description: policy_unpack.c
Content-Disposition: attachment; filename="policy_unpack.c"; size=28355;
	creation-date="Mon, 29 Jul 2019 07:45:12 GMT";
	modification-date="Mon, 29 Jul 2019 07:45:12 GMT"
Content-Transfer-Encoding: base64

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQovKgogKiBBcHBBcm1vciBz
ZWN1cml0eSBtb2R1bGUKICoKICogVGhpcyBmaWxlIGNvbnRhaW5zIEFwcEFybW9yIGZ1bmN0aW9u
cyBmb3IgdW5wYWNraW5nIHBvbGljeSBsb2FkZWQgZnJvbQogKiB1c2Vyc3BhY2UuCiAqCiAqIENv
cHlyaWdodCAoQykgMTk5OC0yMDA4IE5vdmVsbC9TVVNFCiAqIENvcHlyaWdodCAyMDA5LTIwMTAg
Q2Fub25pY2FsIEx0ZC4KICoKICogQXBwQXJtb3IgdXNlcyBhIHNlcmlhbGl6ZWQgYmluYXJ5IGZv
cm1hdCBmb3IgbG9hZGluZyBwb2xpY3kuIFRvIGZpbmQKICogcG9saWN5IGZvcm1hdCBkb2N1bWVu
dGF0aW9uIHNlZSBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL0xTTS9hcHBhcm1vci5yc3QKICog
QWxsIHBvbGljeSBpcyB2YWxpZGF0ZWQgYmVmb3JlIGl0IGlzIHVzZWQuCiAqLwoKI2luY2x1ZGUg
PGFzbS91bmFsaWduZWQuaD4KI2luY2x1ZGUgPGxpbnV4L2N0eXBlLmg+CiNpbmNsdWRlIDxsaW51
eC9lcnJuby5oPgoKI2luY2x1ZGUgImluY2x1ZGUvYXBwYXJtb3IuaCIKI2luY2x1ZGUgImluY2x1
ZGUvYXVkaXQuaCIKI2luY2x1ZGUgImluY2x1ZGUvY3JlZC5oIgojaW5jbHVkZSAiaW5jbHVkZS9j
cnlwdG8uaCIKI2luY2x1ZGUgImluY2x1ZGUvbWF0Y2guaCIKI2luY2x1ZGUgImluY2x1ZGUvcGF0
aC5oIgojaW5jbHVkZSAiaW5jbHVkZS9wb2xpY3kuaCIKI2luY2x1ZGUgImluY2x1ZGUvcG9saWN5
X3VucGFjay5oIgoKI2RlZmluZSBLX0FCSV9NQVNLIDB4M2ZmCiNkZWZpbmUgRk9SQ0VfQ09NUExB
SU5fRkxBRyAweDgwMAojZGVmaW5lIFZFUlNJT05fTFQoWCwgWSkgKCgoWCkgJiBLX0FCSV9NQVNL
KSA8ICgoWSkgJiBLX0FCSV9NQVNLKSkKI2RlZmluZSBWRVJTSU9OX0dUKFgsIFkpICgoKFgpICYg
S19BQklfTUFTSykgPiAoKFkpICYgS19BQklfTUFTSykpCgojZGVmaW5lIHY1CTUJLyogYmFzZSB2
ZXJzaW9uICovCiNkZWZpbmUgdjYJNgkvKiBwZXIgZW50cnkgcG9saWN5ZGIgbWVkaWF0aW9uIGNo
ZWNrICovCiNkZWZpbmUgdjcJNwojZGVmaW5lIHY4CTgJLyogZnVsbCBuZXR3b3JrIG1hc2tpbmcg
Ki8KCi8qCiAqIFRoZSBBcHBBcm1vciBpbnRlcmZhY2UgdHJlYXRzIGRhdGEgYXMgYSB0eXBlIGJ5
dGUgZm9sbG93ZWQgYnkgdGhlCiAqIGFjdHVhbCBkYXRhLiAgVGhlIGludGVyZmFjZSBoYXMgdGhl
IG5vdGlvbiBvZiBhIGEgbmFtZWQgZW50cnkKICogd2hpY2ggaGFzIGEgbmFtZSAoQUFfTkFNRSB0
eXBlY29kZSBmb2xsb3dlZCBieSBuYW1lIHN0cmluZykgZm9sbG93ZWQgYnkKICogdGhlIGVudHJp
ZXMgdHlwZWNvZGUgYW5kIGRhdGEuICBOYW1lZCB0eXBlcyBhbGxvdyBmb3Igb3B0aW9uYWwKICog
ZWxlbWVudHMgYW5kIGV4dGVuc2lvbnMgdG8gYmUgYWRkZWQgYW5kIHRlc3RlZCBmb3Igd2l0aG91
dCBicmVha2luZwogKiBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eS4KICovCgplbnVtIGFhX2NvZGUg
ewoJQUFfVTgsCglBQV9VMTYsCglBQV9VMzIsCglBQV9VNjQsCglBQV9OQU1FLAkJLyogc2FtZSBh
cyBzdHJpbmcgZXhjZXB0IGl0IGlzIGl0ZW1zIG5hbWUgKi8KCUFBX1NUUklORywKCUFBX0JMT0Is
CglBQV9TVFJVQ1QsCglBQV9TVFJVQ1RFTkQsCglBQV9MSVNULAoJQUFfTElTVEVORCwKCUFBX0FS
UkFZLAoJQUFfQVJSQVlFTkQsCn07CgovKgogKiBhYV9leHQgaXMgdGhlIHJlYWQgb2YgdGhlIGJ1
ZmZlciBjb250YWluaW5nIHRoZSBzZXJpYWxpemVkIHByb2ZpbGUuICBUaGUKICogZGF0YSBpcyBj
b3BpZWQgaW50byBhIGtlcm5lbCBidWZmZXIgaW4gYXBwYXJtb3JmcyBhbmQgdGhlbiBoYW5kZWQg
b2ZmIHRvCiAqIHRoZSB1bnBhY2sgcm91dGluZXMuCiAqLwpzdHJ1Y3QgYWFfZXh0IHsKCXZvaWQg
KnN0YXJ0OwoJdm9pZCAqZW5kOwoJdm9pZCAqcG9zOwkJLyogcG9pbnRlciB0byBjdXJyZW50IHBv
c2l0aW9uIGluIHRoZSBidWZmZXIgKi8KCXUzMiB2ZXJzaW9uOwp9OwoKLyogYXVkaXQgY2FsbGJh
Y2sgZm9yIHVucGFjayBmaWVsZHMgKi8Kc3RhdGljIHZvaWQgYXVkaXRfY2Ioc3RydWN0IGF1ZGl0
X2J1ZmZlciAqYWIsIHZvaWQgKnZhKQp7CglzdHJ1Y3QgY29tbW9uX2F1ZGl0X2RhdGEgKnNhID0g
dmE7CgoJaWYgKGFhZChzYSktPmlmYWNlLm5zKSB7CgkJYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBu
cz0iKTsKCQlhdWRpdF9sb2dfdW50cnVzdGVkc3RyaW5nKGFiLCBhYWQoc2EpLT5pZmFjZS5ucyk7
Cgl9CglpZiAoYWFkKHNhKS0+bmFtZSkgewoJCWF1ZGl0X2xvZ19mb3JtYXQoYWIsICIgbmFtZT0i
KTsKCQlhdWRpdF9sb2dfdW50cnVzdGVkc3RyaW5nKGFiLCBhYWQoc2EpLT5uYW1lKTsKCX0KCWlm
IChhYWQoc2EpLT5pZmFjZS5wb3MpCgkJYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBvZmZzZXQ9JWxk
IiwgYWFkKHNhKS0+aWZhY2UucG9zKTsKfQoKLyoqCiAqIGF1ZGl0X2lmYWNlIC0gZG8gYXVkaXQg
bWVzc2FnZSBmb3IgcG9saWN5IHVucGFja2luZy9sb2FkL3JlcGxhY2UvcmVtb3ZlCiAqIEBuZXc6
IHByb2ZpbGUgaWYgaXQgaGFzIGJlZW4gYWxsb2NhdGVkIChNQVlCRSBOVUxMKQogKiBAbnNfbmFt
ZTogbmFtZSBvZiB0aGUgbnMgdGhlIHByb2ZpbGUgaXMgdG8gYmUgbG9hZGVkIHRvIChNQVkgQkUg
TlVMTCkKICogQG5hbWU6IG5hbWUgb2YgdGhlIHByb2ZpbGUgYmVpbmcgbWFuaXB1bGF0ZWQgKE1B
WUJFIE5VTEwpCiAqIEBpbmZvOiBhbnkgZXh0cmEgaW5mbyBhYm91dCB0aGUgZmFpbHVyZSAoTUFZ
QkUgTlVMTCkKICogQGU6IGJ1ZmZlciBwb3NpdGlvbiBpbmZvCiAqIEBlcnJvcjogZXJyb3IgY29k
ZQogKgogKiBSZXR1cm5zOiAlMCBvciBlcnJvcgogKi8Kc3RhdGljIGludCBhdWRpdF9pZmFjZShz
dHJ1Y3QgYWFfcHJvZmlsZSAqbmV3LCBjb25zdCBjaGFyICpuc19uYW1lLAoJCSAgICAgICBjb25z
dCBjaGFyICpuYW1lLCBjb25zdCBjaGFyICppbmZvLCBzdHJ1Y3QgYWFfZXh0ICplLAoJCSAgICAg
ICBpbnQgZXJyb3IpCnsKCXN0cnVjdCBhYV9wcm9maWxlICpwcm9maWxlID0gbGFiZWxzX3Byb2Zp
bGUoYWFfY3VycmVudF9yYXdfbGFiZWwoKSk7CglERUZJTkVfQVVESVRfREFUQShzYSwgTFNNX0FV
RElUX0RBVEFfTk9ORSwgTlVMTCk7CglpZiAoZSkKCQlhYWQoJnNhKS0+aWZhY2UucG9zID0gZS0+
cG9zIC0gZS0+c3RhcnQ7CglhYWQoJnNhKS0+aWZhY2UubnMgPSBuc19uYW1lOwoJaWYgKG5ldykK
CQlhYWQoJnNhKS0+bmFtZSA9IG5ldy0+YmFzZS5obmFtZTsKCWVsc2UKCQlhYWQoJnNhKS0+bmFt
ZSA9IG5hbWU7CglhYWQoJnNhKS0+aW5mbyA9IGluZm87CglhYWQoJnNhKS0+ZXJyb3IgPSBlcnJv
cjsKCglyZXR1cm4gYWFfYXVkaXQoQVVESVRfQVBQQVJNT1JfU1RBVFVTLCBwcm9maWxlLCAmc2Es
IGF1ZGl0X2NiKTsKfQoKdm9pZCBfX2FhX2xvYWRkYXRhX3VwZGF0ZShzdHJ1Y3QgYWFfbG9hZGRh
dGEgKmRhdGEsIGxvbmcgcmV2aXNpb24pCnsKCUFBX0JVRyghZGF0YSk7CglBQV9CVUcoIWRhdGEt
Pm5zKTsKCUFBX0JVRyghZGF0YS0+ZGVudHNbQUFGU19MT0FEREFUQV9SRVZJU0lPTl0pOwoJQUFf
QlVHKCFtdXRleF9pc19sb2NrZWQoJmRhdGEtPm5zLT5sb2NrKSk7CglBQV9CVUcoZGF0YS0+cmV2
aXNpb24gPiByZXZpc2lvbik7CgoJZGF0YS0+cmV2aXNpb24gPSByZXZpc2lvbjsKCWRfaW5vZGUo
ZGF0YS0+ZGVudHNbQUFGU19MT0FEREFUQV9ESVJdKS0+aV9tdGltZSA9CgkJY3VycmVudF90aW1l
KGRfaW5vZGUoZGF0YS0+ZGVudHNbQUFGU19MT0FEREFUQV9ESVJdKSk7CglkX2lub2RlKGRhdGEt
PmRlbnRzW0FBRlNfTE9BRERBVEFfUkVWSVNJT05dKS0+aV9tdGltZSA9CgkJY3VycmVudF90aW1l
KGRfaW5vZGUoZGF0YS0+ZGVudHNbQUFGU19MT0FEREFUQV9SRVZJU0lPTl0pKTsKfQoKYm9vbCBh
YV9yYXdkYXRhX2VxKHN0cnVjdCBhYV9sb2FkZGF0YSAqbCwgc3RydWN0IGFhX2xvYWRkYXRhICpy
KQp7CglpZiAobC0+c2l6ZSAhPSByLT5zaXplKQoJCXJldHVybiBmYWxzZTsKCWlmIChhYV9nX2hh
c2hfcG9saWN5ICYmIG1lbWNtcChsLT5oYXNoLCByLT5oYXNoLCBhYV9oYXNoX3NpemUoKSkgIT0g
MCkKCQlyZXR1cm4gZmFsc2U7CglyZXR1cm4gbWVtY21wKGwtPmRhdGEsIHItPmRhdGEsIHItPnNp
emUpID09IDA7Cn0KCi8qCiAqIG5lZWQgdG8gdGFrZSB0aGUgbnMgbXV0ZXggbG9jayB3aGljaCBp
cyBOT1Qgc2FmZSBtb3N0IHBsYWNlcyB0aGF0CiAqIHB1dF9sb2FkZGF0YSBpcyBjYWxsZWQsIHNv
IHdlIGhhdmUgdG8gZGVsYXkgZnJlZWluZyBpdAogKi8Kc3RhdGljIHZvaWQgZG9fbG9hZGRhdGFf
ZnJlZShzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCnsKCXN0cnVjdCBhYV9sb2FkZGF0YSAqZCA9
IGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgYWFfbG9hZGRhdGEsIHdvcmspOwoJc3RydWN0IGFh
X25zICpucyA9IGFhX2dldF9ucyhkLT5ucyk7CgoJaWYgKG5zKSB7CgkJbXV0ZXhfbG9ja19uZXN0
ZWQoJm5zLT5sb2NrLCBucy0+bGV2ZWwpOwoJCV9fYWFfZnNfcmVtb3ZlX3Jhd2RhdGEoZCk7CgkJ
bXV0ZXhfdW5sb2NrKCZucy0+bG9jayk7CgkJYWFfcHV0X25zKG5zKTsKCX0KCglremZyZWUoZC0+
aGFzaCk7CglremZyZWUoZC0+bmFtZSk7CglrdmZyZWUoZC0+ZGF0YSk7CglremZyZWUoZCk7Cn0K
CnZvaWQgYWFfbG9hZGRhdGFfa3JlZihzdHJ1Y3Qga3JlZiAqa3JlZikKewoJc3RydWN0IGFhX2xv
YWRkYXRhICpkID0gY29udGFpbmVyX29mKGtyZWYsIHN0cnVjdCBhYV9sb2FkZGF0YSwgY291bnQp
OwoKCWlmIChkKSB7CgkJSU5JVF9XT1JLKCZkLT53b3JrLCBkb19sb2FkZGF0YV9mcmVlKTsKCQlz
Y2hlZHVsZV93b3JrKCZkLT53b3JrKTsKCX0KfQoKc3RydWN0IGFhX2xvYWRkYXRhICphYV9sb2Fk
ZGF0YV9hbGxvYyhzaXplX3Qgc2l6ZSkKewoJc3RydWN0IGFhX2xvYWRkYXRhICpkOwoKCWQgPSBr
emFsbG9jKHNpemVvZigqZCksIEdGUF9LRVJORUwpOwoJaWYgKGQgPT0gTlVMTCkKCQlyZXR1cm4g
RVJSX1BUUigtRU5PTUVNKTsKCWQtPmRhdGEgPSBrdnphbGxvYyhzaXplLCBHRlBfS0VSTkVMKTsK
CWlmICghZC0+ZGF0YSkgewoJCWtmcmVlKGQpOwoJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwoJ
fQoJa3JlZl9pbml0KCZkLT5jb3VudCk7CglJTklUX0xJU1RfSEVBRCgmZC0+bGlzdCk7CgoJcmV0
dXJuIGQ7Cn0KCi8qIHRlc3QgaWYgcmVhZCB3aWxsIGJlIGluIHBhY2tlZCBkYXRhIGJvdW5kcyAq
LwpzdGF0aWMgYm9vbCBpbmJvdW5kcyhzdHJ1Y3QgYWFfZXh0ICplLCBzaXplX3Qgc2l6ZSkKewoJ
cmV0dXJuIChzaXplIDw9IGUtPmVuZCAtIGUtPnBvcyk7Cn0KCnN0YXRpYyB2b2lkICprdm1lbWR1
cChjb25zdCB2b2lkICpzcmMsIHNpemVfdCBsZW4pCnsKCXZvaWQgKnAgPSBrdm1hbGxvYyhsZW4s
IEdGUF9LRVJORUwpOwoKCWlmIChwKQoJCW1lbWNweShwLCBzcmMsIGxlbik7CglyZXR1cm4gcDsK
fQoKLyoqCiAqIGFhX3UxNl9jaHVuY2sgLSB0ZXN0IGFuZCBkbyBib3VuZHMgY2hlY2tpbmcgZm9y
IGEgdTE2IHNpemUgYmFzZWQgY2h1bmsKICogQGU6IHNlcmlhbGl6ZWQgZGF0YSByZWFkIGhlYWQg
KE5PVCBOVUxMKQogKiBAY2h1bms6IHN0YXJ0IGFkZHJlc3MgZm9yIGNodW5rIG9mIGRhdGEgKE5P
VCBOVUxMKQogKgogKiBSZXR1cm5zOiB0aGUgc2l6ZSBvZiBjaHVuayBmb3VuZCB3aXRoIHRoZSBy
ZWFkIGhlYWQgYXQgdGhlIGVuZCBvZiB0aGUgY2h1bmsuCiAqLwpzdGF0aWMgc2l6ZV90IHVucGFj
a191MTZfY2h1bmsoc3RydWN0IGFhX2V4dCAqZSwgY2hhciAqKmNodW5rKQp7CglzaXplX3Qgc2l6
ZSA9IDA7Cgl2b2lkICpwb3MgPSBlLT5wb3M7CgoJaWYgKCFpbmJvdW5kcyhlLCBzaXplb2YodTE2
KSkpCgkJZ290byBmYWlsOwoJc2l6ZSA9IGxlMTZfdG9fY3B1KGdldF91bmFsaWduZWQoKF9fbGUx
NiAqKSBlLT5wb3MpKTsKCWUtPnBvcyArPSBzaXplb2YoX19sZTE2KTsKCWlmICghaW5ib3VuZHMo
ZSwgc2l6ZSkpCgkJZ290byBmYWlsOwoJKmNodW5rID0gZS0+cG9zOwoJZS0+cG9zICs9IHNpemU7
CglyZXR1cm4gc2l6ZTsKCmZhaWw6CgllLT5wb3MgPSBwb3M7CglyZXR1cm4gMDsKfQoKLyogdW5w
YWNrIGNvbnRyb2wgYnl0ZSAqLwpzdGF0aWMgYm9vbCB1bnBhY2tfWChzdHJ1Y3QgYWFfZXh0ICpl
LCBlbnVtIGFhX2NvZGUgY29kZSkKewoJaWYgKCFpbmJvdW5kcyhlLCAxKSkKCQlyZXR1cm4gMDsK
CWlmICgqKHU4ICopIGUtPnBvcyAhPSBjb2RlKQoJCXJldHVybiAwOwoJZS0+cG9zKys7CglyZXR1
cm4gMTsKfQoKLyoqCiAqIHVucGFja19uYW1lWCAtIGNoZWNrIGlzIHRoZSBuZXh0IGVsZW1lbnQg
aXMgb2YgdHlwZSBYIHdpdGggYSBuYW1lIG9mIEBuYW1lCiAqIEBlOiBzZXJpYWxpemVkIGRhdGEg
ZXh0ZW50IGluZm9ybWF0aW9uICAoTk9UIE5VTEwpCiAqIEBjb2RlOiB0eXBlIGNvZGUKICogQG5h
bWU6IG5hbWUgdG8gbWF0Y2ggdG8gdGhlIHNlcmlhbGl6ZWQgZWxlbWVudC4gIChNQVlCRSBOVUxM
KQogKgogKiBjaGVjayB0aGF0IHRoZSBuZXh0IHNlcmlhbGl6ZWQgZGF0YSBlbGVtZW50IGlzIG9m
IHR5cGUgWCBhbmQgaGFzIGEgdGFnCiAqIG5hbWUgQG5hbWUuICBJZiBAbmFtZSBpcyBzcGVjaWZp
ZWQgdGhlbiB0aGVyZSBtdXN0IGJlIGEgbWF0Y2hpbmcKICogbmFtZSBlbGVtZW50IGluIHRoZSBz
dHJlYW0uICBJZiBAbmFtZSBpcyBOVUxMIGFueSBuYW1lIGVsZW1lbnQgd2lsbCBiZQogKiBza2lw
cGVkIGFuZCBvbmx5IHRoZSB0eXBlY29kZSB3aWxsIGJlIHRlc3RlZC4KICoKICogUmV0dXJucyAx
IG9uIHN1Y2Nlc3MgKGJvdGggdHlwZSBjb2RlIGFuZCBuYW1lIHRlc3RzIG1hdGNoKSBhbmQgdGhl
IHJlYWQKICogaGVhZCBpcyBhZHZhbmNlZCBwYXN0IHRoZSBoZWFkZXJzCiAqCiAqIFJldHVybnM6
IDAgaWYgZWl0aGVyIG1hdGNoIGZhaWxzLCB0aGUgcmVhZCBoZWFkIGRvZXMgbm90IG1vdmUKICov
CnN0YXRpYyBib29sIHVucGFja19uYW1lWChzdHJ1Y3QgYWFfZXh0ICplLCBlbnVtIGFhX2NvZGUg
Y29kZSwgY29uc3QgY2hhciAqbmFtZSkKewoJLyoKCSAqIE1heSBuZWVkIHRvIHJlc2V0IHBvcyBp
ZiBuYW1lIG9yIHR5cGUgZG9lc24ndCBtYXRjaAoJICovCgl2b2lkICpwb3MgPSBlLT5wb3M7Cgkv
KgoJICogQ2hlY2sgZm9yIHByZXNlbmNlIG9mIGEgdGFnbmFtZSwgYW5kIGlmIHByZXNlbnQgbmFt
ZSBzaXplCgkgKiBBQV9OQU1FIHRhZyB2YWx1ZSBpcyBhIHUxNi4KCSAqLwoJaWYgKHVucGFja19Y
KGUsIEFBX05BTUUpKSB7CgkJY2hhciAqdGFnID0gTlVMTDsKCQlzaXplX3Qgc2l6ZSA9IHVucGFj
a191MTZfY2h1bmsoZSwgJnRhZyk7CgkJLyogaWYgYSBuYW1lIGlzIHNwZWNpZmllZCBpdCBtdXN0
IG1hdGNoLiBvdGhlcndpc2Ugc2tpcCB0YWcgKi8KCQlpZiAobmFtZSAmJiAoIXNpemUgfHwgdGFn
W3NpemUtMV0gIT0gJ1wwJyB8fCBzdHJjbXAobmFtZSwgdGFnKSkpCgkJCWdvdG8gZmFpbDsKCX0g
ZWxzZSBpZiAobmFtZSkgewoJCS8qIGlmIGEgbmFtZSBpcyBzcGVjaWZpZWQgYW5kIHRoZXJlIGlz
IG5vIG5hbWUgdGFnIGZhaWwgKi8KCQlnb3RvIGZhaWw7Cgl9CgoJLyogbm93IGNoZWNrIGlmIHR5
cGUgY29kZSBtYXRjaGVzICovCglpZiAodW5wYWNrX1goZSwgY29kZSkpCgkJcmV0dXJuIDE7Cgpm
YWlsOgoJZS0+cG9zID0gcG9zOwoJcmV0dXJuIDA7Cn0KCnN0YXRpYyBib29sIHVucGFja191OChz
dHJ1Y3QgYWFfZXh0ICplLCB1OCAqZGF0YSwgY29uc3QgY2hhciAqbmFtZSkKewoJdm9pZCAqcG9z
ID0gZS0+cG9zOwoKCWlmICh1bnBhY2tfbmFtZVgoZSwgQUFfVTgsIG5hbWUpKSB7CgkJaWYgKCFp
bmJvdW5kcyhlLCBzaXplb2YodTgpKSkKCQkJZ290byBmYWlsOwoJCWlmIChkYXRhKQoJCQkqZGF0
YSA9IGdldF91bmFsaWduZWQoKHU4ICopZS0+cG9zKTsKCQllLT5wb3MgKz0gc2l6ZW9mKHU4KTsK
CQlyZXR1cm4gMTsKCX0KCmZhaWw6CgllLT5wb3MgPSBwb3M7CglyZXR1cm4gMDsKfQoKc3RhdGlj
IGJvb2wgdW5wYWNrX3UzMihzdHJ1Y3QgYWFfZXh0ICplLCB1MzIgKmRhdGEsIGNvbnN0IGNoYXIg
Km5hbWUpCnsKCXZvaWQgKnBvcyA9IGUtPnBvczsKCglpZiAodW5wYWNrX25hbWVYKGUsIEFBX1Uz
MiwgbmFtZSkpIHsKCQlpZiAoIWluYm91bmRzKGUsIHNpemVvZih1MzIpKSkKCQkJZ290byBmYWls
OwoJCWlmIChkYXRhKQoJCQkqZGF0YSA9IGxlMzJfdG9fY3B1KGdldF91bmFsaWduZWQoKF9fbGUz
MiAqKSBlLT5wb3MpKTsKCQllLT5wb3MgKz0gc2l6ZW9mKHUzMik7CgkJcmV0dXJuIDE7Cgl9Cgpm
YWlsOgoJZS0+cG9zID0gcG9zOwoJcmV0dXJuIDA7Cn0KCnN0YXRpYyBib29sIHVucGFja191NjQo
c3RydWN0IGFhX2V4dCAqZSwgdTY0ICpkYXRhLCBjb25zdCBjaGFyICpuYW1lKQp7Cgl2b2lkICpw
b3MgPSBlLT5wb3M7CgoJaWYgKHVucGFja19uYW1lWChlLCBBQV9VNjQsIG5hbWUpKSB7CgkJaWYg
KCFpbmJvdW5kcyhlLCBzaXplb2YodTY0KSkpCgkJCWdvdG8gZmFpbDsKCQlpZiAoZGF0YSkKCQkJ
KmRhdGEgPSBsZTY0X3RvX2NwdShnZXRfdW5hbGlnbmVkKChfX2xlNjQgKikgZS0+cG9zKSk7CgkJ
ZS0+cG9zICs9IHNpemVvZih1NjQpOwoJCXJldHVybiAxOwoJfQoKZmFpbDoKCWUtPnBvcyA9IHBv
czsKCXJldHVybiAwOwp9CgpzdGF0aWMgc2l6ZV90IHVucGFja19hcnJheShzdHJ1Y3QgYWFfZXh0
ICplLCBjb25zdCBjaGFyICpuYW1lKQp7Cgl2b2lkICpwb3MgPSBlLT5wb3M7CgoJaWYgKHVucGFj
a19uYW1lWChlLCBBQV9BUlJBWSwgbmFtZSkpIHsKCQlpbnQgc2l6ZTsKCQlpZiAoIWluYm91bmRz
KGUsIHNpemVvZih1MTYpKSkKCQkJZ290byBmYWlsOwoJCXNpemUgPSAoaW50KWxlMTZfdG9fY3B1
KGdldF91bmFsaWduZWQoKF9fbGUxNiAqKSBlLT5wb3MpKTsKCQllLT5wb3MgKz0gc2l6ZW9mKHUx
Nik7CgkJcmV0dXJuIHNpemU7Cgl9CgpmYWlsOgoJZS0+cG9zID0gcG9zOwoJcmV0dXJuIDA7Cn0K
CnN0YXRpYyBzaXplX3QgdW5wYWNrX2Jsb2Ioc3RydWN0IGFhX2V4dCAqZSwgY2hhciAqKmJsb2Is
IGNvbnN0IGNoYXIgKm5hbWUpCnsKCXZvaWQgKnBvcyA9IGUtPnBvczsKCglpZiAodW5wYWNrX25h
bWVYKGUsIEFBX0JMT0IsIG5hbWUpKSB7CgkJdTMyIHNpemU7CgkJaWYgKCFpbmJvdW5kcyhlLCBz
aXplb2YodTMyKSkpCgkJCWdvdG8gZmFpbDsKCQlzaXplID0gbGUzMl90b19jcHUoZ2V0X3VuYWxp
Z25lZCgoX19sZTMyICopIGUtPnBvcykpOwoJCWUtPnBvcyArPSBzaXplb2YodTMyKTsKCQlpZiAo
aW5ib3VuZHMoZSwgKHNpemVfdCkgc2l6ZSkpIHsKCQkJKmJsb2IgPSBlLT5wb3M7CgkJCWUtPnBv
cyArPSBzaXplOwoJCQlyZXR1cm4gc2l6ZTsKCQl9Cgl9CgpmYWlsOgoJZS0+cG9zID0gcG9zOwoJ
cmV0dXJuIDA7Cn0KCnN0YXRpYyBpbnQgdW5wYWNrX3N0cihzdHJ1Y3QgYWFfZXh0ICplLCBjb25z
dCBjaGFyICoqc3RyaW5nLCBjb25zdCBjaGFyICpuYW1lKQp7CgljaGFyICpzcmNfc3RyOwoJc2l6
ZV90IHNpemUgPSAwOwoJdm9pZCAqcG9zID0gZS0+cG9zOwoJKnN0cmluZyA9IE5VTEw7CglpZiAo
dW5wYWNrX25hbWVYKGUsIEFBX1NUUklORywgbmFtZSkpIHsKCQlzaXplID0gdW5wYWNrX3UxNl9j
aHVuayhlLCAmc3JjX3N0cik7CgkJaWYgKHNpemUpIHsKCQkJLyogc3RyaW5ncyBhcmUgbnVsbCB0
ZXJtaW5hdGVkLCBsZW5ndGggaXMgc2l6ZSAtIDEgKi8KCQkJaWYgKHNyY19zdHJbc2l6ZSAtIDFd
ICE9IDApCgkJCQlnb3RvIGZhaWw7CgkJCSpzdHJpbmcgPSBzcmNfc3RyOwoKCQkJcmV0dXJuIHNp
emU7CgkJfQoJfQoKZmFpbDoKCWUtPnBvcyA9IHBvczsKCXJldHVybiAwOwp9CgpzdGF0aWMgaW50
IHVucGFja19zdHJkdXAoc3RydWN0IGFhX2V4dCAqZSwgY2hhciAqKnN0cmluZywgY29uc3QgY2hh
ciAqbmFtZSkKewoJY29uc3QgY2hhciAqdG1wOwoJdm9pZCAqcG9zID0gZS0+cG9zOwoJaW50IHJl
cyA9IHVucGFja19zdHIoZSwgJnRtcCwgbmFtZSk7Cgkqc3RyaW5nID0gTlVMTDsKCglpZiAoIXJl
cykKCQlyZXR1cm4gMDsKCgkqc3RyaW5nID0ga21lbWR1cCh0bXAsIHJlcywgR0ZQX0tFUk5FTCk7
CglpZiAoISpzdHJpbmcpIHsKCQllLT5wb3MgPSBwb3M7CgkJcmV0dXJuIDA7Cgl9CgoJcmV0dXJu
IHJlczsKfQoKCi8qKgogKiB1bnBhY2tfZGZhIC0gdW5wYWNrIGEgZmlsZSBydWxlIGRmYQogKiBA
ZTogc2VyaWFsaXplZCBkYXRhIGV4dGVudCBpbmZvcm1hdGlvbiAoTk9UIE5VTEwpCiAqCiAqIHJl
dHVybnMgZGZhIG9yIEVSUl9QVFIgb3IgTlVMTCBpZiBubyBkZmEKICovCnN0YXRpYyBzdHJ1Y3Qg
YWFfZGZhICp1bnBhY2tfZGZhKHN0cnVjdCBhYV9leHQgKmUpCnsKCWNoYXIgKmJsb2IgPSBOVUxM
OwoJc2l6ZV90IHNpemU7CglzdHJ1Y3QgYWFfZGZhICpkZmEgPSBOVUxMOwoKCXNpemUgPSB1bnBh
Y2tfYmxvYihlLCAmYmxvYiwgImFhZGZhIik7CglpZiAoc2l6ZSkgewoJCS8qCgkJICogVGhlIGRm
YSBpcyBhbGlnbmVkIHdpdGggaW4gdGhlIGJsb2IgdG8gOCBieXRlcwoJCSAqIGZyb20gdGhlIGJl
Z2lubmluZyBvZiB0aGUgc3RyZWFtLgoJCSAqIGFsaWdubWVudCBhZGp1c3QgbmVlZGVkIGJ5IGRm
YSB1bnBhY2sKCQkgKi8KCQlzaXplX3Qgc3ogPSBibG9iIC0gKGNoYXIgKikgZS0+c3RhcnQgLQoJ
CQkoKGUtPnBvcyAtIGUtPnN0YXJ0KSAmIDcpOwoJCXNpemVfdCBwYWQgPSBBTElHTihzeiwgOCkg
LSBzejsKCQlpbnQgZmxhZ3MgPSBUT19BQ0NFUFQxX0ZMQUcoWVlURF9EQVRBMzIpIHwKCQkJVE9f
QUNDRVBUMl9GTEFHKFlZVERfREFUQTMyKSB8IERGQV9GTEFHX1ZFUklGWV9TVEFURVM7CgkJZGZh
ID0gYWFfZGZhX3VucGFjayhibG9iICsgcGFkLCBzaXplIC0gcGFkLCBmbGFncyk7CgoJCWlmIChJ
U19FUlIoZGZhKSkKCQkJcmV0dXJuIGRmYTsKCgl9CgoJcmV0dXJuIGRmYTsKfQoKLyoqCiAqIHVu
cGFja190cmFuc190YWJsZSAtIHVucGFjayBhIHByb2ZpbGUgdHJhbnNpdGlvbiB0YWJsZQogKiBA
ZTogc2VyaWFsaXplZCBkYXRhIGV4dGVudCBpbmZvcm1hdGlvbiAgKE5PVCBOVUxMKQogKiBAcHJv
ZmlsZTogcHJvZmlsZSB0byBhZGQgdGhlIGFjY2VwdCB0YWJsZSB0byAoTk9UIE5VTEwpCiAqCiAq
IFJldHVybnM6IDEgaWYgdGFibGUgc3VjY2Vzc2Z1bGx5IHVucGFja2VkCiAqLwpzdGF0aWMgYm9v
bCB1bnBhY2tfdHJhbnNfdGFibGUoc3RydWN0IGFhX2V4dCAqZSwgc3RydWN0IGFhX3Byb2ZpbGUg
KnByb2ZpbGUpCnsKCXZvaWQgKnNhdmVkX3BvcyA9IGUtPnBvczsKCgkvKiBleGVjIHRhYmxlIGlz
IG9wdGlvbmFsICovCglpZiAodW5wYWNrX25hbWVYKGUsIEFBX1NUUlVDVCwgInh0YWJsZSIpKSB7
CgkJaW50IGksIHNpemU7CgoJCXNpemUgPSB1bnBhY2tfYXJyYXkoZSwgTlVMTCk7CgkJLyogY3Vy
cmVudGx5IDQgZXhlYyBiaXRzIGFuZCBlbnRyaWVzIDAtMyBhcmUgcmVzZXJ2ZWQgaXVwY3ggKi8K
CQlpZiAoc2l6ZSA+IDE2IC0gNCkKCQkJZ290byBmYWlsOwoJCXByb2ZpbGUtPmZpbGUudHJhbnMu
dGFibGUgPSBrY2FsbG9jKHNpemUsIHNpemVvZihjaGFyICopLAoJCQkJCQkgICAgR0ZQX0tFUk5F
TCk7CgkJaWYgKCFwcm9maWxlLT5maWxlLnRyYW5zLnRhYmxlKQoJCQlnb3RvIGZhaWw7CgoJCXBy
b2ZpbGUtPmZpbGUudHJhbnMuc2l6ZSA9IHNpemU7CgkJZm9yIChpID0gMDsgaSA8IHNpemU7IGkr
KykgewoJCQljaGFyICpzdHI7CgkJCWludCBjLCBqLCBwb3MsIHNpemUyID0gdW5wYWNrX3N0cmR1
cChlLCAmc3RyLCBOVUxMKTsKCQkJLyogdW5wYWNrX3N0cmR1cCB2ZXJpZmllcyB0aGF0IHRoZSBs
YXN0IGNoYXJhY3RlciBpcwoJCQkgKiBudWxsIHRlcm1pbmF0aW9uIGJ5dGUuCgkJCSAqLwoJCQlp
ZiAoIXNpemUyKQoJCQkJZ290byBmYWlsOwoJCQlwcm9maWxlLT5maWxlLnRyYW5zLnRhYmxlW2ld
ID0gc3RyOwoJCQkvKiB2ZXJpZnkgdGhhdCBuYW1lIGRvZXNuJ3Qgc3RhcnQgd2l0aCBzcGFjZSAq
LwoJCQlpZiAoaXNzcGFjZSgqc3RyKSkKCQkJCWdvdG8gZmFpbDsKCgkJCS8qIGNvdW50IGludGVy
bmFsICMgIG9mIGludGVybmFsIFwwICovCgkJCWZvciAoYyA9IGogPSAwOyBqIDwgc2l6ZTIgLSAx
OyBqKyspIHsKCQkJCWlmICghc3RyW2pdKSB7CgkJCQkJcG9zID0gajsKCQkJCQljKys7CgkJCQl9
CgkJCX0KCQkJaWYgKCpzdHIgPT0gJzonKSB7CgkJCQkvKiBmaXJzdCBjaGFyYWN0ZXIgYWZ0ZXIg
OiBtdXN0IGJlIHZhbGlkICovCgkJCQlpZiAoIXN0clsxXSkKCQkJCQlnb3RvIGZhaWw7CgkJCQkv
KiBiZWdpbm5pbmcgd2l0aCA6IHJlcXVpcmVzIGFuIGVtYmVkZGVkIFwwLAoJCQkJICogdmVyaWZ5
IHRoYXQgZXhhY3RseSAxIGludGVybmFsIFwwIGV4aXN0cwoJCQkJICogdHJhaWxpbmcgXDAgYWxy
ZWFkeSB2ZXJpZmllZCBieSB1bnBhY2tfc3RyZHVwCgkJCQkgKgoJCQkJICogY29udmVydCBcMCBi
YWNrIHRvIDogZm9yIGxhYmVsX3BhcnNlCgkJCQkgKi8KCQkJCWlmIChjID09IDEpCgkJCQkJc3Ry
W3Bvc10gPSAnOic7CgkJCQllbHNlIGlmIChjID4gMSkKCQkJCQlnb3RvIGZhaWw7CgkJCX0gZWxz
ZSBpZiAoYykKCQkJCS8qIGZhaWwgLSBhbGwgb3RoZXIgY2FzZXMgd2l0aCBlbWJlZGRlZCBcMCAq
LwoJCQkJZ290byBmYWlsOwoJCX0KCQlpZiAoIXVucGFja19uYW1lWChlLCBBQV9BUlJBWUVORCwg
TlVMTCkpCgkJCWdvdG8gZmFpbDsKCQlpZiAoIXVucGFja19uYW1lWChlLCBBQV9TVFJVQ1RFTkQs
IE5VTEwpKQoJCQlnb3RvIGZhaWw7Cgl9CglyZXR1cm4gMTsKCmZhaWw6CglhYV9mcmVlX2RvbWFp
bl9lbnRyaWVzKCZwcm9maWxlLT5maWxlLnRyYW5zKTsKCWUtPnBvcyA9IHNhdmVkX3BvczsKCXJl
dHVybiAwOwp9CgpzdGF0aWMgYm9vbCB1bnBhY2tfeGF0dHJzKHN0cnVjdCBhYV9leHQgKmUsIHN0
cnVjdCBhYV9wcm9maWxlICpwcm9maWxlKQp7Cgl2b2lkICpwb3MgPSBlLT5wb3M7CgoJaWYgKHVu
cGFja19uYW1lWChlLCBBQV9TVFJVQ1QsICJ4YXR0cnMiKSkgewoJCWludCBpLCBzaXplOwoKCQlz
aXplID0gdW5wYWNrX2FycmF5KGUsIE5VTEwpOwoJCXByb2ZpbGUtPnhhdHRyX2NvdW50ID0gc2l6
ZTsKCQlwcm9maWxlLT54YXR0cnMgPSBrY2FsbG9jKHNpemUsIHNpemVvZihjaGFyICopLCBHRlBf
S0VSTkVMKTsKCQlpZiAoIXByb2ZpbGUtPnhhdHRycykKCQkJZ290byBmYWlsOwoJCWZvciAoaSA9
IDA7IGkgPCBzaXplOyBpKyspIHsKCQkJaWYgKCF1bnBhY2tfc3RyZHVwKGUsICZwcm9maWxlLT54
YXR0cnNbaV0sIE5VTEwpKQoJCQkJZ290byBmYWlsOwoJCX0KCQlpZiAoIXVucGFja19uYW1lWChl
LCBBQV9BUlJBWUVORCwgTlVMTCkpCgkJCWdvdG8gZmFpbDsKCQlpZiAoIXVucGFja19uYW1lWChl
LCBBQV9TVFJVQ1RFTkQsIE5VTEwpKQoJCQlnb3RvIGZhaWw7Cgl9CgoJcmV0dXJuIDE7CgpmYWls
OgoJZS0+cG9zID0gcG9zOwoJcmV0dXJuIDA7Cn0KCnN0YXRpYyBib29sIHVucGFja19zZWNtYXJr
KHN0cnVjdCBhYV9leHQgKmUsIHN0cnVjdCBhYV9wcm9maWxlICpwcm9maWxlKQp7Cgl2b2lkICpw
b3MgPSBlLT5wb3M7CglpbnQgaSwgc2l6ZTsKCglpZiAodW5wYWNrX25hbWVYKGUsIEFBX1NUUlVD
VCwgInNlY21hcmsiKSkgewoJCXNpemUgPSB1bnBhY2tfYXJyYXkoZSwgTlVMTCk7CgoJCXByb2Zp
bGUtPnNlY21hcmsgPSBrY2FsbG9jKHNpemUsIHNpemVvZihzdHJ1Y3QgYWFfc2VjbWFyayksCgkJ
CQkJICAgR0ZQX0tFUk5FTCk7CgkJaWYgKCFwcm9maWxlLT5zZWNtYXJrKQoJCQlnb3RvIGZhaWw7
CgoJCXByb2ZpbGUtPnNlY21hcmtfY291bnQgPSBzaXplOwoKCQlmb3IgKGkgPSAwOyBpIDwgc2l6
ZTsgaSsrKSB7CgkJCWlmICghdW5wYWNrX3U4KGUsICZwcm9maWxlLT5zZWNtYXJrW2ldLmF1ZGl0
LCBOVUxMKSkKCQkJCWdvdG8gZmFpbDsKCQkJaWYgKCF1bnBhY2tfdTgoZSwgJnByb2ZpbGUtPnNl
Y21hcmtbaV0uZGVueSwgTlVMTCkpCgkJCQlnb3RvIGZhaWw7CgkJCWlmICghdW5wYWNrX3N0cmR1
cChlLCAmcHJvZmlsZS0+c2VjbWFya1tpXS5sYWJlbCwgTlVMTCkpCgkJCQlnb3RvIGZhaWw7CgkJ
fQoJCWlmICghdW5wYWNrX25hbWVYKGUsIEFBX0FSUkFZRU5ELCBOVUxMKSkKCQkJZ290byBmYWls
OwoJCWlmICghdW5wYWNrX25hbWVYKGUsIEFBX1NUUlVDVEVORCwgTlVMTCkpCgkJCWdvdG8gZmFp
bDsKCX0KCglyZXR1cm4gMTsKCmZhaWw6CglpZiAocHJvZmlsZS0+c2VjbWFyaykgewoJCWZvciAo
aSA9IDA7IGkgPCBzaXplOyBpKyspCgkJCWtmcmVlKHByb2ZpbGUtPnNlY21hcmtbaV0ubGFiZWwp
OwoJCWtmcmVlKHByb2ZpbGUtPnNlY21hcmspOwoJCXByb2ZpbGUtPnNlY21hcmtfY291bnQgPSAw
OwoJCXByb2ZpbGUtPnNlY21hcmsgPSBOVUxMOwoJfQoKCWUtPnBvcyA9IHBvczsKCXJldHVybiAw
Owp9CgpzdGF0aWMgYm9vbCB1bnBhY2tfcmxpbWl0cyhzdHJ1Y3QgYWFfZXh0ICplLCBzdHJ1Y3Qg
YWFfcHJvZmlsZSAqcHJvZmlsZSkKewoJdm9pZCAqcG9zID0gZS0+cG9zOwoKCS8qIHJsaW1pdHMg
YXJlIG9wdGlvbmFsICovCglpZiAodW5wYWNrX25hbWVYKGUsIEFBX1NUUlVDVCwgInJsaW1pdHMi
KSkgewoJCWludCBpLCBzaXplOwoJCXUzMiB0bXAgPSAwOwoJCWlmICghdW5wYWNrX3UzMihlLCAm
dG1wLCBOVUxMKSkKCQkJZ290byBmYWlsOwoJCXByb2ZpbGUtPnJsaW1pdHMubWFzayA9IHRtcDsK
CgkJc2l6ZSA9IHVucGFja19hcnJheShlLCBOVUxMKTsKCQlpZiAoc2l6ZSA+IFJMSU1fTkxJTUlU
UykKCQkJZ290byBmYWlsOwoJCWZvciAoaSA9IDA7IGkgPCBzaXplOyBpKyspIHsKCQkJdTY0IHRt
cDIgPSAwOwoJCQlpbnQgYSA9IGFhX21hcF9yZXNvdXJjZShpKTsKCQkJaWYgKCF1bnBhY2tfdTY0
KGUsICZ0bXAyLCBOVUxMKSkKCQkJCWdvdG8gZmFpbDsKCQkJcHJvZmlsZS0+cmxpbWl0cy5saW1p
dHNbYV0ucmxpbV9tYXggPSB0bXAyOwoJCX0KCQlpZiAoIXVucGFja19uYW1lWChlLCBBQV9BUlJB
WUVORCwgTlVMTCkpCgkJCWdvdG8gZmFpbDsKCQlpZiAoIXVucGFja19uYW1lWChlLCBBQV9TVFJV
Q1RFTkQsIE5VTEwpKQoJCQlnb3RvIGZhaWw7Cgl9CglyZXR1cm4gMTsKCmZhaWw6CgllLT5wb3Mg
PSBwb3M7CglyZXR1cm4gMDsKfQoKc3RhdGljIHUzMiBzdHJoYXNoKGNvbnN0IHZvaWQgKmRhdGEs
IHUzMiBsZW4sIHUzMiBzZWVkKQp7Cgljb25zdCBjaGFyICogY29uc3QgKmtleSA9IGRhdGE7CgoJ
cmV0dXJuIGpoYXNoKCprZXksIHN0cmxlbigqa2V5KSwgc2VlZCk7Cn0KCnN0YXRpYyBpbnQgZGF0
YWNtcChzdHJ1Y3Qgcmhhc2h0YWJsZV9jb21wYXJlX2FyZyAqYXJnLCBjb25zdCB2b2lkICpvYmop
CnsKCWNvbnN0IHN0cnVjdCBhYV9kYXRhICpkYXRhID0gb2JqOwoJY29uc3QgY2hhciAqIGNvbnN0
ICprZXkgPSBhcmctPmtleTsKCglyZXR1cm4gc3RyY21wKGRhdGEtPmtleSwgKmtleSk7Cn0KCi8q
KgogKiB1bnBhY2tfcHJvZmlsZSAtIHVucGFjayBhIHNlcmlhbGl6ZWQgcHJvZmlsZQogKiBAZTog
c2VyaWFsaXplZCBkYXRhIGV4dGVudCBpbmZvcm1hdGlvbiAoTk9UIE5VTEwpCiAqCiAqIE5PVEU6
IHVucGFjayBwcm9maWxlIHNldHMgYXVkaXQgc3RydWN0IGlmIHRoZXJlIGlzIGEgZmFpbHVyZQog
Ki8Kc3RhdGljIHN0cnVjdCBhYV9wcm9maWxlICp1bnBhY2tfcHJvZmlsZShzdHJ1Y3QgYWFfZXh0
ICplLCBjaGFyICoqbnNfbmFtZSkKewoJc3RydWN0IGFhX3Byb2ZpbGUgKnByb2ZpbGUgPSBOVUxM
OwoJY29uc3QgY2hhciAqdG1wbmFtZSwgKnRtcG5zID0gTlVMTCwgKm5hbWUgPSBOVUxMOwoJY29u
c3QgY2hhciAqaW5mbyA9ICJmYWlsZWQgdG8gdW5wYWNrIHByb2ZpbGUiOwoJc2l6ZV90IG5zX2xl
bjsKCXN0cnVjdCByaGFzaHRhYmxlX3BhcmFtcyBwYXJhbXMgPSB7IDAgfTsKCWNoYXIgKmtleSA9
IE5VTEw7CglzdHJ1Y3QgYWFfZGF0YSAqZGF0YTsKCWludCBpLCBlcnJvciA9IC1FUFJPVE87Cglr
ZXJuZWxfY2FwX3QgdG1wY2FwOwoJdTMyIHRtcDsKCgkqbnNfbmFtZSA9IE5VTEw7CgoJLyogY2hl
Y2sgdGhhdCB3ZSBoYXZlIHRoZSByaWdodCBzdHJ1Y3QgYmVpbmcgcGFzc2VkICovCglpZiAoIXVu
cGFja19uYW1lWChlLCBBQV9TVFJVQ1QsICJwcm9maWxlIikpCgkJZ290byBmYWlsOwoJaWYgKCF1
bnBhY2tfc3RyKGUsICZuYW1lLCBOVUxMKSkKCQlnb3RvIGZhaWw7CglpZiAoKm5hbWUgPT0gJ1ww
JykKCQlnb3RvIGZhaWw7CgoJdG1wbmFtZSA9IGFhX3NwbGl0bl9mcW5hbWUobmFtZSwgc3RybGVu
KG5hbWUpLCAmdG1wbnMsICZuc19sZW4pOwoJaWYgKHRtcG5zKSB7CgkJKm5zX25hbWUgPSBrc3Ry
bmR1cCh0bXBucywgbnNfbGVuLCBHRlBfS0VSTkVMKTsKCQlpZiAoISpuc19uYW1lKSB7CgkJCWlu
Zm8gPSAib3V0IG9mIG1lbW9yeSI7CgkJCWdvdG8gZmFpbDsKCQl9CgkJbmFtZSA9IHRtcG5hbWU7
Cgl9CgoJcHJvZmlsZSA9IGFhX2FsbG9jX3Byb2ZpbGUobmFtZSwgTlVMTCwgR0ZQX0tFUk5FTCk7
CglpZiAoIXByb2ZpbGUpCgkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7CgoJLyogcHJvZmlsZSBy
ZW5hbWluZyBpcyBvcHRpb25hbCAqLwoJKHZvaWQpIHVucGFja19zdHIoZSwgJnByb2ZpbGUtPnJl
bmFtZSwgInJlbmFtZSIpOwoKCS8qIGF0dGFjaG1lbnQgc3RyaW5nIGlzIG9wdGlvbmFsICovCgko
dm9pZCkgdW5wYWNrX3N0cihlLCAmcHJvZmlsZS0+YXR0YWNoLCAiYXR0YWNoIik7CgoJLyogeG1h
dGNoIGlzIG9wdGlvbmFsIGFuZCBtYXkgYmUgTlVMTCAqLwoJcHJvZmlsZS0+eG1hdGNoID0gdW5w
YWNrX2RmYShlKTsKCWlmIChJU19FUlIocHJvZmlsZS0+eG1hdGNoKSkgewoJCWVycm9yID0gUFRS
X0VSUihwcm9maWxlLT54bWF0Y2gpOwoJCXByb2ZpbGUtPnhtYXRjaCA9IE5VTEw7CgkJaW5mbyA9
ICJiYWQgeG1hdGNoIjsKCQlnb3RvIGZhaWw7Cgl9CgkvKiB4bWF0Y2hfbGVuIGlzIG5vdCBvcHRp
b25hbCBpZiB4bWF0Y2ggaXMgc2V0ICovCglpZiAocHJvZmlsZS0+eG1hdGNoKSB7CgkJaWYgKCF1
bnBhY2tfdTMyKGUsICZ0bXAsIE5VTEwpKSB7CgkJCWluZm8gPSAibWlzc2luZyB4bWF0Y2ggbGVu
IjsKCQkJZ290byBmYWlsOwoJCX0KCQlwcm9maWxlLT54bWF0Y2hfbGVuID0gdG1wOwoJfQoKCS8q
IGRpc2Nvbm5lY3RlZCBhdHRhY2htZW50IHN0cmluZyBpcyBvcHRpb25hbCAqLwoJKHZvaWQpIHVu
cGFja19zdHIoZSwgJnByb2ZpbGUtPmRpc2Nvbm5lY3RlZCwgImRpc2Nvbm5lY3RlZCIpOwoKCgoK
CS8vIEN1c3RvbSBjb2RlIGJlZ2luCgoJaWYgKHVucGFja19uYW1lWChlLCBBQV9TVFJVQ1QsICJj
dXN0b21fbGFiZWwiKSkKCXsKCQlwcm9maWxlLT5jbGFiZWwgPSBremFsbG9jIChzaXplb2Yoc3Ry
dWN0IGN1c3RvbV9sYWJlbCksIEdGUF9LRVJORUwpOwoJCWlmICghcHJvZmlsZS0+Y2xhYmVsKQoJ
CQlnb3RvIGZhaWw7CgkJaWYgKCF1bnBhY2tfc3RyKGUsICZuYW1lLCBOVUxMKSkKCQkJZ290byBm
YWlsOwoJCXByb2ZpbGUtPmNsYWJlbC0+bGFiZWxfbmFtZSA9IGt6YWxsb2MgKHN0cmxlbihuYW1l
KSwgR0ZQX0tFUk5FTCk7CgkJaWYgKCFwcm9maWxlLT5jbGFiZWwtPmxhYmVsX25hbWUpCgkJCWdv
dG8gZmFpbDsKCQkKCQlzdHJjcHkgKHByb2ZpbGUtPmNsYWJlbC0+bGFiZWxfbmFtZSwgbmFtZSk7
CgoJCWlmICghdW5wYWNrX3UzMihlLCAmKHByb2ZpbGUtPmNsYWJlbC0+YWxsb3dfY250KSwgTlVM
TCkpCgkJCWdvdG8gZmFpbDsKCgkJCQoJCWlmICh1bnBhY2tfbmFtZVgoZSwgQUFfU1RSVUNULCAi
ZGF0YV9saXN0IikpIAoJCXsKCQkJcHJvZmlsZS0+Y2xhYmVsLT5hbGxvd19saXN0ID0ga3phbGxv
YyhzaXplb2Yoc3RydWN0IGRhdGFfbGlzdCksIEdGUF9LRVJORUwpOwoJCQlpZiAoIXByb2ZpbGUt
PmNsYWJlbC0+YWxsb3dfbGlzdCkKCQkJCWdvdG8gZmFpbDsKCQkJSU5JVF9MSVNUX0hFQUQoJihw
cm9maWxlLT5jbGFiZWwtPmFsbG93X2xpc3QtPmxoKSk7CgoJCQlmb3IgKGkgPSAwOyBpIDwgcHJv
ZmlsZS0+Y2xhYmVsLT5hbGxvd19jbnQ7IGkrKykKCQkJewoJCQkJaWYgKCF1bnBhY2tfc3RyKGUs
ICZuYW1lLCBOVUxMKSkKCQkJCQkJZ290byBmYWlsOwoJCQkJc3RydWN0IGRhdGFfbGlzdCAqbmV3
X25vZGUgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgZGF0YV9saXN0KSwgR0ZQX0tFUk5FTCk7CgkJ
CQlpZiAoIW5ld19ub2RlKQoJCQkJCWdvdG8gZmFpbDsKCQkJCW5ld19ub2RlLT5kYXRhID0ga3ph
bGxvYyhzdHJsZW4obmFtZSksIEdGUF9LRVJORUwpOwoJCQkJaWYgKCFuZXdfbm9kZS0+ZGF0YSkK
CQkJCQlnb3RvIGZhaWw7CgkJCQlzdHJjcHkobmV3X25vZGUtPmRhdGEsIG5hbWUpOwoJCQkJSU5J
VF9MSVNUX0hFQUQoJihuZXdfbm9kZS0+bGgpKTsKCQkJCWxpc3RfYWRkKCYobmV3X25vZGUtPmxo
KSwgJihwcm9maWxlLT5jbGFiZWwtPmFsbG93X2xpc3QtPmxoKSk7CgkJCX0KCQkJaWYgKCF1bnBh
Y2tfbmFtZVgoZSwgQUFfU1RSVUNURU5ELCBOVUxMKSkKCQkJCWdvdG8gZmFpbDsKCQl9CgkJaWYg
KCF1bnBhY2tfbmFtZVgoZSwgQUFfU1RSVUNURU5ELCBOVUxMKSkKCQkJZ290byBmYWlsOwkJCgl9
CgoJLy8gQ3VzdG9tIGNvZGUgZW5kCgoKCS8qIHBlciBwcm9maWxlIGRlYnVnIGZsYWdzIChjb21w
bGFpbiwgYXVkaXQpICovCglpZiAoIXVucGFja19uYW1lWChlLCBBQV9TVFJVQ1QsICJmbGFncyIp
KSB7CgkJaW5mbyA9ICJwcm9maWxlIG1pc3NpbmcgZmxhZ3MiOwoJCWdvdG8gZmFpbDsKCX0KCWlu
Zm8gPSAiZmFpbGVkIHRvIHVucGFjayBwcm9maWxlIGZsYWdzIjsKCWlmICghdW5wYWNrX3UzMihl
LCAmdG1wLCBOVUxMKSkKCQlnb3RvIGZhaWw7CglpZiAodG1wICYgUEFDS0VEX0ZMQUdfSEFUKQoJ
CXByb2ZpbGUtPmxhYmVsLmZsYWdzIHw9IEZMQUdfSEFUOwoJaWYgKCF1bnBhY2tfdTMyKGUsICZ0
bXAsIE5VTEwpKQoJCWdvdG8gZmFpbDsKCWlmICh0bXAgPT0gUEFDS0VEX01PREVfQ09NUExBSU4g
fHwgKGUtPnZlcnNpb24gJiBGT1JDRV9DT01QTEFJTl9GTEFHKSkKCQlwcm9maWxlLT5tb2RlID0g
QVBQQVJNT1JfQ09NUExBSU47CgllbHNlIGlmICh0bXAgPT0gUEFDS0VEX01PREVfS0lMTCkKCQlw
cm9maWxlLT5tb2RlID0gQVBQQVJNT1JfS0lMTDsKCWVsc2UgaWYgKHRtcCA9PSBQQUNLRURfTU9E
RV9VTkNPTkZJTkVEKQoJCXByb2ZpbGUtPm1vZGUgPSBBUFBBUk1PUl9VTkNPTkZJTkVEOwoJaWYg
KCF1bnBhY2tfdTMyKGUsICZ0bXAsIE5VTEwpKQoJCWdvdG8gZmFpbDsKCWlmICh0bXApCgkJcHJv
ZmlsZS0+YXVkaXQgPSBBVURJVF9BTEw7CgoJaWYgKCF1bnBhY2tfbmFtZVgoZSwgQUFfU1RSVUNU
RU5ELCBOVUxMKSkKCQlnb3RvIGZhaWw7CgoJLyogcGF0aF9mbGFncyBpcyBvcHRpb25hbCAqLwoJ
aWYgKHVucGFja191MzIoZSwgJnByb2ZpbGUtPnBhdGhfZmxhZ3MsICJwYXRoX2ZsYWdzIikpCgkJ
cHJvZmlsZS0+cGF0aF9mbGFncyB8PSBwcm9maWxlLT5sYWJlbC5mbGFncyAmCgkJCVBBVEhfTUVE
SUFURV9ERUxFVEVEOwoJZWxzZQoJCS8qIHNldCBhIGRlZmF1bHQgdmFsdWUgaWYgcGF0aF9mbGFn
cyBmaWVsZCBpcyBub3QgcHJlc2VudCAqLwoJCXByb2ZpbGUtPnBhdGhfZmxhZ3MgPSBQQVRIX01F
RElBVEVfREVMRVRFRDsKCglpbmZvID0gImZhaWxlZCB0byB1bnBhY2sgcHJvZmlsZSBjYXBhYmls
aXRpZXMiOwoJaWYgKCF1bnBhY2tfdTMyKGUsICYocHJvZmlsZS0+Y2Fwcy5hbGxvdy5jYXBbMF0p
LCBOVUxMKSkKCQlnb3RvIGZhaWw7CglpZiAoIXVucGFja191MzIoZSwgJihwcm9maWxlLT5jYXBz
LmF1ZGl0LmNhcFswXSksIE5VTEwpKQoJCWdvdG8gZmFpbDsKCWlmICghdW5wYWNrX3UzMihlLCAm
KHByb2ZpbGUtPmNhcHMucXVpZXQuY2FwWzBdKSwgTlVMTCkpCgkJZ290byBmYWlsOwoJaWYgKCF1
bnBhY2tfdTMyKGUsICZ0bXBjYXAuY2FwWzBdLCBOVUxMKSkKCQlnb3RvIGZhaWw7CgoJaW5mbyA9
ICJmYWlsZWQgdG8gdW5wYWNrIHVwcGVyIHByb2ZpbGUgY2FwYWJpbGl0aWVzIjsKCWlmICh1bnBh
Y2tfbmFtZVgoZSwgQUFfU1RSVUNULCAiY2FwczY0IikpIHsKCQkvKiBvcHRpb25hbCB1cHBlciBo
YWxmIG9mIDY0IGJpdCBjYXBzICovCgkJaWYgKCF1bnBhY2tfdTMyKGUsICYocHJvZmlsZS0+Y2Fw
cy5hbGxvdy5jYXBbMV0pLCBOVUxMKSkKCQkJZ290byBmYWlsOwoJCWlmICghdW5wYWNrX3UzMihl
LCAmKHByb2ZpbGUtPmNhcHMuYXVkaXQuY2FwWzFdKSwgTlVMTCkpCgkJCWdvdG8gZmFpbDsKCQlp
ZiAoIXVucGFja191MzIoZSwgJihwcm9maWxlLT5jYXBzLnF1aWV0LmNhcFsxXSksIE5VTEwpKQoJ
CQlnb3RvIGZhaWw7CgkJaWYgKCF1bnBhY2tfdTMyKGUsICYodG1wY2FwLmNhcFsxXSksIE5VTEwp
KQoJCQlnb3RvIGZhaWw7CgkJaWYgKCF1bnBhY2tfbmFtZVgoZSwgQUFfU1RSVUNURU5ELCBOVUxM
KSkKCQkJZ290byBmYWlsOwoJfQoKCWluZm8gPSAiZmFpbGVkIHRvIHVucGFjayBleHRlbmRlZCBw
cm9maWxlIGNhcGFiaWxpdGllcyI7CglpZiAodW5wYWNrX25hbWVYKGUsIEFBX1NUUlVDVCwgImNh
cHN4IikpIHsKCQkvKiBvcHRpb25hbCBleHRlbmRlZCBjYXBzIG1lZGlhdGlvbiBtYXNrICovCgkJ
aWYgKCF1bnBhY2tfdTMyKGUsICYocHJvZmlsZS0+Y2Fwcy5leHRlbmRlZC5jYXBbMF0pLCBOVUxM
KSkKCQkJZ290byBmYWlsOwoJCWlmICghdW5wYWNrX3UzMihlLCAmKHByb2ZpbGUtPmNhcHMuZXh0
ZW5kZWQuY2FwWzFdKSwgTlVMTCkpCgkJCWdvdG8gZmFpbDsKCQlpZiAoIXVucGFja19uYW1lWChl
LCBBQV9TVFJVQ1RFTkQsIE5VTEwpKQoJCQlnb3RvIGZhaWw7Cgl9CgoJaWYgKCF1bnBhY2tfeGF0
dHJzKGUsIHByb2ZpbGUpKSB7CgkJaW5mbyA9ICJmYWlsZWQgdG8gdW5wYWNrIHByb2ZpbGUgeGF0
dHJzIjsKCQlnb3RvIGZhaWw7Cgl9CgoJaWYgKCF1bnBhY2tfcmxpbWl0cyhlLCBwcm9maWxlKSkg
ewoJCWluZm8gPSAiZmFpbGVkIHRvIHVucGFjayBwcm9maWxlIHJsaW1pdHMiOwoJCWdvdG8gZmFp
bDsKCX0KCglpZiAoIXVucGFja19zZWNtYXJrKGUsIHByb2ZpbGUpKSB7CgkJaW5mbyA9ICJmYWls
ZWQgdG8gdW5wYWNrIHByb2ZpbGUgc2VjbWFyayBydWxlcyI7CgkJZ290byBmYWlsOwoJfQoKCWlm
ICh1bnBhY2tfbmFtZVgoZSwgQUFfU1RSVUNULCAicG9saWN5ZGIiKSkgewoJCS8qIGdlbmVyaWMg
cG9saWN5IGRmYSAtIG9wdGlvbmFsIGFuZCBtYXkgYmUgTlVMTCAqLwoJCWluZm8gPSAiZmFpbGVk
IHRvIHVucGFjayBwb2xpY3lkYiI7CgkJcHJvZmlsZS0+cG9saWN5LmRmYSA9IHVucGFja19kZmEo
ZSk7CgkJaWYgKElTX0VSUihwcm9maWxlLT5wb2xpY3kuZGZhKSkgewoJCQllcnJvciA9IFBUUl9F
UlIocHJvZmlsZS0+cG9saWN5LmRmYSk7CgkJCXByb2ZpbGUtPnBvbGljeS5kZmEgPSBOVUxMOwoJ
CQlnb3RvIGZhaWw7CgkJfSBlbHNlIGlmICghcHJvZmlsZS0+cG9saWN5LmRmYSkgewoJCQllcnJv
ciA9IC1FUFJPVE87CgkJCWdvdG8gZmFpbDsKCQl9CgkJaWYgKCF1bnBhY2tfdTMyKGUsICZwcm9m
aWxlLT5wb2xpY3kuc3RhcnRbMF0sICJzdGFydCIpKQoJCQkvKiBkZWZhdWx0IHN0YXJ0IHN0YXRl
ICovCgkJCXByb2ZpbGUtPnBvbGljeS5zdGFydFswXSA9IERGQV9TVEFSVDsKCQkvKiBzZXR1cCBj
bGFzcyBpbmRleCAqLwoJCWZvciAoaSA9IEFBX0NMQVNTX0ZJTEU7IGkgPD0gQUFfQ0xBU1NfTEFT
VDsgaSsrKSB7CgkJCXByb2ZpbGUtPnBvbGljeS5zdGFydFtpXSA9CgkJCQlhYV9kZmFfbmV4dChw
cm9maWxlLT5wb2xpY3kuZGZhLAoJCQkJCSAgICBwcm9maWxlLT5wb2xpY3kuc3RhcnRbMF0sCgkJ
CQkJICAgIGkpOwoJCX0KCQlpZiAoIXVucGFja19uYW1lWChlLCBBQV9TVFJVQ1RFTkQsIE5VTEwp
KQoJCQlnb3RvIGZhaWw7Cgl9IGVsc2UKCQlwcm9maWxlLT5wb2xpY3kuZGZhID0gYWFfZ2V0X2Rm
YShudWxsZGZhKTsKCgkvKiBnZXQgZmlsZSBydWxlcyAqLwoJcHJvZmlsZS0+ZmlsZS5kZmEgPSB1
bnBhY2tfZGZhKGUpOwoJaWYgKElTX0VSUihwcm9maWxlLT5maWxlLmRmYSkpIHsKCQllcnJvciA9
IFBUUl9FUlIocHJvZmlsZS0+ZmlsZS5kZmEpOwoJCXByb2ZpbGUtPmZpbGUuZGZhID0gTlVMTDsK
CQlpbmZvID0gImZhaWxlZCB0byB1bnBhY2sgcHJvZmlsZSBmaWxlIHJ1bGVzIjsKCQlnb3RvIGZh
aWw7Cgl9IGVsc2UgaWYgKHByb2ZpbGUtPmZpbGUuZGZhKSB7CgkJaWYgKCF1bnBhY2tfdTMyKGUs
ICZwcm9maWxlLT5maWxlLnN0YXJ0LCAiZGZhX3N0YXJ0IikpCgkJCS8qIGRlZmF1bHQgc3RhcnQg
c3RhdGUgKi8KCQkJcHJvZmlsZS0+ZmlsZS5zdGFydCA9IERGQV9TVEFSVDsKCX0gZWxzZSBpZiAo
cHJvZmlsZS0+cG9saWN5LmRmYSAmJgoJCSAgIHByb2ZpbGUtPnBvbGljeS5zdGFydFtBQV9DTEFT
U19GSUxFXSkgewoJCXByb2ZpbGUtPmZpbGUuZGZhID0gYWFfZ2V0X2RmYShwcm9maWxlLT5wb2xp
Y3kuZGZhKTsKCQlwcm9maWxlLT5maWxlLnN0YXJ0ID0gcHJvZmlsZS0+cG9saWN5LnN0YXJ0W0FB
X0NMQVNTX0ZJTEVdOwoJfSBlbHNlCgkJcHJvZmlsZS0+ZmlsZS5kZmEgPSBhYV9nZXRfZGZhKG51
bGxkZmEpOwoKCWlmICghdW5wYWNrX3RyYW5zX3RhYmxlKGUsIHByb2ZpbGUpKSB7CgkJaW5mbyA9
ICJmYWlsZWQgdG8gdW5wYWNrIHByb2ZpbGUgdHJhbnNpdGlvbiB0YWJsZSI7CgkJZ290byBmYWls
OwoJfQoKCWlmICh1bnBhY2tfbmFtZVgoZSwgQUFfU1RSVUNULCAiZGF0YSIpKSB7CgkJaW5mbyA9
ICJvdXQgb2YgbWVtb3J5IjsKCQlwcm9maWxlLT5kYXRhID0ga3phbGxvYyhzaXplb2YoKnByb2Zp
bGUtPmRhdGEpLCBHRlBfS0VSTkVMKTsKCQlpZiAoIXByb2ZpbGUtPmRhdGEpCgkJCWdvdG8gZmFp
bDsKCgkJcGFyYW1zLm5lbGVtX2hpbnQgPSAzOwoJCXBhcmFtcy5rZXlfbGVuID0gc2l6ZW9mKHZv
aWQgKik7CgkJcGFyYW1zLmtleV9vZmZzZXQgPSBvZmZzZXRvZihzdHJ1Y3QgYWFfZGF0YSwga2V5
KTsKCQlwYXJhbXMuaGVhZF9vZmZzZXQgPSBvZmZzZXRvZihzdHJ1Y3QgYWFfZGF0YSwgaGVhZCk7
CgkJcGFyYW1zLmhhc2hmbiA9IHN0cmhhc2g7CgkJcGFyYW1zLm9ial9jbXBmbiA9IGRhdGFjbXA7
CgoJCWlmIChyaGFzaHRhYmxlX2luaXQocHJvZmlsZS0+ZGF0YSwgJnBhcmFtcykpIHsKCQkJaW5m
byA9ICJmYWlsZWQgdG8gaW5pdCBrZXksIHZhbHVlIGhhc2ggdGFibGUiOwoJCQlnb3RvIGZhaWw7
CgkJfQoKCQl3aGlsZSAodW5wYWNrX3N0cmR1cChlLCAma2V5LCBOVUxMKSkgewoJCQlkYXRhID0g
a3phbGxvYyhzaXplb2YoKmRhdGEpLCBHRlBfS0VSTkVMKTsKCQkJaWYgKCFkYXRhKSB7CgkJCQlr
emZyZWUoa2V5KTsKCQkJCWdvdG8gZmFpbDsKCQkJfQoKCQkJZGF0YS0+a2V5ID0ga2V5OwoJCQlk
YXRhLT5zaXplID0gdW5wYWNrX2Jsb2IoZSwgJmRhdGEtPmRhdGEsIE5VTEwpOwoJCQlkYXRhLT5k
YXRhID0ga3ZtZW1kdXAoZGF0YS0+ZGF0YSwgZGF0YS0+c2l6ZSk7CgkJCWlmIChkYXRhLT5zaXpl
ICYmICFkYXRhLT5kYXRhKSB7CgkJCQlremZyZWUoZGF0YS0+a2V5KTsKCQkJCWt6ZnJlZShkYXRh
KTsKCQkJCWdvdG8gZmFpbDsKCQkJfQoKCQkJcmhhc2h0YWJsZV9pbnNlcnRfZmFzdChwcm9maWxl
LT5kYXRhLCAmZGF0YS0+aGVhZCwKCQkJCQkgICAgICAgcHJvZmlsZS0+ZGF0YS0+cCk7CgkJfQoK
CQlpZiAoIXVucGFja19uYW1lWChlLCBBQV9TVFJVQ1RFTkQsIE5VTEwpKSB7CgkJCWluZm8gPSAi
ZmFpbGVkIHRvIHVucGFjayBlbmQgb2Yga2V5LCB2YWx1ZSBkYXRhIHRhYmxlIjsKCQkJZ290byBm
YWlsOwoJCX0KCX0KCglpZiAoIXVucGFja19uYW1lWChlLCBBQV9TVFJVQ1RFTkQsIE5VTEwpKSB7
CgkJaW5mbyA9ICJmYWlsZWQgdG8gdW5wYWNrIGVuZCBvZiBwcm9maWxlIjsKCQlnb3RvIGZhaWw7
Cgl9CgoJcmV0dXJuIHByb2ZpbGU7CgpmYWlsOgoJaWYgKHByb2ZpbGUpCgkJbmFtZSA9IE5VTEw7
CgllbHNlIGlmICghbmFtZSkKCQluYW1lID0gInVua25vd24iOwoJYXVkaXRfaWZhY2UocHJvZmls
ZSwgTlVMTCwgbmFtZSwgaW5mbywgZSwgZXJyb3IpOwoJYWFfZnJlZV9wcm9maWxlKHByb2ZpbGUp
OwoKCXJldHVybiBFUlJfUFRSKGVycm9yKTsKfQoKLyoqCiAqIHZlcmlmeV9oZWFkIC0gdW5wYWNr
IHNlcmlhbGl6ZWQgc3RyZWFtIGhlYWRlcgogKiBAZTogc2VyaWFsaXplZCBkYXRhIHJlYWQgaGVh
ZCAoTk9UIE5VTEwpCiAqIEByZXF1aXJlZDogd2hldGhlciB0aGUgaGVhZGVyIGlzIHJlcXVpcmVk
IG9yIG9wdGlvbmFsCiAqIEBuczogUmV0dXJucyAtIG5hbWVzcGFjZSBpZiBvbmUgaXMgc3BlY2lm
aWVkIGVsc2UgTlVMTCAoTk9UIE5VTEwpCiAqCiAqIFJldHVybnM6IGVycm9yIG9yIDAgaWYgaGVh
ZGVyIGlzIGdvb2QKICovCnN0YXRpYyBpbnQgdmVyaWZ5X2hlYWRlcihzdHJ1Y3QgYWFfZXh0ICpl
LCBpbnQgcmVxdWlyZWQsIGNvbnN0IGNoYXIgKipucykKewoJaW50IGVycm9yID0gLUVQUk9UT05P
U1VQUE9SVDsKCWNvbnN0IGNoYXIgKm5hbWUgPSBOVUxMOwoJKm5zID0gTlVMTDsKCgkvKiBnZXQg
dGhlIGludGVyZmFjZSB2ZXJzaW9uICovCglpZiAoIXVucGFja191MzIoZSwgJmUtPnZlcnNpb24s
ICJ2ZXJzaW9uIikpIHsKCQlpZiAocmVxdWlyZWQpIHsKCQkJYXVkaXRfaWZhY2UoTlVMTCwgTlVM
TCwgTlVMTCwgImludmFsaWQgcHJvZmlsZSBmb3JtYXQiLAoJCQkJICAgIGUsIGVycm9yKTsKCQkJ
cmV0dXJuIGVycm9yOwoJCX0KCX0KCgkvKiBDaGVjayB0aGF0IHRoZSBpbnRlcmZhY2UgdmVyc2lv
biBpcyBjdXJyZW50bHkgc3VwcG9ydGVkLgoJICogaWYgbm90IHNwZWNpZmllZCB1c2UgcHJldmlv
dXMgdmVyc2lvbgoJICogTWFzayBvZmYgZXZlcnl0aGluZyB0aGF0IGlzIG5vdCBrZXJuZWwgYWJp
IHZlcnNpb24KCSAqLwoJaWYgKFZFUlNJT05fTFQoZS0+dmVyc2lvbiwgdjUpIHx8IFZFUlNJT05f
R1QoZS0+dmVyc2lvbiwgdjcpKSB7CgkJYXVkaXRfaWZhY2UoTlVMTCwgTlVMTCwgTlVMTCwgInVu
c3VwcG9ydGVkIGludGVyZmFjZSB2ZXJzaW9uIiwKCQkJICAgIGUsIGVycm9yKTsKCQlyZXR1cm4g
ZXJyb3I7Cgl9CgoJLyogcmVhZCB0aGUgbmFtZXNwYWNlIGlmIHByZXNlbnQgKi8KCWlmICh1bnBh
Y2tfc3RyKGUsICZuYW1lLCAibmFtZXNwYWNlIikpIHsKCQlpZiAoKm5hbWUgPT0gJ1wwJykgewoJ
CQlhdWRpdF9pZmFjZShOVUxMLCBOVUxMLCBOVUxMLCAiaW52YWxpZCBuYW1lc3BhY2UgbmFtZSIs
CgkJCQkgICAgZSwgZXJyb3IpOwoJCQlyZXR1cm4gZXJyb3I7CgkJfQoJCWlmICgqbnMgJiYgc3Ry
Y21wKCpucywgbmFtZSkpCgkJCWF1ZGl0X2lmYWNlKE5VTEwsIE5VTEwsIE5VTEwsICJpbnZhbGlk
IG5zIGNoYW5nZSIsIGUsCgkJCQkgICAgZXJyb3IpOwoJCWVsc2UgaWYgKCEqbnMpCgkJCSpucyA9
IG5hbWU7Cgl9CgoJcmV0dXJuIDA7Cn0KCnN0YXRpYyBib29sIHZlcmlmeV94aW5kZXgoaW50IHhp
bmRleCwgaW50IHRhYmxlX3NpemUpCnsKCWludCBpbmRleCwgeHR5cGU7Cgl4dHlwZSA9IHhpbmRl
eCAmIEFBX1hfVFlQRV9NQVNLOwoJaW5kZXggPSB4aW5kZXggJiBBQV9YX0lOREVYX01BU0s7Cglp
ZiAoeHR5cGUgPT0gQUFfWF9UQUJMRSAmJiBpbmRleCA+PSB0YWJsZV9zaXplKQoJCXJldHVybiAw
OwoJcmV0dXJuIDE7Cn0KCi8qIHZlcmlmeSBkZmEgeGluZGV4ZXMgYXJlIGluIHJhbmdlIG9mIHRy
YW5zaXRpb24gdGFibGVzICovCnN0YXRpYyBib29sIHZlcmlmeV9kZmFfeGluZGV4KHN0cnVjdCBh
YV9kZmEgKmRmYSwgaW50IHRhYmxlX3NpemUpCnsKCWludCBpOwoJZm9yIChpID0gMDsgaSA8IGRm
YS0+dGFibGVzW1lZVERfSURfQUNDRVBUXS0+dGRfbG9sZW47IGkrKykgewoJCWlmICghdmVyaWZ5
X3hpbmRleChkZmFfdXNlcl94aW5kZXgoZGZhLCBpKSwgdGFibGVfc2l6ZSkpCgkJCXJldHVybiAw
OwoJCWlmICghdmVyaWZ5X3hpbmRleChkZmFfb3RoZXJfeGluZGV4KGRmYSwgaSksIHRhYmxlX3Np
emUpKQoJCQlyZXR1cm4gMDsKCX0KCXJldHVybiAxOwp9CgovKioKICogdmVyaWZ5X3Byb2ZpbGUg
LSBEbyBwb3N0IHVucGFjayBhbmFseXNpcyB0byB2ZXJpZnkgcHJvZmlsZSBjb25zaXN0ZW5jeQog
KiBAcHJvZmlsZTogcHJvZmlsZSB0byB2ZXJpZnkgKE5PVCBOVUxMKQogKgogKiBSZXR1cm5zOiAw
IGlmIHBhc3NlcyB2ZXJpZmljYXRpb24gZWxzZSBlcnJvcgogKi8Kc3RhdGljIGludCB2ZXJpZnlf
cHJvZmlsZShzdHJ1Y3QgYWFfcHJvZmlsZSAqcHJvZmlsZSkKewoJaWYgKHByb2ZpbGUtPmZpbGUu
ZGZhICYmCgkgICAgIXZlcmlmeV9kZmFfeGluZGV4KHByb2ZpbGUtPmZpbGUuZGZhLAoJCQkgICAg
ICAgcHJvZmlsZS0+ZmlsZS50cmFucy5zaXplKSkgewoJCWF1ZGl0X2lmYWNlKHByb2ZpbGUsIE5V
TEwsIE5VTEwsICJJbnZhbGlkIG5hbWVkIHRyYW5zaXRpb24iLAoJCQkgICAgTlVMTCwgLUVQUk9U
Tyk7CgkJcmV0dXJuIC1FUFJPVE87Cgl9CgoJcmV0dXJuIDA7Cn0KCnZvaWQgYWFfbG9hZF9lbnRf
ZnJlZShzdHJ1Y3QgYWFfbG9hZF9lbnQgKmVudCkKewoJaWYgKGVudCkgewoJCWFhX3B1dF9wcm9m
aWxlKGVudC0+cmVuYW1lKTsKCQlhYV9wdXRfcHJvZmlsZShlbnQtPm9sZCk7CgkJYWFfcHV0X3By
b2ZpbGUoZW50LT5uZXcpOwoJCWtmcmVlKGVudC0+bnNfbmFtZSk7CgkJa3pmcmVlKGVudCk7Cgl9
Cn0KCnN0cnVjdCBhYV9sb2FkX2VudCAqYWFfbG9hZF9lbnRfYWxsb2Modm9pZCkKewoJc3RydWN0
IGFhX2xvYWRfZW50ICplbnQgPSBremFsbG9jKHNpemVvZigqZW50KSwgR0ZQX0tFUk5FTCk7Cglp
ZiAoZW50KQoJCUlOSVRfTElTVF9IRUFEKCZlbnQtPmxpc3QpOwoJcmV0dXJuIGVudDsKfQoKLyoq
CiAqIGFhX3VucGFjayAtIHVucGFjayBwYWNrZWQgYmluYXJ5IHByb2ZpbGUocykgZGF0YSBsb2Fk
ZWQgZnJvbSB1c2VyIHNwYWNlCiAqIEB1ZGF0YTogdXNlciBkYXRhIGNvcGllZCB0byBrbWVtICAo
Tk9UIE5VTEwpCiAqIEBsaDogbGlzdCB0byBwbGFjZSB1bnBhY2tlZCBwcm9maWxlcyBpbiBhIGFh
X3JlcGxfd3MKICogQG5zOiBSZXR1cm5zIG5hbWVzcGFjZSBwcm9maWxlIGlzIGluIGlmIHNwZWNp
ZmllZCBlbHNlIE5VTEwgKE5PVCBOVUxMKQogKgogKiBVbnBhY2sgdXNlciBkYXRhIGFuZCByZXR1
cm4gcmVmY291bnRlZCBhbGxvY2F0ZWQgcHJvZmlsZShzKSBzdG9yZWQgaW4KICogQGxoIGluIG9y
ZGVyIG9mIGRpc2NvdmVyeSwgd2l0aCB0aGUgbGlzdCBjaGFpbiBzdG9yZWQgaW4gYmFzZS5saXN0
CiAqIG9yIGVycm9yCiAqCiAqIFJldHVybnM6IHByb2ZpbGUocykgb24gQGxoIGVsc2UgZXJyb3Ig
cG9pbnRlciBpZiBmYWlscyB0byB1bnBhY2sKICovCmludCBhYV91bnBhY2soc3RydWN0IGFhX2xv
YWRkYXRhICp1ZGF0YSwgc3RydWN0IGxpc3RfaGVhZCAqbGgsCgkgICAgICBjb25zdCBjaGFyICoq
bnMpCnsKCXN0cnVjdCBhYV9sb2FkX2VudCAqdG1wLCAqZW50OwoJc3RydWN0IGFhX3Byb2ZpbGUg
KnByb2ZpbGUgPSBOVUxMOwoJaW50IGVycm9yOwoJc3RydWN0IGFhX2V4dCBlID0gewoJCS5zdGFy
dCA9IHVkYXRhLT5kYXRhLAoJCS5lbmQgPSB1ZGF0YS0+ZGF0YSArIHVkYXRhLT5zaXplLAoJCS5w
b3MgPSB1ZGF0YS0+ZGF0YSwKCX07CgoJKm5zID0gTlVMTDsKCXdoaWxlIChlLnBvcyA8IGUuZW5k
KSB7CgkJY2hhciAqbnNfbmFtZSA9IE5VTEw7CgkJdm9pZCAqc3RhcnQ7CgkJZXJyb3IgPSB2ZXJp
ZnlfaGVhZGVyKCZlLCBlLnBvcyA9PSBlLnN0YXJ0LCBucyk7CgkJaWYgKGVycm9yKQoJCQlnb3Rv
IGZhaWw7CgoJCXN0YXJ0ID0gZS5wb3M7CgkJcHJvZmlsZSA9IHVucGFja19wcm9maWxlKCZlLCAm
bnNfbmFtZSk7CgkJaWYgKElTX0VSUihwcm9maWxlKSkgewoJCQllcnJvciA9IFBUUl9FUlIocHJv
ZmlsZSk7CgkJCWdvdG8gZmFpbDsKCQl9CgoJCWVycm9yID0gdmVyaWZ5X3Byb2ZpbGUocHJvZmls
ZSk7CgkJaWYgKGVycm9yKQoJCQlnb3RvIGZhaWxfcHJvZmlsZTsKCgkJaWYgKGFhX2dfaGFzaF9w
b2xpY3kpCgkJCWVycm9yID0gYWFfY2FsY19wcm9maWxlX2hhc2gocHJvZmlsZSwgZS52ZXJzaW9u
LCBzdGFydCwKCQkJCQkJICAgICBlLnBvcyAtIHN0YXJ0KTsKCQlpZiAoZXJyb3IpCgkJCWdvdG8g
ZmFpbF9wcm9maWxlOwoKCQllbnQgPSBhYV9sb2FkX2VudF9hbGxvYygpOwoJCWlmICghZW50KSB7
CgkJCWVycm9yID0gLUVOT01FTTsKCQkJZ290byBmYWlsX3Byb2ZpbGU7CgkJfQoKCQllbnQtPm5l
dyA9IHByb2ZpbGU7CgkJZW50LT5uc19uYW1lID0gbnNfbmFtZTsKCQlsaXN0X2FkZF90YWlsKCZl
bnQtPmxpc3QsIGxoKTsKCX0KCXVkYXRhLT5hYmkgPSBlLnZlcnNpb24gJiBLX0FCSV9NQVNLOwoJ
aWYgKGFhX2dfaGFzaF9wb2xpY3kpIHsKCQl1ZGF0YS0+aGFzaCA9IGFhX2NhbGNfaGFzaCh1ZGF0
YS0+ZGF0YSwgdWRhdGEtPnNpemUpOwoJCWlmIChJU19FUlIodWRhdGEtPmhhc2gpKSB7CgkJCWVy
cm9yID0gUFRSX0VSUih1ZGF0YS0+aGFzaCk7CgkJCXVkYXRhLT5oYXNoID0gTlVMTDsKCQkJZ290
byBmYWlsOwoJCX0KCX0KCXJldHVybiAwOwoKZmFpbF9wcm9maWxlOgoJYWFfcHV0X3Byb2ZpbGUo
cHJvZmlsZSk7CgpmYWlsOgoJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGVudCwgdG1wLCBsaCwg
bGlzdCkgewoJCWxpc3RfZGVsX2luaXQoJmVudC0+bGlzdCk7CgkJYWFfbG9hZF9lbnRfZnJlZShl
bnQpOwoJfQoKCXJldHVybiBlcnJvcjsKfQo=

--_008_PN1PR0101MB1133959D5B326EE0AAE60EA6FBDD0PN1PR0101MB1133_
Content-Type: text/x-csrc; name="parser_interface.c"
Content-Description: parser_interface.c
Content-Disposition: attachment; filename="parser_interface.c"; size=15080;
	creation-date="Mon, 29 Jul 2019 07:45:42 GMT";
	modification-date="Mon, 29 Jul 2019 07:45:42 GMT"
Content-Transfer-Encoding: base64

LyoKICogICBDb3B5cmlnaHQgKGMpIDE5OTksIDIwMDAsIDIwMDEsIDIwMDIsIDIwMDMsIDIwMDQs
IDIwMDUsIDIwMDYsIDIwMDcKICogICBOT1ZFTEwgKEFsbCByaWdodHMgcmVzZXJ2ZWQpCiAqCiAq
ICAgQ29weXJpZ2h0IChjKSAyMDEzCiAqICAgQ2Fub25pY2FsIEx0ZC4gKEFsbCByaWdodHMgcmVz
ZXJ2ZWQpCiAqCiAqICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVk
aXN0cmlidXRlIGl0IGFuZC9vcgogKiAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdmVy
c2lvbiAyIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKICogICBMaWNlbnNlIHB1Ymxpc2hlZCBi
eSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgogKgogKiAgIFRoaXMgcHJvZ3JhbSBpcyBk
aXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAogKiAgIGJ1dCBX
SVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9m
CiAqICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NF
LiAgU2VlIHRoZQogKiAgIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFp
bHMuCiAqCiAqICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UKICogICBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90
LCBjb250YWN0IE5vdmVsbCwgSW5jLgogKi8KCiNpbmNsdWRlIDxhc3NlcnQuaD4KI2luY2x1ZGUg
PHN0ZGlvLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVk
ZSA8ZXJybm8uaD4KI2luY2x1ZGUgPGZjbnRsLmg+CgojaW5jbHVkZSA8c3RyaW5nPgojaW5jbHVk
ZSA8c3N0cmVhbT4KI2luY2x1ZGUgPHN5cy9hcHBhcm1vci5oPgoKI2luY2x1ZGUgImxpYi5oIgoj
aW5jbHVkZSAicGFyc2VyLmgiCiNpbmNsdWRlICJwcm9maWxlLmgiCiNpbmNsdWRlICJsaWJhcHBh
cm1vcl9yZS9hcHBhcm1vcl9yZS5oIgoKI2luY2x1ZGUgPHVuaXN0ZC5oPgojaW5jbHVkZSA8bGlu
dXgvdW5pc3RkLmg+CgoKI2RlZmluZSBTRF9DT0RFX1NJWkUgKHNpemVvZih1OCkpCiNkZWZpbmUg
U0RfU1RSX0xFTiAoc2l6ZW9mKHUxNikpCgoKaW50IF9fc2Rfc2VyaWFsaXplX3Byb2ZpbGUoaW50
IG9wdGlvbiwgYWFfa2VybmVsX2ludGVyZmFjZSAqa2VybmVsX2ludGVyZmFjZSwKCQkJICAgUHJv
ZmlsZSAqcHJvZiwgaW50IGNhY2hlX2ZkKTsKCnN0YXRpYyB2b2lkIHByaW50X2Vycm9yKGludCBl
cnJvcikKewoJc3dpdGNoIChlcnJvcikgewoJY2FzZSAtRVNQSVBFOgoJCVBFUlJPUihfKCJCYWQg
d3JpdGUgcG9zaXRpb25cbiIpKTsKCQlicmVhazsKCWNhc2UgLUVQRVJNOgoJCVBFUlJPUihfKCJQ
ZXJtaXNzaW9uIGRlbmllZFxuIikpOwoJCWJyZWFrOwoJY2FzZSAtRU5PTUVNOgoJCVBFUlJPUihf
KCJPdXQgb2YgbWVtb3J5XG4iKSk7CgkJYnJlYWs7CgljYXNlIC1FRkFVTFQ6CgkJUEVSUk9SKF8o
IkNvdWxkbid0IGNvcHkgcHJvZmlsZTogQmFkIG1lbW9yeSBhZGRyZXNzXG4iKSk7CgkJYnJlYWs7
CgljYXNlIC1FUFJPVE86CgkJUEVSUk9SKF8oIlByb2ZpbGUgZG9lc24ndCBjb25mb3JtIHRvIHBy
b3RvY29sXG4iKSk7CgkJYnJlYWs7CgljYXNlIC1FQkFETVNHOgoJCVBFUlJPUihfKCJQcm9maWxl
IGRvZXMgbm90IG1hdGNoIHNpZ25hdHVyZVxuIikpOwoJCWJyZWFrOwoJY2FzZSAtRVBST1RPTk9T
VVBQT1JUOgoJCVBFUlJPUihfKCJQcm9maWxlIHZlcnNpb24gbm90IHN1cHBvcnRlZCBieSBBcHBh
cm1vciBtb2R1bGVcbiIpKTsKCQlicmVhazsKCWNhc2UgLUVFWElTVDoKCQlQRVJST1IoXygiUHJv
ZmlsZSBhbHJlYWR5IGV4aXN0c1xuIikpOwoJCWJyZWFrOwoJY2FzZSAtRU5PRU5UOgoJCVBFUlJP
UihfKCJQcm9maWxlIGRvZXNuJ3QgZXhpc3RcbiIpKTsKCQlicmVhazsKCWNhc2UgLUVBQ0NFUzoK
CQlQRVJST1IoXygiUGVybWlzc2lvbiBkZW5pZWQ7IGF0dGVtcHRlZCB0byBsb2FkIGEgcHJvZmls
ZSB3aGlsZSBjb25maW5lZD9cbiIpKTsKCQlicmVhazsKCWRlZmF1bHQ6CgkJUEVSUk9SKF8oIlVu
a25vd24gZXJyb3IgKCVkKTogJXNcbiIpLCAtZXJyb3IsIHN0cmVycm9yKC1lcnJvcikpOwoJCWJy
ZWFrOwoJfQp9CgppbnQgbG9hZF9wcm9maWxlKGludCBvcHRpb24sIGFhX2tlcm5lbF9pbnRlcmZh
Y2UgKmtlcm5lbF9pbnRlcmZhY2UsCgkJIFByb2ZpbGUgKnByb2YsIGludCBjYWNoZV9mZCkKewoJ
CglpbnQgcmV0dmFsID0gMDsKCWludCBlcnJvciA9IDA7CgoJUERFQlVHKCJTZXJpYWxpemluZyBw
b2xpY3kgZm9yICVzLlxuIiwgcHJvZi0+bmFtZSk7CgkKCQoJcmV0dmFsID0gX19zZF9zZXJpYWxp
emVfcHJvZmlsZShvcHRpb24sIGtlcm5lbF9pbnRlcmZhY2UsIHByb2YsIGNhY2hlX2ZkKTsKCQoJ
aWYgKHJldHZhbCA8IDApIHsKCQllcnJvciA9IHJldHZhbDsJLyogeWVhaCwgd2UnbGwganVzdCBy
ZXBvcnQgdGhlIGxhc3QgZXJyb3IgKi8KCQlzd2l0Y2ggKG9wdGlvbikgewoJCWNhc2UgT1BUSU9O
X0FERDoKCQkJUEVSUk9SKF8oIiVzOiBVbmFibGUgdG8gYWRkIFwiJXNcIi4gICIpLAoJCQkgICAg
ICAgcHJvZ25hbWUsIHByb2YtPm5hbWUpOwoJCQlwcmludF9lcnJvcihlcnJvcik7CgkJCWJyZWFr
OwoJCWNhc2UgT1BUSU9OX1JFUExBQ0U6CgkJCVBFUlJPUihfKCIlczogVW5hYmxlIHRvIHJlcGxh
Y2UgXCIlc1wiLiAgIiksCgkJCSAgICAgICBwcm9nbmFtZSwgcHJvZi0+bmFtZSk7CgkJCXByaW50
X2Vycm9yKGVycm9yKTsKCQkJYnJlYWs7CgkJY2FzZSBPUFRJT05fUkVNT1ZFOgoJCQlQRVJST1Io
XygiJXM6IFVuYWJsZSB0byByZW1vdmUgXCIlc1wiLiAgIiksCgkJCSAgICAgICBwcm9nbmFtZSwg
cHJvZi0+bmFtZSk7CgkJCXByaW50X2Vycm9yKGVycm9yKTsKCQkJYnJlYWs7CgkJY2FzZSBPUFRJ
T05fU1RET1VUOgoJCQlQRVJST1IoXygiJXM6IFVuYWJsZSB0byB3cml0ZSB0byBzdGRvdXRcbiIp
LAoJCQkgICAgICAgcHJvZ25hbWUpOwoJCQlicmVhazsKCQljYXNlIE9QVElPTl9PRklMRToKCQkJ
UEVSUk9SKF8oIiVzOiBVbmFibGUgdG8gd3JpdGUgdG8gb3V0cHV0IGZpbGVcbiIpLAoJCQkgICAg
ICAgcHJvZ25hbWUpOwoJCWRlZmF1bHQ6CgkJCVBFUlJPUihfKCIlczogQVNTRVJUOiBJbnZhbGlk
IG9wdGlvbjogJWRcbiIpLAoJCQkgICAgICAgcHJvZ25hbWUsIG9wdGlvbik7CgkJCWV4aXQoMSk7
CgkJCWJyZWFrOwoJCX0KCgl9IGVsc2UgaWYgKGNvbmZfdmVyYm9zZSkgewoJCXN3aXRjaCAob3B0
aW9uKSB7CgkJY2FzZSBPUFRJT05fQUREOgoJCQlwcmludGYoXygiQWRkaXRpb24gc3VjY2VlZGVk
IGZvciBcIiVzXCIuXG4iKSwKCQkJICAgICAgIHByb2YtPm5hbWUpOwoJCQlicmVhazsKCQljYXNl
IE9QVElPTl9SRVBMQUNFOgoJCQlwcmludGYoXygiUmVwbGFjZW1lbnQgc3VjY2VlZGVkIGZvciBc
IiVzXCIuXG4iKSwKCQkJICAgICAgIHByb2YtPm5hbWUpOwoJCQlicmVhazsKCQljYXNlIE9QVElP
Tl9SRU1PVkU6CgkJCXByaW50ZihfKCJSZW1vdmFsIHN1Y2NlZWRlZCBmb3IgXCIlc1wiLlxuIiks
CgkJCSAgICAgICBwcm9mLT5uYW1lKTsKCQkJYnJlYWs7CgkJY2FzZSBPUFRJT05fU1RET1VUOgoJ
CWNhc2UgT1BUSU9OX09GSUxFOgoJCQlicmVhazsKCQlkZWZhdWx0OgoJCQlQRVJST1IoXygiJXM6
IEFTU0VSVDogSW52YWxpZCBvcHRpb246ICVkXG4iKSwKCQkJICAgICAgIHByb2duYW1lLCBvcHRp
b24pOwoJCQlleGl0KDEpOwoJCQlicmVhazsKCQl9Cgl9CgoJcmV0dXJuIGVycm9yOwp9CgoKCmVu
dW0gc2RfY29kZSB7CglTRF9VOCwKCVNEX1UxNiwKCVNEX1UzMiwKCVNEX1U2NCwKCVNEX05BTUUs
CQkvKiBzYW1lIGFzIHN0cmluZyBleGNlcHQgaXQgaXMgaXRlbXMgbmFtZSAqLwoJU0RfU1RSSU5H
LAoJU0RfQkxPQiwKCVNEX1NUUlVDVCwKCVNEX1NUUlVDVEVORCwKCVNEX0xJU1QsCglTRF9MSVNU
RU5ELAoJU0RfQVJSQVksCglTRF9BUlJBWUVORCwKCVNEX09GRlNFVAp9OwoKY29uc3QgY2hhciAq
c2RfY29kZV9uYW1lc1tdID0gewoJIlNEX1U4IiwKCSJTRF9VMTYiLAoJIlNEX1UzMiIsCgkiU0Rf
VTY0IiwKCSJTRF9OQU1FIiwKCSJTRF9TVFJJTkciLAoJIlNEX0JMT0IiLAoJIlNEX1NUUlVDVCIs
CgkiU0RfU1RSVUNURU5EIiwKCSJTRF9MSVNUIiwKCSJTRF9MSVNURU5EIiwKCSJTRF9BUlJBWSIs
CgkiU0RfQVJSQVlFTkQiLAoJIlNEX09GRlNFVCIKfTsKCgpzdGF0aWMgaW5saW5lIHZvaWQgc2Rf
d3JpdGU4KHN0ZDo6b3N0cmluZ3N0cmVhbSAmYnVmLCB1OCBiKQp7CgkKCWJ1Zi53cml0ZSgoY29u
c3QgY2hhciAqKSAmYiwgMSk7Cn0KCnN0YXRpYyBpbmxpbmUgdm9pZCBzZF93cml0ZTE2KHN0ZDo6
b3N0cmluZ3N0cmVhbSAmYnVmLCB1MTYgYikKewoJdTE2IHRtcDsKCXRtcCA9IGNwdV90b19sZTE2
KGIpOwoJYnVmLndyaXRlKChjb25zdCBjaGFyICopICZ0bXAsIDIpOwp9CgpzdGF0aWMgaW5saW5l
IHZvaWQgc2Rfd3JpdGUzMihzdGQ6Om9zdHJpbmdzdHJlYW0gJmJ1ZiwgdTMyIGIpCnsKCXUzMiB0
bXA7CgkKCXRtcCA9IGNwdV90b19sZTMyKGIpOwoJYnVmLndyaXRlKChjb25zdCBjaGFyICopICZ0
bXAsIDQpOwp9CgpzdGF0aWMgaW5saW5lIHZvaWQgc2Rfd3JpdGU2NChzdGQ6Om9zdHJpbmdzdHJl
YW0gJmJ1ZiwgdTY0IGIpCnsKCXU2NCB0bXA7CglwcmludGYgKCJzZF93cml0ZTY0OiBiPSVkXG4i
LCBiKTsKCXByaW50ZiAoInNkX3dyaXRlNjQ6IGI9JXhcbiIsIGIpOwoJCgl0bXAgPSBjcHVfdG9f
bGU2NChiKTsKCWJ1Zi53cml0ZSgoY29uc3QgY2hhciAqKSAmdG1wLCA4KTsKfQoKc3RhdGljIGlu
bGluZSB2b2lkIHNkX3dyaXRlX3VpbnQ4KHN0ZDo6b3N0cmluZ3N0cmVhbSAmYnVmLCB1OCBiKQp7
CglzZF93cml0ZTgoYnVmLCBTRF9VOCk7CglzZF93cml0ZTgoYnVmLCBiKTsKfQoKc3RhdGljIGlu
bGluZSB2b2lkIHNkX3dyaXRlX3VpbnQxNihzdGQ6Om9zdHJpbmdzdHJlYW0gJmJ1ZiwgdTE2IGIp
CnsKCXNkX3dyaXRlOChidWYsIFNEX1UxNik7CglzZF93cml0ZTE2KGJ1ZiwgYik7Cn0KCnN0YXRp
YyBpbmxpbmUgdm9pZCBzZF93cml0ZV91aW50MzIoc3RkOjpvc3RyaW5nc3RyZWFtICZidWYsIHUz
MiBiKQp7CglzZF93cml0ZTgoYnVmLCBTRF9VMzIpOwoJc2Rfd3JpdGUzMihidWYsIGIpOwp9Cgpz
dGF0aWMgaW5saW5lIHZvaWQgc2Rfd3JpdGVfdWludDY0KHN0ZDo6b3N0cmluZ3N0cmVhbSAmYnVm
LCB1NjQgYikKewoJc2Rfd3JpdGU4KGJ1ZiwgU0RfVTY0KTsKCXNkX3dyaXRlNjQoYnVmLCBiKTsK
fQoKc3RhdGljIGlubGluZSB2b2lkIHNkX3dyaXRlX25hbWUoc3RkOjpvc3RyaW5nc3RyZWFtICZi
dWYsIGNvbnN0IGNoYXIgKm5hbWUpCnsKCVBERUJVRygiV3JpdGluZyBuYW1lICclcydcbiIsIG5h
bWUpOwoJaWYgKG5hbWUpIHsKCQlzZF93cml0ZTgoYnVmLCBTRF9OQU1FKTsKCQlzZF93cml0ZTE2
KGJ1Ziwgc3RybGVuKG5hbWUpICsgMSk7CgkJYnVmLndyaXRlKG5hbWUsIHN0cmxlbihuYW1lKSAr
IDEpOwoJfQp9CgpzdGF0aWMgaW5saW5lIHZvaWQgc2Rfd3JpdGVfYmxvYihzdGQ6Om9zdHJpbmdz
dHJlYW0gJmJ1Ziwgdm9pZCAqYiwgaW50IGJ1Zl9zaXplLCBjaGFyICpuYW1lKQp7CglzZF93cml0
ZV9uYW1lKGJ1ZiwgbmFtZSk7CglzZF93cml0ZTgoYnVmLCBTRF9CTE9CKTsKCXNkX3dyaXRlMzIo
YnVmLCBidWZfc2l6ZSk7CglidWYud3JpdGUoKGNvbnN0IGNoYXIgKikgYiwgYnVmX3NpemUpOwp9
CgoKc3RhdGljIGNoYXIgemVyb3NbNjRdOwojZGVmaW5lIGFsaWduNjQoWCkgKCgoWCkgKyAodHlw
ZW9mKFgpKSA3KSAmIH4oKHR5cGVvZihYKSkgNykpCnN0YXRpYyBpbmxpbmUgdm9pZCBzZF93cml0
ZV9hbGlnbmVkX2Jsb2Ioc3RkOjpvc3RyaW5nc3RyZWFtICZidWYsIHZvaWQgKmIsIGludCBiX3Np
emUsCgkJCQkgY29uc3QgY2hhciAqbmFtZSkKewoJc2Rfd3JpdGVfbmFtZShidWYsIG5hbWUpOwoJ
LyogcGFkIGNhbGN1bGF0aW9uIE1VU1QgY29tZSBhZnRlciBuYW1lIGlzIHdyaXR0ZW4gKi8KCXNp
emVfdCBwYWQgPSBhbGlnbjY0KGJ1Zi50ZWxscCgpICsgKChzdGQ6OnN0cmVhbW9mZikgNWwpKSAt
IChidWYudGVsbHAoKSArICgoc3RkOjpzdHJlYW1vZmYpIDVsKSk7CglzZF93cml0ZTgoYnVmLCBT
RF9CTE9CKTsKCXNkX3dyaXRlMzIoYnVmLCBiX3NpemUgKyBwYWQpOwoJYnVmLndyaXRlKHplcm9z
LCBwYWQpOwoJYnVmLndyaXRlKChjb25zdCBjaGFyICopIGIsIGJfc2l6ZSk7Cn0KCnN0YXRpYyB2
b2lkIHNkX3dyaXRlX3N0cm4oc3RkOjpvc3RyaW5nc3RyZWFtICZidWYsIGNoYXIgKmIsIGludCBz
aXplLCBjb25zdCBjaGFyICpuYW1lKQp7CglzZF93cml0ZV9uYW1lKGJ1ZiwgbmFtZSk7CglzZF93
cml0ZTgoYnVmLCBTRF9TVFJJTkcpOwoJc2Rfd3JpdGUxNihidWYsIHNpemUpOwoJYnVmLndyaXRl
KGIsIHNpemUpOwp9CgpzdGF0aWMgaW5saW5lIHZvaWQgc2Rfd3JpdGVfc3RyaW5nKHN0ZDo6b3N0
cmluZ3N0cmVhbSAmYnVmLCBjaGFyICpiLCBjb25zdCBjaGFyICpuYW1lKQp7CglzZF93cml0ZV9z
dHJuKGJ1ZiwgYiwgc3RybGVuKGIpICsgMSwgbmFtZSk7Cn0KCnN0YXRpYyBpbmxpbmUgdm9pZCBz
ZF93cml0ZV9zdHJ1Y3Qoc3RkOjpvc3RyaW5nc3RyZWFtICZidWYsIGNvbnN0IGNoYXIgKm5hbWUp
CnsKCXNkX3dyaXRlX25hbWUoYnVmLCBuYW1lKTsKCXNkX3dyaXRlOChidWYsIFNEX1NUUlVDVCk7
Cn0KCnN0YXRpYyBpbmxpbmUgdm9pZCBzZF93cml0ZV9zdHJ1Y3RlbmQoc3RkOjpvc3RyaW5nc3Ry
ZWFtICZidWYpCnsKCXNkX3dyaXRlOChidWYsIFNEX1NUUlVDVEVORCk7Cn0KCnN0YXRpYyBpbmxp
bmUgdm9pZCBzZF93cml0ZV9hcnJheShzdGQ6Om9zdHJpbmdzdHJlYW0gJmJ1ZiwgY29uc3QgY2hh
ciAqbmFtZSwgaW50IHNpemUpCnsKCXNkX3dyaXRlX25hbWUoYnVmLCBuYW1lKTsKCXNkX3dyaXRl
OChidWYsIFNEX0FSUkFZKTsKCXNkX3dyaXRlMTYoYnVmLCBzaXplKTsKfQoKc3RhdGljIGlubGlu
ZSB2b2lkIHNkX3dyaXRlX2FycmF5ZW5kKHN0ZDo6b3N0cmluZ3N0cmVhbSAmYnVmKQp7CglzZF93
cml0ZTgoYnVmLCBTRF9BUlJBWUVORCk7Cn0KCnN0YXRpYyBpbmxpbmUgdm9pZCBzZF93cml0ZV9s
aXN0KHN0ZDo6b3N0cmluZ3N0cmVhbSAmYnVmLCBjb25zdCBjaGFyICpuYW1lKQp7CglzZF93cml0
ZV9uYW1lKGJ1ZiwgbmFtZSk7CglzZF93cml0ZTgoYnVmLCBTRF9MSVNUKTsKfQoKc3RhdGljIGlu
bGluZSB2b2lkIHNkX3dyaXRlX2xpc3RlbmQoc3RkOjpvc3RyaW5nc3RyZWFtICZidWYpCnsKCXNk
X3dyaXRlOChidWYsIFNEX0xJU1RFTkQpOwp9Cgp2b2lkIHNkX3NlcmlhbGl6ZV9kZmEoc3RkOjpv
c3RyaW5nc3RyZWFtICZidWYsIHZvaWQgKmRmYSwgc2l6ZV90IHNpemUpCnsKCWlmIChkZmEpCgkJ
c2Rfd3JpdGVfYWxpZ25lZF9ibG9iKGJ1ZiwgZGZhLCBzaXplLCAiYWFkZmEiKTsKfQoKdm9pZCBz
ZF9zZXJpYWxpemVfcmxpbWl0cyhzdGQ6Om9zdHJpbmdzdHJlYW0gJmJ1Ziwgc3RydWN0IGFhX3Js
aW1pdHMgKmxpbWl0cykKewoJaWYgKCFsaW1pdHMtPnNwZWNpZmllZCkKCQlyZXR1cm47CgoJc2Rf
d3JpdGVfc3RydWN0KGJ1ZiwgInJsaW1pdHMiKTsKCXNkX3dyaXRlX3VpbnQzMihidWYsIGxpbWl0
cy0+c3BlY2lmaWVkKTsKCXNkX3dyaXRlX2FycmF5KGJ1ZiwgTlVMTCwgUkxJTV9OTElNSVRTKTsK
CWZvciAoaW50IGkgPSAwOyBpIDwgUkxJTV9OTElNSVRTOyBpKyspIHsKCQlzZF93cml0ZV91aW50
NjQoYnVmLCBsaW1pdHMtPmxpbWl0c1tpXSk7Cgl9CglzZF93cml0ZV9hcnJheWVuZChidWYpOwoJ
c2Rfd3JpdGVfc3RydWN0ZW5kKGJ1Zik7Cn0KCnZvaWQgc2Rfc2VyaWFsaXplX3h0YWJsZShzdGQ6
Om9zdHJpbmdzdHJlYW0gJmJ1ZiwgY2hhciAqKnRhYmxlKQp7CglpbnQgY291bnQ7CglpZiAoIXRh
YmxlWzRdKQoJCXJldHVybjsKCXNkX3dyaXRlX3N0cnVjdChidWYsICJ4dGFibGUiKTsKCWNvdW50
ID0gMDsKCWZvciAoaW50IGkgPSA0OyBpIDwgQUFfRVhFQ19DT1VOVDsgaSsrKSB7CgkJaWYgKHRh
YmxlW2ldKQoJCQljb3VudCsrOwoJfQoKCXNkX3dyaXRlX2FycmF5KGJ1ZiwgTlVMTCwgY291bnQp
OwoJZm9yIChpbnQgaSA9IDQ7IGkgPCBjb3VudCArIDQ7IGkrKykgewoJCWludCBsZW4gPSBzdHJs
ZW4odGFibGVbaV0pICsgMTsKCgkJLyogaWYgaXRzIGEgbmFtZXNwYWNlIG1ha2Ugc3VyZSB0aGUg
c2Vjb25kIDogaXMgb3ZlcndyaXR0ZW4KCQkgKiB3aXRoIDAsIHNvIHRoYXQgdGhlIG5hbWVzcGFj
ZSBhbmQgbmFtZSBhcmUgXDAgc2VwZXJhdGVkCgkJICovCgkJaWYgKCp0YWJsZVtpXSA9PSAnOicp
IHsKCQkJY2hhciAqdG1wID0gdGFibGVbaV0gKyAxOwoJCQlzdHJzZXAoJnRtcCwgIjoiKTsKCQl9
CgkJc2Rfd3JpdGVfc3RybihidWYsIHRhYmxlW2ldLCBsZW4sIE5VTEwpOwoJfQoJc2Rfd3JpdGVf
YXJyYXllbmQoYnVmKTsKCXNkX3dyaXRlX3N0cnVjdGVuZChidWYpOwp9Cgp2b2lkIHNkX3Nlcmlh
bGl6ZV9wcm9maWxlKHN0ZDo6b3N0cmluZ3N0cmVhbSAmYnVmLCBQcm9maWxlICpwcm9maWxlLAoJ
CQkgaW50IGZsYXR0ZW5lZCkKewoJdWludDY0X3QgYWxsb3dlZF9jYXBzOwoKCXNkX3dyaXRlX3N0
cnVjdChidWYsICJwcm9maWxlIik7CglpZiAoZmxhdHRlbmVkKSB7CgkJYXNzZXJ0KHByb2ZpbGUt
PnBhcmVudCk7CgkJYXV0b2ZyZWUgY2hhciAqbmFtZSA9IChjaGFyICopIG1hbGxvYygzICsgc3Ry
bGVuKHByb2ZpbGUtPm5hbWUpICsgc3RybGVuKHByb2ZpbGUtPnBhcmVudC0+bmFtZSkpOwoJCWlm
ICghbmFtZSkKCQkJcmV0dXJuOwoJCXNwcmludGYobmFtZSwgIiVzLy8lcyIsIHByb2ZpbGUtPnBh
cmVudC0+bmFtZSwgcHJvZmlsZS0+bmFtZSk7CgkJc2Rfd3JpdGVfc3RyaW5nKGJ1ZiwgbmFtZSwg
TlVMTCk7Cgl9IGVsc2UgewoJCXNkX3dyaXRlX3N0cmluZyhidWYsIHByb2ZpbGUtPm5hbWUsIE5V
TEwpOwoJfQoKCS8qIG9ubHkgZW1pdCB0aGlzIGlmIGN1cnJlbnQga2VybmVsIGF0IGxlYXN0IHN1
cHBvcnRzICJjcmVhdGUiICovCglpZiAocGVybXNfY3JlYXRlKSB7CgkJaWYgKHByb2ZpbGUtPnht
YXRjaCkgewoJCQlzZF9zZXJpYWxpemVfZGZhKGJ1ZiwgcHJvZmlsZS0+eG1hdGNoLCBwcm9maWxl
LT54bWF0Y2hfc2l6ZSk7CgkJCXNkX3dyaXRlX3VpbnQzMihidWYsIHByb2ZpbGUtPnhtYXRjaF9s
ZW4pOwoJCX0KCX0KCgoJLy8gQ3VzdG9tIGNvZGUgYmVnaW4KCWlmIChwcm9maWxlLT5jbGFiZWwg
IT0gTlVMTCkKCXsKCQlzZF93cml0ZV9zdHJ1Y3QoYnVmLCAiY3VzdG9tX2xhYmVsIik7CgkJc2Rf
d3JpdGVfc3RyaW5nKGJ1ZiwgcHJvZmlsZS0+Y2xhYmVsLT5sYWJlbF9uYW1lLCBOVUxMKTsKCQlz
ZF93cml0ZV91aW50MzIoYnVmLCAgcHJvZmlsZS0+Y2xhYmVsLT5hbGxvd19jbnQpOwoKCQlpZiAo
cHJvZmlsZS0+Y2xhYmVsLT5hbGxvd19jbnQgPiAwKQoJCXsKCQkJc2Rfd3JpdGVfc3RydWN0KGJ1
ZiwgImRhdGFfbGlzdCIpOwoJCQlzdHJ1Y3QgZGF0YV9saXN0ICp0bXAgPSBwcm9maWxlLT5jbGFi
ZWwtPmFsbG93X2xpc3Q7CgkJCXdoaWxlICh0bXAgIT0gTlVMTCkKCQkJewoJCQkJc2Rfd3JpdGVf
c3RyaW5nKGJ1ZiwgdG1wLT5kYXRhLCBOVUxMKTsKCQkJCXRtcCA9IHRtcC0+bmV4dDsKCQkJfQoJ
CQlzZF93cml0ZV9zdHJ1Y3RlbmQoYnVmKTsKCQl9CgoJCXNkX3dyaXRlX3N0cnVjdGVuZChidWYp
OwoJfQoJLy8gQ3VzdG9tIGNvZGUgZW5kCgoKCgoJc2Rfd3JpdGVfc3RydWN0KGJ1ZiwgImZsYWdz
Iik7CgkvKiB1c2VkIHRvIGJlIGZsYWdzLmRlYnVnLCBidXQgdGhhdCdzIG5vIGxvbmdlciBzdXBw
b3J0ZWQgKi8KCXNkX3dyaXRlX3VpbnQzMihidWYsIHByb2ZpbGUtPmZsYWdzLmhhdCk7CglzZF93
cml0ZV91aW50MzIoYnVmLCBwcm9maWxlLT5mbGFncy5jb21wbGFpbik7CglzZF93cml0ZV91aW50
MzIoYnVmLCBwcm9maWxlLT5mbGFncy5hdWRpdCk7CglzZF93cml0ZV9zdHJ1Y3RlbmQoYnVmKTsK
CgoKCWlmIChwcm9maWxlLT5mbGFncy5wYXRoKSB7CgkJaW50IGZsYWdzID0gMDsKCQlpZiAocHJv
ZmlsZS0+ZmxhZ3MucGF0aCAmIFBBVEhfQ0hST09UX1JFTCkKCQkJZmxhZ3MgfD0gMHg4OwoJCWlm
IChwcm9maWxlLT5mbGFncy5wYXRoICYgUEFUSF9NRURJQVRFX0RFTEVURUQpCgkJCWZsYWdzIHw9
IDB4MTAwMDA7CgkJaWYgKHByb2ZpbGUtPmZsYWdzLnBhdGggJiBQQVRIX0FUVEFDSCkKCQkJZmxh
Z3MgfD0gMHg0OwoJCWlmIChwcm9maWxlLT5mbGFncy5wYXRoICYgUEFUSF9DSFJPT1RfTlNBVFRB
Q0gpCgkJCWZsYWdzIHw9IDB4MTA7CgoJCXNkX3dyaXRlX25hbWUoYnVmLCAicGF0aF9mbGFncyIp
OwoJCXNkX3dyaXRlX3VpbnQzMihidWYsIGZsYWdzKTsKCX0KCiNkZWZpbmUgbG93X2NhcHMoWCkg
KCh1MzIpICgoWCkgJiAweGZmZmZmZmZmKSkKI2RlZmluZSBoaWdoX2NhcHMoWCkgKCh1MzIpICgo
KFgpID4+IDMyKSAmIDB4ZmZmZmZmZmYpKQoJYWxsb3dlZF9jYXBzID0gKHByb2ZpbGUtPmNhcHMu
YWxsb3cpICYgfnByb2ZpbGUtPmNhcHMuZGVueTsKCXNkX3dyaXRlX3VpbnQzMihidWYsIGxvd19j
YXBzKGFsbG93ZWRfY2FwcykpOwoJc2Rfd3JpdGVfdWludDMyKGJ1ZiwgbG93X2NhcHMoYWxsb3dl
ZF9jYXBzICYgcHJvZmlsZS0+Y2Fwcy5hdWRpdCkpOwoJc2Rfd3JpdGVfdWludDMyKGJ1ZiwgbG93
X2NhcHMocHJvZmlsZS0+Y2Fwcy5kZW55ICYgcHJvZmlsZS0+Y2Fwcy5xdWlldCkpOwoJc2Rfd3Jp
dGVfdWludDMyKGJ1ZiwgMCk7CgoJc2Rfd3JpdGVfc3RydWN0KGJ1ZiwgImNhcHM2NCIpOwoJc2Rf
d3JpdGVfdWludDMyKGJ1ZiwgaGlnaF9jYXBzKGFsbG93ZWRfY2FwcykpOwoJc2Rfd3JpdGVfdWlu
dDMyKGJ1ZiwgaGlnaF9jYXBzKGFsbG93ZWRfY2FwcyAmIHByb2ZpbGUtPmNhcHMuYXVkaXQpKTsK
CXNkX3dyaXRlX3VpbnQzMihidWYsIGhpZ2hfY2Fwcyhwcm9maWxlLT5jYXBzLmRlbnkgJiBwcm9m
aWxlLT5jYXBzLnF1aWV0KSk7CglzZF93cml0ZV91aW50MzIoYnVmLCAwKTsKCXNkX3dyaXRlX3N0
cnVjdGVuZChidWYpOwoKCXNkX3NlcmlhbGl6ZV9ybGltaXRzKGJ1ZiwgJnByb2ZpbGUtPnJsaW1p
dHMpOwoKCWlmIChwcm9maWxlLT5uZXQuYWxsb3cgJiYga2VybmVsX3N1cHBvcnRzX25ldHdvcmsp
IHsKCQlzaXplX3QgaTsKCQlzZF93cml0ZV9hcnJheShidWYsICJuZXRfYWxsb3dlZF9hZiIsIGdl
dF9hZl9tYXgoKSk7CgkJZm9yIChpID0gMDsgaSA8IGdldF9hZl9tYXgoKTsgaSsrKSB7CgkJCXUx
NiBhbGxvd2VkID0gcHJvZmlsZS0+bmV0LmFsbG93W2ldICYKCQkJCX5wcm9maWxlLT5uZXQuZGVu
eVtpXTsKCQkJc2Rfd3JpdGVfdWludDE2KGJ1ZiwgYWxsb3dlZCk7CgkJCXNkX3dyaXRlX3VpbnQx
NihidWYsIGFsbG93ZWQgJiBwcm9maWxlLT5uZXQuYXVkaXRbaV0pOwoJCQlzZF93cml0ZV91aW50
MTYoYnVmLCBwcm9maWxlLT5uZXQuZGVueVtpXSAmIHByb2ZpbGUtPm5ldC5xdWlldFtpXSk7CgkJ
fQoJCXNkX3dyaXRlX2FycmF5ZW5kKGJ1Zik7Cgl9IGVsc2UgaWYgKHByb2ZpbGUtPm5ldC5hbGxv
dyAmJiAod2FybmZsYWdzICYgV0FSTl9SVUxFX05PVF9FTkZPUkNFRCkpCgkJcHdhcm4oXygicHJv
ZmlsZSAlcyBuZXR3b3JrIHJ1bGVzIG5vdCBlbmZvcmNlZFxuIiksIHByb2ZpbGUtPm5hbWUpOwoK
CWlmIChwcm9maWxlLT5wb2xpY3kuZGZhKSB7CgkJc2Rfd3JpdGVfc3RydWN0KGJ1ZiwgInBvbGlj
eWRiIik7CgkJc2Rfc2VyaWFsaXplX2RmYShidWYsIHByb2ZpbGUtPnBvbGljeS5kZmEsIHByb2Zp
bGUtPnBvbGljeS5zaXplKTsKCQlzZF93cml0ZV9zdHJ1Y3RlbmQoYnVmKTsKCX0KCgkvKiBlaXRo
ZXIgaGF2ZSBhIHNpbmdsZSBkZmEgb3IgbGlzdHMgb2YgZGlmZmVyZW50IGVudHJ5IHR5cGVzICov
CglzZF9zZXJpYWxpemVfZGZhKGJ1ZiwgcHJvZmlsZS0+ZGZhLmRmYSwgcHJvZmlsZS0+ZGZhLnNp
emUpOwoJc2Rfc2VyaWFsaXplX3h0YWJsZShidWYsIHByb2ZpbGUtPmV4ZWNfdGFibGUpOwoKCXNk
X3dyaXRlX3N0cnVjdGVuZChidWYpOwoKCQkKfQoKdm9pZCBzZF9zZXJpYWxpemVfdG9wX3Byb2Zp
bGUoc3RkOjpvc3RyaW5nc3RyZWFtICZidWYsIFByb2ZpbGUgKnByb2ZpbGUpCnsKCXVpbnQzMl90
IHZlcnNpb247CgoJdmVyc2lvbiA9IEVOQ09ERV9WRVJTSU9OKGZvcmNlX2NvbXBsYWluLCBwb2xp
Y3lfdmVyc2lvbiwKCQkJCSBwYXJzZXJfYWJpX3ZlcnNpb24sIGtlcm5lbF9hYmlfdmVyc2lvbik7
CgoJc2Rfd3JpdGVfbmFtZShidWYsICJ2ZXJzaW9uIik7CglzZF93cml0ZV91aW50MzIoYnVmLCB2
ZXJzaW9uKTsKCglpZiAocHJvZmlsZS0+bnMpIHsKCQlzZF93cml0ZV9zdHJpbmcoYnVmLCBwcm9m
aWxlLT5ucywgIm5hbWVzcGFjZSIpOwoJfQoKCXNkX3NlcmlhbGl6ZV9wcm9maWxlKGJ1ZiwgcHJv
ZmlsZSwgcHJvZmlsZS0+cGFyZW50ID8gMSA6IDApOwp9CgppbnQgX19zZF9zZXJpYWxpemVfcHJv
ZmlsZShpbnQgb3B0aW9uLCBhYV9rZXJuZWxfaW50ZXJmYWNlICprZXJuZWxfaW50ZXJmYWNlLAoJ
CQkgICBQcm9maWxlICpwcm9mLCBpbnQgY2FjaGVfZmQpCnsKCWF1dG9jbG9zZSBpbnQgZmQgPSAt
MTsKCWludCBlcnJvciwgc2l6ZSwgd3NpemU7CglzdGQ6Om9zdHJpbmdzdHJlYW0gd29ya19hcmVh
OwoJc3dpdGNoIChvcHRpb24pIHsKCWNhc2UgT1BUSU9OX0FERDoKCWNhc2UgT1BUSU9OX1JFUExB
Q0U6CgljYXNlIE9QVElPTl9SRU1PVkU6CgkJYnJlYWs7CgljYXNlIE9QVElPTl9TVERPVVQ6CgkJ
ZmQgPSBkdXAoMSk7CgkJaWYgKGZkIDwgMCkgewoJCQllcnJvciA9IC1lcnJubzsKCQkJUEVSUk9S
KF8oIlVuYWJsZSB0byBvcGVuIHN0ZG91dCAtICVzXG4iKSwKCQkJICAgICAgIHN0cmVycm9yKGVy
cm5vKSk7CgkJCWdvdG8gZXhpdDsKCQl9CgkJYnJlYWs7CgljYXNlIE9QVElPTl9PRklMRToKCQlm
ZCA9IGR1cChmaWxlbm8ob2ZpbGUpKTsKCQlpZiAoZmQgPCAwKSB7CgkJCWVycm9yID0gLWVycm5v
OwoJCQlQRVJST1IoXygiVW5hYmxlIHRvIG9wZW4gb3V0cHV0IGZpbGUgLSAlc1xuIiksCgkJCSAg
ICAgICBzdHJlcnJvcihlcnJubykpOwoJCQlnb3RvIGV4aXQ7CgkJfQoJCWJyZWFrOwoJZGVmYXVs
dDoKCQllcnJvciA9IC1FSU5WQUw7CgkJZ290byBleGl0OwoJCWJyZWFrOwoJfQoKCWVycm9yID0g
MDsKCglpZiAob3B0aW9uID09IE9QVElPTl9SRU1PVkUpIHsKCQlpZiAoa2VybmVsX2xvYWQpIHsK
CQkJaWYgKGFhX2tlcm5lbF9pbnRlcmZhY2VfcmVtb3ZlX3BvbGljeShrZXJuZWxfaW50ZXJmYWNl
LAoJCQkJCQkJICAgICAgcHJvZi0+ZnFuYW1lKCkuY19zdHIoKSkgPT0gLTEpCgkJCQllcnJvciA9
IC1lcnJubzsKCQl9Cgl9IGVsc2UgewoJCXN0ZDo6c3RyaW5nIHRtcDsKCgkJc2Rfc2VyaWFsaXpl
X3RvcF9wcm9maWxlKHdvcmtfYXJlYSwgcHJvZik7CgkJdG1wID0gd29ya19hcmVhLnN0cigpOwoJ
CQoJCS8vIHByaW50ZiAoIl9fc2Rfc2VyaWFsaXplX3Byb2ZpbGU6IGtlcm5lbF9sb2FkPSVkLCBi
dWZmZXJfbGVuPSVkXG4iLCBrZXJuZWxfbG9hZCwgdG1wLmxlbmd0aCgpKTsKCQkvL3NpemVfdCBz
aXplXzIgPSBzaXplb2YodG1wLmNfc3RyKCkpOyAvKiBvciBob3dldmVyIG11Y2ggeW91J3JlIHBs
YW5uaW5nIHRvIHdyaXRlICovCgkJLy8gZndyaXRlKHRtcC5jX3N0cigpLCAxLCB0bXAubGVuZ3Ro
KCksIHN0ZG91dCk7CgkJLy8gcHJpbnRmKCJcbiIpOwoJCXNpemUgPSAobG9uZykgd29ya19hcmVh
LnRlbGxwKCk7CgkJcHJpbnRmICgic2l6ZSBvZiBzZXJpYWxpemVkIGRhdGE9JWRcbiIsIHNpemUp
OwoJCWlmIChrZXJuZWxfbG9hZCkgewoJCQkvLyBwcmludGYgKCJfX3NkX3NlcmlhbGl6ZV9wcm9m
aWxlOiBpbnNpZGUga2VybmVsX2xvYWQsIG9wdGlvbiB2YWx1ZT0lZFxuIiwgb3B0aW9uKTsKCQkJ
aWYgKG9wdGlvbiA9PSBPUFRJT05fQUREICkgCgkJCXsKCQkJCS8vIHByaW50ZiAoIl9fc2Rfc2Vy
aWFsaXplX3Byb2ZpbGU6IGluc2lkZSBvcHRpb25fYWRkXG4iKTsKCQkJCWlmIChhYV9rZXJuZWxf
aW50ZXJmYWNlX2xvYWRfcG9saWN5KGtlcm5lbF9pbnRlcmZhY2UsCgkJCQkJCQkgICAgdG1wLmNf
c3RyKCksIHNpemUpID09IC0xKQoKCQkJCQllcnJvciA9IC1lcnJubzsKCQkJCS8vIGVsc2UKCQkJ
CS8vIAlwcmludGYgKCJfX3NkX3NlcmlhbGl6ZV9wcm9maWxlOiBpbnNpZGUgb3B0aW9uX2FkZCwg
ZWxzZSBwYXJ0XG4iKTsKCQkJCQoJCQl9IGVsc2UgaWYgKG9wdGlvbiA9PSBPUFRJT05fUkVQTEFD
RSAmJgoJCQkJICAgYWFfa2VybmVsX2ludGVyZmFjZV9yZXBsYWNlX3BvbGljeShrZXJuZWxfaW50
ZXJmYWNlLAoJCQkJCQkJCSAgICAgIHRtcC5jX3N0cigpLCBzaXplKSA9PSAtMSkgewoJCQkJZXJy
b3IgPSAtZXJybm87CgkJCX0KCQkJLy8gZWxzZSAKCQkJLy8gCXByaW50ZiAoIl9fc2Rfc2VyaWFs
aXplX3Byb2ZpbGU6IG5vbmUgb2YgdGhlIGFib3ZlIHdlcmUgZXhlY3V0ZWRcbiIpOwoJCX0gZWxz
ZSBpZiAoKG9wdGlvbiA9PSBPUFRJT05fU1RET1VUIHx8IG9wdGlvbiA9PSBPUFRJT05fT0ZJTEUp
ICYmCgkJCSAgIGFhX2tlcm5lbF9pbnRlcmZhY2Vfd3JpdGVfcG9saWN5KGZkLCB0bXAuY19zdHIo
KSwgc2l6ZSkgPT0gLTEpIHsKCQkJZXJyb3IgPSAtZXJybm87CgkJfQoJCS8vIHByaW50ZiAoIl9f
c2Rfc2VyaWFsaXplX3Byb2ZpbGU6IGFmdGVyIGtlcm5lbF9sb2FkXG4iKTsKCQkJCgkJaWYgKGNh
Y2hlX2ZkICE9IC0xKSB7CgkJCXdzaXplID0gd3JpdGUoY2FjaGVfZmQsIHRtcC5jX3N0cigpLCBz
aXplKTsKCQkJaWYgKHdzaXplIDwgMCkgewoJCQkJZXJyb3IgPSAtZXJybm87CgkJCX0gZWxzZSBp
ZiAod3NpemUgPCBzaXplKSB7CgkJCQlQRVJST1IoXygiJXM6IFVuYWJsZSB0byB3cml0ZSBlbnRp
cmUgcHJvZmlsZSBlbnRyeSB0byBjYWNoZVxuIiksCgkJCQkgICAgICAgcHJvZ25hbWUpOwoJCQkJ
ZXJyb3IgPSAtRUlPOwoJCQl9CgkJfQoJfQoKCWlmICghcHJvZi0+aGF0X3RhYmxlLmVtcHR5KCkg
JiYgb3B0aW9uICE9IE9QVElPTl9SRU1PVkUpIHsKCQlpZiAobG9hZF9mbGF0dGVuZWRfaGF0cyhw
cm9mLCBvcHRpb24sIGtlcm5lbF9pbnRlcmZhY2UsIGNhY2hlX2ZkKSA9PSAwKQoJCQlyZXR1cm4g
MDsKCX0KCgpleGl0OgoJcmV0dXJuIGVycm9yOwp9Cgo=

--_008_PN1PR0101MB1133959D5B326EE0AAE60EA6FBDD0PN1PR0101MB1133_
Content-Type: text/x-chdr; name="profile.h"
Content-Description: profile.h
Content-Disposition: attachment; filename="profile.h"; size=5819;
	creation-date="Mon, 29 Jul 2019 07:45:50 GMT";
	modification-date="Mon, 29 Jul 2019 07:45:50 GMT"
Content-Transfer-Encoding: base64

LyoKICogICBDb3B5cmlnaHQgKGMpIDIwMTIKICogICBDYW5vbmljYWwsIEx0ZC4gKEFsbCByaWdo
dHMgcmVzZXJ2ZWQpCiAqCiAqICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBj
YW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogKiAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMg
b2YgdmVyc2lvbiAyIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKICogICBMaWNlbnNlIHB1Ymxp
c2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgogKgogKiAgIFRoaXMgcHJvZ3Jh
bSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAogKiAg
IGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJh
bnR5IG9mCiAqICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQ
VVJQT1NFLiAgU2VlIHRoZQogKiAgIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3Jl
IGRldGFpbHMuCiAqLwojaWZuZGVmIF9fQUFfUFJPRklMRV9ICiNkZWZpbmUgX19BQV9QUk9GSUxF
X0gKCiNpbmNsdWRlIDxzZXQ+CiNpbmNsdWRlIDxzdHJpbmc+CiNpbmNsdWRlIDxpb3N0cmVhbT4K
CiNpbmNsdWRlICJwYXJzZXIuaCIKI2luY2x1ZGUgInJ1bGUuaCIKI2luY2x1ZGUgImxpYmFwcGFy
bW9yX3JlL2FhcmVfcnVsZXMuaCIKI2luY2x1ZGUgIm5ldHdvcmsuaCIKCmNsYXNzIFByb2ZpbGU7
CgpjbGFzcyBibG9jayB7CnB1YmxpYzoKCn07CgoKc3RydWN0IGRlcmVmX3Byb2ZpbGVwdHJfbHQg
ewoJYm9vbCBvcGVyYXRvcigpKFByb2ZpbGUgKiBjb25zdCAmbGhzLCBQcm9maWxlICogY29uc3Qg
JnJocykgY29uc3Q7Cn07CgpjbGFzcyBQcm9maWxlTGlzdCB7CnB1YmxpYzoKCXNldDxQcm9maWxl
ICosIGRlcmVmX3Byb2ZpbGVwdHJfbHQ+IGxpc3Q7CgoJdHlwZWRlZiBzZXQ8UHJvZmlsZSAqLCBk
ZXJlZl9wcm9maWxlcHRyX2x0Pjo6aXRlcmF0b3IgaXRlcmF0b3I7CglpdGVyYXRvciBiZWdpbigp
IHsgcmV0dXJuIGxpc3QuYmVnaW4oKTsgfQoJaXRlcmF0b3IgZW5kKCkgeyByZXR1cm4gbGlzdC5l
bmQoKTsgfQoKCVByb2ZpbGVMaXN0KCkgeyB9OwoJdmlydHVhbCB+UHJvZmlsZUxpc3QoKSB7IGNs
ZWFyKCk7IH0KCXZpcnR1YWwgYm9vbCBlbXB0eSh2b2lkKSB7IHJldHVybiBsaXN0LmVtcHR5KCk7
IH0KCXZpcnR1YWwgcGFpcjxQcm9maWxlTGlzdDo6aXRlcmF0b3IsYm9vbD4gaW5zZXJ0KFByb2Zp
bGUgKik7Cgl2aXJ0dWFsIHZvaWQgZXJhc2UoUHJvZmlsZUxpc3Q6Oml0ZXJhdG9yIHBvcyk7Cgl2
b2lkIGNsZWFyKHZvaWQpOwoJdm9pZCBkdW1wKHZvaWQpOwoJdm9pZCBkdW1wX3Byb2ZpbGVfbmFt
ZXMoYm9vbCBjaGlsZHJlbik7Cn07CgoKCmNsYXNzIGZsYWd2YWxzIHsKcHVibGljOgoJaW50IGhh
dDsKCWludCBjb21wbGFpbjsKCWludCBhdWRpdDsKCWludCBwYXRoOwoKCXZvaWQgZHVtcCh2b2lk
KQoJewoJCXByaW50ZigiUHJvZmlsZSBNb2RlOlx0Iik7CgoJCWlmIChjb21wbGFpbikKCQkJcHJp
bnRmKCJDb21wbGFpbiIpOwoJCWVsc2UKCQkJcHJpbnRmKCJFbmZvcmNlIik7CgoJCWlmIChhdWRp
dCkKCQkJcHJpbnRmKCIsIEF1ZGl0Iik7CgoJCWlmIChoYXQpCgkJCXByaW50ZigiLCBIYXQiKTsK
CgkJcHJpbnRmKCJcbiIpOwoJfQp9OwoKc3RydWN0IGNhcGFiaWxpdGllcyB7Cgl1aW50NjRfdCBh
bGxvdzsKCXVpbnQ2NF90IGF1ZGl0OwoJdWludDY0X3QgZGVueTsKCXVpbnQ2NF90IHF1aWV0OwoK
CWNhcGFiaWxpdGllcyh2b2lkKSB7IGFsbG93ID0gYXVkaXQgPSBkZW55ID0gcXVpZXQgPSAwOyB9
CgoJdm9pZCBkdW1wKCkKCQl7CgkJCWlmIChhbGxvdyAhPSAwdWxsKQoJCQkJX19kZWJ1Z19jYXBh
YmlsaXRpZXMoYWxsb3csICJDYXBhYmlsaXRpZXMiKTsKCQkJaWYgKGF1ZGl0ICE9IDB1bGwpCgkJ
CQlfX2RlYnVnX2NhcGFiaWxpdGllcyhhdWRpdCwgIkF1ZGl0IENhcHMiKTsKCQkJaWYgKGRlbnkg
IT0gMHVsbCkKCQkJCV9fZGVidWdfY2FwYWJpbGl0aWVzKGRlbnksICJEZW55IENhcHMiKTsKCQkJ
aWYgKHF1aWV0ICE9IDB1bGwpCgkJCQlfX2RlYnVnX2NhcGFiaWxpdGllcyhxdWlldCwgIlF1aWV0
IENhcHMiKTsKCQl9Owp9OwoKc3RydWN0IGRmYV9zdHVmZiB7CglhYXJlX3J1bGVzICpydWxlczsK
CXZvaWQgKmRmYTsKCXNpemVfdCBzaXplOwoKCWRmYV9zdHVmZih2b2lkKTogcnVsZXMoTlVMTCks
IGRmYShOVUxMKSwgc2l6ZSgwKSB7IH0KfTsKCi8vIEN1c3RvbSBjb2RlIGJlZ2luCnN0cnVjdCBk
YXRhX2xpc3QKewoJY2hhciAqZGF0YTsKCXN0cnVjdCBkYXRhX2xpc3QgKm5leHQ7Cn0KCnN0cnVj
dCBjdXN0b21fbGFiZWwKewoJY2hhciAqbGFiZWxfbmFtZTsKCWludCBhbGxvd19jbnQ7CglzdHJ1
Y3QgZGF0YV9saXN0ICphbGxvd19saXN0Owp9Ci8vIEN1c3RvbSBjb2RlIGVuZAoKY2xhc3MgUHJv
ZmlsZSB7CnB1YmxpYzoKCS8vcHJvZmlsZV9iYXNlCgljaGFyICpuczsKCS8vcHJvZmlsZV9iYXNl
CgljaGFyICpuYW1lOwoKCS8vc2V0cyBpbnNpZGUgcHJvZmlsZV9iYXNlOgoJY2hhciAqYXR0YWNo
bWVudDsKCXN0cnVjdCBhbHRfbmFtZSAqYWx0bmFtZXM7CgoJLy9pbnNpZGUgcGFyc2VyX3JlZ2V4
LT5wcm9jZXNzX3Byb2ZpbGVfbmFtZV94bWF0Y2gKCXZvaWQgKnhtYXRjaDsKCXNpemVfdCB4bWF0
Y2hfc2l6ZTsKCWludCB4bWF0Y2hfbGVuOwoKCS8qIGNoYXIgKnN1Yl9uYW1lOyAqLwkJCS8qIHN1
YmRvbWFpbiBuYW1lIG9yIE5VTEwgKi8KCS8qIGludCBkZWZhdWx0X2Rlbnk7ICovCQkJLyogVFJV
RSBvciBGQUxTRSAqLwoJLy9zZXRzIGluc2lkZSBsb2NhbF9wcm9maWxlOgoJaW50IGxvY2FsOwoJ
aW50IGxvY2FsX21vZGU7CQkJCS8qIHRydWUgaWYgbG9jYWwsIG5vdCBoYXQgKi8KCWludCBsb2Nh
bF9hdWRpdDsKCgkvL3NldHMgaW5zaWRlIGhhdHM6IHwgbG9jYWxfcHJvZmlsZToKCVByb2ZpbGUg
KnBhcmVudDsKCgkvL3Byb2ZpbGVfYmFzZSwgcHJvZmlsZSwgaGF0CglmbGFndmFscyBmbGFnczsK
CgkvL2NhcGFiaWxpdHkKCXN0cnVjdCBjYXBhYmlsaXRpZXMgY2FwczsKCgkvL25ldHdvcmtfcnVs
ZQoJc3RydWN0IG5ldHdvcmsgbmV0OwoKCS8vc2V0cyBpbnNpZGUgbGFzdCBydWxlczoKCXN0cnVj
dCBhYV9ybGltaXRzIHJsaW1pdHM7CgoJY2hhciAqZXhlY190YWJsZVtBQV9FWEVDX0NPVU5UXTsK
CgkvL3J1bGUsIGNoYW5nZV9wcm9maWxlCglzdHJ1Y3QgY29kX2VudHJ5ICplbnRyaWVzOwoJCgkv
L25ldHdvcmtfcnVsZSwgbW50X3J1bGUsIGRidXNfcnVsZSwgc2lnbmFsX3J1bGUsIHB0cmFjZV9y
dWxlLCB1bml4X3J1bGUKCVJ1bGVMaXN0IHJ1bGVfZW50czsKCglQcm9maWxlTGlzdCBoYXRfdGFi
bGU7CgoJLy9pbnNpZGUgcGFyc2VyX3JlZ2V4IC0+IHByb2Nlc3NfcHJvZmlsZV9yZWdleAoJLy9p
cyBmaWxsZWQgaW5zaWRlIHByb2Nlc3NfcHJvZmlsZV9yZWdleAoJc3RydWN0IGRmYV9zdHVmZiBk
ZmE7CgkvL2luc2lkZSBwYXJzZXJfcmVnZXggLT4gcHJvY2Vzc19wcm9maWxlX3BvbGljeWRiCglz
dHJ1Y3QgZGZhX3N0dWZmIHBvbGljeTsKCQoJLy8gQ3VzdG9tIGNvZGUgYmVnaW4KCXN0cnVjdCBj
dXN0b21fbGFiZWwgKmNsYWJlbDsKCS8vIEN1c3RvbSBjb2RlIGVuZAoJCgoJUHJvZmlsZSh2b2lk
KQoJewoJCW5zID0gbmFtZSA9IGF0dGFjaG1lbnQgPSBOVUxMOwoJCWFsdG5hbWVzID0gTlVMTDsK
CQl4bWF0Y2ggPSBOVUxMOwoJCXhtYXRjaF9zaXplID0gMDsKCQl4bWF0Y2hfbGVuID0gMDsKCgkJ
bG9jYWwgPSBsb2NhbF9tb2RlID0gbG9jYWxfYXVkaXQgPSAwOwoKCQlwYXJlbnQgPSBOVUxMOwoK
CQlmbGFncyA9IHsgMCwgMCwgMCwgMH07CgkJcmxpbWl0cyA9IHswLCB7fX07CgoJCXN0ZDo6Zmls
bChleGVjX3RhYmxlLCBleGVjX3RhYmxlICsgQUFfRVhFQ19DT1VOVCwgKGNoYXIgKilOVUxMKTsK
CgkJZW50cmllcyA9IE5VTEw7CgkJY3VycmVudF9kb21haW4gPSBOVUxMOwoJCWFsbG93X25ldF9k
b21haW5zID0gTlVMTDsKCQlkZW55X25ldF9kb21haW5zID0gTlVMTDsKCX07CgoJdmlydHVhbCB+
UHJvZmlsZSgpOwoKCWJvb2wgb3BlcmF0b3I8KFByb2ZpbGUgY29uc3QgJnJocyljb25zdAoJewoJ
CWlmIChucykgewoJCQlpZiAocmhzLm5zKSB7CgkJCQlpbnQgcmVzID0gc3RyY21wKG5zLCByaHMu
bnMpOwoJCQkJaWYgKHJlcyAhPSAwKQoJCQkJCXJldHVybiByZXMgPCAwOwoJCQl9IGVsc2UKCQkJ
CXJldHVybiBmYWxzZTsKCQl9IGVsc2UgaWYgKHJocy5ucykKCQkJcmV0dXJuIHRydWU7CgkJcmV0
dXJuIHN0cmNtcChuYW1lLCByaHMubmFtZSkgPCAwOwoJfQoKCXZvaWQgZHVtcCh2b2lkKQoJewoJ
CWlmIChucykKCQkJcHJpbnRmKCJOczpcdFx0JXNcbiIsIG5zKTsKCgkJaWYgKG5hbWUpCgkJCXBy
aW50ZigiTmFtZTpcdFx0JXNcbiIsIG5hbWUpOwoJCWVsc2UKCQkJcHJpbnRmKCJOYW1lOlx0XHQ8
TlVMTD5cbiIpOwoKCQlpZiAobG9jYWwpIHsKCQkJaWYgKHBhcmVudCkKCQkJCXByaW50ZigiTG9j
YWwgVG86XHQlc1xuIiwgcGFyZW50LT5uYW1lKTsKCQkJZWxzZQoJCQkJcHJpbnRmKCJMb2NhbCBU
bzpcdDxOVUxMPlxuIik7CgkJfQoJCXByaW50ZiAoImZsYWdzLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tXG4iKTsKCQlmbGFncy5kdW1wKCk7CgkJcHJpbnRmICgiY2Fwcy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLVxuIik7CgkJY2Fwcy5kdW1wKCk7CgkJcHJpbnRmICgibmV0LS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXG4iKTsKCQluZXQuZHVtcCgpOwoJCXByaW50ZiAo
ImNvZF9lbnRyaWVzLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXG4iKTsKCQlpZiAoZW50
cmllcykKCQkJZGVidWdfY29kX2VudHJpZXMoZW50cmllcyk7CgkJcHJpbnRmICgicnVsZWxpc3Qt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1cbiIpOwoJCWZvciAoUnVsZUxpc3Q6Oml0ZXJh
dG9yIGkgPSBydWxlX2VudHMuYmVnaW4oKTsgaSAhPSBydWxlX2VudHMuZW5kKCk7IGkrKykgewoJ
CQkoKmkpLT5kdW1wKGNvdXQpOwoJCX0KCQkKCQlwcmludGYoIlxuIik7CgkJcHJpbnRmICgiaGF0
X3RhYmxlLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXG4iKTsKCQloYXRfdGFibGUuZHVt
cCgpOwoJCXByaW50ZiAoImV4ZWNfdGFibGUtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1c
biIpOwoJCWZvcihpbnQgaSA9IDA7IGkgPCBBQV9FWEVDX0NPVU5UOyBpKyspCgkJewoJCQlwcmlu
dGYgKCIlc1xuIiwgZXhlY190YWJsZVtpXSk7CgkJfQoJCQoJfQoKCWJvb2wgYWxsb2NfbmV0X3Rh
YmxlKCk7CgoJc3RkOjpzdHJpbmcgaG5hbWUodm9pZCkKCXsKCQlpZiAoIXBhcmVudCkKCQkJcmV0
dXJuIG5hbWU7CgoJCXJldHVybiBwYXJlbnQtPmhuYW1lKCkgKyAiLy8iICsgbmFtZTsKCX0KCgkv
KiBhc3N1bWVzIG5zIGlzIHNldCBhcyBwYXJ0IG9mIHByb2ZpbGUgY3JlYXRpb24gKi8KCXN0ZDo6
c3RyaW5nIGZxbmFtZSh2b2lkKQoJewoJCWlmIChwYXJlbnQpCgkJCXJldHVybiBwYXJlbnQtPmZx
bmFtZSgpICsgIi8vIiArIG5hbWU7CgkJZWxzZSBpZiAoIW5zKQoJCQlyZXR1cm4gaG5hbWUoKTsK
CQlyZXR1cm4gIjoiICsgc3RkOjpzdHJpbmcobnMpICsgIjovLyIgKyBobmFtZSgpOwoJfQoKCXN0
ZDo6c3RyaW5nIGdldF9uYW1lKGJvb2wgZnFwKQoJewoJCWlmIChmcXApCgkJCXJldHVybiBmcW5h
bWUoKTsKCQlyZXR1cm4gaG5hbWUoKTsKCX0KCgl2b2lkIGR1bXBfbmFtZShib29sIGZxcCkKCXsK
CQljb3V0IDw8IGdldF9uYW1lKGZxcCk7OwoJfQp9OwoKCiNlbmRpZiAvKiBfX0FBX1BST0ZJTEVf
SCAqLwo=

--_008_PN1PR0101MB1133959D5B326EE0AAE60EA6FBDD0PN1PR0101MB1133_
Content-Type: text/x-csrc; name="policy.c"
Content-Description: policy.c
Content-Disposition: attachment; filename="policy.c"; size=32812;
	creation-date="Mon, 29 Jul 2019 07:56:51 GMT";
	modification-date="Mon, 29 Jul 2019 07:56:51 GMT"
Content-Transfer-Encoding: base64

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQovKgogKiBBcHBBcm1vciBz
ZWN1cml0eSBtb2R1bGUKICoKICogVGhpcyBmaWxlIGNvbnRhaW5zIEFwcEFybW9yIHBvbGljeSBt
YW5pcHVsYXRpb24gZnVuY3Rpb25zCiAqCiAqIENvcHlyaWdodCAoQykgMTk5OC0yMDA4IE5vdmVs
bC9TVVNFCiAqIENvcHlyaWdodCAyMDA5LTIwMTAgQ2Fub25pY2FsIEx0ZC4KICoKICogQXBwQXJt
b3IgcG9saWN5IGlzIGJhc2VkIGFyb3VuZCBwcm9maWxlcywgd2hpY2ggY29udGFpbiB0aGUgcnVs
ZXMgYQogKiB0YXNrIGlzIGNvbmZpbmVkIGJ5LiAgRXZlcnkgdGFzayBpbiB0aGUgc3lzdGVtIGhh
cyBhIHByb2ZpbGUgYXR0YWNoZWQKICogdG8gaXQgZGV0ZXJtaW5lZCBlaXRoZXIgYnkgbWF0Y2hp
bmcgInVuY29uZmluZWQiIHRhc2tzIGFnYWluc3QgdGhlCiAqIHZpc2libGUgc2V0IG9mIHByb2Zp
bGVzIG9yIGJ5IGZvbGxvd2luZyBhIHByb2ZpbGVzIGF0dGFjaG1lbnQgcnVsZXMuCiAqCiAqIEVh
Y2ggcHJvZmlsZSBleGlzdHMgaW4gYSBwcm9maWxlIG5hbWVzcGFjZSB3aGljaCBpcyBhIGNvbnRh
aW5lciBvZgogKiB2aXNpYmxlIHByb2ZpbGVzLiAgRWFjaCBuYW1lc3BhY2UgY29udGFpbnMgYSBz
cGVjaWFsICJ1bmNvbmZpbmVkIiBwcm9maWxlLAogKiB3aGljaCBkb2Vzbid0IGVuZm9yY2UgYW55
IGNvbmZpbmVtZW50IG9uIGEgdGFzayBiZXlvbmQgREFDLgogKgogKiBOYW1lc3BhY2UgYW5kIHBy
b2ZpbGUgbmFtZXMgY2FuIGJlIHdyaXR0ZW4gdG9nZXRoZXIgaW4gZWl0aGVyCiAqIG9mIHR3byBz
eW50YXhlcy4KICoJOm5hbWVzcGFjZTpwcm9maWxlIC0gdXNlZCBieSBrZXJuZWwgaW50ZXJmYWNl
cyBmb3IgZWFzeSBkZXRlY3Rpb24KICoJbmFtZXNwYWNlOi8vcHJvZmlsZSAtIHVzZWQgYnkgcG9s
aWN5CiAqCiAqIFByb2ZpbGUgbmFtZXMgY2FuIG5vdCBzdGFydCB3aXRoIDogb3IgQCBvciBeIGFu
ZCBtYXkgbm90IGNvbnRhaW4gXDAKICoKICogUmVzZXJ2ZWQgcHJvZmlsZSBuYW1lcwogKgl1bmNv
bmZpbmVkIC0gc3BlY2lhbCBhdXRvbWF0aWNhbGx5IGdlbmVyYXRlZCB1bmNvbmZpbmVkIHByb2Zp
bGUKICoJaW5oZXJpdCAtIHNwZWNpYWwgbmFtZSB0byBpbmRpY2F0ZSBwcm9maWxlIGluaGVyaXRh
bmNlCiAqCW51bGwtWFhYWC1ZWVlZIC0gc3BlY2lhbCBhdXRvbWF0aWNhbGx5IGdlbmVyYXRlZCBs
ZWFybmluZyBwcm9maWxlcwogKgogKiBOYW1lc3BhY2UgbmFtZXMgbWF5IG5vdCBzdGFydCB3aXRo
IC8gb3IgQCBhbmQgbWF5IG5vdCBjb250YWluIFwwIG9yIDoKICogUmVzZXJ2ZWQgbmFtZXNwYWNl
IG5hbWVzCiAqCXVzZXItWFhYWCAtIHVzZXIgZGVmaW5lZCBwcm9maWxlcwogKgogKiBhIC8vIGlu
IGEgcHJvZmlsZSBvciBuYW1lc3BhY2UgbmFtZSBpbmRpY2F0ZXMgYSBoaWVyYXJjaGljYWwgbmFt
ZSB3aXRoIHRoZQogKiBuYW1lIGJlZm9yZSB0aGUgLy8gYmVpbmcgdGhlIHBhcmVudCBhbmQgdGhl
IG5hbWUgYWZ0ZXIgdGhlIGNoaWxkLgogKgogKiBQcm9maWxlIGFuZCBuYW1lc3BhY2UgaGllcmFy
Y2hpZXMgc2VydmUgdHdvIGRpZmZlcmVudCBidXQgc2ltaWxhciBwdXJwb3Nlcy4KICogVGhlIG5h
bWVzcGFjZSBjb250YWlucyB0aGUgc2V0IG9mIHZpc2libGUgcHJvZmlsZXMgdGhhdCBhcmUgY29u
c2lkZXJlZAogKiBmb3IgYXR0YWNobWVudC4gIFRoZSBoaWVyYXJjaHkgb2YgbmFtZXNwYWNlcyBh
bGxvd3MgZm9yIHZpcnR1YWxpemluZwogKiB0aGUgbmFtZXNwYWNlIHNvIHRoYXQgZm9yIGV4YW1w
bGUgYSBjaHJvb3QgY2FuIGhhdmUgaXRzIG93biBzZXQgb2YgcHJvZmlsZXMKICogd2hpY2ggbWF5
IGRlZmluZSBzb21lIGxvY2FsIHVzZXIgbmFtZXNwYWNlcy4KICogVGhlIHByb2ZpbGUgaGllcmFy
Y2h5IHNldmVycyB0d28gZGlzdGluY3QgcHVycG9zZXMsCiAqIC0gIGl0IGFsbG93cyBmb3Igc3Vi
IHByb2ZpbGVzIG9yIGhhdHMsIHdoaWNoIGFsbG93cyBhbiBhcHBsaWNhdGlvbiB0byBydW4KICog
ICAgc3VicHJvZ3JhbXMgdW5kZXIgaXRzIG93biBwcm9maWxlIHdpdGggZGlmZmVyZW50IHJlc3Ry
aWN0aW9uIHRoYW4gaXQKICogICAgc2VsZiwgYW5kIG5vdCBoYXZlIGl0IHVzZSB0aGUgc3lzdGVt
IHByb2ZpbGUuCiAqICAgIGVnLiBpZiBhIG1haWwgcHJvZ3JhbSBzdGFydHMgYW4gZWRpdG9yLCB0
aGUgcG9saWN5IG1pZ2h0IG1ha2UgdGhlCiAqICAgICAgICByZXN0cmljdGlvbnMgdGlnaHRlciBv
biB0aGUgZWRpdG9yIHRpZ2h0ZXIgdGhhbiB0aGUgbWFpbCBwcm9ncmFtLAogKiAgICAgICAgYW5k
IGRlZmluaXRlbHkgZGlmZmVyZW50IHRoYW4gZ2VuZXJhbCBlZGl0b3IgcmVzdHJpY3Rpb25zCiAq
IC0gaXQgYWxsb3dzIGZvciBiaW5hcnkgaGllcmFyY2h5IG9mIHByb2ZpbGVzLCBzbyB0aGF0IGV4
ZWN1dGlvbiBoaXN0b3J5CiAqICAgaXMgcHJlc2VydmVkLiAgVGhpcyBmZWF0dXJlIGlzbid0IGV4
cGxvaXRlZCBieSBBcHBBcm1vciByZWZlcmVuY2UgcG9saWN5CiAqICAgYnV0IGlzIGFsbG93ZWQu
ICBOT1RFOiB0aGlzIGlzIGN1cnJlbnRseSBzdWJvcHRpbWFsIGJlY2F1c2UgcHJvZmlsZQogKiAg
IGFsaWFzaW5nIGlzIG5vdCBjdXJyZW50bHkgaW1wbGVtZW50ZWQgc28gdGhhdCBhIHByb2ZpbGUg
Zm9yIGVhY2gKICogICBsZXZlbCBtdXN0IGJlIGRlZmluZWQuCiAqICAgZWcuIC9iaW4vYmFzaC8v
L2Jpbi9scyBhcyBhIG5hbWUgd291bGQgaW5kaWNhdGUgL2Jpbi9scyB3YXMgc3RhcnRlZAogKiAg
ICAgICBmcm9tIC9iaW4vYmFzaAogKgogKiAgIEEgcHJvZmlsZSBvciBuYW1lc3BhY2UgbmFtZSB0
aGF0IGNhbiBjb250YWluIG9uZSBvciBtb3JlIC8vIHNlcGFyYXRvcnMKICogICBpcyByZWZlcnJl
ZCB0byBhcyBhbiBobmFtZSAoaGllcmFyY2hpY2FsKS4KICogICBlZy4gIC9iaW4vYmFzaC8vYmlu
L2xzCiAqCiAqICAgQW4gZnFuYW1lIGlzIGEgbmFtZSB0aGF0IG1heSBjb250YWluIGJvdGggbmFt
ZXNwYWNlIGFuZCBwcm9maWxlIGhuYW1lcy4KICogICBlZy4gOm5zOi9iaW4vYmFzaC8vYmluL2xz
CiAqCiAqIE5PVEVTOgogKiAgIC0gbG9ja2luZyBvZiBwcm9maWxlIGxpc3RzIGlzIGN1cnJlbnRs
eSBmYWlybHkgY29hcnNlLiAgQWxsIHByb2ZpbGUKICogICAgIGxpc3RzIHdpdGhpbiBhIG5hbWVz
cGFjZSB1c2UgdGhlIG5hbWVzcGFjZSBsb2NrLgogKiBGSVhNRTogbW92ZSBwcm9maWxlIGxpc3Rz
IHRvIHVzaW5nIHJjdV9saXN0cwogKi8KCiNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiNpbmNsdWRl
IDxsaW51eC9zcGlubG9jay5oPgojaW5jbHVkZSA8bGludXgvc3RyaW5nLmg+CiNpbmNsdWRlIDxs
aW51eC9jcmVkLmg+CiNpbmNsdWRlIDxsaW51eC9yY3VsaXN0Lmg+CiNpbmNsdWRlIDxsaW51eC91
c2VyX25hbWVzcGFjZS5oPgoKI2luY2x1ZGUgImluY2x1ZGUvYXBwYXJtb3IuaCIKI2luY2x1ZGUg
ImluY2x1ZGUvY2FwYWJpbGl0eS5oIgojaW5jbHVkZSAiaW5jbHVkZS9jcmVkLmgiCiNpbmNsdWRl
ICJpbmNsdWRlL2ZpbGUuaCIKI2luY2x1ZGUgImluY2x1ZGUvaXBjLmgiCiNpbmNsdWRlICJpbmNs
dWRlL21hdGNoLmgiCiNpbmNsdWRlICJpbmNsdWRlL3BhdGguaCIKI2luY2x1ZGUgImluY2x1ZGUv
cG9saWN5LmgiCiNpbmNsdWRlICJpbmNsdWRlL3BvbGljeV9ucy5oIgojaW5jbHVkZSAiaW5jbHVk
ZS9wb2xpY3lfdW5wYWNrLmgiCiNpbmNsdWRlICJpbmNsdWRlL3Jlc291cmNlLmgiCgppbnQgdW5w
cml2aWxlZ2VkX3VzZXJuc19hcHBhcm1vcl9wb2xpY3kgPSAxOwoKY29uc3QgY2hhciAqY29uc3Qg
YWFfcHJvZmlsZV9tb2RlX25hbWVzW10gPSB7CgkiZW5mb3JjZSIsCgkiY29tcGxhaW4iLAoJImtp
bGwiLAoJInVuY29uZmluZWQiLAp9OwoKCi8qKgogKiBfX2FkZF9wcm9maWxlIC0gYWRkIGEgcHJv
ZmlsZXMgdG8gbGlzdCBhbmQgbGFiZWwgdHJlZQogKiBAbGlzdDogbGlzdCB0byBhZGQgaXQgdG8g
IChOT1QgTlVMTCkKICogQHByb2ZpbGU6IHRoZSBwcm9maWxlIHRvIGFkZCAgKE5PVCBOVUxMKQog
KgogKiByZWZjb3VudCBAcHJvZmlsZSwgc2hvdWxkIGJlIHB1dCBieSBfX2xpc3RfcmVtb3ZlX3By
b2ZpbGUKICoKICogUmVxdWlyZXM6IG5hbWVzcGFjZSBsb2NrIGJlIGhlbGQsIG9yIGxpc3Qgbm90
IGJlIHNoYXJlZAogKi8Kc3RhdGljIHZvaWQgX19hZGRfcHJvZmlsZShzdHJ1Y3QgbGlzdF9oZWFk
ICpsaXN0LCBzdHJ1Y3QgYWFfcHJvZmlsZSAqcHJvZmlsZSkKewoJc3RydWN0IGFhX2xhYmVsICps
OwoKCUFBX0JVRyghbGlzdCk7CglBQV9CVUcoIXByb2ZpbGUpOwoJQUFfQlVHKCFwcm9maWxlLT5u
cyk7CglBQV9CVUcoIW11dGV4X2lzX2xvY2tlZCgmcHJvZmlsZS0+bnMtPmxvY2spKTsKCglsaXN0
X2FkZF9yY3UoJnByb2ZpbGUtPmJhc2UubGlzdCwgbGlzdCk7CgkvKiBnZXQgbGlzdCByZWZlcmVu
Y2UgKi8KCWFhX2dldF9wcm9maWxlKHByb2ZpbGUpOwoJbCA9IGFhX2xhYmVsX2luc2VydCgmcHJv
ZmlsZS0+bnMtPmxhYmVscywgJnByb2ZpbGUtPmxhYmVsKTsKCUFBX0JVRyhsICE9ICZwcm9maWxl
LT5sYWJlbCk7CglhYV9wdXRfbGFiZWwobCk7Cn0KCi8qKgogKiBfX2xpc3RfcmVtb3ZlX3Byb2Zp
bGUgLSByZW1vdmUgYSBwcm9maWxlIGZyb20gdGhlIGxpc3QgaXQgaXMgb24KICogQHByb2ZpbGU6
IHRoZSBwcm9maWxlIHRvIHJlbW92ZSAgKE5PVCBOVUxMKQogKgogKiByZW1vdmUgYSBwcm9maWxl
IGZyb20gdGhlIGxpc3QsIHdhcm5pbmcgZ2VuZXJhbGx5IHJlbW92YWwgc2hvdWxkCiAqIGJlIGRv
bmUgd2l0aCBfX3JlcGxhY2VfcHJvZmlsZSBhcyBtb3N0IHByb2ZpbGUgcmVtb3ZhbHMgYXJlCiAq
IHJlcGxhY2VtZW50cyB0byB0aGUgdW5jb25maW5lZCBwcm9maWxlLgogKgogKiBwdXQgQHByb2Zp
bGUgbGlzdCByZWZjb3VudAogKgogKiBSZXF1aXJlczogbmFtZXNwYWNlIGxvY2sgYmUgaGVsZCwg
b3IgbGlzdCBub3QgaGF2ZSBiZWVuIGxpdmUKICovCnN0YXRpYyB2b2lkIF9fbGlzdF9yZW1vdmVf
cHJvZmlsZShzdHJ1Y3QgYWFfcHJvZmlsZSAqcHJvZmlsZSkKewoJQUFfQlVHKCFwcm9maWxlKTsK
CUFBX0JVRyghcHJvZmlsZS0+bnMpOwoJQUFfQlVHKCFtdXRleF9pc19sb2NrZWQoJnByb2ZpbGUt
Pm5zLT5sb2NrKSk7CgoJbGlzdF9kZWxfcmN1KCZwcm9maWxlLT5iYXNlLmxpc3QpOwoJYWFfcHV0
X3Byb2ZpbGUocHJvZmlsZSk7Cn0KCi8qKgogKiBfX3JlbW92ZV9wcm9maWxlIC0gcmVtb3ZlIG9s
ZCBwcm9maWxlLCBhbmQgY2hpbGRyZW4KICogQHByb2ZpbGU6IHByb2ZpbGUgdG8gYmUgcmVwbGFj
ZWQgIChOT1QgTlVMTCkKICoKICogUmVxdWlyZXM6IG5hbWVzcGFjZSBsaXN0IGxvY2sgYmUgaGVs
ZCwgb3IgbGlzdCBub3QgYmUgc2hhcmVkCiAqLwpzdGF0aWMgdm9pZCBfX3JlbW92ZV9wcm9maWxl
KHN0cnVjdCBhYV9wcm9maWxlICpwcm9maWxlKQp7CglBQV9CVUcoIXByb2ZpbGUpOwoJQUFfQlVH
KCFwcm9maWxlLT5ucyk7CglBQV9CVUcoIW11dGV4X2lzX2xvY2tlZCgmcHJvZmlsZS0+bnMtPmxv
Y2spKTsKCgkvKiByZWxlYXNlIGFueSBjaGlsZHJlbiBsaXN0cyBmaXJzdCAqLwoJX19hYV9wcm9m
aWxlX2xpc3RfcmVsZWFzZSgmcHJvZmlsZS0+YmFzZS5wcm9maWxlcyk7CgkvKiByZWxlYXNlZCBi
eSBmcmVlX3Byb2ZpbGUgKi8KCWFhX2xhYmVsX3JlbW92ZSgmcHJvZmlsZS0+bGFiZWwpOwoJX19h
YWZzX3Byb2ZpbGVfcm1kaXIocHJvZmlsZSk7CglfX2xpc3RfcmVtb3ZlX3Byb2ZpbGUocHJvZmls
ZSk7Cn0KCi8qKgogKiBfX2FhX3Byb2ZpbGVfbGlzdF9yZWxlYXNlIC0gcmVtb3ZlIGFsbCBwcm9m
aWxlcyBvbiB0aGUgbGlzdCBhbmQgcHV0IHJlZnMKICogQGhlYWQ6IGxpc3Qgb2YgcHJvZmlsZXMg
IChOT1QgTlVMTCkKICoKICogUmVxdWlyZXM6IG5hbWVzcGFjZSBsb2NrIGJlIGhlbGQKICovCnZv
aWQgX19hYV9wcm9maWxlX2xpc3RfcmVsZWFzZShzdHJ1Y3QgbGlzdF9oZWFkICpoZWFkKQp7Cglz
dHJ1Y3QgYWFfcHJvZmlsZSAqcHJvZmlsZSwgKnRtcDsKCWxpc3RfZm9yX2VhY2hfZW50cnlfc2Fm
ZShwcm9maWxlLCB0bXAsIGhlYWQsIGJhc2UubGlzdCkKCQlfX3JlbW92ZV9wcm9maWxlKHByb2Zp
bGUpOwp9CgovKioKICogYWFfZnJlZV9kYXRhIC0gZnJlZSBhIGRhdGEgYmxvYgogKiBAcHRyOiBk
YXRhIHRvIGZyZWUKICogQGFyZzogdW51c2VkCiAqLwpzdGF0aWMgdm9pZCBhYV9mcmVlX2RhdGEo
dm9pZCAqcHRyLCB2b2lkICphcmcpCnsKCXN0cnVjdCBhYV9kYXRhICpkYXRhID0gcHRyOwoKCWt6
ZnJlZShkYXRhLT5kYXRhKTsKCWt6ZnJlZShkYXRhLT5rZXkpOwoJa3pmcmVlKGRhdGEpOwp9Cgov
KioKICogYWFfZnJlZV9wcm9maWxlIC0gZnJlZSBhIHByb2ZpbGUKICogQHByb2ZpbGU6IHRoZSBw
cm9maWxlIHRvIGZyZWUgIChNQVlCRSBOVUxMKQogKgogKiBGcmVlIGEgcHJvZmlsZSwgaXRzIGhh
dHMgYW5kIG51bGxfcHJvZmlsZS4gQWxsIHJlZmVyZW5jZXMgdG8gdGhlIHByb2ZpbGUsCiAqIGl0
cyBoYXRzIGFuZCBudWxsX3Byb2ZpbGUgbXVzdCBoYXZlIGJlZW4gcHV0LgogKgogKiBJZiB0aGUg
cHJvZmlsZSB3YXMgcmVmZXJlbmNlZCBmcm9tIGEgdGFzayBjb250ZXh0LCBmcmVlX3Byb2ZpbGUo
KSB3aWxsCiAqIGJlIGNhbGxlZCBmcm9tIGFuIHJjdSBjYWxsYmFjayByb3V0aW5lLCBzbyB3ZSBt
dXN0IG5vdCBzbGVlcCBoZXJlLgogKi8Kdm9pZCBhYV9mcmVlX3Byb2ZpbGUoc3RydWN0IGFhX3By
b2ZpbGUgKnByb2ZpbGUpCnsKCXN0cnVjdCByaGFzaHRhYmxlICpyaHQ7CglpbnQgaTsKCglBQV9E
RUJVRygiJXMoJXApXG4iLCBfX2Z1bmNfXywgcHJvZmlsZSk7CgoJaWYgKCFwcm9maWxlKQoJCXJl
dHVybjsKCgkvKiBmcmVlIGNoaWxkcmVuIHByb2ZpbGVzICovCglhYV9wb2xpY3lfZGVzdHJveSgm
cHJvZmlsZS0+YmFzZSk7CglhYV9wdXRfcHJvZmlsZShyY3VfYWNjZXNzX3BvaW50ZXIocHJvZmls
ZS0+cGFyZW50KSk7CgoJYWFfcHV0X25zKHByb2ZpbGUtPm5zKTsKCWt6ZnJlZShwcm9maWxlLT5y
ZW5hbWUpOwoJCgoJLy8gQ3VzdG9tIGNvZGUgYmVnaW4KCglpZihwcm9maWxlLT5jbGFiZWwpCgl7
CgkJa3pmcmVlKHByb2ZpbGUtPmNsYWJlbC0+bGFiZWxfbmFtZSk7CgkJaWYocHJvZmlsZS0+Y2xh
YmVsLT5hbGxvd19saXN0KQoJCXsKCQkJc3RydWN0IGRhdGFfbGlzdCAqaXRlcmF0b3IsICp0bXA7
CgkJCWl0ZXJhdG9yID0gbGlzdF9maXJzdF9lbnRyeSgmKHByb2ZpbGUtPmNsYWJlbC0+YWxsb3df
bGlzdC0+bGgpLCB0eXBlb2YoKml0ZXJhdG9yKSwgbGgpOwoJCQl3aGlsZSggKCZpdGVyYXRvci0+
bGgpICE9ICYocHJvZmlsZS0+Y2xhYmVsLT5hbGxvd19saXN0LT5saCkpCgkJCXsKCQkJCXRtcCA9
IGl0ZXJhdG9yOwoJCQkJaXRlcmF0b3IgPSBsaXN0X25leHRfZW50cnkgKGl0ZXJhdG9yLCBsaCk7
CgkJCQlremZyZWUgKHRtcC0+ZGF0YSk7CgkJCQlremZyZWUgKHRtcCk7CgkJCX0KCQkJa3pmcmVl
KHByb2ZpbGUtPmNsYWJlbC0+YWxsb3dfbGlzdCk7CgkJfQoJCWt6ZnJlZShwcm9maWxlLT5jbGFi
ZWwpOwoJfQoKCS8vIEN1c3RvbSBjb2RlIGVuZAoKCgoJYWFfZnJlZV9maWxlX3J1bGVzKCZwcm9m
aWxlLT5maWxlKTsKCWFhX2ZyZWVfY2FwX3J1bGVzKCZwcm9maWxlLT5jYXBzKTsKCWFhX2ZyZWVf
cmxpbWl0X3J1bGVzKCZwcm9maWxlLT5ybGltaXRzKTsKCglmb3IgKGkgPSAwOyBpIDwgcHJvZmls
ZS0+eGF0dHJfY291bnQ7IGkrKykKCQlremZyZWUocHJvZmlsZS0+eGF0dHJzW2ldKTsKCWt6ZnJl
ZShwcm9maWxlLT54YXR0cnMpOwoJZm9yIChpID0gMDsgaSA8IHByb2ZpbGUtPnNlY21hcmtfY291
bnQ7IGkrKykKCQlremZyZWUocHJvZmlsZS0+c2VjbWFya1tpXS5sYWJlbCk7CglremZyZWUocHJv
ZmlsZS0+c2VjbWFyayk7CglremZyZWUocHJvZmlsZS0+ZGlybmFtZSk7CglhYV9wdXRfZGZhKHBy
b2ZpbGUtPnhtYXRjaCk7CglhYV9wdXRfZGZhKHByb2ZpbGUtPnBvbGljeS5kZmEpOwoKCWlmIChw
cm9maWxlLT5kYXRhKSB7CgkJcmh0ID0gcHJvZmlsZS0+ZGF0YTsKCQlwcm9maWxlLT5kYXRhID0g
TlVMTDsKCQlyaGFzaHRhYmxlX2ZyZWVfYW5kX2Rlc3Ryb3kocmh0LCBhYV9mcmVlX2RhdGEsIE5V
TEwpOwoJCWt6ZnJlZShyaHQpOwoJfQoKCWt6ZnJlZShwcm9maWxlLT5oYXNoKTsKCWFhX3B1dF9s
b2FkZGF0YShwcm9maWxlLT5yYXdkYXRhKTsKCglremZyZWUocHJvZmlsZSk7Cn0KCi8qKgogKiBh
YV9hbGxvY19wcm9maWxlIC0gYWxsb2NhdGUsIGluaXRpYWxpemUgYW5kIHJldHVybiBhIG5ldyBw
cm9maWxlCiAqIEBobmFtZTogbmFtZSBvZiB0aGUgcHJvZmlsZSAgKE5PVCBOVUxMKQogKiBAZ2Zw
OiBhbGxvY2F0aW9uIHR5cGUKICoKICogUmV0dXJuczogcmVmY291bnQgcHJvZmlsZSBvciBOVUxM
IG9uIGZhaWx1cmUKICovCnN0cnVjdCBhYV9wcm9maWxlICphYV9hbGxvY19wcm9maWxlKGNvbnN0
IGNoYXIgKmhuYW1lLCBzdHJ1Y3QgYWFfcHJveHkgKnByb3h5LAoJCQkJICAgIGdmcF90IGdmcCkK
ewoJc3RydWN0IGFhX3Byb2ZpbGUgKnByb2ZpbGU7CgoJLyogZnJlZWQgYnkgZnJlZV9wcm9maWxl
IC0gdXN1YWxseSB0aHJvdWdoIGFhX3B1dF9wcm9maWxlICovCglwcm9maWxlID0ga3phbGxvYyhz
aXplb2YoKnByb2ZpbGUpICsgc2l6ZW9mKHN0cnVjdCBhYV9wcm9maWxlICopICogMiwKCQkJICBn
ZnApOwoJaWYgKCFwcm9maWxlKQoJCXJldHVybiBOVUxMOwoKCWlmICghYWFfcG9saWN5X2luaXQo
JnByb2ZpbGUtPmJhc2UsIE5VTEwsIGhuYW1lLCBnZnApKQoJCWdvdG8gZmFpbDsKCWlmICghYWFf
bGFiZWxfaW5pdCgmcHJvZmlsZS0+bGFiZWwsIDEsIGdmcCkpCgkJZ290byBmYWlsOwoKCS8qIHVw
ZGF0ZSBiZWluZyBzZXQgbmVlZGVkIGJ5IGZzIGludGVyZmFjZSAqLwoJaWYgKCFwcm94eSkgewoJ
CXByb3h5ID0gYWFfYWxsb2NfcHJveHkoJnByb2ZpbGUtPmxhYmVsLCBnZnApOwoJCWlmICghcHJv
eHkpCgkJCWdvdG8gZmFpbDsKCX0gZWxzZQoJCWFhX2dldF9wcm94eShwcm94eSk7Cglwcm9maWxl
LT5sYWJlbC5wcm94eSA9IHByb3h5OwoKCXByb2ZpbGUtPmxhYmVsLmhuYW1lID0gcHJvZmlsZS0+
YmFzZS5obmFtZTsKCXByb2ZpbGUtPmxhYmVsLmZsYWdzIHw9IEZMQUdfUFJPRklMRTsKCXByb2Zp
bGUtPmxhYmVsLnZlY1swXSA9IHByb2ZpbGU7CgoJLyogcmVmY291bnQgcmVsZWFzZWQgYnkgY2Fs
bGVyICovCglyZXR1cm4gcHJvZmlsZTsKCmZhaWw6CglhYV9mcmVlX3Byb2ZpbGUocHJvZmlsZSk7
CgoJcmV0dXJuIE5VTEw7Cn0KCi8qIFRPRE86IHByb2ZpbGUgYWNjb3VudGluZyAtIHNldHVwIGlu
IHJlbW92ZSAqLwoKLyoqCiAqIF9fc3Rybl9maW5kX2NoaWxkIC0gZmluZCBhIHByb2ZpbGUgb24g
QGhlYWQgbGlzdCB1c2luZyBzdWJzdHJpbmcgb2YgQG5hbWUKICogQGhlYWQ6IGxpc3QgdG8gc2Vh
cmNoICAoTk9UIE5VTEwpCiAqIEBuYW1lOiBuYW1lIG9mIHByb2ZpbGUgKE5PVCBOVUxMKQogKiBA
bGVuOiBsZW5ndGggb2YgQG5hbWUgc3Vic3RyaW5nIHRvIG1hdGNoCiAqCiAqIFJlcXVpcmVzOiBy
Y3VfcmVhZF9sb2NrIGJlIGhlbGQKICoKICogUmV0dXJuczogdW5yZWZjb3VudGVkIHByb2ZpbGUg
cHRyLCBvciBOVUxMIGlmIG5vdCBmb3VuZAogKi8Kc3RhdGljIHN0cnVjdCBhYV9wcm9maWxlICpf
X3N0cm5fZmluZF9jaGlsZChzdHJ1Y3QgbGlzdF9oZWFkICpoZWFkLAoJCQkJCSAgICBjb25zdCBj
aGFyICpuYW1lLCBpbnQgbGVuKQp7CglyZXR1cm4gKHN0cnVjdCBhYV9wcm9maWxlICopX19wb2xp
Y3lfc3Rybl9maW5kKGhlYWQsIG5hbWUsIGxlbik7Cn0KCi8qKgogKiBfX2ZpbmRfY2hpbGQgLSBm
aW5kIGEgcHJvZmlsZSBvbiBAaGVhZCBsaXN0IHdpdGggYSBuYW1lIG1hdGNoaW5nIEBuYW1lCiAq
IEBoZWFkOiBsaXN0IHRvIHNlYXJjaCAgKE5PVCBOVUxMKQogKiBAbmFtZTogbmFtZSBvZiBwcm9m
aWxlIChOT1QgTlVMTCkKICoKICogUmVxdWlyZXM6IHJjdV9yZWFkX2xvY2sgYmUgaGVsZAogKgog
KiBSZXR1cm5zOiB1bnJlZmNvdW50ZWQgcHJvZmlsZSBwdHIsIG9yIE5VTEwgaWYgbm90IGZvdW5k
CiAqLwpzdGF0aWMgc3RydWN0IGFhX3Byb2ZpbGUgKl9fZmluZF9jaGlsZChzdHJ1Y3QgbGlzdF9o
ZWFkICpoZWFkLCBjb25zdCBjaGFyICpuYW1lKQp7CglyZXR1cm4gX19zdHJuX2ZpbmRfY2hpbGQo
aGVhZCwgbmFtZSwgc3RybGVuKG5hbWUpKTsKfQoKLyoqCiAqIGFhX2ZpbmRfY2hpbGQgLSBmaW5k
IGEgcHJvZmlsZSBieSBAbmFtZSBpbiBAcGFyZW50CiAqIEBwYXJlbnQ6IHByb2ZpbGUgdG8gc2Vh
cmNoICAoTk9UIE5VTEwpCiAqIEBuYW1lOiBwcm9maWxlIG5hbWUgdG8gc2VhcmNoIGZvciAgKE5P
VCBOVUxMKQogKgogKiBSZXR1cm5zOiBhIHJlZmNvdW50ZWQgcHJvZmlsZSBvciBOVUxMIGlmIG5v
dCBmb3VuZAogKi8Kc3RydWN0IGFhX3Byb2ZpbGUgKmFhX2ZpbmRfY2hpbGQoc3RydWN0IGFhX3By
b2ZpbGUgKnBhcmVudCwgY29uc3QgY2hhciAqbmFtZSkKewoJc3RydWN0IGFhX3Byb2ZpbGUgKnBy
b2ZpbGU7CgoJcmN1X3JlYWRfbG9jaygpOwoJZG8gewoJCXByb2ZpbGUgPSBfX2ZpbmRfY2hpbGQo
JnBhcmVudC0+YmFzZS5wcm9maWxlcywgbmFtZSk7Cgl9IHdoaWxlIChwcm9maWxlICYmICFhYV9n
ZXRfcHJvZmlsZV9ub3QwKHByb2ZpbGUpKTsKCXJjdV9yZWFkX3VubG9jaygpOwoKCS8qIHJlZmNv
dW50IHJlbGVhc2VkIGJ5IGNhbGxlciAqLwoJcmV0dXJuIHByb2ZpbGU7Cn0KCi8qKgogKiBfX2xv
b2t1cF9wYXJlbnQgLSBsb29rdXAgdGhlIHBhcmVudCBvZiBhIHByb2ZpbGUgb2YgbmFtZSBAaG5h
bWUKICogQG5zOiBuYW1lc3BhY2UgdG8gbG9va3VwIHByb2ZpbGUgaW4gIChOT1QgTlVMTCkKICog
QGhuYW1lOiBoaWVyYXJjaGljYWwgcHJvZmlsZSBuYW1lIHRvIGZpbmQgcGFyZW50IG9mICAoTk9U
IE5VTEwpCiAqCiAqIExvb2t1cHMgdXAgdGhlIHBhcmVudCBvZiBhIGZ1bGx5IHF1YWxpZmllZCBw
cm9maWxlIG5hbWUsIHRoZSBwcm9maWxlCiAqIHRoYXQgbWF0Y2hlcyBobmFtZSBkb2VzIG5vdCBu
ZWVkIHRvIGV4aXN0LCBpbiBnZW5lcmFsIHRoaXMKICogaXMgdXNlZCB0byBsb2FkIGEgbmV3IHBy
b2ZpbGUuCiAqCiAqIFJlcXVpcmVzOiByY3VfcmVhZF9sb2NrIGJlIGhlbGQKICoKICogUmV0dXJu
czogdW5yZWZjb3VudGVkIHBvbGljeSBvciBOVUxMIGlmIG5vdCBmb3VuZAogKi8Kc3RhdGljIHN0
cnVjdCBhYV9wb2xpY3kgKl9fbG9va3VwX3BhcmVudChzdHJ1Y3QgYWFfbnMgKm5zLAoJCQkJCSBj
b25zdCBjaGFyICpobmFtZSkKewoJc3RydWN0IGFhX3BvbGljeSAqcG9saWN5OwoJc3RydWN0IGFh
X3Byb2ZpbGUgKnByb2ZpbGUgPSBOVUxMOwoJY2hhciAqc3BsaXQ7CgoJcG9saWN5ID0gJm5zLT5i
YXNlOwoKCWZvciAoc3BsaXQgPSBzdHJzdHIoaG5hbWUsICIvLyIpOyBzcGxpdDspIHsKCQlwcm9m
aWxlID0gX19zdHJuX2ZpbmRfY2hpbGQoJnBvbGljeS0+cHJvZmlsZXMsIGhuYW1lLAoJCQkJCSAg
ICBzcGxpdCAtIGhuYW1lKTsKCQlpZiAoIXByb2ZpbGUpCgkJCXJldHVybiBOVUxMOwoJCXBvbGlj
eSA9ICZwcm9maWxlLT5iYXNlOwoJCWhuYW1lID0gc3BsaXQgKyAyOwoJCXNwbGl0ID0gc3Ryc3Ry
KGhuYW1lLCAiLy8iKTsKCX0KCWlmICghcHJvZmlsZSkKCQlyZXR1cm4gJm5zLT5iYXNlOwoJcmV0
dXJuICZwcm9maWxlLT5iYXNlOwp9CgovKioKICogX19sb29rdXBuX3Byb2ZpbGUgLSBsb29rdXAg
dGhlIHByb2ZpbGUgbWF0Y2hpbmcgQGhuYW1lCiAqIEBiYXNlOiBiYXNlIGxpc3QgdG8gc3RhcnQg
bG9va2luZyB1cCBwcm9maWxlIG5hbWUgZnJvbSAgKE5PVCBOVUxMKQogKiBAaG5hbWU6IGhpZXJh
cmNoaWNhbCBwcm9maWxlIG5hbWUgIChOT1QgTlVMTCkKICogQG46IGxlbmd0aCBvZiBAaG5hbWUK
ICoKICogUmVxdWlyZXM6IHJjdV9yZWFkX2xvY2sgYmUgaGVsZAogKgogKiBSZXR1cm5zOiB1bnJl
ZmNvdW50ZWQgcHJvZmlsZSBwb2ludGVyIG9yIE5VTEwgaWYgbm90IGZvdW5kCiAqCiAqIERvIGEg
cmVsYXRpdmUgbmFtZSBsb29rdXAsIHJlY3Vyc2luZyB0aHJvdWdoIHByb2ZpbGUgdHJlZS4KICov
CnN0YXRpYyBzdHJ1Y3QgYWFfcHJvZmlsZSAqX19sb29rdXBuX3Byb2ZpbGUoc3RydWN0IGFhX3Bv
bGljeSAqYmFzZSwKCQkJCQkgICAgY29uc3QgY2hhciAqaG5hbWUsIHNpemVfdCBuKQp7CglzdHJ1
Y3QgYWFfcHJvZmlsZSAqcHJvZmlsZSA9IE5VTEw7Cgljb25zdCBjaGFyICpzcGxpdDsKCglmb3Ig
KHNwbGl0ID0gc3RybnN0cihobmFtZSwgIi8vIiwgbik7IHNwbGl0OwoJICAgICBzcGxpdCA9IHN0
cm5zdHIoaG5hbWUsICIvLyIsIG4pKSB7CgkJcHJvZmlsZSA9IF9fc3Rybl9maW5kX2NoaWxkKCZi
YXNlLT5wcm9maWxlcywgaG5hbWUsCgkJCQkJICAgIHNwbGl0IC0gaG5hbWUpOwoJCWlmICghcHJv
ZmlsZSkKCQkJcmV0dXJuIE5VTEw7CgoJCWJhc2UgPSAmcHJvZmlsZS0+YmFzZTsKCQluIC09IHNw
bGl0ICsgMiAtIGhuYW1lOwoJCWhuYW1lID0gc3BsaXQgKyAyOwoJfQoKCWlmIChuKQoJCXJldHVy
biBfX3N0cm5fZmluZF9jaGlsZCgmYmFzZS0+cHJvZmlsZXMsIGhuYW1lLCBuKTsKCXJldHVybiBO
VUxMOwp9CgpzdGF0aWMgc3RydWN0IGFhX3Byb2ZpbGUgKl9fbG9va3VwX3Byb2ZpbGUoc3RydWN0
IGFhX3BvbGljeSAqYmFzZSwKCQkJCQkgICBjb25zdCBjaGFyICpobmFtZSkKewoJcmV0dXJuIF9f
bG9va3Vwbl9wcm9maWxlKGJhc2UsIGhuYW1lLCBzdHJsZW4oaG5hbWUpKTsKfQoKLyoqCiAqIGFh
X2xvb2t1cF9wcm9maWxlIC0gZmluZCBhIHByb2ZpbGUgYnkgaXRzIGZ1bGwgb3IgcGFydGlhbCBu
YW1lCiAqIEBuczogdGhlIG5hbWVzcGFjZSB0byBzdGFydCBmcm9tIChOT1QgTlVMTCkKICogQGhu
YW1lOiBuYW1lIHRvIGRvIGxvb2t1cCBvbi4gIERvZXMgbm90IGNvbnRhaW4gbmFtZXNwYWNlIHBy
ZWZpeCAoTk9UIE5VTEwpCiAqIEBuOiBzaXplIG9mIEBobmFtZQogKgogKiBSZXR1cm5zOiByZWZj
b3VudGVkIHByb2ZpbGUgb3IgTlVMTCBpZiBub3QgZm91bmQKICovCnN0cnVjdCBhYV9wcm9maWxl
ICphYV9sb29rdXBuX3Byb2ZpbGUoc3RydWN0IGFhX25zICpucywgY29uc3QgY2hhciAqaG5hbWUs
CgkJCQkgICAgICBzaXplX3QgbikKewoJc3RydWN0IGFhX3Byb2ZpbGUgKnByb2ZpbGU7CgoJcmN1
X3JlYWRfbG9jaygpOwoJZG8gewoJCXByb2ZpbGUgPSBfX2xvb2t1cG5fcHJvZmlsZSgmbnMtPmJh
c2UsIGhuYW1lLCBuKTsKCX0gd2hpbGUgKHByb2ZpbGUgJiYgIWFhX2dldF9wcm9maWxlX25vdDAo
cHJvZmlsZSkpOwoJcmN1X3JlYWRfdW5sb2NrKCk7CgoJLyogdGhlIHVuY29uZmluZWQgcHJvZmls
ZSBpcyBub3QgaW4gdGhlIHJlZ3VsYXIgcHJvZmlsZSBsaXN0ICovCglpZiAoIXByb2ZpbGUgJiYg
c3RybmNtcChobmFtZSwgInVuY29uZmluZWQiLCBuKSA9PSAwKQoJCXByb2ZpbGUgPSBhYV9nZXRf
bmV3ZXN0X3Byb2ZpbGUobnMtPnVuY29uZmluZWQpOwoKCS8qIHJlZmNvdW50IHJlbGVhc2VkIGJ5
IGNhbGxlciAqLwoJcmV0dXJuIHByb2ZpbGU7Cn0KCnN0cnVjdCBhYV9wcm9maWxlICphYV9sb29r
dXBfcHJvZmlsZShzdHJ1Y3QgYWFfbnMgKm5zLCBjb25zdCBjaGFyICpobmFtZSkKewoJcmV0dXJu
IGFhX2xvb2t1cG5fcHJvZmlsZShucywgaG5hbWUsIHN0cmxlbihobmFtZSkpOwp9CgpzdHJ1Y3Qg
YWFfcHJvZmlsZSAqYWFfZnFsb29rdXBuX3Byb2ZpbGUoc3RydWN0IGFhX2xhYmVsICpiYXNlLAoJ
CQkJCWNvbnN0IGNoYXIgKmZxbmFtZSwgc2l6ZV90IG4pCnsKCXN0cnVjdCBhYV9wcm9maWxlICpw
cm9maWxlOwoJc3RydWN0IGFhX25zICpuczsKCWNvbnN0IGNoYXIgKm5hbWUsICpuc19uYW1lOwoJ
c2l6ZV90IG5zX2xlbjsKCgluYW1lID0gYWFfc3BsaXRuX2ZxbmFtZShmcW5hbWUsIG4sICZuc19u
YW1lLCAmbnNfbGVuKTsKCWlmIChuc19uYW1lKSB7CgkJbnMgPSBhYV9sb29rdXBuX25zKGxhYmVs
c19ucyhiYXNlKSwgbnNfbmFtZSwgbnNfbGVuKTsKCQlpZiAoIW5zKQoJCQlyZXR1cm4gTlVMTDsK
CX0gZWxzZQoJCW5zID0gYWFfZ2V0X25zKGxhYmVsc19ucyhiYXNlKSk7CgoJaWYgKG5hbWUpCgkJ
cHJvZmlsZSA9IGFhX2xvb2t1cG5fcHJvZmlsZShucywgbmFtZSwgbiAtIChuYW1lIC0gZnFuYW1l
KSk7CgllbHNlIGlmIChucykKCQkvKiBkZWZhdWx0IHByb2ZpbGUgZm9yIG5zLCBjdXJyZW50bHkg
dW5jb25maW5lZCAqLwoJCXByb2ZpbGUgPSBhYV9nZXRfbmV3ZXN0X3Byb2ZpbGUobnMtPnVuY29u
ZmluZWQpOwoJZWxzZQoJCXByb2ZpbGUgPSBOVUxMOwoJYWFfcHV0X25zKG5zKTsKCglyZXR1cm4g
cHJvZmlsZTsKfQoKLyoqCiAqIGFhX25ld19udWxsX3Byb2ZpbGUgLSBjcmVhdGUgb3IgZmluZCBh
IG51bGwtWCBsZWFybmluZyBwcm9maWxlCiAqIEBwYXJlbnQ6IHByb2ZpbGUgdGhhdCBjYXVzZWQg
dGhpcyBwcm9maWxlIHRvIGJlIGNyZWF0ZWQgKE5PVCBOVUxMKQogKiBAaGF0OiB0cnVlIGlmIHRo
ZSBudWxsLSBsZWFybmluZyBwcm9maWxlIGlzIGEgaGF0CiAqIEBiYXNlOiBuYW1lIHRvIGJhc2Ug
dGhlIG51bGwgcHJvZmlsZSBvZmYgb2YKICogQGdmcDogdHlwZSBvZiBhbGxvY2F0aW9uCiAqCiAq
IEZpbmQvQ3JlYXRlIGEgbnVsbC0gY29tcGxhaW4gbW9kZSBwcm9maWxlIHVzZWQgaW4gbGVhcm5p
bmcgbW9kZS4gIFRoZQogKiBuYW1lIG9mIHRoZSBwcm9maWxlIGlzIHVuaXF1ZSBhbmQgZm9sbG93
cyB0aGUgZm9ybWF0IG9mIHBhcmVudC8vbnVsbC1YWFguCiAqIHdoZXJlIFhYWCBpcyBiYXNlZCBv
biB0aGUgQG5hbWUgb3IgaWYgdGhhdCBmYWlscyBvciBpcyBub3Qgc3VwcGxpZWQKICogYSB1bmlx
dWUgbnVtYmVyCiAqCiAqIG51bGwgcHJvZmlsZXMgYXJlIGFkZGVkIHRvIHRoZSBwcm9maWxlIGxp
c3QgYnV0IHRoZSBsaXN0IGRvZXMgbm90CiAqIGhvbGQgYSBjb3VudCBvbiB0aGVtIHNvIHRoYXQg
dGhleSBhcmUgYXV0b21hdGljYWxseSByZWxlYXNlZCB3aGVuCiAqIG5vdCBpbiB1c2UuCiAqCiAq
IFJldHVybnM6IG5ldyByZWZjb3VudGVkIHByb2ZpbGUgZWxzZSBOVUxMIG9uIGZhaWx1cmUKICov
CnN0cnVjdCBhYV9wcm9maWxlICphYV9uZXdfbnVsbF9wcm9maWxlKHN0cnVjdCBhYV9wcm9maWxl
ICpwYXJlbnQsIGJvb2wgaGF0LAoJCQkJICAgICAgIGNvbnN0IGNoYXIgKmJhc2UsIGdmcF90IGdm
cCkKewoJc3RydWN0IGFhX3Byb2ZpbGUgKnAsICpwcm9maWxlOwoJY29uc3QgY2hhciAqYm5hbWU7
CgljaGFyICpuYW1lID0gTlVMTDsKCglBQV9CVUcoIXBhcmVudCk7CgoJaWYgKGJhc2UpIHsKCQlu
YW1lID0ga21hbGxvYyhzdHJsZW4ocGFyZW50LT5iYXNlLmhuYW1lKSArIDggKyBzdHJsZW4oYmFz
ZSksCgkJCSAgICAgICBnZnApOwoJCWlmIChuYW1lKSB7CgkJCXNwcmludGYobmFtZSwgIiVzLy9u
dWxsLSVzIiwgcGFyZW50LT5iYXNlLmhuYW1lLCBiYXNlKTsKCQkJZ290byBuYW1lOwoJCX0KCQkv
KiBmYWxsIHRocm91Z2ggdG8gdHJ5IHNob3J0ZXIgdW5pcSAqLwoJfQoKCW5hbWUgPSBrbWFsbG9j
KHN0cmxlbihwYXJlbnQtPmJhc2UuaG5hbWUpICsgMiArIDcgKyA4LCBnZnApOwoJaWYgKCFuYW1l
KQoJCXJldHVybiBOVUxMOwoJc3ByaW50ZihuYW1lLCAiJXMvL251bGwtJXgiLCBwYXJlbnQtPmJh
c2UuaG5hbWUsCgkJYXRvbWljX2luY19yZXR1cm4oJnBhcmVudC0+bnMtPnVuaXFfbnVsbCkpOwoK
bmFtZToKCS8qIGxvb2t1cCB0byBzZWUgaWYgdGhpcyBpcyBhIGR1cCBjcmVhdGlvbiAqLwoJYm5h
bWUgPSBiYXNlbmFtZShuYW1lKTsKCXByb2ZpbGUgPSBhYV9maW5kX2NoaWxkKHBhcmVudCwgYm5h
bWUpOwoJaWYgKHByb2ZpbGUpCgkJZ290byBvdXQ7CgoJcHJvZmlsZSA9IGFhX2FsbG9jX3Byb2Zp
bGUobmFtZSwgTlVMTCwgZ2ZwKTsKCWlmICghcHJvZmlsZSkKCQlnb3RvIGZhaWw7CgoJcHJvZmls
ZS0+bW9kZSA9IEFQUEFSTU9SX0NPTVBMQUlOOwoJcHJvZmlsZS0+bGFiZWwuZmxhZ3MgfD0gRkxB
R19OVUxMOwoJaWYgKGhhdCkKCQlwcm9maWxlLT5sYWJlbC5mbGFncyB8PSBGTEFHX0hBVDsKCXBy
b2ZpbGUtPnBhdGhfZmxhZ3MgPSBwYXJlbnQtPnBhdGhfZmxhZ3M7CgoJLyogcmVsZWFzZWQgb24g
ZnJlZV9wcm9maWxlICovCglyY3VfYXNzaWduX3BvaW50ZXIocHJvZmlsZS0+cGFyZW50LCBhYV9n
ZXRfcHJvZmlsZShwYXJlbnQpKTsKCXByb2ZpbGUtPm5zID0gYWFfZ2V0X25zKHBhcmVudC0+bnMp
OwoJcHJvZmlsZS0+ZmlsZS5kZmEgPSBhYV9nZXRfZGZhKG51bGxkZmEpOwoJcHJvZmlsZS0+cG9s
aWN5LmRmYSA9IGFhX2dldF9kZmEobnVsbGRmYSk7CgoJbXV0ZXhfbG9ja19uZXN0ZWQoJnByb2Zp
bGUtPm5zLT5sb2NrLCBwcm9maWxlLT5ucy0+bGV2ZWwpOwoJcCA9IF9fZmluZF9jaGlsZCgmcGFy
ZW50LT5iYXNlLnByb2ZpbGVzLCBibmFtZSk7CglpZiAocCkgewoJCWFhX2ZyZWVfcHJvZmlsZShw
cm9maWxlKTsKCQlwcm9maWxlID0gYWFfZ2V0X3Byb2ZpbGUocCk7Cgl9IGVsc2UgewoJCV9fYWRk
X3Byb2ZpbGUoJnBhcmVudC0+YmFzZS5wcm9maWxlcywgcHJvZmlsZSk7Cgl9CgltdXRleF91bmxv
Y2soJnByb2ZpbGUtPm5zLT5sb2NrKTsKCgkvKiByZWZjb3VudCByZWxlYXNlZCBieSBjYWxsZXIg
Ki8Kb3V0OgoJa2ZyZWUobmFtZSk7CgoJcmV0dXJuIHByb2ZpbGU7CgpmYWlsOgoJa2ZyZWUobmFt
ZSk7CglhYV9mcmVlX3Byb2ZpbGUocHJvZmlsZSk7CglyZXR1cm4gTlVMTDsKfQoKLyoqCiAqIHJl
cGxhY2VtZW50X2FsbG93ZWQgLSB0ZXN0IHRvIHNlZSBpZiByZXBsYWNlbWVudCBpcyBhbGxvd2Vk
CiAqIEBwcm9maWxlOiBwcm9maWxlIHRvIHRlc3QgaWYgaXQgY2FuIGJlIHJlcGxhY2VkICAoTUFZ
QkUgTlVMTCkKICogQG5vcmVwbGFjZTogdHJ1ZSBpZiByZXBsYWNlbWVudCBzaG91bGRuJ3QgYmUg
YWxsb3dlZCBidXQgYWRkaXRpb24gaXMgb2theQogKiBAaW5mbzogUmV0dXJucyAtIGluZm8gYWJv
dXQgd2h5IHJlcGxhY2VtZW50IGZhaWxlZCAoTk9UIE5VTEwpCiAqCiAqIFJldHVybnM6ICUwIGlm
IHJlcGxhY2VtZW50IGFsbG93ZWQgZWxzZSBlcnJvciBjb2RlCiAqLwpzdGF0aWMgaW50IHJlcGxh
Y2VtZW50X2FsbG93ZWQoc3RydWN0IGFhX3Byb2ZpbGUgKnByb2ZpbGUsIGludCBub3JlcGxhY2Us
CgkJCSAgICAgICBjb25zdCBjaGFyICoqaW5mbykKewoJaWYgKHByb2ZpbGUpIHsKCQlpZiAocHJv
ZmlsZS0+bGFiZWwuZmxhZ3MgJiBGTEFHX0lNTVVUSUJMRSkgewoJCQkqaW5mbyA9ICJjYW5ub3Qg
cmVwbGFjZSBpbW11dGlibGUgcHJvZmlsZSI7CgkJCXJldHVybiAtRVBFUk07CgkJfSBlbHNlIGlm
IChub3JlcGxhY2UpIHsKCQkJKmluZm8gPSAicHJvZmlsZSBhbHJlYWR5IGV4aXN0cyI7CgkJCXJl
dHVybiAtRUVYSVNUOwoJCX0KCX0KCXJldHVybiAwOwp9CgovKiBhdWRpdCBjYWxsYmFjayBmb3Ig
bmV0IHNwZWNpZmljIGZpZWxkcyAqLwpzdGF0aWMgdm9pZCBhdWRpdF9jYihzdHJ1Y3QgYXVkaXRf
YnVmZmVyICphYiwgdm9pZCAqdmEpCnsKCXN0cnVjdCBjb21tb25fYXVkaXRfZGF0YSAqc2EgPSB2
YTsKCglpZiAoYWFkKHNhKS0+aWZhY2UubnMpIHsKCQlhdWRpdF9sb2dfZm9ybWF0KGFiLCAiIG5z
PSIpOwoJCWF1ZGl0X2xvZ191bnRydXN0ZWRzdHJpbmcoYWIsIGFhZChzYSktPmlmYWNlLm5zKTsK
CX0KfQoKLyoqCiAqIGF1ZGl0X3BvbGljeSAtIERvIGF1ZGl0aW5nIG9mIHBvbGljeSBjaGFuZ2Vz
CiAqIEBsYWJlbDogbGFiZWwgdG8gY2hlY2sgaWYgaXQgY2FuIG1hbmFnZSBwb2xpY3kKICogQG9w
OiBwb2xpY3kgb3BlcmF0aW9uIGJlaW5nIHBlcmZvcm1lZAogKiBAbnNfbmFtZTogbmFtZSBvZiBu
YW1lc3BhY2UgYmVpbmcgbWFuaXB1bGF0ZWQKICogQG5hbWU6IG5hbWUgb2YgcHJvZmlsZSBiZWlu
ZyBtYW5pcHVsYXRlZCAoTk9UIE5VTEwpCiAqIEBpbmZvOiBhbnkgZXh0cmEgaW5mb3JtYXRpb24g
dG8gYmUgYXVkaXRlZCAoTUFZQkUgTlVMTCkKICogQGVycm9yOiBlcnJvciBjb2RlCiAqCiAqIFJl
dHVybnM6IHRoZSBlcnJvciB0byBiZSByZXR1cm5lZCBhZnRlciBhdWRpdCBpcyBkb25lCiAqLwpz
dGF0aWMgaW50IGF1ZGl0X3BvbGljeShzdHJ1Y3QgYWFfbGFiZWwgKmxhYmVsLCBjb25zdCBjaGFy
ICpvcCwKCQkJY29uc3QgY2hhciAqbnNfbmFtZSwgY29uc3QgY2hhciAqbmFtZSwKCQkJY29uc3Qg
Y2hhciAqaW5mbywgaW50IGVycm9yKQp7CglERUZJTkVfQVVESVRfREFUQShzYSwgTFNNX0FVRElU
X0RBVEFfTk9ORSwgb3ApOwoKCWFhZCgmc2EpLT5pZmFjZS5ucyA9IG5zX25hbWU7CglhYWQoJnNh
KS0+bmFtZSA9IG5hbWU7CglhYWQoJnNhKS0+aW5mbyA9IGluZm87CglhYWQoJnNhKS0+ZXJyb3Ig
PSBlcnJvcjsKCWFhZCgmc2EpLT5sYWJlbCA9IGxhYmVsOwoKCWFhX2F1ZGl0X21zZyhBVURJVF9B
UFBBUk1PUl9TVEFUVVMsICZzYSwgYXVkaXRfY2IpOwoKCXJldHVybiBlcnJvcjsKfQoKLyoqCiAq
IHBvbGljeV92aWV3X2NhcGFibGUgLSBjaGVjayBpZiB2aWV3aW5nIHBvbGljeSBpbiBhdCBAbnMg
aXMgYWxsb3dlZAogKiBuczogbmFtZXNwYWNlIGJlaW5nIHZpZXdlZCBieSBjdXJyZW50IHRhc2sg
KG1heSBiZSBOVUxMKQogKiBSZXR1cm5zOiB0cnVlIGlmIHZpZXdpbmcgcG9saWN5IGlzIGFsbG93
ZWQKICoKICogSWYgQG5zIGlzIE5VTEwgdGhlbiB0aGUgbmFtZXNwYWNlIGJlaW5nIHZpZXdlZCBp
cyBhc3N1bWVkIHRvIGJlIHRoZQogKiB0YXNrcyBjdXJyZW50IG5hbWVzcGFjZS4KICovCmJvb2wg
cG9saWN5X3ZpZXdfY2FwYWJsZShzdHJ1Y3QgYWFfbnMgKm5zKQp7CglzdHJ1Y3QgdXNlcl9uYW1l
c3BhY2UgKnVzZXJfbnMgPSBjdXJyZW50X3VzZXJfbnMoKTsKCXN0cnVjdCBhYV9ucyAqdmlld19u
cyA9IGFhX2dldF9jdXJyZW50X25zKCk7Cglib29sIHJvb3RfaW5fdXNlcl9ucyA9IHVpZF9lcShj
dXJyZW50X2V1aWQoKSwgbWFrZV9rdWlkKHVzZXJfbnMsIDApKSB8fAoJCQkgICAgICAgaW5fZWdy
b3VwX3AobWFrZV9rZ2lkKHVzZXJfbnMsIDApKTsKCWJvb2wgcmVzcG9uc2UgPSBmYWxzZTsKCWlm
ICghbnMpCgkJbnMgPSB2aWV3X25zOwoKCWlmIChyb290X2luX3VzZXJfbnMgJiYgYWFfbnNfdmlz
aWJsZSh2aWV3X25zLCBucywgdHJ1ZSkgJiYKCSAgICAodXNlcl9ucyA9PSAmaW5pdF91c2VyX25z
IHx8CgkgICAgICh1bnByaXZpbGVnZWRfdXNlcm5zX2FwcGFybW9yX3BvbGljeSAhPSAwICYmCgkg
ICAgICB1c2VyX25zLT5sZXZlbCA9PSB2aWV3X25zLT5sZXZlbCkpKQoJCXJlc3BvbnNlID0gdHJ1
ZTsKCWFhX3B1dF9ucyh2aWV3X25zKTsKCglyZXR1cm4gcmVzcG9uc2U7Cn0KCmJvb2wgcG9saWN5
X2FkbWluX2NhcGFibGUoc3RydWN0IGFhX25zICpucykKewoJc3RydWN0IHVzZXJfbmFtZXNwYWNl
ICp1c2VyX25zID0gY3VycmVudF91c2VyX25zKCk7Cglib29sIGNhcGFibGUgPSBuc19jYXBhYmxl
KHVzZXJfbnMsIENBUF9NQUNfQURNSU4pOwoKCUFBX0RFQlVHKCJjYXBfbWFjX2FkbWluPyAlZFxu
IiwgY2FwYWJsZSk7CglBQV9ERUJVRygicG9saWN5IGxvY2tlZD8gJWRcbiIsIGFhX2dfbG9ja19w
b2xpY3kpOwoKCXJldHVybiBwb2xpY3lfdmlld19jYXBhYmxlKG5zKSAmJiBjYXBhYmxlICYmICFh
YV9nX2xvY2tfcG9saWN5Owp9CgovKioKICogYWFfbWF5X21hbmFnZV9wb2xpY3kgLSBjYW4gdGhl
IGN1cnJlbnQgdGFzayBtYW5hZ2UgcG9saWN5CiAqIEBsYWJlbDogbGFiZWwgdG8gY2hlY2sgaWYg
aXQgY2FuIG1hbmFnZSBwb2xpY3kKICogQG9wOiB0aGUgcG9saWN5IG1hbmlwdWxhdGlvbiBvcGVy
YXRpb24gYmVpbmcgZG9uZQogKgogKiBSZXR1cm5zOiAwIGlmIHRoZSB0YXNrIGlzIGFsbG93ZWQg
dG8gbWFuaXB1bGF0ZSBwb2xpY3kgZWxzZSBlcnJvcgogKi8KaW50IGFhX21heV9tYW5hZ2VfcG9s
aWN5KHN0cnVjdCBhYV9sYWJlbCAqbGFiZWwsIHN0cnVjdCBhYV9ucyAqbnMsIHUzMiBtYXNrKQp7
Cgljb25zdCBjaGFyICpvcDsKCglpZiAobWFzayAmIEFBX01BWV9SRU1PVkVfUE9MSUNZKQoJCW9w
ID0gT1BfUFJPRl9STTsKCWVsc2UgaWYgKG1hc2sgJiBBQV9NQVlfUkVQTEFDRV9QT0xJQ1kpCgkJ
b3AgPSBPUF9QUk9GX1JFUEw7CgllbHNlCgkJb3AgPSBPUF9QUk9GX0xPQUQ7CgoJLyogY2hlY2sg
aWYgbG9hZGluZyBwb2xpY3kgaXMgbG9ja2VkIG91dCAqLwoJaWYgKGFhX2dfbG9ja19wb2xpY3kp
CgkJcmV0dXJuIGF1ZGl0X3BvbGljeShsYWJlbCwgb3AsIE5VTEwsIE5VTEwsICJwb2xpY3lfbG9j
a2VkIiwKCQkJCSAgICAtRUFDQ0VTKTsKCglpZiAoIXBvbGljeV9hZG1pbl9jYXBhYmxlKG5zKSkK
CQlyZXR1cm4gYXVkaXRfcG9saWN5KGxhYmVsLCBvcCwgTlVMTCwgTlVMTCwgIm5vdCBwb2xpY3kg
YWRtaW4iLAoJCQkJICAgIC1FQUNDRVMpOwoKCS8qIFRPRE86IGFkZCBmaW5lIGdyYWluZWQgbWVk
aWF0aW9uIG9mIHBvbGljeSBsb2FkcyAqLwoJcmV0dXJuIDA7Cn0KCnN0YXRpYyBzdHJ1Y3QgYWFf
cHJvZmlsZSAqX19saXN0X2xvb2t1cF9wYXJlbnQoc3RydWN0IGxpc3RfaGVhZCAqbGgsCgkJCQkJ
ICAgICAgIHN0cnVjdCBhYV9wcm9maWxlICpwcm9maWxlKQp7Cgljb25zdCBjaGFyICpiYXNlID0g
YmFzZW5hbWUocHJvZmlsZS0+YmFzZS5obmFtZSk7Cglsb25nIGxlbiA9IGJhc2UgLSBwcm9maWxl
LT5iYXNlLmhuYW1lOwoJc3RydWN0IGFhX2xvYWRfZW50ICplbnQ7CgoJLyogcGFyZW50IHdvbid0
IGhhdmUgdHJhaWxpbmcgLy8gc28gcmVtb3ZlIGZyb20gbGVuICovCglpZiAobGVuIDw9IDIpCgkJ
cmV0dXJuIE5VTEw7CglsZW4gLT0gMjsKCglsaXN0X2Zvcl9lYWNoX2VudHJ5KGVudCwgbGgsIGxp
c3QpIHsKCQlpZiAoZW50LT5uZXcgPT0gcHJvZmlsZSkKCQkJY29udGludWU7CgkJaWYgKHN0cm5j
bXAoZW50LT5uZXctPmJhc2UuaG5hbWUsIHByb2ZpbGUtPmJhc2UuaG5hbWUsIGxlbikgPT0KCQkg
ICAgMCAmJiBlbnQtPm5ldy0+YmFzZS5obmFtZVtsZW5dID09IDApCgkJCXJldHVybiBlbnQtPm5l
dzsKCX0KCglyZXR1cm4gTlVMTDsKfQoKLyoqCiAqIF9fcmVwbGFjZV9wcm9maWxlIC0gcmVwbGFj
ZSBAb2xkIHdpdGggQG5ldyBvbiBhIGxpc3QKICogQG9sZDogcHJvZmlsZSB0byBiZSByZXBsYWNl
ZCAgKE5PVCBOVUxMKQogKiBAbmV3OiBwcm9maWxlIHRvIHJlcGxhY2UgQG9sZCB3aXRoICAoTk9U
IE5VTEwpCiAqIEBzaGFyZV9wcm94eTogdHJhbnNmZXIgQG9sZC0+cHJveHkgdG8gQG5ldwogKgog
KiBXaWxsIGR1cGxpY2F0ZSBhbmQgcmVmY291bnQgZWxlbWVudHMgdGhhdCBAbmV3IGluaGVyaXRz
IGZyb20gQG9sZAogKiBhbmQgd2lsbCBpbmhlcml0IEBvbGQgY2hpbGRyZW4uCiAqCiAqIHJlZmNv
dW50IEBuZXcgZm9yIGxpc3QsIHB1dCBAb2xkIGxpc3QgcmVmY291bnQKICoKICogUmVxdWlyZXM6
IG5hbWVzcGFjZSBsaXN0IGxvY2sgYmUgaGVsZCwgb3IgbGlzdCBub3QgYmUgc2hhcmVkCiAqLwpz
dGF0aWMgdm9pZCBfX3JlcGxhY2VfcHJvZmlsZShzdHJ1Y3QgYWFfcHJvZmlsZSAqb2xkLCBzdHJ1
Y3QgYWFfcHJvZmlsZSAqbmV3KQp7CglzdHJ1Y3QgYWFfcHJvZmlsZSAqY2hpbGQsICp0bXA7CgoJ
aWYgKCFsaXN0X2VtcHR5KCZvbGQtPmJhc2UucHJvZmlsZXMpKSB7CgkJTElTVF9IRUFEKGxoKTsK
CQlsaXN0X3NwbGljZV9pbml0X3JjdSgmb2xkLT5iYXNlLnByb2ZpbGVzLCAmbGgsIHN5bmNocm9u
aXplX3JjdSk7CgoJCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShjaGlsZCwgdG1wLCAmbGgsIGJh
c2UubGlzdCkgewoJCQlzdHJ1Y3QgYWFfcHJvZmlsZSAqcDsKCgkJCWxpc3RfZGVsX2luaXQoJmNo
aWxkLT5iYXNlLmxpc3QpOwoJCQlwID0gX19maW5kX2NoaWxkKCZuZXctPmJhc2UucHJvZmlsZXMs
IGNoaWxkLT5iYXNlLm5hbWUpOwoJCQlpZiAocCkgewoJCQkJLyogQHAgcmVwbGFjZXMgQGNoaWxk
ICAqLwoJCQkJX19yZXBsYWNlX3Byb2ZpbGUoY2hpbGQsIHApOwoJCQkJY29udGludWU7CgkJCX0K
CgkJCS8qIGluaGVyaXQgQGNoaWxkIGFuZCBpdHMgY2hpbGRyZW4gKi8KCQkJLyogVE9ETzogdXBk
YXRlIGhuYW1lIG9mIGluaGVyaXRlZCBjaGlsZHJlbiAqLwoJCQkvKiBsaXN0IHJlZmNvdW50IHRy
YW5zZmVycmVkIHRvIEBuZXcgKi8KCQkJcCA9IGFhX2RlcmVmX3BhcmVudChjaGlsZCk7CgkJCXJj
dV9hc3NpZ25fcG9pbnRlcihjaGlsZC0+cGFyZW50LCBhYV9nZXRfcHJvZmlsZShuZXcpKTsKCQkJ
bGlzdF9hZGRfcmN1KCZjaGlsZC0+YmFzZS5saXN0LCAmbmV3LT5iYXNlLnByb2ZpbGVzKTsKCQkJ
YWFfcHV0X3Byb2ZpbGUocCk7CgkJfQoJfQoKCWlmICghcmN1X2FjY2Vzc19wb2ludGVyKG5ldy0+
cGFyZW50KSkgewoJCXN0cnVjdCBhYV9wcm9maWxlICpwYXJlbnQgPSBhYV9kZXJlZl9wYXJlbnQo
b2xkKTsKCQlyY3VfYXNzaWduX3BvaW50ZXIobmV3LT5wYXJlbnQsIGFhX2dldF9wcm9maWxlKHBh
cmVudCkpOwoJfQoJYWFfbGFiZWxfcmVwbGFjZSgmb2xkLT5sYWJlbCwgJm5ldy0+bGFiZWwpOwoJ
LyogbWlncmF0ZSBkZW50cyBtdXN0IGNvbWUgYWZ0ZXIgbGFiZWwgcmVwbGFjZW1lbnQgYi9jIHVw
ZGF0ZSAqLwoJX19hYWZzX3Byb2ZpbGVfbWlncmF0ZV9kZW50cyhvbGQsIG5ldyk7CgoJaWYgKGxp
c3RfZW1wdHkoJm5ldy0+YmFzZS5saXN0KSkgewoJCS8qIG5ldyBpcyBub3Qgb24gYSBsaXN0IGFs
cmVhZHkgKi8KCQlsaXN0X3JlcGxhY2VfcmN1KCZvbGQtPmJhc2UubGlzdCwgJm5ldy0+YmFzZS5s
aXN0KTsKCQlhYV9nZXRfcHJvZmlsZShuZXcpOwoJCWFhX3B1dF9wcm9maWxlKG9sZCk7Cgl9IGVs
c2UKCQlfX2xpc3RfcmVtb3ZlX3Byb2ZpbGUob2xkKTsKfQoKLyoqCiAqIF9fbG9va3VwX3JlcGxh
Y2UgLSBsb29rdXAgcmVwbGFjZW1lbnQgaW5mb3JtYXRpb24gZm9yIGEgcHJvZmlsZQogKiBAbnMg
LSBuYW1lc3BhY2UgdGhlIGxvb2t1cCBvY2N1cnMgaW4KICogQGhuYW1lIC0gbmFtZSBvZiBwcm9m
aWxlIHRvIGxvb2t1cAogKiBAbm9yZXBsYWNlIC0gdHJ1ZSBpZiBub3QgcmVwbGFjaW5nIGFuIGV4
aXN0aW5nIHByb2ZpbGUKICogQHAgLSBSZXR1cm5zOiBwcm9maWxlIHRvIGJlIHJlcGxhY2VkCiAq
IEBpbmZvIC0gUmV0dXJuczogaW5mbyBzdHJpbmcgb24gd2h5IGxvb2t1cCBmYWlsZWQKICoKICog
UmV0dXJuczogcHJvZmlsZSB0byByZXBsYWNlIChubyByZWYpIG9uIHN1Y2Nlc3MgZWxzZSBwdHIg
ZXJyb3IKICovCnN0YXRpYyBpbnQgX19sb29rdXBfcmVwbGFjZShzdHJ1Y3QgYWFfbnMgKm5zLCBj
b25zdCBjaGFyICpobmFtZSwKCQkJICAgIGJvb2wgbm9yZXBsYWNlLCBzdHJ1Y3QgYWFfcHJvZmls
ZSAqKnAsCgkJCSAgICBjb25zdCBjaGFyICoqaW5mbykKewoJKnAgPSBhYV9nZXRfcHJvZmlsZShf
X2xvb2t1cF9wcm9maWxlKCZucy0+YmFzZSwgaG5hbWUpKTsKCWlmICgqcCkgewoJCWludCBlcnJv
ciA9IHJlcGxhY2VtZW50X2FsbG93ZWQoKnAsIG5vcmVwbGFjZSwgaW5mbyk7CgkJaWYgKGVycm9y
KSB7CgkJCSppbmZvID0gInByb2ZpbGUgY2FuIG5vdCBiZSByZXBsYWNlZCI7CgkJCXJldHVybiBl
cnJvcjsKCQl9Cgl9CgoJcmV0dXJuIDA7Cn0KCnN0YXRpYyB2b2lkIHNoYXJlX25hbWUoc3RydWN0
IGFhX3Byb2ZpbGUgKm9sZCwgc3RydWN0IGFhX3Byb2ZpbGUgKm5ldykKewoJYWFfcHV0X3N0cihu
ZXctPmJhc2UuaG5hbWUpOwoJYWFfZ2V0X3N0cihvbGQtPmJhc2UuaG5hbWUpOwoJbmV3LT5iYXNl
LmhuYW1lID0gb2xkLT5iYXNlLmhuYW1lOwoJbmV3LT5iYXNlLm5hbWUgPSBvbGQtPmJhc2UubmFt
ZTsKCW5ldy0+bGFiZWwuaG5hbWUgPSBvbGQtPmxhYmVsLmhuYW1lOwp9CgovKiBVcGRhdGUgdG8g
bmV3ZXN0IHZlcnNpb24gb2YgcGFyZW50IGFmdGVyIHByZXZpb3VzIHJlcGxhY2VtZW50cwogKiBS
ZXR1cm5zOiB1bnJlZmNvdW50IG5ld2VzdCB2ZXJzaW9uIG9mIHBhcmVudAogKi8Kc3RhdGljIHN0
cnVjdCBhYV9wcm9maWxlICp1cGRhdGVfdG9fbmV3ZXN0X3BhcmVudChzdHJ1Y3QgYWFfcHJvZmls
ZSAqbmV3KQp7CglzdHJ1Y3QgYWFfcHJvZmlsZSAqcGFyZW50LCAqbmV3ZXN0OwoKCXBhcmVudCA9
IHJjdV9kZXJlZmVyZW5jZV9wcm90ZWN0ZWQobmV3LT5wYXJlbnQsCgkJCQkJICAgbXV0ZXhfaXNf
bG9ja2VkKCZuZXctPm5zLT5sb2NrKSk7CgluZXdlc3QgPSBhYV9nZXRfbmV3ZXN0X3Byb2ZpbGUo
cGFyZW50KTsKCgkvKiBwYXJlbnQgcmVwbGFjZWQgaW4gdGhpcyBhdG9taWMgc2V0PyAqLwoJaWYg
KG5ld2VzdCAhPSBwYXJlbnQpIHsKCQlhYV9wdXRfcHJvZmlsZShwYXJlbnQpOwoJCXJjdV9hc3Np
Z25fcG9pbnRlcihuZXctPnBhcmVudCwgbmV3ZXN0KTsKCX0gZWxzZQoJCWFhX3B1dF9wcm9maWxl
KG5ld2VzdCk7CgoJcmV0dXJuIG5ld2VzdDsKfQoKLyoqCiAqIGFhX3JlcGxhY2VfcHJvZmlsZXMg
LSByZXBsYWNlIHByb2ZpbGUocykgb24gdGhlIHByb2ZpbGUgbGlzdAogKiBAcG9saWN5X25zOiBu
YW1lc3BhY2UgbG9hZCBpcyBvY2N1cnJpbmcgb24KICogQGxhYmVsOiBsYWJlbCB0aGF0IGlzIGF0
dGVtcHRpbmcgdG8gbG9hZC9yZXBsYWNlIHBvbGljeQogKiBAbWFzazogcGVybWlzc2lvbiBtYXNr
CiAqIEB1ZGF0YTogc2VyaWFsaXplZCBkYXRhIHN0cmVhbSAgKE5PVCBOVUxMKQogKgogKiB1bnBh
Y2sgYW5kIHJlcGxhY2UgYSBwcm9maWxlIG9uIHRoZSBwcm9maWxlIGxpc3QgYW5kIHVzZXMgb2Yg
dGhhdCBwcm9maWxlCiAqIGJ5IGFueSB0YXNrIGNyZWRzIHZpYSBpbnZhbGlkYXRpbmcgdGhlIG9s
ZCB2ZXJzaW9uIG9mIHRoZSBwcm9maWxlLCB3aGljaAogKiB0YXNrcyB3aWxsIG5vdGljZSB0byB1
cGRhdGUgdGhlaXIgb3duIGNyZWQuICBJZiB0aGUgcHJvZmlsZSBkb2VzIG5vdCBleGlzdAogKiBv
biB0aGUgcHJvZmlsZSBsaXN0IGl0IGlzIGFkZGVkLgogKgogKiBSZXR1cm5zOiBzaXplIG9mIGRh
dGEgY29uc3VtZWQgZWxzZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUuCiAqLwpzc2l6ZV90IGFhX3Jl
cGxhY2VfcHJvZmlsZXMoc3RydWN0IGFhX25zICpwb2xpY3lfbnMsIHN0cnVjdCBhYV9sYWJlbCAq
bGFiZWwsCgkJCSAgICB1MzIgbWFzaywgc3RydWN0IGFhX2xvYWRkYXRhICp1ZGF0YSkKewoJY29u
c3QgY2hhciAqbnNfbmFtZSwgKmluZm8gPSBOVUxMOwoJc3RydWN0IGFhX25zICpucyA9IE5VTEw7
CglzdHJ1Y3QgYWFfbG9hZF9lbnQgKmVudCwgKnRtcDsKCXN0cnVjdCBhYV9sb2FkZGF0YSAqcmF3
ZGF0YV9lbnQ7Cgljb25zdCBjaGFyICpvcDsKCXNzaXplX3QgY291bnQsIGVycm9yOwoJTElTVF9I
RUFEKGxoKTsKCglvcCA9IG1hc2sgJiBBQV9NQVlfUkVQTEFDRV9QT0xJQ1kgPyBPUF9QUk9GX1JF
UEwgOiBPUF9QUk9GX0xPQUQ7CglhYV9nZXRfbG9hZGRhdGEodWRhdGEpOwoJLyogcmVsZWFzZWQg
YmVsb3cgKi8KCWVycm9yID0gYWFfdW5wYWNrKHVkYXRhLCAmbGgsICZuc19uYW1lKTsKCWlmIChl
cnJvcikKCQlnb3RvIG91dDsKCgkvKiBlbnN1cmUgdGhhdCBwcm9maWxlcyBhcmUgYWxsIGZvciB0
aGUgc2FtZSBucwoJICogVE9ETzogdXBkYXRlIGxvY2tpbmcgdG8gcmVtb3ZlIHRoaXMgY29uc3Rh
aW50LiBBbGwgcHJvZmlsZXMgaW4KCSAqICAgICAgIHRoZSBsb2FkIHNldCBtdXN0IHN1Y2NlZWQg
YXMgYSBzZXQgb3IgdGhlIGxvYWQgd2lsbAoJICogICAgICAgZmFpbC4gU29ydCBlbnQgbGlzdCBh
bmQgdGFrZSBucyBsb2NrcyBpbiBoaWVyYXJjaHkgb3JkZXIKCSAqLwoJY291bnQgPSAwOwoJbGlz
dF9mb3JfZWFjaF9lbnRyeShlbnQsICZsaCwgbGlzdCkgewoJCWlmIChuc19uYW1lKSB7CgkJCWlm
IChlbnQtPm5zX25hbWUgJiYKCQkJICAgIHN0cmNtcChlbnQtPm5zX25hbWUsIG5zX25hbWUpICE9
IDApIHsKCQkJCWluZm8gPSAicG9saWN5IGxvYWQgaGFzIG1peGVkIG5hbWVzcGFjZXMiOwoJCQkJ
ZXJyb3IgPSAtRUFDQ0VTOwoJCQkJZ290byBmYWlsOwoJCQl9CgkJfSBlbHNlIGlmIChlbnQtPm5z
X25hbWUpIHsKCQkJaWYgKGNvdW50KSB7CgkJCQlpbmZvID0gInBvbGljeSBsb2FkIGhhcyBtaXhl
ZCBuYW1lc3BhY2VzIjsKCQkJCWVycm9yID0gLUVBQ0NFUzsKCQkJCWdvdG8gZmFpbDsKCQkJfQoJ
CQluc19uYW1lID0gZW50LT5uc19uYW1lOwoJCX0gZWxzZQoJCQljb3VudCsrOwoJfQoJaWYgKG5z
X25hbWUpIHsKCQlucyA9IGFhX3ByZXBhcmVfbnMocG9saWN5X25zID8gcG9saWN5X25zIDogbGFi
ZWxzX25zKGxhYmVsKSwKCQkJCSAgIG5zX25hbWUpOwoJCWlmIChJU19FUlIobnMpKSB7CgkJCW9w
ID0gT1BfUFJPRl9MT0FEOwoJCQlpbmZvID0gImZhaWxlZCB0byBwcmVwYXJlIG5hbWVzcGFjZSI7
CgkJCWVycm9yID0gUFRSX0VSUihucyk7CgkJCW5zID0gTlVMTDsKCQkJZW50ID0gTlVMTDsKCQkJ
Z290byBmYWlsOwoJCX0KCX0gZWxzZQoJCW5zID0gYWFfZ2V0X25zKHBvbGljeV9ucyA/IHBvbGlj
eV9ucyA6IGxhYmVsc19ucyhsYWJlbCkpOwoKCW11dGV4X2xvY2tfbmVzdGVkKCZucy0+bG9jaywg
bnMtPmxldmVsKTsKCS8qIGNoZWNrIGZvciBkdXBsaWNhdGUgcmF3ZGF0YSBibG9iczogc3BhY2Ug
YW5kIGZpbGUgZGVkdXAgKi8KCWxpc3RfZm9yX2VhY2hfZW50cnkocmF3ZGF0YV9lbnQsICZucy0+
cmF3ZGF0YV9saXN0LCBsaXN0KSB7CgkJaWYgKGFhX3Jhd2RhdGFfZXEocmF3ZGF0YV9lbnQsIHVk
YXRhKSkgewoJCQlzdHJ1Y3QgYWFfbG9hZGRhdGEgKnRtcDsKCgkJCXRtcCA9IF9fYWFfZ2V0X2xv
YWRkYXRhKHJhd2RhdGFfZW50KTsKCQkJLyogY2hlY2sgd2UgZGlkbid0IGZhaWwgdGhlIHJhY2Ug
Ki8KCQkJaWYgKHRtcCkgewoJCQkJYWFfcHV0X2xvYWRkYXRhKHVkYXRhKTsKCQkJCXVkYXRhID0g
dG1wOwoJCQkJYnJlYWs7CgkJCX0KCQl9Cgl9CgkvKiBzZXR1cCBwYXJlbnQgYW5kIG5zIGluZm8g
Ki8KCWxpc3RfZm9yX2VhY2hfZW50cnkoZW50LCAmbGgsIGxpc3QpIHsKCQlzdHJ1Y3QgYWFfcG9s
aWN5ICpwb2xpY3k7CgoJCWVudC0+bmV3LT5yYXdkYXRhID0gYWFfZ2V0X2xvYWRkYXRhKHVkYXRh
KTsKCQllcnJvciA9IF9fbG9va3VwX3JlcGxhY2UobnMsIGVudC0+bmV3LT5iYXNlLmhuYW1lLAoJ
CQkJCSAhKG1hc2sgJiBBQV9NQVlfUkVQTEFDRV9QT0xJQ1kpLAoJCQkJCSAmZW50LT5vbGQsICZp
bmZvKTsKCQlpZiAoZXJyb3IpCgkJCWdvdG8gZmFpbF9sb2NrOwoKCQlpZiAoZW50LT5uZXctPnJl
bmFtZSkgewoJCQllcnJvciA9IF9fbG9va3VwX3JlcGxhY2UobnMsIGVudC0+bmV3LT5yZW5hbWUs
CgkJCQkJCSEobWFzayAmIEFBX01BWV9SRVBMQUNFX1BPTElDWSksCgkJCQkJCSZlbnQtPnJlbmFt
ZSwgJmluZm8pOwoJCQlpZiAoZXJyb3IpCgkJCQlnb3RvIGZhaWxfbG9jazsKCQl9CgoJCS8qIHJl
bGVhc2VkIHdoZW4gQG5ldyBpcyBmcmVlZCAqLwoJCWVudC0+bmV3LT5ucyA9IGFhX2dldF9ucyhu
cyk7CgoJCWlmIChlbnQtPm9sZCB8fCBlbnQtPnJlbmFtZSkKCQkJY29udGludWU7CgoJCS8qIG5v
IHJlZiBvbiBwb2xpY3kgb25seSB1c2UgaW5zaWRlIGxvY2sgKi8KCQlwb2xpY3kgPSBfX2xvb2t1
cF9wYXJlbnQobnMsIGVudC0+bmV3LT5iYXNlLmhuYW1lKTsKCQlpZiAoIXBvbGljeSkgewoJCQlz
dHJ1Y3QgYWFfcHJvZmlsZSAqcDsKCQkJcCA9IF9fbGlzdF9sb29rdXBfcGFyZW50KCZsaCwgZW50
LT5uZXcpOwoJCQlpZiAoIXApIHsKCQkJCWVycm9yID0gLUVOT0VOVDsKCQkJCWluZm8gPSAicGFy
ZW50IGRvZXMgbm90IGV4aXN0IjsKCQkJCWdvdG8gZmFpbF9sb2NrOwoJCQl9CgkJCXJjdV9hc3Np
Z25fcG9pbnRlcihlbnQtPm5ldy0+cGFyZW50LCBhYV9nZXRfcHJvZmlsZShwKSk7CgkJfSBlbHNl
IGlmIChwb2xpY3kgIT0gJm5zLT5iYXNlKSB7CgkJCS8qIHJlbGVhc2VkIG9uIHByb2ZpbGUgcmVw
bGFjZW1lbnQgb3IgZnJlZV9wcm9maWxlICovCgkJCXN0cnVjdCBhYV9wcm9maWxlICpwID0gKHN0
cnVjdCBhYV9wcm9maWxlICopIHBvbGljeTsKCQkJcmN1X2Fzc2lnbl9wb2ludGVyKGVudC0+bmV3
LT5wYXJlbnQsIGFhX2dldF9wcm9maWxlKHApKTsKCQl9Cgl9CgoJLyogY3JlYXRlIG5ldyBmcyBl
bnRyaWVzIGZvciBpbnRyb3NwZWN0aW9uIGlmIG5lZWRlZCAqLwoJaWYgKCF1ZGF0YS0+ZGVudHNb
QUFGU19MT0FEREFUQV9ESVJdKSB7CgkJZXJyb3IgPSBfX2FhX2ZzX2NyZWF0ZV9yYXdkYXRhKG5z
LCB1ZGF0YSk7CgkJaWYgKGVycm9yKSB7CgkJCWluZm8gPSAiZmFpbGVkIHRvIGNyZWF0ZSByYXdf
ZGF0YSBkaXIgYW5kIGZpbGVzIjsKCQkJZW50ID0gTlVMTDsKCQkJZ290byBmYWlsX2xvY2s7CgkJ
fQoJfQoJbGlzdF9mb3JfZWFjaF9lbnRyeShlbnQsICZsaCwgbGlzdCkgewoJCWlmICghZW50LT5v
bGQpIHsKCQkJc3RydWN0IGRlbnRyeSAqcGFyZW50OwoJCQlpZiAocmN1X2FjY2Vzc19wb2ludGVy
KGVudC0+bmV3LT5wYXJlbnQpKSB7CgkJCQlzdHJ1Y3QgYWFfcHJvZmlsZSAqcDsKCQkJCXAgPSBh
YV9kZXJlZl9wYXJlbnQoZW50LT5uZXcpOwoJCQkJcGFyZW50ID0gcHJvZl9jaGlsZF9kaXIocCk7
CgkJCX0gZWxzZQoJCQkJcGFyZW50ID0gbnNfc3VicHJvZnNfZGlyKGVudC0+bmV3LT5ucyk7CgkJ
CWVycm9yID0gX19hYWZzX3Byb2ZpbGVfbWtkaXIoZW50LT5uZXcsIHBhcmVudCk7CgkJfQoKCQlp
ZiAoZXJyb3IpIHsKCQkJaW5mbyA9ICJmYWlsZWQgdG8gY3JlYXRlIjsKCQkJZ290byBmYWlsX2xv
Y2s7CgkJfQoJfQoKCS8qIERvbmUgd2l0aCBjaGVja3MgdGhhdCBtYXkgZmFpbCAtIGRvIGFjdHVh
bCByZXBsYWNlbWVudCAqLwoJX19hYV9idW1wX25zX3JldmlzaW9uKG5zKTsKCV9fYWFfbG9hZGRh
dGFfdXBkYXRlKHVkYXRhLCBucy0+cmV2aXNpb24pOwoJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZl
KGVudCwgdG1wLCAmbGgsIGxpc3QpIHsKCQlsaXN0X2RlbF9pbml0KCZlbnQtPmxpc3QpOwoJCW9w
ID0gKCFlbnQtPm9sZCAmJiAhZW50LT5yZW5hbWUpID8gT1BfUFJPRl9MT0FEIDogT1BfUFJPRl9S
RVBMOwoKCQlpZiAoZW50LT5vbGQgJiYgZW50LT5vbGQtPnJhd2RhdGEgPT0gZW50LT5uZXctPnJh
d2RhdGEpIHsKCQkJLyogZGVkdXAgYWN0dWFsIHByb2ZpbGUgcmVwbGFjZW1lbnQgKi8KCQkJYXVk
aXRfcG9saWN5KGxhYmVsLCBvcCwgbnNfbmFtZSwgZW50LT5uZXctPmJhc2UuaG5hbWUsCgkJCQkg
ICAgICJzYW1lIGFzIGN1cnJlbnQgcHJvZmlsZSwgc2tpcHBpbmciLAoJCQkJICAgICBlcnJvcik7
CgkJCS8qIGJyZWFrIHJlZmNvdW50IGN5Y2xlIHdpdGggcHJveHkuICovCgkJCWFhX3B1dF9wcm94
eShlbnQtPm5ldy0+bGFiZWwucHJveHkpOwoJCQllbnQtPm5ldy0+bGFiZWwucHJveHkgPSBOVUxM
OwoJCQlnb3RvIHNraXA7CgkJfQoKCQkvKgoJCSAqIFRPRE86IGZpbmVyIGRlZHVwIGJhc2VkIG9u
IHByb2ZpbGUgcmFuZ2UgaW4gZGF0YS4gTG9hZCBzZXQKCQkgKiBjYW4gZGlmZmVyIGJ1dCBwcm9m
aWxlIG1heSByZW1haW4gdW5jaGFuZ2VkCgkJICovCgkJYXVkaXRfcG9saWN5KGxhYmVsLCBvcCwg
bnNfbmFtZSwgZW50LT5uZXctPmJhc2UuaG5hbWUsIE5VTEwsCgkJCSAgICAgZXJyb3IpOwoKCQlp
ZiAoZW50LT5vbGQpIHsKCQkJc2hhcmVfbmFtZShlbnQtPm9sZCwgZW50LT5uZXcpOwoJCQlfX3Jl
cGxhY2VfcHJvZmlsZShlbnQtPm9sZCwgZW50LT5uZXcpOwoJCX0gZWxzZSB7CgkJCXN0cnVjdCBs
aXN0X2hlYWQgKmxoOwoKCQkJaWYgKHJjdV9hY2Nlc3NfcG9pbnRlcihlbnQtPm5ldy0+cGFyZW50
KSkgewoJCQkJc3RydWN0IGFhX3Byb2ZpbGUgKnBhcmVudDsKCgkJCQlwYXJlbnQgPSB1cGRhdGVf
dG9fbmV3ZXN0X3BhcmVudChlbnQtPm5ldyk7CgkJCQlsaCA9ICZwYXJlbnQtPmJhc2UucHJvZmls
ZXM7CgkJCX0gZWxzZQoJCQkJbGggPSAmbnMtPmJhc2UucHJvZmlsZXM7CgkJCV9fYWRkX3Byb2Zp
bGUobGgsIGVudC0+bmV3KTsKCQl9Cglza2lwOgoJCWFhX2xvYWRfZW50X2ZyZWUoZW50KTsKCX0K
CV9fYWFfbGFiZWxzZXRfdXBkYXRlX3N1YnRyZWUobnMpOwoJbXV0ZXhfdW5sb2NrKCZucy0+bG9j
ayk7CgpvdXQ6CglhYV9wdXRfbnMobnMpOwoJYWFfcHV0X2xvYWRkYXRhKHVkYXRhKTsKCglpZiAo
ZXJyb3IpCgkJcmV0dXJuIGVycm9yOwoJcmV0dXJuIHVkYXRhLT5zaXplOwoKZmFpbF9sb2NrOgoJ
bXV0ZXhfdW5sb2NrKCZucy0+bG9jayk7CgoJLyogYXVkaXQgY2F1c2Ugb2YgZmFpbHVyZSAqLwoJ
b3AgPSAoZW50ICYmICFlbnQtPm9sZCkgPyBPUF9QUk9GX0xPQUQgOiBPUF9QUk9GX1JFUEw7CmZh
aWw6CgkgIGF1ZGl0X3BvbGljeShsYWJlbCwgb3AsIG5zX25hbWUsIGVudCA/IGVudC0+bmV3LT5i
YXNlLmhuYW1lIDogTlVMTCwKCQkgICAgICAgaW5mbywgZXJyb3IpOwoJLyogYXVkaXQgc3RhdHVz
IHRoYXQgcmVzdCBvZiBwcm9maWxlcyBpbiB0aGUgYXRvbWljIHNldCBmYWlsZWQgdG9vICovCglp
bmZvID0gInZhbGlkIHByb2ZpbGUgaW4gZmFpbGVkIGF0b21pYyBwb2xpY3kgbG9hZCI7CglsaXN0
X2Zvcl9lYWNoX2VudHJ5KHRtcCwgJmxoLCBsaXN0KSB7CgkJaWYgKHRtcCA9PSBlbnQpIHsKCQkJ
aW5mbyA9ICJ1bmNoZWNrZWQgcHJvZmlsZSBpbiBmYWlsZWQgYXRvbWljIHBvbGljeSBsb2FkIjsK
CQkJLyogc2tpcCBlbnRyeSB0aGF0IGNhdXNlZCBmYWlsdXJlICovCgkJCWNvbnRpbnVlOwoJCX0K
CQlvcCA9ICghdG1wLT5vbGQpID8gT1BfUFJPRl9MT0FEIDogT1BfUFJPRl9SRVBMOwoJCWF1ZGl0
X3BvbGljeShsYWJlbCwgb3AsIG5zX25hbWUsIHRtcC0+bmV3LT5iYXNlLmhuYW1lLCBpbmZvLAoJ
CQkgICAgIGVycm9yKTsKCX0KCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShlbnQsIHRtcCwgJmxo
LCBsaXN0KSB7CgkJbGlzdF9kZWxfaW5pdCgmZW50LT5saXN0KTsKCQlhYV9sb2FkX2VudF9mcmVl
KGVudCk7Cgl9CgoJZ290byBvdXQ7Cn0KCi8qKgogKiBhYV9yZW1vdmVfcHJvZmlsZXMgLSByZW1v
dmUgcHJvZmlsZShzKSBmcm9tIHRoZSBzeXN0ZW0KICogQHBvbGljeV9uczogbmFtZXNwYWNlIHRo
ZSByZW1vdmUgaXMgYmVpbmcgZG9uZSBmcm9tCiAqIEBzdWJqOiBsYWJlbCBhdHRlbXB0aW5nIHRv
IHJlbW92ZSBwb2xpY3kKICogQGZxbmFtZTogbmFtZSBvZiB0aGUgcHJvZmlsZSBvciBuYW1lc3Bh
Y2UgdG8gcmVtb3ZlICAoTk9UIE5VTEwpCiAqIEBzaXplOiBzaXplIG9mIHRoZSBuYW1lCiAqCiAq
IFJlbW92ZSBhIHByb2ZpbGUgb3Igc3ViIG5hbWVzcGFjZSBmcm9tIHRoZSBjdXJyZW50IG5hbWVz
cGFjZSwgc28gdGhhdAogKiB0aGV5IGNhbiBub3QgYmUgZm91bmQgYW55bW9yZSBhbmQgbWFyayB0
aGVtIGFzIHJlcGxhY2VkIGJ5IHVuY29uZmluZWQKICoKICogTk9URTogcmVtb3ZpbmcgY29uZmlu
ZW1lbnQgZG9lcyBub3QgcmVzdG9yZSBybGltaXRzIHRvIHByZWNvbmZpbmVtZW50IHZhbHVlcwog
KgogKiBSZXR1cm5zOiBzaXplIG9mIGRhdGEgY29uc3VtZSBlbHNlIGVycm9yIGNvZGUgaWYgZmFp
bHMKICovCnNzaXplX3QgYWFfcmVtb3ZlX3Byb2ZpbGVzKHN0cnVjdCBhYV9ucyAqcG9saWN5X25z
LCBzdHJ1Y3QgYWFfbGFiZWwgKnN1YmosCgkJCSAgIGNoYXIgKmZxbmFtZSwgc2l6ZV90IHNpemUp
CnsKCXN0cnVjdCBhYV9ucyAqbnMgPSBOVUxMOwoJc3RydWN0IGFhX3Byb2ZpbGUgKnByb2ZpbGUg
PSBOVUxMOwoJY29uc3QgY2hhciAqbmFtZSA9IGZxbmFtZSwgKmluZm8gPSBOVUxMOwoJY29uc3Qg
Y2hhciAqbnNfbmFtZSA9IE5VTEw7Cglzc2l6ZV90IGVycm9yID0gMDsKCglpZiAoKmZxbmFtZSA9
PSAwKSB7CgkJaW5mbyA9ICJubyBwcm9maWxlIHNwZWNpZmllZCI7CgkJZXJyb3IgPSAtRU5PRU5U
OwoJCWdvdG8gZmFpbDsKCX0KCglpZiAoZnFuYW1lWzBdID09ICc6JykgewoJCXNpemVfdCBuc19s
ZW47CgoJCW5hbWUgPSBhYV9zcGxpdG5fZnFuYW1lKGZxbmFtZSwgc2l6ZSwgJm5zX25hbWUsICZu
c19sZW4pOwoJCS8qIHJlbGVhc2VkIGJlbG93ICovCgkJbnMgPSBhYV9sb29rdXBuX25zKHBvbGlj
eV9ucyA/IHBvbGljeV9ucyA6IGxhYmVsc19ucyhzdWJqKSwKCQkJCSAgIG5zX25hbWUsIG5zX2xl
bik7CgkJaWYgKCFucykgewoJCQlpbmZvID0gIm5hbWVzcGFjZSBkb2VzIG5vdCBleGlzdCI7CgkJ
CWVycm9yID0gLUVOT0VOVDsKCQkJZ290byBmYWlsOwoJCX0KCX0gZWxzZQoJCS8qIHJlbGVhc2Vk
IGJlbG93ICovCgkJbnMgPSBhYV9nZXRfbnMocG9saWN5X25zID8gcG9saWN5X25zIDogbGFiZWxz
X25zKHN1YmopKTsKCglpZiAoIW5hbWUpIHsKCQkvKiByZW1vdmUgbmFtZXNwYWNlIC0gY2FuIG9u
bHkgaGFwcGVuIGlmIGZxbmFtZVswXSA9PSAnOicgKi8KCQltdXRleF9sb2NrX25lc3RlZCgmbnMt
PnBhcmVudC0+bG9jaywgbnMtPmxldmVsKTsKCQlfX2FhX3JlbW92ZV9ucyhucyk7CgkJX19hYV9i
dW1wX25zX3JldmlzaW9uKG5zKTsKCQltdXRleF91bmxvY2soJm5zLT5wYXJlbnQtPmxvY2spOwoJ
fSBlbHNlIHsKCQkvKiByZW1vdmUgcHJvZmlsZSAqLwoJCW11dGV4X2xvY2tfbmVzdGVkKCZucy0+
bG9jaywgbnMtPmxldmVsKTsKCQlwcm9maWxlID0gYWFfZ2V0X3Byb2ZpbGUoX19sb29rdXBfcHJv
ZmlsZSgmbnMtPmJhc2UsIG5hbWUpKTsKCQlpZiAoIXByb2ZpbGUpIHsKCQkJZXJyb3IgPSAtRU5P
RU5UOwoJCQlpbmZvID0gInByb2ZpbGUgZG9lcyBub3QgZXhpc3QiOwoJCQlnb3RvIGZhaWxfbnNf
bG9jazsKCQl9CgkJbmFtZSA9IHByb2ZpbGUtPmJhc2UuaG5hbWU7CgkJX19yZW1vdmVfcHJvZmls
ZShwcm9maWxlKTsKCQlfX2FhX2xhYmVsc2V0X3VwZGF0ZV9zdWJ0cmVlKG5zKTsKCQlfX2FhX2J1
bXBfbnNfcmV2aXNpb24obnMpOwoJCW11dGV4X3VubG9jaygmbnMtPmxvY2spOwoJfQoKCS8qIGRv
bid0IGZhaWwgcmVtb3ZhbCBpZiBhdWRpdCBmYWlscyAqLwoJKHZvaWQpIGF1ZGl0X3BvbGljeShz
dWJqLCBPUF9QUk9GX1JNLCBuc19uYW1lLCBuYW1lLCBpbmZvLAoJCQkgICAgZXJyb3IpOwoJYWFf
cHV0X25zKG5zKTsKCWFhX3B1dF9wcm9maWxlKHByb2ZpbGUpOwoJcmV0dXJuIHNpemU7CgpmYWls
X25zX2xvY2s6CgltdXRleF91bmxvY2soJm5zLT5sb2NrKTsKCWFhX3B1dF9ucyhucyk7CgpmYWls
OgoJKHZvaWQpIGF1ZGl0X3BvbGljeShzdWJqLCBPUF9QUk9GX1JNLCBuc19uYW1lLCBuYW1lLCBp
bmZvLAoJCQkgICAgZXJyb3IpOwoJcmV0dXJuIGVycm9yOwp9Cg==

--_008_PN1PR0101MB1133959D5B326EE0AAE60EA6FBDD0PN1PR0101MB1133_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--_008_PN1PR0101MB1133959D5B326EE0AAE60EA6FBDD0PN1PR0101MB1133_--


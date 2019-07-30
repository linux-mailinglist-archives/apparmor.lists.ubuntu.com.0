Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EC97A8DE
	for <lists+apparmor@lfdr.de>; Tue, 30 Jul 2019 14:43:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hsRT2-0001Yo-5W; Tue, 30 Jul 2019 12:43:00 +0000
Received: from mail-eopbgr1390049.outbound.protection.outlook.com
 ([40.107.139.49] helo=IND01-BO1-obe.outbound.protection.outlook.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128) (Exim 4.86_2)
 (envelope-from <abhishekvijeev@iisc.ac.in>) id 1hsRSv-0001YG-95
 for apparmor@lists.ubuntu.com; Tue, 30 Jul 2019 12:42:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UO3QTg932rdk4eK3PmvDGat06zVjaMVNJlv1cBmoh/0voQueIVDq0PwhNIpSIi3NpyxZ/Ri1lou2+0k/7aFyuOXh19bFZ//JovhCrXgKn851iGpGCqXzXzMmNF/+HjUIXFNEyegdNRdSnRKcFvTfT4OMHllda985G33BDfJ/Q1JlcNrqJU1KNWVnFTihVTDPUdrXr55LVe6r1SoW59f0xCwyJkNAx+yYOxoKKRiTlyOYObjKCfZI15g+27k8FfzcbuuobkJvwnk+YlgvtRgIGZi3z/pUynSLefzhZy3JJxIIq01tE9gKQZIySB/3jU4AIT39wvCWBOJIckYsaaRuLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGMrvACTqjIpnqj2HOkLbHAtW1q21BbPFuuirCcGCY0=;
 b=bH248Ejz/xu+QUWkb/jKZYOKX6HMxVosy00v1xvB3ZcMBB4K0stVxRC+2SGGlrkszl37b18y+L15/c2mCnEh1vG0hjWSsaqFp2jPKqtFSr+pM0Uu+LWZ7m3Jiz5B4kgaWw88tpZtkx3hHrIuBVxcfqT5W+8OzUeKB9ufHkNE7zjmqN0u4s5cxMvHOYvchwEJCdzXK0WTWyCLWFDQDQgHABYdxp3B1DB25arZfuTSgBgFSUQWFiduKJLKATPKBa/5358HoL2XioMZHaymDoqH8nJMuLaRcRLph+Z7UYrUnGlZTLNqsd4m5lc2hYO24D0MxPRatX3p9KCS3PwAVjJbKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=iisc.ac.in;dmarc=pass action=none
 header.from=iisc.ac.in;dkim=pass header.d=iisc.ac.in;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iisc.ac.in;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGMrvACTqjIpnqj2HOkLbHAtW1q21BbPFuuirCcGCY0=;
 b=pn9iD6ZFUQk1eTGKsGRCHCTjhhGbUuMS/Xeb5YxTMG3Hk1s+tnqjzeic7BL8VJzJYEuGS2eLhzdDq4P0ZI8XnDLBsWY/nQf6orEid0XFAchDA3WYZOLfgLhdBiDE2vPEcBxy0g2EJeL01rTUloSmDdENNZNxt6FlsZdf4iDYF5Q=
Received: from MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM (10.174.63.142) by
 MAXPR0101MB1148.INDPRD01.PROD.OUTLOOK.COM (52.134.131.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Tue, 30 Jul 2019 12:42:48 +0000
Received: from MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::59de:f1b2:6017:42c6]) by MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::59de:f1b2:6017:42c6%11]) with mapi id 15.20.2115.005; Tue, 30 Jul
 2019 12:42:48 +0000
From: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>
To: John Johansen <john.johansen@canonical.com>, "apparmor@lists.ubuntu.com"
 <apparmor@lists.ubuntu.com>
Thread-Topic: [apparmor] Questions about AppArmor's Kernel Code
Thread-Index: AQHVQ7FiuL2/i98WSU25BWOuSi1nA6bdO70AgAP8vMGAAP1AAIAA5SPj
Date: Tue, 30 Jul 2019 12:42:48 +0000
Message-ID: <MAXPR0101MB1132051BC16EE16163A38898FBDC0@MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR0101MB1132042133609E595BCC6F0FFBC00@MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM>
 <9240f8b1-3b4a-ebad-85c3-5dfd938d8aa2@canonical.com>
 <PN1PR0101MB1133959D5B326EE0AAE60EA6FBDD0@PN1PR0101MB1133.INDPRD01.PROD.OUTLOOK.COM>,
 <84a65fdd-a6eb-ce58-ffe1-080adb0936cf@canonical.com>
In-Reply-To: <84a65fdd-a6eb-ce58-ffe1-080adb0936cf@canonical.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abhishekvijeev@iisc.ac.in; 
x-originating-ip: [14.139.128.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 740fa235-f5a7-4e2a-58fd-08d714eb6dce
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:MAXPR0101MB1148; 
x-ms-traffictypediagnostic: MAXPR0101MB1148:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <MAXPR0101MB1148215FEB1639C5928C9BE9FBDC0@MAXPR0101MB1148.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39850400004)(366004)(346002)(376002)(136003)(189003)(199004)(256004)(5024004)(71200400001)(76116006)(81156014)(7696005)(110136005)(74316002)(76176011)(8676002)(2906002)(66556008)(66446008)(64756008)(99936001)(68736007)(7736002)(66476007)(66616009)(81166006)(66946007)(52536014)(86362001)(91956017)(966005)(19627405001)(476003)(2501003)(8936002)(25786009)(486006)(14454004)(99286004)(6306002)(236005)(33656002)(6116002)(66066001)(6246003)(54896002)(55016002)(6436002)(9686003)(107886003)(478600001)(5660300002)(606006)(3846002)(53936002)(446003)(11346002)(229853002)(186003)(53546011)(102836004)(6506007)(6606003)(71190400001)(4326008)(14444005)(26005)(316002)(786003)(80872003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR0101MB1148;
 H:MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: iisc.ac.in does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Xjmp/B69CAPLICEuu9/QE3aTffkqHEtlrmfBLYry/zYFZWKBuFIK6ollBJ1TXblsXbZbOcrqfLSwSr2XdUtZ8db9NmrrxMerCcFN9Dj3lyxlUv/Bi9mWFZ39/cFSmC6LdG5ndX/+mxv/c6ELjX/jROEdejYYsbsCFUQw6oK33fzpIQ1PjjkWOhECzoc82Nm5XvVq16iSvuimR812RW8D6AboS+FvggChVLq4oq8NjQsVYExIL9Y9bNEn/oFeyLU0xLbK17GW8nbG2gMG6d8Nv3m9umNscdKa76TKImKHiAd7c9oIj/8Yh9vRhPuGWdNts3Kj5xOSb+AJ9NF/m3rNdgteW3Q/5N55j8OVDsPkk1qX+W45lp1NAAc3bsWwOrxNZgXYRFsbASMq0zyuupxPSqdMLDekfdNxNOouYgJA1Qs=
Content-Type: multipart/mixed;
 boundary="_004_MAXPR0101MB1132051BC16EE16163A38898FBDC0MAXPR0101MB1132_"
MIME-Version: 1.0
X-OriginatorOrg: iisc.ac.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 740fa235-f5a7-4e2a-58fd-08d714eb6dce
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 12:42:48.6335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f15cd97-f6a7-41e3-b2c5-ad4193976476
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: abhishekvijeev@IISc.ac.in
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR0101MB1148
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

--_004_MAXPR0101MB1132051BC16EE16163A38898FBDC0MAXPR0101MB1132_
Content-Type: multipart/alternative;
	boundary="_000_MAXPR0101MB1132051BC16EE16163A38898FBDC0MAXPR0101MB1132_"

--_000_MAXPR0101MB1132051BC16EE16163A38898FBDC0MAXPR0101MB1132_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you for the correction John.


Despite changing the code to use strdup( ), the kernel still crashes. I hav=
e attached the modified file for reference.


Is there anything else that might be causing the crash?

________________________________
From: John Johansen <john.johansen@canonical.com>
Sent: 30 July 2019 04:10:00
To: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>; apparmor@lists.ubuntu.com =
<apparmor@lists.ubuntu.com>
Cc: Rakesh Rajan Beck <rakeshbeck@iisc.ac.in>
Subject: Re: [apparmor] Questions about AppArmor's Kernel Code

I haven't tested if this is the cause of your failure but it could very wel=
l be

+       // Custom code begin
+
+       if (unpack_nameX(e, AA_STRUCT, "custom_label"))
+       {
+               profile->clabel =3D kzalloc (sizeof(struct custom_label), G=
FP_KERNEL);
+               if (!profile->clabel)
+                       goto fail;

this block of code
+               if (!unpack_str(e, &name, NULL))
+                       goto fail;
+               profile->clabel->label_name =3D kzalloc (strlen(name), GFP_=
KERNEL);
+               if (!profile->clabel->label_name)
+                       goto fail;
+
+               strcpy (profile->clabel->label_name, name);
+
you are allocation a string that is not long enough to include the null ter=
minating \0 so when
you use strcpy it is writing one byte beyond your allocated data.

replace this with
+               if (!unpack_strdup(e, &profile->clabel->label_name, NULL))
+                       goto fail;




+               if (!unpack_u32(e, &(profile->clabel->allow_cnt), NULL))
+                       goto fail;
+
+
+               if (unpack_nameX(e, AA_STRUCT, "data_list"))
+               {
+                       profile->clabel->allow_list =3D kzalloc(sizeof(stru=
ct data_list), GFP_KERNEL);
+                       if (!profile->clabel->allow_list)
+                               goto fail;
+                       INIT_LIST_HEAD(&(profile->clabel->allow_list->lh));
+
+                       for (i =3D 0; i < profile->clabel->allow_cnt; i++)
+                       {
+                               if (!unpack_str(e, &name, NULL))
+                                               goto fail;
+                               struct data_list *new_node =3D kzalloc(size=
of(struct data_list), GFP_KERNEL);
+                               if (!new_node)
+                                       goto fail;


same thing for this block of code
+                               new_node->data =3D kzalloc(strlen(name), GF=
P_KERNEL);
+                               if (!new_node->data)
+                                       goto fail;
+                               strcpy(new_node->data, name);
its writing 1 past the end of your allocation. You can either
- increase allocation size by one to account for terminating \0
- switch to unpack_strdup() like above and add a free on failure



+                               INIT_LIST_HEAD(&(new_node->lh));
+                               list_add(&(new_node->lh), &(profile->clabel=
->allow_list->lh));
+                       }
+                       if (!unpack_nameX(e, AA_STRUCTEND, NULL))
+                               goto fail;
+               }
+               if (!unpack_nameX(e, AA_STRUCTEND, NULL))
+                       goto fail;
+       }
+
+       // Custom code end

On 7/29/19 12:58 AM, Abhishek Vijeev wrote:
> Thank you for the explanation John.
>
> I have attached the files we have modified. Every piece of code that we i=
nserted is enclosed
> within comment lines 'Custom code begin' and 'Custom code end' so that it=
's easy for you to find. Here
> is a brief description of the changes made:
>
> AppArmor Parser (user-space) - We modified the grammar of AppArmor's pars=
er to include additional
>      grammar rules. These rules store data in class Profile
>
> a) profile.h - 2 new structure definitions to store our custom data
>   - class Profile now contains a member 'clabel'
> b) parser_interface.c - Added code to sd_serialize_profile( ) that serial=
izes the additional custom
>   data we added to class Profile during the parsing phase
> AppArmor LSM (kernel) :
>
>
> a) include/policy.h - 2 new structure definitions
>               - struct aa_profile now contains a member 'clabel'
>
> b) policy_unpack.c- Added code to unpack_profile( ) that unpacks the seri=
alized object sent from
> user-space, and allocates kernel memory for the security structures added=
 to
> aa_profile - namely, a label string and a linked list containing allow pe=
rmissions
> c) policy.c - Added code to function aa_free_profile( ) that frees the al=
located memory
>
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------
> *From:* John Johansen <john.johansen@canonical.com>
> *Sent:* 27 July 2019 00:10:14
> *To:* Abhishek Vijeev <abhishekvijeev@iisc.ac.in>; apparmor@lists.ubuntu.=
com <apparmor@lists.ubuntu.com>
> *Cc:* Rakesh Rajan Beck <rakeshbeck@iisc.ac.in>
> *Subject:* Re: [apparmor] Questions about AppArmor's Kernel Code
>
> On 7/26/19 5:56 AM, Abhishek Vijeev wrote:
>> Hi,
>>
>>
>> I have a few questions about AppArmor's kernel code and would be gratefu=
l if you could kindly answer them.
>>
>>
>> 1) Why does AppArmor maintain two separate security blobs in cred->secur=
ity as well as task-security for processes? For a simple project that requi=
res associating a security context with every task, would it suffice to use=
 just one of these?
>>
> the task->security field is used to store task specific information, that=
 is not used for general mediation. Currently the information stored their =
is for the change_hat and change_onexec apis and some info to track what th=
e confinement was when no-newprivs was applied to the task.
>
> cred->security is used to store the subjects label (type) for mediation.
>
> Before the task->security field was reintroduce all the information was s=
tored off the cred in a intermediate structure. Doing so would cause use of=
 the change_hat and change_onexec api to change the cred of the task even w=
hen the confinement had not changed. The switch to using the task->security=
 field was pre 4.18
>
>>
>> 2) There has been a change in the way security blobs are accessed from k=
ernel version 4.18 to 5.2. I see that in v5.2, the security blob's address =
is obtained by adding the size of the blob to the start address. Why has th=
is change been made? (For reference: https://github.com/torvalds/linux/blob=
/master/security/apparmor/include/cred.h#L24)
>>
> see Casey's answer
>
>>
>> 3) I tried adding a custom field (pointer to a custom structure) to stru=
ct aa_profile, at exactly this point - https://github.com/torvalds/linux/bl=
ob/master/security/apparmor/include/policy.h#L144. I have taken care to all=
ocate and free memory for the pointer at the appropriate places (allocation=
 is performed here - https://github.com/torvalds/linux/blob/master/security=
/apparmor/policy_unpack.c#L671 and freeing is performed here - https://gith=
ub.com/torvalds/linux/blob/master/security/apparmor/policy.c#L205). However=
, while booting the kernel, it crashes at the function 'security_prepare_cr=
eds( )', which I presume invokes 'apparmor_cred_prepare( )'. If I was, to a=
ssume for a moment that there are no bugs with my memory allocation code, i=
s there any other reason why such a crash might have occurred? I have attac=
hed the kernel crash log file with this email for your kind reference.
>>
>
> I know the code points but to be able to comment beyond vague guesses I n=
eed to see your changes. I can give you the warning to not add your field a=
fter the current last field,
>
>   struct aa_label label;
>
> as it has a variable length field. While that is always 2 entries when it=
s embedded in the profile the compiler will end up treating it as zero leng=
th over lapping your new field with the start of the variable length array.
>
> I do have a patch to address this using a union but I haven't landed it y=
et.


--_000_MAXPR0101MB1132051BC16EE16163A38898FBDC0MAXPR0101MB1132_
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
<p style=3D"margin-top:0;margin-bottom:0">Thank you for the correction John=
.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Despite changing the code to use =
strdup( ), the kernel still crashes. I have attached the modified&nbsp;file=
 for reference.&nbsp;</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Is there anything else that might=
 be causing the crash?</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> John Johansen &lt;joh=
n.johansen@canonical.com&gt;<br>
<b>Sent:</b> 30 July 2019 04:10:00<br>
<b>To:</b> Abhishek Vijeev &lt;abhishekvijeev@iisc.ac.in&gt;; apparmor@list=
s.ubuntu.com &lt;apparmor@lists.ubuntu.com&gt;<br>
<b>Cc:</b> Rakesh Rajan Beck &lt;rakeshbeck@iisc.ac.in&gt;<br>
<b>Subject:</b> Re: [apparmor] Questions about AppArmor's Kernel Code</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">I haven't tested if this is the cause of your fail=
ure but it could very well be<br>
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Custom code begin<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (unpack_nameX(e, AA_STRUCT, &q=
uot;custom_label&quot;))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; profile-&gt;clabel =3D kzalloc (sizeof(struct custom_label),=
 GFP_KERNEL);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (!profile-&gt;clabel)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto fail;<b=
r>
<br>
this block of code<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (!unpack_str(e, &amp;name, NULL))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto fail;<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; profile-&gt;clabel-&gt;label_name =3D kzalloc (strlen(name),=
 GFP_KERNEL);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (!profile-&gt;clabel-&gt;label_name)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto fail;<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; <br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; strcpy (profile-&gt;clabel-&gt;label_name, name);<br>
&#43;<br>
you are allocation a string that is not long enough to include the null ter=
minating \0 so when<br>
you use strcpy it is writing one byte beyond your allocated data.<br>
<br>
replace this with<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (!unpack_strdup(e, &amp;profile-&gt;clabel-&gt;label_name=
, NULL))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto fail;<b=
r>
<br>
<br>
<br>
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (!unpack_u32(e, &amp;(profile-&gt;clabel-&gt;allow_cnt), =
NULL))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto fail;<b=
r>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (unpack_nameX(e, AA_STRUCT, &quot;data_list&quot;)) <br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; profile-&gt;=
clabel-&gt;allow_list =3D kzalloc(sizeof(struct data_list), GFP_KERNEL);<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!profile=
-&gt;clabel-&gt;allow_list)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto fail;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_LIST_HE=
AD(&amp;(profile-&gt;clabel-&gt;allow_list-&gt;lh));<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0=
; i &lt; profile-&gt;clabel-&gt;allow_cnt; i&#43;&#43;)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!unpack_str(e, &amp;name, NULL))<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto fail;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct data_list *new_node =3D kzalloc(=
sizeof(struct data_list), GFP_KERNEL);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!new_node)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; goto fail;<br>
<br>
<br>
same thing for this block of code<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_node-&gt;data =3D kzalloc(strlen(na=
me), GFP_KERNEL);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!new_node-&gt;data)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; goto fail;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcpy(new_node-&gt;data, name);<br>
its writing 1 past the end of your allocation. You can either<br>
- increase allocation size by one to account for terminating \0<br>
- switch to unpack_strdup() like above and add a free on failure<br>
<br>
<br>
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_LIST_HEAD(&amp;(new_node-&gt;lh));=
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_add(&amp;(new_node-&gt;lh), &amp;(=
profile-&gt;clabel-&gt;allow_list-&gt;lh));<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!unpack_=
nameX(e, AA_STRUCTEND, NULL))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto fail;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (!unpack_nameX(e, AA_STRUCTEND, NULL))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto fail;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Custom code end<br>
<br>
On 7/29/19 12:58 AM, Abhishek Vijeev wrote:<br>
&gt; Thank you for the explanation John.<br>
&gt; <br>
&gt; I have attached the&nbsp;files we have&nbsp;modified. Every piece of c=
ode that we inserted is enclosed<br>
&gt; within comment lines 'Custom code begin' and 'Custom code end' so that=
 it's easy for you to find. Here<br>
&gt; is a brief description of the changes made:<br>
&gt; <br>
&gt; AppArmor Parser (user-space) -&nbsp;We modified the grammar of AppArmo=
r's parser to include additional&nbsp;<br>
&gt; &nbsp; &nbsp; &nbsp;grammar rules. These rules store data in class Pro=
file<br>
&gt; <br>
&gt; a) profile.h&nbsp;- 2 new structure definitions to store our custom da=
ta<br>
&gt; &nbsp; - class Profile now contains a member 'clabel'&nbsp;<br>
&gt; b) parser_interface.c&nbsp;- Added code to sd_serialize_profile( ) tha=
t serializes the additional custom<br>
&gt; &nbsp; data we added to class Profile during the parsing phase<br>
&gt; AppArmor LSM (kernel) :&nbsp; &nbsp; &nbsp;&nbsp;<br>
&gt; <br>
&gt; <br>
&gt; a) include/policy.h&nbsp;- 2 new structure definitions<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; - struct aa_profile n=
ow contains a member 'clabel'<br>
&gt; <br>
&gt; b) policy_unpack.c- Added code to unpack_profile( ) that unpacks the s=
erialized object sent from&nbsp;<br>
&gt; user-space, and allocates kernel memory for the security structures ad=
ded to&nbsp;<br>
&gt; aa_profile - namely, a label string and a linked list containing allow=
 permissions<br>
&gt; c) policy.c&nbsp;- Added code to function aa_free_profile( ) that free=
s the allocated memory&nbsp;<br>
&gt; <br>
&gt; ----------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
--------------------<br>
&gt; *From:* John Johansen &lt;john.johansen@canonical.com&gt;<br>
&gt; *Sent:* 27 July 2019 00:10:14<br>
&gt; *To:* Abhishek Vijeev &lt;abhishekvijeev@iisc.ac.in&gt;; apparmor@list=
s.ubuntu.com &lt;apparmor@lists.ubuntu.com&gt;<br>
&gt; *Cc:* Rakesh Rajan Beck &lt;rakeshbeck@iisc.ac.in&gt;<br>
&gt; *Subject:* Re: [apparmor] Questions about AppArmor's Kernel Code<br>
&gt; &nbsp;<br>
&gt; On 7/26/19 5:56 AM, Abhishek Vijeev wrote:<br>
&gt;&gt; Hi,<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; I have a few questions about AppArmor's kernel code and would be g=
rateful if you could kindly answer them.&nbsp;<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; 1) Why does AppArmor maintain two separate security blobs in cred-=
&gt;security as well as task-security for processes? For a simple project t=
hat requires associating a security context with every task, would it suffi=
ce to use just one of these?<br>
&gt;&gt; <br>
&gt; the task-&gt;security field is used to store task specific information=
, that is not used for general mediation. Currently the information stored =
their is for the change_hat and change_onexec apis and some info to track w=
hat the confinement was when no-newprivs
 was applied to the task.<br>
&gt; <br>
&gt; cred-&gt;security is used to store the subjects label (type) for media=
tion.<br>
&gt; <br>
&gt; Before the task-&gt;security field was reintroduce all the information=
 was stored off the cred in a intermediate structure. Doing so would cause =
use of the change_hat and change_onexec api to change the cred of the task =
even when the confinement had not changed.
 The switch to using the task-&gt;security field was pre 4.18<br>
&gt; <br>
&gt;&gt; <br>
&gt;&gt; 2) There has been a change in the way security blobs are accessed =
from kernel version 4.18 to 5.2. I see that in v5.2, the&nbsp;security blob=
's address is obtained by adding the size of the blob to the start address.=
 Why has this change been made? (For reference:&nbsp;<a href=3D"https://git=
hub.com/torvalds/linux/blob/master/security/apparmor/include/cred.h#L24">ht=
tps://github.com/torvalds/linux/blob/master/security/apparmor/include/cred.=
h#L24</a>)<br>
&gt;&gt; <br>
&gt; see Casey's answer<br>
&gt; <br>
&gt;&gt; <br>
&gt;&gt; 3) I tried adding a custom field (pointer to a custom structure) t=
o struct aa_profile, at exactly this point -&nbsp;<a href=3D"https://github=
.com/torvalds/linux/blob/master/security/apparmor/include/policy.h#L144">ht=
tps://github.com/torvalds/linux/blob/master/security/apparmor/include/polic=
y.h#L144</a>.
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
&gt;&gt; <br>
&gt; <br>
&gt; I know the code points but to be able to comment beyond vague guesses =
I need to see your changes. I can give you the warning to not add your fiel=
d after the current last field,<br>
&gt; <br>
&gt; &nbsp; struct aa_label label;<br>
&gt; <br>
&gt; as it has a variable length field. While that is always 2 entries when=
 its embedded in the profile the compiler will end up treating it as zero l=
ength over lapping your new field with the start of the variable length arr=
ay.<br>
&gt; <br>
&gt; I do have a patch to address this using a union but I haven't landed i=
t yet.<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MAXPR0101MB1132051BC16EE16163A38898FBDC0MAXPR0101MB1132_--

--_004_MAXPR0101MB1132051BC16EE16163A38898FBDC0MAXPR0101MB1132_
Content-Type: text/x-csrc; name="policy_unpack.c"
Content-Description: policy_unpack.c
Content-Disposition: attachment; filename="policy_unpack.c"; size=28110;
	creation-date="Tue, 30 Jul 2019 12:24:18 GMT";
	modification-date="Tue, 30 Jul 2019 12:24:18 GMT"
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
CQlnb3RvIGZhaWw7CgkJaWYgKCF1bnBhY2tfc3RyZHVwKGUsICZwcm9maWxlLT5jbGFiZWwtPmxh
YmVsX25hbWUsIE5VTEwpKQoJCQlnb3RvIGZhaWw7CgoJCWlmICghdW5wYWNrX3UzMihlLCAmKHBy
b2ZpbGUtPmNsYWJlbC0+YWxsb3dfY250KSwgTlVMTCkpCgkJCWdvdG8gZmFpbDsKCgkJCQoJCWlm
ICh1bnBhY2tfbmFtZVgoZSwgQUFfU1RSVUNULCAiZGF0YV9saXN0IikpIAoJCXsKCQkJcHJvZmls
ZS0+Y2xhYmVsLT5hbGxvd19saXN0ID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IGRhdGFfbGlzdCks
IEdGUF9LRVJORUwpOwoJCQlpZiAoIXByb2ZpbGUtPmNsYWJlbC0+YWxsb3dfbGlzdCkKCQkJCWdv
dG8gZmFpbDsKCQkJSU5JVF9MSVNUX0hFQUQoJihwcm9maWxlLT5jbGFiZWwtPmFsbG93X2xpc3Qt
PmxoKSk7CgoJCQlmb3IgKGkgPSAwOyBpIDwgcHJvZmlsZS0+Y2xhYmVsLT5hbGxvd19jbnQ7IGkr
KykKCQkJewoJCQkJc3RydWN0IGRhdGFfbGlzdCAqbmV3X25vZGUgPSBremFsbG9jKHNpemVvZihz
dHJ1Y3QgZGF0YV9saXN0KSwgR0ZQX0tFUk5FTCk7CgkJCQlpZiAoIW5ld19ub2RlKQoJCQkJCWdv
dG8gZmFpbDsKCQkJCWlmICghdW5wYWNrX3N0cmR1cChlLCAmbmV3X25vZGUtPmRhdGEsIE5VTEwp
KQogICAgICAgICAgICAgICAgICAgIGdvdG8gZmFpbDsKCQkJCUlOSVRfTElTVF9IRUFEKCYobmV3
X25vZGUtPmxoKSk7CgkJCQlsaXN0X2FkZCgmKG5ld19ub2RlLT5saCksICYocHJvZmlsZS0+Y2xh
YmVsLT5hbGxvd19saXN0LT5saCkpOwoJCQl9CgkJCWlmICghdW5wYWNrX25hbWVYKGUsIEFBX1NU
UlVDVEVORCwgTlVMTCkpCgkJCQlnb3RvIGZhaWw7CgkJfQoJCWlmICghdW5wYWNrX25hbWVYKGUs
IEFBX1NUUlVDVEVORCwgTlVMTCkpCgkJCWdvdG8gZmFpbDsJCQoJfQoKCS8vIEN1c3RvbSBjb2Rl
IGVuZAoKCgkvKiBwZXIgcHJvZmlsZSBkZWJ1ZyBmbGFncyAoY29tcGxhaW4sIGF1ZGl0KSAqLwoJ
aWYgKCF1bnBhY2tfbmFtZVgoZSwgQUFfU1RSVUNULCAiZmxhZ3MiKSkgewoJCWluZm8gPSAicHJv
ZmlsZSBtaXNzaW5nIGZsYWdzIjsKCQlnb3RvIGZhaWw7Cgl9CglpbmZvID0gImZhaWxlZCB0byB1
bnBhY2sgcHJvZmlsZSBmbGFncyI7CglpZiAoIXVucGFja191MzIoZSwgJnRtcCwgTlVMTCkpCgkJ
Z290byBmYWlsOwoJaWYgKHRtcCAmIFBBQ0tFRF9GTEFHX0hBVCkKCQlwcm9maWxlLT5sYWJlbC5m
bGFncyB8PSBGTEFHX0hBVDsKCWlmICghdW5wYWNrX3UzMihlLCAmdG1wLCBOVUxMKSkKCQlnb3Rv
IGZhaWw7CglpZiAodG1wID09IFBBQ0tFRF9NT0RFX0NPTVBMQUlOIHx8IChlLT52ZXJzaW9uICYg
Rk9SQ0VfQ09NUExBSU5fRkxBRykpCgkJcHJvZmlsZS0+bW9kZSA9IEFQUEFSTU9SX0NPTVBMQUlO
OwoJZWxzZSBpZiAodG1wID09IFBBQ0tFRF9NT0RFX0tJTEwpCgkJcHJvZmlsZS0+bW9kZSA9IEFQ
UEFSTU9SX0tJTEw7CgllbHNlIGlmICh0bXAgPT0gUEFDS0VEX01PREVfVU5DT05GSU5FRCkKCQlw
cm9maWxlLT5tb2RlID0gQVBQQVJNT1JfVU5DT05GSU5FRDsKCWlmICghdW5wYWNrX3UzMihlLCAm
dG1wLCBOVUxMKSkKCQlnb3RvIGZhaWw7CglpZiAodG1wKQoJCXByb2ZpbGUtPmF1ZGl0ID0gQVVE
SVRfQUxMOwoKCWlmICghdW5wYWNrX25hbWVYKGUsIEFBX1NUUlVDVEVORCwgTlVMTCkpCgkJZ290
byBmYWlsOwoKCS8qIHBhdGhfZmxhZ3MgaXMgb3B0aW9uYWwgKi8KCWlmICh1bnBhY2tfdTMyKGUs
ICZwcm9maWxlLT5wYXRoX2ZsYWdzLCAicGF0aF9mbGFncyIpKQoJCXByb2ZpbGUtPnBhdGhfZmxh
Z3MgfD0gcHJvZmlsZS0+bGFiZWwuZmxhZ3MgJgoJCQlQQVRIX01FRElBVEVfREVMRVRFRDsKCWVs
c2UKCQkvKiBzZXQgYSBkZWZhdWx0IHZhbHVlIGlmIHBhdGhfZmxhZ3MgZmllbGQgaXMgbm90IHBy
ZXNlbnQgKi8KCQlwcm9maWxlLT5wYXRoX2ZsYWdzID0gUEFUSF9NRURJQVRFX0RFTEVURUQ7CgoJ
aW5mbyA9ICJmYWlsZWQgdG8gdW5wYWNrIHByb2ZpbGUgY2FwYWJpbGl0aWVzIjsKCWlmICghdW5w
YWNrX3UzMihlLCAmKHByb2ZpbGUtPmNhcHMuYWxsb3cuY2FwWzBdKSwgTlVMTCkpCgkJZ290byBm
YWlsOwoJaWYgKCF1bnBhY2tfdTMyKGUsICYocHJvZmlsZS0+Y2Fwcy5hdWRpdC5jYXBbMF0pLCBO
VUxMKSkKCQlnb3RvIGZhaWw7CglpZiAoIXVucGFja191MzIoZSwgJihwcm9maWxlLT5jYXBzLnF1
aWV0LmNhcFswXSksIE5VTEwpKQoJCWdvdG8gZmFpbDsKCWlmICghdW5wYWNrX3UzMihlLCAmdG1w
Y2FwLmNhcFswXSwgTlVMTCkpCgkJZ290byBmYWlsOwoKCWluZm8gPSAiZmFpbGVkIHRvIHVucGFj
ayB1cHBlciBwcm9maWxlIGNhcGFiaWxpdGllcyI7CglpZiAodW5wYWNrX25hbWVYKGUsIEFBX1NU
UlVDVCwgImNhcHM2NCIpKSB7CgkJLyogb3B0aW9uYWwgdXBwZXIgaGFsZiBvZiA2NCBiaXQgY2Fw
cyAqLwoJCWlmICghdW5wYWNrX3UzMihlLCAmKHByb2ZpbGUtPmNhcHMuYWxsb3cuY2FwWzFdKSwg
TlVMTCkpCgkJCWdvdG8gZmFpbDsKCQlpZiAoIXVucGFja191MzIoZSwgJihwcm9maWxlLT5jYXBz
LmF1ZGl0LmNhcFsxXSksIE5VTEwpKQoJCQlnb3RvIGZhaWw7CgkJaWYgKCF1bnBhY2tfdTMyKGUs
ICYocHJvZmlsZS0+Y2Fwcy5xdWlldC5jYXBbMV0pLCBOVUxMKSkKCQkJZ290byBmYWlsOwoJCWlm
ICghdW5wYWNrX3UzMihlLCAmKHRtcGNhcC5jYXBbMV0pLCBOVUxMKSkKCQkJZ290byBmYWlsOwoJ
CWlmICghdW5wYWNrX25hbWVYKGUsIEFBX1NUUlVDVEVORCwgTlVMTCkpCgkJCWdvdG8gZmFpbDsK
CX0KCglpbmZvID0gImZhaWxlZCB0byB1bnBhY2sgZXh0ZW5kZWQgcHJvZmlsZSBjYXBhYmlsaXRp
ZXMiOwoJaWYgKHVucGFja19uYW1lWChlLCBBQV9TVFJVQ1QsICJjYXBzeCIpKSB7CgkJLyogb3B0
aW9uYWwgZXh0ZW5kZWQgY2FwcyBtZWRpYXRpb24gbWFzayAqLwoJCWlmICghdW5wYWNrX3UzMihl
LCAmKHByb2ZpbGUtPmNhcHMuZXh0ZW5kZWQuY2FwWzBdKSwgTlVMTCkpCgkJCWdvdG8gZmFpbDsK
CQlpZiAoIXVucGFja191MzIoZSwgJihwcm9maWxlLT5jYXBzLmV4dGVuZGVkLmNhcFsxXSksIE5V
TEwpKQoJCQlnb3RvIGZhaWw7CgkJaWYgKCF1bnBhY2tfbmFtZVgoZSwgQUFfU1RSVUNURU5ELCBO
VUxMKSkKCQkJZ290byBmYWlsOwoJfQoKCWlmICghdW5wYWNrX3hhdHRycyhlLCBwcm9maWxlKSkg
ewoJCWluZm8gPSAiZmFpbGVkIHRvIHVucGFjayBwcm9maWxlIHhhdHRycyI7CgkJZ290byBmYWls
OwoJfQoKCWlmICghdW5wYWNrX3JsaW1pdHMoZSwgcHJvZmlsZSkpIHsKCQlpbmZvID0gImZhaWxl
ZCB0byB1bnBhY2sgcHJvZmlsZSBybGltaXRzIjsKCQlnb3RvIGZhaWw7Cgl9CgoJaWYgKCF1bnBh
Y2tfc2VjbWFyayhlLCBwcm9maWxlKSkgewoJCWluZm8gPSAiZmFpbGVkIHRvIHVucGFjayBwcm9m
aWxlIHNlY21hcmsgcnVsZXMiOwoJCWdvdG8gZmFpbDsKCX0KCglpZiAodW5wYWNrX25hbWVYKGUs
IEFBX1NUUlVDVCwgInBvbGljeWRiIikpIHsKCQkvKiBnZW5lcmljIHBvbGljeSBkZmEgLSBvcHRp
b25hbCBhbmQgbWF5IGJlIE5VTEwgKi8KCQlpbmZvID0gImZhaWxlZCB0byB1bnBhY2sgcG9saWN5
ZGIiOwoJCXByb2ZpbGUtPnBvbGljeS5kZmEgPSB1bnBhY2tfZGZhKGUpOwoJCWlmIChJU19FUlIo
cHJvZmlsZS0+cG9saWN5LmRmYSkpIHsKCQkJZXJyb3IgPSBQVFJfRVJSKHByb2ZpbGUtPnBvbGlj
eS5kZmEpOwoJCQlwcm9maWxlLT5wb2xpY3kuZGZhID0gTlVMTDsKCQkJZ290byBmYWlsOwoJCX0g
ZWxzZSBpZiAoIXByb2ZpbGUtPnBvbGljeS5kZmEpIHsKCQkJZXJyb3IgPSAtRVBST1RPOwoJCQln
b3RvIGZhaWw7CgkJfQoJCWlmICghdW5wYWNrX3UzMihlLCAmcHJvZmlsZS0+cG9saWN5LnN0YXJ0
WzBdLCAic3RhcnQiKSkKCQkJLyogZGVmYXVsdCBzdGFydCBzdGF0ZSAqLwoJCQlwcm9maWxlLT5w
b2xpY3kuc3RhcnRbMF0gPSBERkFfU1RBUlQ7CgkJLyogc2V0dXAgY2xhc3MgaW5kZXggKi8KCQlm
b3IgKGkgPSBBQV9DTEFTU19GSUxFOyBpIDw9IEFBX0NMQVNTX0xBU1Q7IGkrKykgewoJCQlwcm9m
aWxlLT5wb2xpY3kuc3RhcnRbaV0gPQoJCQkJYWFfZGZhX25leHQocHJvZmlsZS0+cG9saWN5LmRm
YSwKCQkJCQkgICAgcHJvZmlsZS0+cG9saWN5LnN0YXJ0WzBdLAoJCQkJCSAgICBpKTsKCQl9CgkJ
aWYgKCF1bnBhY2tfbmFtZVgoZSwgQUFfU1RSVUNURU5ELCBOVUxMKSkKCQkJZ290byBmYWlsOwoJ
fSBlbHNlCgkJcHJvZmlsZS0+cG9saWN5LmRmYSA9IGFhX2dldF9kZmEobnVsbGRmYSk7CgoJLyog
Z2V0IGZpbGUgcnVsZXMgKi8KCXByb2ZpbGUtPmZpbGUuZGZhID0gdW5wYWNrX2RmYShlKTsKCWlm
IChJU19FUlIocHJvZmlsZS0+ZmlsZS5kZmEpKSB7CgkJZXJyb3IgPSBQVFJfRVJSKHByb2ZpbGUt
PmZpbGUuZGZhKTsKCQlwcm9maWxlLT5maWxlLmRmYSA9IE5VTEw7CgkJaW5mbyA9ICJmYWlsZWQg
dG8gdW5wYWNrIHByb2ZpbGUgZmlsZSBydWxlcyI7CgkJZ290byBmYWlsOwoJfSBlbHNlIGlmIChw
cm9maWxlLT5maWxlLmRmYSkgewoJCWlmICghdW5wYWNrX3UzMihlLCAmcHJvZmlsZS0+ZmlsZS5z
dGFydCwgImRmYV9zdGFydCIpKQoJCQkvKiBkZWZhdWx0IHN0YXJ0IHN0YXRlICovCgkJCXByb2Zp
bGUtPmZpbGUuc3RhcnQgPSBERkFfU1RBUlQ7Cgl9IGVsc2UgaWYgKHByb2ZpbGUtPnBvbGljeS5k
ZmEgJiYKCQkgICBwcm9maWxlLT5wb2xpY3kuc3RhcnRbQUFfQ0xBU1NfRklMRV0pIHsKCQlwcm9m
aWxlLT5maWxlLmRmYSA9IGFhX2dldF9kZmEocHJvZmlsZS0+cG9saWN5LmRmYSk7CgkJcHJvZmls
ZS0+ZmlsZS5zdGFydCA9IHByb2ZpbGUtPnBvbGljeS5zdGFydFtBQV9DTEFTU19GSUxFXTsKCX0g
ZWxzZQoJCXByb2ZpbGUtPmZpbGUuZGZhID0gYWFfZ2V0X2RmYShudWxsZGZhKTsKCglpZiAoIXVu
cGFja190cmFuc190YWJsZShlLCBwcm9maWxlKSkgewoJCWluZm8gPSAiZmFpbGVkIHRvIHVucGFj
ayBwcm9maWxlIHRyYW5zaXRpb24gdGFibGUiOwoJCWdvdG8gZmFpbDsKCX0KCglpZiAodW5wYWNr
X25hbWVYKGUsIEFBX1NUUlVDVCwgImRhdGEiKSkgewoJCWluZm8gPSAib3V0IG9mIG1lbW9yeSI7
CgkJcHJvZmlsZS0+ZGF0YSA9IGt6YWxsb2Moc2l6ZW9mKCpwcm9maWxlLT5kYXRhKSwgR0ZQX0tF
Uk5FTCk7CgkJaWYgKCFwcm9maWxlLT5kYXRhKQoJCQlnb3RvIGZhaWw7CgoJCXBhcmFtcy5uZWxl
bV9oaW50ID0gMzsKCQlwYXJhbXMua2V5X2xlbiA9IHNpemVvZih2b2lkICopOwoJCXBhcmFtcy5r
ZXlfb2Zmc2V0ID0gb2Zmc2V0b2Yoc3RydWN0IGFhX2RhdGEsIGtleSk7CgkJcGFyYW1zLmhlYWRf
b2Zmc2V0ID0gb2Zmc2V0b2Yoc3RydWN0IGFhX2RhdGEsIGhlYWQpOwoJCXBhcmFtcy5oYXNoZm4g
PSBzdHJoYXNoOwoJCXBhcmFtcy5vYmpfY21wZm4gPSBkYXRhY21wOwoKCQlpZiAocmhhc2h0YWJs
ZV9pbml0KHByb2ZpbGUtPmRhdGEsICZwYXJhbXMpKSB7CgkJCWluZm8gPSAiZmFpbGVkIHRvIGlu
aXQga2V5LCB2YWx1ZSBoYXNoIHRhYmxlIjsKCQkJZ290byBmYWlsOwoJCX0KCgkJd2hpbGUgKHVu
cGFja19zdHJkdXAoZSwgJmtleSwgTlVMTCkpIHsKCQkJZGF0YSA9IGt6YWxsb2Moc2l6ZW9mKCpk
YXRhKSwgR0ZQX0tFUk5FTCk7CgkJCWlmICghZGF0YSkgewoJCQkJa3pmcmVlKGtleSk7CgkJCQln
b3RvIGZhaWw7CgkJCX0KCgkJCWRhdGEtPmtleSA9IGtleTsKCQkJZGF0YS0+c2l6ZSA9IHVucGFj
a19ibG9iKGUsICZkYXRhLT5kYXRhLCBOVUxMKTsKCQkJZGF0YS0+ZGF0YSA9IGt2bWVtZHVwKGRh
dGEtPmRhdGEsIGRhdGEtPnNpemUpOwoJCQlpZiAoZGF0YS0+c2l6ZSAmJiAhZGF0YS0+ZGF0YSkg
ewoJCQkJa3pmcmVlKGRhdGEtPmtleSk7CgkJCQlremZyZWUoZGF0YSk7CgkJCQlnb3RvIGZhaWw7
CgkJCX0KCgkJCXJoYXNodGFibGVfaW5zZXJ0X2Zhc3QocHJvZmlsZS0+ZGF0YSwgJmRhdGEtPmhl
YWQsCgkJCQkJICAgICAgIHByb2ZpbGUtPmRhdGEtPnApOwoJCX0KCgkJaWYgKCF1bnBhY2tfbmFt
ZVgoZSwgQUFfU1RSVUNURU5ELCBOVUxMKSkgewoJCQlpbmZvID0gImZhaWxlZCB0byB1bnBhY2sg
ZW5kIG9mIGtleSwgdmFsdWUgZGF0YSB0YWJsZSI7CgkJCWdvdG8gZmFpbDsKCQl9Cgl9CgoJaWYg
KCF1bnBhY2tfbmFtZVgoZSwgQUFfU1RSVUNURU5ELCBOVUxMKSkgewoJCWluZm8gPSAiZmFpbGVk
IHRvIHVucGFjayBlbmQgb2YgcHJvZmlsZSI7CgkJZ290byBmYWlsOwoJfQoKCXJldHVybiBwcm9m
aWxlOwoKZmFpbDoKCWlmIChwcm9maWxlKQoJCW5hbWUgPSBOVUxMOwoJZWxzZSBpZiAoIW5hbWUp
CgkJbmFtZSA9ICJ1bmtub3duIjsKCWF1ZGl0X2lmYWNlKHByb2ZpbGUsIE5VTEwsIG5hbWUsIGlu
Zm8sIGUsIGVycm9yKTsKCWFhX2ZyZWVfcHJvZmlsZShwcm9maWxlKTsKCglyZXR1cm4gRVJSX1BU
UihlcnJvcik7Cn0KCi8qKgogKiB2ZXJpZnlfaGVhZCAtIHVucGFjayBzZXJpYWxpemVkIHN0cmVh
bSBoZWFkZXIKICogQGU6IHNlcmlhbGl6ZWQgZGF0YSByZWFkIGhlYWQgKE5PVCBOVUxMKQogKiBA
cmVxdWlyZWQ6IHdoZXRoZXIgdGhlIGhlYWRlciBpcyByZXF1aXJlZCBvciBvcHRpb25hbAogKiBA
bnM6IFJldHVybnMgLSBuYW1lc3BhY2UgaWYgb25lIGlzIHNwZWNpZmllZCBlbHNlIE5VTEwgKE5P
VCBOVUxMKQogKgogKiBSZXR1cm5zOiBlcnJvciBvciAwIGlmIGhlYWRlciBpcyBnb29kCiAqLwpz
dGF0aWMgaW50IHZlcmlmeV9oZWFkZXIoc3RydWN0IGFhX2V4dCAqZSwgaW50IHJlcXVpcmVkLCBj
b25zdCBjaGFyICoqbnMpCnsKCWludCBlcnJvciA9IC1FUFJPVE9OT1NVUFBPUlQ7Cgljb25zdCBj
aGFyICpuYW1lID0gTlVMTDsKCSpucyA9IE5VTEw7CgoJLyogZ2V0IHRoZSBpbnRlcmZhY2UgdmVy
c2lvbiAqLwoJaWYgKCF1bnBhY2tfdTMyKGUsICZlLT52ZXJzaW9uLCAidmVyc2lvbiIpKSB7CgkJ
aWYgKHJlcXVpcmVkKSB7CgkJCWF1ZGl0X2lmYWNlKE5VTEwsIE5VTEwsIE5VTEwsICJpbnZhbGlk
IHByb2ZpbGUgZm9ybWF0IiwKCQkJCSAgICBlLCBlcnJvcik7CgkJCXJldHVybiBlcnJvcjsKCQl9
Cgl9CgoJLyogQ2hlY2sgdGhhdCB0aGUgaW50ZXJmYWNlIHZlcnNpb24gaXMgY3VycmVudGx5IHN1
cHBvcnRlZC4KCSAqIGlmIG5vdCBzcGVjaWZpZWQgdXNlIHByZXZpb3VzIHZlcnNpb24KCSAqIE1h
c2sgb2ZmIGV2ZXJ5dGhpbmcgdGhhdCBpcyBub3Qga2VybmVsIGFiaSB2ZXJzaW9uCgkgKi8KCWlm
IChWRVJTSU9OX0xUKGUtPnZlcnNpb24sIHY1KSB8fCBWRVJTSU9OX0dUKGUtPnZlcnNpb24sIHY3
KSkgewoJCWF1ZGl0X2lmYWNlKE5VTEwsIE5VTEwsIE5VTEwsICJ1bnN1cHBvcnRlZCBpbnRlcmZh
Y2UgdmVyc2lvbiIsCgkJCSAgICBlLCBlcnJvcik7CgkJcmV0dXJuIGVycm9yOwoJfQoKCS8qIHJl
YWQgdGhlIG5hbWVzcGFjZSBpZiBwcmVzZW50ICovCglpZiAodW5wYWNrX3N0cihlLCAmbmFtZSwg
Im5hbWVzcGFjZSIpKSB7CgkJaWYgKCpuYW1lID09ICdcMCcpIHsKCQkJYXVkaXRfaWZhY2UoTlVM
TCwgTlVMTCwgTlVMTCwgImludmFsaWQgbmFtZXNwYWNlIG5hbWUiLAoJCQkJICAgIGUsIGVycm9y
KTsKCQkJcmV0dXJuIGVycm9yOwoJCX0KCQlpZiAoKm5zICYmIHN0cmNtcCgqbnMsIG5hbWUpKQoJ
CQlhdWRpdF9pZmFjZShOVUxMLCBOVUxMLCBOVUxMLCAiaW52YWxpZCBucyBjaGFuZ2UiLCBlLAoJ
CQkJICAgIGVycm9yKTsKCQllbHNlIGlmICghKm5zKQoJCQkqbnMgPSBuYW1lOwoJfQoKCXJldHVy
biAwOwp9CgpzdGF0aWMgYm9vbCB2ZXJpZnlfeGluZGV4KGludCB4aW5kZXgsIGludCB0YWJsZV9z
aXplKQp7CglpbnQgaW5kZXgsIHh0eXBlOwoJeHR5cGUgPSB4aW5kZXggJiBBQV9YX1RZUEVfTUFT
SzsKCWluZGV4ID0geGluZGV4ICYgQUFfWF9JTkRFWF9NQVNLOwoJaWYgKHh0eXBlID09IEFBX1hf
VEFCTEUgJiYgaW5kZXggPj0gdGFibGVfc2l6ZSkKCQlyZXR1cm4gMDsKCXJldHVybiAxOwp9Cgov
KiB2ZXJpZnkgZGZhIHhpbmRleGVzIGFyZSBpbiByYW5nZSBvZiB0cmFuc2l0aW9uIHRhYmxlcyAq
LwpzdGF0aWMgYm9vbCB2ZXJpZnlfZGZhX3hpbmRleChzdHJ1Y3QgYWFfZGZhICpkZmEsIGludCB0
YWJsZV9zaXplKQp7CglpbnQgaTsKCWZvciAoaSA9IDA7IGkgPCBkZmEtPnRhYmxlc1tZWVREX0lE
X0FDQ0VQVF0tPnRkX2xvbGVuOyBpKyspIHsKCQlpZiAoIXZlcmlmeV94aW5kZXgoZGZhX3VzZXJf
eGluZGV4KGRmYSwgaSksIHRhYmxlX3NpemUpKQoJCQlyZXR1cm4gMDsKCQlpZiAoIXZlcmlmeV94
aW5kZXgoZGZhX290aGVyX3hpbmRleChkZmEsIGkpLCB0YWJsZV9zaXplKSkKCQkJcmV0dXJuIDA7
Cgl9CglyZXR1cm4gMTsKfQoKLyoqCiAqIHZlcmlmeV9wcm9maWxlIC0gRG8gcG9zdCB1bnBhY2sg
YW5hbHlzaXMgdG8gdmVyaWZ5IHByb2ZpbGUgY29uc2lzdGVuY3kKICogQHByb2ZpbGU6IHByb2Zp
bGUgdG8gdmVyaWZ5IChOT1QgTlVMTCkKICoKICogUmV0dXJuczogMCBpZiBwYXNzZXMgdmVyaWZp
Y2F0aW9uIGVsc2UgZXJyb3IKICovCnN0YXRpYyBpbnQgdmVyaWZ5X3Byb2ZpbGUoc3RydWN0IGFh
X3Byb2ZpbGUgKnByb2ZpbGUpCnsKCWlmIChwcm9maWxlLT5maWxlLmRmYSAmJgoJICAgICF2ZXJp
ZnlfZGZhX3hpbmRleChwcm9maWxlLT5maWxlLmRmYSwKCQkJICAgICAgIHByb2ZpbGUtPmZpbGUu
dHJhbnMuc2l6ZSkpIHsKCQlhdWRpdF9pZmFjZShwcm9maWxlLCBOVUxMLCBOVUxMLCAiSW52YWxp
ZCBuYW1lZCB0cmFuc2l0aW9uIiwKCQkJICAgIE5VTEwsIC1FUFJPVE8pOwoJCXJldHVybiAtRVBS
T1RPOwoJfQoKCXJldHVybiAwOwp9Cgp2b2lkIGFhX2xvYWRfZW50X2ZyZWUoc3RydWN0IGFhX2xv
YWRfZW50ICplbnQpCnsKCWlmIChlbnQpIHsKCQlhYV9wdXRfcHJvZmlsZShlbnQtPnJlbmFtZSk7
CgkJYWFfcHV0X3Byb2ZpbGUoZW50LT5vbGQpOwoJCWFhX3B1dF9wcm9maWxlKGVudC0+bmV3KTsK
CQlrZnJlZShlbnQtPm5zX25hbWUpOwoJCWt6ZnJlZShlbnQpOwoJfQp9CgpzdHJ1Y3QgYWFfbG9h
ZF9lbnQgKmFhX2xvYWRfZW50X2FsbG9jKHZvaWQpCnsKCXN0cnVjdCBhYV9sb2FkX2VudCAqZW50
ID0ga3phbGxvYyhzaXplb2YoKmVudCksIEdGUF9LRVJORUwpOwoJaWYgKGVudCkKCQlJTklUX0xJ
U1RfSEVBRCgmZW50LT5saXN0KTsKCXJldHVybiBlbnQ7Cn0KCi8qKgogKiBhYV91bnBhY2sgLSB1
bnBhY2sgcGFja2VkIGJpbmFyeSBwcm9maWxlKHMpIGRhdGEgbG9hZGVkIGZyb20gdXNlciBzcGFj
ZQogKiBAdWRhdGE6IHVzZXIgZGF0YSBjb3BpZWQgdG8ga21lbSAgKE5PVCBOVUxMKQogKiBAbGg6
IGxpc3QgdG8gcGxhY2UgdW5wYWNrZWQgcHJvZmlsZXMgaW4gYSBhYV9yZXBsX3dzCiAqIEBuczog
UmV0dXJucyBuYW1lc3BhY2UgcHJvZmlsZSBpcyBpbiBpZiBzcGVjaWZpZWQgZWxzZSBOVUxMIChO
T1QgTlVMTCkKICoKICogVW5wYWNrIHVzZXIgZGF0YSBhbmQgcmV0dXJuIHJlZmNvdW50ZWQgYWxs
b2NhdGVkIHByb2ZpbGUocykgc3RvcmVkIGluCiAqIEBsaCBpbiBvcmRlciBvZiBkaXNjb3Zlcnks
IHdpdGggdGhlIGxpc3QgY2hhaW4gc3RvcmVkIGluIGJhc2UubGlzdAogKiBvciBlcnJvcgogKgog
KiBSZXR1cm5zOiBwcm9maWxlKHMpIG9uIEBsaCBlbHNlIGVycm9yIHBvaW50ZXIgaWYgZmFpbHMg
dG8gdW5wYWNrCiAqLwppbnQgYWFfdW5wYWNrKHN0cnVjdCBhYV9sb2FkZGF0YSAqdWRhdGEsIHN0
cnVjdCBsaXN0X2hlYWQgKmxoLAoJICAgICAgY29uc3QgY2hhciAqKm5zKQp7CglzdHJ1Y3QgYWFf
bG9hZF9lbnQgKnRtcCwgKmVudDsKCXN0cnVjdCBhYV9wcm9maWxlICpwcm9maWxlID0gTlVMTDsK
CWludCBlcnJvcjsKCXN0cnVjdCBhYV9leHQgZSA9IHsKCQkuc3RhcnQgPSB1ZGF0YS0+ZGF0YSwK
CQkuZW5kID0gdWRhdGEtPmRhdGEgKyB1ZGF0YS0+c2l6ZSwKCQkucG9zID0gdWRhdGEtPmRhdGEs
Cgl9OwoKCSpucyA9IE5VTEw7Cgl3aGlsZSAoZS5wb3MgPCBlLmVuZCkgewoJCWNoYXIgKm5zX25h
bWUgPSBOVUxMOwoJCXZvaWQgKnN0YXJ0OwoJCWVycm9yID0gdmVyaWZ5X2hlYWRlcigmZSwgZS5w
b3MgPT0gZS5zdGFydCwgbnMpOwoJCWlmIChlcnJvcikKCQkJZ290byBmYWlsOwoKCQlzdGFydCA9
IGUucG9zOwoJCXByb2ZpbGUgPSB1bnBhY2tfcHJvZmlsZSgmZSwgJm5zX25hbWUpOwoJCWlmIChJ
U19FUlIocHJvZmlsZSkpIHsKCQkJZXJyb3IgPSBQVFJfRVJSKHByb2ZpbGUpOwoJCQlnb3RvIGZh
aWw7CgkJfQoKCQllcnJvciA9IHZlcmlmeV9wcm9maWxlKHByb2ZpbGUpOwoJCWlmIChlcnJvcikK
CQkJZ290byBmYWlsX3Byb2ZpbGU7CgoJCWlmIChhYV9nX2hhc2hfcG9saWN5KQoJCQllcnJvciA9
IGFhX2NhbGNfcHJvZmlsZV9oYXNoKHByb2ZpbGUsIGUudmVyc2lvbiwgc3RhcnQsCgkJCQkJCSAg
ICAgZS5wb3MgLSBzdGFydCk7CgkJaWYgKGVycm9yKQoJCQlnb3RvIGZhaWxfcHJvZmlsZTsKCgkJ
ZW50ID0gYWFfbG9hZF9lbnRfYWxsb2MoKTsKCQlpZiAoIWVudCkgewoJCQllcnJvciA9IC1FTk9N
RU07CgkJCWdvdG8gZmFpbF9wcm9maWxlOwoJCX0KCgkJZW50LT5uZXcgPSBwcm9maWxlOwoJCWVu
dC0+bnNfbmFtZSA9IG5zX25hbWU7CgkJbGlzdF9hZGRfdGFpbCgmZW50LT5saXN0LCBsaCk7Cgl9
Cgl1ZGF0YS0+YWJpID0gZS52ZXJzaW9uICYgS19BQklfTUFTSzsKCWlmIChhYV9nX2hhc2hfcG9s
aWN5KSB7CgkJdWRhdGEtPmhhc2ggPSBhYV9jYWxjX2hhc2godWRhdGEtPmRhdGEsIHVkYXRhLT5z
aXplKTsKCQlpZiAoSVNfRVJSKHVkYXRhLT5oYXNoKSkgewoJCQllcnJvciA9IFBUUl9FUlIodWRh
dGEtPmhhc2gpOwoJCQl1ZGF0YS0+aGFzaCA9IE5VTEw7CgkJCWdvdG8gZmFpbDsKCQl9Cgl9Cgly
ZXR1cm4gMDsKCmZhaWxfcHJvZmlsZToKCWFhX3B1dF9wcm9maWxlKHByb2ZpbGUpOwoKZmFpbDoK
CWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShlbnQsIHRtcCwgbGgsIGxpc3QpIHsKCQlsaXN0X2Rl
bF9pbml0KCZlbnQtPmxpc3QpOwoJCWFhX2xvYWRfZW50X2ZyZWUoZW50KTsKCX0KCglyZXR1cm4g
ZXJyb3I7Cn0K

--_004_MAXPR0101MB1132051BC16EE16163A38898FBDC0MAXPR0101MB1132_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--_004_MAXPR0101MB1132051BC16EE16163A38898FBDC0MAXPR0101MB1132_--


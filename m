Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC7B96C85B
	for <lists+apparmor@lfdr.de>; Wed,  4 Sep 2024 22:28:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1slwbt-00011P-50; Wed, 04 Sep 2024 20:28:13 +0000
Received: from sonic305-27.consmr.mail.gq1.yahoo.com ([98.137.64.90])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <casey@schaufler-ca.com>)
 id 1slwbq-00011C-9p
 for apparmor@lists.ubuntu.com; Wed, 04 Sep 2024 20:28:10 +0000
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1725481688; bh=xIeqnhWaAGjIrXQPKx4W7F1rY0oEncZd7u28JgSLW2U=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=ope5TQROFx4Tbs2Z7wmYKLtn6Lb5r0a7f+0KEWeWkycbcUipU8CljD+LHD7Ymabt4i7ucdhiSc+KAbpxA5VRf572r5DdR262QoO3oUnfDkNhtPerT727sCqb3QukZvtNOlGjiqw8nBU3jopGSJfYzaxivz+Us+5NhrKjq7fd53DsNDTyvcmYrd/54KzQLm+qXtfKoZJbXXquweSojnOAyc413sJ2/HzhOIT7HP+QunK//2qa7fRMP3hZ5nJLE5X9YreVQxiCKFLK8ZUMXOVV6Bl9E/Dj+c92LcS5p2/W+kExZAE4/Espy4ovtN5St+INJJ/hNMx+/dedJa6JEt/2gg==
X-YMail-OSG: kaCSSqoVM1nZuHWHUTpccJZtqg15.HQWHswVMbzvJHzcpBCtW7JW6jAtkpLM3qs
 vOu_0PzP9Y47oPvVO6S5gtZ_FfZp0EogbXUTPHAIctCWpl1bROpypfSOq5abBeaZ6xAZ5JchotaU
 3KNjtmsrbKneqNs8TpQK.N93H0kLqDg72nvpuYyH.5RtMQxNyS_xjNq.dr_yWsPAMnVzElRPTdcO
 zT7MW_nbZC3srttXSGeLhDsUpLlua4w76HAbqPpRNTOAnJsMe.XzEH7x0SCe4O8SGGwUiDFLVoRV
 fI9fSlP.Jg5n3GGz4dh8RlDQpv82HlhiyND2Re1Xt7SPluFolDFyFrM4IokRQUUwAAzE2mKJ5rsX
 GvUzAzZ9OuuTia5SQsc.2iV2gCKyF43kgZHHwzmzVXoRQ0bndRxl5yjb1BAX8VK55IBDSBQryH9Q
 S24EK3Jpyus5uBlV7iiu3DB35irpWJOEAMaCNbkQ8JJAx2GtDcYp_kzOqEfAT3YpleAUBObcc7kn
 SyMOW0Nvnv3JdmrPyZh4KqSYWI52WcqTY2mN_9W28Giub0PSnN3JUKzG6lwgZjQMbD4ZLeVWLCZn
 s3W.Ia.N95IwfBn6nhQRgcfEohScU__hOLTJjhg5DI81z12czqTkJKmtGbSsnJXmW7GD3XoMtwMw
 XVrkVkubRXqxdLSmLLQCTmpgEvMivyWUwadGF3AiXbBvZN1eVFV7zII51ffDwG.jQBxKuvRKzAGR
 M.HA.ikJG.SQvQ30GnB_qStTN38HylUBzlv1aHoFriecsTlE9e3ifzQApmsTQtVy220jmMm4MMoL
 cJvcpigNSI083Lv2hjuDThf.aGCfAH9lvwilIDvjByiN3z4aj9mhfwuSuSMRxkLbAnIwSxflMgq_
 .J6bRtl54WA3CavxOQ2i09XcS8FVaxF0ruQfz1j3RprMdik52oOO_VyrVCU2dh6VHHux6lYbMpcL
 jfmvlXMukWDVyY0oeWUrJa972HTA.vPvLUW1hR5P39dKvOLAbHIPyFtlb3Rcsam_57Incaewcr0V
 Sra7kRqmGHaDKJeYx6x7AgacdJNRQRD.aPMGBIphdWNxYiQKW4Croc0rsn4sU3s8rlrLnoXCCag.
 hu..xyQLO0nywpGmLie0_L4bkdjeH40yVAmsjfJKA50BjPT_Ien9gw3s1KNcOFzYQu8OLOyftpak
 dx2brVfbf9ULnBK6UV_rbSemR4OmIwFBE4JCEKs7mxXNL4272ZO6sqWUGZjrmte6U2K4YeJSPUaR
 dwcXqjD740LgA13ZTptjyTrFN4s0QurI26pUe3u9VjbgSRc4vd6t2W_jXbEAxQCE7UydYYc7Ap1V
 TYHfaYIiQekePfEMaYPjvxPTLu4B2p7NCJD2VLpMkeZ3zD3VyKVWYVRXM.wAnB6n58ngBJQGffAZ
 6p4VT.Xy0KJWnlMQy3ZPd30H3.Q_8O4CuN0_1WuPYGGhx1aMOROtfUJhO8MdmsGJbs5v40bsuSqH
 GSG9qn4IxVxLjWZQyV0cBUe9Ld3XPM.810b4WsK92dF6E_XJ7x_vpRuy79pz4lILWrUgNZ_OU0tK
 l8H_XdEfiKyXsgvXeScoMgObhrTl7PDupqNXCKEMagd7wT4KRBx7gYWUE5fQQu_0jY8WQbesd5yl
 6435hlRD6OQVmh0RzEIeN3ajVroNCB5hcxaeO8WmJ._SNVyXilgt44q1kZTszsFO.FhclrkUG2.l
 yYVo0iofH7uFK2nT_kgpPBudZTlt_HuxvFG1edqnn9JpKNL0dvbMkFG1K7F3yRz5lwo94YZVs.65
 1B2h1MDDmq5n3S6QG72Tm4X_om31rLSmqwZApoZWXhdzh00r0.Jtv8shhHtsJxY1VbexLadyXfq4
 MsvtAFCoShrRnfTSzoi6_Si2O.aq25e2Y3mXxEWSholYWC1k4ekOMR4HudjnZZjELFxTunkJopzd
 WAekzhCek0G8r3VRUQ4RU.B0_ZivGJ3GxP7m6az1q3lRzLBFEaloUbwkGcM0seiAW5M1XU5B28DM
 i0JBdQDuRZA.XZLt0K42okBWE793ZLvoowoXqzJNCNNlZX7oGJ4auLnn9tiOw1THIm.JFD1dXSuT
 nJqYRyDiAA1G0jt9ho45VXhOHEazUcnym8RE7IJntsre_uMkRgGjl52THDkx9M1ukDpyhogYp68e
 SsURfue0og5Izm8lM0z9cn3AI1X0_3rB07GztXtwxA9.PqowoRHveyDyf87L4p2wYa0dLQgsUMMB
 nWAfRIcQH5q2e4e4Z6u2RayLk7_wEyt23oW7iJJtvM2N6Ud74GhOZU9jqixeNDNDWWBfXMpMEYcl
 IYiLdbAfYfodItH15ciJXUA--
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 90a6bc51-f164-4d44-bae4-d5f2c5da24f7
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.gq1.yahoo.com with HTTP; Wed, 4 Sep 2024 20:28:08 +0000
Received: by hermes--production-gq1-5d95dc458-c8wt4 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 2f35ee425e5918734f7690c9cc8e23d9; 
 Wed, 04 Sep 2024 20:28:02 +0000 (UTC)
Message-ID: <93952b9f-2e40-42fc-9a61-749b9c8ee306@schaufler-ca.com>
Date: Wed, 4 Sep 2024 13:28:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Paul Moore <paul@paul-moore.com>
References: <20240830003411.16818-2-casey@schaufler-ca.com>
 <0a6ba6a6dbd423b56801b84b01fa8c41@paul-moore.com>
 <b444ffb9-3ea3-4ef4-b53c-954ea66f7037@schaufler-ca.com>
 <CAHC9VhQ8QDAGc9BsxvPMi6=okwj+euLC+QXL1sgMsr8eHOcx2w@mail.gmail.com>
Content-Language: en-US
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <CAHC9VhQ8QDAGc9BsxvPMi6=okwj+euLC+QXL1sgMsr8eHOcx2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.22645
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
Received-SPF: none client-ip=98.137.64.90; envelope-from=casey@schaufler-ca.com;
 helo=sonic305-27.consmr.mail.gq1.yahoo.com
Subject: Re: [apparmor] [PATCH v2 1/13] LSM: Add the lsmblob data structure.
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
Cc: keescook@chromium.org, penguin-kernel@i-love.sakura.ne.jp,
 stephen.smalley.work@gmail.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, selinux@vger.kernel.org,
 linux-security-module@vger.kernel.org, mic@digikod.net, bpf@vger.kernel.org,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 9/4/2024 1:00 PM, Paul Moore wrote:
> On Tue, Sep 3, 2024 at 8:53 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> On 9/3/2024 5:18 PM, Paul Moore wrote:
>>> On Aug 29, 2024 Casey Schaufler <casey@schaufler-ca.com> wrote:
> ..
>
>>>> +/*
>>>> + * Data exported by the security modules
>>>> + */
>>>> +struct lsmblob {
>>>> +    struct lsmblob_selinux selinux;
>>>> +    struct lsmblob_smack smack;
>>>> +    struct lsmblob_apparmor apparmor;
>>>> +    struct lsmblob_bpf bpf;
>>>> +    struct lsmblob_scaffold scaffold;
>>>> +};
>>> Warning, top shelf bikeshedding follows ...
>> Not unexpected. :)
>>
>>> I believe that historically when we've talked about the "LSM blob" we've
>>> usually been referring to the opaque buffers used to store LSM state that
>>> we attach to a number of kernel structs using the `void *security` field.
>>>
>>> At least that is what I think of when I read "struct lsmblob", and I'd
>>> like to get ahead of the potential confusion while we still can.
>>>
>>> Casey, I'm sure you're priority is simply getting this merged and you
>>> likely care very little about the name (as long as it isn't too horrible),
>> I would reject lsmlatefordinner out of hand.
> Fair enough :)
>
>>> but what about "lsm_ref"?  Other ideas are most definitely welcome.
>> I'm not a fan of the underscore, and ref seems to imply memory management.
>> How about "struct lsmsecid", which is a nod to the past "u32 secid"?
>> Or, "struct lsmdata", "struct lsmid", "struct lsmattr".
>> I could live with "struct lsmref", I suppose, although it pulls me toward
>> "struct lsmreference", which is a bit long.
> For what it's worth, I do agree that "ref" is annoyingly similar to a
> reference counter, I don't love it here, but I'm having a hard time
> coming up with something appropriate.
>
> I also tend to like the underscore, at least in the struct name, as it
> matches well with the "lsm_ctx" struct we have as part of the UAPI.
> When we use the struct name in function names, feel free to drop the
> underscore, for example: "lsm_foo" -> "security_get_lsmfoo()".
>
> My first thought was for something like "lsmid" (ignoring the
> underscore debate), but we already have the LSM_ID_XXX defines which
> are something entirely different and I felt like we would be trading
> one source of confusion for another.  There is a similar problem with
> the LSM_ATTR_XXX defines.
>
> We also already have a "lsm_ctx" struct which sort of rules out
> "lsmctx" for what are hopefully obvious reasons.
>
> I'd also like to avoid anything involving "secid" or "secctx" simply
> because the whole point of this struct is to move past the idea of a
> single integer or string representing all of the LSM properties for an
> entity.
>
> I can understand "lsm_data", but that is more ambiguous than I would like.
>
> What about "lsm_prop" or "lsm_cred"?

If we ever do the same sort of thing for the existing blobs we're
going to need to have lsm_cred for the cred blob, so I shan't use
it here. I can live with lsm_prop, which shouldn't confuse too many
developers. We can start saying "property" in place of secid, which
would be a good thing.



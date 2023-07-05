Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4308B748501
	for <lists+apparmor@lfdr.de>; Wed,  5 Jul 2023 15:31:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qH2b8-0005Ha-Jc; Wed, 05 Jul 2023 13:31:10 +0000
Received: from mout.web.de ([212.227.17.11])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <Markus.Elfring@web.de>) id 1qH2b7-0005HR-7P
 for apparmor@lists.ubuntu.com; Wed, 05 Jul 2023 13:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688563852; x=1689168652; i=markus.elfring@web.de;
 bh=MziP2Be8BXAKxWI5q4yqEdKLvSF1Natsy5Ae96oLbiY=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=Yurnt1LUUeonCi4LOJr93x/uuki5Kz6PWhRbQyQhDeppbIzDD0+FqwnIlVfCClrLyb8oSQy
 DHXIVdF9xDI3DlVvdFITy0X7g2BVHw5T5zLhbM49NYfcirJoRXlrIx66BILipBydUBrR8Ltrk
 BVRdU9gOIxheYdSeDrZhHAsz1aHvDdqK1qWEuUqMIV1FHq5w/zjhxmzr49ErMlZepmTVoB4kR
 JZfrKPPMn8QYgzI0ZS5+0yxtnzVM7D003XYe6d+fBmpVT5Q1imtG8SPvU1MkXJHU/CsGLDGVU
 pLZGgRBpLXT/8yTMvvLYdK4g2RNFbRw2cQEYPe7WgPE9O7dxaa8A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Melf5-1pgbub1C9l-00aNfX; Wed, 05
 Jul 2023 15:30:52 +0200
Message-ID: <6fa65acb-9750-3ea0-25a0-7e40d57c4613@web.de>
Date: Wed, 5 Jul 2023 15:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Minjie Du <duminjie@vivo.com>, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org,
 James Morris <jmorris@namei.org>, John Johansen
 <john.johansen@canonical.com>, Nick Terrell <terrelln@fb.com>,
 Paul Moore <paul@paul-moore.com>, "Serge E. Hallyn" <serge@hallyn.com>
References: <20230704085653.6443-1-duminjie@vivo.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230704085653.6443-1-duminjie@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8cH6GWzJTHyE0qModiviboRgQT2ubd36z0Zums58o2xsReWXwnP
 cS0drvGQro1spQs0SLV7q26/eWggNoRpAHKUiPPFsfXl9c/+J6Sb6+Aq9mXovSI73oaS499
 wsfjQWMTBjogovJKyqF+kkk1jPbOpWPXoXpFEYQjLdpO3FpLvuZf5T3uDggk+35m1ZNaKx/
 8DrevANv6BaORbAruQ6Sw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cYFXSa8egCc=;hKZomew+m7o/5G/+Qs966AbGO09
 XhVm9gnHRguN9h+fyzv/dfeZHgsqyqvyaGnI2BaGM06fEeiUT597HQg2lOuWWK8hhvVy+7c+e
 KNew35Em9tGTfTXep7CcN4NqGfZNlR0Tq1f/uASmWIJbMOcmyjfFu1TTFGoGa+nqcbApMZeT5
 bhJcznI9lH4dG0C5TEh2vkMBRZWPKwEpXOAQLtev+ElpSsxKu0HCodb/BLPZn274hJe4rWiVE
 w5q9g0+aVF94JJzqWXnQaRcp/lNutrEYBj6XrwZwDG2t1tXT98xEo1Nfo4uUx02xPmiHLmmhG
 NeyNH+V7OwKChOIyejRFQeBfsvjUPbdU3a3GQLBH2YqQgdrYGs9bFGplY8LywgXBv9MeDU6im
 5YB4i6AlxL+PlQGdkq+ugu1RYNhof8bs61PR3e6y/0yMJq1VnPAUW/i0HaBmbr9Z2nyUxwGNM
 WpkhOwtgtWARMgRW5bwO9t+kMUUcM7kk1610bSqNtU3s7Oef4yAhnZppEbUn4FAOFQOfMr+33
 Ol9OiGFDNZ7ySZj2BL9GuK9loUyXVkwdjp3AL2jGoFJSNIEXGtrGtQFOuTUsUknRwRydUhx/S
 N/FmyQ34U296ShvSicpxwLfdqHJQHXxClTEXteSQPWY30iEAUbu1uRiC+sivAUq1cczvJzifI
 zEkVmqZzITdsogVoJ3xrcK4w9NpxXr1mge0kcHdzsjongNw/lmHjDzBwjdoBUrvEvwaDt3sbW
 P0FA8u2vP/Q3o+dwO4RMDKwuiwaAIk4GWl7ad4kz80JwHKZDvUWVjSpdvep8iJXwKdSB+eEuK
 88HcPv8Bo/pWE10Xl9E1nV6p1VSMPMWmZ564Roh08AcNgfkhdUzMXDFWVc/bleQbz6CRdTrRp
 8KJW3fGjv5YNU3mEZ1LH7lG2ik+V068p7sIQqTXax/z130ilqWKMvmPCby0GGi0+RxU9TowvW
 +XnxcA==
Subject: Re: [apparmor] [PATCH] security: remove duplicate logical judgments
	in return
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
Cc: opensource.kernel@vivo.com, LKML <linux-kernel@vger.kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Would a subject like =E2=80=9C[PATCH v2] apparmor: Simplify a return state=
ment in unpack_perm()=E2=80=9D
be more appropriate?


> Fix: delate duplicate logical judgments:
> aa_unpack_u32(e, &perm->allow, NULL);

Would the following wording be a bit nicer?


A conjunction was used with two identical subexpressions.
Thus reduce such an expression to a required computation
in this function implementation.


> Please check this. Thank you!

Such information does usually not belong to a change description.

Regards,
Markus


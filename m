Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC3A718D41
	for <lists+apparmor@lfdr.de>; Wed, 31 May 2023 23:36:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q4TUh-0001HR-Hw; Wed, 31 May 2023 21:36:35 +0000
Received: from sonic309-27.consmr.mail.ne1.yahoo.com ([66.163.184.153])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <casey@schaufler-ca.com>) id 1q4TUf-0001HG-AD
 for apparmor@lists.ubuntu.com; Wed, 31 May 2023 21:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1685568991; bh=68KwFwrXmYDr7xS3tClDq9Re31VX8jh6WpfE9mcC/8k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=HBb3DixtPcrR55a0PzrewhxNz9hzphzj2jcEVByOIklxTqIPCuT8ixON51wpPliDlzZta1AxFKRs1prlnZLKEHw2pOlfZ6rnMzaVJsQelqqq+K0V0mUcRW0ttbrWCaQHbwfjJjY7LFuU43G6woJxekzuu3u98Zlx1iw7CvUDJLkOpEsW6Mha2dQI3y3X/ryyR9euCvptdZ5tFnfEfoIxWqzmasrP8TEMa1QNJIeOI5jKshZOiFcOW1CA4mwGsMBqovb2LHTopdqlRF+/HJq1beyxjB/qByHzfSX/hippcukeFs34J2dp+q5NArcDCfcx4O8i3dc5YnaMazZhi1z8aw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1685568991; bh=IwqWV8frh6atmU0UUhCsaIPWIGhuXj4rAUiC8EGsyWO=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=M5CyPG1fUAb5QaSZAJFePpJcO/VRxbQ4jYkrmqdEU343cWzo/A62QEjmG/ARDjHAumWffi2iLVVldmrgXjOAljhuX8cJEaqxbMqjWtO9Y8PoEIkmf38WdArD8C9B77d9Zu4RPoPYaZSILzVSMYzU2dCPXG2+m3rhurjIRWcp6MXrs7I9HqfWokgHMM1aC8Ar+GJdAOoXaylrnwZbf0F+LEPZ2T8usIUDurjoF/8SHZnEjsrIgxVejSF40oqKFnunilLDK99TO4zs8LlxGlBtF2+ZCJ9vA09cjdrVSFeWm6S04ifCMXhT/2xO64JlUnCh0zsTYE/62+uLFsICiTqLYw==
X-YMail-OSG: cVUoH.sVM1lJ6gvny0eX2qRVqtIQhPiljwfwLwelWM0bcwP5_z0SyYJREk_S8Nj
 rTDgWiYjDTq7iY6y_HkAKR5xy5wLxynA5L7SI0jyc3zjtIcl.7RJPycduBtUtdKt5pjuTrGSANPx
 QPP4ZC1X6cwU4JqvRvq3FRSRWxFeDQeuqtN4BbucM._2xcPeBEHLiPn.xwxqNVDu17e0yan3Omsl
 DrCuVZd3T3RHA_N8pPMYFJOaSY_bkRVi1xN_Lw6kVq1MkTd_GTWnK_IET63Su1XkgXE4gn.uATbW
 8mrWtu.F1IKzOOOxHrr0tc3_V9eKGAafljoAFq2sWqnPuYxSiqX_0KsWiocc9uj9x7U_u0Pb2y0F
 OUFhQKSue3ly4gYelBoLecORnZPZkghNiS2HnCj9H_B.tBYMPXk3hQxrcGzfgC2wYCfFFaSRJIhj
 dvEOkVN8o7ZEcR9Uf7DRprwIKYEmdvXQBNwelvt_fC2JbJ02VErB3bLII35N1HImBTBEAteeHPIr
 XvtjmpKtv24CXCQTvMM5ohl7LMJWw7SqBOajnuOFEe0JR6cVUlSrA4v9kIzh9gthabKKYQQbUgyV
 yEOlUtjPuyzQoA1.gOaiBvT08Y0X8GHAwY9Y.iLLKTuPy_KoYlshMrtsJTZfhLEFl_HmNc0wSU6j
 Z1ecmZndkhmzGnLINaf4BGcgnXa4Ooo9YCsIfApcfXdxdOq6aYwQO7afMf5S4pRLg7Sk.6jUFOl.
 ObG6WQd9e9yk56YXxcWCyeF0wA.EFT3BA5z6aulbLgF9_AX_0J9H8sr7sLNEpBp2dLtTVrLaF2w0
 chbZr1muPtEfZ_RgTJzlLd67QtwH5lGYwGQ4RW5xSdbTfkOrQHEasXLah8vEANh83X35ep4gBZoM
 6SL4aHSL5tVXW2efBOcY3Hs0egs6ihTevl2UsQcYZWbXo26guN8rnRHbiF50ZwG9sZjwNB.GiiZ6
 LDxcuVLRzp923tWWXYTp_.WMKYGqTp1x_M.H5EJOPM3eF.xrv4UFDFs.xWM6Tkc7PdK1gUTBH0FY
 JYEbRbOFkIivXV_sJk8R5ZPmpm7vvns6uONhrpDKS_OiufTGLOj3uCdZoiHBW6l7lyHwmqt7Lot4
 dlqCOzvhnTIF.CdkfVMZyHgZNuCOoy20rjzdwUaHzi4SNP_qEj3aCCcNmVnpbowKlDMmR2R7AzSV
 dbS9.PY2slrelUyhzvj9WwTvhDMnhMyx4pbnuRXrnCqg2sLcL75Ed.DmxUnXQfORneQRi8cuIfzk
 xIn2FlH3jnaVSjYdckbyqAAVWInNyd4vUAAFTBEXuGPaVcdxT5UsblQi3PmiU5dtaziuRbr.z8qx
 mpKS.SP5jmsYAcvDi5OY__lhHK.DL_1Xu1kZcWv1AkZ8qih47SJgkQt99waWGEFYdbpU9xFIxjrE
 Lfubv6b0.3tJ1slP6VkLjA8I4R9Puzk5IgvQeE4AS6zIeUDsQsix.jk.XsIWah2gJs4DbGJ2iDPl
 NzPCIU9uVr4yM7oFKl0U.7hTPWHJJwJTNFAbeJvWhzjF8fn1o2BeQmFCVbkqfS9x6b59vc5KCCZF
 YSmtm0GavDq1wXauAheyXUtR9DrCbnbmAX6FjW4QOREwecaJOmz5n8zAZjrR9MwBq4gvAXLGGq.G
 ZEBb18pAwmXSYx716w6rIKNXghwL1GgUsCX14Ppg8vtj4WVemItXr0ue7U309fvqOGUGE169DkcQ
 SbOb8NvbWwmqZvv0g98uTcjPJ4n.7ghv2z2YEG1h29xq4owFH9s1R1UZ20S9oLe7lhQi.Ug3Lilg
 R5ypGAd46XUs1tiqYSchk91yqs2k12tO6rdqY0shAHnu8G0aZYMqhOwhGHETQ5UhWhPjm_cQdWDG
 mOIcHFl58Osoc4LgaKGcolidHrSz375QXFbwyeftehgjLuQuX_N5jZxCzGpiBBltWSRFt5JZiI.p
 6czYhrqwVIHpeSEfVw_rkHk4ya.irQzMzyPHIc3tHwfSkUenJ5ILjNHRoWqwvtAtDyZF0q9hRizG
 Y2H0q6dgnDlQYKu2pI77qdh8FoxJlS.qwEEnEyWQXAtCd9GBfjV6IMMI6yqqlAJWyPQNag.Ilq0Q
 fKeAfW3UBxsgeixIpcx1GF2zOTEJuNdaEMX.C4FF7GeirP_rf7hvHK0OjYpCFzAQqerVrNNQoKAZ
 RcuwY36E.APYBcn.0tkckelb8XzB054MSBYAmnvCqTsfsruZYZ1Ies20RMASvRyFfgjGZORQEhFA
 q0MP6G48xRbnGvArvLwo.X2LzsGmDOUktfBOo2M7cSp4vm0vEO5LRvGR_jF0Mrkmpov8XonACcaK
 5_I7hQoqdXXrnQA--
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 81acc560-f540-4bc4-acd9-a27d87988b0a
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Wed, 31 May 2023 21:36:31 +0000
Received: by hermes--production-ne1-574d4b7954-wzfzc (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID a5338ea7f44e42188ddd5cfdf4c4de45; 
 Wed, 31 May 2023 21:36:29 +0000 (UTC)
Message-ID: <0a2b8372-11f6-56a3-7d8e-41e93d1bf691@schaufler-ca.com>
Date: Wed, 31 May 2023 14:36:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Paul Moore <paul@paul-moore.com>
References: <20230531110506.142951-1-gongruiqi@huaweicloud.com>
 <fe6a0f1e-6378-a4f2-f995-46799ed5248e@schaufler-ca.com>
 <CAHC9VhQHUKXLejiMvETYE_PJz3cyHPF5z+T1ifUCD9ezMztcSQ@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <CAHC9VhQHUKXLejiMvETYE_PJz3cyHPF5z+T1ifUCD9ezMztcSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21495
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
Subject: Re: [apparmor] [PATCH] LSM: Infrastructure management of the sock
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
Cc: Kees Cook <keescook@chromium.org>, Xiu Jianfeng <xiujianfeng@huawei.com>,
 selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>, apparmor@lists.ubuntu.com,
 "GONG, Ruiqi" <gongruiqi@huaweicloud.com>, James Morris <jmorris@namei.org>,
 linux-security-module@vger.kernel.org, Wang Weiyang <wangweiyang2@huawei.com>,
 gongruiqi1@huawei.com, Eric Paris <eparis@parisplace.org>,
 "Serge E . Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 5/31/2023 2:10 PM, Paul Moore wrote:
> On Wed, May 31, 2023 at 10:00 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>> On 5/31/2023 4:05 AM, GONG, Ruiqi wrote:
>>> As the security infrastructure has taken over the management of multiple
>>> *_security blobs that are accessed by multiple security modules, and
>>> sk->sk_security shares the same situation, move its management out of
>>> individual security modules and into the security infrastructure as
>>> well. The infrastructure does the memory allocation, and each relavant
>>> module uses its own share.
>> Do you have a reason to make this change? The LSM infrastructure
>> manages other security blobs to enable multiple concurrently active
>> LSMs to use the blob. If only one LSM on a system can use the
>> socket blob there's no reason to move the management.
> I think an argument could be made for consistent handling of security
> blobs, but with the LSM stacking work in development the argument for
> merging this patch needs to be a lot stronger than just "consistency".

I'm betting that someone has an out-of-tree LSM that uses a socket blob,
and that the intended use case includes stacking with one of the "major"
LSMs. I would encourage that someone to propose that LSM for upstream.



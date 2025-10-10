Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4CABCE96E
	for <lists+apparmor@lfdr.de>; Fri, 10 Oct 2025 23:14:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v7KR5-0000j3-1g; Fri, 10 Oct 2025 21:13:59 +0000
Received: from sonic316-27.consmr.mail.ne1.yahoo.com ([66.163.187.153])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <casey@schaufler-ca.com>)
 id 1v7KR2-0000iv-N1
 for apparmor@lists.ubuntu.com; Fri, 10 Oct 2025 21:13:56 +0000
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1760130835; bh=X8Np/pI77hNRJiN/WJ6HzJuDXaUcRQP55Q69zQcdUTP=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=fv7Jh3xJNvS8f/SvA8Zk0lJqDeg3hvcft7EhrMqu6TtIP5MegRMQXGkth7VnBtjIK9y0zp4SJ2EkCZOxQza8HV/2eoQYiVwJVhb+XwUPygY8aUm2Dz9hxwkp7nIVXKnY1Hj64ApmEEIXTvFkr+eW+H5BcN/Wl7kJczDC7pdW256EGoyuQ4OABXtDheRq7Pt+jU38oi4Q2p3lF4BygdzVxmfb0a9WKKG36118Yx4N6s8tY1ZeZc7xCMVhOxdi1ibjivIv16MjZkruK4t5zj3k4DGYiTRxH6tiiBRGb1QKqDnfyETKZ27je1rhhiL2edo59Pw3F06Xjw8vPU/14STFqg==
X-YMail-OSG: hj_K0qsVM1l92HVyJBxvE.yOYHHP8HsCY5icmN3yiVGbE01Wrt_SWYs17rA.P4q
 UgWYe2nMn_ENZ.4zeSchJVCw1BK6JfupH2g5qHa2CGLKfwOSYtyt5a3iAY8J.dLW6jjMw7mKWcId
 HLNoJvkBcleet8dYBsAvP1Zq2AvdNTuqmBhFeE2Z.fm5740wKcyq8x1RUTAurdJBZwW7dCY2aMLc
 mL_5_NTgf5i0qjieiEV91kOYM19zVRQCPGH7kMhVS7lsrhQtU_a3cg.mrkAvFtyNyMV10khHxphj
 F0mKITRqSg4DF168D_jZ6VXi5nAvJOinbWa4ZGjLxh49DPBtmwFZHtLJWA57q8EVRNWA9KqljyHt
 uELu3PzG1Y_p5FdRpq7P_hjKAfweTGTYuLtnq2If.2qQNY7gnmFL6I01kT0rkj5cLCCqhVkSuAVD
 hM6249wYb6.Q.j471twZ1.vfCzLTb.G0r1EJXH6fgekbHyYyN0b5ybILAuGvvQYRWsoaqdMYQSL1
 6Yzd7cdk0oGc4OveyFRGX6lh1OuvcB7fYbIKh8CZNGRYtaEhyvrE1eK5NJGF8BxyTgezz1Pij4rE
 P75X6XFtU1KyQsuJgad74aX5b5CjgHmJ2Z06APr2Y6x83HxZilERseulj8ALvnPs1HxEkq6a0L5O
 HapQUB.IAtiMhUWJbPzhjWLelaoGfrExF0BsbA3Z8WjD24ePLO_hdx6MmF7PoWd655u.V2RPzpOE
 2bkwAkYiJNFS4BF9rERzXU.sa0W7d1ThhJjl2eQSOYArMGNmmw3ThOrQ3aeCIOSQVhY1lcazTB2K
 cDQOqH0jJzaF4WMr8eOWby8ZFH.tZZGrINZsR7AYQBNGgUSxO4XH2cvJfuK0y21rbut4FNxTWM5v
 Qh3ozC7zwwrlj3SJlz24WNFCyF0gG0MLo.jxj8ecl8aDfe0cEWog8RZuSboLiEd7Y4Zx_CIaVCma
 hVao5wLtCrObvajoUNWQSFQVFBLg74I5adQvo53aJkBWbtqo1CaJQy4yhhzBZwaK5B32LNzeL3QX
 UVfoVCECcasaKE64iHuQaiJqUo2n3mJz3FTeYv7CggS0b1nbgGfRVzUIFN9St98_WxUMFBk_J5Q3
 pBTFGp05JD8K_x1qSdoO_cgIEttjgVo1ipB7GIB3lU2qgbNFOY43RmI99urHY2s.UhACjHWoWMZW
 F9Xsfyh3DFcSs6qmqLVHH1p.kqn44_E0mXVvPGhmERLwuh2mPl3q.NhgqhNAa8qqgQmW7WXhjxkk
 C7vL8Z3GIiun69185akGsa6uH7UpWqvvTUfa8ekQKtP4KxuqrXtC7pGJHS1bnyMfwofgevlZuOS.
 6JNpLDqK_1u0ZVkWfYy4t03fQ6nFQiIf_bnjgcv51lZe6aXCU1gp5oaT86_AZLf.itv4JDPUUOtd
 AiDScIC.thYeAVVle1sc9gJclQUhy.I9nGiA_9kieHPo6yW0V0lWrekSRzo35QC1iPJ0Cr3625np
 5B8HOXWEUp1Cl18EWmM2txQ8iK3h7IEOJrvL6mNvtB4qjHshNnW3PvqorCCjxrbMG7HVztBkax1i
 TzBoBertrMliR8ti_eGrE5ALcWFjgNmoaZh3T6ie5O73ldmlTv41IhlNJVY2oMxTH0lPdLt0rGjH
 hnure8H8tb..33FUrB1pKK3XOuBYtp4hBPjZcFuyRNuCbK9LCPG0LjhF_AJKiFAb0wxxHYF6OIXb
 C2i3iDTGOQNwljpoDII3T45TRZMUIqnA8DLZbLJ39dleONdSQoHpo8DQy7JVfzyn_0Do0GLrZNGC
 pJS352W.OBUFqJAsAQznyGUTH43miTUMAw81sEFjvITQmqWEPj5SAHkFp_wdNBas0oBQTSFszIFN
 YAY8kSSNQbiScafdRPnDk6FKaFzytLegpFvxfaO22gYg_aeypUWhZqdIzuq9_6h9U9fLLQEH2JUu
 wkTRkmdVLWm_FPdxUYfX85yxJGpJ8gNdgAamR.roTgso3k2DQPUF7i7W9kjZZg5p8PCvdwVIRRfE
 i1a7vFHtmH6jndvt199NFU6X01WpUwbYxm6XfsvyeLDWhJvSlMQeTvNSE5lcCVDFFCjtuMmiQm8z
 _P6952lyxHJWZsLjLxaO4zpNhBqLXQGHmKO2j2wGH9ABpUY7FXih6vFZ87TWF.kLViiOpfXJDpE_
 udg1SkJ1lPmTBMx4ZDiAC7BK0cevHLKHJFt6R2FgV_B1FjOzcD.w0bI1SImML8SLS9_5zF55Wc7U
 cV7AmPOYTJcsp5dLQzsoLF7uhtPLZ05ag7x_JEIZ.r5Tg3DZi0WfQrHGkiokOJS1oegdfKrFHPsH
 cRoweaY7N3S8WY1uzOHlwPa0d93U-
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: edcc4e0f-3264-44a5-b08e-f1aa002d6f1b
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.ne1.yahoo.com with HTTP; Fri, 10 Oct 2025 21:13:55 +0000
Received: by hermes--production-gq1-66b66ffd5-xph5s (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 698bef460da1b112e1d4caa5f84dfae0; 
 Fri, 10 Oct 2025 21:13:52 +0000 (UTC)
Message-ID: <950745ad-b818-475e-a8c9-fe0a9e82c609@schaufler-ca.com>
Date: Fri, 10 Oct 2025 14:13:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Song Liu <song@kernel.org>, =?UTF-8?Q?Maxime_B=C3=A9lair?=
 <maxime.belair@canonical.com>
References: <20251010132610.12001-1-maxime.belair@canonical.com>
 <20251010132610.12001-2-maxime.belair@canonical.com>
 <CAHzjS_uBq8xGCSmHC_kBWi0j8DCdwsy4XtfkH2iH6NygCcChNw@mail.gmail.com>
Content-Language: en-US
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <CAHzjS_uBq8xGCSmHC_kBWi0j8DCdwsy4XtfkH2iH6NygCcChNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.24562
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
Received-SPF: none client-ip=66.163.187.153;
 envelope-from=casey@schaufler-ca.com;
 helo=sonic316-27.consmr.mail.ne1.yahoo.com
Subject: Re: [apparmor] [PATCH v6 1/5] Wire up lsm_config_self_policy and
 lsm_config_system_policy syscalls
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
Cc: paul@paul-moore.com, kees@kernel.org, linux-api@vger.kernel.org,
 stephen.smalley.work@gmail.com, rdunlap@infradead.org,
 apparmor@lists.ubuntu.com, jmorris@namei.org, linux-kernel@vger.kernel.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-security-module@vger.kernel.org,
 mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 10/10/2025 11:06 AM, Song Liu wrote:
> On Fri, Oct 10, 2025 at 6:27 AM Maxime Bélair
> <maxime.belair@canonical.com> wrote:
> [...]
>> --- a/security/lsm_syscalls.c
>> +++ b/security/lsm_syscalls.c
>> @@ -118,3 +118,15 @@ SYSCALL_DEFINE3(lsm_list_modules, u64 __user *, ids, u32 __user *, size,
>>
>>         return lsm_active_cnt;
>>  }
>> +
>> +SYSCALL_DEFINE6(lsm_config_self_policy, u32, lsm_id, u32, op, void __user *,
>> +               buf, u32 __user, size, u32, common_flags, u32, flags)
>> +{
>> +       return 0;
>> +}
>> +
>> +SYSCALL_DEFINE6(lsm_config_system_policy, u32, lsm_id, u32, op, void __user *,
>> +               buf, u32 __user, size, u32, common_flags, u32, flags)
>> +{
>> +       return 0;
>> +}
> These two APIs look the same. Why not just keep one API and use
> one bit in the flag to differentiate "self" vs. "system"?

I think that's a valid point.

>
> Thanks,
> Song
>


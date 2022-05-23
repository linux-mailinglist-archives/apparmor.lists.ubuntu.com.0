Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C67653099B
	for <lists+apparmor@lfdr.de>; Mon, 23 May 2022 08:42:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nt1lu-0000u0-FH; Mon, 23 May 2022 06:42:30 +0000
Received: from mail-4324.protonmail.ch ([185.70.43.24])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <werner_kienzler@protonmail.com>) id 1nt1ls-0000tt-QL
 for apparmor@lists.ubuntu.com; Mon, 23 May 2022 06:42:28 +0000
Date: Mon, 23 May 2022 06:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1653288148; x=1653547348;
 bh=PRVoY/gzUCCqXcT+fOvGX/lGt/gSCebZS97Wv4L0CKk=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=S83LQoX9eOET43cU4lb100SbUwSZIbW06xrPjDp6BUsd6SZ+IRaoB+Emsf+jZTKSy
 YbeDv30UnaigLyRb6qYGVhO+iJDy00fjQwHd3D+ZGZLEEtAt8omUzRtYEa/bv4lMBA
 wGc2lSCxb7gBZZfDDT+31vANME7SxSpoyUDKuCKq1x8LegI6M64nGXrNLRL5y6UvOY
 CKV8sRi/0zN0AAR+cK8uqJm9Pb/ZGVqJ5aL/M022QQYJsiCU7F2x59hSx6V5SkytTD
 u3LHSxSeskEVEZuWULMk3C6NZTjBzSIqesD3KYXHHw01DU6XLe4w+KUxT27Aci1rmK
 hgMhWqi4vyt3w==
To: John Johansen <john.johansen@canonical.com>
From: werner_kienzler <werner_kienzler@protonmail.com>
Message-ID: <e5Y9KWb_GwZTxM2j4gJIZ4LzLUvQgiWxD7ZdkugVhCM20e6GPj7Boh6C1vPtODRwz92VT3YaBiBM8xBc47dZGOlxefYeBoJG_VUHFRO0Tp0=@protonmail.com>
In-Reply-To: <47593cdc-4db1-1975-4a6e-115899095a6e@canonical.com>
References: <acQDNxeIWDb5bYaBDt1z9dL9-E7k3E5rmYznvPuVJWyHl76LFAV-dpuqS5tFv_MykfCIqkIIfsl7uM4bIZxD2cQsAoQUmDCl__PN9h6IRGE=@protonmail.com>
 <c7bc314e-46bb-e463-cb52-a71536083a02@canonical.com>
 <Y4XUwH0mA3r01nKFQcdPXTvsYqgV-H0Tvk-KF3ENwu2iTj1wATzhc-j8QwaoNXKMQqauhKLzKq0TGKjW8jHNiuMYz8VgQODkn9k-HmBlM8U=@protonmail.com>
 <47593cdc-4db1-1975-4a6e-115899095a6e@canonical.com>
Feedback-ID: 20364792:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] Apparmor and Docker - capabilities and network flags
	not working
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
Reply-To: werner_kienzler <werner_kienzler@protonmail.com>
Cc: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hello,

I just sent you the profile to your private E-Mail. I don't want to clutter=
 the Mailing List here and don't send it to the Mailing List.

Werner




Gesendet mittels einer sicheren E-Mail von ProtonMail.
------- Original Message -------
John Johansen <john.johansen@canonical.com> schrieb am Montag, 23. Mai 2022=
 um 5:11 vorm.:


> On 5/22/22 06:43, werner_kienzler wrote:
>
> > Hallo,
> >
> > > is docker using user namespaces, or network namespaces?
> > > Good question - I didn't enable "user namespace isolation" in the doc=
ker daemon (so I don't set "userns-remap" in "/etc/docker/daemon.json"), so=
 I assume I'm using network namespaces? But I don't have deeper knowledge i=
n this topic - should I run some test here or configure something?
>
>
> I need to do some digging on the docker side before I can say what config=
s you need to look at or tests for you to run.
>
> > > What is your kernel version? And do you have any none-upstream patche=
s on it.
> > > I use an up to date kernel of my dirstro, which is 5.17.9. It is 100%=
 vanilla and has no patches applied to it.
>
>
> Can you dump the loaded profile and send it to me? Basically
>
> sudo cat /sys/kernel/security/apparmor/policy/profiles/docker-nginx.*/raw=
_data > /tmp/raw_profile
>
>
> where * is going to match some unique number and send me the raw_profile =
file. This will let me pick out how the parser is compiling the profile whi=
ch will help with figuring out why network deny is not working.


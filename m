Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 3988353035F
	for <lists+apparmor@lfdr.de>; Sun, 22 May 2022 15:43:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nsls5-0007VJ-0m; Sun, 22 May 2022 13:43:49 +0000
Received: from mail-4319.protonmail.ch ([185.70.43.19])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <werner_kienzler@protonmail.com>) id 1nsls3-0007VB-B9
 for apparmor@lists.ubuntu.com; Sun, 22 May 2022 13:43:47 +0000
Date: Sun, 22 May 2022 13:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1653227026; x=1653486226;
 bh=baGzpczJhK/NGKF0+4OOyw8Wp1IrbHxGAhg2IJpeMVY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=q6RESokO/GTXBb/pOvYB7cqY7CKV3xcjcfrl5rGtVcYyXk0tiqWVkC12Sd2KaflKA
 9EU33MxN2OER16PIebspqpYBzfvsgEXkPesL/p5/X9dA5FNE16Ri+CwaVICz7VYNGt
 is7u8A6YvwCZ29075RDQKDH1BiUbDSjyxWBvP7eRwUUiMb1O6W+JNpwV88ZhB6IToe
 nOy8hS3MJiCnUKORHmHbZNtdlOJYBUmH9YBgXdDI1wBBaZXDZR/llgiAhU9w9mp3x3
 7pXIM8GyStSdDgNcZ11rBdsTIhLE1dikpd0sSQYBBUnMon6ooIm2DHk2Fcri7+V4Q4
 G/a7RF3tASxQQ==
To: John Johansen <john.johansen@canonical.com>
From: werner_kienzler <werner_kienzler@protonmail.com>
Message-ID: <Y4XUwH0mA3r01nKFQcdPXTvsYqgV-H0Tvk-KF3ENwu2iTj1wATzhc-j8QwaoNXKMQqauhKLzKq0TGKjW8jHNiuMYz8VgQODkn9k-HmBlM8U=@protonmail.com>
In-Reply-To: <c7bc314e-46bb-e463-cb52-a71536083a02@canonical.com>
References: <acQDNxeIWDb5bYaBDt1z9dL9-E7k3E5rmYznvPuVJWyHl76LFAV-dpuqS5tFv_MykfCIqkIIfsl7uM4bIZxD2cQsAoQUmDCl__PN9h6IRGE=@protonmail.com>
 <c7bc314e-46bb-e463-cb52-a71536083a02@canonical.com>
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

Hallo,

> is docker using user namespaces, or network namespaces?
Good question - I didn't enable "user namespace isolation" in the docker da=
emon (so I don't set "userns-remap" in "/etc/docker/daemon.json"), so I ass=
ume I'm using network namespaces? But I don't have deeper knowledge in this=
 topic - should I run some test here or configure something?


> What is your kernel version? And do you have any none-upstream patches on=
 it.
I use an up to date kernel of my dirstro, which is 5.17.9. It is 100% vanil=
la and has no patches applied to it.

Greetings

Werner



------- Original Message -------
John Johansen <john.johansen@canonical.com> schrieb am Sonntag, 22. Mai 202=
2 um 1:09 nachm.:


> On 5/21/22 14:55, werner_kienzler wrote:
>
> > Hello,
> >
> > I try to use AppArmor in conjunction with docker, as in the example exp=
lained in the docker docs:
> > https://docs.docker.com/engine/security/apparmor/ https://docs.docker.c=
om/engine/security/apparmor/
> >
> > I want to describe my problems with this example. I copied over the exa=
mple policy from this website to
> >
> > /etc/apparmor.d/docker-nginx
> >
> > Then I parsed the profile:
> > $ sudo apparmor_parser -r -W /etc/apparmor.d/docker-nginx
> >
> > and "aa-status" shows, that the profile is loaded.
> > Starting docker like:
> >
> > $ sudo docker run --security-opt "apparmor=3Ddocker-nginx" -p 80:80 -d =
--name apparmor-nginx nginx
> >
> > Works like expected - "aa-status" shows, that the resulting docker proc=
esses are confined and if I do e.g.
> > $ sudo docker container exec -it apparmor-nginx dash
> >
> > I'm ending in a shell (despite "dash" bein explicitly denied in the pro=
file), but Apparmor works as expected, e.g. executing:
> > # touch /boot/testfile
> >
> > in the container is not possible (permission denied).
> >
> > So I tried to restrict the profile further. Since I don't want to bind =
the container to a privileged port (< 1024), I thought I don't need
> >
> > capability net_bind_service,
> >
> > in the Apparmor profile.
> > So I removed the corresponding line in the profile and reloaded the pro=
file. To get sure, that everything goes smooth, I did (after removing the c=
orresponding line):
> >
> > $ sudo aa-teardown
> > $ sudo apparmor_parser -r -W /etc/apparmor.d/docker-nginx
> >
> > Then I stopped and removed the container:
> > $ sudo docker stop apparmor-nginx && sudo docker rm apparmor-nginx
> >
> > and restarted it - but again on port 80 (which I expected not to work, =
since the capability was removed):
> > $ sudo docker run --security-opt "apparmor=3Ddocker-nginx" -p 80:80 -d =
--name apparmor-nginx nginx
> >
> > But it worked. I could access the nginx server on "http://localhost:80 =
http://localhost:80" in my host browser.
> >
> > I tried further to disable net access completely and removed the follow=
ing lines:
> >
> > network inet tcp,
> > network inet udp,
> > network inet icmp,
> >
> > and replaced it with:
> >
> > deny network,
> >
> > Again I reloaded the profiles:
> >
> > $ sudo aa-teardown
> > $ sudo apparmor_parser -r -W /etc/apparmor.d/docker-nginx
> >
> > restarted the container:
> > $ sudo docker stop apparmor-nginx && sudo docker rm apparmor-nginx
> > $ sudo docker run --security-opt "apparmor=3Ddocker-nginx" -p 80:80 -d =
--name apparmor-nginx nginx
> >
> > Which works fine - despite the missing capabilities and the "deny netwo=
rk" directive.
> > Then I started again a session in the container:
> > $ sudo docker container exec -it apparmor-nginx dash
>
>
> is docker using user namespaces, or network namespaces?
>
> > And e.g. a
> > # curl www.google.com http://www.google.com
> >
> > is working - I get the expected output, despite "deny network".
> > So my main concerns are:
> > 1. despite disabling "capability net_bind_service" I can bind to port 8=
0
> > 2. despite "deny network" I can use curl
> >
> > I'm using Arch Linux on the host, with Apparmor 3.0.4 and docker 1.20.1=
0.16.
>
> What is your kernel version? And do you have any none-upstream patches on=
 it.
>
> > Can anybody help me with this problem? From my point of view this shoul=
d not be possible, or can anybody give me an explanation?
> >
> > Thanks
> >
> > Werner


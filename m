Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F57A530295
	for <lists+apparmor@lfdr.de>; Sun, 22 May 2022 13:09:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nsjSw-0002tp-Cj; Sun, 22 May 2022 11:09:42 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1nsjSu-0002tg-5F
 for apparmor@lists.ubuntu.com; Sun, 22 May 2022 11:09:40 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 298A53F5FF; 
 Sun, 22 May 2022 11:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1653217779;
 bh=YIHCR+qgU4DqbiAh/471xBl01j4RkA/+N0TZ8asK3qY=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=g132kBclO0+xOLc9jUCXnkOG3lxokFY3LKrLP/hjlvUronPc1Sbaupxo1ksNIec1b
 ZGzkrs4rWczfvAMIJUmD6jS3LyJYtClr1KlR196aaKEX3se+XRX7iW03xQ7l4RQbqc
 TqM8C8sCwfkjGQTNECSSVb4DTwdzP3wTV+OnQDrgjFgTD8FOZmb+z+rdUZe/jsw/Se
 p8HTbU/aggcR9wvhTVgZktDcB+66SVVG48EctvEROgDaU+/ixuF7GJ52AV6kjuBhux
 D2UDqVgoLNk7SUhn8UDBF1LC/jOffMDVNdBzAQBBr6UvjSvckJptm3v4ZdVsdzHMNp
 7irjaGnDTKJmQ==
Message-ID: <c7bc314e-46bb-e463-cb52-a71536083a02@canonical.com>
Date: Sun, 22 May 2022 04:09:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: werner_kienzler <werner_kienzler@protonmail.com>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
References: <acQDNxeIWDb5bYaBDt1z9dL9-E7k3E5rmYznvPuVJWyHl76LFAV-dpuqS5tFv_MykfCIqkIIfsl7uM4bIZxD2cQsAoQUmDCl__PN9h6IRGE=@protonmail.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <acQDNxeIWDb5bYaBDt1z9dL9-E7k3E5rmYznvPuVJWyHl76LFAV-dpuqS5tFv_MykfCIqkIIfsl7uM4bIZxD2cQsAoQUmDCl__PN9h6IRGE=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 5/21/22 14:55, werner_kienzler wrote:
> Hello,
> 
> I try to use AppArmor in conjunction with docker, as in the example explained in the docker docs:
> https://docs.docker.com/engine/security/apparmor/ <https://docs.docker.com/engine/security/apparmor/>
> 
> I want to describe my problems with this example. I copied over the example policy from this website to
> 
> /etc/apparmor.d/docker-nginx
> 
> Then I parsed the profile:
> $ sudo apparmor_parser -r -W /etc/apparmor.d/docker-nginx
> 
> and "aa-status" shows, that the profile is loaded.
> Starting docker like:
> 
> $ sudo docker run --security-opt "apparmor=docker-nginx" -p 80:80 -d --name apparmor-nginx nginx
> 
> Works like expected - "aa-status" shows, that the resulting docker processes are confined and if I do e.g.
> $ sudo docker container exec -it apparmor-nginx dash
> 
> I'm ending in a shell (despite "dash" bein explicitly denied in the profile), but Apparmor works as expected, e.g. executing:
> # touch /boot/testfile
> 
> in the container is not possible (permission denied).
> 
> So I tried to restrict the profile further. Since I don't want to bind the container to a privileged port (< 1024), I thought I don't need
> 
> capability net_bind_service,
>  
> in the Apparmor profile.
> So I removed the corresponding line in the profile and reloaded the profile. To get sure, that everything goes smooth, I did (after removing the corresponding line):
> 
> $ sudo aa-teardown
> $ sudo apparmor_parser -r -W /etc/apparmor.d/docker-nginx
> 
> Then I stopped and removed the container:
> $ sudo docker stop apparmor-nginx && sudo docker rm apparmor-nginx
> 
> and restarted it - but again on port 80 (which I expected not to work, since the capability was removed):
> $ sudo docker run --security-opt "apparmor=docker-nginx" -p 80:80 -d --name apparmor-nginx nginx
> 
> But it worked. I could access the nginx server on "http://localhost:80 <http://localhost:80>" in my host browser.
> 
> I tried further to disable net access completely and removed the following lines:
> 
> network inet tcp,
> network inet udp,
> network inet icmp,
> 
> and replaced it with:
> 
> deny network,
> 
> Again I reloaded the profiles:
> 
> $ sudo aa-teardown
> $ sudo apparmor_parser -r -W /etc/apparmor.d/docker-nginx
> 
> restarted the container:
> $ sudo docker stop apparmor-nginx && sudo docker rm apparmor-nginx
> $ sudo docker run --security-opt "apparmor=docker-nginx" -p 80:80 -d --name apparmor-nginx nginx
> 
> Which works fine - despite the missing capabilities and the "deny network" directive.
> Then I started again a session in the container:
> $ sudo docker container exec -it apparmor-nginx dash
> 

is docker using user namespaces, or network namespaces? 

> And e.g. a
> # curl www.google.com <http://www.google.com>
> 
> is working - I get the expected output, despite "deny network".
> So my main concerns are:
> 1. despite disabling "capability net_bind_service" I can bind to port 80
> 2. despite "deny network" I can use curl
> 
> I'm using Arch Linux on the host, with Apparmor 3.0.4 and docker 1.20.10.16.
> 
What is your kernel version? And do you have any none-upstream patches on it.

> Can anybody help me with this problem? From my point of view this should not be possible, or can anybody give me an explanation?
> 
> Thanks
> 
> Werner



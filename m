Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D19B775790D
	for <lists+apparmor@lfdr.de>; Tue, 18 Jul 2023 12:12:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qLhge-0006Ea-I8; Tue, 18 Jul 2023 10:12:08 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <alexandre@pujol.io>) id 1qLhgY-0006EG-UM
 for apparmor@lists.ubuntu.com; Tue, 18 Jul 2023 10:12:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58F45FF810;
 Tue, 18 Jul 2023 10:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pujol.io; s=gm1;
 t=1689675122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YYInA1IEwUIHSTI+d+K6qd3a6UdUYkjFdlvXNNRg1pI=;
 b=HuK4ZsnQxdy2oXFYwcVF0HCDQUAnRuJN3PbsHQ3LQKDkFa375qVBXwX3yRr5PUAA7d0Oi3
 TR/33C5MTbIMtH7ANHqQrhJe1pWd6SQbRP8cGL4elwpx9do8kAS+FIgVXE9y2iQ90yQ+9y
 7kNkV3LPVTjocwXT++aH0mW465bgIaNRRLet5c6tBb94YResEmLYqTRcrTfKbKsSXa2JOz
 GBTjM+Hv37p13bn9WxszYIR+eaHHfuFkK0JDvqjvkywyk25Y7fn1Xjvs3oBIeBNd/NFPxD
 EIrxq5yR62IQ4XHeoZJVBm3KUETYogf0gUo8I0ndqi4iJgDDUfXvntYpOh0vJA==
Message-ID: <7c1b20c5-07a4-cc05-27f6-29e910142e3c@pujol.io>
Date: Tue, 18 Jul 2023 11:12:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: John Johansen <john.johansen@canonical.com>, apparmor@lists.ubuntu.com
References: <2668c644-f67d-21aa-6b97-1ed61471fcea@pujol.io>
 <fccec1fb-b421-a532-5ee3-027f94b836fc@canonical.com>
From: Alexandre Pujol <alexandre@pujol.io>
Autocrypt: addr=alexandre@pujol.io; keydata=
 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
In-Reply-To: <fccec1fb-b421-a532-5ee3-027f94b836fc@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alexandre@pujol.io
Subject: Re: [apparmor] apparmor with large profile set
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

Hi,

On 18/07/2023 03:02, Seth Arnold wrote:
 > What exactly do you mean with "the doc"? The wiki has a lot of syntax
 > and semantics around future expansion plans and I've seen dozens, if not
 > hundreds, of questions from people who found it and tried to use it on
 > live systems, without success.

I was doing reference in the wiki in general and in the policy reference 
in particular as I am part of the people that tried stuff from it 
without success ;)

I could work myself on improving it, however I am not myself aware of 
what is already here or planned. I may have a look at the man page next 
time, that could save me some time.


On 18/07/2023 05:01, John Johansen wrote:
> 
> Jul 10 11:51:22 aa-archlinux-gnome gnome-shell[1754]: AT-SPI: Error 
> retrieving accessibility bus address: 
> org.freedesktop.DBus.Error.NoReply: Did not receive a reply. Possible 
> causes include: the remote application did not send a reply, the message 
> bus security policy blocked the reply, the reply timeout expired, or the 
> network connection was broken.
> 
> 
> And org.freedesktop.systemd1 seems to be an issue, while the 
> non-apparmor log has some failures it successfully starts the service as 
> part of the session
> Jul 10 11:52:48 aa-archlinux-gnome dbus-daemon[439]: [session uid=120 
> pid=439] Successfully activated service 'org.freedesktop.systemd1'
> Jul 10
> 
> the apparmor log does not succeed in launching the service, throwing up 
> about 10 more errors around it than the non-apparmor log
> 
> nothing definitive but some avenues to research
> 

The weird thing is that this is on Archlinux, there is no dbus mediation 
in place anyway.


 > this can't change, it would break policy, even if we update all policy
 > in the system there is policy being shipping by too many other projects.
 > For better or worse the apparmor rules are based on shell globbing not
 > RE or eRE. There is a potential for exposing a full RE with special
 > syntax. Something like
 >
 >    ^/foo[1-7]*$
 >

I get that breaking 20 years of profile is not a good thing...
Adding a new syntax seems a good idea, I wonder how this could be used 
in variables.

 >> **no-new-privs**
 >>
 > yeah, another one we need to get upstream. The question has been exactly
 > what we can get upstream before we make it available more broadly. This
 > should be coming within the next couple kernel releases.

Out of curiosity, do you have a kernel somewhere that I could use to 
test it?

 >> **Snap**
 >>
 > Any where it exists today with get replaced with a variable with
 > a name that has the semantic intent. It may get set to unconfined, but
 > it will at least be easier to make changes.

That a nice idea, do you know when this change will be done?


Regards,
Alex


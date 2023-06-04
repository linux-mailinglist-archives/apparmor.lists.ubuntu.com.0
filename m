Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9497213E3
	for <lists+apparmor@lfdr.de>; Sun,  4 Jun 2023 02:33:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q5bfz-0004Y2-9y; Sun, 04 Jun 2023 00:32:55 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1q5bfx-0004Xu-SC
 for apparmor@lists.ubuntu.com; Sun, 04 Jun 2023 00:32:53 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id A17D4412B7; 
 Sun,  4 Jun 2023 00:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1685838773;
 bh=ZMJidt9t9K6DC/4tbMZ0b2G5yVtTw7DQcg8AI1eCQJg=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=RLJjDi/kwuh5E18a2PncYfA/sB6pn8AOCcx4dZOdFFX5Ae87eLMumz99DIcMbDt5N
 nxg/eIYI+0aie6xb71NPejQJrjdehri1TeC4ddEU4YSR8W7rdZC0AIe5kPQAokY07r
 kF8+DWa/R98xc60DHZ30XUrWWKZhhe65ZZXkj+WCfanxIoADdxvd+bkGsuQbBDiYPB
 u/ozGUBbwPXtVxElSIDopMUcPAtymH62wNei6nYICx2T6FX/ikvTK0GVUTU3pDdIcS
 u0szBYMOxzL6xT+e4zaXGCzEo+7aHmigUTPVTnQ6ebGsOODhGVnIS06RHGSn4708vW
 0Trkt7uVhE8Gg==
Message-ID: <a60601c8-86a4-eddb-1998-f84d78022ff2@canonical.com>
Date: Sat, 3 Jun 2023 17:32:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: =?UTF-8?Q?Jonas_Gro=c3=9fe_Sundrup?= <jgs-apparmor@letopolis.de>,
 apparmor <apparmor@lists.ubuntu.com>
References: <bc33f7d50138c93ebbe47739ef7c3afdf0fbcc80.camel@grosse-sundrup.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <bc33f7d50138c93ebbe47739ef7c3afdf0fbcc80.camel@grosse-sundrup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] generally allow mount options
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

On 6/3/23 17:25, Jonas Große Sundrup wrote:
> Hi,
> 
> I'm currently trying to bind down some software that spawns processes
> that will use mount. One instance of this produces the corresponding
> line
> 
> apparmor="DENIED" operation="pivotroot" class="mount" profile="/myapp"
> name="/tmp/" pid=185566 comm="pv-bwrap" srcname="/tmp/oldroot/"
> 
> in dmesg.
> 
> For this specific software, I'm basically using apparmor in a "do what
> you want, but here are some deny-rules for you" fashion, so I'd like to
> know what exactly the command would be to just generally allow this
> class of operation.
> 
> just "mount,", as I have seen it with "signal,", doesn't seem to do the
> trick. Is there a way of allowing this in general without hard-
> specifying every path that exists?
> 

   mount,   # allow all mount operations
   pivot_root,   # allow all pivot roots
   umount,  # allow unmounting

you can then carve out specific rules if you need to with deny rules.



Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 51443D2097C
	for <lists+apparmor@lfdr.de>; Wed, 14 Jan 2026 18:44:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vg4v6-0002sm-Vf; Wed, 14 Jan 2026 17:44:36 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1vg4v4-0002sa-Hl
 for apparmor@lists.ubuntu.com; Wed, 14 Jan 2026 17:44:34 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id A606B140011F
 for <apparmor@lists.ubuntu.com>; Wed, 14 Jan 2026 12:44:33 -0500 (EST)
Received: from phl-imap-14 ([10.202.2.87])
 by phl-compute-02.internal (MEProxy); Wed, 14 Jan 2026 12:44:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zygoon.pl; h=cc
 :content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1768412673; x=1768499073; bh=1qkDw2zuQW
 vkNLKUahP/bsf72ejd6OkidlFc2S1MYgo=; b=EKjwQ62k0IW6vyMFdgKNlib8ZT
 WkE54kpsyBJ4CiWorsYd6g1LrTWScdxzWy/ZEM6HtJ1dXpguP0PajDkA28bvRdlt
 gO5qmt2Aysozvj6kJmHzAl/MXYC+aP7o4EKND9apozvapmFD7JugfkkaaGcAjNxN
 WbX/ut2gZGrgQLXDGooHC+wg71vvgocXVapKcbkon+qEsWKAPXH1PTdwwI1cJPEe
 I7dnaZ4QXal9l86O/9cC4L1SAaE0fDsvrY4OZzkgv1FQsxrft6l0qf7DYjy71AQ2
 +S7P99EgVH/thIMuHS4yc7d5pNpj2Rj/tledoEbYluUneiUJMU1CkMHfpZ+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1768412673; x=1768499073; bh=1qkDw2zuQWvkNLKUahP/bsf72ejd6OkidlF
 c2S1MYgo=; b=nLi0dwPfadNa39hpkxnsBSBRVcwkpRE7459yRaZktHC9ZfIfH7g
 rWO+eYdgoefUj2+W5IG6gZdbspu2wIx96YkQLe0lzgXs2aEhXiDSYysTMyTRZOvO
 TJTItTa5svfVQuIxaFlyU17crduEXZc6VHOTbYZMFvskp183LgcyqFcNQEjFGvJL
 3LogXqSLvqtAXxiJJkn9lGmUpY/wOk72Hn76LtbI2XZtVBb6TscmRqPNR3iXQ5I4
 Cvk3B7w922Jk+88r7yjyOFgynhkBKubLPTgMreJHykmXFK5kpXD0KyvMelhtbZp7
 gmiiuuM4ZLoViRy3id2WbDsMv6WCxDpB/hQ==
X-ME-Sender: <xms:AdZnadf8QNllBcMeoqX4ycyec6jJTt5GaDO3PZlozebgrJXOcA6z7w>
 <xme:AdZnaWCll0e4UDx3J7nW6qDZOMHsuSzywtiHk67ha_9oNd4cSiRMs44Wzyl75d2B6
 jG00CKjRNwtfsR0BQ2F-5mt1IkFHLxN9GMURD2Br27XPVujjVbLVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdefkeduucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvkfgjfhfutgesrgdtreerre
 dttdenucfhrhhomhepfdgkhihgmhhunhhtucfmrhihnhhitghkihdfuceomhgvseiihihg
 ohhonhdrphhlqeenucggtffrrghtthgvrhhnpefgtedttdeffeegteetffduiefhteeghf
 egudffjeevtdduffdttddvhfeuheejvdenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpehmvgesiiihghhoohhnrdhplhdpnhgspghrtghpthhtoh
 epuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghpphgrrhhmohhrsehlihhs
 thhsrdhusghunhhtuhdrtghomh
X-ME-Proxy: <xmx:AdZnaeOx_1A-i-TVEiwq1GBoXZLE9WLrl4R5q_LDZmIerYOZNCknXg>
 <xmx:AdZnac4wanahIAhAXJedLBbbhaAYMIqA8Br57rdJYB8ogJn36ScOXA>
 <xmx:AdZnaSLRHBZxc6WnqXPSEyaFX9ubuzK5VDPVmFxydt6LQTDMXIp7Mw>
 <xmx:AdZnaWeELFcOB19A3kU26Kq7LQzqTcq5e3UizNNZyWIzzB_Q6Ojrjw>
 <xmx:AdZnaZDbGYCK40HsTW_qs_u_ReXdb3Bf-qhqqD6FBeflNQH11RTEjf6V>
Feedback-ID: i416c40e7:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 835C0C4006D; Wed, 14 Jan 2026 12:44:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AmXWyHko4MNs
Date: Wed, 14 Jan 2026 18:44:13 +0100
From: "Zygmunt Krynicki" <me@zygoon.pl>
To: apparmor@lists.ubuntu.com
Message-Id: <f885c626-0a89-40fe-9a7e-814ec3666abe@app.fastmail.com>
In-Reply-To: <3ef6ce03-637e-4e4c-875a-180d9daa400a@163.com>
References: <3ef6ce03-637e-4e4c-875a-180d9daa400a@163.com>
Content-Type: multipart/alternative; boundary=a53c4a742702449a9cceaa165d418503
Received-SPF: pass client-ip=103.168.172.153; envelope-from=me@zygoon.pl;
 helo=fhigh-a2-smtp.messagingengine.com
Subject: Re: [apparmor] [ISSUE]Why my python script can't override the
	DACplease?
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

--a53c4a742702449a9cceaa165d418503
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



W dniu 14.01.2026 o 10:19 Fei Shao pisze:
> Would you like tell me why the py script can't create file when test 
> folder is 555 please?

Apparmor capability rules allow you to use an existing capability. They do not grant that capability up front.

Did you have the capability when invoking the script?

Best regards
ZK
--a53c4a742702449a9cceaa165d418503
Content-Type: text/html
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head><title></title></head><body><div><br></div><div><br></div><div>W dniu 14.01.2026 o 10:19 Fei Shao pisze:</div><blockquote type="cite" id="qt" style=""><div>Would you like tell me why the py script can't create file when test&nbsp;</div><div>folder is 555 please?</div></blockquote><div><br></div><div>Apparmor capability rules allow you to use an existing capability. They do not grant that capability up front.</div><div><br></div><div>Did you have the capability when invoking the script?</div><div><br></div><div>Best regards</div><div>ZK</div></body></html>
--a53c4a742702449a9cceaa165d418503--


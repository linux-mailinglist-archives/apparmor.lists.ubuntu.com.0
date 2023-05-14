Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FA3701AF8
	for <lists+apparmor@lfdr.de>; Sun, 14 May 2023 02:45:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pxzr9-0006tW-LT; Sun, 14 May 2023 00:44:59 +0000
Received: from resqmta-c1p-023461.sys.comcast.net ([96.102.19.42])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jleivent@comcast.net>) id 1pxzr8-0006t0-5x
 for apparmor@lists.ubuntu.com; Sun, 14 May 2023 00:44:58 +0000
Received: from resomta-c1p-023265.sys.comcast.net ([96.102.18.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
 (Client did not present a certificate)
 by resqmta-c1p-023461.sys.comcast.net with ESMTP
 id xzP3peUmwTCqUxzr4pFjwI; Sun, 14 May 2023 00:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
 s=20190202a; t=1684025094;
 bh=2NtXo2t+nBbhZurwK7GEF5yNjrGdJMFvc7hySOiNngM=;
 h=Received:Received:Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type:Xfinity-Spam-Result;
 b=lBXdV79VipBbbziPY9OH7tL+bz7ExxYaOGcQFl0sxA7I9RNnvZ40twHl8/KVM9s/B
 aOLxpgYC4JGqzvdAzfows8MiohBlld3iIxCFxtgDceEpWZfINiA8gxW4UKH97d5T7w
 MPFQ7n6v4/P2eIw9GcKR+bZu3nZeWIyFyHzo85kmuZLfqz4X3MiaJLTYN+HM2r0O0X
 Un+RUbP5J1U18OOOLyyoaVuWM14xBm+fhCsqOfJjZB5kJbjmpr+5yntEOaGoXxxKZF
 k1P8yhjeo5ljCcM6qcz4OwJrll25MH3WJ3w4pFaCioc7qcxq5tSp9MP97cVFSX/DKZ
 QmRdBAORSgfvA==
Received: from lapdog.hsd1.ma.comcast.net
 ([IPv6:2601:19c:5100:a63b:f76:36c:9f76:9671])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
 (Client did not present a certificate)
 by resomta-c1p-023265.sys.comcast.net with ESMTPA
 id xzr3p5foYX3EMxzr4pHwl6; Sun, 14 May 2023 00:44:54 +0000
X-Xfinity-VMeta: sc=0.00;st=legit
Date: Sat, 13 May 2023 20:44:52 -0400
From: jleivent <jleivent@comcast.net>
To: apparmor@lists.ubuntu.com
Message-ID: <20230513204452.019edac8@lapdog.hsd1.ma.comcast.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: [apparmor] downgrading extended network unix socket rule to generic
 network rule
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

I'm getting this warning from apparmor_parser: "Warning from profile foo
(ns): downgrading extended network unix socket rule to generic network
rule."  Am I correct that this means the kernel I'm using does not
support any network rule more complex than just "network" itself,
meaning all or nothing?

If that's the case, how do I find kernels that support the ability to
at least differentiate between local host networking (network unix or
netlink) vs. others?

I'm using Debian 12.  Would I'd be better off using Ubuntu or openSUSE
with recent kernels to get the necessary behavior?  Or is there a way
to get it in Debian?

Thanks in advance.


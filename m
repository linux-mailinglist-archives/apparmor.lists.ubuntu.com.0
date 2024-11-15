Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAE89CF104
	for <lists+apparmor@lfdr.de>; Fri, 15 Nov 2024 17:06:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tByqF-0003UZ-ST; Fri, 15 Nov 2024 16:06:39 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1tByqD-0003UP-5v
 for apparmor@lists.ubuntu.com; Fri, 15 Nov 2024 16:06:37 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfout.phl.internal (Postfix) with ESMTP id 27634138065E
 for <apparmor@lists.ubuntu.com>; Fri, 15 Nov 2024 11:06:36 -0500 (EST)
Received: from phl-imap-04 ([10.202.2.82])
 by phl-compute-07.internal (MEProxy); Fri, 15 Nov 2024 11:06:36 -0500
X-ME-Sender: <xms:i3E3Z6EqmbOKFnVLHb0tsNlVkxidUq30tWivFKML1_Tf9ukM55Z_bA>
 <xme:i3E3Z7Xo5UaI1CXRBX_T8ZMspWzokXWggOstuctOr9aturnNgq4jhvg6w6k7InnFM
 wtrEEO0yTWRoNOmwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvdeggdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
 tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepofggfffhvf
 fkufgtgfesthejredtredttdenucfhrhhomhepfdgkhihgmhhunhhtucfmrhihnhhitghk
 ihdfuceomhgvseiihihgohhonhdrphhlqeenucggtffrrghtthgvrhhnpedtuefhfeejte
 ekvddttdduuedvjeelheefkeevtdekieegheejudfghefhtdejieenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesiiihghhoohhnrdhplh
 dpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghp
 phgrrhhmohhrsehlihhsthhsrdhusghunhhtuhdrtghomh
X-ME-Proxy: <xmx:i3E3Z0ILMzO8Em7VvlhZHNilobhZd61SyzfvZiL-Bj94lBANBQqtsQ>
 <xmx:i3E3Z0GDlIo_6TcKqhjQVyq7xxWTsB6QIIqTdLLSCX2J4D0CBwGTrQ>
 <xmx:i3E3ZwUNWAk0WofWipvqGK8IRYoK5-J2chAw-lh9nZIbHXoOgZxIJg>
 <xmx:i3E3Z3Olsu26WeqPXGXbDnAo825BrwOuy-kQvsrMhRPGD7xLFWeNhg>
 <xmx:jHE3Z5eOaRT-g9G6LRSAcFcZ-KoGFvHzyd8TaYx7oYsc9QjTjNW9nkUy>
Feedback-ID: i416c40e7:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id D691E2E60084; Fri, 15 Nov 2024 11:06:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 15 Nov 2024 17:06:15 +0100
From: "Zygmunt Krynicki" <me@zygoon.pl>
To: apparmor@lists.ubuntu.com
Message-Id: <bd5bde67-6a03-4ecf-8542-279623bbf0d7@app.fastmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=103.168.172.149; envelope-from=me@zygoon.pl;
 helo=fout-a6-smtp.messagingengine.com
Subject: [apparmor] Exploring CI pipeline for integration tests of selected
	features
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

Hi!

I'm looking into adding or selecting tests to run at pull request time that would run checks against new apparmor parser and a list of curated kernels with the intent of capturing key use-cases relevant to snapd.

Snapd is a major user of apparmor, both for itself and for all the generated profiles for snap applications and services. We want to contribute and maintain tests that would capture several key interactions so that they both do not regress and if any parser work requires adapting the rules, would give the snapd team a heads-start to prepare for the next release of apparmor.

For context, snapd is distributed in two distinct ways, as a typical distribution package but also as a snap package, which is installed by another copy of snapd already on the system. The snap package does ship with a copy of apparmor parser built from sources and uses specifically for snapd's internal needs.

My initial plan is to look at all the tests present in the repository, play around with pipelines in my fork of the project and then contribute something that would run in under 5 minutes - excluding the time to build apparmor parser in another job of the pipeline - while capturing as much of the essential and perhaps tricky operations of snapd as we can.

I'm very much open for feedback, unless someone strongly disagress on direction I will start proposing early MRs for review next week.

My initial plan is to start with a system that can use typical Debian, Ubuntu vanilla Upstream kernels as the starting set. Details will be fleshed out over time.

Best regards
ZK


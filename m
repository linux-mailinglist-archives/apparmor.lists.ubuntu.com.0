Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CEC9D8AB6
	for <lists+apparmor@lfdr.de>; Mon, 25 Nov 2024 17:55:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tFcN4-0007Tf-Qr; Mon, 25 Nov 2024 16:55:34 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1tFcN2-0007TA-Go
 for apparmor@lists.ubuntu.com; Mon, 25 Nov 2024 16:55:33 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfout.phl.internal (Postfix) with ESMTP id 5DC091380732
 for <apparmor@lists.ubuntu.com>; Mon, 25 Nov 2024 11:55:31 -0500 (EST)
Received: from phl-imap-04 ([10.202.2.82])
 by phl-compute-07.internal (MEProxy); Mon, 25 Nov 2024 11:55:31 -0500
X-ME-Sender: <xms:A6xEZxfoL4vLSWO99nLRqLqT14ZkpDxbFcH_JHV_3HC-qnkz-B4UEw>
 <xme:A6xEZ_OXFH3010-70CcnMANtwFt2F_y_7plT46gxmMBIDyLzIK1Cb0oU3Rq6ZL_Av
 sjwjTHK4a_SDwHYIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrgeehgdelvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
 tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepofggfffhvf
 fkjghfufgtgfesthejredtredttdenucfhrhhomhepfdgkhihgmhhunhhtucfmrhihnhhi
 tghkihdfuceomhgvseiihihgohhonhdrphhlqeenucggtffrrghtthgvrhhnpeelhefhff
 ehvddvvddvtdevtdekgfdtjefhfffhudefleelieevtdeggfelhefhheenucffohhmrghi
 nhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepmhgvseiihihgohhonhdrphhlpdhnsggprhgtphhtthhopedupdhm
 ohguvgepshhmthhpohhuthdprhgtphhtthhopegrphhprghrmhhorheslhhishhtshdruh
 gsuhhnthhurdgtohhm
X-ME-Proxy: <xmx:A6xEZ6hcrYcbwZN_4aC-g2aa-51ZyO8nrRsofdByV-29QeN-EXPP0A>
 <xmx:A6xEZ6_P0uVV05sWxGwkAdp-Az7K65LTxCJyB0OCKkOi5ODoWRVJIg>
 <xmx:A6xEZ9tr8bQ3Ih2_AD1OilQ6h9yFf1-N7Cv021nx8WW6ZPPHPdcyfw>
 <xmx:A6xEZ5FKfMoL7MOS7UnYQyE6Wt8BF7xzGNpojgh5M1vX2WbrLdQ71A>
 <xmx:A6xEZ71meg5uCAcH7puM6ew32lDs_mp4YfJoP2UvC3aN8WUD7et9bjil>
Feedback-ID: i416c40e7:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id EE9DB2E60088; Mon, 25 Nov 2024 11:55:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 25 Nov 2024 17:55:10 +0100
From: "Zygmunt Krynicki" <me@zygoon.pl>
To: apparmor@lists.ubuntu.com
Message-Id: <75b176ee-9e95-4a1d-8cc2-cb8f4665e62a@app.fastmail.com>
In-Reply-To: <bd5bde67-6a03-4ecf-8542-279623bbf0d7@app.fastmail.com>
References: <bd5bde67-6a03-4ecf-8542-279623bbf0d7@app.fastmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=103.168.172.146; envelope-from=me@zygoon.pl;
 helo=fout-a3-smtp.messagingengine.com
Subject: Re: [apparmor] Exploring CI pipeline for integration tests of
	selectedfeatures
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



W dniu 15.11.2024 o 17:06 Zygmunt Krynicki pisze:
> Hi!
>
> I'm looking into adding or selecting tests to run at pull request time 
> that would run checks against new apparmor parser and a list of curated 
> kernels with the intent of capturing key use-cases relevant to snapd.
>

[snip]

> My initial plan is to start with a system that can use typical Debian, 
> Ubuntu vanilla Upstream kernels as the starting set. Details will be 
> fleshed out over time.

I've now opened a pull request https://gitlab.com/apparmor/apparmor/-/merge_requests/1432 which adds spread test suite running most of the existing tests that I could find, except for stress tests.

My next steps are to explore two separate efforts:

- Use spread support as a starting point to add dedicated tests that capture the interactions of mount-control interface.
- Integrate spread with gitlab continuous integration system, running a subset of tests to reach my self-defined 5-minute runtime limit.

I've also tested that with proper credentials all of those tests could also run in a google compute engine system similarly to how snapd is tested. I don't intend to do it but I wanted to have this as possibility because it can, at some point, be used to scale the test infrastructure to cover many tests, assuming they can run concurrently, quickly.

I am looking forward to your reviews.

Best regards
ZK


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D166A902686
	for <lists+apparmor@lfdr.de>; Mon, 10 Jun 2024 18:20:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sGhkp-0007nK-7I; Mon, 10 Jun 2024 16:20:19 +0000
Received: from flow1-smtp.messagingengine.com ([103.168.172.136])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jcalmels@3xx0.net>) id 1sGabP-0006rS-EK
 for apparmor@lists.ubuntu.com; Mon, 10 Jun 2024 08:42:07 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailflow.nyi.internal (Postfix) with ESMTP id 5B03E200404;
 Mon, 10 Jun 2024 04:42:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 10 Jun 2024 04:42:06 -0400
X-ME-Sender: <xms:XrxmZvzZP7xbrkP_X1Z_DJfplTPafejtRtkJI4A43LClUzmSIHIS5w>
 <xme:XrxmZnRUTkndK9sE_BuuYIUb3li2sZXgcdw5psio_zlMRycF1h7dtvtqc0gXr60x-
 dYdIq0OVEdPTi7AuKY>
X-ME-Received: <xmr:XrxmZpWFigCDMyF99Q0x1VukZuZF0pDyfj4v2qucOFZZZDNBIvxynahcR2xUygWLyodScN7TnSc7OL_2djL-qWE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedutddgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddtjeenucfhrhhomheplfhonhgr
 thhhrghnucevrghlmhgvlhhsuceojhgtrghlmhgvlhhsseefgiigtddrnhgvtheqnecugg
 ftrfgrthhtvghrnhepkeekteegfefgvdefgfefffeufeffjedvudeijeehjeehffekjeek
 leffueelgffgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepjhgtrghlmhgvlhhsseefgiigtddrnhgvth
X-ME-Proxy: <xmx:XrxmZpgqPk_6F3e5JQ18-ltyf9uNdIpk3jU47q9k4RC_A1m-HkSIAA>
 <xmx:XrxmZhB3IOiTK8sDG3QzU35vcUkoWUzUhlt1H4t01NxV3RSUPw8VgA>
 <xmx:XrxmZiKucST3S9pfjfKdDEsNV54urVKt3wVhxz_XrYt_KNl9GdSMGg>
 <xmx:XrxmZgBCzxwwvZvceM4u8WKtEVlmeP_3n1PIWsMJ5HQgJ1N61m6WRg>
 <xmx:XrxmZtzmO1peIdr1owfiir_hApCQU2o9fIR5wZQfJTTv79xrcvqQ4J7P>
Feedback-ID: i76614979:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jun 2024 04:42:02 -0400 (EDT)
Date: Mon, 10 Jun 2024 01:47:13 -0700
From: Jonathan Calmels <jcalmels@3xx0.net>
To: "Serge E. Hallyn" <serge@hallyn.com>
Message-ID: <6pwskrbtmxjy2ti3xabfslmupjhat7dhrnbftinzhxgxnsveum@5jq5l6ws7hls>
References: <20240609104355.442002-1-jcalmels@3xx0.net>
 <20240609104355.442002-2-jcalmels@3xx0.net>
 <20240610015024.GA2182786@mail.hallyn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610015024.GA2182786@mail.hallyn.com>
Received-SPF: pass client-ip=103.168.172.136; envelope-from=jcalmels@3xx0.net;
 helo=flow1-smtp.messagingengine.com
X-Mailman-Approved-At: Mon, 10 Jun 2024 16:20:17 +0000
Subject: Re: [apparmor] [PATCH v2 1/4] capabilities: Add user namespace
	capabilities
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
Cc: Matt Bobrowski <mattbobrowski@google.com>,
 Joel Granados <j.granados@samsung.com>, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 David Howells <dhowells@redhat.com>, Song Liu <song@kernel.org>,
 keyrings@vger.kernel.org, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 linux-security-module@vger.kernel.org, Mykola Lysenko <mykolal@fb.com>,
 Paul Moore <paul@paul-moore.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, John Fastabend <john.fastabend@gmail.com>,
 James Morris <jmorris@namei.org>, Jarkko Sakkinen <jarkko@kernel.org>,
 Andrew Morgan <morgan@kernel.org>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, KP Singh <kpsingh@kernel.org>,
 containers@lists.linux.dev, Hao Luo <haoluo@google.com>, brauner@kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, linux-kernel@vger.kernel.org,
 Eduard Zingerman <eddyz87@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>,
 ebiederm@xmission.com, Jiri Olsa <jolsa@kernel.org>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sun, Jun 09, 2024 at 08:50:24PM GMT, Serge E. Hallyn wrote:
> On Sun, Jun 09, 2024 at 03:43:34AM -0700, Jonathan Calmels wrote:
> > Attackers often rely on user namespaces to get elevated (yet confined)
> > privileges in order to target specific subsystems (e.g. [1]). Distributions
> 
> I'd modify this to say "in order to target *bugs* in specific subsystems" :)

Ack

> > This effectively mimics the inheritable set rules and means that, by
> > default, only root in the user namespace can regain userns capabilities
> > previously dropped:
> 
> Something about this last sentence feels wrong, but I'm not sure what
> the best alternative would be.  As is, though, it makes it sound as though
> root in the userns can always regain previously dropped capabilities, but
> that's not true if dropped in ancestor ns, or if root also dropped the
> bits from its bounding set (right?).

Right, the wording is a little bit confusing here I admit.
What I meant to say is that if a cap is dropped in a *given* namespace,
then it can only be regained by root there. But yes, caps can never be
regained from ancestors ns. I'll try to rephrase it.

BTW, this is rather strict, but I think that's what we want right,
something simple? Alternative would be to have a new cap masked off by
default, but if granted to a userns, allows you to regain ancestors
caps.


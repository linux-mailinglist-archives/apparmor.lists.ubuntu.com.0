Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D83B0903F5A
	for <lists+apparmor@lfdr.de>; Tue, 11 Jun 2024 16:58:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sH2xR-0003vI-SK; Tue, 11 Jun 2024 14:58:45 +0000
Received: from wflow1-smtp.messagingengine.com ([64.147.123.136])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jcalmels@3xx0.net>) id 1sGwrj-0003Aq-3P
 for apparmor@lists.ubuntu.com; Tue, 11 Jun 2024 08:28:27 +0000
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailflow.west.internal (Postfix) with ESMTP id BAE8E2CC0168;
 Tue, 11 Jun 2024 04:28:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 11 Jun 2024 04:28:25 -0400
X-ME-Sender: <xms:pgpoZvHNoVLJZbvLBBx9zFSFJzjc3tBW9UvbNLH_EEhz7hUrZ9eJYQ>
 <xme:pgpoZsVRDa5XD2bB9RpI24nGiyrXg-nm5rbo01f73VnNF46kAmDY4tAdomQp12gSc
 gcOQgNGh2G4X5djpn8>
X-ME-Received: <xmr:pgpoZhInH0L3g_lSzDHyFn_04fwDolaKCC-XKra6rrhvqOIupxIfTMIpiszoXDXEEtflWn32cYxoDR8u5AoKrwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduvddgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtsfdttddtjeenucfhrhhomheplfhonhgr
 thhhrghnucevrghlmhgvlhhsuceojhgtrghlmhgvlhhsseefgiigtddrnhgvtheqnecugg
 ftrfgrthhtvghrnhepkeekteegfefgvdefgfefffeufeffjedvudeijeehjeehffekjeek
 leffueelgffgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepjhgtrghlmhgvlhhsseefgiigtddrnhgvth
X-ME-Proxy: <xmx:pgpoZtE62QlC7KH4a1-Foj7m6SuGeo1__iLpVx3kWrNlKBtZDBGEXw>
 <xmx:pgpoZlWVRQ_p8fUh5gFYj3sWLfDDqVe2tMDDZAU1gqBXHf7mYlnMMQ>
 <xmx:pgpoZoOPDeZrLcNPr8SiDMzORypHNbn-VXsYWGSfv1UBbph_1w1i6w>
 <xmx:pgpoZk1eF3x0f-nXXHLkc3aOXfnwdUUVFZsttwxxSOhu5TFpp2cacg>
 <xmx:pgpoZqUhWZIGf2kTk6xnb51pDwG2k0o0o69dvVdgwO0G37IIm-rtNfGI>
Feedback-ID: i76614979:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Jun 2024 04:28:18 -0400 (EDT)
Date: Tue, 11 Jun 2024 01:33:29 -0700
From: Jonathan Calmels <jcalmels@3xx0.net>
To: Josef Bacik <josef@toxicpanda.com>
Message-ID: <tqvnpbrdmfj3q7rc2m365nxvwgb6hsvipiz7l473cdwyacdb6s@b22nvrk7vbok>
References: <20240609104355.442002-1-jcalmels@3xx0.net>
 <20240610201227.GD235772@perftesting>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610201227.GD235772@perftesting>
Received-SPF: pass client-ip=64.147.123.136; envelope-from=jcalmels@3xx0.net;
 helo=wflow1-smtp.messagingengine.com
X-Mailman-Approved-At: Tue, 11 Jun 2024 14:58:43 +0000
Subject: Re: [apparmor] [PATCH v2 0/4] Introduce user namespace capabilities
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
 "Serge E. Hallyn" <serge@hallyn.com>, selinux@vger.kernel.org,
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

On Mon, Jun 10, 2024 at 04:12:27PM GMT, Josef Bacik wrote:
> Where are the tests for this patchset?  I see you updated the bpf tests for the
> bpf lsm bits, but there's nothing to validate this new behavior or exercise the
> new ioctl you've added.  Thanks,

Apologies, I haven't had much time to spend on it so I prioritized the
rest. But yes, we should certainly update the capabilities selftests
once we agreed on the different behaviors.


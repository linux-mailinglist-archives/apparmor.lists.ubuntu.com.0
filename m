Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAE9903F59
	for <lists+apparmor@lfdr.de>; Tue, 11 Jun 2024 16:58:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sH2xQ-0003v0-G4; Tue, 11 Jun 2024 14:58:44 +0000
Received: from wflow1-smtp.messagingengine.com ([64.147.123.136])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jcalmels@3xx0.net>) id 1sGwfK-0008Qn-NS
 for apparmor@lists.ubuntu.com; Tue, 11 Jun 2024 08:15:38 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailflow.west.internal (Postfix) with ESMTP id 57A532CC01C9;
 Tue, 11 Jun 2024 04:15:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 11 Jun 2024 04:15:37 -0400
X-ME-Sender: <xms:pQdoZnJwpUwMJ5aSh754SMicBUig2Yo7cuxFIWBG488MykM7DOVeAg>
 <xme:pQdoZrJohRL0fRPyBWFyomxQw_Wntfm3Hi8KpMnHjHHAFSi3UgnvVIf_nrppUfvqp
 nbk4c5IYdmGH_HX-Us>
X-ME-Received: <xmr:pQdoZvvXVZYadnWUMnwqdouS2UsXYPZmppj5ffgA80HwlxeFKqUKT3Tckwlj9nuA14nh00vFXkes2Lh_2rgy-v4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduvdcutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehttdfstddttdejnecuhfhrohhmpeflohhnrghthhgr
 nhcuvegrlhhmvghlshcuoehjtggrlhhmvghlshesfeiggidtrdhnvghtqeenucggtffrrg
 htthgvrhhnpeekkeetgeefgfdvfefgfeffueefffejvdduieejheejheffkeejkeelffeu
 lefggfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hjtggrlhhmvghlshesfeiggidtrdhnvght
X-ME-Proxy: <xmx:pQdoZgbk3yz2iWEH2OCd2tzORrTqUi8Xy8tlfWlgEJ7aFszfgufoNA>
 <xmx:pQdoZuY-_ecrn57VvpsDzZQxq0DRPaeHlkGlaWPxohtt9RKsQqVRjw>
 <xmx:pQdoZkAIRT6rZ72ReWB9WCp__6QSGkYRSShFTuVyOTissCzd__D53w>
 <xmx:pQdoZsaUaxZf6hlV2VqKqE-kV3pGikI5Wpp7thyLHw9MpGq7NOr0AQ>
 <xmx:pQdoZioJsRbSnszbs1P2taAhZGEiLrtjH4FHUkxUUaOwAvhnVOVqp5RG>
Feedback-ID: i76614979:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Jun 2024 04:15:29 -0400 (EDT)
Date: Tue, 11 Jun 2024 01:20:40 -0700
From: Jonathan Calmels <jcalmels@3xx0.net>
To: "Serge E. Hallyn" <serge@hallyn.com>
Message-ID: <o5llgu7tzei7g2alssdqvy4g2gn66b73tcsir3xqktfqs765ke@wyofd2abvdbj>
References: <20240609104355.442002-1-jcalmels@3xx0.net>
 <20240609104355.442002-2-jcalmels@3xx0.net>
 <20240610130057.GB2193924@mail.hallyn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610130057.GB2193924@mail.hallyn.com>
Received-SPF: pass client-ip=64.147.123.136; envelope-from=jcalmels@3xx0.net;
 helo=wflow1-smtp.messagingengine.com
X-Mailman-Approved-At: Tue, 11 Jun 2024 14:58:43 +0000
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

On Mon, Jun 10, 2024 at 08:00:57AM GMT, Serge E. Hallyn wrote:
> 
> Now, one thing that does occur to me here is that there is a
> very mild form of sendmail-capabilities vulnerability that
> could happen here.  Unpriv user joe can drop CAP_SYS_ADMIN
> from cap_userns, then run a setuid-root program which starts
> a container which expects CAP_SYS_ADMIN.  This could be a
> shared container, and so joe could be breaking expected
> behavior there.
> 
> I *think* we want to say we don't care about this case, but
> if we did, I suppose we could say that the normal cap raise
> rules on setuid should apply to cap_userns?
> 

Right, good catch. If we do want to fix it, we could just check for
setuid no? Or do we want to follow the normal root inheritance rules
too? Essentially something like this:

pU' = is_suid(root) ? X : pU


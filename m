Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 62975902683
	for <lists+apparmor@lfdr.de>; Mon, 10 Jun 2024 18:20:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sGhkp-0007nR-Ad; Mon, 10 Jun 2024 16:20:19 +0000
Received: from flow1-smtp.messagingengine.com ([103.168.172.136])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jcalmels@3xx0.net>) id 1sGbWP-0003Qk-Jo
 for apparmor@lists.ubuntu.com; Mon, 10 Jun 2024 09:41:01 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailflow.nyi.internal (Postfix) with ESMTP id 963B22005E8;
 Mon, 10 Jun 2024 05:41:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 10 Jun 2024 05:41:00 -0400
X-ME-Sender: <xms:LMpmZkGE-eflvtIEwsg6gkccJ5iKsFDRlanTQlH5RisFANCJdKJnyA>
 <xme:LMpmZtXR8YOXh-iU4niksBMDtYtw-CmQPn8lCGVt2gaM45IzD-8NGWoyXDI4nWDoL
 kkOeYccTP4-FZd7dtM>
X-ME-Received: <xmr:LMpmZuINOI586a9DVmBFpEqsB_OfZXOtQGQ0GqS9akWHKky-9_zNVRIlXhBtNkRDHXLyNKqvefaOW-1i3zckVOU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedutddgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkefstddttdejnecuhfhrohhmpeflohhn
 rghthhgrnhcuvegrlhhmvghlshcuoehjtggrlhhmvghlshesfeiggidtrdhnvghtqeenuc
 ggtffrrghtthgvrhhnpeetgedutdfggeetleefhfeuhedtheduteekieduvdeigeegvdev
 vddtieekiedvheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehjtggrlhhmvghlshesfeiggidtrdhnvght
X-ME-Proxy: <xmx:LMpmZmFhkvdeqlm-6M4BTtRkSBGnJu2kqG8SVUIoAI2XSG7pv1KIXQ>
 <xmx:LMpmZqVggAwTWlvn6rCYXTiNLWrcaJIw9cfxq4zj3Pn-ofQbzZexnQ>
 <xmx:LMpmZpMAgFgbzUj73s7QZU5vvEe0Q_iTEiktwCD-tvDzkRrejVc9lg>
 <xmx:LMpmZh3iJSOiy9Hq-l1xA5WL35QxoPplcGdH5uexvRTvlDPFSPP6Sw>
 <xmx:LMpmZjUhtKFQlMDDlAkcUK3LjflnnZDUVoqCSrR42egFwU8ZMoeN9jzO>
Feedback-ID: i76614979:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jun 2024 05:40:56 -0400 (EDT)
Date: Mon, 10 Jun 2024 02:46:06 -0700
From: Jonathan Calmels <jcalmels@3xx0.net>
To: "Serge E. Hallyn" <serge@hallyn.com>
Message-ID: <svpbmv37f5n537seb3cfsylnlzi6ftuad4dqi5unoycylmcf7r@6knq7sibdw7w>
References: <20240609104355.442002-1-jcalmels@3xx0.net>
 <20240609104355.442002-3-jcalmels@3xx0.net>
 <20240610023301.GA2183903@mail.hallyn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240610023301.GA2183903@mail.hallyn.com>
Received-SPF: pass client-ip=103.168.172.136; envelope-from=jcalmels@3xx0.net;
 helo=flow1-smtp.messagingengine.com
X-Mailman-Approved-At: Mon, 10 Jun 2024 16:20:17 +0000
Subject: Re: [apparmor] [PATCH v2 2/4] capabilities: Add securebit to
 restrict userns caps
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
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 KP Singh <kpsingh@kernel.org>, containers@lists.linux.dev,
 Hao Luo <haoluo@google.com>, brauner@kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, linux-kernel@vger.kernel.org,
 Eduard Zingerman <eddyz87@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>,
 ebiederm@xmission.com, Jiri Olsa <jolsa@kernel.org>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sun, Jun 09, 2024 at 09:33:01PM GMT, Serge E. Hallyn wrote:
> On Sun, Jun 09, 2024 at 03:43:35AM -0700, Jonathan Calmels wrote:
> > This patch adds a new capability security bit designed to constrain a
> > task’s userns capability set to its bounding set. The reason for this is
> > twofold:
> > 
> > - This serves as a quick and easy way to lock down a set of capabilities
> >   for a task, thus ensuring that any namespace it creates will never be
> >   more privileged than itself is.
> > - This helps userspace transition to more secure defaults by not requiring
> >   specific logic for the userns capability set, or libcap support.
> > 
> > Example:
> > 
> >     # capsh --secbits=$((1 << 8)) --drop=cap_sys_rawio -- \
> >             -c 'unshare -r grep Cap /proc/self/status'
> >     CapInh: 0000000000000000
> >     CapPrm: 000001fffffdffff
> >     CapEff: 000001fffffdffff
> >     CapBnd: 000001fffffdffff
> >     CapAmb: 0000000000000000
> >     CapUNs: 000001fffffdffff
> 
> But you are not (that I can see, in this or the previous patch)
> keeping SECURE_USERNS_STRICT_CAPS in securebits on the next
> level unshare.  Though I think it's ok, because by then both
> cap_userns and cap_bset are reduced and cap_userns can't be
> expanded.  (Sorry, just thinking aloud here)

Right this is safe to reset, but maybe we do keep it if the secbit is
locked? This is kind of a special case compared to the other bits.

> > +	/* Limit userns capabilities to our parent's bounding set. */
> 
> In the case of userns_install(), it will be the target user namespace
> creator's bounding set, right?  Not "our parent's"?

Good point, I should reword this comment.


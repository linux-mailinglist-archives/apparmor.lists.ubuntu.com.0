Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 22864903F5C
	for <lists+apparmor@lfdr.de>; Tue, 11 Jun 2024 16:58:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sH2xQ-0003ut-Bo; Tue, 11 Jun 2024 14:58:44 +0000
Received: from wflow1-smtp.messagingengine.com ([64.147.123.136])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jcalmels@3xx0.net>) id 1sGwUM-0004GZ-J7
 for apparmor@lists.ubuntu.com; Tue, 11 Jun 2024 08:04:19 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailflow.west.internal (Postfix) with ESMTP id 282092CC0167;
 Tue, 11 Jun 2024 04:04:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 11 Jun 2024 04:04:14 -0400
X-ME-Sender: <xms:-wRoZpXrMrwrS2LBoRUf1CscHpzfEOrNAJKNPFtQhnL2ou4ekXBebw>
 <xme:-wRoZplIqIz-jLey3ypWwohXbLo_axCWylNtXJSop0FrUIU_rmjonZ32jdlWwBPFT
 iyChc6HdYd2moNtCsY>
X-ME-Received: <xmr:-wRoZla3TKdjigG_1iaNu_jfnqUKH-kmyaTaQ8PEpjIy_KzdOf026xrOdaJZbZ3hsIKHSjAW1_0YIc-XzHE-Kz8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduuddguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgestheksfdttddtjeenucfhrhhomheplfho
 nhgrthhhrghnucevrghlmhgvlhhsuceojhgtrghlmhgvlhhsseefgiigtddrnhgvtheqne
 cuggftrfgrthhtvghrnhepleekffehueelieehveekjeeggfdufefffeeuvdetkeeigefg
 veekvedtfeegffegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdplhgruhhntghhph
 grugdrnhgvthenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehjtggrlhhmvghlshesfeiggidtrdhnvght
X-ME-Proxy: <xmx:-wRoZsW_jAS-81zAUR-g6jdd9E8ilJENs9OUd1rRv-1c8UA21Ym8_A>
 <xmx:-wRoZjlpGEBpk6d50L2m4A98pvBaAsuSdPz6BQm4X_y5dld9sd84LA>
 <xmx:-wRoZpefYCike81RvCyTXCdE9YDoVGo62yxfwbbeJ0ekaL6W3FmwhA>
 <xmx:-wRoZtEuV4QOEfDqcw9_xN4BTBgS0yEpp8zMtZ8VcYlL1hMBle_ObQ>
 <xmx:-wRoZtmBixysWk2mkeQa9y_IPYYypQgmdhR9RwxVXuUx8F-uV7TEZXxX>
Feedback-ID: i76614979:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Jun 2024 04:04:07 -0400 (EDT)
Date: Tue, 11 Jun 2024 01:09:18 -0700
From: Jonathan Calmels <jcalmels@3xx0.net>
To: Paul Moore <paul@paul-moore.com>
Message-ID: <z2bgjrzeq7crqx24chdbxnaanuhczbjnq6da3xw6al6omjj5xz@mqbzzzfva5sw>
References: <20240609104355.442002-1-jcalmels@3xx0.net>
 <20240609104355.442002-5-jcalmels@3xx0.net>
 <CAHC9VhT5XWbhoY2Nw5jQz4GxpDriUdHw=1YsQ4xLVUtSnFxciA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC9VhT5XWbhoY2Nw5jQz4GxpDriUdHw=1YsQ4xLVUtSnFxciA@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.136; envelope-from=jcalmels@3xx0.net;
 helo=wflow1-smtp.messagingengine.com
X-Mailman-Approved-At: Tue, 11 Jun 2024 14:58:43 +0000
Subject: Re: [apparmor] [PATCH v2 4/4] bpf,
 lsm: Allow editing capabilities in BPF-LSM hooks
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
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 John Fastabend <john.fastabend@gmail.com>, James Morris <jmorris@namei.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>,
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

On Sun, Jun 09, 2024 at 08:18:48PM GMT, Paul Moore wrote:
> On Sun, Jun 9, 2024 at 6:40 AM Jonathan Calmels <jcalmels@3xx0.net> wrote:
> >
> > This patch allows modifying the various capabilities of the struct cred
> > in BPF-LSM hooks. More specifically, the userns_create hook called
> > prior to creating a new user namespace.
> >
> > With the introduction of userns capabilities, this effectively provides
> > a simple way for LSMs to control the capabilities granted to a user
> > namespace and all its descendants.
> >
> > Update the selftests accordingly by dropping CAP_SYS_ADMIN in
> > namespaces and checking the resulting task's bounding set.
> >
> > Signed-off-by: Jonathan Calmels <jcalmels@3xx0.net>
> > ---
> >  include/linux/lsm_hook_defs.h                 |  2 +-
> >  include/linux/security.h                      |  4 +-
> >  kernel/bpf/bpf_lsm.c                          | 55 +++++++++++++++++++
> >  security/apparmor/lsm.c                       |  2 +-
> >  security/security.c                           |  6 +-
> >  security/selinux/hooks.c                      |  2 +-
> >  .../selftests/bpf/prog_tests/deny_namespace.c | 12 ++--
> >  .../selftests/bpf/progs/test_deny_namespace.c |  7 ++-
> >  8 files changed, 76 insertions(+), 14 deletions(-)
> 
> I'm not sure we want to go down the path of a LSM modifying the POSIX
> capabilities of a task, other than the capabilities/commoncap LSM.  It
> sets a bad precedent and could further complicate issues around LSM
> ordering.

Well unless I'm misunderstanding, this does allow modifying the
capabilities/commoncap LSM through BTF. The reason for allowing
`userns_create` to be modified is that it is functionally very similar
to `cred_prepare` in that it operates with new creds (but specific to
user namespaces because of reasons detailed in [1]). 

There were some concerns in previous threads that the userns caps by
themselves wouldn't be granular enough, hence the LSM integration.
Ubuntu for example, currently has to resort to a hardcoded profile
transition to achieve this [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7cd4c5c2101cb092db00f61f69d24380cf7a0ee8
[2] https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/noble/commit/?id=43a6c29532f517179fea8c94949d657d71f4fc13


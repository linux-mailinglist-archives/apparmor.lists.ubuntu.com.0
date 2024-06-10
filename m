Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CF14A902685
	for <lists+apparmor@lfdr.de>; Mon, 10 Jun 2024 18:20:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sGhkr-0007nv-Lk; Mon, 10 Jun 2024 16:20:21 +0000
Received: from mail.hallyn.com ([178.63.66.53])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <serge@mail.hallyn.com>)
 id 1sGeSG-0003cP-Ux
 for apparmor@lists.ubuntu.com; Mon, 10 Jun 2024 12:48:57 +0000
Received: by mail.hallyn.com (Postfix, from userid 1001)
 id EBF00579; Mon, 10 Jun 2024 07:48:55 -0500 (CDT)
Date: Mon, 10 Jun 2024 07:48:55 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Jonathan Calmels <jcalmels@3xx0.net>
Message-ID: <20240610124855.GA2193924@mail.hallyn.com>
References: <20240609104355.442002-1-jcalmels@3xx0.net>
 <20240609104355.442002-2-jcalmels@3xx0.net>
 <20240610015024.GA2182786@mail.hallyn.com>
 <6pwskrbtmxjy2ti3xabfslmupjhat7dhrnbftinzhxgxnsveum@5jq5l6ws7hls>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6pwskrbtmxjy2ti3xabfslmupjhat7dhrnbftinzhxgxnsveum@5jq5l6ws7hls>
Received-SPF: pass client-ip=178.63.66.53; envelope-from=serge@mail.hallyn.com;
 helo=mail.hallyn.com
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
 Andrew Morgan <morgan@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>,
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

On Mon, Jun 10, 2024 at 01:47:13AM -0700, Jonathan Calmels wrote:
> On Sun, Jun 09, 2024 at 08:50:24PM GMT, Serge E. Hallyn wrote:
> > On Sun, Jun 09, 2024 at 03:43:34AM -0700, Jonathan Calmels wrote:
> > > Attackers often rely on user namespaces to get elevated (yet confined)
> > > privileges in order to target specific subsystems (e.g. [1]). Distributions
> > 
> > I'd modify this to say "in order to target *bugs* in specific subsystems" :)
> 
> Ack
> 
> > > This effectively mimics the inheritable set rules and means that, by
> > > default, only root in the user namespace can regain userns capabilities
> > > previously dropped:
> > 
> > Something about this last sentence feels wrong, but I'm not sure what
> > the best alternative would be.  As is, though, it makes it sound as though
> > root in the userns can always regain previously dropped capabilities, but
> > that's not true if dropped in ancestor ns, or if root also dropped the
> > bits from its bounding set (right?).
> 
> Right, the wording is a little bit confusing here I admit.
> What I meant to say is that if a cap is dropped in a *given* namespace,
> then it can only be regained by root there. But yes, caps can never be
> regained from ancestors ns. I'll try to rephrase it.
> 
> BTW, this is rather strict, but I think that's what we want right,

Yes,

> something simple? Alternative would be to have a new cap masked off by
> default, but if granted to a userns, allows you to regain ancestors
> caps.

we absolutely do not want to allow regaining caps dropped in an
ancestor namespace.

thanks,
-serge


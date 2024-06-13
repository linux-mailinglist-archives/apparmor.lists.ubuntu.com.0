Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id AA813909C72
	for <lists+apparmor@lfdr.de>; Sun, 16 Jun 2024 10:15:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sIl30-0001qi-G5; Sun, 16 Jun 2024 08:15:34 +0000
Received: from wind.enjellic.com ([76.10.64.91])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <greg@wind.enjellic.com>) id 1sHhyI-0007VZ-OU
 for apparmor@lists.ubuntu.com; Thu, 13 Jun 2024 10:46:23 +0000
Received: from wind.enjellic.com (localhost [127.0.0.1])
 by wind.enjellic.com (8.15.2/8.15.2) with ESMTP id 45DAjF41023155;
 Thu, 13 Jun 2024 05:45:15 -0500
Received: (from greg@localhost)
 by wind.enjellic.com (8.15.2/8.15.2/Submit) id 45DAjC98023150;
 Thu, 13 Jun 2024 05:45:12 -0500
Date: Thu, 13 Jun 2024 05:45:12 -0500
From: "Dr. Greg" <greg@enjellic.com>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <20240613104512.GA22971@wind.enjellic.com>
References: <20240609104355.442002-5-jcalmels@3xx0.net>
 <CAHC9VhT5XWbhoY2Nw5jQz4GxpDriUdHw=1YsQ4xLVUtSnFxciA@mail.gmail.com>
 <z2bgjrzeq7crqx24chdbxnaanuhczbjnq6da3xw6al6omjj5xz@mqbzzzfva5sw>
 <887a3658-2d8d-4f9e-98f2-27124bb6f8e6@canonical.com>
 <CAHC9VhQFNPJTOct5rUv3HT6Z2S20mYdW75seiG8no5=fZd7JjA@mail.gmail.com>
 <uuvwcdsy7o4ulmrdzwffr6uywfacmlkjrontmjdj44luantpok@dtatxaa6tzyv>
 <CAHC9VhRnthf8+KgfuzFHXWEAc9RShDO0G_g0kc1OJ-UTih1ywg@mail.gmail.com>
 <rgzhcsblub7wedm734n56cw2qf6czjb4jgck6l5miur6odhovo@n5tgrco74zce>
 <CAHC9VhRGJTND25MFk4gR-FGxoLhMmgUrMpz_YoMFOwL6kr28zQ@mail.gmail.com>
 <ba8d88c8-a251-4c1f-8653-1082b0a101dd@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba8d88c8-a251-4c1f-8653-1082b0a101dd@canonical.com>
User-Agent: Mutt/1.4i
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.2.3
 (wind.enjellic.com [127.0.0.1]); Thu, 13 Jun 2024 05:45:15 -0500 (CDT)
Received-SPF: pass client-ip=76.10.64.91; envelope-from=greg@wind.enjellic.com;
 helo=wind.enjellic.com
X-Mailman-Approved-At: Sun, 16 Jun 2024 08:15:33 +0000
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
Reply-To: "Dr. Greg" <greg@enjellic.com>
Cc: Matt Bobrowski <mattbobrowski@google.com>,
 Joel Granados <j.granados@samsung.com>, Jonathan Calmels <jcalmels@3xx0.net>,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Kees Cook <kees@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, David Howells <dhowells@redhat.com>,
 Song Liu <song@kernel.org>, keyrings@vger.kernel.org,
 Stanislav Fomichev <sdf@google.com>, Yonghong Song <yonghong.song@linux.dev>,
 Shuah Khan <shuah@kernel.org>, linux-security-module@vger.kernel.org,
 Mykola Lysenko <mykolal@fb.com>, Paul Moore <paul@paul-moore.com>,
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

On Wed, Jun 12, 2024 at 08:54:28PM -0700, John Johansen wrote:

Good morning, I hope the day is going well for everyone.

> On 6/12/24 10:29, Paul Moore wrote:
> >On Wed, Jun 12, 2024 at 4:15???AM Jonathan Calmels <jcalmels@3xx0.net> 
> >wrote:
> >>On Tue, Jun 11, 2024 at 06:38:31PM GMT, Paul Moore wrote:
> >>>On Tue, Jun 11, 2024 at 6:15???PM Jonathan Calmels <jcalmels@3xx0.net> 
> >>>wrote:
> >
> >...
> >
> >>>>Arguably, if we do want fine-grained userns policies, we need LSMs to
> >>>>influence the userns capset at some point.
> >>>
> >>>One could always use, or develop, a LSM that offers additional
> >>>controls around exercising capabilities.  There are currently four
> >>>in-tree LSMs, including the capabilities LSM, which supply a
> >>>security_capable() hook that is used by the capability-based access
> >>>controls in the kernel; all of these hook implementations work
> >>>together within the LSM framework and provide an additional level of
> >>>control/granularity beyond the existing capabilities.
> >>
> >>Right, but the idea was to have a simple and easy way to reuse/trigger
> >>as much of the commoncap one as possible from BPF. If we're saying we
> >>need to reimplement and/or use a whole new framework, then there is
> >>little value.
> >
> >I can appreciate how allowing direct manipulation of capability bits
> >from a BPF LSM looks attractive, but my hope is that our discussion
> >here revealed that as you look deeper into making it work there are a
> >number of pitfalls which prevent this from being a safe option for
> >generalized systems.
> >
> >>TBH, I don't feel strongly about this, which is why it is absent from
> >>v1. However, as John pointed out, we should at least be able to modify
> >>the blob if we want flexible userns caps policies down the road.
> >
> >As discussed in this thread, there are existing ways to provide fine
> >grained control over exercising capabilities that can be safely used
> >within the LSM framework.  I don't want to speak to what John is
> >envisioning, but he should be aware of these mechanisms, and if I
> >recall he did voice a level of concern about the same worries I
> >mentioned.
> >
> 
> sorry, I should have been more clear. I envision LSMs being able to
> update their own state in the userns hook.
> 
> Basically the portion of the patch that removes const from the
> userns hook.
> 
> An LSM updating the capset is worrysome for all the reasons you
> pointed out, and I think a few more. I haven't had a chance to really
> look at v2 yet, so I didn't want to speak directly on the bpf part of
> the patch without first giving a good once over.
> 
> >I'm happy to discuss ways in which we can adjust the LSM hooks/layer
> >to support different approaches to capability controls, but one LSM
> >directly manipulating the state of another is going to be a no vote
> >from me.
> >
> I might not be as hard no as Paul here, I am always willing to listen
> to arguments, but it would have to be a really good argument to
> modify the capset, when there are multiple LSMs in play on a system.

Putting my pragmatic operations hat on, it isn't just the impact on
multiple LSM's.

The security vendors, CrowdStrike's Falcon comes immediately to mind,
are installing BPF hooks as part of their agent systems.

Given that the issue of signing BPF programs is still an open
question, allowing the ability of a BPF program to modify the security
capabilities of a process opens the door to supply chain attacks that
would seem unbounded in scope.

On the other side of the fence, installing a BPF program is a
privileged operation.  If a decision is made to allow that kind of
privilege on a system the argument can be made that you get to keep
both pieces.

Of course that needs to be paired against the fact that system's
administrators are not given any choice as to the wisdom of that type
of permission being afforded to security applications.

Best wishes for a productive remainder of the week.

As always,
Dr. Greg

The Quixote Project - Flailing at the Travails of Cybersecurity
              https://github.com/Quixote-Project


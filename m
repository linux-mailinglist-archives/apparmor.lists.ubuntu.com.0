Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B6C902684
	for <lists+apparmor@lfdr.de>; Mon, 10 Jun 2024 18:20:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sGhkp-0007nX-Ee; Mon, 10 Jun 2024 16:20:19 +0000
Received: from mail.hallyn.com ([178.63.66.53])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <serge@mail.hallyn.com>)
 id 1sGedu-0004a1-Fj
 for apparmor@lists.ubuntu.com; Mon, 10 Jun 2024 13:00:58 +0000
Received: by mail.hallyn.com (Postfix, from userid 1001)
 id C3CC4579; Mon, 10 Jun 2024 08:00:57 -0500 (CDT)
Date: Mon, 10 Jun 2024 08:00:57 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Jonathan Calmels <jcalmels@3xx0.net>, Andrew Morgan <morgan@kernel.org>
Message-ID: <20240610130057.GB2193924@mail.hallyn.com>
References: <20240609104355.442002-1-jcalmels@3xx0.net>
 <20240609104355.442002-2-jcalmels@3xx0.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240609104355.442002-2-jcalmels@3xx0.net>
Received-SPF: pass client-ip=178.63.66.53; envelope-from=serge@mail.hallyn.com;
 helo=mail.hallyn.com
X-Mailman-Approved-At: Mon, 10 Jun 2024 16:20:18 +0000
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

On Sun, Jun 09, 2024 at 03:43:34AM -0700, Jonathan Calmels wrote:
> Attackers often rely on user namespaces to get elevated (yet confined)
> privileges in order to target specific subsystems (e.g. [1]). Distributions
> have been pretty adamant that they need a way to configure these, most of
> them carry out-of-tree patches to do so, or plainly refuse to enable them.
> As a result, there have been multiple efforts over the years to introduce
> various knobs to control and/or disable user namespaces (e.g. [2][3][4]).
> 
> While we acknowledge that there are already ways to control the creation of
> such namespaces (the most recent being a LSM hook), there are inherent
> issues with these approaches. Preventing the user namespace creation is not
> fine-grained enough, and in some cases, incompatible with various userspace
> expectations (e.g. container runtimes, browser sandboxing, service
> isolation)
> 
> This patch addresses these limitations by introducing an additional
> capability set used to restrict the permissions granted when creating user
> namespaces. This way, processes can apply the principle of least privilege
> by configuring only the capabilities they need for their namespaces.
> 
> For compatibility reasons, processes always start with a full userns
> capability set.
> 
> On namespace creation, the userns capability set (pU) is assigned to the
> new effective (pE), permitted (pP) and bounding set (X) of the task:
> 
>     pU = pE = pP = X
> 
> The userns capability set obeys the invariant that no bit can ever be set
> if it is not already part of the task’s bounding set. This ensures that
> no namespace can ever gain more privileges than its predecessors.
> Additionally, if a task is not privileged over CAP_SETPCAP, setting any bit
> in the userns set requires its corresponding bit to be set in the permitted
> set. This effectively mimics the inheritable set rules and means that, by
> default, only root in the user namespace can regain userns capabilities
> previously dropped:
> 
>     p’U = (pE & CAP_SETPCAP) ? X : (X & pP)
> 
> Note that since userns capabilities are strictly hierarchical, policies can
> be enforced at various levels (e.g. init, pam_cap) and inherited by every
> child namespace.
> 
> Here is a sample program that can be used to verify the functionality:
> 
> /*
>  * Test program that drops CAP_SYS_RAWIO from subsequent user namespaces.
>  *
>  * ./cap_userns_test unshare -r grep Cap /proc/self/status
>  * CapInh: 0000000000000000
>  * CapPrm: 000001fffffdffff
>  * CapEff: 000001fffffdffff
>  * CapBnd: 000001fffffdffff
>  * CapAmb: 0000000000000000
>  * CapUNs: 000001fffffdffff
>  */

...

> +#ifdef CONFIG_USER_NS
> +	case PR_CAP_USERNS:
> +		if (arg2 == PR_CAP_USERNS_CLEAR_ALL) {
> +			if (arg3 | arg4 | arg5)
> +				return -EINVAL;
> +
> +			new = prepare_creds();
> +			if (!new)
> +				return -ENOMEM;
> +			cap_clear(new->cap_userns);
> +			return commit_creds(new);
> +		}
> +
> +		if (((!cap_valid(arg3)) | arg4 | arg5))
> +			return -EINVAL;
> +
> +		if (arg2 == PR_CAP_USERNS_IS_SET)
> +			return !!cap_raised(current_cred()->cap_userns, arg3);
> +		if (arg2 != PR_CAP_USERNS_RAISE && arg2 != PR_CAP_USERNS_LOWER)
> +			return -EINVAL;
> +		if (arg2 == PR_CAP_USERNS_RAISE && !cap_uns_is_raiseable(arg3))
> +			return -EPERM;
> +
> +		new = prepare_creds();
> +		if (!new)
> +			return -ENOMEM;
> +		if (arg2 == PR_CAP_USERNS_RAISE)
> +			cap_raise(new->cap_userns, arg3);
> +		else
> +			cap_lower(new->cap_userns, arg3);

Now, one thing that does occur to me here is that there is a
very mild form of sendmail-capabilities vulnerability that
could happen here.  Unpriv user joe can drop CAP_SYS_ADMIN
from cap_userns, then run a setuid-root program which starts
a container which expects CAP_SYS_ADMIN.  This could be a
shared container, and so joe could be breaking expected
behavior there.

I *think* we want to say we don't care about this case, but
if we did, I suppose we could say that the normal cap raise
rules on setuid should apply to cap_userns?



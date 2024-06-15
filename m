Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BBC909C76
	for <lists+apparmor@lfdr.de>; Sun, 16 Jun 2024 10:15:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sIl32-0001rJ-0r; Sun, 16 Jun 2024 08:15:36 +0000
Received: from mail.hallyn.com ([178.63.66.53])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <serge@mail.hallyn.com>)
 id 1sIVBN-0007wD-Ks
 for apparmor@lists.ubuntu.com; Sat, 15 Jun 2024 15:19:09 +0000
Received: by mail.hallyn.com (Postfix, from userid 1001)
 id B241C66D; Sat, 15 Jun 2024 10:19:08 -0500 (CDT)
Date: Sat, 15 Jun 2024 10:19:08 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Jonathan Calmels <jcalmels@3xx0.net>
Message-ID: <20240615151908.GA44653@mail.hallyn.com>
References: <20240609104355.442002-1-jcalmels@3xx0.net>
 <20240609104355.442002-2-jcalmels@3xx0.net>
 <20240610130057.GB2193924@mail.hallyn.com>
 <o5llgu7tzei7g2alssdqvy4g2gn66b73tcsir3xqktfqs765ke@wyofd2abvdbj>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <o5llgu7tzei7g2alssdqvy4g2gn66b73tcsir3xqktfqs765ke@wyofd2abvdbj>
Received-SPF: pass client-ip=178.63.66.53; envelope-from=serge@mail.hallyn.com;
 helo=mail.hallyn.com
X-Mailman-Approved-At: Sun, 16 Jun 2024 08:15:33 +0000
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

On Tue, Jun 11, 2024 at 01:20:40AM -0700, Jonathan Calmels wrote:
> On Mon, Jun 10, 2024 at 08:00:57AM GMT, Serge E. Hallyn wrote:
> > 
> > Now, one thing that does occur to me here is that there is a
> > very mild form of sendmail-capabilities vulnerability that
> > could happen here.  Unpriv user joe can drop CAP_SYS_ADMIN
> > from cap_userns, then run a setuid-root program which starts
> > a container which expects CAP_SYS_ADMIN.  This could be a
> > shared container, and so joe could be breaking expected
> > behavior there.
> > 
> > I *think* we want to say we don't care about this case, but
> > if we did, I suppose we could say that the normal cap raise
> > rules on setuid should apply to cap_userns?
> > 
> 
> Right, good catch. If we do want to fix it, we could just check for
> setuid no? Or do we want to follow the normal root inheritance rules
> too? Essentially something like this:
> 
> pU' = is_suid(root) ? X : pU

Yeah, I think that makes sense.  Thanks.

-serge


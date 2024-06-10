Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 505E7902682
	for <lists+apparmor@lfdr.de>; Mon, 10 Jun 2024 18:20:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sGhkr-0007o2-QF; Mon, 10 Jun 2024 16:20:21 +0000
Received: from mail.hallyn.com ([178.63.66.53])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <serge@mail.hallyn.com>)
 id 1sGeiS-0004uR-R8
 for apparmor@lists.ubuntu.com; Mon, 10 Jun 2024 13:05:40 +0000
Received: by mail.hallyn.com (Postfix, from userid 1001)
 id 4456B579; Mon, 10 Jun 2024 08:05:40 -0500 (CDT)
Date: Mon, 10 Jun 2024 08:05:40 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Jonathan Calmels <jcalmels@3xx0.net>
Message-ID: <20240610130540.GC2193924@mail.hallyn.com>
References: <20240609104355.442002-1-jcalmels@3xx0.net>
 <20240609104355.442002-3-jcalmels@3xx0.net>
 <20240610023301.GA2183903@mail.hallyn.com>
 <svpbmv37f5n537seb3cfsylnlzi6ftuad4dqi5unoycylmcf7r@6knq7sibdw7w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <svpbmv37f5n537seb3cfsylnlzi6ftuad4dqi5unoycylmcf7r@6knq7sibdw7w>
Received-SPF: pass client-ip=178.63.66.53; envelope-from=serge@mail.hallyn.com;
 helo=mail.hallyn.com
X-Mailman-Approved-At: Mon, 10 Jun 2024 16:20:18 +0000
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

On Mon, Jun 10, 2024 at 02:46:06AM -0700, Jonathan Calmels wrote:
> On Sun, Jun 09, 2024 at 09:33:01PM GMT, Serge E. Hallyn wrote:
> > On Sun, Jun 09, 2024 at 03:43:35AM -0700, Jonathan Calmels wrote:
> > > This patch adds a new capability security bit designed to constrain a
> > > task’s userns capability set to its bounding set. The reason for this is
> > > twofold:
> > > 
> > > - This serves as a quick and easy way to lock down a set of capabilities
> > >   for a task, thus ensuring that any namespace it creates will never be
> > >   more privileged than itself is.
> > > - This helps userspace transition to more secure defaults by not requiring
> > >   specific logic for the userns capability set, or libcap support.
> > > 
> > > Example:
> > > 
> > >     # capsh --secbits=$((1 << 8)) --drop=cap_sys_rawio -- \
> > >             -c 'unshare -r grep Cap /proc/self/status'
> > >     CapInh: 0000000000000000
> > >     CapPrm: 000001fffffdffff
> > >     CapEff: 000001fffffdffff
> > >     CapBnd: 000001fffffdffff
> > >     CapAmb: 0000000000000000
> > >     CapUNs: 000001fffffdffff
> > 
> > But you are not (that I can see, in this or the previous patch)
> > keeping SECURE_USERNS_STRICT_CAPS in securebits on the next
> > level unshare.  Though I think it's ok, because by then both
> > cap_userns and cap_bset are reduced and cap_userns can't be
> > expanded.  (Sorry, just thinking aloud here)
> 
> Right this is safe to reset, but maybe we do keep it if the secbit is
> locked? This is kind of a special case compared to the other bits.

I don't think it would be worth the extra complication in the
secbits code, and it's semantically very different from the
cap_userns.

> > > +	/* Limit userns capabilities to our parent's bounding set. */
> > 
> > In the case of userns_install(), it will be the target user namespace
> > creator's bounding set, right?  Not "our parent's"?
> 
> Good point, I should reword this comment.


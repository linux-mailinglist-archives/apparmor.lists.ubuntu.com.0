Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E9713770EE8
	for <lists+apparmor@lfdr.de>; Sat,  5 Aug 2023 10:50:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qSCzU-0000Mv-DW; Sat, 05 Aug 2023 08:50:28 +0000
Received: from out-83.mta0.migadu.com ([91.218.175.83])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <martin.lau@linux.dev>) id 1qS556-0007AF-JU
 for apparmor@lists.ubuntu.com; Sat, 05 Aug 2023 00:23:44 +0000
Message-ID: <8b706f66-2afa-b3d0-a13a-11f1ffb452fe@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1691195024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eUPA7Rbj5jk/MQgWgg+tKqw5KVGmICrIzOFj3UTUAGM=;
 b=FMHWlSfzy1ema2iNWXS3cVRO55vunCyX23YpRCcUf0/fa1sl2w6jsF7fSBZwDCRpY8O/D/
 5rP/MpM2zW1gjLe3Tz2hWCPiehr5qwYBnHJysFDtQgOo4Y6t6HPHYVjqdEbz9hyzVcknx6
 GC0H0RtkOPxfj0cMf2/v1V6Oje/VOlo=
Date: Fri, 4 Aug 2023 17:23:32 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Geliang Tang <geliang.tang@suse.com>
References: <cover.1691125344.git.geliang.tang@suse.com>
 <15d7646940fcbb8477b1be1aa11a5d5485d10b48.1691125344.git.geliang.tang@suse.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
In-Reply-To: <15d7646940fcbb8477b1be1aa11a5d5485d10b48.1691125344.git.geliang.tang@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sat, 05 Aug 2023 08:50:27 +0000
Subject: Re: [apparmor] [PATCH bpf-next v11 2/5] selftests/bpf: Use random
 netns name for mptcp
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
Cc: linux-kselftest@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 James Morris <jmorris@namei.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Mykola Lysenko <mykolal@fb.com>, Paul Moore <paul@paul-moore.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Mat Martineau <martineau@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Florent Revest <revest@chromium.org>, Simon Horman <horms@kernel.org>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 KP Singh <kpsingh@kernel.org>, Brendan Jackman <jackmanb@chromium.org>,
 Jakub Kicinski <kuba@kernel.org>, Eric Paris <eparis@parisplace.org>,
 mptcp@lists.linux.dev, Hao Luo <haoluo@google.com>, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 linux-security-module@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
 Matthieu Baerts <matthieu.baerts@tessares.net>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 8/3/23 10:07 PM, Geliang Tang wrote:
> Use rand() to generate a random netns name instead of using the fixed
> name "mptcp_ns" for every test.
> 
> By doing that, we can re-launch the test even if there was an issue
> removing the previous netns or if by accident, a netns with this generic
> name already existed on the system.
> 
> Note that using a different name each will also help adding more
> subtests in future commits.

I run test_progs repeatedly without rebooting qemu to save time. If there is a 
test did not clean up its netns, I would rather uncover it earlier and fix it 
instead. Randomizing the name is hiding the issue and does not help to uncover 
the broken test sooner. Although this change is to mptcp test alone, this could 
be referred in other future tests.

afaik, I don't remember bpf CI ever run into a test failure because the picked 
name had already been used by the system. It seems you ran into this issue a lot 
with the mptcp test in your setup. Could you explain a little more?


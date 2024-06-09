Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D85E901998
	for <lists+apparmor@lfdr.de>; Mon, 10 Jun 2024 05:47:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sGW0B-0005SD-Q5; Mon, 10 Jun 2024 03:47:23 +0000
Received: from flow3-smtp.messagingengine.com ([103.168.172.138])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jcalmels@3xx0.net>) id 1sGFxj-0001zh-2z
 for apparmor@lists.ubuntu.com; Sun, 09 Jun 2024 10:39:47 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailflow.nyi.internal (Postfix) with ESMTP id E12AC200151;
 Sun,  9 Jun 2024 06:39:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sun, 09 Jun 2024 06:39:45 -0400
X-ME-Sender: <xms:cYZlZk0NrIt22oj_PCTv7GPk8BKAdSC4CvBNBtXMlKrOds-jXCX6kg>
 <xme:cYZlZvHzJl2uMqjDCy3roIoo-wPALzr84HqJipIzv4B8BezJaghk90YZwAoLHZaiY
 m6JB2LvR0uL0Rgub5A>
X-ME-Received: <xmr:cYZlZs67TIAQXuRvS4LNJsxIfRhJCMyiWqLUXp3W9CszFQYAOSHyy3BskIrFs2z4wP4f_IFOCGRfLW-6pzjocKeQK7xB5wKEeX-c2uzDAIy6Cw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtjedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeflohhnrght
 hhgrnhcuvegrlhhmvghlshcuoehjtggrlhhmvghlshesfeiggidtrdhnvghtqeenucggtf
 frrghtthgvrhhnpefhieevtdektdekvdfftdetudejvdejudekffelvdegteejueeujeeu
 fefhieegfeenucffohhmrghinhepphgrmhgptggrphdrshhopdhkvghrnhgvlhdrohhrgh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjtggr
 lhhmvghlshesfeiggidtrdhnvght
X-ME-Proxy: <xmx:cYZlZt12MpxahFlMi53JTtlMs2HyPQa9_US94TsFreIjarv_5keVTg>
 <xmx:cYZlZnHuRk7vWBuaU_r-RtQjzMj_tt4zI_yGC5SVMw6LoOjX-kDXRA>
 <xmx:cYZlZm-of11IqdzrJfcOfQNEqi19HaNDmVivU5F753rXVxPN1UYGtw>
 <xmx:cYZlZskCoHs4JNkY3J6Og298J1wP6jL-wswP_utkz1mzpGJkfCz-1Q>
 <xmx:cYZlZnGSnk2LavPUrcuXBV7haSMyAl3K3F7V8QEGPjlkJBm2S4l_yIuo>
Feedback-ID: i76614979:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Jun 2024 06:39:41 -0400 (EDT)
From: Jonathan Calmels <jcalmels@3xx0.net>
To: brauner@kernel.org,	ebiederm@xmission.com,
 Jonathan Corbet <corbet@lwn.net>,	Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>,	"Serge E. Hallyn" <serge@hallyn.com>,
 KP Singh <kpsingh@kernel.org>,	Matt Bobrowski <mattbobrowski@google.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>,	Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@google.com>,	Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>,	Luis Chamberlain <mcgrof@kernel.org>,
 Kees Cook <kees@kernel.org>,	Joel Granados <j.granados@samsung.com>,
 John Johansen <john.johansen@canonical.com>,
 David Howells <dhowells@redhat.com>,	Jarkko Sakkinen <jarkko@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,	Mykola Lysenko <mykolal@fb.com>,
 Shuah Khan <shuah@kernel.org>
Date: Sun,  9 Jun 2024 03:43:33 -0700
Message-ID: <20240609104355.442002-1-jcalmels@3xx0.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.138; envelope-from=jcalmels@3xx0.net;
 helo=flow3-smtp.messagingengine.com
X-Mailman-Approved-At: Mon, 10 Jun 2024 03:47:22 +0000
Subject: [apparmor] [PATCH v2 0/4] Introduce user namespace capabilities
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
Cc: Jonathan Calmels <jcalmels@3xx0.net>, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, containers@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This patch series introduces a new user namespace capability set, as
well as some plumbing around it (i.e. sysctl, secbit, lsm support).

First patch goes over the motivations for this as well as prior art.

In summary, while user namespaces are a great success today in that they
avoid running a lot of code as root, they also expand the attack surface
of the kernel substantially which is often abused by attackers. 
Methods exist to limit the creation of such namespaces [1], however,
application developers often need to assume that user namespaces are
available for various tasks such as sandboxing. Thus, instead of
restricting the creation of user namespaces, we offer ways for userspace
to limit the capabilities granted to them.

Why a new capability set and not something specific to the userns (e.g.
ioctl_ns)?

    1. We can't really expect userspace to patch every single callsite
    and opt-in this new security mechanism. 

    2. We don't necessarily want policies enforced at said callsites.
    For example a service like systemd-machined or a PAM session need to
    be able to place restrictions on any namespace spawned under it.

    3. We would need to come up with inheritance rules, querying
    capabilities, etc. At this point we're just reinventing capability
    sets.

    4. We can easily define interactions between capability sets, thus
    helping with adoption (patch 2 is an example of this)

Some examples of how this could be leveraged in userspace:

    - Prevent user from getting CAP_NET_ADMIN in user namespaces under SSH:
        echo "auth optional pam_cap.so" >> /etc/pam.d/sshd
        echo "!cap_net_admin $USER"     >> /etc/security/capability.conf
        capsh --secbits=$((1 << 8)) -- -c /usr/sbin/sshd

    - Prevent containers from ever getting CAP_DAC_OVERRIDE:
        systemd-run -p CapabilityBoundingSet=~CAP_DAC_OVERRIDE \
                    -p SecureBits=userns-strict-caps \
                    /usr/bin/dockerd
        systemd-run -p UserNSCapabilities=~CAP_DAC_OVERRIDE \
                    /usr/bin/incusd

    - Kernel could be vulnerable to CAP_SYS_RAWIO exploits, prevent it:
        sysctl -w cap_bound_userns_mask=0x1fffffdffff

    - Drop CAP_SYS_ADMIN for this shell and all the user namespaces below it:
        bwrap --unshare-user --cap-drop CAP_SYS_ADMIN /bin/sh

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7cd4c5c2101cb092db00f61f69d24380cf7a0ee8

---
Changes since v1:
- Add documentation
- Change commit wording
- Cleanup various aspects of the code based on feedback
- Add new CAP_SYS_CONTROL capability for sysctl check
- Add BPF-LSM support for modifying userns capabilities
---
Jonathan Calmels (4):
  capabilities: Add user namespace capabilities
  capabilities: Add securebit to restrict userns caps
  capabilities: Add sysctl to mask off userns caps
  bpf,lsm: Allow editing capabilities in BPF-LSM hooks

 Documentation/filesystems/proc.rst            |  1 +
 Documentation/security/credentials.rst        |  6 ++
 fs/proc/array.c                               |  9 +++
 include/linux/cred.h                          |  3 +
 include/linux/lsm_hook_defs.h                 |  2 +-
 include/linux/securebits.h                    |  1 +
 include/linux/security.h                      |  4 +-
 include/linux/user_namespace.h                |  7 ++
 include/uapi/linux/capability.h               |  6 +-
 include/uapi/linux/prctl.h                    |  7 ++
 include/uapi/linux/securebits.h               | 11 ++-
 kernel/bpf/bpf_lsm.c                          | 55 +++++++++++++
 kernel/cred.c                                 |  3 +
 kernel/sysctl.c                               | 10 +++
 kernel/umh.c                                  | 15 ++++
 kernel/user_namespace.c                       | 80 +++++++++++++++++--
 security/apparmor/lsm.c                       |  2 +-
 security/commoncap.c                          | 62 +++++++++++++-
 security/keys/process_keys.c                  |  3 +
 security/security.c                           |  6 +-
 security/selinux/hooks.c                      |  2 +-
 security/selinux/include/classmap.h           |  5 +-
 .../selftests/bpf/prog_tests/deny_namespace.c | 12 ++-
 .../selftests/bpf/progs/test_deny_namespace.c |  7 +-
 24 files changed, 291 insertions(+), 28 deletions(-)

-- 
2.45.2



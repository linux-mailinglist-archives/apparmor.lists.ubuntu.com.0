Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CC2901996
	for <lists+apparmor@lfdr.de>; Mon, 10 Jun 2024 05:47:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sGW0C-0005SY-5h; Mon, 10 Jun 2024 03:47:24 +0000
Received: from flow3-smtp.messagingengine.com ([103.168.172.138])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jcalmels@3xx0.net>) id 1sGFyh-0002BC-9R
 for apparmor@lists.ubuntu.com; Sun, 09 Jun 2024 10:40:47 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailflow.nyi.internal (Postfix) with ESMTP id 9032220022F;
 Sun,  9 Jun 2024 06:40:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 09 Jun 2024 06:40:46 -0400
X-ME-Sender: <xms:roZlZl8SSrn_X2NOLMD0X-89hVfdgASYA-VVRRVgcPXh46p-ADZTwA>
 <xme:roZlZptIlQp8BCH6PGOz5vM-6dC6KZrt4wRfBIINK7iWqmIbJhNIyuc-QjbK5zhir
 sjUrEcPJ9864LgPhVc>
X-ME-Received: <xmr:roZlZjCED_ECy-jnKPscx_Rvl6ipU6ijToJjRSUmMByv7WHAAFTKUSeh02t5JL7wzBVkMRs1QecJJ1JBQGd6ri4zxpYAnlDeVk3NI6IxWJ4qPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtjedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfhonhgr
 thhhrghnucevrghlmhgvlhhsuceojhgtrghlmhgvlhhsseefgiigtddrnhgvtheqnecugg
 ftrfgrthhtvghrnheptdejhfelheejfeeutdekgeevueetkedtgfelkeejgfffhefgveet
 teffueegvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepjhgtrghlmhgvlhhsseefgiigtddrnhgvth
X-ME-Proxy: <xmx:roZlZpfUgVWOYtct_JnPNQGNb0kjaMW3HU2VaIGPwQRgv-jQ98wg9g>
 <xmx:roZlZqPyvjbydjqLroTQoDPHWqgvWuvV875RCZ5Y_XrIR4LSTZjooA>
 <xmx:roZlZrlddmZj3M-TNocOUb1PCbO1MATKIycI9VKxzLmTG7NNLzUEdQ>
 <xmx:roZlZkuvwz8Fzfb_R7p1tpVmNry6dEgArKwL0WRGK-m2TjHVI8W_gw>
 <xmx:roZlZsvRo6FdPig-7nlT45k7K3rGBJ74F6yCoXMTIgHJlNemswh2Eti8>
Feedback-ID: i76614979:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Jun 2024 06:40:41 -0400 (EDT)
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
Date: Sun,  9 Jun 2024 03:43:36 -0700
Message-ID: <20240609104355.442002-4-jcalmels@3xx0.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240609104355.442002-1-jcalmels@3xx0.net>
References: <20240609104355.442002-1-jcalmels@3xx0.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.138; envelope-from=jcalmels@3xx0.net;
 helo=flow3-smtp.messagingengine.com
X-Mailman-Approved-At: Mon, 10 Jun 2024 03:47:22 +0000
Subject: [apparmor] [PATCH v2 3/4] capabilities: Add sysctl to mask off
	userns caps
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

This patch adds a new system-wide userns capability mask designed to mask
off capabilities in user namespaces.

This mask is controlled through a sysctl and can be set early in the boot
process or on the kernel command line to exclude known capabilities from
ever being gained in namespaces. Once set, it can be further restricted to
exert dynamic policies on the system (e.g. ward off a potential exploit).

Changing this mask requires privileges in the initial user namespace
over the newly introduced CAP_SYS_CONTROL.

Example:

    # sysctl -qw kernel.cap_userns_mask=0x1fffffdffff && \
      unshare -r grep Cap /proc/self/status
    CapInh: 0000000000000000
    CapPrm: 000001fffffdffff
    CapEff: 000001fffffdffff
    CapBnd: 000001fffffdffff
    CapAmb: 0000000000000000
    CapUNs: 000001fffffdffff

Signed-off-by: Jonathan Calmels <jcalmels@3xx0.net>
---
 include/linux/user_namespace.h      |  7 ++++
 include/uapi/linux/capability.h     |  6 ++-
 kernel/sysctl.c                     | 10 +++++
 kernel/user_namespace.c             | 63 +++++++++++++++++++++++++++++
 security/selinux/include/classmap.h |  5 ++-
 5 files changed, 88 insertions(+), 3 deletions(-)

diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.h
index 6030a8235617..d958d4819608 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_USER_NAMESPACE_H
 #define _LINUX_USER_NAMESPACE_H
 
+#include <linux/capability.h>
 #include <linux/kref.h>
 #include <linux/nsproxy.h>
 #include <linux/ns_common.h>
@@ -14,6 +15,12 @@
 #define UID_GID_MAP_MAX_BASE_EXTENTS 5
 #define UID_GID_MAP_MAX_EXTENTS 340
 
+#ifdef CONFIG_SYSCTL
+extern kernel_cap_t cap_userns_mask;
+int cap_userns_sysctl_handler(const struct ctl_table *table, int write,
+			      void *buffer, size_t *lenp, loff_t *ppos);
+#endif
+
 struct uid_gid_extent {
 	u32 first;
 	u32 lower_first;
diff --git a/include/uapi/linux/capability.h b/include/uapi/linux/capability.h
index 5bb906098697..e2c5e4bb2eb0 100644
--- a/include/uapi/linux/capability.h
+++ b/include/uapi/linux/capability.h
@@ -418,7 +418,11 @@ struct vfs_ns_cap_data {
 
 #define CAP_CHECKPOINT_RESTORE	40
 
-#define CAP_LAST_CAP         CAP_CHECKPOINT_RESTORE
+/* Allow setting the system userns capability mask. */
+
+#define CAP_SYS_CONTROL		41
+
+#define CAP_LAST_CAP         CAP_SYS_CONTROL
 
 #define cap_valid(x) ((x) >= 0 && (x) <= CAP_LAST_CAP)
 
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index e0b917328cf9..95b27a92c63c 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -62,6 +62,7 @@
 #include <linux/sched/sysctl.h>
 #include <linux/mount.h>
 #include <linux/userfaultfd_k.h>
+#include <linux/user_namespace.h>
 #include <linux/pid.h>
 
 #include "../lib/kstrtox.h"
@@ -1846,6 +1847,15 @@ static struct ctl_table kern_table[] = {
 		.mode		= 0444,
 		.proc_handler	= proc_dointvec,
 	},
+#ifdef CONFIG_USER_NS
+	{
+		.procname	= "cap_userns_mask",
+		.data		= &cap_userns_mask,
+		.maxlen		= sizeof(kernel_cap_t),
+		.mode		= 0644,
+		.proc_handler	= cap_userns_sysctl_handler,
+	},
+#endif
 #if defined(CONFIG_X86_LOCAL_APIC) && defined(CONFIG_X86)
 	{
 		.procname       = "unknown_nmi_panic",
diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 53848e2b68cd..e513d87ed102 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -26,6 +26,63 @@
 static struct kmem_cache *user_ns_cachep __ro_after_init;
 static DEFINE_MUTEX(userns_state_mutex);
 
+#ifdef CONFIG_SYSCTL
+static DEFINE_SPINLOCK(cap_userns_lock);
+kernel_cap_t cap_userns_mask = CAP_FULL_SET;
+
+int cap_userns_sysctl_handler(const struct ctl_table *table, int write,
+			      void *buffer, size_t *lenp, loff_t *ppos)
+{
+	struct ctl_table t;
+	unsigned long mask_array[2];
+	kernel_cap_t new_mask, *mask;
+	int err;
+
+	if (write && !capable(CAP_SYS_CONTROL))
+		return -EPERM;
+
+	/*
+	 * convert from the global kernel_cap_t to the ulong array to print to
+	 * userspace if this is a read.
+	 *
+	 * capabilities are exposed as one 64-bit value or two 32-bit values
+	 * depending on the architecture
+	 */
+	mask = table->data;
+	spin_lock(&cap_userns_lock);
+	mask_array[0] = (unsigned long) mask->val;
+	if (BITS_PER_LONG != 64)
+		mask_array[1] = mask->val >> BITS_PER_LONG;
+	spin_unlock(&cap_userns_lock);
+
+	t = *table;
+	t.data = &mask_array;
+
+	/*
+	 * actually read or write and array of ulongs from userspace.  Remember
+	 * these are least significant bits first
+	 */
+	err = proc_doulongvec_minmax(&t, write, buffer, lenp, ppos);
+	if (err < 0)
+		return err;
+
+	new_mask.val = mask_array[0];
+	if (BITS_PER_LONG != 64)
+		new_mask.val += (u64)mask_array[1] << BITS_PER_LONG;
+
+	/*
+	 * Drop everything not in the new_mask (but don't add things)
+	 */
+	if (write) {
+		spin_lock(&cap_userns_lock);
+		*mask = cap_intersect(*mask, new_mask);
+		spin_unlock(&cap_userns_lock);
+	}
+
+	return 0;
+}
+#endif
+
 static bool new_idmap_permitted(const struct file *file,
 				struct user_namespace *ns, int cap_setid,
 				struct uid_gid_map *map);
@@ -46,6 +103,12 @@ static void set_cred_user_ns(struct cred *cred, struct user_namespace *user_ns)
 	/* Limit userns capabilities to our parent's bounding set. */
 	if (iscredsecure(cred, SECURE_USERNS_STRICT_CAPS))
 		cred->cap_userns = cap_intersect(cred->cap_userns, cred->cap_bset);
+#ifdef CONFIG_SYSCTL
+	/* Mask off userns capabilities that are not permitted by the system-wide mask. */
+	spin_lock(&cap_userns_lock);
+	cred->cap_userns = cap_intersect(cred->cap_userns, cap_userns_mask);
+	spin_unlock(&cap_userns_lock);
+#endif
 
 	/* Start with the capabilities defined in the userns set. */
 	cred->cap_bset = cred->cap_userns;
diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
index 7229c9bf6c27..8f3ede7aac92 100644
--- a/security/selinux/include/classmap.h
+++ b/security/selinux/include/classmap.h
@@ -34,9 +34,10 @@
 
 #define COMMON_CAP2_PERMS                                                     \
 	"mac_override", "mac_admin", "syslog", "wake_alarm", "block_suspend", \
-		"audit_read", "perfmon", "bpf", "checkpoint_restore"
+		"audit_read", "perfmon", "bpf", "checkpoint_restore",         \
+		"sys_control"
 
-#if CAP_LAST_CAP > CAP_CHECKPOINT_RESTORE
+#if CAP_LAST_CAP > CAP_SYS_CONTROL
 #error New capability defined, please update COMMON_CAP2_PERMS.
 #endif
 
-- 
2.45.2



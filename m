Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A857A901991
	for <lists+apparmor@lfdr.de>; Mon, 10 Jun 2024 05:47:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sGW0C-0005Sf-C5; Mon, 10 Jun 2024 03:47:24 +0000
Received: from flow3-smtp.messagingengine.com ([103.168.172.138])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jcalmels@3xx0.net>) id 1sGFyq-0002C1-J8
 for apparmor@lists.ubuntu.com; Sun, 09 Jun 2024 10:40:56 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailflow.nyi.internal (Postfix) with ESMTP id D663B200230;
 Sun,  9 Jun 2024 06:40:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 09 Jun 2024 06:40:55 -0400
X-ME-Sender: <xms:t4ZlZo9IflglwKsxJcGvS3ziOgS3xaFQ3VAEPAvKh2WceeCzEUNgog>
 <xme:t4ZlZgt7v1BD6pvWbJOGxp6P5oYLtYMpFdUZy2UT3lyQgTxlsuyR0JVSY1YAGAXzp
 KNyX13OkMH-TQlTJi0>
X-ME-Received: <xmr:t4ZlZuCdl1nCithzrSs8q0izLPKgeIvOzF_PakLTzqgfYeSWrB_dYAsBh04Z_EpsRuex68Q2_rYYgazXh4ACiZmeU1Okl6JH5W1pMBtN3TFaVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtjedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfhonhgr
 thhhrghnucevrghlmhgvlhhsuceojhgtrghlmhgvlhhsseefgiigtddrnhgvtheqnecugg
 ftrfgrthhtvghrnheptdejhfelheejfeeutdekgeevueetkedtgfelkeejgfffhefgveet
 teffueegvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepjhgtrghlmhgvlhhsseefgiigtddrnhgvth
X-ME-Proxy: <xmx:t4ZlZofkyGw2LmydXXIp1AiE0O7P2nlor4vGHogskKoVXSarHEv-Sw>
 <xmx:t4ZlZtNbkskkmKxSAeENTXJ02YNaLtZjd1ZaESnZb-hQYzZqXfracg>
 <xmx:t4ZlZilHO3NbxrikZ_7DiBnaQ0YRebK71s0iefnRYqqYZFyYIlNaEw>
 <xmx:t4ZlZvuzley0VgQKAlY8NKi0iYlWKutjzNB7QguBu32VGnSBYnHPSg>
 <xmx:t4ZlZrvwhdkm2Bf48stWRVtlfQLTgSRRtev1LlVvhO7YtQ3-Y0YKwnfH>
Feedback-ID: i76614979:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Jun 2024 06:40:51 -0400 (EDT)
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
Date: Sun,  9 Jun 2024 03:43:37 -0700
Message-ID: <20240609104355.442002-5-jcalmels@3xx0.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240609104355.442002-1-jcalmels@3xx0.net>
References: <20240609104355.442002-1-jcalmels@3xx0.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.138; envelope-from=jcalmels@3xx0.net;
 helo=flow3-smtp.messagingengine.com
X-Mailman-Approved-At: Mon, 10 Jun 2024 03:47:22 +0000
Subject: [apparmor] [PATCH v2 4/4] bpf,
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
Cc: Jonathan Calmels <jcalmels@3xx0.net>, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, containers@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This patch allows modifying the various capabilities of the struct cred
in BPF-LSM hooks. More specifically, the userns_create hook called
prior to creating a new user namespace.

With the introduction of userns capabilities, this effectively provides
a simple way for LSMs to control the capabilities granted to a user
namespace and all its descendants.

Update the selftests accordingly by dropping CAP_SYS_ADMIN in
namespaces and checking the resulting task's bounding set.

Signed-off-by: Jonathan Calmels <jcalmels@3xx0.net>
---
 include/linux/lsm_hook_defs.h                 |  2 +-
 include/linux/security.h                      |  4 +-
 kernel/bpf/bpf_lsm.c                          | 55 +++++++++++++++++++
 security/apparmor/lsm.c                       |  2 +-
 security/security.c                           |  6 +-
 security/selinux/hooks.c                      |  2 +-
 .../selftests/bpf/prog_tests/deny_namespace.c | 12 ++--
 .../selftests/bpf/progs/test_deny_namespace.c |  7 ++-
 8 files changed, 76 insertions(+), 14 deletions(-)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index f804b76cde44..58d6d8f2511f 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -250,7 +250,7 @@ LSM_HOOK(int, -ENOSYS, task_prctl, int option, unsigned long arg2,
 	 unsigned long arg3, unsigned long arg4, unsigned long arg5)
 LSM_HOOK(void, LSM_RET_VOID, task_to_inode, struct task_struct *p,
 	 struct inode *inode)
-LSM_HOOK(int, 0, userns_create, const struct cred *cred)
+LSM_HOOK(int, 0, userns_create, struct cred *cred)
 LSM_HOOK(int, 0, ipc_permission, struct kern_ipc_perm *ipcp, short flag)
 LSM_HOOK(void, LSM_RET_VOID, ipc_getsecid, struct kern_ipc_perm *ipcp,
 	 u32 *secid)
diff --git a/include/linux/security.h b/include/linux/security.h
index 21cf70346b33..ffb1b0dd2aef 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -465,7 +465,7 @@ int security_task_kill(struct task_struct *p, struct kernel_siginfo *info,
 int security_task_prctl(int option, unsigned long arg2, unsigned long arg3,
 			unsigned long arg4, unsigned long arg5);
 void security_task_to_inode(struct task_struct *p, struct inode *inode);
-int security_create_user_ns(const struct cred *cred);
+int security_create_user_ns(struct cred *cred);
 int security_ipc_permission(struct kern_ipc_perm *ipcp, short flag);
 void security_ipc_getsecid(struct kern_ipc_perm *ipcp, u32 *secid);
 int security_msg_msg_alloc(struct msg_msg *msg);
@@ -1294,7 +1294,7 @@ static inline int security_task_prctl(int option, unsigned long arg2,
 static inline void security_task_to_inode(struct task_struct *p, struct inode *inode)
 { }
 
-static inline int security_create_user_ns(const struct cred *cred)
+static inline int security_create_user_ns(struct cred *cred)
 {
 	return 0;
 }
diff --git a/kernel/bpf/bpf_lsm.c b/kernel/bpf/bpf_lsm.c
index 68240c3c6e7d..6edba93ff883 100644
--- a/kernel/bpf/bpf_lsm.c
+++ b/kernel/bpf/bpf_lsm.c
@@ -382,10 +382,65 @@ bool bpf_lsm_is_trusted(const struct bpf_prog *prog)
 	return !btf_id_set_contains(&untrusted_lsm_hooks, prog->aux->attach_btf_id);
 }
 
+static int bpf_lsm_btf_struct_access(struct bpf_verifier_log *log,
+				     const struct bpf_reg_state *reg,
+				     int off, int size)
+{
+	const struct btf_type *cred;
+	const struct btf_type *t;
+	s32 type_id;
+	size_t end;
+
+	type_id = btf_find_by_name_kind(reg->btf, "cred", BTF_KIND_STRUCT);
+	if (type_id < 0)
+		return -EINVAL;
+
+	t = btf_type_by_id(reg->btf, reg->btf_id);
+	cred = btf_type_by_id(reg->btf, type_id);
+	if (t != cred) {
+		bpf_log(log, "only read is supported\n");
+		return -EACCES;
+	}
+
+	switch (off) {
+	case offsetof(struct cred, cap_inheritable):
+		end = offsetofend(struct cred, cap_inheritable);
+		break;
+	case offsetof(struct cred, cap_permitted):
+		end = offsetofend(struct cred, cap_permitted);
+		break;
+	case offsetof(struct cred, cap_effective):
+		end = offsetofend(struct cred, cap_effective);
+		break;
+	case offsetof(struct cred, cap_bset):
+		end = offsetofend(struct cred, cap_bset);
+		break;
+	case offsetof(struct cred, cap_ambient):
+		end = offsetofend(struct cred, cap_ambient);
+		break;
+	case offsetof(struct cred, cap_userns):
+		end = offsetofend(struct cred, cap_userns);
+		break;
+	default:
+		bpf_log(log, "no write support to cred at off %d\n", off);
+		return -EACCES;
+	}
+
+	if (off + size > end) {
+		bpf_log(log,
+			"write access at off %d with size %d beyond the member of cred ended at %zu\n",
+			off, size, end);
+		return -EACCES;
+	}
+
+	return 0;
+}
+
 const struct bpf_prog_ops lsm_prog_ops = {
 };
 
 const struct bpf_verifier_ops lsm_verifier_ops = {
 	.get_func_proto = bpf_lsm_func_proto,
 	.is_valid_access = btf_ctx_access,
+	.btf_struct_access = bpf_lsm_btf_struct_access,
 };
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 6239777090c4..310c9fa3d4b4 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1036,7 +1036,7 @@ static int apparmor_task_kill(struct task_struct *target, struct kernel_siginfo
 	return error;
 }
 
-static int apparmor_userns_create(const struct cred *cred)
+static int apparmor_userns_create(struct cred *cred)
 {
 	struct aa_label *label;
 	struct aa_profile *profile;
diff --git a/security/security.c b/security/security.c
index e5da848c50b9..83cf2025c58e 100644
--- a/security/security.c
+++ b/security/security.c
@@ -3558,14 +3558,14 @@ void security_task_to_inode(struct task_struct *p, struct inode *inode)
 }
 
 /**
- * security_create_user_ns() - Check if creating a new userns is allowed
+ * security_create_user_ns() - Review permissions prior to userns creation
  * @cred: prepared creds
  *
- * Check permission prior to creating a new user namespace.
+ * Check and/or modify permissions prior to creating a new user namespace.
  *
  * Return: Returns 0 if successful, otherwise < 0 error code.
  */
-int security_create_user_ns(const struct cred *cred)
+int security_create_user_ns(struct cred *cred)
 {
 	return call_int_hook(userns_create, cred);
 }
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 7eed331e90f0..28deb9510d8e 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -4263,7 +4263,7 @@ static void selinux_task_to_inode(struct task_struct *p,
 	spin_unlock(&isec->lock);
 }
 
-static int selinux_userns_create(const struct cred *cred)
+static int selinux_userns_create(struct cred *cred)
 {
 	u32 sid = current_sid();
 
diff --git a/tools/testing/selftests/bpf/prog_tests/deny_namespace.c b/tools/testing/selftests/bpf/prog_tests/deny_namespace.c
index 1bc6241b755b..1500578f9a30 100644
--- a/tools/testing/selftests/bpf/prog_tests/deny_namespace.c
+++ b/tools/testing/selftests/bpf/prog_tests/deny_namespace.c
@@ -5,6 +5,8 @@
 #include <sched.h>
 #include "cap_helpers.h"
 #include <stdio.h>
+#include <stdbool.h>
+#include <sys/prctl.h>
 
 static int wait_for_pid(pid_t pid)
 {
@@ -29,7 +31,7 @@ static int wait_for_pid(pid_t pid)
  * positive return value -> userns creation failed
  * 0                     -> userns creation succeeded
  */
-static int create_user_ns(void)
+static int create_user_ns(bool bpf)
 {
 	pid_t pid;
 
@@ -40,6 +42,8 @@ static int create_user_ns(void)
 	if (pid == 0) {
 		if (unshare(CLONE_NEWUSER))
 			_exit(EXIT_FAILURE);
+		if (bpf && prctl(PR_CAPBSET_READ, CAP_SYS_ADMIN))
+			_exit(EXIT_FAILURE);
 		_exit(EXIT_SUCCESS);
 	}
 
@@ -53,11 +57,11 @@ static void test_userns_create_bpf(void)
 
 	cap_enable_effective(cap_mask, &old_caps);
 
-	ASSERT_OK(create_user_ns(), "priv new user ns");
+	ASSERT_OK(create_user_ns(true), "priv new user ns");
 
 	cap_disable_effective(cap_mask, &old_caps);
 
-	ASSERT_EQ(create_user_ns(), EPERM, "unpriv new user ns");
+	ASSERT_EQ(create_user_ns(true), EPERM, "unpriv new user ns");
 
 	if (cap_mask & old_caps)
 		cap_enable_effective(cap_mask, NULL);
@@ -70,7 +74,7 @@ static void test_unpriv_userns_create_no_bpf(void)
 
 	cap_disable_effective(cap_mask, &old_caps);
 
-	ASSERT_OK(create_user_ns(), "no-bpf unpriv new user ns");
+	ASSERT_OK(create_user_ns(false), "no-bpf unpriv new user ns");
 
 	if (cap_mask & old_caps)
 		cap_enable_effective(cap_mask, NULL);
diff --git a/tools/testing/selftests/bpf/progs/test_deny_namespace.c b/tools/testing/selftests/bpf/progs/test_deny_namespace.c
index e96b901a733c..051906f80f4c 100644
--- a/tools/testing/selftests/bpf/progs/test_deny_namespace.c
+++ b/tools/testing/selftests/bpf/progs/test_deny_namespace.c
@@ -9,12 +9,13 @@ typedef struct { unsigned long long val; } kernel_cap_t;
 
 struct cred {
 	kernel_cap_t cap_effective;
+	kernel_cap_t cap_userns;
 } __attribute__((preserve_access_index));
 
 char _license[] SEC("license") = "GPL";
 
 SEC("lsm.s/userns_create")
-int BPF_PROG(test_userns_create, const struct cred *cred, int ret)
+int BPF_PROG(test_userns_create, struct cred *cred, int ret)
 {
 	kernel_cap_t caps = cred->cap_effective;
 	__u64 cap_mask = 1ULL << CAP_SYS_ADMIN;
@@ -23,8 +24,10 @@ int BPF_PROG(test_userns_create, const struct cred *cred, int ret)
 		return 0;
 
 	ret = -EPERM;
-	if (caps.val & cap_mask)
+	if (caps.val & cap_mask) {
+		cred->cap_userns.val &= ~cap_mask;
 		return 0;
+	}
 
 	return -EPERM;
 }
-- 
2.45.2



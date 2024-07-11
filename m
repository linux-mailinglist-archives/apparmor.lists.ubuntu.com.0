Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BF65C92E6D8
	for <lists+apparmor@lfdr.de>; Thu, 11 Jul 2024 13:34:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sRs4B-0004B2-MN; Thu, 11 Jul 2024 11:34:27 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <xukuohai@huaweicloud.com>)
 id 1sRs2z-00042a-TY
 for apparmor@lists.ubuntu.com; Thu, 11 Jul 2024 11:33:14 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4WKXf267dHz4f3jrt
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:32:58 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 8A9C81A0572
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:33:10 +0800 (CST)
Received: from k01.huawei.com (unknown [10.67.174.197])
 by APP4 (Coremail) with SMTP id gCh0CgDXKvT0wo9mzI8hBw--.25380S2;
 Thu, 11 Jul 2024 19:33:10 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-integrity@vger.kernel.org, apparmor@lists.ubuntu.com,
 selinux@vger.kernel.org
Date: Thu, 11 Jul 2024 19:38:21 +0800
Message-Id: <20240711113828.3818398-1-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgDXKvT0wo9mzI8hBw--.25380S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr1UAr1rGrykuFW8Ar4xJFb_yoWfArWxpF
 sxGryDAr4vvrW3uFnrtan7ZF1rJry0g3yIkF9rGryFyFWav3s5XF1qgryjvr1fCrWDCw1x
 Gr4jgrW5u347ZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkIb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
 x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IY
 c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI
 42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42
 IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2
 z280aVCY1x0267AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7IU1c4S7UUUUU==
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
Received-SPF: pass client-ip=45.249.212.56;
 envelope-from=xukuohai@huaweicloud.com; helo=dggsgout12.his.huawei.com
X-Mailman-Approved-At: Thu, 11 Jul 2024 11:34:25 +0000
Subject: [apparmor] [PATCH bpf-next v4 13/20] bpf,
	lsm: Add check for BPF LSM return value
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
 Shung-Hsi Yu <shung-hsi.yu@suse.com>, Alexei Starovoitov <ast@kernel.org>,
 James Morris <jmorris@namei.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, Anna Schumaker <anna@kernel.org>,
 Paul Moore <paul@paul-moore.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Edward Cree <ecree.xilinx@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E . Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>,
 KP Singh <kpsingh@kernel.org>, Brendan Jackman <jackmanb@chromium.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, Hao Luo <haoluo@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, Eduard Zingerman <eddyz87@gmail.com>,
 Khadija Kamran <kamrankhadijadj@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: Xu Kuohai <xukuohai@huawei.com>

A bpf prog returning a positive number attached to file_alloc_security
hook makes kernel panic.

This happens because file system can not filter out the positive number
returned by the LSM prog using IS_ERR, and misinterprets this positive
number as a file pointer.

Given that hook file_alloc_security never returned positive number
before the introduction of BPF LSM, and other BPF LSM hooks may
encounter similar issues, this patch adds LSM return value check
in verifier, to ensure no unexpected value is returned.

Fixes: 520b7aa00d8c ("bpf: lsm: Initialize the BPF LSM hooks")
Reported-by: Xin Liu <liuxin350@huawei.com>
Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
Acked-by: Eduard Zingerman <eddyz87@gmail.com>
---
 include/linux/bpf.h     |  1 +
 include/linux/bpf_lsm.h |  9 +++++++
 kernel/bpf/bpf_lsm.c    | 30 ++++++++++++++++++++-
 kernel/bpf/btf.c        |  5 +++-
 kernel/bpf/verifier.c   | 60 ++++++++++++++++++++++++++++++++++-------
 5 files changed, 94 insertions(+), 11 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 4f1d4a97b9d1..d255201035c4 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -927,6 +927,7 @@ struct bpf_insn_access_aux {
 		};
 	};
 	struct bpf_verifier_log *log; /* for verbose logs */
+	bool is_retval; /* is accessing function return value ? */
 };
 
 static inline void
diff --git a/include/linux/bpf_lsm.h b/include/linux/bpf_lsm.h
index 73e1f6dbec4a..ca5f2176c940 100644
--- a/include/linux/bpf_lsm.h
+++ b/include/linux/bpf_lsm.h
@@ -9,6 +9,7 @@
 
 #include <linux/sched.h>
 #include <linux/bpf.h>
+#include <linux/bpf_verifier.h>
 #include <linux/lsm_hooks.h>
 
 #ifdef CONFIG_BPF_LSM
@@ -47,6 +48,8 @@ void bpf_lsm_find_cgroup_shim(const struct bpf_prog *prog, bpf_func_t *bpf_func)
 
 bool bpf_lsm_has_retval_param(const struct bpf_prog *prog);
 
+int bpf_lsm_get_retval_range(const struct bpf_prog *prog,
+			     struct bpf_retval_range *range);
 #else /* !CONFIG_BPF_LSM */
 
 static inline bool bpf_lsm_is_sleepable_hook(u32 btf_id)
@@ -84,6 +87,12 @@ static inline bool bpf_lsm_has_retval_param(const struct bpf_prog *prog)
 {
 	return false;
 }
+
+static inline int bpf_lsm_get_retval_range(const struct bpf_prog *prog,
+					   struct bpf_retval_range *range)
+{
+	return -EOPNOTSUPP;
+}
 #endif /* CONFIG_BPF_LSM */
 
 #endif /* _LINUX_BPF_LSM_H */
diff --git a/kernel/bpf/bpf_lsm.c b/kernel/bpf/bpf_lsm.c
index a8f8358c77e3..9dd338099d4a 100644
--- a/kernel/bpf/bpf_lsm.c
+++ b/kernel/bpf/bpf_lsm.c
@@ -11,7 +11,6 @@
 #include <linux/lsm_hooks.h>
 #include <linux/bpf_lsm.h>
 #include <linux/kallsyms.h>
-#include <linux/bpf_verifier.h>
 #include <net/bpf_sk_storage.h>
 #include <linux/bpf_local_storage.h>
 #include <linux/btf_ids.h>
@@ -420,3 +419,32 @@ bool bpf_lsm_has_retval_param(const struct bpf_prog *prog)
 	return btf_id_set_contains(&retval_param_lsm_hooks,
 				   prog->aux->attach_btf_id);
 }
+
+/* hooks return 0 or 1 */
+BTF_SET_START(bool_lsm_hooks)
+BTF_ID(func, bpf_lsm_xfrm_state_pol_flow_match)
+BTF_ID(func, bpf_lsm_audit_rule_known)
+BTF_ID(func, bpf_lsm_inode_xattr_skipcap)
+BTF_SET_END(bool_lsm_hooks)
+
+int bpf_lsm_get_retval_range(const struct bpf_prog *prog,
+			     struct bpf_retval_range *retval_range)
+{
+	/* no return value range for void hooks */
+	if (!prog->aux->attach_func_proto->type)
+		return -EINVAL;
+
+	if (btf_id_set_contains(&bool_lsm_hooks, prog->aux->attach_btf_id)) {
+		retval_range->minval = 0;
+		retval_range->maxval = 1;
+	} else {
+		/* All other LSM hooks, except task_prctl, return 0 on success
+		 * and negative error code on failure.
+		 * To keep things simple, we only allow bpf progs to return 0
+		 * or negative errno for task_prctl.
+		 */
+		retval_range->minval = -MAX_ERRNO;
+		retval_range->maxval = 0;
+	}
+	return 0;
+}
diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index df299d600b10..ce892565367d 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -6416,8 +6416,11 @@ bool btf_ctx_access(int off, int size, enum bpf_access_type type,
 
 	if (arg == nr_args) {
 		switch (prog->expected_attach_type) {
-		case BPF_LSM_CGROUP:
 		case BPF_LSM_MAC:
+			/* mark we are accessing the return value */
+			info->is_retval = true;
+			fallthrough;
+		case BPF_LSM_CGROUP:
 		case BPF_TRACE_FEXIT:
 			/* When LSM programs are attached to void LSM hooks
 			 * they use FEXIT trampolines and when attached to
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index a0bbef2d14e4..6f5d8ca995d6 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -2334,6 +2334,25 @@ static void mark_reg_unknown(struct bpf_verifier_env *env,
 	__mark_reg_unknown(env, regs + regno);
 }
 
+static int __mark_reg_s32_range(struct bpf_verifier_env *env,
+				struct bpf_reg_state *regs,
+				u32 regno,
+				s32 s32_min,
+				s32 s32_max)
+{
+	struct bpf_reg_state *reg = regs + regno;
+
+	reg->s32_min_value = max_t(s32, reg->s32_min_value, s32_min);
+	reg->s32_max_value = min_t(s32, reg->s32_max_value, s32_max);
+
+	reg->smin_value = max_t(s64, reg->smin_value, s32_min);
+	reg->smax_value = min_t(s64, reg->smax_value, s32_max);
+
+	reg_bounds_sync(reg);
+
+	return reg_bounds_sanity_check(env, reg, "s32_range");
+}
+
 static void __mark_reg_not_init(const struct bpf_verifier_env *env,
 				struct bpf_reg_state *reg)
 {
@@ -5587,11 +5606,12 @@ static int check_packet_access(struct bpf_verifier_env *env, u32 regno, int off,
 /* check access to 'struct bpf_context' fields.  Supports fixed offsets only */
 static int check_ctx_access(struct bpf_verifier_env *env, int insn_idx, int off, int size,
 			    enum bpf_access_type t, enum bpf_reg_type *reg_type,
-			    struct btf **btf, u32 *btf_id)
+			    struct btf **btf, u32 *btf_id, bool *is_retval)
 {
 	struct bpf_insn_access_aux info = {
 		.reg_type = *reg_type,
 		.log = &env->log,
+		.is_retval = false,
 	};
 
 	if (env->ops->is_valid_access &&
@@ -5604,6 +5624,7 @@ static int check_ctx_access(struct bpf_verifier_env *env, int insn_idx, int off,
 		 * type of narrower access.
 		 */
 		*reg_type = info.reg_type;
+		*is_retval = info.is_retval;
 
 		if (base_type(*reg_type) == PTR_TO_BTF_ID) {
 			*btf = info.btf;
@@ -6803,6 +6824,17 @@ static int check_stack_access_within_bounds(
 	return grow_stack_state(env, state, -min_off /* size */);
 }
 
+static bool get_func_retval_range(struct bpf_prog *prog,
+				  struct bpf_retval_range *range)
+{
+	if (prog->type == BPF_PROG_TYPE_LSM &&
+		prog->expected_attach_type == BPF_LSM_MAC &&
+		!bpf_lsm_get_retval_range(prog, range)) {
+		return true;
+	}
+	return false;
+}
+
 /* check whether memory at (regno + off) is accessible for t = (read | write)
  * if t==write, value_regno is a register which value is stored into memory
  * if t==read, value_regno is a register which will receive the value from memory
@@ -6907,6 +6939,8 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regn
 		if (!err && value_regno >= 0 && (t == BPF_READ || rdonly_mem))
 			mark_reg_unknown(env, regs, value_regno);
 	} else if (reg->type == PTR_TO_CTX) {
+		bool is_retval = false;
+		struct bpf_retval_range range;
 		enum bpf_reg_type reg_type = SCALAR_VALUE;
 		struct btf *btf = NULL;
 		u32 btf_id = 0;
@@ -6922,7 +6956,7 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regn
 			return err;
 
 		err = check_ctx_access(env, insn_idx, off, size, t, &reg_type, &btf,
-				       &btf_id);
+				       &btf_id, &is_retval);
 		if (err)
 			verbose_linfo(env, insn_idx, "; ");
 		if (!err && t == BPF_READ && value_regno >= 0) {
@@ -6931,7 +6965,14 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regn
 			 * case, we know the offset is zero.
 			 */
 			if (reg_type == SCALAR_VALUE) {
-				mark_reg_unknown(env, regs, value_regno);
+				if (is_retval && get_func_retval_range(env->prog, &range)) {
+					err = __mark_reg_s32_range(env, regs, value_regno,
+								   range.minval, range.maxval);
+					if (err)
+						return err;
+				} else {
+					mark_reg_unknown(env, regs, value_regno);
+				}
 			} else {
 				mark_reg_known_zero(env, regs,
 						    value_regno);
@@ -15782,12 +15823,13 @@ static int check_return_code(struct bpf_verifier_env *env, int regno, const char
 
 	case BPF_PROG_TYPE_LSM:
 		if (env->prog->expected_attach_type != BPF_LSM_CGROUP) {
-			/* Regular BPF_PROG_TYPE_LSM programs can return
-			 * any value.
-			 */
-			return 0;
-		}
-		if (!env->prog->aux->attach_func_proto->type) {
+			/* no range found, any return value is allowed */
+			if (!get_func_retval_range(env->prog, &range))
+				return 0;
+			/* no restricted range, any return value is allowed */
+			if (range.minval == S32_MIN && range.maxval == S32_MAX)
+				return 0;
+		} else if (!env->prog->aux->attach_func_proto->type) {
 			/* Make sure programs that attach to void
 			 * hooks don't try to modify return value.
 			 */
-- 
2.30.2



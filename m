Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2591492E6DF
	for <lists+apparmor@lfdr.de>; Thu, 11 Jul 2024 13:34:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sRs4B-0004BH-RT; Thu, 11 Jul 2024 11:34:27 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <xukuohai@huaweicloud.com>)
 id 1sRs32-00042i-7f
 for apparmor@lists.ubuntu.com; Thu, 11 Jul 2024 11:33:16 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WKXf348wrz4f3mHP
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:32:59 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 7AAFF1A0568
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:33:12 +0800 (CST)
Received: from k01.huawei.com (unknown [10.67.174.197])
 by APP4 (Coremail) with SMTP id gCh0CgDXKvT0wo9mzI8hBw--.25380S5;
 Thu, 11 Jul 2024 19:33:10 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-integrity@vger.kernel.org, apparmor@lists.ubuntu.com,
 selinux@vger.kernel.org
Date: Thu, 11 Jul 2024 19:38:24 +0800
Message-Id: <20240711113828.3818398-4-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240711113828.3818398-1-xukuohai@huaweicloud.com>
References: <20240711113828.3818398-1-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgDXKvT0wo9mzI8hBw--.25380S5
X-Coremail-Antispam: 1UD129KBjvJXoWfGF17ZryrtFyfZF1kWF13CFg_yoWDuFW7pF
 ZxGrnxWw4kAayUZwnFyan8ArZYvF48Aa18C3srA340vry3WFy5Kr15WFyjyasxAr4kGr4S
 qFnxX3y2kw4UZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWw
 A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
 w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
 W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
 Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
 Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij64
 vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
 jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE
 42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
 kF7I0E14v26F4UJVW0obIYCTnIWIevJa73UjIFyTuYvjxUFYFCUUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
Received-SPF: pass client-ip=45.249.212.51;
 envelope-from=xukuohai@huaweicloud.com; helo=dggsgout11.his.huawei.com
X-Mailman-Approved-At: Thu, 11 Jul 2024 11:34:25 +0000
Subject: [apparmor] [PATCH bpf-next v4 16/20] bpf: Add a special case for
	bitwise AND on range [-1, 0]
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

With lsm return value check, the no-alu32 version test_libbpf_get_fd_by_id_opts
is rejected by the verifier, and the log says:

0: R1=ctx() R10=fp0
; int BPF_PROG(check_access, struct bpf_map *map, fmode_t fmode) @ test_libbpf_get_fd_by_id_opts.c:27
0: (b7) r0 = 0                        ; R0_w=0
1: (79) r2 = *(u64 *)(r1 +0)
func 'bpf_lsm_bpf_map' arg0 has btf_id 916 type STRUCT 'bpf_map'
2: R1=ctx() R2_w=trusted_ptr_bpf_map()
; if (map != (struct bpf_map *)&data_input) @ test_libbpf_get_fd_by_id_opts.c:29
2: (18) r3 = 0xffff9742c0951a00       ; R3_w=map_ptr(map=data_input,ks=4,vs=4)
4: (5d) if r2 != r3 goto pc+4         ; R2_w=trusted_ptr_bpf_map() R3_w=map_ptr(map=data_input,ks=4,vs=4)
; int BPF_PROG(check_access, struct bpf_map *map, fmode_t fmode) @ test_libbpf_get_fd_by_id_opts.c:27
5: (79) r0 = *(u64 *)(r1 +8)          ; R0_w=scalar() R1=ctx()
; if (fmode & FMODE_WRITE) @ test_libbpf_get_fd_by_id_opts.c:32
6: (67) r0 <<= 62                     ; R0_w=scalar(smax=0x4000000000000000,umax=0xc000000000000000,smin32=0,smax32=umax32=0,var_off=(0x0; 0xc000000000000000))
7: (c7) r0 s>>= 63                    ; R0_w=scalar(smin=smin32=-1,smax=smax32=0)
;  @ test_libbpf_get_fd_by_id_opts.c:0
8: (57) r0 &= -13                     ; R0_w=scalar(smax=0x7ffffffffffffff3,umax=0xfffffffffffffff3,smax32=0x7ffffff3,umax32=0xfffffff3,var_off=(0x0; 0xfffffffffffffff3))
; int BPF_PROG(check_access, struct bpf_map *map, fmode_t fmode) @ test_libbpf_get_fd_by_id_opts.c:27
9: (95) exit

And here is the C code of the prog.

SEC("lsm/bpf_map")
int BPF_PROG(check_access, struct bpf_map *map, fmode_t fmode)
{
    if (map != (struct bpf_map *)&data_input)
	    return 0;

    if (fmode & FMODE_WRITE)
	    return -EACCES;

    return 0;
}

It is clear that the prog can only return either 0 or -EACCESS, and both
values are legal.

So why is it rejected by the verifier?

The verifier log shows that the second if and return value setting
statements in the prog is optimized to bitwise operations "r0 s>>= 63"
and "r0 &= -13". The verifier correctly deduces that the value of
r0 is in the range [-1, 0] after verifing instruction "r0 s>>= 63".
But when the verifier proceeds to verify instruction "r0 &= -13", it
fails to deduce the correct value range of r0.

7: (c7) r0 s>>= 63                    ; R0_w=scalar(smin=smin32=-1,smax=smax32=0)
8: (57) r0 &= -13                     ; R0_w=scalar(smax=0x7ffffffffffffff3,umax=0xfffffffffffffff3,smax32=0x7ffffff3,umax32=0xfffffff3,var_off=(0x0; 0xfffffffffffffff3))

So why the verifier fails to deduce the result of 'r0 &= -13'?

The verifier uses tnum to track values, and the two ranges "[-1, 0]" and
"[0, -1ULL]" are encoded to the same tnum. When verifing instruction
"r0 &= -13", the verifier erroneously deduces the result from
"[0, -1ULL] AND -13", which is out of the expected return range
[-4095, 0].

As explained by Eduard in [0], the clang transformation that generates this
pattern is located in DAGCombiner::SimplifySelectCC() method (see [1]).

The transformation happens as a part of DAG to DAG rewrites
(LLVM uses several internal representations:
 - generic optimizer uses LLVM IR, most of the work is done
   using this representation;
 - before instruction selection IR is converted to Selection DAG,
   some optimizations are applied at this stage,
   all such optimizations are a set of pattern replacements;
 - Selection DAG is converted to machine code, some optimizations
   are applied at the machine code level).

Full pattern is described as follows:

  // fold (select_cc seteq (and x, y), 0, 0, A) -> (and (sra (shl x)) A)
  // where y is has a single bit set.
  // A plaintext description would be, we can turn the SELECT_CC into an AND
  // when the condition can be materialized as an all-ones register.  Any
  // single bit-test can be materialized as an all-ones register with
  // shift-left and shift-right-arith.

For this particular test case the DAG is converted as follows:

                    .---------------- lhs         The meaning of this select_cc is:
                    |        .------- rhs         `lhs == rhs ? true value : false value`
                    |        | .----- true value
                    |        | |  .-- false value
                    v        v v  v
  (select_cc seteq (and X 2) 0 0 -13)
                          ^
->                        '---------------.
  (and (sra (sll X 62) 63)                |
       -13)                               |
                                          |
Before pattern is applied, it checks that second 'and' operand has
only one bit set, (which is true for '2').

The pattern itself generates logical shift left / arithmetic shift
right pair, that ensures that result is either all ones (-1) or all
zeros (0). Hence, applying 'and' to shifts result and false value
generates a correct result.

As suggested by Eduard and Andrii, this patch makes a special case
for source or destination register of '&=' operation being in
range [-1, 0].

Meaning that one of the '&=' operands is either:
- all ones, in which case the counterpart is the result of the operation;
- all zeros, in which case zero is the result of the operation.

That is, the result is equivalent to adding 0 to the counterpart. And MIN
and MAX values could be deduced based on these observations.

[0] https://lore.kernel.org/bpf/e62e2971301ca7f2e9eb74fc500c520285cad8f5.camel@gmail.com/
[1] https://github.com/llvm/llvm-project/blob/4523a267829c807f3fc8fab8e5e9613985a51565/llvm/lib/CodeGen/SelectionDAG/DAGCombiner.cpp

Suggested-by: Eduard Zingerman <eddyz87@gmail.com>
Suggested-by: Andrii Nakryiko <andrii@kernel.org>
Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
---
 include/linux/tnum.h  |  3 ++
 kernel/bpf/tnum.c     | 25 +++++++++++++++++
 kernel/bpf/verifier.c | 64 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+)

diff --git a/include/linux/tnum.h b/include/linux/tnum.h
index 3c13240077b8..5e795d728b9f 100644
--- a/include/linux/tnum.h
+++ b/include/linux/tnum.h
@@ -52,6 +52,9 @@ struct tnum tnum_mul(struct tnum a, struct tnum b);
 /* Return a tnum representing numbers satisfying both @a and @b */
 struct tnum tnum_intersect(struct tnum a, struct tnum b);
 
+/* Return a tnum representing numbers satisfying either @a or @b */
+struct tnum tnum_union(struct tnum a, struct tnum b);
+
 /* Return @a with all but the lowest @size bytes cleared */
 struct tnum tnum_cast(struct tnum a, u8 size);
 
diff --git a/kernel/bpf/tnum.c b/kernel/bpf/tnum.c
index 9dbc31b25e3d..8028ce06fc1e 100644
--- a/kernel/bpf/tnum.c
+++ b/kernel/bpf/tnum.c
@@ -150,6 +150,31 @@ struct tnum tnum_intersect(struct tnum a, struct tnum b)
 	return TNUM(v & ~mu, mu);
 }
 
+/* Each bit has 3 states: unknown, known 0, known 1. Using x to represent
+ * unknown state, the result of the union of two bits is as follows:
+ *
+ *         | x    0    1
+ *    -----+------------
+ *     x   | x    x    x
+ *     0   | x    0    x
+ *     1   | x    x    1
+ *
+ * For tnum a and b, only the bits that are both known 0 or known 1 in a
+ * and b are known in the result of union a and b.
+ */
+struct tnum tnum_union(struct tnum a, struct tnum b)
+{
+	u64 v0, v1, mu;
+
+	/* unknown bits either in a or b */
+	mu = a.mask | b.mask;
+	/* "known 1" bits in both a and b */
+	v1 = (a.value & b.value) & ~mu;
+	/* "known 0" bits in both a and b */
+	v0 = (~a.value & ~b.value) & ~mu;
+	return TNUM(v1, ~(v0 | v1));
+}
+
 struct tnum tnum_cast(struct tnum a, u8 size)
 {
 	a.value &= (1ULL << (size * 8)) - 1;
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 19ef3d27dbb7..7f4ee3b95f4e 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -13632,6 +13632,39 @@ static void scalar32_min_max_and(struct bpf_reg_state *dst_reg,
 		return;
 	}
 
+	/* special case: dst_reg is in range [-1, 0] */
+	if (dst_reg->s32_min_value == -1 && dst_reg->s32_max_value == 0) {
+		/* the result is equivalent to adding 0 to src_reg */
+		var32_off = tnum_union(src_reg->var_off, tnum_const(0));
+		dst_reg->var_off = tnum_with_subreg(dst_reg->var_off, var32_off);
+		/* update signed min/max to include 0 */
+		dst_reg->s32_min_value = min_t(s32, src_reg->s32_min_value, 0);
+		dst_reg->s32_max_value = max_t(s32, src_reg->s32_max_value, 0);
+		/* since we're adding 0 to src_reg and 0 is the smallest
+		 * unsigned integer, dst_reg->u32_min_value should be 0,
+		 * and dst->u32_max_value should be src_reg->u32_max_value.
+		 */
+		dst_reg->u32_min_value = 0;
+		dst_reg->u32_max_value = src_reg->u32_max_value;
+		return;
+	}
+
+	/* special case: src_reg is in range [-1, 0] */
+	if (src_reg->s32_min_value == -1 && src_reg->s32_max_value == 0) {
+		/* the result is equivalent to adding 0 to dst_reg */
+		var32_off = tnum_union(dst_reg->var_off, tnum_const(0));
+		dst_reg->var_off = tnum_with_subreg(dst_reg->var_off, var32_off);
+		/* update signed min/max to include 0 */
+		dst_reg->s32_min_value = min_t(s32, dst_reg->s32_min_value, 0);
+		dst_reg->s32_max_value = max_t(s32, dst_reg->s32_max_value, 0);
+		/* since we're adding 0 to dst_reg and 0 is the smallest
+		 * unsigned integer, dst_reg->u32_min_value should be 0,
+		 * and dst->u32_max_value should remain unchanged.
+		 */
+		dst_reg->u32_min_value = 0;
+		return;
+	}
+
 	/* We get our minimum from the var_off, since that's inherently
 	 * bitwise.  Our maximum is the minimum of the operands' maxima.
 	 */
@@ -13662,6 +13695,37 @@ static void scalar_min_max_and(struct bpf_reg_state *dst_reg,
 		return;
 	}
 
+	/* special case: dst_reg is in range [-1, 0] */
+	if (dst_reg->smin_value == -1 && dst_reg->smax_value == 0) {
+		/* the result is equivalent to adding 0 to src_reg */
+		dst_reg->var_off = tnum_union(src_reg->var_off, tnum_const(0));
+		/* update signed min/max to include 0 */
+		dst_reg->smin_value = min_t(s64, src_reg->smin_value, 0);
+		dst_reg->smax_value = max_t(s64, src_reg->smax_value, 0);
+		/* since we're adding 0 to src_reg and 0 is the smallest
+		 * unsigned integer, dst_reg->umin_value should be 0,
+		 * and dst->umax_value should be src_reg->umax_value.
+		 */
+		dst_reg->umin_value = 0;
+		dst_reg->umax_value = src_reg->umax_value;
+		return;
+	}
+
+	/* special case: src_reg is in range [-1, 0] */
+	if (src_reg->smin_value == -1 && src_reg->smax_value == 0) {
+		/* the result is equivalent to adding 0 to dst_reg */
+		dst_reg->var_off = tnum_union(dst_reg->var_off, tnum_const(0));
+		/* update signed min/max to include 0 */
+		dst_reg->smin_value = min_t(s64, dst_reg->smin_value, 0);
+		dst_reg->smax_value = max_t(s64, dst_reg->smax_value, 0);
+		/* since we're adding 0 to dst_reg and 0 is the smallest
+		 * unsigned integer, dst_reg->min_value should be 0,
+		 * and dst->umax_value should remain unchanged.
+		 */
+		dst_reg->umin_value = 0;
+		return;
+	}
+
 	/* We get our minimum from the var_off, since that's inherently
 	 * bitwise.  Our maximum is the minimum of the operands' maxima.
 	 */
-- 
2.30.2



Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F9F92E6E2
	for <lists+apparmor@lfdr.de>; Thu, 11 Jul 2024 13:34:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sRs4D-0004Cz-NX; Thu, 11 Jul 2024 11:34:29 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <xukuohai@huaweicloud.com>)
 id 1sRs32-00042q-I3
 for apparmor@lists.ubuntu.com; Thu, 11 Jul 2024 11:33:17 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WKXf91d8Kz4f3kKn
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:33:05 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id DED921A06D6
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:33:12 +0800 (CST)
Received: from k01.huawei.com (unknown [10.67.174.197])
 by APP4 (Coremail) with SMTP id gCh0CgDXKvT0wo9mzI8hBw--.25380S7;
 Thu, 11 Jul 2024 19:33:12 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-integrity@vger.kernel.org, apparmor@lists.ubuntu.com,
 selinux@vger.kernel.org
Date: Thu, 11 Jul 2024 19:38:26 +0800
Message-Id: <20240711113828.3818398-6-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240711113828.3818398-1-xukuohai@huaweicloud.com>
References: <20240711113828.3818398-1-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgDXKvT0wo9mzI8hBw--.25380S7
X-Coremail-Antispam: 1UD129KBjvJXoWxWw1UXF4ftrW7Xr43uFy5twb_yoWrWw45pa
 4kZ3s2krySgF13Xw1xAr4xXFWFgws2q3yUArWxX34xZ3W7Jr97Xr4IgF45Xrn8JrZYyws5
 Zay2qrZxZr48Z3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBSb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
 Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
 rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
 AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
 14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
 xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
 z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF
 0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
 Iv6xkF7I0E14v26F4UJVW0obIYCTnIWIevJa73UjIFyTuYvjxUFgAwUUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
Received-SPF: pass client-ip=45.249.212.51;
 envelope-from=xukuohai@huaweicloud.com; helo=dggsgout11.his.huawei.com
X-Mailman-Approved-At: Thu, 11 Jul 2024 11:34:25 +0000
Subject: [apparmor] [PATCH bpf-next v4 18/20] selftests/bpf: Add return
	value checks for failed tests
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

The return ranges of some bpf lsm test progs can not be deduced by
the verifier accurately. To avoid erroneous rejections, add explicit
return value checks for these progs.

Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
---
 tools/testing/selftests/bpf/progs/err.h                | 10 ++++++++++
 tools/testing/selftests/bpf/progs/test_sig_in_xattr.c  |  4 ++++
 .../selftests/bpf/progs/test_verify_pkcs7_sig.c        |  8 ++++++--
 .../selftests/bpf/progs/verifier_global_subprogs.c     |  7 ++++++-
 4 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/err.h b/tools/testing/selftests/bpf/progs/err.h
index d66d283d9e59..38529779a236 100644
--- a/tools/testing/selftests/bpf/progs/err.h
+++ b/tools/testing/selftests/bpf/progs/err.h
@@ -5,6 +5,16 @@
 #define MAX_ERRNO 4095
 #define IS_ERR_VALUE(x) (unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO
 
+#define __STR(x) #x
+
+#define set_if_not_errno_or_zero(x, y)			\
+({							\
+	asm volatile ("if %0 s< -4095 goto +1\n"	\
+		      "if %0 s<= 0 goto +1\n"		\
+		      "%0 = " __STR(y) "\n"		\
+		      : "+r"(x));			\
+})
+
 static inline int IS_ERR_OR_NULL(const void *ptr)
 {
 	return !ptr || IS_ERR_VALUE((unsigned long)ptr);
diff --git a/tools/testing/selftests/bpf/progs/test_sig_in_xattr.c b/tools/testing/selftests/bpf/progs/test_sig_in_xattr.c
index 2f0eb1334d65..8ef6b39335b6 100644
--- a/tools/testing/selftests/bpf/progs/test_sig_in_xattr.c
+++ b/tools/testing/selftests/bpf/progs/test_sig_in_xattr.c
@@ -6,6 +6,7 @@
 #include <bpf/bpf_helpers.h>
 #include <bpf/bpf_tracing.h>
 #include "bpf_kfuncs.h"
+#include "err.h"
 
 char _license[] SEC("license") = "GPL";
 
@@ -79,5 +80,8 @@ int BPF_PROG(test_file_open, struct file *f)
 	ret = bpf_verify_pkcs7_signature(&digest_ptr, &sig_ptr, trusted_keyring);
 
 	bpf_key_put(trusted_keyring);
+
+	set_if_not_errno_or_zero(ret, -EFAULT);
+
 	return ret;
 }
diff --git a/tools/testing/selftests/bpf/progs/test_verify_pkcs7_sig.c b/tools/testing/selftests/bpf/progs/test_verify_pkcs7_sig.c
index f42e9f3831a1..12034a73ee2d 100644
--- a/tools/testing/selftests/bpf/progs/test_verify_pkcs7_sig.c
+++ b/tools/testing/selftests/bpf/progs/test_verify_pkcs7_sig.c
@@ -11,6 +11,7 @@
 #include <bpf/bpf_helpers.h>
 #include <bpf/bpf_tracing.h>
 #include "bpf_kfuncs.h"
+#include "err.h"
 
 #define MAX_DATA_SIZE (1024 * 1024)
 #define MAX_SIG_SIZE 1024
@@ -55,12 +56,12 @@ int BPF_PROG(bpf, int cmd, union bpf_attr *attr, unsigned int size)
 
 	ret = bpf_probe_read_kernel(&value, sizeof(value), &attr->value);
 	if (ret)
-		return ret;
+		goto out;
 
 	ret = bpf_copy_from_user(data_val, sizeof(struct data),
 				 (void *)(unsigned long)value);
 	if (ret)
-		return ret;
+		goto out;
 
 	if (data_val->data_len > sizeof(data_val->data))
 		return -EINVAL;
@@ -84,5 +85,8 @@ int BPF_PROG(bpf, int cmd, union bpf_attr *attr, unsigned int size)
 
 	bpf_key_put(trusted_keyring);
 
+out:
+	set_if_not_errno_or_zero(ret, -EFAULT);
+
 	return ret;
 }
diff --git a/tools/testing/selftests/bpf/progs/verifier_global_subprogs.c b/tools/testing/selftests/bpf/progs/verifier_global_subprogs.c
index a9fc30ed4d73..20904cd2baa2 100644
--- a/tools/testing/selftests/bpf/progs/verifier_global_subprogs.c
+++ b/tools/testing/selftests/bpf/progs/verifier_global_subprogs.c
@@ -7,6 +7,7 @@
 #include "bpf_misc.h"
 #include "xdp_metadata.h"
 #include "bpf_kfuncs.h"
+#include "err.h"
 
 /* The compiler may be able to detect the access to uninitialized
    memory in the routines performing out of bound memory accesses and
@@ -331,7 +332,11 @@ SEC("?lsm/bpf")
 __success __log_level(2)
 int BPF_PROG(arg_tag_ctx_lsm)
 {
-	return tracing_subprog_void(ctx) + tracing_subprog_u64(ctx);
+	int ret;
+
+	ret = tracing_subprog_void(ctx) + tracing_subprog_u64(ctx);
+	set_if_not_errno_or_zero(ret, -1);
+	return ret;
 }
 
 SEC("?struct_ops/test_1")
-- 
2.30.2



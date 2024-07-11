Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 018A892E6DA
	for <lists+apparmor@lfdr.de>; Thu, 11 Jul 2024 13:34:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sRs4B-0004BO-Ts; Thu, 11 Jul 2024 11:34:27 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <xukuohai@huaweicloud.com>)
 id 1sRs32-00042t-FK
 for apparmor@lists.ubuntu.com; Thu, 11 Jul 2024 11:33:16 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4WKXf41QSfz4f3m7Z
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:33:00 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 1B87F1A058E
 for <apparmor@lists.ubuntu.com>; Thu, 11 Jul 2024 19:33:13 +0800 (CST)
Received: from k01.huawei.com (unknown [10.67.174.197])
 by APP4 (Coremail) with SMTP id gCh0CgDXKvT0wo9mzI8hBw--.25380S8;
 Thu, 11 Jul 2024 19:33:12 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-integrity@vger.kernel.org, apparmor@lists.ubuntu.com,
 selinux@vger.kernel.org
Date: Thu, 11 Jul 2024 19:38:27 +0800
Message-Id: <20240711113828.3818398-7-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240711113828.3818398-1-xukuohai@huaweicloud.com>
References: <20240711113828.3818398-1-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgDXKvT0wo9mzI8hBw--.25380S8
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWkXw1UtF4UCr15AFy7Jrb_yoW5urW7pa
 48W345KryFvFy3Xw43KF4xuF4Sya1kuryUArW7XryYvrn7Arn7GF1xKFWUtFnxJFWruwn5
 Zas7trs7Cr48Z3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Subject: [apparmor] [PATCH bpf-next v4 19/20] selftests/bpf: Add test for
	lsm tail call
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

Add test for lsm tail call to ensure tail call can only be used between
bpf lsm progs attached to the same hook.

Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
---
 .../selftests/bpf/prog_tests/test_lsm.c       | 46 ++++++++++++++++++-
 .../selftests/bpf/progs/lsm_tailcall.c        | 34 ++++++++++++++
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/bpf/progs/lsm_tailcall.c

diff --git a/tools/testing/selftests/bpf/prog_tests/test_lsm.c b/tools/testing/selftests/bpf/prog_tests/test_lsm.c
index 16175d579bc7..2a27f3714f5c 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_lsm.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_lsm.c
@@ -12,6 +12,7 @@
 #include <stdlib.h>
 
 #include "lsm.skel.h"
+#include "lsm_tailcall.skel.h"
 
 char *CMD_ARGS[] = {"true", NULL};
 
@@ -95,7 +96,7 @@ static int test_lsm(struct lsm *skel)
 	return 0;
 }
 
-void test_test_lsm(void)
+static void test_lsm_basic(void)
 {
 	struct lsm *skel = NULL;
 	int err;
@@ -114,3 +115,46 @@ void test_test_lsm(void)
 close_prog:
 	lsm__destroy(skel);
 }
+
+static void test_lsm_tailcall(void)
+{
+	struct lsm_tailcall *skel = NULL;
+	int map_fd, prog_fd;
+	int err, key;
+
+	skel = lsm_tailcall__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "lsm_tailcall__skel_load"))
+		goto close_prog;
+
+	map_fd = bpf_map__fd(skel->maps.jmp_table);
+	if (CHECK_FAIL(map_fd < 0))
+		goto close_prog;
+
+	prog_fd = bpf_program__fd(skel->progs.lsm_file_permission_prog);
+	if (CHECK_FAIL(prog_fd < 0))
+		goto close_prog;
+
+	key = 0;
+	err = bpf_map_update_elem(map_fd, &key, &prog_fd, BPF_ANY);
+	if (CHECK_FAIL(!err))
+		goto close_prog;
+
+	prog_fd = bpf_program__fd(skel->progs.lsm_file_alloc_security_prog);
+	if (CHECK_FAIL(prog_fd < 0))
+		goto close_prog;
+
+	err = bpf_map_update_elem(map_fd, &key, &prog_fd, BPF_ANY);
+	if (CHECK_FAIL(err))
+		goto close_prog;
+
+close_prog:
+	lsm_tailcall__destroy(skel);
+}
+
+void test_test_lsm(void)
+{
+	if (test__start_subtest("lsm_basic"))
+		test_lsm_basic();
+	if (test__start_subtest("lsm_tailcall"))
+		test_lsm_tailcall();
+}
diff --git a/tools/testing/selftests/bpf/progs/lsm_tailcall.c b/tools/testing/selftests/bpf/progs/lsm_tailcall.c
new file mode 100644
index 000000000000..49c075ce2d4c
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/lsm_tailcall.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2024 Huawei Technologies Co., Ltd */
+
+#include "vmlinux.h"
+#include <errno.h>
+#include <bpf/bpf_helpers.h>
+
+char _license[] SEC("license") = "GPL";
+
+struct {
+	__uint(type, BPF_MAP_TYPE_PROG_ARRAY);
+	__uint(max_entries, 1);
+	__uint(key_size, sizeof(__u32));
+	__uint(value_size, sizeof(__u32));
+} jmp_table SEC(".maps");
+
+SEC("lsm/file_permission")
+int lsm_file_permission_prog(void *ctx)
+{
+	return 0;
+}
+
+SEC("lsm/file_alloc_security")
+int lsm_file_alloc_security_prog(void *ctx)
+{
+	return 0;
+}
+
+SEC("lsm/file_alloc_security")
+int lsm_file_alloc_security_entry(void *ctx)
+{
+	bpf_tail_call_static(ctx, &jmp_table, 0);
+	return 0;
+}
-- 
2.30.2



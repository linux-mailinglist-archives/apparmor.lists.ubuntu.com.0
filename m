Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BD685F95B
	for <lists+apparmor@lfdr.de>; Thu, 22 Feb 2024 14:15:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rd8vR-0003f9-Qd; Thu, 22 Feb 2024 13:15:45 +0000
Received: from frasgout11.his.huawei.com ([14.137.139.23])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <petrtesarik@huaweicloud.com>)
 id 1rd8uN-0003UI-5G
 for apparmor@lists.ubuntu.com; Thu, 22 Feb 2024 13:14:39 +0000
Received: from mail.maildlp.com (unknown [172.18.186.29])
 by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4TgYB76ZZgz9xyNZ
 for <apparmor@lists.ubuntu.com>; Thu, 22 Feb 2024 20:59:11 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
 by mail.maildlp.com (Postfix) with ESMTP id EF517140852
 for <apparmor@lists.ubuntu.com>; Thu, 22 Feb 2024 21:14:27 +0800 (CST)
Received: from huaweicloud.com (unknown [10.45.157.235])
 by APP1 (Coremail) with SMTP id LxC2BwDXzhdSSNdlhi4AAw--.34998S6;
 Thu, 22 Feb 2024 14:14:27 +0100 (CET)
From: Petr Tesarik <petrtesarik@huaweicloud.com>
To: Dave Hansen <dave.hansen@intel.com>
Date: Thu, 22 Feb 2024 14:12:29 +0100
Message-Id: <20240222131230.635-5-petrtesarik@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222131230.635-1-petrtesarik@huaweicloud.com>
References: <fb4a40c7-af9a-406a-95ab-406595f3ffe5@intel.com>
 <20240222131230.635-1-petrtesarik@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LxC2BwDXzhdSSNdlhi4AAw--.34998S6
X-Coremail-Antispam: 1UD129KBjvJXoW3Xw4rWrWfury8KFy8Gry8Xwb_yoW3tFW3pF
 4xuFn8GFWrtryUCry7ArWjqryDW3WDJF40kaya9a4fZasxtF1xGr1qv34qqr48ArWkuF1Y
 kF9YqrZ8Aw48Aw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
 Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
 IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
 Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
 xan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr
 1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
 0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x
 0JUQSdkUUUUU=
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-Mailman-Approved-At: Thu, 22 Feb 2024 13:15:45 +0000
Subject: [apparmor] [RFC 4/5] sbm: fix up calls to dynamic memory allocators
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Kai Huang <kai.huang@intel.com>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-security-module@vger.kernel.org, Ze Gao <zegao2021@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 James Morris <jmorris@namei.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Joerg Roedel <jroedel@suse.de>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>,
 Brian Gerst <brgerst@gmail.com>, Xin Li <xin3.li@intel.com>,
 apparmor@lists.ubuntu.com, Borislav Petkov <bp@alien8.de>,
 "Mike Rapoport \(IBM\)" <rppt@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Paul Moore <paul@paul-moore.com>, Oleg Nesterov <oleg@redhat.com>,
 Tina Zhang <tina.zhang@intel.com>, Pengfei Xu <pengfei.xu@intel.com>,
 "Masami Hiramatsu \(Google\)" <mhiramat@kernel.org>,
 Petr Tesarik <petr.tesarik1@huawei-partners.com>,
 Roberto Sassu <roberto.sassu@huaweicloud.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Petr Tesarik <petrtesarik@huaweicloud.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: Petr Tesarik <petr.tesarik1@huawei-partners.com>

Add fixup functions to call kmalloc(), vmalloc() and friends on behalf of
the sandbox code.

Signed-off-by: Petr Tesarik <petr.tesarik1@huawei-partners.com>
---
 arch/x86/kernel/sbm/core.c | 81 ++++++++++++++++++++++++++++++++++++++
 mm/slab_common.c           |  3 +-
 mm/slub.c                  | 17 ++++----
 mm/vmalloc.c               | 11 +++---
 4 files changed, 98 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/sbm/core.c b/arch/x86/kernel/sbm/core.c
index c8ac7ecb08cc..3cf3842292b9 100644
--- a/arch/x86/kernel/sbm/core.c
+++ b/arch/x86/kernel/sbm/core.c
@@ -20,6 +20,12 @@
 #include <linux/sbm.h>
 #include <linux/sched/task_stack.h>
 
+/*
+ * FIXME: Remove these includes when there is proper API for defining
+ * which functions can be called from sandbox mode.
+ */
+#include <linux/vmalloc.h>
+
 #define GFP_SBM_PGTABLE	(GFP_KERNEL | __GFP_ZERO)
 #define PGD_ORDER	get_order(sizeof(pgd_t) * PTRS_PER_PGD)
 
@@ -52,8 +58,83 @@ struct sbm_fixup {
 	sbm_proxy_call_fn proxy;
 };
 
+static int map_range(struct x86_sbm_state *state, unsigned long start,
+		     unsigned long end, pgprot_t prot);
+
+/* Map the newly allocated dynamic memory region. */
+static unsigned long post_alloc(struct x86_sbm_state *state,
+				unsigned long objp, size_t size)
+{
+	int err;
+
+	if (!objp)
+		return objp;
+
+	err = map_range(state, objp, objp + size, PAGE_SHARED);
+	if (err) {
+		kfree((void*)objp);
+		return 0UL;
+	}
+	return objp;
+}
+
+/* Allocation proxy handler if size is the 1st parameter. */
+static unsigned long proxy_alloc1(struct x86_sbm_state *state,
+				    unsigned long func, struct pt_regs *regs)
+{
+	unsigned long objp;
+
+	objp = x86_sbm_proxy_call(state, func, regs);
+	return post_alloc(state, objp, regs->di);
+}
+
+/* Allocation proxy handler if size is the 2nd parameter. */
+static unsigned long proxy_alloc2(struct x86_sbm_state *state,
+				    unsigned long func, struct pt_regs *regs)
+{
+	unsigned long objp;
+
+	objp = x86_sbm_proxy_call(state, func, regs);
+	return post_alloc(state, objp, regs->si);
+}
+
+/* Allocation proxy handler if size is the 3rd parameter. */
+static unsigned long proxy_alloc3(struct x86_sbm_state *state,
+				    unsigned long func, struct pt_regs *regs)
+{
+	unsigned long objp;
+
+	objp = x86_sbm_proxy_call(state, func, regs);
+	return post_alloc(state, objp, regs->dx);
+}
+
+/* Proxy handler to free previously allocated memory. */
+static unsigned long proxy_free(struct x86_sbm_state *state,
+				unsigned long func, struct pt_regs *regs)
+{
+	/* TODO: unmap allocated addresses from sandbox! */
+	return x86_sbm_proxy_call(state, func, regs);
+}
+
 static const struct sbm_fixup fixups[] =
 {
+	/* kmalloc() and friends */
+	{ kmalloc_trace, proxy_alloc3 },
+	{ __kmalloc, proxy_alloc1 },
+	{ __kmalloc_node, proxy_alloc1 },
+	{ __kmalloc_node_track_caller, proxy_alloc1 },
+	{ kmalloc_large, proxy_alloc1 },
+	{ kmalloc_large_node, proxy_alloc1 },
+	{ krealloc, proxy_alloc2 },
+	{ kfree, proxy_free },
+
+	/* vmalloc() and friends */
+	{ vmalloc, proxy_alloc1 },
+	{ __vmalloc, proxy_alloc1 },
+	{ __vmalloc_node, proxy_alloc1 },
+	{ vzalloc, proxy_alloc1 },
+	{ vfree, proxy_free },
+
 	{ }
 };
 
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 238293b1dbe1..2b72118d9bfa 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -28,6 +28,7 @@
 #include <asm/page.h>
 #include <linux/memcontrol.h>
 #include <linux/stackdepot.h>
+#include <linux/sbm.h>
 
 #include "internal.h"
 #include "slab.h"
@@ -1208,7 +1209,7 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
  *
  * Return: pointer to the allocated memory or %NULL in case of error
  */
-void *krealloc(const void *p, size_t new_size, gfp_t flags)
+void * __nosbm krealloc(const void *p, size_t new_size, gfp_t flags)
 {
 	void *ret;
 
diff --git a/mm/slub.c b/mm/slub.c
index 2ef88bbf56a3..5f2290fe4df0 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -42,6 +42,7 @@
 #include <kunit/test.h>
 #include <kunit/test-bug.h>
 #include <linux/sort.h>
+#include <linux/sbm.h>
 
 #include <linux/debugfs.h>
 #include <trace/events/kmem.h>
@@ -3913,7 +3914,7 @@ EXPORT_SYMBOL(kmem_cache_alloc_node);
  * directly to the page allocator. We use __GFP_COMP, because we will need to
  * know the allocation order to free the pages properly in kfree.
  */
-static void *__kmalloc_large_node(size_t size, gfp_t flags, int node)
+static void * __nosbm __kmalloc_large_node(size_t size, gfp_t flags, int node)
 {
 	struct folio *folio;
 	void *ptr = NULL;
@@ -3938,7 +3939,7 @@ static void *__kmalloc_large_node(size_t size, gfp_t flags, int node)
 	return ptr;
 }
 
-void *kmalloc_large(size_t size, gfp_t flags)
+void * __nosbm kmalloc_large(size_t size, gfp_t flags)
 {
 	void *ret = __kmalloc_large_node(size, flags, NUMA_NO_NODE);
 
@@ -3983,26 +3984,26 @@ void *__do_kmalloc_node(size_t size, gfp_t flags, int node,
 	return ret;
 }
 
-void *__kmalloc_node(size_t size, gfp_t flags, int node)
+void * __nosbm __kmalloc_node(size_t size, gfp_t flags, int node)
 {
 	return __do_kmalloc_node(size, flags, node, _RET_IP_);
 }
 EXPORT_SYMBOL(__kmalloc_node);
 
-void *__kmalloc(size_t size, gfp_t flags)
+void * __nosbm __kmalloc(size_t size, gfp_t flags)
 {
 	return __do_kmalloc_node(size, flags, NUMA_NO_NODE, _RET_IP_);
 }
 EXPORT_SYMBOL(__kmalloc);
 
-void *__kmalloc_node_track_caller(size_t size, gfp_t flags,
-				  int node, unsigned long caller)
+void * __nosbm __kmalloc_node_track_caller(size_t size, gfp_t flags,
+					   int node, unsigned long caller)
 {
 	return __do_kmalloc_node(size, flags, node, caller);
 }
 EXPORT_SYMBOL(__kmalloc_node_track_caller);
 
-void *kmalloc_trace(struct kmem_cache *s, gfp_t gfpflags, size_t size)
+void * __nosbm kmalloc_trace(struct kmem_cache *s, gfp_t gfpflags, size_t size)
 {
 	void *ret = slab_alloc_node(s, NULL, gfpflags, NUMA_NO_NODE,
 					    _RET_IP_, size);
@@ -4386,7 +4387,7 @@ static void free_large_kmalloc(struct folio *folio, void *object)
  *
  * If @object is NULL, no operation is performed.
  */
-void kfree(const void *object)
+void __nosbm kfree(const void *object)
 {
 	struct folio *folio;
 	struct slab *slab;
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index d12a17fc0c17..d7a5b715ac03 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -40,6 +40,7 @@
 #include <linux/pgtable.h>
 #include <linux/hugetlb.h>
 #include <linux/sched/mm.h>
+#include <linux/sbm.h>
 #include <asm/tlbflush.h>
 #include <asm/shmparam.h>
 
@@ -2804,7 +2805,7 @@ void vfree_atomic(const void *addr)
  * if we have CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG, but making the calling
  * conventions for vfree() arch-dependent would be a really bad idea).
  */
-void vfree(const void *addr)
+void __nosbm vfree(const void *addr)
 {
 	struct vm_struct *vm;
 	int i;
@@ -3379,7 +3380,7 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
  *
  * Return: pointer to the allocated memory or %NULL on error
  */
-void *__vmalloc_node(unsigned long size, unsigned long align,
+void * __nosbm __vmalloc_node(unsigned long size, unsigned long align,
 			    gfp_t gfp_mask, int node, const void *caller)
 {
 	return __vmalloc_node_range(size, align, VMALLOC_START, VMALLOC_END,
@@ -3394,7 +3395,7 @@ void *__vmalloc_node(unsigned long size, unsigned long align,
 EXPORT_SYMBOL_GPL(__vmalloc_node);
 #endif
 
-void *__vmalloc(unsigned long size, gfp_t gfp_mask)
+void * __nosbm __vmalloc(unsigned long size, gfp_t gfp_mask)
 {
 	return __vmalloc_node(size, 1, gfp_mask, NUMA_NO_NODE,
 				__builtin_return_address(0));
@@ -3413,7 +3414,7 @@ EXPORT_SYMBOL(__vmalloc);
  *
  * Return: pointer to the allocated memory or %NULL on error
  */
-void *vmalloc(unsigned long size)
+void * __nosbm vmalloc(unsigned long size)
 {
 	return __vmalloc_node(size, 1, GFP_KERNEL, NUMA_NO_NODE,
 				__builtin_return_address(0));
@@ -3453,7 +3454,7 @@ EXPORT_SYMBOL_GPL(vmalloc_huge);
  *
  * Return: pointer to the allocated memory or %NULL on error
  */
-void *vzalloc(unsigned long size)
+void * __nosbm vzalloc(unsigned long size)
 {
 	return __vmalloc_node(size, 1, GFP_KERNEL | __GFP_ZERO, NUMA_NO_NODE,
 				__builtin_return_address(0));
-- 
2.34.1



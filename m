Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C0985F95A
	for <lists+apparmor@lfdr.de>; Thu, 22 Feb 2024 14:15:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rd8vT-0003fc-KF; Thu, 22 Feb 2024 13:15:47 +0000
Received: from frasgout12.his.huawei.com ([14.137.139.154])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <petrtesarik@huaweicloud.com>)
 id 1rd8tw-0003LD-8b
 for apparmor@lists.ubuntu.com; Thu, 22 Feb 2024 13:14:12 +0000
Received: from mail.maildlp.com (unknown [172.18.186.51])
 by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4TgY550SSsz9xtSY
 for <apparmor@lists.ubuntu.com>; Thu, 22 Feb 2024 20:54:49 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
 by mail.maildlp.com (Postfix) with ESMTP id 777981407AD
 for <apparmor@lists.ubuntu.com>; Thu, 22 Feb 2024 21:14:09 +0800 (CST)
Received: from huaweicloud.com (unknown [10.45.157.235])
 by APP1 (Coremail) with SMTP id LxC2BwDXzhdSSNdlhi4AAw--.34998S5;
 Thu, 22 Feb 2024 14:14:08 +0100 (CET)
From: Petr Tesarik <petrtesarik@huaweicloud.com>
To: Dave Hansen <dave.hansen@intel.com>
Date: Thu, 22 Feb 2024 14:12:28 +0100
Message-Id: <20240222131230.635-4-petrtesarik@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222131230.635-1-petrtesarik@huaweicloud.com>
References: <fb4a40c7-af9a-406a-95ab-406595f3ffe5@intel.com>
 <20240222131230.635-1-petrtesarik@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LxC2BwDXzhdSSNdlhi4AAw--.34998S5
X-Coremail-Antispam: 1UD129KBjvJXoW3Xw45Cr15Gry8Xr43Kr18Grg_yoW7uw4DpF
 srA3WDGF4jyFy7Ar9xJrs5Zr90yw18Kw1Fkr9rG34fZ3WUtw1fXr1vv3Zrtr1rA348KF4a
 yF4fZFy5uw15J37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
 IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1lIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
 0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUd
 8n5UUUUU=
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-Mailman-Approved-At: Thu, 22 Feb 2024 13:15:45 +0000
Subject: [apparmor] [RFC 3/5] sbm: x86: infrastructure to fix up sandbox
	faults
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

Since sandbox mode cannot modify kernel data, much of the core API cannot
be used directly. Provide a method to call a known subset of kernel
functions from the sandbox fault handler on behalf of the sandbox code.

Since SBM permissions have page granularity, the code of an intercepted
function must not be in the same page as another function running in
sandbox mode. Provide a __nosbm marker to move the intercepted functions
into a special ELF section, align it to page boundaries and map it so that
it is not executable in sandbox mode. To minimize alignment padding, merge
the __nosbm section with the kernel entry code.

Signed-off-by: Petr Tesarik <petr.tesarik1@huawei-partners.com>
---
 arch/x86/kernel/sbm/call_64.S | 20 +++++++++++
 arch/x86/kernel/sbm/core.c    | 65 +++++++++++++++++++++++++++++++++--
 arch/x86/kernel/vmlinux.lds.S |  9 +++++
 include/linux/sbm.h           |  6 ++++
 4 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/sbm/call_64.S b/arch/x86/kernel/sbm/call_64.S
index 21edce5666bc..6d8ae30a0984 100644
--- a/arch/x86/kernel/sbm/call_64.S
+++ b/arch/x86/kernel/sbm/call_64.S
@@ -93,3 +93,23 @@ SYM_INNER_LABEL(x86_sbm_return, SYM_L_GLOBAL)
 	pop	%rbp
 	RET
 SYM_FUNC_END(x86_sbm_exec)
+
+.text
+
+/*
+ * arguments:
+ * rdi  .. state (ignored)
+ * rsi  .. target function
+ * rdx  .. struct pt_regs
+*/
+SYM_FUNC_START(x86_sbm_proxy_call)
+	mov	%rdx, %r10
+	mov	%rsi, %r11
+	mov	pt_regs_di(%r10), %rdi
+	mov	pt_regs_si(%r10), %rsi
+	mov	pt_regs_dx(%r10), %rdx
+	mov	pt_regs_cx(%r10), %rcx
+	mov	pt_regs_r8(%r10), %r8
+	mov	pt_regs_r9(%r10), %r9
+	JMP_NOSPEC r11
+SYM_FUNC_END(x86_sbm_proxy_call)
diff --git a/arch/x86/kernel/sbm/core.c b/arch/x86/kernel/sbm/core.c
index 296f1fde3c22..c8ac7ecb08cc 100644
--- a/arch/x86/kernel/sbm/core.c
+++ b/arch/x86/kernel/sbm/core.c
@@ -28,6 +28,60 @@ asmlinkage int x86_sbm_exec(struct x86_sbm_state *state, sbm_func func,
 			    unsigned long exc_tos);
 extern char x86_sbm_return[];
 
+extern char __nosbm_text_start[], __nosbm_text_end[];
+
+/*************************************************************
+ * HACK: PROOF-OF-CONCEPT FIXUP CODE STARTS HERE
+ */
+
+typedef unsigned long (*sbm_proxy_call_fn)(struct x86_sbm_state *,
+					   unsigned long func,
+					   struct pt_regs *);
+
+asmlinkage unsigned long x86_sbm_proxy_call(struct x86_sbm_state *state,
+					    unsigned long func,
+					    struct pt_regs *regs);
+
+/**
+ * struct sbm_fixup - Describe a sandbox fault fixup.
+ * @target:  Target function to be called.
+ * @proxy:   Proxy call function.
+ */
+struct sbm_fixup {
+	void *target;
+	sbm_proxy_call_fn proxy;
+};
+
+static const struct sbm_fixup fixups[] =
+{
+	{ }
+};
+
+/* Fix up a page fault if it is one of the known exceptions. */
+static bool fixup_sbm_call(struct x86_sbm_state *state,
+			   struct pt_regs *regs, unsigned long address)
+{
+	const struct sbm_fixup *fixup;
+
+	for (fixup = fixups; fixup->target; ++fixup) {
+		if (address == (unsigned long)fixup->target) {
+			regs->ax = fixup->proxy(state, address, regs);
+			return true;
+		}
+	}
+
+	return false;
+}
+
+/* Execution in sandbox mode continues here after fixup. */
+static void x86_sbm_continue(void)
+{
+}
+
+/*
+ * HACK: PROOF-OF-CONCEPT FIXUP CODE ENDS HERE
+ *************************************************************/
+
 union {
 	struct x86_sbm_state state;
 	char page[PAGE_SIZE];
@@ -140,8 +194,8 @@ static int map_kernel(struct x86_sbm_state *state)
 	if (err)
 		return err;
 
-	err = map_range(state, (unsigned long)__entry_text_start,
-			(unsigned long)__entry_text_end, PAGE_KERNEL_ROX);
+	err = map_range(state, (unsigned long)__nosbm_text_start,
+			(unsigned long)__nosbm_text_end, PAGE_KERNEL_ROX);
 	if (err)
 		return err;
 
@@ -482,6 +536,13 @@ void handle_sbm_fault(struct pt_regs *regs, unsigned long error_code,
 	if (spurious_sbm_fault(state, error_code, address))
 		return;
 
+	if ((error_code & ~X86_PF_PROT) == (X86_PF_USER | X86_PF_INSTR) &&
+	    fixup_sbm_call(state, regs, address)) {
+		/* Return back to sandbox... */
+		regs->ip = (unsigned long)x86_sbm_continue;
+		return;
+	}
+
 	/*
 	 * Force -EFAULT unless the fault was due to a user-mode instruction
 	 * fetch from the designated return address.
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index a349dbfc6d5a..c530a7faaa9a 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -139,8 +139,17 @@ SECTIONS
 		STATIC_CALL_TEXT
 
 		ALIGN_ENTRY_TEXT_BEGIN
+#ifdef CONFIG_SANDBOX_MODE
+		. = ALIGN(PAGE_SIZE);
+		__nosbm_text_start = .;
+#endif
 		*(.text..__x86.rethunk_untrain)
 		ENTRY_TEXT
+#ifdef CONFIG_SANDBOX_MODE
+		*(.text.nosbm)
+		. = ALIGN(PAGE_SIZE);
+		__nosbm_text_end = .;
+#endif
 
 #ifdef CONFIG_CPU_SRSO
 		/*
diff --git a/include/linux/sbm.h b/include/linux/sbm.h
index dbdc0781349f..9d7eb525e489 100644
--- a/include/linux/sbm.h
+++ b/include/linux/sbm.h
@@ -267,6 +267,8 @@ int arch_sbm_map_writable(struct sbm *sbm, const struct sbm_buf *buf);
  */
 int arch_sbm_exec(struct sbm *sbm, sbm_func func, void *data);
 
+#define __nosbm __section(".text.nosbm")
+
 #else /* !CONFIG_HAVE_ARCH_SBM */
 
 static inline int arch_sbm_init(struct sbm *sbm)
@@ -295,6 +297,8 @@ static inline int arch_sbm_exec(struct sbm *sbm, sbm_func func, void *data)
 	return func(data);
 }
 
+#define __nosbm
+
 #endif /* CONFIG_HAVE_ARCH_SBM */
 
 #else /* !CONFIG_SANDBOX_MODE */
@@ -340,6 +344,8 @@ static inline void *sbm_map_writable(struct sbm *sbm, const void *ptr,
 	return (void *)ptr;
 }
 
+#define __nosbm
+
 #endif /* CONFIG_SANDBOX_MODE */
 
 /**
-- 
2.34.1



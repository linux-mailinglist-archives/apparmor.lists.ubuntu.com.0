Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3BF85F961
	for <lists+apparmor@lfdr.de>; Thu, 22 Feb 2024 14:16:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rd8vT-0003fV-2a; Thu, 22 Feb 2024 13:15:47 +0000
Received: from frasgout11.his.huawei.com ([14.137.139.23])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <petrtesarik@huaweicloud.com>)
 id 1rd8th-0003Jg-99
 for apparmor@lists.ubuntu.com; Thu, 22 Feb 2024 13:13:57 +0000
Received: from mail.maildlp.com (unknown [172.18.186.29])
 by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4TgY9L0Nkjz9xyND
 for <apparmor@lists.ubuntu.com>; Thu, 22 Feb 2024 20:58:30 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
 by mail.maildlp.com (Postfix) with ESMTP id 0243F140DEC
 for <apparmor@lists.ubuntu.com>; Thu, 22 Feb 2024 21:13:51 +0800 (CST)
Received: from huaweicloud.com (unknown [10.45.157.235])
 by APP1 (Coremail) with SMTP id LxC2BwDXzhdSSNdlhi4AAw--.34998S4;
 Thu, 22 Feb 2024 14:13:50 +0100 (CET)
From: Petr Tesarik <petrtesarik@huaweicloud.com>
To: Dave Hansen <dave.hansen@intel.com>
Date: Thu, 22 Feb 2024 14:12:27 +0100
Message-Id: <20240222131230.635-3-petrtesarik@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222131230.635-1-petrtesarik@huaweicloud.com>
References: <fb4a40c7-af9a-406a-95ab-406595f3ffe5@intel.com>
 <20240222131230.635-1-petrtesarik@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LxC2BwDXzhdSSNdlhi4AAw--.34998S4
X-Coremail-Antispam: 1UD129KBjvJXoWxWFWfAFW5GrW5AFW3AFy7ZFb_yoWrCw4fpF
 n8JFs8GF45AF17Jr43Gw10vw1rJan7XF1UK39xC3s0y3Z8try7urn5GFy3JFsxAr9rGFWF
 yrs5KFZ5Cw4xJ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
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
 0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUH
 byAUUUUU=
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-Mailman-Approved-At: Thu, 22 Feb 2024 13:15:45 +0000
Subject: [apparmor] [RFC 2/5] sbm: enhance buffer mapping API
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

Add SBM_MAP_READONLY() and SBM_MAP_WRITABLE() to the public API to allow
mapping kernel buffers directly into the sandbox with no copying.

Signed-off-by: Petr Tesarik <petr.tesarik1@huawei-partners.com>
---
 include/linux/sbm.h | 71 +++++++++++++++++++++++++++++++++++++++++++++
 kernel/sbm.c        | 34 ++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/include/linux/sbm.h b/include/linux/sbm.h
index 98fd27cd58d0..dbdc0781349f 100644
--- a/include/linux/sbm.h
+++ b/include/linux/sbm.h
@@ -181,6 +181,31 @@ static inline void *sbm_add_buf(struct sbm *sbm, struct sbm_buf **list,
 #define SBM_COPY_INOUT(sbm, buf, size) \
 	((typeof(({buf; })))sbm_add_buf((sbm), &(sbm)->io, (buf), (size)))
 
+/**
+ * sbm_map_readonly() - Map memory for reading.
+ * @sbm:   SBM instance.
+ * @ptr:   Starting virtual address.
+ * @size:  Size in bytes.
+ *
+ * Make the specified virtual address range readable in sandbox code.
+ *
+ * Return: Address of the buffer, or %NULL on error.
+ */
+void *sbm_map_readonly(struct sbm *sbm, const void *ptr, size_t size);
+
+/**
+ * sbm_map_writable() - Map memory for reading and writing.
+ * @sbm:   SBM instance.
+ * @ptr:   Starting virtual address.
+ * @size:  Size in bytes.
+ *
+ * Make the specified virtual address range readable and writable in sandbox
+ * code.
+ *
+ * Return: Address of the buffer, or %NULL on error.
+ */
+void *sbm_map_writable(struct sbm *sbm, const void *ptr, size_t size);
+
 #ifdef CONFIG_HAVE_ARCH_SBM
 
 /**
@@ -303,8 +328,54 @@ static inline int sbm_exec(struct sbm *sbm, sbm_func func, void *data)
 #define SBM_COPY_OUT(sbm, buf, size) __SBM_EVAL(buf)
 #define SBM_COPY_INOUT(sbm, buf, size) __SBM_EVAL(buf)
 
+static inline void *sbm_map_readonly(struct sbm *sbm, const void *ptr,
+				     size_t size)
+{
+	return (void *)ptr;
+}
+
+static inline void *sbm_map_writable(struct sbm *sbm, const void *ptr,
+				     size_t size)
+{
+	return (void *)ptr;
+}
+
 #endif /* CONFIG_SANDBOX_MODE */
 
+/**
+ * SBM_MAP_READONLY() - Map an input buffer into SBM.
+ * @sbm:   SBM instance.
+ * @buf:   Buffer virtual address.
+ * @size:  Size of the buffer.
+ *
+ * Make a read-only mapping of buffer in sandbox mode.
+ *
+ * This works with page granularity. If the buffer is not page-aligned,
+ * some data before and/or after the page is also mappeed into the sandbox.
+ * The mapping does not ensure guard pages either.
+ *
+ * Return: Buffer address in sandbox mode (same as kernel mode).
+ */
+#define SBM_MAP_READONLY(sbm, buf, size) \
+	((typeof(({buf; })))sbm_map_readonly((sbm), (buf), (size)))
+
+/**
+ * SBM_MAP_WRITABLE() - Map an input/output buffer into SBM.
+ * @sbm:   SBM instance.
+ * @buf:   Buffer virtual address.
+ * @size:  Size of the buffer.
+ *
+ * Make a writable mapping of buffer in sandbox mode.
+ *
+ * This works with page granularity. If the buffer is not page-aligned,
+ * some data before and/or after the page is also mappeed into the sandbox.
+ * The mapping does not ensure guard pages either.
+ *
+ * Return: Buffer address in sandbox mode (same as kernel mode).
+ */
+#define SBM_MAP_WRITABLE(sbm, buf, size) \
+	((typeof(({buf; })))sbm_map_writable((sbm), (buf), (size)))
+
 /**
  * __SBM_MAP() - Convert parameters to comma-separated expressions.
  * @m: Macro used to convert each pair.
diff --git a/kernel/sbm.c b/kernel/sbm.c
index df57184f5d87..c832808b538e 100644
--- a/kernel/sbm.c
+++ b/kernel/sbm.c
@@ -71,6 +71,40 @@ void sbm_destroy(struct sbm *sbm)
 }
 EXPORT_SYMBOL(sbm_destroy);
 
+void *sbm_map_readonly(struct sbm *sbm, const void *ptr, size_t size)
+{
+	struct sbm_buf buf;
+
+	if (sbm->error)
+		return NULL;
+
+	buf.sbm_ptr = (void *)ptr;
+	buf.size = size;
+	sbm->error = arch_sbm_map_readonly(sbm, &buf);
+	if (sbm->error)
+		return NULL;
+
+	return buf.sbm_ptr;
+}
+EXPORT_SYMBOL(sbm_map_readonly);
+
+void *sbm_map_writable(struct sbm *sbm, const void *ptr, size_t size)
+{
+	struct sbm_buf buf;
+
+	if (sbm->error)
+		return NULL;
+
+	buf.sbm_ptr = (void *)ptr;
+	buf.size = size;
+	sbm->error = arch_sbm_map_writable(sbm, &buf);
+	if (sbm->error)
+		return NULL;
+
+	return buf.sbm_ptr;
+}
+EXPORT_SYMBOL(sbm_map_writable);
+
 /* Copy input buffers into a sandbox. */
 static int sbm_copy_in(struct sbm *sbm)
 {
-- 
2.34.1



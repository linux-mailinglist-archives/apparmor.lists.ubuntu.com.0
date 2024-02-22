Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 157BB85F960
	for <lists+apparmor@lfdr.de>; Thu, 22 Feb 2024 14:16:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rd8vS-0003fO-RO; Thu, 22 Feb 2024 13:15:46 +0000
Received: from frasgout13.his.huawei.com ([14.137.139.46])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <petrtesarik@huaweicloud.com>)
 id 1rd8uf-0003Vx-M7
 for apparmor@lists.ubuntu.com; Thu, 22 Feb 2024 13:14:58 +0000
Received: from mail.maildlp.com (unknown [172.18.186.29])
 by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4TgYBX2HYYz9y3D2
 for <apparmor@lists.ubuntu.com>; Thu, 22 Feb 2024 20:59:32 +0800 (CST)
Received: from mail02.huawei.com (unknown [7.182.16.47])
 by mail.maildlp.com (Postfix) with ESMTP id 77063140A92
 for <apparmor@lists.ubuntu.com>; Thu, 22 Feb 2024 21:14:46 +0800 (CST)
Received: from huaweicloud.com (unknown [10.45.157.235])
 by APP1 (Coremail) with SMTP id LxC2BwDXzhdSSNdlhi4AAw--.34998S7;
 Thu, 22 Feb 2024 14:14:45 +0100 (CET)
From: Petr Tesarik <petrtesarik@huaweicloud.com>
To: Dave Hansen <dave.hansen@intel.com>
Date: Thu, 22 Feb 2024 14:12:30 +0100
Message-Id: <20240222131230.635-6-petrtesarik@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222131230.635-1-petrtesarik@huaweicloud.com>
References: <fb4a40c7-af9a-406a-95ab-406595f3ffe5@intel.com>
 <20240222131230.635-1-petrtesarik@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LxC2BwDXzhdSSNdlhi4AAw--.34998S7
X-Coremail-Antispam: 1UD129KBjvJXoW3Xw48Cryrtw48tFWxGw17ZFb_yoW3JF4UpF
 srCFWDGF4kCF9FvrsxJa1akrWSv3yrXw1av39xGa4Yy3Zxtr4kGr47AFyjkFyrZ3ykC3WF
 gFW7Kr95ur1DArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
 Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
 IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
 Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
 xan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr
 1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
 0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x
 0JUQSdkUUUUU=
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-Mailman-Approved-At: Thu, 22 Feb 2024 13:15:45 +0000
Subject: [apparmor] [RFC 5/5] apparmor: parse profiles in sandbox mode
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

Run aa_unpack() in sandbox mode. Map the input data read-only and then walk
the resulting list created in sandbox mode.

Hashes are calculated in kernel mode, because crypto routines are not
sandboxed. The fixups should sanitize the parameters of AppArmor functions
and they should be defined close to the target functions. Both requires
extending the generic API and adding some more arch hooks, which would grow
this patch series too much.

For demonstration purposes, the fixups blindly trust the input from sandbox
mode and are hard-wired in the arch code.

Signed-off-by: Petr Tesarik <petr.tesarik1@huawei-partners.com>
---
 arch/x86/kernel/sbm/core.c | 15 +++++++++++++++
 security/apparmor/crypto.c |  7 ++++---
 security/apparmor/policy.c | 29 ++++++++++++++++++++++-------
 security/apparmor/secid.c  |  3 ++-
 4 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/sbm/core.c b/arch/x86/kernel/sbm/core.c
index 3cf3842292b9..3268c00da873 100644
--- a/arch/x86/kernel/sbm/core.c
+++ b/arch/x86/kernel/sbm/core.c
@@ -40,6 +40,16 @@ extern char __nosbm_text_start[], __nosbm_text_end[];
  * HACK: PROOF-OF-CONCEPT FIXUP CODE STARTS HERE
  */
 
+/*
+ * HACK: These declarations are needed to make a proxy call, but in the
+ * final version, AppArmor itself will define the proxies. At least, do
+ * not make the functions callable from here. All we need are their
+ * entry point addresses.
+ */
+extern char aa_alloc_secid[];
+extern char aa_calc_hash[];
+extern char aa_calc_profile_hash[];
+
 typedef unsigned long (*sbm_proxy_call_fn)(struct x86_sbm_state *,
 					   unsigned long func,
 					   struct pt_regs *);
@@ -135,6 +145,11 @@ static const struct sbm_fixup fixups[] =
 	{ vzalloc, proxy_alloc1 },
 	{ vfree, proxy_free },
 
+	/* AppArmor */
+	{ aa_alloc_secid, x86_sbm_proxy_call },
+	{ aa_calc_hash, x86_sbm_proxy_call },
+	{ aa_calc_profile_hash, x86_sbm_proxy_call },
+
 	{ }
 };
 
diff --git a/security/apparmor/crypto.c b/security/apparmor/crypto.c
index aad486b2fca6..db349cd4e467 100644
--- a/security/apparmor/crypto.c
+++ b/security/apparmor/crypto.c
@@ -12,6 +12,7 @@
  */
 
 #include <crypto/hash.h>
+#include <linux/sbm.h>
 
 #include "include/apparmor.h"
 #include "include/crypto.h"
@@ -25,7 +26,7 @@ unsigned int aa_hash_size(void)
 	return apparmor_hash_size;
 }
 
-char *aa_calc_hash(void *data, size_t len)
+char * __nosbm aa_calc_hash(void *data, size_t len)
 {
 	SHASH_DESC_ON_STACK(desc, apparmor_tfm);
 	char *hash;
@@ -58,8 +59,8 @@ char *aa_calc_hash(void *data, size_t len)
 	return ERR_PTR(error);
 }
 
-int aa_calc_profile_hash(struct aa_profile *profile, u32 version, void *start,
-			 size_t len)
+int __nosbm aa_calc_profile_hash(struct aa_profile *profile, u32 version, void *start,
+				 size_t len)
 {
 	SHASH_DESC_ON_STACK(desc, apparmor_tfm);
 	int error;
diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index 957654d253dd..f2b9bf851be0 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -74,6 +74,7 @@
 #include <linux/cred.h>
 #include <linux/rculist.h>
 #include <linux/user_namespace.h>
+#include <linux/sbm.h>
 
 #include "include/apparmor.h"
 #include "include/capability.h"
@@ -1040,6 +1041,11 @@ static struct aa_profile *update_to_newest_parent(struct aa_profile *new)
 	return newest;
 }
 
+static SBM_DEFINE_CALL(aa_unpack, struct aa_loaddata *, udata,
+		       struct list_head *, lh, const char **, ns);
+static SBM_DEFINE_THUNK(aa_unpack, struct aa_loaddata *, udata,
+		       struct list_head *, lh, const char **, ns);
+
 /**
  * aa_replace_profiles - replace profile(s) on the profile list
  * @policy_ns: namespace load is occurring on
@@ -1063,12 +1069,20 @@ ssize_t aa_replace_profiles(struct aa_ns *policy_ns, struct aa_label *label,
 	struct aa_loaddata *rawdata_ent;
 	const char *op;
 	ssize_t count, error;
-	LIST_HEAD(lh);
+	struct list_head lh, *sbm_lh;
+	struct sbm sbm;
 
 	op = mask & AA_MAY_REPLACE_POLICY ? OP_PROF_REPL : OP_PROF_LOAD;
 	aa_get_loaddata(udata);
 	/* released below */
-	error = aa_unpack(udata, &lh, &ns_name);
+	sbm_init(&sbm);
+	SBM_MAP_READONLY(&sbm, udata->data, udata->size);
+	/* TODO: Handling of list heads could be improved */
+	sbm_lh = SBM_COPY_OUT(&sbm, &lh, sizeof(lh));
+	INIT_LIST_HEAD(sbm_lh);
+	error = sbm_call(&sbm, aa_unpack,
+			 SBM_COPY_INOUT(&sbm, udata, sizeof(*udata)), sbm_lh,
+			 SBM_COPY_OUT(&sbm, &ns_name, sizeof(ns_name)));
 	if (error)
 		goto out;
 
@@ -1078,7 +1092,7 @@ ssize_t aa_replace_profiles(struct aa_ns *policy_ns, struct aa_label *label,
 	 *       fail. Sort ent list and take ns locks in hierarchy order
 	 */
 	count = 0;
-	list_for_each_entry(ent, &lh, list) {
+	list_for_each_entry(ent, sbm_lh, list) {
 		if (ns_name) {
 			if (ent->ns_name &&
 			    strcmp(ent->ns_name, ns_name) != 0) {
@@ -1128,7 +1142,7 @@ ssize_t aa_replace_profiles(struct aa_ns *policy_ns, struct aa_label *label,
 		}
 	}
 	/* setup parent and ns info */
-	list_for_each_entry(ent, &lh, list) {
+	list_for_each_entry(ent, sbm_lh, list) {
 		struct aa_policy *policy;
 		struct aa_profile *p;
 
@@ -1159,7 +1173,7 @@ ssize_t aa_replace_profiles(struct aa_ns *policy_ns, struct aa_label *label,
 		policy = __lookup_parent(ns, ent->new->base.hname);
 		if (!policy) {
 			/* first check for parent in the load set */
-			p = __list_lookup_parent(&lh, ent->new);
+			p = __list_lookup_parent(sbm_lh, ent->new);
 			if (!p) {
 				/*
 				 * fill in missing parent with null
@@ -1198,7 +1212,7 @@ ssize_t aa_replace_profiles(struct aa_ns *policy_ns, struct aa_label *label,
 			goto fail_lock;
 		}
 	}
-	list_for_each_entry(ent, &lh, list) {
+	list_for_each_entry(ent, sbm_lh, list) {
 		if (!ent->old) {
 			struct dentry *parent;
 			if (rcu_access_pointer(ent->new->parent)) {
@@ -1220,7 +1234,7 @@ ssize_t aa_replace_profiles(struct aa_ns *policy_ns, struct aa_label *label,
 	__aa_bump_ns_revision(ns);
 	if (aa_g_export_binary)
 		__aa_loaddata_update(udata, ns->revision);
-	list_for_each_entry_safe(ent, tmp, &lh, list) {
+	list_for_each_entry_safe(ent, tmp, sbm_lh, list) {
 		list_del_init(&ent->list);
 		op = (!ent->old && !ent->rename) ? OP_PROF_LOAD : OP_PROF_REPL;
 
@@ -1265,6 +1279,7 @@ ssize_t aa_replace_profiles(struct aa_ns *policy_ns, struct aa_label *label,
 	mutex_unlock(&ns->lock);
 
 out:
+	sbm_destroy(&sbm);
 	aa_put_ns(ns);
 	aa_put_loaddata(udata);
 	kfree(ns_name);
diff --git a/security/apparmor/secid.c b/security/apparmor/secid.c
index 83d3d1e6d9dc..4190666d2dee 100644
--- a/security/apparmor/secid.c
+++ b/security/apparmor/secid.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/xarray.h>
+#include <linux/sbm.h>
 
 #include "include/cred.h"
 #include "include/lib.h"
@@ -116,7 +117,7 @@ void apparmor_release_secctx(char *secdata, u32 seclen)
  * Returns: 0 with @label->secid initialized
  *          <0 returns error with @label->secid set to AA_SECID_INVALID
  */
-int aa_alloc_secid(struct aa_label *label, gfp_t gfp)
+int __nosbm aa_alloc_secid(struct aa_label *label, gfp_t gfp)
 {
 	unsigned long flags;
 	int ret;
-- 
2.34.1



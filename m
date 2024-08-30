Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 13152965406
	for <lists+apparmor@lfdr.de>; Fri, 30 Aug 2024 02:34:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sjpar-0007pC-6q; Fri, 30 Aug 2024 00:34:25 +0000
Received: from sonic305-28.consmr.mail.ne1.yahoo.com ([66.163.185.154])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <casey@schaufler-ca.com>)
 id 1sjpan-0007nf-Js
 for apparmor@lists.ubuntu.com; Fri, 30 Aug 2024 00:34:21 +0000
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1724978060; bh=EOwhmIPAhq/w0yMoYDrGNlwJMFYd/quWlFGVUUz1v2q=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=Kj2ZLc1KjEGS0Je69A71M5Eqh5Tt7YyviRCXUD24AmQofaSfBsiu4zqjYIUtTwUh5ILNa97Cv0n7PnB7rfHQ+s9zD7IZa4Msdi+vQVajMz19BYyEINFxUvd9M2u67pL7SP0sKVSiDagqUCP02mw3JVXRysGKzB3grWOwxCdqwGhLxlgr8C/JW3dXBcRZsPRBCwSzkjL4ji/lSsRnRF6oMydCT7Ds4rnAMNURHI9dRin65unD65IM07vsx8bf3WsfaJ0eu5YFgn7HHzi9Wd6TDGNlwP7fd33E5xCschJ8sY8ijbtrx/g2gWuixGRiH4DanxI7noqpOOcPs8Yd5S5JXA==
X-YMail-OSG: YYVzUfkVM1lfwkcIV7TZJMCj0TIWYKu9LJGTja0XxOX3y6CfLcHG30Ugl7TkK9w
 WMuNWgYNGVpy57EfD1IZdeLxN7TBSEew7AyGNRYxjdrZpLet3jWZ6JMiJeNuWiOXjXgQ1Ikd6ZOD
 GUdzbQHcOtrY3RycDWoNCl3v9XHYaOaaOclEKoa6HO4TnJe9EmJaPOu5I6lrsHizti.scApxO1Ga
 8cEbtBthLeNCq.aklDmPYLj4OYmtOAGU6u65lQZt7LlIO.1Mz8sy2GAmXdebHVjpRq3RJUubWEeW
 6gq1eJyssQXPqUjjtJn1FPrHTZwB_eA41JeamkxOkU85yR47JDZh4uJSTOzJqNMCv_vfBLDa61kj
 Q2GtY2aaMNgDUDkGzECZV9UBJrHxqhIyH8.NrZSn4JBkhQvbDPzaA_Qr1nEeZ5zVp.tFz7BjYS1u
 icA83xKlbg4B.ZvERoREjf2KcmFwnC9_TB00U.YOBdGLirHcvMVtUQZpMxztHf8Dla3JlZ7VV09u
 RSfplnS6iFF8gPCvW0_aSl9vxpx_LaeMB6PcSt_IkdRBnwhqTxbx7.dFZzafAMNY3bCjJCOh.AcE
 3V6od4znnHkRpeqqSw6oLJHqaYY1iYAb9ik_6dtQx6x_m1txi0FNfG_8gvs2Nd.IEzKkUweABIuL
 D3ZGPXQmvGxItT3NVKhh5PX3W2joiN6ZtxL6pWzQeoYG82LTwpmPdB15JQbhTF5VfgB1IDNYPVHI
 2hQgM9X2O3vmQl3in.ySXZdRu1RPBiMPdlC.7DiliUWlsK3GMZ5kRDQZPzAOKgE1EsZTgQFsKXk.
 TmkTAnT57xUT3zX5x9if_0WPNinmsv_nP.jzNrzt8i5sFOpHQ0eBFZkHK0IA0S1sjWS.csIoc.7R
 pbxv_hhZMcY4nPl1AdMfQx36XR1qEYX2SSxJoM31N9MwHQcUK1SfB5k7ytmLrB1qJbqgQqKwocL3
 ep4FNVotZbE93Pgtiv8Xg90a4JUXCzTIOMOxSUIw_sTEpAu67fjfzgr8MAJ3ih6sgJb13XC_nAl1
 Y02KoHNwlMKhrTBS8G6tRhT2UHZiKCjpqAi4KiGf6gWdDi9rxrMP5yAYxVg_ExjiCveAObVyEZ8x
 KO9Yn9fSEHMOmgyr4GARqtVicF7_t4AKTGGOieZJQFY9R7YqY9X644mM2sJct5ebDTPaWHc4Mceh
 1NoRfm9vCRfmVxXy7_YwQ9FB8RZW9fE9zmlP6oFadpvKIKpe1sg74QM17CaOmMGCNjn3OzspBxaA
 6_SafJsfAzEp8YDd0TrRII7x57_tHk591nZBOaQY2Z0SKLaGF3sCVgToo0fSfMrCIHU0AZ0Dlg5A
 edciza5.ggLQaW041IkCzKFp0.C8xygzX.I2XTRcS849BSkMhcbVL6Y0VvBMoblgdk8SEloN9dXE
 u8pVOTFUpZQh7ap.ov_HUUZNktFzccMdjSko2HWLzV_.nfGk85kzBpHoIlqg4OU4U6WLd2cv4aBd
 HBcOUVa61P8EV8cLqhvNG5fh8k38o4DsJd9K8p24g6kCRwGttyz7oTdfq8LdEACWZZsjtMXXKbnA
 FCWc74r1oBmVxNmaMZzxRCYoL341ziMXYr_3R3CvazxrA.3ZlWlJwMWwMWIbTzOteWFDQQYDZ4yk
 EoShXUFy0rKXH9uALENk1X46mRHJYF4ELOHN8s7S5CxcWNU7eNnFE6DTE0XO8yq0R6aTNG4Hnwgj
 I00zFQGZXdxB8gWv8hL8UYYDYBSGo8xSjUE7ZmahJPPTQSzfmyfFWQgArz7keC9mEcSBKoFoAFtC
 X3KBoJkCQDPZ0Agr0RtPtpQKujX8fHGCscndW0Ds7HiJo6ADLs8xiPBJ5i0zGA2mQFkP8Z214zcv
 tlfVeG_SOKQzPF2urDrtCw1q5XPuvRahxYIUDrRAVNBN_9Oy7593FXDI6dnnZDvdt9wmkqBpAmKZ
 K.Jj03MfK1C0DQitNcOkvONnNB5YBCduXgL9P33fnUz9wloROwdemhQ2nKDGYpa48Wt8tBRRKXgB
 EHi1xQfw5KtmRTwYlWXmmWRznPcteZEqKPVBZY2EPcGBMb0OPgtOug2A3YafjfnYlMBPP.0i_.Ff
 I92tlvoaz5F9YpNIH_kAqAdX6qv4YSMOyHsNcWCwJKT4cn4n3DGkUY6FPcjEbKFPiEqGHMSgHoGm
 ZYqtPYF7xgdfmUcogk4I5FLuxKoZS7jWXZ4BU5HgmsitA7yuhvA5AOC.kiOkBPTWXJbL4NCFUyjR
 tEM780FbkStD1Qd79C2xOJKigg2kCFMMn8WR29cv0Pfx2A1tEZD_IzYS84SOYwb1cj7YHXvI2Jsd
 ZMh_jymxXVM0BZHXwJTZVdKU4vb_8BTRM4w--
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 053e8715-dae5-4eff-baae-808d9e5b2d56
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.ne1.yahoo.com with HTTP; Fri, 30 Aug 2024 00:34:20 +0000
Received: by hermes--production-gq1-5d95dc458-gnv6n (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 5da78dbe3e0c562970426cfb16ce357c; 
 Fri, 30 Aug 2024 00:34:16 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey@schaufler-ca.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Date: Thu, 29 Aug 2024 17:33:59 -0700
Message-ID: <20240830003411.16818-2-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830003411.16818-1-casey@schaufler-ca.com>
References: <20240830003411.16818-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=66.163.185.154;
 envelope-from=casey@schaufler-ca.com;
 helo=sonic305-28.consmr.mail.ne1.yahoo.com
Subject: [apparmor] [PATCH v2 01/13] LSM: Add the lsmblob data structure.
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
Cc: keescook@chromium.org, penguin-kernel@i-love.sakura.ne.jp,
 stephen.smalley.work@gmail.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, selinux@vger.kernel.org, mic@digikod.net,
 bpf@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

When more than one security module is exporting data to audit and
networking sub-systems a single 32 bit integer is no longer
sufficient to represent the data. Add a structure to be used instead.

The lsmblob structure definition is intended to keep the LSM
specific information private to the individual security modules.
The module specific information is included in a new set of
header files under include/lsm. Each security module is allowed
to define the information included for its use in the lsmblob.
SELinux includes a u32 secid. Smack includes a pointer into its
global label list. The conditional compilation based on feature
inclusion is contained in the include/lsm files.

Suggested-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
Cc: apparmor@lists.ubuntu.com
Cc: bpf@vger.kernel.org
Cc: selinux@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
---
 include/linux/lsm/apparmor.h | 17 +++++++++++++++++
 include/linux/lsm/bpf.h      | 16 ++++++++++++++++
 include/linux/lsm/selinux.h  | 16 ++++++++++++++++
 include/linux/lsm/smack.h    | 17 +++++++++++++++++
 include/linux/security.h     | 20 ++++++++++++++++++++
 5 files changed, 86 insertions(+)
 create mode 100644 include/linux/lsm/apparmor.h
 create mode 100644 include/linux/lsm/bpf.h
 create mode 100644 include/linux/lsm/selinux.h
 create mode 100644 include/linux/lsm/smack.h

diff --git a/include/linux/lsm/apparmor.h b/include/linux/lsm/apparmor.h
new file mode 100644
index 000000000000..11521f66d548
--- /dev/null
+++ b/include/linux/lsm/apparmor.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Linux Security Module interface to other subsystems.
+ * AppArmor presents single pointer to an aa_label structure.
+ */
+#ifndef __LINUX_LSM_APPARMOR_H
+#define __LINUX_LSM_APPARMOR_H
+
+struct aa_label;
+
+struct lsmblob_apparmor {
+#ifdef CONFIG_SECURITY_APPARMOR
+	struct aa_label *label;
+#endif
+};
+
+#endif /* ! __LINUX_LSM_APPARMOR_H */
diff --git a/include/linux/lsm/bpf.h b/include/linux/lsm/bpf.h
new file mode 100644
index 000000000000..48abdcd82ded
--- /dev/null
+++ b/include/linux/lsm/bpf.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Linux Security Module interface to other subsystems.
+ * BPF may present a single u32 value.
+ */
+#ifndef __LINUX_LSM_BPF_H
+#define __LINUX_LSM_BPF_H
+#include <linux/types.h>
+
+struct lsmblob_bpf {
+#ifdef CONFIG_BPF_LSM
+	u32 secid;
+#endif
+};
+
+#endif /* ! __LINUX_LSM_BPF_H */
diff --git a/include/linux/lsm/selinux.h b/include/linux/lsm/selinux.h
new file mode 100644
index 000000000000..fd16456b36ac
--- /dev/null
+++ b/include/linux/lsm/selinux.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Linux Security Module interface to other subsystems.
+ * SELinux presents a single u32 value which is known as a secid.
+ */
+#ifndef __LINUX_LSM_SELINUX_H
+#define __LINUX_LSM_SELINUX_H
+#include <linux/types.h>
+
+struct lsmblob_selinux {
+#ifdef CONFIG_SECURITY_SELINUX
+	u32 secid;
+#endif
+};
+
+#endif /* ! __LINUX_LSM_SELINUX_H */
diff --git a/include/linux/lsm/smack.h b/include/linux/lsm/smack.h
new file mode 100644
index 000000000000..2018f288302f
--- /dev/null
+++ b/include/linux/lsm/smack.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Linux Security Module interface to other subsystems.
+ * Smack presents a pointer into the global Smack label list.
+ */
+#ifndef __LINUX_LSM_SMACK_H
+#define __LINUX_LSM_SMACK_H
+
+struct smack_known;
+
+struct lsmblob_smack {
+#ifdef CONFIG_SECURITY_SMACK
+	struct smack_known *skp;
+#endif
+};
+
+#endif /* ! __LINUX_LSM_SMACK_H */
diff --git a/include/linux/security.h b/include/linux/security.h
index 1390f1efb4f0..0057a22137e8 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -34,6 +34,10 @@
 #include <linux/sockptr.h>
 #include <linux/bpf.h>
 #include <uapi/linux/lsm.h>
+#include <linux/lsm/selinux.h>
+#include <linux/lsm/smack.h>
+#include <linux/lsm/apparmor.h>
+#include <linux/lsm/bpf.h>
 
 struct linux_binprm;
 struct cred;
@@ -140,6 +144,22 @@ enum lockdown_reason {
 	LOCKDOWN_CONFIDENTIALITY_MAX,
 };
 
+/* scaffolding */
+struct lsmblob_scaffold {
+	u32 secid;
+};
+
+/*
+ * Data exported by the security modules
+ */
+struct lsmblob {
+	struct lsmblob_selinux selinux;
+	struct lsmblob_smack smack;
+	struct lsmblob_apparmor apparmor;
+	struct lsmblob_bpf bpf;
+	struct lsmblob_scaffold scaffold;
+};
+
 extern const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1];
 extern u32 lsm_active_cnt;
 extern const struct lsm_id *lsm_idlist[];
-- 
2.46.0



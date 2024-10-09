Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABF8997311
	for <lists+apparmor@lfdr.de>; Wed,  9 Oct 2024 19:32:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1syaY9-0004IK-6o; Wed, 09 Oct 2024 17:32:37 +0000
Received: from sonic314-26.consmr.mail.ne1.yahoo.com ([66.163.189.152])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <casey@schaufler-ca.com>)
 id 1syaY7-0004Hu-Cb
 for apparmor@lists.ubuntu.com; Wed, 09 Oct 2024 17:32:35 +0000
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1728495153; bh=Qa9DUyqQ9rBXIBZupJu3+sgoFfauEWJBJ2bwLO45hq0=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=EEm6TbiG+ly7kMu0aAK+ohGEaRl1V63T+Ot68eKK6npR0UfdIB4hQ4VvVW6Lz8DQQLZnb7l/7zfqWChettZa5UZEtBip03IFi4AafGoNqjy4vY8bn0t57EqSXAP+A5VVlHLDJOBIeHfSDsMYkFoKsGi87nJrMDbVsWpBSIHfe8m+24pHoYzdO600l1+W81Yskjdt6SLxs6szLL46adCXdScgDrU25x65Ofx2pKt+CMg4AGwksvExjn0+KxYmAWyDNZwQHEe3FPcKaU9VwivGh4aCXIXTLEzKeTSMxPMkQCcXbt7QjAGy0ge4BnErP68+DmGeoX8t/OyR5npUuhGS7w==
X-YMail-OSG: eYN4iQYVM1n41XBMq4.EVyKQpeLKlUZwfvxzyt6HP0KYLNvsLFqrAllNtqhLWhP
 Az53i8MIUewh1caEIrf7L3cW5JNuekWer15wHz_XxNYrYRDKv6LauAtIF_u0nkSixHdx5D8cURQA
 5hh0fAvRxNL8TbCDLPRI_Iddt1Z9QqOZX66VIa.oFfWi0JeJ3tAnGlZUjqRgO0TzSnddw5c_32kb
 5okAFGHejWzpCNZczvhCCoHsWVgIL6QgRgKHwwAYIe3S2Ia03gviLfR4z3Ar9rF0rJKj8cR.EoE4
 z091lt3x6i4Ztmx12hPqR3ZbuWTzrulFSYa8JYzpp7a_csBWs1ckkWY8nQEqS4CbAyShEZJFVJcN
 3XqKUdAxbcWNFoHdLfphGzhmJ2NeIsfzAXVtNX_75TMWAUC6ba3gd6pyLdLUfBQeqRcIdFu4EP7D
 atkHhpoSVA6JmNV7ylYloxXRshrQXWzpzO39mF9PaSeaeoo6V_rdwLSJoHjSUaB.ZfILjODq1OT_
 sjb_PBTL7CvY0kNu6PZUjN1pOQCMviesX2c5jg8w22vOcPajT_ro7M0a1ylgikZjYk7uqyqprss3
 3BNBMR4_alJSMLSAgx5E3ikh_AmEZWFSuchm5rjFwtOB4g6.9BVKkMyCXNf0rfZBrR6oPbxywh_K
 EA6YRn7DVEK1CYjKHK9z75i0DeEPx_Oam2X.vOA1XBT22rf5VY0TSEfWkOZN0fheRvzVI.fWRHKS
 jCP6SCoqK6yL.pGomNBhBuTxPj_09pEbyX1YxBFkNEzsjYGjUyH_gGgOETokcoOCAr_3INvG7lgv
 gRdZpd3R9jVUghTNdQ.fNO27k_PHKMFBs0ax69HGEYnfMWyHfkdpM.PsiP19z9fAhTZXx4lpaFNV
 9FSqefI3LOy1QNcX_5sQ273cxoI3x9AfzxNpZQX7uKR.L2a12TJblCQdZaPO9ISwRGJjBhp7jrLo
 sSe4iR7yfHjZuNX1Ln6YhDaMcmmGxPS9GSzv4NTdYUjibNe3lyO9f.A8cx4f1buGEoDWx9EwqdAH
 mTxEH5Kx01BDr7kRy4Ae1m6Rx.pqx.7FqW9hwIECenMynyreE9FcS9J90eI5HAO2xHhx3j0ZF273
 qrjs0YuFlkrJkLWE9P6hwdstyvV2.wmUHCm0WZAeB.lQk0rynhZCOOF8ngHmjWUfzvexnmGVVFBd
 b9xwivIV5qH5RDlY937r3Wm6dU65GZZHk598bdATbvFHuDES5JP44mT3yLw.b2oWgvYMDg2FFNQ.
 GDx_ewp14Vpcwp_Z234mFBhSvgONKwmNyJ_JQaAxSAP6f_kefBExotmBxVQ.cLuY3oLLU8aquRKA
 .4N5U25jpfodel6OIDDReJG2zLNE368qw_Nlail9UqzykIi2kM.SwUwZ0t.tmdtqNe_kWoXIqbHf
 GkX.EZIjwb9SMWLV3.mVu8NNG0M8dpmfdnoDum_YvGgC.kwbFmXYSI4u0ZecfS6aVxqDGq8wLQL3
 GrjmSFxihpTUaskLMGAHY76Q_VoJKBakNXdUYw2HA..kYbAIUWTYYUc4EXvDy6Gg2MwfhNSesysv
 VeE6GgN8BtZwC1eQ86REgIdBEF9_J7hf0Kv_jP7rSh6OWrLbv34RkTpzuCgcQeokqTKF6eDh93Ar
 QDo37uloFRVLQrCEhQI7skpprAkNvOJl.PEe7yRpfCMJYG6wDBfms67vH.PgYtLiNh81.aIA60.P
 WfL3fOYSgtMiczE7T_KrC1C85z_LNIITFoZ7WzP9ax_tKewTkaQ_XzDDxqXEYJbFGVTmeglUibcp
 Y3NY6uFr3w2PvZYzQdnuCnh6fg..t73bbnDIDkH_19pl1dFm5DufaQzrbWYONbyp.1zv8Y0kdNLu
 UfpEYbVjEoVYgsGIQr0IhAyWvaP6ODSE1yBlsoXuqtYsYVvkjdL_3C3ixQKx24gOgAGxngqeOGgF
 NF9uyIn7lGP.sv3.Wjf436njySvKQGqG7tSF2k_Ii3vHs3niRMk8PASnSk5XYRNQ71JlI9kvx51M
 6lt6.SlWJyGO34hYnFKMVhe54ALuu0d8Ma4hQI2o.FcDlOmj6IfG7VikZvx6lthXk9yyeCNnrJ22
 e1ny6yjp0wVf0R1xOBOfNyvIuUOxufO6QN7FN6Reduo9XPNm4R6ErcO2yWJpcO33p7RrUWh8k2f.
 1xLHItAsZAgjvNwVP1yPsvwhGUKVdQ5Tro31487k0ti9YXWkVtL29jpAP44Q0W1FRNp46EZStwz3
 vcq7_wfLFnG1CeWplKAzzh1w_pLOus380Fhz.ifhNBZtn6Dp8ITjYjItxmr8i.GOaeDND_2h5a95
 a0JLGft21Uae74G.1fb.scgoPdSInLNysJ3GP31s-
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 8ea8d104-f8f6-4f4b-981e-98d68358a75b
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ne1.yahoo.com with HTTP; Wed, 9 Oct 2024 17:32:33 +0000
Received: by hermes--production-gq1-5d95dc458-rvnnh (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 5fec0e30966313b56a0d7e944fb52df1; 
 Wed, 09 Oct 2024 17:32:27 +0000 (UTC)
From: Casey Schaufler <casey@schaufler-ca.com>
To: casey@schaufler-ca.com, paul@paul-moore.com,
 linux-security-module@vger.kernel.org
Date: Wed,  9 Oct 2024 10:32:09 -0700
Message-ID: <20241009173222.12219-2-casey@schaufler-ca.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241009173222.12219-1-casey@schaufler-ca.com>
References: <20241009173222.12219-1-casey@schaufler-ca.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=66.163.189.152;
 envelope-from=casey@schaufler-ca.com;
 helo=sonic314-26.consmr.mail.ne1.yahoo.com
Subject: [apparmor] [PATCH v4 01/13] LSM: Add the lsm_prop data structure.
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

The lsm_prop structure definition is intended to keep the LSM
specific information private to the individual security modules.
The module specific information is included in a new set of
header files under include/lsm. Each security module is allowed
to define the information included for its use in the lsm_prop.
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
index 000000000000..612cbfacb072
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
+struct lsm_prop_apparmor {
+#ifdef CONFIG_SECURITY_APPARMOR
+	struct aa_label *label;
+#endif
+};
+
+#endif /* ! __LINUX_LSM_APPARMOR_H */
diff --git a/include/linux/lsm/bpf.h b/include/linux/lsm/bpf.h
new file mode 100644
index 000000000000..8106e206fcef
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
+struct lsm_prop_bpf {
+#ifdef CONFIG_BPF_LSM
+	u32 secid;
+#endif
+};
+
+#endif /* ! __LINUX_LSM_BPF_H */
diff --git a/include/linux/lsm/selinux.h b/include/linux/lsm/selinux.h
new file mode 100644
index 000000000000..9455a6b5b910
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
+struct lsm_prop_selinux {
+#ifdef CONFIG_SECURITY_SELINUX
+	u32 secid;
+#endif
+};
+
+#endif /* ! __LINUX_LSM_SELINUX_H */
diff --git a/include/linux/lsm/smack.h b/include/linux/lsm/smack.h
new file mode 100644
index 000000000000..ff730dd7a734
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
+struct lsm_prop_smack {
+#ifdef CONFIG_SECURITY_SMACK
+	struct smack_known *skp;
+#endif
+};
+
+#endif /* ! __LINUX_LSM_SMACK_H */
diff --git a/include/linux/security.h b/include/linux/security.h
index b86ec2afc691..555249a8d121 100644
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
@@ -152,6 +156,22 @@ enum lockdown_reason {
 	LOCKDOWN_CONFIDENTIALITY_MAX,
 };
 
+/* scaffolding */
+struct lsm_prop_scaffold {
+	u32 secid;
+};
+
+/*
+ * Data exported by the security modules
+ */
+struct lsm_prop {
+	struct lsm_prop_selinux selinux;
+	struct lsm_prop_smack smack;
+	struct lsm_prop_apparmor apparmor;
+	struct lsm_prop_bpf bpf;
+	struct lsm_prop_scaffold scaffold;
+};
+
 extern const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1];
 extern u32 lsm_active_cnt;
 extern const struct lsm_id *lsm_idlist[];
-- 
2.46.0



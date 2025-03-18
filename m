Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A9FA68728
	for <lists+apparmor@lfdr.de>; Wed, 19 Mar 2025 09:45:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tup3K-0004vG-CO; Wed, 19 Mar 2025 08:45:30 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mjguzik@gmail.com>) id 1tuf5G-00019o-Ud
 for apparmor@lists.ubuntu.com; Tue, 18 Mar 2025 22:06:51 +0000
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so2114568f8f.3
 for <apparmor@lists.ubuntu.com>; Tue, 18 Mar 2025 15:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742335610; x=1742940410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=azV9Px14u8te52TUT3fVASbKBG6+YANqKIVyku+TkMU=;
 b=hELAt4uVoXq5ZNyD3TfQ/kUKLinnN6UMHCRSMjCDid4OdFwB8Nz8Lp1WSa4LQUcxB4
 D1JUCsehwrn4ogntAx3j2KNaXbWr5LWBQ4vyMfRjxI62H2fmDBIkhRKDhtiQeT+PWPY6
 9cgorI80m6U9ZDmlEEH+XJDP9CFwpn6bWK/3GLKTY2iCUeU1/nHUbTHmwH7vpBqMQRwk
 Sp2hrEEa8RDNpY/RsnbQdhST/zYLB0exJ0eFkqtUz3HNuhcqMLZ8VUUeePhtQG1E3hc9
 C+lGDxBAEoHx2kZbiWBp+jUbRxmNMWRUqUVX0nY6xBV0S7FXOunZ1IrWCT+zX6sbKxhl
 4n1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt3dCOQsDS8BqvIvs4pYp1llCnm6V3yCoS/6koMYtCsRdKrw1OmfEfkSgwF54VDZDf8MbQDlg6Ew==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxGVRxXjQYT/+wkgic5mC3RvySt1WrE68eQuLFvNby4yT0l+WF1
 ELgaVZMwBNlmehS/qLNB1xNfDyPz+WpRZHjIE6wUBgaWTQ9e10X6
X-Gm-Gg: ASbGnctYpmZZXl+9kPQUZkr4ItxeLDXbRA9QZ7PG3/PLJ2xkUPf3ZznJUQz2IHN2WXr
 LcbwgQj1xXqTEDrYsCiLbgVwnDd8alzBoL6GV58+Y3QPzSgeplI3twTMXYR0RSEPeqiV+R6V9ps
 V3AzC0242A/LCrNi+Te7YBP+6EbL10NSECVESw8QMW8oD3qTKWvxsJskBRkPRkYqPWL+SiOynBX
 iMttLpyFDAII4M3Vz1ghFvIDfyOC8b7c/X0bCEiYW3sy7tWxMGvsDQ8ho5iV9B59RYqeFRv1lqA
 82wmHW95KL/qOQM6sdEgm9DYuKMsevvD+8vgjePw7lCNK452JeBNLAnuQiXYBOM=
X-Google-Smtp-Source: AGHT+IHVblDvaqJD4SXFVJn+DAZiYcrD36QwtzhDusgGX6AiWXi+pyerzI+dkxnPboYOaWgPGcuKZA==
X-Received: by 2002:a5d:6d8e:0:b0:391:1222:b444 with SMTP id
 ffacd0b85a97d-399739bedaamr417252f8f.20.1742335609927; 
 Tue, 18 Mar 2025 15:06:49 -0700 (PDT)
Received: from f.. (cst-prg-67-174.cust.vodafone.cz. [46.135.67.174])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39965410600sm7274438f8f.50.2025.03.18.15.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 15:06:49 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: john.johansen@canonical.com
Date: Tue, 18 Mar 2025 23:06:41 +0100
Message-ID: <20250318220641.1811093-1-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.221.43; envelope-from=mjguzik@gmail.com;
 helo=mail-wr1-f43.google.com
X-Mailman-Approved-At: Wed, 19 Mar 2025 08:45:29 +0000
Subject: [apparmor] [PATCH] apparmor: make
	__begin_current_label_crit_section() indicate whether put is needed
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
Cc: linux-security-module@vger.kernel.org, Mateusz Guzik <mjguzik@gmail.com>,
 apparmor@lists.ubuntu.com, paul@paul-moore.com, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Same as aa_get_newest_cred_label_condref().

This avoids a bunch of work overall and allows the compiler to note when no
clean up is necessary, allowing for tail calls.

This in particular happens in apparmor_file_permission(), which manages to
tail call aa_file_perm() 105 bytes in (vs a regular call 112 bytes in
followed by branches to figure out if clean up is needed).

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 security/apparmor/include/cred.h | 21 ++++++---
 security/apparmor/lsm.c          | 75 ++++++++++++++++++++------------
 security/apparmor/policy.c       | 12 ++---
 3 files changed, 67 insertions(+), 41 deletions(-)

diff --git a/security/apparmor/include/cred.h b/security/apparmor/include/cred.h
index 7265d2f81dd5..fc5791937694 100644
--- a/security/apparmor/include/cred.h
+++ b/security/apparmor/include/cred.h
@@ -114,7 +114,12 @@ static inline struct aa_label *aa_get_current_label(void)
 	return aa_get_label(l);
 }
 
-#define __end_current_label_crit_section(X) end_current_label_crit_section(X)
+static inline void __end_current_label_crit_section(struct aa_label *label,
+						    bool needput)
+{
+	if (unlikely(needput))
+		aa_put_label(label);
+}
 
 /**
  * end_label_crit_section - put a reference found with begin_current_label..
@@ -142,13 +147,16 @@ static inline void end_current_label_crit_section(struct aa_label *label)
  * critical section between __begin_current_label_crit_section() ..
  * __end_current_label_crit_section()
  */
-static inline struct aa_label *__begin_current_label_crit_section(void)
+static inline struct aa_label *__begin_current_label_crit_section(bool *needput)
 {
 	struct aa_label *label = aa_current_raw_label();
 
-	if (label_is_stale(label))
-		label = aa_get_newest_label(label);
+	if (label_is_stale(label)) {
+		*needput = true;
+		return aa_get_newest_label(label);
+	}
 
+	*needput = false;
 	return label;
 }
 
@@ -184,10 +192,11 @@ static inline struct aa_ns *aa_get_current_ns(void)
 {
 	struct aa_label *label;
 	struct aa_ns *ns;
+	bool needput;
 
-	label  = __begin_current_label_crit_section();
+	label  = __begin_current_label_crit_section(&needput);
 	ns = aa_get_ns(labels_ns(label));
-	__end_current_label_crit_section(label);
+	__end_current_label_crit_section(label, needput);
 
 	return ns;
 }
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 7952e8cab353..c2be3c6f9d3e 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -127,14 +127,15 @@ static int apparmor_ptrace_access_check(struct task_struct *child,
 	struct aa_label *tracer, *tracee;
 	const struct cred *cred;
 	int error;
+	bool needput;
 
 	cred = get_task_cred(child);
 	tracee = cred_label(cred);	/* ref count on cred */
-	tracer = __begin_current_label_crit_section();
+	tracer = __begin_current_label_crit_section(&needput);
 	error = aa_may_ptrace(current_cred(), tracer, cred, tracee,
 			(mode & PTRACE_MODE_READ) ? AA_PTRACE_READ
 						  : AA_PTRACE_TRACE);
-	__end_current_label_crit_section(tracer);
+	__end_current_label_crit_section(tracer, needput);
 	put_cred(cred);
 
 	return error;
@@ -145,14 +146,15 @@ static int apparmor_ptrace_traceme(struct task_struct *parent)
 	struct aa_label *tracer, *tracee;
 	const struct cred *cred;
 	int error;
+	bool needput;
 
-	tracee = __begin_current_label_crit_section();
+	tracee = __begin_current_label_crit_section(&needput);
 	cred = get_task_cred(parent);
 	tracer = cred_label(cred);	/* ref count on cred */
 	error = aa_may_ptrace(cred, tracer, current_cred(), tracee,
 			      AA_PTRACE_TRACE);
 	put_cred(cred);
-	__end_current_label_crit_section(tracee);
+	__end_current_label_crit_section(tracee, needput);
 
 	return error;
 }
@@ -221,12 +223,13 @@ static int common_perm(const char *op, const struct path *path, u32 mask,
 {
 	struct aa_label *label;
 	int error = 0;
+	bool needput;
 
-	label = __begin_current_label_crit_section();
+	label = __begin_current_label_crit_section(&needput);
 	if (!unconfined(label))
 		error = aa_path_perm(op, current_cred(), label, path, 0, mask,
 				     cond);
-	__end_current_label_crit_section(label);
+	__end_current_label_crit_section(label, needput);
 
 	return error;
 }
@@ -524,14 +527,15 @@ static int common_file_perm(const char *op, struct file *file, u32 mask,
 {
 	struct aa_label *label;
 	int error = 0;
+	bool needput;
 
 	/* don't reaudit files closed during inheritance */
-	if (file->f_path.dentry == aa_null.dentry)
+	if (unlikely(file->f_path.dentry == aa_null.dentry))
 		return -EACCES;
 
-	label = __begin_current_label_crit_section();
+	label = __begin_current_label_crit_section(&needput);
 	error = aa_file_perm(op, current_cred(), label, file, mask, in_atomic);
-	__end_current_label_crit_section(label);
+	__end_current_label_crit_section(label, needput);
 
 	return error;
 }
@@ -664,15 +668,16 @@ static int apparmor_uring_override_creds(const struct cred *new)
 	struct aa_profile *profile;
 	struct aa_label *label;
 	int error;
+	bool needput;
 	DEFINE_AUDIT_DATA(ad, LSM_AUDIT_DATA_NONE, AA_CLASS_IO_URING,
 			  OP_URING_OVERRIDE);
 
 	ad.uring.target = cred_label(new);
-	label = __begin_current_label_crit_section();
+	label = __begin_current_label_crit_section(&needput);
 	error = fn_for_each(label, profile,
 			profile_uring(profile, AA_MAY_OVERRIDE_CRED,
 				      cred_label(new), CAP_SYS_ADMIN, &ad));
-	__end_current_label_crit_section(label);
+	__end_current_label_crit_section(label, needput);
 
 	return error;
 }
@@ -688,14 +693,15 @@ static int apparmor_uring_sqpoll(void)
 	struct aa_profile *profile;
 	struct aa_label *label;
 	int error;
+	bool needput;
 	DEFINE_AUDIT_DATA(ad, LSM_AUDIT_DATA_NONE, AA_CLASS_IO_URING,
 			  OP_URING_SQPOLL);
 
-	label = __begin_current_label_crit_section();
+	label = __begin_current_label_crit_section(&needput);
 	error = fn_for_each(label, profile,
 			profile_uring(profile, AA_MAY_CREATE_SQPOLL,
 				      NULL, CAP_SYS_ADMIN, &ad));
-	__end_current_label_crit_section(label);
+	__end_current_label_crit_section(label, needput);
 
 	return error;
 }
@@ -706,6 +712,7 @@ static int apparmor_sb_mount(const char *dev_name, const struct path *path,
 {
 	struct aa_label *label;
 	int error = 0;
+	bool needput;
 
 	/* Discard magic */
 	if ((flags & MS_MGC_MSK) == MS_MGC_VAL)
@@ -713,7 +720,7 @@ static int apparmor_sb_mount(const char *dev_name, const struct path *path,
 
 	flags &= ~AA_MS_IGNORE_MASK;
 
-	label = __begin_current_label_crit_section();
+	label = __begin_current_label_crit_section(&needput);
 	if (!unconfined(label)) {
 		if (flags & MS_REMOUNT)
 			error = aa_remount(current_cred(), label, path, flags,
@@ -732,7 +739,7 @@ static int apparmor_sb_mount(const char *dev_name, const struct path *path,
 			error = aa_new_mount(current_cred(), label, dev_name,
 					     path, type, flags, data);
 	}
-	__end_current_label_crit_section(label);
+	__end_current_label_crit_section(label, needput);
 
 	return error;
 }
@@ -742,12 +749,13 @@ static int apparmor_move_mount(const struct path *from_path,
 {
 	struct aa_label *label;
 	int error = 0;
+	bool needput;
 
-	label = __begin_current_label_crit_section();
+	label = __begin_current_label_crit_section(&needput);
 	if (!unconfined(label))
 		error = aa_move_mount(current_cred(), label, from_path,
 				      to_path);
-	__end_current_label_crit_section(label);
+	__end_current_label_crit_section(label, needput);
 
 	return error;
 }
@@ -756,11 +764,12 @@ static int apparmor_sb_umount(struct vfsmount *mnt, int flags)
 {
 	struct aa_label *label;
 	int error = 0;
+	bool needput;
 
-	label = __begin_current_label_crit_section();
+	label = __begin_current_label_crit_section(&needput);
 	if (!unconfined(label))
 		error = aa_umount(current_cred(), label, mnt, flags);
-	__end_current_label_crit_section(label);
+	__end_current_label_crit_section(label, needput);
 
 	return error;
 }
@@ -984,10 +993,12 @@ static void apparmor_bprm_committed_creds(const struct linux_binprm *bprm)
 
 static void apparmor_current_getlsmprop_subj(struct lsm_prop *prop)
 {
-	struct aa_label *label = __begin_current_label_crit_section();
+	struct aa_label *label;
+	bool needput;
 
+	label = __begin_current_label_crit_section(&needput);
 	prop->apparmor.label = label;
-	__end_current_label_crit_section(label);
+	__end_current_label_crit_section(label, needput);
 }
 
 static void apparmor_task_getlsmprop_obj(struct task_struct *p,
@@ -1002,13 +1013,16 @@ static void apparmor_task_getlsmprop_obj(struct task_struct *p,
 static int apparmor_task_setrlimit(struct task_struct *task,
 		unsigned int resource, struct rlimit *new_rlim)
 {
-	struct aa_label *label = __begin_current_label_crit_section();
+	struct aa_label *label;
 	int error = 0;
+	bool needput;
+
+	label = __begin_current_label_crit_section(&needput);
 
 	if (!unconfined(label))
 		error = aa_task_setrlimit(current_cred(), label, task,
 					  resource, new_rlim);
-	__end_current_label_crit_section(label);
+	__end_current_label_crit_section(label, needput);
 
 	return error;
 }
@@ -1019,6 +1033,7 @@ static int apparmor_task_kill(struct task_struct *target, struct kernel_siginfo
 	const struct cred *tc;
 	struct aa_label *cl, *tl;
 	int error;
+	bool needput;
 
 	tc = get_task_cred(target);
 	tl = aa_get_newest_cred_label(tc);
@@ -1030,9 +1045,9 @@ static int apparmor_task_kill(struct task_struct *target, struct kernel_siginfo
 		error = aa_may_signal(cred, cl, tc, tl, sig);
 		aa_put_label(cl);
 	} else {
-		cl = __begin_current_label_crit_section();
+		cl = __begin_current_label_crit_section(&needput);
 		error = aa_may_signal(current_cred(), cl, tc, tl, sig);
-		__end_current_label_crit_section(cl);
+		__end_current_label_crit_section(cl, needput);
 	}
 	aa_put_label(tl);
 	put_cred(tc);
@@ -1133,10 +1148,11 @@ static int apparmor_unix_stream_connect(struct sock *sk, struct sock *peer_sk,
 	struct aa_sk_ctx *new_ctx = aa_sock(newsk);
 	struct aa_label *label;
 	int error;
+	bool needput;
 
-	label = __begin_current_label_crit_section();
+	label = __begin_current_label_crit_section(&needput);
 	error = unix_connect_perm(current_cred(), label, sk, peer_sk);
-	__end_current_label_crit_section(label);
+	__end_current_label_crit_section(label, needput);
 
 	if (error)
 		return error;
@@ -1163,8 +1179,9 @@ static int apparmor_unix_may_send(struct socket *sock, struct socket *peer)
 	struct aa_sk_ctx *peer_ctx = aa_sock(peer->sk);
 	struct aa_label *label;
 	int error;
+	bool needput;
 
-	label = __begin_current_label_crit_section();
+	label = __begin_current_label_crit_section(&needput);
 	error = xcheck(aa_unix_peer_perm(current_cred(),
 					 label, OP_SENDMSG, AA_MAY_SEND,
 					 sock->sk, peer->sk, NULL),
@@ -1172,7 +1189,7 @@ static int apparmor_unix_may_send(struct socket *sock, struct socket *peer)
 					 peer_ctx->label, OP_SENDMSG,
 					 AA_MAY_RECEIVE,
 					 peer->sk, sock->sk, label));
-	__end_current_label_crit_section(label);
+	__end_current_label_crit_section(label, needput);
 
 	return error;
 }
diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index 1f532fe48a1c..a60bb7d9b583 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -870,11 +870,11 @@ bool aa_policy_admin_capable(const struct cred *subj_cred,
 bool aa_current_policy_view_capable(struct aa_ns *ns)
 {
 	struct aa_label *label;
-	bool res;
+	bool needput, res;
 
-	label = __begin_current_label_crit_section();
+	label = __begin_current_label_crit_section(&needput);
 	res = aa_policy_view_capable(current_cred(), label, ns);
-	__end_current_label_crit_section(label);
+	__end_current_label_crit_section(label, needput);
 
 	return res;
 }
@@ -882,11 +882,11 @@ bool aa_current_policy_view_capable(struct aa_ns *ns)
 bool aa_current_policy_admin_capable(struct aa_ns *ns)
 {
 	struct aa_label *label;
-	bool res;
+	bool needput, res;
 
-	label = __begin_current_label_crit_section();
+	label = __begin_current_label_crit_section(&needput);
 	res = aa_policy_admin_capable(current_cred(), label, ns);
-	__end_current_label_crit_section(label);
+	__end_current_label_crit_section(label, needput);
 
 	return res;
 }
-- 
2.43.0



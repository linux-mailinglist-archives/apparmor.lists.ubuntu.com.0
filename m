Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCXtFAmtFWpkXwcAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 26 May 2026 16:24:09 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AC05D7696
	for <lists+apparmor@lfdr.de>; Tue, 26 May 2026 16:24:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wRshL-00013v-PF; Tue, 26 May 2026 14:23:59 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <linuxoid@gmail.com>)
 id 1wRdPl-0003T6-2F
 for apparmor@lists.ubuntu.com; Mon, 25 May 2026 22:04:49 +0000
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso68453645e9.2
 for <apparmor@lists.ubuntu.com>; Mon, 25 May 2026 15:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779746688; x=1780351488; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7RTCGCGe4Su+57ooJAGzTmDyHCOTy856CxFupslfh74=;
 b=H5kX3mh5KiowZwQj9hJJ3prd4sSMew4ByEmse/s0mAzNRMClPvGjEWtM+0Z114SZKy
 pOnK4YCehqoKUso/1oaxH9mMnwl+/0cY/WXJtbn0ATGJGJwOLgALJShc+9a9szW2Z0es
 B0wizJPTibOlKJL6pCO2DkiWYZ97HW/kRISL4CZ5dp7YCgxkElwH59Br0025NhVqQuj5
 hRDK9uqraUjINSbyJRDFaKGWl1zUIrr9/kqDG++3Rjoyys+Z7b6M99TPP/kIWwmxZGPm
 3y9XKU99NXsRW8s880hLFfJecL3pTIfHOb4WU21iPU0puFUCu0Nbv7tDf/egMn254KNg
 tppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779746688; x=1780351488;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7RTCGCGe4Su+57ooJAGzTmDyHCOTy856CxFupslfh74=;
 b=Gx2JQfIy0DjHYKMy/1uKTpWyoME25VWAMRQKlaQ8rf7/1h1zgf33942t95qqdQIXAt
 5SiV8cizltPBlAyyQJMjEwL/+C8XobkWbDL+dAYPgY6+4DrCoxyHsL9/SU6yGNSiGoGL
 FA3hv0gLJMoCTrS6vM4oNRNNw4p6SOLqroqfFcTexedgs6w0LMYyRzchWkpL+d2B4AsE
 ZYn4BWnUayejuvC/cLPExV/2+bAu9uHoRpMiKJWDadauo4BcKSvr/rQcEONvHD14JPB/
 w9wt4uH4FbySyxQzBBiRtvWC6S4KUVFD9V5d2JT3g143+zo75UiuMPIZbgzQiOtIMDxe
 utBA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8VM2AjSRaUMZh5XfaWn3fZEOr1ow4/pf9+oCdNGwBlLUsgrZonWOYf211bQVO3zT1rbUb65YMfRQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxoyvKn1gknVjvyIhqfYtLFsTYYMDdVmR/CcLxtqJdQcalkQLKM
 0k20MhRCqLgtLeZmiZ9eNK7V3Aw65BeCMNnLR8qbmV2IM6LodM4L6X82
X-Gm-Gg: Acq92OHkPrj7o4e9s8pvwstaqQsbOCjRBFbovXtKO+2EZfzhx37At3LXibIFOy3+z/N
 eWt92KjX/NXFLqXT8jF6Gym8eQb+Pf3VsADHOm6cn6Y8FbpdfsOU1W7nAdnYDy2slIY39lLO396
 WA5j9cimJepyWVKyAjheR1ZR6F9T5krRza5MUzwP9eH4f8JfjzoqpTI0gsMadrn32nU6yTF99my
 4POfd+AYBeyUYK9Dn2vtyuX/NgoaT8zIHqZRkWgODLdE+ajYO25q16UCSCP4fr9ZrDIJICXc3lU
 JLS5KNVxF2QTnDkSE+OpZwlFA84SBvTm3Ncqg/Oo3aHjfrBvGm9LG/qmnmAFBEPj+MlDi9Xp3X4
 mux3/vguT8EVfmVJ9on8X++zzsJ2Gqo+zYechjxZHY6pMGKUlrYLh2FOYjY0OpCb8sbED5RJwlT
 bfLUitamoF+WKxkA4/uXMKuLCl0PMqMNY=
X-Received: by 2002:a05:600d:4453:20b0:490:2238:4021 with SMTP id
 5b1f17b1804b1-49042494fe3mr189225585e9.8.1779746688062; 
 Mon, 25 May 2026 15:04:48 -0700 (PDT)
Received: from x1.tail0e71db.ts.net ([46.140.7.198])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49048f70f55sm80501465e9.17.2026.05.25.15.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 15:04:47 -0700 (PDT)
From: Ruslan Valiyev <linuxoid@gmail.com>
To: John Johansen <john.johansen@canonical.com>
Date: Tue, 26 May 2026 00:04:46 +0200
Message-ID: <20260525220446.975352-1-linuxoid@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.44; envelope-from=linuxoid@gmail.com;
 helo=mail-wm1-f44.google.com
X-Mailman-Approved-At: Tue, 26 May 2026 14:23:56 +0000
Subject: [apparmor] [PATCH] apparmor: fix use-after-free in rawdata dedup
	loop
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
Cc: Paul Moore <paul@paul-moore.com>, linux-kernel@vger.kernel.org,
 apparmor@lists.ubuntu.com, James Morris <jmorris@namei.org>,
 stable@vger.kernel.org, linux-security-module@vger.kernel.org,
 Colin Ian King <colin.i.king@gmail.com>, "Serge E . Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [3.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:linux-kernel@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:stable@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:colin.i.king@gmail.com,m:serge@hallyn.com,m:coliniking@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[paul-moore.com,vger.kernel.org,lists.ubuntu.com,namei.org,gmail.com,hallyn.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linuxoid@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxoid@gmail.com,apparmor-bounces@lists.ubuntu.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.657];
	FORGED_SENDER_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-]
X-Rspamd-Queue-Id: 09AC05D7696
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

aa_replace_profiles() walks ns->rawdata_list to dedup the incoming
policy blob against entries already attached to existing profiles.
Per the kernel-doc on struct aa_loaddata, list membership does not
hold a reference: profiles hold pcount, and when the last pcount
drops, do_ploaddata_rmfs() is queued on a workqueue that takes
ns->lock and removes the entry. Between dropping the last pcount
and the workqueue running, an entry remains on the list with
pcount == 0.

aa_get_profile_loaddata() is an unconditional kref_get() on
pcount, so when the dedup loop hits such an entry, refcount
hardening reports

  refcount_t: addition on 0; use-after-free.

inside aa_replace_profiles(), and the poisoned counter then
trips "saturated" and "underflow" warnings on the subsequent
uses of the same loaddata.

Before commit a0b7091c4de4 ("apparmor: fix race on rawdata
dereference") the dedup path used a get_unless_zero-style helper
on a single counter, so the existing "if (tmp)" guard was
meaningful. The split-refcount refactor introduced
aa_get_profile_loaddata(), which has plain kref_get() semantics,
and the guard quietly became a no-op.

Introduce aa_get_profile_loaddata_not0(), matching the existing
_not0 convention used by aa_get_profile_not0(), and use it for
the rawdata_list dedup lookup so dying entries are skipped.

Reproduced on x86_64 with v7.1-rc5 in QEMU+KVM running Ubuntu
24.04 + stress-ng 0.17.06:

  stress-ng --apparmor 1 --klog-check --timeout 60s

Without this patch the three refcount_t warnings fire within a
few seconds. With it the same 60 s run is clean. Coverage is a
smoke-test only; a longer soak with CONFIG_KASAN, CONFIG_KCSAN
and CONFIG_PROVE_LOCKING would be welcome from anyone with the
cycles.

Fixes: a0b7091c4de4 ("apparmor: fix race on rawdata dereference")
Reported-by: Colin Ian King <colin.i.king@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221513
Cc: stable@vger.kernel.org
Signed-off-by: Ruslan Valiyev <linuxoid@gmail.com>
---
 security/apparmor/include/policy_unpack.h | 19 +++++++++++++++++++
 security/apparmor/policy.c                |  8 ++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/include/policy_unpack.h b/security/apparmor/include/policy_unpack.h
index e5a95dc4da1f..b9de0fdf9ee5 100644
--- a/security/apparmor/include/policy_unpack.h
+++ b/security/apparmor/include/policy_unpack.h
@@ -163,6 +163,25 @@ aa_get_profile_loaddata(struct aa_loaddata *data)
 	return data;
 }
 
+/**
+ * aa_get_profile_loaddata_not0 - get a profile reference count if not zero
+ * @data: reference to get a count on
+ *
+ * Like aa_get_profile_loaddata(), but safe to call on an entry that may
+ * be on a list (e.g. ns->rawdata_list) where the last pcount has already
+ * dropped and the deferred cleanup has not yet run.
+ *
+ * Returns: pointer to reference, or %NULL if @data is NULL or its
+ *          profile refcount has already reached zero.
+ */
+static inline struct aa_loaddata *
+aa_get_profile_loaddata_not0(struct aa_loaddata *data)
+{
+	if (data && kref_get_unless_zero(&data->pcount))
+		return data;
+	return NULL;
+}
+
 void __aa_loaddata_update(struct aa_loaddata *data, long revision);
 bool aa_rawdata_eq(struct aa_loaddata *l, struct aa_loaddata *r);
 void aa_loaddata_kref(struct kref *kref);
diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index b6a5eb4021db..e103cce6f4af 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -1223,8 +1223,12 @@ ssize_t aa_replace_profiles(struct aa_ns *policy_ns, struct aa_label *label,
 			if (aa_rawdata_eq(rawdata_ent, udata)) {
 				struct aa_loaddata *tmp;
 
-				tmp = aa_get_profile_loaddata(rawdata_ent);
-				/* check we didn't fail the race */
+				/*
+				 * Entries remain on rawdata_list with
+				 * pcount == 0 until do_ploaddata_rmfs()
+				 * runs; only take a live profile ref.
+				 */
+				tmp = aa_get_profile_loaddata_not0(rawdata_ent);
 				if (tmp) {
 					aa_put_profile_loaddata(udata);
 					udata = tmp;

base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
-- 
2.43.0



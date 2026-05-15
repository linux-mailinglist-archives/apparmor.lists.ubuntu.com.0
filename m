Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MTdCpTZBmrsoQIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 15 May 2026 10:30:12 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D87EF54B4D0
	for <lists+apparmor@lfdr.de>; Fri, 15 May 2026 10:30:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wNnvd-0002he-UJ; Fri, 15 May 2026 08:29:53 +0000
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <rollkingzzc@gmail.com>)
 id 1wNkg4-00079H-LM
 for apparmor@lists.ubuntu.com; Fri, 15 May 2026 05:01:36 +0000
Received: by mail-pl1-f196.google.com with SMTP id
 d9443c01a7336-2ba1e9d3687so57891065ad.3
 for <apparmor@lists.ubuntu.com>; Thu, 14 May 2026 22:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778821295; x=1779426095; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gqboflgAQ/qafTTrlWTn23PBzb00+Q5WROmi07sXKXI=;
 b=n45bZST/F+FBtyq+uP5BKuykz1jDnkbSvecSnoMe8gdFdIqxGMxPPLpHnaVARrEdSX
 Dixsb3Q91LCJ6yusjZrKCmD5wPlXfmEWLRc56NiEIpkkWH9R4IeZGBfM2wZqgp3ORRGn
 /s2/eI+Cx8G0JO/MfahyksN7tspmPBwVPCtjGPwMcWG9blI7/CjpcQUGEaWu2Yd3ELsD
 ilvYXtrwNiYx29LWty0ADE/z5pHLCEWnXy5/43rYsQ5gxewhyT564L4Tjdv/IVcHY4Eo
 OjzqmFMCRfuTrl7CDeVlKI8iezJqACZQ4PnUyPr6N1l/FOqFnhOvfCocZnsz2Tn2eS0z
 N1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778821295; x=1779426095;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gqboflgAQ/qafTTrlWTn23PBzb00+Q5WROmi07sXKXI=;
 b=K6rNAi2JgXK+LmreiZuzcITsjt2brXiAiwtw0Me1xk6Pb8ndcThqEGLB5m2boAB3QE
 /sX851/6Wch/dFQTwQ1KlqiAYfEIKqvlelvGeUCI2KSm+oAEeOPLGtg8JBcVMxxcPBpM
 aKsqkHlW2G8vzD+UAWCfkHBVt2a2WttKr1G3XYvGOIT2wEas5SbO6u4WuO9FDJqQzRn8
 vk7DYYex/+NfdvPN3U5HM4mdR+Rr2Kv7ntwbU6W11ub+eEJFh1jbXUyxCJJl7wnCuYBW
 LuSkAzycgZhfeSHmSk3WWA/QAVzOhsH/iMrDqjd3JRHib2bTG+tGNO2VdXdsqTFJpOPw
 4ELQ==
X-Gm-Message-State: AOJu0Yz2cRydt9PQhWk0CTK8sJr8aUdKWtKuSiDQH4F2vkWPH6/1FxFZ
 TwwiIfI5moLP5hkGCqdsCasHs513pKN8gL+thBJJoeVLjWPl3swqMj0n
X-Gm-Gg: Acq92OHFi/ZT4BKez0DOolWab48h10S1N5SpZtjjXSje6WMrOIvnPTAoBeCCy3ZZXnQ
 GswBHl9Hi68MM2xn5i2+ja0zpbiBYBfgpk1rwKIGPoLfG/ViM3lUVQgPjwu0ws0P0yFtnhQSeYB
 Q6jWPLAW7iZwexIsaaDuD1H83XQaepNf2Jesl3sCNhKT4ee0sICAHslksFJdsJvfhZV4RXaMmQP
 +qQJidzYJ4n/oG+notA9LHTh4v1Zf+TY1OCP+8iUgL37/z9AIoFsMCQTZdcD15JELp/aaOX3q1H
 AW9eX+WycjB1saQ2chqnqF5u9qpVxUaJIWzllUL1I+sjqYEOfAm7uYpf5Wo7OlFMaWtJJKdMeqU
 24wUdnmK3TiI7qiBmgWEbQfjrWUB1lK/3FUIqwbbN5rUFzt4nVOmOIZz7v00AlR6FLXm6OGbvTA
 84G0V4Y5M8dSTkaCejddQ0+WGpk/e7U7MyetOK+/lsog==
X-Received: by 2002:a17:902:b181:b0:2bc:6784:5260 with SMTP id
 d9443c01a7336-2bd7e966018mr20182025ad.37.1778821294496; 
 Thu, 14 May 2026 22:01:34 -0700 (PDT)
Received: from localhost ([111.228.63.84]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5bd5ef1bsm55532965ad.4.2026.05.14.22.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 22:01:34 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Date: Fri, 15 May 2026 13:01:16 +0800
Message-Id: <20260515050116.95754-1-rollkingzzc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.196;
 envelope-from=rollkingzzc@gmail.com; helo=mail-pl1-f196.google.com
X-Mailman-Approved-At: Fri, 15 May 2026 08:29:52 +0000
Subject: [apparmor] [PATCH] apparmor: hold peer path references in
	aa_unix_file_perm()
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
Cc: apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Zhang Cen <rollkingzzc@gmail.com>,
 zerocling0077@gmail.com, 2045gemini@gmail.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: D87EF54B4D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:rollkingzzc@gmail.com,m:zerocling0077@gmail.com,m:2045gemini@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rollkingzzc@gmail.com,apparmor-bounces@lists.ubuntu.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.ubuntu.com,vger.kernel.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.928];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

aa_unix_file_perm() keeps the connected peer alive with sock_hold(peer_sk),
but it then carries unix_sk(peer_sk)->path outside the peer socket state
lock without taking a path reference. That copied peer_path can race with
unix_release_sock(), which clears u->path under unix_state_lock(peer_sk)
and drops the socket-owned path reference with path_put() before the final
sock_put(peer_sk).

Take peer_sk's unix_state_lock() long enough to snapshot peer_path,
cache whether the peer is filesystem-bound, and path_get() a non-NULL
path before dropping the lock. Drop that path reference after the last
AppArmor peer path check. This restores the ownership invariant for
peer_path without changing AF_UNIX shutdown semantics once the peer path
has already been cleared.

The buggy scenario involves two paths, with each column showing the
order within that path:

aa_unix_file_perm() [borrower]:        unix_release_sock() [peer close]:
1. unix_state_lock(sock->sk)           1. unix_state_lock(peer_sk)
2. peer_sk = unix_peer(sock->sk)       2. Save path = u->path
3. sock_hold(peer_sk)                  3. Clear u->path.dentry/mnt
4. unix_state_unlock(sock->sk)         4. unix_state_unlock(peer_sk)
5. peer_path = unix_sk(peer_sk)->path  5. path_put(&path)
6. unix_fs_perm(&peer_path)            6. sock_put(peer_sk)

KASAN reported a slab-use-after-free in unix_fs_perm() at
security/apparmor/af_unix.c:46, with the free side in
unix_release_sock() -> path_put() at net/unix/af_unix.c:730.

Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>

---
 security/apparmor/af_unix.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/security/apparmor/af_unix.c b/security/apparmor/af_unix.c
index fdb4a9f21..7a1562f6f 100644
--- a/security/apparmor/af_unix.c
+++ b/security/apparmor/af_unix.c
@@ -716,7 +716,8 @@ int aa_unix_file_perm(const struct cred *subj_cred, struct aa_label *label,
 	struct sock *peer_sk = NULL;
 	u32 sk_req = request & ~NET_PEER_MASK;
 	struct path path;
-	bool is_sk_fs;
+	struct path peer_path = {};
+	bool is_sk_fs, is_peer_fs = false;
 	int error = 0;
 
 	AA_BUG(!label);
@@ -724,9 +725,8 @@ int aa_unix_file_perm(const struct cred *subj_cred, struct aa_label *label,
 	AA_BUG(!sock->sk);
 	AA_BUG(sock->sk->sk_family != PF_UNIX);
 
-	/* investigate only using lock via unix_peer_get()
-	 * addr only needs the memory barrier, but need to investigate
-	 * path
+	/* addr only needs the memory barrier; hold a peer path reference
+	 * under peer_sk's state lock after sock_hold(peer_sk)
 	 */
 	unix_state_lock(sock->sk);
 	peer_sk = unix_peer(sock->sk);
@@ -749,14 +749,18 @@ int aa_unix_file_perm(const struct cred *subj_cred, struct aa_label *label,
 		goto out;
 
 	peer_addr = aa_sunaddr(unix_sk(peer_sk), &peer_addrlen);
-
-	struct path peer_path;
-
-	peer_path = unix_sk(peer_sk)->path;
-	if (!is_sk_fs && is_unix_fs(peer_sk)) {
+	if (!is_sk_fs) {
+		unix_state_lock(peer_sk);
+		is_peer_fs = is_unix_fs(peer_sk);
+		peer_path = unix_sk(peer_sk)->path;
+		if (peer_path.dentry)
+			path_get(&peer_path);
+		unix_state_unlock(peer_sk);
+	}
+	if (!is_sk_fs && is_peer_fs) {
 		last_error(error,
 			   unix_fs_perm(op, request, subj_cred, label,
-					is_unix_fs(peer_sk) ? &peer_path : NULL));
+					&peer_path));
 	} else if (!is_sk_fs) {
 		struct aa_label *plabel;
 		struct aa_sk_ctx *pctx = aa_sock(peer_sk);
@@ -772,12 +776,12 @@ int aa_unix_file_perm(const struct cred *subj_cred, struct aa_label *label,
 					      MAY_READ | MAY_WRITE, sock->sk,
 					      is_sk_fs ? &path : NULL,
 					      peer_addr, peer_addrlen,
-					      is_unix_fs(peer_sk) ?
+					      is_peer_fs ?
 							&peer_path : NULL,
 					      plabel),
 			       unix_peer_perm(file->f_cred, plabel, op,
 					      MAY_READ | MAY_WRITE, peer_sk,
-					      is_unix_fs(peer_sk) ?
+					      is_peer_fs ?
 							&peer_path : NULL,
 					      addr, addrlen,
 					      is_sk_fs ? &path : NULL,
@@ -785,6 +789,8 @@ int aa_unix_file_perm(const struct cred *subj_cred, struct aa_label *label,
 		if (!error && !__aa_subj_label_is_cached(plabel, label))
 			update_peer_ctx(peer_sk, pctx, label);
 	}
+	if (peer_path.dentry)
+		path_put(&peer_path);
 	sock_put(peer_sk);
 
 out:
@@ -796,4 +802,3 @@ int aa_unix_file_perm(const struct cred *subj_cred, struct aa_label *label,
 
 	return error;
 }
-
-- 
2.43.0


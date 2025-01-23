Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7EEA1C054
	for <lists+apparmor@lfdr.de>; Sat, 25 Jan 2025 02:37:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tbV6c-0005Ar-H7; Sat, 25 Jan 2025 01:37:02 +0000
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <rbmarliere@gmail.com>)
 id 1tb3KS-0005Tj-88
 for apparmor@lists.ubuntu.com; Thu, 23 Jan 2025 19:57:28 +0000
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2f43d17b0e3so2631847a91.0
 for <apparmor@lists.ubuntu.com>; Thu, 23 Jan 2025 11:57:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737662246; x=1738267046;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GOwTSITdWxSRhub6Za29c5Wdoyuf6atairIJn2Az4eo=;
 b=n785G+NWzxJrK3jzci0M/K2TQJgM5xy+eNyKWRQtU+tOjJxetQIT2vae7wl9yiH3Qz
 FBFRSt79JoDQJXyEU5lwlzkKbhpB36rg9imuWTCfvFJ2MEDFRUvr33+S1mkDaYjIzvZe
 0s7Ae72+lXKzCsUUOVKDchST5JAwRKU/3okAVrfUA4NGMVaSdhOyPWW+K2p4JwDDHr7j
 WBTVoccNVgbPTl+aZousN/qHxR4hFfjXJPKSAZ266RmI8tqdQSlYbnxOwUfUN6j3ee+y
 nnAUDDqEk2H49nTADbkDzV9CcofwvLn/04A0onNntZCry/VIyJ35KfvTmjTiPIsiYeYL
 4lIw==
X-Gm-Message-State: AOJu0YxwsUMS8pDVLrECCPrJGuRBhsBNNhCXByebEflyrdVD7eEX9SEt
 qURE9voN0vXN1KKr3dxJGQ2YWntOFwxjxOAI6BwiTwdSkS4JAvC6
X-Gm-Gg: ASbGncunsButDjuhwu1ZlBzuVTbxro0cvgVg8IuCiQTldcakEteHr/XX6F1nV5IF4E8
 KAliiKNULsD3CjIdmbIm4lL9yoRws3tb9cVnGUmJnCH4ogIVvSbLV9e3BZTkCc0rkLBiU+f5o0S
 bybkVvQEjHJ/ebGEq1WbCmcgAs/jzrjcKWs95TLJLsI7uGmrAytA5w1d4AuGz4pcGfAOmjQPbvf
 hhZm9kUcqM6OhZGzzVS48PGisWJlWlg9Tn9iq5vinLagCfo2rlGhXJaaBbMzzfkGn8RO+cQgK4R
 0VXQsuItTCaRqA2r4+2HyA==
X-Google-Smtp-Source: AGHT+IFIHf7Ml0hlbVH+yfQ2Lodxd4V9tyopFz4fhKwwoKW8uWd4yMBnSwzGPlA5BLm7vg+BY+Qb6Q==
X-Received: by 2002:a17:90b:5146:b0:2ea:a25d:3baa with SMTP id
 98e67ed59e1d1-2f782c6639dmr35379819a91.5.1737662246390; 
 Thu, 23 Jan 2025 11:57:26 -0800 (PST)
Received: from mail.marliere.net (marliere.net. [24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac495d58077sm250246a12.53.2025.01.23.11.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 11:57:25 -0800 (PST)
From: Ricardo B. Marliere <ricardo@marliere.net>
Date: Thu, 23 Jan 2025 16:57:19 -0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250123-sysctl_const-jj-v1-1-8b9c04238aeb@suse.com>
X-B4-Tracking: v=1; b=H4sIAB6fkmcC/x3MQQrCMBBA0auUWTuYRHThVURkkk5tgiZhJkil9
 O6mLt/i/xWUJbLCdVhB+BM1ltxhDwOEmfKTMY7d4Iw7G+tOqF8N7fUIJWvDlNCG0dOFvDHE0Ks
 qPMXlf7zduz0poxfKYd4/KR2pVpJ3Ecy8NNi2HzUTGiGEAAAA
X-Change-ID: 20250123-sysctl_const-jj-1cdba6ab00ae
To: John Johansen <john.johansen@canonical.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288; i=rbm@suse.com;
 h=from:subject:message-id; bh=ajdgFugDtV/iFWheR0eshitdLUdyFAQt+XYa9k0Mll4=;
 b=owEBbQKS/ZANAwAIAckLinxjhlimAcsmYgBnkp8g85TjP3lZGKhnRSUQuQ/fvrDJaXgd4gA4f
 NEnp+zEc5SJAjMEAAEIAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZ5KfIAAKCRDJC4p8Y4ZY
 psWCEACDbBx786irWYdw65DETjBaAZ665lTvgBZP+GKsbAIyPvzN7VUSIwjkiD6tU0mCgnxmM4i
 /Q4a+bfKir5kWK4jMCQVKqwvzhJkqjVCE7SzdQGIPDUUEb3YpoyyvXZcfZUY6+1/Ou942o52rrX
 cWSJXRxdBalDkS24ScjgOpCa7yS6zNWwl20I5OnBtHmMJifzwqmDAXl/YVtSicCCTjrtWPf2VyO
 3l6sjYIpWg25AhjSy5TG59ZxjIiuTRTKG25BlltdrwkPMvByy11Kaj/GO4K+IQ9weTJFfcQpgnM
 3N5sPRS8+6mtTzRXWarJT9Yp4pClrvMG3/vyro7oQfFiBTwiuA075SNiZY6Pn/06vbwbFUhEzO3
 y/Af82Y/sPgmQOQvh+m9+ramErRY1gDGRYkBZnnvpZQePGAy3wXzyWt0q2U7vcsKNDeYyW99RRn
 KlDcTSjtpsOUV+KRK/QkqE1N2IujFSv11wCHUTWNFXVHU9raWp2FDZXGjs0n/R0wrzZLx+0OykC
 KhQlijf2j8mTru7s1OLUcfPOrFBMs4rjqtJU6a+py+SWQRE6Az4uyx7vBm104v/o77D+uA8FUFw
 6Dk0AU8dEA0IIKMN7o9MaHQNdSCgBJ0GuiX7TULg6FCwsOTDN5eaDYT1WSof8ukxmSivSTwXCLQ
 rFXSd/IUVYNXNag==
X-Developer-Key: i=rbm@suse.com; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
Received-SPF: pass client-ip=209.85.216.51; envelope-from=rbmarliere@gmail.com;
 helo=mail-pj1-f51.google.com
X-Mailman-Approved-At: Sat, 25 Jan 2025 01:37:01 +0000
Subject: [apparmor] [PATCH] apparmor: Make sysctl table const
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, "Ricardo B. Marliere" <rbm@suse.com>,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Since commit 7abc9b53bd51 ("sysctl: allow registration of const struct
ctl_table"), the sysctl registration API allows for struct ctl_table to be
in read-only memory. Move apparmor_sysctl_table to be declared at build
time, instead of having to be dynamically allocated at boot time.

Cc: Thomas Weißschuh <linux@weissschuh.net>
Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Ricardo B. Marliere <rbm@suse.com>
---
 security/apparmor/lsm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 0b4f7e2e4135503f0c78a050e82adb4ff853e9f4..93c7fcd875f764feee7fca6ac302e31ea081d18c 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -2205,7 +2205,7 @@ static int apparmor_dointvec(const struct ctl_table *table, int write,
 	return proc_dointvec(table, write, buffer, lenp, ppos);
 }
 
-static struct ctl_table apparmor_sysctl_table[] = {
+static const struct ctl_table apparmor_sysctl_table[] = {
 #ifdef CONFIG_USER_NS
 	{
 		.procname       = "unprivileged_userns_apparmor_policy",

---
base-commit: e6b087676954e36a7b1ed51249362bb499f8c1c2
change-id: 20250123-sysctl_const-jj-1cdba6ab00ae

Best regards,
-- 
Ricardo B. Marliere <rbm@suse.com>



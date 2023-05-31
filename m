Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CDA718936
	for <lists+apparmor@lfdr.de>; Wed, 31 May 2023 20:17:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q4QNn-0005jf-TK; Wed, 31 May 2023 18:17:15 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <gongruiqi@huaweicloud.com>) id 1q4JnH-0004Cr-BV
 for apparmor@lists.ubuntu.com; Wed, 31 May 2023 11:15:07 +0000
Received: from mail02.huawei.com (unknown [172.30.67.143])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4QWRW92fYBz4f3kjv
 for <apparmor@lists.ubuntu.com>; Wed, 31 May 2023 19:15:01 +0800 (CST)
Received: from ubuntu20.huawei.com (unknown [10.67.174.33])
 by APP1 (Coremail) with SMTP id cCh0CgCX8RssLHdkQ1ILKA--.12369S2;
 Wed, 31 May 2023 19:15:02 +0800 (CST)
From: "GONG, Ruiqi" <gongruiqi@huaweicloud.com>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E . Hallyn" <serge@hallyn.com>
Date: Wed, 31 May 2023 19:18:33 +0800
Message-Id: <20230531111833.144628-1-gongruiqi@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgCX8RssLHdkQ1ILKA--.12369S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF43tF43Kr4kArW5ZFyxZrb_yoWxuFbEy3
 ZxZr4ku34I9F1Syw4DKFyIya4vg34rJFWkuas5JrnrAas3KrW8JFyYqryIvry3G397XrWD
 WFn3GrWjq34jgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
 Y4v20xvaj40_JFC_Wr1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
 A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
 67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxV
 AFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
 j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
 kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCF04k20xvY
 0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcV
 CF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UQzVbUUUUU=
X-CM-SenderInfo: pjrqw2pxltxq5kxd4v5lfo033gof0z/
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 31 May 2023 18:17:12 +0000
Subject: [apparmor] [PATCH] apparmor: remove unused macro
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
Cc: Xiu Jianfeng <xiujianfeng@huawei.com>, apparmor@lists.ubuntu.com,
 Wang Weiyang <wangweiyang2@huawei.com>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, gongruiqi1@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

SOCK_ctx() doesn't seem to be used anywhere in the code, so remove it.

Signed-off-by: GONG, Ruiqi <gongruiqi@huaweicloud.com>
---
 security/apparmor/include/net.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/security/apparmor/include/net.h b/security/apparmor/include/net.h
index 6fa440b5daed..64a0112bf62d 100644
--- a/security/apparmor/include/net.h
+++ b/security/apparmor/include/net.h
@@ -52,7 +52,6 @@ struct aa_sk_ctx {
 };
 
 #define SK_CTX(X) ((X)->sk_security)
-#define SOCK_ctx(X) SOCK_INODE(X)->i_security
 #define DEFINE_AUDIT_NET(NAME, OP, SK, F, T, P)				  \
 	struct lsm_network_audit NAME ## _net = { .sk = (SK),		  \
 						  .family = (F)};	  \
-- 
2.25.1



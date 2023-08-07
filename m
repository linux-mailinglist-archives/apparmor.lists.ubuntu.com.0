Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D25897734D0
	for <lists+apparmor@lfdr.de>; Tue,  8 Aug 2023 01:18:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qT9Uo-0007IT-NX; Mon, 07 Aug 2023 23:18:42 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <gongruiqi@huaweicloud.com>) id 1qSwdJ-0005tS-NC
 for apparmor@lists.ubuntu.com; Mon, 07 Aug 2023 09:34:37 +0000
Received: from mail02.huawei.com (unknown [172.30.67.143])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4RKB3l49Vkz4f3s6k
 for <apparmor@lists.ubuntu.com>; Mon,  7 Aug 2023 17:34:27 +0800 (CST)
Received: from ubuntu20.huawei.com (unknown [10.67.174.33])
 by APP2 (Coremail) with SMTP id Syh0CgCnyGyfutBkuLyOAA--.13731S2;
 Mon, 07 Aug 2023 17:34:30 +0800 (CST)
From: "GONG, Ruiqi" <gongruiqi@huaweicloud.com>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E . Hallyn" <serge@hallyn.com>
Date: Mon,  7 Aug 2023 17:39:04 +0800
Message-Id: <20230807093904.565766-1-gongruiqi@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgCnyGyfutBkuLyOAA--.13731S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XF4UuF17GFy3Cw4UJF13urg_yoWfZrb_C3
 Wj9w1xurs3ZF1fXa40va48uF97u3y8JFZ09a4Fqr9rAryDKw4rWa4jyryxWrW3uws7GrWU
 CFyfKrW5AF1xWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbxxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUF9
 a9DUUUU
X-CM-SenderInfo: pjrqw2pxltxq5kxd4v5lfo033gof0z/
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 07 Aug 2023 23:18:41 +0000
Subject: [apparmor] [PATCH] apparmor: remove unused PROF_* macros
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
 linux-security-module@vger.kernel.org, gongruiqi@huaweicloud.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: "GONG, Ruiqi" <gongruiqi1@huawei.com>

The last usage of PROF_{ADD,REPLACE} were removed by commit 18e99f191a8e
("apparmor: provide finer control over policy management"). So remove
these two unused macros.

Signed-off-by: GONG, Ruiqi <gongruiqi1@huawei.com>
---
 security/apparmor/include/policy.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/security/apparmor/include/policy.h b/security/apparmor/include/policy.h
index 545f791cabda..ed9a8669af80 100644
--- a/security/apparmor/include/policy.h
+++ b/security/apparmor/include/policy.h
@@ -254,9 +254,6 @@ ssize_t aa_remove_profiles(struct aa_ns *view, struct aa_label *label,
 			   char *name, size_t size);
 void __aa_profile_list_release(struct list_head *head);
 
-#define PROF_ADD 1
-#define PROF_REPLACE 0
-
 #define profile_unconfined(X) ((X)->mode == APPARMOR_UNCONFINED)
 
 /**
-- 
2.25.1



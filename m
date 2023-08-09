Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AFF7753FC
	for <lists+apparmor@lfdr.de>; Wed,  9 Aug 2023 09:19:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qTdTZ-0003pI-9f; Wed, 09 Aug 2023 07:19:25 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <xiujianfeng@huaweicloud.com>) id 1qTYXG-0005Hl-42
 for apparmor@lists.ubuntu.com; Wed, 09 Aug 2023 02:02:54 +0000
Received: from mail02.huawei.com (unknown [172.30.67.143])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4RLCxg5R30z4f3pGC
 for <apparmor@lists.ubuntu.com>; Wed,  9 Aug 2023 10:02:47 +0800 (CST)
Received: from huaweicloud.com (unknown [10.67.174.26])
 by APP4 (Coremail) with SMTP id gCh0CgD3hqnH89Jk6rUUAQ--.53787S4;
 Wed, 09 Aug 2023 10:02:48 +0800 (CST)
From: Xiu Jianfeng <xiujianfeng@huaweicloud.com>
To: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, terrelln@fb.com
Date: Wed,  9 Aug 2023 10:02:44 +0000
Message-Id: <20230809100244.342530-1-xiujianfeng@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgD3hqnH89Jk6rUUAQ--.53787S4
X-Coremail-Antispam: 1UD129KBjvdXoWruFW8Xr4xuF13GF4fCw1DAwb_yoWDXrg_G3
 4vkay8Ar42vF43tw1Fyay8XFyv9r18JFZI9a4vyr9xZ34UGrs5JF9rZws3XrWrXw47K395
 Gan8AFWaqFnrGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
 Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l87I20VAvwVAaII0Ic2I_JFv_Gryl8c
 AvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq
 3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gc
 CE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxI
 r21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87
 Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IY
 c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
 vE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0VnQUUUUUU==
X-CM-SenderInfo: x0lxyxpdqiv03j6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 09 Aug 2023 07:19:24 +0000
Subject: [apparmor] [PATCH -next] apparmor: remove unneeded #ifdef in
	decompress_zstd()
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
 xiujianfeng@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: Xiu Jianfeng <xiujianfeng@huawei.com>

The whole function is guarded by CONFIG_SECURITY_APPARMOR_EXPORT_BINARY,
so the #ifdef here is redundant, remove it.

Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 security/apparmor/apparmorfs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index c198a8a2047b..7ee8f4bb7733 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -1314,7 +1314,6 @@ SEQ_RAWDATA_FOPS(compressed_size);
 
 static int decompress_zstd(char *src, size_t slen, char *dst, size_t dlen)
 {
-#ifdef CONFIG_SECURITY_APPARMOR_EXPORT_BINARY
 	if (slen < dlen) {
 		const size_t wksp_len = zstd_dctx_workspace_bound();
 		zstd_dctx *ctx;
@@ -1341,7 +1340,6 @@ static int decompress_zstd(char *src, size_t slen, char *dst, size_t dlen)
 		kvfree(wksp);
 		return ret;
 	}
-#endif
 
 	if (dlen < slen)
 		return -EINVAL;
-- 
2.34.1



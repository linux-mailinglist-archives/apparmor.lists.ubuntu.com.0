Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D0D62851F
	for <lists+apparmor@lfdr.de>; Mon, 14 Nov 2022 17:25:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oucGR-0006r5-Sf; Mon, 14 Nov 2022 16:24:51 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.ehrhardt@canonical.com>)
 id 1oucGP-0006qn-AD
 for apparmor@lists.ubuntu.com; Mon, 14 Nov 2022 16:24:49 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0D8B7412C3
 for <apparmor@lists.ubuntu.com>; Mon, 14 Nov 2022 16:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1668443089;
 bh=78U1l9OBMrSByTmQuQuhVKrlOjM0ycrs018Oc17Pmjg=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=hUCluwo/kVuYDY9qUKOKMCb6kBdgDACqM/kSWKP31Ltzb6bNLMbCg8UQGMbybK9Q0
 JcGrlA0vMn3R2XxQ9L/AmEG1FwZNjSXDzNyhyST3fpQZi4UoVVTjbCXvwwhDJgq0lB
 EkXq8McgPkoAxHOmVKYgNte55pMKog4vZ18pHTi84VUFg7vrd0praUv/ffPpKkJpcr
 hnsxafOleoWsVHHo4mo0b56p1ykLLWqsnduh+K3GZkTIzyhN4gKrxdkDy+7el6V5+D
 9O/ieInl8FvkkG18D0T6VKkEM4lsUy4hP5lbHaHHdMcxxu1CaiUE5azbL68iL0ghRW
 Stx9oKiMa45lg==
Received: by mail-wr1-f71.google.com with SMTP id
 j20-20020adfb314000000b002366d9f67aaso2140035wrd.3
 for <apparmor@lists.ubuntu.com>; Mon, 14 Nov 2022 08:24:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=78U1l9OBMrSByTmQuQuhVKrlOjM0ycrs018Oc17Pmjg=;
 b=WbKpRhH9rspucTCXu/lQNTsUjozStqRgIwkOisJO+GBOGAJQjkq2rjlo0FuVVgZ/4a
 Gw/ohZTfezzQdl7AFjYf8OAk48EiQ8+OCvIfcql1xNOj/gv6fooJsHVRlrzs/3SE0O5T
 poQkdp7/F3hoL03kTwW9DObs2Yq1vh1QoCPDWZpxRbCQwEb8GcB2HodDCyRBI63FF7sQ
 od7ifgjJC1vrYqcfI5brZrFBEFB9RbFQ3vI9ZOWmusJ88FX6jv9IJhwSwAtLUTbIWTCQ
 c4G0SfgOUuWFZ3WWHib1UeZGomc7TessWcj6wj8OEcZx8rLduaDWjy8ymoKn05Pu2eJm
 FW6Q==
X-Gm-Message-State: ANoB5pk+0UF3oumd5SmsKrjxxzbTNuMtE685vhmg8Tt7YEZQ0o6jnomd
 8JTJj0oOTs52HSe1h68Y2k41RkfwRd77n35uvaNrkgeRr+CmbbHKCrI/xJjpfv12hHw8hCS2zRw
 7KMRrnoapZnzNTowl15CurgghMIuwugh+GXE6Pg==
X-Received: by 2002:a5d:6089:0:b0:236:58f5:84dd with SMTP id
 w9-20020a5d6089000000b0023658f584ddmr8054317wrt.603.1668443088299; 
 Mon, 14 Nov 2022 08:24:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5kksFb4l3EnZEvQM7gmeslAs9igwYfttndOskmCmw/73M1IQ6/7AiN37zvJZ8fwchHE2rRHQ==
X-Received: by 2002:a5d:6089:0:b0:236:58f5:84dd with SMTP id
 w9-20020a5d6089000000b0023658f584ddmr8054298wrt.603.1668443088054; 
 Mon, 14 Nov 2022 08:24:48 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:6d40:39af:c100:4732:4807:bb84:86ad])
 by smtp.gmail.com with ESMTPSA id
 bk3-20020a0560001d8300b002366c3eefccsm9718197wrb.109.2022.11.14.08.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 08:24:47 -0800 (PST)
From: christian.ehrhardt@canonical.com
To: apparmor@lists.ubuntu.com
Date: Mon, 14 Nov 2022 17:24:42 +0100
Message-Id: <20221114162442.2557922-1-christian.ehrhardt@canonical.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH] Allow access to possible cpus for glibc-2.36
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: Christian Ehrhardt <christian.ehrhardt@canonical.com>

Glibc in 2.36 and later will [1] access sysfs at
/sys/devices/system/cpu/possible when usig sysconf
for _SC_NPROCESSORS_CONF.

That will make a lot of different code, for example
anything linked against libnuma, trigger this apparmor
denial.

  apparmor="DENIED" operation="open" class="file" ...
  name="/sys/devices/system/cpu/possible" ...
  requested_mask="r" denied_mask="r" fsuid=0 ouid=0
￼
This entry seems rather safe, and it follows others
that are already in place. Instead of fixing each
software individually this should go into the base
profile as well.

Initially reported via
https://bugs.launchpad.net/ubuntu/+source/apparmor/+bug/1989073

Fixes: https://gitlab.com/apparmor/apparmor/-/issues/267

Signed-off-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
---
 profiles/apparmor.d/abstractions/base | 1 +
 1 file changed, 1 insertion(+)

diff --git a/profiles/apparmor.d/abstractions/base b/profiles/apparmor.d/abstractions/base
index a03be4b07..81c50359e 100644
--- a/profiles/apparmor.d/abstractions/base
+++ b/profiles/apparmor.d/abstractions/base
@@ -101,6 +101,7 @@
   @{PROC}/cpuinfo                r,
   @{sys}/devices/system/cpu/       r,
   @{sys}/devices/system/cpu/online r,
+  @{sys}/devices/system/cpu/possible r,
 
   # glibc's *printf protections read the maps file
   @{PROC}/@{pid}/{maps,auxv,status} r,
-- 
2.38.1



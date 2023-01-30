Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBFA68198F
	for <lists+apparmor@lfdr.de>; Mon, 30 Jan 2023 19:47:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pMZBS-0005Ly-FL; Mon, 30 Jan 2023 18:47:14 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bgray@linux.ibm.com>) id 1pMMx0-0002Q2-Bw
 for apparmor@lists.ubuntu.com; Mon, 30 Jan 2023 05:43:30 +0000
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U2Ccgw022582
 for <apparmor@lists.ubuntu.com>; Mon, 30 Jan 2023 05:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=y/Jq6BDyoN45kdMNzvxztRNjngH+wCe8eYPvphm0jBk=;
 b=nLoAgrh6R8y+kq2ysDLnqIeU+DaITgUkW54isfSYNXa2eSVxzK8/6Nya5P6Oa+t/699q
 6HvuJsAd2e135iUhGjgu4LbBJ6333pfit/NhzFRvS5di3z86eP6wbI9Yc+ALlTEW9Mm+
 j/oFprRi0eUEWslRZ+bjatwM36xe8dPPMly2M0HgYup9oVjMZybUyZeRUh/11WsDV5v5
 4U95JfIErENDqWxMq/470lO/hIb0TE1KBirE+/JNCOlhB29ip0BPpbrEvtAPnZau3P13
 SaRrS9mI60vI9qiw6pNlV4Tfj9qEU1AuqeJQwl+1a7apGlSaXKmlBbBF6GmEL9QgaGn+ XA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nddkk6kwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <apparmor@lists.ubuntu.com>; Mon, 30 Jan 2023 05:43:28 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30U51ELQ026867
 for <apparmor@lists.ubuntu.com>; Mon, 30 Jan 2023 05:43:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3ncvs7hset-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <apparmor@lists.ubuntu.com>; Mon, 30 Jan 2023 05:43:26 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30U5hNUV23658944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <apparmor@lists.ubuntu.com>; Mon, 30 Jan 2023 05:43:23 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAC4D20043
 for <apparmor@lists.ubuntu.com>; Mon, 30 Jan 2023 05:43:23 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3973820040
 for <apparmor@lists.ubuntu.com>; Mon, 30 Jan 2023 05:43:23 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP
 for <apparmor@lists.ubuntu.com>; Mon, 30 Jan 2023 05:43:23 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com
 (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8782160425;
 Mon, 30 Jan 2023 16:43:19 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: apparmor@lists.ubuntu.com
Date: Mon, 30 Jan 2023 16:43:11 +1100
Message-Id: <20230130054311.265038-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _nGjPqZcmz5jfFH8ELC1Yu0IqaaLtCpy
X-Proofpoint-GUID: _nGjPqZcmz5jfFH8ELC1Yu0IqaaLtCpy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_03,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0
 clxscore=1011 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=823
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300052
X-Mailman-Approved-At: Mon, 30 Jan 2023 18:47:13 +0000
Subject: [apparmor] [PATCH] apparmor: fix endianness of test data in
	policy_unpack_test
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

The test data numbers are expected to be in little endian format
based on how the tests interact with them, but currently are
generated using host endianness. This causes several KUnit tests
to fail when booting a big endian kernel, e.g.

  # policy_unpack_test_unpack_array_with_null_name: EXPECTATION FAILED at security/apparmor/policy_unpack_test.c:151
  Expected array_size == (u16)16, but
      array_size == 4096 (0x1000)
      (u16)16 == 16 (0x10)

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 security/apparmor/policy_unpack_test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/security/apparmor/policy_unpack_test.c b/security/apparmor/policy_unpack_test.c
index 5c9bde25e56d..506d3f14d1b5 100644
--- a/security/apparmor/policy_unpack_test.c
+++ b/security/apparmor/policy_unpack_test.c
@@ -80,14 +80,14 @@ static struct aa_ext *build_aa_ext_struct(struct policy_unpack_fixture *puf,
 	*(buf + 1) = strlen(TEST_U32_NAME) + 1;
 	strscpy(buf + 3, TEST_U32_NAME, e->end - (void *)(buf + 3));
 	*(buf + 3 + strlen(TEST_U32_NAME) + 1) = AA_U32;
-	*((u32 *)(buf + 3 + strlen(TEST_U32_NAME) + 2)) = TEST_U32_DATA;
+	*((u32 *)(buf + 3 + strlen(TEST_U32_NAME) + 2)) = cpu_to_le32(TEST_U32_DATA);
 
 	buf = e->start + TEST_NAMED_U64_BUF_OFFSET;
 	*buf = AA_NAME;
 	*(buf + 1) = strlen(TEST_U64_NAME) + 1;
 	strscpy(buf + 3, TEST_U64_NAME, e->end - (void *)(buf + 3));
 	*(buf + 3 + strlen(TEST_U64_NAME) + 1) = AA_U64;
-	*((u64 *)(buf + 3 + strlen(TEST_U64_NAME) + 2)) = TEST_U64_DATA;
+	*((u64 *)(buf + 3 + strlen(TEST_U64_NAME) + 2)) = cpu_to_le64(TEST_U64_DATA);
 
 	buf = e->start + TEST_NAMED_BLOB_BUF_OFFSET;
 	*buf = AA_NAME;
@@ -103,7 +103,7 @@ static struct aa_ext *build_aa_ext_struct(struct policy_unpack_fixture *puf,
 	*(buf + 1) = strlen(TEST_ARRAY_NAME) + 1;
 	strscpy(buf + 3, TEST_ARRAY_NAME, e->end - (void *)(buf + 3));
 	*(buf + 3 + strlen(TEST_ARRAY_NAME) + 1) = AA_ARRAY;
-	*((u16 *)(buf + 3 + strlen(TEST_ARRAY_NAME) + 2)) = TEST_ARRAY_SIZE;
+	*((u16 *)(buf + 3 + strlen(TEST_ARRAY_NAME) + 2)) = cpu_to_le16(TEST_ARRAY_SIZE);
 
 	return e;
 }

base-commit: cb60752f0c37cba0d4a90fd62dfd3ba425df783f
-- 
2.39.1



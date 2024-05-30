Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF708D443F
	for <lists+apparmor@lfdr.de>; Thu, 30 May 2024 05:40:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sCWeM-0000d9-Kw; Thu, 30 May 2024 03:40:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <quic_jjohnson@quicinc.com>)
 id 1sCUUE-00073o-QR
 for apparmor@lists.ubuntu.com; Thu, 30 May 2024 01:21:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TJW7x7003995;
 Thu, 30 May 2024 01:21:42 GMT
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0xaqyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 May 2024 01:21:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44U1LeUt031484
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 May 2024 01:21:40 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 18:21:40 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 29 May 2024 18:21:39 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240529-md-apparmor_policy_unpack_test-v1-1-9efc582078c4@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAKLUV2YC/x3NQQqDMBBA0avIrBswohV7lVLCGMc6VGOYicUi3
 r1pl2/z/wFKwqRwKw4QerPyGjLspQA/YXiS4SEbqrKqy6bqzDIYjBFlWcXFdWb/cVuI6F8ukSb
 TXpvW16O1TWchR6LQyPt/cH9k96hkesHgp1925rDtZkFNJHCeX4Ys6AmPAAAA
To: John Johansen <john.johansen@canonical.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn"
 <serge@hallyn.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Sc2rEgDu9uJAX7lqnREIIO22Uh8y3tl2
X-Proofpoint-ORIG-GUID: Sc2rEgDu9uJAX7lqnREIIO22Uh8y3tl2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxlogscore=808 priorityscore=1501 clxscore=1011 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405300008
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_jjohnson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Mailman-Approved-At: Thu, 30 May 2024 03:40:21 +0000
Subject: [apparmor] [PATCH] apparmor: test: add MODULE_DESCRIPTION()
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
Cc: kernel-janitors@vger.kernel.org, linux-security-module@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org, Jeff
 Johnson <quic_jjohnson@quicinc.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Fix the 'make W=1' warning:
WARNING: modpost: missing MODULE_DESCRIPTION() in security/apparmor/apparmor_policy_unpack_test.o

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 security/apparmor/policy_unpack_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/security/apparmor/policy_unpack_test.c b/security/apparmor/policy_unpack_test.c
index 5c9bde25e56d..874fcf97794e 100644
--- a/security/apparmor/policy_unpack_test.c
+++ b/security/apparmor/policy_unpack_test.c
@@ -604,4 +604,5 @@ static struct kunit_suite apparmor_policy_unpack_test_module = {
 
 kunit_test_suite(apparmor_policy_unpack_test_module);
 
+MODULE_DESCRIPTION("KUnit tests for AppArmor's policy unpack");
 MODULE_LICENSE("GPL");

---
base-commit: 4a4be1ad3a6efea16c56615f31117590fd881358
change-id: 20240529-md-apparmor_policy_unpack_test-7657c4f11591



Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 993C58BC4AB
	for <lists+apparmor@lfdr.de>; Mon,  6 May 2024 01:03:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1s3ksr-00059D-Fc; Sun, 05 May 2024 23:03:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <quic_jjohnson@quicinc.com>)
 id 1s3kW3-0003Cf-La
 for apparmor@lists.ubuntu.com; Sun, 05 May 2024 22:39:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 445MTQZW018412;
 Sun, 5 May 2024 22:39:21 GMT
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xwcbpj8rt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 05 May 2024 22:39:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 445MdJne011415
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 5 May 2024 22:39:19 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 5 May 2024
 15:39:18 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sun, 5 May 2024 15:39:17 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240505-apparmor_socket_post_create-kdoc-v1-1-1fd88e546e92@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJQKOGYC/x3NQQrCMBBA0auUWRuIxRD1KiJhOhltKE3CTChC6
 d2NLt/m/x2UJbHCfdhBeEuaSu44nwagGfObTYrdMNrxYp11BmtFWYsELbRwC7VoCySMjc0SC5n
 rzZPH6KK1HnqmCr/S5794PLsnVDaTYKb5F15RGwscxxfbsfYCiwAAAA==
To: John Johansen <john.johansen@canonical.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn"
 <serge@hallyn.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: aK6l2xpoyo5uGV8PABLUO-CrPkQcv4cv
X-Proofpoint-GUID: aK6l2xpoyo5uGV8PABLUO-CrPkQcv4cv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-05_14,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 mlxlogscore=903 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405050093
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_jjohnson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Mailman-Approved-At: Sun, 05 May 2024 23:03:04 +0000
Subject: [apparmor] [PATCH] apparmor: fix apparmor_socket_post_create()
	kernel-doc
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
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

make C=1 reports:

security/apparmor/lsm.c:1138: warning: Function parameter or struct member 'protocol' not described in 'apparmor_socket_post_create'

Fix this by correcting the misspelling of 'protocol'.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 security/apparmor/lsm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index cef8c466af80..d0485fb0ed63 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1124,7 +1124,7 @@ static int apparmor_socket_create(int family, int type, int protocol, int kern)
  * @sock: socket that is being setup
  * @family: family of socket being created
  * @type: type of the socket
- * @ptotocol: protocol of the socket
+ * @protocol: protocol of the socket
  * @kern: socket is a special kernel socket
  *
  * Note:

---
base-commit: 2c4d8e19cf060744a9db466ffbaea13ab37f25ca
change-id: 20240505-apparmor_socket_post_create-kdoc-897c7ad5d007



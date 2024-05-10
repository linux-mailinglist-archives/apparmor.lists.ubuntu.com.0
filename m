Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4028C3102
	for <lists+apparmor@lfdr.de>; Sat, 11 May 2024 13:46:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1s5lBU-0000zt-7T; Sat, 11 May 2024 11:46:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <quic_jjohnson@quicinc.com>)
 id 1s5VUv-0006Tc-Ha
 for apparmor@lists.ubuntu.com; Fri, 10 May 2024 19:01:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44AE9J3K003598;
 Fri, 10 May 2024 19:01:25 GMT
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w12c70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 May 2024 19:01:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44AJ1OuA019306
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 May 2024 19:01:24 GMT
Received: from [10.110.100.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 12:01:23 -0700
Message-ID: <efaf1b74-824c-4039-9f6b-47c68c4e2a1d@quicinc.com>
Date: Fri, 10 May 2024 12:01:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: John Johansen <john.johansen@canonical.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn"
 <serge@hallyn.com>
References: <20240505-apparmor_socket_post_create-kdoc-v1-1-1fd88e546e92@quicinc.com>
 <00107f4f-9a14-43b0-8204-45978a487e33@canonical.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <00107f4f-9a14-43b0-8204-45978a487e33@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jNnYhDSs0YE9nY42R83t8jtrlZV5OFn_
X-Proofpoint-ORIG-GUID: jNnYhDSs0YE9nY42R83t8jtrlZV5OFn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_14,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=778 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405100136
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_jjohnson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Mailman-Approved-At: Sat, 11 May 2024 11:46:34 +0000
Subject: Re: [apparmor] [PATCH] apparmor: fix apparmor_socket_post_create()
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 5/10/2024 8:58 AM, John Johansen wrote:
> On 5/5/24 15:39, Jeff Johnson wrote:
>> make C=1 reports:
>>
>> security/apparmor/lsm.c:1138: warning: Function parameter or struct member 'protocol' not described in 'apparmor_socket_post_create'
>>
>> Fix this by correcting the misspelling of 'protocol'.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> 
> Hey Jeff, thanks for the patch, unfortunately Christian Göttsche version of the patch came in before yours so that is the one I committed

np, glad others are helping to clean up :)


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9006D930092
	for <lists+apparmor@lfdr.de>; Fri, 12 Jul 2024 20:49:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sSLKN-000568-Ck; Fri, 12 Jul 2024 18:49:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <quic_jjohnson@quicinc.com>)
 id 1sRxrh-0002nG-9E
 for apparmor@lists.ubuntu.com; Thu, 11 Jul 2024 17:45:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46BCih1U014631;
 Thu, 11 Jul 2024 17:45:45 GMT
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 409kdtmxrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jul 2024 17:45:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46BHjiMD009338
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jul 2024 17:45:44 GMT
Received: from [10.81.24.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 10:45:43 -0700
Message-ID: <ea1b2ed4-704a-4676-8915-d3e566675070@quicinc.com>
Date: Thu, 11 Jul 2024 10:45:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Johansen <john.johansen@canonical.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn"
 <serge@hallyn.com>
References: <20240529-md-apparmor_policy_unpack_test-v1-1-9efc582078c4@quicinc.com>
 <17dad6b9-9dc3-4b0f-bd3d-34e9e22e7627@canonical.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <17dad6b9-9dc3-4b0f-bd3d-34e9e22e7627@canonical.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: k8Mhs3lXG4xo2MilVXA2DfNYVGINlqP_
X-Proofpoint-GUID: k8Mhs3lXG4xo2MilVXA2DfNYVGINlqP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_12,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 impostorscore=0 mlxlogscore=635 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110123
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_jjohnson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Mailman-Approved-At: Fri, 12 Jul 2024 18:49:05 +0000
Subject: Re: [apparmor] [PATCH] apparmor: test: add MODULE_DESCRIPTION()
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
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 6/25/24 01:26, John Johansen wrote:
> On 5/29/24 18:21, Jeff Johnson wrote:
>> Fix the 'make W=1' warning:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in 
>> security/apparmor/apparmor_policy_unpack_test.o
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> 
> Acked-by: John Johansen <john.johansen@canonical.com>
> 
> I will pull this into my tree

I still don't see this in linux-next.
I'm hoping to have these warnings fixed tree-wide in 6.11.



Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1244C8BF926
	for <lists+apparmor@lfdr.de>; Wed,  8 May 2024 10:59:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1s4d9L-0002XC-3r; Wed, 08 May 2024 08:59:43 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <zohar@linux.ibm.com>)
 id 1s4RQC-0001QC-Ee
 for apparmor@lists.ubuntu.com; Tue, 07 May 2024 20:28:20 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 447KPtZg014781; Tue, 7 May 2024 20:27:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xyua3r0ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 May 2024 20:27:53 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 447KRr7C017939;
 Tue, 7 May 2024 20:27:53 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xyua3r0m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 May 2024 20:27:53 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 447IJhib009488; Tue, 7 May 2024 20:27:52 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xysfx8mt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 May 2024 20:27:52 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 447KRnEp21430898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 May 2024 20:27:52 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C27D25805A;
 Tue,  7 May 2024 20:27:49 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2EA158051;
 Tue,  7 May 2024 20:27:48 +0000 (GMT)
Received: from li-5cd3c5cc-21f9-11b2-a85c-a4381f30c2f3.watson.ibm.com (unknown
 [9.31.110.109]) by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  7 May 2024 20:27:48 +0000 (GMT)
Message-ID: <cc11e15bdbfbb36415b36a796387e130b764fd6a.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, dmitry.kasatkin@gmail.com, 
 eric.snowberg@oracle.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, john.johansen@canonical.com,
 stephen.smalley.work@gmail.com, casey@schaufler-ca.com, eparis@redhat.com
Date: Tue, 07 May 2024 16:27:33 -0400
In-Reply-To: <e6e2b31983610bf566d8046edbac0e00c8453233.camel@huaweicloud.com>
References: <20240507092831.3590793-1-roberto.sassu@huaweicloud.com>
 <e6e2b31983610bf566d8046edbac0e00c8453233.camel@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-25.el8_9) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DQc8ykwpdROiUFHjkXQPSgVcCkMS1H8j
X-Proofpoint-ORIG-GUID: kZPJ7Ktfupkc_F6AbfPESwKX_GFbzKBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_12,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=987
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405070143
Received-SPF: pass client-ip=148.163.158.5; envelope-from=zohar@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Mailman-Approved-At: Wed, 08 May 2024 08:59:41 +0000
Subject: Re: [apparmor] [RFC][PATCH] ima: Use sequence number to wait for
	policy updates
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
Cc: selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 apparmor@lists.ubuntu.com, omosnace@redhat.com, guozihua@huawei.com,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 Roberto Sassu <roberto.sassu@huawei.com>, linux-integrity@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi Roberto,

On Tue, 2024-05-07 at 11:32 +0200, Roberto Sassu wrote:
> On Tue, 2024-05-07 at 11:28 +0200, Roberto Sassu wrote:
> > From: Roberto Sassu <roberto.sassu@huawei.com>
> > 
> > Maintain a global sequence number, and set it to individual policy rules,
> > when they are created.
> 
> Just did an attempt, to see if this path is viable.
> 
> This patch would be an alternative to:
> 
> [PATCH v3] ima: Avoid blocking in RCU read-side critical section

Stephen had said,
   "Sidebar: the refactoring of the SELinux policy loading logic may have
   made it possible to revisit the approaches here to permit holding a
   reference to the policy from which the rule was derived so that we
   don't have to return -ESTALE in this scenario."

Removing -ESTALE would be the best solution.  We could then remove the -ESTALE
detection.

I assume the change would be in selinux_policy_commit(). Instead of freeing the
old policy, define and increment a per policy reference count for each
registered notifier callback.

        /* Free the old policy */
        synchronize_rcu();
        selinux_policy_free(oldpolicy);
        kfree(load_state->convert_data);

        /* Notify others of the policy change */
        selinux_notify_policy_change(seqno);

Mimi



Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6FD8BB147
	for <lists+apparmor@lfdr.de>; Fri,  3 May 2024 18:55:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1s2wBY-0007o9-QP; Fri, 03 May 2024 16:55:00 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <hca@linux.ibm.com>) id 1s1NcZ-0005Jq-No
 for apparmor@lists.ubuntu.com; Mon, 29 Apr 2024 09:48:28 +0000
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43T9WcRr023175; Mon, 29 Apr 2024 09:47:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xt90jg0v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Apr 2024 09:47:55 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43T9ltmx016519;
 Mon, 29 Apr 2024 09:47:55 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xt90jg0v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Apr 2024 09:47:54 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 43T7DaXf001450; Mon, 29 Apr 2024 09:47:53 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xsbptppem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Apr 2024 09:47:53 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 43T9loYx26542522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Apr 2024 09:47:52 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0556520040;
 Mon, 29 Apr 2024 09:47:50 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4E6220043;
 Mon, 29 Apr 2024 09:47:48 +0000 (GMT)
Received: from osiris (unknown [9.171.12.101])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 29 Apr 2024 09:47:48 +0000 (GMT)
Date: Mon, 29 Apr 2024 11:47:47 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Message-ID: <20240429094747.29046-G-hca@linux.ibm.com>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
 <20240423-sysctl-const-handler-v3-11-e0beccb836e2@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240423-sysctl-const-handler-v3-11-e0beccb836e2@weissschuh.net>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dsJabyKjD5wmo-a4UVf9qexuuOQkOoCK
X-Proofpoint-GUID: 7SlQVN0HjcUbQBl5eVSaH1VEy2oE_0-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_07,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 clxscore=1011 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290061
Received-SPF: pass client-ip=148.163.156.1; envelope-from=hca@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Mailman-Approved-At: Fri, 03 May 2024 16:54:59 +0000
Subject: Re: [apparmor] [PATCH v3 11/11] sysctl: treewide: constify the
 ctl_table argument of handlers
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
Cc: Joel Granados <j.granados@samsung.com>, Dave Chinner <david@fromorbit.com>,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>,
 linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-sctp@vger.kernel.org, lvs-devel@vger.kernel.org, coreteam@netfilter.org,
 linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 bridge@lists.linux.dev, apparmor@lists.ubuntu.com, linux-xfs@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Apr 23, 2024 at 09:54:46AM +0200, Thomas Weiﬂschuh wrote:
> Adapt the proc_hander function signature to make it clear that handlers
> are not supposed to modify their ctl_table argument.
> 
> This is a prerequisite to moving the static ctl_table structs into
> rodata.
> By migrating all handlers at once a lengthy transition can be avoided.
> 
> The patch was mostly generated by coccinelle with the following script:
> 
>     @@
>     identifier func, ctl, write, buffer, lenp, ppos;
>     @@
> 
>     int func(
>     - struct ctl_table *ctl,
>     + const struct ctl_table *ctl,
>       int write, void *buffer, size_t *lenp, loff_t *ppos)
>     { ... }
> 
> In addition to the scripted changes some other changes are done:
> 
> * the typedef proc_handler is adapted
> 
> * the prototypes of non-static handler are adapted
> 
> * kernel/seccomp.c:{read,write}_actions_logged() and
>   kernel/watchdog.c:proc_watchdog_common() are adapted as they need to
>   adapted together with the handlers for type-consistency reasons
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

...

>  arch/s390/appldata/appldata_base.c        | 10 ++---
>  arch/s390/kernel/debug.c                  |  2 +-
>  arch/s390/kernel/topology.c               |  2 +-
>  arch/s390/mm/cmm.c                        |  6 +--

Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390


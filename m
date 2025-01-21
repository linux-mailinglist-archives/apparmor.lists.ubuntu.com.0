Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C515A18D67
	for <lists+apparmor@lfdr.de>; Wed, 22 Jan 2025 09:11:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1taVpL-00041a-Kh; Wed, 22 Jan 2025 08:11:07 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <agordeev@linux.ibm.com>)
 id 1taEUs-0003ka-Bv
 for apparmor@lists.ubuntu.com; Tue, 21 Jan 2025 13:40:50 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LBcWDl021758;
 Tue, 21 Jan 2025 13:40:21 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44a1n9b0sf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2025 13:40:21 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50LAtOsq021012;
 Tue, 21 Jan 2025 13:40:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 448sb1b14q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2025 13:40:19 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 50LDeIWj60031254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jan 2025 13:40:18 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25C3B2004B;
 Tue, 21 Jan 2025 13:40:18 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FD1A20040;
 Tue, 21 Jan 2025 13:40:17 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [9.155.204.135])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 21 Jan 2025 13:40:17 +0000 (GMT)
Date: Tue, 21 Jan 2025 14:40:16 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Joel Granados <joel.granados@kernel.org>
Message-ID: <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mWjZL4Eizm--6YwnTI2RlL8astD0-e-i
X-Proofpoint-GUID: mWjZL4Eizm--6YwnTI2RlL8astD0-e-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501210112
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=agordeev@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Mailman-Approved-At: Wed, 22 Jan 2025 08:11:05 +0000
Subject: Re: [apparmor] [PATCH v2] treewide: const qualify ctl_tables where
	applicable
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
Cc: linux-aio@kvack.org, linux-hyperv@vger.kernel.org,
 Corey Minyard <cminyard@mvista.com>, Kees Cook <kees@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, keyrings@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org,
 io-uring@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-security-module@vger.kernel.org, codalist@coda.cs.cmu.edu,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-trace-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, linux-raid@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, openipmi-developer@lists.sourceforge.net,
 intel-xe@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 fsverity@lists.linux.dev, linux-nfs@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Song Liu <song@kernel.org>,
 kexec@lists.infradead.org,
 Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
 linux-xfs@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, Jan 10, 2025 at 03:16:08PM +0100, Joel Granados wrote:

Hi Joel,

> Add the const qualifier to all the ctl_tables in the tree except for
> watchdog_hardlockup_sysctl, memory_allocation_profiling_sysctls,
> loadpin_sysctl_table and the ones calling register_net_sysctl (./net,
> drivers/inifiniband dirs). These are special cases as they use a
> registration function with a non-const qualified ctl_table argument or
> modify the arrays before passing them on to the registration function.
> 
> Constifying ctl_table structs will prevent the modification of
> proc_handler function pointers as the arrays would reside in .rodata.
> This is made possible after commit 78eb4ea25cd5 ("sysctl: treewide:
> constify the ctl_table argument of proc_handlers") constified all the
> proc_handlers.

I could identify at least these occurences in s390 code as well:

diff --git a/arch/s390/appldata/appldata_base.c b/arch/s390/appldata/appldata_base.c
index dd7ba7587dd5..9b83c318f919 100644
--- a/arch/s390/appldata/appldata_base.c
+++ b/arch/s390/appldata/appldata_base.c
@@ -204,7 +204,7 @@ appldata_timer_handler(const struct ctl_table *ctl, int write,
 {
 	int timer_active = appldata_timer_active;
 	int rc;
-	struct ctl_table ctl_entry = {
+	const struct ctl_table ctl_entry = {
 		.procname	= ctl->procname,
 		.data		= &timer_active,
 		.maxlen		= sizeof(int),
@@ -237,7 +237,7 @@ appldata_interval_handler(const struct ctl_table *ctl, int write,
 {
 	int interval = appldata_interval;
 	int rc;
-	struct ctl_table ctl_entry = {
+	const struct ctl_table ctl_entry = {
 		.procname	= ctl->procname,
 		.data		= &interval,
 		.maxlen		= sizeof(int),
@@ -269,7 +269,7 @@ appldata_generic_handler(const struct ctl_table *ctl, int write,
 	struct list_head *lh;
 	int rc, found;
 	int active;
-	struct ctl_table ctl_entry = {
+	const struct ctl_table ctl_entry = {
 		.data		= &active,
 		.maxlen		= sizeof(int),
 		.extra1		= SYSCTL_ZERO,
diff --git a/arch/s390/kernel/hiperdispatch.c b/arch/s390/kernel/hiperdispatch.c
index 7857a7e8e56c..7d0ba16085c1 100644
--- a/arch/s390/kernel/hiperdispatch.c
+++ b/arch/s390/kernel/hiperdispatch.c
@@ -273,7 +273,7 @@ static int hiperdispatch_ctl_handler(const struct ctl_table *ctl, int write,
 {
 	int hiperdispatch;
 	int rc;
-	struct ctl_table ctl_entry = {
+	const struct ctl_table ctl_entry = {
 		.procname	= ctl->procname,
 		.data		= &hiperdispatch,
 		.maxlen		= sizeof(int),
diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
index 6691808bf50a..26e50de83d80 100644
--- a/arch/s390/kernel/topology.c
+++ b/arch/s390/kernel/topology.c
@@ -629,7 +629,7 @@ static int topology_ctl_handler(const struct ctl_table *ctl, int write,
 	int enabled = topology_is_enabled();
 	int new_mode;
 	int rc;
-	struct ctl_table ctl_entry = {
+	const struct ctl_table ctl_entry = {
 		.procname	= ctl->procname,
 		.data		= &enabled,
 		.maxlen		= sizeof(int),
@@ -658,7 +658,7 @@ static int polarization_ctl_handler(const struct ctl_table *ctl, int write,
 {
 	int polarization;
 	int rc;
-	struct ctl_table ctl_entry = {
+	const struct ctl_table ctl_entry = {
 		.procname	= ctl->procname,
 		.data		= &polarization,
 		.maxlen		= sizeof(int),
diff --git a/arch/s390/mm/cmm.c b/arch/s390/mm/cmm.c
index 939e3bec2db7..8e354c90a3dd 100644
--- a/arch/s390/mm/cmm.c
+++ b/arch/s390/mm/cmm.c
@@ -263,7 +263,7 @@ static int cmm_pages_handler(const struct ctl_table *ctl, int write,
 			     void *buffer, size_t *lenp, loff_t *ppos)
 {
 	long nr = cmm_get_pages();
-	struct ctl_table ctl_entry = {
+	const struct ctl_table ctl_entry = {
 		.procname	= ctl->procname,
 		.data		= &nr,
 		.maxlen		= sizeof(long),
@@ -283,7 +283,7 @@ static int cmm_timed_pages_handler(const struct ctl_table *ctl, int write,
 				   loff_t *ppos)
 {
 	long nr = cmm_get_timed_pages();
-	struct ctl_table ctl_entry = {
+	const struct ctl_table ctl_entry = {
 		.procname	= ctl->procname,
 		.data		= &nr,
 		.maxlen		= sizeof(long),


> Best regards,
> -- 
> Joel Granados <joel.granados@kernel.org>

Thanks!


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3656F8FA641
	for <lists+apparmor@lfdr.de>; Tue,  4 Jun 2024 01:13:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sEGrW-0004H3-Na; Mon, 03 Jun 2024 23:13:10 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <zohar@linux.ibm.com>)
 id 1sE8w7-00088F-PG
 for apparmor@lists.ubuntu.com; Mon, 03 Jun 2024 14:45:23 +0000
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 453DPNhu016043; Mon, 3 Jun 2024 14:45:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yhdx7gc56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jun 2024 14:45:01 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 453Ej1LB005912;
 Mon, 3 Jun 2024 14:45:01 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yhdx7gc52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jun 2024 14:45:01 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 453CRiTs008517; Mon, 3 Jun 2024 14:45:00 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygec0gk79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jun 2024 14:45:00 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 453EivLK27066938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jun 2024 14:44:59 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8389258055;
 Mon,  3 Jun 2024 14:44:57 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8123958043;
 Mon,  3 Jun 2024 14:44:56 +0000 (GMT)
Received: from li-5cd3c5cc-21f9-11b2-a85c-a4381f30c2f3.ibm.com (unknown
 [9.61.35.127]) by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jun 2024 14:44:56 +0000 (GMT)
Message-ID: <777f5b3d2a94b39bad76bdc64421cdcd026f0144.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Casey Schaufler <casey@schaufler-ca.com>, GUO Zihua <guozihua@huawei.com>,
 paul@paul-moore.com, john.johansen@canonical.com, jmorris@namei.org,
 serge@hallyn.com, roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com,
 stephen.smalley.work@gmail.com, eparis@redhat.com
Date: Mon, 03 Jun 2024 10:44:56 -0400
In-Reply-To: <a46c9c3f-9fec-43b0-8d21-e6ed1e42ee67@schaufler-ca.com>
References: <20240507012541.796421-1-guozihua@huawei.com>
 <a46c9c3f-9fec-43b0-8d21-e6ed1e42ee67@schaufler-ca.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-25.el8_9) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8o9lAtBz3mIkoSKcjVks4pGKTtAsnhwZ
X-Proofpoint-ORIG-GUID: K2k60IGobr0wNSbclXnFNHfptOzvly27
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_11,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1011 mlxlogscore=834
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406030122
Received-SPF: pass client-ip=148.163.158.5; envelope-from=zohar@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Mailman-Approved-At: Mon, 03 Jun 2024 23:13:09 +0000
Subject: Re: [apparmor] [PATCH v3] ima: Avoid blocking in RCU read-side
	critical section
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
Cc: eric.snowberg@oracle.com, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, omosnace@redhat.com, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, 2024-05-10 at 09:03 -0700, Casey Schaufler wrote:
> On 5/6/2024 6:25 PM, GUO Zihua wrote:
> > A panic happens in ima_match_policy:
> > 
> > BUG: unable to handle kernel NULL pointer dereference at 0000000000000010
> > PGD 42f873067 P4D 0
> > Oops: 0000 [#1] SMP NOPTI
> > CPU: 5 PID: 1286325 Comm: kubeletmonit.sh Kdump: loaded Tainted: P
> > Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.0.0 02/06/2015
> > RIP: 0010:ima_match_policy+0x84/0x450
> > Code: 49 89 fc 41 89 cf 31 ed 89 44 24 14 eb 1c 44 39 7b 18 74 26 41 83 ff 05 74 20 48 8b 1b 48 3b 1d f2 b9 f4 00 0f 84 9c 01 00 00 <44> 85 73 10 74 ea 44 8b 6b 14 41 f6 c5 01 75 d4 41 f6 c5 02 74 0f
> > RSP: 0018:ff71570009e07a80 EFLAGS: 00010207
> > RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000200
> > RDX: ffffffffad8dc7c0 RSI: 0000000024924925 RDI: ff3e27850dea2000
> > RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffffabfce739
> > R10: ff3e27810cc42400 R11: 0000000000000000 R12: ff3e2781825ef970
> > R13: 00000000ff3e2785 R14: 000000000000000c R15: 0000000000000001
> > FS:  00007f5195b51740(0000) GS:ff3e278b12d40000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000000000000010 CR3: 0000000626d24002 CR4: 0000000000361ee0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > Call Trace:
> >  ima_get_action+0x22/0x30
> >  process_measurement+0xb0/0x830
> >  ? page_add_file_rmap+0x15/0x170
> >  ? alloc_set_pte+0x269/0x4c0
> >  ? prep_new_page+0x81/0x140
> >  ? simple_xattr_get+0x75/0xa0
> >  ? selinux_file_open+0x9d/0xf0
> >  ima_file_check+0x64/0x90
> >  path_openat+0x571/0x1720
> >  do_filp_open+0x9b/0x110
> >  ? page_counter_try_charge+0x57/0xc0
> >  ? files_cgroup_alloc_fd+0x38/0x60
> >  ? __alloc_fd+0xd4/0x250
> >  ? do_sys_open+0x1bd/0x250
> >  do_sys_open+0x1bd/0x250
> >  do_syscall_64+0x5d/0x1d0
> >  entry_SYSCALL_64_after_hwframe+0x65/0xca
> > 
> > Commit c7423dbdbc9e ("ima: Handle -ESTALE returned by
> > ima_filter_rule_match()") introduced call to ima_lsm_copy_rule within a
> > RCU read-side critical section which contains kmalloc with GFP_KERNEL.
> > This implies a possible sleep and violates limitations of RCU read-side
> > critical sections on non-PREEMPT systems.
> > 
> > Sleeping within RCU read-side critical section might cause
> > synchronize_rcu() returning early and break RCU protection, allowing a
> > UAF to happen.
> > 
> > The root cause of this issue could be described as follows:
> > > 	Thread A	|	Thread B	|
> > > 			|ima_match_policy	|
> > > 			|  rcu_read_lock	|
> > > ima_lsm_update_rule	|			|
> > >  synchronize_rcu	|			|
> > > 			|    kmalloc(GFP_KERNEL)|
> > > 			|      sleep		|
> > ==> synchronize_rcu returns early
> > >  kfree(entry)		|			|
> > > 			|    entry = entry->next|
> > ==> UAF happens and entry now becomes NULL (or could be anything).
> > > 			|    entry->action	|
> > ==> Accessing entry might cause panic.
> > 
> > To fix this issue, we are converting all kmalloc that is called within
> > RCU read-side critical section to use GFP_ATOMIC.
> > 
> > Fixes: c7423dbdbc9e ("ima: Handle -ESTALE returned by ima_filter_rule_match()")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: GUO Zihua <guozihua@huawei.com>
> 
> Looks fine from the Smack perspective.
> Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>

Thanks, Casey. JJ? Paul?




Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DCAA10D24
	for <lists+apparmor@lfdr.de>; Tue, 14 Jan 2025 18:10:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tXkQe-00047y-Gl; Tue, 14 Jan 2025 17:10:12 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <zohar@linux.ibm.com>)
 id 1tXPyb-0005De-DG
 for apparmor@lists.ubuntu.com; Mon, 13 Jan 2025 19:19:53 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DE2GfE024304;
 Mon, 13 Jan 2025 19:19:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444qjamb2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2025 19:19:28 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50DJDBGl005611;
 Mon, 13 Jan 2025 19:19:27 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444qjamb2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2025 19:19:27 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50DHv8hb016498;
 Mon, 13 Jan 2025 19:19:27 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4445p1fdh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2025 19:19:27 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 50DJJQZp24838706
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 19:19:26 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 568055804B;
 Mon, 13 Jan 2025 19:19:26 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43F8258068;
 Mon, 13 Jan 2025 19:19:24 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown
 [9.61.32.139]) by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jan 2025 19:19:24 +0000 (GMT)
Message-ID: <d1b05612412a1d4b858662f296b45279c2141aa8.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: =?ISO-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>, Tanya Agarwal
 <tanyaagarwal25699@gmail.com>
Date: Mon, 13 Jan 2025 14:19:23 -0500
In-Reply-To: <20250113.a860b47a11c7@gnoack.org>
References: <20250111.22fc32ae0729@gnoack.org>
 <20250112072925.1774-1-tanyaagarwal25699@gmail.com>
 <20250113.a860b47a11c7@gnoack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CHrURvGPGMhDDi_Atm7BrRFZJJw8-XxF
X-Proofpoint-ORIG-GUID: uamWymo0QXOEAqqQo8nNK2P81opZ7cIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130152
Received-SPF: pass client-ip=148.163.158.5; envelope-from=zohar@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Mailman-Approved-At: Tue, 14 Jan 2025 17:10:11 +0000
Subject: Re: [apparmor] [PATCH V2] security: fix typos and spelling errors
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
Cc: eric.snowberg@oracle.com, paul@paul-moore.com,
 penguin-kernel@i-love.sakura.ne.jp, dmitry.kasatkin@gmail.com,
 stephen.smalley.work@gmail.com, roberto.sassu@huawei.com, jmorris@namei.org,
 omosnace@redhat.com, mic@digikod.net, linux-security-module@vger.kernel.org,
 anupnewsmail@gmail.com, gnoack@google.com, skhan@linuxfoundation.org,
 linux-integrity@vger.kernel.org, serge@hallyn.com, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, takedakn@nttdata.co.jp
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, 2025-01-13 at 15:50 +0100, G=C3=BCnther Noack wrote:
> On Sun, Jan 12, 2025 at 12:59:27PM +0530, Tanya Agarwal wrote:
> > From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> >=20
> > Fix typos and spelling errors in security module comments that were
> > identified using the codespell tool.
> > No functional changes - documentation only.
> >=20
> > Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> > ---
> > Thanks G=C3=BCnther, for catching this error.
> > The irony of having a spelling mistake in a patch that fixes spelling
> > mistakes is not lost on me :)=20
> >=20
> > I've fixed it in V2 of the patch. Thank you for the careful review!
> >=20
> > V2: fix spelling mistake - s/beeen/been/=20
> >=20
> > =C2=A0security/apparmor/apparmorfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 =
+++---
> > =C2=A0security/apparmor/domain.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 4 ++--
> > =C2=A0security/apparmor/label.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A0security/apparmor/lsm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A0security/apparmor/policy.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 4 ++--
> > =C2=A0security/integrity/evm/evm_crypto.c | 2 +-
> > =C2=A0security/integrity/evm/evm_main.c=C2=A0=C2=A0 | 2 +-
> > =C2=A0security/integrity/ima/ima_main.c=C2=A0=C2=A0 | 6 +++---
> > =C2=A0security/landlock/ruleset.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 2 +-
> > =C2=A0security/selinux/avc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A0security/smack/smack.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A0security/smack/smack_access.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 4 ++--
> > =C2=A0security/smack/smack_lsm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 6 +++---
> > =C2=A0security/smack/smackfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A0security/tomoyo/domain.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A015 files changed, 24 insertions(+), 24 deletions(-)
> >=20
>=20
> [...]
>=20
> > diff --git a/security/integrity/ima/ima_main.c
> > b/security/integrity/ima/ima_main.c
> > index 9b87556b03a7..cdb8c7419d7e 100644
> > --- a/security/integrity/ima/ima_main.c
> > +++ b/security/integrity/ima/ima_main.c
> > @@ -983,9 +983,9 @@ int process_buffer_measurement(struct mnt_idmap *id=
map,
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	/*
> > -	 * Both LSM hooks and auxilary based buffer measurements are
> > -	 * based on policy.=C2=A0 To avoid code duplication, differentiate
> > -	 * between the LSM hooks and auxilary buffer measurements,
> > +	 * Both LSM hooks and auxiliary based buffer measurements are
> > +	 * based on policy. To avoid code duplication, differentiate
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^^^
>=20
> (Small nit:) This change from two-spaces-after-the-dot to a single
> space looks like it happened accidentally.=C2=A0 The two-space style is
> dominant in the ima_main.c file.
>=20
> (However, I am not involved in IMA and others have more authority to
> review this part.=C2=A0 As Paul also said, reviews tend to go smoother wh=
en
> the scope for the patch is a single subsystem - it makes the
> responsibilities clearer.)
>=20
> > +	 * between the LSM hooks and auxiliary buffer measurements,

The spelling mistake being corrected in two places is auxilary -> auxiliary=
.  Thank
you for noticing the unnecessary change from two spaces to one space as wel=
l.

FYI, I agree with Paul the patch should be split.

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>


> > =C2=A0	 * retrieving the policy rule information only for the LSM hook
> > =C2=A0	 * buffer measurements.
> > =C2=A0	 */
>=20
> =E2=80=93G=C3=BCnther



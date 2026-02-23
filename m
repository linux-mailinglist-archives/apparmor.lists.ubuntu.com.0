Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O5oExF/nGm6IQQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 17:23:45 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id EC66E179AB5
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 17:23:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vuYN3-0002kV-Gh; Mon, 23 Feb 2026 16:01:17 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <prvs=0514939b58=clm@meta.com>)
 id 1vuWPa-00012a-Jv
 for apparmor@lists.ubuntu.com; Mon, 23 Feb 2026 13:55:46 +0000
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61N2DCME2422251; Mon, 23 Feb 2026 05:55:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=c1zYe2uBv30hniiOy2AATcivJzhRYWxq08QkgSI+OoM=; b=O7iWbrkMm4tk
 2RCH4QP+2zBMZMAmVpCkKZQjHJ+WY5txycbt9tSHFy+hA61bQuo5oehU/EdTgFvr
 +0T3mOOhe41mRHOqRi6lWvNMOSOb5wjFWYjPe60+r4whTji2axdtE6vmNySdHQjM
 LiUjhTnnGsPjtwxvO+fbtKG9Y3wnDhxjkdWU89BVtlylMYk1ro1GlETET2Vm/q2A
 6eLrsBfuo3df+n8adNnQBdnPIiYiI34MRsUwYgBazfJw4rxXVEPl6QBRmvZf1AcB
 A98EzEen20WvcDY0ZSjCXINVFey9aQXJSy538qpkeiQQ/7XBrtYbOfhnLBh7cXid
 vmAF2XS4GA==
Received: from mail.thefacebook.com ([163.114.134.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4cgdwwk975-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 23 Feb 2026 05:55:32 -0800 (PST)
Received: from devbig003.atn7.facebook.com (2620:10d:c085:208::7cb7) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 23 Feb 2026 13:55:30 +0000
From: Chris Mason <clm@meta.com>
To: NeilBrown <neil@brown.name>
Date: Mon, 23 Feb 2026 05:52:10 -0800
Message-ID: <20260223135517.1229434-1-clm@meta.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223011210.3853517-2-neilb@ownmail.net>
References: <20260223011210.3853517-1-neilb@ownmail.net>
 <20260223011210.3853517-2-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:208::7cb7]
X-Proofpoint-ORIG-GUID: 3VAPDQqQA9urDNWnBOCbuGLWeYoMbRO9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX4S3buN7Z5VJc
 jXcVuMMKhmmICPL4fOCNdNF5o0+DIGSGFsoIz1K+XpE2dIMgRWbAvMafxzvEE5SgN900SEU6sNj
 0lY5IZUXE4bxGELXRUVaByAVy1poJLTGWq8UzKyS7IKeggwbf3BxhbDyg1oQlzgrkkDwz9/54f9
 O/qnxxrLH/kZvyWp2RiaZxfyrQk0zv6Msk2AyLdEjr7wklkEHwOQvOv+YjIFJUdlKXgfzp5Pzuk
 poaBSL7OVrIxXyGH9sNOtfatZJJ3RAhts+F89zflYZ7NnVNPhf+pPrONOzZILTH6GaoBbAMcG8p
 FwesOaPe+X6to4yiJxCdtGBzPIQZKrC2kKC+V699bCJaWNdf/Ayh0imZi7ADN7vU4BDKEn5aYUI
 70aIqZ4cW/fuHpz9Osi9qNgEWi4W++qzJg8J3KSWERnITEpdG94I2yBA0ohjn/Jqp9LTvIQBSpw
 kfEXyFbrjHMEtRtYGmA==
X-Proofpoint-GUID: 3VAPDQqQA9urDNWnBOCbuGLWeYoMbRO9
X-Authority-Analysis: v=2.4 cv=a+49NESF c=1 sm=1 tr=0 ts=699c5c54 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=I-1mG6jRAAAA:8
 a=v_1R9vC89HT8ZXP7cqwA:9 a=vAntc5lzOlbkVmf1VcWC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_02,2025-10-01_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=0514939b58=clm@meta.com; helo=mx0a-00082601.pphosted.com
X-Mailman-Approved-At: Mon, 23 Feb 2026 16:01:16 +0000
Subject: Re: [apparmor] [PATCH v2 01/15] VFS: note error returns is
	documentation for various lookup functions
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
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
 Amir Goldstein <amir73il@gmail.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>,
 Miklos Szeredi <miklos@szeredi.hu>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[meta.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[meta.com:s=s2048-2025-q2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[suse.cz,kernel.org,gmail.com,vger.kernel.org,redhat.com,paul-moore.com,szeredi.hu,namei.org,hallyn.com,lists.ubuntu.com,zeniv.linux.org.uk,oracle.com,lists.linux.dev];
	FORGED_RECIPIENTS(0.00)[m:neil@brown.name,m:jack@suse.cz,m:djwong@kernel.org,m:amir73il@gmail.com,m:linux-unionfs@vger.kernel.org,m:dhowells@redhat.com,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:jmorris@namei.org,m:serge@hallyn.com,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[clm@meta.com,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[brown.name:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,ownmail.net:email,meta.com:mid];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clm@meta.com,apparmor-bounces@lists.ubuntu.com];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[meta.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: EC66E179AB5
X-Rspamd-Action: no action

NeilBrown <neilb@ownmail.net> wrote:
> From: NeilBrown <neil@brown.name>
> 
> Darrick recently noted that try_lookup_noperm() is documented as
> "Look up a dentry by name in the dcache, returning NULL if it does not
> currently exist." but it can in fact return an error.
> 
> So update the documentation for that and related function.
>

Hi everyone,

I don't normally forward the typos, but since this is a documentation-y patch:

commit 0254b9b974f23889898562aa94f6428bf30eb6b5
Author: NeilBrown <neil@brown.name>

VFS: note error returns is documentation for various lookup functions
                       ^^^^^ in?

Darrick recently noted that try_lookup_noperm() is documented as
"Look up a dentry by name in the dcache, returning NULL if it does not
currently exist." but it can in fact return an error. So update the
documentation for that and related function.

Link: https://lore.kernel.org/all/20260218234917.GA6490@frogsfrogsfrogs/

> diff --git a/fs/namei.c b/fs/namei.c
> index 58f715f7657e2..e4ac07a4090e7 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -3124,7 +3124,8 @@ static int lookup_one_common(struct mnt_idmap *idmap,
>   * @base:	base directory to lookup from
>   *
>   * Look up a dentry by name in the dcache, returning NULL if it does not
> - * currently exist.  The function does not try to create a dentry and if one
> + * currently exist or an error is there is a problem with the name.
                                       ^^

There's a grammar error: "is there is" should be "if there is".

> + * The function does not try to create a dentry and if one
>   * is found it doesn't try to revalidate it.
>   *
>   * Note that this routine is purely a helper for filesystem usage and should
> @@ -3132,6 +3133,11 @@ static int lookup_one_common(struct mnt_idmap *idmap,
>   *
>   * No locks need be held - only a counted reference to @base is needed.
>   *
> + * Returns:
> + *   - ref-counted dentry on success, or
> + *   - %NULL if name could not be found, or
> + *   - ERR_PTR(-EACCES) if name is dot or dotdot or contains a slash or nul, or
> + *   - ERR_PTR() if fs provide ->d_hash, and this returned an error.
>   */
>  struct dentry *try_lookup_noperm(struct qstr *name, struct dentry *base)
>  {

[ ... ]

> @@ -3208,6 +3214,11 @@ EXPORT_SYMBOL(lookup_one);
>   *
>   * Unlike lookup_one, it should be called without the parent
>   * i_rwsem held, and will take the i_rwsem itself if necessary.
> + *
> + * Returns:= A dentry, possibly negative, or
           ^^^

There's a typo: "Returns:=" should be "Returns:".

> + *	   - same errors as try_lookup_noperm() or
> + *	   - ERR_PTR(-ENOENT) if parent has been removed, or
> + *	   - ERR_PTR(-EACCES) if parent directory is not searchable.
>   */
>  struct dentry *lookup_one_unlocked(struct mnt_idmap *idmap, struct qstr *name,
>  				   struct dentry *base)

[ ... ]

> @@ -3244,6 +3255,10 @@ EXPORT_SYMBOL(lookup_one_unlocked);
>   * It should be called without the parent i_rwsem held, and will take
>   * the i_rwsem itself if necessary.  If a fatal signal is pending or
>   * delivered, it will return %-EINTR if the lock is needed.
> + *
> + * Returns: A dentry, possibly negative, or
> + *	   - same errors as lookup_one_unlocked() or
> + *	   - ERR_PTR(-EINTR) is a fatal signal is pending.
                             ^^

There's a grammar error: "is a fatal signal is pending" should be "if a
fatal signal is pending".

> + */
>  struct dentry *lookup_one_positive_killable(struct mnt_idmap *idmap,
>  					    struct qstr *name,



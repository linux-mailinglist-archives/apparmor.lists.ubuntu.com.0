Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKtIAoaDnGlwIwQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 17:42:46 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9947417A044
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 17:42:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vuYN6-0002kk-9J; Mon, 23 Feb 2026 16:01:20 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <prvs=0514939b58=clm@meta.com>)
 id 1vuVwn-0002kv-C1
 for apparmor@lists.ubuntu.com; Mon, 23 Feb 2026 13:26:01 +0000
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NCxnfE1835072; Mon, 23 Feb 2026 05:25:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=t2qu4JKn1z2iQeoE564X+mR26Wg8TVgaWbcVkQrE+7Y=; b=RF0FDuhZejP9
 O5JCFhKqWVKfqcDIItAIaN4aS/uF+/M42J1SaZfNzph56n6gBmQnmkQKTpbDbExY
 7QdsBb8uiVRoHnLbQduUssKI0YdUEX9ylj7Als1zF7UNvq6iR+VdimnNHkpLQash
 4RhHifSCjPSNG+EQMXOa36aJxrH3OJEiynucoT7UXVfV10iHn62j6XyGLTVguqX7
 0jC4Uis0I6fpScsGuFj0ZiVdShOrS6It7Zn5R1zwumY2eeHx7S1Dsc9dsc92Yaz/
 fkeH7pTObYHwdouHXPqHAKhnXs3JpHwkXxb6rOd7Bufrkwa6hp7/CfQHKQ7C7/Ce
 yy6Sd1p3+w==
Received: from mail.thefacebook.com ([163.114.134.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4cgqcj0553-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 23 Feb 2026 05:25:49 -0800 (PST)
Received: from devbig003.atn7.facebook.com (2620:10d:c085:208::7cb7) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 23 Feb 2026 13:25:47 +0000
From: Chris Mason <clm@meta.com>
To: NeilBrown <neil@brown.name>
Date: Mon, 23 Feb 2026 05:24:41 -0800
Message-ID: <20260223132533.136328-1-clm@meta.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223011210.3853517-7-neilb@ownmail.net>
References: <20260223011210.3853517-1-neilb@ownmail.net>
 <20260223011210.3853517-7-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:208::7cb7]
X-Proofpoint-GUID: D5qTdhAt4Lmhg6QxkEqk6H5lNzMRMp0K
X-Authority-Analysis: v=2.4 cv=QqxTHFyd c=1 sm=1 tr=0 ts=699c555d cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=I-1mG6jRAAAA:8 a=VwQbUJbxAAAA:8 a=xVhDTqbCAAAA:8
 a=Gzw8Aq_Vnp1Aj3qmndoA:9 a=vAntc5lzOlbkVmf1VcWC:22 a=GrmWmAYt4dzCMttCBZOh:22
X-Proofpoint-ORIG-GUID: D5qTdhAt4Lmhg6QxkEqk6H5lNzMRMp0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNSBTYWx0ZWRfX5fZdKXimKO6+
 kZyko22vbGzQln4wurgc8tw1wzQr7Z/M/sxa8EbahSsn61ubnLHxb8gTJ7VdRxSDu08D3AwU1rY
 fYPR5qpyvuYl/aso5dEMraDpxPhDwEM2FUw26G2Sq34aXTmy17ginzdJjwK2WfiqWNj97HBe9p8
 xzMxfRJJfjVae/wvrk7NxERz6hrtQfIc0UTgUjJyybKoMBwN0ET2QchyBOq7fsFDoBQ6xl8RzCn
 lkdwDSnchrjDt/iAGlZDOY36cOEvSQBZzh6kK0FijItiyaEMAvRFvJ3Y/08YpbztYFsnOJEkB2k
 o/eLu0xtuuBfvhqQuavN/mT0/Mj81CCR9wIXZZF3NKzda21leiHjfJzLzaQPR7bNJSPejFBRgtq
 XjdDDrL5rtOWqzykt0hPhzBdEi9CZv6YlEb+KidoNOC6khhcqIxOTiEFu0wgQOmXNJJVZFBuQMG
 qbs/pm/YTtp7YlcDtHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=0514939b58=clm@meta.com; helo=mx0a-00082601.pphosted.com
X-Mailman-Approved-At: Mon, 23 Feb 2026 16:01:16 +0000
Subject: Re: [apparmor] [PATCH v2 06/15] selinux: Use
	simple_start_creating() / simple_done_creating()
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[suse.cz,kernel.org,gmail.com,vger.kernel.org,redhat.com,paul-moore.com,szeredi.hu,namei.org,hallyn.com,lists.ubuntu.com,zeniv.linux.org.uk,oracle.com,lists.linux.dev];
	FORGED_RECIPIENTS(0.00)[m:neil@brown.name,m:jack@suse.cz,m:djwong@kernel.org,m:amir73il@gmail.com,m:linux-unionfs@vger.kernel.org,m:dhowells@redhat.com,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:jmorris@namei.org,m:serge@hallyn.com,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[clm@meta.com,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,ownmail.net:email,meta.com:mid,brown.name:email];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clm@meta.com,apparmor-bounces@lists.ubuntu.com];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[meta.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 9947417A044
X-Rspamd-Action: no action

NeilBrown <neilb@ownmail.net> wrote:
> From: NeilBrown <neil@brown.name>
> 
> Instead of explicitly locking the parent and performing a lookup in
> selinux, use simple_start_creating(), and then use
> simple_done_creating() to unlock.
> 

Hi everyone,

Amir suggested I run these through, and this commit was flagged:

commit bc981629767980bbaee2ca3c7348b5a648665a9d
Author: NeilBrown <neil@brown.name>

selinux: Use simple_start_creating() / simple_done_creating()

Instead of explicitly locking the parent and performing a lookup in
selinux, use simple_start_creating(), and then use
simple_done_creating() to unlock.

This extends the region that the directory is locked for, and also
performs a lookup. The lock extension is of no real consequence.
The lookup uses simple_lookup() and so always succeeds. Thus when
d_make_persistent() is called the dentry will already be hashed.
d_make_persistent() handles this case.

Reviewed-by: Jeff Layton <jlayton@kernel.org>
Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
> index 3245cc531555b..7d4f90e5b12a0 100644
> --- a/security/selinux/selinuxfs.c
> +++ b/security/selinux/selinuxfs.c
> @@ -1931,15 +1931,16 @@ static const struct inode_operations swapover_dir_inode_operations = {
>  static struct dentry *sel_make_swapover_dir(struct super_block *sb,
>  						unsigned long *ino)
>  {
> -	struct dentry *dentry = d_alloc_name(sb->s_root, ".swapover");
> +	struct dentry *dentry;
>  	struct inode *inode;
>
> -	if (!dentry)
> +	inode = sel_make_inode(sb, S_IFDIR);
> +	if (!inode)
>  		return ERR_PTR(-ENOMEM);
>
> -	inode = sel_make_inode(sb, S_IFDIR);
> -	if (!inode) {
> -		dput(dentry);
> +	dentry = simple_start_creating(sb->s_root, ".swapover");
> +	if (!dentry) {
> +		iput(inode);
>  		return ERR_PTR(-ENOMEM);
>  	}

Can this cause a kernel crash when simple_start_creating() fails?

The function simple_start_creating() returns ERR_PTR on failure, not
NULL. The check `if (!dentry)` only catches NULL values. When
simple_start_creating() fails and returns an ERR_PTR value like
ERR_PTR(-ENOMEM), this value is non-NULL and the error check is bypassed.

Execution would continue to d_make_persistent(dentry, inode), which
attempts to lock dentry->d_lock, dereferencing the ERR_PTR value and
causing a kernel crash.

The old code used d_alloc_name() which returns NULL on error. The new
code uses simple_start_creating() which returns ERR_PTR on error, but
the error checking pattern wasn't updated to match.

Should the check be `if (IS_ERR(dentry))` instead, and return dentry
rather than ERR_PTR(-ENOMEM) to preserve the actual error code?

>
> @@ -1947,11 +1948,9 @@ static struct dentry *sel_make_swapover_dir(struct super_block *sb,
>  	inode->i_ino = ++(*ino);
>  	/* directory inodes start off with i_nlink == 2 (for "." entry) */
>  	inc_nlink(inode);
> -	inode_lock(sb->s_root->d_inode);
>  	d_make_persistent(dentry, inode);
>  	inc_nlink(sb->s_root->d_inode);
> -	inode_unlock(sb->s_root->d_inode);
> -	dput(dentry);
> +	simple_done_creating(dentry);
>  	return dentry;	// borrowed
>  }



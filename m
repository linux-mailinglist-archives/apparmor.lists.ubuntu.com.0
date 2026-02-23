Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP2iOZ59nGm6IQQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 17:17:34 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2C0179905
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 17:17:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vuYN3-0002kO-9F; Mon, 23 Feb 2026 16:01:17 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <prvs=0514939b58=clm@meta.com>)
 id 1vuVvg-0002dc-Rs
 for apparmor@lists.ubuntu.com; Mon, 23 Feb 2026 13:24:53 +0000
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61N7Limb1689352; Mon, 23 Feb 2026 05:24:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=ylAoujAb11HbDuBJyzbfnejKsZ07LLMDi9nKW5p43Pk=; b=SxdNRDr0l2Y7
 /Y0FpYGKOuz1CKUHtmblr+gQjq7wZ4HHSG+sqvO6cMny74VitKUvdzrwNzewZiZZ
 ZedKtDiv3GHJ+vuP15gayZJ8Ms72r8/zYQJufhWxhIj1YmHhbvHaKlQhEB3BmqhQ
 HZsT9iAPeFJb5Wyv6kACOzkmIvfvmZchVyjVwKEd6P7UrXZpHzZ7O6dfNhJrc0pX
 6OMpo+MdANYnVT0yrP8hVbxFP/jaaeH2c8bxpuRdagMs9CJIV0Io+PMsT/jAKTk5
 rZC5wxJjdUysYERtOMUg0Lz6Gx2aaf1INXCoPJ4pAfONsJUh0LOYV1FLKhCr962Z
 ru0KmcjETg==
Received: from mail.thefacebook.com ([163.114.134.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4cgjehhwcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 23 Feb 2026 05:24:40 -0800 (PST)
Received: from devbig003.atn7.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 23 Feb 2026 13:24:38 +0000
From: Chris Mason <clm@meta.com>
To: NeilBrown <neil@brown.name>
Date: Mon, 23 Feb 2026 05:23:00 -0800
Message-ID: <20260223132424.105125-1-clm@meta.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223011210.3853517-13-neilb@ownmail.net>
References: <20260223011210.3853517-1-neilb@ownmail.net>
 <20260223011210.3853517-13-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:208::f]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNSBTYWx0ZWRfX0dgT0g6QYSuu
 PEGLVNnMsGePov8R8l1QB8LfoyGl2lb8QDvaN/NlBSu8a681sCD4iddZXWsCugetgQyRI9j1XX6
 o36cgFOkf0FYItI80uVv4SsgsYwS0NWXG6+3ATVVfENiiT2ZEsxIRRndr4cm0/HaX7yRwdABHg+
 NLmaiw0XL25XYH4mavUh75rhG0n+M5piP9hRWGfNB3PtfX9DYJGc6zRlz06viQHz6Oc7KKErcV8
 mqIGBevUJCYjIK7fbCiQiztsp1zUVqUAHchSymCQwcCrbNCgww9cWNUntK49I73Mp12aXcVtzGB
 e4kQBNGdW8DTT4qZV+rvYoQ1m2fOCwTGi7FeuW3FLk/H7uPenBvDWz4s+TWXkXZyZOzTlmDG0KM
 89FMzYalqBzRqsi267bF/1ugnRavbGw8zAGi9Ie31dO2Rz0JFT//NrZkN7HaHCThrdPyLo4RuCh
 YhDCGR8IhfI2s47VYsQ==
X-Proofpoint-GUID: J5EmcEgOR7K6M1JAMJLysnrhG-etdjNl
X-Proofpoint-ORIG-GUID: J5EmcEgOR7K6M1JAMJLysnrhG-etdjNl
X-Authority-Analysis: v=2.4 cv=cK/tc1eN c=1 sm=1 tr=0 ts=699c5518 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=I-1mG6jRAAAA:8 a=cpV2LRKSBlBd3YnpoBYA:9
 a=vAntc5lzOlbkVmf1VcWC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=0514939b58=clm@meta.com; helo=mx0a-00082601.pphosted.com
X-Mailman-Approved-At: Mon, 23 Feb 2026 16:01:16 +0000
Subject: Re: [apparmor] [PATCH v2 12/15] ovl: change ovl_create_real() to
	get a new lock when re-opening created file.
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ownmail.net:email,brown.name:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clm@meta.com,apparmor-bounces@lists.ubuntu.com];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[meta.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 8A2C0179905
X-Rspamd-Action: no action

NeilBrown <neilb@ownmail.net> wrote:
> From: NeilBrown <neil@brown.name>
> 
> When ovl_create_real() is used to create a file on the upper filesystem
> it needs to return the resulting dentry - positive and hashed.
> It is usually the case the that dentry passed to the create function
> (e.g.  vfs_create()) will be suitable but this is not guaranteed.  The
> filesystem may unhash that dentry forcing a repeat lookup next time the
> name is wanted.
> 

Hi everyone,

Amir suggested I run these through, and this commit was flagged:

commit 62d49d1e44667e4f93bec415faabec5526992ac0
Author: NeilBrown <neil@brown.name>

ovl: change ovl_create_real() to get a new lock when re-opening created file.

This commit changes ovl_create_real() to drop the directory lock and
reacquire a new lock for lookup when the created dentry is unhashed. It
also removes ovl_lookup_upper() which is no longer used.

Signed-off-by: NeilBrown <neil@brown.name>

> diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
> index c4feb89ad1e39..6285069ccc590 100644
> --- a/fs/overlayfs/dir.c
> +++ b/fs/overlayfs/dir.c
> @@ -159,7 +159,8 @@ int ovl_cleanup_and_whiteout(struct ovl_fs *ofs, struct dentry *dir,
>  }
>
>  struct dentry *ovl_create_real(struct ovl_fs *ofs, struct dentry *parent,
> -			       struct dentry *newdentry, struct ovl_cattr *attr)
> +			       struct dentry *newdentry, struct qstr *qname,
> +			       struct ovl_cattr *attr)
>  {
>  	struct inode *dir = parent->d_inode;
>  	int err;
> @@ -221,19 +222,29 @@ struct dentry *ovl_create_real(struct ovl_fs *ofs, struct dentry *parent,
>  		struct dentry *d;
>  		/*
>  		 * Some filesystems (i.e. casefolded) may return an unhashed
> -		 * negative dentry from the ovl_lookup_upper() call before
> +		 * negative dentry from the ovl_start_creating_upper() call before
>  		 * ovl_create_real().
>  		 * In that case, lookup again after making the newdentry
>  		 * positive, so ovl_create_upper() always returns a hashed
> -		 * positive dentry.
> +		 * positive dentry.  We lookup using qname which should be
> +		 * the same name as newentry, but is certain not to change.
> +		 * As we have to drop the lock before the lookup a race
> +		 * could result in a lookup failure.  In that case we return
> +		 * an error.
>  		 */
> -		d = ovl_lookup_upper(ofs, newdentry->d_name.name, parent,
> -				     newdentry->d_name.len);
> -		dput(newdentry);
> -		if (IS_ERR_OR_NULL(d))
> +		end_creating_keep(newdentry);
> +		d = ovl_start_creating_upper(ofs, parent, qname);
> +
> +		if (IS_ERR_OR_NULL(d)) {
>  			err = d ? PTR_ERR(d) : -ENOENT;
> +		} else if (d->d_inode != newdentry->d_inode) {
> +			err = -EIO;
> +			dput(newdentry);
> +		} else {
> +			dput(newdentry);
>  			return d;
> +		}
> +		return ERR_PTR(err);
>  	}

Does this leak the newdentry reference when IS_ERR_OR_NULL(d) is true?

The code now calls end_creating_keep(newdentry) which keeps the reference,
then calls ovl_start_creating_upper(). If that returns an error or NULL,
the function returns ERR_PTR(err) without cleaning up newdentry:

	end_creating_keep(newdentry);
	d = ovl_start_creating_upper(ofs, parent, qname);

	if (IS_ERR_OR_NULL(d)) {
		err = d ? PTR_ERR(d) : -ENOENT;
	} ...
	return ERR_PTR(err);

The old code always went through the 'out:' label which called
end_creating(newdentry) on error. The new code bypasses that cleanup.


Does this leak both the parent lock and the dentry 'd' when the lookup
returns a different inode?

When d->d_inode != newdentry->d_inode, the code sets err = -EIO and calls
dput(newdentry), but doesn't clean up 'd':

	} else if (d->d_inode != newdentry->d_inode) {
		err = -EIO;
		dput(newdentry);
	} ...
	return ERR_PTR(err);

The dentry 'd' was returned by ovl_start_creating_upper() with the parent
directory lock held. The code needs to call end_creating(d) to release the
lock via end_dirop()->inode_unlock() and release the dentry reference via
end_dirop()->dput().



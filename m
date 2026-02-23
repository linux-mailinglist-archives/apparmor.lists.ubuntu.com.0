Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EzhLYaDnGlwIwQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 17:42:46 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 987EB17A04B
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 17:42:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vuYN6-0002kd-0e; Mon, 23 Feb 2026 16:01:20 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <prvs=0514939b58=clm@meta.com>)
 id 1vuVs1-0001IV-DV
 for apparmor@lists.ubuntu.com; Mon, 23 Feb 2026 13:21:05 +0000
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61N7LjTw1689366; Mon, 23 Feb 2026 05:20:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=+jj35zgXKhtaxe8slFh2KjLza6PRHJYalc4EKFRj1xk=; b=uQ3peFVpfrPv
 P1eNTCmO7sZzHHxSMqkZfrVpKFA1ZEnJiWX/K6a64owsi6ZEvoptl9inCEq4kFSR
 Su3fW5cc6nGdrgVNPCMEUHbdk304q1HIsAN5FKV59LzaXWQZsFEs71Pf7qXlwkbr
 F1H13bcXnIobrOpdVfZtgIPQN5ydQKhi0m9N/GEp8DNUUNu5Rob+j0mAtAx1MUoS
 73kX4wyXHXprW//vO0Qp4cgTVmqpvdF/05FYmEpkjjsqM2FdjNLFT7GqCHFxTynJ
 bR/pXaaD35diR2KJiYAqPbwXBM2QqHLdbXRSVrAGsxgdiHxWZRHZZjVcXqa4V3D4
 puHFLDf/GA==
Received: from mail.thefacebook.com ([163.114.134.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4cgjehhvnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 23 Feb 2026 05:20:44 -0800 (PST)
Received: from devbig003.atn7.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Mon, 23 Feb 2026 13:20:42 +0000
From: Chris Mason <clm@meta.com>
To: NeilBrown <neil@brown.name>
Date: Mon, 23 Feb 2026 05:13:37 -0800
Message-ID: <20260223132027.4165509-1-clm@meta.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223011210.3853517-10-neilb@ownmail.net>
References: <20260223011210.3853517-1-neilb@ownmail.net>
 <20260223011210.3853517-10-neilb@ownmail.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:208::f]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNCBTYWx0ZWRfX+kME6KZmr89V
 FuKP+HbtK6Ll3Q33VPnvmu6dSF4itJ8mVYWVnJ7GZz07InfaInBIu5fTcVWC3E0zX9IPFY3omT/
 NFDzwO5fxPFfsJlAau4AJFE+l9AIU3wjNX4G3ORzecBxHBbJ8oF+WaRyFx+8A/R3s1DZchoPfZn
 BibQx0Mjpw9jKbymWVR73+564ZbtEGwqzDPmsW7IOuY/8Obw6csoIk2hJfyMafNi5SrOz8czyFJ
 uJ70XH74dPoeTLXMkqjRRdbf1qWlwih5nYz3Hg/ux3VdEAVnTH6MFH+Puak3DUvyCgsTd+5B5ZN
 rWHWmiL/tZIpuwkvGsKU1fAPjFfWQNcucF5wuE/C/bPPnyiF4xRWJPNDkDJWCTjma7twh5jrIJ4
 J19KZBZpHaCGFAR0Vi8F67Zew8QnYtdM0FhaOWXjdsvx/vRaCJFcBkpGw5CiMVv0w84749y9QKq
 0TDcj6dO/tU+Kqu3s2Q==
X-Proofpoint-GUID: Fa5SgpH4NiF5_GiC7hGWmJ-OFXDNqwP8
X-Proofpoint-ORIG-GUID: Fa5SgpH4NiF5_GiC7hGWmJ-OFXDNqwP8
X-Authority-Analysis: v=2.4 cv=cK/tc1eN c=1 sm=1 tr=0 ts=699c542c cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=e8O0uTMVAAAA:20 a=I-1mG6jRAAAA:8
 a=jAaqfGSQgQmH2hLIMWsA:9 a=vAntc5lzOlbkVmf1VcWC:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=0514939b58=clm@meta.com; helo=mx0a-00082601.pphosted.com
X-Mailman-Approved-At: Mon, 23 Feb 2026 16:01:16 +0000
Subject: Re: [apparmor] [PATCH v2 09/15] ovl: Simplify ovl_lookup_real_one()
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
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[meta.com:s=s2048-2025-q2];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_XOIP(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_RECIPIENTS(0.00)[m:neil@brown.name,m:jack@suse.cz,m:djwong@kernel.org,m:amir73il@gmail.com,m:linux-unionfs@vger.kernel.org,m:dhowells@redhat.com,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:jmorris@namei.org,m:serge@hallyn.com,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-nfs@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[suse.cz,kernel.org,gmail.com,vger.kernel.org,redhat.com,paul-moore.com,szeredi.hu,namei.org,hallyn.com,lists.ubuntu.com,zeniv.linux.org.uk,oracle.com,lists.linux.dev];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[clm@meta.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clm@meta.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,ownmail.net:email,brown.name:email];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DKIM_TRACE(0.00)[meta.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 987EB17A04B
X-Rspamd-Action: no action

NeilBrown <neilb@ownmail.net> wrote:
> From: NeilBrown <neil@brown.name>
> 
> The primary purpose of this patch is to remove the locking from
> ovl_lookup_real_one() as part of centralising all locking of directories
> for name operations.
> 
> The locking here isn't needed.  By performing consistency tests after
> the lookup we can be sure that the result of the lookup was valid at
> least for a moment, which is all the original code promised.
> 
> lookup_noperm_unlocked() is used for the lookup and it will take the
> lock if needed only where it is needed.
> 
> Also:
>  - don't take a reference to real->d_parent.  The parent is
>    only use for a pointer comparison, and no reference is needed for
>    that.
>  - Several "if" statements have a "goto" followed by "else" - the
>    else isn't needed: the following statement can directly follow
>    the "if" as a new statement
>  - Use a consistent pattern of setting "err" before performing a test
>    and possibly going to "fail".
>  - remove the "out" label (now that we don't need to dput(parent) or
>    unlock) and simply return from fail:.

Hi everyone,

Amir asked me to run these through, and this commit was flagged.  I recently
changed the prompts to include some vfs knowledge:

https://github.com/masoncl/review-prompts/blob/main/kernel/subsystem/vfs.md

And I also put in some words to make it prefer reporting problems that might
not be bugs, but that do violate some rule in the .md files.  This might
be a false positive from that new shift toward blindly trusting the guides,
but I'll let everyone here decide:

commit d1bfcef048896cdc9e4c57e3249b6ad344d64c02
Author: NeilBrown <neil@brown.name>

ovl: Simplify ovl_lookup_real_one()

This patch removes locking from ovl_lookup_real_one() and reorganizes the
control flow. The function now uses lookup_noperm_unlocked() instead of
lookup_noperm() and performs consistency validation after the lookup rather
than holding a lock during the operation.

> diff --git a/fs/overlayfs/export.c b/fs/overlayfs/export.c
> index 83f80fdb15674..b448fc9424b64 100644
> --- a/fs/overlayfs/export.c
> +++ b/fs/overlayfs/export.c
> @@ -349,69 +349,64 @@ static struct dentry *ovl_dentry_real_at(struct dentry *dentry, int idx)
>  	return NULL;
>  }
>
> -/*
> - * Lookup a child overlay dentry to get a connected overlay dentry whose real
> - * dentry is @real. If @real is on upper layer, we lookup a child overlay
> - * dentry with the same name as the real dentry. Otherwise, we need to consult
> - * index for lookup.
> +/**
> + * ovl_lookup_real_one -  Lookup a child overlay dentry to get an overlay dentry whose real dentry is given
> + * @connected: parent overlay dentry
> + * @real: given child real dentry
> + * @layer: layer in which @real exists
> + *
> + *
> + * Lookup a child overlay dentry in @connected with the same name as the @real
> + * dentry.  Then check that the parent of the result is the real dentry for
> + * @connected, and @real is the real dentry for the result.
> + *
> + * Returns:
> + *   %-ECHILD if the parent of @real is no longer the real dentry for @connected.
> + *   %-ESTALE if @real is no the real dentry of the found dentry.
                                       ^^
There's a typo here: "is no the" should be "is not the".

> + *   Otherwise the found dentry is returned.
>   */
>  static struct dentry *ovl_lookup_real_one(struct dentry *connected,
>  					  struct dentry *real,
>  					  const struct ovl_layer *layer)
>  {
> -	struct inode *dir = d_inode(connected);
> -	struct dentry *this, *parent = NULL;
> +	struct dentry *this;
>  	struct name_snapshot name;
>  	int err;
>
>  	/*
> -	 * Lookup child overlay dentry by real name. The dir mutex protects us
> -	 * from racing with overlay rename. If the overlay dentry that is above
> -	 * real has already been moved to a parent that is not under the
> -	 * connected overlay dir, we return -ECHILD and restart the lookup of
> -	 * connected real path from the top.
> -	 */
> -	inode_lock_nested(dir, I_MUTEX_PARENT);
> -	err = -ECHILD;
> -	parent = dget_parent(real);
> -	if (ovl_dentry_real_at(connected, layer->idx) != parent)
> -		goto fail;
> -
> -	/*
> -	 * We also need to take a snapshot of real dentry name to protect us
> +	 * We need to take a snapshot of real dentry name to protect us
>  	 * from racing with underlying layer rename. In this case, we don't
>  	 * care about returning ESTALE, only from dereferencing a free name
>  	 * pointer because we hold no lock on the real dentry.
>  	 */
>  	take_dentry_name_snapshot(&name, real);
> -	/*
> -	 * No idmap handling here: it's an internal lookup.
> -	 */
> -	this = lookup_noperm(&name.name, connected);
> +	this = lookup_noperm_unlocked(&name.name, connected);
>  	release_dentry_name_snapshot(&name);
> +
> +	err = -ECHILD;
> +	if (ovl_dentry_real_at(connected, layer->idx) != real->d_parent)
> +		goto fail;
> +

A subsystem pattern flags this as potentially concerning: the VFS subsystem
guide indicates that TOCTOU validation checking d_parent should also check
d_unhashed() because a dentry can be unhashed (removed from dcache by
concurrent operations) while its d_parent pointer remains unchanged.

The old code held inode_lock_nested(dir, I_MUTEX_PARENT) during the entire
lookup and validation, which serialized with operations that could unhash the
dentry. The new lockless pattern creates a window where:

1. lookup_noperm_unlocked() completes and returns dentry `this`
2. A concurrent unlink/remove operation unhashes `this`
3. The d_parent validation passes (parent pointer unchanged)
4. The function returns an unhashed dentry

Other overlayfs code uses the complete pattern. For example, in
ovl_lock_rename_workdir() at fs/overlayfs/util.c:

    if (work->d_parent != workdir || d_unhashed(work)) {
        ...
    }

Could this validation miss a race where the dentry is unhashed but d_parent
still matches? The subsequent checks (!this->d_inode for -ENOENT,
wrong real dentry for -ESTALE) might catch some cases, but is that
sufficient for all the scenarios where an unhashed dentry could cause
problems?

>  	err = PTR_ERR(this);
> -	if (IS_ERR(this)) {
> +	if (IS_ERR(this))
>  		goto fail;
> -	} else if (!this || !this->d_inode) {
> -		dput(this);
> -		err = -ENOENT;
> +
> +	err = -ENOENT;
> +	if (!this || !this->d_inode)
>  		goto fail;
> -	} else if (ovl_dentry_real_at(this, layer->idx) != real) {
> -		dput(this);
> -		err = -ESTALE;
> +
> +	err = -ESTALE;
> +	if (ovl_dentry_real_at(this, layer->idx) != real)
>  		goto fail;
> -	}
>
> -out:
> -	dput(parent);
> -	inode_unlock(dir);
>  	return this;
>
>  fail:
>  	pr_warn_ratelimited("failed to lookup one by real (%pd2, layer=%d, connected=%pd2, err=%i)\n",
>  			    real, layer->idx, connected, err);
> -	this = ERR_PTR(err);
> -	goto out;
> +	if (!IS_ERR(this))
> +		dput(this);
> +	return ERR_PTR(err);
>  }
>
>  static struct dentry *ovl_lookup_real(struct super_block *sb,



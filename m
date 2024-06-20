Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B32C3910C5D
	for <lists+apparmor@lfdr.de>; Thu, 20 Jun 2024 18:26:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sKKc9-0006wg-I0; Thu, 20 Jun 2024 16:26:21 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1sKKbs-0006vk-HV
 for apparmor@lists.ubuntu.com; Thu, 20 Jun 2024 16:26:04 +0000
Received: from [10.0.0.100] (pool-99-255-30-7.cpe.net.cable.rogers.com
 [99.255.30.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 5747A3F0FE; 
 Thu, 20 Jun 2024 16:26:02 +0000 (UTC)
Message-ID: <71c0ea18-8b8b-402b-b03c-029aeedc2747@canonical.com>
Date: Thu, 20 Jun 2024 09:26:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mateusz Guzik <mjguzik@gmail.com>
References: <20240620131524.156312-1-mjguzik@gmail.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20240620131524.156312-1-mjguzik@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: try to avoid refing the label in
 apparmor_file_open
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
Cc: paul@paul-moore.com, Neeraj.Upadhyay@amd.com, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 6/20/24 06:15, Mateusz Guzik wrote:
> It can be done in the common case.
> > A 24-way open1_processes from will-it-scale (separate file open) shows:
>    29.37%  [kernel]           [k] apparmor_file_open
>    26.84%  [kernel]           [k] apparmor_file_alloc_security
>    26.62%  [kernel]           [k] apparmor_file_free_security
>     1.32%  [kernel]           [k] clear_bhb_loop
> 
> apparmor_file_open is eliminated from the profile with the patch.
> 
> Throughput (ops/s):
> before:	6092196
> after:	8309726 (+36%)
> 
> Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
can you cleanup the commit message and I will pull this in

> ---
> 
> I think this is a worthwhile touch up regardless of what happens with
> label refcouting in the long run. It does not of course does not fully
> fix the problem.
> 
I have no objections to incremental improvements.

> I concede the naming is not consistent with other stuff in the file and
> I'm not going to argue about it -- happy to name it whatever as long as
> the problem is sorted out.
> 
its fine, we could use crit_section here like with the current_label but
I don't think we really gain anything by doing so.

> Am I missing something which makes the approach below not work to begin
> with?
> 
no this will work in the short term. Long term there is work that will
break this. Both replacing unconfined and the object delegation work
will cause a performance regression as I am not sure we will be able
to conditionally get the label but that is something for those patch
series to work out. My biggest concern being people objecting to necessary
changes that regress performance, if it can't be worked out, but
that really isn't a reason to stop this now.



>   security/apparmor/include/cred.h | 20 ++++++++++++++++++++
>   security/apparmor/lsm.c          |  5 +++--
>   2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/security/apparmor/include/cred.h b/security/apparmor/include/cred.h
> index 58fdc72af664..7265d2f81dd5 100644
> --- a/security/apparmor/include/cred.h
> +++ b/security/apparmor/include/cred.h
> @@ -63,6 +63,26 @@ static inline struct aa_label *aa_get_newest_cred_label(const struct cred *cred)
>   	return aa_get_newest_label(aa_cred_raw_label(cred));
>   }
>   
> +static inline struct aa_label *aa_get_newest_cred_label_condref(const struct cred *cred,
> +								bool *needput)
> +{
> +	struct aa_label *l = aa_cred_raw_label(cred);
> +
> +	if (unlikely(label_is_stale(l))) {
> +		*needput = true;
> +		return aa_get_newest_label(l);
> +	}
> +
> +	*needput = false;
> +	return l;
> +}
> +
> +static inline void aa_put_label_condref(struct aa_label *l, bool needput)
> +{
> +	if (unlikely(needput))
> +		aa_put_label(l);
> +}
> +
>   /**
>    * aa_current_raw_label - find the current tasks confining label
>    *
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 2cea34657a47..4bf87eac4a56 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -461,6 +461,7 @@ static int apparmor_file_open(struct file *file)
>   	struct aa_file_ctx *fctx = file_ctx(file);
>   	struct aa_label *label;
>   	int error = 0;
> +	bool needput;
>   
>   	if (!path_mediated_fs(file->f_path.dentry))
>   		return 0;
> @@ -477,7 +478,7 @@ static int apparmor_file_open(struct file *file)
>   		return 0;
>   	}
>   
> -	label = aa_get_newest_cred_label(file->f_cred);
> +	label = aa_get_newest_cred_label_condref(file->f_cred, &needput);
>   	if (!unconfined(label)) {
>   		struct mnt_idmap *idmap = file_mnt_idmap(file);
>   		struct inode *inode = file_inode(file);
> @@ -494,7 +495,7 @@ static int apparmor_file_open(struct file *file)
>   		/* todo cache full allowed permissions set and state */
>   		fctx->allow = aa_map_file_to_perms(file);
>   	}
> -	aa_put_label(label);
> +	aa_put_label_condref(label, needput);
>   
>   	return error;
>   }



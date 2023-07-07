Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE6874B247
	for <lists+apparmor@lfdr.de>; Fri,  7 Jul 2023 15:56:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qHlwb-0006br-DJ; Fri, 07 Jul 2023 13:56:21 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <georgia.garcia@canonical.com>) id 1qHlwW-0006bU-Sc
 for apparmor@lists.ubuntu.com; Fri, 07 Jul 2023 13:56:16 +0000
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9E6C23F32A
 for <apparmor@lists.ubuntu.com>; Fri,  7 Jul 2023 13:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1688738176;
 bh=eGrztv0H2SIumnmi5MBVnRyY+MzcG6veWeMIMd19pl8=;
 h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
 Content-Type:MIME-Version;
 b=MJ4uyKBuRLZaY3caVG1I29/4mb+14tlZAwqRSRWkq7bZ5QSmrJS370s6VgqHDqqEW
 RFhnm78EqoLbb6u0LrfUZp8+gmgtXdJ+0n+CbzB483Qo4bpZY2ZM6VsiLn49LHxLFq
 O+3KUwT4TgVeXcE3+1/r+jsNOvR6WJFGAH/lpmuoYl0EzlK5ElZze1qwe2S9Jp0kxy
 uYhvCLnDPtodnxiD53Qcu2ULqljzWU07Apt3ei6oiYza5Oe9MGYPR5weqFRXcctQaf
 tIXCWMMfUgLN1hQgHZKc379xpZ3NBjxuEm3QGYkT5fmVJda6lE04YBH2twKgmAopvh
 0szLdPYKtD/+w==
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-3a3b86821fcso1333037b6e.0
 for <apparmor@lists.ubuntu.com>; Fri, 07 Jul 2023 06:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688738175; x=1691330175;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eGrztv0H2SIumnmi5MBVnRyY+MzcG6veWeMIMd19pl8=;
 b=XO8LFqCq8Nvh5rAL6nlb9bzSxYqXgXDY4DFVWuJ8h5I14n6lbFUrZn0Ivl1IIv6unp
 3dnT5qY16l0BPPpYlgCpnr948jvhcWc6CStM5YeIlTnUtqGvtZQn5RhFn4X+IXUeVhlX
 GdkU4tZME1G2QIbHlg6CSBCfs4gqqegT7sBJ9zv/E/erZ03mJ3ClfVfDTPeGU+ZxLUmY
 kmeAjmGgBhRk4dWzzOjbf4bh4Jd0rrrGc3RcRCh7GMUzmdebAtpYvrs9/foi5EKh/ehQ
 hDYqOFMQphwHIAzmaLn4ZaDc5zJyZ0nXbVFZo2gUR9rZSFHQ4wmIESjcvPttSJ6N914g
 HhAw==
X-Gm-Message-State: ABy/qLaNJcnNQmgqa2HDmZWdULfRuM2akO0bbfcbkq8d4VAPehjcb8lj
 l15t3dXGZG3SDT6vMDlKQ3QEloWrlSe6fK42hyYr+AMqNh/scG4GWexpWYxZkbzoAbXN57qnT2i
 8RQKkdT9rlrchInd0jnukKAQbLT2Ob5G4IA/oIVgwcUu/EFY3
X-Received: by 2002:a05:6808:1b0b:b0:3a3:9b4a:3959 with SMTP id
 bx11-20020a0568081b0b00b003a39b4a3959mr4714476oib.17.1688738175319; 
 Fri, 07 Jul 2023 06:56:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFkRg4PmdXfyWwDFgnZKR4ori2M8+JnzSAyS9PAwf6mrTcxas32wyshPWn+TQw5OCNVWSDVSQ==
X-Received: by 2002:a05:6808:1b0b:b0:3a3:9b4a:3959 with SMTP id
 bx11-20020a0568081b0b00b003a39b4a3959mr4714463oib.17.1688738175061; 
 Fri, 07 Jul 2023 06:56:15 -0700 (PDT)
Received: from ?IPv6:2001:1284:f02e:6c12:3fa7:9073:5b23:9e41?
 ([2001:1284:f02e:6c12:3fa7:9073:5b23:9e41])
 by smtp.gmail.com with ESMTPSA id
 e5-20020aca2305000000b003a1eae6ff73sm1629524oie.36.2023.07.07.06.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 06:56:14 -0700 (PDT)
Message-ID: <4c50904ae2cbd59186545a2676915654a84dbe50.camel@canonical.com>
From: Georgia Garcia <georgia.garcia@canonical.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>, john.johansen@canonical.com, 
 paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com
Date: Fri, 07 Jul 2023 10:56:10 -0300
In-Reply-To: <20230625011349.1457810-6-cuigaosheng1@huawei.com>
References: <20230625011349.1457810-1-cuigaosheng1@huawei.com>
 <20230625011349.1457810-6-cuigaosheng1@huawei.com>
Organization: Canonical
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
Subject: Re: [apparmor] [PATCH -next 05/11] apparmor: Fix kernel-doc
 warnings in apparmor/label.c
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi, Gaosheng Cui

On Sun, 2023-06-25 at 09:13 +0800, Gaosheng Cui wrote:
> Fix kernel-doc warnings:
>=20
> security/apparmor/label.c:166: warning: Excess function parameter
> 'n' description in 'vec_cmp'
> security/apparmor/label.c:166: warning: Excess function parameter
> 'vec' description in 'vec_cmp'
> security/apparmor/label.c:166: warning: Function parameter or member
> 'an' not described in 'vec_cmp'
> security/apparmor/label.c:166: warning: Function parameter or member
> 'bn' not described in 'vec_cmp'
> security/apparmor/label.c:166: warning: Function parameter or member
> 'b' not described in 'vec_cmp'
> security/apparmor/label.c:2051: warning: Function parameter or member
> 'label' not described in '__label_update'
> security/apparmor/label.c:266: warning: Function parameter or member
> 'flags' not described in 'aa_vec_unique'
> security/apparmor/label.c:594: warning: Excess function parameter
> 'l' description in '__label_remove'
> security/apparmor/label.c:594: warning: Function parameter or member
> 'label' not described in '__label_remove'
> security/apparmor/label.c:929: warning: Function parameter or member
> 'label' not described in 'aa_label_insert'
> security/apparmor/label.c:929: warning: Function parameter or member
> 'ls' not described in 'aa_label_insert'
> security/apparmor/label.c:1221: warning: Excess function parameter
> 'ls' description in 'aa_label_merge'
> security/apparmor/label.c:1302: warning: Excess function parameter
> 'start' description in 'label_compound_match'
> security/apparmor/label.c:1302: warning: Function parameter or member
> 'rules' not described in 'label_compound_match'
> security/apparmor/label.c:1302: warning: Function parameter or member
> 'state' not described in 'label_compound_match'
> security/apparmor/label.c:2051: warning: Function parameter or member
> 'label' not described in '__label_update'
>=20
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  security/apparmor/label.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>=20
> diff --git a/security/apparmor/label.c b/security/apparmor/label.c
> index 8a2af96f4da5..ce9c39102a93 100644
> --- a/security/apparmor/label.c
> +++ b/security/apparmor/label.c
> @@ -154,9 +154,10 @@ static int profile_cmp(struct aa_profile *a, struct =
aa_profile *b)
> =20
>  /**
>   * vec_cmp - label comparison for set ordering
> - * @a: label to compare (NOT NULL)
> - * @vec: vector of profiles to compare (NOT NULL)
> - * @n: length of @vec
> + * @a: aa_profile to compare (NOT NULL)
> + * @an: length of @a
> + * @b: aa_profile to compare (NOT NULL)
> + * @bn: length of @b
>   *
>   * Returns: <0  if a < vec
>   *          =3D=3D0 if a =3D=3D vec

The "Returns:" part of the doc should also be changed to match the
different parameter name.

> @@ -256,6 +257,7 @@ static inline int unique(struct aa_profile **vec, int=
 n)
>   * aa_vec_unique - canonical sort and unique a list of profiles
>   * @n: number of refcounted profiles in the list (@n > 0)
>   * @vec: list of profiles to sort and merge
> + * @flags: null terminator flags of @vec
>   *
>   * Returns: the number of duplicates eliminated =3D=3D references put
>   *
> @@ -584,7 +586,7 @@ bool aa_label_is_unconfined_subset(struct aa_label *s=
et, struct aa_label *sub)
> =20
>  /**
>   * __label_remove - remove @label from the label set
> - * @l: label to remove
> + * @label: label to remove
>   * @new: label to redirect to
>   *
>   * Requires: labels_set(@label)->lock write_lock
> @@ -917,8 +919,8 @@ struct aa_label *aa_label_find(struct aa_label *label=
)
> =20
>  /**
>   * aa_label_insert - insert label @label into @ls or return existing lab=
el
> - * @ls - labelset to insert @label into
> - * @label - label to insert
> + * @ls: labelset to insert @label into
> + * @label: label to insert
>   *
>   * Requires: caller to hold a valid ref on @label
>   *
> @@ -1204,7 +1206,6 @@ struct aa_label *aa_label_find_merge(struct aa_labe=
l *a, struct aa_label *b)
> =20
>  /**
>   * aa_label_merge - attempt to insert new merged label of @a and @b
> - * @ls: set of labels to insert label into (NOT NULL)
>   * @a: label to merge with @b  (NOT NULL)
>   * @b: label to merge with @a  (NOT NULL)
>   * @gfp: memory allocation type
> @@ -1282,8 +1283,9 @@ static inline aa_state_t match_component(struct aa_=
profile *profile,
>  /**
>   * label_compound_match - find perms for full compound label
>   * @profile: profile to find perms for
> + * @rules: ruleset to search
>   * @label: label to check access permissions for
> - * @start: state to start match in
> + * @state: state to start match in
>   * @subns: whether to do permission checks on components in a subns
>   * @request: permissions to request
>   * @perms: perms struct to set
> @@ -2037,7 +2039,7 @@ static struct aa_label *labelset_next_stale(struct =
aa_labelset *ls)
> =20
>  /**
>   * __label_update - insert updated version of @label into labelset
> - * @label - the label to update/replace
> + * @label: the label to update/replace
>   *
>   * Returns: new label that is up to date
>   *     else NULL on failure

Thanks,
Georgia


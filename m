Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 016C3A1BE52
	for <lists+apparmor@lfdr.de>; Fri, 24 Jan 2025 23:10:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tbRse-00086Z-SR; Fri, 24 Jan 2025 22:10:24 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1tbRsc-00086O-Mz
 for apparmor@lists.ubuntu.com; Fri, 24 Jan 2025 22:10:22 +0000
Received: from [192.168.192.85] (unknown [50.39.104.138])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 91BDD3FB9C; 
 Fri, 24 Jan 2025 22:10:21 +0000 (UTC)
Message-ID: <e0365e39-b247-464d-921c-18442aa9f48d@canonical.com>
Date: Fri, 24 Jan 2025 14:10:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <eb3d4654-b112-4558-ace0-683f794cce5b@stanley.mountain>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 xsFNBE5mrPoBEADAk19PsgVgBKkImmR2isPQ6o7KJhTTKjJdwVbkWSnNn+o6Up5knKP1f49E
 BQlceWg1yp/NwbR8ad+eSEO/uma/K+PqWvBptKC9SWD97FG4uB4/caomLEU97sLQMtnvGWdx
 rxVRGM4anzWYMgzz5TZmIiVTZ43Ou5VpaS1Vz1ZSxP3h/xKNZr/TcW5WQai8u3PWVnbkjhSZ
 PHv1BghN69qxEPomrJBm1gmtx3ZiVmFXluwTmTgJOkpFol7nbJ0ilnYHrA7SX3CtR1upeUpM
 a/WIanVO96WdTjHHIa43fbhmQube4txS3FcQLOJVqQsx6lE9B7qAppm9hQ10qPWwdfPy/+0W
 6AWtNu5ASiGVCInWzl2HBqYd/Zll93zUq+NIoCn8sDAM9iH+wtaGDcJywIGIn+edKNtK72AM
 gChTg/j1ZoWH6ZeWPjuUfubVzZto1FMoGJ/SF4MmdQG1iQNtf4sFZbEgXuy9cGi2bomF0zvy
 BJSANpxlKNBDYKzN6Kz09HUAkjlFMNgomL/cjqgABtAx59L+dVIZfaF281pIcUZzwvh5+JoG
 eOW5uBSMbE7L38nszooykIJ5XrAchkJxNfz7k+FnQeKEkNzEd2LWc3QF4BQZYRT6PHHga3Rg
 ykW5+1wTMqJILdmtaPbXrF3FvnV0LRPcv4xKx7B3fGm7ygdoowARAQABzStKb2huIEpvaGFu
 c2VuIDxqb2huLmpvaGFuc2VuQGNhbm9uaWNhbC5jb20+wsF3BBMBCgAhBQJOjRdaAhsDBQsJ
 CAcDBRUKCQgLBRYCAwEAAh4BAheAAAoJEAUvNnAY1cPYi0wP/2PJtzzt0zi4AeTrI0w3Rj8E
 Waa1NZWw4GGo6ehviLfwGsM7YLWFAI8JB7gsuzX/im16i9C3wHYXKs9WPCDuNlMc0rvivqUI
 JXHHfK7UHtT0+jhVORyyVVvX+qZa7HxdZw3jK+ROqUv4bGnImf31ll99clzo6HpOY59soa8y
 66/lqtIgDckcUt/1ou9m0DWKwlSvulL1qmD25NQZSnvB9XRZPpPd4bea1RTa6nklXjznQvTm
 MdLq5aJ79j7J8k5uLKvE3/pmpbkaieEsGr+azNxXm8FPcENV7dG8Xpd0z06E+fX5jzXHnj69
 DXXc3yIvAXsYZrXhnIhUA1kPQjQeNG9raT9GohFPMrK48fmmSVwodU8QUyY7MxP4U6jE2O9L
 7v7AbYowNgSYc+vU8kFlJl4fMrX219qU8ymkXGL6zJgtqA3SYHskdDBjtytS44OHJyrrRhXP
 W1oTKC7di/bb8jUQIYe8ocbrBz3SjjcL96UcQJecSHu0qmUNykgL44KYzEoeFHjr5dxm+DDg
 OBvtxrzd5BHcIbz0u9ClbYssoQQEOPuFmGQtuSQ9FmbfDwljjhrDxW2DFZ2dIQwIvEsg42Hq
 5nv/8NhW1whowliR5tpm0Z0KnQiBRlvbj9V29kJhs7rYeT/dWjWdfAdQSzfoP+/VtPRFkWLr
 0uCwJw5zHiBgzsFNBE5mrPoBEACirDqSQGFbIzV++BqYBWN5nqcoR+dFZuQL3gvUSwku6ndZ
 vZfQAE04dKRtIPikC4La0oX8QYG3kI/tB1UpEZxDMB3pvZzUh3L1EvDrDiCL6ef93U+bWSRi
 GRKLnNZoiDSblFBST4SXzOR/m1wT/U3Rnk4rYmGPAW7ltfRrSXhwUZZVARyJUwMpG3EyMS2T
 dLEVqWbpl1DamnbzbZyWerjNn2Za7V3bBrGLP5vkhrjB4NhrufjVRFwERRskCCeJwmQm0JPD
 IjEhbYqdXI6uO+RDMgG9o/QV0/a+9mg8x2UIjM6UiQ8uDETQha55Nd4EmE2zTWlvxsuqZMgy
 W7gu8EQsD+96JqOPmzzLnjYf9oex8F/gxBSEfE78FlXuHTopJR8hpjs6ACAq4Y0HdSJohRLn
 5r2CcQ5AsPEpHL9rtDW/1L42/H7uPyIfeORAmHFPpkGFkZHHSCQfdP4XSc0Obk1olSxqzCAm
 uoVmRQZ3YyubWqcrBeIC3xIhwQ12rfdHQoopELzReDCPwmffS9ctIb407UYfRQxwDEzDL+m+
 TotTkkaNlHvcnlQtWEfgwtsOCAPeY9qIbz5+i1OslQ+qqGD2HJQQ+lgbuyq3vhefv34IRlyM
 sfPKXq8AUTZbSTGUu1C1RlQc7fpp8W/yoak7dmo++MFS5q1cXq29RALB/cfpcwARAQABwsFf
 BBgBCgAJBQJOZqz6AhsMAAoJEAUvNnAY1cPYP9cP/R10z/hqLVv5OXWPOcpqNfeQb4x4Rh4j
 h/jS9yjes4uudEYU5xvLJ9UXr0wp6mJ7g7CgjWNxNTQAN5ydtacM0emvRJzPEEyujduesuGy
 a+O6dNgi+ywFm0HhpUmO4sgs9SWeEWprt9tWrRlCNuJX+u3aMEQ12b2lslnoaOelghwBs8IJ
 r998vj9JBFJgdeiEaKJLjLmMFOYrmW197As7DTZ+R7Ef4gkWusYFcNKDqfZKDGef740Xfh9d
 yb2mJrDeYqwgKb7SF02Hhp8ZnohZXw8ba16ihUOnh1iKH77Ff9dLzMEJzU73DifOU/aArOWp
 JZuGJamJ9EkEVrha0B4lN1dh3fuP8EjhFZaGfLDtoA80aPffK0Yc1R/pGjb+O2Pi0XXL9AVe
 qMkb/AaOl21F9u1SOosciy98800mr/3nynvid0AKJ2VZIfOP46nboqlsWebA07SmyJSyeG8c
 XA87+8BuXdGxHn7RGj6G+zZwSZC6/2v9sOUJ+nOna3dwr6uHFSqKw7HwNl/PUGeRqgJEVu++
 +T7sv9+iY+e0Y+SolyJgTxMYeRnDWE6S77g6gzYYHmcQOWP7ZMX+MtD4SKlf0+Q8li/F9GUL
 p0rw8op9f0p1+YAhyAd+dXWNKf7zIfZ2ME+0qKpbQnr1oizLHuJX/Telo8KMmHter28DPJ03 lT9Q
Organization: Canonical
In-Reply-To: <eb3d4654-b112-4558-ace0-683f794cce5b@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [bug report] apparmor: add additional flags to
 extended permission.
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
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 1/21/25 03:17, Dan Carpenter wrote:
> [ I don't know why this static checker warning is showing up only now
>    two years later...  -dan ]
> 
> Hello John Johansen,
> 
> Commit 2e12c5f06017 ("apparmor: add additional flags to extended
> permission.") from Jul 23, 2023 (linux-next), leads to the following
> Smatch static checker warning:
> 

because while it is an old commit it sat in other branches and dev
trees, while the stuff that depends on it was revised, and that stuff is
just recently starting to be merged in.

Thanks for the report, I see if I can't get this fixed today

> security/apparmor/policy_unpack.c:780 unpack_pdb()
> error: we previously assumed 'pdb->dfa' could be null (see line 753)
> 
> security/apparmor/policy_unpack.c
>      712 static int unpack_pdb(struct aa_ext *e, struct aa_policydb **policy,
>      713                       bool required_dfa, bool required_trans,
>      714                       const char **info)
>      715 {
>      716         struct aa_policydb *pdb;
>      717         void *pos = e->pos;
>      718         int i, flags, error = -EPROTO;
>      719         ssize_t size;
>      720         u32 version = 0;
>      721
>      722         pdb = aa_alloc_pdb(GFP_KERNEL);
>      723         if (!pdb)
>      724                 return -ENOMEM;
>      725
>      726         size = unpack_perms_table(e, &pdb->perms);
>      727         if (size < 0) {
>      728                 error = size;
>      729                 pdb->perms = NULL;
>      730                 *info = "failed to unpack - perms";
>      731                 goto fail;
>      732         }
>      733         pdb->size = size;
>      734
>      735         if (pdb->perms) {
>      736                 /* perms table present accept is index */
>      737                 flags = TO_ACCEPT1_FLAG(YYTD_DATA32);
>      738                 if (aa_unpack_u32(e, &version, "permsv") && version > 2)
>      739                         /* accept2 used for dfa flags */
>      740                         flags |= TO_ACCEPT2_FLAG(YYTD_DATA32);
>      741         } else {
>      742                 /* packed perms in accept1 and accept2 */
>      743                 flags = TO_ACCEPT1_FLAG(YYTD_DATA32) |
>      744                         TO_ACCEPT2_FLAG(YYTD_DATA32);
>      745         }
>      746
>      747         pdb->dfa = unpack_dfa(e, flags);
>      748         if (IS_ERR(pdb->dfa)) {
>      749                 error = PTR_ERR(pdb->dfa);
>      750                 pdb->dfa = NULL;
>      751                 *info = "failed to unpack - dfa";
>      752                 goto fail;
>      753         } else if (!pdb->dfa) {
>      754                 if (required_dfa) {
>      755                         *info = "missing required dfa";
>      756                         goto fail;
>      757                 }
> 
> Assume required_dfa is false.
> 
> 
>      758         } else {
>      759                 /*
>      760                  * only unpack the following if a dfa is present
>      761                  *
>      762                  * sadly start was given different names for file and policydb
>      763                  * but since it is optional we can try both
>      764                  */
>      765                 if (!aa_unpack_u32(e, &pdb->start[0], "start"))
>      766                         /* default start state */
>      767                         pdb->start[0] = DFA_START;
>      768                 if (!aa_unpack_u32(e, &pdb->start[AA_CLASS_FILE], "dfa_start")) {
>      769                         /* default start state for xmatch and file dfa */
>      770                         pdb->start[AA_CLASS_FILE] = DFA_START;
>      771                 }        /* setup class index */
>      772                 for (i = AA_CLASS_FILE + 1; i <= AA_CLASS_LAST; i++) {
>      773                         pdb->start[i] = aa_dfa_next(pdb->dfa, pdb->start[0],
>      774                                                     i);
>      775                 }
>      776         }
>      777
>      778         if (pdb->perms && version <= 2) {
>      779                 /* add dfa flags table missing in v2 */
> --> 780                 u32 noents = pdb->dfa->tables[YYTD_ID_ACCEPT]->td_lolen;
>                                       ^^^^^^^^^^
> Potential NULL pointer dereference
> 
>      781                 u16 tdflags = pdb->dfa->tables[YYTD_ID_ACCEPT]->td_flags;
>      782                 size_t tsize = table_size(noents, tdflags);
>      783
>      784                 pdb->dfa->tables[YYTD_ID_ACCEPT2] = kvzalloc(tsize, GFP_KERNEL);
>      785                 if (!pdb->dfa->tables[YYTD_ID_ACCEPT2]) {
>      786                         *info = "failed to alloc dfa flags table";
>      787                         goto out;
>      788                 }
>      789                 pdb->dfa->tables[YYTD_ID_ACCEPT2]->td_lolen = noents;
>      790                 pdb->dfa->tables[YYTD_ID_ACCEPT2]->td_flags = tdflags;
>      791         }
>      792         /*
>      793          * Unfortunately due to a bug in earlier userspaces, a
>      794          * transition table may be present even when the dfa is
>      795          * not. For compatibility reasons unpack and discard.
>      796          */
>      797         if (!unpack_trans_table(e, &pdb->trans) && required_trans) {
>      798                 *info = "failed to unpack profile transition table";
>      799                 goto fail;
>      800         }
>      801
>      802         if (!pdb->dfa && pdb->trans.table)
>      803                 aa_free_str_table(&pdb->trans);
>      804
>      805         /* TODO: move compat mapping here, requires dfa merging first */
>      806         /* TODO: move verify here, it has to be done after compat mappings */
>      807 out:
>      808         *policy = pdb;
>      809         return 0;
>      810
>      811 fail:
>      812         aa_put_pdb(pdb);
>      813         e->pos = pos;
>      814         return error;
>      815 }
> 
> regards,
> dan carpenter



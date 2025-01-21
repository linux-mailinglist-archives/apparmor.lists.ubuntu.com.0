Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C08BA18D66
	for <lists+apparmor@lfdr.de>; Wed, 22 Jan 2025 09:11:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1taVpL-00041T-DQ; Wed, 22 Jan 2025 08:11:07 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <dan.carpenter@linaro.org>)
 id 1taCFp-0003sz-Tu
 for apparmor@lists.ubuntu.com; Tue, 21 Jan 2025 11:17:09 +0000
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-385e0e224cbso2875267f8f.2
 for <apparmor@lists.ubuntu.com>; Tue, 21 Jan 2025 03:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737458229; x=1738063029;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x2GhCJD3RHVIrY5awofUyQa3VabNH8cCtmmPPPcG1bE=;
 b=uUVIXJm+1vBNTKk6FBDjqKxaYGH755U/qLLIc91P8PYzEvY/JB/f/CRgfBOwIfruPW
 rCshKZkuCsgdChyo3aaVrUktS3/RFNtW3lnj4neKw7+NVaZ90lnoVir7NNJBZvax4JSF
 o4g8y6v9M59rrYUxVw3IMM7dyf5Y3VTJ8Ue0yqkfjS+p5zmXBRDLPln6MJ6uzxnI4l8o
 sKODIIFVc8h8bYGP5T01qe4XFYPtaqGRThKmVUDkVsIVUSi6YBwc3IpT23vGOThyc4wN
 xaLdDvDA1yC5NH/XfoclJbCFap1V59jpjQU3os8qvKiYVVcalAdG82f1e+eGiyBOwCCY
 W/9A==
X-Gm-Message-State: AOJu0YwiFJ/s1kIO4sGKHMiP6vkdlaMv9kaELxwvfvw4dD7blY8V6YL+
 qQ9TYRmOrxTwsP/L7pigXaBs4tu9CEKrNGpZsQZGnEDWSzdfQw42Nq2mGhQzVik=
X-Gm-Gg: ASbGncuP1TXlm6IqihmHHTAXrrOdg+ro6Ld7J3Yl6tx/MxL3yAmmLRyQnZPgfM1bqVu
 H+25dH86oin1T1/vPHth8ACykMCANdrNDfo9KQTAf33NJpmr/3MBkuL4QecPgv7fUnW3mv56Uf/
 QPR4L5+Mb1XED+tQuGcZjHOOJXkjVHyOuCBhAYTVTzC6CxgKiCm9L4YpHIRBHGuBG6u7CC87XG7
 coTiOx4lQroolcYxCLM3lk2bjN1fYLhobAAxkGXCtipekwph1ZV19Hdbt19cMfQ1OEucVrctho=
X-Google-Smtp-Source: AGHT+IFZg2i3V64D0K7BvmPN949mVi0p6HSkPboBttZA5W1k60d9zgQ6fE8ST4gsZVtjRNcmXJlLdw==
X-Received: by 2002:a5d:6d8d:0:b0:38a:88bc:ace1 with SMTP id
 ffacd0b85a97d-38bf57a9608mr13711016f8f.34.1737458229073; 
 Tue, 21 Jan 2025 03:17:09 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3282a63sm13191995f8f.96.2025.01.21.03.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 03:17:08 -0800 (PST)
Date: Tue, 21 Jan 2025 14:17:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <eb3d4654-b112-4558-ace0-683f794cce5b@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=209.85.221.51;
 envelope-from=dan.carpenter@linaro.org; helo=mail-wr1-f51.google.com
X-Mailman-Approved-At: Wed, 22 Jan 2025 08:11:05 +0000
Subject: [apparmor] [bug report] apparmor: add additional flags to extended
	permission.
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

[ I don't know why this static checker warning is showing up only now
  two years later...  -dan ]

Hello John Johansen,

Commit 2e12c5f06017 ("apparmor: add additional flags to extended
permission.") from Jul 23, 2023 (linux-next), leads to the following
Smatch static checker warning:

security/apparmor/policy_unpack.c:780 unpack_pdb()
error: we previously assumed 'pdb->dfa' could be null (see line 753)

security/apparmor/policy_unpack.c
    712 static int unpack_pdb(struct aa_ext *e, struct aa_policydb **policy,
    713                       bool required_dfa, bool required_trans,
    714                       const char **info)
    715 {
    716         struct aa_policydb *pdb;
    717         void *pos = e->pos;
    718         int i, flags, error = -EPROTO;
    719         ssize_t size;
    720         u32 version = 0;
    721 
    722         pdb = aa_alloc_pdb(GFP_KERNEL);
    723         if (!pdb)
    724                 return -ENOMEM;
    725 
    726         size = unpack_perms_table(e, &pdb->perms);
    727         if (size < 0) {
    728                 error = size;
    729                 pdb->perms = NULL;
    730                 *info = "failed to unpack - perms";
    731                 goto fail;
    732         }
    733         pdb->size = size;
    734 
    735         if (pdb->perms) {
    736                 /* perms table present accept is index */
    737                 flags = TO_ACCEPT1_FLAG(YYTD_DATA32);
    738                 if (aa_unpack_u32(e, &version, "permsv") && version > 2)
    739                         /* accept2 used for dfa flags */
    740                         flags |= TO_ACCEPT2_FLAG(YYTD_DATA32);
    741         } else {
    742                 /* packed perms in accept1 and accept2 */
    743                 flags = TO_ACCEPT1_FLAG(YYTD_DATA32) |
    744                         TO_ACCEPT2_FLAG(YYTD_DATA32);
    745         }
    746 
    747         pdb->dfa = unpack_dfa(e, flags);
    748         if (IS_ERR(pdb->dfa)) {
    749                 error = PTR_ERR(pdb->dfa);
    750                 pdb->dfa = NULL;
    751                 *info = "failed to unpack - dfa";
    752                 goto fail;
    753         } else if (!pdb->dfa) {
    754                 if (required_dfa) {
    755                         *info = "missing required dfa";
    756                         goto fail;
    757                 }

Assume required_dfa is false.


    758         } else {
    759                 /*
    760                  * only unpack the following if a dfa is present
    761                  *
    762                  * sadly start was given different names for file and policydb
    763                  * but since it is optional we can try both
    764                  */
    765                 if (!aa_unpack_u32(e, &pdb->start[0], "start"))
    766                         /* default start state */
    767                         pdb->start[0] = DFA_START;
    768                 if (!aa_unpack_u32(e, &pdb->start[AA_CLASS_FILE], "dfa_start")) {
    769                         /* default start state for xmatch and file dfa */
    770                         pdb->start[AA_CLASS_FILE] = DFA_START;
    771                 }        /* setup class index */
    772                 for (i = AA_CLASS_FILE + 1; i <= AA_CLASS_LAST; i++) {
    773                         pdb->start[i] = aa_dfa_next(pdb->dfa, pdb->start[0],
    774                                                     i);
    775                 }
    776         }
    777 
    778         if (pdb->perms && version <= 2) {
    779                 /* add dfa flags table missing in v2 */
--> 780                 u32 noents = pdb->dfa->tables[YYTD_ID_ACCEPT]->td_lolen;
                                     ^^^^^^^^^^
Potential NULL pointer dereference

    781                 u16 tdflags = pdb->dfa->tables[YYTD_ID_ACCEPT]->td_flags;
    782                 size_t tsize = table_size(noents, tdflags);
    783 
    784                 pdb->dfa->tables[YYTD_ID_ACCEPT2] = kvzalloc(tsize, GFP_KERNEL);
    785                 if (!pdb->dfa->tables[YYTD_ID_ACCEPT2]) {
    786                         *info = "failed to alloc dfa flags table";
    787                         goto out;
    788                 }
    789                 pdb->dfa->tables[YYTD_ID_ACCEPT2]->td_lolen = noents;
    790                 pdb->dfa->tables[YYTD_ID_ACCEPT2]->td_flags = tdflags;
    791         }
    792         /*
    793          * Unfortunately due to a bug in earlier userspaces, a
    794          * transition table may be present even when the dfa is
    795          * not. For compatibility reasons unpack and discard.
    796          */
    797         if (!unpack_trans_table(e, &pdb->trans) && required_trans) {
    798                 *info = "failed to unpack profile transition table";
    799                 goto fail;
    800         }
    801 
    802         if (!pdb->dfa && pdb->trans.table)
    803                 aa_free_str_table(&pdb->trans);
    804 
    805         /* TODO: move compat mapping here, requires dfa merging first */
    806         /* TODO: move verify here, it has to be done after compat mappings */
    807 out:
    808         *policy = pdb;
    809         return 0;
    810 
    811 fail:
    812         aa_put_pdb(pdb);
    813         e->pos = pos;
    814         return error;
    815 }

regards,
dan carpenter


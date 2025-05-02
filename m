Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F940AA76B4
	for <lists+apparmor@lfdr.de>; Fri,  2 May 2025 18:08:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uAsvs-0004yj-9j; Fri, 02 May 2025 16:08:12 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1uAsvq-0004yY-3J
 for apparmor@lists.ubuntu.com; Fri, 02 May 2025 16:08:10 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 687A43F6A0
 for <apparmor@lists.ubuntu.com>; Fri,  2 May 2025 16:08:09 +0000 (UTC)
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ac2aa3513ccso155238566b.0
 for <apparmor@lists.ubuntu.com>; Fri, 02 May 2025 09:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746202089; x=1746806889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3CisZnV7pjBTrd6barH3Ffmi1vw4zOqiBAICZChs/hU=;
 b=U02MEuauuMCFNOmcxk7qvONib1cwHqE8rzNF8IYMs9wnpckpW/g9Sb6HFLjhHeJWxS
 NkLmsRp9x9cB421pNCZ2FEU174qBxnODpBJK8V7UfgUIZSFDdCfB8yrPNM80nq5Chp7a
 N6PQiNo+HQoEtErjneJy6NNW6chqExYOxIkGSu6BqIL1LhPk9Ws2BhJjI8lfeHuC65g+
 +rUuhJI5c0YgtAb0eUi9zmLzI6P64SKzj4QS2TU8oOng7f60dhVRQRYPCFxxpHgUQEE5
 W1vamx1eimchhL1ewlWvw5zWjRqv4CUo6/0+5hVY+PxPvab5JQzTQo0+mjwm79B0vPvd
 cKkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtSFus97Q37NDLFbu+AcgZYwTiyMRcdgf0eQloDMfcG86hSq1u12MK1KMnCwYceuVU15JskxZP+Q==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yy2JynYpErbOh9AYMaBlkFQ9xBUTOOREuMOgZSx1/rjJtPP0kg1
 1L6sXxGHlLFHbskwYvZkpo1teYm+anYjKV62tywe48UfllIIZmZL5JujTRvj6/iPyC+kiOd8s+F
 bPeUDpJwPTz3mTtev7+opNeHtwEP2wiVJyefiBCLx44kKL4npSMkR5JidTLuzaBQkXCBKs5KqVn
 +++EZYLaMNIarhG1YY4vGv7rhAMKCHSbuSQ5bCABRGwJcaoYsy
X-Gm-Gg: ASbGncsHFWvd+DloQt83mkp48lChW5PoJtSlP/0NmmgOXZCktlh03JHNiPJKL79S4Pv
 OeL5m03Ih9IZjonmTrIQJbg7Mgxznl3pWOP/KBfKACB8sutponyYB3LPuH5B//oF1uRnJ
X-Received: by 2002:a17:907:6e93:b0:ab7:cfe7:116f with SMTP id
 a640c23a62f3a-ad17af50ba6mr318241366b.46.1746202088765; 
 Fri, 02 May 2025 09:08:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr9plp3S4dQ544LaoyFbcAWDmz+kpgB70DWFpnKwx/6/nfuEShDUm7vfsqSJ3aI2C6UpRBZ8JzEemIwm+iSxA=
X-Received: by 2002:a17:907:6e93:b0:ab7:cfe7:116f with SMTP id
 a640c23a62f3a-ad17af50ba6mr318236366b.46.1746202088361; Fri, 02 May 2025
 09:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250502014412.682674-1-rdunlap@infradead.org>
In-Reply-To: <20250502014412.682674-1-rdunlap@infradead.org>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Fri, 2 May 2025 09:07:56 -0700
X-Gm-Features: ATxdqUH1VSosWBuE6vF-uqoJMXP5CM2bLoq1d2PsBwhsXzhf70B3sJUNYIK_FnA
Message-ID: <CAKCV-6vV1o6KmPjD3k-LWo-VYEEaZ8QS_tdM=GezT9XH2M=Hng@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH] apparmor: fix some kernel-doc issues in
	header files
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
Cc: Paul Moore <paul@paul-moore.com>, John Johansen <john@apparmor.net>,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 James Morris <jmorris@namei.org>, linux-security-module@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, May 1, 2025 at 6:44=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
>

The commit message should also have an introduction like that says
something like "This commit fixes apparmor documentation comment
issues found by [name of the tool you used]:"

> cred.h:128: warning: expecting prototype for end_label_crit_section(). Pr=
ototype was for end_current_label_crit_section() instead
> file.h:108: warning: expecting prototype for aa_map_file_perms(). Prototy=
pe was for aa_map_file_to_perms() instead
>
> lib.h:159: warning: Function parameter or struct member 'hname' not descr=
ibed in 'basename'
> lib.h:159: warning: Excess function parameter 'name' description in 'base=
name'
>
> match.h:21: warning: This comment starts with '/**', but isn't a kernel-d=
oc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * The format used for transition tables is based on the GNU flex table
>  * The format used for transition tables is based on the GNU flex table
>
> perms.h:109: warning: Function parameter or struct member 'accum' not des=
cribed in 'aa_perms_accum_raw'
> perms.h:109: warning: Function parameter or struct member 'addend' not de=
scribed in 'aa_perms_accum_raw'
> perms.h:136: warning: Function parameter or struct member 'accum' not des=
cribed in 'aa_perms_accum'
> perms.h:136: warning: Function parameter or struct member 'addend' not de=
scribed in 'aa_perms_accum'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: John Johansen <john.johansen@canonical.com>
> Cc: John Johansen <john@apparmor.net>
> Cc: apparmor@lists.ubuntu.com
> Cc: linux-security-module@vger.kernel.org
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> ---
>  security/apparmor/include/cred.h  |    2 +-
>  security/apparmor/include/file.h  |    2 +-
>  security/apparmor/include/lib.h   |    2 +-
>  security/apparmor/include/match.h |    2 +-
>  security/apparmor/include/perms.h |    8 ++++----
>  5 files changed, 8 insertions(+), 8 deletions(-)
>
> --- linux-next-20250501.orig/security/apparmor/include/cred.h
> +++ linux-next-20250501/security/apparmor/include/cred.h
> @@ -117,7 +117,7 @@ static inline struct aa_label *aa_get_cu
>  #define __end_current_label_crit_section(X) end_current_label_crit_secti=
on(X)
>
>  /**
> - * end_label_crit_section - put a reference found with begin_current_lab=
el..
> + * end_current_label_crit_section - put a reference found with begin_cur=
rent_label..
>   * @label: label reference to put
>   *
>   * Should only be used with a reference obtained with
> --- linux-next-20250501.orig/security/apparmor/include/file.h
> +++ linux-next-20250501/security/apparmor/include/file.h
> @@ -104,7 +104,7 @@ void aa_inherit_files(const struct cred
>
>
>  /**
> - * aa_map_file_perms - map file flags to AppArmor permissions
> + * aa_map_file_to_perms - map file flags to AppArmor permissions
>   * @file: open file to map flags to AppArmor permissions
>   *
>   * Returns: apparmor permission set for the file
> --- linux-next-20250501.orig/security/apparmor/include/lib.h
> +++ linux-next-20250501/security/apparmor/include/lib.h
> @@ -170,7 +170,7 @@ struct aa_policy {
>
>  /**
>   * basename - find the last component of an hname
> - * @name: hname to find the base profile name component of  (NOT NULL)
> + * @hname: hname to find the base profile name component of  (NOT NULL)
>   *
>   * Returns: the tail (base profile name) name component of an hname
>   */
> --- linux-next-20250501.orig/security/apparmor/include/match.h
> +++ linux-next-20250501/security/apparmor/include/match.h
> @@ -17,7 +17,7 @@
>  #define DFA_START                      1
>
>
> -/**
> +/*
>   * The format used for transition tables is based on the GNU flex table
>   * file format (--tables-file option; see Table File Format in the flex
>   * info pages and the flex sources for documentation). The magic number
> --- linux-next-20250501.orig/security/apparmor/include/perms.h
> +++ linux-next-20250501/security/apparmor/include/perms.h
> @@ -101,8 +101,8 @@ extern struct aa_perms allperms;
>
>  /**
>   * aa_perms_accum_raw - accumulate perms with out masking off overlappin=
g perms
> - * @accum - perms struct to accumulate into
> - * @addend - perms struct to add to @accum
> + * @accum: perms struct to accumulate into
> + * @addend: perms struct to add to @accum
>   */
>  static inline void aa_perms_accum_raw(struct aa_perms *accum,
>                                       struct aa_perms *addend)
> @@ -128,8 +128,8 @@ static inline void aa_perms_accum_raw(st
>
>  /**
>   * aa_perms_accum - accumulate perms, masking off overlapping perms
> - * @accum - perms struct to accumulate into
> - * @addend - perms struct to add to @accum
> + * @accum: perms struct to accumulate into
> + * @addend: perms struct to add to @accum
>   */
>  static inline void aa_perms_accum(struct aa_perms *accum,
>                                   struct aa_perms *addend)
>

With the commit message addition that I mentioned above:

Reviewed-by: Ryan Lee <ryan.lee@canonical.com>


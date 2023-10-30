Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8565E7DB5E9
	for <lists+apparmor@lfdr.de>; Mon, 30 Oct 2023 10:13:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qxOL6-0004lZ-4p; Mon, 30 Oct 2023 09:13:40 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <dan.carpenter@linaro.org>)
 id 1qxNu9-0001HR-4B
 for apparmor@lists.ubuntu.com; Mon, 30 Oct 2023 08:45:49 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-40839807e82so24075945e9.0
 for <apparmor@lists.ubuntu.com>; Mon, 30 Oct 2023 01:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698655548; x=1699260348;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F9tbFPUnbXUt798lxc4B47ywmCPhHpbb+FuDhvgwoMk=;
 b=kKZY5NRvc7cabq58+hQ4uo0ooecGWZjqaJxIiIz8+xpAaOmUg3ItXm93PlIflKAwR4
 5nxZ56/VXPSAIn5e/Fw1wg1IBaQ8rVHJ1aiezCMbHE9kqsLBKFv1U1clZxgnZhl6YhVb
 IcCIkuxKnhDdRjdId+zKSoPPf7pJvJuQWxgU5+gzX/+/sCLtLRFK/xZLz01Pcu0qwXZR
 Q5Ns69Xz2NiTVV/9fJWRYSB7ugT01hJpjLkEq5uLK5K0VsrT7aZowRBLZ5JzyLB43CPq
 R/eHpZpEZdCN2Mz5r3iMFGR3kTcmDaXLwyV35T6QUQRGXkm9fY64tYTDSSq3AFC/o4e0
 yFdw==
X-Gm-Message-State: AOJu0YxCTOPnGOMuM1LZ1+3Zb444usYjc2sU3CXgDdi+/iq80mLM8ila
 C/fjNoxRAY+ChiqvfI8WJcEEsg==
X-Google-Smtp-Source: AGHT+IETThwHp7iQzan+quSG3P7eQsi/5UH2FG/BF7LmcKC287cC7JaVz87aBCJM9xcK8bWvh8W09w==
X-Received: by 2002:a05:600c:468d:b0:407:4701:f9e with SMTP id
 p13-20020a05600c468d00b0040747010f9emr10123798wmo.17.1698655548524; 
 Mon, 30 Oct 2023 01:45:48 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 o26-20020a5d58da000000b0032d2489a399sm7696331wrf.49.2023.10.30.01.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 01:45:48 -0700 (PDT)
Date: Mon, 30 Oct 2023 11:45:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: casey@schaufler-ca.com
Message-ID: <9a13dec9-2394-4043-9312-4229fd94f4b2@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 30 Oct 2023 09:13:29 +0000
Subject: [apparmor] [bug report] AppArmor: Add selfattr hooks
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

Hello Casey Schaufler,

The patch 3c3bda37ca1d: "AppArmor: Add selfattr hooks" from Sep 12,
2023 (linux-next), leads to the following Smatch static checker
warning:

	security/apparmor/lsm.c:817 apparmor_getselfattr()
	error: uninitialized symbol 'value'.

security/apparmor/lsm.c
    779 static int apparmor_getselfattr(unsigned int attr, struct lsm_ctx __user *lx,
    780                                 size_t *size, u32 flags)
    781 {
    782         int error = -ENOENT;
    783         struct aa_task_ctx *ctx = task_ctx(current);
    784         struct aa_label *label = NULL;
    785         size_t total_len = 0;
    786         char *value;
    787 
    788         switch (attr) {
    789         case LSM_ATTR_CURRENT:
    790                 label = aa_get_newest_label(cred_label(current_cred()));
    791                 break;
    792         case LSM_ATTR_PREV:
    793                 if (ctx->previous)
    794                         label = aa_get_newest_label(ctx->previous);
    795                 break;
    796         case LSM_ATTR_EXEC:
    797                 if (ctx->onexec)
    798                         label = aa_get_newest_label(ctx->onexec);
    799                 break;
    800         default:
    801                 error = -EOPNOTSUPP;
    802                 break;
    803         }
    804 
    805         if (label) {
    806                 error = aa_getprocattr(label, &value, false);

"value" is uninitialized on the first -EACCESS error path.

    807                 if (error > 0) {
    808                         total_len = ALIGN(struct_size(lx, ctx, error), 8);
    809                         if (total_len > *size)
    810                                 error = -E2BIG;
    811                         else if (lx)
    812                                 error = lsm_fill_user_ctx(lx, value, error,
    813                                                           LSM_ID_APPARMOR, 0);
    814                         else
    815                                 error = 1;
    816                 }
--> 817                 kfree(value);
                              ^^^^^
Uninitialized

    818         }
    819 
    820         aa_put_label(label);
    821 
    822         *size = total_len;
    823         if (error < 0)
    824                 return error;
    825         return 1;
    826 }

regards,
dan carpenter


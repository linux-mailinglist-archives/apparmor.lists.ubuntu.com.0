Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D3AB92278
	for <lists+apparmor@lfdr.de>; Mon, 22 Sep 2025 18:14:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v0jBP-0006bo-3G; Mon, 22 Sep 2025 16:14:31 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1v0jBN-0006bf-09
 for apparmor@lists.ubuntu.com; Mon, 22 Sep 2025 16:14:29 +0000
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6C0F83F46B
 for <apparmor@lists.ubuntu.com>; Mon, 22 Sep 2025 16:14:28 +0000 (UTC)
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-7357d0fc6baso47475817b3.1
 for <apparmor@lists.ubuntu.com>; Mon, 22 Sep 2025 09:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758557667; x=1759162467;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TSVDsaqD9WSUN9Cfvyt0wyy9VQPKqkb7QGcEnC7v+PU=;
 b=rRFel5TYTMCtFR1icfSRnD5uOmwxOzQpYQhD6+G5ZQiYddai4Rq+oUZ3xfU1WLLwku
 WJ9Ciu19ccpq/yQJ/lAyusOPaXTNtyGfYzepiu+cbPGEzLEqQTGySrpr7UWGX7A0Ykm0
 mLSsL8UG3BUe9OQ/updNN/xgvVafxi03CgQai8dLajA7J4HlbbzcsZ46HAdeaKmvuPPl
 WF/69p3hggXcxm0cpptIRV9eiQwgAGjikVhcDxbvZsLHd/5woLZmLu/GsqjkkCj9Z0Rm
 ZcFdDtO5VbvxcipfRG9Fkv9W0zj45Vq5UJlq5X65gZ8G6Fvex1o81j8t1IKYfhwSCv9X
 8gdA==
X-Gm-Message-State: AOJu0YwOUA1D0DK4RBm8gU+4uGYdYfixkkmcVc+9Y3Ve82MqLthQYyc3
 rcj+4VozaMkpQz60XFJ86d6FoqGpGdipnJRr3IMVC5AdgNcE83WTKuR8JfLZj0sLCm39PTmsU0y
 DpDlF6cq5TTv0SHAdyJUTIglH07m1FMhir+wG67j0RI/ij6cKw35dIWWUDPmK9vID/rcNEJuB0F
 eDd63hyz0sita9bSUQ5D9WFLjxQXlZgjdrX1n3An6N5vYyBMv8JXTftziyFwQ1
X-Gm-Gg: ASbGnctYGL4bFj9wtC/LCVN6mApIq+1XC/4Lb7HzQnSv1sznW65+9IBKaKdRztN19Be
 qzx6jG04Zdj7iHc9XMBet4Rk5Qtt+qLQYvKKWyfs/eFSj97mRa1v0gzULXTKrCi0zBnO8f9rdYB
 lEZAesgDRpbqMDZuNjBhAl
X-Received: by 2002:a05:690c:6c07:b0:74d:b56e:77fe with SMTP id
 00721157ae682-74db56e961amr39757907b3.18.1758557667186; 
 Mon, 22 Sep 2025 09:14:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2y1iyDvbD0iwdSIxWN4zrf25GzGCRII20yGima7EhvH7l2Lq6mu3vHYhRnL5+hMEtOU2IU9gXHNOL1+mt7Xg=
X-Received: by 2002:a05:690c:6c07:b0:74d:b56e:77fe with SMTP id
 00721157ae682-74db56e961amr39757387b3.18.1758557666214; Mon, 22 Sep 2025
 09:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250921073655.GM39973@ZenIV>
In-Reply-To: <20250921073655.GM39973@ZenIV>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Mon, 22 Sep 2025 09:14:14 -0700
X-Gm-Features: AS18NWCy3SGjrpz7474Gd9sbSE4hPuTFoMW8pbjaFirSAkRibjt2IsBYaB56N9k
Message-ID: <CAKCV-6smpg5Zq=BAVn-R6r_rvkiU3doMLwZKV1uao0aKBogKVA@mail.gmail.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [apparmor] Fwd: what's going on with aa_destroy_aafs() call in
	apparmor_init()?
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

---------- Forwarded message ---------
From: Al Viro <viro@zeniv.linux.org.uk>
Date: Sun, Sep 21, 2025 at 12:37=E2=80=AFAM
Subject: what's going on with aa_destroy_aafs() call in apparmor_init()?
To: John Johansen <john@apparmor.net>
Cc: <linux-fsdevel@vger.kernel.org>, <linux-security-module@vger.kernel.org=
>


        Correct me if I'm wrong, but as far as I can tell apparmor_init()
ends up being called from security_init(), which is called before the call
of vfs_caches_init(), not to mention fs_initcall stuff.

        If that's the case, what is this doing there?
error:
        aa_destroy_aafs();
        AA_ERROR("Error creating AppArmor securityfs\n");
        return error;

aa_create_aafs() is called via fs_initcall; moreover, it will bail out
if called before apparmor_initialized has become true, so...

While we are at it, what will happen if apparmor_init() succeeds, but
aa_create_fs() fails afterwards?

If nothing else, aa_null_path will be left {NULL, NULL}, which will
immediately oops dentry_open() in aa_inherit_files()...


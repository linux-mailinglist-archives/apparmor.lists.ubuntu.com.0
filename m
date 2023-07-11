Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC1074F799
	for <lists+apparmor@lfdr.de>; Tue, 11 Jul 2023 19:55:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qJHaV-0001pR-Op; Tue, 11 Jul 2023 17:55:47 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <georgia.garcia@canonical.com>) id 1qJHaU-0001pJ-5u
 for apparmor@lists.ubuntu.com; Tue, 11 Jul 2023 17:55:46 +0000
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E33253F187
 for <apparmor@lists.ubuntu.com>; Tue, 11 Jul 2023 17:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1689098145;
 bh=/hdu5/cj5aQiyhJmSN9CWeYTZ+UffkgZWxigq+fHgBQ=;
 h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
 b=S3f4ky0FlO93Nz9ScfT3qYStj1czAcwHrOrlhbppujsgFsplpNVBIzwfR2DjH15Hs
 yvPxwiB5SvTroh0hdwQhVBhZiqzq3OyQkXlUgLSvuBB2RRF9Bztv5yesCBJ9F80BNd
 LLZEBwp1RRdGeniAp2EofwBrNHiU1tO4qCtMOyspITwmOWZzg1nZhuFKzLcbVu2Ni3
 rrecJhR9RjmyXcyf9lbUiWWatpu27V3dcf+8HVMtbPtuCxGLfzZmPdAyXLa6j/vrto
 cKqbv7HrsI3qbqojRlIPYzd/O6WpjsSV101rRIS5PHlpTp45UU8CeFYCnPkuotFxBa
 7Gj9rkXmJ8gRg==
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1b3f17e0f52so7054713fac.2
 for <apparmor@lists.ubuntu.com>; Tue, 11 Jul 2023 10:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689098143; x=1691690143;
 h=mime-version:user-agent:content-transfer-encoding:organization:date
 :to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/hdu5/cj5aQiyhJmSN9CWeYTZ+UffkgZWxigq+fHgBQ=;
 b=DRlZKf3Ed2N5vriQmQ0ULglvJENHGy25TlASusQRNuLYgEqewMl2f/X5dTQJMUkbd2
 FQbWIkx5uivb4aOPbkhpa5vxi+1ASUJpGO8I+VVn/d+WW4JXDibkV2mjTb/7n80ulkKO
 5vA79MRzeGtjjAi2Ta2qmUgvcW5YWw3aGir7OJ/8YMCzQFdl8l6rQMqqmk9zAyRNoRVC
 3fObGKaB9DBAGXfy7uS525CoJT+trMfnpafK+hygi8SwaWN1ns+yIJNS7/eYZvs21i63
 6eT348FOjwTj89JGAqVj2Iptg8FDc/tTspPnEDuzbBNzFD9sa7eQj5QS3+d42gUG21zv
 QsKQ==
X-Gm-Message-State: ABy/qLapUqzDqAa0Albo+g6Q2GVttnRfxH2/xB/hLT60gNrFv5nISj22
 kLsxkClBrm9t2yL8a7TSoWKMf8ynipj7uP4UVcZf2C/IVGre9ljmMMcc2Twy8RM7zWpyULeB6O8
 xB91mTT3PHAsH5RSJY3R559VSBaKEVXP4T8unYgqXVi4BMA==
X-Received: by 2002:a05:6870:40c6:b0:1b7:5ee0:bd50 with SMTP id
 l6-20020a05687040c600b001b75ee0bd50mr2027266oal.1.1689098143676; 
 Tue, 11 Jul 2023 10:55:43 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEDRFcH3C2U2r+KQ0oBBSHISvb5xepGlsJtcDtdPtEQzW3stu6iR2nYmCKpa/qV/WLyud0+Qw==
X-Received: by 2002:a05:6870:40c6:b0:1b7:5ee0:bd50 with SMTP id
 l6-20020a05687040c600b001b75ee0bd50mr2027249oal.1.1689098143289; 
 Tue, 11 Jul 2023 10:55:43 -0700 (PDT)
Received: from ?IPv6:2001:1284:f02e:eb66:2c53:9ea9:5a10:a6d4?
 ([2001:1284:f02e:eb66:2c53:9ea9:5a10:a6d4])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a056830139400b006b74bea76c0sm1161915otq.47.2023.07.11.10.55.41
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 10:55:42 -0700 (PDT)
Message-ID: <c501e7ac7fe03fa326dae783c3dbc0a61aa36570.camel@canonical.com>
From: Georgia Garcia <georgia.garcia@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Tue, 11 Jul 2023 14:55:39 -0300
Organization: Canonical
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
Subject: [apparmor] AppArmor 4.0 alpha1 Released
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

The AppArmor development team is pleased to announce the 4.0 alpha1
release of the AppArmor user space components.

The release is available on

gitlab
     https://gitlab.com/apparmor/apparmor/-/releases/v4.0.0-alpha1


The release notes are available at

    https://gitlab.com/apparmor/apparmor/-/wikis/Release_Notes_4.0-alpha1

Please report any bugs you may find via the gitlab AppArmor project
https://gitlab.com/apparmor/apparmor


Kudos to everyone who helped make this release possible.

Thanks!


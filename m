Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C87BB27930
	for <lists+apparmor@lfdr.de>; Fri, 15 Aug 2025 08:34:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1umo14-00072k-2N; Fri, 15 Aug 2025 06:34:18 +0000
Received: from mail-yb1-f175.google.com ([209.85.219.175])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <chandramohan.explore@gmail.com>)
 id 1umo12-00072c-Gr
 for apparmor@lists.ubuntu.com; Fri, 15 Aug 2025 06:34:16 +0000
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e931c741d7fso1695967276.0
 for <apparmor@lists.ubuntu.com>; Thu, 14 Aug 2025 23:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755239655; x=1755844455;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kuPdCpuTj1FBY4yhEPLgSb49bXec4fC3XCBOV2asUF4=;
 b=h/42D2Wr3lOeelmTWvK4HpQn3gL3lOJVyfwtj58W5QvktLPuQWfUWOmvuoNOaM9q4L
 hnVoDvax5fMUVKCfp9BI9bzm8vt5eT6S6ZBcqNgKXDnYS6TdDeQbWwusT17zUdP1d2xH
 lvdIBmn3ZyDNNWeI3ZeHcivjJoM7BY8WDD8xBqvYOXBFc83RxtgtI9p/1lVYubueYBfw
 iuVS+JUzhRLDw3/FN219zDH9xh5tvY8WWMliPPLJqZWbbJtuhRSU+EVKgH+IRCcJYMmi
 FULWxNkBErS9Yp1mgiF7pGuaTD9oPWflex6yAMnOVDlMG742RW3d3HYHjRklu0zhypF9
 eA5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMensyK/+4qqrqc8hrEFljUmTG7z7qOHgKJ3QCwiFaq8c+gmFOdkxOv+oQDdtGcojgf15gBDOlWw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzdkgztP/YZ5EhLl6GMOnM0hum+ghD5veWvvThKOUilc0o+4CEt
 665HxJ9LKIWUocu5x8pytune2jZvaebR81DO8fe7UJwej9qLv4oRr3fTC/XhTr/KD88HJRWR2iP
 4Bxp9vNrRX8Uin1s4Hu2PepxbVwMd2mc=
X-Gm-Gg: ASbGncu8/xdTTcCKgXmoOGDSXcXBBxQETx9kvtc45QwSO+5ZtpYGA8tT8tvxsgtC4zR
 yIuRb9zXmpc/4ll4cI48/Jl3a/goCdAVhpfPDycxykxu201aao6Cb0lWllYnWJP6cU1nwb0Dm9g
 RpwWu95dSj+L9cGtFNs8gsgQQ5XiuxGRYokYSGcswUWva4dpB2hBUWmGUBqFnx7fcePJzce8ieN
 m/xme0j4Pk0C8/puNX8xY0YmJw6H5oOMEQpf0Lh
X-Google-Smtp-Source: AGHT+IH4dxohOh7qqn9xS+FXF0LJU4Rn2rbnVst81GNs7v9pVTjVeAoxkPTiRwcWbs/IDQdt1EluIl9NmK/g5rkKxiw=
X-Received: by 2002:a05:690c:4c10:b0:71c:3de0:9687 with SMTP id
 00721157ae682-71e6dd33a93mr13502637b3.35.1755239654844; Thu, 14 Aug 2025
 23:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250814165403.616195-1-chandramohan.explore@gmail.com>
 <aJ6zKriNeoM4B/km@bhairav-test.ee.iitb.ac.in>
In-Reply-To: <aJ6zKriNeoM4B/km@bhairav-test.ee.iitb.ac.in>
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
Date: Fri, 15 Aug 2025 12:04:04 +0530
X-Gm-Features: Ac12FXwMQOi8Fm4tfQ_EIB_XLNT01Ea7X8vPl9CSOiR843YJyAaCBHL4B4dCFE0
Message-ID: <CADBJw5Zb7iOuzceDjeJ3e4JWAupxOTRnM62SmJFjv23vS-+bfQ@mail.gmail.com>
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.175;
 envelope-from=chandramohan.explore@gmail.com; helo=mail-yb1-f175.google.com
Subject: Re: [apparmor] [PATCH v2] apparmor: Remove unused value
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
Cc: paul@paul-moore.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 shuah@kernel.org, linux-kernel-mentees@lists.linux.dev, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, Aug 15, 2025 at 9:40=E2=80=AFAM Akhilesh Patil <akhilesh@ee.iitb.ac=
.in> wrote:
>
> On Thu, Aug 14, 2025 at 10:24:01PM +0530, Chandra Mohan Sundar wrote:
> > The value "new" is being assigned to NULL but that statement does not
> > have effect since "new" is being overwritten in the subsequent
> > fallback case.
> >
> > Remove the unused value. This issue was reported by coverity static
> > analyzer.
>
> Hi Chandra. Do you have Coverity ID for this issue ?
>
Hi Akhilesh,

Sure. The Coverity id is 1662453 (
https://scan5.scan.coverity.com/#/project-view/65357/10063?selectedIssue=3D=
1662453
).

Thanks,
Chandra Mohan Sundar


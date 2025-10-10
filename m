Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B503BCDA4E
	for <lists+apparmor@lfdr.de>; Fri, 10 Oct 2025 16:58:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v7EZA-0005Rz-Rt; Fri, 10 Oct 2025 14:57:56 +0000
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1v7EZ9-0005Rl-94
 for apparmor@lists.ubuntu.com; Fri, 10 Oct 2025 14:57:55 +0000
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-780fc3b181aso1332006b3a.2
 for <apparmor@lists.ubuntu.com>; Fri, 10 Oct 2025 07:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760108274; x=1760713074;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dhktQ9njw3xUQQNiviiU9j7Lv0g4dtHdRAIlg2dWPdo=;
 b=sxPZ8SJoIy/0eS7yFpwZ733+6Ksfr+dnh551AhUep/R65eTchjoSQZMmdsdghQKuD+
 F7AOo+aa0vEfO0zIKd4nA7OxpNwlteuAaCunp//AjlqDH+9PHHA3upQp+j21u5dDmIMG
 44RzAqpmdmV0wFVGtnkUYU5r+lS8jJQ45SHWj5ia/365ejf+Om+YszcmFSXouY4MDh2r
 E4lQWyPuHq3I1rmlgJJReR9s3huUIMUpEiFhAPdBtFsF6zMQDhlZuJbB+MaN+B3NfGp9
 8CihtpA6/7x/VNL/uFTHth1agHCWI6X+diiP/Zov7XQ1FBUXBLrkAR6Un3LMVrJ4eFwm
 4t4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiAmu1G6E5XE2RRJZO8c0YnR9s+LaM9SThe2MoJKn/bvKW+hb2ohKo9I2U+UuMIT7g1wYoxVlRVQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzdvshEsBcR3eBNGe0LTA5hc0oHCy+svHLVc2lq96X7RVRhMxSR
 p/u37YA/h2u52UWKmd/K8ff07yVmrK9gZCP+4ILClGMlTS05CWwWhu5IRufyZPWoRRXfMlyLcfc
 yZHB/Q6nPxtiHaZt+jS9K6Ov1P81twBWDY3fYyjM2
X-Gm-Gg: ASbGnctdSwT50UunR1eVa2pOcl7ZO6Jml5qR9LHw0fbsebpFxO6dtUgt7IzFH+akZQ/
 Pd7uCny9R5nf2MVK7gnaS0wmJ1pZLX2Q6BO0HfTCkpAb9PC77tEN7KAkNrqkz6OtW4cFqBBbg6o
 rjfyxKcO7Qqxk4YSOYqgs+qFrpR9tACn+TFtOd8UMklghlStYB7n7UWlnsX7a1lwlMSzjzho/+b
 wVoCTvKAVbEACblLF2D1oqP93sX6B/sl7n4
X-Google-Smtp-Source: AGHT+IHkK8Gm9viP+PnMJqCf6YwcaiPSZAhk2njG3CWT6nK+53DU2FspPpHEd0UmuOb2fdMKjhpGzmFzl8fSVbMyvcI=
X-Received: by 2002:a05:6a20:6a26:b0:2e3:a914:aab1 with SMTP id
 adf61e73a8af0-32da83e3df1mr15879251637.41.1760108273442; Fri, 10 Oct 2025
 07:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251010132610.12001-1-maxime.belair@canonical.com>
 <20251010132610.12001-5-maxime.belair@canonical.com>
 <CAEjxPJ6Xcwsic_zyLTPdHHaY9r7-ZTySzyELQ76aVZCFbh8FMQ@mail.gmail.com>
In-Reply-To: <CAEjxPJ6Xcwsic_zyLTPdHHaY9r7-ZTySzyELQ76aVZCFbh8FMQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 10 Oct 2025 10:57:41 -0400
X-Gm-Features: AS18NWDDlD9d-obeXSKEgVeXrkg3pQGOfVLXHTxpEsZnDxFwMdZ6CYaIkCq_crw
Message-ID: <CAHC9VhTSsUf-XJTNSxs-7DeAdR-0uBfL7reZnjMXhma3ZSOF+Q@mail.gmail.com>
To: Stephen Smalley <stephen.smalley.work@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.174; envelope-from=paul@paul-moore.com;
 helo=mail-pf1-f174.google.com
Subject: Re: [apparmor] [PATCH v6 4/5] SELinux: add support for
	lsm_config_system_policy
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
Cc: Ondrej Mosnacek <omosnace@redhat.com>, song@kernel.org, kees@kernel.org,
 linux-api@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp,
 rdunlap@infradead.org, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 mic@digikod.net, takedakn@nttdata.co.jp,
 SElinux list <selinux@vger.kernel.org>, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, Oct 10, 2025 at 9:59=E2=80=AFAM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> 2. The SELinux namespaces support [1], [2] is based on instantiating a
> separate selinuxfs instance for each namespace; you load a policy for
> a namespace by mounting a new selinuxfs instance after unsharing your
> SELinux namespace and then write to its /sys/fs/selinux/load
> interface, only affecting policy for the new namespace. Your interface
> doesn't appear to support such an approach and IIUC will currently
> always load the init SELinux namespace's policy rather than the
> current process' SELinux namespace.

I'm distracted on other things at the moment, but my current thinking
is that while policy loading and namespace management APIs are largely
separate, there is some minor overlap when it comes to loading policy
as others have mentioned.  For that reason, I think we need to resolve
the namespace API first, keeping in mind the potential for a policy
load API, and then implement the policy loading API, if desired.

--=20
paul-moore.com


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C294902A50
	for <lists+apparmor@lfdr.de>; Mon, 10 Jun 2024 22:56:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sGm4P-0005JG-Fi; Mon, 10 Jun 2024 20:56:49 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1sGm4N-0005J7-KY
 for apparmor@lists.ubuntu.com; Mon, 10 Jun 2024 20:56:47 +0000
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-627ea4e0becso53197217b3.0
 for <apparmor@lists.ubuntu.com>; Mon, 10 Jun 2024 13:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718053006; x=1718657806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YCHlrp1sqWxXkENQgyX1SA6e/23clY3UwLtIBI7esY0=;
 b=Aa8kib+AVIHBaBc+j6jbCuotgt3Mv2GERoWThFPTq/8XFI35mN0o5kNzQs9BsERUj9
 J+P/U6fiuIZHgXLhSCyK7cphxEy1B9g/diAWPL9WLvoM8TO5O/ws4GwfSgXLAmVZ4R4r
 sfTQ+2lJj0lTT0G4EiCMohzGTHpf0Mbpsm3KNHGei6ZZ9koAZ4Obx88RGWjpFrp2zwTW
 yKG39L2GB1VkPfqeztHWvqLY4RNImcwt8r584Gs5Z8DiGTlsDWf2QZGrY5t1ndBvqPTG
 pdYbFTd5SPSbkhexujdu4NqsI4hrYNu9CzpHom5SHTeP/eJFNQdXdkLtzmYjp+OokBeC
 uRUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwOA79HNnQy8w//4URC5Fe2/KsDgM7DRT73gJrP7kjSnGJ+yU0BibTjXISraLD3VQbYlg2Q0lZfYsuh49LvZ0meD5/818eVSZC
X-Gm-Message-State: AOJu0Yw0cT2Vxm07B4UGLBDCN9yHiLI/96BPrNRF1eh69Mnt7em9OHUr
 tbo8oKhvVpJxwOLK61mNeiAak3UxEOg9NWtbpZ1wPAKXc0Yra41WQ8q5YDlboLoZmN4tZCFxnwS
 74gpMuK5YBptZrD1lZrErKzZXleA07LCwp//A
X-Google-Smtp-Source: AGHT+IFvfIOmbU92tIEUP97U962ZwkX+dae5pNDe8HVsVV2fINnzI7Cy6PJ/dYbQrp9/0zG0WtFUc6q1Xyv7UapuZHg=
X-Received: by 2002:a0d:c186:0:b0:62d:355:5b34 with SMTP id
 00721157ae682-62d03555e3fmr47903587b3.20.1718053006262; Mon, 10 Jun 2024
 13:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240315113828.258005-1-cgzones@googlemail.com>
In-Reply-To: <20240315113828.258005-1-cgzones@googlemail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 10 Jun 2024 16:56:35 -0400
Message-ID: <CAHC9VhRekFEc5HHAEhp52tNT6NLnLw__fpy7F0Yq=Qry0Jk_-Q@mail.gmail.com>
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.176; envelope-from=paul@paul-moore.com;
 helo=mail-yw1-f176.google.com
Subject: Re: [apparmor] [PATCH 01/10] capability: introduce new capable flag
	CAP_OPT_NOAUDIT_ONDENY
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
Cc: Christian Brauner <brauner@kernel.org>, selinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>,
 Roberto Sassu <roberto.sassu@huawei.com>, James Morris <jmorris@namei.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Ondrej Mosnacek <omosnace@redhat.com>,
 linux-block@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>,
 linux-security-module@vger.kernel.org,
 Khadija Kamran <kamrankhadijadj@gmail.com>, apparmor@lists.ubuntu.com,
 bpf@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, Mar 15, 2024 at 7:38=E2=80=AFAM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> Introduce a new capable flag, CAP_OPT_NOAUDIT_ONDENY, to not generate
> an audit event if the requested capability is not granted.  This will be
> used in a new capable_any() functionality to reduce the number of
> necessary capable calls.
>
> Handle the flag accordingly in AppArmor and SELinux.
>
> CC: linux-block@vger.kernel.org
> Suggested-by: Paul Moore <paul@paul-moore.com>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
> v5:
>    rename flag to CAP_OPT_NOAUDIT_ONDENY, suggested by Serge:
>      https://lore.kernel.org/all/20230606190013.GA640488@mail.hallyn.com/
> ---
>  include/linux/security.h       |  2 ++
>  security/apparmor/capability.c |  8 +++++---
>  security/selinux/hooks.c       | 14 ++++++++------
>  3 files changed, 15 insertions(+), 9 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com


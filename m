Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 59278BCDA78
	for <lists+apparmor@lfdr.de>; Fri, 10 Oct 2025 17:00:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1v7Eb2-0005vx-Al; Fri, 10 Oct 2025 14:59:52 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1v7Eb0-0005vc-09
 for apparmor@lists.ubuntu.com; Fri, 10 Oct 2025 14:59:50 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-27d4d6b7ab5so30010675ad.2
 for <apparmor@lists.ubuntu.com>; Fri, 10 Oct 2025 07:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760108388; x=1760713188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+0sjW+oV0t2BMqgCvuWpzJUVVCqY3LbFgfCiYx9Oq0=;
 b=BNwJX23tunz4DCYbuR3mxyr0rcLA7+wpBEwR2PA7RxRdhb6u5KMbh+wrM4tTaIJOeB
 3zJY4bHm4ZeWy4+275old72HZdSvVKDqLvjPIZpNWkBfe+sZPIF4TjH/ISQ4jCWsTYoZ
 CY6nY9ZXqa7j7rVsYCWpbCa+kbqSn3FkrLVdTA6Xwh4qlamFm0qfNI9foa2Alwwzspea
 mgh0EiH590keH+z/hgP2KQnwaa36bRK5Nsdd+vf1aYxcKbls4PsiQJosqebN5qpqRrS7
 WsM/5aBBzw9VOX92m90y4KlVHJI8f/ot/a4HZN859FXZpJ3Cx6X2nNzMIAyyc4SE4G68
 M+JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3Utz2M0JcU5hdQl2fuGm0OkWeuYqktNb1PhvYUTTk2yslY22J5q9JnduHyiSXbQm928h+AB7TxA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yy8P/XwIQPiXhSCr6MKxioGQetx28BgA+zujvhYZOQKqmnVqZu0
 hm1U++daQI73UNY2Eb93ZKdsWTClFR7rSeP73JW8RSaUvN6kcpnVinFVCdZU1YRNSvlThZ3ujFo
 WFgACH15m/vUcuFuwdQQ2UOnB8Y1VBF4vYstQxAz5
X-Gm-Gg: ASbGncvoqeyAPHNtW04Ev0a7AgiOmfAgQKh5vTIX5gerSUCRh2Tm/4qC3Rch7SEqdDy
 9MyD9w0hzNyV8hLW2dDigmayGWNJBKhpb1aSjoH/XJBQC97ykZTog1i1fwQzFeL6ugIH+WxnEjj
 J7wKyrHZakQWAOOLtCbvzZPAmWreAqaWgRMGMA1vjmL1GJZ+XZgS0PFRUKXPBjUERGqIqL7zaYm
 Q0YBjHUnOj72Itv+6/eoXEDlw==
X-Google-Smtp-Source: AGHT+IG9hy80Ik6+ARbIl3oz3A3KG5+fo5fGn6VPEI+bWA/pwCD/ahXTgPJG7kBipRJaOCzTwImphgjwuOgiPM9OpYY=
X-Received: by 2002:a17:902:f602:b0:274:9dae:6a6d with SMTP id
 d9443c01a7336-290272c1a67mr159749285ad.34.1760108388086; Fri, 10 Oct 2025
 07:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250709080220.110947-1-maxime.belair@canonical.com>
 <20250709080220.110947-3-maxime.belair@canonical.com>
 <20250820.Ao3iquoshaiB@digikod.net>
 <0c7a19cb-d270-403f-9f97-354405aba746@schaufler-ca.com>
In-Reply-To: <0c7a19cb-d270-403f-9f97-354405aba746@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 10 Oct 2025 10:59:36 -0400
X-Gm-Features: AS18NWAVS7migS1jhRtb-IPHhnKptQlfKCCpqw55Hl-FAqPL4NSJFJGx8uS1S6s
Message-ID: <CAHC9VhSXcqKF9KQ1+KanPqoTk=GRsOXs5dGNNnmTiK_BcMUV5A@mail.gmail.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.214.182; envelope-from=paul@paul-moore.com;
 helo=mail-pl1-f182.google.com
Subject: Re: [apparmor] [PATCH v5 2/3] lsm: introduce
	security_lsm_config_*_policy hooks
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
Cc: song@kernel.org, kees@kernel.org, linux-api@vger.kernel.org,
 stephen.smalley.work@gmail.com, rdunlap@infradead.org,
 apparmor@lists.ubuntu.com, jmorris@namei.org, linux-kernel@vger.kernel.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-security-module@vger.kernel.org,
 =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Aug 20, 2025 at 11:30=E2=80=AFAM Casey Schaufler <casey@schaufler-c=
a.com> wrote:
> On 8/20/2025 7:21 AM, Micka=C3=ABl Sala=C3=BCn wrote:
> > On Wed, Jul 09, 2025 at 10:00:55AM +0200, Maxime B=C3=A9lair wrote:
> >> Define two new LSM hooks: security_lsm_config_self_policy and
> >> security_lsm_config_system_policy and wire them into the corresponding
> >> lsm_config_*_policy() syscalls so that LSMs can register a unified
> >> interface for policy management. This initial, minimal implementation
> >> only supports the LSM_POLICY_LOAD operation to limit changes.
> >>
> >> Signed-off-by: Maxime B=C3=A9lair <maxime.belair@canonical.com>
> >> ---
> >>  include/linux/lsm_hook_defs.h |  4 +++
> >>  include/linux/security.h      | 20 ++++++++++++
> >>  include/uapi/linux/lsm.h      |  8 +++++
> >>  security/lsm_syscalls.c       | 17 ++++++++--
> >>  security/security.c           | 60 ++++++++++++++++++++++++++++++++++=
+
> >>  5 files changed, 107 insertions(+), 2 deletions(-)

...

> >> diff --git a/include/uapi/linux/lsm.h b/include/uapi/linux/lsm.h
> >> index 938593dfd5da..2b9432a30cdc 100644
> >> --- a/include/uapi/linux/lsm.h
> >> +++ b/include/uapi/linux/lsm.h
> >> @@ -90,4 +90,12 @@ struct lsm_ctx {
> >>   */
> >>  #define LSM_FLAG_SINGLE     0x0001
> >>
> >> +/*
> >> + * LSM_POLICY_XXX definitions identify the different operations
> >> + * to configure LSM policies
> >> + */
> >> +
> >> +#define LSM_POLICY_UNDEF    0
> >> +#define LSM_POLICY_LOAD             100
> > Why the gap between 0 and 100?
>
> It's conventional in LSM syscalls to start identifiers at 100.
> No compelling reason other than to appease the LSM maintainer.

If you guys make me repeat all the reasons why, I'm going to get even
crankier than usual :-P

--=20
paul-moore.com


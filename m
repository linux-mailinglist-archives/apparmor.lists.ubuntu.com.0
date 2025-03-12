Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E155A5E318
	for <lists+apparmor@lfdr.de>; Wed, 12 Mar 2025 18:48:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tsQBw-0002RM-3r; Wed, 12 Mar 2025 17:48:28 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tsQBv-0002QN-BU
 for apparmor@lists.ubuntu.com; Wed, 12 Mar 2025 17:48:27 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 05C303F2C4
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 17:48:27 +0000 (UTC)
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ac218738618so7270966b.2
 for <apparmor@lists.ubuntu.com>; Wed, 12 Mar 2025 10:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741801706; x=1742406506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kK+Uzx8x8D5ht/tXbBHOfOvPS3OA4ISdgq7b3lkHCD4=;
 b=hPLV8UAEFAPMn3DjTqVgiXwhKsRDuPQDyfX8kwS7PppdAMccAchXv8OIEpGoGlXL31
 jAi4edXK7IBKboOQYiYQp/H+bk+Qhfkwp8A/Iwn6qISt+AA69yUjCXEPgOyoETkMK0Vt
 Pc2o+rS6gWhsnBVWrTaTdRcFfcPVqvgtWv9pC3QaKWDldSY4mCLaj/jsIyNS8a+DMGc8
 7dInD1gCaPWn1ZQ3dnbXy5nrdpzgyjzUdCO9maN6nlCEpj4SxRQQlkDLXnTxp0ZGeGQR
 0yqx4jY0o5bf3A7JfM7NrakZWNtN+TORk8o9LUb5qPTM79RyLvl7qk1J6rSDhThQMU4g
 9KJg==
X-Gm-Message-State: AOJu0YyPIh8/0O41KHenfoj+7FhpjA/8NeMVt11xUgc12ea3Pzr262Lz
 83zjPtSYPzj3soHedOnT4P+3DkhyeFzyjDJ/9uFQ158aUxs7znfZoT3H6V6MdARgXhBOhx5iicn
 C6f0iAFLPt5VlP/Ez8XdskERKAJaFd9soYMgdmok82LWwUS7if0cqfmbpDII/xLPLoE45ifTvtC
 3u0PH8L6FA+IalbZYxFMDRKVC55R5mgLBCnJInWMBvlPorHu5LEvocyw9X
X-Gm-Gg: ASbGncv4BC5c5SNrOgQZ6RQLBHttLmQAMhIDlm8fq4QIpDzZXPpSyzQYoMyxwcQavWw
 Ewky2bxkwmNCOANoQhNhjWay2bVW7FiVJ1KLOewWQf2hAQSzAnD1e3zdIyqXXZFTvhzHr68M=
X-Received: by 2002:a17:907:97ca:b0:abf:5fa3:cf94 with SMTP id
 a640c23a62f3a-ac25263c78bmr605703566b.22.1741801706228; 
 Wed, 12 Mar 2025 10:48:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKsWBTpAhfUukYT7SVsHEaxg18P6DukdwcS0gyK7c4X0XI1Kb21OeXbJ9Mo55n9d0BKCsZiC3QoOunaeqhKJU=
X-Received: by 2002:a17:907:97ca:b0:abf:5fa3:cf94 with SMTP id
 a640c23a62f3a-ac25263c78bmr605700666b.22.1741801705759; Wed, 12 Mar 2025
 10:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250304205556.290042-1-ryan.lee@canonical.com>
 <20250304205556.290042-4-ryan.lee@canonical.com>
 <26796961.1r3eYUQgxm@tux.boltz.de.vu>
In-Reply-To: <26796961.1r3eYUQgxm@tux.boltz.de.vu>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Wed, 12 Mar 2025 10:48:13 -0700
X-Gm-Features: AQ5f1JrmQc1e0zZD0XJT3C_SWGvSBZoFTHaV6nyMGiMytxbfgBWmMzwZKogbNPw
Message-ID: <CAKCV-6v1RmQ+BTjZRMEqQhYG7iGS-Z7jDvfRo88Z1x6OLPU1+w@mail.gmail.com>
To: Christian Boltz <apparmor@cboltz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH 3/5] apparmor: create new learning profile in
 complain mode upon disconnect exec
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

On Sat, Mar 8, 2025 at 3:22=E2=80=AFAM Christian Boltz <apparmor@cboltz.de>=
 wrote:
>
> Hello,
>
> Am Dienstag, 4. M=C3=A4rz 2025, 21:55 schrieb Ryan Lee:
> > +        * error should only be set at this point if we're complain
> > mode
>
> Nitpick: ... if we're _in_ complain mode

Fixed in v2, thanks

>
>
> Regards,
>
> Christian Boltz
> --
> > > That's the part where we create a flame war and then try to
> > > collect some useful ideas afterwards. ;-)
> > Let's collect ideas directly ;-)
> Humm.. interesting.. never thought about that approach. :-)
> [> Andreas Jaeger and (>>) Gustavo Niemeyer in opensuse-packaging]


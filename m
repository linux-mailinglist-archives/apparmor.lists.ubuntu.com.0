Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F962A11603
	for <lists+apparmor@lfdr.de>; Wed, 15 Jan 2025 01:18:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tXr6v-0007di-7L; Wed, 15 Jan 2025 00:18:17 +0000
Received: from mail-yb1-f179.google.com ([209.85.219.179])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1tXr6t-0007dY-AO
 for apparmor@lists.ubuntu.com; Wed, 15 Jan 2025 00:18:15 +0000
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e46c6547266so9205705276.3
 for <apparmor@lists.ubuntu.com>; Tue, 14 Jan 2025 16:18:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736900294; x=1737505094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zp49rurA1Myl0pyaSxk9MhtQoSZ5WS+5uSafkdF+aKI=;
 b=U3/5mqUbNytEirdoI+/lcn1EZOYuLXt34lIJLpWkKsvPiuR3Rgj5kBxodAclF+zwcQ
 Ww6aa+YPzJkDYTe9P7t0IdS3IYuAb6CoZrfBf0wzR3+7sSki8dsW9FQJr1rDUt6qTOWv
 yb0F8bBXkRRquM671Sx4fjpt9Fu8/ErQ+IYETTYQwU1lE6Ict9Pft3quJROoWQTo9meD
 bywEtZuM3odh7BTLYbL1e0hrsK6cHVAAI81EXKB7ZoG6h1WBwkzRJa2wcr9Uj8uxtZRH
 +FF9ClpALHsvAVAbMxLriuvHoyuZhWanINLSr2xsDo7KZrwU1qz2NMKm8ZivUO4MqMK7
 G6gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzQ1jGbKUtjC1+e82jdjB5gYs8t7Dfn4o5X03d14daiRQ9MJgjoMZ5fcqr+d7qbcGm6YwVv4tHlA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxYrnfTDQopMgB16ESYktPCFa8jhWlm/D+OkQMsksDQnBFG6/Wq
 zUs0opQFiF3PNQr+tzulymJJbszhii+uwp2FcPks8WBtu9Oh9RDaLVLyIsuNb0OLOxz5UelwZRr
 0JgNZiy+UpDcnznmdPsB2VPeDtFVBUw0E8HUY
X-Gm-Gg: ASbGnctWJQ3bK0jNy0R7KbBqfc3Zeq/qzMD9BEiCWa5GFgs4FpEBhpl18YtMCpR6Tou
 aZg3xqRwtKEj84APqtaQ0LN9x3GqH3UgonOQB
X-Google-Smtp-Source: AGHT+IHtJYSwXkwz+07V0jN+izWJEyDVHZCMBZLUC2IdNu3wLbY2abzMLGBC7XuWrOyXqA98/b43/EFQmm+YZfl72hQ=
X-Received: by 2002:a05:6902:1444:b0:e57:2e8f:b680 with SMTP id
 3f1490d57ef6-e572e8fb8d7mr13442994276.40.1736900294049; Tue, 14 Jan 2025
 16:18:14 -0800 (PST)
MIME-Version: 1.0
References: <20250111.22fc32ae0729@gnoack.org>
 <20250112072925.1774-1-tanyaagarwal25699@gmail.com>
 <20250113.a860b47a11c7@gnoack.org>
 <d1b05612412a1d4b858662f296b45279c2141aa8.camel@linux.ibm.com>
 <CAPdGtUw9Ee7weCmS2ZP-Hi5KwPw9-O1fGRrY_KLKQh-SWgEN5Q@mail.gmail.com>
In-Reply-To: <CAPdGtUw9Ee7weCmS2ZP-Hi5KwPw9-O1fGRrY_KLKQh-SWgEN5Q@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 14 Jan 2025 19:18:03 -0500
X-Gm-Features: AbW1kvaUpZnLTH-RTdyjzL8irQYqX_incLPjKbOpK4BgJaOp8exyZK1GGvI_Sl0
Message-ID: <CAHC9VhQ1X_6V3ReOQv1ob22My=fjYk-b4Cfm0wB1YS6fomJtYg@mail.gmail.com>
To: Tanya Agarwal <tanyaagarwal25699@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.179; envelope-from=paul@paul-moore.com;
 helo=mail-yb1-f179.google.com
Subject: Re: [apparmor] [PATCH V2] security: fix typos and spelling errors
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
Cc: serge@hallyn.com, eric.snowberg@oracle.com,
 penguin-kernel@i-love.sakura.ne.jp, dmitry.kasatkin@gmail.com,
 stephen.smalley.work@gmail.com, roberto.sassu@huawei.com, jmorris@namei.org,
 Mimi Zohar <zohar@linux.ibm.com>, omosnace@redhat.com, mic@digikod.net,
 linux-security-module@vger.kernel.org, anupnewsmail@gmail.com,
 gnoack@google.com, skhan@linuxfoundation.org, linux-integrity@vger.kernel.org,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 takedakn@nttdata.co.jp
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Jan 14, 2025 at 11:13=E2=80=AFAM Tanya Agarwal
<tanyaagarwal25699@gmail.com> wrote:
>
> Hi All,
> Thanks for the review.
> Sure, I'll split patches of different security subsystems so, that
> they are easy for maintainers to merge.

Thanks!

--=20
paul-moore.com


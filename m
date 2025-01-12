Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 38896A0AAF6
	for <lists+apparmor@lfdr.de>; Sun, 12 Jan 2025 17:37:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tX0xQ-0001nL-Js; Sun, 12 Jan 2025 16:37:00 +0000
Received: from mail-yb1-f177.google.com ([209.85.219.177])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1tX0xO-0001nD-8I
 for apparmor@lists.ubuntu.com; Sun, 12 Jan 2025 16:36:58 +0000
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e399e904940so5358995276.2
 for <apparmor@lists.ubuntu.com>; Sun, 12 Jan 2025 08:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736699817; x=1737304617;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vr1ktmu3cwRXhTgySXlqgLK2IZ2AAICyoWgt+rRYqSA=;
 b=R7USG3glYbJUFLdaO7U8ME99TmL2ZNGXHQFk05bvDI3H318yiSCwBzBCq/bk5JqJbj
 0HWiOaHg1LLVZ0LDzKW7aHnlUSnbNCiBaVH8Jw7oq00YXSCkvq/bP5oGxFsXnZJ85PYD
 F1EEsNFZe0HRu7Y4mEHb6efScYbpL79/+kHpCIZsYG6HXT673///z8Gss3EZb+t+exDh
 HUb6GFdvToVvpY3nfw0EzW7drQ4Ko9GMpA/+Tisfh3tF4FHMqRtNX9uRb9cqzFD1gna3
 JQORq/WluwLTz5JJOwWqBsFl237AaVD8W0cLq7rMGFDRs9O9AbLqNu/w41gHiykT6Q3R
 m8Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUWakyKW7p4IHkTr/gIVGtBxh20cYszPKDquQa8B3c5HLlUqOybJiJug4yAAchh+0Vd/mh3LZbuQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxH+Vle92Y8hRYOP9f2MbrZZskZF3M1oerdx7TmZusMijXuSmOa
 7nS0+k9ow/BClpkiYme3XduR8UrA8Qh9dbA22R3UWEM+dtEzYyDKiFBj4aPvBMNKUIYN9C7ksjE
 NbMRjgS0jiMV9ExrMhUsYxVEGgCDANWxVOGUR
X-Gm-Gg: ASbGncuXcX3ENcCDxbI/ySDuDANzna+YDw61w3zATFQRJWnaJrjZIzyDtYJyw9M75dN
 Pg0JSYSTZQG59nN1stJpe3o+JauI636+E4Zrp
X-Google-Smtp-Source: AGHT+IGIA6hMaBoWY4qF4q6O4nbIJYkuiC4pn3Ji5ObcZCNpPRu/wBbEKhJKyaUL1cf/zrWh1YtCi+h4orpQA8HPIdQ=
X-Received: by 2002:a05:6902:a09:b0:e57:31f1:9722 with SMTP id
 3f1490d57ef6-e5731f1a429mr6492655276.29.1736699816946; Sun, 12 Jan 2025
 08:36:56 -0800 (PST)
MIME-Version: 1.0
References: <20250111.22fc32ae0729@gnoack.org>
 <20250112072925.1774-1-tanyaagarwal25699@gmail.com>
In-Reply-To: <20250112072925.1774-1-tanyaagarwal25699@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 12 Jan 2025 11:36:46 -0500
X-Gm-Features: AbW1kvYKYLPgf17jvvR-FCco9-QwNGcpYookaR3B9G1F3dpIui_cbJeum1-JgEY
Message-ID: <CAHC9VhRbZLtBZ8dH-kASnkQUehG4Cu=zd23A6Jj9zfnyeGOTsA@mail.gmail.com>
To: Tanya Agarwal <tanyaagarwal25699@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.177; envelope-from=paul@paul-moore.com;
 helo=mail-yb1-f177.google.com
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
Cc: eric.snowberg@oracle.com, penguin-kernel@i-love.sakura.ne.jp,
 dmitry.kasatkin@gmail.com, stephen.smalley.work@gmail.com,
 roberto.sassu@huawei.com, jmorris@namei.org, zohar@linux.ibm.com,
 omosnace@redhat.com, mic@digikod.net, linux-security-module@vger.kernel.org,
 anupnewsmail@gmail.com, gnoack@google.com, skhan@linuxfoundation.org,
 linux-integrity@vger.kernel.org, takedakn@nttdata.co.jp,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sun, Jan 12, 2025 at 2:30=E2=80=AFAM Tanya Agarwal
<tanyaagarwal25699@gmail.com> wrote:
>
> From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
>
> Fix typos and spelling errors in security module comments that were
> identified using the codespell tool.
> No functional changes - documentation only.
>
> Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> ---
> Thanks G=C3=BCnther, for catching this error.
> The irony of having a spelling mistake in a patch that fixes spelling
> mistakes is not lost on me :)
>
> I've fixed it in V2 of the patch. Thank you for the careful review!
>
> V2: fix spelling mistake - s/beeen/been/
>
>  security/apparmor/apparmorfs.c      | 6 +++---
>  security/apparmor/domain.c          | 4 ++--
>  security/apparmor/label.c           | 2 +-
>  security/apparmor/lsm.c             | 2 +-
>  security/apparmor/policy.c          | 4 ++--
>  security/integrity/evm/evm_crypto.c | 2 +-
>  security/integrity/evm/evm_main.c   | 2 +-
>  security/integrity/ima/ima_main.c   | 6 +++---
>  security/landlock/ruleset.c         | 2 +-
>  security/selinux/avc.c              | 2 +-
>  security/smack/smack.h              | 2 +-
>  security/smack/smack_access.c       | 4 ++--
>  security/smack/smack_lsm.c          | 6 +++---
>  security/smack/smackfs.c            | 2 +-
>  security/tomoyo/domain.c            | 2 +-
>  15 files changed, 24 insertions(+), 24 deletions(-)

Hi Tanya,

Ideally this patchset would be split into into seperate, independent
patches, one for AppArmor, one for IMA/EVM, one for Landlock, one for
SELinux, one for Smack, and one for TOMOYO.  This allows for each LSM
maintainer to review and merge these fixes individually as opposed to
requiring every LSM maintainer to ACK this patch before it can be
merged.  There is also a risk, as with any cross-subsystem patch, that
this patch will cause merge conflicts in the future as there is the
possibility of multiple development trees touching the same file
region, function, etc.

As a general rule, if you have a single patch that touches multiple
kernel subsystems, and the changes in each subsystem can be applied
independently, you really should split the patch into subsystem
specific patches.  You also should post these patches independently,
and not as a single patchset, as a single patchset crossing multiple
subsystems can sometimes cause some confusion among maintainers about
who is going to be responsible for handling the patchset (even if all
the patches are split properly).

--
paul-moore.com


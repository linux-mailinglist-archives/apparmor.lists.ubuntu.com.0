Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E4CAAD62B
	for <lists+apparmor@lfdr.de>; Wed,  7 May 2025 08:35:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uCYN4-0003Lk-1W; Wed, 07 May 2025 06:35:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <song@kernel.org>) id 1uCYN1-0003Lc-SN
 for apparmor@lists.ubuntu.com; Wed, 07 May 2025 06:35:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AAFC94463A
 for <apparmor@lists.ubuntu.com>; Wed,  7 May 2025 06:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3E8C4CEE9
 for <apparmor@lists.ubuntu.com>; Wed,  7 May 2025 06:26:33 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-72c27166ab3so4212383a34.1
 for <apparmor@lists.ubuntu.com>; Tue, 06 May 2025 23:26:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUj9lJENk25vwUsVLoqDXPhh0OWAqy3ZI49IAhOT8MQVqcsuXAARAzTykRzZ/AYgWrE2Jq/+W5cjg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YziC9hJ/Mu3bcGlxO956u7kfh4WkE5B5AkKo3tMtyIunTsmMB4D
 AW8EgGIVpLrlZlW5lcAuGk20mrNSEbmnQNmRREx1S0cNOnDnCzsjZNTlHqmaXFqW5EpE92R7ijb
 cw1e5eP/DfMbT3VPL6hRrQQ0Hads=
X-Google-Smtp-Source: AGHT+IE6OoQBQFNIo2RMuI36yMDwzxZHGLigZ5rk40AM8etZx9c58IROyGc/jRXUBwa/wPABVFxm/WCKiib7VV1jN8w=
X-Received: by 2002:a05:6214:529b:b0:6e8:9e8f:cfb with SMTP id
 6a1803df08f44-6f542a5f62dmr30383316d6.24.1746599182795; Tue, 06 May 2025
 23:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-2-maxime.belair@canonical.com>
In-Reply-To: <20250506143254.718647-2-maxime.belair@canonical.com>
From: Song Liu <song@kernel.org>
Date: Tue, 6 May 2025 23:26:11 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4qY9B3KdhqrUOZoNBWQmO_RDwbH46my314WxrFwxbwkQ@mail.gmail.com>
X-Gm-Features: ATxdqUEG2jVvCzrgMgUy-LTFDpzXf-8Zg-TeGO0jYs2AI_kPt5jR1N9qESQfZXI
Message-ID: <CAPhsuW4qY9B3KdhqrUOZoNBWQmO_RDwbH46my314WxrFwxbwkQ@mail.gmail.com>
To: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=172.234.252.31; envelope-from=song@kernel.org;
 helo=sea.source.kernel.org
Subject: Re: [apparmor] [PATCH 1/3] Wire up the lsm_manage_policy syscall
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
Cc: paul@paul-moore.com, kees@kernel.org, linux-api@vger.kernel.org,
 stephen.smalley.work@gmail.com, penguin-kernel@i-love.sakura.ne.jp,
 apparmor@lists.ubuntu.com, jmorris@namei.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, mic@digikod.net, takedakn@nttdata.co.jp,
 serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, May 6, 2025 at 7:40=E2=80=AFAM Maxime B=C3=A9lair
<maxime.belair@canonical.com> wrote:
>
> Add support for the new lsm_manage_policy syscall, providing a unified
> API for loading and modifying LSM policies without requiring the LSM=E2=
=80=99s
> pseudo-filesystem.
>
> Benefits:
>   - Works even if the LSM pseudo-filesystem isn=E2=80=99t mounted or avai=
lable
>     (e.g. in containers)
>   - Offers a logical and unified interface rather than multiple
>     heterogeneous pseudo-filesystems.

These two do not feel like real benefits:
- Not working in containers is often not an issue, but a feature.
- One syscall cannot fit all use cases well...

>   - Avoids overhead of other kernel interfaces for better efficiency

.. and it is is probably less efficient, because everything need to
fit in the same API.

Overall, this set doesn't feel like a good change to me.

Thanks,
Song


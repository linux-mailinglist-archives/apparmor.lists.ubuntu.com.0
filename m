Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FAD718BAB
	for <lists+apparmor@lfdr.de>; Wed, 31 May 2023 23:14:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q4T90-0008Sa-5A; Wed, 31 May 2023 21:14:10 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <paul@paul-moore.com>) id 1q4T5z-0008MS-4N
 for apparmor@lists.ubuntu.com; Wed, 31 May 2023 21:11:03 +0000
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-561b7729a12so21816817b3.1
 for <apparmor@lists.ubuntu.com>; Wed, 31 May 2023 14:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1685567462; x=1688159462;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tBVvWrCiTxtzHEDX16BAY1j+7bSgZNwLuSAk5FN/PvE=;
 b=TwLEaj52ZRYp1qrngqFFdT+akHp+jZIAWRAdGud0wjJdUD4VkESfBuc6KLIlfu8B5T
 DgNKWh06VarQ4XX9e9KMMm5PtqzyNgpUqCbt+Y8S1Q1C/8aNlhBqc13ZylPQKggZDYKX
 pnyoa4nRSnRPzUQ+qcNq1rQIeUKcZajMCXWourOAY8fqZmfv6B6JDsArMK4fTRZ6xPAY
 OCIo4rSLKXNOBSDrnnzZgrwxLFPxBYv8VHimlaWGUv5g6K4vtJEQXv/gS7lHmDOBbTat
 e9iWQpf/s0j6qomZp10nGeexnSsquf5XQShkTy8HKjgy6fmopr2RE0RKe/jGwqehsCzS
 Qbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685567462; x=1688159462;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tBVvWrCiTxtzHEDX16BAY1j+7bSgZNwLuSAk5FN/PvE=;
 b=gHhQrBt6VdrPSqLY3pKSx4olfMFrK9OUP44WhhI0xBz9AosEGUqMtDk9YFtpXv8G46
 6nIS91T/rK30sJ16j+hKkHKC/Y9n7TEN2x5Xm307ptRNljrVhwQvWgwfsGZCzZyMGuOd
 zG1BX6P2yaw3UQcQqSkzIAkL4ePZKYGzx+xF2nTqbES+HcB19SOGlkus/58jV7cwPl1v
 QlRxPPUaUJUJ1WGwKW/IYAHZdJCvYRER9SznIsEwlh4tI1e2pcFPZyHDvVkpQtiTLZ8J
 z2VHgXLg97pdQZ8hc7Id1HqBlPuTtTP9Ten6v8Vfs8Tn3CRpaaGJ3fcUEUMoHC1CPuD8
 YaFg==
X-Gm-Message-State: AC+VfDycT888NK/WsK4gcCEN0l+ZSr8qi4/6EsIJs4mI8YoO5h3vfXgk
 +rIby8og7VmtOgjTnsElCaYj1/VyqY+jDAMeBJvx
X-Google-Smtp-Source: ACHHUZ5boVf27k0iS5jfVFPwokYp9Hw5Z8flmgxYi0TeT/CNKztyX3P6jG/zcmXClc1Sq25xkYFiyrh068Lne5GH+OA=
X-Received: by 2002:a05:690c:ed5:b0:565:34bb:9009 with SMTP id
 cs21-20020a05690c0ed500b0056534bb9009mr24254648ywb.16.1685567462010; Wed, 31
 May 2023 14:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230531110506.142951-1-gongruiqi@huaweicloud.com>
 <fe6a0f1e-6378-a4f2-f995-46799ed5248e@schaufler-ca.com>
In-Reply-To: <fe6a0f1e-6378-a4f2-f995-46799ed5248e@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 31 May 2023 17:10:51 -0400
Message-ID: <CAHC9VhQHUKXLejiMvETYE_PJz3cyHPF5z+T1ifUCD9ezMztcSQ@mail.gmail.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 31 May 2023 21:14:09 +0000
Subject: Re: [apparmor] [PATCH] LSM: Infrastructure management of the sock
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
Cc: Kees Cook <keescook@chromium.org>, Xiu Jianfeng <xiujianfeng@huawei.com>,
 selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>, apparmor@lists.ubuntu.com,
 "GONG, Ruiqi" <gongruiqi@huaweicloud.com>, James Morris <jmorris@namei.org>,
 linux-security-module@vger.kernel.org, Wang Weiyang <wangweiyang2@huawei.com>,
 gongruiqi1@huawei.com, Eric Paris <eparis@parisplace.org>,
 "Serge E . Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, May 31, 2023 at 10:00=E2=80=AFAM Casey Schaufler <casey@schaufler-c=
a.com> wrote:
> On 5/31/2023 4:05 AM, GONG, Ruiqi wrote:
> > As the security infrastructure has taken over the management of multipl=
e
> > *_security blobs that are accessed by multiple security modules, and
> > sk->sk_security shares the same situation, move its management out of
> > individual security modules and into the security infrastructure as
> > well. The infrastructure does the memory allocation, and each relavant
> > module uses its own share.
>
> Do you have a reason to make this change? The LSM infrastructure
> manages other security blobs to enable multiple concurrently active
> LSMs to use the blob. If only one LSM on a system can use the
> socket blob there's no reason to move the management.

I think an argument could be made for consistent handling of security
blobs, but with the LSM stacking work in development the argument for
merging this patch needs to be a lot stronger than just "consistency".

--=20
paul-moore.com


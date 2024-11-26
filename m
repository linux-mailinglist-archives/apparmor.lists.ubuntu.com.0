Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BE39D9BA0
	for <lists+apparmor@lfdr.de>; Tue, 26 Nov 2024 17:38:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tFyaB-0006Fu-D4; Tue, 26 Nov 2024 16:38:35 +0000
Received: from mail-yb1-f173.google.com ([209.85.219.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <simeddon@gmail.com>)
 id 1tFya9-0006FW-CE
 for apparmor@lists.ubuntu.com; Tue, 26 Nov 2024 16:38:33 +0000
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e388d8850d3so5663224276.3
 for <apparmor@lists.ubuntu.com>; Tue, 26 Nov 2024 08:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732639112; x=1733243912;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6vJi2VGs8+MLNHsBgobMIjMzwwtWnBRekU0CRZi1eUc=;
 b=BBNPst2XmBqY0xf4PJhtLkSezfrhbsI6ccvqtnHK+0kxitzZUx5om1w/r47GHurn4D
 g4rw7+yl8SXGrOwwLIIN6eHgftO9rg+W6eppm/nXdgekono3tvvSVzSmqYEmCY+u2IjA
 zVSWLvnHy+8dmi97Nk/V5PZTtycoJhk4Qh9pmdjcO4eaAEujBb6D2jNJV5AEqclt7wp+
 gvDp/pTuLzMvdLCHCCT89EQXzqXulwx6Xpisn/DbvRFeHfZW/5QvDX+JUlajfKVtmt4x
 keeebA/PAKs69tV4ghL0tpGZENgnufR2k17iycF6CYI8rqA6m53U43fPgcFo07vE+x+4
 PeeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA5TebjX4CM6E7pPrCpo8ZiRw86ud0IhdEgVXsyfuiKleW5AYLc8yu9+BzfNiROT9uLpP7O08GFg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzJmWUUrunV5OeOKr5dbI00ecvnHFW8xNUQzXdAzZcqBqPvN3Xi
 DSz+5bUjPdKejh/WuYrWqYpwmS3opMzODNg1NjCqF4Ab4LXMSKgs2rcEWLHkkSBRFMwUjaplTn1
 a4tCuW2XHokxONBI5S1EpzywgT5g=
X-Gm-Gg: ASbGncv9plxWRIXtLWP6GC9ORLySBylwbs1SAvK+LIx2FZiTc4RI4e8FbjgypgNUJ4C
 c3Mt9CJqDQ0WMR2861oZ7201fxfg=
X-Google-Smtp-Source: AGHT+IF+gSRbeeGUBWZQ7Y4zlCPWgAPUcHtfuFbA64hLbKzY54vdWAYBNXl112e6E+jvIsRRYOQBhW4Jh90127pNaog=
X-Received: by 2002:a05:6902:2085:b0:e33:1c9e:5cf2 with SMTP id
 3f1490d57ef6-e38f8bd3578mr14993240276.39.1732639111915; Tue, 26 Nov 2024
 08:38:31 -0800 (PST)
MIME-Version: 1.0
References: <20241002094940.55644-1-simeddon@gmail.com>
 <7989c006-abc6-446c-8b2c-dcb9acb9732f@canonical.com>
In-Reply-To: <7989c006-abc6-446c-8b2c-dcb9acb9732f@canonical.com>
From: Sid <simeddon@gmail.com>
Date: Tue, 26 Nov 2024 22:07:56 +0530
Message-ID: <CAGd6pzPso9kQRoS=4rVj2c3=4kxLWk5DJ3VfzH2cAxXz_y2SmQ@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.219.173; envelope-from=simeddon@gmail.com;
 helo=mail-yb1-f173.google.com
Subject: Re: [apparmor] [PATCH V2 RESEND] Docs: Update LSM/apparmor.rst
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
Cc: apparmor@lists.ubuntu.com, corbet@lwn.net, shuah@kernel.org,
 linux-doc@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sun, 10 Nov 2024 at 02:06, John Johansen <john.johansen@canonical.com> wrote:
> I have pulled this into my tree
Thanks for accepting my patch

Regards,
Siddharth Menon


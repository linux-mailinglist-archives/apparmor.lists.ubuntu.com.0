Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD93A0AD9B
	for <lists+apparmor@lfdr.de>; Mon, 13 Jan 2025 03:56:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tXAd7-0008AS-8t; Mon, 13 Jan 2025 02:56:41 +0000
Received: from mail-yb1-f181.google.com ([209.85.219.181])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1tXAd4-0008A6-Tx
 for apparmor@lists.ubuntu.com; Mon, 13 Jan 2025 02:56:39 +0000
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e53537d8feeso5552338276.0
 for <apparmor@lists.ubuntu.com>; Sun, 12 Jan 2025 18:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736736997; x=1737341797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C1iu4TmU/AZryZK4710MbhiDlwhEBApAQBoxuQB8Gbo=;
 b=NM/AtC9TwB0tm4cNWJQIN572Oc1NFPOiGjHQV/nQN1ChVRC0TRx2xlpSiiLDCmVNxC
 7VGyak/rwfi7L+w9olJ2VvUzzPW7UpOZHcfhjQKtu6xR4ZHuLK/sT8Xw+9QbiQZm5TK2
 W2cR7iz625YuRCscDLQfsutHbI/kBVVfwTncxR2z5St/Qn0PXvqbFjvp49FFKVhz1ILH
 B2t+cI0diz2Ys4IRRd+8v3tdSqEdmT6BZEfudgXtk1UhJteGlEmZnu02Y3tjW2cpuELw
 TuMG/TGVmxH+REQOEze4PJcY+1PeEjNorqtnE7TtkulQVEI2n2Nb/TgL60Bfy+zXJmoJ
 vvaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEtcbVMriKk4/6kvoYPtvxgbWjJRt/RNZZi3/S1SmnCRE4vDX1sIA8H3BPn+ykE86yEpGnBwia+g==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yw3H9w24XSjuYx8tyld0lbWriGcZDIvHBDkU922PYcz78XfUu31
 3uakSrmEg0Oc31RWX/ruxXJBqsBmfFWZU79AF0s9UsrTK5VvaGVkGuMtpss7VsFGjmMEObtJ6fJ
 npclbHsyLNVpWpgEWlP3T16egfhD7vSc/LLfF
X-Gm-Gg: ASbGncuv1/QMOSgBOvUYZ1GULDQSG3yd9zSztju5bzG58b85ld94qsf1fvasQTxUDp8
 Zaw+OqWWa8TmjGhSPsVDme31NfIOhpglapB+5
X-Google-Smtp-Source: AGHT+IFjS7DdRTcEdBRLB9UTOd3mDij4P3x6llwm89cu6gVhI47+WAfxD1vVcp4PpGcONy8Uv1dZysPvrHpMXqA9mNY=
X-Received: by 2002:a05:6902:15c4:b0:e3c:8b14:e7ce with SMTP id
 3f1490d57ef6-e54ee1f4a31mr14579604276.34.1736736997649; Sun, 12 Jan 2025
 18:56:37 -0800 (PST)
MIME-Version: 1.0
References: <20250111.22fc32ae0729@gnoack.org>
 <20250112072925.1774-1-tanyaagarwal25699@gmail.com>
 <CAHC9VhRbZLtBZ8dH-kASnkQUehG4Cu=zd23A6Jj9zfnyeGOTsA@mail.gmail.com>
 <3c73cee2-a4aa-4e85-bafd-d5571e857849@I-love.SAKURA.ne.jp>
In-Reply-To: <3c73cee2-a4aa-4e85-bafd-d5571e857849@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 12 Jan 2025 21:56:27 -0500
X-Gm-Features: AbW1kvbyZN2Ngdlc0r-2OxHSCbyV0tl9D8n5OSt5gTQRGL2HTVecrwUevJ2okxg
Message-ID: <CAHC9VhQxxwyDkXvN5S7XbbbJTk5-LN3MXteX+F+Bx0wTxujhow@mail.gmail.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.181; envelope-from=paul@paul-moore.com;
 helo=mail-yb1-f181.google.com
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
Cc: eric.snowberg@oracle.com, omosnace@redhat.com, dmitry.kasatkin@gmail.com,
 stephen.smalley.work@gmail.com, roberto.sassu@huawei.com, jmorris@namei.org,
 zohar@linux.ibm.com, Tanya Agarwal <tanyaagarwal25699@gmail.com>,
 mic@digikod.net, linux-security-module@vger.kernel.org, anupnewsmail@gmail.com,
 gnoack@google.com, skhan@linuxfoundation.org, linux-integrity@vger.kernel.org,
 takedakn@nttdata.co.jp, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sun, Jan 12, 2025 at 7:00=E2=80=AFPM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> On 2025/01/13 1:36, Paul Moore wrote:
> > Hi Tanya,
> >
> > Ideally this patchset would be split into into seperate, independent
> > patches, one for AppArmor, one for IMA/EVM, one for Landlock, one for
> > SELinux, one for Smack, and one for TOMOYO.
>
> I don't think we need to split this patchset into individual modules,
> especially because this patchset does not affect the result of kernel bui=
ld.
> We sometimes need to do "git bisect", and reducing number of commits help=
s
> saving building time and testing time for bisection.

Merge conflicts and spending time having to coordinate maintainer ACKs
is a real time cost.

Split the patch please.

--=20
paul-moore.com


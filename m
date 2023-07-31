Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id EA89C76A49C
	for <lists+apparmor@lfdr.de>; Tue,  1 Aug 2023 01:13:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qQc4S-0004D4-F8; Mon, 31 Jul 2023 23:13:00 +0000
Received: from mail-yb1-f179.google.com ([209.85.219.179])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <paul@paul-moore.com>) id 1qQc4Q-0004Cw-Cw
 for apparmor@lists.ubuntu.com; Mon, 31 Jul 2023 23:12:58 +0000
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-d0e55215aebso5456223276.1
 for <apparmor@lists.ubuntu.com>; Mon, 31 Jul 2023 16:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1690845177; x=1691449977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LIWQwaIJWW2AH6m7nJzzmwOP84vQW5rxfB4Hc5L4BUo=;
 b=IjJOcbHGcC4ZOac+W3yi7m60UCrSW/CzySpZnLwGp5cxE4iUUxa0SFEg+mufLIZ0Vh
 wc9+4lUF4qfV33FmDU2w5Wln53Ocg3R65paebn2djGEDOPeOKnCeq+RcCzNYCxcTGg4L
 oHF9U61NDgBeN+/1LQlJRVuJ/th1vSWqF/zEOZmNS9k51w96VLDQHtzIWQ3y6K5aSnb8
 n2CifxmjVDzWj61tnCVBvwOpgihQKHsXe4aCufmwdbJ2I3dFJF4rfENk/qbMzzm2OIz1
 DFJwNompym00u/FLtNjb0tzXvcdWrrmRM6AuUTsy4FPun7VgGc8c4NtxtIMwVEeHj23F
 sBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690845177; x=1691449977;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LIWQwaIJWW2AH6m7nJzzmwOP84vQW5rxfB4Hc5L4BUo=;
 b=W/0hTYcPKJ8VgCArPUOvGG7MUBih5cIZB6ZeCljYfHtxREogwGyF8icvBSkSwceILu
 HhqAyaj0CkyAQTBwbe+DD1wwRxc8hfPYNW3FLTSnTZcIGh10Y5kRwx98TnkDoIHxeQzi
 X81V0/5eXuV8Z4H/kzg+WWa0MDj9r6iDIlkKrZKPlsvqNVxaByccZp85TgHjg7oj2W1k
 o/ZqMVocEEPZeg0wjIjkeqB6iIaOUz2ADn5Ty2zRJH4uvCq8ArZT2GeEX78U1rOLQsYt
 O4/PNL2w50MTtLcNmF7vGID7jXd22G//OVVBoIsMRZymnTqZL7tzEdeOmcfgV8Qf3gaL
 lRGg==
X-Gm-Message-State: ABy/qLZyrxIAMfCw7kY2/0swxyRlmManPG8kN7wbJ27oJeI9EFPMVp8e
 6Vip0WqoQ9u+rps5DrwiWbx3JLulXaOz9x3yFGmM
X-Google-Smtp-Source: APBJJlFulKerGdHVB3knYAE6fgtR0BvCzLLl6dr1yYLVbIWyOkLfHwCDxaHBRpR9Gq2ObKDOrC/wkVpmt7gz1yn6o0Q=
X-Received: by 2002:a81:608b:0:b0:569:e7cb:cd4e with SMTP id
 u133-20020a81608b000000b00569e7cbcd4emr11274976ywb.48.1690845177332; Mon, 31
 Jul 2023 16:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690786466.git.kamrankhadijadj@gmail.com>
 <7fd5ea487559760818af96f7c1f2c25bec515049.1690786467.git.kamrankhadijadj@gmail.com>
 <ZMfpGXM5LlDdrENi@aschofie-mobl2>
In-Reply-To: <ZMfpGXM5LlDdrENi@aschofie-mobl2>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 31 Jul 2023 19:12:46 -0400
Message-ID: <CAHC9VhQiZG4+t7LGS2JKuArAWifNLTK39v1h+sjhpwS04QGVDA@mail.gmail.com>
To: Alison Schofield <alison.schofield@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH 1/2] lsm: change 'target' parameter to
 'const' in security_capget LSM hook
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
Cc: selinux@vger.kernel.org, stephen.smalley.work@gmail.com,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org,
 Khadija Kamran <kamrankhadijadj@gmail.com>, eparis@parisplace.org,
 ztarkhani@microsoft.com, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, Jul 31, 2023 at 1:02=E2=80=AFPM Alison Schofield
<alison.schofield@intel.com> wrote:
> On Mon, Jul 31, 2023 at 12:07:31PM +0500, Khadija Kamran wrote:
> > Three LSMs register the implementations for the "capget" hook: AppArmor=
,
> > SELinux, and the normal capability code. Looking at the function
> > implementations we may observe that the first parameter "target" is not
> > changing.
> >
> > Mark the first argument "target" of LSM hook security_capget(...) as
> > "const" since it will not be changing in the LSM hook.
>
>
> The commit message may be simplified, from this:
> [PATCH 1/2] lsm: change 'target' parameter to 'const' in security_capget =
LSM hook
>
> to something like this:
> [PATCH 1/2] lsm: Constify the target parameter in security_capget()
>
> "Constify" is the commonly used language in git logs.
> See git log --pretty=3Doneline --abbrev-commit | grep Constify

I'm not overly worried about the subject line; yes, Allison's
suggestion is an improvement, but the original is okay.  However, I
would like to see patches 1/2 and 2/2 squashed together into a single
patch.  If patch 1/2 hadn't already touched the function declaration
line that was too long there may have been an argument for keeping the
patchset as two patches, but since patch 1/2 does modify the function
declaration we might as well wrap that declaration line in that patch
too.

--
paul-moore.com


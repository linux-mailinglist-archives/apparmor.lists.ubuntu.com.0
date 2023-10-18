Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BADF77CE9AA
	for <lists+apparmor@lfdr.de>; Wed, 18 Oct 2023 23:01:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qtDfI-0001Xi-P9; Wed, 18 Oct 2023 21:01:16 +0000
Received: from mail-yb1-f176.google.com ([209.85.219.176])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1qtDfB-0001XP-Dm
 for apparmor@lists.ubuntu.com; Wed, 18 Oct 2023 21:01:09 +0000
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-d9a4c0d89f7so8524845276.1
 for <apparmor@lists.ubuntu.com>; Wed, 18 Oct 2023 14:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697662868; x=1698267668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MYXqAsbDi3AzucY0bCRg3cr8J2sflQDP75mtfuQhHRw=;
 b=wk45Fof/gawfeEgSRQ4BNpkNhwDE96I/H4eFAT7hmPqIAgqnq3DAYEbRGxIpg6HaHR
 nXxTbRBsRLAJQbCWJD64xISiYZP4vtEhDQAtKzUJpHbEqPbi9umGK7+36fTTIWmE8Ral
 /062+pg6qodJxbyYSFPat0vQFoOTm8XPsAWYmTWwGqQHIL+1ZARl6DmyngVZthiUTCQE
 HKd/OVtj3R2JnHuoM820bPnVoW8VQa3xDYc+L0yYREExWOhopFVmoOxYaTZ+1JUk2ciW
 XycbQEnczxarUpb5TezFIOpiFPeOeXgKMqlNNHqZ59gCLj0ynegsz162S91H5pbrwUmn
 FBGg==
X-Gm-Message-State: AOJu0YzcvBFv3Iecgh42LcE623gwrvdAL62p4SgNmDizwt9c090ApnUp
 j/eMeaF8eX64AnWh+USTKt4taAlEK3KEGb6UzbgSA3kWEFrtCCg=
X-Google-Smtp-Source: AGHT+IF1b55IhBbDn49IIjzbpXWSvhQXGlj5HU3gwePoV260AYV5B9HuW+0+GaRXNuhzh0NEN49RMRCtco7xjBe3XtI=
X-Received: by 2002:a25:cf0d:0:b0:d9a:4645:abff with SMTP id
 f13-20020a25cf0d000000b00d9a4645abffmr613343ybg.62.1697662868291; Wed, 18 Oct
 2023 14:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAOTMNwuhq9Fc1PW4Y6ZOyP8H7nCk3+9gsxRapRuScZ2-a+14hA@mail.gmail.com>
 <668dd928-b00d-4f7a-5e6a-b6efc6a9c08f@canonical.com>
 <CAHC9VhSQ2U0jhW5Goa+OTTPtx64viGjFWFJy7Y7CsetOaWs6jg@mail.gmail.com>
 <CAOTMNwsca-CuzOdmc5HeUCtBGWJVKb2GB_r1QEF-TnJv1Kkhyg@mail.gmail.com>
 <CAHC9VhQNTiX=na2a1QsAQWwPfjuvd2xnFGHAPxTs=wQXNt6eZg@mail.gmail.com>
 <6da3d0b6-aaae-4586-bd71-749d6fb38708@canonical.com>
 <CAHC9VhToqz-hs8vuUhd=vNKOXNc_iXOAbtuVTNGWJUvbbzq_kQ@mail.gmail.com>
 <CAHC9VhQyb_SfA0_=fqrVLZjYj76gLzwnf2Gs3j73FRVD-0vGeg@mail.gmail.com>
 <740fe39c-dab5-4ec9-b717-f5168e689985@canonical.com>
 <CAHC9VhQTbTkQzCdicPtj7WfEhJgmkX=zxPNu9cGVmHhbbzBzcg@mail.gmail.com>
In-Reply-To: <CAHC9VhQTbTkQzCdicPtj7WfEhJgmkX=zxPNu9cGVmHhbbzBzcg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 18 Oct 2023 17:00:57 -0400
Message-ID: <CAHC9VhQ_i0TnA+Snsg-gsPEEb=uHyiNKDm48jmiuRc7y1-Gd=Q@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] AppArmor kernel audit locks up system
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
Cc: audit@vger.kernel.org, apparmor@lists.ubuntu.com,
 Andreas Steinmetz <anstein99@googlemail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Oct 18, 2023 at 4:50=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
> It shouldn't, the only time we ever really operate on something other
> than @current is when a fork/clone happens and we are filtering on the
> new child process.  At least that used to be the case, I can't imagine
> someone would audit something other than @current (not sure you could
> with respect to this stuff?), but I guess it couldn't hurt to double
> check on the current code base.

Yes, that still looks to be the case.

--=20
paul-moore.com


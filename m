Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FD87BE758
	for <lists+apparmor@lfdr.de>; Mon,  9 Oct 2023 19:07:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qptiV-0004DN-C9; Mon, 09 Oct 2023 17:06:51 +0000
Received: from mail-yw1-f180.google.com ([209.85.128.180])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1qptiM-0004Cv-OR
 for apparmor@lists.ubuntu.com; Mon, 09 Oct 2023 17:06:43 +0000
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-5a7ac4c3666so5540477b3.3
 for <apparmor@lists.ubuntu.com>; Mon, 09 Oct 2023 10:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696871201; x=1697476001;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XmBGAJnoCJZMD5YkqMwKQjBZ8gmjJXPMwQU2it649Nk=;
 b=ncmhGOd4xAdyP3OAt0K9XHo8EqlUEJklymdx7FKQyDOKSXuusVvdybBbduSAGhGcpT
 s490hTaR93+SroaN4yvctlYfFHMQX20WiD+YBmPyJ1RB04tE3DQ+1JoIukrgcv+lBSLn
 KCIj+WkacQ7aRul57GZax+ectVIbVXFdpp5XhbgDzY3jAd8Y7pByFWmo8n+dcQ3rEEPH
 q8X6lZnsAYi8f2WmR7A0OB+egSrGCybnwMsvrB7bjw3jdGdtCHad0jUhln1lefC+zjCT
 /i/sJFNee2O1XZ2sMcIGoO6o6GAxR33FrjMUgA/duXmgeBAJ6Oms2WVqTHrntdVi7kHx
 Q0jA==
X-Gm-Message-State: AOJu0YwRj0C3ykJljV4H/2hTgqQh6gcPl+EVC5oU5KcPiQNFjUVITGKc
 m47UatgWU3/nlQGosgZge1bN3QR8nKODN8AfR7Qx
X-Google-Smtp-Source: AGHT+IE5PKJos/UIw4ogaiRRWK6MhbP/Qvn+9ULjQlKUUqbiBU7ekAkM+Ke/DdukZv5OnKha5fea9lOzZBCehUKdX4k=
X-Received: by 2002:a25:9703:0:b0:d9a:3bf2:54a6 with SMTP id
 d3-20020a259703000000b00d9a3bf254a6mr1067676ybo.46.1696871201413; Mon, 09 Oct
 2023 10:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAOTMNwuhq9Fc1PW4Y6ZOyP8H7nCk3+9gsxRapRuScZ2-a+14hA@mail.gmail.com>
 <668dd928-b00d-4f7a-5e6a-b6efc6a9c08f@canonical.com>
 <CAHC9VhSQ2U0jhW5Goa+OTTPtx64viGjFWFJy7Y7CsetOaWs6jg@mail.gmail.com>
 <CAOTMNwsca-CuzOdmc5HeUCtBGWJVKb2GB_r1QEF-TnJv1Kkhyg@mail.gmail.com>
In-Reply-To: <CAOTMNwsca-CuzOdmc5HeUCtBGWJVKb2GB_r1QEF-TnJv1Kkhyg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Oct 2023 13:06:30 -0400
Message-ID: <CAHC9VhQNTiX=na2a1QsAQWwPfjuvd2xnFGHAPxTs=wQXNt6eZg@mail.gmail.com>
To: Andreas Steinmetz <anstein99@googlemail.com>
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
Cc: audit@vger.kernel.org, apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, Oct 9, 2023 at 2:40=E2=80=AFAM Andreas Steinmetz
<anstein99@googlemail.com> wrote:
> On Sat, Oct 7, 2023 at 12:07=E2=80=AFAM Paul Moore <paul@paul-moore.com> =
wrote:
> >
> > Does anyone else have any bright ideas or crazy thoughts on this?
> >
>
> Well, not really an idea and for sure either crazy or dumb:
>
> Why not use the data already available from DEFINE_AUDIT_DATA() to
> determine the call path (or add a modifiable field to the struct) and
> handle locking accordingly?

It's possible I'm missing something as I'm not very familiar with the
AppArmor details, but I'm not sure how this would solve the problem;
can you elaborate on this?

> Anyway, this problem can be seen as a DoS vector. Any malicious code
> could trigger some audit causing a system lockup. So however ugly the
> solution this needs to be solved.

I don't think anyone is objecting to resolving this, it's more a
matter of *how* we can resolve it.

--=20
paul-moore.com


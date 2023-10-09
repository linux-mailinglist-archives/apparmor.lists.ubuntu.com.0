Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C01897BE641
	for <lists+apparmor@lfdr.de>; Mon,  9 Oct 2023 18:23:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qpt1u-0000Yt-Nm; Mon, 09 Oct 2023 16:22:50 +0000
Received: from mail-qk1-f169.google.com ([209.85.222.169])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <anstein99@googlemail.com>)
 id 1qpjvw-000839-Q1
 for apparmor@lists.ubuntu.com; Mon, 09 Oct 2023 06:40:09 +0000
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-77574dec71bso282838685a.2
 for <apparmor@lists.ubuntu.com>; Sun, 08 Oct 2023 23:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696833603; x=1697438403;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LYs39h2lhFi7LbUTeSxWbxj8l2RGyZpAouEnC3PVDOU=;
 b=BGCbUYd/dN2D40hAzrRxv7b6Vpl2mz2abSwEC+lrUJvrqv9WYVWgK+boEB4+iB0Kig
 85OGGdLBcbiVAhMV26KVkU4aC9GR1X3vvMvguXUt/n7QtH/4h10in0c8JFbM609r3iMx
 oZkcXt+7Z9gVX3K0LAC2FvYcgflomYmFwB6BjrftYnKI6mMx9+WU9cLLFs3dkCytaEE4
 bex4JliRG4rLRRccnly7wSJdV0edtfX0WOqIG2A7/9rYD/W3AHRXVhxewRwiNWlXEE48
 E2yo/lcPL1nFpUHK3lG+jX7CASu/hZ74ng9EkFvkZThhu51dPZxSWZODnkDEecAhdgO8
 UfNg==
X-Gm-Message-State: AOJu0Yz8EBmI+Y8HZ8Y9fvlcc4snVIMXckFYHu3ZfWmAe4h1HyaJog7D
 +iIwhYwYJFPbAgbHytU1MZbmqkckq1gUh9mYpVE=
X-Google-Smtp-Source: AGHT+IE7HBxVWoUrBwss3vbYcO50HuTN5F1bO6E4+Ef1lpkpfJEKmmW5RLABBviYVYgUMwx24jCDskNCqwzRyEQSJCw=
X-Received: by 2002:a0c:b3cf:0:b0:659:71ac:84df with SMTP id
 b15-20020a0cb3cf000000b0065971ac84dfmr13410053qvf.26.1696833603098; Sun, 08
 Oct 2023 23:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAOTMNwuhq9Fc1PW4Y6ZOyP8H7nCk3+9gsxRapRuScZ2-a+14hA@mail.gmail.com>
 <668dd928-b00d-4f7a-5e6a-b6efc6a9c08f@canonical.com>
 <CAHC9VhSQ2U0jhW5Goa+OTTPtx64viGjFWFJy7Y7CsetOaWs6jg@mail.gmail.com>
In-Reply-To: <CAHC9VhSQ2U0jhW5Goa+OTTPtx64viGjFWFJy7Y7CsetOaWs6jg@mail.gmail.com>
From: Andreas Steinmetz <anstein99@googlemail.com>
Date: Mon, 9 Oct 2023 06:39:51 +0000
Message-ID: <CAOTMNwsca-CuzOdmc5HeUCtBGWJVKb2GB_r1QEF-TnJv1Kkhyg@mail.gmail.com>
To: Paul Moore <paul@paul-moore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.222.169;
 envelope-from=anstein99@googlemail.com; helo=mail-qk1-f169.google.com
X-Mailman-Approved-At: Mon, 09 Oct 2023 16:22:47 +0000
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

On Sat, Oct 7, 2023 at 12:07=E2=80=AFAM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> Does anyone else have any bright ideas or crazy thoughts on this?
>

Well, not really an idea and for sure either crazy or dumb:

Why not use the data already available from DEFINE_AUDIT_DATA() to
determine the call path (or add a modifiable field to the struct) and
handle locking accordingly?

Anyway, this problem can be seen as a DoS vector. Any malicious code
could trigger some audit causing a system lockup. So however ugly the
solution this needs to be solved.


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E76F9EB766
	for <lists+apparmor@lfdr.de>; Tue, 10 Dec 2024 18:04:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tL3ex-0006BT-FL; Tue, 10 Dec 2024 17:04:31 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tL3ew-0006BI-6i
 for apparmor@lists.ubuntu.com; Tue, 10 Dec 2024 17:04:30 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A32923F175
 for <apparmor@lists.ubuntu.com>; Tue, 10 Dec 2024 17:04:29 +0000 (UTC)
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5d3e77fd3b3so4009754a12.0
 for <apparmor@lists.ubuntu.com>; Tue, 10 Dec 2024 09:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733850269; x=1734455069;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7VKOA/rUufUituspWX0M+cCSC8NpFaIgcBP123kxieA=;
 b=oTjaILRxmQWeI9jqGJZTWqRbTDW+5y5v354kbW+ZP/9afK+ynoMDtu33UE9Pfn1ua0
 ApTRB4A8Q1cFFv3xOr3akd5PHfV0D1XJ6BJEFDTBiUzKs26eB+NhxDE706rdOgId+8do
 9lXRtHEOmx/nvpgffuyfik79sJyS7ioS3l0Q66vJ86RgVz4fxD4bVfzS86LoaorhJnqm
 sk/l7YlA59XjtRd22DATnb3tC3pgXlkLefwKxtKtZydQSDFUhnchPAMg5JEyFmhbqtJO
 NCyx1d+EKzkOE05tQCTb1Czj4XdCkrNHMsq+xQ/x99qtMz3UclBPXkGNL+UnY0I/ti1t
 zCug==
X-Gm-Message-State: AOJu0Ywez6X3X4c+A+Ix7KXQp+2skJMGGA32j0lclsWn1oGUhOLbyT0r
 rDFYoru3WPWxxJCY6mZv+ZlCiuO2NEGTrkhKrQYSvLD74pDuad64UZJ5vN8f2eLzmWmTa63jvom
 4p6O1Dy9WEHDgQKjLSKsArCe6a2R0D/fazTB4BDJwFLriSxnlT3AqL+xgYM1iGqkS1cneZKcYs7
 L3VWXP7r2RI6Lbtb0oilqEhVK8gi9cRz7nLYlz5wS6cukhwTTr
X-Gm-Gg: ASbGncs6lfCw46VynVjrTJtO5e7+b0amZoDmA/h83lwzhgovxymKSVawKkknFIWGtI6
 qKzmIjy/Yb/OxBj8mF+SXXHO4VE/P8W8n6g==
X-Received: by 2002:a17:906:b384:b0:aa6:7107:db00 with SMTP id
 a640c23a62f3a-aa69ce89e23mr422068066b.50.1733850268899; 
 Tue, 10 Dec 2024 09:04:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGaV1m6fRtFri3WQrFnFXPDqObDQwFpOdlEvJnUHjuFnfCcuuijBtlu4yMcHdiGqIR2mwrT6VhpfibmBGyqwtY=
X-Received: by 2002:a17:906:b384:b0:aa6:7107:db00 with SMTP id
 a640c23a62f3a-aa69ce89e23mr422061466b.50.1733850268145; Tue, 10 Dec 2024
 09:04:28 -0800 (PST)
MIME-Version: 1.0
References: <9b83fbff-26df-45f9-b26b-abfb1da5f438@canonical.com>
In-Reply-To: <9b83fbff-26df-45f9-b26b-abfb1da5f438@canonical.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Tue, 10 Dec 2024 09:04:17 -0800
Message-ID: <CAKCV-6tzZ99-39CwMdR=JkNaqs_E7woO324kxw9Kc3NOGmQFBA@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] irc meeting Tues Dec 10 Postpone
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
Cc: apparmor <apparmor@lists.ubuntu.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Due to a soft scheduling conflict I would prefer the December 17th
date, although I would still be able to make it to a December 11th
meeting.

On Tue, Dec 10, 2024 at 1:42=E2=80=AFAM John Johansen
<john.johansen@canonical.com> wrote:
>
> The next irc meeting planned for Tuesday Dec 10, at 18:00 UTC in #apparmo=
r on oftc.net is postponed, to either: Wednesday Dec 11 if no objections ar=
e raised, or if objections raised to Tuesday Dec 17. A follow-up email late=
r today will confirm which it will be
>
> Please update the agenda https://gitlab.com/apparmor/apparmor/wikis/Meeti=
ngAgenda or reply to this mail if you have items you want to add
>
>
>
>
>
>
>
>


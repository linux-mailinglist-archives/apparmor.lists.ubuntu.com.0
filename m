Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id A24897AD34D
	for <lists+apparmor@lfdr.de>; Mon, 25 Sep 2023 10:28:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qkgwg-0000GO-8J; Mon, 25 Sep 2023 08:27:58 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mjguzik@gmail.com>) id 1qjnYZ-0004Ew-Pw
 for apparmor@lists.ubuntu.com; Fri, 22 Sep 2023 21:19:23 +0000
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3aca0934e74so1588418b6e.0
 for <apparmor@lists.ubuntu.com>; Fri, 22 Sep 2023 14:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695417562; x=1696022362;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=33plBw2S6RxLVTFtd8vbQkwkLM7hKUemGtBycCXA6jA=;
 b=CQgABBVung8acdk1WHsnt0N6qu6TR9tuuk6UAGKxijhq40k//icjZeH35kS9+f2vqB
 CBsNwCC0lBDqoUac5Ridczd3awobhY6qJPQRg7PlTlahqD39kndGM5elW7WIYgvSfsVJ
 5X/Js7crfXh5K4r+MPQchEAi0DnwJnhpoWrL7tdwdjVmpL74E07hYpw76L26z6OPen3B
 XXWMjgMIvcjHp4zXZRsH+C0H2e1v/toE5ySP6ZC2BxH2pe4CWKODwoBWFW5Pe69DO2Y1
 Jq/x95SVNP8x8lXHM+qT17v9+f+SotzTWCEWvEVY/3Ocr0SzQTSm3aj7hfmxyJvOuil+
 y9aw==
X-Gm-Message-State: AOJu0YyoSCjY3xWCqFeMKt5gw0oT40hlSPPGpgCoIGCQHPA93WDgWyaI
 KSPcr7RB++nU/YxHDVXpUJBEeXSQr5421IRHjEM=
X-Google-Smtp-Source: AGHT+IEYL77hJxK6Usm7w5Mx7ub+ceAqRbev1H58TlAkTLpno6EgQQCAoipS/BPBlCKgfN735T3QADZuX7LDc0xvryo=
X-Received: by 2002:aca:2101:0:b0:3a7:4802:c3f with SMTP id
 1-20020aca2101000000b003a748020c3fmr821282oiz.52.1695417562384; Fri, 22 Sep
 2023 14:19:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:5dc9:0:b0:4f0:1250:dd51 with HTTP; Fri, 22 Sep 2023
 14:19:21 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 22 Sep 2023 23:19:21 +0200
Message-ID: <CAGudoHFfG7mARwSqcoLNwV81-KX4Bici5FQHjoNG4f9m83oLyg@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.167.175; envelope-from=mjguzik@gmail.com;
 helo=mail-oi1-f175.google.com
X-Mailman-Approved-At: Mon, 25 Sep 2023 08:27:55 +0000
Subject: [apparmor] use per-cpu refcounts for apparmor labels?
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

I'm sanity-checking perf in various microbenchmarks and I found
apparmor to be the main bottleneck in some of them.

For example: will-it-scale open1_processes -t 16, top of the profile:
  20.17%  [kernel]                   [k] apparmor_file_alloc_security
  20.08%  [kernel]                   [k] apparmor_file_open
  20.05%  [kernel]                   [k] apparmor_file_free_security
  18.39%  [kernel]                   [k] apparmor_current_getsecid_subj
[snip]

This serializes on refing/unrefing apparmor objs, sounds like a great
candidate for per-cpu refcounting instead (I'm assuming they are
expected to be long-lived).

I would hack it up myself, but I failed to find a clear spot to switch
back from per-cpu to centalized operation and don't want to put
serious effort into it.

Can you sort this out?

Thanks,
-- 
Mateusz Guzik <mjguzik gmail.com>


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD3B7B027A
	for <lists+apparmor@lfdr.de>; Wed, 27 Sep 2023 13:10:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qlSRF-0005BN-NA; Wed, 27 Sep 2023 11:10:41 +0000
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mjguzik@gmail.com>) id 1ql1in-00070U-Mj
 for apparmor@lists.ubuntu.com; Tue, 26 Sep 2023 06:39:02 +0000
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2c124adf469so135649591fa.0
 for <apparmor@lists.ubuntu.com>; Mon, 25 Sep 2023 23:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695710340; x=1696315140;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xOK6OfHsH5UzXX07PzrwQsARRjCcdnyHQS4dDua03nw=;
 b=uZQ4n9WG4Bb9kpeP/HCjtZ/fcXyDBZBk5uNT04QcIctVBmoJpQL2AWhsZmrER3ayVx
 BV2kgkI5o3j62t4+NGduYjFk3e8d8/ft2NdfFohEXiNOyDE9gFxYnoot6AfELRDs0a1R
 Gv9GBfMo8lhrWu076fWRLnKrG4OIeKnO7imKw3ARmLGKlNXgAEe1BqhjrngLnilbS3HI
 5Dk96MY7YUC+VOoAKXVfoBwV8Fi8utwVSal6vTc4MT8VrrjwP1AvC2vxagLcPzgTwD9b
 xgNKxDJpIpnBvNASOtU57PFtPjo6N38Zf2kQ1T0lOXQfV6TgQvR/XijYq9pSp/jRivk0
 nQqA==
X-Gm-Message-State: AOJu0YzjxS9vY/z66ySUHVMQo0rmXLRPEWyaLF0sWKm7iPzEiyLcykw7
 DYCtRLMZbhWZfakf4W9/RnM=
X-Google-Smtp-Source: AGHT+IEZbAEvu9lgt5JJh/Z2GjloOrBpRgTUgnNCYG3KavjqfNt/qHcgljINrUwUMAXGwze8s6FBiQ==
X-Received: by 2002:a2e:97c8:0:b0:2bc:e954:4203 with SMTP id
 m8-20020a2e97c8000000b002bce9544203mr7159098ljj.26.1695710340426; 
 Mon, 25 Sep 2023 23:39:00 -0700 (PDT)
Received: from f (cst-prg-24-34.cust.vodafone.cz. [46.135.24.34])
 by smtp.gmail.com with ESMTPSA id
 lw3-20020a170906bcc300b009ade1a4f795sm7244603ejb.168.2023.09.25.23.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 23:38:59 -0700 (PDT)
Date: Tue, 26 Sep 2023 08:38:57 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <20230926063857.h3afce5hagnlkoob@f>
References: <CAGudoHFfG7mARwSqcoLNwV81-KX4Bici5FQHjoNG4f9m83oLyg@mail.gmail.com>
 <87a5t9bypm.fsf@intel.com>
 <c6379a39-42f2-b3f9-c835-bbebe516ba3a@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c6379a39-42f2-b3f9-c835-bbebe516ba3a@canonical.com>
Received-SPF: pass client-ip=209.85.208.174; envelope-from=mjguzik@gmail.com;
 helo=mail-lj1-f174.google.com
X-Mailman-Approved-At: Wed, 27 Sep 2023 11:10:31 +0000
Subject: Re: [apparmor] use per-cpu refcounts for apparmor labels?
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

On Mon, Sep 25, 2023 at 11:21:26PM -0700, John Johansen wrote:
> On 9/25/23 16:49, Vinicius Costa Gomes wrote:
> > Hi Mateusz,
> > 
> > Mateusz Guzik <mjguzik@gmail.com> writes:
> > 
> > > I'm sanity-checking perf in various microbenchmarks and I found
> > > apparmor to be the main bottleneck in some of them.
> > > 
> > > For example: will-it-scale open1_processes -t 16, top of the profile:
> > >    20.17%  [kernel]                   [k] apparmor_file_alloc_security
> > >    20.08%  [kernel]                   [k] apparmor_file_open
> > >    20.05%  [kernel]                   [k] apparmor_file_free_security
> > >    18.39%  [kernel]                   [k] apparmor_current_getsecid_subj
> > > [snip]
> > > 
> > > This serializes on refing/unrefing apparmor objs, sounds like a great
> > > candidate for per-cpu refcounting instead (I'm assuming they are
> > > expected to be long-lived).
> > > 
> > > I would hack it up myself, but I failed to find a clear spot to switch
> > > back from per-cpu to centalized operation and don't want to put
> > > serious effort into it.
> > > 
> > > Can you sort this out?
> > 
> 
> I will add looking into it on the todo list. Its going to have to come
> after some other major cleanups land, and I am not sure we can make
> the semantic work well for some of these. For other we might get away
> with switching to a critical section like Vinicius's patch has done
> for apparmor_current_getsecid_subj.
> 

Is there an eta?

I looked at dodging ref round trips myself, but then found that ref
manipulation in apparmor_file_alloc_security and the free counterpart
cannot be avoided. Thus per-cpu refs instead.

Perhaps making the label as stale would be a good enough switching
point? Is it *guaranteed* to get labelled as stale before it gets freed?

btw, __aa_proxy_redirect open-codes setting the flag.

> > I was looking at this same workload, and proposed a patch[1] some time
> > ago, see if it helps:
> > 
> > https://lists.ubuntu.com/archives/apparmor/2023-August/012914.html
> > 
> > But my idea was different, in many cases, we are looking at the label
> > associated with the current task, and there's no need to take the
> > refcount.
> > 
> 
> yes, and thanks for that.
> 


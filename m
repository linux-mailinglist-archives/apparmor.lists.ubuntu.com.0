Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0614C718A17
	for <lists+apparmor@lfdr.de>; Wed, 31 May 2023 21:24:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q4RQD-0000xm-0b; Wed, 31 May 2023 19:23:49 +0000
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <keescook@chromium.org>) id 1q4RQA-0000xf-Us
 for apparmor@lists.ubuntu.com; Wed, 31 May 2023 19:23:47 +0000
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-64d2c865e4eso112541b3a.0
 for <apparmor@lists.ubuntu.com>; Wed, 31 May 2023 12:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685561025; x=1688153025;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=li1rLK9XujeX0q5u14Qp5sO7HKgYaV/K5LyQO1RXxac=;
 b=fbPzdDPXelC0pn8nvQrSsUn3ouI3Mw6fmXmeONg0gi5YJEK+03UFY8G6Zb5Ntfek7u
 oCTHtY3cgTjnDD8ceChY5p5ACghTa0z7m8el2XFecNk8ageNHdtZUEBijdcXaWKEuV52
 qrfkGj6KkkQZ1fa87fyCFIqLCW9KCffsGVwfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685561025; x=1688153025;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=li1rLK9XujeX0q5u14Qp5sO7HKgYaV/K5LyQO1RXxac=;
 b=N6dsCNg6KFvvYwHJQNciF/TQctKKEitEmv6WcjcJ+m7qzbR2dTdARsK8bm4lkNnOEW
 oDd+I8eagvqBvwi6p9hZwhu+cLNRx63/3Gio+CKXx6FJhPxw7egBSeDJ/KLct4uVq2/A
 vaz0Bdo4R7NmmzQfhKv0hkqVcLHMLkA6HKbFss60wb0jzHhX1RASwyjgVGfDFaQJx+kT
 /gannFRfwr9Kc+b1kGO+hwem7xP2MAGDVIAuWAPCXl8ALg7EE6VS4LYnEGxDzZY72xQe
 QyjPOTPqcjbhan7yHj+2STkBWdM/PnbtSEUcJB0kptnnwFqhhFKTD/sKifyxD2TzGLy2
 XQJw==
X-Gm-Message-State: AC+VfDx1TBSQ57L95sgyTYiyPMGoSWtqO/tN+5eqHJg9m087D89E+0KA
 9bQKWSBj/1KeA1ZRTCb5D7WArA==
X-Google-Smtp-Source: ACHHUZ64HtRLdEcItCsHCYLoBTWTd80K7TF+1H9OHEneqdniae1bp3EZhfltYbgJ92K9NbZJaNV7kQ==
X-Received: by 2002:a05:6a00:21cf:b0:64d:7225:cfff with SMTP id
 t15-20020a056a0021cf00b0064d7225cfffmr6860176pfj.8.1685561025193; 
 Wed, 31 May 2023 12:23:45 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 j8-20020a62e908000000b0064f97ff4506sm3093355pfh.68.2023.05.31.12.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 12:23:44 -0700 (PDT)
Date: Wed, 31 May 2023 12:23:43 -0700
From: Kees Cook <keescook@chromium.org>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <202305311223.5912EDF4@keescook>
References: <20230511213441.never.401-kees@kernel.org>
 <7085879d-4d21-b90a-c08d-60450d1c7d38@canonical.com>
 <202305301555.102E1890@keescook>
 <1f35dbba-9344-75c5-e870-31bc3198dbe0@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f35dbba-9344-75c5-e870-31bc3198dbe0@canonical.com>
Subject: Re: [apparmor] [PATCH] apparmor: aa_buffer: Convert 1-element array
 to flexible array
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
Cc: Paul Moore <paul@paul-moore.com>, linux-kernel@vger.kernel.org,
 apparmor@lists.ubuntu.com, James Morris <jmorris@namei.org>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 linux-security-module@vger.kernel.org, linux-hardening@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, May 31, 2023 at 05:21:40AM -0700, John Johansen wrote:
> On 5/30/23 15:55, Kees Cook wrote:
> > On Thu, May 11, 2023 at 02:48:29PM -0700, John Johansen wrote:
> > > On 5/11/23 14:34, Kees Cook wrote:
> > > > In the ongoing effort to convert all fake flexible arrays to proper
> > > > flexible arrays, replace aa_buffer's 1-element "buffer" member with a
> > > > flexible array.
> > > > 
> > > > Cc: John Johansen <john.johansen@canonical.com>
> > > > Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
> > > > Cc: Paul Moore <paul@paul-moore.com>
> > > > Cc: James Morris <jmorris@namei.org>
> > > > Cc: "Serge E. Hallyn" <serge@hallyn.com>
> > > > Cc: apparmor@lists.ubuntu.com
> > > > Cc: linux-security-module@vger.kernel.org
> > > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > 
> > > Acked-by: John Johansen <john.johansen@canonical.com>
> > > 
> > > I have pulled this into my tree.
> > 
> > Just a quick ping: I haven't seen this show up in -next yet...
> > 
> 
> oop, sorry looks like I didn't push, it should be fixed now

Awesome; thanks!

-- 
Kees Cook


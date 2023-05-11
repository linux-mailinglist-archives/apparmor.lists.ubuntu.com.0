Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1776FFC1F
	for <lists+apparmor@lfdr.de>; Thu, 11 May 2023 23:55:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pxEFi-0000mM-6H; Thu, 11 May 2023 21:55:10 +0000
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <keescook@chromium.org>) id 1pxEFg-0000mF-8Z
 for apparmor@lists.ubuntu.com; Thu, 11 May 2023 21:55:08 +0000
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-643bb9cdd6eso6826196b3a.1
 for <apparmor@lists.ubuntu.com>; Thu, 11 May 2023 14:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683842106; x=1686434106;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wYm5zbUoXvdWIIZXy8x+n7jNjexrKMjFs8iZueww7nk=;
 b=oXs2eM/yvZexnnpdmxfsrd7zRsaq3g2sJh2MHT1oELeZFpkKjkBEJIkOJR/jDAePzC
 9fHDcwvGL0LoPfoexCswVshOQpWmlVqekET0XPyMhlHP/duuOOuBDgXwALhf2SjKEzpx
 jDBoIlxvTPtHLtaMU2EMRkiDNW3SlWHc6guPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683842106; x=1686434106;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wYm5zbUoXvdWIIZXy8x+n7jNjexrKMjFs8iZueww7nk=;
 b=DQAEyXJQbs7sQqpBfs4w2ZGERHA2XZZJbFSC+Xq9ye59+DZ2BCJB6AwazQ3O1kOIJy
 UyiiBA2DJmakB9H0bo//7uOqEvhgnNmEV+1dRwrs1+MIFw9/orHk4ZHXxfZqpz94MXg+
 7CTYM0ALdLgJ3BzF9gXNyS2QptH1zsEyl8CSrfZnlMyEbXZ9alqzcRC08eUWBQXN2fkR
 PMPcva56kEwC2Zw0u1VWpRAp8VAsx5OXPVBq+idESCVuCn1rJqPYX6+3tzVQDzr6PTzc
 eRd5oEReD4XGqeoEAPcKEg0d6kjf/4O8kfSp3f8AcfZ6ve0PcgpqguZxxf4teQwadzlB
 qihg==
X-Gm-Message-State: AC+VfDwenbI148m2KFQbOE4GKyu59jz9snlTU4XVpQixdg55bP+vdBU7
 dzJ3PE7DpGUAtKv7/INpjAdoyA==
X-Google-Smtp-Source: ACHHUZ5VnBXv0IpdLguOXUNVfu9OdAeXFEuVvxq29s+dS+1xyrg5TY3p75gjO9lG9WeyS9PiHyRwjg==
X-Received: by 2002:a05:6a00:218a:b0:637:aea0:b23d with SMTP id
 h10-20020a056a00218a00b00637aea0b23dmr31347173pfi.10.1683842106648; 
 Thu, 11 May 2023 14:55:06 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 f3-20020aa78b03000000b0064385a057dfsm5754939pfd.181.2023.05.11.14.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 14:55:06 -0700 (PDT)
Date: Thu, 11 May 2023 14:55:05 -0700
From: Kees Cook <keescook@chromium.org>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <202305111453.082DC179@keescook>
References: <20230511213441.never.401-kees@kernel.org>
 <7085879d-4d21-b90a-c08d-60450d1c7d38@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7085879d-4d21-b90a-c08d-60450d1c7d38@canonical.com>
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

On Thu, May 11, 2023 at 02:48:29PM -0700, John Johansen wrote:
> On 5/11/23 14:34, Kees Cook wrote:
> > In the ongoing effort to convert all fake flexible arrays to proper
> > flexible arrays, replace aa_buffer's 1-element "buffer" member with a
> > flexible array.
> > 
> > Cc: John Johansen <john.johansen@canonical.com>
> > Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
> > Cc: Paul Moore <paul@paul-moore.com>
> > Cc: James Morris <jmorris@namei.org>
> > Cc: "Serge E. Hallyn" <serge@hallyn.com>
> > Cc: apparmor@lists.ubuntu.com
> > Cc: linux-security-module@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Acked-by: John Johansen <john.johansen@canonical.com>
> 
> I have pulled this into my tree.

Thanks!

> 
> > ---
> > One thing I notice here is that it may be rare for "buffer" to ever change
> > for a given kernel. Could this just be made PATH_MAX * 2 directly and
> > remove the module parameter, etc, etc?
> 
> possibly. Currently the only use case I know of is for some stress testing
> where we drop the buffer size down really small to try and break things.
> This isn't part of the regular regression runs and could be handle with a
> config/compile time to a buffer size constant.

Okay, cool. I figured the conversion to fixed-size is sort of nice, but
it probably won't be of much use as-is since it's the buffer, not the
aa_buffer, is passed around. The compiler would still not have any idea
what the bounds are. :)

-- 
Kees Cook


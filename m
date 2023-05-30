Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D90717116
	for <lists+apparmor@lfdr.de>; Wed, 31 May 2023 00:56:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q48Fh-0007y0-Bp; Tue, 30 May 2023 22:55:41 +0000
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <keescook@chromium.org>) id 1q48Fg-0007xt-FA
 for apparmor@lists.ubuntu.com; Tue, 30 May 2023 22:55:40 +0000
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-64f47448aeaso3727615b3a.0
 for <apparmor@lists.ubuntu.com>; Tue, 30 May 2023 15:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685487339; x=1688079339;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BkBhxE3ytz2kF3tpYV9IN2L47NlunYx7yD1fvIugVDg=;
 b=JkL4TkmaBIayj5OCIMW991JmgQnj/gOpmqu0Jw8iYq3PMtBsrylqK5iciUUO1fhYgS
 2o7CARmlg2bDXlKcJclJ9S/L2d10IK4UribgkAI3rT5ddfJwfkzp232e3xf8cjAq3sQt
 imoZlKZvz+c0GKoP6pL6IeBJqKSiae+R/iNng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685487339; x=1688079339;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BkBhxE3ytz2kF3tpYV9IN2L47NlunYx7yD1fvIugVDg=;
 b=RWA6ul5yy85xOTypLL9oWDF8UJNpdz2aW2kNsfUsD9bRia+DWjSZhZlo6kP2f83MHw
 Qxs5PuydLiLkqQ4SDG7R5uCVHjJp0Usk7SSGwyAxdIpFOyaTiTd7Q1MAxK+9F9AzYNVC
 T1WP1ua8iCXnzOzrxsRNLDV54bLuDN2sp7fDOFBf01Y3wMrcYAeh0F535ABAx7PvTgZu
 cmZVk34U/KK9+XSeMtXWS+yfCz7Wf3FCMKe9sxjHgAzbkH6SX6Z+EWOfjQoWcHocmMiT
 zg+wYx1KO+bWbWkUVagXyEaxHojcEhd9JW3jtg5mZjytkUYXBA+IKd8NcYnPRm1nL+zK
 D+YA==
X-Gm-Message-State: AC+VfDxftItY+Ep/RVJRqF9brqPmbuCYQQqUw3a5da+oqJkB5uz9gHUH
 OA4VbJOOV3+KsYbVx8vgpI/GFQ==
X-Google-Smtp-Source: ACHHUZ4QeCYlGPt+yRrQ988Mpa4bp68BlE3Y+Yn/n1L6hGlqQLXCt+xE8FWGrglyjI0IqtiDNi9FTQ==
X-Received: by 2002:a05:6a00:2e12:b0:640:defd:a6d5 with SMTP id
 fc18-20020a056a002e1200b00640defda6d5mr4441213pfb.12.1685487338720; 
 Tue, 30 May 2023 15:55:38 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 s22-20020a63dc16000000b005344b30d449sm9336232pgg.86.2023.05.30.15.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 15:55:38 -0700 (PDT)
Date: Tue, 30 May 2023 15:55:37 -0700
From: Kees Cook <keescook@chromium.org>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <202305301555.102E1890@keescook>
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

Just a quick ping: I haven't seen this show up in -next yet...

-- 
Kees Cook


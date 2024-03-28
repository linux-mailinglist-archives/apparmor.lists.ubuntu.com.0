Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 73662890CF1
	for <lists+apparmor@lfdr.de>; Thu, 28 Mar 2024 23:07:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rpxto-0004ZW-7v; Thu, 28 Mar 2024 22:07:07 +0000
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <keescook@chromium.org>)
 id 1rpxte-0004W0-0l
 for apparmor@lists.ubuntu.com; Thu, 28 Mar 2024 22:06:54 +0000
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6e6b729669bso1305569b3a.3
 for <apparmor@lists.ubuntu.com>; Thu, 28 Mar 2024 15:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711663612; x=1712268412;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FawcQ0+/Re5CGM1VyfGak6NYsr/nN1VT9V2EvlsawhQ=;
 b=WhxiOuy9r8h6+aAcHM/pvn0FOIMv8oqCee7xGlFGAb7cgd1o/whdNi+85xDUjeZ297
 mr0qyRAMd196mtu4L3wF8lIaztGHXQsvSdF9ZPumaj+PMagfM/N06CcEGvBBU2C5YZMv
 /ZAdbc59x3Yu8KItL9NVTcIWH90SpkWcOu3NzkY4NNcnA4KbDCCyztAzf6OF4oB2+k3T
 Q6eF7WSa7BxQFrMBzflJAwUiX9Q2lqOKGVwHO4hBAsseyTGC5eBNhiVfvy7gnOZNes+a
 ygAK0C3B5+iezlOeOLH3jjbgZDSh/T7lw7Cg4wwEHLp9/x6O872PHdV5XGOqKBPnZIcW
 DV9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPO83dPyZO1Z8y4W/oK4W1aFqyDBtjahtEOjFy5wI8fpntRwnJ248XtYsl9pLjh5WPquR4dLm8M3YK68FuqLO0YcZAEVb8cLeV
X-Gm-Message-State: AOJu0YyZqmyxWKjIcbR4ewekqZ+kcND68TuqWC1JGAf2DhCTGH00zW65
 VdKRmikAytRrbfgKrk8Ha6FY0mqSabk9iaZ+WS/zmixtsQfITNGiR7VV5KM4Kw==
X-Google-Smtp-Source: AGHT+IG28FKoAE9GwUDPDbAhJpDSQvO83TTQaELwCTDF264wtxqHJW3X538E+oFBl7uIp2mx5xeCig==
X-Received: by 2002:a05:6a00:2d11:b0:6ea:749c:7849 with SMTP id
 fa17-20020a056a002d1100b006ea749c7849mr707745pfb.13.1711663612175; 
 Thu, 28 Mar 2024 15:06:52 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 g21-20020aa78755000000b006e71aec34a8sm1870864pfo.167.2024.03.28.15.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 15:06:51 -0700 (PDT)
Date: Thu, 28 Mar 2024 15:06:51 -0700
From: Kees Cook <keescook@chromium.org>
To: Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>
Message-ID: <202403281506.6E7F782@keescook>
References: <20240315125418.273104-1-cgzones@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240315125418.273104-1-cgzones@googlemail.com>
Received-SPF: pass client-ip=209.85.210.172;
 envelope-from=keescook@chromium.org; helo=mail-pf1-f172.google.com
Subject: Re: [apparmor] [PATCH 2/2] apparmor: fix typo in kernel doc
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
Cc: Paul Moore <paul@paul-moore.com>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, Mar 15, 2024 at 01:54:09PM +0100, Christian Göttsche wrote:
> Fix the typo in the function documentation to please kernel doc
> warnings.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook


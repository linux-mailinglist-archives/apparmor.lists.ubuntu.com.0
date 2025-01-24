Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 86242A1C053
	for <lists+apparmor@lfdr.de>; Sat, 25 Jan 2025 02:37:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tbV6e-0005BE-25; Sat, 25 Jan 2025 01:37:04 +0000
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <groeck7@gmail.com>) id 1tbQoW-0000kG-MD
 for apparmor@lists.ubuntu.com; Fri, 24 Jan 2025 21:02:04 +0000
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2ef8c012913so3610855a91.3
 for <apparmor@lists.ubuntu.com>; Fri, 24 Jan 2025 13:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737752523; x=1738357323;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vl/7RHmlJOr2tZEOpWiSD3B3yqWlSgOvTUSx/EiYt0Y=;
 b=kvI+nNL22ylrzRnJ0LuzbegrMEdj1A/bcykb7TE4RnA9a/YE522fCfahtXduSXORmP
 sHDM+5DPFF8lnAnqbgUzmhsawuvofdFjN+faMF2TemrGuhvIfylcOBUC78OHfjupgnll
 bzfDvJStmJ/vrFy+Wog7rXChKcnXoJG9aw8x/fKJezgm5JyEiWN4Wy4UBZP3/wn1TQnM
 YjnFJb47v2QrkT8Ge85z8/RxbPJKG4iedHUQ6/NK22QMnpkAFTiLTiaewNM+XEUaveK/
 poUNjbDdTsIXgCEPlesVRpdR5aFfZRpKOb8nJWKmNnvR5sDmd1BUFLLXbaOsbhjL7r6U
 7Cpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz7C+duNbd1s+S7vsfZdbXy6bpEX44nZsi20eHA3+N9O3fZv9H+5dtwvnaUEVx1ieuolvNvViuaw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxlanGQelQ+943IILF2pzUUVlzNv3YEs3YzSrhbQPwqGsFP6byh
 MsgBfmD5/xmxH+XDMAz6ttAh1tBJpIJ9osLDJYCRtTj9h1PtfsWQ
X-Gm-Gg: ASbGncutpYpwpYb8ymsNqMds44s6+eUjIVK6Z748wg/Ktzg7GfX3c0+pjSQK0mxSBKP
 I9DpVk0g7DzHCSjxMydfsNDB0aTcsCLibrrYxFt9GgqzdP308gmykK8g2l6TjCB7bNn0S3jUqju
 TwaejONiFmCsnNhE1O0Yi+UkosI4Zr7THkJZng/3S7a9J6OyqefU4my54x1onTcwsa9XIpnj+/x
 FrbghQ60rXludZbxI2iFo8FzS2f+n8nT/4A5Hm5Fq8LakTunItDLNfIyFt5G+Po4BTNCjQEFRrR
 9MU+5DNVhaFQdk+B7g==
X-Google-Smtp-Source: AGHT+IES2AXoEp2vaNvzmtAT97SEWpz/MOxHMw92kqsJdiBJpjKlD2lmih0tYPSEmaztwWaO2TYlIQ==
X-Received: by 2002:a17:90b:51c1:b0:2ee:b2fe:eeeb with SMTP id
 98e67ed59e1d1-2f782d2ea80mr37753282a91.22.1737752522606; 
 Fri, 24 Jan 2025 13:02:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffaf8f03sm2180067a91.39.2025.01.24.13.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 13:02:01 -0800 (PST)
Date: Fri, 24 Jan 2025 13:02:00 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: sergeh@kernel.org
Message-ID: <dff63c58-6f13-420d-9a67-1d6d3a273458@roeck-us.net>
References: <20250122065543.1515519-1-arnd@kernel.org> <Z5FPFhc9w0aemqL_@lei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5FPFhc9w0aemqL_@lei>
Received-SPF: pass client-ip=209.85.216.50; envelope-from=groeck7@gmail.com;
 helo=mail-pj1-f50.google.com
X-Mailman-Approved-At: Sat, 25 Jan 2025 01:37:01 +0000
Subject: Re: [apparmor] [PATCH] apparmor: remove unused variable
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
Cc: Arnd Bergmann <arnd@kernel.org>, Paul Moore <paul@paul-moore.com>,
 Arnd Bergmann <arnd@arndb.de>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Colin Ian King <colin.i.king@gmail.com>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Jan 22, 2025 at 08:03:34PM +0000, sergeh@kernel.org wrote:
> On Wed, Jan 22, 2025 at 07:55:35AM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > The local 'sock' variable has become unused after a change to the
> > aa_sock_file_perm() calling conventions:
> > 
> > security/apparmor/file.c: In function '__file_sock_perm':
> > security/apparmor/file.c:544:24: error: unused variable 'sock' [-Werror=unused-variable]
> >   544 |         struct socket *sock = (struct socket *) file->private_data;
> > 
> > Remove it here.
> 
> That's interesting.  The aa_sock_file_perm() further in will
> still trip the AA_BUG(!sock) if there's some shenanigans going
> on so no big loss in dropping the AA_BUG.
> 

AA_BUG(X, args) extends to
	AA_BUG_FMT((X), "" args);
which is
	#define AA_BUG_FMT(X, fmt, args...) no_printk(fmt, ##args)

if CONFIG_SECURITY_APPARMOR_DEBUG_ASSERTS=n. That means the first
parameter is dropped and sock is indeed unused in that case.

Guenter


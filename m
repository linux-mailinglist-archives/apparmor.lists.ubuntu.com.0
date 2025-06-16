Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id EF82AADB59B
	for <lists+apparmor@lfdr.de>; Mon, 16 Jun 2025 17:37:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uRBtK-00050P-T6; Mon, 16 Jun 2025 15:36:58 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1uRBtJ-00050H-2K
 for apparmor@lists.ubuntu.com; Mon, 16 Jun 2025 15:36:57 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 597DF446FB
 for <apparmor@lists.ubuntu.com>; Mon, 16 Jun 2025 15:36:56 +0000 (UTC)
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ad8a2dc92ddso312745766b.1
 for <apparmor@lists.ubuntu.com>; Mon, 16 Jun 2025 08:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750088216; x=1750693016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=180+fvQmghlJ4dELQpA9Q9GzoY6ozYQlhMfrL81At4g=;
 b=U6JTFBfRQq3xcsBW7YF/nD5rgPCEegNm9fRjBoIosuKwi+4fN4Fz9jaiHBBpd2nlUX
 bCq2LxxwLmsAph3i3ISDUsuulpu3wzgVheBWuhB2GZLnK4ZYtUl0f773zdlTlrMMjyIe
 b4J8KyqsCXxJNwEVsj6AhxiDO11ahkE2MezYtAeJtgJytpfzAVjiGCgKo71GJNL/81yY
 Ub55Ud7SsBReC8O4+IDApgZQy0XlTEvLg+gw2F+Xfbk79MWUXxsAZ9BPZkGYL4tvm1+z
 TtMR7dq31n+bkHbFM7eYUPby3uCT8dDa6/hQl3wsoIRpTSBPam5VXAHX8y0LSxZhZ3LY
 EmmQ==
X-Gm-Message-State: AOJu0YyzYvN4U0Uzu7yzLeRWnZUt9E6km+D8p/Ldn8GYj1hLkz2YAOH9
 d7VdMoBM7Bp0ScRlZ76/p1ltsn9zySCphFmLn/7hyYETUO+GCxKhiGLitbk9oHWNGUDDHfTF1ZJ
 96b43ft8u9B0q7H9AhLu0J4YaUyHKDGqb9YFO95lPOdqbzaJwdO+43DVK0sEZXZKBgATF8D1fF+
 KJkgldc3mA1CSs+LX361AFYzGp21KGA+6Ek8OuxUo+XMN4bv4KE3EzcmrmkvVSZOs=
X-Gm-Gg: ASbGnct9tyQYC/vNa460+qA6R/xZIJkg25TbPQgIqFkga3iN6EP9E3MxnNq37i1jOfp
 QU60YmNtUNtuIgmF74OMSJtlteS3zU9RNYikT/LxFCyqQn1hxc0eWu6HdAvT6GASRrQeoiKOlKJ
 RE4dU=
X-Received: by 2002:a17:906:f597:b0:ad1:e7f0:d8e5 with SMTP id
 a640c23a62f3a-adfad31a6b6mr999250466b.16.1750088215731; 
 Mon, 16 Jun 2025 08:36:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQJQ/hxkf9NwqjXLunZ2BtPoIP+ffyUhg6RAkOlGAz65yqlO6T/4AupYPgi3j+vAgE7ysMiMcbZuj7k5Zd7QU=
X-Received: by 2002:a17:906:f597:b0:ad1:e7f0:d8e5 with SMTP id
 a640c23a62f3a-adfad31a6b6mr999247466b.16.1750088215333; Mon, 16 Jun 2025
 08:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250615003011.GD1880847@ZenIV> <20250615003110.GA3011112@ZenIV>
 <20250616-holzlatten-biografie-94d47ed640ea@brauner>
In-Reply-To: <20250616-holzlatten-biografie-94d47ed640ea@brauner>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Mon, 16 Jun 2025 08:36:43 -0700
X-Gm-Features: AX0GCFuA0E_AeS4fXVbbXeQ-QJYneMvLTC9afYzBWHzkjGBvUYmdb71wV7nw2uQ
Message-ID: <CAKCV-6sD3tq3GQhq4YuSV_xPi4pA9Vv0zqxxZ=KTOzQutaR4kQ@mail.gmail.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH] apparmor: file never has NULL f_path.mnt
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
Cc: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 linux-security-module@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Forwarding message thread to the AppArmor mailing list so that it also
has a record of this patch.

---------- Forwarded message ---------
From: Christian Brauner <brauner@kernel.org>
Date: Mon, Jun 16, 2025 at 7:23=E2=80=AFAM
Subject: Re: [PATCH] apparmor: file never has NULL f_path.mnt
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: <linux-fsdevel@vger.kernel.org>, <linux-security-module@vger.kernel.org=
>


On Sun, Jun 15, 2025 at 01:31:10AM +0100, Al Viro wrote:
> [don't really care which tree that goes through; right now it's
> in viro/vfs.git #work.misc, but if somebody prefers to grab it
> through a different tree, just say so]
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---

Reviewed-by: Christian Brauner <brauner@kernel.org>


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9707553D36C
	for <lists+apparmor@lfdr.de>; Fri,  3 Jun 2022 23:59:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nxFKN-0007Ym-0o; Fri, 03 Jun 2022 21:59:31 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <georgia.garcia@canonical.com>) id 1nxFKL-0007Yd-9T
 for apparmor@lists.ubuntu.com; Fri, 03 Jun 2022 21:59:29 +0000
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7DD9F3F325
 for <apparmor@lists.ubuntu.com>; Fri,  3 Jun 2022 21:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1654293568;
 bh=AeRbXkPm+xpq2YW4MTS0o9Gae1ZK7upmX2GsajIb3+Q=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
 Content-Type:MIME-Version;
 b=jZSmedpGK8mTrrfcq/LzqIyGn23FsSEL2Cp0p2fp66Bfh5bdf/rIlBC84WldgeS95
 Ok199tPrxoxcoL8bRs1/sPamHXz3xDF+y957UwU+yIKYULA4njvXMGSod8i4oHx123
 bltEEWTnZHM4n4XZ8dqh5XeHUqmrUUaeWb9QOxPS9vqrELOtKjaG7hXyHMCyWsUtoe
 2mdYlNYIi9ozICtEBqNIQ4XR10nbzTIfUXd1UVHJRhkrbuhB35xlFTobk4brB9vKKO
 cjkIOA8wZUUoiSHddw7ywlICmkH1s0SwnGiU88pOfhdtL+m305pOQjKk6Jv1dfjeS/
 xgpPa2p1dDhSA==
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-f5ce935f21so5269318fac.21
 for <apparmor@lists.ubuntu.com>; Fri, 03 Jun 2022 14:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=AeRbXkPm+xpq2YW4MTS0o9Gae1ZK7upmX2GsajIb3+Q=;
 b=ayBwyWViD5NcnWsPxRiic60Lsq3AvE++8gqG4pyUB/9LcjXdTdJrgU4cZ7k7vQCI1w
 hBNEyLfIStxorwTslTBAwUW5lbTd7A7jxGM3NIv3y9Qdm7MR1QJzRzjn8wzFkytLcimh
 3HtJ4LnXYpC7zxzm7sgrHA4+xRr3Fz93fQYJns5kCDRVFhQjvJbsRU5XvfJhBWmjTw8m
 mJ8yMAGRpV7b54lenzFdSLaBN4JNEiVBGtqwWPstBk5iEVfAyVHq1Ni/3t6J9IKeJyBY
 2hjefB/l6ioG0eLKoB6ygJKPGhK+D2sQRkvOw9kgHcsMtha3eaISjav7s7uz4D5gn1ik
 YuVA==
X-Gm-Message-State: AOAM531yjajClkqk0k/KrdsB1Iq4kksOUIKUppY/1b2SXWkzgAroXy4e
 Kt7VoPSmQpaJ9BIPSFaweTmem2/sTyEsNit6S6koE3DAm1kjePO9L+WgxaNGR35NVVxUC+rAtlN
 5sn0D0nHuTLVzsIjtdmAgFwR3yW3XYv1Vxcd3Ag==
X-Received: by 2002:a05:6808:1285:b0:32b:91f2:248a with SMTP id
 a5-20020a056808128500b0032b91f2248amr6591946oiw.155.1654293566784; 
 Fri, 03 Jun 2022 14:59:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycFOP39JDKhxZ9B8mqF+fxLtbAvYn+ZeUTePQt/R8YY1lPGR7Ghsdq7R0/eXvPwBeWae46qQ==
X-Received: by 2002:a05:6808:1285:b0:32b:91f2:248a with SMTP id
 a5-20020a056808128500b0032b91f2248amr6591933oiw.155.1654293566446; 
 Fri, 03 Jun 2022 14:59:26 -0700 (PDT)
Received: from georgia ([2804:431:c7ef:db09:78e0:7600:141c:8c7a])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a056870600900b000f5f4ad194bsm3737986oaa.25.2022.06.03.14.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 14:59:25 -0700 (PDT)
Message-ID: <6b57724644bc6cb5b0972d89813b5090caab8f66.camel@canonical.com>
From: Georgia Garcia <georgia.garcia@canonical.com>
To: Jon Tourville <jon.tourville@canonical.com>, apparmor@lists.ubuntu.com
Date: Fri, 03 Jun 2022 18:59:23 -0300
In-Reply-To: <20220512173520.855917-1-jon.tourville@canonical.com>
References: <20220512173520.855917-1-jon.tourville@canonical.com>
Organization: Canonical
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: use zstd compression for profile
 data
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, 2022-05-12 at 12:35 -0500, Jon Tourville wrote:
> +       out_len = zstd_compress_cctx(ctx, out, out_len, src, slen, &params);
> +       if (zstd_is_error(out_len)) {
> +               ret = -EINVAL;
> +               goto cleanup;
>         }
>  
> -       *dst = dstbuf;
> -       *dlen = strm.total_out;
> +       *dst = out;
> +       *dlen = out_len;

Hi Jon,

Should the dst/out buffer be realloced to match the out_len returned by
zstd_compress_cctx? Or is the estimation made by zstd_compress_bound
accurate?

Regards,
Georgia



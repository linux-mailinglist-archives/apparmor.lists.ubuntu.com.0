Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 617A58A6638
	for <lists+apparmor@lfdr.de>; Tue, 16 Apr 2024 10:36:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rweIC-0005tB-43; Tue, 16 Apr 2024 08:35:52 +0000
Received: from mail-pg1-f177.google.com ([209.85.215.177])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <keescook@chromium.org>)
 id 1rwOqw-00069q-2K
 for apparmor@lists.ubuntu.com; Mon, 15 Apr 2024 16:06:42 +0000
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-5bdbe2de25fso2829461a12.3
 for <apparmor@lists.ubuntu.com>; Mon, 15 Apr 2024 09:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713197200; x=1713802000;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9YkT2PBxlsTiQpc9k80Xb2w2qGzzlQLFXvx15ENFSo=;
 b=lH44g0lwWpqo7D+uxE27S3RwPhI5LYN0leMjgzHPKRMHbL8ZFPsQt09UkuuKDzF9wM
 M9FL6nqS4BmN0e0we/e5HqrgWNJ89EsC3zLvtG6S/XnR4SfwBwiKZQeUM4KuhhCicUiU
 z3qMg8BvIIyYyMKgiQFs/+ssBbtKJruEIFskDX/gWigHSwe/zH0FNAcEng29blY1ixML
 jYkNTKngosJHhCNQJGjKwDuCExmCA+emOdK3KZlaBd2Md0KjT2k+ZUldJ9faHqih6Ncf
 0FDlKUb1ZqbnoUsrXDksbBZVBjYAi1U/jgN+JTMjO+WA64rkPh+F7DT25mvYk0DqtkTy
 Avxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRvvqdvQOTRq+8WIggFQeoWOxOiFhfFf29ReETGSSjGo1UdYAawOhwKP6MSfM6nHEUXW4ztikDfp2jHuQeDZ8Mr5Wvy6hhEe+L
X-Gm-Message-State: AOJu0YzaFKrjgawAnlp0Q5vSCPaeZiIp32XW8M+vUFlDYNTV2ufP/cCe
 Hf+ulwhltAg6QAYD1jAlK172xd/8g62jVagVDEzx8+kr4hGDQLJonRr03biGSw==
X-Google-Smtp-Source: AGHT+IEOd/x1N/CPtx25Nf+PUqf1rfZqa2mTy1XxaxcS7HXEzP+ucQDv/NhrafY/fDlqqKtbbV3LWA==
X-Received: by 2002:a17:90b:3d3:b0:2a5:ba9d:a06b with SMTP id
 go19-20020a17090b03d300b002a5ba9da06bmr10113697pjb.5.1713197200332; 
 Mon, 15 Apr 2024 09:06:40 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a17090a49c600b002a46b925e99sm8796108pjm.18.2024.04.15.09.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 09:06:39 -0700 (PDT)
Date: Mon, 15 Apr 2024 09:06:39 -0700
From: Kees Cook <keescook@chromium.org>
To: j.granados@samsung.com
Message-ID: <202404150906.C37D8D9DA1@keescook>
References: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
 <20240328-jag-sysctl_remset_misc-v1-2-47c1463b3af2@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328-jag-sysctl_remset_misc-v1-2-47c1463b3af2@samsung.com>
Received-SPF: pass client-ip=209.85.215.177;
 envelope-from=keescook@chromium.org; helo=mail-pg1-f177.google.com
X-Mailman-Approved-At: Tue, 16 Apr 2024 08:35:50 +0000
Subject: Re: [apparmor] [PATCH 2/7] security: Remove the now superfluous
 sentinel element from ctl_table array
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Atish Patra <atishp@atishpatra.org>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, keyrings@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-security-module@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, Anup Patel <anup@brainfault.org>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Albert Ou <aou@eecs.berkeley.edu>, apparmor@lists.ubuntu.com,
 Paul Walmsley <paul.walmsley@sifive.com>, io-uring@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Jens Axboe <axboe@kernel.dk>, Muchun Song <muchun.song@linux.dev>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Pavel Begunkov <asml.silence@gmail.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Mar 28, 2024 at 04:57:49PM +0100, Joel Granados via B4 Relay wrote:
> From: Joel Granados <j.granados@samsung.com>
> 
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which will
> reduce the overall build time size of the kernel and run time memory
> bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> 
> Remove the sentinel from all files under security/ that register a
> sysctl table.
> 
> Signed-off-by: Joel Granados <j.granados@samsung.com>

Acked-by: Kees Cook <keescook@chromium.org> # loadpin & yama

-- 
Kees Cook


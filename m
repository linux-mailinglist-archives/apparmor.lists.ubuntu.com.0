Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 506E26A8C56
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 23:56:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXrr5-0006XI-VB; Thu, 02 Mar 2023 22:56:55 +0000
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <keescook@chromium.org>) id 1pXrr4-0006X4-3J
 for apparmor@lists.ubuntu.com; Thu, 02 Mar 2023 22:56:54 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 p3-20020a17090ad30300b0023a1cd5065fso568326pju.0
 for <apparmor@lists.ubuntu.com>; Thu, 02 Mar 2023 14:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1677797812;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=bh8uEZAD/yvWP1Lrn9R+0QNZba+XTTUTVdSRMgAQcmQ=;
 b=K//SvYScc9/RPlNzAc+bbNZPJfdelma3q9O4bB1wnxAJ4F3+DrxFkHfD9CzyFhzWbQ
 zxzjRce8GzbRVhw5ROu1iovSYFPgJkpXdsVV9KLRuZ+DLM3i6IU1sNlajSgCAnvliBm1
 V57qqveobMxUQT7AgmZQGrEwmKkrWRVbgNjpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677797812;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bh8uEZAD/yvWP1Lrn9R+0QNZba+XTTUTVdSRMgAQcmQ=;
 b=ywtHqAWjp2kQamRpOjqbXyNW3RxSKehSWywqEvlOMdRkXXal02antJyqQxQvvapMSU
 1r03cb3dwETQvQZ8YC5oSFLBPYC8DxhQNwR+hknScrFzTiNw91hILXhAJZJAEw3Bxqua
 aqmRLS22g/WcFP3xWimXrcUXQo5/9lnPHCCNxWESRPy0xeSqX7pCC0b8e+N6VPwYAC6f
 wUfKsHoZTX2v/UQhRyvGxZErs5VgvZjbwUOa3TBD733HQfi5CwxwIOHBrMrih1qny+Kg
 XGeOj3yrtSRU+P0JdydSX21trSi1TJgvLglB4jf/QE/1OZoeIOFMBU7DZDzR3+E6x9/e
 Fxsg==
X-Gm-Message-State: AO0yUKXDwVNVnckGmU2fwIdy2tDtno8jVOmGkdFZGb7qVsRbTv+vWL95
 U9M8aaZwNUH9mAqUerqHYUyaAQ==
X-Google-Smtp-Source: AK7set8NQA8CZRtcwSlTz7C5GCelOHtAp1Ylxj2HvVTT0A4/xUpLXx5v+dscM8DAlm1E4D6F1Zi9ew==
X-Received: by 2002:a17:902:d2c9:b0:19e:3b41:1828 with SMTP id
 n9-20020a170902d2c900b0019e3b411828mr4267544plc.22.1677797812569; 
 Thu, 02 Mar 2023 14:56:52 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 kx7-20020a170902f94700b001990028c0c9sm192659plb.68.2023.03.02.14.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 14:56:52 -0800 (PST)
Message-ID: <640129b4.170a0220.e5ce3.0f65@mx.google.com>
X-Google-Original-Message-ID: <202303021456.@keescook>
Date: Thu, 2 Mar 2023 14:56:51 -0800
From: Kees Cook <keescook@chromium.org>
To: Luis Chamberlain <mcgrof@kernel.org>
References: <20230302202826.776286-1-mcgrof@kernel.org>
 <20230302202826.776286-7-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302202826.776286-7-mcgrof@kernel.org>
Subject: Re: [apparmor] [PATCH 06/11] yama: simplfy sysctls with
	register_sysctl()
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
Cc: j.granados@samsung.com, jeffxu@google.com, guoren@kernel.org,
 linux-csky@vger.kernel.org, dverkamp@chromium.org, baihaowen@meizu.com,
 paul@paul-moore.com, jmorris@namei.org, willy@infradead.org,
 ebiggers@kernel.org, zhangpeng362@huawei.com, yzaikin@google.com,
 serge@hallyn.com, paulmck@kernel.org, linux-kernel@vger.kernel.org,
 frederic@kernel.org, apparmor@lists.ubuntu.com, wad@chromium.org,
 nixiaoming@huawei.com, tytso@mit.edu, sujiaxun@uniontech.com,
 tangmeng@uniontech.com, patches@lists.linux.dev, luto@amacapital.net,
 linux-security-module@vger.kernel.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Mar 02, 2023 at 12:28:21PM -0800, Luis Chamberlain wrote:
> register_sysctl_paths() is only need if you have directories with
> entries, simplify this by using register_sysctl().
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook


Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLRWCBXk+Gkt2wIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 20:23:17 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D825B4C2651
	for <lists+apparmor@lfdr.de>; Mon, 04 May 2026 20:23:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wJxwR-0003Va-8a; Mon, 04 May 2026 18:22:51 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1wJxwQ-0003VN-3s
 for apparmor@lists.ubuntu.com; Mon, 04 May 2026 18:22:50 +0000
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F3E523F7CB
 for <apparmor@lists.ubuntu.com>; Mon,  4 May 2026 18:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1777918970;
 bh=mlkE2OF8cdoctIAf8Y/THoq576QJS++E4BXgM2HXU4U=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=sm65Q1eKDjLj/59SJjOwfP7OF0XrevbJPMn8VOtcyRf6e35GSd0NKvYnr/Lv/Xgh2
 TbrE1feRDQthAO/QW6QSDrzWaqzC9lCfno5zGzar8kj+CvSJqvE3DktQjE9YRfjERq
 U+pw5M7XDwli8DkdmtRtGnDFMKt85xOBUcyGYD/6IBzhivuxsbhJ+H9lO5vR22dpxQ
 SCZfRsDCOLY+hf+Snyw7zLSAVHSdLq5WgeygLOLZm6qMQ9thaLRyPG7aJspBRKgAu3
 fC4dNm3+HaYYGYut/9EJi4rE/wtVghnv2qmePI8gRev2z8mCfUuMz9tdP0WAuxmloi
 ZZpguhD8GgvR2Vw1hfThDtryzcUdH4SwdOIYZbgCi4E+dpuS9ihWVnttpYjl3/E+/T
 V+HF/TaDOQxD7sDOVYuoA0tOSPNKCtxj6Ib3+oeBL3c3YQ3pWEIRlbt1goipXa/X6R
 UiZmpTKIkcpSXEqVtqlQjR6/SYsmGjQA4MQZAX+W19L1ssKeBBQqzJV6XvA9krbpS6
 B/clIBcKE0UiHQAtCRenBGepgAt/P5LadCiwRBN03/1SZUxOW6Tl6wgJts18exfb1a
 MkzdKuYMtlJNWacliIiSWQs23N0M0ulnUyBO5iikPrpYdL1R5TBXblzSso4Kq78WsI
 iQXOwVXxBqwr2TmL+TP1uwe0=
Received: by mail-yx1-f70.google.com with SMTP id
 956f58d0204a3-65c3132b7b8so5826511d50.2
 for <apparmor@lists.ubuntu.com>; Mon, 04 May 2026 11:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777918969; cv=none;
 d=google.com; s=arc-20240605;
 b=jM1V8RBpJXIN4bdc7I1NnaFzF8rtewuJriIkHWQZuV32GdtUMkQEf14ZIDoTzF548d
 cmJOan+rY9p7y/hAzu++uZlsrL4qlCoa97nYLruEA24KmAMvWIuKbT4EhzAPvFoWRXuu
 xHALi8ZbnWyvClmFtlDpqwTURvEUO/DuEGJYWEm5qRsf4T456o/E2OUas6iYAK4jR3jN
 DjrRaJBJmLRcAzfu00QobOwqnFaO1b96xajkXaK0Ru2Q56tHr7DdH0Pnp1dcYmUsduZR
 oGY0Fe8C+P0KLNpWHP1+nEniTUcH02XnWsO3Ie0uF5xVUTYWmNamcG9NwKoQsZLzW+vm
 /gRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version;
 bh=mlkE2OF8cdoctIAf8Y/THoq576QJS++E4BXgM2HXU4U=;
 fh=o2BheiGP7JcVhQxPEb2nJhydvEIdCr9oaKT7KuzxLiY=;
 b=h+aYRe51/eusO/HkWrYnfuy1ixGa+LTFuQaLtrb/fVKN0Uvr3ASY98Zy6JQjzsadbA
 VMAjH02d0urv5NQDwt1Z6lL8QGe8G4EfPBJqCse238slcxq1eaSgFF60FqAZrnntceMg
 x10zRv/fqWWQwZUaJjXuIO7hV0Oy87s3dzOMqcQJIKrcQ52RyMaMVtCkyPU1n3Bb93cT
 e1O+NNHjvODkq/UxzG0e3BPmlX6eauAOtRq5815niXDEn4wthVK7vWtA6JQh7vZUGUf5
 FR7Qrd5CKXhaTZSvfBazL4F4y1Lq8eauzYWqVSpmVYmPmk1M76O9W5JL5yosy8Q61LeB
 D4/A==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777918969; x=1778523769;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mlkE2OF8cdoctIAf8Y/THoq576QJS++E4BXgM2HXU4U=;
 b=NA2WIntE4W+Jkatl+T7lF7Q/GQNcXFZ9g0BTD3nKVvUWuwBAzCy/06JCNYuZaZPMmg
 qX5v2PzNrrwv543JlyQ/MC08Xl6jj5PmLtYbmEhYtbiocV4hiRMcAqtHxDy5d4S/NfkY
 /Tz6bPuwCv64L3jHTKx6HRF33RfrBmDCfEsQB259HJ/tExtf2WpyCmrdsagIwgu3B/b+
 8HlxVdNrv0Ikgoy+THhgg1nr7kaQLPwkx2b5vo0x1pJdWbcoseAbLqVD/T5i3IfVO5B+
 8HMfPJ753OykA0nx6wjAJ6WoJXEAUi4j1pNCodJUi3mbzRj2WqPyxKYFi4UL7yH2OxGG
 5S3g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9n8OZRj2b9qq/RbW071gQwmHvlzYYuqytZc4NHogZaaSrsIHieMPSCJiUaO056ziGV13yQh95E8w==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwhNU4N+4XGMkt0rEyaPIFEtn0apO0GFal8CDLziQ1s3WeP9ygh
 +sndc7/roFIQjDELxYvroTybKUpMtDZlm45qCQwIlzQY1BktjOHz9AOYxZdbsnEay78vD87uQjh
 GcUi+Q+vLCdr3wvAhEwB1jYXoDki4RYARsWV1oeWanNQgOvULDjn2uEYbk5LARLHFWoCfHqqooW
 kjACz1dW35EYRUHmy6dR1tMgI3GnxUSfsoSceBdctTvgh8JbIcByEI
X-Gm-Gg: AeBDietox7bZ+xlzy/arum/FO1BGzBV65Z/qUL6sRn4zkBOhpwmf59c4WVrWGbq3Aqq
 XaBK7t/DOFJkhwky+eOO1sSSU4ziHlRYOkjbcW3y1HKI/NdbtAPsmfts3bZ6mUr9wueFUh5tAMd
 PIj4MHrq2joFtI8UioX4kpEKxfRR83knUXA6WChsXJgIbJtnkWWaqP60uwRlQ4Gxr85uYahTbp7
 MMwGWb+JFigetVKAvhBFqifqKahqgkT1swUelbEpiU6uV+zC+lWHRRWayntnueAXR8rP472/OGk
 uQ==
X-Received: by 2002:a05:690e:1303:b0:657:a1d0:992b with SMTP id
 956f58d0204a3-65c3db767a2mr9828934d50.43.1777918968981; 
 Mon, 04 May 2026 11:22:48 -0700 (PDT)
X-Received: by 2002:a05:690e:1303:b0:657:a1d0:992b with SMTP id
 956f58d0204a3-65c3db767a2mr9828823d50.43.1777918967644; Mon, 04 May 2026
 11:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260503041243.200895-1-zenghongling@kylinos.cn>
In-Reply-To: <20260503041243.200895-1-zenghongling@kylinos.cn>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Mon, 4 May 2026 11:22:36 -0700
X-Gm-Features: AVHnY4IzmAOXlVcPCGPAGXRMLK1bN81evXNi72TVJV6ZTfLoviASNGsa0ZBWq1U
Message-ID: <CAKCV-6udZtokztssHe7Okfk3QT0H0=i+kDy65_BtSdAASAr6XA@mail.gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH 1/3] apparmor: Fix return in ns_mkdir_op
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
Cc: brauner@kernel.org, jack@suse.cz, paul@paul-moore.com,
 apparmor@lists.ubuntu.com, jlayton@kernel.org, jmorris@namei.org,
 linux-kernel@vger.kernel.org, zhongling0719@126.com,
 linux-security-module@vger.kernel.org, neil@brown.name, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: D825B4C2651
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zenghongling@kylinos.cn,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:apparmor@lists.ubuntu.com,m:jlayton@kernel.org,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:zhongling0719@126.com,m:linux-security-module@vger.kernel.org,m:neil@brown.name,m:serge@hallyn.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:email,kylinos.cn:email,mail.gmail.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,suse.cz,paul-moore.com,lists.ubuntu.com,namei.org,vger.kernel.org,126.com,brown.name,hallyn.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.952];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	TAGGED_RCPT(0.00)[apparmor];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DKIM_TRACE(0.00)[canonical.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]

On Sat, May 2, 2026 at 9:13=E2=80=AFPM Hongling Zeng <zenghongling@kylinos.=
cn> wrote:
>
> Return NULL instead of passing to ERR_PTR while error is zero.
>   Fixes smatch warning:
>     - security/apparmor/apparmorfs.c:1846 ns_mkdir_op() warn:
>       passing zero to 'ERR_PTR'
>
> Fixes: 88d5baf69082 ("Change inode_operations.mkdir to return struct dent=
ry *")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>  security/apparmor/apparmorfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorf=
s.c
> index ededaf46f3ca..1d7b1c70f22a 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -1922,7 +1922,7 @@ static struct dentry *ns_mkdir_op(struct mnt_idmap =
*idmap, struct inode *dir,
>         mutex_unlock(&parent->lock);
>         aa_put_ns(parent);
>
> -       return ERR_PTR(error);
> +       return error ? ERR_PTR(error) : NULL;
>  }
>
>  static int ns_rmdir_op(struct inode *dir, struct dentry *dentry)
> --
> 2.25.1
>
>

Reviewed-by: Ryan Lee <ryan.lee@canonical.com>


Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALhjG0IE6Wl5SgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 22 Apr 2026 19:24:18 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B78D44943B
	for <lists+apparmor@lfdr.de>; Wed, 22 Apr 2026 19:24:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wFbIx-0000en-6s; Wed, 22 Apr 2026 17:24:03 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <georgia.garcia@canonical.com>)
 id 1wFbIv-0000bo-DE
 for apparmor@lists.ubuntu.com; Wed, 22 Apr 2026 17:24:01 +0000
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 343823F47C
 for <apparmor@lists.ubuntu.com>; Wed, 22 Apr 2026 17:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1776878641;
 bh=QBIa+6BjBLL0oyPscTGX7VB/4okPrZ7+E6/nlt9aDBI=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
 Content-Type:MIME-Version;
 b=MQNUkaWKcZk8yJwE9QReyXBl2OJDmnRSCmWiThKXNi6Y/ghel8Ds7vkQWQ1Kx392E
 s2O58J+MOn6m0FXSq6E+nbt3V+mEW9iLkTn7ewPwux5OP9mgEE4h1HdpLfVbcZHLNn
 xJceALhrNjab0UU4WsnZwbKgH/vq3iB9obFmf7gHlMCutDPgHHsOFfDepa1QndF10A
 25tdqRQzQtGSoCfGGk93J54J++K5cuZxVYusmyIA62uAsh9ldaZbrjCvXBtWRPRSd5
 zTJjUNLz3nT/ghZktuGrQG9l5LPYihZBDVx/yLb1/EFjYYw+bEQ6cyr8+uYP8LABJo
 cQcOx5t92vJBqBGgfYZ7F4ijFdDQgwFneYnn+6Z06zVWju7YRNroRzny6AOrHz8GwV
 Zh66MzVOXtgiXJMD4TVTt+hK0zuETrsSrnmiKFlCWwIjdwGR8qP8C84Qv5rK1dKs9K
 H9RP9tvOedYZCNs5xm/vTtWCtS90YF/sScqkp6pDOr2aPAew/qNNKy+/RhFgVNHbPp
 /JXHEC3FTAqWA2M2/wuc0BmnHlJDySOf5B5iWt6Qu69CzAdfFiz827XlgghmbyEAQZ
 SwQ4gqW2KfWaP+c+GHTu7mA4aR+SNhmg3UIaoNryNSpiRQ+0OzsZEVh1sH1+VZRn4u
 u28gRJru3pqvoUJ4dXqNd8J0=
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-953f6e0f1e0so7288186241.3
 for <apparmor@lists.ubuntu.com>; Wed, 22 Apr 2026 10:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776878640; x=1777483440;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QBIa+6BjBLL0oyPscTGX7VB/4okPrZ7+E6/nlt9aDBI=;
 b=pE24xavQFV5PAPExF4bGRNs7D9z9QYkbysGKQNIezFQBSUfxQnxEFbVtiot1iO2Yku
 4IlL37a4gN1VK2ZuHvXw1FZ8Qcs+UO7nbVwVKXGQeAu0y9yA5qriULEXpXFsloC9BZpE
 3PlBeX9vDsoAKK/J76VAufxlfKrDR5riULqLNU/fXDqe1e9izZp7pWuFLdSp4Y3/rzYG
 hsHJ4ERZa1fzrAE4W4dEUKUsqhjCe55upOE353Qe7rkP8Nqg6keA04akhFK75RBCk7e8
 04ta5Po9MT9lUFSvmW7ECVGZjOyc1Koe/BIcPb01HCp06pKDyriJUa/36kfgTUGpuQLI
 2ecg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/trow1urJaQHx03AB5NWVs6zTwPky8MonYrsit/b95ZA72dkQdqZtfrauIEJ1fq7244ANJ+y5HnA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YyFg2dkC0PLFdNi4B73bI4PV7Pt+KFcI9TeHVfVnHuDqvs7Jum1
 xvQ/Vfo4i9FvWMlAm6iOUmd+SSV6pl3RNkL9Ye2WYL1bnBukU5a3dI/lD/KZbqFLbwafcDeJG0G
 fCQ5QTbtLLB+WdpzpSXEccRtYisDZ4tM8XUNEkZ/4NMZ+aP6KwlWEXtRXRbwmcHV2X+KWUZsoQ/
 RWLA==
X-Gm-Gg: AeBDievMnlOgU+i3HBIEc4zNcRRWxAskwnvIz/uMht24ETIaJo6vOUqjH2LLQlDvu2Y
 HkzpKr6b7yGdaYVbxxhjOQ24nV15klVlBUDvtyrYVzIz3uq0hqs4r6FP1/Pvqwosi/mbyLIuuWD
 /20vNVxFhF9mDGMDa7cKzBeHxbtx5onQzbNhBpIUKaIGV75yqNV0xR9V6aCNOidPSxdD40bMLfU
 EX8V9gN7o+xLwPkpd4HHAt/cdW8lEpK/q4Q43xbC62eL+MfI3+S5qxPqT7xXIWEhJwr2ogzOE3R
 e1EsIi3eOeZ7Igums2JFybksTfJRm7PYILrbEye7UcK7umUSoileiz0uCcf91ogV1XUBEO6RQkW
 yX67fSg/ElOo48HCe0XgyalayqaUfFtI8+5UgiDisr2cVm2pSF1KujgDv7/SiHsMM7C0yrF2pI7
 9/Tz7q
X-Received: by 2002:a05:6102:689c:b0:611:c543:8fff with SMTP id
 ada2fe7eead31-616f4643b36mr13066486137.4.1776878640169; 
 Wed, 22 Apr 2026 10:24:00 -0700 (PDT)
X-Received: by 2002:a05:6102:689c:b0:611:c543:8fff with SMTP id
 ada2fe7eead31-616f4643b36mr13066462137.4.1776878639761; 
 Wed, 22 Apr 2026 10:23:59 -0700 (PDT)
Received: from [192.168.0.106] ([187.95.109.208])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-61745c9e53esm8379034137.5.2026.04.22.10.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 10:23:59 -0700 (PDT)
Message-ID: <6310cc11dd67ff2fb928a08fed9a6e11ac884e7b.camel@canonical.com>
From: Georgia Garcia <georgia.garcia@canonical.com>
To: Dudu Lu <phx0fer@gmail.com>, apparmor@lists.ubuntu.com
Date: Wed, 22 Apr 2026 14:23:56 -0300
In-Reply-To: <20260413090313.79315-1-phx0fer@gmail.com>
References: <20260413090313.79315-1-phx0fer@gmail.com>
Organization: Canonical
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
Subject: Re: [apparmor] [PATCH] apparmor: Fix wrong dentry in
 RENAME_EXCHANGE uid check
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
X-Spamd-Result: default: False [-1.61 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phx0fer@gmail.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.ubuntu.com];
	FORGED_SENDER(0.00)[georgia.garcia@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	DKIM_TRACE(0.00)[canonical.com:+];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	ARC_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[georgia.garcia@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,canonical.com:dkim,canonical.com:mid]
X-Rspamd-Queue-Id: 2B78D44943B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

On Mon, 2026-04-13 at 17:03 +0800, Dudu Lu wrote:
> In apparmor_path_rename(), when handling RENAME_EXCHANGE, the
> cond_exchange structure is supposed to carry the attributes of the
> *new* dentry (since it is used to authorize moving new_dentry to the
> old location). However, line 412 reads:
>=20
>     vfsuid =3D i_uid_into_vfsuid(idmap, d_backing_inode(old_dentry));
>=20
> This fetches the uid of old_dentry instead of new_dentry. As a result,
> the RENAME_EXCHANGE permission check uses the wrong file owner, which
> can allow a rename that should be denied (if old_dentry's owner has
> more privileges) or deny one that should be allowed.
>=20
> Note that cond_exchange.mode on the line above correctly uses
> new_dentry. Only the uid lookup is wrong.
>=20
> Fix by changing old_dentry to new_dentry in the i_uid_into_vfsuid call.
>=20

This looks correct to me, but could you add a Fixes tag?

Fixes: 5e26a01e56fd ("apparmor: use type safe idmapping helpers")

Thank you,
Georgia

> Signed-off-by: Dudu Lu <phx0fer@gmail.com>
> ---
>  security/apparmor/lsm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index c1d42fc72fdb..e8de919fbea6 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -409,7 +409,7 @@ static int apparmor_path_rename(const struct path *ol=
d_dir, struct dentry *old_d
>  			struct path_cond cond_exchange =3D {
>  				.mode =3D d_backing_inode(new_dentry)->i_mode,
>  			};
> -			vfsuid =3D i_uid_into_vfsuid(idmap, d_backing_inode(old_dentry));
> +			vfsuid =3D i_uid_into_vfsuid(idmap, d_backing_inode(new_dentry));
>  			cond_exchange.uid =3D vfsuid_into_kuid(vfsuid);
> =20
>  			error =3D aa_path_perm(OP_RENAME_SRC, current_cred(),



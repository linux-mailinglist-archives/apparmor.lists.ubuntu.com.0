Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAqpNuOX62m7OgAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 24 Apr 2026 18:18:43 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACEC4613EC
	for <lists+apparmor@lfdr.de>; Fri, 24 Apr 2026 18:18:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wGJEe-0007wN-Kq; Fri, 24 Apr 2026 16:18:32 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1wGJEd-0007u2-4k
 for apparmor@lists.ubuntu.com; Fri, 24 Apr 2026 16:18:31 +0000
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D9F673F9D0
 for <apparmor@lists.ubuntu.com>; Fri, 24 Apr 2026 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1777047510;
 bh=1oPbUH9mYZug23GRFBmehEoCKWQNMufIgzGNl37Jiao=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=kIZYPnci6zsYreIc4ZYSqhGNkL0wclbgwwi7IInBGBYt5Uc+GB1zm4Nnl5xme7zK8
 4Uvf477KBwKnYnZTxuLFt/sATDfa6dQx3EhNE0dUj9k2YPWtZquEVqmLSQmGctItDo
 wAfSQYiEQP1ygB7kZmOnYim1irO4v2gxZX0BbW3d5jzNIEdnageZ9FEOP1uXIkfcQN
 MheH0FBuAbn2XoF65bW7+lhm5unvlGaBf64TolPfRseZSDxbE9lBOH2tQmg1FlLCmZ
 iyIkW5QgT5N9ecwOCMv59fkPqeSNpnLS+YU8IDZGQbFS3BCZYLhpG9M7rtmntlBsrB
 rMeIqJoMBB3TzG50D10qKxxNy2/rPxYSXd44JfkUddjk6ZZtOE86WjPOI8ukBlTZB5
 QYzLwNIsaqnYaF8e/0ozLaGSnN9QQSylJbXEuaaMUqSlB391mUuXz7eWV25T5GUD0C
 /BSms/aLMl0RZ2EFOfu+ZSdz0LLt6JRE7RxJkMp9aecJ8aHrpLUVGYwtvTgFmkB3VW
 wo3VK5xJHGDpyNac7XmFvSeX0L6Fi6XFUrAT907S1e/ghMRPciHtg/n/XKyol8Lhp4
 FvtdDU2+3obTotGvC2eI1cqqgkOCX2Q9yo1Tj66Bhp0J2FlZl+uOSgZ+fvBYKhw0a8
 Q0hCtiPMhyQ5efwwmGGh3DaM=
Received: by mail-yx1-f70.google.com with SMTP id
 956f58d0204a3-6501bab91baso8272741d50.2
 for <apparmor@lists.ubuntu.com>; Fri, 24 Apr 2026 09:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777047510; cv=none;
 d=google.com; s=arc-20240605;
 b=WV2VYzD2HxEuKIRNqwXJlCdBk9CcS83oTj+ChtB4u7t+CxOyS86TcoxsZ+fI2Zzkti
 kjWWeGXJvTnC61C9DgYS3g/ZjCCsBcFugaJbHNi71HQrEZgxHdhu/F2I1IB1iuMuijU5
 XIXHBCGlyVruen9ibHNdqxID115+ecW6OlW/JH7Nj7m+BkIpOaROkZ69Qh/ZiGMF0pnJ
 4dAQ289ZvBA7rhqYb4svSGazzLMb6q1OX/JEUOZrYvd3MrRiMi8J3GXJT9WhRLwBdEv+
 75no4PuJPgIDfZ0TRnMrSvpEQabgzVOOpI2+RFrK0hHDkIqBlg9WPf4WAsu3gXj0pNWd
 xH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version;
 bh=1oPbUH9mYZug23GRFBmehEoCKWQNMufIgzGNl37Jiao=;
 fh=qhE6P4jAWNLT43mwIsvK9cCRv6LOWD8QVHyPkEhOg9c=;
 b=jn+BIClcY0kuvpLmBuwl5sMKgTXOs9WXKjRWbLe8yNiySkU5FTplEBmINhEUiddXV0
 w4DQn9jHEKLmQMKOnC7s5jGAoKtyC1O59iTuVHoHEN3AbIn30gJVykkhPCIzACH/qPO4
 9LRmvHf53d1BbVFuZ47dTNywGy1FGiO4VizZAUSQcEgWm6zLoUvDHU89PrxKWQy7HqVz
 UnsljwIT6n72yel94YonqXMDlt0QyVdUweKurnSEwgmoK5AujpIbCJUqX5SDBSr3FFWi
 uC1bpnH0feXBvgWJaELgilibgG1cFc320p3HYtZ9JngmHUHI+4B2EddHEMgUyvsOgle6
 NuJA==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777047510; x=1777652310;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1oPbUH9mYZug23GRFBmehEoCKWQNMufIgzGNl37Jiao=;
 b=YubYDAHFh52KHEna6LkmHwnxVSxkm5r8O9WV5FfF7Ny3r0FtChVKIEcXqLVoqxwhZT
 Ufr5igufJYJBKAEGPN4RqowrcfyINnm9oFi0qgmxwJEsRUDJP/s+V8+9fI0M1Nv07Ou3
 QALuSQlzz0847v2o/YPB53NQfGOy1utbVEl8d27S7W/IxEUdL6zVKrrMx2nO8pu+5QEM
 bUiWGt2YqXzfuiLFz00LXuCVVpQU8xQ6Yxa/2mM/R8kvagd1epahjlafbMxzpxO7Cexm
 5x7OMHshaD24ucLkkyC7hkKa0mY6t0n5JRKp+vsUudgcQLaAU+M/TQFAbjKIxJ+FhWBn
 t7AA==
X-Gm-Message-State: AOJu0Yxuk1tE5zvsoSyjMWGcQHtZcf5NJSXD14n9wZqQePJZ8vWK1dl4
 uJ7hToPy6Mpbe6TEe0bPf/neiedDk1K3BPBl4OGK/LvvN48i+MRNJE/R952Mfc0QO6LLunC2feI
 P/ZKcs49IePeHoTAGy+d2aZC/0dzVx1pKU33C1LpRT1NRGKno7IkmfYP3VjNmMbL5uQGRRnPb5j
 YItIMUUAc43Vh5K/uSdZGOAnMxKId0BG12ev5GT6g6G0EXcMuMNZs2
X-Gm-Gg: AeBDievgByJGNUu+FPAgsoP/oYlJAwXg11blblvh9a4lz99ncy/yDKUWUQ7CCLR2MIQ
 54Rv/rR7Mayw3N9L1EdBzZGFwFXyE6LapE6qvdlFHdMQJnGq3kqJ6WgzFLOaFlmTgvv0BBL3DUh
 fapY5tbyntQd6XXDkVPV3zbFOUbBGFa0d11nWcKU3EdFv3UZ+dyVd8Mqr8wPw/y5nK5ENS3mAn7
 7bXvUsucuPFFCSEvLOq58YWx3EZJw9aVcGvSXNDVx6CQk0VL3fQFSSKqCv5V2KjIbQDTSRABBH6
 cg==
X-Received: by 2002:a05:690e:419a:b0:654:64f5:ac8f with SMTP id
 956f58d0204a3-65464f5d05fmr6594138d50.51.1777047509844; 
 Fri, 24 Apr 2026 09:18:29 -0700 (PDT)
X-Received: by 2002:a05:690e:419a:b0:654:64f5:ac8f with SMTP id
 956f58d0204a3-65464f5d05fmr6594109d50.51.1777047509421; Fri, 24 Apr 2026
 09:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260424095521.33655-1-phx0fer@gmail.com>
In-Reply-To: <20260424095521.33655-1-phx0fer@gmail.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Fri, 24 Apr 2026 09:18:18 -0700
X-Gm-Features: AQROBzCu_a9ui2FBE65ER7WjRBzugAzWcYrhWaqxAAauR-7r8oCAfPSacLdq1J4
Message-ID: <CAKCV-6s6ACDe6o_m7kmnd2nsd3oFyu+nrDTuk-GsAt_8cRHhQA@mail.gmail.com>
To: Dudu Lu <phx0fer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH] apparmor: fix wrong dentry in
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
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 8ACEC4613EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.61 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phx0fer@gmail.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,canonical.com:dkim]

Noting for the record that this is v2 of the patch, since the patch
tag is missing "v2".

Ryan

On Fri, Apr 24, 2026 at 5:19=E2=80=AFAM Dudu Lu <phx0fer@gmail.com> wrote:
>
> In apparmor_path_rename(), when handling RENAME_EXCHANGE, the
> cond_exchange structure is supposed to carry the attributes of the
> *new* dentry (since it is used to authorize moving new_dentry to the
> old location). However, line 412 reads:
>
>     vfsuid =3D i_uid_into_vfsuid(idmap, d_backing_inode(old_dentry));
>
> This fetches the uid of old_dentry instead of new_dentry. As a result,
> the RENAME_EXCHANGE permission check uses the wrong file owner, which
> can allow a rename that should be denied (if old_dentry's owner has
> more privileges) or deny one that should be allowed.
>
> Note that cond_exchange.mode on the line above correctly uses
> new_dentry. Only the uid lookup is wrong.
>
> Fix by changing old_dentry to new_dentry in the i_uid_into_vfsuid call.
>
> Fixes: 5e26a01e56fd ("apparmor: use type safe idmapping helpers")
> Signed-off-by: Dudu Lu <phx0fer@gmail.com>
> ---
>  security/apparmor/lsm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index c1d42fc72fdb..e8de919fbea6 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -409,7 +409,7 @@ static int apparmor_path_rename(const struct path *ol=
d_dir, struct dentry *old_d
>                         struct path_cond cond_exchange =3D {
>                                 .mode =3D d_backing_inode(new_dentry)->i_=
mode,
>                         };
> -                       vfsuid =3D i_uid_into_vfsuid(idmap, d_backing_ino=
de(old_dentry));
> +                       vfsuid =3D i_uid_into_vfsuid(idmap, d_backing_ino=
de(new_dentry));
>                         cond_exchange.uid =3D vfsuid_into_kuid(vfsuid);
>
>                         error =3D aa_path_perm(OP_RENAME_SRC, current_cre=
d(),
> --
> 2.39.3 (Apple Git-145)
>
>


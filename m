Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YME5Cbom+Wmz5wIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 05 May 2026 01:07:38 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2A64C4BE5
	for <lists+apparmor@lfdr.de>; Tue, 05 May 2026 01:07:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wK2Ne-0006zy-NV; Mon, 04 May 2026 23:07:14 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1wK2Nd-0006zk-Us
 for apparmor@lists.ubuntu.com; Mon, 04 May 2026 23:07:13 +0000
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D328D3F7D9
 for <apparmor@lists.ubuntu.com>; Mon,  4 May 2026 23:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1777936033;
 bh=ssVb86+jfD/S2qPL+0y+FPSPATFi9sK7H1stX9EYSAQ=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=mYzUq5Z6I7MYtiJjeOYs9MXp39Q6W8gVMC2qZBmCwts9huMHpViPhSy644poRWxv8
 qmHGh+wxDNdsOP7IDbaFlEUyDEM5Q4rrNwsH250lRu023o+YH9vZmi7zg29AE3QRJl
 NJoGg3MaweczZDjlkPmGLP/rfMHnLcW7uREPq5gPk8gVyz2ii5GGjhG64VFWtUgW4k
 NyZRAR2PaSoC4wtKXTya55SNpNPcLaq366VLc/w9W7VT5ndwRoHN9unDLIJ++UZk6P
 DKdjc98isFNmB3P7F5/uuBtZS73xxyi2OLrugfBeARkzDpuZvMxvfuyCpTWvGUQAaQ
 6f4djwWNCMBMPgBF2vjBfiZZO2empTtbE6hYVHXTCBn1aVvZj43lItlDu845bedIYZ
 YypKqpvY2TsiE1gV7Rk0kX29ZLyKZz9uq7MyDW4HOeK39yXK0OxWWi7jVoOKfj0Xsh
 w612KV01xqt0KHD7sgcH4xtFJseFK+VL1Pi0fEChkv7IRDNPpw4sO1Aw03+QI6RM65
 lCS60hWXzFF4/04KlSvWrlFZPgbldScIIYyMy+AciBRlYrPZ0D2FOE7QMwViWCP+4X
 U2hXuL4D61VrkOyxjHogDtaAVwP1eZp4ZadjyOJ8m8KkoaHlkzKkKfF7bm+MMP0s7q
 aCp3KJNF3uKcoFIKshi0uY2g=
Received: by mail-yx1-f71.google.com with SMTP id
 956f58d0204a3-64eb0bbab48so4060744d50.1
 for <apparmor@lists.ubuntu.com>; Mon, 04 May 2026 16:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777936033; cv=none;
 d=google.com; s=arc-20240605;
 b=kMa4kEr65xljurHcnxNrP/JsGPaHb7/lr3MGpqB1kmWlNPZcJyNSAYM/QXoYoEXVpy
 cGtnE8yXnqQ3W6vewQBH2OxgFTndCbIkffcFp3yN5/WlzY4otEQU/ADl5sBJdGpOk/kH
 15svlP4A14wEYG4qYnmZZSyAy1S1XwQ4G141whnjmZlolhG3sXofHdkcgJ9OuoW43Esd
 Kvsur32/9pl02nYtPlvxs920SbFJHU7pMBmbPqaNhTSgqJU66Ss6h54Y7fTcfW7jKC2q
 3a49+M+es1moNtJbXX91Kf30vJkKJiNwVKM6s47ZM+xIe2IHTA9H76GRY3dJ7RsncYLc
 PwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version;
 bh=ssVb86+jfD/S2qPL+0y+FPSPATFi9sK7H1stX9EYSAQ=;
 fh=3T5Wv/w4ScmaDyEH8hw/uHCvG6gGqW000H39xR4qxxM=;
 b=BSiBCha+8EQDSDIv674BFGz2heffhuoK1EwhuXqODSAZI7pB12f0j5+UjYHLYejmQ3
 i5p5GS/3LbvX6Dd79E26MbWbueE2uMF+e5kkmQ4Fo9bzIApnNLzh+6nxBOuBlexEtwSB
 rkAhco9RumF71IscdLubB/hoi6rAcG/ZIws4oxmrpKtymk0FHHZI/MaeIRcU8bMLd9Pu
 HSMt/w/33TZNB8jaAti3+iwcp/ak6ddqPs0viH0gqVIWl4Z5l3bXWjD4F09F0oSVserM
 eKhJg023DInxnKiOKAzqKJT5GzSEpCJiLe7wkHYeSc1qZ05LGFVHorMjR58wdX0B5VgH
 bUrg==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777936033; x=1778540833;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ssVb86+jfD/S2qPL+0y+FPSPATFi9sK7H1stX9EYSAQ=;
 b=Z2/RK1vUFuS4M9FTTgjfHexHrk+sTNKOrZxZUaYaZ6aJPLWbDjllCJF+IylSs7Ffq0
 tReiCBAEBHKJaOOADSnOQKIo9Kl5Gsq0o3G6Lq9ii70bVZwjuUYNNIWeRAKPhuc5gpBf
 xIarboCIgxekv6g79o4sZYe6bJZ4sRfyNhJq/HzAvXXeykPZSrWm81ZO42Ch+K50PMGE
 tWJ2Kv6UkwCaeog+14Ob8mCLGsbw89RXaUVOBXwCObqBBmHb6jIkLbidb8oy6H5h8lVM
 LbaE0xhqb2D81Ptk737ogCf46+dM7zYrI21LIWTaaHWsgNhiam/S8h80hrM7zH+Cb8Lu
 DCog==
X-Gm-Message-State: AOJu0YxPy5/RpO8jNHGMwNlNLOPJ4CUGZH0I7s9EJ3LsNv6IJu4hsdAl
 AC6Deg3b5Cc8yFCWVpHlzOtLcWVwyvoUXDr+fVX2dU7fD+ooDBN8P4+Ik9HjL3GxOouIlKZcZLO
 1LxE9kwN3hv9z+MmZhaxyU3UwfSrDYcv7+u9vnHP4XdD+Tt/2AXCTndF8EsTcHb3a91pLd5bFvT
 TmSpnynKv+Gn+yU0wcTisYl+f7O0o0xN1sSNhInAPzSY2oTHuUJI6d
X-Gm-Gg: AeBDiesETukbP1xufakc9D6cNasYE1CWcJ6NZjwZ2hvANOUiUaEFSq5NEzhxt3gk76a
 j736P+RRMddFDCIHFa24O93FnPLIRMcmoSf9wAeD3Q7X2MJ/vw+JltwogTmaho4o9NABjgM7IgS
 8TCufXNsbfEKl6Kd/dvNfYDxppq0Ta63fj0fHc/k1Ax5YKuLOTTFjc/P4gmHlP1LmGybFz6ykYk
 xgF960Kr9D1Uoo/ebGkeYtQ8YBbPJWWJoW5IOQEWJalj1rBVpBVC9mcNX4uaSlPmpxbhClC3H06
 Qw==
X-Received: by 2002:a53:c043:0:20b0:658:e45a:e477 with SMTP id
 956f58d0204a3-65c67e12a7bmr1167844d50.2.1777936032856; 
 Mon, 04 May 2026 16:07:12 -0700 (PDT)
X-Received: by 2002:a53:c043:0:20b0:658:e45a:e477 with SMTP id
 956f58d0204a3-65c67e12a7bmr1167826d50.2.1777936032449; Mon, 04 May 2026
 16:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260503065436.141917-1-me@zygoon.pl>
In-Reply-To: <20260503065436.141917-1-me@zygoon.pl>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Mon, 4 May 2026 16:07:00 -0700
X-Gm-Features: AVHnY4JBUE5PECSFTLzPuCUJGo71P0d2qz-vZxNWd8xba472uUQGbc5lDUefKn8
Message-ID: <CAKCV-6tdZgpHqLWESs37-AafeeXYnk6DdXr-HqABZLyEoYT86g@mail.gmail.com>
To: Zygmunt Krynicki <me@zygoon.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] [PATCH] apparmor: fix leaked peer label in unix file
	checks
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
X-Rspamd-Queue-Id: CA2A64C4BE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.61 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:me@zygoon.pl,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER(0.00)[ryan.lee@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,canonical.com:dkim,canonical.com:email,zygoon.pl:email]

On Sat, May 2, 2026 at 11:55=E2=80=AFPM Zygmunt Krynicki <me@zygoon.pl> wro=
te:
>
> aa_unix_file_perm() has an outer plabel variable that is released at
> function exit. The only assignment re-declares plabel in an inner scope,
> thus shadowing the variable from an outer scope. The reference returned b=
y
> aa_get_label_rcu() is then assigned to the inner scope variable and leaks
> when that scope ends.
>
> Use the outer plabel so the existing exit-path aa_put_label() releases th=
e
> peer label reference and the successful cache update sees the same label.
>
> Fixes: 88fec3526e84 ("apparmor: make sure unix socket labeling is correct=
ly updated.")
>
> Signed-off-by: Zygmunt Krynicki <me@zygoon.pl>
> ---
>  security/apparmor/af_unix.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/security/apparmor/af_unix.c b/security/apparmor/af_unix.c
> index fdb4a9f212c3b..d7b1461a69635 100644
> --- a/security/apparmor/af_unix.c
> +++ b/security/apparmor/af_unix.c
> @@ -758,7 +758,6 @@ int aa_unix_file_perm(const struct cred *subj_cred, s=
truct aa_label *label,
>                            unix_fs_perm(op, request, subj_cred, label,
>                                         is_unix_fs(peer_sk) ? &peer_path =
: NULL));
>         } else if (!is_sk_fs) {
> -               struct aa_label *plabel;
>                 struct aa_sk_ctx *pctx =3D aa_sock(peer_sk);

Also of interest is that the only assignments to a variable named
"plabel" occur inside this else-if block, which means that the
update_sk_ctx call in the cleanup also always did nothing because it
is always being called with a null plabel. Might there have been other
latent bugs being caused here besides of the resource leak?

>
>                 rcu_read_lock();
> @@ -796,4 +795,3 @@ int aa_unix_file_perm(const struct cred *subj_cred, s=
truct aa_label *label,
>
>         return error;
>  }
> -
> --
> 2.53.0
>
>

It might make sense to try to move the cleanups around given that
plabel is only really used inside one of the if-else branches.
However, as this is a minimal patch fixing the issue:

Reviewed-by: Ryan Lee <ryan.lee@canonical.com>


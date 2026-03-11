Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF+4AK7asmlMQQAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 12 Mar 2026 16:24:30 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 82500274511
	for <lists+apparmor@lfdr.de>; Thu, 12 Mar 2026 16:24:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w0hT9-00054N-EL; Thu, 12 Mar 2026 14:56:59 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <wenst@chromium.org>)
 id 1w08yz-0007WU-G9
 for apparmor@lists.ubuntu.com; Wed, 11 Mar 2026 02:07:33 +0000
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5a13d1c6f25so4703787e87.3
 for <apparmor@lists.ubuntu.com>; Tue, 10 Mar 2026 19:07:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773194852; cv=none;
 d=google.com; s=arc-20240605;
 b=fsvtkwzx+gPT7CsDd8+orhLnWpzsyp1o3f4oLQblh40gTEU+GiGvDmAZEb2u65N5Iw
 jeGeoLkSKiJX8geSnBSnj1UVdvemi02PaLccLBmbCpLBIx8DNwEyasUo/o1HEnIIgy+U
 cD/+thWOpl3BvpqGnudOtKpPFswc7Znsgb/BAo56wtZMZL+PFzuEoZq3mP0xRZOp0FXH
 qTIoqlqOW2TpwbV1/hsGoLXY3/r/0CY4IXb9ZjFEFItHBbhO2NxDks4aYKBSypBMGrQz
 JmGDSBQFPsUAh1vZqqPE2LNUkk/wedJU8RjcXokBMNGSbgPvgif76X/lz4v4jmAZGvcP
 QqSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+zLBLQzKjcztDlxJqoLP6w+B6xnZmfHibV4jlBQCebA=;
 fh=vzhW3SdDIB6cLzIjXSiZS4V0bVi9XCu4FgeDBIU8CeU=;
 b=erV2Zt0NPZ4hWbryym0538pNrO3TO9JzTzqI/84jX4XKtooE1HP6RA9tilXQGZUyKp
 DxACOTaUiPTSllJ1+/KXy9mT7J40TQWZ9dc1McCwhHo33cWoBx+cV9OE0ipw8cBNYtLt
 hHDEwA4ZmQwVh+cTBB8HKrFwTtF1H/EASkKLPtVKCDcyN3iAM991TVLgQ2oSR6kqsphx
 8GnmYBPgYq9CLe2o1Qy4AV0JVZpcAnNdSRHMltiw2VP1TSsxlU0CE+aTmAuRB5pLZPkC
 2xDhOkux6dMPcYV/HncbtK/RH9CchhGsRSGNKa7bdo0dSWC20kxVTPTkyXj5f5adix7a
 8maw==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1773194852; x=1773799652; darn=lists.ubuntu.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zLBLQzKjcztDlxJqoLP6w+B6xnZmfHibV4jlBQCebA=;
 b=HUrplvfj9PcSH8UhbRHT68IRpD6y/T2QHTvaeWELV0G5N6GF/DlOCWhnR68wF5NkJV
 1KfkuvBx3Pw34NQAyK86ugcx3YP1DPc65e0UFe2LME+7D3CSqHp91nXTh9XLS3uEVL5m
 qDO/kMrUvNCGSX/f2WXC57I6Y3xY1lHGjmiL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773194852; x=1773799652;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+zLBLQzKjcztDlxJqoLP6w+B6xnZmfHibV4jlBQCebA=;
 b=YbhpJ2h9lnmKyf/oDKSfSFFI2cFo7yrQgX0xKydXtWcN3vwk9qKNS66okLpY0r9JJL
 gCeC8irjw6FEqYr1ujg1rnJnk7Kw0PBXdz034R83l2aH6VPunUaV8I5aahZjFyxjKPBe
 XciVjTKWvHmK5qNgc9gOt7uL6k9+2Z/uu4ewLrEJAGrtHB8nlbLFOv13BAXgIRz2RR6l
 wrO3UEncFlr3e8vntk2xWRO9ajAEGpOpbloNWlXq6WamN78j79nRbJ0lxswv1Peocr9f
 tXMbk92BR1O2Ncgn8x7JbtlW2DyZo6dqHTkssBBffy2Mik5wr/sB8s71diwpydmt2sxk
 AR1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoUEwGOAjFAw/Hc08+5FmcFKB3Lw50nxCp1nQ/iq0/3P4Rfzq/2bZT7BDJYeNlqEpd7tCFGgXfJw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzN4c1/0F+NilMxKkSd0oarWj5BoQG9Ou7O3Dmzdv9A0Jk4YVSp
 NKE/raS+zK3oPTpGWHcUM62fqKdf9ZbBWmdVsX9TmFypf8w59iZily/aTXtCQpO3uUh85tCf4p6
 5FihpetEqqTeCyGebiKu6tU06w9xgCcE5xj5NmjjQ
X-Gm-Gg: ATEYQzwVs2SW9nP52iFj79cRTv7jqRHZtawym035y6k5mI5jS0hxvH+HCUUSprVfy/1
 tlYLM7BlANdR6o4cyvcazr4wjyme0k/2DzXDk1Cx/KU6GsoSQbPRv/PL+tKg1NY+XCd5p4+Yjtj
 rlspz4RsxBxLDIG9rEStz/Ne3/1yZWvSQkp2REdf5aJTTHRbOwBXOa1XJvFWMsoAqKekq0VHU0s
 mRVNGb8mG313bq7SoFhw+fpQno0ZBRo+vSvf3qutMezDXZ8BRfw2B2ZkdAPtiaXXfAARYmtZIdN
 WS4uIzOXOw==
X-Received: by 2002:ac2:4427:0:b0:5a1:3134:9bac with SMTP id
 2adb3069b0e04-5a156cbd1bbmr169453e87.28.1773194852284; Tue, 10 Mar 2026
 19:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Mar 2026 11:07:21 +0900
X-Gm-Features: AaiRm5028PWt8n-JnveiRgn8oYMksdR_-_nk4JOkvxMfplWs-GDr7RRk-OxICyw
Message-ID: <CAGXv+5FQAVaJjqhv+Xq-ysOc4SHQn2mCNTgCAp8XocmWBWGGoA@mail.gmail.com>
To: Philipp Hahn <phahn-oss@avm.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.52; envelope-from=wenst@chromium.org;
 helo=mail-lf1-f52.google.com
X-Mailman-Approved-At: Thu, 12 Mar 2026 14:56:57 +0000
Subject: Re: [apparmor] [PATCH 56/61] clk: Prefer IS_ERR_OR_NULL over manual
	NULL check
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
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org,
 samba-technical@lists.samba.org, Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-sctp@vger.kernel.org,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-scsi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, intel-wired-lan@lists.osuosl.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 linux-media@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 apparmor@lists.ubuntu.com, linux-sound@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@kernel.org>, ceph-devel@vger.kernel.org,
 linux-omap@vger.kernel.org, sched-ext@lists.linux.dev, cocci@inria.fr,
 linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, linux-s390@vger.kernel.org,
 v9fs@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-modules@vger.kernel.org,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [3.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	DATE_IN_PAST(1.00)[37];
	R_DKIM_REJECT(1.00)[chromium.org:s=google];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phahn-oss@avm.de,m:linux-hyperv@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-sh@vger.kernel.org,m:samba-technical@lists.samba.org,m:mturquette@baylibre.com,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:gfs2@lists.linux.dev,m:linux-mm@kvack.org,m:linux-sctp@vger.kernel.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-phy@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:iommu@lists.linux.dev,m:intel-wired-lan@lists.osuosl.org,m:linux-arm-kernel@lists.infradead.org,m:linux-input@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:tglx@kernel.org,m:linux-media@vger.kernel.org,m:dm-devel@lists.linux.dev,m:linux-pm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:linux-sound@vger.kernel.org,m:lin
 ux-block@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:daniel.lezcano@kernel.org,m:ceph-devel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:sched-ext@lists.linux.dev,m:cocci@inria.fr,m:linux-nfs@vger.kernel.org,m:ntfs3@lists.linux.dev,m:sboyd@kernel.org,m:linux-s390@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:linux-modules@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wenst@chromium.org,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:-];
	RCPT_COUNT_GT_50(0.00)[58];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,avm.de:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,baylibre.com:email]
X-Rspamd-Queue-Id: 82500274511
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 9:57=E2=80=AFPM Philipp Hahn <phahn-oss@avm.de> wro=
te:
>
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
>
> Semantich change: Previously the code only printed the warning on error,
> but not when the pointer was NULL. Now the warning is printed in both
> cases!
>
> Change found with coccinelle.
>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> To: Daniel Lezcano <daniel.lezcano@kernel.org>
> To: Thomas Gleixner <tglx@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  drivers/clk/clk.c               | 4 ++--
>  drivers/clocksource/timer-pxa.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 47093cda9df32223c1120c3710261296027c4cd3..35146e3869a7dd93741d10b72=
23d4488a9216ed1 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4558,7 +4558,7 @@ void clk_unregister(struct clk *clk)
>         unsigned long flags;
>         const struct clk_ops *ops;
>
> -       if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
> +       if (WARN_ON_ONCE(IS_ERR_OR_NULL(clk)))
>                 return;
>
>         clk_debug_unregister(clk->core);
> @@ -4744,7 +4744,7 @@ void __clk_put(struct clk *clk)
>  {
>         struct module *owner;
>
> -       if (!clk || WARN_ON_ONCE(IS_ERR(clk)))
> +       if (WARN_ON_ONCE(IS_ERR_OR_NULL(clk)))

clk_get_optional() returns NULL if the clk isn't present.

Drivers would just pass this to clk_put(). Your change here would cause
this pattern to emit a very big warning.

I don't think this change should be landed.


ChenYu

>                 return;
>
>         clk_prepare_lock();
> diff --git a/drivers/clocksource/timer-pxa.c b/drivers/clocksource/timer-=
pxa.c
> index 7ad0e5adb2ffac4125c34710fc67f4b45f30331d..f65fb0b7fc318b766227e5e7a=
4c0fb08ba11c8f9 100644
> --- a/drivers/clocksource/timer-pxa.c
> +++ b/drivers/clocksource/timer-pxa.c
> @@ -218,7 +218,7 @@ void __init pxa_timer_nodt_init(int irq, void __iomem=
 *base)
>
>         timer_base =3D base;
>         clk =3D clk_get(NULL, "OSTIMER0");
> -       if (clk && !IS_ERR(clk)) {
> +       if (!IS_ERR_OR_NULL(clk)) {
>                 clk_prepare_enable(clk);
>                 pxa_timer_common_init(irq, clk_get_rate(clk));
>         } else {
>
> --
> 2.43.0
>
>


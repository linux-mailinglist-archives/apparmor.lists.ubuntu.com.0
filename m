Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKotHeorA2oR1QEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 12 May 2026 15:32:26 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC625213D0
	for <lists+apparmor@lfdr.de>; Tue, 12 May 2026 15:32:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wMnDU-0006dU-DR; Tue, 12 May 2026 13:32:08 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1wMnDS-0006cS-De
 for apparmor@lists.ubuntu.com; Tue, 12 May 2026 13:32:06 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2ad9f316d68so25266215ad.2
 for <apparmor@lists.ubuntu.com>; Tue, 12 May 2026 06:32:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778592724; cv=none;
 d=google.com; s=arc-20240605;
 b=SKdcgJ9PB2B4+OwV9FELxbY7S76LDyB+nrcnWqERJ/aomFSP802fIdcn5Tk3Aa3d7z
 q4DBw/ob7WnrDII+EZtSTm1ODQczZJ9jdmCvAHj7bPbApwvZ/EfRzVUeObdB2YKjnHgm
 q827YYwpPivqsvPbENhnBHl7nORDUtjNEtELdVB+1+LVxdWUjtx9qqGRPpCjBfgLPwmd
 AYzVTnB9GGQXeqVO6/z8pF7F8i8qongMjot+etL4FCe36wLAgKkqd2wJ1MSoc4opx1wq
 hHnY34uKUXDnlmGgxsU61k0hVEXqXyiNT/hW321ajNBzrnOGMHpvk2jdIMaLsJ5ae7sl
 QgOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=0/aQ9mwTMsHh/sgB4/Y2KBsn0VNAa/XO6yw99kEeKn0=;
 fh=CH/cQZr5D1Hs1z7vNTuyz0Lf4nsEOGr8ZROTN4ZeXGQ=;
 b=NrFqG6N07s5BQ3ER1U5NDiRAjbrlnM5AT+f4n8oW8v9gJZ2M+kNcwt65D3iMx1+wZE
 /BRXOobbtqqv2SgKP14jAC/ssqiK9QYkCxao30+PAYeFn37kC5r3uCf5LyMI4T+l6oOU
 iHEXhS4X75kcbiHc2nrWT+0EmF4G3lfnDjqCDbC/gl9C7CJeIrNQw5AM1TP85004aCXV
 9rKX5J0HDsDqu04PiBndSGw/hHeiQp3En6PRlODS1MlX9AQLAiyYtDPmzbCO5i+t39/8
 flx95J5hqfmSHsh3P/Jt1erxOgLzg6o74AR36kOmJdjQUH+iFkoxL75RkyuliDiAqk/e
 5DUA==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1778592724; x=1779197524; darn=lists.ubuntu.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0/aQ9mwTMsHh/sgB4/Y2KBsn0VNAa/XO6yw99kEeKn0=;
 b=Z+Xwc+QO4ZTXppYm7U2QCx3y8ZikKa7Vw+E842687lJlyHg/eqEStT2+8smWvHKD5x
 kjgrbTsCAojtqQNkICxoQx4fKUctQ1PY3+qXE6Ixb/JSGTaGV/aT3WhydZEFcqUqItBo
 PIbqwGzoFEGXB9VDnp57+3Lyk2DhxuiwMKMjNKTVWENQ+t95uCN3wNwx8oq34OndbP/J
 eB3jqzmIitDxw3yYWBF2YNg+NrXgNn/pShn0Wwr5kmvTTIdUQIBs4tsPtLSgKNEJ/241
 tNXDPfqrLtbaXGl+3VVei4eIy8fxdaviGw/q3eYBJRXM/8I8vrHqRETH2s8MgRTboRzU
 jLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778592724; x=1779197524;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0/aQ9mwTMsHh/sgB4/Y2KBsn0VNAa/XO6yw99kEeKn0=;
 b=sQH+OQR+9uJNFZGf4AwMjk5ML+g/0ApKwyB4TPH1sQJ294TZwRhHtyvCKuXcYT6PeX
 WOBHWYoUI+VCOJwVhOaJn+YCdWZYHMwVS2TnLbLaVmZphyrh2Ld11SIAxwWdFAMWPLOj
 el+D9+jcGfpm16cv15cvltFIPPLVrBU2zDn9ol4cc0lgt3LJwQtPPfRlhhAijD/hMxgC
 VbxTFC3cD8uSQ085UY2zmJOiE0H6DF18/qZXhKmQyQzioWlC3s9Dgj6eW4n+bDMiUuTg
 k2dNuRUUhDlkdWPHUn9nLj+k5gt4Vy+PXD3ICsNoROu/VEN9DCPrYczBGoxhIHN1/0dO
 ycVw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Vwn/6zwUxfOvKVU0qsv+kVUJ1ItDmiDlJd4Q7rZnfJCvSCblikb3C3vTVzZTokz738q3DEtpslw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwHToNUazRnQEMTHscZzebzQIuZKcz46qj9Kf9mkFfT7DH0eutt
 F8I1lkE9mEzgoydglqLIhN5lHw/jTxyBu70YS383t8ONPbk/w3gsOt3bofN5iMFEYRD454RyLXt
 mqqXnh88n7+XUCV5iNI6whHZDbjoJzvF0BAKJj9yu
X-Gm-Gg: Acq92OGPu3CfUe+lYmnoV4VVv5s4n1iXaVUyVOU1VSAfM2Vg7xJuAhTYX6YixJqq5ag
 MaBU13ZoW8nP3LEv52w/qnR3K+XpHPkXgKdifP2ShxfK5JIhx7ezX1uYU5trEQ3m2J8sPjbea8A
 lI+zP8b13waQ+iM9oNiTll1Z1plKma/37dc3fhl54BDJ/W6lTb3+DWx1+nbTGtZWjfUWwPxH1CS
 JuJHKrW6lF6A+OmvaColhhoymvSsK4rQFssB+QaBwzb12x2ohd3JjiZqjRqUorFPOQILP8DKreM
 FHvMzSVhp5bhG0kGTw==
X-Received: by 2002:a17:902:f805:b0:2bc:dc0b:ab1a with SMTP id
 d9443c01a7336-2bcdc0bad76mr55621515ad.35.1778592724418; Tue, 12 May 2026
 06:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260509015208.3853132-1-song@kernel.org>
 <20260509015208.3853132-7-song@kernel.org>
 <42a9075e-a4b4-4eb7-b96e-48e5c0cd2f3a@I-love.SAKURA.ne.jp>
In-Reply-To: <42a9075e-a4b4-4eb7-b96e-48e5c0cd2f3a@I-love.SAKURA.ne.jp>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 12 May 2026 09:31:52 -0400
X-Gm-Features: AVHnY4IPU0C4Y8X9_dcIUSlLPhJJAw5e4I09h5zch8q_eb3KJ5_1mBDuZ4l2gH4
Message-ID: <CAHC9VhT9vvaoYpRX4fPZ_H13+PaqG72CpRbS+d=9xgMBaKHo8w@mail.gmail.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.214.182; envelope-from=paul@paul-moore.com;
 helo=mail-pl1-f182.google.com
Subject: Re: [apparmor] [PATCH v3 6/7] tomoyo: Convert from sb_mount to
	granular mount hooks
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
Cc: herton@canonical.com, brauner@kernel.org, jack@suse.cz,
 selinux@vger.kernel.org, stephen.smalley.work@gmail.com, kernel-team@meta.com,
 apparmor@lists.ubuntu.com, jmorris@namei.org, omosnace@redhat.com,
 Song Liu <song@kernel.org>, linux-security-module@vger.kernel.org,
 viro@zeniv.linux.org.uk, gnoack@google.com, linux-fsdevel@vger.kernel.org,
 takedakn@nttdata.co.jp, mic@digikod.net, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 1EC625213D0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[paul-moore.com:s=google];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[paul-moore.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:penguin-kernel@i-love.sakura.ne.jp,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:song@kernel.org,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:mic@digikod.net,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[paul-moore.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,vger.kernel.org,gmail.com,meta.com,lists.ubuntu.com,namei.org,redhat.com,zeniv.linux.org.uk,google.com,nttdata.co.jp,digikod.net,hallyn.com];
	NEURAL_HAM(-0.00)[-0.550];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,paul-moore.com:url,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,i-love.sakura.ne.jp:email]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 7:03=E2=80=AFAM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> On 2026/05/09 10:52, Song Liu wrote:
> > Replace tomoyo_sb_mount() with granular mount hooks. Each hook
> > reconstructs the MS_* flags expected by tomoyo_mount_permission()
> > using the original flags parameter where available.
>
> Please fold below diff into this patch. Then,
>
> Acked-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
>  security/tomoyo/tomoyo.c | 60 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 58 insertions(+), 2 deletions(-)

Thanks Tetsuo.

Song, assuming you have no objections to the comment blocks, please
fold in Tetsuo's additions in your next version and add his ACK to
this patch.

--=20
paul-moore.com


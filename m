Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDWtI1pD/mlFogAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 08 May 2026 22:11:06 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2C54FB5D7
	for <lists+apparmor@lfdr.de>; Fri, 08 May 2026 22:11:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wLRX9-0001gh-4a; Fri, 08 May 2026 20:10:51 +0000
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1wLRX6-0001fV-LF
 for apparmor@lists.ubuntu.com; Fri, 08 May 2026 20:10:48 +0000
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-36608b2f2dcso1595837a91.2
 for <apparmor@lists.ubuntu.com>; Fri, 08 May 2026 13:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778271047; cv=none;
 d=google.com; s=arc-20240605;
 b=jYaJ3kYX2f9POLn47hJCIuzbiwF6UdfTxz3qvUWpC4+eXQolaH07SEDxyK50ql0STf
 8IbY7pfmyzK9xGHiXFYxtGdCfsXghq0Zc/SiXw8/4RRYiWHaLuKG0iOT9BwOpUYJyOmB
 pwAsCpLM6Vwv6AQSKElRhr4qXMkb4xBTTLtoGUxarAmgGj7p8G906CQwYPcVzrAbj+CU
 CgikOsfXGstWuIk0i/J7T8RHtdG0v5nbT17tpPN8AY2jvGpEbfpPbUUheIsO6RjY/BeK
 M7Ap/LDDcZaUdzGY7wfglvXFMcWM4fO1/D/nShoKo1C2NhXknPEZSNFJPChSq/mvvugc
 Idqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RHUkpCYBtC8f1kSrbyE8l06+fmWuae05jJfS+5AeM9M=;
 fh=L9qgbQJGOCc2LxxjXfZIvFWiHWQ1gwCvbTCIdYoG1FU=;
 b=i9JOHiZkxoXIzo564Va9+NHbiwLti85GzpfsbLIcqPwGNy1N9Qq9VrZhZQaBGGhg4W
 rHT9B9gMR2gLOoFsXMRGSQP4XlRmhWkNN8jZkhiSdLiMONgVNORTF08xxfXXj1dg6YfA
 WCA1KTzHFIZ3jJUzlHFHxFFVdSHnnAH+Eq+FzBZu4tLYn7IaIbdwyAAE3xLZQ1+mL06y
 jTFmsIYEUmjvOYRpL11ALS1PMmR3ICvx8g7zt89dkpTEpbL0cTeoeHfP37ychPLkYw8R
 ad51Dhlntjr/ZRIv/UNhDTqvKi+pag2b1C8Xu2antG62ycjxcKsWzwRh4fL8m3xKNEeF
 M7QA==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1778271047; x=1778875847; darn=lists.ubuntu.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RHUkpCYBtC8f1kSrbyE8l06+fmWuae05jJfS+5AeM9M=;
 b=Fa6SmGMArk+GRrmHWRPd5rYTuZsPKrjqZ8tlPmWPYx3/LlcIA2grUKMZvNhC6+zoq0
 MeN4LlkdVV3QkAko3ayaOn8eug8LPI4vSv2VVz6j6YFDrnhD5gW0AUGUCywdEE8LmlDQ
 oT76pmA4Ki6rP4T+4z/1oXTDiblpPxgS2nlIWFBMi92PgHEKvNze1Ijg0wJ0ZE/DTp8q
 vfviO6z9afzpqHWGsFTtlUixe8AA925JsUnP5OUri4Xrs47grK7GmoOPhb759ZP9P1lf
 +ojm2IPu5lZvnq6L2yHSmR4cwcy2aexQx8vWusD/YDKm71VCCsDdKdACDuNOraubhsiJ
 oD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778271047; x=1778875847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RHUkpCYBtC8f1kSrbyE8l06+fmWuae05jJfS+5AeM9M=;
 b=Wk7Vr7JWhdOOJR6dj7cogzola9MASFKEoxFin8MsfvR1OhuCeXwCYyQvPZ3U5zqVZh
 MPsn3Fa4WUD1IxzApzn9YeY9jc7gy0Bg6aG4Lb5ka78mtd2YErNrJI4sFdB+NU7NsT7/
 saShcifAfKtw9NMB71WNS0jip4PteBJ9IR7CyIiF7qP0Z6ztXqP7PJeXepS5IgBNmxBn
 2KTWrjK7eT0S8djeUsaNZsZ1TDX6vglkWDn+X0V1zYBjce1u1SjeACkmp6UNFXx4JceC
 izzvTIvUoxu34wtfXtMMWDQXVAxy+XJYWgJs4uB+GsmTGV7odpNZXNT8gHHjOxVVpbBC
 IdaQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8kNU6bqIJtRgs/7oU45xvtLOzphtSRKCcCRiZIcx+4xotO5lrYBRf67UeaQuNcvMoRlc2tw8U2ig==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YyUUrepIiQkjPJCQeeLZWuiMXs9YMKOpLt26Zirw1Q8U917CWx+
 96TRMCmxFM4+5DG1rVvQ33SUFNvCCDz84Czo6FuxCaZ4UexkRETLG1T/Urf4GhIHvEQICr+jjEK
 pnpTMnWEuUf0BIUspKMdBeQp3adodb3bA713fL4t3
X-Gm-Gg: Acq92OER2LZRaala+xgnkEoJCg3TQ/WGkzur6CLr+O5keyoeFbuFVtZIPHskd3P1J6B
 cCV4kvhzOQ1bNBtKiLWPqw+ZrBTT0/z2Q5IPyeDtZEYsz7OMTtcvWDXbfGeCkMRlmR9CJCyoHcw
 gGRSzxq73Tb2mKKQxnjdZZaLdFFmeYm+Qx8trYEyj07xQu8yAg4qxDkOowh3SSEWIUQmHxZreuk
 5Sz4L/NkmpAiJYhv7AByVuYLw8pC0HrTZu9T3gwpViQzJkairEQmYng151CqGu2TwADnsBISDI7
 CcUHBfO2vc0BN9RVHQ==
X-Received: by 2002:a17:90a:509:b0:366:3ac:f730 with SMTP id
 98e67ed59e1d1-36603ad3f55mr6058264a91.25.1778271046680; Fri, 08 May 2026
 13:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260430000315.918964-1-song@kernel.org>
 <20260430000315.918964-2-song@kernel.org>
In-Reply-To: <20260430000315.918964-2-song@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 8 May 2026 16:10:34 -0400
X-Gm-Features: AVHnY4JzYJuAYc9q9BmVnJzCXV6FuyRu5-uJafEtOUSW60YQOAJP4PpQpgO2G2Y
Message-ID: <CAHC9VhT6YxJQqSkBbSeACFL6+AoL0031u2VT4fuRqPxDkGzSfw@mail.gmail.com>
To: Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.216.53; envelope-from=paul@paul-moore.com;
 helo=mail-pj1-f53.google.com
Subject: Re: [apparmor] [PATCH v2 1/7] lsm: Add granular mount hooks to
	replace security_sb_mount
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
 selinux@vger.kernel.org, stephen.smalley.work@gmail.com,
 penguin-kernel@i-love.sakura.ne.jp, apparmor@lists.ubuntu.com,
 jmorris@namei.org, omosnace@redhat.com, mic@digikod.net,
 linux-security-module@vger.kernel.org, viro@zeniv.linux.org.uk,
 gnoack@google.com, linux-fsdevel@vger.kernel.org, takedakn@nttdata.co.jp,
 kernel-team@meta.com, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 5F2C54FB5D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[paul-moore.com:s=google];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[paul-moore.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS(0.00)[m:song@kernel.org,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:penguin-kernel@i-love.sakura.ne.jp,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:mic@digikod.net,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:kernel-team@meta.com,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[paul-moore.com:-];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,vger.kernel.org,gmail.com,i-love.sakura.ne.jp,lists.ubuntu.com,namei.org,redhat.com,digikod.net,zeniv.linux.org.uk,google.com,nttdata.co.jp,meta.com,hallyn.com];
	NEURAL_HAM(-0.00)[-0.860];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Wed, Apr 29, 2026 at 8:03=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> Add six new LSM hooks for mount operations:
>
> - mount_bind(from, to, recurse): bind mount with pre-resolved
>   struct path for source and destination.
> - mount_new(fc, mp, mnt_flags, flags, data): new mount, called after
>   mount options are parsed. The flags and data parameters carry the
>   original mount(2) flags and data for LSMs that need them (AppArmor,
>   Tomoyo).
> - mount_remount(fc, mp, mnt_flags, flags, data): filesystem remount,
>   called after mount options are parsed into the fs_context.
> - mount_reconfigure(mp, mnt_flags, flags): mount flag reconfiguration
>   (MS_REMOUNT|MS_BIND path).
> - mount_move(from, to): move mount with pre-resolved paths.
> - mount_change_type(mp, ms_flags): propagation type changes.
>
> These replace the monolithic security_sb_mount() which conflates
> multiple distinct operations into a single hook, and suffers from
> TOCTOU issues where LSMs re-resolve string-based dev_name via
> kern_path().
>
> The mount_move hook is added alongside the existing move_mount hook.
> During the transition, LSMs register for both hooks. The move_mount
> hook will be removed once all LSMs have been converted.
>
> Some LSMs, such as apparmor and tomoyo, audit the original input passed
> in the mount syscall. To keep the same behavior, argument data and flags
> are passed in do_* functions. These can be removed if these LSMs no
> longer need these information.
>
> All new hooks are registered as sleepable BPF LSM hooks.
>
> Code generated with the assistance of Claude, reviewed by human.
>
> Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> Tested-by: Stephen Smalley <stephen.smalley.work@gmail.com> # for selinux=
 only
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  fs/namespace.c                |  35 ++++++++++--
>  include/linux/lsm_hook_defs.h |  12 ++++
>  include/linux/security.h      |  50 +++++++++++++++++
>  kernel/bpf/bpf_lsm.c          |   7 +++
>  security/security.c           | 101 ++++++++++++++++++++++++++++++++++
>  5 files changed, 199 insertions(+), 6 deletions(-)

...

> @@ -3708,6 +3724,10 @@ static int do_move_mount_old(const struct path *pa=
th, const char *old_name)
>         if (err)
>                 return err;
>
> +       err =3D security_mount_move(&old_path, path);
> +       if (err)
> +               return err;
> +
>         return do_move_mount(&old_path, path, 0);
>  }

While the security_sb_mount() hook calls into do_move_mount_old(), the
security_move_mount() hook calls into do_mount_mount().  As you remove
both of these LSM hooks in patch 7/7, should we consider moving the
new security_mount_move() into do_move_mount()?  If not, how do we
ensure that we don't lose coverage when removing the
security_move_mount() hook, or can you explain why it is not needed?

--=20
paul-moore.com


Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCMMB5/uhGkU6wMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 05 Feb 2026 20:25:19 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id EF032F6D38
	for <lists+apparmor@lfdr.de>; Thu, 05 Feb 2026 20:25:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vo4yL-0001L3-75; Thu, 05 Feb 2026 19:25:01 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <amir73il@gmail.com>)
 id 1vnvnm-0006Pm-Kr
 for apparmor@lists.ubuntu.com; Thu, 05 Feb 2026 09:37:30 +0000
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-65378ba2ff7so961574a12.2
 for <apparmor@lists.ubuntu.com>; Thu, 05 Feb 2026 01:37:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770284250; cv=none;
 d=google.com; s=arc-20240605;
 b=bA8JjWXP/gdF5qmPkzaza1Mba1petB8vPtWHhg2wUrRgxnQ5Z2J7hVRBvELaREPmh4
 10m67KWOpjEmKoRYpth2IU+9ijssip7wFKGx0kZDpCMvQrEjX27d/GQdgha9bwGHWh8M
 Xd4SwBSRCR1X3VrAxVb9gECd9QFnIudpja/DCGz3Gx/6kbrNxAGbQJbAw1j625lF4Ao2
 6IBXwEH4pcgpiu+5nTragWh3ocomVGmXgAaYLu/4jDoeY3blTsNJ7fu/dPRHq4IuGLYh
 Jo4uxEgjq6uEla4zgJyj7cPyY2cEYoW8okCzYy7Wom+RyHRVWSJuuG5N6iAkx+Cqk+KL
 Ekfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ts7BIpqOHUIYO1yz8UgL/PwCOZwIbnvcvFeQ/hBIaCk=;
 fh=4cgumQyOVqOaSuMXPM91IZ7FvECkPQSG/qPgaxU2n4g=;
 b=ifPy+lyWT8L2e4TPPfuKhvx6bKzsQX1rT0jdJgmwi/f2ls1gUtInW5sJdUdhfSwYXL
 A/7Z2o0WISfWiDLQo93giRZ4eKihmlOlUTZFk//qJQVbD8XCLosmgcCWJ++WLIetoJks
 K0OtEaDFIAYIwpAQy7zq499C/TbOthg6sh95oabwNlcUxFyhdRa5OKHAxdLB/NXtP87V
 NxAHVzwfVlqptilFZ5/y0duEIS4G4nJv9uE0sMxjmi1OeRRd9EKlb5rylOX9yuLhtmaR
 7fBvwW5BTjGtT1/n9Le6UdsUFb3ErtEQPMopNs0u69Qf6t+O6G+VvOCDLoGU0A9bigaA
 aMVQ==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770284250; x=1770889050; darn=lists.ubuntu.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ts7BIpqOHUIYO1yz8UgL/PwCOZwIbnvcvFeQ/hBIaCk=;
 b=C4PdOwY/Lumzs8+Z/4D/eJUukycJpV5jxDKuSGeg9wlyWTvIL3fPNkty8/TtYYGzif
 xib/h8qknEyBkApx/XE25gKy3/fmlLww/2ZmrydgCl0S2cusDVGkK2/fluCiQC8mfTsF
 39kKx1jpmCo7tsie7faXPLBOPhHs7cOjVQznzH4vTRf9WM7hbZ1dsNQODffRJh1/alX1
 r9rLbox1oNthr1fP1n0O47xffz3qiT/Lo7BqXzJPEPc6eGJ98WNjD3VaLAMAVdK6YwUB
 16krKXRalWmaM0A0t9z13kd/9IPGZywpYrGMetLolL3lkkPaKt5G+XWBbVHjjesv4KGl
 b0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770284250; x=1770889050;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ts7BIpqOHUIYO1yz8UgL/PwCOZwIbnvcvFeQ/hBIaCk=;
 b=AkKEqQkPgMPQXZ4jkcv9s4azyPPnWLD8a5d1sZs6i1vIjHKNHbDe6Mpg5uS53BUUCN
 e2emKAoS10+nGDtuCRqQHs6GJY99zpbordMdwr8cpJKHqNcB8/1bTN5yRC7gODOKU2WN
 M+MWZk+WgzXfNQGpKTaWZEhd7jAA+4hDTKK6JFgU4sophVak92i0vkFIDcRNWG0dFLGh
 sCzyOn+VlGdUomr8484N4tDqJ2iYW1aloMVQ6zCgHS9I+38kTwyx1iKLBp6QrVxSLCsq
 Lu3fDzZC+yL8/Nlt89R4dyO6ShGNsug+xAzu/QlZqOyPNftuSdzUWQ5x6+0vAwiTqSQF
 N9mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSIC7CKsM6QExwDZhd4bcFmA2cnKIHRE5TGKW519cvn05tYiIvgZVrLTc//Ni+l65pjjULSOE/lQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yy9Wtg31r21agx65hgn+gQGnOPdgkXu2rfivIv9Nslw95sXuERt
 +2R9G9YrylEKtRrDud0riDjpm55zPAVTtCj9dGRJytLH2i6mLbwhvVE/PqfmScnxev6USl0EFvt
 qFDWJmvtpDIVs0zWWtx0lJU7NuM9UCSY=
X-Gm-Gg: AZuq6aI05iFnnDew1wcvIqvnRzRgoFpxhte3FtUbQBsDFHRpIvqNCSNuuFOj3iNaFTE
 zLm4P2gvo/2BdnlcdbVgclw7AvCCzO6DguaSEENE7oyAtEwMxW2SdylHLbmHbnISdc2quFx4Ivx
 xn8wI+18JHpSLuag6wWHp7qeQY596t1oGK6+vMeDYvFF0j3BlokpzroaGZV6vm1JWcUKLwzb+dC
 hqqJhXaKXw6eyiRkWx0X8JfRSSSYSxNrKMLKLcDcl1wGwllTmzfjkzn5I9HLr6DcXS8k1MEf0AA
 t2IGrus3yo+WwBhiuYoMaVpKZp56cg==
X-Received: by 2002:a05:6402:2688:b0:658:cf28:90ed with SMTP id
 4fb4d7f45d1cf-65949cc1e5emr3920680a12.15.1770284249654; Thu, 05 Feb 2026
 01:37:29 -0800 (PST)
MIME-Version: 1.0
References: <20260204050726.177283-1-neilb@ownmail.net>
 <20260204050726.177283-12-neilb@ownmail.net>
In-Reply-To: <20260204050726.177283-12-neilb@ownmail.net>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 5 Feb 2026 10:37:18 +0100
X-Gm-Features: AZwV_QjDs8XEOiRuWGAHzisKUrokVjcatEGo5N0FYjLzK48UQXH5p374RE5BkHo
Message-ID: <CAOQ4uxiYUTi=8BjRFbY_GdBZR_5CuP6680me=_xQaPcQk7EFuQ@mail.gmail.com>
To: NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.54; envelope-from=amir73il@gmail.com;
 helo=mail-ed1-f54.google.com
X-Mailman-Approved-At: Thu, 05 Feb 2026 19:25:00 +0000
Subject: Re: [apparmor] [PATCH 11/13] ovl: use is_subdir() for testing if
 one thing is a subdir of another
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Paul Moore <paul@paul-moore.com>, Miklos Szeredi <miklos@szeredi.hu>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, James Morris <jmorris@namei.org>,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 linux-security-module@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, linux-unionfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil@brown.name,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:viro@zeniv.linux.org.uk,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:linux-unionfs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[amir73il@gmail.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amir73il@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[kernel.org,suse.cz,paul-moore.com,szeredi.hu,vger.kernel.org,lists.ubuntu.com,gmail.com,namei.org,redhat.com,oracle.com,zeniv.linux.org.uk,lists.linux.dev,hallyn.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[brown.name:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EF032F6D38
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 6:09=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote:
>
> From: NeilBrown <neil@brown.name>
>
> Rather than using lock_rename(), use the more obvious is_subdir() for
> ensuring that neither upper nor workdir contain the other.
> Also be explicit in the comment that the two directories cannot be the
> same.
>
> As this is a point-it-time sanity check and does not provide any
> on-going guarantees, the removal of locking does not introduce any
> interesting races.
>
> Signed-off-by: NeilBrown <neil@brown.name>

Looks reasonable

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/overlayfs/super.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index ba9146f22a2c..2fd3e0aee50e 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -451,18 +451,13 @@ static int ovl_lower_dir(const char *name, const st=
ruct path *path,
>         return 0;
>  }
>
> -/* Workdir should not be subdir of upperdir and vice versa */
> +/*
> + * Workdir should not be subdir of upperdir and vice versa, and
> + * they should not be the same.
> + */
>  static bool ovl_workdir_ok(struct dentry *workdir, struct dentry *upperd=
ir)
>  {
> -       bool ok =3D false;
> -
> -       if (workdir !=3D upperdir) {
> -               struct dentry *trap =3D lock_rename(workdir, upperdir);
> -               if (!IS_ERR(trap))
> -                       unlock_rename(workdir, upperdir);
> -               ok =3D (trap =3D=3D NULL);
> -       }
> -       return ok;
> +       return !is_subdir(workdir, upperdir) && !is_subdir(upperdir, work=
dir);
>  }
>
>  static int ovl_setup_trap(struct super_block *sb, struct dentry *dir,
> --
> 2.50.0.107.gf914562f5916.dirty
>


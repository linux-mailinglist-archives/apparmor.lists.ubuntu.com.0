Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJfDKHIfnGmT/wMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 10:35:46 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1C9173FE6
	for <lists+apparmor@lfdr.de>; Mon, 23 Feb 2026 10:35:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vuSLg-00019z-4G; Mon, 23 Feb 2026 09:35:28 +0000
Received: from mail-ed1-f51.google.com ([209.85.208.51])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <amir73il@gmail.com>)
 id 1vuSLe-00019r-HW
 for apparmor@lists.ubuntu.com; Mon, 23 Feb 2026 09:35:26 +0000
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-65b9d8d6b7dso5729548a12.2
 for <apparmor@lists.ubuntu.com>; Mon, 23 Feb 2026 01:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771839326; cv=none;
 d=google.com; s=arc-20240605;
 b=dBqk+dmiW64E8hcT6wOtNUKzr84FhA83ALOp1DJFrtHFAmX+lchMlv0l8gV8rcH44y
 ebAduvVpoA6p1iO+7oawG0tF094RB3U77Q84TwtCtCNYEIFJLjCdwagEjx2QUuc+SDx8
 Ngi7bqGYuX+v1oiBZBSy0VWXiikq2XCTljC5ZIwTzWVsSANdt3p4tTA3iZTiUd5AAPTV
 VnpLfMhFyDQZLMfNFS9BjbcLCQ/yfudCmR0HVWYEl/WDezPmXvCPMOEjeXz/PwkL4pF6
 wX/KuPTJMW6H6zDUsiiYsUlVK0BF/1xpcbY6J1I7cCwT33JCOyJQwyNxwKVPAkg1q+SE
 0MQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5/tsVKpvOF9hjEuBModNYiVpSPXtrrKrMQ519faKcis=;
 fh=adafk6dgLJ6JXRW7OOWJo3R6KwXYyQJA4H8/hJ8bVUw=;
 b=XHTbw07QyCkhDMb8/yjBHiGk5ZQnoqD2xfi8BZHlMEJ9tEP2L5ws/pqm+/WWVPEd8p
 E7sqHpcDF88Zm5+H4ikWkL34fr5/ZeKWMeaOYNjoDporXmPV/Unw8Yhvf8Eu1FTi13zX
 J7eohbdpOxPW/OebppPg0qjMHpu/nkfKdREFzB5X0soT/FBKSarfGH4bg0Iokvt8Tcms
 gA7a74e63s77wthmHh98c/N8656vWsl6L6Be6fMxzLLe3Or27hX5QQWnA44dRuwYx5c1
 G5n0f6qQ3c/t7b0hdYS5TfHi28w2UjHCGaXEtvfXo91xBpPTckcFO77I72pkcQXHpbGw
 96xg==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771839326; x=1772444126; darn=lists.ubuntu.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5/tsVKpvOF9hjEuBModNYiVpSPXtrrKrMQ519faKcis=;
 b=CFzS02j+VFn0zVuN+oeD0yBsCW3u+EE11ELWD584Iczub6EodlAzGt7D39TiAkb3qN
 X6YUfWAHKYRkYwwdevAIAyiZvDQM/WuIJEDctu06sJ3ULL+92OtE8qaY6zSJF0rwWhCm
 nxeGgvOjPSoFvqBaxkWToxOFnsXRBeb3fmI38kMKkUiG4envCZBMRRiZV2+kohpHoD/T
 hpR1Lbyk5T65PKzDr3ogQkVVB5A2j+NkVv0Y70npxnIXAoR20nKjO2DHGSwtJBwwjk2I
 gcZGCMdQIc4H8/20bAiF0C30GEBu+b/H7oxxhY/UjOkC0Qos6zSPhwmj+t4K8WKyOP67
 FpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771839326; x=1772444126;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5/tsVKpvOF9hjEuBModNYiVpSPXtrrKrMQ519faKcis=;
 b=VvJXMKpfH8Yr+VbkSYrd9OXH5a2vqU+LaSV03X6i0gvaGNFPRNMwvUxKUTgvpG52nZ
 QnaOTbt4QGwgPmxDrh/jX7dOGPAl0PNnKKUsHjMqw2jEv5s1pY5OCqTzFTnCt/iG4Ob3
 uduQlxe+Fwizw2U3s541EPGEeJ2Yfa/x+lXUR2oILP4HDEycAalGqF8aaNd60tX9p3Ul
 cHsmb8oOQG9aeH4/GigkQ8fqNHk9dI8VmUyxK82oRbr7UzlV+vLn11uAuEk3ciL2dNmz
 2kmnjMpgTGj/TLJVSqlTlNUh+CIV8Ugz+5fzvR3bq5ypU5BBChcz0z7DUSOoi0sor+iC
 ecOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMttoT71I3Tzez1/s/sE/31uFyMSNj/mMMuaVp2STMB0jAxdLi1D7QHtcXlc21TtCdl48LA7Y4pw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yyc05XmQ3KDTQJrAJ+cnxrpHQ0PBztP/ExQ0kix/S38t3eIbVMX
 gHOze4uE+94agkkFay205QXEcVRCDoUeFuRgilaorL8pNrUB1FqMsUlLcwsUqawmbo0iNlnkUPV
 rS8A+k1I7DM5CcyTIPgw39MoEKhf3a30=
X-Gm-Gg: AZuq6aIyPOhLd3AXfoaiRysJvZIfLlcV5ffmqEDiPjdX0irtyYGO68O62ydaZSC0Y0V
 hDohvZSsJPDasIhG3PUPQG7cBe9wZ3IU4AlIQEbGcZsRwswb/HB/zOnSb9tq4S3pzfUip8LvBdh
 AKOP8plxxyZZk8GXpvH3Jrua/sbkvpeLrzWCa1QJANLHBZL1UFHfwgR6Av3ZyIN6XBLcQzZTWvU
 sAgJp1HIAil3MGlJ4YiXK0sbgJM3MBu0ZaibPXdndw2zKn/X+KByUYTdKS1Tu4PpBGvffNcpUAd
 XKIDgurPddAGvtJcbhJfgLcRM5kkezhfhNoIcwmVyw==
X-Received: by 2002:a17:906:7307:b0:b88:5002:50c0 with SMTP id
 a640c23a62f3a-b90819db296mr564028666b.20.1771839325394; Mon, 23 Feb 2026
 01:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20260223011210.3853517-1-neilb@ownmail.net>
 <20260223011210.3853517-12-neilb@ownmail.net>
In-Reply-To: <20260223011210.3853517-12-neilb@ownmail.net>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Feb 2026 11:35:14 +0200
X-Gm-Features: AaiRm51zLgcrRbPb_4HmwkH5uY0J9aukMWrvlX2vP_E-cCHRJFMZshxY7_A02Xw
Message-ID: <CAOQ4uxibL=2Z0FZMz5wMAo=JMaJouOVo3p7t3Fi3FR59U5Tu=g@mail.gmail.com>
To: NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.51; envelope-from=amir73il@gmail.com;
 helo=mail-ed1-f51.google.com
Subject: Re: [apparmor] [PATCH v2 11/15] ovl: pass name buffer to
	ovl_start_creating_temp()
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
 selinux@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, James Morris <jmorris@namei.org>,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 linux-security-module@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, apparmor@lists.ubuntu.com,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 linux-unionfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil@brown.name,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:selinux@vger.kernel.org,m:djwong@kernel.org,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:viro@zeniv.linux.org.uk,m:apparmor@lists.ubuntu.com,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:linux-unionfs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[amir73il@gmail.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amir73il@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[kernel.org,suse.cz,paul-moore.com,szeredi.hu,vger.kernel.org,gmail.com,namei.org,redhat.com,oracle.com,zeniv.linux.org.uk,lists.ubuntu.com,lists.linux.dev,hallyn.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 3E1C9173FE6
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 2:14=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote=
:
>
> From: NeilBrown <neil@brown.name>
>
> Now ovl_start_creating_temp() is passed a buffer in which to store the
> temp name.  This will be useful in a future patch were ovl_create_real()
> will need access to that name.
>
> Signed-off-by: NeilBrown <neil@brown.name>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/overlayfs/dir.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
> index ff3dbd1ca61f..c4feb89ad1e3 100644
> --- a/fs/overlayfs/dir.c
> +++ b/fs/overlayfs/dir.c
> @@ -66,10 +66,9 @@ void ovl_tempname(char name[OVL_TEMPNAME_SIZE])
>  }
>
>  static struct dentry *ovl_start_creating_temp(struct ovl_fs *ofs,
> -                                             struct dentry *workdir)
> +                                             struct dentry *workdir,
> +                                             char name[OVL_TEMPNAME_SIZE=
])
>  {
> -       char name[OVL_TEMPNAME_SIZE];
> -
>         ovl_tempname(name);
>         return start_creating(ovl_upper_mnt_idmap(ofs), workdir,
>                               &QSTR(name));
> @@ -81,11 +80,12 @@ static struct dentry *ovl_whiteout(struct ovl_fs *ofs=
)
>         struct dentry *whiteout, *link;
>         struct dentry *workdir =3D ofs->workdir;
>         struct inode *wdir =3D workdir->d_inode;
> +       char name[OVL_TEMPNAME_SIZE];
>
>         guard(mutex)(&ofs->whiteout_lock);
>
>         if (!ofs->whiteout) {
> -               whiteout =3D ovl_start_creating_temp(ofs, workdir);
> +               whiteout =3D ovl_start_creating_temp(ofs, workdir, name);
>                 if (IS_ERR(whiteout))
>                         return whiteout;
>                 err =3D ovl_do_whiteout(ofs, wdir, whiteout);
> @@ -97,7 +97,7 @@ static struct dentry *ovl_whiteout(struct ovl_fs *ofs)
>         }
>
>         if (!ofs->no_shared_whiteout) {
> -               link =3D ovl_start_creating_temp(ofs, workdir);
> +               link =3D ovl_start_creating_temp(ofs, workdir, name);
>                 if (IS_ERR(link))
>                         return link;
>                 err =3D ovl_do_link(ofs, ofs->whiteout, wdir, link);
> @@ -247,7 +247,9 @@ struct dentry *ovl_create_temp(struct ovl_fs *ofs, st=
ruct dentry *workdir,
>                                struct ovl_cattr *attr)
>  {
>         struct dentry *ret;
> -       ret =3D ovl_start_creating_temp(ofs, workdir);
> +       char name[OVL_TEMPNAME_SIZE];
> +
> +       ret =3D ovl_start_creating_temp(ofs, workdir, name);
>         if (IS_ERR(ret))
>                 return ret;
>         ret =3D ovl_create_real(ofs, workdir, ret, attr);
> --
> 2.50.0.107.gf914562f5916.dirty
>


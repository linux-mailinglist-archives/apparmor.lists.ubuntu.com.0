Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BnNB7LkmGn3NwMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 20 Feb 2026 23:48:18 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CA80916B500
	for <lists+apparmor@lfdr.de>; Fri, 20 Feb 2026 23:48:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vtZHz-0007ne-7T; Fri, 20 Feb 2026 22:47:59 +0000
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1vtZHx-0007m6-HD
 for apparmor@lists.ubuntu.com; Fri, 20 Feb 2026 22:47:57 +0000
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-352dda4a34eso1100044a91.1
 for <apparmor@lists.ubuntu.com>; Fri, 20 Feb 2026 14:47:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771627676; cv=none;
 d=google.com; s=arc-20240605;
 b=ZZHBnISwg8ZsOS4ZDHAO0BJbb0Bod/bqgfV6m1pkJXRA8BYdjQOR3Em2kTzUJG1T08
 RqFtaeSfMH69ar2Ien34C3brhMjtEHWDycZo+Yba+BKmMeZUJmc9lmLcSKIp9sEiXkjn
 dVupoRI+vHH9f66Ol90sykUDbVfzZuyH/8K/W8jo92KxUcvaBis8xyLfIQVoDGhGQf1j
 u2XFqXN1PBTOurpI1n1puxLFPamsOIbojrwdX1ApyjKs1GdLhUqQeunmeAPNL6gq4tjX
 G2j93jON2r6xL7lat3rxdKH9MR7c+aV9EGFPd4cFRFQj8WVznwdzF2Jg3Ql2+x5V3WL8
 V66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DDXd3tXPluWk2oCytZ/1RJVm/UKOezpDOPY6avX6ips=;
 fh=FmFpkTw3N2UmEkS5XZXGMUnh4nDxkzXdA5uN+DDQ2/E=;
 b=SaJLP3vZhVcXrxXbqmiggYku9grVhev1Ghc2bLK5BUhR0DZxgbIteJiWlQO16vd2YY
 f2QQdSIi7CeEvQ+8kzuWkRKVRd5ZdcwWgw6QswpV6oPLB2gXBtP2++UOSyBYfR/WTVaJ
 b3D+dcosWjchcA7NFnYBvBV54EwIQPXhP6rESX9bU4V7sW3aR4HKxTSf/abeKEcSm+v3
 IFIk4PrzxIIe+pJE7Djn0B5HjM0pjpA06zxKGMzXuc3A7O8DORBa97FX479dn0ZrTuYq
 /xPpHLEWaNiXuP4YgxNecqfj/U4kw5Kiagh4FvLP0DwVUkwZmGRhp61GKySFKuwNSTXs
 A+rg==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1771627676; x=1772232476; darn=lists.ubuntu.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DDXd3tXPluWk2oCytZ/1RJVm/UKOezpDOPY6avX6ips=;
 b=HkIcY25maz0mC9o4xIr4Erv2EuBiBHj9CAESE3k6i+UqFA+qgmiW2ZW2qRe/XipKfd
 cDLLeO6mmdmd+ztxiM9xTCKhWlIdxeVZVP11aofejKB9TlpP8vFsJwI1R/xBALGD9WDc
 EBwUivnLYqVdAkuN2QpLYW5WsxiWZPvSmukyQ5BVVwngj92wQkyzGBqUwLevw74myD0I
 ANaCb4nkNMw8vKpyooUL8LQ284e1f8Hro0EPsFMLSt3nPHGDFJCb4FlLd222cEvPhFY5
 6qhnU+viniYaPEk0LZPWjtea1S+C6mL8sbbYXKoFH+3rzAdzW83hL8ImB3be+ZA1ew4C
 jxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771627676; x=1772232476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DDXd3tXPluWk2oCytZ/1RJVm/UKOezpDOPY6avX6ips=;
 b=Gkj/ZEqkGbHJ8pEUv6ne2JPggJQPnZ0YBruNPTmKUPhJZYo53ico8Cgf5vhsYxBTXZ
 iBpATWD0vtZkSShH3H6BpUVVBnLx6gNO6rLNhOavmiXL7yU9KrLG5jzNpWmoOXImdKJH
 U9/UoZOPvGeICM/BdIvxofxsPsuy0ZyqiBcrzAeMVT98HIiz5DC456htB+EwKREMvEQ3
 b63cANN0pPBD2ixEPjj9+meUOyjVKoGKPVtanP++9rhKz/0F730LqmHvLyV+eAfrPHSL
 b0sqSfwOBbhVtXsc8IWbwHwS1sdryRAV+ozApMUEdOoYi7/ICVtyF5wT8YE7OgT5F1mK
 z7LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUy1mR9PvfPvoJoqX+HV5+ABZx5RBY+9CaUpEPZWlJSdJZyIjFUeiK6KeIevaAk75XstQ6wHYKiA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YweusEj1r/Xro9JJQDb/PqIlraDzKkUGxjvLoqkACSOqgXg5YTP
 HR49+SGpXIV39QQYkcyDlbQIHNoAJJfutY53Kzn4l8lqY2Kdtx7+0wENOUD4Z45KpGy8sKd2hit
 WE+BCguzZMfBTLCvGBJ8u6oPjUFzSZEX6x9xKEXaZ
X-Gm-Gg: AZuq6aIwi2gUPinCNf+zeFAy4b7+QgUTxD/+OZc8HcfrXJHM/dy50s+5Ki/Q31K7M+l
 tz00rBPbo1hy6BTM5awyvZII2wAPcSfm/L+qOUxMKJEf9pp2rRWbc8cgu61SnXLfcHNrihELF/0
 UBwN/xPL/m+dwdyY/5pk2EdNb19yLCjAoAK4rNAyEm2A3Qyd0UZgdsK4Sv4/BE95O4sWYwwBaoP
 ObHufTyR6uAZZbm1j+WewDg+I8m74rOrzpOgUcdjcaSvNAmyxdLPvWVRM8YKubWuuvj/wiuPqCr
 JgAKjpA=
X-Received: by 2002:a17:90b:3a08:b0:34c:fe7e:84fe with SMTP id
 98e67ed59e1d1-358ae8c0983mr894544a91.28.1771627675691; Fri, 20 Feb 2026
 14:47:55 -0800 (PST)
MIME-Version: 1.0
References: <20260204050726.177283-1-neilb@ownmail.net>
 <20260204050726.177283-6-neilb@ownmail.net>
In-Reply-To: <20260204050726.177283-6-neilb@ownmail.net>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 20 Feb 2026 17:47:42 -0500
X-Gm-Features: AaiRm531rz23NInLiaMybHfJxR35OGBc7KTvM6WC-U0WofFc5pma3F6ygsFUv1A
Message-ID: <CAHC9VhThChVk1Dk+f-KANGj7Tu7zzHCiA==taeQ+=nQaH6a7sg@mail.gmail.com>
To: NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.216.53; envelope-from=paul@paul-moore.com;
 helo=mail-pj1-f53.google.com
Subject: Re: [apparmor] [PATCH 05/13] selinux: Use simple_start_creating() /
	simple_done_creating()
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
 Miklos Szeredi <miklos@szeredi.hu>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, Stephen Smalley <stephen.smalley.work@gmail.com>,
 Amir Goldstein <amir73il@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-security-module@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 linux-unionfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
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
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:neil@brown.name,m:brauner@kernel.org,m:jack@suse.cz,m:miklos@szeredi.hu,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:stephen.smalley.work@gmail.com,m:amir73il@gmail.com,m:jlayton@kernel.org,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:viro@zeniv.linux.org.uk,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:linux-unionfs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[kernel.org,suse.cz,szeredi.hu,vger.kernel.org,lists.ubuntu.com,gmail.com,namei.org,redhat.com,oracle.com,zeniv.linux.org.uk,lists.linux.dev,hallyn.com];
	NEURAL_HAM(-0.00)[-0.931];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[paul-moore.com:url,brown.name:email,mail.gmail.com:mid,ownmail.net:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: CA80916B500
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 12:08=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote=
:
>
> From: NeilBrown <neil@brown.name>
>
> Instead of explicitly locking the parent and performing a lookup in
> selinux, use simple_start_creating(), and then use
> simple_done_creating() to unlock.
>
> This extends the region that the directory is locked for, and also
> performs a lookup.
> The lock extension is of no real consequence.
> The lookup uses simple_lookup() and so always succeeds.  Thus when
> d_make_persistent() is called the dentry will already be hashed.
> d_make_persistent() handles this case.
>
> Signed-off-by: NeilBrown <neil@brown.name>
> ---
>  security/selinux/selinuxfs.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

Unless I'm missing something, there is no reason why I couldn't take
just this patch into the SELinux tree once the merge window closes,
yes?

--=20
paul-moore.com


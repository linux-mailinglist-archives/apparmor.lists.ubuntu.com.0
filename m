Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCBgCpcQm2lArgMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 22 Feb 2026 15:20:07 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0941016F52F
	for <lists+apparmor@lfdr.de>; Sun, 22 Feb 2026 15:20:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vuAJH-0004ar-5W; Sun, 22 Feb 2026 14:19:47 +0000
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1vuAJE-0004ad-RV
 for apparmor@lists.ubuntu.com; Sun, 22 Feb 2026 14:19:45 +0000
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-82310b74496so1812086b3a.3
 for <apparmor@lists.ubuntu.com>; Sun, 22 Feb 2026 06:19:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771769983; cv=none;
 d=google.com; s=arc-20240605;
 b=VfTExJ7RdVAKTDMgJ8lXFZw8NZ5SDnbs1VcgR6lz/0L1StqVfUoNoNiCmQvQ6Mg+wm
 H4GFJndDFv0RzttfwshyqcZD/th9F6tPBQ1M49A299vZ7He63JgOmZcaEv18xeNUCFSg
 OkWKVrVVvrgFSBd1fOEL3twRFXmIShC0Mz/PjKkmxTe+eGlf8PhK52vmHokN7ZKiJYci
 wp14/buIrPqTItScre6v9Xq9beds6hBWp4MBUkn1AkwdSLng8JhywmdUyRkVQEQH1Alk
 ifrMSkxUHBlm+2TTkc5mifx+gd2PnT1c4dbsdLzo448qHNVIX7K0yRNDgXHNpagbjcnm
 wZ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=X8lBMrpe1LcWoNp46tVs1SnCv/oupmsi0daofTsKyx8=;
 fh=FllG7lGdSbn1z6Oes+jgtZ2O6+7S5esqqrJkU0XjIog=;
 b=IdvKbXFdAPRzMI67IdlocMwaL/65r5nNEUdznofsTj3xshsjVGgGmTSkYh4IKB2RcA
 N/kvHZPRvIpTs/F7f8uAiOzoAUEDY4YvRos3nphT/zW41vaL2XTYKBc4eGx02ar8j1vP
 T2e9C2ZIkOgLJigj0oJ75a0lKl1EqausMmLfpVVtNt8F6OvcHV9bnZz40BdQL4ZWlauX
 oZu58/slvArkz5iaopJ/VnN/PHu87zxy0obLPfymzMy2ydWWnaozd+P7KDddUMnwzcmL
 /W/9yOkR6YUJtJBt7Ewu79ioWD4f7FYLJhy22IFF/l8P7oty5pFjEJn75KzW5+MS9Fqb
 tKSQ==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1771769983; x=1772374783; darn=lists.ubuntu.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X8lBMrpe1LcWoNp46tVs1SnCv/oupmsi0daofTsKyx8=;
 b=PgxUlxVUlSDZ+Ob1wPj4/T15tG5kixMynkD2cZ+4cgAeE3pPiewXMu+VDgoA+6DUl8
 S2K2/03K5ToCR80J3nuIZ65DBdhtEPGspPjVOfXK5PCgF4fuGDT6Q1m5whQraVs2RB0b
 /69+O+HO+ENRjElj5+YoJzARh3U1+32jHDBobAWYsUI+tF/reOZ4GGlnAQwsEJIqVHV2
 50KwIvHFUzU0M3O/jetBojoqYqqH0ms3p0yheB8eNTT5y9cdiK5YSSbgTB5GCzJcM5vq
 AFAIo9duJqUC2DbyvMzo9DiGSPdIWjppGB0Rk3n6bFpqKVgBCVAvkwY9Qjw+XhkjDk4D
 7XGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771769983; x=1772374783;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X8lBMrpe1LcWoNp46tVs1SnCv/oupmsi0daofTsKyx8=;
 b=wEZP/k0IGMfCUj9YdVu4j3UtIyxt09cO6+XiSjvbySlrHpfAVFrGD0LLxZGclC5i7t
 72/VOXi3CRWmQ07ej9gYg3xS0y953ZqmgVjmOgZcJbFKmVNCsBI4jSJqtMvp6O0ieSOD
 f6XQZPQHE0hZsbAy/0Fw/CGmyv5bSzrls2HmmCO4KtBwPeu8N0nIJWDdssxILlUSFD2I
 +zlU/1Y16vOXqTZD/v3fR/jA+entIXX+qr/LMKNPXUjrHCAB8IvukOBPMMnGjTN7RR0w
 um00DSTp+yUcZVT7lnIwyLL5apM04j3h6CpULPX9Y3DSuNk9VB6cO8u2pjJ93WCHv9Cn
 jmVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtu0AKdRCzM0QLh6YAto1xlNOySmq1iVakQ17n+GwwdDuG6YygBFjipScUMXZ5cfqsjxResXWpZQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwbRDJOJM5yiDl2ZBU85so+wwgmqcp/ckkNX4ByLQpoDtaz1467
 bdtqBsqWwyt5gvQkBOa8iQan+/rUGG/kkITN3lz5UmRSSFNSYMVrk89ERiTpc9Gl7neyH1+Z2H1
 6/igLGAFOUxornRNSE3ae2DPDSpMy1zlTtDAuumVx
X-Gm-Gg: AZuq6aJt797M1AytYtf2eXpJ+p8ePkfZt/0Bu80HYwGVMjgS03s951WS6yBxKgNfBOL
 EczU0p+dV3R2JeieZmgAqOaqLwsMlhz4Ngi7NJduqwU6J5MKyJjDKztOvtZonZ5MMg+hfTvdsNi
 lyR6qAwOIMtjR6yUnkd0zPLHQk/tPJUC06IlKXy3C29Q8njxAQcC5epJz5/yqvCdBlGUUht5D8z
 plG83gRT4nty2UR4r70uWG87ljqL8yrGZmU7TFL3GObrjzRxusIsIHUlLW8zGWggJXB0OhpK5Av
 vJPPfZo=
X-Received: by 2002:a05:6a21:6003:b0:38d:ebc4:b552 with SMTP id
 adf61e73a8af0-39545ed5054mr4712151637.27.1771769982592; Sun, 22 Feb 2026
 06:19:42 -0800 (PST)
MIME-Version: 1.0
References: <20260204050726.177283-1-neilb@ownmail.net>
 <20260204050726.177283-6-neilb@ownmail.net>
 <CAHC9VhThChVk1Dk+f-KANGj7Tu7zzHCiA==taeQ+=nQaH6a7sg@mail.gmail.com>
 <177171292163.8396.10671162503209732019@noble.neil.brown.name>
In-Reply-To: <177171292163.8396.10671162503209732019@noble.neil.brown.name>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 22 Feb 2026 09:19:30 -0500
X-Gm-Features: AaiRm50aSxTeiNBHciBrrBXQYNf54mJgxuioR2fz7pTB6PQcKrI6Gq_TY-UauFU
Message-ID: <CAHC9VhTv+K44q7+5d17jS8h9fJY_JfQVUw5NPNvPzjkHDpqp=g@mail.gmail.com>
To: NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.181; envelope-from=paul@paul-moore.com;
 helo=mail-pf1-f181.google.com
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
	NEURAL_HAM(-0.00)[-0.936];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[paul-moore.com:url,paul-moore.com:email,mail.gmail.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 0941016F52F
X-Rspamd-Action: no action

On Sat, Feb 21, 2026 at 5:28=E2=80=AFPM NeilBrown <neilb@ownmail.net> wrote=
:
> On Sat, 21 Feb 2026, Paul Moore wrote:
> > On Wed, Feb 4, 2026 at 12:08=E2=80=AFAM NeilBrown <neilb@ownmail.net> w=
rote:
> > >
> > > From: NeilBrown <neil@brown.name>
> > >
> > > Instead of explicitly locking the parent and performing a lookup in
> > > selinux, use simple_start_creating(), and then use
> > > simple_done_creating() to unlock.
> > >
> > > This extends the region that the directory is locked for, and also
> > > performs a lookup.
> > > The lock extension is of no real consequence.
> > > The lookup uses simple_lookup() and so always succeeds.  Thus when
> > > d_make_persistent() is called the dentry will already be hashed.
> > > d_make_persistent() handles this case.
> > >
> > > Signed-off-by: NeilBrown <neil@brown.name>
> > > ---
> > >  security/selinux/selinuxfs.c | 15 +++++++--------
> > >  1 file changed, 7 insertions(+), 8 deletions(-)
> >
> > Unless I'm missing something, there is no reason why I couldn't take
> > just this patch into the SELinux tree once the merge window closes,
> > yes?
>
> Yes - but ...
>
> Once this series lands (hopefully soon - I will resend after -rc1 is
> out) I have another batch which depends on the new start_creating etc
> API being used everywhere ...

Okay, thanks for letting me know.  I was curious about something like
that based on the cover letter, but the timing wasn't clear.

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com


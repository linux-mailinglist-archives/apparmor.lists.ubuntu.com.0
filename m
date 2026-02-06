Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AwSKndBhWmA+wMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 06 Feb 2026 02:18:47 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F984F8EBF
	for <lists+apparmor@lfdr.de>; Fri, 06 Feb 2026 02:18:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1voAUV-0006jM-6d; Fri, 06 Feb 2026 01:18:35 +0000
Received: from flow-a7-smtp.messagingengine.com ([103.168.172.142])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <neilb@ownmail.net>) id 1voAUT-0006j5-Qq
 for apparmor@lists.ubuntu.com; Fri, 06 Feb 2026 01:18:33 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailflow.phl.internal (Postfix) with ESMTP id AE0291380830;
 Thu,  5 Feb 2026 20:18:32 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Thu, 05 Feb 2026 20:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to; s=fm3; t=
 1770340712; x=1770347912; bh=Zkqi7FUbPlBKBKbLMS4Nd4ZqklSd/cC+47u
 ajjEEgxg=; b=mWJyX35XMkX5bbdkdOcL/QnCS9dYVa50GP3ia+ZNmKwKG1RX+zZ
 xgK3SbKLa+ZEz/WPz/P9cASqwWKp8vzjaDrVmsNZBOQSyoJGm7zjusWiZvNqhtEI
 7mOpzH23tiedYSgihmy9wmuDmrA0OOQvLTiRIGqN8rK16GNl+yiJQinn+xKjI6CL
 BYQja40R97UxiEB1szOTyyQ2iG1r2OQJjyUphKNVEtKqMqcenYQ6QdziItwvXCRi
 s3iy2fGoLmTqFKBpfdI9M+QpOZxyqO2crXc4Q4/Qxg5DIYw9XZf48pBsx/Cn39dJ
 15Z4nDl3SqOtUd7TSh0vIhkYEHk+HuwGalA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770340712; x=
 1770347912; bh=Zkqi7FUbPlBKBKbLMS4Nd4ZqklSd/cC+47uajjEEgxg=; b=G
 VvrtgtfOwb5IwnjMj4sAItg3wm4lEBN16MOkDuioHU+vwsj5exdeiDkgETA8Aga0
 EJJe2FUAhtlt8gKUxYYVl+ver5hZ8/MoJjdBMLAnYYC1Qr/zDvonMHLl8js7CYh3
 3QCM4pq49kr/ZA9p+asoYznxWauTNp7JLZTWGRv467Q95C3l3LYf16luQyCX6a8N
 bZ4b0S5SmZcUTRy3dZUYvflXcqHDmrbROXxdKSYI7vIk9JJOKqwwSX95xbgxm6x2
 Xx9xF3g0798Tm0EYOVE8kTZSPN7tVciFz5ItvFXOYskCIwH9x2YcJyL5cCXX0MNP
 P+js1tYlVdx3DWkB9cbGQ==
X-ME-Sender: <xms:aEGFaeQ4zPh7eEpRMZEiwCvQwvhJLSsBfnkda_QO50aemZnGtDlkkw>
 <xme:aEGFaYCtO2L_AarMPeS4yf37yoPEOfVLN5OQyo27nMXy8UF-UJG6zzdfB7ElxN6Qi
 3wl8X62iJRBjYySl4O8AfvN6IeQWQwStgPn-cNljaPsmci_XA>
X-ME-Received: <xmr:aEGFafbSmmU_FY3J4ORxeS9bBj08jMoN-wCn4jCmHyJGsCTFtXp8-vzJPMJaWXiaR9_Wvh36Lsy6vGGFNxJwqw5gM6ZKH3pFxwSp854W-njm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeeikeegucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurheptgfgggfhvfevufgjfhffkfhrsehtqhertddttdejnecuhfhrohhmpefpvghilheu
 rhhofihnuceonhgvihhlsgesohifnhhmrghilhdrnhgvtheqnecuggftrfgrthhtvghrnh
 epleejtdefgeeukeeiteduveehudevfeffvedutefgteduhfegvdfgtdeigeeuudejnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhlsg
 esohifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhp
 ohhuthdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidrohhrghdruhhkpd
 hrtghpthhtohepshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
 thhopehlihhnuhigqdhunhhiohhnfhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
 hpthhtoheplhhinhhugidqshgvtghurhhithihqdhmohguuhhlvgesvhhgvghrrdhkvghr
 nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnfhhssehvghgvrhdrkhgvrhhnvg
 hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
 vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfhhsuggvvhgvlhesvhhgvghrrdhkvg
 hrnhgvlhdrohhrghdprhgtphhtthhopehmihhklhhoshesshiivghrvgguihdrhhhupdhr
 tghpthhtohepjhgrtghksehsuhhsvgdrtgii
X-ME-Proxy: <xmx:aEGFaZLnaIM4MfbcD78cQknuGA4RK2wEZsxocxtzlL80GyqKah9fLg>
 <xmx:aEGFaQ2V8lZHV1kLR2dB4Cis9hZ00LO6sKAFS9nJo6fHhIDHvgLadQ>
 <xmx:aEGFacZ9d0GqvNczaq7QQd2Ku2Hhgq___1EZTXbVcHaBA05M-Fk_fQ>
 <xmx:aEGFabW4kq8RpMJC3hXznI1fVO4P22i6UFyfIJsClcD0ixe0Ivor4w>
 <xmx:aEGFaVE2Kf6EEu5MkgUKalH7kaW-OZK3of_mfTzbA7SISD7y4rUJqw8g>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 20:18:24 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Amir Goldstein" <amir73il@gmail.com>
In-reply-to: <CAOQ4uxi3bNYq1b4=qL-JLi19hRwurntfLZXhUMVL003NarBdGg@mail.gmail.com>
References: <20260204050726.177283-1-neilb@ownmail.net>,
 <20260204050726.177283-13-neilb@ownmail.net>,
 <CAOQ4uxi3bNYq1b4=qL-JLi19hRwurntfLZXhUMVL003NarBdGg@mail.gmail.com>
Date: Fri, 06 Feb 2026 12:18:20 +1100
Message-id: <177034070093.16766.8687569968950580318@noble.neil.brown.name>
Received-SPF: pass client-ip=103.168.172.142; envelope-from=neilb@ownmail.net;
 helo=flow-a7-smtp.messagingengine.com
Subject: Re: [apparmor] [PATCH 12/13] ovl: remove ovl_lock_rename_workdir()
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
Reply-To: NeilBrown <neil@brown.name>
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ownmail.net:s=fm3,messagingengine.com:s=fm3];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[ownmail.net : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,suse.cz,paul-moore.com,szeredi.hu,vger.kernel.org,lists.ubuntu.com,gmail.com,namei.org,redhat.com,oracle.com,zeniv.linux.org.uk,lists.linux.dev,hallyn.com];
	FORGED_RECIPIENTS(0.00)[m:amir73il@gmail.com,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:viro@zeniv.linux.org.uk,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:linux-unionfs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[ownmail.net];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[neil@brown.name];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neilb@ownmail.net,apparmor-bounces@lists.ubuntu.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[ownmail.net:-,messagingengine.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[brown.name:replyto,brown.name:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,noble.neil.brown.name:mid,ownmail.net:email]
X-Rspamd-Queue-Id: 5F984F8EBF
X-Rspamd-Action: no action

On Thu, 05 Feb 2026, Amir Goldstein wrote:
> On Wed, Feb 4, 2026 at 6:09=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote:
> >
> > From: NeilBrown <neil@brown.name>
> >
> > This function is unused.
> >
>=20
> I am confused.
> What was this "fix" fixing an unused function:
>=20
> e9c70084a64e5 ovl: fail ovl_lock_rename_workdir() if either target is unhas=
hed
>=20
> What am I missing?
>=20

Commit 833d2b3a072f ("Add start_renaming_two_dentries()")

removed the last use of ovl_lock_rename_workdir() earlier, but in a
different branch.

e9c was committed upstream Nov 28th v6.18~7
833 was committed upstream Dec 1st  v6.19-rc1~240

> Otherwise, feel free to add:
>=20
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
NeilBrown


>=20
> Thanks,
> Amir.
>=20



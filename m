Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F4791E4D0
	for <lists+apparmor@lfdr.de>; Mon,  1 Jul 2024 18:08:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sOJZg-0005xO-I1; Mon, 01 Jul 2024 16:08:16 +0000
Received: from meesny.iki.fi ([195.140.195.201])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jarkko.sakkinen@iki.fi>)
 id 1sNCrP-0001yQ-9E
 for apparmor@lists.ubuntu.com; Fri, 28 Jun 2024 14:45:59 +0000
Received: from [192.168.1.215] (83-245-197-232.elisa-laajakaista.fi
 [83.245.197.232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sakkinen)
 by meesny.iki.fi (Postfix) with ESMTPSA id 4W9dXd425vzyQb;
 Fri, 28 Jun 2024 17:45:53 +0300 (EEST)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1719585957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WWKHLgmudvMlwluvp3Stzu4k/6CZp2skiMXIPd54CxY=;
 b=RxUpuY06Tm7bdQ+ZP2YSeV2sZ0d26kGW+yfvErGUjN0RqKtm0McdqrYuekNb0pGvzE+qm7
 iuNlXj2O8FbpJDeehRl+K0JeKQeaRmeSYauJacKq29s6uBRrtri7KjBnhn89xVkrtvvaVt
 5hMvMcoH5A/jWQetK3y8OT94tMYIngU=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1719585957; a=rsa-sha256; cv=none;
 b=wz7CPul/aLpW+AkOpy+q+2hOgYuNK2/HqS/jHykc4lXi7fbJVcsx4BSPq1RSy4MXAK4YCL
 YMEG6IroCIxVWFa5vosVXJ7wmDo9nZEnRkcQT2Nc2HYn4VErl62+Oyb3XbEnCw7Tw+qsRn
 X2ennwOnY7aYQMkNbAXIm+aPPy2PuKs=
Message-ID: <177e16dafed37ab361cf0ccc436573be1d717d94.camel@iki.fi>
From: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
To: Jonathan Calmels <jcalmels@3xx0.net>, brauner@kernel.org, 
 ebiederm@xmission.com, Jonathan Corbet <corbet@lwn.net>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn"
 <serge@hallyn.com>, KP Singh <kpsingh@kernel.org>, Matt Bobrowski
 <mattbobrowski@google.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook
 <kees@kernel.org>, Joel Granados <j.granados@samsung.com>, John Johansen
 <john.johansen@canonical.com>, David Howells <dhowells@redhat.com>, Jarkko
 Sakkinen <jarkko@kernel.org>, Stephen Smalley
 <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>
Date: Fri, 28 Jun 2024 17:45:52 +0300
In-Reply-To: <f4de777099b0dff819ee6277b3b7cd7e18d96c78.camel@iki.fi>
References: <20240609104355.442002-1-jcalmels@3xx0.net>
 <20240609104355.442002-3-jcalmels@3xx0.net>
 <f4de777099b0dff819ee6277b3b7cd7e18d96c78.camel@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
Received-SPF: pass client-ip=195.140.195.201;
 envelope-from=jarkko.sakkinen@iki.fi; helo=meesny.iki.fi
X-Mailman-Approved-At: Mon, 01 Jul 2024 16:08:15 +0000
Subject: Re: [apparmor] [PATCH v2 2/4] capabilities: Add securebit to
 restrict userns caps
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
Cc: linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, containers@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Fri, 2024-06-28 at 17:43 +0300, Jarkko Sakkinen wrote:
> On Sun, 2024-06-09 at 03:43 -0700, Jonathan Calmels wrote:
> > This patch adds a new capability security bit designed to constrain
> > a
>=20
>=20
> nit: if you think of it "This patch adds" could be just "add", right?
> :-)
>=20
> Also name the exact thing/symbol/whatever here. This is not a HBO
> series.
>=20
> > task=E2=80=99s userns capability set to its bounding set. The reason fo=
r
> > this
> > is
> > twofold:
> >=20
> > - This serves as a quick and easy way to lock down a set of
> > capabilities
> > =C2=A0 for a task, thus ensuring that any namespace it creates will
> > never
> > be
> > =C2=A0 more privileged than itself is.
> > - This helps userspace transition to more secure defaults by not
> > requiring
> > =C2=A0 specific logic for the userns capability set, or libcap support.
> >=20
> > Example:
> >=20
> > =C2=A0=C2=A0=C2=A0 # capsh --secbits=3D$((1 << 8)) --drop=3Dcap_sys_raw=
io -- \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -c '=
unshare -r grep Cap /proc/self/status'
> > =C2=A0=C2=A0=C2=A0 CapInh: 0000000000000000
> > =C2=A0=C2=A0=C2=A0 CapPrm: 000001fffffdffff
> > =C2=A0=C2=A0=C2=A0 CapEff: 000001fffffdffff
> > =C2=A0=C2=A0=C2=A0 CapBnd: 000001fffffdffff
> > =C2=A0=C2=A0=C2=A0 CapAmb: 0000000000000000
> > =C2=A0=C2=A0=C2=A0 CapUNs: 000001fffffdffff
> >=20
> > Signed-off-by: Jonathan Calmels <jcalmels@3xx0.net>
> > ---
> > =C2=A0include/linux/securebits.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 +
> > =C2=A0include/uapi/linux/securebits.h | 11 ++++++++++-
> > =C2=A0kernel/user_namespace.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 5 +++++
> > =C2=A03 files changed, 16 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/include/linux/securebits.h
> > b/include/linux/securebits.h
> > index 656528673983..5f9d85cd69c3 100644
> > --- a/include/linux/securebits.h
> > +++ b/include/linux/securebits.h
> > @@ -5,4 +5,5 @@
> > =C2=A0#include <uapi/linux/securebits.h>
> > =C2=A0
> > =C2=A0#define issecure(X)		(issecure_mask(X) &
> > current_cred_xxx(securebits))
> > +#define iscredsecure(cred, X)	(issecure_mask(X) & cred-
> > > securebits)
> > =C2=A0#endif /* !_LINUX_SECUREBITS_H */
> > diff --git a/include/uapi/linux/securebits.h
> > b/include/uapi/linux/securebits.h
> > index d6d98877ff1a..2da3f4be4531 100644
> > --- a/include/uapi/linux/securebits.h
> > +++ b/include/uapi/linux/securebits.h
> > @@ -52,10 +52,19 @@
> > =C2=A0#define SECBIT_NO_CAP_AMBIENT_RAISE_LOCKED \
> > =C2=A0			(issecure_mask(SECURE_NO_CAP_AMBIENT_RAISE
> > _L
> > OCKED))
> > =C2=A0
> > +/* When set, user namespace capabilities are restricted to their
> > parent's bounding set. */
> > +#define SECURE_USERNS_STRICT_CAPS			8
> > +#define SECURE_USERNS_STRICT_CAPS_LOCKED		9=C2=A0 /* make
>=20
>=20
>=20
> > bit-8 immutable */
> > +
> > +#define SECBIT_USERNS_STRICT_CAPS
> > (issecure_mask(SECURE_USERNS_STRICT_CAPS))
> > +#define SECBIT_USERNS_STRICT_CAPS_LOCKED \
> > +			(issecure_mask(SECURE_USERNS_STRICT_CAPS_L
> > OC
> > KED))
> > +
> > =C2=A0#define
> > SECURE_ALL_BITS		(issecure_mask(SECURE_NOROOT) | \
> > =C2=A0			=09
> > issecure_mask(SECURE_NO_SETUID_FIXUP) | \
> > =C2=A0				 issecure_mask(SECURE_KEEP_CAPS) |
> > \
> > -			=09
> > issecure_mask(SECURE_NO_CAP_AMBIENT_RAISE))
> > +			=09
> > issecure_mask(SECURE_NO_CAP_AMBIENT_RAISE) | \
> > +			=09
>=20
> spurious new lines in the diff
>=20
> please as first priority aim for absolute minimal diff or at least
> do grow diff proactively like this.
>=20
> If we really think after that, that we need some "extras" to the
> patch set, then we decide that. These only take energy away from
> reviewers.
>=20
>=20
> > issecure_mask(SECURE_USERNS_STRICT_CAPS))
> > =C2=A0#define SECURE_ALL_LOCKS	(SECURE_ALL_BITS << 1)
> > =C2=A0
> > =C2=A0#endif /* _UAPI_LINUX_SECUREBITS_H */
> > diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
> > index 7e624607330b..53848e2b68cd 100644
> > --- a/kernel/user_namespace.c
> > +++ b/kernel/user_namespace.c
> > @@ -10,6 +10,7 @@
> > =C2=A0#include <linux/cred.h>
> > =C2=A0#include <linux/securebits.h>
> > =C2=A0#include <linux/security.h>
> > +#include <linux/capability.h>
> > =C2=A0#include <linux/keyctl.h>
> > =C2=A0#include <linux/key-type.h>
> > =C2=A0#include <keys/user-type.h>
> > @@ -42,6 +43,10 @@ static void dec_user_namespaces(struct ucounts
> > *ucounts)
> > =C2=A0
> > =C2=A0static void set_cred_user_ns(struct cred *cred, struct
> > user_namespace *user_ns)
> > =C2=A0{
> > +	/* Limit userns capabilities to our parent's bounding set.
> > */
> > +	if (iscredsecure(cred, SECURE_USERNS_STRICT_CAPS))
> > +		cred->cap_userns =3D cap_intersect(cred->cap_userns,
> > cred->cap_bset);
> > +
> > =C2=A0	/* Start with the capabilities defined in the userns set.
> > */
> > =C2=A0	cred->cap_bset =3D cred->cap_userns;
> > =C2=A0	cred->cap_permitted =3D cred->cap_userns;
>=20
> Going for 4 week holiday starting for next week so focus in on nits
> but since this is something to do access control:
>=20
> 1. Please go surgical with the diff's because this type of patches
> also require a surgical review. Now reviewing this like riding on=20
> a bumpy road with a car of which suspension mechanics is broken
> ;-)
>=20
> Hope you grab my argument here. I only want to look at the problem
> and solution for that not random stuff..

I skip the other patches because of my eager to get on holiday but
my instinct tells me that at least some of this feedback applies
to all of the patches.

So put your solution in sight, not clean ups.


BR, Jarkko


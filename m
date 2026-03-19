Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCHBIImyu2k8mgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 19 Mar 2026 09:23:37 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B4C2C7D17
	for <lists+apparmor@lfdr.de>; Thu, 19 Mar 2026 09:23:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w38f9-0001G7-FY; Thu, 19 Mar 2026 08:23:27 +0000
Received: from mail-ed1-f44.google.com ([209.85.208.44])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mpellizzer.dev@gmail.com>)
 id 1w38f8-0001Fz-LD
 for apparmor@lists.ubuntu.com; Thu, 19 Mar 2026 08:23:26 +0000
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-666f646f5cfso2769781a12.1
 for <apparmor@lists.ubuntu.com>; Thu, 19 Mar 2026 01:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773908606; cv=none;
 d=google.com; s=arc-20240605;
 b=erOqRVQ52K+q9/yy9K6vxBF84gCFU+5kwtxgSMrx2xVcanRb9zhLwrxm3hqumyumPo
 3Dl18JOxzRg5dad3+9MiE08E7VoIlaYPI4rNgUdcZfoMELi4nzzjP03GygeRtnbR0vkt
 ME+ZVur8jQgB6uPiMO/OA87+fvs4SYjoBDaHBxKhVyB7ILQKOz83nNBUiJLX49o0Btgc
 fZuotXdPnRy2cZwvhK9lRCkmlAf2NwGSdjen2kGVjbt7/MEKBXkoiMiZfKgX+FJ9na3k
 ddnz45gFo3MhmezVeR0K/LfVKdfWktWNeuNB0g2QEvZLUjEqX/pcPEUoFe+tSZYtU1y7
 pCzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bjUr6MGV3U2zzmMZUFw98rgTx4QpGsGZjMQDA4j0k88=;
 fh=k88/jsi9NoGSTnxjnBZPrvQrNZ6qpoPwEZ6Nygp8cZ4=;
 b=krQssGJHmyinFerIdDAx/XiBbr8z4Ts1cjop5coxI23yEfBRxfEza1PXRJxT/5DZqW
 tNa9p7i415XSyyRFSUwfW4PKshVNJnoTupi2eYKzPEi+Il7rzofqns4bMnD7k37mV3hY
 sh/fJFfgFocUb4U3K1gR+TRDn/5nc4+AYc2P5bVE9IYsQsYocYfykGnhriUFgUR8n3CP
 xBRv62ztsmB9PtiIgmSMDP0rEeneBN364hy80fmpHeulfek74WpJjOCsuCrkmcii/YJf
 fugff870o+5uS5cuuw8tOq0UaoMrTvtweIrQ/zDxUDmA3o2H+l95nGojeFnU0DnQxSzj
 b+0Q==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773908606; x=1774513406; darn=lists.ubuntu.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bjUr6MGV3U2zzmMZUFw98rgTx4QpGsGZjMQDA4j0k88=;
 b=M2FOTiVXx9+uBtrgLEowratiDthctt8ew/X88lruw/0ur4KSOqo0ujW6hpNPurkASF
 h0yiL+QC7TOrbRoUstyJkJiQIP8W7KkWLFOLCYUhcMWA6a+2WJtldsGi8zjTIFVL44Iy
 j2YV4RU5iPr+24jrMvHSqE8PlEr4++0CaSxNyM2gQMcGJBHLSXlU5YdGn6oRrJKpQMYJ
 79xSexUNhEearRBkHEZB+o1XReZJ8T58lc5Yos6a5JOXRKdBDsOJKADFYQzkMlhxfByl
 eLvvuorkJ96Idp8RIDkLx6gJ61F/1qjEarNeaPwNo2uUeA0lCMIgZloo4Gx2FnztO7Tn
 r/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773908606; x=1774513406;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bjUr6MGV3U2zzmMZUFw98rgTx4QpGsGZjMQDA4j0k88=;
 b=q5+iTOWDX5QxUaFog4XvqAVK0El5+o1jzXDkyq6tIJIkPYKb4PgjP+MSbcimPP7WAJ
 lR4tn9Q5P7q2OQLPe/zKXUJYT1UZq8FEyfdfnM1itOZrgfNBTqLmZ+lU2WLpzOu47Sr5
 tdpFkXDWRilN0cTt5LtYn1jGroXdubz3qJdK7hpy8heZg5AdwFqtMmrcgEL6RpdoJgRO
 nYBhSv+hYmyMyu4eM9A0iGeKZ1OG12COkJNwILT3e4jX2/eFq8HaCrQTixxCwrFFmPR0
 oe+yuQ/H6OQpdwDRnlT6dOk63qmDnVa46esrDehhCal0ipTkzD0UNfvO5K+U4dCDVMGZ
 wyPw==
X-Gm-Message-State: AOJu0YxuK7VurdEQxLrdngzoeZRjKRHCA9/CivF/w34agp3Bavw57B8F
 Vu62OZ2ooSxlQ8SCe7l/Ebi4NxO/fR6VoXdhtxtfaZTM0gAUZvBPP17NMuybRe6SF87+NixE2fm
 SW6NP3Yf9rGnAhp1CASSX/QW6YUwb9knTBLjw
X-Gm-Gg: ATEYQzxTwdk865VSWwsUmvyVkJ4nQXFoUxaPV9J6FbrsRfs7OeQ8OFIyvRV0MU9jst/
 cWrkNlmgJ1LjIwt3tJ7JCwTzYcAfzZtq5NdP1PlDnZ1vO3xDSjLLeFQbqfuSQwk1wbrGNWvLG9P
 5xqdUG11iNVstaDUegPT+YR/iETgsSzjndJ3gbUDes9vEYwvjPQxwmu5KeRnu/4OlBCBI+B60Yq
 mWt4enIgQpb9lNxSREoA7mLbCICqpsghkxUbI+ou+9cnjlCqEdDzZAXDpkyOWY7y4Nu+ymHW7kU
 CuA0
X-Received: by 2002:a17:907:e11c:b0:b97:73ae:e2e with SMTP id
 a640c23a62f3a-b980f9e248amr87553266b.18.1773908605574; Thu, 19 Mar 2026
 01:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260210172159.535137-1-mpellizzer.dev@gmail.com>
 <779f2d5b-a5af-4137-a1ee-78dc9fed58e1@canonical.com>
In-Reply-To: <779f2d5b-a5af-4137-a1ee-78dc9fed58e1@canonical.com>
From: Massimiliano Pellizzer <mpellizzer.dev@gmail.com>
Date: Thu, 19 Mar 2026 09:23:14 +0100
X-Gm-Features: AaiRm504G9ed9x5jw35d17aQJhgfrKxgvqcsFzi0qAVz3Org6Ozme7GafH5FEhk
Message-ID: <CALUEkOc7n60MdBpA_hF5Uvhwxs+ABjn=fWrzUg1s95p8wAgWWg@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.44;
 envelope-from=mpellizzer.dev@gmail.com; helo=mail-ed1-f44.google.com
Subject: Re: [apparmor] [PATCH] apparmor: fix incorrect success return value
	in unpack_tag_headers()
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.19 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mpellizzerdev@gmail.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mpellizzerdev@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[apparmor];
	NEURAL_SPAM(0.00)[0.772];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,canonical.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 68B4C2C7D17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 6:53=E2=80=AFAM John Johansen
<john.johansen@canonical.com> wrote:
>
> On 2/10/26 09:21, Massimiliano Pellizzer wrote:
> > unpack_tag_headers() returns `true` (1) on success instead of 0.
> > Since it's caller unpack_tags() checks the return value with
> > `if (error)`, a non-zero success value is incorrectly treated as
> > a failure, causing tag header unpacking to always even if the data
> > is well-formed.
> >
> > Change the success return in unpack_tag_headers() from `true` to 0.
> >
> > Fixes: 3d28e2397af7 ("apparmor: add support loading per permission tagg=
ing")
> > Signed-off-by: Massimiliano Pellizzer <mpellizzer.dev@gmail.com>
>
> sorry, my reply to this seems to have failed. This was pulled in for the
> 7.0 PR
>
> Acked-by: John Johansen <john.johansen@canonical.com>
>
>
> > ---
> >   security/apparmor/policy_unpack.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/poli=
cy_unpack.c
> > index dc908e1f5a88..221208788025 100644
> > --- a/security/apparmor/policy_unpack.c
> > +++ b/security/apparmor/policy_unpack.c
> > @@ -825,7 +825,7 @@ static int unpack_tag_headers(struct aa_ext *e, str=
uct aa_tags_struct *tags)
> >       tags->hdrs.size =3D size;
> >       tags->hdrs.table =3D hdrs;
> >       AA_DEBUG(DEBUG_UNPACK, "headers %ld size %d", (long) hdrs, size);
> > -     return true;
> > +     return 0;
> >
> >   fail:
> >       kfree_sensitive(hdrs);
>

Hello JJ,
I don't see this patch being part of v7.0-rc4:
$ git --no-pager log --grep "apparmor: fix incorrect success return
value in unpack"

I don't see the change applied to the apparmor-next branch either
(https://gitlab.com/apparmor/apparmor-kernel/-/blob/apparmor-next/security/=
apparmor/policy_unpack.c).

---
Massimiliano Pellizzer


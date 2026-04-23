Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNUgBsYP6mn4sgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 23 Apr 2026 14:25:42 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7134F451EE7
	for <lists+apparmor@lfdr.de>; Thu, 23 Apr 2026 14:25:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wFt7c-00080F-T8; Thu, 23 Apr 2026 12:25:32 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <georgia.garcia@canonical.com>)
 id 1wFt7b-0007wL-KF
 for apparmor@lists.ubuntu.com; Thu, 23 Apr 2026 12:25:31 +0000
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 693DF3F9C6
 for <apparmor@lists.ubuntu.com>; Thu, 23 Apr 2026 12:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1776947131;
 bh=NkPqKO7ZmpqAAc7Ac7xNIDTe0L1sSM5Ly9dix8xV50o=;
 h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
 Content-Type:MIME-Version;
 b=QJOhHHRaq2HkEz846RzCjirWDgeDg3PjJS+hPrTMjy1zks4W+QQbwDta59Dhc3ytv
 9vn1dZmV87EV3+0yy59E51aMkF1nxsG0kIBOD2hlppzG+Vy2sasminP+2C22gML6YN
 +f1JCCc8PMo+0A/WnEcK9ohNWh/7S0V4fnPyIM5OsCOGGwdno4r1TDJWQHzK1/gRYb
 ZEvhtuvfuUeQNDkWvMh4b2c9SWFV5qE5OTJy+yZAS4UnhbbSlAEdsy76UgqxSSrl1P
 x66zymw8SwEFzaOGforbt7/GL2hs9PhZaiwL2OV7uZi2zNNKG5q2VRC+Z7FBKNRRI/
 fTG/MMujPXaIg3XMTsOU3si+y421Jp+Ok9saBzAOhrEkWZpUE26/tmQU4ScLkGMO3h
 ZPR0iZkURuOgaDmsAB/sEtiIzIhSmsQUVGf4xPKvT4oe0YSPNdHUppCYZSMLp4VN9N
 29EI0mQprc7/7rt782WlZS1odi+xKKHqIQlrxNBQdnQuHIvcT0+/c8oFqDGR7z5Rau
 5N9KYU2HoO1vc/M6cN8SBmVX+5ocOZhuGk2/zd357WmUhwfSn2vEwHgv2uoK09o4RX
 xK9um48cuzxfhS/0vUPYfKJb+2kYYeBcrPZUv6ANyqqYd6sRXMYKDA+YUuACWH+GY+
 Q+KX4YpWzZX/Ua6gam1I07cw=
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-56f52dcdc90so4527454e0c.2
 for <apparmor@lists.ubuntu.com>; Thu, 23 Apr 2026 05:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776947130; x=1777551930;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NkPqKO7ZmpqAAc7Ac7xNIDTe0L1sSM5Ly9dix8xV50o=;
 b=iCkWsyd6u174K6Z6Gfts29qbqgPEjlXj+ueYs5BsdcQMT/Bb3peSjQh2Rrbx+nZAX5
 i3ZtGHx/EJaOM4OEndx5gpDCnQ9EavgDP86eFVYcRGTUc9kW8hzienWB0OczGC8MpL+g
 aiNhix2naXgBX7bFvFWgu8+20t4pzuYNgPsjYW8c/4rU6lQ2nqa5wkQFKThr8MVxfWo1
 jUc6QYG1QHl8cPkphWB1K2dTlp/+G9j6C6esgU6tXzwpMNqv9PzyF+vB04BILXMh2Bav
 iTHb30tfxyw4R4FbiYJKTj2FM0L+SZlH+IRKkH0MXJB5PwKAZCCNrzbJtsloTEB03/PK
 FyUg==
X-Gm-Message-State: AOJu0YwFQVBXcMA+fsTgYK9c38W+ZVUGn+6uZ22Nx6Xc3H2gHDlIEnqM
 d8Q1cyjXpj3a8xM0iHxPl0aJrRoa4sh+Xh1j32F1PuZZLuEhM0bYI9RVCIZXz8HQW+ER9GirUUS
 4P9G4m8iPNYKjmQUxgVOizD5mUIb6jGqexBoq0dEXrOxPmxf6NGRuG/B58S7NcxTA+VnsC2Js3U
 zjcQ==
X-Gm-Gg: AeBDieuCT9cCPJuTx+yXhzV+eCkhhuQGV8tgVNAkU7FhvPYBFsjpg3hkuQITxkog7yN
 EdCH0TZ4jKUIvG+8tdPm9uoqwSIsJ8FA+3Dk3bzop5HbzdaXWrnS3VLoXJItqq2IjboOj2rVKIl
 GYTm/+tsBB6PFdJKf1JXKkAQCjyfvTEA6Wj7glKkOPckQt9pm1wrRN8uZancSwrEhNngh54/HtF
 QU7ByvMrqRj6c1hEm0/rE174Izfs/Zkv4BDxAfiSz3VkpXBhfBCO9zIvyEg04chlEoUi34IovQk
 4tKnzHJkb5kue0shj7gLtY9+RiwwoWIue8ef493nCqRFyRoh44VaMmfIutK8/K5UjnQjt6NIKyC
 Km2oUPxIHAoXucNVK11iakpUqm5bcmjYvXDqAAq1rjdH2wTzuP8+ZASEDM3puYZDGcicqUkBOSo
 OnEabM
X-Received: by 2002:a05:6122:2087:b0:56f:2aaa:450c with SMTP id
 71dfb90a1353d-56fa57a56e7mr13477209e0c.1.1776947130432; 
 Thu, 23 Apr 2026 05:25:30 -0700 (PDT)
X-Received: by 2002:a05:6122:2087:b0:56f:2aaa:450c with SMTP id
 71dfb90a1353d-56fa57a56e7mr13477194e0c.1.1776947130033; 
 Thu, 23 Apr 2026 05:25:30 -0700 (PDT)
Received: from [192.168.0.106] ([187.95.109.208])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56fa91ea606sm11459481e0c.5.2026.04.23.05.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 05:25:29 -0700 (PDT)
Message-ID: <7861e5cac7997776abf068836e649efb0460db3c.camel@canonical.com>
From: Georgia Garcia <georgia.garcia@canonical.com>
To: GONG Ruiqi <gongruiqi1@huawei.com>, John Johansen
 <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James
 Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>
Date: Thu, 23 Apr 2026 09:25:23 -0300
In-Reply-To: <20260423031056.563527-1-gongruiqi1@huawei.com>
References: <20260423031056.563527-1-gongruiqi1@huawei.com>
Organization: Canonical
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
Subject: Re: [apparmor] [PATCH] apparmor/lsm: Fix aa_dfa_unpack's error
 handling in aa_setup_dfa_engine
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
Cc: linux-security-module@vger.kernel.org, zhaoyipeng5@huawei.com,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org, lujialin4@huawei.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gongruiqi1@huawei.com,m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:linux-security-module@vger.kernel.org,m:zhaoyipeng5@huawei.com,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:lujialin4@huawei.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[georgia.garcia@canonical.com,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:-];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[georgia.garcia@canonical.com,apparmor-bounces@lists.ubuntu.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,huawei.com:email,canonical.com:mid,canonical.com:email]
X-Rspamd-Queue-Id: 7134F451EE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2026-04-23 at 11:10 +0800, GONG Ruiqi wrote:
> aa_dfa_unpack returns ERR_PTR not NULL when it fails, but aa_put_dfa
> only checks NULL for its input, which would cause invalid memory access
> in aa_put_dfa. Set nulldfa to NULL explicitly to fix that.
>=20

Thank you!

Acked-by: Georgia Garcia <georgia.garcia@canonical.com>

> Fixes: 98b824ff8984 ("apparmor: refcount the pdb")
> Signed-off-by: GONG Ruiqi <gongruiqi1@huawei.com>
> ---
>  security/apparmor/lsm.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index c1d42fc72fdb..ead2f07982b6 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -2465,6 +2465,7 @@ static int __init aa_setup_dfa_engine(void)
>  			    TO_ACCEPT2_FLAG(YYTD_DATA32));
>  	if (IS_ERR(nulldfa)) {
>  		error =3D PTR_ERR(nulldfa);
> +		nulldfa =3D NULL;
>  		goto fail;
>  	}
>  	nullpdb->dfa =3D aa_get_dfa(nulldfa);



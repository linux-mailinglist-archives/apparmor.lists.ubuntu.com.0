Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aN0GEw/tu2liqQIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 19 Mar 2026 13:33:19 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9E52CB30F
	for <lists+apparmor@lfdr.de>; Thu, 19 Mar 2026 13:33:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w3CYn-0006jC-D3; Thu, 19 Mar 2026 12:33:09 +0000
Received: from mail-ed1-f48.google.com ([209.85.208.48])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <martin.fretigne@gmail.com>)
 id 1w3BH3-0003Vn-Ff
 for apparmor@lists.ubuntu.com; Thu, 19 Mar 2026 11:10:45 +0000
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6674cba2c50so2732175a12.0
 for <apparmor@lists.ubuntu.com>; Thu, 19 Mar 2026 04:10:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773918644; cv=none;
 d=google.com; s=arc-20240605;
 b=H+RvOPJXAkH3FgAoR/wrBRcaIlpasdzyFkcrlXeEvbJNTsmDf4d8K9MA9g0Kp1Lc8e
 MAeQy6gt/1QKo22Fm+31J1IoQYg/03MiJ5LiP2muQv5GW5C4yz8aX0Qu/HckhCs7WU8J
 w96tYTbNrRca5PZoKareY9eD1FdatPJyjJuOUb5C77hUZZnYgQtVCPwOrNxASqFwXkV1
 SGLEvVReJfC7CqZaHrnsOJGqtvEJLAnD2rrTapyzfdgcWWJhknHahVN/s653fmSFndnn
 Qbmu57oPOdazQS+U5+A9nu1kIkJ2MYSUqfgBX4jX5fu3mJKEcC4yW/euTIDaqXnfvUxo
 zavg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=MTD6cgRxIAsWPk9SHI9wYd0gj6KFBzD7uVkf8J8uYdM=;
 fh=6kJs4E9FREACQ4OolFzrY1yZHRYT/FyoPzZ1k2kprYk=;
 b=Kgqh8lkOTzZzDCA7bIdO/rTedU+tXCavowvHAlGvD+WI7ra4yTk/U4YCorW/MZ29JH
 Xf7S5ftIAdhCjEL+/gnObbC5bWp/lHAsNBkKnV7ZkSN8xHbU6eZXzsVOyRA+VimAGVO7
 jgRl/au0IhOsJgnZfxRG6ebQUH5LUMvWrLXWlCeTJ778XB3iyCHFpUKIVjaPzlfMdJ/1
 K/grX/TOUgpUDNuAZxD2F4DKX8dlPlW+CuyLeqkReWmgJeM+Ry5bVWOJtMDrIeXU9g5M
 HEW2gTBTjUGXLZ/FbEag0UdABeHYVYNn0MXZPExDkXxNG4mOvp0huTFqsdO/oWxS5n2f
 a3Dw==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773918644; x=1774523444; darn=lists.ubuntu.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MTD6cgRxIAsWPk9SHI9wYd0gj6KFBzD7uVkf8J8uYdM=;
 b=iAf5BQnYPaoJDELGa2DjSNUo8GFV8q/RkQeOugWntTZPvsopwJ+yvM7g7nJi4fRqZk
 Ykt81PGwWKuR0WXN963sCNB+KKs5VPauZZ14an4CmZcbpAgkWh2lJzuM0i2tPqDPQaFk
 e0gHks0L9WXFnrWCR8JeFLwcwnXUaxzgsSLu8HHje6HKGOJ805H+l+CX3nY7CloqnZoe
 24TYNDrLvbO4tcX9ZXogbXr3w+w4ZwvOi0pUAek54A489XXbL4CK6KBHiv5lf//KtGpy
 6VHL68DWfbIRwo7gKJUjbxOxzoklV0I2MdJ75vWYQYeN61OI519KK/f3TJVBZe9fOu4b
 HLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773918644; x=1774523444;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MTD6cgRxIAsWPk9SHI9wYd0gj6KFBzD7uVkf8J8uYdM=;
 b=YuhDS/nlDNacCf8R2mDZrEo/0kVV5lndbBv5aLoVFWh07LmQCqRveXwjcX8/+FLQPk
 4BO/Douqs+Crv9cXimJ+EmphUqU7RZbs84pv2+t0de583gBNaYrfm5Nt7Jz7fqZ/t0z6
 2JGEd9raB0ODv1ke8x97FWQRb2vagXNR1QIIHW7530Qju1X2+cFIR9nzw6rdYLCQ+mmG
 QyvH/6HFgDjkKWTY2JyZcqwPa488cGl4BGzDsqBRqi1OGF92+48hJiQr2CYeOQk3WWDy
 9KFM8D8Cp80qz+sxqTNFMOlrX4vvfiwhBGLdU6ZOWchFVmdJJrr6etBcvbGtLcBokHYr
 E+5A==
X-Gm-Message-State: AOJu0YzhQ2t74dx4Y8VvqNQNLxn4wfsNYU9xkyZfZ+CTLOHaOLWrKFdw
 7BWYblYWJio/ResmPB1DeEuSJzCEkSIxlO07/aIfneoNcj3BeJEt8zuG2E0mszhwmAI3+PI4Ajs
 PcRa3+cT9ffgYkcM2NWo0/QJafKC2ZYfZQQ==
X-Gm-Gg: ATEYQzxgecEKSJmuC61sJ09/0FQ4U5K6VQXWEmRT75AL8lr7/oeQ/IxjvPBDx+aAcBn
 j96HPEwFv63P3sWtyM5s94xAKFz/FT3zQmzG/PVCWj/Sxz/qYwMysd3Y3dqpQYW6MJPh9prq9W5
 z8CpGo3Vpe3nn0up7y8V3nmKAy8s30xOWUPtoQI5+MMDiCKaaXge56xc3RXGrj2uaAqOdMzwEsz
 urIiaA2YA6LhLT3E9DqQMPDmK8i1N9tPlLB7ZpAAk5DMyG4IQDm2K3muL/CF97qs5WOGfjTrOL7
 Jo4nSKt5jvN0ywjCXCBFq2vdZ/iLZTqQQFz3ok56kzA+FAkftVjumESua1NpO5+EI8+ZYykMQLz
 Z7gNNlX9N9Y/0dvliG2UIFqNCuVdAbsd4WrAwYyAZy77c/YWj0Iq6qN3o908=
X-Received: by 2002:a17:907:da4:b0:b93:61c7:4f09 with SMTP id
 a640c23a62f3a-b980f9ffc31mr224603766b.20.1773918643775; Thu, 19 Mar 2026
 04:10:43 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?TWFydGluIEZyw6l0aWduw6k=?= <martin.fretigne@gmail.com>
Date: Thu, 19 Mar 2026 12:10:31 +0100
X-Gm-Features: AaiRm53UxLk_EYtY4HT_39MqbA9WguTDw9ncV558cT8ILuHNzXhOlcOH2KLuCZc
Message-ID: <CAM3NJSLjedYiA=NA=fBFHdX_x7v1AuRwii3f8v8zh-iUAFh_bw@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.208.48;
 envelope-from=martin.fretigne@gmail.com; helo=mail-ed1-f48.google.com
X-Mailman-Approved-At: Thu, 19 Mar 2026 12:33:07 +0000
Subject: [apparmor] question about profile name when it is a symlink
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.96 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_MIXED_CHARSET(0.77)[subject];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[gmail.com:-];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martinfretigne@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.729];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 0D9E52CB30F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

I'm currently trying to set up an apparmor profile for ntp on my system.
There is a profile for /usr/sbin/ntpd. However, on my system
/usr/sbin/ntpd is a symlink to /usr/bin/ntpd.ntp (the real executable,
it is symlinked by update-alternatives). Hence the profile is not
active.

I could change the profile name to /usr/sbin/ntpd.ntp, but is it the
right way or is there another ?

Best Regards

-- 
Martin


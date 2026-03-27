Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPNBCT3YxWnQCAUAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 27 Mar 2026 02:07:09 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA9433DB80
	for <lists+apparmor@lfdr.de>; Fri, 27 Mar 2026 02:07:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w5vf7-0004Dj-41; Fri, 27 Mar 2026 01:06:57 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1w5vf5-0004DB-Li
 for apparmor@lists.ubuntu.com; Fri, 27 Mar 2026 01:06:55 +0000
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2aecc6b0861so9871175ad.2
 for <apparmor@lists.ubuntu.com>; Thu, 26 Mar 2026 18:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774573614; cv=none;
 d=google.com; s=arc-20240605;
 b=bdAFYx9m/w8jlw7zSiArUkKf3O13Su/Oy5lUcQuaHsBI86lqX0zJhuZb+QNqGoKt7i
 3VuuTjErgYHNZxyKgJgY8/f2aOPi1AnO3iIuaiGZ70oJ/bcbTF3efQHVjAWpaBM7/nzc
 bB23GxjemP5io1cTMkssbz2uewmS2sMndGYO9Xg3XOpPofF0OAPo8NruGl+FEog9ubrk
 J8V140ELJ4j+kjs/qxoonTeS88CJ2bsQ5aec3MShkunqqwr/bePg+Q+z/FjnvKgoIenI
 q3xhB3sOL7d5MLnOXpp5gjColXdfJt9MPOjy6oUxTthd+6UD+jHzCcS0jHEM8n7g6XMx
 isjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=NnHkamm+AEobpA8psr45RG6jMwGE1Y1ScbSXU6OCnyU=;
 fh=hWfsM+8WnpOEwy/RCeRrjbXqIjGzld2/8xo9qAF4Xp0=;
 b=S1c75ufzadVDA9v2PxTd874NjfLi/Xuh4T4ykZgF3g3SsVZTp/MR/Stmefn9FJPi9l
 +CpaJEX4lMpxGrUEVeqfi06AdjXJ9PsEFaKpCLJXEMqw77jR0Xw9BQuYgaUEBMi+tkg/
 5ll3Vmv6JjvguHQk2RiUgVBUhu0sYFS7A7H6xhA0vPlnNDWWIPUNxDXWo0XIZEniQe31
 tv+8imm8exF+qfah4b2BbC8xY0Wr4pjrR/GWrzShAajgM8azypmguca6dkeJBGf5k81X
 0DWqhAOkaI1P+vhXA+nRbrP0k+/EtvFBbDPJlun70b9In8BPDeICIta//TQHdPvpm6WT
 BUKQ==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1774573614; x=1775178414; darn=lists.ubuntu.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NnHkamm+AEobpA8psr45RG6jMwGE1Y1ScbSXU6OCnyU=;
 b=LXLlPeMtl6J73znmB1AtY5KuZc9AqT5HpgvZXug8sYhlzDAxu3HR/kP+bsiPaR3avs
 ZGg2HaS+2T4ksZlvHyfnv98RX6AFEa/VvJEzQOms6uA+SDTKCuPTQVJq1AQS6vxcu9Lq
 YrKk29Ndw/qNXz9wuQbgqeNtlq4VV8yM9TIOjbEDDTkMSdDmkPB4nQC6fvo6ZJ7dpGqP
 SxwienuuSMKF9ndo/Xhh7CJqe/ejqDFFtZPPwUs5V3ZoAiNPFb4agpjDDuwbQlM4HFfe
 AV9wSLs6ZqzQOu1o39G9II28xhjpXgicD3X9Yj1wQBLsl64GKTeZAt2dIEcjMQ2eUOZB
 XUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774573614; x=1775178414;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NnHkamm+AEobpA8psr45RG6jMwGE1Y1ScbSXU6OCnyU=;
 b=dS4C/6fz66qgrDO9DKDvAxi+4UKWizMxuW9DEeVs55lQBcob8NaQ+6HfFEN9P7Vv1M
 h+J/udfir6Au7kyoL8lj1JgIPzlvcufGj2BHarNj5DAd22GDbys1J+8DC7jFqg/x2VSA
 sKVs72VzD/puZQmwbpTWwXpSiDPP4Vx3WRgoDYJU4Xk2rDI954d0KsQTHN6aCAJOGq4I
 xskArkX50hiK+pXcJcKVNgSBsI+cnOBnpTIomz39KuFgAeTIqBrFMWj79byebIXPNCSv
 j3in3HuE36RGlTIiYzwKr7hqun7HsxODtZb1q8CNrTBJnRApQjAgblkK3BQmNX6HJJAE
 dLRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPLZp/EKg2vQqUa+QPCjemMBO4I0/XnJ52Pb8Hwus/6SSfOe6pem+GH3ddFvyhSPsl76/jJPamcQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwtIEPHe8vwGkx/eUS2khU5fOHdzeoQCNCoTC1xXjXY3DHNcg5m
 QJMYWulUyfEsU54wLjv28CSujFH0ue99iBavph0EUZNokW7uU8dHVjvv1PGwOFeHXa9E8QeR10Q
 Kmn1k0pzWP/mBwtEy5zj0JPTen/80FaCBGW8sz35n
X-Gm-Gg: ATEYQzzWrZeMLur/aSL4ivxlPRCbVNpfxHZjBuzAFHAJXdZMwdIdCgN7V7Vy7Xo/HTQ
 2YZ4mNvv9lnZ2XEFsxMMrKW3LRUtXmDUf8axJxKfTJ0oQFBaxvAaAbL/FJA/1zKk7M7pzfsRIqu
 HOAG9fVurdcWTmeM+1IOO4ntNu+qcIPVXIlRtgAGsqcqN/8XvUXvD5piokr2hrmFE+keOI4DHBk
 GTQVdpfoHOCRDftLOxz5FruAbe8FgNDIDFIUZf5R6FhINkluvVIYkD4DVJaN9yYOeXkUj3cW6Tg
 L9X94CU=
X-Received: by 2002:a17:903:4407:b0:2b0:6621:cedd with SMTP id
 d9443c01a7336-2b0cdd31a51mr5581795ad.49.1774573613689; Thu, 26 Mar 2026
 18:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260318184400.3502908-1-song@kernel.org>
 <CAPhsuW5h=-BVp6g2UtHTUO8PQtbiSmqDrn0BT3rbdN4BkhQpeA@mail.gmail.com>
In-Reply-To: <CAPhsuW5h=-BVp6g2UtHTUO8PQtbiSmqDrn0BT3rbdN4BkhQpeA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 26 Mar 2026 21:06:42 -0400
X-Gm-Features: AQROBzBKwxHMqZrCazbp_EEoFhocvn47dYCOH9CjcWVrjXYp2B_xhHc7YALOkis
Message-ID: <CAHC9VhQUU9L9OTtyo+2mdi0P5jCk1RXnJBxT1+YUyywMSfLuPg@mail.gmail.com>
To: Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.214.179; envelope-from=paul@paul-moore.com;
 helo=mail-pl1-f179.google.com
Subject: Re: [apparmor] [PATCH 0/7] lsm: Replace security_sb_mount with
	granular mount hooks
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
	FORGED_RECIPIENTS(0.00)[m:song@kernel.org,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:penguin-kernel@i-love.sakura.ne.jp,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:mic@digikod.net,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:kernel-team@meta.com,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[paul-moore.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,vger.kernel.org,gmail.com,i-love.sakura.ne.jp,lists.ubuntu.com,namei.org,redhat.com,digikod.net,zeniv.linux.org.uk,google.com,nttdata.co.jp,meta.com,hallyn.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	NEURAL_SPAM(0.00)[1.000];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: DFA9433DB80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 8:31=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> Hi folks, especially SELinux, AppArmor, and LandLock maintainers,
>
> Could you please share your comments on this set?

I think we are all aware of this patchset, but most of us are fairly
busy at the moment.  This patchset is in my queue to review, but it
isn't something I'm going to be able to review this week.

> If there are no issues with these changes, can we land the set in 7.1
> kernels?

Given that we are near the end of -rc5, that is highly unlikely.

https://github.com/LinuxSecurityModule/kernel?tab=3Dreadme-ov-file#kernel-d=
evelopment-process

--=20
paul-moore.com


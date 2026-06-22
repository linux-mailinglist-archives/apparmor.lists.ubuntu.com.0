Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id twAKNz5yOWp6tAcAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 22 Jun 2026 19:34:54 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE466B17FA
	for <lists+apparmor@lfdr.de>; Mon, 22 Jun 2026 19:34:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com;
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wbh5i-0005AG-ID; Mon, 22 Jun 2026 16:01:42 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1wbh5g-00059m-Nm
 for apparmor@lists.ubuntu.com; Mon, 22 Jun 2026 16:01:40 +0000
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8E7C13F29B
 for <apparmor@lists.ubuntu.com>; Mon, 22 Jun 2026 16:01:40 +0000 (UTC)
Received: by mail-yx1-f72.google.com with SMTP id
 956f58d0204a3-662d529d315so5774860d50.0
 for <apparmor@lists.ubuntu.com>; Mon, 22 Jun 2026 09:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782144099; cv=none;
 d=google.com; s=arc-20240605;
 b=dnyl+c83BFYlanWlbzfsny+L0Jx9U5D1ouNwE0+oE24NJyTS3BelHYMFzsLjqpTmDJ
 Me6bzxcYLrM4DHZTYSdFqyZVJDgbXPW5hutlUBZoTUUCJEkqtsb1R2AEn7b4uUOA7c65
 ByUFcC3EderMFk2AyHayXkJ/S9P+L9q++yWzdgkGBVcSvunFd9PpwMtRzG7h+R2ccAzC
 FdfxvtF/91fFhci9hj3BoQZbxCRorCRcb8dBWnOO1qQUHOHo6U+7i/P2BAbyx5/23eTp
 WjmgxPz6hME8FRq8B3yo08rTenpzS//hdlWhaKwIFInod3jmuwd19iJtVCeTSKlDsbM4
 Iu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version;
 bh=GNnUNGcYlXek1bndNKg8h/XCXP07hZRUxLwxIa672vQ=;
 fh=+0e/CDZvUmBdnIN191iaQ1GgxHk8GmE+Sts8kE2ybAI=;
 b=ZNVinTtaXUkRErzDcEG0ajf6eReU7inEDOjMItm1eVW6RJMjhNL8rc2guCoh1hvmXI
 hRGjXT6dUe6r+4L6Fs9cPwXxV6tlyn0XynUbRXlghDSmH5BX4xznRtIaKh+cNeqMWiix
 cZcv3vdJZ+dQcqufGLg8m2cIwY2f13NMKWY0e6Squr4Ac03HA7WFHjRcvsErYfMRNHGs
 HsovZhHaAoBzrrcO0htDArzRNHt3ooUEnxA2u4fZLhJERxMiFvjMWRQEHhwbHAh9hrim
 1r5Nwf5ZfTld+ACzhMgtThvumv7KvhvRswQA0+hW5P+dcjRz38NFT9PL1XzdE0juja4S
 3P+Q==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782144099; x=1782748899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GNnUNGcYlXek1bndNKg8h/XCXP07hZRUxLwxIa672vQ=;
 b=aCX7kcnOiMQGdxSB/x9TvjJpUioH6xj512emriq7bD9l+YnFu2/tG3d9iImeIO+1Vg
 74R3IlFLIW02uF2QhZRcnGpwqVYQNdmNqj0YnkLrLynbq91/hXb8W3MiRpMJdLfIj2+M
 jdgV50kgUT94tZ9OYcHMRqqdpcNghsTA/CADFSse9DsJ/Gag1XsvE9YgY8X2pxNxgmnQ
 qqeUtt06Y8b8rxVXCoKWGnfu+uxUZ/xXdaFsf0uIzC2U1DtUGQBoxMIaoeKAb/WovtMm
 eogyaedXSPBaPxUkGCGie0yRjFMZmNR5nijzkXfbDnMYIc7frJ0dbuA27E0z0UTfRD07
 5CMQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrJiaQCadzI6N01fKBnBGjwdspSx1ih+pMGyoRi5ecS5WMpuuuGQgae/65cAp9wisdo7xXMjga00w==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YyOllBwc0FZHrGiIb+wyFB/t2rn7K9uOWoPG+6vcLUdiA5GN809
 QKEvcWxyjcQzHdinFAw2hnUdyaI0v2RVVsk+1NzSJeFxqKRHBPCIvDx3axBv1qDIBxYPdqmMuFF
 jsKxvLr0Exrf9Ks6FNfNBh2MQ6FGRBRwVvGzCSMZKEqLhIHFrRm+bqJLSyMXTp1lThRBGBCwMbB
 K6cTNPA4EC1vaY4unier/53WonXZP4xp/vITJubFkKmFvMMH5k1ut6FJJQHjWKnZs=
X-Gm-Gg: AfdE7clMIXcCiqESsQY3C1Uub3BSmBlPgazW1/VRd6WvW2fNDd9EhbayUV2ejDDs67U
 oQ/21ScQSVjjSK6V2owZE88ESUpoLPAIAs5QsxKelJLaCRCG44RUmyBxlrlfCuduzdlL7ekdGgL
 1Lc2uls04WQhjigToVkx3/YzY0ac28xi/j69bC+gVdzFNzmx6vNrZnJMglyI90Ft26W2CT5f+Tt
 wAp10liu9nrpyXFI4PpsbFEEdwTQW87CmGESkKbXkmERF8PdvgKfXLu
X-Received: by 2002:a05:690e:130c:b0:660:6a0c:c734 with SMTP id
 956f58d0204a3-66312db92d3mr9612977d50.17.1782144099231; 
 Mon, 22 Jun 2026 09:01:39 -0700 (PDT)
X-Received: by 2002:a05:690e:130c:b0:660:6a0c:c734 with SMTP id
 956f58d0204a3-66312db92d3mr9612779d50.17.1782144097184; Mon, 22 Jun 2026
 09:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260619011138.264578-1-hexlabsecurity@proton.me>
In-Reply-To: <20260619011138.264578-1-hexlabsecurity@proton.me>
Date: Mon, 22 Jun 2026 09:01:25 -0700
X-Gm-Features: AVVi8CehioJRX4sF0fHaXxWwQZ817Vualcvqp9lWndWRp8Tl9cr736Ah3GtggiA
Message-ID: <CAKCV-6vvVcVNL0EDGss7jMUV8nqM8nNWrbCZ5Teq7u3jSM3JvQ@mail.gmail.com>
To: Bryam Vargas <hexlabsecurity@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] AppArmor: TCP Fast Open bypasses connect mediation
 (last unaddressed LSM)
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
From: Ryan Lee via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: Ryan Lee <ryan.lee@canonical.com>
Cc: Paul Moore <paul@paul-moore.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>,
 apparmor@lists.ubuntu.com, James Morris <jmorris@namei.org>,
 Matthieu Buffet <matthieu@buffet.re>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 Mikhail Ivanov <ivanov.mikhail1@huawei-partners.com>,
 Mickael Salaun <mic@digikod.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "Serge E . Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.39 / 15.00];
	SEM_URIBL(3.50)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS(0.00)[m:hexlabsecurity@proton.me,m:paul@paul-moore.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:matthieu@buffet.re,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:ivanov.mikhail1@huawei-partners.com,m:mic@digikod.net,m:kuba@kernel.org,m:pabeni@redhat.com,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FREEMAIL_CC(0.00)[paul-moore.com,google.com,vger.kernel.org,gmail.com,lists.ubuntu.com,namei.org,buffet.re,huawei-partners.com,digikod.net,kernel.org,redhat.com,hallyn.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	DMARC_POLICY_ALLOW(0.00)[lists.ubuntu.com,none];
	R_DKIM_NA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[ryan.lee@canonical.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FE466B17FA

On Thu, Jun 18, 2026 at 6:12=E2=80=AFPM Bryam Vargas <hexlabsecurity@proton=
.me> wrote:
>
> Hello John, and LSM folks,
>
> I have been working on the Landlock TCP Fast Open connect bypass [1]. Ste=
phen
> Smalley's SELinux fix for the same issue [3] -- "Similar to Landlock, SEL=
inux was
> not updated when TCP Fast Open support was introduced ..." -- made me go =
back and
> check the rest of the connect-mediating LSMs, since I had only been looki=
ng at
> Landlock. With Landlock [2], SELinux [3], and now TOMOYO [4] all getting =
fixes,
> AppArmor is the last one with the same gap and no fix yet.
>
> Root cause (shared with the others)
> -----------------------------------
> security_socket_connect() has a single call site, net/socket.c (the conne=
ct(2)
> syscall). TCP Fast Open performs an implicit connect inside sendmsg:
>
>   tcp_sendmsg -> tcp_sendmsg_fastopen -> __inet_stream_connect(..., is_se=
ndmsg=3D1)
>               -> sk->sk_prot->connect()                 net/ipv4/{tcp.c,a=
f_inet.c}
>
> This never calls security_socket_connect(); the only LSM hook on the path=
 is
> security_socket_sendmsg(). mptcp_sendmsg_fastopen reaches the same code a=
nd is a
> second producer.
>
> AppArmor
> --------
> apparmor_socket_connect() requests AA_MAY_CONNECT; apparmor_socket_sendms=
g() (via
> aa_sock_msg_perm) requests AA_MAY_SEND. These are distinct bits, and appa=
rmor_parser
> compiles them independently: "network send inet stream," yields accept ma=
sk 0x02
> while "network connect inet stream," yields 0x40. So an egress-restrictio=
n profile
> that grants send but not connect is bypassed by MSG_FASTOPEN.
>
> Reproduced on 6.12.88 with apparmor active. Under a profile granting the =
inet/inet6
> stream lifecycle except connect:
>
>   aa-exec -p egress_restricted -- ./probe
>   [TCP ] connect(2)=3DEACCES(blocked)  sendto(MSG_FASTOPEN)=3DOK(reached)=
  =3D> connection established
>   [TCP6] connect(2)=3DEACCES(blocked)  sendto(MSG_FASTOPEN)=3DOK(reached)=
  =3D> connection established
>
> (The coarse "network inet stream," idiom grants connect anyway, so this o=
nly bites the
> fine-grained "allow send, deny connect" policy that the asymmetry is mean=
t to serve.)
>
> Fix
> ---
> Same shape as the TOMOYO [4] and SELinux [3] fixes: in apparmor_socket_se=
ndmsg (or
> aa_sock_msg_perm), when MSG_FASTOPEN is set and msg_name carries a destin=
ation on a
> not-yet-connected stream socket, additionally require aa_sk_perm(OP_CONNE=
CT,
> AA_MAY_CONNECT, sk). I am happy to send that patch and the reproducer.

We would appreciate having the patch and the reproducer to look over.
Ideally, the reproducer could be integrated as a regression test into
the upstream repo at
https://gitlab.com/apparmor/apparmor/-/tree/master/tests/regression/apparmo=
r?ref_type=3Dheads,
but we can also assist with that step.
>
> (A single core check in __inet_stream_connect(), gated on is_sendmsg, wou=
ld have
> covered all five LSMs and both the TCP and MPTCP producers in one place -=
- the kernel
> already mediates the analogous implicit-connect-on-send for AF_UNIX via
> security_unix_may_send and for SCTP via security_sctp_bind_connect. But s=
ince the
> other four LSMs are taking per-hook fixes, AppArmor matching them is the =
consistent
> move; mentioning the core option only in case it is preferred.)
>
> [1] Landlock: LANDLOCK_ACCESS_NET_CONNECT_TCP bypass via TCP Fast Open (r=
eport)
>     https://lore.kernel.org/r/20260616201615.275032-1-hexlabsecurity@prot=
on.me
> [2] landlock: fix TCP Fast Open connection bypass (Matthieu Buffet)
>     https://lore.kernel.org/r/20260617180526.15627-2-matthieu@buffet.re
> [3] selinux: check connect-related permissions on TCP Fast Open (Stephen =
Smalley)
>     https://lore.kernel.org/r/20260618175513.112443-2-stephen.smalley.wor=
k@gmail.com
> [4] tomoyo: Enforce connect policy in TCP Fast Open (Matthieu Buffet)
>     https://lore.kernel.org/r/20260619002207.61104-1-matthieu@buffet.re
>
> Thanks,
> Bryam Vargas
>
>


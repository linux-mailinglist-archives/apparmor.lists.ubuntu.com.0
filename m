Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LelQCjwyOmpE3wcAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 23 Jun 2026 09:14:04 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE9A6B4BE1
	for <lists+apparmor@lfdr.de>; Tue, 23 Jun 2026 09:14:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wbvKP-0002IA-BE; Tue, 23 Jun 2026 07:13:49 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1wbvKN-0002I3-SW
 for apparmor@lists.ubuntu.com; Tue, 23 Jun 2026 07:13:47 +0000
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9BFD23F5B6
 for <apparmor@lists.ubuntu.com>; Tue, 23 Jun 2026 07:13:47 +0000 (UTC)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c85798977dcso3444027a12.0
 for <apparmor@lists.ubuntu.com>; Tue, 23 Jun 2026 00:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782198826; x=1782803626;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TFcPZJr7OnPmIdUVN+MTZFKKeAf+5ltdnQrc4dogtko=;
 b=B1QbjwK9CkglDbeWe+xnAR+bTgGdlJnGA8xsOsf6yeC/CUlQiivhod3+CD0cXWcHt3
 OL9j6DP0D0JP55JuqkrD03Pisk5FPKXgf/6NECsWTEuFbzjwdKiYl2VTXI3W5FzcOgBo
 CIqcjJy/L2ohDRIZV9DCjnFHh5g9qd7G1glFBnRVOEVwPVCc5fqdYKwRuoj97SZqVIrp
 NNau9sCA8Iy8/Wg3j0dCk/XtU6BlufXO94mok5WIhhIYmGZ78gFS/DogHUicrKxA3fee
 JdUyMgeKzmzwKwqDEchoH0PJy8p6H+nXsaZC1DmuOTwBIcsKh7WR97AKu7XhcHHLyJun
 EsoA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrwUxGu0kRx9a3EF8c6HrV6zoHtOnQfVNiQxAJf3T0MJ9L4rh/LBupBkwFtdbodP3FqzIHjWikQvw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yz8m9dQ1wr2p5oZQBtfmorhjwwNghG4CHoKPGDW9rru683/JAqV
 BZuhXeOJ61WmHvduNKKq7CQo3D+dHFGtOb/2RiLmi8NorqztdHIcRigNloftq2gOOtmha4VZfFG
 F8hRTJsgi+8rA5mW/1tMN4nK6DTufqa4+PEgQuIY12foytSXZhOvG3nelxpKHlmfdKaqcGFZBK1
 QTTw==
X-Gm-Gg: AfdE7clCyt21ZQteG46nqsNr1AefGtS/HYHpmdoL+0oF4OTLyTVmcZgrICNWGjITfhE
 XKH+tEu2WRp8IyFd1yAJKdkEzHWhSUeOsnXrny/wZMNTWx18APboNmC+rts7QafI0vCHXmfC5XJ
 cUo7P8cOR7GebJj620XNLBtlQXXCl1Li6zqXvEWuVRUNrTrM/kSycIcEuF/gtNDOQ8fVLZuBTel
 OurQfpi1RnI2VjZr/hFaH8Xq9PiTcDcmP/2w6DV8iXWBgj//pkMcaCW0oswv9+qhGm8+Y60RmVA
 FXILTmMC8WJ4CZrz7ekjx/g8eEN34izUaF3dzf0sKYTXeHX/pofVga60ffki7olWFSToz2VLYFS
 vj61fd3S43N1BSfWHszemgRmZkw==
X-Received: by 2002:a17:90b:3fc3:b0:36d:79c6:1562 with SMTP id
 98e67ed59e1d1-37dd17a276emr1681387a91.25.1782198825999; 
 Tue, 23 Jun 2026 00:13:45 -0700 (PDT)
X-Received: by 2002:a17:90b:3fc3:b0:36d:79c6:1562 with SMTP id
 98e67ed59e1d1-37dd17a276emr1681352a91.25.1782198825554; 
 Tue, 23 Jun 2026 00:13:45 -0700 (PDT)
Received: from [192.168.192.71] ([50.47.147.90])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-37d15e0b1d4sm13105240a91.17.2026.06.23.00.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 00:13:44 -0700 (PDT)
Message-ID: <ff6eb32d-a2d3-480c-8291-e2e6dede2423@canonical.com>
Date: Tue, 23 Jun 2026 00:13:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryam Vargas <hexlabsecurity@proton.me>,
 linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com
References: <20260619011138.264578-1-hexlabsecurity@proton.me>
Content-Language: en-US
Autocrypt: addr=john.johansen@canonical.com; keydata=
 xsFNBE5mrPoBEADAk19PsgVgBKkImmR2isPQ6o7KJhTTKjJdwVbkWSnNn+o6Up5knKP1f49E
 BQlceWg1yp/NwbR8ad+eSEO/uma/K+PqWvBptKC9SWD97FG4uB4/caomLEU97sLQMtnvGWdx
 rxVRGM4anzWYMgzz5TZmIiVTZ43Ou5VpaS1Vz1ZSxP3h/xKNZr/TcW5WQai8u3PWVnbkjhSZ
 PHv1BghN69qxEPomrJBm1gmtx3ZiVmFXluwTmTgJOkpFol7nbJ0ilnYHrA7SX3CtR1upeUpM
 a/WIanVO96WdTjHHIa43fbhmQube4txS3FcQLOJVqQsx6lE9B7qAppm9hQ10qPWwdfPy/+0W
 6AWtNu5ASiGVCInWzl2HBqYd/Zll93zUq+NIoCn8sDAM9iH+wtaGDcJywIGIn+edKNtK72AM
 gChTg/j1ZoWH6ZeWPjuUfubVzZto1FMoGJ/SF4MmdQG1iQNtf4sFZbEgXuy9cGi2bomF0zvy
 BJSANpxlKNBDYKzN6Kz09HUAkjlFMNgomL/cjqgABtAx59L+dVIZfaF281pIcUZzwvh5+JoG
 eOW5uBSMbE7L38nszooykIJ5XrAchkJxNfz7k+FnQeKEkNzEd2LWc3QF4BQZYRT6PHHga3Rg
 ykW5+1wTMqJILdmtaPbXrF3FvnV0LRPcv4xKx7B3fGm7ygdoowARAQABzStKb2huIEpvaGFu
 c2VuIDxqb2huLmpvaGFuc2VuQGNhbm9uaWNhbC5jb20+wsF3BBMBCgAhBQJOjRdaAhsDBQsJ
 CAcDBRUKCQgLBRYCAwEAAh4BAheAAAoJEAUvNnAY1cPYi0wP/2PJtzzt0zi4AeTrI0w3Rj8E
 Waa1NZWw4GGo6ehviLfwGsM7YLWFAI8JB7gsuzX/im16i9C3wHYXKs9WPCDuNlMc0rvivqUI
 JXHHfK7UHtT0+jhVORyyVVvX+qZa7HxdZw3jK+ROqUv4bGnImf31ll99clzo6HpOY59soa8y
 66/lqtIgDckcUt/1ou9m0DWKwlSvulL1qmD25NQZSnvB9XRZPpPd4bea1RTa6nklXjznQvTm
 MdLq5aJ79j7J8k5uLKvE3/pmpbkaieEsGr+azNxXm8FPcENV7dG8Xpd0z06E+fX5jzXHnj69
 DXXc3yIvAXsYZrXhnIhUA1kPQjQeNG9raT9GohFPMrK48fmmSVwodU8QUyY7MxP4U6jE2O9L
 7v7AbYowNgSYc+vU8kFlJl4fMrX219qU8ymkXGL6zJgtqA3SYHskdDBjtytS44OHJyrrRhXP
 W1oTKC7di/bb8jUQIYe8ocbrBz3SjjcL96UcQJecSHu0qmUNykgL44KYzEoeFHjr5dxm+DDg
 OBvtxrzd5BHcIbz0u9ClbYssoQQEOPuFmGQtuSQ9FmbfDwljjhrDxW2DFZ2dIQwIvEsg42Hq
 5nv/8NhW1whowliR5tpm0Z0KnQiBRlvbj9V29kJhs7rYeT/dWjWdfAdQSzfoP+/VtPRFkWLr
 0uCwJw5zHiBgzsFNBE5mrPoBEACirDqSQGFbIzV++BqYBWN5nqcoR+dFZuQL3gvUSwku6ndZ
 vZfQAE04dKRtIPikC4La0oX8QYG3kI/tB1UpEZxDMB3pvZzUh3L1EvDrDiCL6ef93U+bWSRi
 GRKLnNZoiDSblFBST4SXzOR/m1wT/U3Rnk4rYmGPAW7ltfRrSXhwUZZVARyJUwMpG3EyMS2T
 dLEVqWbpl1DamnbzbZyWerjNn2Za7V3bBrGLP5vkhrjB4NhrufjVRFwERRskCCeJwmQm0JPD
 IjEhbYqdXI6uO+RDMgG9o/QV0/a+9mg8x2UIjM6UiQ8uDETQha55Nd4EmE2zTWlvxsuqZMgy
 W7gu8EQsD+96JqOPmzzLnjYf9oex8F/gxBSEfE78FlXuHTopJR8hpjs6ACAq4Y0HdSJohRLn
 5r2CcQ5AsPEpHL9rtDW/1L42/H7uPyIfeORAmHFPpkGFkZHHSCQfdP4XSc0Obk1olSxqzCAm
 uoVmRQZ3YyubWqcrBeIC3xIhwQ12rfdHQoopELzReDCPwmffS9ctIb407UYfRQxwDEzDL+m+
 TotTkkaNlHvcnlQtWEfgwtsOCAPeY9qIbz5+i1OslQ+qqGD2HJQQ+lgbuyq3vhefv34IRlyM
 sfPKXq8AUTZbSTGUu1C1RlQc7fpp8W/yoak7dmo++MFS5q1cXq29RALB/cfpcwARAQABwsFf
 BBgBCgAJBQJOZqz6AhsMAAoJEAUvNnAY1cPYP9cP/R10z/hqLVv5OXWPOcpqNfeQb4x4Rh4j
 h/jS9yjes4uudEYU5xvLJ9UXr0wp6mJ7g7CgjWNxNTQAN5ydtacM0emvRJzPEEyujduesuGy
 a+O6dNgi+ywFm0HhpUmO4sgs9SWeEWprt9tWrRlCNuJX+u3aMEQ12b2lslnoaOelghwBs8IJ
 r998vj9JBFJgdeiEaKJLjLmMFOYrmW197As7DTZ+R7Ef4gkWusYFcNKDqfZKDGef740Xfh9d
 yb2mJrDeYqwgKb7SF02Hhp8ZnohZXw8ba16ihUOnh1iKH77Ff9dLzMEJzU73DifOU/aArOWp
 JZuGJamJ9EkEVrha0B4lN1dh3fuP8EjhFZaGfLDtoA80aPffK0Yc1R/pGjb+O2Pi0XXL9AVe
 qMkb/AaOl21F9u1SOosciy98800mr/3nynvid0AKJ2VZIfOP46nboqlsWebA07SmyJSyeG8c
 XA87+8BuXdGxHn7RGj6G+zZwSZC6/2v9sOUJ+nOna3dwr6uHFSqKw7HwNl/PUGeRqgJEVu++
 +T7sv9+iY+e0Y+SolyJgTxMYeRnDWE6S77g6gzYYHmcQOWP7ZMX+MtD4SKlf0+Q8li/F9GUL
 p0rw8op9f0p1+YAhyAd+dXWNKf7zIfZ2ME+0qKpbQnr1oizLHuJX/Telo8KMmHter28DPJ03 lT9Q
Organization: Canonical
In-Reply-To: <20260619011138.264578-1-hexlabsecurity@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: John Johansen via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: John Johansen <john.johansen@canonical.com>
Cc: Paul Moore <paul@paul-moore.com>, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 James Morris <jmorris@namei.org>, Matthieu Buffet <matthieu@buffet.re>,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Mikhail Ivanov <ivanov.mikhail1@huawei-partners.com>,
 Mickael Salaun <mic@digikod.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "Serge E . Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lists.ubuntu.com,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FREEMAIL_CC(0.00)[paul-moore.com,vger.kernel.org,gmail.com,namei.org,buffet.re,google.com,huawei-partners.com,digikod.net,kernel.org,redhat.com,hallyn.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hexlabsecurity@proton.me,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:paul@paul-moore.com,m:netdev@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:jmorris@namei.org,m:matthieu@buffet.re,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:ivanov.mikhail1@huawei-partners.com,m:mic@digikod.net,m:kuba@kernel.org,m:pabeni@redhat.com,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[john.johansen@canonical.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_mime,canonical.com:replyto,canonical.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCE9A6B4BE1

On 6/18/26 18:11, Bryam Vargas wrote:
> Hello John, and LSM folks,
> 
> I have been working on the Landlock TCP Fast Open connect bypass [1]. Stephen
> Smalley's SELinux fix for the same issue [3] -- "Similar to Landlock, SELinux was
> not updated when TCP Fast Open support was introduced ..." -- made me go back and
> check the rest of the connect-mediating LSMs, since I had only been looking at
> Landlock. With Landlock [2], SELinux [3], and now TOMOYO [4] all getting fixes,
> AppArmor is the last one with the same gap and no fix yet.
> 
> Root cause (shared with the others)
> -----------------------------------
> security_socket_connect() has a single call site, net/socket.c (the connect(2)
> syscall). TCP Fast Open performs an implicit connect inside sendmsg:
> 
>    tcp_sendmsg -> tcp_sendmsg_fastopen -> __inet_stream_connect(..., is_sendmsg=1)
>                -> sk->sk_prot->connect()                 net/ipv4/{tcp.c,af_inet.c}
> 
> This never calls security_socket_connect(); the only LSM hook on the path is
> security_socket_sendmsg(). mptcp_sendmsg_fastopen reaches the same code and is a
> second producer.
> 
> AppArmor
> --------
> apparmor_socket_connect() requests AA_MAY_CONNECT; apparmor_socket_sendmsg() (via
> aa_sock_msg_perm) requests AA_MAY_SEND. These are distinct bits, and apparmor_parser
> compiles them independently: "network send inet stream," yields accept mask 0x02
> while "network connect inet stream," yields 0x40. So an egress-restriction profile
> that grants send but not connect is bypassed by MSG_FASTOPEN.
> 
> Reproduced on 6.12.88 with apparmor active. Under a profile granting the inet/inet6
> stream lifecycle except connect:
> 
>    aa-exec -p egress_restricted -- ./probe
>    [TCP ] connect(2)=EACCES(blocked)  sendto(MSG_FASTOPEN)=OK(reached)  => connection established
>    [TCP6] connect(2)=EACCES(blocked)  sendto(MSG_FASTOPEN)=OK(reached)  => connection established
> 
> (The coarse "network inet stream," idiom grants connect anyway, so this only bites the
> fine-grained "allow send, deny connect" policy that the asymmetry is meant to serve.)
> 
> Fix
> ---
> Same shape as the TOMOYO [4] and SELinux [3] fixes: in apparmor_socket_sendmsg (or
> aa_sock_msg_perm), when MSG_FASTOPEN is set and msg_name carries a destination on a
> not-yet-connected stream socket, additionally require aa_sk_perm(OP_CONNECT,
> AA_MAY_CONNECT, sk). I am happy to send that patch and the reproducer.
> 
If you have a patch, I'd love to take it and give you the credit other wise I can
throw it together.

> (A single core check in __inet_stream_connect(), gated on is_sendmsg, would have
> covered all five LSMs and both the TCP and MPTCP producers in one place -- the kernel
> already mediates the analogous implicit-connect-on-send for AF_UNIX via
> security_unix_may_send and for SCTP via security_sctp_bind_connect. But since the
> other four LSMs are taking per-hook fixes, AppArmor matching them is the consistent
> move; mentioning the core option only in case it is preferred.)
> 
I think per LSM makes sense, at least atm, as it is probably easier. We can look
at refactoring after the fact.

> [1] Landlock: LANDLOCK_ACCESS_NET_CONNECT_TCP bypass via TCP Fast Open (report)
>      https://lore.kernel.org/r/20260616201615.275032-1-hexlabsecurity@proton.me
> [2] landlock: fix TCP Fast Open connection bypass (Matthieu Buffet)
>      https://lore.kernel.org/r/20260617180526.15627-2-matthieu@buffet.re
> [3] selinux: check connect-related permissions on TCP Fast Open (Stephen Smalley)
>      https://lore.kernel.org/r/20260618175513.112443-2-stephen.smalley.work@gmail.com
> [4] tomoyo: Enforce connect policy in TCP Fast Open (Matthieu Buffet)
>      https://lore.kernel.org/r/20260619002207.61104-1-matthieu@buffet.re
> 
> Thanks,
> Bryam Vargas
> 
Thanks for the detailed report Bryan



Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE1WL0NJhGk/2QMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 05 Feb 2026 08:39:47 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 66777EF7ED
	for <lists+apparmor@lfdr.de>; Thu, 05 Feb 2026 08:39:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vntxX-0004w4-OY; Thu, 05 Feb 2026 07:39:27 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vntxV-0004vx-Ms
 for apparmor@lists.ubuntu.com; Thu, 05 Feb 2026 07:39:25 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 850D03FE1C
 for <apparmor@lists.ubuntu.com>; Thu,  5 Feb 2026 07:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1770277165;
 bh=bLlZPCPH2auAgudTJ7AKXxYDpYkt3kL9xAdZD+1ZEoA=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Pvv7N1lmzUdFy3kbYk38NEdOKpDmdUhe73ZQh+5wr/jYg29uHHRB80p5LERWINbbt
 WskuCBkRRAcZTEZwXmuB1wg5f6a07kyvAfqQ3Y7C3eBQYFTzNfT+jKotUQhhhv8ye8
 YDJXBxuUfSyTSiFThLnYLwudlZKXpv3BLJeMjMzudNPE3M853QGsp+Q+AoppgkHsOE
 7s3HkfIb0CScMudyHg8eg4lm4UyjnKriR6tfiLuCzYCBInI4MYw3jI2/DkD417C2Xi
 Rp8L3VOCNxIpWg81CCUTuHrzA0hzEZZ49+oXKu44BeO7z116Nk88yhCa7+84ziyHkj
 xlpOb361VuXwsXoVYH2VJelUnAWK5j0UuuSdkCzz4mNuag3M1kco2Wn6IQp8o3xc9U
 zTCm4Q8vcM9uhe5/Fp5lPRlq+IXNEUzVWplFD4Ro1tsVp0I3T8Ddugc10kU8yeN+Us
 94qjPmtd5EHEzAS+XDd2/PwCQiODB/BFzkY+ER8Deb9nD9Ivtxcl9lH+3rXSDJwSy9
 WZ5VcDwMV70EnnMxQqbPpE+kQ/f6Ja1K/XBuET0/3GlC6t/rFiTtk83xh9GojjRWVW
 KvhRVyhoAxzDO/pCDYMfAr6I9yZf2fK61rVWR+KYDjnQ1BpVlrTPHqxwyXCGTGJF4X
 lj89TNA13JEysK0f2wraIs30=
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-29f29ae883bso5133665ad.3
 for <apparmor@lists.ubuntu.com>; Wed, 04 Feb 2026 23:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770277164; x=1770881964;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bLlZPCPH2auAgudTJ7AKXxYDpYkt3kL9xAdZD+1ZEoA=;
 b=arLZHGsq8JZXa39yHIB69YcsbRw3annM5aQiVsCXrIwzRHro8uGPX7VOuNmxgHNb60
 ls9NwHovOW8QzWupJVDrWq4tcUMUq/hdJaYLWvcAm4zXhM5aWbjf3d2cju9OnALM8Ul4
 tO+ILy9pyBvhsL3FzidNxRxM4ZD/bgb1uaCfqEYevJ+o1SHP8tNcSI7/mblNpW5ijqko
 nnZvwgVz64lAdkQzQwDO+3XTW5YhJEJN1frbIPSM7xPNWljfd2u83ivdNF6Y75FBxdEp
 jQ4hpihYPfq9hb9b4QDzQ1J9ePfG9GuzO9zONOxFqrZleGt1URViRKJDkyBYj2BSBD0T
 W0Lg==
X-Gm-Message-State: AOJu0YyCWe96KyeTn87OlWWRsC8reLqr7dSxQBWmsbxFMWvGUCV7Niom
 ff9jxNXWdPU4ksQ7lUITBRWAWFop8ObAKUihVrWak2B9i8mLXtODi9yIWr/UDjFnrA+84Crse9s
 n2UWNKB0hxR/GQT9cpjpcWa9Ij1GnBtxhn8P+Rkb2e7xEmB/Sg+cBvuz2VtJrCMAhLLATUZikUy
 pZXQ==
X-Gm-Gg: AZuq6aLGbyHdpys22I7RAMGiz5o0HBer9MiJU9PfLa0jFlL9osFcs+MNOX6GxxWKXly
 TrttP805atoClNYAzYXXyB6EfAyuNIm0ptgbcw9O0F7v46Kzc9MpeAA1IgblWcJrcWh/QU8hPf2
 WLmYyUP+lVge4M2YhnvTHJ2AX8M8Z7qjMu0CQPn5NoZ4va9JfKcD7+X0l0yvJMeTxv28KmJsatd
 6LZkqK9ZEisz1Fy0LvJEllNb/3ZLVq0z8qJPbAbEnWFdPhbu7k9bAdGCVI6jHsgiwQAYncXiZS+
 L+05XJeURaSo3RU4gt6FLFlLz3d+l/G9fXfBR3pDtdNjX3UHPg0Whi6Iqn+0HgE/BSk2RECnzPT
 UUMtuPu5wrB9KiRzlY0V2j/tR
X-Received: by 2002:a17:902:c411:b0:2a8:ac0f:9ae4 with SMTP id
 d9443c01a7336-2a933fb5b7amr54914435ad.48.1770277164085; 
 Wed, 04 Feb 2026 23:39:24 -0800 (PST)
X-Received: by 2002:a17:902:c411:b0:2a8:ac0f:9ae4 with SMTP id
 d9443c01a7336-2a933fb5b7amr54914275ad.48.1770277163673; 
 Wed, 04 Feb 2026 23:39:23 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2a933966305sm43483225ad.71.2026.02.04.23.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 23:39:23 -0800 (PST)
Message-ID: <4f25c8f1-7c03-4838-abbe-756adc3610cc@canonical.com>
Date: Wed, 4 Feb 2026 23:39:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Georgia Garcia <georgia.garcia@canonical.com>
References: <20260129185846.3169624-1-georgia.garcia@canonical.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
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
In-Reply-To: <20260129185846.3169624-1-georgia.garcia@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH 1/2] apparmor: fix invalid deref of rawdata
 when export_binary is unset
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
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:georgia.garcia@canonical.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[canonical.com:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	MID_RHS_MATCH_FROM(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 66777EF7ED
X-Rspamd-Action: no action

On 1/29/26 10:58, Georgia Garcia wrote:
> If the export_binary parameter is disabled on runtime, profiles that
> were loaded before that will still have their rawdata stored in
> apparmorfs, with a symbolic link to the rawdata on the policy
> directory. When one of those profiles are replaced, the rawdata is set
> to NULL, but when trying to resolve the symbolic links to rawdata for
> that profile, it will try to dereference profile->rawdata->name when
> profile->rawdata is now NULL causing an oops. Fix it by checking if
> rawdata is set.
> 
> [  168.653080] BUG: kernel NULL pointer dereference, address: 0000000000000088
> [  168.657420] #PF: supervisor read access in kernel mode
> [  168.660619] #PF: error_code(0x0000) - not-present page
> [  168.663613] PGD 0 P4D 0
> [  168.665450] Oops: Oops: 0000 [#1] SMP NOPTI
> [  168.667836] CPU: 1 UID: 0 PID: 1729 Comm: ls Not tainted 6.19.0-rc7+ #3 PREEMPT(voluntary)
> [  168.672308] Hardware name: QEMU Ubuntu 24.04 PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [  168.679327] RIP: 0010:rawdata_get_link_base.isra.0+0x23/0x330
> [  168.682768] Code: 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 57 41 56 41 55 41 54 53 48 83 ec 18 48 89 55 d0 48 85 ff 0f 84 e3 01 00 00 <48> 83 3c 25 88 00 00 00 00 0f 84 d4 01 00 00 49 89 f6 49 89 cc e8
> [  168.689818] RSP: 0018:ffffcdcb8200fb80 EFLAGS: 00010282
> [  168.690871] RAX: ffffffffaee74ec0 RBX: 0000000000000000 RCX: ffffffffb0120158
> [  168.692251] RDX: ffffcdcb8200fbe0 RSI: ffff88c187c9fa80 RDI: ffff88c186c98a80
> [  168.693593] RBP: ffffcdcb8200fbc0 R08: 0000000000000000 R09: 0000000000000000
> [  168.694941] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88c186c98a80
> [  168.696289] R13: 00007fff005aaa20 R14: 0000000000000080 R15: ffff88c188f4fce0
> [  168.697637] FS:  0000790e81c58280(0000) GS:ffff88c20a957000(0000) knlGS:0000000000000000
> [  168.699227] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  168.700349] CR2: 0000000000000088 CR3: 000000012fd3e000 CR4: 0000000000350ef0
> [  168.701696] Call Trace:
> [  168.702325]  <TASK>
> [  168.702995]  rawdata_get_link_data+0x1c/0x30
> [  168.704145]  vfs_readlink+0xd4/0x160
> [  168.705152]  do_readlinkat+0x114/0x180
> [  168.706214]  __x64_sys_readlink+0x1e/0x30
> [  168.708653]  x64_sys_call+0x1d77/0x26b0
> [  168.709525]  do_syscall_64+0x81/0x500
> [  168.710348]  ? do_statx+0x72/0xb0
> [  168.711109]  ? putname+0x3e/0x80
> [  168.711845]  ? __x64_sys_statx+0xb7/0x100
> [  168.712711]  ? x64_sys_call+0x10fc/0x26b0
> [  168.713577]  ? do_syscall_64+0xbf/0x500
> [  168.714412]  ? do_user_addr_fault+0x1d2/0x8d0
> [  168.715404]  ? irqentry_exit+0xb2/0x740
> [  168.716359]  ? exc_page_fault+0x90/0x1b0
> [  168.717307]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> Signed-off-by: Georgia Garcia <georgia.garcia@canonical.com>

Acked-by: John Johansen <john.johansen@canonical.com>

I pulled patch 1/2 (bug fix) in, patch 2/2 will need more review, and have to wait in the queue for next cycle

> ---
>   security/apparmor/apparmorfs.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index 907bd2667e28..4fb251a7e85a 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -1644,6 +1644,14 @@ static const char *rawdata_get_link_base(struct dentry *dentry,
>   
>   	label = aa_get_label_rcu(&proxy->label);
>   	profile = labels_profile(label);
> +
> +	/* rawdata can be null when aa_g_export_binary is unset during
> +	 * runtime and a profile is replaced */
> +	if (!profile->rawdata) {
> +		aa_put_label(label);
> +		return ERR_PTR(-ENOENT);
> +	}
> +
>   	depth = profile_depth(profile);
>   	target = gen_symlink_name(depth, profile->rawdata->name, name);
>   	aa_put_label(label);



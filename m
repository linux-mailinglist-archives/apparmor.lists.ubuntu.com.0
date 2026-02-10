Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K7mLvRli2kMUQAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 10 Feb 2026 18:08:04 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 845A111D958
	for <lists+apparmor@lfdr.de>; Tue, 10 Feb 2026 18:08:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vprDK-0001oh-IP; Tue, 10 Feb 2026 17:07:50 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vprDJ-0001oY-0d
 for apparmor@lists.ubuntu.com; Tue, 10 Feb 2026 17:07:49 +0000
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E10183F4E7
 for <apparmor@lists.ubuntu.com>; Tue, 10 Feb 2026 17:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1770743268;
 bh=BOz9Hwc7ESIFXInXXjAyfVQmAwoRk4hmfXR5jtFoOpc=;
 h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type;
 b=Qp13/X7n02CemtpgrTLYKZoUlxBHHmQXVrYmRix5JF3awkTwgwSR4/5S3He6coQQu
 cIKrDVCmzgHdg5Cip36RXpwOBUmnmzO5AAN1ATJv9IgGtPvSOWzqJJw2msC0OEOFGj
 ng+R29tqkTMsW504eYGWbYimfQhVMgJGAvuEd1RT/LlTQJZpH7Ag4BOsWKKVI7jpFS
 lPfG4a49Acb6uIGXm/6QMBd+LZKr4fB5p17kk0Gihk7isEA5fF27GsqSO68coffTA3
 l081Je3xuI4yXn5macNzCO3vSw0mFAr9Elhimo1l66UFQfPeJ85zOyDPLqaBj9bDZi
 xPIT7cw4nVv30UeAhSJX58xCF53zo0pmrsiTkUsVl3IH9kV+IgLw0rnq1TZQ3cW/fE
 Nmegcf5Y/MA9vr7Cuw6zKQfkBW/vtbNj4nuzMPEJlVTeR1ZKyohig4Hm9XmlmtYGAa
 yQEGoKZEKsN9F/ZsqCKCajNK4mUoOG/gGdzyaBv0k6BQnmtFrIeGmjcl6iLhNFtTW3
 QenaKIGlsZrgZRojgkMebBe3i4uWjA4t/2CVzUdyVYJTy3k9EARwX9aSZW6tDZMUzp
 iOJqEme4yJBxbYrtYsilHdAaW6N1lANTzmM838BElFYjtoy8pkrEbhTOak7vJG6vQE
 2t0DOT6ZyBn7czvSxK5hi+NE=
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2a784b2234dso31726515ad.1
 for <apparmor@lists.ubuntu.com>; Tue, 10 Feb 2026 09:07:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770743267; x=1771348067;
 h=content-transfer-encoding:organization:autocrypt:subject:from:to
 :content-language:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BOz9Hwc7ESIFXInXXjAyfVQmAwoRk4hmfXR5jtFoOpc=;
 b=whdVvO48T9s8j/g/jIeer7Z1Ew9vSSemO8qDkYhMLq9gYsKEo3ERho7NRx6LcZ4jTF
 l89ac1rKIysnCLS6WPLwMUcbrOzxp7XPsLyX+9YSYnw4B242lwEfOdeyZGSJwwEHjV3i
 0HWl4mu0AgaFwkbWzGcQhDFEQHvNCPCqNkbvPfXFn0Abi1PcLh17vsgc8ev7PGSfpdxG
 D2L/Iftt1tvRgNuHhTVVIrSqXI1o5BzHIIuy2hXErIjXNL02xxHGN39DgpzhDmrJB9sb
 N2F2viM/J7cLJZiJORbSQoQ5rkc4J/7aUgoDYbWR5MO4kQo6ZFbskYYU2BEO7c0Z0Q0h
 cHEg==
X-Gm-Message-State: AOJu0YwXCfiCLtYYAdNJAS5GS4KoiTKxCAgH1txiTUJiEblKMDWkUzD3
 n58O+eHYOBrEh4jp7Lz5Mb3MzRJjwFcy9k+i93S8KdSyd+Cob60GTOf0F/TNygUiOHOPvwNgKXu
 5gbP1IWx8J7s0G4uB8JapT253uqCkH+uF6l70U5bNu5HQbEFU+gJ+f/4QSjvJZmTM1SBlHCwq6y
 XJbTRYR5r4Ow==
X-Gm-Gg: AZuq6aI9BoDwpKw6Wmjr8AareKUHNh4h5gZgeHCyc6obDYMwWhccK3iJD8/U6aycRXm
 T1kJ4xmt8fZLHpUHo9GK/+xNLOJ6Q+WSFw9xBrwIMrWuqL3PqrvJl8Pa/3zjpEQKewc5wydOODW
 wJCsKdg7GvIMFLXEb6Qi4ddlm2rNXM8x0lgIPIUxR29FV82ivxPtmSOx6H6VMu6PhgiW4w/g3qR
 HFnvzvMCX1y9i8sWPra+MEVtIN4U01FYCd4DesptkBbzL6qKAXSe/mU511tWq2nOPqo5yQu9p8R
 FC7/rg4mW5g7T4ogjy3ne6UKv2Q55JOZz097FpTuBDhCkXjIPgn81AHAzNvY1L+YYHvZ6zTPYvS
 gTxyn5iyy8UOY0rr0lnZ/KCnNMP2KD9O21GET
X-Received: by 2002:a17:903:19c6:b0:2a0:8be7:e3db with SMTP id
 d9443c01a7336-2a9516a70f9mr170369545ad.15.1770743267603; 
 Tue, 10 Feb 2026 09:07:47 -0800 (PST)
X-Received: by 2002:a17:903:19c6:b0:2a0:8be7:e3db with SMTP id
 d9443c01a7336-2a9516a70f9mr170369405ad.15.1770743267257; 
 Tue, 10 Feb 2026 09:07:47 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2a9521eb939sm148987895ad.73.2026.02.10.09.07.46
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 09:07:46 -0800 (PST)
Message-ID: <99606ab5-2c62-4374-9fa9-41ac60ceeb46@canonical.com>
Date: Tue, 10 Feb 2026 09:07:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: apparmor <apparmor@lists.ubuntu.com>
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] Feb 10 irc meeting - canceled
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[canonical.com:-];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,canonical.com:mid];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 845A111D958
X-Rspamd-Action: no action

sorry for the late notice on this

today's (Feb 10, 2026) irc meeting is canceled. Next scheduled meeting is Tuesday March 10 @18:00 utc



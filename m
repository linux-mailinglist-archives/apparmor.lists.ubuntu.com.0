Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NIcAJyRdWkcGQEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 25 Jan 2026 04:44:28 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C7F7FB1C
	for <lists+apparmor@lfdr.de>; Sun, 25 Jan 2026 04:44:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vjr2n-0003LF-Gi; Sun, 25 Jan 2026 03:44:09 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vjr2l-0003L8-Uv
 for apparmor@lists.ubuntu.com; Sun, 25 Jan 2026 03:44:07 +0000
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C6F7B3F20C
 for <apparmor@lists.ubuntu.com>; Sun, 25 Jan 2026 03:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1769312647;
 bh=eSagfW1610znuHJYN29vgCnBrOOkkhprD1v7uZPVXic=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=SbEFNDW0gYzVTwvSPD82Wpjj2uXS2Tbhok+jIEdMoQa1s8VVWqxL5uWThkjn2Hgff
 VffOh5Ujae8Rn33VYSKyIfpr0d5tgnghX9Wb6ZU84+UIguFlNw54/bcCOAsZvmaAFy
 2ZeH5DogIVv0Eu/bKGebRwat7jXqtiep6e7oEQFcQwngVool69JdkTpMhQE4v1iYte
 bOOaq2fjlQMiEtoLHInf2kDkTKsprYvYlhPFy9NzFz0fOOF7kwJe0X0c9elaot1lAh
 +McmzuudJyh/AE2v+SPszT3s64CxhuuuTT8XvufBtqT991TpKSgN/+GAQdQ3GfQmug
 Xbt80TdJsQs89m4xYemz8B0YK9rKCBd+vfj005+UOWe9jBG+EDiN97YwcptfSbkqM1
 sSmi/qIS+9Zn0Nu6q8/657XFPvB6f9K8+ei4nfHBOOIYOz8k2Ax5fS1fnNHWscSdY+
 p2iP+g/9WzmPwr/6oUY0Z7/yTB7ODB9I1fzX1ProWJwX+D5N+KRrmHhKntZqemw5tU
 hfdOzASb6aUIrw2+agUnwIv0FblKKZdLH1Zc5qfRUyAuinKRJva6kAjPzdiAZHMw2k
 0y/E3W6MuHl/eVQ3H2Rz4/o7MjNbPr/tKx05JpkBVDZAQzjOry23yxDaG70qut4uKQ
 GYqWc/9tr3khfzDcX1g0uIsU=
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c5269fcecdeso1716612a12.0
 for <apparmor@lists.ubuntu.com>; Sat, 24 Jan 2026 19:44:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769312646; x=1769917446;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eSagfW1610znuHJYN29vgCnBrOOkkhprD1v7uZPVXic=;
 b=RdGb13mVFJ8mwYxUjn8Ctshgdtf326omzXPQPksLnHNw9GtPuVvki2MErhhTrvlXfN
 P+PX/QOUYH8T4NBNtoYifJLCHjv1q9aQVlR6WBYXH3/TAQdGOwr425M74DYHdW8ULz4d
 bmsfRdyvqEvy6RYxYbPmfRujKP0cn4Gentj7kL3TmkgQpvkg8mXzLTVDeJajkLjqErC5
 2ZMe5mzoBXF8IaFLKbDokDYImPL3MXtT1vQJgXGkcw/iTP3grAODU1pZo3in87l4sbhT
 swirDauHc2jnSP5pMHPoH2lxVrawB1ZE/Kv5CuqJghwK9/OIGGLogEnXQZ/eXZ7YdDo8
 TCIw==
X-Gm-Message-State: AOJu0YzbYK9zTyxn4OatXpdP+7GYkS1jryCMdvTF089FmZZk4iWqhUQ6
 6iyDwcVTbKGoxjVnM+zKlZJs9WZAGhGILEPW2ADYFstsufDNnyJ8cnj4QBrc+0PUO8GiplL7Fd7
 K6bo1CI/97IWwfJUjYMCiInkqURoSUjFvfhn5f16GHpFyY4paHblhihtrA6S2RI4e1zEAHtjNyP
 VWE9fYC4WpgQ==
X-Gm-Gg: AZuq6aLfhM/v39wBT08Qqo14R00Da9ocqPyivmqPM5sBztEU0WynkUcW2ClPEH8Yebx
 HCpF/NOsXVQ9uGE9IRSDrnFiZ4Iquhm1VMJLd7EIHQ40QzFDoKbDQjYQ7vsxOXqAvTu8cmbj4K5
 6dpEmV7bMaFJ/nA/878LSZNmGQxf8kbiytrMDnhdayJ3GoAqvRjunSoCEZLJaCodLh1RPc9jh7l
 Z5cVwyyN/lFzFnKvcpK0/ebdBwcQUfQ5OnhmL5NkXmp+DmWx2ptYht1LGJb2yZDuY1mk/YCPUp7
 BUu6UuKrBO0Ru9BsiHgBzbBkryACEem8xfGHiruTQ1bgOMtjrMdK0ATltsUqsZ/y1iJLVNuM9Tt
 sDb6traScRTDMg52iGPIwQbBJ
X-Received: by 2002:a05:6a00:ba8e:b0:823:1cae:10bb with SMTP id
 d2e1a72fcca58-823412be96amr483656b3a.51.1769312646041; 
 Sat, 24 Jan 2026 19:44:06 -0800 (PST)
X-Received: by 2002:a05:6a00:ba8e:b0:823:1cae:10bb with SMTP id
 d2e1a72fcca58-823412be96amr483641b3a.51.1769312645527; 
 Sat, 24 Jan 2026 19:44:05 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-8231871d571sm5852010b3a.44.2026.01.24.19.44.04
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jan 2026 19:44:05 -0800 (PST)
Message-ID: <e4903a39-6883-43ad-90e7-824c035e6d52@canonical.com>
Date: Sat, 24 Jan 2026 19:44:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <034d652f-ebdc-4d9a-8f7f-05c5596b23e5@ijzerbout.nl>
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
In-Reply-To: <034d652f-ebdc-4d9a-8f7f-05c5596b23e5@ijzerbout.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] Need assistance with DENIED userns_create for
 non-root podman inside an Incus container
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
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[canonical.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:mid,canonical.com:dkim,ubuntu.com:url,gitlab.com:url,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,f43:email]
X-Rspamd-Queue-Id: 79C7F7FB1C
X-Rspamd-Action: no action

On 1/24/26 07:37, Kees Bakker wrote:
> Hi,
> 
> My setup is a Ubuntu24 with an Incus server (6.20).
> One Incus container runs Fedora 43 where I want to run non-root podman.
> 
> Inside the container
> 
> [root@f43 ~]# sudo -u fedora -i
> [fedora@f43 ~]$ podman run -t -i hello-world
> cannot clone: Permission denied
> Error: cannot re-exec process
> 
> On the Ubuntu24 host I see this in journalctl
> 
> jan 24 16:33:41 rapper kernel: audit: type=1400 audit(1769268821.264:1554): apparmor="DENIED" operation="userns_create" class="namespace" info="Userns create restricted - failed to find unprivileged_userns profile" error=-13 namespace="root//incus-f43_<var-lib-incus>" profile="unconfined" pid=2332667 comm="podman" requested="userns_create" denied="userns_create" target="unprivileged_userns"
> 
> My question, what do I have to do on the Ubuntu24 server to allow running non-root podman?
> Any help or suggestion is greatly appreciated.

you are encountering the unprivileged user namespace restriction(1-5).

You either need to confine the container, giving access to user namespaces, or you need to disable the restriction.

to temporarily disable you can do

   sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0

to permanently disable

   sudo bash -c "echo kernel.apparmor_restrict_unprivileged_userns=0 > /etc/sysctl.d/60-apparmor-namespace.conf"



1. https://gitlab.com/apparmor/apparmor/-/wikis/unprivileged_userns_restriction
2. https://discourse.ubuntu.com/t/understanding-apparmor-user-namespace-restriction/58007
3. https://discourse.ubuntu.com/t/plucky-puffin-release-notes/48687
4. https://ubuntu.com/blog/ubuntu-23-10-restricted-unprivileged-user-namespaces
5. https://discourse.ubuntu.com/t/spec-unprivileged-user-namespace-restrictions-via-apparmor-in-ubuntu-23-10/37626



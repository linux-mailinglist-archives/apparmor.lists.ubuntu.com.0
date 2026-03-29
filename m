Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FWTD0CFyWndygUAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 29 Mar 2026 22:02:08 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1C7353E66
	for <lists+apparmor@lfdr.de>; Sun, 29 Mar 2026 22:02:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w6wKd-0001Um-6O; Sun, 29 Mar 2026 20:01:59 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <torvalds@linuxfoundation.org>)
 id 1w6wKc-0001Ue-7x
 for apparmor@lists.ubuntu.com; Sun, 29 Mar 2026 20:01:58 +0000
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so740576466b.2
 for <apparmor@lists.ubuntu.com>; Sun, 29 Mar 2026 13:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1774814517; x=1775419317;
 darn=lists.ubuntu.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W2LBsWL0RCR7A1/NBeRjO1DmOoAWjMff84GLac5q8D4=;
 b=QMfTIkrJJsWHwbxMS/JGlQIvILDSWNrznQlyGBjx4Gl9JS8L/y3L3uaK4ESGtPW+If
 eJ75+XjlzwFF1tmZN3SH9nj9lyaEaU0w5Zb/9C0RHRdvUoPgTX7H7ggmSv848c3WLcqf
 bBLx/CeIrgeAqLZbxuyUhtDDhWVfI4Q3C/pcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774814517; x=1775419317;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2LBsWL0RCR7A1/NBeRjO1DmOoAWjMff84GLac5q8D4=;
 b=I0j1cMdVlDc7/FS/OJRR5ndss+2z1qrmAqxXh35Jfgy6dkWwxhgObiUVCsD6vAXi80
 rATQJXtiqBGSnOwjhppUxVTBwl8iA5gAT2N33jTWXk0FJRM4NnlOjzkrzhmaRc8vRPyL
 s1/drWugE4Wv5zhN8u8E4v63NV8bT0v3E21GMutFk7ZnvaP57ZEsFKXO2JL2zOri7k/F
 XybPkQm/auW5lmyVPTVZ4Mi4t6L4AaR5VPUWtHUxaBfZrhlLumI4X6sC/dojI96kgewC
 +CeuGjIWhm2o8/N0+H7psAVkqsWPsYMsEoqdTSm1R0Cn5mlWyMzyNHYrs1Dvh0k0MUd1
 BPdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjEcueM4EooCHBLk0zl+aRyuuDRk3OadxLXnsYsG2gwTxT5iAMaNywEXDdU6dgKUbxN6EHBrHNzQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YyUiXF89VC/z83t7t8yHWJMOVyOuWuwsf/uIhLwk/mrhtkob5Fb
 Hi9fUdRTBj4gk0oY0FewBLwJmI/IJEN6VX7gZJOF0z0UaJGo5oI+UU23+LS7a/l16HvOhglrp4Y
 MCtPq/os=
X-Gm-Gg: ATEYQzzSs8CAX1MrFrd9Vil7meFITg61hkGNwDya0D6rhpqnyeeBB5EtNoF0oojGqev
 zktXMWUIxVjr4/cStEiDTW/w54+qDCqQjx7Vsm2UCwyXb8HVzdSDYKzxLXjuBPP111mEbmYLpJT
 2C6u+soyDNWFmfvFU3btsFxzJonLt+lEsxXKoASGhKwWo0xkyQ3TWqYq1BD1VKcmigkQmGtGfhe
 My/QHpYzY+QQKTRPf/dxH++oFm3+XobqP3e/EoXR2tOmu+jWHQIKyjZhGZzMWCH1uv9v4XydZv/
 nJh5Yr09GSjWo/YQJlLgkJE74PvfAUfVGcGUArMIpD9Dqgw7MdGi6HJTTI2tjjJU8DRC+8Hf6sS
 Auc5poaHORMRDd/22l/R2QDxXRXqrAoEmoD6UCEFLpzWgqR8dEcOBC4rOftfda5STfs2T2xG5Qv
 DFgCUsVDIM/EBulWRJ8XIgLb0RS2Z/v0OPQp2I0hXz7hM/5Sb3ScHKC1Nu6TZ7XeOAgKXPfU/6
X-Received: by 2002:a17:907:9308:b0:b98:3b5d:e147 with SMTP id
 a640c23a62f3a-b9b502bc86dmr656677966b.3.1774814517437; 
 Sun, 29 Mar 2026 13:01:57 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9b7b1e3aeesm195960666b.48.2026.03.29.13.01.57
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Mar 2026 13:01:57 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-66a4c6bb6ecso6698916a12.1
 for <apparmor@lists.ubuntu.com>; Sun, 29 Mar 2026 13:01:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCViPQAsr80i20BtySNpOWMu73I3FmeP8RtjLjQGEku+RLzIUkUNg2JVhjz7S7IdQKIuLba5b91ELA==@lists.ubuntu.com
X-Received: by 2002:a05:6402:370f:b0:665:638d:75c1 with SMTP id
 4fb4d7f45d1cf-66b2836522dmr5313873a12.3.1774814517026; Sun, 29 Mar 2026
 13:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260326131838.634095-1-dhowells@redhat.com>
 <20260326131838.634095-5-dhowells@redhat.com>
 <20260329121208.6092419d@kernel.org>
In-Reply-To: <20260329121208.6092419d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 29 Mar 2026 13:01:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiJ6gEELLviexdmSHnyjVoG7MFo8Qwhd1zxs_tCnL-=gQ@mail.gmail.com>
X-Gm-Features: AQROBzCLNnOtMDq7_zEYzn905-QyT8tE9Dg3ZE8enKPKMkcfb1CkLbH9Xycl1-E
Message-ID: <CAHk-=wiJ6gEELLviexdmSHnyjVoG7MFo8Qwhd1zxs_tCnL-=gQ@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.218.42;
 envelope-from=torvalds@linuxfoundation.org; helo=mail-ej1-f42.google.com
Subject: Re: [apparmor] [PATCH net v3 04/11] list: Move on_list_rcu() to
 list.h and add on_list() also
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
Cc: stable@kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org, David Howells <dhowells@redhat.com>,
 Minas Harutyunyan <hminas@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Simon Horman <horms@kernel.org>, Marc Dionne <marc.dionne@auristor.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [0.09 / 15.00];
	R_DKIM_REJECT(1.00)[linux-foundation.org:s=google];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[torvalds@linux-foundation.org,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:stable@kernel.org,m:netdev@vger.kernel.org,m:linux-usb@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-afs@lists.infradead.org,m:dhowells@redhat.com,m:hminas@synopsys.com,m:edumazet@google.com,m:mathieu.desnoyers@efficios.com,m:horms@kernel.org,m:marc.dionne@auristor.com,m:pabeni@redhat.com,m:davem@davemloft.net,s:lists@lfdr.de];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.006];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: EA1C7353E66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 29 Mar 2026 at 12:12, Jakub Kicinski <kuba@kernel.org> wrote:
>
> Could someone with sufficient weight to their name ack this?

I don't particularly like it. I think the name is too generic, and
it's all wrong anyway. Whether something is on a list or not ends up
being much too specific to the use-case, and I do *not* see a huge
advantage to a helper function that just wraps "list_empty()" with
another name that is actually *less* descriptive.

So no. NAK.

As you mention, the RCU version at least does something else, but
honestly, it looks pretty damn questionable too. And no, it does not
work for non-RCU lists in any kind of generic sense, since iut's
perfectly valid to remove list entries without poisoning them.,

For example, some places that want a simple "am I on a list" will use
__list_del_clearprev(), which does *not* poison the prev pointer, but
just clears it instead. And then the "am I on a list" is just checking
prev for NULL or not.

In other words: all of this is wrong. Whether you are on a list or not
is simply not a generic operation. It depends on the user.

The name is also *MUCH* too generic anyway.

               Linus


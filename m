Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLE/Mn9OqGmvsgAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 04 Mar 2026 16:23:43 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F14920294B
	for <lists+apparmor@lfdr.de>; Wed, 04 Mar 2026 16:23:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vxo4U-0000S6-3t; Wed, 04 Mar 2026 15:23:34 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <david.laight.linux@gmail.com>)
 id 1vxiYv-0007aP-5M
 for apparmor@lists.ubuntu.com; Wed, 04 Mar 2026 09:30:37 +0000
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-48375f1defeso49603845e9.0
 for <apparmor@lists.ubuntu.com>; Wed, 04 Mar 2026 01:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772616636; x=1773221436; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BUzQoESoh9/PqMSFbMpuw4Pmh5IPXiGP/qvOjxX4wwo=;
 b=ZAmm8aHlcYhgf28HlCvTKAZ5SJbEk7omO8Fw1MwIkLfIdCbSEsIPJMzqX9ELHB0lru
 qu55a6g7uKgdv2EO3r3/FQpupwgCQBsSSY2byOsOr+yIYgCu+Bf6emgUYhHmAu0V66mo
 g5lYWeEYzqlBMMq8k+VM72nSf8sJO507YT4Txi9AfoEWrTGtnatsa1T1OYRxAvW1I+wr
 XSTgeo8Rt8i0UDlsyzUPb/kMYD6UFNnO0/ke2/oGoMwIiAVitVw5OdO36xEadCiqMSp1
 k1X4SzUcQc/hUQZiI1c1QRwLBgCnhhGsnq6mBk66nZYTqwgLknm8J1OzGPverP9GF5LJ
 VV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772616636; x=1773221436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BUzQoESoh9/PqMSFbMpuw4Pmh5IPXiGP/qvOjxX4wwo=;
 b=wGKjA7375ONrFPTpPF68HAFQ88csIgo+MdzAQAchw5CJJR3U/a3Ra8lZInerK6DxVS
 qN6pj1z6hyUlsXCurh3q/iee6MXVrAyNK7Jl3w06a+Jc89+CZ1Q9kRhhMRkfFcAlqu4E
 1waSdZEnK335lUR/oTW9NkBgSK20kY2yPu5OH73PgJd802sjcR/0/uE0+d54+CPls5UF
 XZCGTGjutM1RL0BHCj/Q/3p4/MEOpb9uxxwht4bUgEpY5EyvY6z1S4w36bthrd5Qp8TE
 SeaUqxkh6a78yuOR7e4QJm0XG9M4Y4NLNw8yRDHbL5nHkqpc0aKSrULKBbsZiDJu48XX
 GyRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD5VxQTWP7GfZJ0I/Uz2fyfHhCaFohs5N9UP6Hf/A4kwo+CY43j26G5ED/Ks6xgrr5zueakowlww==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yw7tgzreo5LsRw2OeSKt20UThRblF5f3GYOC3EFpgju2OqQOnPR
 CI27VVUg1NhRM/IgKUNaXcSpwO9y25jfDKpM3o/mZubba51A2hhafLYv
X-Gm-Gg: ATEYQzwtNbvT7NaAE2rWrXAldFq4Nc1siabP8MhBYHYzpWWZNgNTV5t3ALHrA8/IhVd
 UVJRoSjS1LZ8l0cxf+hbR0gMn5ykNHsqzHgtFjmUOtnss/3GPeUPaIdwJLzxEKcJ6np7fsNaVEB
 923oDJVfd3FykHC1yqsqNRpAh/j6JHKk4leFY0Rd+H5PNJRQDbcQwcSo5weWL49Ru+/H1YDMThX
 RKPYeZq1aPSRZvGRy2u+ComrEMsxe5TEHe2hm0S4JsMiJ9NR8BipUy3D9v5rQgfHmmZDZ/TGHcV
 D4Go/sZHWwVd7ekXLl//EIRUrIHIGnkOrMx1VEp/uJ8gS8hYvIvHLsG5wl011aAv4DA2fQgAVO+
 pKczkraqG9YgLC6Zreiqe9Bgsj0pVKPEX9lKq4PxEwMhK76zCSsgCez56FXhZWtvcXc35ByAc8A
 gdpn/Q658xWGczez2hQgWK8R6QMe6Y/cWd7m58citSEKwViFlpulWm2fA448fEN64N
X-Received: by 2002:a05:600c:8b53:b0:483:498f:7963 with SMTP id
 5b1f17b1804b1-4851989024emr19550785e9.26.1772616636117; 
 Wed, 04 Mar 2026 01:30:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851884225asm38972555e9.6.2026.03.04.01.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 01:30:35 -0800 (PST)
Date: Wed, 4 Mar 2026 09:30:33 +0000
From: David Laight <david.laight.linux@gmail.com>
To: NeilBrown <neilb@ownmail.net>
Message-ID: <20260304092559.554ac9a9@pumpkin>
In-Reply-To: <177260561903.7472.14075475865748618717@noble.neil.brown.name>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
 <1787281.1772535332@warthog.procyon.org.uk>
 <1c28e34c7167acf4e20c3e201476504135aa44e8.camel@kernel.org>
 <177260561903.7472.14075475865748618717@noble.neil.brown.name>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.128.54;
 envelope-from=david.laight.linux@gmail.com; helo=mail-wm1-f54.google.com
X-Mailman-Approved-At: Wed, 04 Mar 2026 15:23:30 +0000
Subject: Re: [apparmor] [PATCH v2 000/110] vfs: change inode->i_ino from
 unsigned long to u64
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
Cc: nvdimm@lists.linux.dev, jfs-discussion@lists.sourceforge.net,
 Jeff Layton <jlayton@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org, linux-sctp@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-x25@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, codalist@coda.cs.cmu.edu,
 linux-ext4@vger.kernel.org, bpf@vger.kernel.org, devel@lists.orangefs.org,
 linux-trace-kernel@vger.kernel.org, ecryptfs@vger.kernel.org,
 selinux@vger.kernel.org, autofs@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-media@vger.kernel.org, linux-can@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, ocfs2-devel@lists.linux.dev,
 linux-fscrypt@vger.kernel.org, linux-hams@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 fsverity@lists.linux.dev, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 v9fs@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-perf-users@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, linux-integrity@vger.kernel.org, ntfs3@lists.linux.dev
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: 8F14920294B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ownmail.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:neilb@ownmail.net,m:nvdimm@lists.linux.dev,m:jfs-discussion@lists.sourceforge.net,m:jlayton@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-unionfs@vger.kernel.org,m:linux-mm@kvack.org,m:linux-sctp@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-afs@lists.infradead.org,m:linux-cifs@vger.kernel.org,m:linux-nilfs@vger.kernel.org,m:linux-x25@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:codalist@coda.cs.cmu.edu,m:linux-ext4@vger.kernel.org,m:bpf@vger.kernel.org,m:devel@lists.orangefs.org,m:linux-trace-kernel@vger.kernel.org,m:ecryptfs@vger.kernel.org,m:selinux@vger.kernel.org,m:autofs@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-media@vger.kernel.org,m:linux-can@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:ocfs2-devel@lists.linux.dev,m:linux-fscrypt@vger.kernel.org,m:linux-hams@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:fsverity@lists.linux.dev,m:linux-nfs@vger.kern
 el.org,m:netdev@vger.kernel.org,m:v9fs@lists.linux.dev,m:samba-technical@lists.samba.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-perf-users@vger.kernel.org,m:audit@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:linux-integrity@vger.kernel.org,m:ntfs3@lists.linux.dev,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[46];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	NEURAL_HAM(-0.00)[-0.452];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,apparmor-bounces@lists.ubuntu.com];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo,ownmail.net:email]
X-Rspamd-Action: no action

On Wed, 04 Mar 2026 17:26:59 +1100
NeilBrown <neilb@ownmail.net> wrote:

> On Tue, 03 Mar 2026, Jeff Layton wrote:
> > On Tue, 2026-03-03 at 10:55 +0000, David Howells wrote:  
> > > Jeff Layton <jlayton@kernel.org> wrote:
> > >   
> > > > This version splits the change up to be more bisectable. It first adds a
> > > > new kino_t typedef and a new "PRIino" macro to hold the width specifier
> > > > for format strings. The conversion is done, and then everything is
> > > > changed to remove the new macro and typedef.  
> > > 
> > > Why remove the typedef?  It might be better to keep it.
> > >   
> > 
> > Why? After this change, internel kernel inodes will be u64's -- full
> > stop. I don't see what the macro or typedef will buy us at that point.  
> 
> Implicit documentation?
> ktime_t is (now) always s64, but we still keep the typedef;
> 
> It would be cool if we could teach vsprintf to understand some new
> specifier to mean "kinode_t" or "ktime_t" etc.  But that would trigger
> gcc warnings.

A more interesting one would be something that made gcc re-write the
format with the correct 'length modifier' for the parameter.

That would save a lot of effort!

	David

> 
> NeilBrown
> 



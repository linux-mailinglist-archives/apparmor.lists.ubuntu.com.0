Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ/NAX2BF2ovHggAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 28 May 2026 01:42:53 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6245EAFA2
	for <lists+apparmor@lfdr.de>; Thu, 28 May 2026 01:42:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wSNtV-0004lB-OV; Wed, 27 May 2026 23:42:37 +0000
Received: from mail-qk1-f193.google.com ([209.85.222.193])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1wSNtU-0004ko-LL
 for apparmor@lists.ubuntu.com; Wed, 27 May 2026 23:42:36 +0000
Received: by mail-qk1-f193.google.com with SMTP id
 af79cd13be357-914ae4101b4so814133685a.2
 for <apparmor@lists.ubuntu.com>; Wed, 27 May 2026 16:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1779925355; x=1780530155; darn=lists.ubuntu.com; 
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :mime-version:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=vWtSF+ZdJPKnDl6l0dlAcmnN+0WDS6LYwhPmb91DFEM=;
 b=gOtqhRP/cFj2jnhTTsK01AEtWx0s//YDLOC8irCgvZKcspI5IHBbjvULHpWcvJquCc
 E76BCPgTp/QsQE2Kg7REGJEh8Ut6kKgb1Xx7HbiGhbhhCfGCb+iny8Xz059qiXaW263e
 +PeCOEis7doIQxWp2I88GPWx9jZ100oITDUbStQ/6ywDjRYObdX4OQ4vdiPzMHzuTssa
 dY8urgeHwO54x9ukLNA2Q5Y8UUAXib8yAyuRWNQDuVJYBWBIiC0da2IhMq7itJzAK0lu
 TklK1+brrPNRP4UB1iXZsMhGoFkOmP3Pq6P+ToQrSCU/wr+GkuyL/wrYyERGXA4qIvS7
 bjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779925355; x=1780530155;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vWtSF+ZdJPKnDl6l0dlAcmnN+0WDS6LYwhPmb91DFEM=;
 b=UQNfowiPcCnXRPZUYmoYpJTpRt9nWZ597RnRPNOwel6vQIRRX+QsQxr5PwpMFfSuTT
 Tsbns+Lj6CpNKnClazZXJ14vnZg46F4/C9tDS1iLZrKlIoKTX4kta92w9lXpuSxG3oFe
 LI4237pWLxwNDPPSMA/M74o9/ny7WqF/CaCcCf7M3sgFiPcgZ/AXJLw9P8G5Qe6FxuCZ
 Weh68dVx7b/tVrb7FirYkx3DW+k3i6uH8dQ7fHPTqhQXJY9bjn9j2VUVihqS1BH9chTO
 fOUT2qfPK+M9eNgQ6tdvwJUEh/weg5pOwJBmgAnHNmmki3zAPtnpvo9eL0s2gvyMK7Dx
 aeHQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/g+mBaXdpqdjRTPoIGknefdXymretj7rqlqwu82jJBCJy0vzoW3Nx3CbKfaNr5aRiBLoDDW2ke6g==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzkudFDLNHusiLkX9T2+FN9H6d7fls9zWunOH0ghOuP25izeIdV
 091eEt/KiL2ZY3MAz1kblIIuyVHBNRuygC/vnhV/7OcKevJ9Ghw/YYxBwh3lD8RqVg==
X-Gm-Gg: Acq92OGi7+ItL+I3P1/4BJB67VLysGhpvMnAfVTqnAo1lTXTvrO1B8dQ7vjKNRLQikr
 FSAld8M+M7SBuWidWA6A5yprdHjNP/9vi+ml8ZyzFyZgEwxTsKyX4eu2gmkDRePJ3fG9j8rOSPD
 Kj99cA/pHb/z2d1JH+7Ygp3Ko30rclhHPVQmUP0O5TZSU7dEZTwHMn6W91h9KIdiWkR9EHtcdpn
 S4zps8+RJxpRltAYjo8U5ZAIAJTiAtiYf/fXCush7cULzkGj5LfveVpguafg2sPvQQQ3rQNJoTn
 2I6pwbE1PPNB5jgw9uMTPTrlXpRiAKLluV/ySV+M3d+ckdg89xTeiLKZdL4slXXw200sjHr9jla
 GGm4Xm71nd55vxLdbib0KYp95I65tCi+Mxr9P9xOpc+jz/XSjV5KPgZJiKsRQH2nt8rOBTAkUrA
 C+L9tQP+iYqTzit7iASQbDhnEK6VLxUZT0yUocy9TBaLjY8AjwWW5kAYQN1etrvdhJm4tTFHn9G
 qFYkKbWF+fT9eGf3A==
X-Received: by 2002:a05:620a:290b:b0:910:87f4:9a26 with SMTP id
 af79cd13be357-914b49937b6mr3695400885a.41.1779925354972; 
 Wed, 27 May 2026 16:42:34 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net.
 [71.126.255.178]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-914f8706968sm615403785a.17.2026.05.27.16.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 16:42:34 -0700 (PDT)
Date: Wed, 27 May 2026 19:42:33 -0400
Message-ID: <c8fb6387f3c1efa126013090f45528c6@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260527_1931/pstg-lib:20260527_1608/pstg-pwork:20260527_1931
From: Paul Moore <paul@paul-moore.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 James Morris <jmorris@namei.org>, John Johansen <john.johansen@canonical.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>
References: <20260520-security-v1-1-831bd8e21dd0@kernel.org>
In-Reply-To: <20260520-security-v1-1-831bd8e21dd0@kernel.org>
Received-SPF: pass client-ip=209.85.222.193; envelope-from=paul@paul-moore.com;
 helo=mail-qk1-f193.google.com
Subject: Re: [apparmor] [PATCH 1/3] selinux: use k[mz]alloc() to allocate
	temporary buffers
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
Cc: selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[paul-moore.com:s=google];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[paul-moore.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:jmorris@namei.org,m:john.johansen@canonical.com,m:omosnace@redhat.com,m:serge@hallyn.com,m:stephen.smalley.work@gmail.com,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-security-module@vger.kernel.org,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,namei.org,canonical.com,redhat.com,hallyn.com,gmail.com];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[paul-moore.com:-];
	NEURAL_HAM(-0.00)[-0.869];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo,paul-moore.com:url,paul-moore.com:mid]
X-Rspamd-Queue-Id: DE6245EAFA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On May 20, 2026 "Mike Rapoport (Microsoft)" <rppt@kernel.org> wrote:
> 
> Several functions in selinuxfs.c allocate temporary buffers using
> __get_free_page() or get_zeroed_page().
> 
> These buffers are used either to store a string generated by snprintf() (in
> sel_make_bools()) or to copy data from user (sel_read_avc_hash_stats() and
> sel_read_sidtab_hash_stats()).
> 
> Such usage does not require struct page access and it is better to allocate
> these buffers with kzalloc()/kmalloc() that provide better scalability and
> more debugging possibilities.
> 
> Replace use of get_zeroed_page() with kzalloc() and usage of
> __get_free_page() with kmalloc().
> 
> Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  security/selinux/selinuxfs.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

I suspect if we look closer we can probably also trim some of those
allocations to less then a page, but that can be work for another day.

Merged into selinux/dev, thanks Mike.

--
paul-moore.com


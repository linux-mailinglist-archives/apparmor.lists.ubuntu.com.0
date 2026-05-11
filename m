Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VG9EEJszAmocpAEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 11 May 2026 21:52:59 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D04CA51546C
	for <lists+apparmor@lfdr.de>; Mon, 11 May 2026 21:52:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wMWgJ-000385-B3; Mon, 11 May 2026 19:52:47 +0000
Received: from mail-qk1-f173.google.com ([209.85.222.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1wMWgH-000379-O9
 for apparmor@lists.ubuntu.com; Mon, 11 May 2026 19:52:45 +0000
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-90ce49af8easo8597385a.3
 for <apparmor@lists.ubuntu.com>; Mon, 11 May 2026 12:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1778529164; x=1779133964; darn=lists.ubuntu.com; 
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :mime-version:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=QhgeQ/Hv8h2FLNPnpqx7Nq4djCqVR8s71dQNMbQD8h8=;
 b=TKCO7SBFjp0T2W0L6jhyao+Ko7uE4IvD5vE3QTlhSOgqOer5p6UEgKXMWYFU9dDPQ0
 5VOFe23SPBiqW3lFnPMPVfcFHl1OWkbcCZpiw6AZxW1sArTL/TURmxGlLVvmy94snIsV
 5+Dsnk/Ia63CzyaBIdkeY4sitrHP16vNjZmaBvt88GDCJRoyD3FlZipK/iQVTPiVtWIk
 x5MSwfuj/pplBZsTLdRT1UNaLzsQbwsOy06RTPoNW69eJgd9Kv7tMXxmnF7Tj8wHfRMB
 HcxnC8nsb1RASwltkU2WYi9AJK80ijjBP9NiHmkVxIka6+0DMWe1VnY8dOmLxc7cGENQ
 4RlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778529164; x=1779133964;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QhgeQ/Hv8h2FLNPnpqx7Nq4djCqVR8s71dQNMbQD8h8=;
 b=ImFmaEQh8oArOXecW/Nwr+65K1eRZAqBVy3pPvI5Xvimidlk/3iF3E+Q6R26sT4s0+
 w7OBynK/qtw362i+u7NUKoMBmNRAxu1+iO712bma9dyjwNEZbdNLoTZjfXMxDDyo9FjO
 gr4Kjei1U/nqoWa4y+iTKyIoPcd5KViZhR1rJdRUoAiXcQaCCkhhXThAg85Pgsw6uXuI
 X6ZPRXT3wkQSLs4XO3146u3dLwwVezKNa5Af0J+XouJm1PJy/SOvTG61dzOzVE4Q3RjH
 3Fowf07UZ4rml1geWtY1x+2qtcH8r4BzBhXAvVD/97rzDJix+byDNc/PeSxjz2ms1xQW
 +XNQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+nEliL4GuYfWo2C8YjIZZGLpjFby8Vb87O/JLHXSruqAob0rDgi1T4koE1r/+IOtE9PVGeUi2iCw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Ywx8KD5GHXEsLSaQXrFonrQ6Qgs9BKaOvf7SAW+C2h0rc4xuvcC
 0h0IoDUepkHXIy2DKdhw0pFJdcu9p1vx8s7peuz+Ugng/g0d58GbykK0wzb+1mrV7w==
X-Gm-Gg: Acq92OFulq8sTPAzSI896do8cshZ/R5otOcMigHn9F/Qxxgh7DqmLAjkVSaS6xvTUCS
 Q7a/7h5dechc7UrgidbZeIp8tgaHROXAB4RzgezvxtKiFmf/ozNDzuoM6cHbEh5l4bQIdhZHBcY
 hJ8gsuk3kaSdweppGxOFNrLshGItASTL6geDGEVlFoL5xz0W04ul21O+KMaPoHlAr6DfIByBbTg
 fQg4ZDx1ZFD4OOWHE0fvcxpkSmlttXup4pTOdQa7g43PjMejyeTwfSwzqogqupjx0B+kLYKiYI1
 mS1+KL9Sn2R6gybYsdHaRXjFxwWq3gMoYmboOyhtcjYspRJ9g6lV0uVE1qdqjAWXMyoaSJ1SREc
 RwIUUg1byBhZlh1snawsA3sHOreiCTisxGAFqIBU94+Wlytanu1d2QSVlSqIjRsqegDJEvLC9st
 hAI2Iekk3EwYmxKh85qIYZCyqabgqO9fLV6e1t4yxhEXdaX9uqjV3wmuRXsSaGfdyNmaCa
X-Received: by 2002:a05:620a:318d:b0:8e8:ffd2:ef90 with SMTP id
 af79cd13be357-907b8d9e67dmr2467034385a.3.1778529164314; 
 Mon, 11 May 2026 12:52:44 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net.
 [71.126.255.178]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-907b9286f22sm1151090885a.13.2026.05.11.12.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 12:52:43 -0700 (PDT)
Date: Mon, 11 May 2026 15:52:42 -0400
Message-ID: <b32ee44eb833fad926f4667892f2259f@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260511_1539/pstg-lib:20260511_1103/pstg-pwork:20260511_1539
From: Paul Moore <paul@paul-moore.com>
To: john.johansen@canonical.com, georgia.garcia@canonical.com,
 Song Liu <song@kernel.org>, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com
References: <20260509015208.3853132-3-song@kernel.org>
In-Reply-To: <20260509015208.3853132-3-song@kernel.org>
Received-SPF: pass client-ip=209.85.222.173; envelope-from=paul@paul-moore.com;
 helo=mail-qk1-f173.google.com
Subject: Re: [apparmor] [PATCH v3 2/7] apparmor: Remove redundant MS_MGC_MSK
	stripping in apparmor_sb_mount
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
Cc: brauner@kernel.org, herton@canonical.com, jack@suse.cz,
 penguin-kernel@I-love.SAKURA.ne.jp, stephen.smalley.work@gmail.com,
 kernel-team@meta.com, jmorris@namei.org, omosnace@redhat.com,
 Song Liu <song@kernel.org>, viro@zeniv.linux.org.uk, gnoack@google.com,
 mic@digikod.net, takedakn@nttdata.co.jp, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Queue-Id: D04CA51546C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[paul-moore.com:s=google];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[paul-moore.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:georgia.garcia@canonical.com,m:song@kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:brauner@kernel.org,m:herton@canonical.com,m:jack@suse.cz,m:penguin-kernel@I-love.SAKURA.ne.jp,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[kernel.org,canonical.com,suse.cz,I-love.SAKURA.ne.jp,gmail.com,meta.com,namei.org,redhat.com,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[paul-moore.com:-];
	NEURAL_HAM(-0.00)[-0.817];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[paul-moore.com:url,paul-moore.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Action: no action

On May  8, 2026 Song Liu <song@kernel.org> wrote:
> 
> path_mount() already strips the magic number from flags before
> calling security_sb_mount(), so this check in apparmor_sb_mount()
> is a no-op. Remove it.
> 
> Code generated with the assistance of Claude, reviewed by human.
> 
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  security/apparmor/lsm.c | 4 ----
>  1 file changed, 4 deletions(-)

John, Georgia, are you okay with this patch?

--
paul-moore.com


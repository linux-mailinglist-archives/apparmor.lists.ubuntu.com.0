Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKAzFXyBF2oUHggAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 28 May 2026 01:42:52 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EED5EAF9A
	for <lists+apparmor@lfdr.de>; Thu, 28 May 2026 01:42:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wSNtW-0004lP-S3; Wed, 27 May 2026 23:42:38 +0000
Received: from mail-qv1-f66.google.com ([209.85.219.66])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <paul@paul-moore.com>)
 id 1wSNtV-0004l0-PI
 for apparmor@lists.ubuntu.com; Wed, 27 May 2026 23:42:37 +0000
Received: by mail-qv1-f66.google.com with SMTP id
 6a1803df08f44-8bb4e8a5240so155698346d6.1
 for <apparmor@lists.ubuntu.com>; Wed, 27 May 2026 16:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1779925356; x=1780530156; darn=lists.ubuntu.com; 
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :mime-version:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=HU5mpIp08+v7UC4VxJJIUTVB47HlzTm6rBp+W/xs8cI=;
 b=Wd3xyEbhNFcf6n9jyCy2oT7E42m42hftIRKyXE6FvF8rVL5aiqNSJyWFOGhTrX/qAx
 Ztr6uvMu1P/OeNuDy70sZy/iyAq4kkTWfJLRMBnyqb7TQA1GtuZBr1D5llpvXeJSU+C9
 RuOcTPUSEsf0tRDReUYozg3s/Ub65I3RGOTz6lIBPHIHeIYUucRv+fUhCxxCqPlPsxKO
 Dv2FClsRtShkXyp/Vk21WWvub7CK8uF0dd9igkZ1bPLUgSqmF3u/BS0sg2YTcsZ7Uy6Z
 7gy16GGT5tmi7dGsda9+3/W7hMUJTLzjI2XrdwABLudrUBQ6wXhNmh1AWucsUIKRI9Po
 n1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779925356; x=1780530156;
 h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
 :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HU5mpIp08+v7UC4VxJJIUTVB47HlzTm6rBp+W/xs8cI=;
 b=NWpTnqOv68hRp8UQ8eY94UpGJs1gzj2VcJ+xCRvlEfZ23BmKDak+y51zJdvQVT2DSi
 ELi/tOrT2sIexkh6Sj4hfmje1D0NJPnnY/LoWMH8jT6832fY3w0rPqxWJGWNafaCaPKF
 9oKFkv8ECdK/6KHLJUbeAohr/nPixUL7dLpc6GWNW/B8gqYuG4AxYSG2UcTUz7XbCnAc
 4JYrFhzAZoeLhwCHOJM95bGvfKwQ3r1gyemjztBD3rPTt57WTeaoPs/XRCNVRsDS/R5u
 BdRd1o4Y9EOx/vVr1nNmXLqom0rCZX+2inDmfTzkb9TYYFl2/8Mizr8pg6Ywtq8dSFxa
 /ZlQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ85QBCutYKt2xwBLy/HFuPrNN8SxirM91qAP5LuYvAjltRZjKXoGMDlVNIKPYHTqXsZgaZCQmoMPw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxhkRA4k1yLkR0ykBC/ogBcfUj0+mI2uvPqgRxcdXsvavi4G2W3
 Dvp7YBRkH7ETBkSB5v1IeHOtFIuMY9/tSUe02FGVVePChWDEqEFSdKH14Xp0NwVcgw==
X-Gm-Gg: Acq92OF2gqgsBJKmI9gqqSyWhlRF/3uNgYG7MKJKg1CEA60BG7acC1Fsy8a830eNBsf
 jnx9SRNVrByKzuC0UY22ms473wtc4ucgSAzIpYO2MQpqrhg1guhnvbpCZJe7PeBAkTLZjd6OT/V
 bA3ty6rFgW0HiZNUxage4C59oFDNo1o9Y9dZk4JYFA2OnJSxJip1+UoBTYv0tgjkJ1MCFqYXcAb
 gQGyF3XuNi7iokJbORyin7gxBJUNRZma6j9CgrZrQgmx53hxjWdhm9ZsnzTNrv1QiwLw94S5H5X
 qozXO9711Y8Qfqk/ukq6b3aJinpg+/PSIIXPnzO5y6aS0vmGJ/FABSkNawrEcvfQj5a/LCEwxjM
 4JOE7ejod4BG40LiBdMF1cbAx2mehoEytJ1Ui4ojgvE4IgiPTRRr3mWOMS6gt4AC6tSmFPM3f5E
 0A0iXcgh4DlFLBMVC0Zpg9GoQJA66JXw2IAiXpeLXJQItfUNqu9Q742U2IAfBF3kklMmO1rE4Ti
 6E0WTE=
X-Received: by 2002:a05:6214:3bc7:b0:8cc:15e4:1208 with SMTP id
 6a1803df08f44-8cc7b65aa0dmr409956706d6.32.1779925356424; 
 Wed, 27 May 2026 16:42:36 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net.
 [71.126.255.178]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8cc80ffca70sm181789696d6.22.2026.05.27.16.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 16:42:35 -0700 (PDT)
Date: Wed, 27 May 2026 19:42:35 -0400
Message-ID: <4aac8924f51f66daa69acd50d8b89f3a@paul-moore.com>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260527_1931/pstg-lib:20260527_1608/pstg-pwork:20260527_1931
From: Paul Moore <paul@paul-moore.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 James Morris <jmorris@namei.org>, John Johansen <john.johansen@canonical.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>
References: <20260520-security-v1-2-831bd8e21dd0@kernel.org>
In-Reply-To: <20260520-security-v1-2-831bd8e21dd0@kernel.org>
Received-SPF: pass client-ip=209.85.219.66; envelope-from=paul@paul-moore.com;
 helo=mail-qv1-f66.google.com
Subject: Re: [apparmor] [PATCH 2/3] selinux: hooks: use __getname() to
	allocate path buffer
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
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[paul-moore.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[paul@paul-moore.com,apparmor-bounces@lists.ubuntu.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.786];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[paul-moore.com:url,paul-moore.com:mid,lists.ubuntu.com:rdns,lists.ubuntu.com:helo]
X-Rspamd-Queue-Id: 06EED5EAF9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On May 20, 2026 "Mike Rapoport (Microsoft)" <rppt@kernel.org> wrote:
> 
> selinux_genfs_get_sid() allocates memory for a path with __get_free_page()
> although there is a dedicated helper for allocation of file paths:
> __getname().
> 
> Replace __get_free_page() for allocation of a path buffer with __getname().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  security/selinux/hooks.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Merged into selinux/dev, thanks.

--
paul-moore.com


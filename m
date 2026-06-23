Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ixTiCa0yOmp03wcAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 23 Jun 2026 09:15:57 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFE46B4C42
	for <lists+apparmor@lfdr.de>; Tue, 23 Jun 2026 09:15:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wbvMD-0002SD-Cy; Tue, 23 Jun 2026 07:15:41 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1wbvMA-0002S4-TK
 for apparmor@lists.ubuntu.com; Tue, 23 Jun 2026 07:15:39 +0000
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4C3F73F2C9
 for <apparmor@lists.ubuntu.com>; Tue, 23 Jun 2026 07:15:38 +0000 (UTC)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c889d1eebafso7228575a12.0
 for <apparmor@lists.ubuntu.com>; Tue, 23 Jun 2026 00:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782198937; x=1782803737;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UJ28Quv7slmdN0gFykwlCCszHWU5zR4AurdWTg5hrBs=;
 b=mwo3FU0uPxekm4VD8I0xM0ipjwUWz1Xz272SID1lXvEpgE/nSyuWMFIqf8OWP0As7Y
 PlvUS7gMUEwe4TcROicI8FEvqUIv3emjK97JoDCjcIXvO4l4vslHTv+aK+IB2B/zprB8
 Fc5xYsSxU2LdRELGQ5eQiIXVblumd9MRqDb9Gch7I/dAGFeXnjmzpyPrhX2HtNZchJD6
 jfwdcxl7uBfsnFU25ZD/J5s085JswW9sWAcaMBfBXz+bM+1+oQE8oOckYkvC78iqR/Kd
 FUuSNHRsu9cuVn6+oFfc41bP5mVMUmdTWci345I/ZV+DJKOLkgU/LyhnXpASQd8ZeSji
 vSuA==
X-Forwarded-Encrypted: i=1;
 AFNElJ//PK760IHu87vKnSzQL4+6f+BAnKoabXKd7xAEwP7+/OhUHNBAKhaNlbFtLexbHAesmB+EBltuRg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzRuhB7h++8h0rw9qoi4tdPKHys+3gw4dStmDlXCciF1M+gZ8T+
 voP9ECx6I1xRNDw4zZn6dEbwm6LcU576r7mzY6fyy5UEgyp4VgYf9l7jJGMiEKlAcyk86gJi+Re
 Y3Ehpyk5N9LQE0J+FbQNMzAsKgroepdevPaUeo/co6ZtKXZbILSrNnUssZFfy76E6izOuA1CrAk
 uQKw==
X-Gm-Gg: AfdE7clzTa+zqMY69uG0eVUil40xVLTQ9+cVrXx+Z27QroXrOg9HIkd+WyGWcobtwHQ
 1YZrXVaLrfdjvDz5UStWx5GBVRd02ms2ve8+sY+KkV2Ocg6ss6TEuH8QlGdlpdunIEOjrhR4ckJ
 ltaCC9URgSqxkminsV1ymsScLyIJxjNeeS4a9feLoFjRpDpcorXrouoyRGPredaAEl5hpp60FyD
 ELzea2umT2kAzCS9+XtNSPXGXD7XrM4iNM6lI6OZNQA2VHly6qqHDkDS8i58H97oc7gSePmpl2c
 XxreZPW4absDcS7vSbfFDvQLBUPYudQ1rTnwSnBJtFPdEH1icYgm4BNJsWJwQjSaw7i3aaICE2J
 2LK1HWq3Nr1EIHIUSYUNEO6vhGw==
X-Received: by 2002:a05:6a00:238c:b0:845:3d4b:8f8a with SMTP id
 d2e1a72fcca58-845508a1d4fmr20512989b3a.35.1782198936949; 
 Tue, 23 Jun 2026 00:15:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:238c:b0:845:3d4b:8f8a with SMTP id
 d2e1a72fcca58-845508a1d4fmr20512970b3a.35.1782198936570; 
 Tue, 23 Jun 2026 00:15:36 -0700 (PDT)
Received: from [192.168.192.71] ([50.47.147.90])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-84564d8a7f0sm10037091b3a.13.2026.06.23.00.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 00:15:36 -0700 (PDT)
Message-ID: <2ea3bc97-8422-4e33-88b8-a8b0fee79793@canonical.com>
Date: Tue, 23 Jun 2026 00:15:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: hexlabsecurity@proton.me, Ryan Lee <ryan.lee@canonical.com>
References: <20260622-b4-disp-aba401c6-v1-1-9d74343c7ced@proton.me>
Content-Language: en-US
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260622-b4-disp-aba401c6-v1-1-9d74343c7ced@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: mediate the implicit connect of
 TCP fast open sendmsg
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
Cc: Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, Matthieu Buffet <matthieu@buffet.re>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Mikhail Ivanov <ivanov.mikhail1@huawei-partners.com>,
 Mickael Salaun <mic@digikod.net>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lists.ubuntu.com,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FREEMAIL_CC(0.00)[paul-moore.com,gmail.com,lists.ubuntu.com,namei.org,buffet.re,vger.kernel.org,huawei-partners.com,digikod.net,hallyn.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hexlabsecurity@proton.me,m:ryan.lee@canonical.com,m:paul@paul-moore.com,m:stephen.smalley.work@gmail.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:matthieu@buffet.re,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:ivanov.mikhail1@huawei-partners.com,m:mic@digikod.net,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_mime,canonical.com:replyto,canonical.com:email,canonical.com:mid,proton.me:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BDFE46B4C42

On 6/22/26 13:57, Bryam Vargas via B4 Relay wrote:
> From: Bryam Vargas <hexlabsecurity@proton.me>
> 
> sendmsg()/sendto() with MSG_FASTOPEN is a combination of connect(2) and
> write(2): it opens the connection in the SYN. apparmor_socket_sendmsg()
> only checks AA_MAY_SEND, so a profile that grants send but denies connect
> lets a confined task open an outbound TCP/MPTCP connection that connect(2)
> would have refused, bypassing connect mediation.
> 
> Mediate the implicit connect when MSG_FASTOPEN is set and a destination
> is supplied. Add it to apparmor_socket_sendmsg() (not the shared
> aa_sock_msg_perm() helper, which recvmsg also uses) and call aa_sk_perm()
> directly, mirroring the selinux and tomoyo fixes. sk_is_tcp() does not
> cover MPTCP fast open, so the SOCK_STREAM/IPPROTO_MPTCP arm is explicit.
> 
> Fixes: cf60af03ca4e ("net-tcp: Fast Open client - sendmsg(MSG_FASTOPEN)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>

Acked-by: John Johansen <john.johansen@canonical.com>

I have pulled this into my tree

> ---
> This is the patch and reproducer requested in [1]. A userspace regression test
> (tests/regression/apparmor/net_inet_tcp_fastopen) follows separately to the
> apparmor tree, as suggested.
> 
> Reproducer (behavioral; the bypassed value is policy, not bus state, so no special
> hardware). Under a profile that grants inet/inet6 stream send but denies connect, on
> the current Debian security kernel 6.12.94 (apparmor active):
> 
>    [TCP ] connect(2)=EACCES   sendto(MSG_FASTOPEN)=OK   -> connect bypassed (listener accepted)
>    [TCP6] connect(2)=EACCES   sendto(MSG_FASTOPEN)=OK   -> connect bypassed
> 
> The kernel audit shows the connect(2) denial and no connect record for the fastopen
> sendto:
> 
>    apparmor="DENIED" operation="connect" profile="egress_restricted" comm="lsm_tfo_ab"
>      family="inet" sock_type="stream" protocol=6 requested_mask="connect" denied_mask="connect"
> 
> With this patch the fastopen sendto hits that same connect denial. Full reproducer
> available on request.
> 
> Same-class fixes: selinux [2], tomoyo [3]; the original cross-LSM report (landlock,
> the first instance) is [4].
> 
> [1] https://lore.kernel.org/r/20260619011138.264578-1-hexlabsecurity@proton.me
> [2] https://lore.kernel.org/r/20260618175513.112443-2-stephen.smalley.work@gmail.com
> [3] https://lore.kernel.org/r/20260619002207.61104-1-matthieu@buffet.re
> [4] https://lore.kernel.org/r/20260616201615.275032-1-hexlabsecurity@proton.me
> ---
>   security/apparmor/lsm.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
> index 3491e9f60194..e01efdf50efa 100644
> --- a/security/apparmor/lsm.c
> +++ b/security/apparmor/lsm.c
> @@ -1422,7 +1422,21 @@ static int aa_sock_msg_perm(const char *op, u32 request, struct socket *sock,
>   static int apparmor_socket_sendmsg(struct socket *sock,
>   				   struct msghdr *msg, int size)
>   {
> -	return aa_sock_msg_perm(OP_SENDMSG, AA_MAY_SEND, sock, msg, size);
> +	int error = aa_sock_msg_perm(OP_SENDMSG, AA_MAY_SEND, sock, msg, size);
> +
> +	if (error)
> +		return error;
> +
> +	/* TCP fast open carries connect() semantics in sendmsg(); mediate
> +	 * the implicit connect so it cannot bypass the connect permission.
> +	 */
> +	if ((msg->msg_flags & MSG_FASTOPEN) && msg->msg_name &&
> +	    (sk_is_tcp(sock->sk) ||
> +	     (sk_is_inet(sock->sk) && sock->sk->sk_type == SOCK_STREAM &&
> +	      sock->sk->sk_protocol == IPPROTO_MPTCP)))
> +		error = aa_sk_perm(OP_CONNECT, AA_MAY_CONNECT, sock->sk);
> +
> +	return error;
>   }
>   
>   static int apparmor_socket_recvmsg(struct socket *sock,
> 
> ---
> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> change-id: 20260622-b4-disp-aba401c6-f02842c82975
> 
> Best regards,



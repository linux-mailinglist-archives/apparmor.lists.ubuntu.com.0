Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKfYAnZKf2kNnQIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 01 Feb 2026 13:43:34 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B69D1C5EA1
	for <lists+apparmor@lfdr.de>; Sun, 01 Feb 2026 13:43:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vmWnM-0004wo-T2; Sun, 01 Feb 2026 12:43:16 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <thorsten.blum@linux.dev>)
 id 1vmWnM-0004wg-4I
 for apparmor@lists.ubuntu.com; Sun, 01 Feb 2026 12:43:16 +0000
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1769949795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KQaIAksFy4OyCwreX2pg+p3duXVHh4+gN2s7Z4WqeOE=;
 b=bRn0ebCKt0d5YZFY/Spdk6+eTufZDcvFu1vam7J1ja1E9vAW38Q5qR/fmidkqnpDMzFQRM
 kSgewOtbczolDHFSFsgW4t/P9w3pN6S6aY63nlHVjYRvirTivAK0+vQb8upKK77awaPRJp
 z+hLNsYL1GNIPr8WBBDisuReGEG0Ceo=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <D73FFEAA-F246-4777-8CA8-32807F378423@linux.dev>
Date: Sun, 1 Feb 2026 13:42:40 +0100
Content-Transfer-Encoding: 7bit
Message-Id: <3CA1F386-2217-405B-AB6E-85195AD09CA8@linux.dev>
References: <20251126165701.97158-2-thorsten.blum@linux.dev>
 <1da23c89-dc2c-41cb-8260-098deb8ae917@canonical.com>
 <D73FFEAA-F246-4777-8CA8-32807F378423@linux.dev>
To: John Johansen <john.johansen@canonical.com>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=95.215.58.172;
 envelope-from=thorsten.blum@linux.dev; helo=out-172.mta1.migadu.com
Subject: Re: [apparmor] [PATCH RESEND] apparmor: Replace deprecated strcpy
 with memcpy in gen_symlink_name
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
Cc: Paul Moore <paul@paul-moore.com>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>,
 linux-security-module@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	R_DKIM_REJECT(1.00)[linux.dev:s=key1];
	MV_CASE(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.dev : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:jmorris@namei.org,m:linux-security-module@vger.kernel.org,m:serge@hallyn.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thorsten.blum@linux.dev,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: B69D1C5EA1
X-Rspamd-Action: no action

Hi John,

On 27. Nov 2025, at 11:18, Thorsten Blum wrote:
> On 27. Nov 2025, at 02:32, John Johansen wrote:
>> hey Thorsten,
>> 
>> sorry I have actually pulled these in, and tested them. I didn't send out
>> the acks yet because I have another patch that I was waiting on a proper
>> signed-off-by: on.
>> 
>> I am going to have to pull that one so I can push. I'll add acks now but
>> the push isn't going to happen for a few hours.
>> 
>> Acked-by: John Johansen <john.johansen@canonical.com>
> 
> Ah sorry for resending then, didn't know you looked at them already.

Did you ever push the commits? I can't find them anywhere.

Thanks,
Thorsten



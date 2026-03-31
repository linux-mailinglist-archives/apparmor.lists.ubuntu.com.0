Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE9DDVcUy2kgDwYAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 31 Mar 2026 02:24:55 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9D0362A26
	for <lists+apparmor@lfdr.de>; Tue, 31 Mar 2026 02:24:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w7MuS-0006jR-2o; Tue, 31 Mar 2026 00:24:44 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <torvalds@linuxfoundation.org>)
 id 1w7MuQ-0006jE-Pv
 for apparmor@lists.ubuntu.com; Tue, 31 Mar 2026 00:24:42 +0000
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5a2bb0fe3bbso351278e87.3
 for <apparmor@lists.ubuntu.com>; Mon, 30 Mar 2026 17:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1774916682; x=1775521482;
 darn=lists.ubuntu.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tir8tYzZsdvdQe2Y3Sf5wYOGCREjM5L09WG7qVnCWNg=;
 b=UnJYgOorSob+3FQrpcU5h4UcnMmMX0/5hnP+0wJTvJ3NqV3sOnINBh/2Gc2+GOORxr
 kqm+AOo0aYNc/8CSwhvbWjn1F4+VzGcN3mADcdX2CMGz+pS3Xn8hIzRPU8lXiKn59HL9
 s1GcrMFuCP55U3iFPknRVu1QOk+RfjkPq1loo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774916682; x=1775521482;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tir8tYzZsdvdQe2Y3Sf5wYOGCREjM5L09WG7qVnCWNg=;
 b=sL/63xEMRAS2+PnPPmIOWOQrKX3jutRPzreBLTZ0zQ2qIKY7OKoXdGhiVJlLzArPVl
 KN83S48Nh6qbhz54+v2k9JKEFAYVdF1hIyeKSyTE5rPAp8CuXC62gUqMyZ36d7PmqQwK
 sQYsVMFEpcjTc0vTYgsFL2SQjYnMd8PNdE5N2J7lkhqnbdGgFOFyF5F7vCwyzqRyD0fT
 UdWwsgrnB2mp5Vxk/MrSwwHKshwmCACLBTSHplGy5CsZ5XxCHRjS34OcVmPdDfv1Xu5H
 nfu/hGMHhJwCgFlt13RGPuAl9T2u24i5i9Wkw0GnNghm5qREKqYTdqUcQtJeW5lQEvyW
 57Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvPP3nOK/zaJf6bK9FoVGBEHhxj+iBctpg/IsP8JsW6CDouJ9Ox2PQAltuZoDsU+SLfeq/298mjA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yz9aENyv6eA4GBDmsUeGh8t5a+Fv3VQ51X3joZk3JATVUEVHVAf
 pNE4qkcrByLoXsSEo/Y4sjb4g98Rkr/aCk478b6jH8LyfWtqOS7A3ObVF6qhISuO4Bmlo8m1ur2
 8tOM+6tfJwA==
X-Gm-Gg: ATEYQzzjMDacQgFpIbU0h2dOcGiyItvsiQ2upYItsvGL5Ml76DumsW5rYjr67PCzO9l
 svozeoUZtJWQYbTFKYfltQVJpkj7tANDJSoRinFE9vWnEriwYg2monV9q8hRw7WMvImtl0ktVyh
 u0p9AjW9HpOXjHjBxzDD9p3bHh24k8i84ut0Kpca8qJHYPAIZvc9T2wEYM/ZS6kmb5EQr0b7jLU
 mXz0bzpfJerGo/jrQWlnYK+XQmJNOrWhWKTX4+329qNvGg7Se0Jg4sGSBA17ai6ZBLHGZubKRvk
 yGt4pgmwCkVGOpFWxNmodE9WK1VS0LK8O5qmniVmjq6C98jhRSszZihVzBZlFhsMjvGxP9HF1zj
 OTpAVegPjpXXpf0Wn7FbM4nk02cNCh5x63jJWyjnp2LoX9rqKT3AY8I5UCI0Wtx1r1MHUPTbVQl
 GWjUAGw8H6+WedUeau2o/3Z60NCgaEKioorc7WOrO7b2rRIl8fLkBz3Pe/krHakZB8WJyWYV083
 S7H
X-Received: by 2002:a05:6512:39d0:b0:5a2:ae74:72c6 with SMTP id
 2adb3069b0e04-5a2ae747412mr4670656e87.32.1774916681543; 
 Mon, 30 Mar 2026 17:24:41 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a2b13b13bbsm2001991e87.0.2026.03.30.17.24.40
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 17:24:41 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-38be66a9fc0so52336601fa.1
 for <apparmor@lists.ubuntu.com>; Mon, 30 Mar 2026 17:24:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVsgyjDSLjxCju+/X0CgOIEcRlH+miW00oWGRkej8E2Z8B4EGEYWrqe5IXKdb2/RIkWxEAkavtAaA==@lists.ubuntu.com
X-Received: by 2002:a05:6402:4346:b0:66c:4366:3217 with SMTP id
 4fb4d7f45d1cf-66c4366346emr280074a12.7.1774916288569; Mon, 30 Mar 2026
 17:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260326131838.634095-1-dhowells@redhat.com>
 <20260326131838.634095-5-dhowells@redhat.com>
 <20260329121208.6092419d@kernel.org>
 <CAHk-=wiJ6gEELLviexdmSHnyjVoG7MFo8Qwhd1zxs_tCnL-=gQ@mail.gmail.com>
 <1179840.1774867765@warthog.procyon.org.uk>
 <CAHk-=wjDKfhS5TvEfrsOgBgAvFMPfAd3wT=Um2AQb4txHq5sAQ@mail.gmail.com>
 <1317861.1774914607@warthog.procyon.org.uk>
In-Reply-To: <1317861.1774914607@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Mar 2026 17:17:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wji+mTVj0vkSRJc2p38B5HaMp=oo+aUNA7CwuiguM+EUA@mail.gmail.com>
X-Gm-Features: AQROBzCw8GXLOeNuPbkp4sgcu_wDqPonncg2z7A4jKKak2u69PJv7yB-cJ3CIOI
Message-ID: <CAHk-=wji+mTVj0vkSRJc2p38B5HaMp=oo+aUNA7CwuiguM+EUA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.167.42;
 envelope-from=torvalds@linuxfoundation.org; helo=mail-lf1-f42.google.com
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
 linux-afs@lists.infradead.org, Minas Harutyunyan <hminas@synopsys.com>,
 Eric Dumazet <edumazet@google.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Simon Horman <horms@kernel.org>, Marc Dionne <marc.dionne@auristor.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
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
	FORGED_RECIPIENTS(0.00)[m:dhowells@redhat.com,m:stable@kernel.org,m:netdev@vger.kernel.org,m:linux-usb@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-afs@lists.infradead.org,m:hminas@synopsys.com,m:edumazet@google.com,m:mathieu.desnoyers@efficios.com,m:horms@kernel.org,m:marc.dionne@auristor.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
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
	NEURAL_HAM(-0.00)[-0.812];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: DC9D0362A26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 at 16:50, David Howells <dhowells@redhat.com> wrote:
>
> If I don't delete entries in rxrpc_destroy_all_calls(), then rxrpc_put_call()
> only needs list_empty() to guard against the call not having being queued yet.
> I could have a flag for that, but it would be superfluous.

So make *that* code use a creaful "delete with flag".

As far as I know, __list_del_clearprev() works fine for RCU walking
too, and that "prev is NULL" works as a "this is not on a list".

Admittedly I didn't think about it a lot.

So my point is more that this should not be some "generic list"
behavior, and I do *not* want people to think that they can just do
"is_on_list()" kind of crap in general.

This should be a "this user needs that particular behavior, and has
used this particular function to get it".

And yes, this pattern started out as a single performance-critical
networking user, and maybe we could rename and codify this pattern
better since we now have a couple of users (bpf and xdp) and another
apparently appearing. But I think that "rename and codify" should be a
separate thing (and done after ths particular issue is fixed).

              Linus


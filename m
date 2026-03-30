Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBskFs71ymmlBwYAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 31 Mar 2026 00:14:38 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B401361CC6
	for <lists+apparmor@lfdr.de>; Tue, 31 Mar 2026 00:14:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w7KsO-00037s-4R; Mon, 30 Mar 2026 22:14:28 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <torvalds@linuxfoundation.org>)
 id 1w7KsM-00037k-Rn
 for apparmor@lists.ubuntu.com; Mon, 30 Mar 2026 22:14:26 +0000
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-66a4c6bb6ecso8943661a12.1
 for <apparmor@lists.ubuntu.com>; Mon, 30 Mar 2026 15:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1774908866; x=1775513666;
 darn=lists.ubuntu.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sgxFsOJvZ8sXCMbDM96Xr96StQzCVgpxG8bopM7guow=;
 b=f7RN1OUOBU+rKkSSyCQFjt49Gm53rsQpCULdo990S8+wYQ8/lV4XSNvkAxOzUwrEfy
 nRT7RtqOktrMd1ckNu3NuOmQHlW88GM6S7u5bz6WNseR9SYmy0hEPyVTTgJOzjcigGqv
 /8kKnqkzBa2ttDVIAoZ6i+yyqOW4hJIG1IRis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774908866; x=1775513666;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sgxFsOJvZ8sXCMbDM96Xr96StQzCVgpxG8bopM7guow=;
 b=C3W/uRt0jfbXxXqLzCHTMUSjt5t6DraHOEpX8dloIuiob/xrW0zDQiR1b99XFxvCSF
 EQrfEb9b32ysQOkB7os7lR/wAfbNwM0Ut1oqV+fqdmHc3oFj2ORacs2sfnUmWuAXCB9E
 bLhJKcf6LCkIGz6ohnOIYlR1KW1owDnygZQXOKdbnUL/37BPxcNa0jtE28PCAgcw3b9P
 sXCABHOtKgigDBx5ui5Rcop178pX3vpCmyCM1iH5/vUpA7FELUdRXIQO9YQRMpZoSNHD
 aIwbRvSng2LkEcy+7F9F3s0rRkq7QpXW1iTzkoEbcuroRY97PRAukt9boOc9HaL7gLVF
 dg8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6NDcl2AEt30MH1s9SlA50kOShL84PMp7ZgBsUi2IC4s2L4VJ4QT53Szc9E5kWBIhXFV2JjnzIzQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Ywv3hvO4mPAo2Ks4f0MG1Ee91V/jM1XP9CzguHWxwfwtBlPGtWE
 kqbOjRj78PufNM0ZSi1spSh4Uo3ftQ53qt9E54D7Yr5ydQS4oumYskMB/vaENICX4pV0IdTMkaC
 eGMCaS00=
X-Gm-Gg: ATEYQzxZL9MbYkwbBq+LR0/DS5S8RbKIPXolRzp6o92gMiNi9YIaGwzSgQEVm574HyJ
 zWUNYa20DtXHSkWnQ0CEB6xOjpwlxDlok7J9cu5Ph1fWKo+l2QTZM0tqSvgCmSYpQdPdcDXY3Bv
 cDUPm5F87ayE/Mhi59yU/hHfbe3wvnutmDpCoZ2Vw1hD1zVH74HRO9oiu+W8JGJPijLyR996B2d
 gNDNuPF+gK/m0+uKzeTsFvLE6RAs5nW3bNq35Ozke2AfvijljfSY3XuJ5xvyr2T5EtJFjmtxMrQ
 PmAabN+qfo6NzAtPQDnF0sKUvRCZZ75/C4sMk30A4KpCGehxOJ/IUYDuhR+aMtTJGEh4etlEPPv
 E9hX1hGJTmUTe48u5QHuWdVJgwn/9r0BmLiqvjgdgCvvOYBSKlHbsX9d98mkNXrC8iTIsnvEGN8
 6lYeYIroExi7kXPqSbBMzbuRGimn3Ww2twsLMRg1Hvc3XWPnt2bKrs03IPEdMaNx1h+c+cQpyv
X-Received: by 2002:a17:906:f58e:b0:b9b:207c:f7e3 with SMTP id
 a640c23a62f3a-b9b503a3572mr852996066b.25.1774908865917; 
 Mon, 30 Mar 2026 15:14:25 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9b7b225b9fsm344971866b.62.2026.03.30.15.14.25
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 15:14:25 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-66abe08cdf5so7551386a12.0
 for <apparmor@lists.ubuntu.com>; Mon, 30 Mar 2026 15:14:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXp/ysCmFJgESaKeN08yPrbCR4rgxwoYs/uvhOl4i2CCdQC+akekvonuaOzfaeKWIPS2+XyI0neiw==@lists.ubuntu.com
X-Received: by 2002:a05:6402:52c7:b0:662:ab67:a560 with SMTP id
 4fb4d7f45d1cf-66b28c526dcmr6891247a12.24.1774908864935; Mon, 30 Mar 2026
 15:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260326131838.634095-1-dhowells@redhat.com>
 <20260326131838.634095-5-dhowells@redhat.com>
 <20260329121208.6092419d@kernel.org>
 <CAHk-=wiJ6gEELLviexdmSHnyjVoG7MFo8Qwhd1zxs_tCnL-=gQ@mail.gmail.com>
 <1179840.1774867765@warthog.procyon.org.uk>
In-Reply-To: <1179840.1774867765@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Mar 2026 15:14:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjDKfhS5TvEfrsOgBgAvFMPfAd3wT=Um2AQb4txHq5sAQ@mail.gmail.com>
X-Gm-Features: AQROBzC8ec9XUhg2CYF5IFXZ9-klR-Uxedhu4hxXRVBKoiRq4ZlNxeqrDUpLHRg
Message-ID: <CAHk-=wjDKfhS5TvEfrsOgBgAvFMPfAd3wT=Um2AQb4txHq5sAQ@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.208.49;
 envelope-from=torvalds@linuxfoundation.org; helo=mail-ed1-f49.google.com
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
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_RECIPIENTS(0.00)[m:dhowells@redhat.com,m:stable@kernel.org,m:netdev@vger.kernel.org,m:linux-usb@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:linux-afs@lists.infradead.org,m:hminas@synopsys.com,m:edumazet@google.com,m:mathieu.desnoyers@efficios.com,m:horms@kernel.org,m:marc.dionne@auristor.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.629];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 1B401361CC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 at 03:49, David Howells <dhowells@redhat.com> wrote:
>
> Anyway, I'll find a different way to do this, not involving checking the prev
> pointer.  What I don't want to do is hard code "prev == LIST_POISON2" into my
> stuff.  Anything like that really needs to be in list.h.

So i think the proper model is:

(a) normal and good list users should never *use* this kind of "is
this entry on a list or not".

Dammit, you should *KNOW* that already from core logic. Not with a
flag, not with a function to ask, but from how things work. The whole
"am I on a list or not" should not be a list issue, it should be
obvious.

(b) if the code in question really doesn't know what the ^%&%^ it did,
and has lost sight of what it has done to a list entry, and really
wants some kind of "did I remove this entry already" logic, I would
encourage such uses to either re-consider, or just use the
"__list_del_clearprev()" function when removing entries.

Because I really don't want the core list handling to cater to code
that doesn't know what the hell it has done.

                Linus


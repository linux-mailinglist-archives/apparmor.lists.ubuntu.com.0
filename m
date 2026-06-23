Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Ef/BAM6Omo/4QcAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 23 Jun 2026 09:47:15 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 919F46B4F53
	for <lists+apparmor@lfdr.de>; Tue, 23 Jun 2026 09:47:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wbvqR-0006Pr-8z; Tue, 23 Jun 2026 07:46:55 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1wbvqQ-0006Pk-DF
 for apparmor@lists.ubuntu.com; Tue, 23 Jun 2026 07:46:54 +0000
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AB2A23F1F4
 for <apparmor@lists.ubuntu.com>; Tue, 23 Jun 2026 07:46:53 +0000 (UTC)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2c6bbd0afffso97201545ad.0
 for <apparmor@lists.ubuntu.com>; Tue, 23 Jun 2026 00:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782200812; x=1782805612;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jMZ/4AU6RBOUlHGNfPCwyGV8pjFbwCbirbDx1kc8SO8=;
 b=RByHbJvcyy2nY7e32gBB8Ye8IalXPyyT/GjxkcNf7Cce3h2zfZBNId4ut1F8AUhft5
 vDAJ4TLbYP/h9S5E9BczmkwHQZViQhzpB8LO7M09Xksbz+Zh/6XMnrkwrn/eUaXOB72w
 muMq00PDHCIT0b9AntrMbbYo0n/xUj+EVirUkhGB1/psIvk6dyw+aisVEG+XfmFleUk/
 onLUzlPmdtFoPLvgLoZgHmjAefQ6PHpzf21Xf/4ghz4M3sDS5wgLA8FPbxKvG/i5g4cn
 wqdOGAUNoPeLGfy1WAf3bJ9KnIgMYbrXciKS/CmtZi91yZHpBjBPKw1S1W9VgTUFxxMW
 WzEg==
X-Gm-Message-State: AOJu0Yx0AGWruGLTppMpsYnN0QRa9lHw0AlUhSiTSP2ekXgE1MzkR/TW
 3yBl/8DyfgKXnvQ+JyGg0kcg4K5pJrxgHet1ksXl0Ax+Dev03TjmJei1fjy8w0YSzUBAR4creUf
 fV9POmnnWlTDczo/Io4PhIF7Oe1dNauTjU4W2QrqgEkXKyHu+hfCve2woRCaApzQhGSFntBJodh
 nu6XgLxJnlKw==
X-Gm-Gg: AfdE7cnEM6Fkuuw9X5Xc/WrRYIT4tjSzPI8M5Kj3VFjXX7YBHUaQIfPRzClShjZL2V0
 3cD47IhqIVfURFa/dtHEuau2oiN8+ebK6lSqXoi17BRe8UysCKlHkIzH7fyjwCH4qkTPWc7J2Pf
 lu2RqolgcXzJm+hE08WNjtvNH0J6ZfxGjudmgxW3yC+7tJ1PS6K6Q41SjUWRwpnwNWUzw0AQ0JQ
 469Cho4KYSunDmj1FJifs6/2D5oEXgCU/P4sqmZOoTq4YExmReWcMQT25ysCtd2dy6UXwgS5KLc
 lyVoqUDZEk0pNJ6dv82giy+uMJTbVA1y13H/iDh2Z3WzCGdNaVMX++uu0VZ/YmotZZnNs9ctfBx
 u44wgzv1dhTRNFWHunAjTF/Oc3Q==
X-Received: by 2002:a17:90b:4d0a:b0:36b:936e:73c8 with SMTP id
 98e67ed59e1d1-37dd0dd0770mr2045350a91.19.1782200811923; 
 Tue, 23 Jun 2026 00:46:51 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0a:b0:36b:936e:73c8 with SMTP id
 98e67ed59e1d1-37dd0dd0770mr2045331a91.19.1782200811489; 
 Tue, 23 Jun 2026 00:46:51 -0700 (PDT)
Received: from [192.168.192.71] ([50.47.147.90])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-37d15de53ffsm12469836a91.12.2026.06.23.00.46.50
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 00:46:50 -0700 (PDT)
Message-ID: <3a6f4f2a-c440-4bb9-b23d-bf013643c303@canonical.com>
Date: Tue, 23 Jun 2026 00:46:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <WN7WCYIYDTU4.W5VLAKCJWJ3Q2@mailcore-77ff78dfb9-6kk5j>
Content-Language: en-US
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <WN7WCYIYDTU4.W5VLAKCJWJ3Q2@mailcore-77ff78dfb9-6kk5j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Subject: Re: [apparmor] Questions about Contributing
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[lists.ubuntu.com,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	TO_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	ARC_NA(0.00)[];
	HAS_REPLYTO(0.00)[john.johansen@canonical.com];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:replyto,canonical.com:mid,hfa.cc:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 919F46B4F53

T24gNS8yOC8yNiAxOTozMiwgYWVucmkgd3JvdGU6DQo+IEhpIGFsbCwNCj4gDQo+IA0KPiAN
Cj4gDQo+IEkndmUgcmVjZW50bHkgcnVuIGludG8gYSBsaW1pdGF0aW9uIHdoaWxlIHRyeWlu
ZyB0byBjb25maWd1cmUgQXBwQXJtb3IgZm9yIHVzZSB3aXRoIG5vbi1GSFMgZmlsZXN5c3Rl
bSBsYXlvdXRzLCBzdWNoIGFzIChhbmQgcGFydGljdWxhcmx5IGZvciBteSB1c2UtY2FzZSkg
Tml4LCB3aGVyZSBiaW5hcmllcyBsaXZlIHVuZGVyIC9uaXgvc3RvcmUvPGhhc2g+L2JpbiBp
bnN0ZWFkIG9mIHRoZSB0eXBpY2FsIC91c3IvYmluLiBJIGJlbGlldmUgSSd2ZSB0cmFjZWQg
aXQgdG8gYSBtaW5vciBzaG9ydGZhbGwgaW4gZXhlY3V0YWJsZSBmbGFnIGNvbmZsaWN0IHJl
c29sdXRpb247IHRoZSBtZWNoYW5pc20gaXRzZWxmIGlzIGFuIG90aGVyd2lzZSBlZmZlY3Rp
dmUgYW5kIHJlYXNvbmFibGUgc29sdXRpb24sIGhvd2V2ZXIgYWxsIHBhdGhzIHdpdGggd2ls
ZGNhcmRzwqBhbnl3aGVyZcKgd2l0aGluIHRoZSBwYXRoIGFyZSB0cmVhdGVkIHRoZSBleGFj
dCBzYW1lIHdpdGhpbiBoZmEuY2MgLyBwcmlfdXBkYXRlX3Blcm0uIFRoaXMgbGVhZHMgdG8g
c3lzdGVtLWJyZWFraW5nIGNvbmZsaWN0cyBhbmQgdW5uZWNlc3NhcnkgZmFpbHVyZXMgdG8N
Cg0KY29ycmVjdCB0aGVyZSBpcyBhbiBpc3N1ZSB3aXRoIGRvbWluYW5jZSByZXNvbHV0aW9u
LCBhdG0gaXQgb25seSB3b3JrcyBmb3IgZXhhY3QgbWF0Y2ggcGF0aHMuIE9uZSBwb3RlbnRp
YWwgd29yayBhcm91bmQgaXMgdG8gdXNlIHByaW9yaXR5IHJ1bGVzDQoNCj4gY29tcGlsZSBE
RkEgcHJvZmlsZXMgZGVzcGl0ZSBvbmUgcGF0aCBiZWluZyBkZXRlcm1pbmlzdGljYWxseSBh
bmQNCj4gcHJvdmFibHkgbW9yZSBzcGVjaWZpYy4gVW5kZXIgRkhTIGxheW91dHMsIHRoaXMg
d291bGQgb25seSByYXJlbHksIGlmIGV2ZXIsIGJlIGFuIGlzc3VlLCBob3dldmVyIHdpdGgg
Tml4J3Mgbm9uLUZIUyBsYXlvdXQgaXQncyBtb3N0IGVmZmVjdGl2ZSB0byB1c2UgYSB3aWxk
Y2FyZCB0byBpbmNsdWRlIGFsbCAvbml4L3N0b3JlLzxoYXNoPi9iaW4gZm9sZGVycyBhcyBA
e2Jpbn0gZW50cmllcywgYXMgb3Bwb3NlZCB0byBnZW5lcmF0aW5nIGFuIGV2ZXItY2hhbmdp
bmcgZ2lnYW50aWMgZmlsZSBpbmNsdWRpbmcgZXZlcnkgTml4IHN0b3JlIGZvbGRlciBhcyBh
biBAe2Jpbn0gZW50cnkuwqBGb3IgZXhhbXBsZSwgL25peC9zdG9yZS8qL2Jpbi9mb28gYW5k
IC9uaXgvc3RvcmUvKi9iaW4vKiBhcmUgYm90aCBldmFsdWF0ZWQgdGhyb3VnaMKgYWFyZV9y
dWxlcy5oK2MgaW50byBNYXRjaEZsYWdzLCBhbmQgdGh1cyBib3RoIGhhdmUgdGhlIHNhbWUg
bG93IHByaW9yaXR5IHdoZW4gYXR0ZW1wdGluZyB0byBtZXJnZSBleGVjdXRhYmxlIGZsYWdz
LCBkZXNwaXRlIC9uaXgvc3RvcmUvKi9iaW4vZm9vIGJlaW5nIGEgZGV0ZXJtaW5pc3RpY2Fs
bHkgbW9yZSBzcGVjaWZpYyBwYXRoIHdoaWNoIHNob3dzIGludGVudCB0byBtb2RpZnkgdGhl
IHBlcm1pc3Npb25zIGZvciB0aGUgc3BlY2lmaWMgTml4LWRpc3RyaWJ1dGVkIGJpbmFyeS4g
SSd2ZSBpbnZlc3RpZ2F0ZWQgYSBwb3NzaWJsZSBzb2x1dGlvbiB0aGF0IGxlYXZlcyBydW50
aW1lIGVuZm9yY2VtZW50IGFuZCBhbGwgY29uZmxpY3QtZnJlZSBwYXRocyB1bmFmZmVjdGVk
IHdoaWxlIGNvbXBpbGluZyBERkEgcHJvZmlsZXMsIGJ1dCBJIHRob3VnaHQgaXQgd291bGQg
YmUgYmVzdCB0byBzZWUgaWYgdGhlcmUgYXJlIGFueSBwb3NpdGl2ZS9uZWdhdGl2ZSBvcGlu
aW9ucyBmcm9tIHRoZSBtYWludGFpbmVycyBvbiB0aGlzIGlkZWEgYmVmb3JlIHB1c2hpbmcg
dG9vIGZhciBvbiBjb2RlIG9yIHN1Ym1pdHRpbmcgc29tZSByYW5kb20gUFIuDQo+IA0KPiAN
Cj4gDQo+IA0KPiBNeSBpZGVhIGlzIHRvIGFkZCBvbiB0byB0aGUgYmVoYXZpb3Igb2YgcGVy
bXNfdCBhbmQgcHJpX3VwZGF0ZV9wZXJtIGluIG9yZGVyIHRvIHJlc29sdmUgY29uZmxpY3Rz
IGJldHdlZW4gdHdvIGRpZmZlcmVudCBNYXRjaEZsYWdzIGJ5IHRyYXZlcnNpbmcgdGhlIHJl
Z2V4IEFTVCBvZiBib3RoIG1hdGNoaW5nIGl0ZW1zIGFuZCBkZXRlcm1pbmluZyBzdWJzZXQg
cmVsYXRpb25zaGlwcyBiZXR3ZWVuIHRoZW0gb25seSBhdCBjb21waWxlIHRpbWUgb24gYSBj
b25mbGljdC4gVGhpcyBzdWJzZXQgcmVsYXRpb25zaGlwIChlLmcuIC9uaXgvc3RvcmUvKi9i
aW4vZm9vIGlzIGEgc3Vic2V0IG9mIC9uaXgvc3RvcmUvKi9iaW4vKiwgYW5kIHRodXMgbW9y
ZSBzcGVjaWZpYykgaXMgdGhlbiB1c2VkIHRvIHByaW9yaXRpemUgdGhlIG1vcmUgc3BlY2lm
aWMgTWF0Y2hGbGFnLiBJbiBhIGNhc2Ugd2hlcmUgbm8gc3Vic2V0IHJlbGF0aW9uc2hpcCBj
YW4gYmUgZGV0ZXJtaW5lZCAoZS5nLiBwYXR0ZXJucyB0aGF0IG92ZXJsYXAgYnV0IHdoZXJl
IG5laXRoZXIgZW50aXJlbHkgY29udGFpbnMgdGhlIG90aGVyKSwgd2Ugd291bGQgZmFsbCBi
YWNrIHRvIHRoZSBleGlzdGluZyBjb25mbGljdC9lcnJvciBiZWhhdmlvci4gQ29uc2lkZXJp
bmcgdGhlIGluZnJlcXVlbmN5IHdpdGggd2hpY2ggY29uZmxpY3RzIG9jY3VyLCBldmVuIHVu
ZGVyIE5peCzCoEkgd291bGQgZXhwZWN0IHRoaXMgdG8gaGF2ZSBuZWdsaWdpYmxlIGlmwqBh
bnkgbm90aWNlYWJsZSBwZXJmb3JtYW5jZSBlZmZlY3RzIGF0IERGQSBjb21waWxlIHRpbWUs
IGFuZCBubyBwZXJmb3JtYW5jZSBlZmZlY3RzIGR1cmluZyBydW50aW1lIGVuZm9yY2VtZW50
LiBUaGF0IHNhaWQsIHdoZW4gdGhleSBkbyBvY2N1ciB0aGV5J3JlIG9mdGVuIHNldmVyZTsg
aW4gbXkgY2FzZSwgZW5vdWdoIHByb2ZpbGVzIGZhaWxlZCB0byBjb21waWxlIHRvIGxlYXZl
IG15IHN5c3RlbSBjb21wbGV0ZWx5IHVudXNhYmxlIHdpdGhvdXQgZGlzYWJsaW5nIEFwcEFy
bW9yLg0KDQpTbyB5ZXMsIHRoaXMgaXMgZmluZGluZyB0aGUgcnVsZSBkb21pbmFuY2UuIEl0
IGlzIG9uIHRoZSBsaXN0IG9mIHRvZG8gaXRlbXMuIFRoZSBpbXBhY3QgaXQgd291bGQgaGF2
ZSB3b3VsZCBncmVhdGx5IGRlcGVuZCBvbiB0aGUgbnVtYmVyIG9mIHN0YXRlcy9ydWxlcyB0
aGF0IG5lZWRzIHRvIGJlIHJlc29sdmVkLCBidXQgbGlrZSB5b3Ugc2FpZCBpZiBkb25lIHJp
Z2h0IGl0IHNob3VsZG4ndCBzbG93IHRoaW5ncyBkb3duIHRvbyBtdWNoLCBhbmQgdGhhdCBp
cyBiZXR0ZXIgdGhhbiBub3QgY29tcGlsaW5nLg0KDQpUaGlzIGlzIGluZGVlZCBnb2luZyB0
byBiZSBtdWNoIG1vcmUgb2YgYW4gaXNzdWUgaW4gdGhlIGZ1dHVyZSwgc28gaXQgaXMgc29t
ZXRoaW5nIHRoYXQgbmVlZHMgdG8gYmUgZG9uZSBzb29uLg0KDQo+IA0KPiANCj4gDQo+IA0K
PiBTb21lIHF1ZXN0aW9ucyBhYm91dCB0aGlzIHByb2Nlc3M6DQo+IA0KPiANCj4gLSBEb2Vz
IHRoaXMgYXBwcm9hY2ggc2VlbSBzb3VuZD8gSXMgdGhlcmUgc29tZSBjb250ZXh0IEknbSBt
aXNzaW5nIGFib3V0IHdoeSBleGVjdXRhYmxlIGZsYWcgcHJpb3JpdHkgaXMgc2ltcGx5IGV4
YWN0IHZzIG5vbi1leGFjdCB2ZXJzdXMgYW4gYXBwcm9hY2ggc2ltaWxhciB0byB0aGlzPw0K
DQp0aGlzIHdvdWxkIHJlcGxhY2UgZXhhY3Qvbm9uLWV4YWN0IHdoaWNoIHdhcyBhIGhhY2sg
dG8gcHJvdmlkZSB0aGlzIGJlaGF2aW9yIGZvciB0aGUgZXhhY3QgbWF0Y2ggY2FzZSwgd2hp
Y2ggaXMgdGhlIG1vc3QgY29tbW9uDQoNCj4gLSBXaGVuIEkgaGF2ZSBhIHBhdGNoLCB3b3Vs
ZCB5b3UgYWxsIHByZWZlciBhIEdpdExhYiBQUiBvciBhIHBhdGNoIHNlbnQgdG8gdGhlIGxp
c3Q/DQoNCmVpdGhlciB3b3JrcywgdGhvdWdoIGdpdGxhYiBpcyBnb2luZyB0byBnZXQgcmVw
bGllcyBzb29uZXIgYXMgaXQgaXMgbW9yZSBhY3RpdmUsIGFuZCBtb3JlIG9mIHRoZSBkZXZl
bG9wZXJzIGFyZSB3b3JraW5nIHRoZXJlDQoNCj4gLSBJcyB0aGVyZSBhbnkgZXhpc3Rpbmcg
ZGlzY3Vzc2lvbiBvciB3b3JrIG9uIHRoaXMgdGhhdCBJJ3ZlIG1pc3NlZCBvciBzaG91bGQg
YmUgYXdhcmUgb2YgYmVmb3JlIHdvcmtpbmcgb24gdGhpcyBwYXRjaD8NCj4gDQp0aGVyZSBp
cyBzb21lIGV4aXN0aW5nIGRpc2N1c3Npb24gYXJvdW5kIGZpeGluZyBkb21pbmFuY2UsIHRo
ZXJlIGFyZSBldmVuIHNvbWUgb2xkIHBhdGNoZXMgdGhhdCBuZWVkIHRvIGJlIGNvbXBsZXRl
bHkgcmV3b3JrZWQgbm93LCBzbyB0aGV5IGFyZW4ndCByZWFsbHkgdXNlZnVsDQoNCj4gDQo+
ID4gDQo+IEknbSBvcGVuIHRvIGFueSBjb21tZW50cywgcXVlc3Rpb25zLCBvciBjb25jZXJu
cyBhYm91dCB0aGlzLCBJJ2QgcHJlZmVyIHRvIGFsaWduIG9uIGRpcmVjdGlvbiB0aGFuIHRv
IGNvbWUgaW4gd2l0aCBhIGJsaW5kIFBSIHRoYXQgbm8gb25lIHdhbnRzIG9yIG5lZWRzLiBJ
J2QgYmUgaGFwcHkgdG8gd3JpdGUgdXAgZnVydGhlciBhYm91dCB0aGUgY2hhbmdlcyBJJ2Qg
YmUgbWFraW5nIHRvIGFjaGlldmUgdGhpcyBhcyB3ZWxsIQ0KPiANCg0KVGhlIGNoYW5nZSB3
b3VsZCBiZSBhIG1lYW5zIHRvIHRyYWNrIHRoZSBydWxlLCBpbiB0aGUgYWNjZXB0IG5vZGUv
c3RhdGUgKGEgc2V0KS4gVW5pb25pbmcgdGhlIHNldHMgd2hlbiBjcmVhdGluZyB0aGUgYWNj
ZXB0IHN0YXRlL3Blcm1zLCBhbmQgdGhlbiBhIGNvbmZsaWN0IHJlc29sdXRpb24gcm91dGlu
ZSBpZiB5b3UgaGl0IGEgY29uZmxpY3QuDQoNCkdlbmVyYWxseSBzcGVha2luZyB0aGlzIGhh
cyBiZWVuIHdhaXRpbmcgb24gdXMgdG8gZmluaXNoIHRoZSBmcm9udCBlbmQgcmVmYWN0b3Jp
bmcgYnV0IHRoaXMgY291bGQgYmUgZG9uZSBqdXN0IGZvciB4IHJ1bGVzIGF0bSwgdXNpbmcg
dGhlIHBvaW50ZXJzIHRvIGNvZF9lbnRyaWVzIGluIHRoZSBzZXQuDQoNCg0KPiANCj4gDQo+
IA0KPiANCj4gVGhhbmsgeW91LA0KPiANCj4gQWVucmkgTG92ZWhhcnQNCg0K


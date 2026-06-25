Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MYzuABSLPWrt3wgAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 25 Jun 2026 22:09:56 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 876EB6C877A
	for <lists+apparmor@lfdr.de>; Thu, 25 Jun 2026 22:09:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wcqOG-0002hz-0u; Thu, 25 Jun 2026 20:09:36 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1wcqOE-0002fN-1U
 for apparmor@lists.ubuntu.com; Thu, 25 Jun 2026 20:09:34 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AC0743F471
 for <apparmor@lists.ubuntu.com>; Thu, 25 Jun 2026 20:09:33 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2c804e38c65so2987665ad.2
 for <apparmor@lists.ubuntu.com>; Thu, 25 Jun 2026 13:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782418172; x=1783022972;
 h=organization:autocrypt:subject:from:to:content-language:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Re8z9Vz7k3Vt2r6kzkTDsIBYcvGWx/ZNJYtbCR0QuDw=;
 b=qUe+q03/Kje0cnoJaldUMEwtyfGFea8/u4NLIjo2NfGP5kUcXBu3euPUiwL+0RZvGj
 RXbwdL8HBdow/Jnz6OZoBt79lJKPTZYzVjYLkgCK1Av06pzUK1evjIl63z+qNgHAFwAh
 8WUhPEXdTrKm2Ny0Y0UtyUj0b0p1nwI1yBChqIzfFsiNAVrpfOSs7WTCK0p90Z4RC2VT
 3l0XYrdTn+8kUb31rIXJZ6FsH10BUvH9PEemJbVL0azwuFn3+t73QJXUx1FvVu5pGZKt
 uk9sAEkN7xwqko8mou+0MRCif6KTC1cHJ1N6OnxGT7RFdQh3+mzjvRs0mOp7jxGXpI98
 0LyQ==
X-Gm-Message-State: AOJu0YzfJjn3hcLy6xtqVPozEiDiAPVOMluHGIcAp36r1BzF8hTvb/qt
 c3w5HL/9YKU9HHf34ObDdrrtbMQXLdteJeXwZYV93iB1/jHKol18RzwqReuz9nv5gLsm8vdemwK
 bEKqElGNlPFV5QxdVELTb0027Ae92UJbVYSE6b5lL/NhCbrb4nYKR8buxHepSEK96OudRzkrgkO
 IaVZLela90VA==
X-Gm-Gg: AfdE7cnI7c+ndUn8c0wc2uMPDB8CaXrWR+lVMZuHEK68bge8mgK3RpGN8HWf/YPveON
 KXB4MCtgteVSbUvVoZFBjRBbF/1D5fQFb+ghX8Zyu32UtfQBMicZj/+TPEcQnoQm+NvuuFLrAOc
 gf75+QFZRNyQWVDE2nH+PUVtl83OVqhAIodEfwl0l8k21+mfTmmdiDLtgDAf/7E52o/OE8e9keD
 rbsMfejJCnwXH3PkXRhpMd+uTUUj4JRguvboW6DHADwfAuqgWc/Q7T+5MwVbEwKBL07p6set6XI
 ALOL/mAYrQcIkqIwYq4YF2QuiJSv6saAjjvSaXuxUs2msvSw11EyH8GSPgxM3oU8kWHzRtlY0Zk
 SHN3ah3HDQ+QVY0p+1qzO8vvjbQ==
X-Received: by 2002:a17:902:f641:b0:2c8:be9:1d9a with SMTP id
 d9443c01a7336-2c80be91efemr17233085ad.10.1782418171709; 
 Thu, 25 Jun 2026 13:09:31 -0700 (PDT)
X-Received: by 2002:a17:902:f641:b0:2c8:be9:1d9a with SMTP id
 d9443c01a7336-2c80be91efemr17232705ad.10.1782418171105; 
 Thu, 25 Jun 2026 13:09:31 -0700 (PDT)
Received: from [192.168.192.71] ([50.47.147.90])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2c7f6518bb1sm26110905ad.84.2026.06.25.13.09.29
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 13:09:30 -0700 (PDT)
Message-ID: <75621600-a087-4888-8aaf-3011732cad1b@canonical.com>
Date: Thu, 25 Jun 2026 13:09:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: apparmor <apparmor@lists.ubuntu.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ScBFBi0CZr03rxYRvP33cKhQ"
Subject: [apparmor] New co-maintainer
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
X-Spamd-Result: default: False [-2.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[lists.ubuntu.com,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_EQ_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	RCPT_COUNT_ONE(0.00)[1];
	HAS_ORG_HEADER(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	HAS_REPLYTO(0.00)[john.johansen@canonical.com];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:from_smtp,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 876EB6C877A

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ScBFBi0CZr03rxYRvP33cKhQ
Content-Type: multipart/mixed; boundary="------------QfujCixok7sb26YejRoIHM0B";
 protected-headers="v1"
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Message-ID: <75621600-a087-4888-8aaf-3011732cad1b@canonical.com>
Subject: New co-maintainer

--------------QfujCixok7sb26YejRoIHM0B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

R2VvcmdpYSBHYXJjaWEgPGdlb3JnaWEuZ2FyY2lhQGNhbm9uaWNhbC5jb20+IGlzIG5vdyBh
IGNvLW1haW50YWluZXIgb2YgdGhlIGFwcGFybW9yIHByb2plY3QsIGJvdGggaW4gdXNlcnNw
YWNlLCBhbmQgbW9yZSBpbXBvcnRhbnRseSBpbiB0aGUga2VybmVsLg0KDQpUaGlzIHNob3Vs
ZCBoZWxwIGFsbGV2aWF0ZSBzb21lIG9mIHRoZSBiYWNrbG9nIHByb2JsZW1zIHdlIGhhdmUg
aGFkIGxhdGVseS4NCg0KVGhhbmsgeW91IEdlb3JnaWEgZm9yIHN0ZXBwaW5nIHVwIGFuZCBo
ZWxwaW5nIHRha2Ugb24gdGhpcyByZXNwb25zaWJpbGl0eS4NCg0KamoNCg0KDQo=

--------------QfujCixok7sb26YejRoIHM0B--

--------------ScBFBi0CZr03rxYRvP33cKhQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE7cSDD705q2rFEEf7BS82cBjVw9gFAmo9ivkFAwAAAAAACgkQBS82cBjVw9jt
8A/+PrVU055hCdJtfCKHXJ2CnIdSeaQ/K0ABwIC1C5E35ijiD2Mz3laCKLt6QVeOn2o64mq8BCdC
YSplOMPYKq3jLfMrsZHuZrDPR5tbrdsWOfvTdJGmfEZ0bNGFbYA9ldqHejc081ZkqEvLip+eFh8R
xyCteyAYn0IrWOELqnzPNRJAwJ+xLkHbVqySx2QBkiJHWpvHaw/qxWKmLvVU2UYvv83m0c+iJtsA
RBiENKM9oF1id5op2JrIuHAWGdlEiKigoxmuGgBK+FhcutIWTnWbuKCcWnOaTGnR4oVRWr+2hE1q
c9nmRwIh3kEs/rx+/1ohxgun4ZxY9YlRQeUs7EpqPbc6xs4iTF3n0KoxqKryfIVp/SLaeGm9HzLl
KQtyNTSynOllXsp+VoodCig1BWgdyVLmlmGq7KlRtgJt/BDx/fFIcBjcCZHRH3ka41CXTwNA0A2P
KhLFy2tLsD4AuxT9FTqEE16lwZMFD7z5JeXoUQumj94afX1ooMBQ4MmJ69OY00Kbvla+iLsnxJJQ
/vzNW+kqJm1mDLg/35tA0lM0/T6VivCGDuk/jg1XaG+CzJYgddXP+bl8tILI1uWPvAK8atVEfbqP
cUXI2vqFO0Y5+ZPwhPzVGWC2mOiJgCuOsWtV8ZRh1wdCu14tipTjjwzfbHSrTA3Ic1va+igOCCqS
uYI=
=9DOJ
-----END PGP SIGNATURE-----

--------------ScBFBi0CZr03rxYRvP33cKhQ--


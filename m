Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D9115EFCB1
	for <lists+apparmor@lfdr.de>; Tue,  5 Nov 2019 12:52:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iRxNk-0007xQ-Ot; Tue, 05 Nov 2019 11:52:20 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1iRxNi-0007xH-Vv
 for apparmor@lists.ubuntu.com; Tue, 05 Nov 2019 11:52:18 +0000
Received: from static-50-53-33-191.bvtn.or.frontiernet.net ([50.53.33.191]
 helo=[192.168.192.153]) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>)
 id 1iRxNi-0003rM-Hj; Tue, 05 Nov 2019 11:52:18 +0000
To: Lioh Moeller <lioh.moeller@gmx.ch>, apparmor@lists.ubuntu.com
References: <01382d4a-46ab-1dcb-9ea4-98b447b29d31@gmx.ch>
From: John Johansen <john.johansen@canonical.com>
Openpgp: preference=signencrypt
Autocrypt: addr=john.johansen@canonical.com; prefer-encrypt=mutual; keydata=
 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
Organization: Canonical
Message-ID: <b19cf79c-e217-b417-4885-a11985b29bc5@canonical.com>
Date: Tue, 5 Nov 2019 03:52:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <01382d4a-46ab-1dcb-9ea4-98b447b29d31@gmx.ch>
Content-Language: en-GB
Subject: Re: [apparmor] /.load missing
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

T24gMTEvNS8xOSAzOjM2IEFNLCBMaW9oIE1vZWxsZXIgd3JvdGU6Cj4gSGkgYWxsLgo+IAo+IEkg
YW0gdHJ5aW5nIHRvIHJ1biBBcHBBcm1vciBvbiBteSBzeXN0ZW0uIEkgaGF2ZSBjb21waWxlZCBB
cHBBcm1vciBzdXBwb3J0IGludG8gdGhlIGtlcm5lbCBidXQgd2hpbGUgdHJ5aW5nIHRvIHN0YXJ0
IHRoZSBzZXJ2aWNlIEkgZ290IGFuIGVycm9yIG1lc3NhZ2UgYmVjYXVzZSAvc3lzL2tlcm5lbC9z
ZWN1cml0eS8ubG9hZCBpcyBtaXNzaW5nOgo+IAo+IGh0dHBzOi8vdGVybWJpbi5jb20vOGdzago+
IAoKL3N5cy9rZXJuZWwvc2VjdXJpdHkvLmxvYWQgaXMgdGhlIHdyb25nIGxvY2F0aW9uCgppZiBz
ZWN1cml0eWZzIGlzIG1vdW50ZWQgYXQgL3N5cy9rZXJuZWwvc2VjdXJpdHkgdGhlbiBhcHBhcm1v
ciB3aWxsIGNyZWF0ZSBhIGRpcmVjdG9yeSB3aXRoaW4gaXQgYW5kIHdpdGhpbiB0aGUgYXBwYXJt
b3IgZGlyZWN0b3J5IHdpbGwgYmUgdGhlIC5sb2FkIGZpbGUKCmllLiB0aGUgbG9jYXRpb24gc2hv
dWxkIGJlCgovc3lzL2tlcm5lbC9zZWN1cml0eS9hcHBhcm1vci8ubG9hZAoKeW91IGNhbiB0ZWxs
IGlmIGFwcGFybW9yIGhhcyBzdWNjZXNzZnVsbHkgaW5pdGlhbGl6ZWQgYnkgdGhlIGZvbGxvd2lu
ZyBtZXNzYWdlcyBzaG93aW5nIHVwIGluIGRtZXNnCgpBcHBBcm1vciBpbml0aWFsaXplZAoKd2hp
Y2ggd2lsbCBzaG93IHVwIGlmIHRoZSBMU00gbW9kdWxlIHN1Y2Nlc3NmdWxseSByZWdpc3RlcmVk
LCBpZiBub3QgcHJlc2VudCBlbnN1cmUgYXBwYXJtb3IgaXMgY29uZmlnZWQgaW4gdGhlIGtlcm5l
bCBhbmQgdGhhdCBpdCBpcyBiZWluZyB1c2VkIG9uIGJvb3QgKHRoZSBjb25maWcgb3Igc2VjdXJp
dHk9IG9yIGxzbT0gZGVwZW5kaW5nIG9uIHlvdXIga2VybmVsIHZlcnNpb24pCgphbmQKCkFwcEFy
bW9yIEZpbGVzeXN0ZW0gRW5hYmxlZAoKd2hpY2ggd2lsbCBzaG93IHVwIGlmIGFwcGFybW9yIGNh
biBzdWNjZXNzZnVsbHkgc2V0dXAgaXRzIGZpbGVzeXN0ZW0gaW50ZXJmYWNlcwoKLS0gCkFwcEFy
bW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5n
cyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlz
dGluZm8vYXBwYXJtb3IK

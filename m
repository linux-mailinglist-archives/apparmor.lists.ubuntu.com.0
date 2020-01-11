Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC81138115
	for <lists+apparmor@lfdr.de>; Sat, 11 Jan 2020 12:20:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iqEou-0002BN-9r; Sat, 11 Jan 2020 11:20:44 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1iqEos-0002B2-NM
 for apparmor@lists.ubuntu.com; Sat, 11 Jan 2020 11:20:42 +0000
Received: from static-50-53-33-191.bvtn.or.frontiernet.net ([50.53.33.191]
 helo=[192.168.192.153]) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>)
 id 1iqEor-0004Vs-Kg; Sat, 11 Jan 2020 11:20:41 +0000
To: sylvain@chicoree.fr
References: <20200111082533.Horde.-q_htOKjOvSwJY_kRNitnGs@webmail.inetadmin.eu>
 <87e7a580-2566-2c6c-1ddb-16299edddd63@chicoree.fr>
 <20200111114055.Horde.984aXMehtnxciKhdF658KMC@webmail.inetadmin.eu>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
Message-ID: <495900db-9a9e-dea0-e9c2-366ea5c71dae@canonical.com>
Date: Sat, 11 Jan 2020 03:20:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200111114055.Horde.984aXMehtnxciKhdF658KMC@webmail.inetadmin.eu>
Content-Language: en-GB
Subject: Re: [apparmor] Patching a system profile for a specific user
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
Cc: apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

T24gMS8xMS8yMCAyOjQwIEFNLCBhenVyaXRAcG9ib3guc2sgd3JvdGU6Cj4gQ2l0w6F0IFN5bHZh
aW4gTGVyb3V4IDxzeWx2YWluQGNoaWNvcmVlLmZyPjoKPiAKPj4gVGhhbmtzIGF6dXIsCj4+Cj4+
IE9uIDExLzAxLzIwMjAgMDg6MjUsIGF6dXJpdEBwb2JveC5zayB3cm90ZToKPj4+IGp1c3QgcHV0
IHRoaXMgaW4gL2V0Yy9hcHBhcm1vci5kL2xvY2FsL3Vzci5iaW4udGh1bmRlcmJpcmQgOgo+Pj4g
b3duZXIgQHtIT01FfS8uc2lnbmF0dXJlLmQvKiogciwKPj4KPj4KPj4gTXkgaXNzdWUgaXMgSSBk
b24ndCB3YW50IHRvIGNoYW5nZSB0aGUgc3lzdGVtIGNvbmZpZ3VyYXRpb24uCj4gCj4gCj4gVGhp
cyBpc250JyBwb3NzaWJsZS4gVGhhdCBmaWxlIGlzIHVzZWQgdG8gbG9jYWwgY2hhbmdlcyBvbmx5
IGFuZCB3b24ndCBiZSByZXBsYWNlZCB3aXRoIHVwZGF0ZXMuCj4gCj4gCj4gCj4+IMKgSSB3b3Vs
ZCBsaWtlIHRvIGdyYW50IHRoZSBleHRyYSBwZXJtaXNzaW9uICpvbmx5KiBmb3IgdGhlIHVzZXIg
dGhhdCBuZWVkcyBpdC4KPiAKPiBTbyBkbyB0aGlzOgo+IAo+IG93bmVyIC9ob21lL3NwZWNpZmlj
X3VzZXIvLnNpZ25hdHVyZS5kLyoqIHIsCj4gCgp0aGlzIGlzIHlvdXIgYmVzdCBiZXQgYXRtLCB5
b3UgY2FuIGRvIGl0IHdpdGhvdXQgbW9kaWZ5aW5nIHRoZSBwcm9maWxlIGJ5IGFkZGluZwphIHNp
dGUgc3BlY2lmaWMgcnVsZSBpZiB5b3UgYXJlIHVzaW5nIGFueSBzb21ld2hhdCBtb2Rlcm4gdmVy
c2lvbiBvZiB0aGUgcHJvZmlsZS4KCllvdSBjYW4gY2hlY2sgYnkgbG9va2luZyBmb3IgdGhlIGZv
bGxvd2luZyBydWxlCgogICMgU2l0ZS1zcGVjaWZpYyBhZGRpdGlvbnMgYW5kIG92ZXJyaWRlcy4g
U2VlIGxvY2FsL1JFQURNRSBmb3IgZGV0YWlscy4KICAjaW5jbHVkZSA8bG9jYWwvdXNyLmJpbi50
aHVuZGVyYmlyZD4KCnlvdSBjYW4gZHJvcCB0aGUgYWJvdmUgcnVsZQoKICBvd25lciAvaG9tZS9z
cGVjaWZpY191c2VyLy5zaWduYXR1cmUuZC8qKiByLAoKaW50byB0aGUgL2V0Yy9hcHBhcm1vci5k
L2xvY2FsL3Vzci5iaW4udGh1bmRlcmJpcmQgZmlsZSAoaWYgaXQgZG9lc24ndCBleGlzdApqdXN0
IGNyZWF0ZSBpdCkgYW5kIHRoaXMgd2lsbCBnaXZlIHlvdSB5b3VyIHNpdGUgc3BlY2lmaWMgcnVs
ZSB3aXRob3V0IGhhdmluZwp0byBtb2RpZnkgdGhlIHByb2ZpbGUuCgoKU2VlIG15IG90aGVyIG1h
aWwgZm9yIGEgZGlmZmVyZW50IG1vcmUgaW52b2x2ZWQgd2F5IHRvIGRvIGl0LgoKLS0gCkFwcEFy
bW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5n
cyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlz
dGluZm8vYXBwYXJtb3IK

Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EDA404031
	for <lists+apparmor@lfdr.de>; Wed,  8 Sep 2021 22:29:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mO4CL-0008O3-4u; Wed, 08 Sep 2021 20:29:33 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1mO4CJ-0008Ne-Ea
 for apparmor@lists.ubuntu.com; Wed, 08 Sep 2021 20:29:31 +0000
Received: from [192.168.192.153] (unknown [50.45.173.99])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id C31FE40178; 
 Wed,  8 Sep 2021 20:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631132971;
 bh=XqLMJhyNkv4lm32lcaLzpSGinwt4rxk/C6MFc9h66Uc=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=ouQgWofz4ftfm07blUnnMYBFz2XK4dpi8jw2FU53w0zFijdPpEICIOHmN0slilzRc
 jfLUbQIlxqhQr8mfbbdz8ktgXRx+6ftqCQjaaGqu05YSKnVCSFPpC1Kh1wh7p75ZwO
 xp01UlxgRrbjbOVA0mKIz+TX9fzpQe1Q44e90eKgr/ET2463zIi3NBqHMLd1ck0S4k
 i1Is7v+TGUfd1Tv0DwVIyHZDH5N15EiRNJR23LwVWBSDpunDlkCd+5VBJ1LiEF09XB
 E5/oS/Kt2nmJVpMQ7pXefuvXYRlHWjto9L4mL2yeGkVCGrj7FxjCBbDtUe0F1sUjeG
 raSkwIEX0+0lw==
To: Christian Boltz <apparmor@cboltz.de>, apparmor@lists.ubuntu.com
References: <87pmtkop58.fsf@manticora.bergerie.taz>
 <3415835.JB2sseZfvn@tux.boltz.de.vu>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
Message-ID: <e39e45bd-9e51-623c-8e6e-4ea34400c842@canonical.com>
Date: Wed, 8 Sep 2021 13:29:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3415835.JB2sseZfvn@tux.boltz.de.vu>
Content-Language: en-US
Subject: Re: [apparmor] Deprecating the Perl bindings?
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

T24gOS84LzIxIDEyOjEzIFBNLCBDaHJpc3RpYW4gQm9sdHogd3JvdGU6Cj4gSGVsbG8sCj4gCj4g
QW0gRGllbnN0YWcsIDcuIFNlcHRlbWJlciAyMDIxLCAwODo1MDoyNyBDRVNUIHNjaHJpZWIgaW50
cmlnZXJpOgo+PiBBcyBmYXIgYXMgSSBjYW4gdGVsbCwgaW4gdGhlIHVwc3RyZWFtIGNvZGUgYmFz
ZSwgYWEtbm90aWZ5IHdhcyB0aGUKPj4gb25seSB0aGluZyB0aGF0IGRlcGVuZGVkIG9uIHRoZSBQ
ZXJsIGJpbmRpbmdzIHRvIGxpYmFwcGFybW9yLgo+PiBJdCdzIGJlZW4gcG9ydGVkIHRvIFB5dGhv
biBzbyB0aGF0J3Mgbm90IHRoZSBjYXNlIGFueW1vcmUuCj4+Cj4+IFdpdGggbXkgRGViaWFuIGhh
dCBvbiwgSSBjYW4gc2F5IHRoYXQgc2hpcHBpbmcgdGhlIFBlcmwgYmluZGluZ3MKPj4gKGxpYmFw
cGFybW9yLXBlcmwpIG1ha2VzIHNvbWUgc3R1ZmYgbW9yZSBjb21wbGljYXRlZCwgZm9yIGV4YW1w
bGUgZm9yCj4+IGFkZGluZyBjcm9zcy1idWlsZGluZyBzdXBwb3J0LiBTbyBJJ20gY29uc2lkZXJp
bmcgZHJvcHBpbmcgdGhlbToKPj4gaHR0cHM6Ly9idWdzLmRlYmlhbi5vcmcvOTkzNTY1Cj4+Cj4+
IFdoYXQgd291bGQgYmUgdGhlIGRyYXdiYWNrcyBvZiBkcm9wcGluZyB0aGUgUGVybCBiaW5kaW5n
cyB1cHN0cmVhbT8KPj4KPj4gQXJlIHdlIGF3YXJlIG9mIGNvZGUgdGhhdCB1c2VzIHRoZW0/IElu
IG9wZW5TVVNFIHRvb2xpbmcsIHBlcmhhcHM/Cj4gCj4gSGlzdG9yaWNhbGx5IHRoZSBZYVNUMiBB
cHBBcm1vciBtb2R1bGUgdXNlZCB0aGUgcGVybCBiaW5kaW5ncyAoYW5kIGV2ZW4gCj4gdGhlIG9s
ZCBwZXJsIG1vZHVsZXMpLCBidXQgc2luY2Ugc2V2ZXJhbCB5ZWFycyBZYVNUIGlzIGJhaXNjYWxs
eSBhIAo+IGdyYXBoaWNhbCBmcm9udGVuZCB0byAgIGFhLWdlbnByb2YgLS1qc29uICAgZXRjLiAt
IGFuZCB0aGF0IHdheSBzb2x2ZWQgCj4gbW9yZSB0aGFuIG9uZSBwcm9ibGVtLiBJIHdhcyBldmVu
IGFibGUgdG8gZG8gYSAicmVtb3RlIGJ1Z2ZpeCIgdG8gWWFTVCAKPiBieSBmaXhpbmcgc29tZXRo
aW5nIGluIGFhLWdlbnByb2YgOy0pCj4gCj4gSSdtIG5vdCBzdXJlIGlmIG90aGVyIHBhY2thZ2Vz
IHVzZSB0aGUgcGVybCBiaW5kaW5ncyAodW5mb3J0dW5hdGVseSBJIAo+IGNhbiBvbmx5IGVhc2ls
eSBmaW5kIG91dCB3aGF0IGRlcGVuZHMgb24gQXBwQXJtb3IsIGJ1dCBub3QgaW5kaXZpZHVhbGx5
IAo+IGZvciB0aGUgcGVybC1hcHBhcm1vciBzdWJwYWNrYWdlKS4gQXQgbGVhc3Qgb24gbXkgbGFw
dG9wLCBJIGNvdWxkIAo+IHVuaW5zdGFsbCBwZXJsLWFwcGFybW9yIHdpdGhvdXQgY29tcGxhaW50
cy4KPiAKPj4gQXJlIHdlIGNvbmZpZGVudCB0aGV5J2xsIGtlZXAgd29ya2luZywgZXZlbiB0aG91
Z2ggd2UgZG9uJ3QgYWN0aXZlbHkKPj4gdXNlIHRoZW0gdXBzdHJlYW0gYW55bW9yZT8KPiAKPiBX
ZWxsLCB3ZSBkaWRuJ3QgZ2V0IGFueSBidWdyZXBvcnRzIDstKSB3aGljaCBjYW4gbWVhbgo+IC0g
aXQgd29ya3MKPiAtIG5vYm9keSB1c2VzIGl0ICAgb3IKPiAtIGl0J3MgYnJva2VuIGFuZCBub2Jv
ZHkgdXNlcyBpdAo+IAo+PiBJZiB3ZSB3YW50IHRvIGRyb3AgdGhlbSB1cHN0cmVhbSwgd2hhdCB3
b3VsZCBiZSBhIHN1aXRhYmxlIGRlcHJlY2F0aW9uCj4+IHByb2Nlc3MgYW5kIHRpbWVsaW5lPyBX
b3VsZCBpdCBiZSBzdWZmaWNpZW50IHRvIGFubm91bmNlIHRoaXMgb24gdGhpcwo+PiBtYWlsaW5n
IGxpc3QgYW5kIGRyb3AgdGhlbSBpbiB0aGUgbmV4dCBtYWpvciByZWxlYXNlPwo+IAo+IEFzIGxv
bmcgYXMgaXQgZG9lc24ndCBjYXNlIGxvdHMgb2Ygd29yaywgSSdkIHRlbmQgdG8ga2VlcCB0aGUg
cGVybCAKPiBiaW5kaW5ncyB1cHN0cmVhbS4gVGhpcyBpcyBub3QgYSBzdHJvbmcgdm90ZSwgc28g
aWYgd2Ugd2FudCB0byBhZGQgYSAKPiBkZXByZWNhdGlvbiBub3RlIChzbyB0aGF0IHdlIGNhbiBz
YXkgInRvbGQgeW91IHNvIiB3aGVuZXZlciB0aGUgcGVybCAKPiBiaW5kaW5ncyBjYXVzZSB1cyBo
ZWFkYWNoZXMpLCBJJ20gYWxzbyBmaW5lIHdpdGggdGhhdC4KPiAKCkFzIGFuIHVwc3RyZWFtIHdl
IGFyZSB2ZXJ5IHNsb3cgdG8gZHJvcCB0aGluZ3MsIGFuZCBhcyBhIGdlbmVyYWwgcnVsZQp3ZSBo
YXZlIHRvIGdvIHRocm91Z2ggYSBkZXByZWNhdGlvbiBwcm9jZXNzLiBTbyB0aGUgcGVybCBiaW5k
cyBhcmVuJ3QKZ29pbmcgdG8gYmUgZHJvcHBlZCBhdCBsZWFzdCBpbiB0aGUgc2hvcnQgdGVybS4K
CldlIGNhbiBjZXJ0YWlubHkgc3RhcnQgdGhlIGRpc2N1c3Npb24gb2Ygd2hldGhlciB0aGV5IHNo
b3VsZCBiZSBkZXByZWNhdGVkCgoKPiBBdCB0aGUgc2FtZSB0aW1lIC0gaWYgdGhlIHBlcmwgYmlu
ZGluZ3MgY2F1c2UgeW91IG1ham9yIGhlYWRhY2hlcyBvbiAKPiBEZWJpYW4sIGZlZWwgZnJlZSB0
byBkcm9wIC0td2l0aC1wZXJsLgo+IAoKeWVzLCB0aGlzIGlzIHRoZSBpbW1lZGlhdGUgc29sdXRp
b24gZm9yIGRlYmlhbi4gQW5kIHdlIGNhbiB0YWtlIHRoYXQKYXMgYSBkYXRhIHBvaW50IGZvciB0
aGUgZGVwcmVjYXRpb24gZGlzY3Vzc2lvbi4KCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBw
QXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6
IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

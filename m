Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A74E8137C14
	for <lists+apparmor@lfdr.de>; Sat, 11 Jan 2020 08:25:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iqB9P-0003rc-FG; Sat, 11 Jan 2020 07:25:39 +0000
Received: from server00.inetadmin.eu ([109.74.156.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <azurit@pobox.sk>) id 1iqB9K-0003r0-Gr
 for apparmor@lists.ubuntu.com; Sat, 11 Jan 2020 07:25:34 +0000
Received: from localhost (server00.inetadmin.eu [109.74.156.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: azurit@elbiahosting.sk)
 by server00.inetadmin.eu (Postfix) with ESMTPSA id 53A0A13A880
 for <apparmor@lists.ubuntu.com>; Sat, 11 Jan 2020 08:25:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.sk;
 s=dkiminetadmin; t=1578727533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=zwBeLr1g0DPt0UZNISMPEqGvp+Uee1a4tcihxP9y4nY=;
 b=OotrLrSlxkvKgH5AQPojhctpT/kRUiwLnA9vKiSDS10mEI9HdGqzF+ITL4rWxlpTWJw4gm
 0+GJjR80aIlrqeSjNY7QYYFbApDfdGGbH6DH22ubZzpTR3VsMaKlu46tW2eyjB3v/1UlPE
 Mu/NuRHYtOrK4UQBd5fYzAXM4JfFQWE=
Received: from [217.12.54.210] ([217.12.54.210]) by webmail.inetadmin.eu
 (Horde Framework) with HTTPS; Sat, 11 Jan 2020 08:25:33 +0100
Date: Sat, 11 Jan 2020 08:25:33 +0100
Message-ID: <20200111082533.Horde.-q_htOKjOvSwJY_kRNitnGs@webmail.inetadmin.eu>
From: azurit@pobox.sk
To: apparmor@lists.ubuntu.com
In-Reply-To: <f189a6f3-80f8-6acc-62c3-06408bcef190@chicoree.fr>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
Content-Disposition: inline
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="Yes"
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

SGksCgpqdXN0IHB1dCB0aGlzIGluIC9ldGMvYXBwYXJtb3IuZC9sb2NhbC91c3IuYmluLnRodW5k
ZXJiaXJkIDoKb3duZXIgQHtIT01FfS8uc2lnbmF0dXJlLmQvKiogciwKCgphenVyCgoKCgpDaXTD
oXQgU3lsdmFpbiBMZXJvdXggPHN5bHZhaW5AY2hpY29yZWUuZnI+OgoKPgo+IEhpIGV2ZXJ5b25l
LAo+Cj4gSSdtIGEgc2Vhc29uZWQgTGludXggYWRtaW5pc3RyYXRvciBidXQgSSBoYXZlIGxpdHRs
ZSBwcmlvciBleHBlcmllbmNlCj4gd2l0aCBBcHBBcm1vci4gIEZXSVcsIEkgYWxyZWFkeSBoYXZl
IGFza2VkIHRoaXMgcXVlc3Rpb24gb24gdGhlCj4gU3VwZXJVc2VyIFN0YWNrRXhjaGFuZ2Ugd2Vi
IHNpdGUgdGhpcyBhZnRlcm5vb24gWzFdLCAgYnV0IGl0IHJlY2VpdmVkCj4gbGl0dGxlIGludGVy
ZXN0LCBhbmQgSSBub3cgaGF2ZSBsaXR0bGUgaG9wZXMgdG8gaGF2ZSBhbiBhbnN3ZXIgdGhlcmUu
Cj4KPiBPdXIgTGludXggRGViaWFuIGJveGVzIGhhdmUgYSBzdGFuZGFyZCBwb2xpY3kgZm9yIHRo
ZSBUaHVuZGVyYmlyZAo+IGVtYWlsIGNsaWVudCBpbiBgL2V0Yy9hcHBhcm1vci5kL3Vzci5iaW4u
dGh1bmRlcmJpcmRgCj4KPiBPbmUgdXNlciBuZWVkcyBUaHVuZGVyYmlyZCB0byBoYXZlIHJlYWQg
YWNjZXNzIHRvIHRoZSBmaWxlcyBzdG9yZWQgaW4KPiBoaXMgYCR7SE9NRX0vc2lnbmF0dXJlLmQv
YCBmb2xkZXIuIElzIHRoZXJlIGEgd2F5IHRvIGNyZWF0ZSBhCj4gdXNlci1zcGVjaWZpYyBwcm9m
aWxlIHRoYXQgX2luY2x1ZGVzXyB0aGUgZGVmYXVsdCBwcm9maWxlIHNldHRpbmdzLAo+IGJ1dCBn
cmFudGluZyBleHRyYSBhY2Nlc3MgdGhlIHRoZSBuZWVkZWQgZmlsZXM/IEkgZGlkbid0IGZpbmQg
YW55Cj4gcmVmZXJlbmNlIGFib3V0IHRoYXQgcGFydGljdWxhciB1c2UgY2FzZSwgYW5kIG15IGZp
cnN0IGF0dGVtcHRzIHdlcmUKPiB1bnN1Y2Nlc3NmdWwuIEJ1dCBJIGNhbid0IHNheSBpZiBteSBz
eW50YXggd2FzIHdyb25nLCBvZiBpZiB0aGlzCj4gd2Fzbid0IHBvc3NpYmxlIGF0IGFsbC4gSGVy
ZSB3aGF0IEkgdHJpZWQ6Cj4KPgo+IGBgYAo+ICQgY2F0ICIke0hPTUV9Ly5hcHBhcm1vci5kL3Vz
ci5iaW4udGh1bmRlcmJpcmQiCj4KPiAjaW5jbHVkZSA8L2V0Yy9hcHBhcm1vci5kL3Vzci5iaW4u
dGh1bmRlcmJpcmQ+Cj4KPiBwcm9maWxlIHRodW5kZXJiaXJkIEB7dGh1bmRlcmJpcmRfZXhlY3V0
YWJsZX0gewo+ICAgb3duZXIgQHtIT01FfS8uc2lnbmF0dXJlLmQvKiogciwKPiB9Cj4KPiAkIHN1
ZG8gc3lzdGVtY3RsIHJlc3RhcnQgYXBwYXJtb3IKPgo+IGBgYAo+Cj4KPiBUaGlzIGRvZXNuJ3Qg
c2VlbSB0byBjaGFuZ2UgYW55dGhpbmcuIEF0IHN1Y2ggcG9pbnQgSSBkb24ndCB0aGluayB0aGUK
PiB1c2VyLXNwZWNpZmljIHByb2ZpbGUgaXMgcmVhZCBhdCBhbGwuIENvdWxkIHlvdSBoZWxwIG1l
IGZpeGluZyB0aGF0Pwo+Cj4KPiBUaGFua3MgYSBsb3QsCj4gLSAtIFN5bHZhaW4gTGVyb3V4Cj4K
Pgo+Cj4gWzFdCj4gaHR0cHM6Ly9zdXBlcnVzZXIuY29tL3F1ZXN0aW9ucy8xNTE2MTgxL2NvbmZp
Z3VyZS1hcHBhcm1vci10by1hbGxvdy1maWxlLWFjY2Vzcy1vbi1hLXBlci11c2VyLWJhc2lzCj4K
PiAtIC0tCj4gLSAtLSBTeWx2YWluIExlcm91eAo+IC0gLS0gc3lsdmFpbkBjaGljb3JlZS5mcgo+
IC0gLS0gaHR0cDovL3d3dy5jaGljb3JlZS5mcgo+IC0tCj4gQXBwQXJtb3IgbWFpbGluZyBsaXN0
Cj4gQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQo+IE1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNj
cmliZSBhdDogIAo+IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2Fw
cGFybW9yCgoKCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50
dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVi
dW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5D15F699E
	for <lists+apparmor@lfdr.de>; Thu,  6 Oct 2022 16:32:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ogRuq-0006D0-1Y; Thu, 06 Oct 2022 14:32:00 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <david.laight@aculab.com>) id 1ogOQj-0004lA-Br
 for apparmor@lists.ubuntu.com; Thu, 06 Oct 2022 10:48:41 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-405-DgXWoVwcNIW55WKjoHfY8Q-1; Thu, 06 Oct 2022 11:48:39 +0100
X-MC-Unique: DgXWoVwcNIW55WKjoHfY8Q-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Thu, 6 Oct
 2022 11:48:37 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.040; Thu, 6 Oct 2022 11:48:37 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christian Brauner' <brauner@kernel.org>, Kees Cook <keescook@chromium.org>
Thread-Topic: [PATCH 1/2] fs/exec: Explicitly unshare fs_struct on exec
Thread-Index: AQHY2WLGFfe2CPUaDEa6axdLVGgCBq4BLZlw
Date: Thu, 6 Oct 2022 10:48:36 +0000
Message-ID: <cd4c600f91404387bb7be0d727c3c337@AcuMS.aculab.com>
References: <20221006082735.1321612-1-keescook@chromium.org>
 <20221006082735.1321612-2-keescook@chromium.org>
 <20221006090506.paqjf537cox7lqrq@wittgenstein>
In-Reply-To: <20221006090506.paqjf537cox7lqrq@wittgenstein>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Thu, 06 Oct 2022 14:31:58 +0000
Subject: Re: [apparmor] [PATCH 1/2] fs/exec: Explicitly unshare fs_struct on
	exec
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
Cc: Micah Morton <mortonm@chromium.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrei Vagin <avagin@gmail.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Xin Long <lucien.xin@gmail.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Fenghua Yu <fenghua.yu@intel.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Eric Paris <eparis@parisplace.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jorge Merlino <jorge.merlino@canonical.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Richard Haines <richard_c_haines@btinternet.com>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Prashanth Prahlad <pprahlad@redhat.com>, Todd Kjos <tkjos@google.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

RnJvbTogQ2hyaXN0aWFuIEJyYXVuZXINCj4gU2VudDogMDYgT2N0b2JlciAyMDIyIDEwOjA1DQo+
IA0KPiBPbiBUaHUsIE9jdCAwNiwgMjAyMiBhdCAwMToyNzozNEFNIC0wNzAwLCBLZWVzIENvb2sg
d3JvdGU6DQo+ID4gVGhlIGNoZWNrX3Vuc2FmZV9leGVjKCkgY291bnRpbmcgb2Ygbl9mcyB3b3Vs
ZCBub3QgYWRkIHVwIHVuZGVyIGEgaGVhdmlseQ0KPiA+IHRocmVhZGVkIHByb2Nlc3MgdHJ5aW5n
IHRvIHBlcmZvcm0gYSBzdWlkIGV4ZWMsIGNhdXNpbmcgdGhlIHN1aWQgcG9ydGlvbg0KPiA+IHRv
IGZhaWwuIFRoaXMgY291bnRpbmcgZXJyb3IgYXBwZWFycyB0byBiZSB1bm5lZWRlZCwgYnV0IHRv
IGNhdGNoIGFueQ0KPiA+IHBvc3NpYmxlIGNvbmRpdGlvbnMsIGV4cGxpY2l0bHkgdW5zaGFyZSBm
c19zdHJ1Y3Qgb24gZXhlYywgaWYgaXQgZW5kcyB1cA0KPiANCj4gSXNuJ3QgdGhpcyBhIHBvdGVu
dGlhbCB1YXBpIGJyZWFrPyBBZmFpY3QsIGJlZm9yZSB0aGlzIGNoYW5nZSBhIGNhbGwgdG8NCj4g
Y2xvbmV7M30oQ0xPTkVfRlMpIGZvbGxvd2VkIGJ5IGFuIGV4ZWMgaW4gdGhlIGNoaWxkIHdvdWxk
IGhhdmUgdGhlDQo+IHBhcmVudCBhbmQgY2hpbGQgc2hhcmUgZnMgaW5mb3JtYXRpb24uIFNvIGlm
IHRoZSBjaGlsZCBlLmcuLCBjaGFuZ2VzIHRoZQ0KPiB3b3JraW5nIGRpcmVjdG9yeSBwb3N0IGV4
ZWMgaXQgd291bGQgYWxzbyBhZmZlY3QgdGhlIHBhcmVudC4gQnV0IGFmdGVyDQo+IHRoaXMgY2hh
bmdlIGhlcmUgdGhpcyB3b3VsZCBubyBsb25nZXIgYmUgdHJ1ZS4gU28gYSBjaGlsZCBjaGFuZ2lu
ZyBhDQo+IHdvcmtkaW5nIGRpcmVjdG9ybyB3b3VsZCBub3QgYWZmZWN0IHRoZSBwYXJlbnQgYW55
bW9yZS4gSU9XLCBhbiBleGVjIGlzDQo+IGFjY29tcGFuaWVkIGJ5IGFuIHVuc2hhcmUoQ0xPTkVf
RlMpLiBNaWdodCBzdGlsbCBiZSB3b3J0aCB0cnlpbmcgb2ZjIGJ1dA0KPiBpdCBzZWVtcyBsaWtl
IGEgbm9uLXRyaXZpYWwgdWFwaSBjaGFuZ2UgYnV0IHRoZXJlIG1pZ2h0IGJlIGZldyB1c2Vycw0K
PiB0aGF0IGRvIGNsb25lezN9KENMT05FX0ZTKSBmb2xsb3dlZCBieSBhbiBleGVjLg0KDQpUaGUg
dGhvdWdodCBvZiB0aGF0IGlzIGVudGlyZWx5IGhvcnJpZC4uLg0KDQpJIHByZXN1bWUgYSBzdWlk
IGV4ZWMgd2lsbCBmYWlsIGluIHRoYXQgY2FzZT8NCg0KSWYgdGhlIG9sZCBjb2RlIGlzIHRyeWlu
ZyB0byBjb21wYXJlIHRoZSBudW1iZXIgb2YgdGhyZWFkcw0Kd2l0aCB0aGUgbnVtYmVyIG9mIHVz
ZXJzIG9mIHRoZSBmcyB0YWJsZSBpc24ndCBpcyBqdXN0IGJ1Z2d5Pw0KSWYgYSB0aHJlYWQgdW5z
aGFyZXMgdGhlIGZzIHRhYmxlIHRoZXJlIGNhbiBiZSBhbm90aGVyDQpyZWZlcmVuY2Ugc29tZXdo
ZXJlIGVsc2UgLSB3aGljaCBpcyB3aGF0IChJIHByZXN1bWUpIGlzIGJlaW5nDQp0ZXN0ZWQgZm9y
Lg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJv
YWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24g
Tm86IDEzOTczODYgKFdhbGVzKQ0K



Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE572FA22D
	for <lists+apparmor@lfdr.de>; Mon, 18 Jan 2021 14:52:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1l1UxP-0000TX-Hy; Mon, 18 Jan 2021 13:52:35 +0000
Received: from concert.kaist.ac.kr ([143.248.38.112] helo=0x010.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <namjh@0x010.com>) id 1l1UxN-0000TQ-OZ
 for apparmor@lists.ubuntu.com; Mon, 18 Jan 2021 13:52:34 +0000
Received: from [172.30.1.22] (unknown [175.213.77.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 0x010.com (Postfix) with ESMTPSA id 48F181DE6;
 Mon, 18 Jan 2021 22:52:26 +0900 (KST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
From: Jaehyun Nam <namjh@0x010.com>
In-Reply-To: <585698da-4478-7e4f-aef0-1b162c4287bb@chicoree.fr>
Date: Mon, 18 Jan 2021 22:52:25 +0900
Message-Id: <07AF83BD-C9A8-42D7-A796-CEFD3EE9ED6F@0x010.com>
References: <61146E87-5EDE-4909-AC6F-E0573114680A@0x010.com>
 <585698da-4478-7e4f-aef0-1b162c4287bb@chicoree.fr>
To: Sylvain Leroux <sylvain@chicoree.fr>
X-MailScanner-ID: 48F181DE6.AA619
X-MailScanner: Found to be clean
X-MailScanner-From: namjh@0x010.com
X-Spam-Status: No
Subject: Re: [apparmor] Supporting network permissions and address
 expressions?
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

SGVsbG8gU3lsdmFpbiwKClRoaXMgaXMgdGhlIHByb2ZpbGUgdGhhdCBJIHRyaWVkIHRvIGFwcGx5
CgphYmkgPGFiaS8zLjA+LAoKI2luY2x1ZGUgPHR1bmFibGVzL2dsb2JhbD4KCnByb2ZpbGUgdGVz
dCAvaG9tZS9uYW1qaC9hcHBhcm1vci10ZXN0L2FwcGFybW9yLWJhc2gvYmFzaCB7CiAgI2luY2x1
ZGUgPGFic3RyYWN0aW9ucy9iYXNlPgogICNpbmNsdWRlIDxhYnN0cmFjdGlvbnMvYmFzaD4KICAj
aW5jbHVkZSA8YWJzdHJhY3Rpb25zL2NvbnNvbGVzPgoKICAjZGVueSAvYmluL3RvdWNoIHgsCiAg
ZGVueSAvYmluL3NsZWVwIHgsCgogICNkZW55IG5ldHdvcmsgdGNwIGRzdCAxNzIuMTYuOTkuMTA2
LAogICNkZW55IG5ldHdvcmsgdGNwIGRzdCAxNzIuMTYuOTkuMTA2OjgwLAogICNkZW55IG5ldHdv
cmsgdGNwIHNyYyAxNzIuMTYuOTkuMTA1IGRzdCAxNzIuMTYuOTkuMTA2LAogIGRlbnkgbmV0d29y
ayB0Y3Agc3JjIDE3Mi4xNi45OS4xMDU6KiBkc3QgMTcyLjE2Ljk5LjEwNjo4MCwKfQoKV2hlbiBJ
IGNvbW1lbnRlZCBvdXQgYWxsIG5ldHdvcmsgcnVsZXMsIGl0IHdvcmtlZCBmaW5lLgpIb3dldmVy
LCBvbmNlIEkgZW5hYmxlZCBlYWNoIG9mIHRoZSBuZXR3b3JrIHJ1bGVzLCBJIGdvdCB0aGlzIGVy
cm9yIG1lc3NhZ2UuCgpBcHBBcm1vciBwYXJzZXIgZXJyb3IgZm9yIC9ldGMvYXBwYXJtb3IuZC9h
cHBhcm1vci1iYXNoLXByb2ZpbGUgaW4gcHJvZmlsZSAvZXRjL2FwcGFybW9yLmQvYXBwYXJtb3It
YmFzaC1wcm9maWxlIGF0IGxpbmUgMTY6IHN5bnRheCBlcnJvciwgdW5leHBlY3RlZCBUT0tfSUQs
IGV4cGVjdGluZyBUT0tfRU5EX09GX1JVTEUKClRoYW5rcywKSmFlaHl1bgoKCj4gMjAyMS4gMS4g
MTguIOyYpO2bhCAxMDo0MSwgU3lsdmFpbiBMZXJvdXggPHN5bHZhaW5AY2hpY29yZWUuZnI+IOye
keyEsToKPiAKPiBIaSBKYWVoeXVuLAo+IAo+IENvdWxkIHlvdSBwb3N0IHRoZSBwcm9maWxlIHdp
dGggeW91ciBjaGFuZ2VzPwo+IAo+IFJlZ2FyZHMsCj4gLSBTeWx2YWluCj4gCj4gT24gMTgvMDEv
MjAyMSAxMjo1NSwgSmFlaHl1biBOYW0gd3JvdGU6Cj4+IEhlbGxvIGFsbCwKPj4gCj4+IEnigJlt
IHRyeWluZyB0byB1c2UgbmV0d29yayBwZXJtaXNzaW9ucyBhbmQgaXAgYWRkcmVzcyBleHByZXNz
aW9ucyBpbiBBcHBBcm1vciBwcm9maWxlcy4KPj4gVW5mb3J0dW5hdGVseSwgd2hlbmV2ZXIgSSB0
cmllZCB0byBhcHBseSBzdWNoIHRoaW5ncywgQXBwQXJtb3Igc2hvd2VkIAo+PiDigJxzeW50YXgg
ZXJyb3IsIHVuZXhwZWN0ZWQgVE9LX0lELCBleHBlY3RpbmcgVE9LX0VORF9PRl9SVUxF4oCdLgo+
PiAKPj4gV2hpbGUgdGhvc2Ugc3ludGF4ZXMgYXJlIGRlc2NyaWJlZCBpbiB0aGUgYXBwYXJtb3Ig
Y29yZSBwb2xpY3kgcmVmZXJlbmNlLAo+PiBpdCBzZWVtcyB0aGF0IHRoZXJlIGlzIG5vIGNvcnJl
c3BvbmRpbmcgc3ludGF4IGV2ZW4gaW4gYXBwYXJtb3ItMy4wLjAtMHVidW50dTEgKHdpdGggTGlu
dXggS2VybmVsIDUuOC4wLTM4LWdlbmVyaWMsIFVidW50dSAyMC4xMCkuCj4+IAo+PiBDb3VsZCBh
bnlvbmUgaGVscCBtZSBzb2x2ZSB0aGlzIHByb2JsZW0/Cj4+IAo+PiBUaGFua3MsCj4+IEphZWh5
dW4KPj4gCgoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUu
Y29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVu
dHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

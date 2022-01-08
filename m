Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE2348851B
	for <lists+apparmor@lfdr.de>; Sat,  8 Jan 2022 18:51:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1n6Fry-0006JS-3b; Sat, 08 Jan 2022 17:51:10 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jkb@jkbsc.co.uk>) id 1n6Frs-0006JK-FB
 for apparmor@lists.ubuntu.com; Sat, 08 Jan 2022 17:51:04 +0000
Received: (Authenticated sender: jkb@jkbsc.co.uk)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 0A248240005
 for <apparmor@lists.ubuntu.com>; Sat,  8 Jan 2022 17:51:03 +0000 (UTC)
Date: Sat, 8 Jan 2022 17:51:02 +0000
From: John Beattie <jkb@jkbsc.co.uk>
To: apparmor@lists.ubuntu.com
Message-ID: <20220108175102.GA316223@fladday.local>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [apparmor] loading a user version of a profile in place of the
	system profile
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

SGksCgpUaGFua3MgZm9yIGFwcGFybW9yLCBpdCBpcyB2ZXJ5IHVzZWZ1bC4KCkkgZ2V0IHR3byBi
ZWhhdmlvdXJzIHdoaWNoIGVuY291cmFnZSBtZSB0byB0cnkgdG8gbWFrZSBhIHNwZWNpYWxpc2Vk
IHByb2ZpbGUgZm9yCm9wZW4gb2ZmaWNlLCBmaXJzdCB0aGF0IEkgZ2V0IEFMTE9XRUQgd2Fybmlu
Z3MgaW4gbG9nd2F0Y2ggYW5kIHNlY29uZCwgb3BlbgpvZmZpY2UgZG9lc24ndCBzdGFydCBwcm9w
ZXJseS4gIEkgdGhpbmsgdGhhdCB0aGUgc3BsYXNoIHdpbmRvdyBkb2Vzbid0IGZpbmlzaApwcm9w
ZXJseS4gIFRoaXMgaXNuJ3QgYSBibG9ja2VyLiBJZiBJIHN3aXRjaCB0byB0aGUgZG9jdW1lbnQg
d2luZG93LCBldmVyeXRoaW5nCmlzIGZpbmUuCgpJIGhhdmUgYSBzbGlnaHRseSBjdXN0b21pc2Vk
IHZlcnNpb24gb2YgdXNyLmxpYi5saWJyZW9mZmljZS5wcm9ncmFtLm9vc3BsYXNoIGFuZAp1c3Iu
bGliLmxpYnJlb2ZmaWNlLnByb2dyYW0uc29mZmljZS5iaW4gd2hpY2ggSSBoYXZlIHBsYWNlZCBh
dCB+Ly5hcHBhcm1vci5kLy4KVGhleSBkbyB3b3JrLCBpZiBJIGxvYWQgdGhlbSB3aXRoIGFwcGFy
bW9yX3BhcnNlci4gIFRoZXkgd29yayBpbiB0aGUgc2Vuc2UgdGhhdApuZWl0aGVyIG9mIHRoZSBh
Ym92ZSBiZWhhdmlvdXJzIGlzIHNlZW4uCgpBZnRlciBhIHJlYm9vdCwgSSBzYXcgdGhhdCBhcHBh
cm1vciB3YXNuJ3QgdXNpbmcgbXkgcHJvZmlsZXMsIHNvIEkgdGhvdWdodCBvZgpjbGVhcmluZyB0
aGUgYXBwYXJtb3IgY2FjaGUsIHNvIEkgcmFuIHRoZXNlIGNvbW1hbmRzCgojIGFhLXRlYXJkb3du
CiMgc2VydmljZSBhcHBhcm1vciBzdG9wCiMgcm0gL3Zhci9jYWNoZS9hcHBhcm1vci5kL25ubm5u
LyogICAgIyBubm5uIG5hbWVzIHRoZSBhY3R1YWwgY2FjaGUsIEkgZ3Vlc3MKIyBzZXJ2aWNlIGFw
cGFybW9yIHN0YXJ0CgoKSG93ZXZlciwgbXkgdXNlciBwcm9maWxlIHdhcyBzdGlsbCBub3QgdXNl
ZCBmb3Igb3BlbiBvZmZpY2UsIEkgZ2V0IHRoZSBBTExPV0VECndhcm5pbmdzIGluIGtlcm4ubG9n
LgoKTXkgdXNlY2FzZSBpcyB0aGF0IEkgd291bGQgbGlrZSBhIHNwZWNpYWxpc2VkIHZlcnNpb24g
b2YgYSBzeXN0ZW0gcHJvZmlsZSB0byBiZQp1c2VkIGZvciBvcGVuIG9mZmljZSB3aGVuIG9wZW4g
b2ZmaWNlIGlzIHVzZWQgYnkgbWUuCgpJJ3ZlIGxvb2tlZCBpbiB0aGUgd2lraSBidXQgc28gZmFy
IGFsbCBJIGhhdmUgZm91bmQgaXMgdGhlIHBvbGljeSBsYXlvdXQgcGFnZQoKaHR0cHM6Ly9naXRs
YWIuY29tL2FwcGFybW9yL2FwcGFybW9yLy0vd2lraXMvUG9saWN5X0xheW91dAoKYW5kIGl0IHRl
bGxzIG1lIHRoYXQgJHtBUFBBUk1PUi5EfSBpcyB1c2VkIHRvIHJlZmVyIGJvdGggdG8gdGhlIGRp
cmVjdG9yeSBpbiB+CmFuZCB0aGUgb25lIGluIC9ldGMgYnV0IHdpdGhvdXQgZGlzdGluZ3Vpc2hp
bmcgdGhlbS4KClBsZWFzZSB3b3VsZCBzb21lb25lIHBvaW50IG1lIGF0IHRoZSBkb2N1bWVudGF0
aW9uIHdoaWNoIGRlc2NyaWJlcyB0aGUgbG9hZGluZwpzZXF1ZW5jZSByZWxldmFudCB0byBteSB1
c2VjYXNlPwoKCk1hbnkgdGhhbmtzLApKb2huIEJlYXR0aWUKCi0tIApBcHBBcm1vciBtYWlsaW5n
IGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJz
Y3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFy
bW9yCg==

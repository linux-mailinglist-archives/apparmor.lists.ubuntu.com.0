Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C7038DD03
	for <lists+apparmor@lfdr.de>; Sun, 23 May 2021 22:55:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lkv8O-0006M3-IF; Sun, 23 May 2021 20:55:40 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1lkv8M-0006Lr-Rc
 for apparmor@lists.ubuntu.com; Sun, 23 May 2021 20:55:38 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lkv8M-0007ty-2Y
 for <apparmor@lists.ubuntu.com>; Sun, 23 May 2021 20:55:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 10D2D2E8041
 for <apparmor@lists.ubuntu.com>; Sun, 23 May 2021 20:55:38 +0000 (UTC)
MIME-Version: 1.0
Date: Sun, 23 May 2021 20:50:07 -0000
From: Gunnar Hjalmarsson <1928360@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=lubuntu-default-settings; status=New;
 importance=Undecided; assignee=None; 
X-Launchpad-Bug: product=ubuntukylin; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=apparmor; component=main; 
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=language-selector;
 component=main; status=Fix Released; importance=Undecided;
 assignee=gunnarhj@ubuntu.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: feng-kylin gunnarhj janitor seth-arnold
X-Launchpad-Bug-Reporter: Gunnar Hjalmarsson (gunnarhj)
X-Launchpad-Bug-Modifier: Gunnar Hjalmarsson (gunnarhj)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
Message-Id: <162180300752.387.5561159657605634866.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ba75dbf44f1013379e594c259682f14c0528180a"; Instance="production"
X-Launchpad-Hash: 3f3070fa36711a429da80b8b1fc0cdc07a27d42a
Subject: [apparmor] [Bug 1928360] Re: Switch to Fcitx 5 for Chinese
X-BeenThere: apparmor@lists.ubuntu.com
X-Mailman-Version: 2.1.20
List-Id: AppArmor discussion <apparmor.lists.ubuntu.com>
List-Unsubscribe: <https://lists.ubuntu.com/mailman/options/apparmor>,
 <mailto:apparmor-request@lists.ubuntu.com?subject=unsubscribe>
List-Archive: <https://lists.ubuntu.com/archives/apparmor>
List-Post: <mailto:apparmor@lists.ubuntu.com>
List-Help: <mailto:apparmor-request@lists.ubuntu.com?subject=help>
List-Subscribe: <https://lists.ubuntu.com/mailman/listinfo/apparmor>,
 <mailto:apparmor-request@lists.ubuntu.com?subject=subscribe>
Reply-To: Bug 1928360 <1928360@bugs.launchpad.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

QFNldGg6IEkgc3VwcG9zZSB0aGF0IHRoZSBERU5JRUQgZmlsZSBJIGF0dGFjaGVkIGluIGNvbW1l
bnQgIzcgZG9lcyBub3QKaGVscCBtdWNoLgoKRmNpdHggNSBpcyBhIHNlcGFyYXRlIHByb2Nlc3Ms
IGkuZS4gL3Vzci9iaW4vZmNpdHg1IGFzIG9wcG9zZWQgdG8KL3Vzci9iaW4vZmNpdHguIFdoZW4g
aW4gQ2hyb21pdW0gaXQgYmVoYXZlcyBhcyBpZiBmY2l0eDUgZG9lcyBub3QgZXhpc3QsCmV2ZW4g
aWYgdGhlIHByb2Nlc3MgcnVucyBhbmQgSSBjYW4gdXNlIGZjaXR4NSBpbiBvdGhlciBhcHBsaWNh
dGlvbnMuIEkKY2FuJ3QgZXZlbiBzd2l0Y2ggdG8gYSBmY2l0eDUgaW5wdXQgbWV0aG9kIGVuZ2lu
ZSB3aGVuIGluIENocm9taXVtLCBsZXQKYWxvbmUgdXNlIHN1Y2ggYW4gaW5wdXQgZW5naW5lIGZv
ciB0eXBpbmcuIE1heWJlIHRoYXQgZXhwbGFpbnMgd2h5Cm5vdGhpbmcgZmNpdHg1IHJlbGF0ZWQg
aXMgcmVmbGVjdGVkIGFzIERFTklFRCBsaW5lcy4KCkknbSB0aGlua2luZyB0aGF0IG1heWJlIHRo
ZXJlIGlzIGEgbmVlZCB0byBjcmVhdGUgdGhlIGZjaXR4NSBhbmQKZmNpdHg1LXN0cmljdCBhYnN0
cmFjdGlvbnMgdXNpbmcgdGhlIGFscmVhZHkgZXhpc3RpbmcgZmNpdHggYW5kIGZjaXR4LQpzdHJp
Y3QgYWJzdHJhY3Rpb25zIGFzIG1vZGVscy4KCi0tIApZb3UgcmVjZWl2ZWQgdGhpcyBidWcgbm90
aWZpY2F0aW9uIGJlY2F1c2UgeW91IGFyZSBhIG1lbWJlciBvZiBBcHBBcm1vcgpEZXZlbG9wZXJz
LCB3aGljaCBpcyBzdWJzY3JpYmVkIHRvIHRoZSBidWcgcmVwb3J0LgpodHRwczovL2J1Z3MubGF1
bmNocGFkLm5ldC9idWdzLzE5MjgzNjAKClRpdGxlOgogIFN3aXRjaCB0byBGY2l0eCA1IGZvciBD
aGluZXNlCgpTdGF0dXMgaW4gTHVidW50dSBkZWZhdWx0IHNldHRpbmdzOgogIE5ldwpTdGF0dXMg
aW4gVWJ1bnR1IEt5bGluOgogIEluIFByb2dyZXNzClN0YXR1cyBpbiBhcHBhcm1vciBwYWNrYWdl
IGluIFVidW50dToKICBOZXcKU3RhdHVzIGluIGxhbmd1YWdlLXNlbGVjdG9yIHBhY2thZ2UgaW4g
VWJ1bnR1OgogIEZpeCBSZWxlYXNlZAoKQnVnIGRlc2NyaXB0aW9uOgogIEluIERlYmlhbiAxMSBG
Y2l0eCA1IHdpbGwgYmUgdGhlIGRlZmF1bHQgSU0gZnJhbWV3b3JrIGZvciBDaGluZXNlIG9uCiAg
bm9uLUdOT01FIGRlc2t0b3BzLiBJIGNhbiB0aGluayBpdCdzIHRpbWUgdG8gbWFrZSB0aGUgZXF1
aXZhbGVudAogIGNoYW5nZXMgaW4gVWJ1bnR1IDIxLjEwIGFzIHdlbGwuCgogIEknZCBhcHByZWNp
YXRlIGlucHV0IG9uIHRoZSB0b3BpYyBmcm9tIHRoZSBVYnVudHUgS3lsaW4gdGVhbSBhcyB3ZWxs
CiAgYXMgb3RoZXIgQ2hpbmVzZSBzcGVha2luZyB1c2Vycy4KClRvIG1hbmFnZSBub3RpZmljYXRp
b25zIGFib3V0IHRoaXMgYnVnIGdvIHRvOgpodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9sdWJ1
bnR1LWRlZmF1bHQtc2V0dGluZ3MvK2J1Zy8xOTI4MzYwLytzdWJzY3JpcHRpb25zCgotLSAKQXBw
QXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRp
bmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9s
aXN0aW5mby9hcHBhcm1vcgo=

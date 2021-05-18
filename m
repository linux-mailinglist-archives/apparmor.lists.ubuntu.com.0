Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E743880BA
	for <lists+apparmor@lfdr.de>; Tue, 18 May 2021 21:45:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lj5ew-00021i-Lu; Tue, 18 May 2021 19:45:42 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1lj5ev-00020w-1l
 for apparmor@lists.ubuntu.com; Tue, 18 May 2021 19:45:41 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lj5et-0002o2-AR
 for <apparmor@lists.ubuntu.com>; Tue, 18 May 2021 19:45:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 401BA2E8188
 for <apparmor@lists.ubuntu.com>; Tue, 18 May 2021 19:45:39 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 18 May 2021 19:39:48 -0000
From: Gunnar Hjalmarsson <1928360@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=lubuntu-default-settings; status=New;
 importance=Undecided; assignee=None; 
X-Launchpad-Bug: product=ubuntukylin; status=New; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=apparmor; component=main; 
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=language-selector;
 component=main; status=In Progress; importance=Undecided;
 assignee=gunnarhj@ubuntu.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gunnarhj
X-Launchpad-Bug-Reporter: Gunnar Hjalmarsson (gunnarhj)
X-Launchpad-Bug-Modifier: Gunnar Hjalmarsson (gunnarhj)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
Message-Id: <162136678892.2376.6200857094716250450.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 6e151c607eec56b7b2ed57bfaa9005bf49b81bdb
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

T24gMjAyMS0wNS0xNiAyMjoyMywgR3VubmFyIEhqYWxtYXJzc29uIHdyb3RlOgo+IEFzIHJlZ2Fy
ZHMgYXBwYXJtb3IgaXQncyBwb3NzaWJsZSB0aGF0IG5vIGNoYW5nZSBpcyBuZWVkZWQuCgpXZWxs
LCBJIHNpbXBseSB0ZXN0ZWQgd2l0aCB0aGUgQ2hyb21pdW0gc25hcC4gZmNpdHg1IGRvZXMgbm90
IHdvcmsgaW4KQ2hyb21pdW0sIHdoaWxlIGZjaXR4NCBkb2VzLiBTbyBzb21ldGhpbmcgbmVlZHMg
dG8gYmUgZG9uZS4KCi0tIApZb3UgcmVjZWl2ZWQgdGhpcyBidWcgbm90aWZpY2F0aW9uIGJlY2F1
c2UgeW91IGFyZSBhIG1lbWJlciBvZiBBcHBBcm1vcgpEZXZlbG9wZXJzLCB3aGljaCBpcyBzdWJz
Y3JpYmVkIHRvIHRoZSBidWcgcmVwb3J0LgpodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdz
LzE5MjgzNjAKClRpdGxlOgogIFN3aXRjaCB0byBGY2l0eCA1IGZvciBDaGluZXNlCgpTdGF0dXMg
aW4gTHVidW50dSBkZWZhdWx0IHNldHRpbmdzOgogIE5ldwpTdGF0dXMgaW4gVWJ1bnR1IEt5bGlu
OgogIE5ldwpTdGF0dXMgaW4gYXBwYXJtb3IgcGFja2FnZSBpbiBVYnVudHU6CiAgTmV3ClN0YXR1
cyBpbiBsYW5ndWFnZS1zZWxlY3RvciBwYWNrYWdlIGluIFVidW50dToKICBJbiBQcm9ncmVzcwoK
QnVnIGRlc2NyaXB0aW9uOgogIEluIERlYmlhbiAxMSBGY2l0eCA1IHdpbGwgYmUgdGhlIGRlZmF1
bHQgSU0gZnJhbWV3b3JrIGZvciBDaGluZXNlIG9uCiAgbm9uLUdOT01FIGRlc2t0b3BzLiBJIGNh
biB0aGluayBpdCdzIHRpbWUgdG8gbWFrZSB0aGUgZXF1aXZhbGVudAogIGNoYW5nZXMgaW4gVWJ1
bnR1IDIxLjEwIGFzIHdlbGwuCgogIEknZCBhcHByZWNpYXRlIGlucHV0IG9uIHRoZSB0b3BpYyBm
cm9tIHRoZSBVYnVudHUgS3lsaW4gdGVhbSBhcyB3ZWxsCiAgYXMgb3RoZXIgQ2hpbmVzZSBzcGVh
a2luZyB1c2Vycy4KClRvIG1hbmFnZSBub3RpZmljYXRpb25zIGFib3V0IHRoaXMgYnVnIGdvIHRv
OgpodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9sdWJ1bnR1LWRlZmF1bHQtc2V0dGluZ3MvK2J1
Zy8xOTI4MzYwLytzdWJzY3JpcHRpb25zCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFy
bW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBo
dHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

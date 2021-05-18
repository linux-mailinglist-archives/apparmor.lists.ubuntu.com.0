Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C513881B9
	for <lists+apparmor@lfdr.de>; Tue, 18 May 2021 22:55:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lj6ka-0008KS-AO; Tue, 18 May 2021 20:55:36 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1lj6kY-0008KL-Oi
 for apparmor@lists.ubuntu.com; Tue, 18 May 2021 20:55:34 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lj6kX-000342-Dz
 for <apparmor@lists.ubuntu.com>; Tue, 18 May 2021 20:55:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6663E2E8186
 for <apparmor@lists.ubuntu.com>; Tue, 18 May 2021 20:55:33 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 18 May 2021 20:47:03 -0000
From: Seth Arnold <1928360@bugs.launchpad.net>
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
X-Launchpad-Bug-Commenters: gunnarhj seth-arnold
X-Launchpad-Bug-Reporter: Gunnar Hjalmarsson (gunnarhj)
X-Launchpad-Bug-Modifier: Seth Arnold (seth-arnold)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
 <162136678892.2376.6200857094716250450.malone@wampee.canonical.com>
Message-Id: <20210518204703.GD4082368@millbarge>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 3dffaf0794485160612ed657f8d59ceb4ef9cb3d
Subject: Re: [apparmor] [Bug 1928360] Re: Switch to Fcitx 5 for Chinese
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

T24gVHVlLCBNYXkgMTgsIDIwMjEgYXQgMDc6Mzk6NDhQTSAtMDAwMCwgR3VubmFyIEhqYWxtYXJz
c29uIHdyb3RlOgo+IE9uIDIwMjEtMDUtMTYgMjI6MjMsIEd1bm5hciBIamFsbWFyc3NvbiB3cm90
ZToKPiA+IEFzIHJlZ2FyZHMgYXBwYXJtb3IgaXQncyBwb3NzaWJsZSB0aGF0IG5vIGNoYW5nZSBp
cyBuZWVkZWQuCj4gCj4gV2VsbCwgSSBzaW1wbHkgdGVzdGVkIHdpdGggdGhlIENocm9taXVtIHNu
YXAuIGZjaXR4NSBkb2VzIG5vdCB3b3JrIGluCj4gQ2hyb21pdW0sIHdoaWxlIGZjaXR4NCBkb2Vz
LiBTbyBzb21ldGhpbmcgbmVlZHMgdG8gYmUgZG9uZS4KCkV4Y2VsbGVudCwgY2FuIHlvdSBwYXN0
ZSB0aGUgREVOSUVEIGxpbmVzIGZyb20geW91ciB0ZXN0IGludG8gdGhlIGJ1ZwpyZXBvcnQ/CgpU
aGFua3MKCi0tIApZb3UgcmVjZWl2ZWQgdGhpcyBidWcgbm90aWZpY2F0aW9uIGJlY2F1c2UgeW91
IGFyZSBhIG1lbWJlciBvZiBBcHBBcm1vcgpEZXZlbG9wZXJzLCB3aGljaCBpcyBzdWJzY3JpYmVk
IHRvIHRoZSBidWcgcmVwb3J0LgpodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdzLzE5Mjgz
NjAKClRpdGxlOgogIFN3aXRjaCB0byBGY2l0eCA1IGZvciBDaGluZXNlCgpTdGF0dXMgaW4gTHVi
dW50dSBkZWZhdWx0IHNldHRpbmdzOgogIE5ldwpTdGF0dXMgaW4gVWJ1bnR1IEt5bGluOgogIE5l
dwpTdGF0dXMgaW4gYXBwYXJtb3IgcGFja2FnZSBpbiBVYnVudHU6CiAgTmV3ClN0YXR1cyBpbiBs
YW5ndWFnZS1zZWxlY3RvciBwYWNrYWdlIGluIFVidW50dToKICBJbiBQcm9ncmVzcwoKQnVnIGRl
c2NyaXB0aW9uOgogIEluIERlYmlhbiAxMSBGY2l0eCA1IHdpbGwgYmUgdGhlIGRlZmF1bHQgSU0g
ZnJhbWV3b3JrIGZvciBDaGluZXNlIG9uCiAgbm9uLUdOT01FIGRlc2t0b3BzLiBJIGNhbiB0aGlu
ayBpdCdzIHRpbWUgdG8gbWFrZSB0aGUgZXF1aXZhbGVudAogIGNoYW5nZXMgaW4gVWJ1bnR1IDIx
LjEwIGFzIHdlbGwuCgogIEknZCBhcHByZWNpYXRlIGlucHV0IG9uIHRoZSB0b3BpYyBmcm9tIHRo
ZSBVYnVudHUgS3lsaW4gdGVhbSBhcyB3ZWxsCiAgYXMgb3RoZXIgQ2hpbmVzZSBzcGVha2luZyB1
c2Vycy4KClRvIG1hbmFnZSBub3RpZmljYXRpb25zIGFib3V0IHRoaXMgYnVnIGdvIHRvOgpodHRw
czovL2J1Z3MubGF1bmNocGFkLm5ldC9sdWJ1bnR1LWRlZmF1bHQtc2V0dGluZ3MvK2J1Zy8xOTI4
MzYwLytzdWJzY3JpcHRpb25zCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxp
c3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczov
L2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

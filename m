Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD67389C44
	for <lists+apparmor@lfdr.de>; Thu, 20 May 2021 06:00:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ljZrc-0002Jz-IZ; Thu, 20 May 2021 04:00:48 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1ljZra-0002Je-TO
 for apparmor@lists.ubuntu.com; Thu, 20 May 2021 04:00:46 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1ljZrZ-0006aC-Vt
 for <apparmor@lists.ubuntu.com>; Thu, 20 May 2021 04:00:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EAC202E8135
 for <apparmor@lists.ubuntu.com>; Thu, 20 May 2021 04:00:45 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 20 May 2021 03:55:29 -0000
From: handsome_feng <1928360@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=lubuntu-default-settings; status=New;
 importance=Undecided; assignee=None; 
X-Launchpad-Bug: product=ubuntukylin; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=apparmor; component=main; 
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=language-selector;
 component=main; status=In Progress; importance=Undecided;
 assignee=gunnarhj@ubuntu.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: feng-kylin gunnarhj seth-arnold
X-Launchpad-Bug-Reporter: Gunnar Hjalmarsson (gunnarhj)
X-Launchpad-Bug-Modifier: handsome_feng (feng-kylin)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
Message-Id: <162148292925.810.12321990347994218223.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="716e08a550b901207b3abbeb098dd682f9ecb267"; Instance="production"
X-Launchpad-Hash: 9a6c820a1b64926d078675bd1925ffd1ca60d269
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

SGksIEd1bm5hciwKCkFmdGVyIHRhbGtpbmcgdG8gb3VyIHBhcnRuZXJzIHN1Y2ggYXMgU29nb3Us
IHRoZXkgd2FudCB0byBwb3N0cG9uZSB0aGlzCm1pZ3JhdGlvbiB1bnRpbCAyMi4wNCBzbyB0aGF0
IHRoZXkgaGF2ZSBlbm91Z2ggdGltZSB0byB3b3JrIG9uIHRoZQphZGFwdGF0aW9uLCBpcyB0aGlz
IHBvc3NpYmxlPwoKVGhhbmtzLApoYW5kc29tZV9mZW5nCgotLSAKWW91IHJlY2VpdmVkIHRoaXMg
YnVnIG5vdGlmaWNhdGlvbiBiZWNhdXNlIHlvdSBhcmUgYSBtZW1iZXIgb2YgQXBwQXJtb3IKRGV2
ZWxvcGVycywgd2hpY2ggaXMgc3Vic2NyaWJlZCB0byB0aGUgYnVnIHJlcG9ydC4KaHR0cHM6Ly9i
dWdzLmxhdW5jaHBhZC5uZXQvYnVncy8xOTI4MzYwCgpUaXRsZToKICBTd2l0Y2ggdG8gRmNpdHgg
NSBmb3IgQ2hpbmVzZQoKU3RhdHVzIGluIEx1YnVudHUgZGVmYXVsdCBzZXR0aW5nczoKICBOZXcK
U3RhdHVzIGluIFVidW50dSBLeWxpbjoKICBJbiBQcm9ncmVzcwpTdGF0dXMgaW4gYXBwYXJtb3Ig
cGFja2FnZSBpbiBVYnVudHU6CiAgTmV3ClN0YXR1cyBpbiBsYW5ndWFnZS1zZWxlY3RvciBwYWNr
YWdlIGluIFVidW50dToKICBJbiBQcm9ncmVzcwoKQnVnIGRlc2NyaXB0aW9uOgogIEluIERlYmlh
biAxMSBGY2l0eCA1IHdpbGwgYmUgdGhlIGRlZmF1bHQgSU0gZnJhbWV3b3JrIGZvciBDaGluZXNl
IG9uCiAgbm9uLUdOT01FIGRlc2t0b3BzLiBJIGNhbiB0aGluayBpdCdzIHRpbWUgdG8gbWFrZSB0
aGUgZXF1aXZhbGVudAogIGNoYW5nZXMgaW4gVWJ1bnR1IDIxLjEwIGFzIHdlbGwuCgogIEknZCBh
cHByZWNpYXRlIGlucHV0IG9uIHRoZSB0b3BpYyBmcm9tIHRoZSBVYnVudHUgS3lsaW4gdGVhbSBh
cyB3ZWxsCiAgYXMgb3RoZXIgQ2hpbmVzZSBzcGVha2luZyB1c2Vycy4KClRvIG1hbmFnZSBub3Rp
ZmljYXRpb25zIGFib3V0IHRoaXMgYnVnIGdvIHRvOgpodHRwczovL2J1Z3MubGF1bmNocGFkLm5l
dC9sdWJ1bnR1LWRlZmF1bHQtc2V0dGluZ3MvK2J1Zy8xOTI4MzYwLytzdWJzY3JpcHRpb25zCgot
LSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5
IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFp
bG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

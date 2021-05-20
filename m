Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 30311389BFE
	for <lists+apparmor@lfdr.de>; Thu, 20 May 2021 05:45:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ljZcw-0001I1-0R; Thu, 20 May 2021 03:45:38 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1ljZcu-0001Hh-PF
 for apparmor@lists.ubuntu.com; Thu, 20 May 2021 03:45:36 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1ljZct-0005Xb-Od
 for <apparmor@lists.ubuntu.com>; Thu, 20 May 2021 03:45:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B034C2E818A
 for <apparmor@lists.ubuntu.com>; Thu, 20 May 2021 03:45:35 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 20 May 2021 03:38:31 -0000
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
X-Launchpad-Bug-Commenters: gunnarhj seth-arnold
X-Launchpad-Bug-Reporter: Gunnar Hjalmarsson (gunnarhj)
X-Launchpad-Bug-Modifier: handsome_feng (feng-kylin)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
Message-Id: <162148191276.6937.5210215532859293104.launchpad@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="716e08a550b901207b3abbeb098dd682f9ecb267"; Instance="production"
X-Launchpad-Hash: 40cebe5d93661e237f6ae25c736297c646ca1978
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

KiogQ2hhbmdlZCBpbjogdWJ1bnR1a3lsaW4KICAgICAgIFN0YXR1czogTmV3ID0+IEluIFByb2dy
ZXNzCgotLSAKWW91IHJlY2VpdmVkIHRoaXMgYnVnIG5vdGlmaWNhdGlvbiBiZWNhdXNlIHlvdSBh
cmUgYSBtZW1iZXIgb2YgQXBwQXJtb3IKRGV2ZWxvcGVycywgd2hpY2ggaXMgc3Vic2NyaWJlZCB0
byB0aGUgYnVnIHJlcG9ydC4KaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvYnVncy8xOTI4MzYw
CgpUaXRsZToKICBTd2l0Y2ggdG8gRmNpdHggNSBmb3IgQ2hpbmVzZQoKU3RhdHVzIGluIEx1YnVu
dHUgZGVmYXVsdCBzZXR0aW5nczoKICBOZXcKU3RhdHVzIGluIFVidW50dSBLeWxpbjoKICBJbiBQ
cm9ncmVzcwpTdGF0dXMgaW4gYXBwYXJtb3IgcGFja2FnZSBpbiBVYnVudHU6CiAgTmV3ClN0YXR1
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

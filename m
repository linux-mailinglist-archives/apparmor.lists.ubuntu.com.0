Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id CD35C39C4E9
	for <lists+apparmor@lfdr.de>; Sat,  5 Jun 2021 03:50:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lpLSS-0002lN-OF; Sat, 05 Jun 2021 01:50:40 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1lpLSN-0002kh-Pp
 for apparmor@lists.ubuntu.com; Sat, 05 Jun 2021 01:50:35 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lpLSM-0005TF-Lp
 for <apparmor@lists.ubuntu.com>; Sat, 05 Jun 2021 01:50:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9B4602E818C
 for <apparmor@lists.ubuntu.com>; Sat,  5 Jun 2021 01:50:34 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 05 Jun 2021 01:40:45 -0000
From: Seth Arnold <1928360@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=lubuntu-default-settings; status=New;
 importance=Undecided; assignee=None; 
X-Launchpad-Bug: product=snappy; status=New; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=ubuntukylin; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=im-config; component=main; 
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=language-selector;
 component=main; status=Fix Released; importance=Undecided;
 assignee=gunnarhj@ubuntu.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: feng-kylin gunnarhj janitor seth-arnold
X-Launchpad-Bug-Reporter: Gunnar Hjalmarsson (gunnarhj)
X-Launchpad-Bug-Modifier: Seth Arnold (seth-arnold)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
 <162285643961.2791.2343187171891122867.malone@soybean.canonical.com>
Message-Id: <20210605014045.GD2766784@millbarge>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: dd0191d2457e7775e1f8c22bd3d7c48fb4c7e286
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

T24gU2F0LCBKdW4gMDUsIDIwMjEgYXQgMDE6Mjc6MTlBTSAtMDAwMCwgR3VubmFyIEhqYWxtYXJz
c29uIHdyb3RlOgo+IEl0IG1lYW5zIHRoYXQgaXQgZXhwbGljaXRseSBsb29rcyBmb3IgdGhlIGZj
aXR4IDUgZ3RrIGltIG1vZHVsZSwgd2hpbGUKPiBDaHJvbWl1bSBvbmx5IGhhcyBhY2Nlc3MgdG8g
dGhlIGZjaXR4IDQgb25lLgoKT2ghIEV4Y2VsbGVudCBkZWJ1Z2dpbmcgdG8gZmluZCB0aGUgcm9v
dCBjYXVzZS4KClRoYW5rcwoKLS0gCllvdSByZWNlaXZlZCB0aGlzIGJ1ZyBub3RpZmljYXRpb24g
YmVjYXVzZSB5b3UgYXJlIGEgbWVtYmVyIG9mIEFwcEFybW9yCkRldmVsb3BlcnMsIHdoaWNoIGlz
IHN1YnNjcmliZWQgdG8gdGhlIGJ1ZyByZXBvcnQuCmh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0
L2J1Z3MvMTkyODM2MAoKVGl0bGU6CiAgU3dpdGNoIHRvIEZjaXR4IDUgZm9yIENoaW5lc2UKClN0
YXR1cyBpbiBMdWJ1bnR1IGRlZmF1bHQgc2V0dGluZ3M6CiAgTmV3ClN0YXR1cyBpbiBTbmFwcHk6
CiAgTmV3ClN0YXR1cyBpbiBVYnVudHUgS3lsaW46CiAgSW4gUHJvZ3Jlc3MKU3RhdHVzIGluIGlt
LWNvbmZpZyBwYWNrYWdlIGluIFVidW50dToKICBOZXcKU3RhdHVzIGluIGxhbmd1YWdlLXNlbGVj
dG9yIHBhY2thZ2UgaW4gVWJ1bnR1OgogIEZpeCBSZWxlYXNlZAoKQnVnIGRlc2NyaXB0aW9uOgog
IEluIERlYmlhbiAxMSBGY2l0eCA1IHdpbGwgYmUgdGhlIGRlZmF1bHQgSU0gZnJhbWV3b3JrIGZv
ciBDaGluZXNlIG9uCiAgbm9uLUdOT01FIGRlc2t0b3BzLiBJIGNhbiB0aGluayBpdCdzIHRpbWUg
dG8gbWFrZSB0aGUgZXF1aXZhbGVudAogIGNoYW5nZXMgaW4gVWJ1bnR1IDIxLjEwIGFzIHdlbGwu
CgogIEknZCBhcHByZWNpYXRlIGlucHV0IG9uIHRoZSB0b3BpYyBmcm9tIHRoZSBVYnVudHUgS3ls
aW4gdGVhbSBhcyB3ZWxsCiAgYXMgb3RoZXIgQ2hpbmVzZSBzcGVha2luZyB1c2Vycy4KClRvIG1h
bmFnZSBub3RpZmljYXRpb25zIGFib3V0IHRoaXMgYnVnIGdvIHRvOgpodHRwczovL2J1Z3MubGF1
bmNocGFkLm5ldC9sdWJ1bnR1LWRlZmF1bHQtc2V0dGluZ3MvK2J1Zy8xOTI4MzYwLytzdWJzY3Jp
cHRpb25zCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5j
b20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50
dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

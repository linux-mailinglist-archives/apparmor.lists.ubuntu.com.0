Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BAF39EF2B
	for <lists+apparmor@lfdr.de>; Tue,  8 Jun 2021 09:00:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lqVjD-0001w6-Nj; Tue, 08 Jun 2021 07:00:47 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1lqVjC-0001vw-K2
 for apparmor@lists.ubuntu.com; Tue, 08 Jun 2021 07:00:46 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lqVjB-0008Ua-LB
 for <apparmor@lists.ubuntu.com>; Tue, 08 Jun 2021 07:00:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 96D2C2E8135
 for <apparmor@lists.ubuntu.com>; Tue,  8 Jun 2021 07:00:45 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 08 Jun 2021 06:54:23 -0000
From: James Henstridge <1928360@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=lubuntu-default-settings; status=New;
 importance=Undecided; assignee=None; 
X-Launchpad-Bug: product=snappy; status=New; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=ubuntukylin; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=im-config; component=main; 
 status=Fix Released; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=language-selector;
 component=main; status=Fix Released; importance=Undecided;
 assignee=gunnarhj@ubuntu.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: feng-kylin gunnarhj jamesh janitor seth-arnold
X-Launchpad-Bug-Reporter: Gunnar Hjalmarsson (gunnarhj)
X-Launchpad-Bug-Modifier: James Henstridge (jamesh)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
Message-Id: <162313526363.3759.8506880836587296477.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: a6391cf3ab901ba2e4d3ba11463792a1aa37ca8f
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

PiBJcyB0aGVyZSBzdWNoIGEgc25hcCB5b3UgY291bGQgcG9pbnQgbWUgdG8gc28gSSBjYW4gdGVz
dD8KClRoZSBjYW5kaWRhdGUgY2hhbm5lbCBvZiB0aGUgZ2VkaXQgc25hcCBpcyBidWlsdCB3aXRo
IGNvcmUyMCBhbmQgdGhlCmdub21lLTMtMzgtMjAwNCBwbGF0Zm9ybSBzbmFwLiAgQnV0IGFzIEkg
c2FpZCwgSSBkb24ndCB0aGluayB0aGF0CnBsYXRmb3JtIHNuYXAgY3VycmVudGx5IGluY2x1ZGVz
IHRoZSBmY2l0eDUgaW5wdXQgbW9kdWxlLgoKLS0gCllvdSByZWNlaXZlZCB0aGlzIGJ1ZyBub3Rp
ZmljYXRpb24gYmVjYXVzZSB5b3UgYXJlIGEgbWVtYmVyIG9mIEFwcEFybW9yCkRldmVsb3BlcnMs
IHdoaWNoIGlzIHN1YnNjcmliZWQgdG8gdGhlIGJ1ZyByZXBvcnQuCmh0dHBzOi8vYnVncy5sYXVu
Y2hwYWQubmV0L2J1Z3MvMTkyODM2MAoKVGl0bGU6CiAgU3dpdGNoIHRvIEZjaXR4IDUgZm9yIENo
aW5lc2UKClN0YXR1cyBpbiBMdWJ1bnR1IGRlZmF1bHQgc2V0dGluZ3M6CiAgTmV3ClN0YXR1cyBp
biBTbmFwcHk6CiAgTmV3ClN0YXR1cyBpbiBVYnVudHUgS3lsaW46CiAgSW4gUHJvZ3Jlc3MKU3Rh
dHVzIGluIGltLWNvbmZpZyBwYWNrYWdlIGluIFVidW50dToKICBGaXggUmVsZWFzZWQKU3RhdHVz
IGluIGxhbmd1YWdlLXNlbGVjdG9yIHBhY2thZ2UgaW4gVWJ1bnR1OgogIEZpeCBSZWxlYXNlZAoK
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

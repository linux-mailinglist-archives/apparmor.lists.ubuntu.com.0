Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F95139C5E6
	for <lists+apparmor@lfdr.de>; Sat,  5 Jun 2021 06:41:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lpO7E-00028I-Vl; Sat, 05 Jun 2021 04:40:56 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1lpO7A-00027c-0Y
 for apparmor@lists.ubuntu.com; Sat, 05 Jun 2021 04:40:52 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lpO79-0006e2-5S
 for <apparmor@lists.ubuntu.com>; Sat, 05 Jun 2021 04:40:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 25CD22E8136
 for <apparmor@lists.ubuntu.com>; Sat,  5 Jun 2021 04:40:51 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 05 Jun 2021 04:32:58 -0000
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
 status=New; importance=Undecided; assignee=None; 
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
Message-Id: <162286757908.3098.13452096866932701781.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: 58dfd968661a4e6f9dae3624a2e551347e10026a
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

SSBoYWRuJ3QgcmVhbGlzZWQgdGhhdCB0aGV5IHJlbmFtZWQgdGhlIElNIG1vZHVsZSB3aXRoIHRo
ZSB2ZXJzaW9uIGJ1bXA6CnRoYXQgbWVhbnMgc25hcHMgYnVpbHQgYWdhaW5zdCBvbGRlciBwbGF0
Zm9ybXMgd29uJ3QgbG9hZCB0aGUgb2xkIChidXQKd29ya2luZykgRmNpdHggNCBtb2R1bGUgd2hl
biBydW4gb24gYSBob3N0IHN5c3RlbSBjb25maWd1cmVkIHdpdGggRmNpdHgKNS4KCldlIGNhbiBj
ZXJ0YWlubHkgbG9vayBhdCBhZGRpbmcgdGhlIG5ldyBJTSBtb2R1bGUgdG8gdGhlIHBsYXRmb3Jt
IHNuYXBzLApidXQgdGhhdCB3aWxsIGFsc28gc3dpdGNoIHRvIHRoZSBuZXcgSVBDIHByb3RvY29s
LiAgRnJvbSBhIHF1aWNrIGxvb2sKdGhyb3VnaCB0aGUgc291cmNlIGl0IHdpbGwgcHJvYmFibHkg
YmUgYWxsb3dlZCBieSBleGlzdGluZyBBcHBBcm1vcgpydWxlcyBpbiB0aGUgImRlc2t0b3AiIGlu
dGVyZmFjZSwgYnV0IHRoYXQgd2lsbCBuZWVkIHRlc3RpbmcuCgpJdCdzIHByb2JhYmx5IGdvaW5n
IHRvIGJlIGVhc2llc3QgdG8gc2VlIGlmIHdlIGNhbiBnZXQgdGhpbmdzIHdvcmtpbmcKd2l0aCBh
IGNvcmUyMCBiYXNlZCBwbGF0Zm9ybSBzbmFwIHRob3VnaCwgc2luY2Ugd2UgaGF2ZSBmY2l0eDUg
cGFja2FnZXMKdGhlcmUgKGFsYmVpdCBmb3IgYSBnaXQgcHJlcmVsZWFzZSB2ZXJzaW9uKS4KCkZv
ciB0aGUgY29yZTE4IGJhc2VkIHBsYXRmb3JtIHNuYXBzLCB3ZSB3b3VsZCBuZWVkIHRvIGJhY2tw
b3J0IHRoZQpmY2l0eDUgcGFja2FnZXMgdGhlbXNlbHZlcy4gIEFsdGVybmF0aXZlbHksIEkgd29u
ZGVyIGlmIHdlIGNvdWxkIGdldAphd2F5IHdpdGggc3ltbGlua2luZyB0aGUgb2xkIG1vZHVsZSBu
YW1lIHRvIHRoZSBuZXcgb25lPwoKLS0gCllvdSByZWNlaXZlZCB0aGlzIGJ1ZyBub3RpZmljYXRp
b24gYmVjYXVzZSB5b3UgYXJlIGEgbWVtYmVyIG9mIEFwcEFybW9yCkRldmVsb3BlcnMsIHdoaWNo
IGlzIHN1YnNjcmliZWQgdG8gdGhlIGJ1ZyByZXBvcnQuCmh0dHBzOi8vYnVncy5sYXVuY2hwYWQu
bmV0L2J1Z3MvMTkyODM2MAoKVGl0bGU6CiAgU3dpdGNoIHRvIEZjaXR4IDUgZm9yIENoaW5lc2UK
ClN0YXR1cyBpbiBMdWJ1bnR1IGRlZmF1bHQgc2V0dGluZ3M6CiAgTmV3ClN0YXR1cyBpbiBTbmFw
cHk6CiAgTmV3ClN0YXR1cyBpbiBVYnVudHUgS3lsaW46CiAgSW4gUHJvZ3Jlc3MKU3RhdHVzIGlu
IGltLWNvbmZpZyBwYWNrYWdlIGluIFVidW50dToKICBOZXcKU3RhdHVzIGluIGxhbmd1YWdlLXNl
bGVjdG9yIHBhY2thZ2UgaW4gVWJ1bnR1OgogIEZpeCBSZWxlYXNlZAoKQnVnIGRlc2NyaXB0aW9u
OgogIEluIERlYmlhbiAxMSBGY2l0eCA1IHdpbGwgYmUgdGhlIGRlZmF1bHQgSU0gZnJhbWV3b3Jr
IGZvciBDaGluZXNlIG9uCiAgbm9uLUdOT01FIGRlc2t0b3BzLiBJIGNhbiB0aGluayBpdCdzIHRp
bWUgdG8gbWFrZSB0aGUgZXF1aXZhbGVudAogIGNoYW5nZXMgaW4gVWJ1bnR1IDIxLjEwIGFzIHdl
bGwuCgogIEknZCBhcHByZWNpYXRlIGlucHV0IG9uIHRoZSB0b3BpYyBmcm9tIHRoZSBVYnVudHUg
S3lsaW4gdGVhbSBhcyB3ZWxsCiAgYXMgb3RoZXIgQ2hpbmVzZSBzcGVha2luZyB1c2Vycy4KClRv
IG1hbmFnZSBub3RpZmljYXRpb25zIGFib3V0IHRoaXMgYnVnIGdvIHRvOgpodHRwczovL2J1Z3Mu
bGF1bmNocGFkLm5ldC9sdWJ1bnR1LWRlZmF1bHQtc2V0dGluZ3MvK2J1Zy8xOTI4MzYwLytzdWJz
Y3JpcHRpb25zCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50
dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVi
dW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

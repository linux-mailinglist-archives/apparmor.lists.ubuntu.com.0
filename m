Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B15A39EA7F
	for <lists+apparmor@lfdr.de>; Tue,  8 Jun 2021 02:01:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lqPB7-000627-BN; Tue, 08 Jun 2021 00:01:09 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1lqPB1-000614-EP
 for apparmor@lists.ubuntu.com; Tue, 08 Jun 2021 00:01:03 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lqPB0-00032u-Rt
 for <apparmor@lists.ubuntu.com>; Tue, 08 Jun 2021 00:01:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CCE092E8136
 for <apparmor@lists.ubuntu.com>; Tue,  8 Jun 2021 00:01:02 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 07 Jun 2021 23:53:36 -0000
From: Launchpad Bug Tracker <1928360@bugs.launchpad.net>
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
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
Message-Id: <162311001874.16054.5920633732694859316.malone@ackee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: 60ec369d04910c4f78763d0b33e45db7d97736ef
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

VGhpcyBidWcgd2FzIGZpeGVkIGluIHRoZSBwYWNrYWdlIGltLWNvbmZpZyAtIDAuNDctMQoKLS0t
LS0tLS0tLS0tLS0tCmltLWNvbmZpZyAoMC40Ny0xKSBleHBlcmltZW50YWw7IHVyZ2VuY3k9bWVk
aXVtCgogICogVGVhbSB1cGxvYWQKICAqIEJ1ZyBzY3JpcHQgdHdlYWtzCgogIFsgU2hlbmdqaW5n
IFpodSBdCiAgKiBDaGFuZ2UgSU1fTU9EVUxFIGVudiBmb3IgZmNpdHg1IHRvICJmY2l0eCIgKGNs
b3NlczogIzk3NzIwMywKICAgIExQOiAjMTkyODM2MCkKCiAtLSBHdW5uYXIgSGphbG1hcnNzb24g
PGd1bm5hcmhqQGRlYmlhbi5vcmc+ICBNb24sIDA3IEp1biAyMDIxIDA5OjM4OjM4CiswMjAwCgoq
KiBDaGFuZ2VkIGluOiBpbS1jb25maWcgKFVidW50dSkKICAgICAgIFN0YXR1czogTmV3ID0+IEZp
eCBSZWxlYXNlZAoKLS0gCllvdSByZWNlaXZlZCB0aGlzIGJ1ZyBub3RpZmljYXRpb24gYmVjYXVz
ZSB5b3UgYXJlIGEgbWVtYmVyIG9mIEFwcEFybW9yCkRldmVsb3BlcnMsIHdoaWNoIGlzIHN1YnNj
cmliZWQgdG8gdGhlIGJ1ZyByZXBvcnQuCmh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2J1Z3Mv
MTkyODM2MAoKVGl0bGU6CiAgU3dpdGNoIHRvIEZjaXR4IDUgZm9yIENoaW5lc2UKClN0YXR1cyBp
biBMdWJ1bnR1IGRlZmF1bHQgc2V0dGluZ3M6CiAgTmV3ClN0YXR1cyBpbiBTbmFwcHk6CiAgTmV3
ClN0YXR1cyBpbiBVYnVudHUgS3lsaW46CiAgSW4gUHJvZ3Jlc3MKU3RhdHVzIGluIGltLWNvbmZp
ZyBwYWNrYWdlIGluIFVidW50dToKICBGaXggUmVsZWFzZWQKU3RhdHVzIGluIGxhbmd1YWdlLXNl
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

Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDC838D348
	for <lists+apparmor@lfdr.de>; Sat, 22 May 2021 05:25:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lkIGe-0004rA-NR; Sat, 22 May 2021 03:25:36 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1lkIGc-0004qy-Nc
 for apparmor@lists.ubuntu.com; Sat, 22 May 2021 03:25:34 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lkIGc-0003u4-6h
 for <apparmor@lists.ubuntu.com>; Sat, 22 May 2021 03:25:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2F51A2E8135
 for <apparmor@lists.ubuntu.com>; Sat, 22 May 2021 03:25:34 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 22 May 2021 03:17:24 -0000
From: Launchpad Bug Tracker <1928360@bugs.launchpad.net>
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
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
Message-Id: <162165344786.10021.138086889979204391.malone@ackee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ba75dbf44f1013379e594c259682f14c0528180a"; Instance="production"
X-Launchpad-Hash: 6d8adab18a83673ad934c9c19c3e2dc6d3f08fd7
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

VGhpcyBidWcgd2FzIGZpeGVkIGluIHRoZSBwYWNrYWdlIGxhbmd1YWdlLXNlbGVjdG9yIC0gMC4y
MTIKCi0tLS0tLS0tLS0tLS0tLQpsYW5ndWFnZS1zZWxlY3RvciAoMC4yMTIpIGltcGlzaDsgdXJn
ZW5jeT1tZWRpdW0KCiAgKiBkYXRhL3BrZ19kZXBlbmRzOgogICAgLSBEb24ndCBwdWxsIEZjaXR4
IGZvciBub24tQ2hpbmVzZSBsYW5ndWFnZXMuIFRoaXMgaXMgY29uc2lzdGVudAogICAgICB3aXRo
IHRoZSBJTV9DT05GSUdfUFJFRkVSUkVEX1JVTEUgdmFyaWFibGUgaW4KICAgICAgL2V0Yy9kZWZh
dWx0L2ltLWNvbmZpZy4KICAgIC0gUHVsbCBJQnVzIElNcyBmb3IgQ2hpbmVzZSBhbHNvIG9uIFVi
dW50dSBCdWRnaWUKICAgIC0gU3dpdGNoIHRvIEZjaXR4IDUgZm9yIENoaW5lc2UgKExQOiAjMTky
ODM2MCkKCiAtLSBHdW5uYXIgSGphbG1hcnNzb24gPGd1bm5hcmhqQHVidW50dS5jb20+ICBGcmks
IDIxIE1heSAyMDIxIDA2OjQxOjA1CiswMjAwCgoqKiBDaGFuZ2VkIGluOiBsYW5ndWFnZS1zZWxl
Y3RvciAoVWJ1bnR1KQogICAgICAgU3RhdHVzOiBGaXggQ29tbWl0dGVkID0+IEZpeCBSZWxlYXNl
ZAoKLS0gCllvdSByZWNlaXZlZCB0aGlzIGJ1ZyBub3RpZmljYXRpb24gYmVjYXVzZSB5b3UgYXJl
IGEgbWVtYmVyIG9mIEFwcEFybW9yCkRldmVsb3BlcnMsIHdoaWNoIGlzIHN1YnNjcmliZWQgdG8g
dGhlIGJ1ZyByZXBvcnQuCmh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2J1Z3MvMTkyODM2MAoK
VGl0bGU6CiAgU3dpdGNoIHRvIEZjaXR4IDUgZm9yIENoaW5lc2UKClN0YXR1cyBpbiBMdWJ1bnR1
IGRlZmF1bHQgc2V0dGluZ3M6CiAgTmV3ClN0YXR1cyBpbiBVYnVudHUgS3lsaW46CiAgSW4gUHJv
Z3Jlc3MKU3RhdHVzIGluIGFwcGFybW9yIHBhY2thZ2UgaW4gVWJ1bnR1OgogIE5ldwpTdGF0dXMg
aW4gbGFuZ3VhZ2Utc2VsZWN0b3IgcGFja2FnZSBpbiBVYnVudHU6CiAgRml4IFJlbGVhc2VkCgpC
dWcgZGVzY3JpcHRpb246CiAgSW4gRGViaWFuIDExIEZjaXR4IDUgd2lsbCBiZSB0aGUgZGVmYXVs
dCBJTSBmcmFtZXdvcmsgZm9yIENoaW5lc2Ugb24KICBub24tR05PTUUgZGVza3RvcHMuIEkgY2Fu
IHRoaW5rIGl0J3MgdGltZSB0byBtYWtlIHRoZSBlcXVpdmFsZW50CiAgY2hhbmdlcyBpbiBVYnVu
dHUgMjEuMTAgYXMgd2VsbC4KCiAgSSdkIGFwcHJlY2lhdGUgaW5wdXQgb24gdGhlIHRvcGljIGZy
b20gdGhlIFVidW50dSBLeWxpbiB0ZWFtIGFzIHdlbGwKICBhcyBvdGhlciBDaGluZXNlIHNwZWFr
aW5nIHVzZXJzLgoKVG8gbWFuYWdlIG5vdGlmaWNhdGlvbnMgYWJvdXQgdGhpcyBidWcgZ28gdG86
Cmh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2x1YnVudHUtZGVmYXVsdC1zZXR0aW5ncy8rYnVn
LzE5MjgzNjAvK3N1YnNjcmlwdGlvbnMKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJt
b3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0
dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

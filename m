Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D882638827B
	for <lists+apparmor@lfdr.de>; Tue, 18 May 2021 23:55:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lj7gf-0002hY-Va; Tue, 18 May 2021 21:55:37 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1lj7ge-0002hG-An
 for apparmor@lists.ubuntu.com; Tue, 18 May 2021 21:55:36 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lj7gd-0000z8-Pu
 for <apparmor@lists.ubuntu.com>; Tue, 18 May 2021 21:55:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B77262E8136
 for <apparmor@lists.ubuntu.com>; Tue, 18 May 2021 21:55:35 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 18 May 2021 21:49:30 -0000
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
X-Launchpad-Bug-Commenters: gunnarhj seth-arnold
X-Launchpad-Bug-Reporter: Gunnar Hjalmarsson (gunnarhj)
X-Launchpad-Bug-Modifier: Gunnar Hjalmarsson (gunnarhj)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
Message-Id: <162137457057.1187.11599836119795174277.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: bbd5f98b67f2645b20babdb68d8b5db78f7f9b49
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

U3VyZSwgU2V0aCwgYXR0YWNoZWQgcGxlYXNlIGZpbmQgdGhlIG91dHB1dCBmcm9tCgpjYXQgL3Zh
ci9sb2cvYXVkaXQvYXVkaXQubG9nIHwgZ3JlcCBERU5JRUQKCioqIEF0dGFjaG1lbnQgYWRkZWQ6
ICJhcHBhcm1vcl9kZW5pZWQtbGluZXNfY2hyb21pdW0udHh0IgogICBodHRwczovL2J1Z3MubGF1
bmNocGFkLm5ldC91YnVudHUvK3NvdXJjZS9sYW5ndWFnZS1zZWxlY3Rvci8rYnVnLzE5MjgzNjAv
K2F0dGFjaG1lbnQvNTQ5ODU3OC8rZmlsZXMvYXBwYXJtb3JfZGVuaWVkLWxpbmVzX2Nocm9taXVt
LnR4dAoKLS0gCllvdSByZWNlaXZlZCB0aGlzIGJ1ZyBub3RpZmljYXRpb24gYmVjYXVzZSB5b3Ug
YXJlIGEgbWVtYmVyIG9mIEFwcEFybW9yCkRldmVsb3BlcnMsIHdoaWNoIGlzIHN1YnNjcmliZWQg
dG8gdGhlIGJ1ZyByZXBvcnQuCmh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2J1Z3MvMTkyODM2
MAoKVGl0bGU6CiAgU3dpdGNoIHRvIEZjaXR4IDUgZm9yIENoaW5lc2UKClN0YXR1cyBpbiBMdWJ1
bnR1IGRlZmF1bHQgc2V0dGluZ3M6CiAgTmV3ClN0YXR1cyBpbiBVYnVudHUgS3lsaW46CiAgTmV3
ClN0YXR1cyBpbiBhcHBhcm1vciBwYWNrYWdlIGluIFVidW50dToKICBOZXcKU3RhdHVzIGluIGxh
bmd1YWdlLXNlbGVjdG9yIHBhY2thZ2UgaW4gVWJ1bnR1OgogIEluIFByb2dyZXNzCgpCdWcgZGVz
Y3JpcHRpb246CiAgSW4gRGViaWFuIDExIEZjaXR4IDUgd2lsbCBiZSB0aGUgZGVmYXVsdCBJTSBm
cmFtZXdvcmsgZm9yIENoaW5lc2Ugb24KICBub24tR05PTUUgZGVza3RvcHMuIEkgY2FuIHRoaW5r
IGl0J3MgdGltZSB0byBtYWtlIHRoZSBlcXVpdmFsZW50CiAgY2hhbmdlcyBpbiBVYnVudHUgMjEu
MTAgYXMgd2VsbC4KCiAgSSdkIGFwcHJlY2lhdGUgaW5wdXQgb24gdGhlIHRvcGljIGZyb20gdGhl
IFVidW50dSBLeWxpbiB0ZWFtIGFzIHdlbGwKICBhcyBvdGhlciBDaGluZXNlIHNwZWFraW5nIHVz
ZXJzLgoKVG8gbWFuYWdlIG5vdGlmaWNhdGlvbnMgYWJvdXQgdGhpcyBidWcgZ28gdG86Cmh0dHBz
Oi8vYnVncy5sYXVuY2hwYWQubmV0L2x1YnVudHUtZGVmYXVsdC1zZXR0aW5ncy8rYnVnLzE5Mjgz
NjAvK3N1YnNjcmlwdGlvbnMKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlz
dHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8v
bGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

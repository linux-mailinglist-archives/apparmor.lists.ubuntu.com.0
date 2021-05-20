Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FAA389E01
	for <lists+apparmor@lfdr.de>; Thu, 20 May 2021 08:35:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ljcHM-0000dl-Iv; Thu, 20 May 2021 06:35:32 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1ljcHL-0000dZ-Cc
 for apparmor@lists.ubuntu.com; Thu, 20 May 2021 06:35:31 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1ljcHK-00041H-IJ
 for <apparmor@lists.ubuntu.com>; Thu, 20 May 2021 06:35:30 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 892142E8060
 for <apparmor@lists.ubuntu.com>; Thu, 20 May 2021 06:35:30 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 20 May 2021 06:29:27 -0000
From: Gunnar Hjalmarsson <1928360@bugs.launchpad.net>
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
X-Launchpad-Bug-Modifier: Gunnar Hjalmarsson (gunnarhj)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
Message-Id: <162149216753.7287.13172235680757361604.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="716e08a550b901207b3abbeb098dd682f9ecb267"; Instance="production"
X-Launchpad-Hash: e7eea6a30d116a904f530f0b980a044f070cf269
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

QGhhbmRzb21lX2Zlbmc6IEkgc3VwcG9zZSBpdCBpcyBwb3NzaWJsZS4gT2YgY291cnNlIGl0IHdv
dWxkIGhhdmUgYmVlbgpkZXNpcmFibGUgdG8gZG8gaXQgaW4gMjEuMTAgdG8gZ2V0IG1vcmUgdGlt
ZSB0byBpZGVudGlmeSBwb3NzaWJsZSBpc3N1ZXMKYmVmb3JlIG5leHQgTFRTLCBidXQgT1RPSCBJ
IGtub3cgdGhhdCBTb2dvdSBpcyBjb25zaWRlcmVkIGltcG9ydGFudCBvbgpLeWxpbi4KClRoaW5r
aW5nLi4uIE1heWJlIHdlIGNhbiBoYXZlIGl0IGJvdGggd2F5cy4gOikgV2hhdCBJIG1lYW4gaXMg
dGhhdCB3ZQpjb3VsZCBkbyBpdCBub3cgZm9yIG90aGVyIGZsYXZvcnMsIGJ1dCB0ZWxsIGxhbmd1
YWdlLXNlbGVjdG9yIHRvIG5vdApwdWxsIGZjaXR4NSBwYWNrYWdlcyBvbiBLeWxpbiBmb3Igbm93
LiBpbS1jb25maWcgd2lsbCBrZWVwIHN1cHBvcnRpbmcKYm90aCBmY2l0eCA0IGFuZCA1LCBhbmQg
dGhlbiB3ZSB3b3VsZCBzdGlsbCBoYXZlIHJlYXNvbnMgdG8gaWRlbnRpZnkgYW5kCmZpeCBmY2l0
eDUgaXNzdWVzIHdpdGggdGhlIGFwcGFybW9yIHByb2ZpbGVzIGluIHRoZSAyMS4xMCBkZXZlbG9w
bWVudApjeWNsZS4KCldvdWxkIHRoYXQgcGxhbiBtYWtlIHNlbnNlIHRvIHlvdT8KCi0tIApZb3Ug
cmVjZWl2ZWQgdGhpcyBidWcgbm90aWZpY2F0aW9uIGJlY2F1c2UgeW91IGFyZSBhIG1lbWJlciBv
ZiBBcHBBcm1vcgpEZXZlbG9wZXJzLCB3aGljaCBpcyBzdWJzY3JpYmVkIHRvIHRoZSBidWcgcmVw
b3J0LgpodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdzLzE5MjgzNjAKClRpdGxlOgogIFN3
aXRjaCB0byBGY2l0eCA1IGZvciBDaGluZXNlCgpTdGF0dXMgaW4gTHVidW50dSBkZWZhdWx0IHNl
dHRpbmdzOgogIE5ldwpTdGF0dXMgaW4gVWJ1bnR1IEt5bGluOgogIEluIFByb2dyZXNzClN0YXR1
cyBpbiBhcHBhcm1vciBwYWNrYWdlIGluIFVidW50dToKICBOZXcKU3RhdHVzIGluIGxhbmd1YWdl
LXNlbGVjdG9yIHBhY2thZ2UgaW4gVWJ1bnR1OgogIEluIFByb2dyZXNzCgpCdWcgZGVzY3JpcHRp
b246CiAgSW4gRGViaWFuIDExIEZjaXR4IDUgd2lsbCBiZSB0aGUgZGVmYXVsdCBJTSBmcmFtZXdv
cmsgZm9yIENoaW5lc2Ugb24KICBub24tR05PTUUgZGVza3RvcHMuIEkgY2FuIHRoaW5rIGl0J3Mg
dGltZSB0byBtYWtlIHRoZSBlcXVpdmFsZW50CiAgY2hhbmdlcyBpbiBVYnVudHUgMjEuMTAgYXMg
d2VsbC4KCiAgSSdkIGFwcHJlY2lhdGUgaW5wdXQgb24gdGhlIHRvcGljIGZyb20gdGhlIFVidW50
dSBLeWxpbiB0ZWFtIGFzIHdlbGwKICBhcyBvdGhlciBDaGluZXNlIHNwZWFraW5nIHVzZXJzLgoK
VG8gbWFuYWdlIG5vdGlmaWNhdGlvbnMgYWJvdXQgdGhpcyBidWcgZ28gdG86Cmh0dHBzOi8vYnVn
cy5sYXVuY2hwYWQubmV0L2x1YnVudHUtZGVmYXVsdC1zZXR0aW5ncy8rYnVnLzE5MjgzNjAvK3N1
YnNjcmlwdGlvbnMKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1
bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMu
dWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

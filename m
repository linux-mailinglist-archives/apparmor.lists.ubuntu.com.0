Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B0038AFC5
	for <lists+apparmor@lfdr.de>; Thu, 20 May 2021 15:16:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ljiWx-00008m-Ae; Thu, 20 May 2021 13:16:03 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1ljiWk-0008N8-Kc
 for apparmor@lists.ubuntu.com; Thu, 20 May 2021 13:15:50 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lji3T-0004Yh-0G
 for <apparmor@lists.ubuntu.com>; Thu, 20 May 2021 12:45:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id ED2992E8135
 for <apparmor@lists.ubuntu.com>; Thu, 20 May 2021 12:45:34 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 20 May 2021 12:37:34 -0000
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
Message-Id: <162151425437.7990.17798921201899995040.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="716e08a550b901207b3abbeb098dd682f9ecb267"; Instance="production"
X-Launchpad-Hash: d66f7994127e9c55295bc5ac0dbf4bd2498ac09e
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

QGhhbmRzb21lX2Zlbmc6IEdyZWF0ISBJIGhhdmUgYSBmb2xsb3ctdXAgcXVlc3Rpb24gdGhlbjoK
CkluIHRoZSBkZXNrdG9wIHNlZWQgb2YgVWJ1bnR1IEt5bGluIEkgc2VlIHRoZXNlIHBhY2thZ2Vz
OgoKICogKGltLWNvbmZpZykKICogKGZjaXR4KQogKiAoZmNpdHgtZnJvbnRlbmQtZ3RrMikKICog
KGZjaXR4LWZyb250ZW5kLWd0azMpCiAqIChmY2l0eC1mcm9udGVuZC1xdDUpCiAqIChmY2l0eC11
aS1jbGFzc2ljKQogKiAoZmNpdHgtdGFibGUpCiAqIChmY2l0eC1tb2R1bGUtY2xvdWRwaW55aW4p
CiAqIChmY2l0eC1nb29nbGVwaW55aW4pCgpHaXZlbiB0aGF0LCB3aWxsIGl0IHdvcmsgd2l0aCB0
aGUgcHJvcG9zZWQgdmVyc2lvbiBvZiBwa2dfZGVwZW5kcywgb3IgaXMKdGhlcmUgYSByZWFzb24g
dG8ga2VlcCBsZXR0aW5nIGFsc28gcGtnX2RlcGVuZHMgcHVsbCBhIGJ1bmNoIG9mIGZjaXR4IDQK
cGFja2FnZXMgZm9yIEt5bGluIGluIDIxLjEwPwoKLS0gCllvdSByZWNlaXZlZCB0aGlzIGJ1ZyBu
b3RpZmljYXRpb24gYmVjYXVzZSB5b3UgYXJlIGEgbWVtYmVyIG9mIEFwcEFybW9yCkRldmVsb3Bl
cnMsIHdoaWNoIGlzIHN1YnNjcmliZWQgdG8gdGhlIGJ1ZyByZXBvcnQuCmh0dHBzOi8vYnVncy5s
YXVuY2hwYWQubmV0L2J1Z3MvMTkyODM2MAoKVGl0bGU6CiAgU3dpdGNoIHRvIEZjaXR4IDUgZm9y
IENoaW5lc2UKClN0YXR1cyBpbiBMdWJ1bnR1IGRlZmF1bHQgc2V0dGluZ3M6CiAgTmV3ClN0YXR1
cyBpbiBVYnVudHUgS3lsaW46CiAgSW4gUHJvZ3Jlc3MKU3RhdHVzIGluIGFwcGFybW9yIHBhY2th
Z2UgaW4gVWJ1bnR1OgogIE5ldwpTdGF0dXMgaW4gbGFuZ3VhZ2Utc2VsZWN0b3IgcGFja2FnZSBp
biBVYnVudHU6CiAgSW4gUHJvZ3Jlc3MKCkJ1ZyBkZXNjcmlwdGlvbjoKICBJbiBEZWJpYW4gMTEg
RmNpdHggNSB3aWxsIGJlIHRoZSBkZWZhdWx0IElNIGZyYW1ld29yayBmb3IgQ2hpbmVzZSBvbgog
IG5vbi1HTk9NRSBkZXNrdG9wcy4gSSBjYW4gdGhpbmsgaXQncyB0aW1lIHRvIG1ha2UgdGhlIGVx
dWl2YWxlbnQKICBjaGFuZ2VzIGluIFVidW50dSAyMS4xMCBhcyB3ZWxsLgoKICBJJ2QgYXBwcmVj
aWF0ZSBpbnB1dCBvbiB0aGUgdG9waWMgZnJvbSB0aGUgVWJ1bnR1IEt5bGluIHRlYW0gYXMgd2Vs
bAogIGFzIG90aGVyIENoaW5lc2Ugc3BlYWtpbmcgdXNlcnMuCgpUbyBtYW5hZ2Ugbm90aWZpY2F0
aW9ucyBhYm91dCB0aGlzIGJ1ZyBnbyB0bzoKaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvbHVi
dW50dS1kZWZhdWx0LXNldHRpbmdzLytidWcvMTkyODM2MC8rc3Vic2NyaXB0aW9ucwoKLS0gCkFw
cEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0
aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4v
bGlzdGluZm8vYXBwYXJtb3IK

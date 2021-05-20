Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2902D38B227
	for <lists+apparmor@lfdr.de>; Thu, 20 May 2021 16:46:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ljjvq-00066U-19; Thu, 20 May 2021 14:45:50 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1ljjvp-00066N-68
 for apparmor@lists.ubuntu.com; Thu, 20 May 2021 14:45:49 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1ljjvm-0005an-1R
 for <apparmor@lists.ubuntu.com>; Thu, 20 May 2021 14:45:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 06FB42E818C
 for <apparmor@lists.ubuntu.com>; Thu, 20 May 2021 14:45:46 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 20 May 2021 14:36:49 -0000
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
Message-Id: <162152140956.6835.3278253731409243143.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="716e08a550b901207b3abbeb098dd682f9ecb267"; Instance="production"
X-Launchpad-Hash: 3c960b5a0b89a33ec501aa3be862cabfaebfa682
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

T24gMjAyMS0wNS0yMCAxNTozOSwgaGFuZHNvbWVfZmVuZyB3cm90ZToKPiBXaXRoIHRoZSBmY2l0
eCBpdGVtcyBpbiB0aGUgY3VycmVudCBzZWVkLCBJIHRoaW5rIHBrZ19kZXBlbmRzIGRvbid0Cj4g
bmVlZCB0byBwdWxsIGluIHRoZSBmY2l0eCA0IHBhY2thZ2VzIGZvciBVYnVudHUgS3lsaW4gMjEu
MTAsCgpPaywgZ29vZC4KCj4gYWxzbyBpdCdzIG9rYXkgdG8gcHVsbCBpbiB0aGUgZmNpdHggNSBw
YWNrYWdlcywgc2luY2UgdGhlIGltLWNvbmZpZwo+IHdpbGwgc2V0IHRoZSBkZWZhdWx0IGlucHV0
IG1ldGhvZCB0byBmY2l0eCA0IGZvciBVYnVudHUgS3lsaW4gMjEuMTA/CgpIbW0uLiBZZXMsIEFG
QUlLIHRoYXQgd291bGQgd29yay4gZmNpdHggNCBhbmQgZmNpdHggNSBjYW4gY28tZXhpc3QsIGFu
ZAppZiBib3RoIGFyZSBpbnN0YWxsZWQgaW0tY29uZmlnIHdpbGwgcGljayBmY2l0eCA0IGJ5IGRl
ZmF1bHQgKGNhbiBiZQpjaGFuZ2VkIGJ5IHRoZSB1c2VyIHZpYSBMYW5ndWFnZSBTdXBwb3J0KS4K
CkRvZXMgdGhpcyBtZWFuIHRoYXQgdGhlIHByb3Bvc2VkIGNoYW5nZXMgdG8gcGtnX2RlcGVuZHMg
aXMgZmluZSBmcm9tIGFuClVidW50dSBLeWxpbiBQT1YsIGFuZCB0aGF0IG5vIGZ1cnRoZXIgY2hh
bmdlcyBhcmUgbmVlZGVkPwoKLS0gCllvdSByZWNlaXZlZCB0aGlzIGJ1ZyBub3RpZmljYXRpb24g
YmVjYXVzZSB5b3UgYXJlIGEgbWVtYmVyIG9mIEFwcEFybW9yCkRldmVsb3BlcnMsIHdoaWNoIGlz
IHN1YnNjcmliZWQgdG8gdGhlIGJ1ZyByZXBvcnQuCmh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0
L2J1Z3MvMTkyODM2MAoKVGl0bGU6CiAgU3dpdGNoIHRvIEZjaXR4IDUgZm9yIENoaW5lc2UKClN0
YXR1cyBpbiBMdWJ1bnR1IGRlZmF1bHQgc2V0dGluZ3M6CiAgTmV3ClN0YXR1cyBpbiBVYnVudHUg
S3lsaW46CiAgSW4gUHJvZ3Jlc3MKU3RhdHVzIGluIGFwcGFybW9yIHBhY2thZ2UgaW4gVWJ1bnR1
OgogIE5ldwpTdGF0dXMgaW4gbGFuZ3VhZ2Utc2VsZWN0b3IgcGFja2FnZSBpbiBVYnVudHU6CiAg
SW4gUHJvZ3Jlc3MKCkJ1ZyBkZXNjcmlwdGlvbjoKICBJbiBEZWJpYW4gMTEgRmNpdHggNSB3aWxs
IGJlIHRoZSBkZWZhdWx0IElNIGZyYW1ld29yayBmb3IgQ2hpbmVzZSBvbgogIG5vbi1HTk9NRSBk
ZXNrdG9wcy4gSSBjYW4gdGhpbmsgaXQncyB0aW1lIHRvIG1ha2UgdGhlIGVxdWl2YWxlbnQKICBj
aGFuZ2VzIGluIFVidW50dSAyMS4xMCBhcyB3ZWxsLgoKICBJJ2QgYXBwcmVjaWF0ZSBpbnB1dCBv
biB0aGUgdG9waWMgZnJvbSB0aGUgVWJ1bnR1IEt5bGluIHRlYW0gYXMgd2VsbAogIGFzIG90aGVy
IENoaW5lc2Ugc3BlYWtpbmcgdXNlcnMuCgpUbyBtYW5hZ2Ugbm90aWZpY2F0aW9ucyBhYm91dCB0
aGlzIGJ1ZyBnbyB0bzoKaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvbHVidW50dS1kZWZhdWx0
LXNldHRpbmdzLytidWcvMTkyODM2MC8rc3Vic2NyaXB0aW9ucwoKLS0gCkFwcEFybW9yIG1haWxp
bmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1
YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBw
YXJtb3IK

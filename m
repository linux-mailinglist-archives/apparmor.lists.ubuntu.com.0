Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6BA39F7CE
	for <lists+apparmor@lfdr.de>; Tue,  8 Jun 2021 15:26:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lqbjs-00011S-L2; Tue, 08 Jun 2021 13:25:52 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1lqbjq-000119-Vk
 for apparmor@lists.ubuntu.com; Tue, 08 Jun 2021 13:25:51 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lqbjo-0000II-C9
 for <apparmor@lists.ubuntu.com>; Tue, 08 Jun 2021 13:25:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 299C22E818C
 for <apparmor@lists.ubuntu.com>; Tue,  8 Jun 2021 13:25:48 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 08 Jun 2021 13:18:04 -0000
From: handsome_feng <1928360@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=lubuntu-default-settings; status=New;
 importance=Undecided; assignee=None; 
X-Launchpad-Bug: product=snappy; status=Invalid; importance=Undecided;
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
X-Launchpad-Bug-Modifier: handsome_feng (feng-kylin)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
Message-Id: <162315828460.3253.18397464334564568531.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: e14b4eb00455d00a1b397d10c5f8353920bba418
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

PiBAaGFuZHNvbWVfZmVuZzogU2luY2UgS3lsaW4gd2lsbCBzaGlwIGJvdGggZmNpdHggNCBhbmQg
ZmNpdHggNSBpbiAyMS4xMCwgSSdtIHRoaW5raW5nIHRoYXQgS3lsaW4KPiB3b3VsZCBiZSBhIHBl
cmZlY3QgcGxhdGZvcm0gZm9yIHRlc3RpbmcgdGhpcyBpbnB1dCBjb25maWd1cmF0aW9uLiBTbyBp
dCB3b3VsZCBiZSBnb29kIGlmIHlvdQo+IGNvdWxkIGluY2x1ZGUgc29tZSB0ZXN0aW5nIGFsc28g
b2YgZmNpdHggNSBhbmQgYmUgYXR0ZW50aXZlIHRvIHBvc3NpYmxlIGlzc3VlcyBpbiBsaWdodCBv
ZiB0aGUKPiBmYWN0IHRoYXQgaXQgbG9hZHMgdGhlIGZjaXR4IDQgaW0gbW9kdWxlcyBpbnN0ZWFk
IG9mIHRoZSBmY2l0eCA1IG9uZXMuCgpPa2F5LCB3ZSB3aWxsIHRlc3QgaXQgaW4gdGhlIG5lYXIg
ZnV0dXJlLCBhbmQgaWYgdGhlcmUgYXJlIGFueSBwcm9ibGVtcywKd2Ugd2lsbCBmZWVkYmFjayBo
ZXJlLgoKLS0gCllvdSByZWNlaXZlZCB0aGlzIGJ1ZyBub3RpZmljYXRpb24gYmVjYXVzZSB5b3Ug
YXJlIGEgbWVtYmVyIG9mIEFwcEFybW9yCkRldmVsb3BlcnMsIHdoaWNoIGlzIHN1YnNjcmliZWQg
dG8gdGhlIGJ1ZyByZXBvcnQuCmh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2J1Z3MvMTkyODM2
MAoKVGl0bGU6CiAgU3dpdGNoIHRvIEZjaXR4IDUgZm9yIENoaW5lc2UKClN0YXR1cyBpbiBMdWJ1
bnR1IGRlZmF1bHQgc2V0dGluZ3M6CiAgTmV3ClN0YXR1cyBpbiBTbmFwcHk6CiAgSW52YWxpZApT
dGF0dXMgaW4gVWJ1bnR1IEt5bGluOgogIEluIFByb2dyZXNzClN0YXR1cyBpbiBpbS1jb25maWcg
cGFja2FnZSBpbiBVYnVudHU6CiAgRml4IFJlbGVhc2VkClN0YXR1cyBpbiBsYW5ndWFnZS1zZWxl
Y3RvciBwYWNrYWdlIGluIFVidW50dToKICBGaXggUmVsZWFzZWQKCkJ1ZyBkZXNjcmlwdGlvbjoK
ICBJbiBEZWJpYW4gMTEgRmNpdHggNSB3aWxsIGJlIHRoZSBkZWZhdWx0IElNIGZyYW1ld29yayBm
b3IgQ2hpbmVzZSBvbgogIG5vbi1HTk9NRSBkZXNrdG9wcy4gSSBjYW4gdGhpbmsgaXQncyB0aW1l
IHRvIG1ha2UgdGhlIGVxdWl2YWxlbnQKICBjaGFuZ2VzIGluIFVidW50dSAyMS4xMCBhcyB3ZWxs
LgoKICBJJ2QgYXBwcmVjaWF0ZSBpbnB1dCBvbiB0aGUgdG9waWMgZnJvbSB0aGUgVWJ1bnR1IEt5
bGluIHRlYW0gYXMgd2VsbAogIGFzIG90aGVyIENoaW5lc2Ugc3BlYWtpbmcgdXNlcnMuCgpUbyBt
YW5hZ2Ugbm90aWZpY2F0aW9ucyBhYm91dCB0aGlzIGJ1ZyBnbyB0bzoKaHR0cHM6Ly9idWdzLmxh
dW5jaHBhZC5uZXQvbHVidW50dS1kZWZhdWx0LXNldHRpbmdzLytidWcvMTkyODM2MC8rc3Vic2Ny
aXB0aW9ucwoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUu
Y29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVu
dHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BD738F41F
	for <lists+apparmor@lfdr.de>; Mon, 24 May 2021 22:15:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1llGzG-0005mW-2G; Mon, 24 May 2021 20:15:42 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1llGzE-0005mK-Tv
 for apparmor@lists.ubuntu.com; Mon, 24 May 2021 20:15:40 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1llGzD-0005hb-Sk
 for <apparmor@lists.ubuntu.com>; Mon, 24 May 2021 20:15:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D50E02E8187
 for <apparmor@lists.ubuntu.com>; Mon, 24 May 2021 20:15:39 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 24 May 2021 20:07:57 -0000
From: Seth Arnold <1928360@bugs.launchpad.net>
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
X-Launchpad-Bug-Modifier: Seth Arnold (seth-arnold)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
Message-Id: <162188687731.31553.1780268819540947754.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ba75dbf44f1013379e594c259682f14c0528180a"; Instance="production"
X-Launchpad-Hash: 7c2643e75865a989d37d397ff0ca7d9b2dcaec48
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

R3VubmFyLCBpbmRlZWQsIGl0IGhhZCBtdWNoIGxlc3MgaW4gaXQgdGhhbiBJIGV4cGVjdGVkOyBJ
IGRvbid0IGtub3cKbXVjaCBhYm91dCB0aGUgc25hcCBwYWNrYWdpbmcgZm9yIENocm9taXVtLCBi
dXQgaXQgbG9va2VkIHRvIG1lIGxpa2UgaXQKd2FzIHRyeWluZyB0byBkbyBibHVldG9vdGggdGhp
bmdzIGFuZCB0aGF0J3MgYWxsIHRoYXQgd2FzIGRlbmllZC4KCkknbSBubyBmY2l0eCBleHBlcnQg
YnV0IEkgZGlkbid0IHRoaW5rIGl0IGxvb2tlZCByZWxhdGVkLgoKVGhhbmtzCgotLSAKWW91IHJl
Y2VpdmVkIHRoaXMgYnVnIG5vdGlmaWNhdGlvbiBiZWNhdXNlIHlvdSBhcmUgYSBtZW1iZXIgb2Yg
QXBwQXJtb3IKRGV2ZWxvcGVycywgd2hpY2ggaXMgc3Vic2NyaWJlZCB0byB0aGUgYnVnIHJlcG9y
dC4KaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvYnVncy8xOTI4MzYwCgpUaXRsZToKICBTd2l0
Y2ggdG8gRmNpdHggNSBmb3IgQ2hpbmVzZQoKU3RhdHVzIGluIEx1YnVudHUgZGVmYXVsdCBzZXR0
aW5nczoKICBOZXcKU3RhdHVzIGluIFVidW50dSBLeWxpbjoKICBJbiBQcm9ncmVzcwpTdGF0dXMg
aW4gYXBwYXJtb3IgcGFja2FnZSBpbiBVYnVudHU6CiAgTmV3ClN0YXR1cyBpbiBsYW5ndWFnZS1z
ZWxlY3RvciBwYWNrYWdlIGluIFVidW50dToKICBGaXggUmVsZWFzZWQKCkJ1ZyBkZXNjcmlwdGlv
bjoKICBJbiBEZWJpYW4gMTEgRmNpdHggNSB3aWxsIGJlIHRoZSBkZWZhdWx0IElNIGZyYW1ld29y
ayBmb3IgQ2hpbmVzZSBvbgogIG5vbi1HTk9NRSBkZXNrdG9wcy4gSSBjYW4gdGhpbmsgaXQncyB0
aW1lIHRvIG1ha2UgdGhlIGVxdWl2YWxlbnQKICBjaGFuZ2VzIGluIFVidW50dSAyMS4xMCBhcyB3
ZWxsLgoKICBJJ2QgYXBwcmVjaWF0ZSBpbnB1dCBvbiB0aGUgdG9waWMgZnJvbSB0aGUgVWJ1bnR1
IEt5bGluIHRlYW0gYXMgd2VsbAogIGFzIG90aGVyIENoaW5lc2Ugc3BlYWtpbmcgdXNlcnMuCgpU
byBtYW5hZ2Ugbm90aWZpY2F0aW9ucyBhYm91dCB0aGlzIGJ1ZyBnbyB0bzoKaHR0cHM6Ly9idWdz
LmxhdW5jaHBhZC5uZXQvbHVidW50dS1kZWZhdWx0LXNldHRpbmdzLytidWcvMTkyODM2MC8rc3Vi
c2NyaXB0aW9ucwoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVu
dHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51
YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

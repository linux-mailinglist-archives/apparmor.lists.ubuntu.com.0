Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F5739EF1A
	for <lists+apparmor@lfdr.de>; Tue,  8 Jun 2021 08:56:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lqVeq-0001bi-DL; Tue, 08 Jun 2021 06:56:16 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1lqVeo-0001b9-IJ
 for apparmor@lists.ubuntu.com; Tue, 08 Jun 2021 06:56:14 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lqVek-0006w6-89
 for <apparmor@lists.ubuntu.com>; Tue, 08 Jun 2021 06:56:10 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 685B82E81A9
 for <apparmor@lists.ubuntu.com>; Tue,  8 Jun 2021 06:56:07 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 08 Jun 2021 06:48:57 -0000
From: Gunnar Hjalmarsson <1928360@bugs.launchpad.net>
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
X-Launchpad-Bug-Modifier: Gunnar Hjalmarsson (gunnarhj)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
Message-Id: <162313493725.14727.3402624254391036222.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: b9636f019b3cd561aebb51656fd6ff498fdf41bc
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

U28gaXQgd2FzIGNoYW5nZWQgaW4gaW0tY29uZmlnLiBJbiBEZWJpYW4gdGhlIGNoYW5nZSB3YXMg
dXBsb2FkZWQgdG8KZXhwZXJpbWVudGFsIGluc3RlYWQgb2YgdW5zdGFibGUvYnVsbHNleWUgZm9y
IG5vdywgc2luY2UgdGhlIHByaW5jaXBhbApmY2l0eCBwYWNrYWdlIG1haW50YWluZXIgU2hlbmdq
aW5nIFpodSBzZW5zZXMgc29tZSBkZWdyZWUgb2YKdW5jZXJ0YWludHkuIEhlIHdhbnRzIHRvIGdp
dmUgdGhlIHVzZXJzIHNvbWUgdGltZSB0byBwcm92aWRlIGZlZWRiYWNrCmJlZm9yZSBjaGFuZ2lu
ZyBpdCBpbiBidWxsc2V5ZSAoRGViaWFuIDExKS4KCkBoYW5kc29tZV9mZW5nOiBTaW5jZSBLeWxp
biB3aWxsIHNoaXAgYm90aCBmY2l0eCA0IGFuZCBmY2l0eCA1IGluIDIxLjEwLApJJ20gdGhpbmtp
bmcgdGhhdCBLeWxpbiB3b3VsZCBiZSBhIHBlcmZlY3QgcGxhdGZvcm0gZm9yIHRlc3RpbmcgdGhp
cwppbnB1dCBjb25maWd1cmF0aW9uLiBTbyBpdCB3b3VsZCBiZSBnb29kIGlmIHlvdSBjb3VsZCBp
bmNsdWRlIHNvbWUKdGVzdGluZyBhbHNvIG9mIGZjaXR4IDUgYW5kIGJlIGF0dGVudGl2ZSB0byBw
b3NzaWJsZSBpc3N1ZXMgaW4gbGlnaHQgb2YKdGhlIGZhY3QgdGhhdCBpdCBsb2FkcyB0aGUgZmNp
dHggNCBpbSBtb2R1bGVzIGluc3RlYWQgb2YgdGhlIGZjaXR4IDUKb25lcy4KCkBKYW1lczogTGVh
dmluZyB0aGUganVzdCBtZW50aW9uZWQgdW5jZXJ0YWludHkgYXNpZGUsIHdlIGNhbiBjb25jbHVk
ZQp0aGF0IHRoZXJlIHNlZW1zIHRvIGJlIG5vIG5lZWQgdG8gbWFrZSBhbnkgY2hhbmdlcyB0byB0
aGUgY29yZTE4IGJhc2VkCnBsYXRmb3JtIHNuYXBzLiBBbiB1cHN0cmVhbSBjaGFuZ2Ugd2FzIG1h
ZGUgaW4gZmNpdHg1IDUuMC41IHdpdGggdGhlCmV4cGxpY2l0IHB1cnBvc2UgdG8gZGVhbCB3aXRo
IGUuZy4gc25hcHMgd2hlcmUgb25seSBmY2l0eCA0IGltIG1vZHVsZXMKYXJlIHByZXNlbnQ7IHNl
ZSA8aHR0cHM6Ly9idWdzLmRlYmlhbi5vcmcvOTc3MjAzIzM0Pi4KCkJ1dCBpdCB3b3VsZCBiZSBn
b29kIGlmIHdlIHNvbWVob3cgY291bGQgdGVzdCB0byBjb25maXJtIHRoYXQgZmNpdHggNQp3b3Jr
cyB3aXRoIGEgY29yZTIwIGJhc2VkIHBsYXRmb3JtIHNuYXAgd2l0aG91dCBtb2RpZnlpbmcgdGhl
IGFwcGFybW9yCmFic3RyYWN0aW9ucyBmb3IgZmNpdHguCgotLSAKWW91IHJlY2VpdmVkIHRoaXMg
YnVnIG5vdGlmaWNhdGlvbiBiZWNhdXNlIHlvdSBhcmUgYSBtZW1iZXIgb2YgQXBwQXJtb3IKRGV2
ZWxvcGVycywgd2hpY2ggaXMgc3Vic2NyaWJlZCB0byB0aGUgYnVnIHJlcG9ydC4KaHR0cHM6Ly9i
dWdzLmxhdW5jaHBhZC5uZXQvYnVncy8xOTI4MzYwCgpUaXRsZToKICBTd2l0Y2ggdG8gRmNpdHgg
NSBmb3IgQ2hpbmVzZQoKU3RhdHVzIGluIEx1YnVudHUgZGVmYXVsdCBzZXR0aW5nczoKICBOZXcK
U3RhdHVzIGluIFNuYXBweToKICBOZXcKU3RhdHVzIGluIFVidW50dSBLeWxpbjoKICBJbiBQcm9n
cmVzcwpTdGF0dXMgaW4gaW0tY29uZmlnIHBhY2thZ2UgaW4gVWJ1bnR1OgogIEZpeCBSZWxlYXNl
ZApTdGF0dXMgaW4gbGFuZ3VhZ2Utc2VsZWN0b3IgcGFja2FnZSBpbiBVYnVudHU6CiAgRml4IFJl
bGVhc2VkCgpCdWcgZGVzY3JpcHRpb246CiAgSW4gRGViaWFuIDExIEZjaXR4IDUgd2lsbCBiZSB0
aGUgZGVmYXVsdCBJTSBmcmFtZXdvcmsgZm9yIENoaW5lc2Ugb24KICBub24tR05PTUUgZGVza3Rv
cHMuIEkgY2FuIHRoaW5rIGl0J3MgdGltZSB0byBtYWtlIHRoZSBlcXVpdmFsZW50CiAgY2hhbmdl
cyBpbiBVYnVudHUgMjEuMTAgYXMgd2VsbC4KCiAgSSdkIGFwcHJlY2lhdGUgaW5wdXQgb24gdGhl
IHRvcGljIGZyb20gdGhlIFVidW50dSBLeWxpbiB0ZWFtIGFzIHdlbGwKICBhcyBvdGhlciBDaGlu
ZXNlIHNwZWFraW5nIHVzZXJzLgoKVG8gbWFuYWdlIG5vdGlmaWNhdGlvbnMgYWJvdXQgdGhpcyBi
dWcgZ28gdG86Cmh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2x1YnVudHUtZGVmYXVsdC1zZXR0
aW5ncy8rYnVnLzE5MjgzNjAvK3N1YnNjcmlwdGlvbnMKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxp
c3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3Jp
YmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9y
Cg==

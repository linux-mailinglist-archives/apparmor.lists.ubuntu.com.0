Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC3839EF9C
	for <lists+apparmor@lfdr.de>; Tue,  8 Jun 2021 09:31:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lqWCO-0003tb-HL; Tue, 08 Jun 2021 07:30:56 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1lqWCM-0003sb-3d
 for apparmor@lists.ubuntu.com; Tue, 08 Jun 2021 07:30:54 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lqWCJ-0006Kf-Jl
 for <apparmor@lists.ubuntu.com>; Tue, 08 Jun 2021 07:30:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4B1912E8189
 for <apparmor@lists.ubuntu.com>; Tue,  8 Jun 2021 07:30:51 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 08 Jun 2021 07:20:56 -0000
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
Message-Id: <162313685640.13992.17391299114721889736.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: 5a64bc24fd3310b3b1a708248d70cd950d0d0b29
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

T24gMjAyMS0wNi0wOCAwODo1NCwgSmFtZXMgSGVuc3RyaWRnZSB3cm90ZToKPj4gSXMgdGhlcmUg
c3VjaCBhIHNuYXAgeW91IGNvdWxkIHBvaW50IG1lIHRvIHNvIEkgY2FuIHRlc3Q/Cj4gCj4gVGhl
IGNhbmRpZGF0ZSBjaGFubmVsIG9mIHRoZSBnZWRpdCBzbmFwIGlzIGJ1aWx0IHdpdGggY29yZTIw
IGFuZCB0aGUKPiBnbm9tZS0zLTM4LTIwMDQgcGxhdGZvcm0gc25hcC4gIEJ1dCBhcyBJIHNhaWQs
IEkgZG9uJ3QgdGhpbmsgdGhhdAo+IHBsYXRmb3JtIHNuYXAgY3VycmVudGx5IGluY2x1ZGVzIHRo
ZSBmY2l0eDUgaW5wdXQgbW9kdWxlLgoKUmlnaHQuCgokIGxzIC9zbmFwL2dub21lLTMtMzgtMjAw
NC9jdXJyZW50L3Vzci9saWIveDg2XzY0LWxpbnV4LWdudS9ndGstMy4wLzMuMC4wL2ltbW9kdWxl
cyB8IGdyZXAgZmNpdHgKaW0tZmNpdHguc28KClNvIHRoZW4gbGV0J3MgY29uc2lkZXIgdGhhdCBh
IHNlcGFyYXRlIG1hdHRlciB0byBiZSBhZGRyZXNzZWQgbGF0ZXIuCgotLSAKWW91IHJlY2VpdmVk
IHRoaXMgYnVnIG5vdGlmaWNhdGlvbiBiZWNhdXNlIHlvdSBhcmUgYSBtZW1iZXIgb2YgQXBwQXJt
b3IKRGV2ZWxvcGVycywgd2hpY2ggaXMgc3Vic2NyaWJlZCB0byB0aGUgYnVnIHJlcG9ydC4KaHR0
cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvYnVncy8xOTI4MzYwCgpUaXRsZToKICBTd2l0Y2ggdG8g
RmNpdHggNSBmb3IgQ2hpbmVzZQoKU3RhdHVzIGluIEx1YnVudHUgZGVmYXVsdCBzZXR0aW5nczoK
ICBOZXcKU3RhdHVzIGluIFNuYXBweToKICBOZXcKU3RhdHVzIGluIFVidW50dSBLeWxpbjoKICBJ
biBQcm9ncmVzcwpTdGF0dXMgaW4gaW0tY29uZmlnIHBhY2thZ2UgaW4gVWJ1bnR1OgogIEZpeCBS
ZWxlYXNlZApTdGF0dXMgaW4gbGFuZ3VhZ2Utc2VsZWN0b3IgcGFja2FnZSBpbiBVYnVudHU6CiAg
Rml4IFJlbGVhc2VkCgpCdWcgZGVzY3JpcHRpb246CiAgSW4gRGViaWFuIDExIEZjaXR4IDUgd2ls
bCBiZSB0aGUgZGVmYXVsdCBJTSBmcmFtZXdvcmsgZm9yIENoaW5lc2Ugb24KICBub24tR05PTUUg
ZGVza3RvcHMuIEkgY2FuIHRoaW5rIGl0J3MgdGltZSB0byBtYWtlIHRoZSBlcXVpdmFsZW50CiAg
Y2hhbmdlcyBpbiBVYnVudHUgMjEuMTAgYXMgd2VsbC4KCiAgSSdkIGFwcHJlY2lhdGUgaW5wdXQg
b24gdGhlIHRvcGljIGZyb20gdGhlIFVidW50dSBLeWxpbiB0ZWFtIGFzIHdlbGwKICBhcyBvdGhl
ciBDaGluZXNlIHNwZWFraW5nIHVzZXJzLgoKVG8gbWFuYWdlIG5vdGlmaWNhdGlvbnMgYWJvdXQg
dGhpcyBidWcgZ28gdG86Cmh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2x1YnVudHUtZGVmYXVs
dC1zZXR0aW5ncy8rYnVnLzE5MjgzNjAvK3N1YnNjcmlwdGlvbnMKCi0tIApBcHBBcm1vciBtYWls
aW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5z
dWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2Fw
cGFybW9yCg==

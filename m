Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 8215439C4D2
	for <lists+apparmor@lfdr.de>; Sat,  5 Jun 2021 03:35:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lpLDu-00021T-Eg; Sat, 05 Jun 2021 01:35:38 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1lpLDp-00021A-Uf
 for apparmor@lists.ubuntu.com; Sat, 05 Jun 2021 01:35:33 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lpLDo-00035S-N6
 for <apparmor@lists.ubuntu.com>; Sat, 05 Jun 2021 01:35:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A7DEB2E818A
 for <apparmor@lists.ubuntu.com>; Sat,  5 Jun 2021 01:35:32 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 05 Jun 2021 01:27:19 -0000
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
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=language-selector;
 component=main; status=Fix Released; importance=Undecided;
 assignee=gunnarhj@ubuntu.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: feng-kylin gunnarhj janitor seth-arnold
X-Launchpad-Bug-Reporter: Gunnar Hjalmarsson (gunnarhj)
X-Launchpad-Bug-Modifier: Gunnar Hjalmarsson (gunnarhj)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
Message-Id: <162285643961.2791.2343187171891122867.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: dadea4df7a3074d36d551ff3c58f773b2f06115a
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

SSBwcmVzZW50ZWQgdGhlIHNuYXAgcHJvYmxlbSBmb3IgSmFtZXMgSGVuc3RyaWRnZSwgYW5kIGhl
IGdhdmUgbWUgYSB2ZXJ5CnVzZWZ1bCBoaW50OiBUaGUgQ2hyb21pdW0gc25hcCBtYWtlcyB1c2Ug
b2YgdGhlIGJpb25pYyBsaWJyYXJ5IHN0YWNrCih0aGUgZ25vbWUtMy0yOC0xODA0IHNuYXApIGlu
Y2x1ZGluZyB0aGUgaW0gbW9kdWxlIGluc3RhbGxlZCBieSBmY2l0eC0KZnJvbnRlbmQtZ3RrMywg
aS5lLiB0aGUgZmNpdHggNCBndGsgaW0gbW9kdWxlLgoKVGhhdCBtYWRlIG1lIHRoaW5rIG9mIDxo
dHRwczovL2J1Z3MuZGViaWFuLm9yZy85NzcyMDM+LiBUaGF0IGJ1ZyBpcwpzdGlsbCBvcGVuLCBh
bmQgYXMgYSByZXN1bHQgaW0tY29uZmlnIGN1cnJlbnRseSBzZXRzIHRoZXNlIHZhcmlhYmxlcyBm
b3IKZmNpdHggNToKCkdUS19JTV9NT0RVTEU9ZmNpdHg1ClhNT0RJRklFUlM9QGltPWZjaXR4ClFU
X0lNX01PRFVMRT1mY2l0eDUKCkl0IG1lYW5zIHRoYXQgaXQgZXhwbGljaXRseSBsb29rcyBmb3Ig
dGhlIGZjaXR4IDUgZ3RrIGltIG1vZHVsZSwgd2hpbGUKQ2hyb21pdW0gb25seSBoYXMgYWNjZXNz
IHRvIHRoZSBmY2l0eCA0IG9uZS4KClNvIGFzIGEgdGVzdCBJIHR3ZWFrZWQgaW0tY29uZmlnIHRv
IHNldDoKCkdUS19JTV9NT0RVTEU9ZmNpdHgKWE1PRElGSUVSUz1AaW09ZmNpdHgKUVRfSU1fTU9E
VUxFPWZjaXR4CgphbmQgdGhhdCBtYWRlIGEgZGlmZmVyZW5jZS4gV2l0aCB0aGF0IGVudmlyb25t
ZW50IEkgY291bGQgc3VjY2Vzc2Z1bGx5CmlucHV0IGJlYXV0aWZ1bCBDaGluZXNlIGNoYXJhY3Rl
cnMgaW4gQ2hyb21pdW0gdXNpbmcgZmNpdHggNS4gOikKCkNvbnNlcXVlbnRseSB0aGVyZSBzZWVt
cyB0byBiZSBubyBuZWVkIHRvIGFkZCBhbnkgZXh0cmEgc3R1ZmYgdG8KYXBwYXJtb3IgdG8gaGFu
ZGxlIGZjaXR4IDUuIEluc3RlYWQgSSBzZWUgdHdvIG9wdGlvbnM6CgoxLiBDaGFuZ2UgaW0tY29u
ZmlnJ3MgdmFyaWFibGUgYXNzaWdubWVudCwgb3IKCjIuIHNvbWVob3cgYWRkIHRoZSBmY2l0eCA1
IGltIG1vZHVsZXMgZm9yIGd0ayBhbmQgcXQgdG8gdGhlIHNuYXAgbGlicmFyeQpzdGFjay4KCkkn
bSBnb2luZyB0byBjb25zdWx0IHdpdGggRGViaWFuJ3MgaW5wdXQgbWV0aG9kIHRlYW0gYWJvdXQg
d2hpY2ggcm91dGUKaXMgcHJlZmVyYWJsZS4KCkBKYW1lczogRG8geW91IHNlZSBhIHByb2JsZW0g
ZnJvbSB5b3VyIFBPViB3aXRoIGFkZGluZyB0aGUgZmNpdHggNSBpbQptb2R1bGVzIHRvIHRoZSBz
bmFwcz8KCioqIEJ1ZyB3YXRjaCBhZGRlZDogRGViaWFuIEJ1ZyB0cmFja2VyICM5NzcyMDMKICAg
aHR0cHM6Ly9idWdzLmRlYmlhbi5vcmcvY2dpLWJpbi9idWdyZXBvcnQuY2dpP2J1Zz05NzcyMDMK
CioqIEFsc28gYWZmZWN0czogc25hcHB5CiAgIEltcG9ydGFuY2U6IFVuZGVjaWRlZAogICAgICAg
U3RhdHVzOiBOZXcKCioqIFBhY2thZ2UgY2hhbmdlZDogYXBwYXJtb3IgKFVidW50dSkgPT4gaW0t
Y29uZmlnIChVYnVudHUpCgotLSAKWW91IHJlY2VpdmVkIHRoaXMgYnVnIG5vdGlmaWNhdGlvbiBi
ZWNhdXNlIHlvdSBhcmUgYSBtZW1iZXIgb2YgQXBwQXJtb3IKRGV2ZWxvcGVycywgd2hpY2ggaXMg
c3Vic2NyaWJlZCB0byB0aGUgYnVnIHJlcG9ydC4KaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQv
YnVncy8xOTI4MzYwCgpUaXRsZToKICBTd2l0Y2ggdG8gRmNpdHggNSBmb3IgQ2hpbmVzZQoKU3Rh
dHVzIGluIEx1YnVudHUgZGVmYXVsdCBzZXR0aW5nczoKICBOZXcKU3RhdHVzIGluIFNuYXBweToK
ICBOZXcKU3RhdHVzIGluIFVidW50dSBLeWxpbjoKICBJbiBQcm9ncmVzcwpTdGF0dXMgaW4gaW0t
Y29uZmlnIHBhY2thZ2UgaW4gVWJ1bnR1OgogIE5ldwpTdGF0dXMgaW4gbGFuZ3VhZ2Utc2VsZWN0
b3IgcGFja2FnZSBpbiBVYnVudHU6CiAgRml4IFJlbGVhc2VkCgpCdWcgZGVzY3JpcHRpb246CiAg
SW4gRGViaWFuIDExIEZjaXR4IDUgd2lsbCBiZSB0aGUgZGVmYXVsdCBJTSBmcmFtZXdvcmsgZm9y
IENoaW5lc2Ugb24KICBub24tR05PTUUgZGVza3RvcHMuIEkgY2FuIHRoaW5rIGl0J3MgdGltZSB0
byBtYWtlIHRoZSBlcXVpdmFsZW50CiAgY2hhbmdlcyBpbiBVYnVudHUgMjEuMTAgYXMgd2VsbC4K
CiAgSSdkIGFwcHJlY2lhdGUgaW5wdXQgb24gdGhlIHRvcGljIGZyb20gdGhlIFVidW50dSBLeWxp
biB0ZWFtIGFzIHdlbGwKICBhcyBvdGhlciBDaGluZXNlIHNwZWFraW5nIHVzZXJzLgoKVG8gbWFu
YWdlIG5vdGlmaWNhdGlvbnMgYWJvdXQgdGhpcyBidWcgZ28gdG86Cmh0dHBzOi8vYnVncy5sYXVu
Y2hwYWQubmV0L2x1YnVudHUtZGVmYXVsdC1zZXR0aW5ncy8rYnVnLzE5MjgzNjAvK3N1YnNjcmlw
dGlvbnMKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNv
bQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

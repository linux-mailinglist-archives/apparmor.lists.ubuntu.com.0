Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A81F21F8A1F
	for <lists+apparmor@lfdr.de>; Sun, 14 Jun 2020 20:35:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1jkXTE-00027f-Rs; Sun, 14 Jun 2020 18:35:04 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1jkXTC-00027R-Mf
 for apparmor@lists.ubuntu.com; Sun, 14 Jun 2020 18:35:02 +0000
Received: from gac.canonical.com ([91.189.90.20])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jkXTC-0001uP-J4
 for <apparmor@lists.ubuntu.com>; Sun, 14 Jun 2020 18:35:02 +0000
Received: from gac.canonical.com (localhost [IPv6:::1])
 by gac.canonical.com (Postfix) with ESMTPS id 786EE5C006A
 for <apparmor@lists.ubuntu.com>; Sun, 14 Jun 2020 18:35:02 +0000 (UTC)
MIME-Version: 1.0
Date: Sun, 14 Jun 2020 18:35:02 -0000
From: Launchpad Bug Tracker <1859361@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=apparmor; status=New; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=apparmor-profiles; status=Confirmed;
 importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor tim8816 zerosan
X-Launchpad-Bug-Reporter: Zero (zerosan)
X-Launchpad-Bug-Duplicate: 1777070
References: <157885984563.5281.6176408751371188854.malonedeb@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Message-Id: <159215970246.8060.4484297940616329388.launchpad@gac.canonical.com>
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b190cebbf563f89e480a8b57f641753c8196bda0";
 Instance="appserver-secrets-lazr.conf"
X-Launchpad-Hash: 9780c60a3b6c52fb793d422e5c4bc96b2b1c32c8
Subject: [apparmor] [Bug 1859361] [NEW] Firefox profile causes widevine DRM
	to crash
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
Reply-To: Bug 1859361 <1859361@bugs.launchpad.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

WW91IGhhdmUgYmVlbiBzdWJzY3JpYmVkIHRvIGEgcHVibGljIGJ1ZyBieSBUaW0gKHRpbTg4MTYp
OgoKU3RlcHMgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZToKPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQoxKSBFbmFibGUgZGlnaXRhbCByaWdodHMgbWFuYWdlbWVudCBzdXBwb3J0IGluIEZp
cmVGb3ggKFByZWZlcmVuY2VzIC0+IEdlbmVyYWwpCjIpIHN1ZG8gYWEtZW5mb3JjZSAvZXRjL2Fw
cGFybW9yLmQvdXNyLmJpbi5maXJlZm94CjMpIE5hdmlnYXRlIHRvIGEgc2l0ZSB3aGljaCBoYXMg
cHJvdGVjdGVkIGNvbnRlbnQgKEkgdGVzdGVkIHRoaXMgdXNpbmcgY3J1bmNoeXJvbGwuY29tKQoK
RmlyZUZveCBzaG91bGQgZGlzcGxheSBhIHllbGxvdyBiYXIgYXQgdGhlIHRvcCBsZXR0aW5nIHlv
dSBrbm93IFdpZGV2aW5lCmhhcyBjcmFzaGVkLgoKCldvcmthcm91bmQ6Cj09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0KSSBjb3JyZWN0ZWQgdGhpcyBwcm9ibGVtIGJ5IGFkZGluZyB0aGUg
Zm9sbG93aW5nIGxpbmUgdG8gdXNyLmJpbi5maXJlZm94OgoKb3duZXIgL2hvbWUvKi8ubW96aWxs
YS9maXJlZm94L3J1dHN0aTNvLmRlZmF1bHQtcmVsZWFzZS9nbXAtCndpZGV2aW5lY2RtLzQuMTAu
MTQ0MC4xOS9saWJ3aWRldmluZWNkbS5zbyBtLAoKCkNvbmNsdXNpb246Cj09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0KTWF5YmUgdGhlIGRlZmF1bHQgRmlyZUZveCBwcm9maWxlIGNhbiBi
ZSB1cGRhdGVkIGluIGEgd2F5IHRoYXQgYWxsb3dzIGl0IHRvIHBsYXkgbmljZSB3aXRoIFdpZGV2
aW5lIGluIHRoZSBmdXR1cmUuCgoqKiBBZmZlY3RzOiBhcHBhcm1vcgogICAgIEltcG9ydGFuY2U6
IFVuZGVjaWRlZAogICAgICAgICBTdGF0dXM6IE5ldwoKKiogQWZmZWN0czogYXBwYXJtb3ItcHJv
ZmlsZXMKICAgICBJbXBvcnRhbmNlOiBVbmRlY2lkZWQKICAgICAgICAgU3RhdHVzOiBDb25maXJt
ZWQKCi0tIApGaXJlZm94IHByb2ZpbGUgY2F1c2VzIHdpZGV2aW5lIERSTSB0byBjcmFzaApodHRw
czovL2J1Z3MubGF1bmNocGFkLm5ldC9idWdzLzE4NTkzNjEKWW91IHJlY2VpdmVkIHRoaXMgYnVn
IG5vdGlmaWNhdGlvbiBiZWNhdXNlIHlvdSBhcmUgYSBtZW1iZXIgb2YgQXBwQXJtb3IgRGV2ZWxv
cGVycywgd2hpY2ggaXMgc3Vic2NyaWJlZCB0byB0aGUgYnVnIHJlcG9ydC4KCi0tIApBcHBBcm1v
ciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mg
b3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2FwcGFybW9yCg==

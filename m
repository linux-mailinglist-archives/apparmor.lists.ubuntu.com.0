Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 231872981A3
	for <lists+apparmor@lfdr.de>; Sun, 25 Oct 2020 13:25:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kWf5l-0004N2-Bp; Sun, 25 Oct 2020 12:25:45 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1kWf5j-0004MD-Lm
 for apparmor@lists.ubuntu.com; Sun, 25 Oct 2020 12:25:43 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kWf5j-0002cU-70
 for <apparmor@lists.ubuntu.com>; Sun, 25 Oct 2020 12:25:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2DE132E804B
 for <apparmor@lists.ubuntu.com>; Sun, 25 Oct 2020 12:25:43 +0000 (UTC)
MIME-Version: 1.0
Date: Sun, 25 Oct 2020 12:17:36 -0000
From: baptx <1859361@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=apparmor; status=New; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=apparmor-profiles; status=Confirmed;
 importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: b4ptx janitor tim8816 zerosan
X-Launchpad-Bug-Reporter: Zero (zerosan)
X-Launchpad-Bug-Modifier: baptx (b4ptx)
X-Launchpad-Bug-Duplicate: 1777070
References: <157885984563.5281.6176408751371188854.malonedeb@gac.canonical.com>
Message-Id: <160362825623.29558.10414707475177559783.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bc5a16cfdc4ba776ecdf84a052201ef8fb1f3321"; Instance="production"
X-Launchpad-Hash: b35af2b481ad8cf7e9f140cc07153e87a6708419
Subject: [apparmor] [Bug 1859361] Re: Firefox profile causes widevine DRM to
	crash
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

KioqIFRoaXMgYnVnIGlzIGEgZHVwbGljYXRlIG9mIGJ1ZyAxNzc3MDcwICoqKgogICAgaHR0cHM6
Ly9idWdzLmxhdW5jaHBhZC5uZXQvYnVncy8xNzc3MDcwCgpTaW5jZSB0aGlzIGlzc3VlIGlzIG1h
cmtlZCBhcyBkdXBsaWNhdGUgb2YgYnVnICMxNzc3MDcwLCBsZXQncyBjb250aW51ZSB0aGUgZGlz
Y3Vzc2lvbiB0aGVyZTogaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1bnR1Lytzb3VyY2Uv
ZmlyZWZveC8rYnVnLzE3NzcwNzAKSSBhZGRlZCBhIG5ldyBjb21tZW50LgoKLS0gCllvdSByZWNl
aXZlZCB0aGlzIGJ1ZyBub3RpZmljYXRpb24gYmVjYXVzZSB5b3UgYXJlIGEgbWVtYmVyIG9mIEFw
cEFybW9yCkRldmVsb3BlcnMsIHdoaWNoIGlzIHN1YnNjcmliZWQgdG8gdGhlIGJ1ZyByZXBvcnQu
Cmh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2J1Z3MvMTg1OTM2MQoKVGl0bGU6CiAgRmlyZWZv
eCBwcm9maWxlIGNhdXNlcyB3aWRldmluZSBEUk0gdG8gY3Jhc2gKClN0YXR1cyBpbiBBcHBBcm1v
cjoKICBOZXcKU3RhdHVzIGluIEFwcEFybW9yIFByb2ZpbGVzOgogIENvbmZpcm1lZAoKQnVnIGRl
c2NyaXB0aW9uOgogIFN0ZXBzIHRvIHJlcHJvZHVjZSB0aGUgaXNzdWU6CiAgPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQogIDEpIEVuYWJsZSBkaWdpdGFsIHJpZ2h0cyBtYW5hZ2VtZW50
IHN1cHBvcnQgaW4gRmlyZUZveCAoUHJlZmVyZW5jZXMgLT4gR2VuZXJhbCkKICAyKSBzdWRvIGFh
LWVuZm9yY2UgL2V0Yy9hcHBhcm1vci5kL3Vzci5iaW4uZmlyZWZveAogIDMpIE5hdmlnYXRlIHRv
IGEgc2l0ZSB3aGljaCBoYXMgcHJvdGVjdGVkIGNvbnRlbnQgKEkgdGVzdGVkIHRoaXMgdXNpbmcg
Y3J1bmNoeXJvbGwuY29tKQoKICBGaXJlRm94IHNob3VsZCBkaXNwbGF5IGEgeWVsbG93IGJhciBh
dCB0aGUgdG9wIGxldHRpbmcgeW91IGtub3cKICBXaWRldmluZSBoYXMgY3Jhc2hlZC4KCiAgCiAg
V29ya2Fyb3VuZDoKICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAgSSBjb3JyZWN0
ZWQgdGhpcyBwcm9ibGVtIGJ5IGFkZGluZyB0aGUgZm9sbG93aW5nIGxpbmUgdG8gdXNyLmJpbi5m
aXJlZm94OgoKICBvd25lciAvaG9tZS8qLy5tb3ppbGxhL2ZpcmVmb3gvcnV0c3RpM28uZGVmYXVs
dC1yZWxlYXNlL2dtcC0KICB3aWRldmluZWNkbS80LjEwLjE0NDAuMTkvbGlid2lkZXZpbmVjZG0u
c28gbSwKCiAgCiAgQ29uY2x1c2lvbjoKICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
CiAgTWF5YmUgdGhlIGRlZmF1bHQgRmlyZUZveCBwcm9maWxlIGNhbiBiZSB1cGRhdGVkIGluIGEg
d2F5IHRoYXQgYWxsb3dzIGl0IHRvIHBsYXkgbmljZSB3aXRoIFdpZGV2aW5lIGluIHRoZSBmdXR1
cmUuCgpUbyBtYW5hZ2Ugbm90aWZpY2F0aW9ucyBhYm91dCB0aGlzIGJ1ZyBnbyB0bzoKaHR0cHM6
Ly9idWdzLmxhdW5jaHBhZC5uZXQvYXBwYXJtb3IvK2J1Zy8xODU5MzYxLytzdWJzY3JpcHRpb25z
CgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9k
aWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20v
bWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

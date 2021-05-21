Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD1938BDB4
	for <lists+apparmor@lfdr.de>; Fri, 21 May 2021 07:00:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ljxHG-0002SO-W6; Fri, 21 May 2021 05:00:50 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1ljxHF-0002S3-EZ
 for apparmor@lists.ubuntu.com; Fri, 21 May 2021 05:00:49 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1ljxHE-0000wz-8n
 for <apparmor@lists.ubuntu.com>; Fri, 21 May 2021 05:00:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3278E2E8086
 for <apparmor@lists.ubuntu.com>; Fri, 21 May 2021 05:00:48 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 21 May 2021 04:52:08 -0000
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
 component=main; status=Fix Committed; importance=Undecided;
 assignee=gunnarhj@ubuntu.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: feng-kylin gunnarhj seth-arnold
X-Launchpad-Bug-Reporter: Gunnar Hjalmarsson (gunnarhj)
X-Launchpad-Bug-Modifier: Gunnar Hjalmarsson (gunnarhj)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
Message-Id: <162157272872.9204.7207159098245356333.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="efc28e2b5d587feb8d4730501a578b7c3feee810"; Instance="production"
X-Launchpad-Hash: 6974742e7b8aa6f614ddec60530af5cc902104cf
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

VGhhbmtzIGhhbmRzb21lX2ZlbmchCgpUaGUgS3lsaW4gZGlzY3Vzc2lvbiBtYWtlcyBtZSBjb25m
aWRlbnQgdGhhdCBpdCdzIGZpbmUgZm9yIEx1YnVudHUgYXMKd2VsbC4gVGhlIEx1YnVudHUgc2l0
dWF0aW9uIGlzIGRpZmZlcmVudCwgdGhvdWdoLCBzaW5jZSBpbS1jb25maWcgaXMKZGlzYWJsZWQg
YnkgZGVmYXVsdCB1bmxlc3MgYSBDaGluZXNlIGxvY2FsZSBpcyBpbiBlZmZlY3QuIFRoaXMgZGlz
Y291cnNlCnRvcGljIGNvbWVzIHRvIG1pbmQ6CgpodHRwczovL2Rpc2NvdXJzZS51YnVudHUuY29t
L3QvZGVmYXVsdC1pbS1jb25maWctY29uZmlndXJhdGlvbi8xNzEzNgoKSSdtIHN0aWxsIGludGVy
ZXN0ZWQgaW4gdGFsa2luZyB3aXRoIHNvbWUgTHVidW50dSBkZXZlbG9wZXIgb24gdGhhdC4gQnV0
CnRoZSBvdXRjb21lIG9mIHN1Y2ggYSBkaXNjdXNzaW9uIHdvdWxkIGFmZmVjdCBvdGhlciBwYWNr
YWdlcyBidXQKbGFuZ3VhZ2Utc2VsZWN0b3IsIHNvIEkganVzdCBwdXNoZWQgYW5kIHVwbG9hZGVk
IHRoZSBwcm9wb3NlZCBjaGFuZ2UuCgoqKiBDaGFuZ2VkIGluOiBsYW5ndWFnZS1zZWxlY3RvciAo
VWJ1bnR1KQogICAgICAgU3RhdHVzOiBJbiBQcm9ncmVzcyA9PiBGaXggQ29tbWl0dGVkCgotLSAK
WW91IHJlY2VpdmVkIHRoaXMgYnVnIG5vdGlmaWNhdGlvbiBiZWNhdXNlIHlvdSBhcmUgYSBtZW1i
ZXIgb2YgQXBwQXJtb3IKRGV2ZWxvcGVycywgd2hpY2ggaXMgc3Vic2NyaWJlZCB0byB0aGUgYnVn
IHJlcG9ydC4KaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvYnVncy8xOTI4MzYwCgpUaXRsZToK
ICBTd2l0Y2ggdG8gRmNpdHggNSBmb3IgQ2hpbmVzZQoKU3RhdHVzIGluIEx1YnVudHUgZGVmYXVs
dCBzZXR0aW5nczoKICBOZXcKU3RhdHVzIGluIFVidW50dSBLeWxpbjoKICBJbiBQcm9ncmVzcwpT
dGF0dXMgaW4gYXBwYXJtb3IgcGFja2FnZSBpbiBVYnVudHU6CiAgTmV3ClN0YXR1cyBpbiBsYW5n
dWFnZS1zZWxlY3RvciBwYWNrYWdlIGluIFVidW50dToKICBGaXggQ29tbWl0dGVkCgpCdWcgZGVz
Y3JpcHRpb246CiAgSW4gRGViaWFuIDExIEZjaXR4IDUgd2lsbCBiZSB0aGUgZGVmYXVsdCBJTSBm
cmFtZXdvcmsgZm9yIENoaW5lc2Ugb24KICBub24tR05PTUUgZGVza3RvcHMuIEkgY2FuIHRoaW5r
IGl0J3MgdGltZSB0byBtYWtlIHRoZSBlcXVpdmFsZW50CiAgY2hhbmdlcyBpbiBVYnVudHUgMjEu
MTAgYXMgd2VsbC4KCiAgSSdkIGFwcHJlY2lhdGUgaW5wdXQgb24gdGhlIHRvcGljIGZyb20gdGhl
IFVidW50dSBLeWxpbiB0ZWFtIGFzIHdlbGwKICBhcyBvdGhlciBDaGluZXNlIHNwZWFraW5nIHVz
ZXJzLgoKVG8gbWFuYWdlIG5vdGlmaWNhdGlvbnMgYWJvdXQgdGhpcyBidWcgZ28gdG86Cmh0dHBz
Oi8vYnVncy5sYXVuY2hwYWQubmV0L2x1YnVudHUtZGVmYXVsdC1zZXR0aW5ncy8rYnVnLzE5Mjgz
NjAvK3N1YnNjcmlwdGlvbnMKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlz
dHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8v
bGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

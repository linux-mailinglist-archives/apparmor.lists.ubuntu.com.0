Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A76388097
	for <lists+apparmor@lfdr.de>; Tue, 18 May 2021 21:39:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lj5YZ-0001bN-13; Tue, 18 May 2021 19:39:07 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1lj5YX-0001bH-Os
 for apparmor@lists.ubuntu.com; Tue, 18 May 2021 19:39:05 +0000
Received: from wampee.canonical.com ([91.189.89.61])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lj5YX-0001xb-ED
 for <apparmor@lists.ubuntu.com>; Tue, 18 May 2021 19:39:05 +0000
Received: from wampee.canonical.com (localhost [127.0.0.1])
 by wampee.canonical.com (Postfix) with ESMTPS id 022913B0188
 for <apparmor@lists.ubuntu.com>; Tue, 18 May 2021 19:39:04 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 18 May 2021 19:39:04 -0000
From: Launchpad Bug Tracker <1928360@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=lubuntu-default-settings; status=New;
 importance=Undecided; assignee=None; 
X-Launchpad-Bug: product=ubuntukylin; status=New; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=apparmor; component=main; 
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=language-selector;
 component=main; status=In Progress; importance=Undecided;
 assignee=gunnarhj@ubuntu.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gunnarhj
X-Launchpad-Bug-Reporter: Gunnar Hjalmarsson (gunnarhj)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Message-Id: <162136674492.1436.6472760548205254350.launchpad@wampee.canonical.com>
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="lpnet88"
X-Launchpad-Hash: f20b8459085d56fbddea03294dc47f9c1e925367
Subject: [apparmor] [Bug 1928360] [NEW] Switch to Fcitx 5 for Chinese
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

WW91IGhhdmUgYmVlbiBzdWJzY3JpYmVkIHRvIGEgcHVibGljIGJ1ZyBieSBHdW5uYXIgSGphbG1h
cnNzb24gKGd1bm5hcmhqKToKCkluIERlYmlhbiAxMSBGY2l0eCA1IHdpbGwgYmUgdGhlIGRlZmF1
bHQgSU0gZnJhbWV3b3JrIGZvciBDaGluZXNlIG9uCm5vbi1HTk9NRSBkZXNrdG9wcy4gSSBjYW4g
dGhpbmsgaXQncyB0aW1lIHRvIG1ha2UgdGhlIGVxdWl2YWxlbnQgY2hhbmdlcwppbiBVYnVudHUg
MjEuMTAgYXMgd2VsbC4KCkknZCBhcHByZWNpYXRlIGlucHV0IG9uIHRoZSB0b3BpYyBmcm9tIHRo
ZSBVYnVudHUgS3lsaW4gdGVhbSBhcyB3ZWxsIGFzCm90aGVyIENoaW5lc2Ugc3BlYWtpbmcgdXNl
cnMuCgoqKiBBZmZlY3RzOiBsdWJ1bnR1LWRlZmF1bHQtc2V0dGluZ3MKICAgICBJbXBvcnRhbmNl
OiBVbmRlY2lkZWQKICAgICAgICAgU3RhdHVzOiBOZXcKCioqIEFmZmVjdHM6IHVidW50dWt5bGlu
CiAgICAgSW1wb3J0YW5jZTogVW5kZWNpZGVkCiAgICAgICAgIFN0YXR1czogTmV3CgoqKiBBZmZl
Y3RzOiBhcHBhcm1vciAoVWJ1bnR1KQogICAgIEltcG9ydGFuY2U6IFVuZGVjaWRlZAogICAgICAg
ICBTdGF0dXM6IE5ldwoKKiogQWZmZWN0czogbGFuZ3VhZ2Utc2VsZWN0b3IgKFVidW50dSkKICAg
ICBJbXBvcnRhbmNlOiBVbmRlY2lkZWQKICAgICBBc3NpZ25lZTogR3VubmFyIEhqYWxtYXJzc29u
IChndW5uYXJoaikKICAgICAgICAgU3RhdHVzOiBJbiBQcm9ncmVzcwoKLS0gClN3aXRjaCB0byBG
Y2l0eCA1IGZvciBDaGluZXNlCmh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2J1Z3MvMTkyODM2
MApZb3UgcmVjZWl2ZWQgdGhpcyBidWcgbm90aWZpY2F0aW9uIGJlY2F1c2UgeW91IGFyZSBhIG1l
bWJlciBvZiBBcHBBcm1vciBEZXZlbG9wZXJzLCB3aGljaCBpcyBzdWJzY3JpYmVkIHRvIHRoZSBi
dWcgcmVwb3J0LgoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVu
dHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51
YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

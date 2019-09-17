Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4832DB4E51
	for <lists+apparmor@lfdr.de>; Tue, 17 Sep 2019 14:45:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iACrQ-0004MF-Jj; Tue, 17 Sep 2019 12:45:36 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1iACrP-0004M1-EF
 for apparmor@lists.ubuntu.com; Tue, 17 Sep 2019 12:45:35 +0000
Received: from ackee.canonical.com ([91.189.89.26])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iACrP-0006MG-AQ
 for <apparmor@lists.ubuntu.com>; Tue, 17 Sep 2019 12:45:35 +0000
Received: from ackee.canonical.com (localhost [IPv6:::1])
 by ackee.canonical.com (Postfix) with ESMTP id 4343FE0F3B
 for <apparmor@lists.ubuntu.com>; Tue, 17 Sep 2019 12:45:35 +0000 (UTC)
MIME-Version: 1.0
X-Launchpad-Message-Rationale: Reviewer @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
X-Launchpad-Notification-Type: code-review
Message-Id: <e5070542-2028-18a5-5631-87596b58b7e1@sdeziel.info>
X-Launchpad-Branch: ~sdeziel/apparmor-profiles/+git/apparmor-profiles:apt-cacher-ng
X-Launchpad-Project: apparmor-profiles
In-Reply-To: <156872422755.32632.5827984089400345963.codereview@wampee.canonical.com>
To: mp+372819@code.launchpad.net
From: =?utf-8?q?Simon_D=C3=A9ziel?= <simon@sdeziel.info>
Date: Tue, 17 Sep 2019 12:45:35 -0000
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: a05f046c2090da5b54abb311a03ebbfdcdd4c8dc
Subject: Re: [apparmor] [Merge]
 ~sdeziel/apparmor-profiles/+git/apparmor-profiles:apt-cacher-ng into
 apparmor-profiles:master
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
Reply-To: mp+372819@code.launchpad.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

TXkgYmFkLCB0aGFua3MgZm9yIGNhdGNoaW5nIHRoaXMgOykKSSdsbCBoZWFkIG92ZXIgdG8gZ2l0
bGFiIGFuZCByZXN1Ym1pdC4KCk9uIDIwMTktMDktMTcgODo0MyBhLm0uLCBTZXRoIEFybm9sZCB3
cm90ZToKPiBUaGUgY2hhbmdlIG1ha2VzIHNlbnNlIHRvIG1lIGJ1dCBJJ20gbm90IHN1cmUgaWYg
dGhpcyBvciBodHRwczovL2dpdGxhYi5jb20vYXBwYXJtb3IvYXBwYXJtb3ItcHJvZmlsZXMgaXMg
dGhlIGJldHRlciBwbGFjZSB0byBtYWtlIHRoZSBjaGFuZ2UuCj4gCj4gVGhhbmtzCj4gCgoKLS0g
Cmh0dHBzOi8vY29kZS5sYXVuY2hwYWQubmV0L35zZGV6aWVsL2FwcGFybW9yLXByb2ZpbGVzLytn
aXQvYXBwYXJtb3ItcHJvZmlsZXMvK21lcmdlLzM3MjgxOQpZb3VyIHRlYW0gQXBwQXJtb3IgRGV2
ZWxvcGVycyBpcyByZXF1ZXN0ZWQgdG8gcmV2aWV3IHRoZSBwcm9wb3NlZCBtZXJnZSBvZiB+c2Rl
emllbC9hcHBhcm1vci1wcm9maWxlcy8rZ2l0L2FwcGFybW9yLXByb2ZpbGVzOmFwdC1jYWNoZXIt
bmcgaW50byBhcHBhcm1vci1wcm9maWxlczptYXN0ZXIuCgotLSAKQXBwQXJtb3IgbWFpbGluZyBs
aXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2Ny
aWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1v
cgo=

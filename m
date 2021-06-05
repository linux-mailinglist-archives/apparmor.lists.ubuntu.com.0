Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D78F39C8EA
	for <lists+apparmor@lfdr.de>; Sat,  5 Jun 2021 15:50:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lpWhD-0005p1-P9; Sat, 05 Jun 2021 13:50:39 +0000
Received: from indium.canonical.com ([91.189.90.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1lpWh8-0005o6-FT
 for apparmor@lists.ubuntu.com; Sat, 05 Jun 2021 13:50:34 +0000
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lpWh7-0007KE-UE
 for <apparmor@lists.ubuntu.com>; Sat, 05 Jun 2021 13:50:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E04752E802E
 for <apparmor@lists.ubuntu.com>; Sat,  5 Jun 2021 13:50:33 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 05 Jun 2021 13:44:37 -0000
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
X-Launchpad-Bug-Commenters: feng-kylin gunnarhj jamesh janitor seth-arnold
X-Launchpad-Bug-Reporter: Gunnar Hjalmarsson (gunnarhj)
X-Launchpad-Bug-Modifier: Gunnar Hjalmarsson (gunnarhj)
References: <162092271688.7693.3046118231154125647.malonedeb@gac.canonical.com>
Message-Id: <162290067734.3495.1026014194802159369.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="b45bdbe3a00b6b668fa7f2069bd545c35c41f7f4"; Instance="production"
X-Launchpad-Hash: 380eafe16286c9b8a24168ca26208f5a3a2b1d24
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

T24gMjAyMS0wNi0wNSAwNjozMiwgSmFtZXMgSGVuc3RyaWRnZSB3cm90ZToKPiBJdCdzIHByb2Jh
Ymx5IGdvaW5nIHRvIGJlIGVhc2llc3QgdG8gc2VlIGlmIHdlIGNhbiBnZXQgdGhpbmdzCj4gd29y
a2luZyB3aXRoIGEgY29yZTIwIGJhc2VkIHBsYXRmb3JtIHNuYXAgdGhvdWdoLCBzaW5jZSB3ZSBo
YXZlCj4gZmNpdHg1IHBhY2thZ2VzIHRoZXJlIChhbGJlaXQgZm9yIGEgZ2l0IHByZXJlbGVhc2Ug
dmVyc2lvbikuCgpJcyB0aGVyZSBzdWNoIGEgc25hcCB5b3UgY291bGQgcG9pbnQgbWUgdG8gc28g
SSBjYW4gdGVzdD8KCj4gRm9yIHRoZSBjb3JlMTggYmFzZWQgcGxhdGZvcm0gc25hcHMsIHdlIHdv
dWxkIG5lZWQgdG8gYmFja3BvcnQgdGhlCj4gZmNpdHg1IHBhY2thZ2VzIHRoZW1zZWx2ZXMuICBB
bHRlcm5hdGl2ZWx5LCBJIHdvbmRlciBpZiB3ZSBjb3VsZCBnZXQKPiBhd2F5IHdpdGggc3ltbGlu
a2luZyB0aGUgb2xkIG1vZHVsZSBuYW1lIHRvIHRoZSBuZXcgb25lPwoKVGhlIGxhdHRlciB3b3Vs
ZCBiZSBlcXVpdmFsZW50IHRvIGFzc2lnbiAiZmNpdHgiIGluc3RlYWQgb2YgImZjaXR4NSIgdG8K
dGhlIElNX01PRFVMRSB2YXJpYWJsZXMgaWYgSSB1bmRlcnN0YW5kIGl0IGNvcnJlY3RseS4KClRo
ZSBGY2l0eCA1IGZvbGtzIHVwc3RyZWFtIHJlY29tbWVuZCAiZmNpdHgiIGZvciBJTV9NT0RVTEUu
IFRoZSByZWFzb24Kd2h5IERlYmlhbi9VYnVudHUgY3VycmVudGx5IHNldCAiZmNpdHg1IiBpcyB0
byBkZWFsIHdpdGggc3lzdGVtcyBkdXJpbmcKYSB0cmFuc2l0aW9uIHBlcmlvZCB3aGVyZSBib3Ro
IGZjaXR4IDQgYW5kIGZjaXR4IDUgYXJlIGluc3RhbGxlZC4gSW4Kc3VjaCBjYXNlcyAiZmNpdHgi
IHdvdWxkIHJlc3VsdCBpbiB0aGUgZmNpdHggNCBpbSBtb2R1bGVzIGJlaW5nIGxvYWRlZAphbHNv
IHdoZW4gdGhlIHVzZXIgcnVucyBmY2l0eCA1LCBhbmQgd2UgaGF2ZSBhc3N1bWVkIHRoYXQgdGhh
dCBtaWdodCBiZQpwcm9ibGVtYXRpYy4KCk9UT0gsIG15IHN1Y2Nlc3NmdWwgdGVzdCB3aXRoIENo
cm9taXVtIGluZGljYXRlcyB0aGF0IGl0IHdvcmtzLiBOb3cgSSdtCm5vdCB0aGUgcmlnaHQgcGVy
c29uIHRvIGV2YWx1YXRlIGl0LCBzaW5jZSBJJ20gbm90IGFuIGlucHV0IG1ldGhvZCB1c2VyLAph
bmQgdGhhdCdzIHdoYXQgSSB3YW50IHRvIHRhbGsgd2l0aCB0aGUgQ2hpbmVzZSBkZXZlbG9wZXJz
IGluIERlYmlhbidzCmlucHV0IG1ldGhvZCB0ZWFtIGFib3V0LgoKQGhhbmRzb21lX2Zlbmc6IE1h
eWJlIHRoZSBLeWxpbiB0ZWFtIGNhbiBoZWxwIHRvIHRlc3QgdGhpcywgY29uc2lkZXJpbmcKdGhh
dCBLeWxpbiB3aWxsIGJlIHNoaXBwZWQgd2l0aCBib3RoIGZjaXR4IDQgYW5kIGZjaXR4IDUgaW4g
MjEuMTAuIElmCnlvdSBvdmVycmlkZSBpbS1jb25maWcgYW5kIGVuZm9yY2UgR1RLX0lNX01PRFVM
RSBhbmQgUVRfSU1fTU9EVUxFIHRvIGJlCmFzc2lnbmVkICJmY2l0eCIgYWxzbyB3aGVuIHVzaW5n
IGZjaXR4IDUsIGRvIHlvdSBzZWUgYW55IGFkdmVyc2Ugc2lkZQplZmZlY3RzPwoKLS0gCllvdSBy
ZWNlaXZlZCB0aGlzIGJ1ZyBub3RpZmljYXRpb24gYmVjYXVzZSB5b3UgYXJlIGEgbWVtYmVyIG9m
IEFwcEFybW9yCkRldmVsb3BlcnMsIHdoaWNoIGlzIHN1YnNjcmliZWQgdG8gdGhlIGJ1ZyByZXBv
cnQuCmh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2J1Z3MvMTkyODM2MAoKVGl0bGU6CiAgU3dp
dGNoIHRvIEZjaXR4IDUgZm9yIENoaW5lc2UKClN0YXR1cyBpbiBMdWJ1bnR1IGRlZmF1bHQgc2V0
dGluZ3M6CiAgTmV3ClN0YXR1cyBpbiBTbmFwcHk6CiAgTmV3ClN0YXR1cyBpbiBVYnVudHUgS3ls
aW46CiAgSW4gUHJvZ3Jlc3MKU3RhdHVzIGluIGltLWNvbmZpZyBwYWNrYWdlIGluIFVidW50dToK
ICBOZXcKU3RhdHVzIGluIGxhbmd1YWdlLXNlbGVjdG9yIHBhY2thZ2UgaW4gVWJ1bnR1OgogIEZp
eCBSZWxlYXNlZAoKQnVnIGRlc2NyaXB0aW9uOgogIEluIERlYmlhbiAxMSBGY2l0eCA1IHdpbGwg
YmUgdGhlIGRlZmF1bHQgSU0gZnJhbWV3b3JrIGZvciBDaGluZXNlIG9uCiAgbm9uLUdOT01FIGRl
c2t0b3BzLiBJIGNhbiB0aGluayBpdCdzIHRpbWUgdG8gbWFrZSB0aGUgZXF1aXZhbGVudAogIGNo
YW5nZXMgaW4gVWJ1bnR1IDIxLjEwIGFzIHdlbGwuCgogIEknZCBhcHByZWNpYXRlIGlucHV0IG9u
IHRoZSB0b3BpYyBmcm9tIHRoZSBVYnVudHUgS3lsaW4gdGVhbSBhcyB3ZWxsCiAgYXMgb3RoZXIg
Q2hpbmVzZSBzcGVha2luZyB1c2Vycy4KClRvIG1hbmFnZSBub3RpZmljYXRpb25zIGFib3V0IHRo
aXMgYnVnIGdvIHRvOgpodHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC9sdWJ1bnR1LWRlZmF1bHQt
c2V0dGluZ3MvK2J1Zy8xOTI4MzYwLytzdWJzY3JpcHRpb25zCgotLSAKQXBwQXJtb3IgbWFpbGlu
ZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vi
c2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBh
cm1vcgo=

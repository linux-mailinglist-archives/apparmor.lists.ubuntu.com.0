Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 124A8452E4E
	for <lists+apparmor@lfdr.de>; Tue, 16 Nov 2021 10:44:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mmv0s-0003n4-PM; Tue, 16 Nov 2021 09:44:26 +0000
Received: from smtp-1.1gb.com.ua ([195.234.4.10] helo=u1.1gb.ua)
 by huckleberry.canonical.com with esmtp (Exim 4.86_2)
 (envelope-from <me@beroal.in.ua>) id 1mmv0q-0003mo-RE
 for apparmor@lists.ubuntu.com; Tue, 16 Nov 2021 09:44:24 +0000
Received: from Spooler by u1.1gb.ua (Mercury/32 v4.52) ID MO00321F;
 16 Nov 2021 11:44:26 +0200
Received: from spooler by mail-u1-robots.in-solve.hidden (Mercury/32 v4.52);
 16 Nov 2021 11:44:19 +0200
Received: from ul1.1gb.ua (195.234.4.24) by smtp-1.1gb.com.ua (Mercury/32
 v4.52) with ESMTP ID MG00321E; 16 Nov 2021 11:44:18 +0200
Received: from [192.162.141.53] ([192.162.141.53]) (authenticated bits=0)
 by ul1.1gb.ua (8.14.9/8.14.9) with ESMTP id 1AG9iF6c026987
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
 for <apparmor@lists.ubuntu.com>; Tue, 16 Nov 2021 11:44:15 +0200
Message-ID: <ec3bb2d2-7178-a65f-3a61-34aee8e0560c@beroal.in.ua>
Date: Tue, 16 Nov 2021 11:44:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: apparmor@lists.ubuntu.com
Content-Language: en-US
From: beroal <me@beroal.in.ua>
Subject: [apparmor] give a permission to a specific process
X-BeenThere: apparmor@lists.ubuntu.com
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: AppArmor discussion <apparmor.lists.ubuntu.com>
List-Unsubscribe: <https://lists.ubuntu.com/mailman/options/apparmor>,
 <mailto:apparmor-request@lists.ubuntu.com?subject=unsubscribe>
List-Archive: <https://lists.ubuntu.com/archives/apparmor>
List-Post: <mailto:apparmor@lists.ubuntu.com>
List-Help: <mailto:apparmor-request@lists.ubuntu.com?subject=help>
List-Subscribe: <https://lists.ubuntu.com/mailman/listinfo/apparmor>,
 <mailto:apparmor-request@lists.ubuntu.com?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

SGkuIEkgd29uZGVyIHdoZXRoZXIgQXBwQXJtb3IgYWxsb3dzIHRvIGdpdmUgYSBwZXJtaXNzaW9u
IHRvIGEgc3BlY2lmaWMgCnByb2Nlc3MuIEEgdXNlIGNhc2U6IHRoZXJlIGFyZSBVSSBwcm9ncmFt
cyAoZWRpdG9ycywgdmlld2VycykgdGhhdCBuZWVkIAp0ZW1wb3JhcnkgYWNjZXNzIHRvIGEgZmls
ZSBzcGVjaWZpZWQgYnkgYSB1c2VyICh0byBlZGl0LCB0byB2aWV3KS4KClVuZm9ydHVuYXRlbHks
IEFwcEFybW9yIHByb2ZpbGVzIGdpdmUgcGVybWlzc2lvbnMgdG8gZXhlY3V0YWJsZSBmaWxlcy4g
CkZvciBleGFtcGxlLCBpZiBhIHVzZXIgZ2l2ZXMgZXhlY3V0YWJsZSAkRSBhY2Nlc3MgdG8gL3Rt
cC8kRiwgYW55IHVzZXIgCndpbGwgaGF2ZSBhY2Nlc3MgdG8gL3RtcC8kRiBieSBleGVjdXRpbmcg
JEUuIEhlbmNlIGEgdXNlciBuZWVkIGEgZmVhdHVyZSAKd2hpY2ggZ2l2ZXMgcGVybWlzc2lvbiAk
UiB0byBhbnkgcHJvY2VzcyB0aGF0IGV4ZWN1dGVzIGV4ZWN1dGFibGUgJEUgCioqYXMgYSB1c2Vy
ICRVKiogd2hlcmUgJFIsICRFLCBhbmQgJFUgYXJlIHNwZWNpZmllZCBieSB0aGUgdXNlci4gQSAK
ZmVhdHVyZSB3aGljaCBnaXZlcyBwZXJtaXNzaW9uICRSIHRvIHByb2Nlc3MgJFAgd291bGQgYmUg
bmljZSB0b28sIGJ1dCAKaXNuJ3QgZXNzZW50aWFsLiBUaGVyZSBpcyBhIHByb2JsZW0gaG93IGEg
bm9uLXJvb3QgY2FuIHVzZSB0aGlzIGZlYXR1cmUsIApidXQgaXQncyBhIHNlcGFyYXRlIHRvcGlj
LgoKRG9lcyBBcHBBcm1vciBoYXZlIHN1Y2ggYSBmZWF0dXJlPyBNYXliZSwgdGhlcmUgaXMgYSBi
ZXR0ZXIgdG9vbCBmb3IgCnRoaXMgdXNlIGNhc2U/CgoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlz
dApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmli
ZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

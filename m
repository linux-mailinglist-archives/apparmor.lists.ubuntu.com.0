Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6417545B99A
	for <lists+apparmor@lfdr.de>; Wed, 24 Nov 2021 13:01:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mpqy4-0006k4-4m; Wed, 24 Nov 2021 12:01:40 +0000
Received: from smtp-1.1gb.com.ua ([195.234.4.10] helo=u1.1gb.ua)
 by huckleberry.canonical.com with esmtp (Exim 4.86_2)
 (envelope-from <me@beroal.in.ua>) id 1mpqy2-0006jG-Jl
 for apparmor@lists.ubuntu.com; Wed, 24 Nov 2021 12:01:38 +0000
Received: from Spooler by u1.1gb.ua (Mercury/32 v4.52) ID MO003F40;
 24 Nov 2021 14:01:39 +0200
Received: from spooler by mail-u1-robots.in-solve.hidden (Mercury/32 v4.52);
 24 Nov 2021 14:01:36 +0200
Received: from ul1.1gb.ua (195.234.4.24) by smtp-1.1gb.com.ua (Mercury/32
 v4.52) with ESMTP ID MG003F36; 24 Nov 2021 14:01:23 +0200
Received: from [192.162.141.53] ([192.162.141.53]) (authenticated bits=0)
 by ul1.1gb.ua (8.14.9/8.14.9) with ESMTP id 1AOC1Luh027696
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
 for <apparmor@lists.ubuntu.com>; Wed, 24 Nov 2021 14:01:21 +0200
Message-ID: <e901d24c-2299-e91e-f40d-27644c2bdc57@beroal.in.ua>
Date: Wed, 24 Nov 2021 14:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: apparmor@lists.ubuntu.com
Content-Language: en-US
From: beroal <me@beroal.in.ua>
Subject: [apparmor] profile injection
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

SGkuIFdoaWxlIHRoaW5raW5nIGhvdyB0byBpbXBsZW1lbnQgbXkgaWRlYSAKPGh0dHBzOi8vbGlz
dHMudWJ1bnR1LmNvbS9hcmNoaXZlcy9hcHBhcm1vci8yMDIxLU5vdmVtYmVyLzAxMjM2OC5odG1s
PiwgCkkndmUgY29tZSB1cCB3aXRoIHRoZSBmb2xsb3dpbmcgcXVlc3Rpb24uCgpTdXBwb3NlIHRo
YXQgYSBzeXNhZG1pbiBjcmVhdGVzIGEgcHJvZmlsZSBjb250YWluaW5nCgpgYGAKCnByb2ZpbGUg
JE4gJEUgewoKIMKgwqDCoCBpbmNsdWRlICRSUAoKfQoKYGBgCgp3aGVyZSAkUlAgaXMgdGhlIGZp
bGUgcGF0aCBwcm92aWRlZCBieSBhIHVzZXIuIFdoYXQgYXJlIHdheXMgZm9yIHRoZSAKdXNlciB0
byBiZSBtYWxpY2lvdXM/IFRoZSBtb3N0IG9idmlvdXMgb25lIGlzIHdoZW4gdGhlIHVzZXIgd3Jp
dGVzCgpgYGAKCn0KCnByb2ZpbGUgJE5NICRFTSB7CgogwqDCoMKgICRSTQoKYGBgCgppbnRvIHRo
ZSBmaWxlIHJlZmVycmVkIGJ5ICRSUC4gVGhpcyBhbGxlZ2VkbHkgcmVwbGFjZXMgdGhlIGNvbnRl
bnRzIG9mIApwcm9maWxlICROTSB3aXRoICRSTSB3aGljaCBpcyBub3Qgd2hhdCB0aGUgc3lzYWRt
aW4gaW50ZW5kZWQuCgpSZWFkaW5nIHRoZSBgaW5jbHVkZV9maWxlbmFtZWAgZnVuY3Rpb24gaW4g
YHBhcnNlci9wYXJzZXJfbGV4LmxgIGFuZCBteSAKZXhwZXJpbWVudCBnYXZlIG1lIGFuIGltcHJl
c3Npb24gdGhhdCB0aGlzIGF0dGFjayBpcyB0b3RhbGx5IHBvc3NpYmxlLiAKSXMgdGhlcmUgYW55
IHdheSB0byBwcm90ZWN0IGZyb20gaXQ/CgoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBB
cm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDog
aHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

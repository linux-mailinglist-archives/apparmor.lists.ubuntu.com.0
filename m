Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2A74A2FBC
	for <lists+apparmor@lfdr.de>; Sat, 29 Jan 2022 14:20:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nDneX-0001rp-A2; Sat, 29 Jan 2022 13:20:29 +0000
Received: from smtp-1.1gb.com.ua ([195.234.4.10] helo=u1.1gb.ua)
 by huckleberry.canonical.com with esmtp (Exim 4.86_2)
 (envelope-from <me@beroal.in.ua>) id 1nDneW-0001rh-8t
 for apparmor@lists.ubuntu.com; Sat, 29 Jan 2022 13:20:28 +0000
Received: from Spooler by u1.1gb.ua (Mercury/32 v4.52) ID MO004E84;
 29 Jan 2022 15:20:27 +0200
Received: from spooler by mail-u1-robots.in-solve.hidden (Mercury/32 v4.52);
 29 Jan 2022 15:20:19 +0200
Received: from ul1.1gb.ua (195.234.4.24) by smtp-1.1gb.com.ua (Mercury/32
 v4.52) with ESMTP ID MG004E83; 29 Jan 2022 15:20:16 +0200
Received: from [192.162.141.53] ([192.162.141.53]) (authenticated bits=0)
 by ul1.1gb.ua (8.14.9/8.14.9) with ESMTP id 20TDI9Q7027473
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
 Sat, 29 Jan 2022 15:20:16 +0200
Message-ID: <63cf6cab-9c0f-bffe-1763-78d7f24a8835@beroal.in.ua>
Date: Sat, 29 Jan 2022 15:18:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: apparmor@lists.ubuntu.com
References: <20220108175102.GA316223@fladday.local>
 <ecb22823-4145-ef3f-24a5-dfe3bacbdacd@canonical.com>
From: me@beroal.in.ua
In-Reply-To: <ecb22823-4145-ef3f-24a5-dfe3bacbdacd@canonical.com>
Subject: Re: [apparmor] loading a user version of a profile in place of the
 system profile
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

SGkuIFdpbGwgaXQgYmUgYW5ub3VuY2VkIG9uIHRoaXMgbWFpbGluZyBsaXN0IHdoZW4gdGhlIHVz
ZXIgcG9saWN5IApmZWF0dXJlIGhhcyBsYW5kZWQ/IEknbSBpbnRlcmVzdGVkIHRvby4gSSBkaWRu
J3QgZXZlbiBrbm93IHRoYXQgb3JkaW5hcnkgCnVzZXJzIG1heSBjcmVhdGUgdGhlaXIgb3duIHBy
b2ZpbGVzLgoKMDkuMDEuMjAyMiAwMTowMywgSm9obiBKb2hhbnNlbiDQv9C40YjQtdGCOgo+IFN1
cHBvcnQgZm9yIHVzZXIgcG9saWN5IGhhcyBub3QgbGFuZGVkIGluIGFwcGFybW9yIHlldDsgaXQg
aXMgc3RpbGwgdW5kZXIKPiBkZXZlbG9wbWVudC4KCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QK
QXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUg
YXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

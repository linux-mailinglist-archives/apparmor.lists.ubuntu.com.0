Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F4B34A563
	for <lists+apparmor@lfdr.de>; Fri, 26 Mar 2021 11:18:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lPjXk-00041A-Tr; Fri, 26 Mar 2021 10:18:16 +0000
Received: from mail-ed1-f45.google.com ([209.85.208.45])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <wampir990@gmail.com>) id 1lPjXi-00040w-AS
 for apparmor@lists.ubuntu.com; Fri, 26 Mar 2021 10:18:14 +0000
Received: by mail-ed1-f45.google.com with SMTP id o19so5696953edc.3
 for <apparmor@lists.ubuntu.com>; Fri, 26 Mar 2021 03:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=IBbcXqNA/uUKREEnjeFx9H6WKxqZiT+sAkwZUf9ISzA=;
 b=AV2YvTH50Jjudo4VL6Cq+PlZnKl7/9SDgygABbkFV488aak9K9uYX5MU4aFYCDqZGO
 gTnS+VSG1xRdesIw9Y9VLZuWpbvU84V8QngohaCNUncLayGHNbqKl1xHjufwasd4rBXM
 e5ggzjCxHFlbzFb+kvIKdfUJ5Y9glJgQ+D/bzEEhaA7PRm4bkEo9PuEAZULQGEi3zqWx
 iJcgqk1ig73DdZSwgHYFUg9TlA5hV5f/xQ9QqbaTusrkvdTvrO1HM8JRVoQpnKONZfRj
 wo4k5Vc1vKYED4l6W6cfh1/bW+li7UncXKrihnvejiwv6K9l4GjHguSWOoWdTMSI0f/c
 ciJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=IBbcXqNA/uUKREEnjeFx9H6WKxqZiT+sAkwZUf9ISzA=;
 b=YCZoWRJc9WlEXYzrttFWuYn6AMdWtLBKmDSmyx5H/HFHvd7Ocg5GRnacdJdUvf6+5c
 LWWZvHoLWZDtGeiMsQ6NKbPSLo+P7OcjifWB7QtJWKi/4pgwuhgLRL6TAPVkA+g1jr2a
 rMz3eV/i8U0PYYAk2dnWGreMZuZt+8ALU+ObqH0+IW1C4MjwUaBgpg7Q9NofMVIoJiyz
 JuCT7ivr+fwCSE/mfrvO37CMdKBx8uGgJnQUid2Ywi/Ai/6EVulcXm6StDKxN89m8GLF
 +esaFh6Y5JE8C3/cRGz3NlbdOeT8JPiyOlsrGNLihEiNlGw5mZE1zBVWq89gDr9ZWiil
 x7hQ==
X-Gm-Message-State: AOAM5314sfeMGt0NjsVmg4rnRdRatHUqzWtrsalwizHNAyP7T4553jrr
 mIwcsxxi8ukmoJMHXTsf4Qb+1tCwAlk=
X-Google-Smtp-Source: ABdhPJwTLfv7hWzI+nGE5G6H0sjYjfcKjzCG3ZuCLUlRL8gLV8k4Jt5paWITlGDbJBDaHn36gagxAA==
X-Received: by 2002:a05:6402:51cd:: with SMTP id
 r13mr14207479edd.116.1616753893641; 
 Fri, 26 Mar 2021 03:18:13 -0700 (PDT)
Received: from mail.wampir.eu ([2002:589c:6791:10:ef84:422e:e3a6:98eb])
 by smtp.gmail.com with ESMTPSA id 90sm4181036edr.69.2021.03.26.03.18.12
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 03:18:13 -0700 (PDT)
Received: by mail.wampir.eu (Postfix, from userid 337)
 id CBCBC49; Fri, 26 Mar 2021 10:17:41 +0000 (UTC)
Authentication-Results: mail.wampir.eu; dkim=none; dkim-atps=neutral
X-Spam-Checker-Version: SpamAssassin
X-Spam-Status: No
X-Spam-Score: 2.5  required: 5.0
To: apparmor@lists.ubuntu.com
References: <92d8bc5f-1fe0-cdfd-9ac6-d2d5301d6622@canonical.com>
 <7037587e-0ef0-870e-340b-a7400553fe32@gmail.com>
 <cc0f25b7-be0b-f5de-8a52-b4b39ce06e0a@canonical.com>
From: Jacek <wampir990@gmail.com>
Message-ID: <e685219c-4de6-3a90-c950-f0901f2455d7@gmail.com>
Date: Fri, 26 Mar 2021 11:17:29 +0100
MIME-Version: 1.0
In-Reply-To: <cc0f25b7-be0b-f5de-8a52-b4b39ce06e0a@canonical.com>
Content-Language: pl-PL
Received-SPF: pass client-ip=209.85.208.45; envelope-from=wampir990@gmail.com;
 helo=mail-ed1-f45.google.com
Subject: Re: [apparmor] Apparmor policy hide?
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

VGhhbmtzCgpBIGxpdHRsZSB0ZXN0OgoKIyBHMSBHZW50dcWbICMjI8KgwqAgRnJpIE1hciAyNiAx
MToxMDo0NMKgIGxvY2FsaG9zdCA6IC9ob21lL2R1Y2gKCiMgcm9vdCB+PiB0YWlswqAgL2V0Yy9h
cHBhcm1vci5kL2Jpbi5waW5nCiDCoCBuZXR3b3JrIG5ldGxpbmsgcmF3LAogwqAgbmV0d29yayB1
bml4IHN0cmVhbSwKCiDCoCBzaWduYWwgcmVjZWl2ZSBzZXQ9Y29udCBwZWVyPXVuY29uZmluZWQs
CiDCoCBzaWduYWwgcmVjZWl2ZSBzZXQ9dGVybSBwZWVyPXVuY29uZmluZWQsCgogwqDCoCBoaWRl
IHcgL2Jpbi9waW5nLAogwqDCoCAjIyPCoCBtcml4LAogwqDCoCBraWxsIHcgL2Jpbi9waW5nNiwK
fQoKIyBHMSBHZW50dcWbICMjI8KgwqAgRnJpIE1hciAyNiAxMToxMDo1N8KgIGxvY2FsaG9zdCA6
IC9ob21lL2R1Y2gKCiMgcm9vdCB+PiBhcHBhcm1vcl9wYXJzZXIgLXIgL2V0Yy9hcHBhcm1vci5k
L2Jpbi5waW5nCkFwcEFybW9yIHBhcnNlciBlcnJvciBmb3IgL2V0Yy9hcHBhcm1vci5kL2Jpbi5w
aW5nIGluIHByb2ZpbGUgCi9ldGMvYXBwYXJtb3IuZC9iaW4ucGluZyBhdCBsaW5lIDM0OiBtaXNz
aW5nIGFuIGVuZCBvZiBsaW5lIGNoYXJhY3Rlcj8gCihlbnRyeTogaGlkZSkKCgpDYW4gSSByZXF1
ZXN0IGEgbW9yZSBwcmVjaXNlIGV4YW1wbGUgb2YgdGhlIHN5bnRheCBmb3IgdGhpcyBlbnRyeT8K
CjspCgpDaGVlcnMKCgpXIGRuaXUgMjYuMDMuMjAyMSBvIDA5OjU3LCBKb2huIEpvaGFuc2VuIHBp
c3plOgogPiBpdCBoZWxwcyBzb21lIHRpbWVzLCBidXQgaXMgdmVyeSBtdWNoIHN0aWxsIGFuIGVy
cm9yIGNvZGUgYW5kIApkZXBlbmRlbnQgb24gaG93IHRoZSBhcHBsaWNhdGlvbiBpcyBoYW5kbGlu
ZyByZXR1cm5lZCBlcnJvcnMuIFdpdGggdGhhdCAKc2FpZCBoaWRpbmcgdmlhIHJldHVybmluZyBF
Tk9FTlQgaW5zdGVhZCBvZiBFQUNDRVMgaXMgcGFydCBvZiB0aGUgCmV4dGVuZGVkIHBlcm0gd29y
ayB0aGF0IHNob3VsZCBiZSBsYW5kaW5nIHVwc3RyZWFtIG92ZXIgdGhlIG5leHQgY3ljbGUgCm9y
IHR3by4gRWcuCiA+CiA+wqDCoCBoaWRlIHcgL2Zvby9iYXIsCiA+CiA+IFRoaXMgb2YgY291cnNl
IGRvZXNuJ3Qgc3RvcCBhbiBhcHBsaWNhdGlvbiBmcm9tIGJlaW5nIGFibGUgdG8gCmRpc2NvdmVy
IHNvbWV0aGluZyBpc24ndCByaWdodCwgZWcuIGlmIHlvdSBnaXZlIGRpcmVjdG9yeSByZWFkIGFj
Y2VzcyAKdGhlIGRpciBsaXN0aW5nIHdpbGwgc2hvdyB0aGUgZW50cnkgdGhhdCBpcyBiZWluZyBo
aWRkZW4sIHRoaXMgYXMgeW91IApzYWlkIGlzIG1vcmUgYWJvdXQgdHJ5aW5nIG5vdCB0byBicmVh
ayBjZXJ0YWluIGFwcGxpY2F0aW9ucy4KID4KID4gVGhlIG90aGVyIG9wdGlvbiB5b3UgaGF2ZSBp
cyB0aGUgaGVhdnkgaGFtbWVyIG9mIGtpbGxpbmcgdGhlIHRhc2sgCmluc3RlYWQuIEN1cnJlbnRs
eSB0aGF0IGlzIGxpbWl0ZWQgdG8gYSBwcm9maWxlIGZsYWcgYnV0IHRoZSBleHRlbmRlZCAKcGVy
bSB3b3JrIHdpbGwgbWFrZSB0aGF0IHBvc3NpYmxlIHRvIHNwZWNpZnkgYXQgdGhlIHJ1bGUgbGV2
ZWwuCiA+CiA+wqDCoCBraWxsIHcgL2V0Yy9wYXNzd29yZCwKCi0tIApBcHBBcm1vciBtYWlsaW5n
IGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJz
Y3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFy
bW9yCg==

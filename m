Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C578095D8A6
	for <lists+apparmor@lfdr.de>; Fri, 23 Aug 2024 23:49:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1shc9V-0004ue-Jr; Fri, 23 Aug 2024 21:49:01 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1shc9T-0004uV-Q1
 for apparmor@lists.ubuntu.com; Fri, 23 Aug 2024 21:48:59 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E866B3FD49
 for <apparmor@lists.ubuntu.com>; Fri, 23 Aug 2024 21:48:58 +0000 (UTC)
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a869078ff9bso266969466b.2
 for <apparmor@lists.ubuntu.com>; Fri, 23 Aug 2024 14:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724449738; x=1725054538;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t8g5Fy5I6aGAdbh9eTCL2soekbMZeWv+4uSfpjF+jUs=;
 b=Vjkli4ryXSnJq2/2+fnSY+GwCXZTz0VrC+3639huh0TQKDBgkVvAIQrK6SEYtQ/raV
 yInbNzQ62XHCQerTnQZcCtmglKWqd8HHT8etn9cWl8LTp1Gdb3j1MR3tj6Sc9W+8G8R1
 qbWgSFAuO3u4yo3dzeCpg77eJPfJsxfDepsR5aYXR3VRxhLlVFVgNhmXa1Jp5WMqlIoZ
 ym0KRPaqX4EtWaapLjzdHfSBe+AQ9bMBwOQtid7Bt/dnlL0Et7JXrkHfWuFHNCCjuIWv
 ZoOM2T7H94spXEf3Uzt7RKF3WYeRWaoxoNaUIHsUIZBMnsHm6UM3Lm3TMOvQx3YNSTKm
 mPLg==
X-Gm-Message-State: AOJu0YyGPj6gOtq6IgoA54hpz7wTs2Wyx3x17EM0G0xp3Jg/6B+MljRT
 bQfECxXVBibgbaub8AyD6jiLGUyUlB1T/9NwupGQ9tyHQBEDSMgYwKDKjeyzAheT8zPal5sAr6D
 CYlytmwqRcMEVdNpMExxLVsCQ0fkQ4iAbk+fbBOeRk7mofb0zyyuISF87j+FhcERPkSU769FS64
 R4lcutsJERaQtFgtVwHt6TIm1r7Dp5+l9VRPnPRYNCBwSuqABSe1af4PIIyWQ=
X-Received: by 2002:a17:907:3e90:b0:a77:b3c4:cd28 with SMTP id
 a640c23a62f3a-a86a518b759mr265973166b.9.1724449738068; 
 Fri, 23 Aug 2024 14:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzyF37V6RTVQdIUcC7JEJqzQQP1/Ji+MN2mODP8f8E767LWFQ7WsKLpF7uiWrwfAyOKrJirFsON98bYEJ/NIQ=
X-Received: by 2002:a17:907:3e90:b0:a77:b3c4:cd28 with SMTP id
 a640c23a62f3a-a86a518b759mr265971866b.9.1724449737316; Fri, 23 Aug 2024
 14:48:57 -0700 (PDT)
MIME-Version: 1.0
From: Ryan Lee <ryan.lee@canonical.com>
Date: Fri, 23 Aug 2024 14:48:46 -0700
Message-ID: <CAKCV-6u7WWx+vDc0TAfKrXMJV2kTH7aHW4gwQGJ4HXPd+JhMnA@mail.gmail.com>
To: apparmor@lists.ubuntu.com, John Johansen <john.johansen@canonical.com>
Content-Type: multipart/mixed; boundary="00000000000006cb09062060beaa"
Subject: [apparmor] [PATCH] apparmor: properly handle cx/px lookup failure
 for complain mode profiles
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--00000000000006cb09062060beaa
Content-Type: text/plain; charset="UTF-8"

When a cx/px lookup fails, apparmor would deny execution of the binary
even in complain mode (where it would audit as allowing execution while
actually denying it). Instead, in complain mode, create a new learning
profile, just as would have been done if the cx/px line wasn't there.

Signed-off-by: Ryan Lee <ryan.lee@canonical.com>

--00000000000006cb09062060beaa
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-apparmor-properly-handle-cx-px-lookup-failure-for-co.patch"
Content-Disposition: attachment; 
	filename="0001-apparmor-properly-handle-cx-px-lookup-failure-for-co.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m078sycm0>
X-Attachment-Id: f_m078sycm0

RnJvbSAwMTBhMDFiYTU5N2VlYWU4N2QzNDYxN2RhNDUzNjY0ZDg0ZTY5NmIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSeWFuIExlZSA8cnlhbi5sZWVAY2Fub25pY2FsLmNvbT4KRGF0
ZTogRnJpLCAyMyBBdWcgMjAyNCAxMDoxNDowMiAtMDcwMApTdWJqZWN0OiBbUEFUQ0hdIGFwcGFy
bW9yOiBwcm9wZXJseSBoYW5kbGUgY3gvcHggbG9va3VwIGZhaWx1cmUgZm9yIGNvbXBsYWluCm1v
ZGUgcHJvZmlsZXMKCldoZW4gYSBjeC9weCBsb29rdXAgZmFpbHMsIGFwcGFybW9yIHdvdWxkIGRl
bnkgZXhlY3V0aW9uIG9mIHRoZSBiaW5hcnkKZXZlbiBpbiBjb21wbGFpbiBtb2RlICh3aGVyZSBp
dCB3b3VsZCBhdWRpdCBhcyBhbGxvd2luZyBleGVjdXRpb24gd2hpbGUKYWN0dWFsbHkgZGVueWlu
ZyBpdCkuIEluc3RlYWQsIGluIGNvbXBsYWluIG1vZGUsIGNyZWF0ZSBhIG5ldyBsZWFybmluZwpw
cm9maWxlLCBqdXN0IGFzIHdvdWxkIGhhdmUgYmVlbiBkb25lIGlmIHRoZSBjeC9weCBsaW5lIHdh
c24ndCB0aGVyZS4KClNpZ25lZC1vZmYtYnk6IFJ5YW4gTGVlIDxyeWFuLmxlZUBjYW5vbmljYWwu
Y29tPgotLS0KIHNlY3VyaXR5L2FwcGFybW9yL2RvbWFpbi5jIHwgOSArKysrKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
c2VjdXJpdHkvYXBwYXJtb3IvZG9tYWluLmMgYi9zZWN1cml0eS9hcHBhcm1vci9kb21haW4uYwpp
bmRleCBkZDQ1N2VhZWRhYjguLjk5MTRhMmIxMzBkZSAxMDA2NDQKLS0tIGEvc2VjdXJpdHkvYXBw
YXJtb3IvZG9tYWluLmMKKysrIGIvc2VjdXJpdHkvYXBwYXJtb3IvZG9tYWluLmMKQEAgLTY4Niwx
MiArNjg2LDE3IEBAIHN0YXRpYyBzdHJ1Y3QgYWFfbGFiZWwgKnByb2ZpbGVfdHJhbnNpdGlvbihj
b25zdCBzdHJ1Y3QgY3JlZCAqc3Vial9jcmVkLAogCQkJLyogaGFjayBpeCBmYWxsYmFjayAtIGlt
cHJvdmUgaG93IHRoaXMgaXMgZGV0ZWN0ZWQgKi8KIAkJCWdvdG8gYXVkaXQ7CiAJCX0gZWxzZSBp
ZiAoIW5ldykgewotCQkJZXJyb3IgPSAtRUFDQ0VTOwogCQkJaW5mbyA9ICJwcm9maWxlIHRyYW5z
aXRpb24gbm90IGZvdW5kIjsKLQkJCS8qIHJlbW92ZSBNQVlfRVhFQyB0byBhdWRpdCBhcyBmYWls
dXJlICovCisJCQkvKiByZW1vdmUgTUFZX0VYRUMgdG8gYXVkaXQgYXMgZmFpbHVyZSBvciBjb21w
bGFpbnQgKi8KIAkJCXBlcm1zLmFsbG93ICY9IH5NQVlfRVhFQzsKKwkJCWlmIChDT01QTEFJTl9N
T0RFKHByb2ZpbGUpKSB7CisJCQkJLyogY3JlYXRlIG51bGwgcHJvZmlsZSBpbnN0ZWFkIG9mIGZh
aWxpbmcgKi8KKwkJCQlnb3RvIGNyZWF0ZV9sZWFybmluZ19wcm9maWxlOworCQkJfQorCQkJZXJy
b3IgPSAtRUFDQ0VTOwogCQl9CiAJfSBlbHNlIGlmIChDT01QTEFJTl9NT0RFKHByb2ZpbGUpKSB7
CitjcmVhdGVfbGVhcm5pbmdfcHJvZmlsZToKIAkJLyogbm8gZXhlYyBwZXJtaXNzaW9uIC0gbGVh
cm5pbmcgbW9kZSAqLwogCQlzdHJ1Y3QgYWFfcHJvZmlsZSAqbmV3X3Byb2ZpbGUgPSBOVUxMOwog
Ci0tIAoyLjQzLjAKCg==
--00000000000006cb09062060beaa--


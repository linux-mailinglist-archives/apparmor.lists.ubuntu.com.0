Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D0495753D
	for <lists+apparmor@lfdr.de>; Mon, 19 Aug 2024 22:05:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sg8dG-0005p3-5g; Mon, 19 Aug 2024 20:05:38 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1sg8dE-0005oW-En
 for apparmor@lists.ubuntu.com; Mon, 19 Aug 2024 20:05:36 +0000
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DFB3C3F31C
 for <apparmor@lists.ubuntu.com>; Mon, 19 Aug 2024 20:05:35 +0000 (UTC)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-70eab26e146so3783191b3a.3
 for <apparmor@lists.ubuntu.com>; Mon, 19 Aug 2024 13:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724097934; x=1724702734;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Falp4aO2BWB0fiM3nqjO0XVD1BT/6SieGDjMwqXmnE=;
 b=Q+2irU+teXQfLpxNU6xLfzRzHY4g119bNuTYRhzpt195RQCKoNVPBBA1JFoXYSKT5G
 jJiPIE/WRCJe/Oounl5J4yaw9QfOPpA25vlmP/LzsUqIFfKV32Gw1B5rs/xc8Dcda4PR
 03Ct6k6NmLbZae6XGNAAz6ZsZ+1rVIGdyh8xnjlzRwBbp9TlAwkMzpPXQfKNW8y9/tLA
 +KbfaQRH/6kdHf9jkwi5GUiEmLjSAojo+q0ZqZy0AFkncm7SBCqwMEtZHOWotn2PoJa1
 gbdGxrbRNHsGPYyQQGBBN61ibnNVR8A54bWyH1q8pumt7Sq+2Z9EfDvk8w5IILC1q10u
 YCwQ==
X-Gm-Message-State: AOJu0YwJzEc7z+MY/vgUiANthCgvuX5cZtvuCrUbuQeMDzPSyAiWHcuM
 s7MGAwcF7lmGzyl0U39/p+u6Qx0P3MOyDxU5g4XE6+i2il9SGVxNV3sK2ZtvqJ25GWYAQiU3HBZ
 pHe2vE5vkKZmRuEcw9GWB4SY12evut9OW9adjM9PnvQBufqbuRyzbcYLGEX9srg/PRlBbqHJTiQ
 +TBqotGLNY1ebnQBN29VFafnoH1Wb0k75V2HKS9liEw5zNXz5YwpmtQsQGhQQ=
X-Received: by 2002:a05:6a00:66cf:b0:712:74b3:b24f with SMTP id
 d2e1a72fcca58-713c4e6fe3bmr10066107b3a.16.1724097934349; 
 Mon, 19 Aug 2024 13:05:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1d09BmtskK3ivjus9JVwFuQlizZAoivS7mXouVXxvecXayQTD+0E/4/9mKpaX8XZSoGZrh34lmCcOnHlw+co=
X-Received: by 2002:a05:6a00:66cf:b0:712:74b3:b24f with SMTP id
 d2e1a72fcca58-713c4e6fe3bmr10066075b3a.16.1724097933711; Mon, 19 Aug 2024
 13:05:33 -0700 (PDT)
MIME-Version: 1.0
From: Ryan Lee <ryan.lee@canonical.com>
Date: Mon, 19 Aug 2024 13:05:21 -0700
Message-ID: <CAKCV-6sG6apr7WRBEhSqkeOEhF+h1UmgA4ur=RPDBoL7r-q3uw@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="000000000000e6047e06200ed466"
Subject: [apparmor] [PATCH] apparmor: fix null pointer deref in find_attach
 when xmatch is null
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

--000000000000e6047e06200ed466
Content-Type: text/plain; charset="UTF-8"

find_attach loops over profile entries and first checks for a DFA, falling
back onto a strcmp otherwise. However, the check if (attach->xmatch->dfa)
did not account for the possibility that (attach->xmatch) could be null.
This occured with a sequence of profile replacements that resulted in a
kernel BUG print due to the null pointer dereference.

To avoid this issue, first check that (attach->xmatch) is not null.

The one-line patch is attached to the email.

Ryan

--000000000000e6047e06200ed466
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-apparmor-fix-null-pointer-deref-in-find_attach.patch"
Content-Disposition: attachment; 
	filename="0001-apparmor-fix-null-pointer-deref-in-find_attach.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m01fcg0p0>
X-Attachment-Id: f_m01fcg0p0

RnJvbSBiMWFjMmY2ZTExMGIwMjgxYTE5YjY1YjkwMDViMDE5YzBlOTk2YjEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSeWFuIExlZSA8cnlhbi5sZWVAY2Fub25pY2FsLmNvbT4KRGF0
ZTogTW9uLCAxOSBBdWcgMjAyNCAxMTowNDowOCAtMDcwMApTdWJqZWN0OiBbUEFUQ0hdIGFwcGFy
bW9yOiBmaXggbnVsbCBwb2ludGVyIGRlcmVmIGluIGZpbmRfYXR0YWNoIHdoZW4geG1hdGNoCiBp
cyBudWxsCgpmaW5kX2F0dGFjaCBsb29wcyBvdmVyIHByb2ZpbGUgZW50cmllcyBhbmQgZmlyc3Qg
Y2hlY2tzIGZvciBhIERGQSwgZmFsbGluZwpiYWNrIG9udG8gYSBzdHJjbXAgb3RoZXJ3aXNlLiBI
b3dldmVyLCB0aGUgY2hlY2sgaWYgKGF0dGFjaC0+eG1hdGNoLT5kZmEpCmRpZCBub3QgYWNjb3Vu
dCBmb3IgdGhlIHBvc3NpYmlsaXR5IHRoYXQgKGF0dGFjaC0+eG1hdGNoKSBjb3VsZCBiZSBudWxs
LgpUaGlzIG9jY3VyZWQgd2l0aCBhIHNlcXVlbmNlIG9mIHByb2ZpbGUgcmVwbGFjZW1lbnRzIHRo
YXQgcmVzdWx0ZWQgaW4gYQprZXJuZWwgQlVHIHByaW50IGR1ZSB0byB0aGUgbnVsbCBwb2ludGVy
IGRlcmVmZXJlbmNlLgoKVG8gYXZvaWQgdGhpcyBpc3N1ZSwgZmlyc3QgY2hlY2sgdGhhdCAoYXR0
YWNoLT54bWF0Y2gpIGlzIG5vdCBudWxsLgoKU2lnbmVkLW9mZi1ieTogUnlhbiBMZWUgPHJ5YW4u
bGVlQGNhbm9uaWNhbC5jb20+Ci0tLQogc2VjdXJpdHkvYXBwYXJtb3IvZG9tYWluLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9zZWN1cml0eS9hcHBhcm1vci9kb21haW4uYyBiL3NlY3VyaXR5L2FwcGFybW9yL2RvbWFp
bi5jCmluZGV4IGRkNDU3ZWFlZGFiOC4uOTg1YTVhOWNkYmQwIDEwMDY0NAotLS0gYS9zZWN1cml0
eS9hcHBhcm1vci9kb21haW4uYworKysgYi9zZWN1cml0eS9hcHBhcm1vci9kb21haW4uYwpAQCAt
NDE1LDcgKzQxNSw3IEBAIHN0YXRpYyBzdHJ1Y3QgYWFfbGFiZWwgKmZpbmRfYXR0YWNoKGNvbnN0
IHN0cnVjdCBsaW51eF9iaW5wcm0gKmJwcm0sCiAJCSAqIGFzIGFub3RoZXIgcHJvZmlsZSwgc2ln
bmFsIGEgY29uZmxpY3QgYW5kIHJlZnVzZSB0bwogCQkgKiBtYXRjaC4KIAkJICovCi0JCWlmIChh
dHRhY2gtPnhtYXRjaC0+ZGZhKSB7CisJCWlmIChhdHRhY2gtPnhtYXRjaCAmJiBhdHRhY2gtPnht
YXRjaC0+ZGZhKSB7CiAJCQl1bnNpZ25lZCBpbnQgY291bnQ7CiAJCQlhYV9zdGF0ZV90IHN0YXRl
OwogCQkJc3RydWN0IGFhX3Blcm1zICpwZXJtczsKLS0gCjIuNDMuMAoK
--000000000000e6047e06200ed466--


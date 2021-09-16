Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id BECF240E1B0
	for <lists+apparmor@lfdr.de>; Thu, 16 Sep 2021 18:46:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mQuWT-00069j-CS; Thu, 16 Sep 2021 16:46:05 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1mQuWQ-00069J-Sr
 for apparmor@lists.ubuntu.com; Thu, 16 Sep 2021 16:46:02 +0000
Received: from [192.168.192.153] (unknown [50.45.173.99])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 565CF3F042; 
 Thu, 16 Sep 2021 16:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631810762;
 bh=JjtAhvWhl+VzcfY+uHFdXiykep88fbTA3EBh/b5oBY8=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=IpZs/x+Noq2Yy5vZ1hxsRO+WEncSTST9bmcBUM6Gx8cm0xzT7vRkzUrTRkXJlH3k4
 4Fck66nQ4WLvh30k3Iii6oeYktZtBDCx5Y/i4Kvy3Y+UKIUF1ULJ4t6UQ067v+0mfi
 QOdClm3iQlkGj3rcrY0wUPNEAYyaCb2MSiIvJzb+ESdTF/FLt2Bs79liniDfL1s/ID
 4m9eNQO/iNU1ZZb1BHq51FGSR80mq77VzpK5wVE5Y0Cd1FZx0QPpkdfCZh5Y5xmIRC
 yq+wDFBTP7+rjMlDwqBMe618wI9binQzndNsXWMZzCZXMMS8v06WWZ+DRtzgjL+Kk+
 2FjWvCNtA6GHw==
To: Forest <forestix@sonic.net>
References: <0pc5kg1g4kb6p70e781h28c3mc6vddk8fk@4ax.com>
 <83fd01dc-da59-55ca-d15b-9f1d79b4fbae@canonical.com>
 <d8r6kgd3do54onl59cjccp9qpaf8rjvop4@4ax.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
Message-ID: <df8c127c-75e0-92dd-07d7-91b789891c5b@canonical.com>
Date: Thu, 16 Sep 2021 09:45:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d8r6kgd3do54onl59cjccp9qpaf8rjvop4@4ax.com>
Content-Language: en-US
Subject: Re: [apparmor] How to extend an existing profile?
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
Cc: apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

T24gOS8xNi8yMSA5OjEzIEFNLCBGb3Jlc3Qgd3JvdGU6Cj4gT24gV2VkLCAxNSBTZXAgMjAyMSAy
MjowMzowMSAtMDcwMCwgSm9obiBKb2hhbnNlbiB3cm90ZToKPiAKPj4gT2YgY291cnNlIHN5bnRh
eCBpc24ndCBmaW5hbGl6ZWQsIGFuZCBmZWVkYmFjayBhbmQgaWRlYXMgYXJlIHdlbGNvbWUuCj4+
IEhvcGVmdWxseSB0aGlzIGlzIHNvbWV0aGluZyB3ZSBjYW4gbGFuZCBzb29uZXIgdGhhbiBsYXRl
ci4KPiAKPiBUaGFua3MgZm9yIHRoZSBiYWNrZ3JvdW5kIGFuZCBleHBsYW5hdGlvbiwgSm9obi4g
IElzIHRoaXMgaXNzdWUgaW4gYSB0cmFja2VyCj4gc29tZXdoZXJlPyAgSSB3b3VsZCBsaWtlIHRv
IGZvbGxvdyBpdCB3aXRob3V0IHJlY2VpdmluZyB0aGUgZ2VuZXJhbCBsaXN0Cj4gdHJhZmZpYy4K
PiAKCkl0IGlzIG5vdywgSSBqdXN0IG9wZW5lZCBhbiBpc3N1ZQpodHRwczovL2dpdGxhYi5jb20v
YXBwYXJtb3IvYXBwYXJtb3IvLS9pc3N1ZXMvMTk4CgpmZWVsIGZyZWUgdG8gYWRkIHRvIGl0CgoK
LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

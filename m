Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD7C4562E2
	for <lists+apparmor@lfdr.de>; Thu, 18 Nov 2021 19:47:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mnmRh-0006Ho-V1; Thu, 18 Nov 2021 18:47:41 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1mnmRf-0006Hc-O9
 for apparmor@lists.ubuntu.com; Thu, 18 Nov 2021 18:47:39 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 2B6ED3F1B3; 
 Thu, 18 Nov 2021 18:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637261259;
 bh=+jsvtdJGFwVzDwbz8QQjS4L0NqXddmpAe+LhEtYuGrE=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=V292I/0ODwPBodZ955mKyA0zqgqLE+I7bW+5wU26j8q9mhd+ROwUMK/MpQxS5ej7M
 sjIqDk9v9acdOHehespXWxUrubdwxLie62+9yBLuNAsdipjulZklOZFJVL+6voqECH
 VceFwjXwwT14GDi377h96ZInDl6UoqGpV7XWPuX8kZ2eCnO6oAwIQ1dQ5RKKw9gQw/
 NESHobYg7afyL2UUejo9wTzTMwXz43YrMU0f9I5RXSuIqFQ+Sp2Iyj6DoePUHSAPqI
 iVrwSVnB+29gINs/0zE42q14AJj1EhumWHbrPJk1fQLloAj8TarjUi/+KbApIE30ms
 KIbCQvaGrLRzQ==
To: beroal <me@beroal.in.ua>, apparmor@lists.ubuntu.com
References: <ec3bb2d2-7178-a65f-3a61-34aee8e0560c@beroal.in.ua>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
Message-ID: <fe74e779-a230-4151-f9da-efefe58f4290@canonical.com>
Date: Thu, 18 Nov 2021 10:47:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ec3bb2d2-7178-a65f-3a61-34aee8e0560c@beroal.in.ua>
Content-Language: en-US
Subject: Re: [apparmor] give a permission to a specific process
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

T24gMTEvMTYvMjEgMTo0NCBBTSwgYmVyb2FsIHdyb3RlOgo+IEhpLiBJIHdvbmRlciB3aGV0aGVy
IEFwcEFybW9yIGFsbG93cyB0byBnaXZlIGEgcGVybWlzc2lvbiB0byBhIHNwZWNpZmljIHByb2Nl
c3MuIEEgdXNlIGNhc2U6IHRoZXJlIGFyZSBVSSBwcm9ncmFtcyAoZWRpdG9ycywgdmlld2Vycykg
dGhhdCBuZWVkIHRlbXBvcmFyeSBhY2Nlc3MgdG8gYSBmaWxlIHNwZWNpZmllZCBieSBhIHVzZXIg
KHRvIGVkaXQsIHRvIHZpZXcpLgo+IAoKQXMgU2V0aCBoYXMgYWxyZWFkeSBwb2ludGVkIG91dCwg
d2hhdCB5b3UgYXJlIGxvb2tpbmcgZm9yIGlzIG1vcmUgb2YgYSBjYXBhYmlsaXR5IG1vZGVsLiBX
aGlsZSB0aGVyZSBpcyB3b3JrIHRvIGV4dGVuZCBBcHBBcm1vciBpbiB0aGlzIGRpcmVjdGlvbiwg
dXNlciBzcGFjZSBpbnRlZ3JhdGlvbiBzbyB0cnVzdGVkIGhlbHBlcnMgKHBvcnRhbHMsIHNuYXAs
IC4uKSBjYW4gdXNlIG9iamVjdCBkZWxlZ2F0aW9uIG9yIGV4dGVuZCBwcm9maWxlcywgY3VycmVu
dGx5IEFwcEFybW9yIGlzIG1vcmUgb2YgYW4gYW1iaWVudCBhdXRob3JpdHkgbW9kZWwuCgo+IFVu
Zm9ydHVuYXRlbHksIEFwcEFybW9yIHByb2ZpbGVzIGdpdmUgcGVybWlzc2lvbnMgdG8gZXhlY3V0
YWJsZSBmaWxlcy4gRm9yIGV4YW1wbGUsIGlmIGEgdXNlciBnaXZlcyBleGVjdXRhYmxlICRFIGFj
Y2VzcyB0byAvdG1wLyRGLCBhbnkgdXNlciB3aWxsIGhhdmUgYWNjZXNzIHRvIC90bXAvJEYgYnkg
ZXhlY3V0aW5nICRFLiBIZW5jZSBhIHVzZXIgbmVlZCBhIGZlYXR1cmUgd2hpY2ggZ2l2ZXMgcGVy
bWlzc2lvbiAkUiB0byBhbnkgcHJvY2VzcyB0aGF0IGV4ZWN1dGVzIGV4ZWN1dGFibGUgJEUgKiph
cyBhIHVzZXIgJFUqKiB3aGVyZSAkUiwgJEUsIGFuZCAkVSBhcmUgc3BlY2lmaWVkIGJ5IHRoZSB1
c2VyLiBBIGZlYXR1cmUgd2hpY2ggZ2l2ZXMgcGVybWlzc2lvbiAkUiB0byBwcm9jZXNzICRQIHdv
dWxkIGJlIG5pY2UgdG9vLCBidXQgaXNuJ3QgZXNzZW50aWFsLiBUaGVyZSBpcyBhIHByb2JsZW0g
aG93IGEgbm9uLXJvb3QgY2FuIHVzZSB0aGlzIGZlYXR1cmUsIGJ1dCBpdCdzIGEgc2VwYXJhdGUg
dG9waWMuCj4gCj4gRG9lcyBBcHBBcm1vciBoYXZlIHN1Y2ggYSBmZWF0dXJlPyBNYXliZSwgdGhl
cmUgaXMgYSBiZXR0ZXIgdG9vbCBmb3IgdGhpcyB1c2UgY2FzZT8KPiAKPiAKTm8sIGFuZCB5ZXMu
IEl0IHJlYWxseSBkZXBlbmRzIG9uIGhvdyB5b3Ugc2V0IHVwIEFwcEFybW9yLiBSdW5uaW5nIHdp
dGggdGhlIGRlZmF1bHQgb2YgaGF2aW5nIHVzZXJzIHVuY29uZmluZWQsIGJlaGF2aW9yIGlzIGxp
bWl0ZWQgdG8gdXNpbmcgcHJvZmlsZSBhdHRhY2htZW50cyB0byBkZXRlcm1pbmUgd2hvIGNhbiBl
eGVjdXRlIHdoaWNoIGFwcGxpY2F0aW9uIGFuZCB3aGF0IGl0cyBjb25maW5lbWVudCBpcy4gQmFz
aWNhbGx5IGluIHRlcm1zIG9mIGFwcGFybW9yIHByb2ZpbGUgcnVsZXMsIHVuY29uZmluZWQgaGFz
IGFuIGV4ZWMgcnVsZSBvZgoKICAvKiogcGl4LAoKV2hpY2ggYXMgeW91IHNhaWQgYWxsb3dzIGFu
eSB1c2VyIHRvIHJ1biAkRSBhbmQgZ2FpbiBhY2Nlc3MgdG8gL3RtcC8kRgoKSWYgeW91IHdhbnQg
dG8gY29udHJvbCB3aGljaCBhcHBsaWNhdGlvbnMgYSB1c2VyIGNhbiB1c2UgZXhlY3V0ZSB5b3Ug
bmVlZCB0byBjb25maW5lIHRoZSB1c2VyLiBUaGUgdXNlciBwcm9maWxlIGNhbiB0aGVuIGJlIHVz
ZWQgdG8gZGV0ZXJtaW5lIHdoYXQgY2FuIGJlIGV4ZWN1dGVkLCBhbmQgd2hhdCB0aGUgY29uZmlu
ZW1lbnQgY2FuIGJlLiBJdCBjYW4gYmUgbG9ja2VkIGludG8gYSBzaW5nbGUgcHJvZmlsZSwgYWxs
b3cgdHJhbnNpdGlvbmluZyB0byBhIGRpZmZlcmVudCBwcm9maWxlIChzYXkgZXhlY3V0YWJsZSkg
b3IgYmUgYSBkeW5hbWljIGNvbWJpbmF0aW9uIHZpYSBwcm9maWxlIHN0YWNraW5nLiBDb25maW5p
bmcgdXNlcnMgaXMgYSBodWdlIHRvcGljIGJleW9uZCB3aGF0IEkgY2FuIHNwZW5kIHRoZSB0aW1l
IHdyaXRpbmcgaGVyZS4gVW5mb3J0dW5hdGVseSBwYW1fYXBwYXJtb3IgKHRoZSBwcmltYXJ5IHdh
eSB0byBhY2hpZXZlIHRoaXMpIGhhcyBub3QgYmVlbiB1cGRhdGVkIGluIHllYXJzIGFuZCBpcyBh
IHJlYWwgcGl0YSB0byB3b3JrIHdpdGggYXRtLiAKCkJldHRlciB1c2VyIGNvbmZpbmVtZW50aXMg
c29tZXRoaW5nIHRoYXQgaXMgYmVpbmcgd29ya2VkIG9uIGN1cnJlbnRseSBmcm9tIG11bHRpcGxl
LWFuZ2xlcy4KLSBXZSBoYXZlIHNvbWVvbmUgd29ya2luZyBvbiBpbXByb3ZpbmcgcGFtX2FwcGFy
bW9yLgoKLSBUaGVyZSBpcyB3b3JrIHRvIGV4dGVuZCBwcm9maWxlIGF0dGFjaG1lbnRzIHNvIHRo
YXQgdGhleSBjYW4gaGF2ZSBhIHVzZXIgY29uZGl0aW9uYWwgZWcuCgogICAgcHJvZmlsZSBleGFt
cGxlIC9iaW4vZXhhbXBsZSB1c2VyPWZvbyB7IC4uLiB9CgotIFRoZXJlIGlzIHdvcmsgdG8gZXh0
ZW5kIHRoZSBwcm9maWxlIGF0dGFjaG1lbnQgc3ludGF4IHRvIGFsbG93IGJsb2NraW5nIG9mIGV4
ZWN1dGluZyBhbiBhcHBsaWNhdGlvbgoKICAgIGRlbnkgL3NiaW4vKiogdXNlcj1mb28sCiAgICBw
cm9maWxlIGJhciAvYmluL2JhciAgeyAuLi4gfQoKc2FkbHkgbm9uZSBvZiB0aGlzIGlzIGF2YWls
YWJsZSB0byB5b3UgYXRtLgoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0
cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9s
aXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

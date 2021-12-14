Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 603D147414E
	for <lists+apparmor@lfdr.de>; Tue, 14 Dec 2021 12:17:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mx5nM-0002Kw-KJ; Tue, 14 Dec 2021 11:16:32 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1mx5nK-0002JS-TU
 for apparmor@lists.ubuntu.com; Tue, 14 Dec 2021 11:16:30 +0000
Received: from [192.168.192.153] (unknown [50.126.114.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 31AB0404A0; 
 Tue, 14 Dec 2021 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639480590;
 bh=YHxyyGaBDSbOy7qCr7SbTa51LTpL63jbGg7k5As9rEc=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=LtFx6UiuiNwVO6BToJgBuJENu+zT29J1fyNzd0x0N6060qE+hDjGH4PZTkcanIx+H
 XklpDDXupJBM75pibITbaP8zu9Da8ZvUVdJ8bUbhuCeRHE32sgHPreUjpEhv4Bqub6
 qQvLxgVFb9CA1OyLxHCH8ntTGphoi8aV1bS5zeCuldsZM+7k072n8Rp9TqcW9YZj6L
 GywBTPMcCn2xR03sCe+g0nGR/Db+QqwMCdeVxZ+6RkSlQ5SSf0pYyXklLI9KzRailb
 SPQMpfSo3aEwrAmy3EzKLzgjRiIQU9YcJ7D2TrPnu0JMXNSVS0pYJugfoGHamB+Ova
 kX8+dDVoCQlzQ==
To: Casey Schaufler <casey@schaufler-ca.com>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
References: <068c959c-4c27-2231-021a-e8cb4e26499b.ref@schaufler-ca.com>
 <068c959c-4c27-2231-021a-e8cb4e26499b@schaufler-ca.com>
 <80f639de-3461-17e9-b257-14a3e7b8c9cb@canonical.com>
 <b3e5c115-8c67-0e9a-be87-5a10e816ceec@schaufler-ca.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
Message-ID: <66f18e10-73e8-68cb-0016-7c38882f1716@canonical.com>
Date: Tue, 14 Dec 2021 03:16:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b3e5c115-8c67-0e9a-be87-5a10e816ceec@schaufler-ca.com>
Content-Language: en-US
Subject: Re: [apparmor] Pesky '=' in subj= of audit in mainline
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

T2theSBJIGhhdmUgY2hlY2tlZCB0aHJvdWdoIHRoZSBjb2RlLCBhbmQgd2UgYXJlIGx1Y2t5IGlu
IHRoYXQgY3VycmVudGx5IHRoaXMgb25seSBiZWluZyB1c2VkIHRvIHZhbGlkIHRoYXQgY29udmVy
c2lvbnMgb2Ygc2VjaWRzIGludG8gc2VjY3R4J3MgYXJlIG9ubHkgYmVpbmcgZG9uZSBmcm9tIHRo
ZSB3aXRoIHRoZSBjb3JyZWN0IHZpZXcuCgpUaGUgc21hbGxlc3QgcGF0Y2ggaXMgYSBzaW1wbGUg
Y2hhcmFjdGVyIHN1YnN0aXR1dGlvbiBhbmQgaXMgYmVsb3cuIE90aGVyIG9wdGlvbnMgYXJlIGNv
bXBsZXRlbHkgZGVsZXRpbmcgdGhlIHBvcnRpb25zIG9mIHRoZSBjb2RlIGRlcGVuZGVudCBvbiB0
aGUgQUJTX1JPT1QgZmxhZyBvciBldmVuIGJldHRlciB3cmFwcGluZyBpdCBpbiBhIGRlYnVnIGNv
bmRpdGlvbmFsLiBGb3IgcHVzaGluZyBzb21ldGhpbmcgdXAgZm9yIC1yYzYgSSB3b3VsZCBsaWtl
IHRvIGtlZXAgdGhlIGNoYW5nZSBhcyBtaW5pbWFsIGFzIHBvc3NpYmxlCgoKY29tbWl0IDIzOTk5
M2ViYzlhYjk0YTZlYzUzYmM4MzIzYWRmOTJjMWNkNmIwOGQKQXV0aG9yOiBKb2huIEpvaGFuc2Vu
IDxqb2huLmpvaGFuc2VuQGNhbm9uaWNhbC5jb20+CkRhdGU6ICAgVHVlIERlYyAxNCAwMjo1OToy
OCAyMDIxIC0wODAwCgogICAgYXBwYXJtb3I6IGZpeCBhYnNyb290IGNhdXNpbmcgYXVkaXRlZCBz
ZWNpZHMgdG8gYmVnaW4gd2l0aCA9CiAgICAKICAgIEFwcEFybW9yIGlzIHByZWZpeGluZyBzZWNp
ZHMgdGhhdCBhcmUgY29udmVydGVkIHRvIHNlY2N0eCB3aXRoIHRoZSA9CiAgICB0byBpbmRpY2F0
ZSB0aGUgc2VjY3R4IHNob3VsZCBvbmx5IGJlIHBhcnNlZCBmcm9tIGFuIGFic29sdXRlIHJvb3QK
ICAgIFBPVi4gVGhpcyBhbGxvd3MgY2F0Y2hpbmcgZXJyb3JzIHdoZXJlIHNlY2N0eCBhcmUgcmVw
YXJzZWQgYmFjayBpbnRvCiAgICBpbnRlcm5hbCBsYWJlbHMuCiAgICAKICAgIFVuZm9ydHVuYXRl
bHkgYmVjYXVzZSBhdWRpdCBpcyB1c2luZyBzZWNpZCB0byBzZWNjdHggY29udmVyc2lvbiB0aGlz
CiAgICBtZWFucyB0aGF0IHN1YmplY3QgYW5kIG9iamVjdCBsYWJlbHMgY2FuIHJlc3VsdCBpbiBh
IHZlcnkgdW5mb3J0dW5hdGUKICAgID09IHRoYXQgY2FuIGJyZWFrIGF1ZGl0IHBhcnNpbmcuCiAg
ICAKICAgIGVnLiB0aGUgc3Viaj09dW5jb25maW5lZCB0ZXJtIGluIHRoZSBiZWxvdyBhdWRpdCBt
ZXNzYWdlCiAgICAKICAgIHR5cGU9VVNFUl9MT0dJTiBtc2c9YXVkaXQoMTYzOTQ0MzM2NS4yMzM6
MTYwKTogcGlkPTE2MzMgdWlkPTAgYXVpZD0xMDAwCiAgICBzZXM9MyBzdWJqPT11bmNvbmZpbmVk
IG1zZz0nb3A9bG9naW4gaWQ9MTAwMCBleGU9Ii91c3Ivc2Jpbi9zc2hkIgogICAgaG9zdG5hbWU9
MTkyLjE2OC4xMjIuMSBhZGRyPTE5Mi4xNjguMTIyLjEgdGVybWluYWw9L2Rldi9wdHMvMSByZXM9
c3VjY2VzcycKICAgIAogICAgRml4IHRoaXMgYnkgc3dpdGNoIHRoZSBwcmVwZW5kaW5nIG9mID0g
dG8gYSBfLiBUaGlzIHN0aWxsIHdvcmtzIGFzIGEKICAgIHNwZWNpYWwgY2hhcmFjdGVyIHRvIGZs
YWcgdGhpcyBjYXNlIHdpdGhvdXQgYnJlYWtpbmcgYXVkaXQuCiAgICAKICAgIEZpeGVzOiAyNmI3
ODk5NTEwYWUgKCJhcHBhcm1vcjogYWRkIHN1cHBvcnQgZm9yIGFic29sdXRlIHJvb3QgdmlldyBi
YXNlZCBsYWJlbHMiKQogICAgU2lnbmVkLW9mZi1ieTogSm9obiBKb2hhbnNlbiA8am9obi5qb2hh
bnNlbkBjYW5vbmljYWwuY29tPgoKZGlmZiAtLWdpdCBhL3NlY3VyaXR5L2FwcGFybW9yL2xhYmVs
LmMgYi9zZWN1cml0eS9hcHBhcm1vci9sYWJlbC5jCmluZGV4IDBiMDI2NWRhMTkyNi4uNTkyYzdi
ZjI1NjI0IDEwMDY0NAotLS0gYS9zZWN1cml0eS9hcHBhcm1vci9sYWJlbC5jCisrKyBiL3NlY3Vy
aXR5L2FwcGFybW9yL2xhYmVsLmMKQEAgLTE2MzMsNyArMTYzMyw3IEBAIGludCBhYV9sYWJlbF9z
bnhwcmludChjaGFyICpzdHIsIHNpemVfdCBzaXplLCBzdHJ1Y3QgYWFfbnMgKm5zLAogCiAJaWYg
KGZsYWdzICYgRkxBR19BQlNfUk9PVCkgewogCQlucyA9IHJvb3RfbnM7Ci0JCWxlbiA9IHNucHJp
bnRmKHN0ciwgc2l6ZSwgIj0iKTsKKwkJbGVuID0gc25wcmludGYoc3RyLCBzaXplLCAiXyIpOwog
CQl1cGRhdGVfZm9yX2xlbih0b3RhbCwgbGVuLCBzaXplLCBzdHIpOwogCX0gZWxzZSBpZiAoIW5z
KSB7CiAJCW5zID0gbGFiZWxzX25zKGxhYmVsKTsKQEAgLTE4OTUsNyArMTg5NSw3IEBAIHN0cnVj
dCBhYV9sYWJlbCAqYWFfbGFiZWxfc3Rybl9wYXJzZShzdHJ1Y3QgYWFfbGFiZWwgKmJhc2UsIGNv
bnN0IGNoYXIgKnN0ciwKIAlBQV9CVUcoIXN0cik7CiAKIAlzdHIgPSBza2lwbl9zcGFjZXMoc3Ry
LCBuKTsKLQlpZiAoc3RyID09IE5VTEwgfHwgKCpzdHIgPT0gJz0nICYmIGJhc2UgIT0gJnJvb3Rf
bnMtPnVuY29uZmluZWQtPmxhYmVsKSkKKwlpZiAoc3RyID09IE5VTEwgfHwgKCpzdHIgPT0gJ18n
ICYmIGJhc2UgIT0gJnJvb3RfbnMtPnVuY29uZmluZWQtPmxhYmVsKSkKIAkJcmV0dXJuIEVSUl9Q
VFIoLUVJTlZBTCk7CiAKIAlsZW4gPSBsYWJlbF9jb3VudF9zdHJuX2VudHJpZXMoc3RyLCBlbmQg
LSBzdHIpOwoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUu
Y29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVu
dHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

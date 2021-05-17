Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A70B5382681
	for <lists+apparmor@lfdr.de>; Mon, 17 May 2021 10:15:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1liYPM-0003Tg-2C; Mon, 17 May 2021 08:15:24 +0000
Received: from mout01.posteo.de ([185.67.36.65])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mailinglisten@posteo.de>) id 1liYPF-0003TZ-CM
 for apparmor@lists.ubuntu.com; Mon, 17 May 2021 08:15:17 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id D1794240029
 for <apparmor@lists.ubuntu.com>; Mon, 17 May 2021 10:15:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1621239316; bh=+JzvQJt92UyXRV9Xc6/uBsnoS1u5axBwY6D9Wk4WH4E=;
 h=To:From:Subject:Date:From;
 b=CPr8Z3a2NhTNoYFwVj7j76AgorOPXiW7yEC54bhGXInE1zmWNdBHomqCq8eMx+KZe
 CxkDtrJCjbUO50Hc/bNeLOiXzh7n0ZxENC3GO4n2zAR/u0qePkLNSpVhD434LwLGQl
 J3ai9+GnxcjE2MskNC7dqmJhf7tCljmexXuPFN+/c/cJcilc6sK04TyHnyyo0TmHLa
 e2y78+HqaH/7EtY5wjFxc2l+MqBaCw378KAslRCMLFIeYWJhIJSCvAZUGXIdaR+job
 Uxnj9cO52wKeyj+pSyE42G6mIqBQxjDuAjM85IY5wAEklrLO01pog0ASmthOghpp11
 tlGwV3YCPzaMg==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4FkBl82fcXz9rxD
 for <apparmor@lists.ubuntu.com>; Mon, 17 May 2021 10:15:16 +0200 (CEST)
To: apparmor@lists.ubuntu.com
From: "mailinglisten@posteo.de" <mailinglisten@posteo.de>
Message-ID: <16e8bf7f-9e53-8ad9-5183-31ecc51fc015@posteo.de>
Date: Mon, 17 May 2021 08:15:15 +0000
MIME-Version: 1.0
Content-Language: de-DE
Subject: [apparmor] apparmor cache dir error messages
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

SSBqdXN0IGRpc2NvdmVyZWQgYW4gYXBwYXJtb3IgZXJyb3IgbWVzc2FnZSBpbiB0aGUgbG9ncyBh
bmQgSSBoYXZlIG5vCmNsdWUgd2hlbiB0aGlzIGZpcnN0IGFwcGVhcmVkLi4uLgoKImFwcGFybW9y
LnN5c3RlbWQgKC4uLikgQ2FjaGU6IGZhaWxlZCB0byBhZGQgcmVhZCBvbmx5IGxvY2F0aW9uCicv
dXNyL3NoYXJlL2FwcGFybW9yL2NhY2hlJywgZG9lcyBub3QgY29udGFpbiB2YWxpZCBjYWNoZSBk
aXJlY3RvcnkiCgovdXNyL3NoYXJlL2FwcGFybW9yL2NhY2hlLyBhY3R1YWxseSBkb2VzIGV4aXN0
IGFuZCBjb250YWlucyBhIDEgeWVhciBvbGQKc3ViZGlyZWN0b3J5IHdpdGggcHJvZmlsZSBmaWxl
cyBpbnNpZGUsIGFzIGl0IHNlZW1zLgoKSXMgdGhpcyBzb21ldGhpbmcgdG8gd29ycnkgYWJvdXQ/
ClNpbmNlIHRoaXMgc3ViZGlyIGluIHRoZSBjYWNoZSBpcyB5ZWFyIG9sZCwgSSBndWVzcyBpdMK0
cyBzYWZlIHRvIGRlbGV0ZT8KClRoYW5rcyEKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBw
QXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6
IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

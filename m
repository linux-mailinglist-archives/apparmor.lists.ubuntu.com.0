Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B31302C07
	for <lists+apparmor@lfdr.de>; Mon, 25 Jan 2021 20:54:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1l47w0-00017B-CZ; Mon, 25 Jan 2021 19:54:00 +0000
Received: from merlin.infradead.org ([205.233.59.134])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <rdunlap@infradead.org>) id 1l47vy-000174-RO
 for apparmor@lists.ubuntu.com; Mon, 25 Jan 2021 19:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=XPc5xOyQBf5tFzS0CqIJXhJ1xLqNqWS/ktX5J0cuAxI=; b=nI4byitjmCyoAR3ZJaXwq6DTDg
 0rq+ByCeITPyNXFZXQ4DNStS27wJowO44jFJ9tsveEaWXtNWBAvfcZfFO7wHYXHjF77Zg2mcd3DjN
 MfIj12EcuPe/BQWdUbz1W9KrknfzV9nFc/60t1TnBWpDIfvQwKyvq6F8NlQI2QqFGFEXBlpvneTNL
 eRCa/EVbknDmNaUMvuWNBshi/Q5FvqspVmJ0zwv6kyWJD5Jcpx+q6LoRD3nKAsBWI9v1aXs/vp9lX
 BbkDopSmIFEVcNb7/9TQWKU+NUrZUX7G7q5QeZ6ZWkV+UQ3sL0AqPv4q7Qu2AQtNQVkC0TzSFqZbh
 53kTWerw==;
Received: from [2601:1c0:6280:3f0::7650] (helo=merlin.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l47vw-0007Ov-AB; Mon, 25 Jan 2021 19:53:56 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Mon, 25 Jan 2021 11:53:50 -0800
Message-Id: <20210125195350.24845-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [apparmor] [PATCH RESEND] security: apparmor: file.h: delete
	duplicated word
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
Cc: Seth Arnold <seth.arnold@canonical.com>,
 Randy Dunlap <rdunlap@infradead.org>, apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

RGVsZXRlIHRoZSBkb3VibGVkIHdvcmQgInRoZW4iIGluIGEgY29tbWVudC4KClNpZ25lZC1vZmYt
Ynk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgpDYzogSm9obiBKb2hhbnNl
biA8am9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tPgpDYzogYXBwYXJtb3JAbGlzdHMudWJ1bnR1
LmNvbQpSZXZpZXdlZC1ieTogU2V0aCBBcm5vbGQgPHNldGguYXJub2xkQGNhbm9uaWNhbC5jb20+
Ci0tLQogc2VjdXJpdHkvYXBwYXJtb3IvaW5jbHVkZS9maWxlLmggfCAgICAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCi0tLSBsaW51eC1uZXh0LTIw
MjAwNzE3Lm9yaWcvc2VjdXJpdHkvYXBwYXJtb3IvaW5jbHVkZS9maWxlLmgKKysrIGxpbnV4LW5l
eHQtMjAyMDA3MTcvc2VjdXJpdHkvYXBwYXJtb3IvaW5jbHVkZS9maWxlLmgKQEAgLTE2Nyw3ICsx
NjcsNyBAQCBpbnQgYWFfYXVkaXRfZmlsZShzdHJ1Y3QgYWFfcHJvZmlsZSAqcHJvCiAgKiBAcGVy
bXM6IHBlcm1pc3Npb24gdGFibGUgaW5kZXhlZCBieSB0aGUgbWF0Y2hlZCBzdGF0ZSBhY2NlcHQg
ZW50cnkgb2YgQGRmYQogICogQHRyYW5zOiB0cmFuc2l0aW9uIHRhYmxlIGZvciBpbmRleGVkIGJ5
IG5hbWVkIHggdHJhbnNpdGlvbnMKICAqCi0gKiBGaWxlIHBlcm1pc3Npb24gYXJlIGRldGVybWlu
ZWQgYnkgbWF0Y2hpbmcgYSBwYXRoIGFnYWluc3QgQGRmYSBhbmQgdGhlbgorICogRmlsZSBwZXJt
aXNzaW9uIGFyZSBkZXRlcm1pbmVkIGJ5IG1hdGNoaW5nIGEgcGF0aCBhZ2FpbnN0IEBkZmEgYW5k
CiAgKiB0aGVuIHVzaW5nIHRoZSB2YWx1ZSBvZiB0aGUgYWNjZXB0IGVudHJ5IGZvciB0aGUgbWF0
Y2hpbmcgc3RhdGUgYXMKICAqIGFuIGluZGV4IGludG8gQHBlcm1zLiAgSWYgYSBuYW1lZCBleGVj
IHRyYW5zaXRpb24gaXMgcmVxdWlyZWQgaXQgaXMKICAqIGxvb2tlZCB1cCBpbiB0aGUgdHJhbnNp
dGlvbiB0YWJsZS4KCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1
bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMu
dWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFF2228F79
	for <lists+apparmor@lfdr.de>; Wed, 22 Jul 2020 06:59:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1jy6fH-00044m-Ud; Wed, 22 Jul 2020 04:47:36 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <rdunlap@infradead.org>) id 1jxDjt-0007It-2T
 for apparmor@lists.ubuntu.com; Sun, 19 Jul 2020 18:08:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=CgRnudM818Ox8zC1i9FgSDhyBLgDa+Y/onXsjyLCw/4=; b=ONvhuYhkvPXUZtwXkc8K1Bgs2+
 b3mzjeyg1SYos7MJnaIYaBiY55AO0nlgoSim0uDcgk4MINinffOUPNfiOxJNs4CWHvRtKS3+vcJZ+
 OAhuyIheCZ0VaUNFvt2yj9s7QCVJfnrtHUotUV2ZIo6DSPFf3rBLS/hxE5z546buKutFasDM73jQ+
 +n9U/Avp0cMEqfwo4glfL8DNO9ajTzMbXAId1PB8pFOSD7FShgVGQoQ9Z3VP2Gf5rcjMs6j0aB+1w
 9paEKqwZDVN7VtXWgpJLr0iYoUlBUURoNXOLoVIFMHf8GoCbSiiCDYxhwNSP85BKIu0W8EUdFCjXS
 5P6ncZ+Q==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxDjq-0006CP-49; Sun, 19 Jul 2020 18:08:39 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Sun, 19 Jul 2020 11:08:35 -0700
Message-Id: <20200719180835.24658-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jul 2020 04:47:31 +0000
Subject: [apparmor] [PATCH] security: apparmor: file.h: delete duplicated
	word
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
Cc: Randy Dunlap <rdunlap@infradead.org>, apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

RGVsZXRlIHRoZSBkb3VibGVkIHdvcmQgInRoZW4iIGluIGEgY29tbWVudC4KClNpZ25lZC1vZmYt
Ynk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgpDYzogSm9obiBKb2hhbnNl
biA8am9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tPgpDYzogYXBwYXJtb3JAbGlzdHMudWJ1bnR1
LmNvbQotLS0KIHNlY3VyaXR5L2FwcGFybW9yL2luY2x1ZGUvZmlsZS5oIHwgICAgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgotLS0gbGludXgtbmV4
dC0yMDIwMDcxNy5vcmlnL3NlY3VyaXR5L2FwcGFybW9yL2luY2x1ZGUvZmlsZS5oCisrKyBsaW51
eC1uZXh0LTIwMjAwNzE3L3NlY3VyaXR5L2FwcGFybW9yL2luY2x1ZGUvZmlsZS5oCkBAIC0xNjcs
NyArMTY3LDcgQEAgaW50IGFhX2F1ZGl0X2ZpbGUoc3RydWN0IGFhX3Byb2ZpbGUgKnBybwogICog
QHBlcm1zOiBwZXJtaXNzaW9uIHRhYmxlIGluZGV4ZWQgYnkgdGhlIG1hdGNoZWQgc3RhdGUgYWNj
ZXB0IGVudHJ5IG9mIEBkZmEKICAqIEB0cmFuczogdHJhbnNpdGlvbiB0YWJsZSBmb3IgaW5kZXhl
ZCBieSBuYW1lZCB4IHRyYW5zaXRpb25zCiAgKgotICogRmlsZSBwZXJtaXNzaW9uIGFyZSBkZXRl
cm1pbmVkIGJ5IG1hdGNoaW5nIGEgcGF0aCBhZ2FpbnN0IEBkZmEgYW5kIHRoZW4KKyAqIEZpbGUg
cGVybWlzc2lvbiBhcmUgZGV0ZXJtaW5lZCBieSBtYXRjaGluZyBhIHBhdGggYWdhaW5zdCBAZGZh
IGFuZAogICogdGhlbiB1c2luZyB0aGUgdmFsdWUgb2YgdGhlIGFjY2VwdCBlbnRyeSBmb3IgdGhl
IG1hdGNoaW5nIHN0YXRlIGFzCiAgKiBhbiBpbmRleCBpbnRvIEBwZXJtcy4gIElmIGEgbmFtZWQg
ZXhlYyB0cmFuc2l0aW9uIGlzIHJlcXVpcmVkIGl0IGlzCiAgKiBsb29rZWQgdXAgaW4gdGhlIHRy
YW5zaXRpb24gdGFibGUuCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3Rz
LnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xp
c3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FC523F181
	for <lists+apparmor@lfdr.de>; Fri,  7 Aug 2020 18:51:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k45aH-0005z1-Q6; Fri, 07 Aug 2020 16:51:09 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <rdunlap@infradead.org>) id 1k45aF-0005yv-JI
 for apparmor@lists.ubuntu.com; Fri, 07 Aug 2020 16:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=RIJQU5bJaS8+eeCwZwEF7PZkGZvsc2GUo4LIjXOFzL4=; b=ZTriFmLmu37Bl8o4aFw4yGjsYf
 mUMtfra9EPFNHrMz9UdYXkutIVuRepDozrjR7DEAcJTyRQua4JkK+haql12L+CIbSjLtkaX3bTkgF
 FA89cf/7y4rBYjNc0mXs4V9rkFjl5iVbeTATmE0RPXK907TORFu7AYykPGmuB7Wnr1eYIrnekMscx
 kZS8dYKwk7Czg87K4/QLDH6k0C7A9fIm9joaFFsAFyy1s1OQFj+2bQqkT3RlsPuU3HFr5Ab66iDb1
 EAN8UKI1SVVG1cyGEzFn3XuKF8w7/Rl0N+Ye8CiW91sBbDAowG1SmUFiRlZVbjTTUo3s/bXKGP9NC
 5SZkLVHw==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k45a6-0004EV-RK; Fri, 07 Aug 2020 16:50:59 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  7 Aug 2020 09:50:55 -0700
Message-Id: <20200807165055.3756-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [apparmor] [PATCH] security: apparmor: delete repeated words in
	comments
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
Cc: Randy Dunlap <rdunlap@infradead.org>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, linux-security-module@vger.kernel.org,
 "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

RHJvcCByZXBlYXRlZCB3b3JkcyBpbiBjb21tZW50cy4Ke2EsIHRoZW4sIHRvfQoKU2lnbmVkLW9m
Zi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+CkNjOiBKb2huIEpvaGFu
c2VuIDxqb2huLmpvaGFuc2VuQGNhbm9uaWNhbC5jb20+CkNjOiBhcHBhcm1vckBsaXN0cy51YnVu
dHUuY29tCkNjOiBKYW1lcyBNb3JyaXMgPGptb3JyaXNAbmFtZWkub3JnPgpDYzogIlNlcmdlIEUu
IEhhbGx5biIgPHNlcmdlQGhhbGx5bi5jb20+CkNjOiBsaW51eC1zZWN1cml0eS1tb2R1bGVAdmdl
ci5rZXJuZWwub3JnCi0tLQogc2VjdXJpdHkvYXBwYXJtb3IvaW5jbHVkZS9maWxlLmggIHwgICAg
MiArLQogc2VjdXJpdHkvYXBwYXJtb3IvcGF0aC5jICAgICAgICAgIHwgICAgMiArLQogc2VjdXJp
dHkvYXBwYXJtb3IvcG9saWN5X3VucGFjay5jIHwgICAgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgotLS0gbGludXgtbmV4dC0yMDIwMDczMS5v
cmlnL3NlY3VyaXR5L2FwcGFybW9yL2luY2x1ZGUvZmlsZS5oCisrKyBsaW51eC1uZXh0LTIwMjAw
NzMxL3NlY3VyaXR5L2FwcGFybW9yL2luY2x1ZGUvZmlsZS5oCkBAIC0xNjcsNyArMTY3LDcgQEAg
aW50IGFhX2F1ZGl0X2ZpbGUoc3RydWN0IGFhX3Byb2ZpbGUgKnBybwogICogQHBlcm1zOiBwZXJt
aXNzaW9uIHRhYmxlIGluZGV4ZWQgYnkgdGhlIG1hdGNoZWQgc3RhdGUgYWNjZXB0IGVudHJ5IG9m
IEBkZmEKICAqIEB0cmFuczogdHJhbnNpdGlvbiB0YWJsZSBmb3IgaW5kZXhlZCBieSBuYW1lZCB4
IHRyYW5zaXRpb25zCiAgKgotICogRmlsZSBwZXJtaXNzaW9uIGFyZSBkZXRlcm1pbmVkIGJ5IG1h
dGNoaW5nIGEgcGF0aCBhZ2FpbnN0IEBkZmEgYW5kIHRoZW4KKyAqIEZpbGUgcGVybWlzc2lvbiBh
cmUgZGV0ZXJtaW5lZCBieSBtYXRjaGluZyBhIHBhdGggYWdhaW5zdCBAZGZhIGFuZAogICogdGhl
biB1c2luZyB0aGUgdmFsdWUgb2YgdGhlIGFjY2VwdCBlbnRyeSBmb3IgdGhlIG1hdGNoaW5nIHN0
YXRlIGFzCiAgKiBhbiBpbmRleCBpbnRvIEBwZXJtcy4gIElmIGEgbmFtZWQgZXhlYyB0cmFuc2l0
aW9uIGlzIHJlcXVpcmVkIGl0IGlzCiAgKiBsb29rZWQgdXAgaW4gdGhlIHRyYW5zaXRpb24gdGFi
bGUuCi0tLSBsaW51eC1uZXh0LTIwMjAwNzMxLm9yaWcvc2VjdXJpdHkvYXBwYXJtb3IvcGF0aC5j
CisrKyBsaW51eC1uZXh0LTIwMjAwNzMxL3NlY3VyaXR5L2FwcGFybW9yL3BhdGguYwpAQCAtODMs
NyArODMsNyBAQCBzdGF0aWMgaW50IGRpc2Nvbm5lY3QoY29uc3Qgc3RydWN0IHBhdGgKICAqCiAg
KiBSZXR1cm5zOiAlMCBlbHNlIGVycm9yIGNvZGUgaWYgcGF0aCBsb29rdXAgZmFpbHMKICAqICAg
ICAgICAgIFdoZW4gbm8gZXJyb3IgdGhlIHBhdGggbmFtZSBpcyByZXR1cm5lZCBpbiBAbmFtZSB3
aGljaCBwb2ludHMgdG8KLSAqICAgICAgICAgIHRvIGEgcG9zaXRpb24gaW4gQGJ1ZgorICogICAg
ICAgICAgYSBwb3NpdGlvbiBpbiBAYnVmCiAgKi8KIHN0YXRpYyBpbnQgZF9uYW1lc3BhY2VfcGF0
aChjb25zdCBzdHJ1Y3QgcGF0aCAqcGF0aCwgY2hhciAqYnVmLCBjaGFyICoqbmFtZSwKIAkJCSAg
ICBpbnQgZmxhZ3MsIGNvbnN0IGNoYXIgKmRpc2Nvbm5lY3RlZCkKLS0tIGxpbnV4LW5leHQtMjAy
MDA3MzEub3JpZy9zZWN1cml0eS9hcHBhcm1vci9wb2xpY3lfdW5wYWNrLmMKKysrIGxpbnV4LW5l
eHQtMjAyMDA3MzEvc2VjdXJpdHkvYXBwYXJtb3IvcG9saWN5X3VucGFjay5jCkBAIC0zOSw3ICsz
OSw3IEBACiAKIC8qCiAgKiBUaGUgQXBwQXJtb3IgaW50ZXJmYWNlIHRyZWF0cyBkYXRhIGFzIGEg
dHlwZSBieXRlIGZvbGxvd2VkIGJ5IHRoZQotICogYWN0dWFsIGRhdGEuICBUaGUgaW50ZXJmYWNl
IGhhcyB0aGUgbm90aW9uIG9mIGEgYSBuYW1lZCBlbnRyeQorICogYWN0dWFsIGRhdGEuICBUaGUg
aW50ZXJmYWNlIGhhcyB0aGUgbm90aW9uIG9mIGEgbmFtZWQgZW50cnkKICAqIHdoaWNoIGhhcyBh
IG5hbWUgKEFBX05BTUUgdHlwZWNvZGUgZm9sbG93ZWQgYnkgbmFtZSBzdHJpbmcpIGZvbGxvd2Vk
IGJ5CiAgKiB0aGUgZW50cmllcyB0eXBlY29kZSBhbmQgZGF0YS4gIE5hbWVkIHR5cGVzIGFsbG93
IGZvciBvcHRpb25hbAogICogZWxlbWVudHMgYW5kIGV4dGVuc2lvbnMgdG8gYmUgYWRkZWQgYW5k
IHRlc3RlZCBmb3Igd2l0aG91dCBicmVha2luZwoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApB
cHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBh
dDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

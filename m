Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC34429E72
	for <lists+apparmor@lfdr.de>; Tue, 12 Oct 2021 09:17:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1maC1y-0004fd-0D; Tue, 12 Oct 2021 07:16:58 +0000
Received: from confino.investici.org ([212.103.72.250])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <intrigeri@boum.org>) id 1maC1w-0004fW-EO
 for apparmor@lists.ubuntu.com; Tue, 12 Oct 2021 07:16:56 +0000
Received: from mx1.investici.org (unknown [127.0.0.1])
 by confino.investici.org (Postfix) with ESMTP id 4HT6RW55YLz10wJ
 for <apparmor@lists.ubuntu.com>; Tue, 12 Oct 2021 07:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boum.org;
 s=stigmate; t=1634023015;
 bh=x6/IM2dtwyI8lB8X8bZNnpaAIpeQAIBNuTlKA6umS/A=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=jHo/mZrWG7XRngdVCgXL+KEjLmyMfDEzBm0ZxJsFFLkozQ2OG/HyeaIi7vcp1xj0O
 5YSrUw45krLgSqTkKokrUGVxlRWZY/mM9TG6wbWwbotT1AC/+XVS4EgYaS46uxD6nk
 sLhslVygVnkvV3/1cjLEIFflsb14zJCTaTWuC3eo=
Received: from [212.103.72.250] (mx1.investici.org [212.103.72.250])
 (Authenticated sender: intrigeri@boum.org) by localhost (Postfix) with
 ESMTPSA id 4HT6RW1tV6z10wC
 for <apparmor@lists.ubuntu.com>; Tue, 12 Oct 2021 07:16:55 +0000 (UTC)
Received: from manticora (localhost [127.0.0.1])
 by localhost (Postfix) with ESMTP id 1F9B81881D44
 for <apparmor@lists.ubuntu.com>; Tue, 12 Oct 2021 09:16:37 +0200 (CEST)
Message-Id: <87y26ylnl6.fsf@manticora>
From: intrigeri <intrigeri@boum.org>
To: apparmor@lists.ubuntu.com
In-Reply-To: <e39e45bd-9e51-623c-8e6e-4ea34400c842@canonical.com>
References: <87pmtkop58.fsf@manticora.bergerie.taz>
 <3415835.JB2sseZfvn@tux.boltz.de.vu>
 <e39e45bd-9e51-623c-8e6e-4ea34400c842@canonical.com>
Date: Tue, 12 Oct 2021 09:16:37 +0200
MIME-Version: 1.0
Subject: Re: [apparmor] Deprecating the Perl bindings?
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

SGksCgpUaGFuayB5b3UgYWxsIGZvciB0aGlzIGNvbnN0cnVjdGl2ZSBkaXNjdXNzaW9uLgoKSm9o
biBKb2hhbnNlbiAoMjAyMS0wOS0wOCk6Cj4+IEF0IHRoZSBzYW1lIHRpbWUgLSBpZiB0aGUgcGVy
bCBiaW5kaW5ncyBjYXVzZSB5b3UgbWFqb3IgaGVhZGFjaGVzIG9uIAo+PiBEZWJpYW4sIGZlZWwg
ZnJlZSB0byBkcm9wIC0td2l0aC1wZXJsLgo+Cj4geWVzLCB0aGlzIGlzIHRoZSBpbW1lZGlhdGUg
c29sdXRpb24gZm9yIGRlYmlhbi4gQW5kIHdlIGNhbiB0YWtlIHRoYXQKPiBhcyBhIGRhdGEgcG9p
bnQgZm9yIHRoZSBkZXByZWNhdGlvbiBkaXNjdXNzaW9uLgoKQ29vLiBJJ2xsIGdpdmUgaXQgYSB0
cnkgYW5kIHJlcG9ydCBiYWNrIGFib3V0IHRoZSBhbW91bnQgb2YgY29tcGxhaW5zLAppZiBhbnku
CgpDaGVlcnMhCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50
dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVi
dW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

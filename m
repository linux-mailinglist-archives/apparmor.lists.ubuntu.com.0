Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF1946F654
	for <lists+apparmor@lfdr.de>; Thu,  9 Dec 2021 23:00:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mvRSg-0000Lv-9c; Thu, 09 Dec 2021 22:00:22 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <georgia.garcia@canonical.com>) id 1mvRSf-0000Lo-1r
 for apparmor@lists.ubuntu.com; Thu, 09 Dec 2021 22:00:21 +0000
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C6E533F1B7
 for <apparmor@lists.ubuntu.com>; Thu,  9 Dec 2021 22:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639087220;
 bh=DYxoe9HFCccSj94jXBhiNlTmRdzlmJxGwqgTQ/puatg=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
 Content-Type:MIME-Version;
 b=Z6QJKjTB6M4gQi0n2+SyJmOAbZvlnMdKZvbEXkn/rEO0bBS6I7LF0VGFpOaj3Vjc+
 WLQB3yftN8DC7Ix59ASHZ7r+QfG3CixGw39QdOBWg0e67tUvMjld1StmroPLtJzIUk
 HWbJ6jdTTb9L+f27eVnIvSfLJavlkXm+goXNpCn2FAIxecSilhb+jTOdCVBVXeSe6+
 Nu6Pp1B0rbcdlb0FvayFS89dLyoKIvfEt6G2Am5CZOx4blW/OELrzGDo+bBCbAQ3rJ
 yTcAz8VAZdSYU9YXfT1RVQbSFvuMdqXbIz/q5TslMF27y34JklpWOrlnzGYHGtN+Op
 B4zK4ugpOWKkw==
Received: by mail-vk1-f197.google.com with SMTP id
 m5-20020ac5cfc5000000b002fafbc93a15so4556922vkf.16
 for <apparmor@lists.ubuntu.com>; Thu, 09 Dec 2021 14:00:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=DYxoe9HFCccSj94jXBhiNlTmRdzlmJxGwqgTQ/puatg=;
 b=fT+Q8w2twNDI5nI6DeFylWSOmjAKicyBkguBLEker/F0SJ2Wkg5ZPuhoz2K4DWznNf
 z1NS77fsICsw2cFTXHGzE3tay8f/O36z69fkrPL9XwNvayIdT/pv8uR5oAeWBYHCWYSH
 JUuPu7l4ckgW2Fmf220I9T2sId8xsbUR9mMXwGPj/FQnG7YYlTdPe9Q9u+7XehUouWYg
 rojdB4DNE0dJEaZi1Wd8HCH4yHqJYpRFh4D76ZZGoqqRDqtNr6F/hw0S/JKOk0fBzWkf
 WXg6ZKb7N1uxT5sZUPwQCliXdJUSBhrCgYvZhCyhbSfRWJy6Ht5HMhsyXknGtLan2tl4
 cZ4w==
X-Gm-Message-State: AOAM530PGgN3DXVDr0hJMHTmQwWoTmdj+UYmAiQNk6KGwB9hLZ3gVeAP
 F2uzvhNmhmjSZy03jkfkgfS3qzYhDyC1dC0iPZ3uqQNP/Q4JSHzfc3LPpkdcnNaUmP+nQQC6fCU
 p1l65F3KMfTQdbeIbALxOeDEf2gHsWAWhdIybVA==
X-Received: by 2002:a67:ba0c:: with SMTP id l12mr11110937vsn.21.1639087218170; 
 Thu, 09 Dec 2021 14:00:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyU3to/EoNjPkHHgMzW7l+xmAGgrMllxPffLXOzLm8zCPCTVS9HcdW1x6awoyUISl/LGbjivg==
X-Received: by 2002:a67:ba0c:: with SMTP id l12mr11110694vsn.21.1639087215159; 
 Thu, 09 Dec 2021 14:00:15 -0800 (PST)
Received: from georgia ([2804:431:c7ef:ece7:3818:b3a1:e2cd:ada7])
 by smtp.gmail.com with ESMTPSA id j15sm653178vsj.32.2021.12.09.14.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 14:00:14 -0800 (PST)
Message-ID: <ddff0a05b68fa9e7bd2a6f3651b2117540091b9a.camel@canonical.com>
From: Georgia Garcia <georgia.garcia@canonical.com>
To: Christian Boltz <apparmor@cboltz.de>, apparmor@lists.ubuntu.com
Date: Thu, 09 Dec 2021 19:00:12 -0300
In-Reply-To: <3143579.6J4DOfBNSB@tux.boltz.de.vu>
References: <20211206215516.274310-1-georgia.garcia@canonical.com>
 <3143579.6J4DOfBNSB@tux.boltz.de.vu>
Organization: Canonical
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Subject: Re: [apparmor] [PATCH] apparmor: add module mediation
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

T24gV2VkLCAyMDIxLTEyLTA4IGF0IDE5OjM4ICswMTAwLCBDaHJpc3RpYW4gQm9sdHogd3JvdGU6
Cj4gSGVsbG8sCj4gCj4gQW0gTW9udGFnLCA2LiBEZXplbWJlciAyMDIxLCAyMjo1NToxNiBDRVQg
c2NocmllYiBHZW9yZ2lhIEdhcmNpYToKPiA+ICsgKiBSZXR1cm5zOiAlMCBvciBlcnJvciBvbiBm
YWlsdXJlCj4gICAgICAgICAgICAgICAgXl4KPiBJJ2QgZ3Vlc3MgdGhhdCBzaG91bGQganVzdCBi
ZSAgIDAgICBpbnN0ZWFkIG9mICAgJTAgICA7LSkKPiAKClRoYW5rcywgSSdsbCBmaXggaXQuIEkg
Y29waWVkIGZyb20gYSBkaWZmZXJlbnQgZnVuY3Rpb24gdGhpbmtpbmcgaXQgd2FzCnRoZSByaWdo
dCBmb3JtYXQuIEknbGwgc2VuZCBhIHBhdGNoIGxhdGVyIGZpeGluZyBpdCBpbiBvdGhlciBwbGFj
ZXMKYWxyZWFkeSBpbiBhcHBhcm1vciBpZiB5b3UgdGhpbmsgaXQncyBhIGdvb2QgaWRlYS4KCj4g
Tm90ZSB0aGF0IHlvdSBoYXZlIDMgY29waWVzIG9mIHRoaXMgKHByb2JhYmx5KSB0eXBvIGluIHlv
dXIgcGF0Y2gsIAo+IHBsZWFzZSBmaXggYWxsIG9mIHRoZW0uCj4gCj4gCj4gUmVnYXJkcywKPiAK
PiBDaHJpc3RpYW4gQm9sdHoKClJlZ2FyZHMsCkdlb3JnaWEKCgotLSAKQXBwQXJtb3IgbWFpbGlu
ZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vi
c2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBh
cm1vcgo=

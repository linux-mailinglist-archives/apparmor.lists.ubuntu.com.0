Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CE315C92A
	for <lists+apparmor@lfdr.de>; Thu, 13 Feb 2020 18:08:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1j2Hyn-0006y6-Ik; Thu, 13 Feb 2020 17:08:45 +0000
Received: from mail-lj1-f170.google.com ([209.85.208.170])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <vindrg@gmail.com>) id 1j2Hym-0006xv-NU
 for apparmor@lists.ubuntu.com; Thu, 13 Feb 2020 17:08:44 +0000
Received: by mail-lj1-f170.google.com with SMTP id h23so7461491ljc.8
 for <apparmor@lists.ubuntu.com>; Thu, 13 Feb 2020 09:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=EMdcT5Yo3wUHqHqbOgk0kNRl9eHtd4gC7zt+fWU5JOs=;
 b=SGrOHufP3cxr/bp/XAKM44v8E0W8034vwRkjUmiLfVaNoFg7rs3hpoG/2iJyxvCmyM
 O5LN6qA5MGruzqY6i2lPz0+S1Hb7km4Ec7xbog0JZrs0kFtxpqCh8MU4ICaNm2oumLQZ
 SdPpYQGUjLU4/N4Ef2yEhzT0XvK1IlkIEW5yJmLvn85EGOd1wgghMWd65Czwm87mZ+/y
 5/EjgVIXFIgAFpHoDpjD2p9ZO7VKT7YUSsVcFl0ueF15W2JjZVtbZufI9y6oq7B9iUAH
 o0ZCkiUR+QbAGT3UsoidwZi3NM/eicDVvcRCPJpx4vjaiY3iZ6YY8ZX2A54Th6ReESN+
 jxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EMdcT5Yo3wUHqHqbOgk0kNRl9eHtd4gC7zt+fWU5JOs=;
 b=mZAw/HnA8nLzmfJYWcsBXo5yU/+rqCRpI79EA1J8eqpXw2UFYhHKIWEtxRasn/ih3i
 S12TZSeuJ18CELBUi6OkR++9d8svF4YBmIgA+brJO/nFFgdEBK5JLgGmF+lP94nsdZlH
 j5ZukVC8KHBwtY2LWuRjIxkQooOkN0Uu6veZcm8bXUTwtu+Bq0hkoVpLZM5MmqwlWD0i
 kNNsyLynhiJmeBiuvGmb5OpujrNAT3AX8GMt0yEoNBCGj5PSjLZNqnuDdRggmQ8UDz6U
 4019SsAOxHM9zxHK4HeO7FL0j1KA4isyqCPX82Az906+XYieteqFGaIwwV9GrwyCd3BB
 685g==
X-Gm-Message-State: APjAAAXWg7ZlJl/hKxqQrUnlnkOVDhgEhh6HmVUdS/RN97fkxh7NVklT
 /NiQAwCC+vMFw3F4dWVoJDEgnTUR
X-Google-Smtp-Source: APXvYqxeqbh4eyCxfFlF6N0w4ErHyH2mTD9ByuieCONLyrWKpSSFWWzuVo6V8b9h2WDeBTVaCejJtQ==
X-Received: by 2002:a2e:2283:: with SMTP id
 i125mr12191605lji.244.1581613723663; 
 Thu, 13 Feb 2020 09:08:43 -0800 (PST)
Received: from [192.168.1.10] (hst-227-49.splius.lt. [62.80.227.49])
 by smtp.gmail.com with ESMTPSA id x23sm1645016lff.24.2020.02.13.09.08.42
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 09:08:43 -0800 (PST)
To: apparmor@lists.ubuntu.com
References: <a58437d1-4cbf-953c-d06d-f950032ee6e2@canonical.com>
From: Vincas Dargis <vindrg@gmail.com>
Message-ID: <9cf3e4af-04d1-2a2b-0841-1c9df2466f22@gmail.com>
Date: Thu, 13 Feb 2020 19:08:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <a58437d1-4cbf-953c-d06d-f950032ee6e2@canonical.com>
Content-Language: en-US
Subject: Re: [apparmor] New AppArmor web page now live
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

VGhhbmtzIE90dG8hIFJlYWxseSBuaWNlIGFuZCBjbGVhbiBzaXRlIDopCgoyMDIwLTAyLTEzIDAy
OjM5LCBKb2huIEpvaGFuc2VuIHJhxaHElzoKPiBBIG5ldyB3ZWIgcGFnZSBmb3IgQXBwQXJtb3Ig
aXMgbGl2ZS4gSXQgY2FuIGJlIGZvdW5kIGF0Cj4gCj4gIMKgIGh0dHBzOi8vYXBwYXJtb3IubmV0
Cj4gCj4gVGhhbmtzIHRvIE90dG8gS2Vrw6Rsw6RpbmVuIGZvciBhbGwgaGlzIGhhcmQgd29yayB0
aGF0IG1hZGUgdGhpcyBwb3NzaWJsZS4KPiAKPiAKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QK
QXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUg
YXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D241595D7
	for <lists+apparmor@lfdr.de>; Tue, 11 Feb 2020 18:02:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1j1YvC-0002z1-Oq; Tue, 11 Feb 2020 17:02:02 +0000
Received: from mail-lj1-f175.google.com ([209.85.208.175])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mmorfikov@gmail.com>) id 1j1YvB-0002ya-4S
 for apparmor@lists.ubuntu.com; Tue, 11 Feb 2020 17:02:01 +0000
Received: by mail-lj1-f175.google.com with SMTP id w1so12446769ljh.5
 for <apparmor@lists.ubuntu.com>; Tue, 11 Feb 2020 09:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id
 :disposition-notification-to:date:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vKTEsknla9mTeOMjdQp/UffqP6ByAHGxjqOAfefwfIo=;
 b=t76RGT8I1AvsbAFMKDsK1iVChqzKOXbdZYdTZttVHXEqee7i42FF5FDqvHOxM/uP2H
 GWA9Zfdtlr4nbwyW14xLzdRCccn/xRfZOTwatSzkshVxYWwjaCKt5MbOATE0kFymisb+
 2E2+FhkxDAfFIM60P4EgjgYRHgAztsd8At5DVGu5xA7aHSYW4ysqdtvhB2ziheR6iPi7
 vmLtCjqkHJsmxwsC58oQU/yc1X0VEbyqZ0ZdXZhniLJU4KYxuG2FBSF3F9TvkR1HFrHN
 AC42ICKygfNTSQKLqwli1b7Rxp93p9YjiEr5lYfi0Uq9vRPjbIVtGOrOXR55mc5bGqwL
 gagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :disposition-notification-to:date:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vKTEsknla9mTeOMjdQp/UffqP6ByAHGxjqOAfefwfIo=;
 b=bAJpEviOBt33minuVDI7rK2NLth8IglAT3mkefQJrPaZ9oDUAIz6B7k/SsLQm1TRQv
 QLlHk7hj4i+7SrEhHssyi8Tlg/EH0j7y+6TiUnzOpldmEHMxASgsKa0IrtyeGUTlIkYl
 dwo0I13MDigSNFkANrz6vIQ2jA6uaR6qmhbRVk35+4KaSH2yEZ3y568UxfWO2uSlQzGo
 8LOnOGN0m2FpWC/FF1F1g8u65OfPZDCrFTouchPyQmxRiQyjZ6zg0LAByIOqw3ppUz2u
 QpHkyCN/4CmweEFcH8ygWbcpXjN5licE773dZTyQg8qrUv/CAMeNHyhDHwKhhlzJj4vL
 govQ==
X-Gm-Message-State: APjAAAXPbIRkg+sbm0ZWd7iBdLgeslsxLVOaAJ1quGQE5AHzQ/ZQ2ITd
 X4lB3aT+r+cUJ4SJZNy0wsdyn34G
X-Google-Smtp-Source: APXvYqw8IEat49Pb5Sn+qXCKC6h3lC4JhL++Tq9rUuIlUFFAUjuA/NO85Fr+VibimTjxT+emnIiDXQ==
X-Received: by 2002:a2e:90f:: with SMTP id 15mr4593290ljj.120.1581440520183;
 Tue, 11 Feb 2020 09:02:00 -0800 (PST)
Received: from localhost (public-gprs645374.centertel.pl. [5.184.64.63])
 by smtp.gmail.com with ESMTPSA id e20sm2491573ljl.59.2020.02.11.09.01.59
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 09:01:59 -0800 (PST)
To: apparmor@lists.ubuntu.com
References: <bf20d814-6389-94f9-cc46-af7266465ad8@posteo.de>
 <e6baaa57-5375-8bbb-7313-651f426a1f76@canonical.com>
 <6c567c8d-62a4-0855-0668-a40f1402b952@posteo.de>
From: Mikhail Morfikov <mmorfikov@gmail.com>
Autocrypt: addr=mmorfikov@gmail.com; keydata=
 mDMEXRaE+hYJKwYBBAHaRw8BAQdADVtvGNnC7y4y14i2IuxupgValXBb5YBbzeymUVfQEQu0
 L01pa2hhaWwgTW9yZmlrb3YgKE1vcmZpaykgPG1tb3JmaWtvdkBnbWFpbC5jb20+iJYEExYK
 AD4CGwMFCwkIBwMFFQoJCAsFFgIDAQACHgECF4AWIQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUC
 Xj79nwUJAwmsJQAKCRAy2ctjR5bMoSfMAP9ZBENeQz9MCxZwA11bL9b+ADaYruFlEWVKv9TE
 d+bHjAEApCH8boYJ5QZBD+HYwDCxxKYMiQ7yfhkn8sRWdIThYAq4OARdFoT6EgorBgEEAZdV
 AQUBAQdA1vPaWR/g6H2DzFqi6zjEBCqEv6bOg+N6lahCEuhLc24DAQgHiH4EGBYKACYCGwwW
 IQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUCXj7+CgUJAwmskAAKCRAy2ctjR5bMoZIbAQChdKEJ
 zIXMxUOPs3fMn+cth5CB6NCVXQSF+BPhzJuNuQEA5WTZzlkCfKjXjkcqDGnDd7OHc8Es0OR1
 srTstnmwUAI=
Message-ID: <b8ea9438-6a09-75ba-224a-c968fc490251@gmail.com>
Date: Tue, 11 Feb 2020 18:01:57 +0100
MIME-Version: 1.0
In-Reply-To: <6c567c8d-62a4-0855-0668-a40f1402b952@posteo.de>
Content-Language: en-US
Subject: Re: [apparmor] Accessing DMI data!?
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

T24gMTEvMDIvMjAyMCAxNjozNiwgbWFpbGluZ2xpc3RlbkBwb3N0ZW8uZGUgd3JvdGU6Cj4gV2hh
dCBJIHJlY2VudGx5IGRvIGlzIHRvIGNyZWF0ZSBhIGNvcHkgb2YgYSBwcm9ncmFtIGFuZCB0aGVu
IGhhdmUgMgo+IHByb2ZpbGVzLCBvbmUgdmVyeSB0aWdodCBhbmQgdGhlIG90aGVyIGEgYml0IG1v
cmUgZmxleGliZWwsIGUuZy4gSSBoYXZlCj4gL3Vzci9iaW4vdmxjIGFuZCAvdXNyL2Jpbi92bGMt
c2VjdXJlICBib3RoIGV4YWN0bHkgdGhlIHNhbWUsIGJ1dCB3aXRoCj4gZGlmZmVyZW50IG5hbWUg
dGhhdCBhbGxvd3MgdG8gaGF2ZSBkaWZmZXJlbnQgcHJvZmlsZXMuCj4gCgpIYXJkbGlua3MgYXJl
IGEgYmV0dGVyIGFsdGVybmF0aXZlIHRvIGNvcHlpbmcuIEluIGRlYmlhbiB5b3UgY2FuIGV2ZW4g
CmF1dG9tYXRlIHRoZSBwcm9jZXNzIG9mIGNyZWF0aW5nIHRoZSBsaW5rcyB3aXRoIGVhY2ggcGFj
a2FnZSB1cGRhdGUvaW5zdGFsbC4KCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JA
bGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBz
Oi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E6F36492F
	for <lists+apparmor@lfdr.de>; Mon, 19 Apr 2021 19:46:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lYXyf-0007Sa-Mf; Mon, 19 Apr 2021 17:46:29 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1lYXya-0007SO-9X
 for apparmor@lists.ubuntu.com; Mon, 19 Apr 2021 17:46:24 +0000
Received: by mail-lf1-f52.google.com with SMTP id g8so57336811lfv.12
 for <apparmor@lists.ubuntu.com>; Mon, 19 Apr 2021 10:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=o+8aV86+GkFNLwTNXa0OXhsiPtlGjyay4BtVNIYXsd4=;
 b=NsLQrw8FEQLtrznxMjva+gawkqZ75E9DOTwav2Us/PBbUEJKsLZxdC+l5TbM/2dHhR
 AuDKGBlxbS4K0NnTVK11DSA2X25dFOamLArsJaSkIywM2UiaegYBvSgjiaKtrdl/FfKz
 HdO69DlZPWXGANZIH4yGWA6DM/v6bScpI79VFZH/uTJHXKQhRwA0oKNktJNhIbJn3zGf
 lmaGfJsrW2d1GG+tQH0JnQFIbN0oHw92RovieHPQqkGKclIClvFyu+LYphaYd2yq9Oe0
 F7m4cgEp+O3iwt8j00rtN2TjKAfLnRakLHDRsNKftClMNbh2kEUvR1s27SQKNx6DpDBa
 vXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=o+8aV86+GkFNLwTNXa0OXhsiPtlGjyay4BtVNIYXsd4=;
 b=R8fydoP+Y9xI1ZTJeSXSZQMSQTLwtc4LTLeR3skzSYFDGgyEJWn/lik2WM2n8NVpkk
 t/rR8YCE1Ci1XSVa8HJVVZGt+RQ0IWwYHcF+YDVUya7CkwNhid6EfheNegj9jEWA9fz5
 iXLSWT+a5qj3ISBKjTjP3SV9RLloxafu7Zb1d5xqGEhUxA8/Nh8D84qvA8BR8az0XHgd
 O5Qxx6/pSvwMcvDNiuopKrJb/FVBEVc+jxoFGfcweHKJRGWYZZnOeytrmyoOY+JMK1DZ
 XL6F+MOFhFIt4sFLljDsYZG/mMNPQNq3jAiVhDJbFHXNL50rmsPozsRR/IemDIWgx0fX
 78QA==
X-Gm-Message-State: AOAM533v7ijDMNPIE6BaV23NJOCcXbxsu0z0s2Ht5ywVvtRkRnFlpB3E
 ZDgd+DM5k09etW/nhaCBn9FhHI5HEtGUL3AajNO/iI8IEfg=
X-Google-Smtp-Source: ABdhPJz6zsnbgXa9mxDk3qWsfXZavBh89molG59qPufDY6k5RRHeKzTj8IOeZEFWgGk15Pb7hJmbApZTp3YlHccWtHU=
X-Received: by 2002:ac2:52b7:: with SMTP id r23mr4193539lfm.451.1618854382851; 
 Mon, 19 Apr 2021 10:46:22 -0700 (PDT)
MIME-Version: 1.0
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Mon, 19 Apr 2021 23:16:11 +0530
Message-ID: <CAODFaZ4-QRvLugoUo55UJnPNqoaU8N+eVMqhfNYVboOM7s970w@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.167.52;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lf1-f52.google.com
Subject: [apparmor] Apparmor profile: custom header file query
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

SGkgQWxsLAoKQXMgcGVyIG91ciBkZXNpZ24gLCB3ZSBhcmUgYXBwbHlpbmcgY2VydGFpbiBjYXBh
YmlsaXRpZXMgdG8gYWxsIG15IHByb2ZpbGVzLgoKLT4gY3JlYXRlZCBjdXN0b20gaW5jbHVkZSBm
aWxlcyBhcyBmb2xsb3cgI2luY2x1ZGUgInJlbGF0aXZlX3BhdGgiCiAgIEB7ZGVmYXVsdF9jYXBz
fT1jaG93bixkYWNfb3ZlcnJpZGUsZGFjX3JlYWRfc2VhcmNoLGZvd25lcixmc2V0aWQsa2lsbCxp
cGNfbG9jayxzeXNfbmljZSxzZXRwY2FwLGlwY19vd25lcixzeXNfcHRyYWNlLHN5c19jaHJvb3QK
Ci0+IEFkZGluZyB0aGlzIGhlYWRlciBmaWxlIGluIHRoZSByZXF1aXJlZCBhcHBhcm1vciBwcm9m
aWxlcy4KICAgI2luY2x1ZGUgInJlbGF0aXZlX3BhdGgiCiAgIGNhcGFiaWx0eSBAe2RlZmF1bHRf
Y2Fwc30sCgotPiBXaGlsZSBwYXJzaW5nIHRoZSBhcHBhcm1vciBwcm9maWxlcyBpbnRvIEtlcm5l
bCwgb2JzZXJ2aW5nIGJlbG93IGVycm9ycy4KICAgc3ludGF4IGVycm9yLCB1bmV4cGVjdGVkIFRP
S19FUVVBTFMsIGV4cGVjdGluZyBUT0tfTU9ERQoKQ2FuIHNvbWVvbmUgaGVscCBtZSB0byBjbGFy
aWZ5IHRoZSBhYm92ZSBxdWVyaWVzLgoKVGhhbmtzCk11cmFsaS5TCgotLSAKQXBwQXJtb3IgbWFp
bGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVu
c3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9h
cHBhcm1vcgo=

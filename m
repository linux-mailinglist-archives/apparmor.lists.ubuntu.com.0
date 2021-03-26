Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4876C34A241
	for <lists+apparmor@lfdr.de>; Fri, 26 Mar 2021 07:58:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lPgQC-00088L-DA; Fri, 26 Mar 2021 06:58:16 +0000
Received: from mail-ej1-f48.google.com ([209.85.218.48])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <wampir990@gmail.com>) id 1lPgQA-00088E-Jm
 for apparmor@lists.ubuntu.com; Fri, 26 Mar 2021 06:58:14 +0000
Received: by mail-ej1-f48.google.com with SMTP id r12so6823020ejr.5
 for <apparmor@lists.ubuntu.com>; Thu, 25 Mar 2021 23:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:references:from:subject:message-id:date:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=yiunu5KJizdClFv9MsVVgWQ4TTedyMzb82Iu7cEI4Kk=;
 b=X3xfxV+TZ3/zsyCOC4OkLbfit33gI4dF7PrXna3mmkYtJ9sHNeFxOAsbwhenO0yVZr
 JWfYOwZBmJqeu9/bpGyHHFfBoVicQxucCxVHQSpblYuMxzLOA/qKXgxiCau6uXyPpECe
 W80C+5L5R/lNeCEqi9I2esvU8QQUQSo4zTzviJQ5asehoC9fTVsR7zdT0iO3V0lbNYeR
 NV42uFSkiGnKfUjDDXS2hgWcW86GF3Feq7Yw2R5wLAu4g5i/ru23y8da+8xr3+2MWfUl
 vB4FnKtZmYUG3P9awk8NXdaiuhv1iHLub9fnal6AgvQbJvXxdosw9EO4mgu+EIyGMoj0
 8Ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=yiunu5KJizdClFv9MsVVgWQ4TTedyMzb82Iu7cEI4Kk=;
 b=GCSNXdDtLeRzRumPh/XBu0o0jSA4D08e1pvC583vQQFgE8PbkSlihKp9HTjJf1nQE+
 eTJhZ112MwIzsIcl4oxnYtf9V/UDjX6Ak1PAD124uOecalpu0zraxgTIObv2+sLooatO
 bT/2bUi86VSxmcRNjKqD273MHvFHR+QchxNh2nJJyAg7kPvzYA0JPkPs6w9bMUp08G6o
 Ci/iyp4dKzD3iVsK538H2aZXq6WF2IGwAxin3iaonQRoUvDHk1bRZTgzWuSvpQPTiimo
 +gAJ/ZqEHswKj/P93jnSA4hliIQqgx5OgyudwxT3+vyi1T5otpKyOuCttT2xIgNBF174
 20JA==
X-Gm-Message-State: AOAM530+yrFE7yXy0z6J4vStdbbeZkTFCwLzlvGw1sMXphyNjraGFHuC
 ksgJ2kJrF3pjdeyHVrkDPLfkEJpORJ8=
X-Google-Smtp-Source: ABdhPJxhyn5wGVemJ7jrq/w+mUPXtcawaxOK8Yo3n9M7G+OtKQoGV08vlmowTVJskZG+QrTeHbCt7Q==
X-Received: by 2002:a17:906:7f12:: with SMTP id
 d18mr13241132ejr.368.1616741894006; 
 Thu, 25 Mar 2021 23:58:14 -0700 (PDT)
Received: from mail.wampir.eu ([2002:589c:6791:10:8516:e9e9:54cc:5409])
 by smtp.gmail.com with ESMTPSA id mc10sm3440928ejb.56.2021.03.25.23.58.13
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 23:58:13 -0700 (PDT)
Received: by mail.wampir.eu (Postfix, from userid 337)
 id ADB2753; Fri, 26 Mar 2021 06:58:12 +0000 (UTC)
Authentication-Results: mail.wampir.eu; dkim=none; dkim-atps=neutral
X-Spam-Checker-Version: SpamAssassin
X-Spam-Status: No
X-Spam-Score: 2.5  required: 5.0
To: apparmor@lists.ubuntu.com
References: <92d8bc5f-1fe0-cdfd-9ac6-d2d5301d6622@canonical.com>
From: Jacek <wampir990@gmail.com>
Message-ID: <7037587e-0ef0-870e-340b-a7400553fe32@gmail.com>
Date: Fri, 26 Mar 2021 07:58:10 +0100
MIME-Version: 1.0
In-Reply-To: <92d8bc5f-1fe0-cdfd-9ac6-d2d5301d6622@canonical.com>
Content-Language: pl-PL
Received-SPF: pass client-ip=209.85.218.48; envelope-from=wampir990@gmail.com;
 helo=mail-ej1-f48.google.com
Subject: [apparmor] Apparmor policy hide?
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

SGkKCldoZW5ldmVyIGEgcHJvZ3JhbSB0cmllcyB0byB0b3VjaCBhIGZvcmJpZGRlbiByZXNvdXJj
ZSwgdGhlIHN5c3RlbSAKKEFwcGFybW9yPykgcmVwbGllcyBBY2NlcyBEZW5pZWQuCgoKU29tZSBw
cm9ncmFtcyBtYXkgb3ZlcnJlYWN0IGluIHRoaXMgY2FzZS4KCk15IHN1Z2dlc3Rpb24gZm9yIGFw
cGFybW9yIGFjY2VzcyBwb2xpY3k6CmFkZCB0aGUgaGlkZSBvcHRpb24sIHdoaWNoIGNhdXNlcyB3
aGVuIHRoZSBhcHBsaWNhdGlvbiB0cmllcyB0byB0b3VjaCAKdGhlIGZvcmJpZGRlbiByZXNvdXJj
ZSwgaXQgaXMgYWxzbyBkZW5pZWQgYWNjZXNzLCBidXQgd2l0aCB0aGUgbWVzc2FnZSAKIk5vIHN1
Y2ggZmlsZSBvciBkaXJlY3RvcnkiLgoKVGhpcyB3aWxsIGhlbHAgYXZvaWQgZXJyb3JzIHdoZW4g
dGhlIHByb2dyYW0gdHJpZXMgdG8gY2hlY2ssIGZvciBleGFtcGxlIAovIHN5cyAvIG1vZHVsZSAv
IGFwcGFybW9yLCAvIHN5cyAvIGtlcm5lbCAvIHNlY3VyaXR5LCBvciB+Ly5zc2gvLAphbmQgd2ls
bCBleGl0IHdpdGggYSBmYXRhbCBlcnJvciBpZiBhY2Nlc3MgaXMgZGVuaWVkLgoKT3JpZ2luYWxs
eSBzdWNoIGEgc29sdXRpb24gaXMgaW4gR3JzZWN1cml0eSBBQ0w6CgoKT2JqZWN0IG1vZGVzOiAu
Li4KCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaMKg
wqDCoMKgIC0gVGhpcyBvYmplY3QgaXMgaGlkZGVuLgoKCmh0dHBzOi8vZ3JzZWN1cml0eS5uZXQv
Z3JhY2xkb2MuaHRtCgoKUmVnYXJkcwoKSmFjZWsKCgoKCgotLSAKQXBwQXJtb3IgbWFpbGluZyBs
aXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2Ny
aWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1v
cgo=

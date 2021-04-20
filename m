Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A25C365E11
	for <lists+apparmor@lfdr.de>; Tue, 20 Apr 2021 19:01:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lYtko-00045V-6Y; Tue, 20 Apr 2021 17:01:38 +0000
Received: from mail-lj1-f181.google.com ([209.85.208.181])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1lYtki-00045N-V2
 for apparmor@lists.ubuntu.com; Tue, 20 Apr 2021 17:01:33 +0000
Received: by mail-lj1-f181.google.com with SMTP id a36so33535148ljq.8
 for <apparmor@lists.ubuntu.com>; Tue, 20 Apr 2021 10:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=eLaBOR+gLBlDWeeJI1KzrnqI8+ZixrSjnc+K5UYt/dE=;
 b=BhuRnWyUPM7fnv7SjOyUsb7eM8MrIUmV6HniafSiGX1YGgU+6W51ek77wy2btEjzIL
 cG3C94Lc+oWs7FsimKXhYMCFAqZGQMzUmjx9drHMepe7gMeOoAi+AZZwhxhc0o3U6gB0
 aq9BsNW3nm6yyhZ9K6qBRVv1p1C/KKQ1GgLW7Va/zuJigkDCuUmmwrTJaAmSKBiKr63X
 he54kB0H5B9YOg+83m90IgyIp//zfV5rKTYWxJuOH5OiZEtbhSEmmDr6tkZFFgvfbbND
 fizxhBri+nTJAGDZGjKURK0ccBg+JNiXfei5FxVVwHhxs05GF2qmm8wGH1xCYGVe/cLG
 ppqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eLaBOR+gLBlDWeeJI1KzrnqI8+ZixrSjnc+K5UYt/dE=;
 b=ip0hPjBvQyGCafQzEixN/EbzYV7g2Ujfb/9EBtiNMNVSCWhRKM2nnNuP5ugqTosWFE
 51kRmhNZuQLylr2E7keaqCoLjf5c/WPr3lvjCZLWUM0Q9xmVIlrOpJk+ED96XLIT0OQp
 GHh/lNBKocqH36l7ESN4NswrbP8oKxjQfBdWcV+kDHGA5L5RpA3AvJ/XE0oaKKXspKSc
 on8sMTt0GcwpVHGqjcdhFcLcDcc1fq9T4sQZ3sZ4M8k9NwwiT6w/GPAZVciBJf334ogg
 1cdwgBXCVAX4ND9W1Wl0FkgOPEWmvDlcvHCGjQJgDvNgVc2xd7iXZVzG+cj9x1YbiTXt
 7I4g==
X-Gm-Message-State: AOAM533cD/Er7cne5/dFVq8YY3trFEaZo/0GXqmLl8CHNW1bHxHsKtlM
 iGg67skRynjRwL7BRTkoYt+/bmp6VUc8y3f1tKTzxRRsxhM=
X-Google-Smtp-Source: ABdhPJwPP91wNu67GuJjtXg3vyHtF0fFDo1amFGZidGMlATMu7d8Y4/k/OMYrZMjD/FBQH4i7lmmTbnkrlMemAo3CMw=
X-Received: by 2002:a05:651c:212a:: with SMTP id
 a42mr15231837ljq.505.1618938091125; 
 Tue, 20 Apr 2021 10:01:31 -0700 (PDT)
MIME-Version: 1.0
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Tue, 20 Apr 2021 22:31:19 +0530
Message-ID: <CAODFaZ5-vQeqWtgWmwO=Qp21=JjeC5zJCzZ-zkpQT2hQNONqcQ@mail.gmail.com>
To: apparmor@lists.ubuntu.com, John Johansen <john.johansen@canonical.com>, 
 Seth Arnold <seth.arnold@canonical.com>
Received-SPF: pass client-ip=209.85.208.181;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lj1-f181.google.com
Subject: [apparmor] Apparmor: Query on adding many capabilities in the
	custom header file
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
aWxlcyBhcyBmb2xsb3cgaW4gI2luY2x1ZGUgInJlbGF0aXZlX3BhdGgiCiAgIEB7ZGVmYXVsdF9j
YXBzfT1jaG93bixkYWNfb3ZlcnJpZGUsZGFjX3JlYWRfc2VhcmNoLGZvd25lcixmc2V0aWQsa2ls
bCxpcGNfbG9jayxzeXNfbmljZSxzZXRwY2FwLGlwY19vd25lcixzeXNfcHRyYWNlLHN5c19jaHJv
b3QKCi0+IEFkZGluZyB0aGlzIGhlYWRlciBmaWxlIGluIHRoZSByZXF1aXJlZCBhcHBhcm1vciBw
cm9maWxlcy4KICAgI2luY2x1ZGUgInJlbGF0aXZlX3BhdGgiCiAgIGNhcGFiaWxpdHkgQHtkZWZh
dWx0X2NhcHN9LAoKLT4gV2hpbGUgcGFyc2luZyB0aGUgYXBwYXJtb3IgcHJvZmlsZXMgaW50byBL
ZXJuZWwsIG9ic2VydmluZyBiZWxvdyBlcnJvcnMuCiAgIHN5bnRheCBlcnJvciwgdW5leHBlY3Rl
ZCBUT0tfRVFVQUxTLCBleHBlY3RpbmcgVE9LX01PREUKCkNhbiBzb21lb25lIGhlbHAgbWUgdG8g
Y2xhcmlmeSB0aGUgYWJvdmUgcXVlcmllcy4KClRoYW5rcwpNdXJhbGkuUwoKLS0gCkFwcEFybW9y
IG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBv
ciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGlu
Zm8vYXBwYXJtb3IK

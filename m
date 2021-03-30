Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D7C34F097
	for <lists+apparmor@lfdr.de>; Tue, 30 Mar 2021 20:11:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lRIq3-0004U1-9Q; Tue, 30 Mar 2021 18:11:39 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1lRIq2-0004Tu-N3
 for apparmor@lists.ubuntu.com; Tue, 30 Mar 2021 18:11:38 +0000
Received: by mail-lf1-f54.google.com with SMTP id o10so25121152lfb.9
 for <apparmor@lists.ubuntu.com>; Tue, 30 Mar 2021 11:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=b2BT5qq+LdLBn73jOB82vv4DTg9mVL14dHVBXDXeTrk=;
 b=AzzJa8KvyLjHbGXWMnSshiw+tO3BoJv3CMWmCO4l3OLQGntecITShinnhyJUSITAZT
 2mL2isw0GB8zvccCmN8ESLoe3v8EFjlJKF837dSWDIw2ApK5OwaXBuXrBt0purFGBMaI
 f9vUtjk6OPbxJ04OrKKyxH+X6Z0tq42SiqQ15PwR3mbAX/nFVkuUk12mDdVPM8lF+Dm7
 /dMW7nDRyQEt/hTYLku1XK+G6DE72dj4SUYVCVBOqc2Lyug3EyPvWfdND/D6tpSKh34D
 PrnViWWUqxt61WJ7Pu8vCT4I8sMnrOeWBXDtnpqui+21Yr07zd7DJoqZLal/Fc14Qnm8
 ZLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=b2BT5qq+LdLBn73jOB82vv4DTg9mVL14dHVBXDXeTrk=;
 b=tkVaD0OT4PqLWmeIC6MwgxQe4p5VMsbjutr2V6J0vdyA0PnwulZHxTwbHioaM0uh5l
 7XmB7c03LyB4Le/KvmX5emagiDZMsP4JwJk+i3y9X+xJaq64jwo1OzM5pU05Uq4QJWU0
 +HXf5AzD2mXvy9HfvoGkh0NY95kew7qhDBE8SKXa1YOvD82bmdVUhSGbTjnIW3/FOcVM
 8NgX+wqPSQrWoyFX0aZVDxF5HHP/Q0YmxEyXwy7cx5iycDdXJXeNy3CPE1Hj74cxKNB4
 dSZ3VCOAgW35LlT7jSV2Bz7v5kOe+MBY18Kq5Yd+iLuPRU8iywGK5AJLcm5z7Bqjzmm9
 YQsg==
X-Gm-Message-State: AOAM532efIw5Z15Vyv7gac5F9cKT+3Rcng0JDBdSyYGCh95NE9f8RKXo
 l0WpYuc2WxbqCbzHjzELxA8iI5IAqBjRI+iCrjHiX/+2/Po=
X-Google-Smtp-Source: ABdhPJzCRp2Fo7R+jZl9gam5snO0HV1WjwuWD8FL1KJMc4JHi3kt4hiXhNAlerU/2/3xZP8nvMxuB+zehVjsOAMJ0TE=
X-Received: by 2002:ac2:551b:: with SMTP id j27mr19908178lfk.249.1617127897445; 
 Tue, 30 Mar 2021 11:11:37 -0700 (PDT)
MIME-Version: 1.0
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Tue, 30 Mar 2021 23:41:25 +0530
Message-ID: <CAODFaZ5YCf+T1TweGWeR+bpkZ9wxHV2K5Mm--9tMUo6LZZYhwg@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.167.54;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lf1-f54.google.com
Subject: [apparmor] Apparmor on Embedded devies.
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

SGkgQWxsLAoKV2UgYXJlIHBsYW5uaW5nIHRvIHVzZSAiQXBwYXJtb3IgcHJvZmlsZXMiIGFzIHBh
cnQgb2YgU2VjdXJpdHkgcmVhc29ucy4KLT4gQXNzdW1lLCB3ZSBoYXZlIGZpbmFsaXplZCBhIHBy
b2ZpbGUgZm9yIGEgY2VydGFpbiBwcm9jZXNzIGFmdGVyCmV4cGVyaW1lbnQgaW4gb3VyIHNldHVw
L1FBIHZhbGlkYXRpb24uCi0+IE5leHQgZGF5LCB0aGVyZSBpcyBhIHBvc3NpYmlsaXR5IG9mIGFu
eSBjb2RlIG1lcmdpbmcgd2hlcmUgdGhpcwplbnRyeSB3b24ndCBiZSBhdmFpbGFibGUgaW4gdGhl
IGV4aXN0aW5nICgyKSBwcm9maWxlIGFzIHdlIGZyZWV6ZSB0aGUKcHJvZmlsZS4KLT4gQXMgd2Ug
a25vdyB0aGF0IGNvZGUgaGFzIGJlZW4gbWVyZ2VkL3VwZGF0ZWQgY29udGludW91c2x5IChkYXkg
dG8KZGF5KSBvbiB0aGUgcGFydGljdWxhciBwcm9jZXNzLCBEbyB3ZSBoYXZlIGFueSBtZWNoYW5p
c20gdG8gZW5zdXJlIGhvdwp0aGUgQXBwYXJtb3IgcHJvZmlsZSAgYWxpZ25zIHdpdGggdGhlIGxh
dGVzdCBwcm9jZXNzL2ltYWdlPwotPiBXaGF0IGlzIHlvdXIgdGhvdWdodCBvbiB1c2luZyBlbWJl
ZGRlZCBkZXZpY2UgaGVhZC1zZXQ/Ci0+IFBsZWFzZSBzaGFyZSB0aGUgZGV0YWlsZWQgaW5wdXRz
LgoKVGhhbmtzCk11cmFsaS5TCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxp
c3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczov
L2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

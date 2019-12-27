Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C5912C215
	for <lists+apparmor@lfdr.de>; Sun, 29 Dec 2019 10:19:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ilUiw-0002nw-E0; Sun, 29 Dec 2019 09:18:58 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hooanon05g@gmail.com>) id 1ikoWy-00062M-3B
 for apparmor@lists.ubuntu.com; Fri, 27 Dec 2019 12:15:48 +0000
Received: by mail-pl1-f177.google.com with SMTP id f20so11672423plj.5
 for <apparmor@lists.ubuntu.com>; Fri, 27 Dec 2019 04:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:mime-version:content-id:date:message-id;
 bh=kyVwMJwxkW9O+eOvVZdmrDhoIQ47EkX5awzZmjTRsQA=;
 b=l9R/uTaDFFatNxEiVOx8ago42vacxK9dfTdLDmKKvxWlZoJmnUbEYe9uAjnBa2TbcR
 dYyj+MQIGe1ltiIjSeQ60Q4TVN3UVeRsglWjFQieq9mBa6w4olx8bM6t0p15vFzxCa4f
 9O02iaFlnOp3VZk39xUT1TjI8mtnXcM2w1UfRbd7aZUsqpDzR3rSI9p5f6guXR5T+yMc
 gOUpx4gljHyDHJrW7GH2OfZuAKKhjkzKD2fY0PBRpXWjMHW9tnP2XYGxRJ4cBZhYuVxV
 os3ETgaAwy9kwqa91JNHf3go00Y5MIR4ZVVFpusCFHNbiCXk9DWIXy+suJtbRprVLzeI
 mcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:mime-version:content-id:date
 :message-id;
 bh=kyVwMJwxkW9O+eOvVZdmrDhoIQ47EkX5awzZmjTRsQA=;
 b=gf/bX6WXR/4PXrSvJLQOPD68Qa6J2p199JDIgzUrPWoPTRlQU8TOA5WkwMokqZ/6Lz
 jAg2SY02L2zXzY/XwqqfG5UmNetwY/HTBCJrfE2k/Ko2+O/XwJtDKPp5BE39FJCZUTcQ
 Z0DL5p8a085nfCuzW8iK8TP1uxETAsDNQ89PtzM7PFOFc53xwPFqaEr4MA0UUXUsQWeo
 JFctfYxsUnIqc2rTfn0Zgba+GnS6EpwsDo2TyPVG/7udtcts5S46yEcigJdKIXBp+rnP
 IPv5rop+9f0vOgot9UwbVA6QWPSGeNqBxc2JNpHIOhrD5wGXsz9uZxhMA5pbGdNUgcta
 cPUg==
X-Gm-Message-State: APjAAAW03+esi5OmENjWIGGqsWDR2E0RSukyLWZO1pr7mMdzjCzcJOiH
 b6LhULmxz8Qb532p8HxkpwekJ69g
X-Google-Smtp-Source: APXvYqycQUcpn/t7BN1axQ0MyC3WhFkg+XGqgte9z4AZBTszyPqKPn3Mh6AG/b2G/3kp1A0ftp6BSw==
X-Received: by 2002:a17:90a:17c5:: with SMTP id
 q63mr25023266pja.138.1577448946219; 
 Fri, 27 Dec 2019 04:15:46 -0800 (PST)
Received: from jromail.nowhere (h219-110-248-048.catv02.itscom.jp.
 [219.110.248.48])
 by smtp.gmail.com with ESMTPSA id q21sm39649719pff.105.2019.12.27.04.15.45
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 27 Dec 2019 04:15:45 -0800 (PST)
Received: from localhost ([127.0.0.1] helo=jrobl) by jrobl id 1ikoWu-0006Ix-8v
 for <apparmor@lists.ubuntu.com>; Fri, 27 Dec 2019 21:15:44 +0900
From: "J. R. Okajima" <hooanon05g@gmail.com>
To: apparmor@lists.ubuntu.com
MIME-Version: 1.0
Content-ID: <24237.1577448944.1@jrobl>
Date: Fri, 27 Dec 2019 21:15:44 +0900
Message-ID: <24238.1577448944@jrobl>
X-Mailman-Approved-At: Sun, 29 Dec 2019 09:18:57 +0000
Subject: [apparmor] How does ALIAS work?
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

SGVsbG8sCgpXb3VsZCB5b3Uga2luZGx5IGhvdyB0byB1c2UgQUxJQVMgUlVMRT8KCkhlcmUgaXMg
YSBzaGVsbCBzY3JpcHQgSSBhbSB0ZXN0aW5nLgotIHByZXBhcmUgIi90bXAvZmlsZSIKLSBnZW5l
cmF0ZSBhbmQgZW5hYmxlIGEgcHJvZmlsZSBmb3IgY2F0KDEpLCB3aGljaCBhbGxvd3Mgb3Blbmlu
ZwogICIvZmlsZSIuCi0gZXhwZWN0aW5nIGEgZmFpbHVyZSwgcnVuICJjYXQgL3RtcC9maWxlIgot
IGFkZCBhbiBhbGlhcyBydWxlICJhbGlhcyAvIC0+IC90bXAvLCIKLSBleHBlY3RpbmcgYSBzdWNj
ZXNzLCBydW4gImNhdCAvdG1wL2ZpbGUiIGFnYWluLCBidXQgaXQgZmFpbHMuCgpFbnZpcm9ubWVu
dAokIHVuYW1lIC1hCkxpbnV4IGpyb3RrbSA0LjE5LjAtNi1hbWQ2NCAjMSBTTVAgRGViaWFuIDQu
MTkuNjctMitkZWIxMHUyICgyMDE5LTExLTExKSB4ODZfNjQgR05VL0xpbnV4CgppaSAgYXBwYXJt
b3IgICAgICAgICAgICAgICAgICAgICAgMi4xMy4yLTEwCmlpICBhcHBhcm1vci11dGlscyAgICAg
ICAgICAgICAgICAyLjEzLjItMTAKaWkgIGxpYmFwcGFybW9yMTphbWQ2NCAgICAgICAgICAgIDIu
MTMuMi0xMAppaSAgcHl0aG9uMy1hcHBhcm1vciAgICAgICAgICAgICAgMi4xMy4yLTEwCmlpICBw
eXRob24zLWxpYmFwcGFybW9yICAgICAgICAgICAyLjEzLjItMTAKCldoYXQgaXMgd3Jvbmcgd2l0
aCBteSBzY3JpcHQ/CgpKLiBSLiBPa2FqaW1hCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiMhL2Jpbi9zaAoKdG1wPS90bXAvJCQKc2V0IC1ldQoKY21kPSQocmVhZGxp
bmsgLWYgL2Jpbi9jYXQpCmNtZHByb2Y9JHRtcC5BQS8kKGVjaG8gJGNtZCB8IGN1dCAtYzItIHwg
dHIgLyAuKQphbGlhc3Byb2Y9JHRtcC5BQS90dW5hYmxlcy9hbGlhcwp0ZXN0ZmlsZT0vdG1wL2Zp
bGUKZWNobyB0ZXN0ID4gJHRlc3RmaWxlCgpybSAtZnIgJHRtcC5BQQpta2RpciAkdG1wLkFBCmxu
ZGlyIC1zaWxlbnQgL2V0Yy9hcHBhcm1vci5kICR0bXAuQUEKY3AgLXAgJGFsaWFzcHJvZiAkYWxp
YXNwcm9mLnRtcAptdiAkYWxpYXNwcm9mLnRtcCAkYWxpYXNwcm9mCgp7CgllY2hvICcjaW5jbHVk
ZSA8dHVuYWJsZXMvZ2xvYmFsPicKCWVjaG8gJGNtZCAneycKCWVjaG8gJGNtZCBtciwKCXsKCQls
ZGQgJGNtZCB8CgkJZmdyZXAgLXYgbGludXgtdmRzbwoJCWVjaG8gL2V0Yy9sZC5zby5jYWNoZQoJ
CSNlY2hvICR0ZXN0ZmlsZQoJCWVjaG8gLyQoYmFzZW5hbWUgJHRlc3RmaWxlKQoJfSB8CgljdXQg
LWYyIC1kJz4nIHwKCWN1dCAtZjEgLWQnKCcgfAoJeGFyZ3MgLXIgLW4xIHJlYWRsaW5rIC1mIHwK
CXNlZCAtZSAncy8kLyBtciwvJwoJZWNobyAnfScKfSB8CnRlZSAkY21kcHJvZiAjPiAvZGV2L251
bGwKCmRvX3Rlc3QoKQp7CgllY2hvIFwjICIkQCIKCXNldCArZQoJc2V0IC14CglzdHJhY2UgLWUg
dHJhY2U9b3BlbixvcGVuYXQgJGNtZCAkdGVzdGZpbGUKCXNldCAreAoJc2V0IC1lCgl0cnVlCn0K
CmRvX3Rlc3QgInNob3VsZCBzdWNjZWVkIgoKc3VkbyBhYS1zdGF0dXMgPiAkdG1wLnN0YXR1cwpz
dWRvIGFhLWVuZm9yY2UgJGNtZCAtZCAkdG1wLkFBCnN1ZG8gYWEtc3RhdHVzIHwKZGlmZiAtcXUg
JHRtcC5zdGF0dXMgLSAmJiBmYWxzZQoKZG9fdGVzdCAic2hvdWxkIGZhaWwiCgplY2hvIGFsaWFz
IC8gJy0+JyAkKGRpcm5hbWUgJHRlc3RmaWxlKS8sIHwKdGVlIC1hICRhbGlhc3Byb2YKc3VkbyBh
YS1kaXNhYmxlICRjbWQgLWQgJHRtcC5BQQpzdWRvIGFwcGFybW9yX3BhcnNlciAtLXJlbG9hZCAk
dG1wLkFBCnN1ZG8gYWEtc3RhdHVzIHwKZGlmZiAtcXUgJHRtcC5zdGF0dXMgLSAmJiBmYWxzZQoK
ZG9fdGVzdCAiQUxJQVMgc2hvdWxkIG1ha2UgaXQgd29yayIKCiMgUmVzdG9yYXRpb24Kc3VkbyBh
YS1kaXNhYmxlICRjbWQgLWQgJHRtcC5BQQpzdWRvIC9ldGMvaW5pdC5kL2FwcGFybW9yIHJlc3Rh
cnQKc3VkbyBhYS1zdGF0dXMgfApkaWZmIC1xdSAkdG1wLnN0YXR1cyAtCgpybSAtZnIgJHRtcCAk
dG1wLioKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNv
bQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

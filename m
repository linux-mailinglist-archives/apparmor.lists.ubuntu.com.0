Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id EF65919C4E4
	for <lists+apparmor@lfdr.de>; Thu,  2 Apr 2020 16:53:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1jK1Dk-0007aw-6f; Thu, 02 Apr 2020 14:53:28 +0000
Received: from mail-lj1-f173.google.com ([209.85.208.173])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mardy.tardi@gmail.com>) id 1jK1Di-0007ap-SX
 for apparmor@lists.ubuntu.com; Thu, 02 Apr 2020 14:53:26 +0000
Received: by mail-lj1-f173.google.com with SMTP id n17so3529006lji.8
 for <apparmor@lists.ubuntu.com>; Thu, 02 Apr 2020 07:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Z6CAkjhzCUzp/V0ai3KevTvAMEa3OCq7DM1UuMLMnU=;
 b=HFqAr2QlUV+VAv8IgArViEu5IgAsc0Bt52kgLKwuGHi+YoK67jkj/Emg/NszbgjY4J
 u/ZhUs3Plgz8SnXMrfF66dib05pVdp+Qq+EQ+jkvpTYv/C2V9T7/JAwRI1ie6NZy4pWI
 z6z8s4q/pLeNZSLr6hK323jdL7ympsirJsNLroqyUfs0PmjICVFP6zRyNmlJpIXpX9e+
 BafwvnRS9dlzlojrwZ7xHxikfHmRHXV/Xe4Tb966uO/H1xuOlCYA96MyXcJLvEoNQqLb
 8skT9kNzg21Bm1GTXMRHubXKZOnslGft5Hcuy304L/Iix9YELx33T6fUA8eCg2WFVyHo
 0gAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:openpgp
 :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7Z6CAkjhzCUzp/V0ai3KevTvAMEa3OCq7DM1UuMLMnU=;
 b=oaE76HbLeH4LBCP604wkrwL7NAGmu8YYulRF1efgcBtLrG3R/R3Cc364yWTT9JVjnC
 VKL4SuJkbAqLTYJHEgISCxWOU7MEpc6NPqMqr3sWwbM8OjmPdz4iQuxZiSgDcIlLCavi
 JqejDyN9AM1/Z3+6vdo/VKP9UIXmEwqK5o0hgaqQ3vUzOVe7G4ORBti/TuMUJEN0GZmv
 mQEDniL/RJS5CzFWNqpWe+4G5LoztpQUFW09a/iPyLUt4eWmhVUa9mKGiHOTfJNR+gwC
 yD/K2qKGila173Wg4FhwMgwSLTMdYgvhc75qGHBWjaoHrwVhjmyhsUn26p3k5g70UFpw
 E8qw==
X-Gm-Message-State: AGi0PuZ1OdHrdA3LYPjYBn1Etznqgq+4iLizIBe3oTqj6gfl8NU21+AH
 GfTfUI4KIDvp31IfyRJu8PvRuZzB
X-Google-Smtp-Source: APiQypJqJB8a7n5wopdr0CrzdwdZlMWfOU/L4B0YwRTvMEo47gFOa1RPiXkaw1y5i4Rerbqg+C2agA==
X-Received: by 2002:a2e:81cc:: with SMTP id s12mr2261713ljg.90.1585839205842; 
 Thu, 02 Apr 2020 07:53:25 -0700 (PDT)
Received: from [192.168.1.104] ([176.59.14.0])
 by smtp.gmail.com with ESMTPSA id q1sm3984311lfc.92.2020.04.02.07.53.24
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Apr 2020 07:53:25 -0700 (PDT)
To: apparmor@lists.ubuntu.com
References: <33f7799a-9184-990b-01d7-d27d61d918f7@users.sourceforge.net>
 <87369m2e3l.fsf@manticora>
From: Alberto Mardegan <mardy@users.sourceforge.net>
Openpgp: preference=signencrypt
Autocrypt: addr=mardy@users.sourceforge.net; prefer-encrypt=mutual; keydata=
 mQGiBE478zgRBADyEruechMymSxrlOO76Bc3ceI+XV6DHwVux7fRet4C0bQ+4gGhlAtMHc+x
 IJg8m0vhlcTnmIAdnp9QmD2zbq4sFEiD3/4EcfXZUMBb5Gd+coTXCuzjkgEnmVzt8KfgOA+T
 2FcuBmQK57ybxOBqFCSF61wZll1T7oSK342GzaPF6wCggWfF5pPCBJNWX9mOaLN7FrGfY/cE
 AIv1F3TwUbvNVmtDk2FwkzVD3hZZ7cXjrVZ8TZHMEnizpT8kcsok3iYbWtSRBAjSO4Q274Ft
 NQpgKi1cNKEn2g7JdIJ82ATAfxRlZjG6lsiMTA20s0VBspRXJVGE81VaMgyhVs27OW9hLySF
 rQzkhMavnLHfTTNIbfPWLeVeh4jlBADSCWuSCj7tJRaJqQl7OhmDw++ZHnSo5D3uM/xCk7nq
 v1962DFcIzkAcNeso1Z3xMrmfXEo7ynpr4OyELExJJ1zc8MJPlt8LTVPvibo7+aAetwzlcwe
 vx+eNbl9fFkEMHk5okhP9zZx4pGsuL8xdWD7Hwm3zyVLj/kWjxmjKJvxRLQuQWxiZXJ0byBN
 YXJkZWdhbiA8bWFyZHlAdXNlcnMuc291cmNlZm9yZ2UubmV0PohiBBMRAgAiBQJQql2rAhsD
 BgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBUtB6Axd4IUqa1AJ0RGsV+tSB73ImXeYu5
 5KSYdenCGgCcD/++b+c3LR5/17jxRCpLxlG/2rC5Ag0ETjvzkRAIANIiiT1uKgNBy06NsIgh
 xOSzTG0VlWYwHwoVw7UOUMNd/wblkx5p4sSH4mt7kuOX++9bKTADivc3SwGxm7HVjqJF4MQo
 el1cwWQmO5xSiUtRgLmy/bPvu1AeY93jO7voqocGGDVQUnjCAUUEdo3C8BgA6IMZQgyUyVSJ
 3737OHnwW5yDQujuphchZ0SshunxpYLW163+gOQi1SInOmU7v67Cfz2WxNHBCz9f5Y7zWE6Q
 EWUR9TwLEhakUZb3rcSjc2XebvpUbf8zlb14ln0jDU8sfC2GOvKLsSr+JzGqRlS6qiLj3tFy
 +cwGYgPBSh++z/tW7WyICa43+BWvNtWLVbMAAwUH/2L37HDglWHJmnUedSwy5bOuERyK//oA
 nXK+vtctoD3KN1kIoue8nzDpXLCO9QrWujkcFNDKudSmgW5MmEjJzWeCPW3O7gP0bNwi3fZV
 C3SAcvbhes29JwB2GTDHZmfNJOx6KRYmJB5Hl49zez20XixT6ANdqTbXkT62sVegrmLt7gle
 pdxR/PkrS6Y+nfCF+YR6FPS/XLq2/AzCDi/43F9+u8dj+XcnMsfx8ox3Y6jx3563Y2OdUddM
 w7TQ6InMX/mPfPo5vbYdTeSgc2A3ZGKnirTRGG0HCH5wXr6wVXMYEU1QqZLGQTQm1OhM6Hh+
 6tNWRsuGHCnYKUNdtgWVcQeISQQYEQIACQUCTjvzkQIbDAAKCRBUtB6Axd4IUgbdAJ9yx5Sb
 PmRkVWELefEJRWL5lFaBdACdFkyao354xPAVvBheCgffPwcKVWA=
Message-ID: <5b6ba4a3-452e-bcd4-0dbb-f1a6c8b468a0@users.sourceforge.net>
Date: Thu, 2 Apr 2020 17:53:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <87369m2e3l.fsf@manticora>
Content-Language: en-GB
Subject: Re: [apparmor] Generating the profile cache on a different machine
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

SGksCgpPbiAwMi8wNC8yMCAxNjo0OCwgaW50cmlnZXJpIHdyb3RlOgo+IEF0IFRhaWxzIHdlIGRv
IHNoaXAgYSBiaW5hcnksIGNvbXBpbGVkIHBvbGljeSBpbiBvdXIgbGl2ZSBzeXN0ZW06Cj4gCj4g
ICBodHRwczovL3NhbHNhLmRlYmlhbi5vcmcvdGFpbHMtdGVhbS90YWlscy8tL2Jsb2IvbWFzdGVy
L2NvbmZpZy9jaHJvb3RfbG9jYWwtaG9va3MvOTktY2FjaGUtQXBwQXJtb3ItcG9saWN5Cj4gICBo
dHRwczovL3NhbHNhLmRlYmlhbi5vcmcvdGFpbHMtdGVhbS90YWlscy8tL2Jsb2IvbWFzdGVyL2Nv
bmZpZy9jaHJvb3RfbG9jYWwtaG9va3MvMDEtY2hlY2stZm9yLW91dGRhdGVkLUFwcEFybW9yLWZl
YXR1cmUtc2V0CgpBIGNvdXBsZSBvZiBxdWVzdGlvbnM6CgoxKSB3aGVyZSBpcyBhcHBhcm1vcl9w
YXJzZXIgYmVpbmcgcnVuPyBJcyBpdCBhIGNocm9vdD8KCjIpIHlvdXIgc2NyaXB0cyBhcmUgY2hl
Y2tpbmcgdGhlIGZlYXR1cmVzIGluCi91c3Ivc2hhcmUvYXBwYXJtb3ItZmVhdHVyZXM7IEkgZG9u
J3QgaGF2ZSB0aGlzIGRpcmVjdG9yeSBpbiB0aGlzCm1hY2hpbmU7IHdoYXQgaXMgaXQ/CgoKQ2lh
bywKICBBbGJlcnRvCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVi
dW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3Rz
LnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

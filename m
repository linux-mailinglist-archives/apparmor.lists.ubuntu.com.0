Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E833D399A
	for <lists+apparmor@lfdr.de>; Fri, 23 Jul 2021 13:37:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1m6tUo-00089H-PS; Fri, 23 Jul 2021 11:37:38 +0000
Received: from mail-lj1-f181.google.com ([209.85.208.181])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1m6tUm-000899-9B
 for apparmor@lists.ubuntu.com; Fri, 23 Jul 2021 11:37:36 +0000
Received: by mail-lj1-f181.google.com with SMTP id l4so1326429ljq.4
 for <apparmor@lists.ubuntu.com>; Fri, 23 Jul 2021 04:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=DFmA45NB4Vo46drjVovLSCES63tUbbjsaSMQgf5EUCo=;
 b=N3kTR6aRbhxx0mSNuO5mEJlf65ymUFfG5TomHVl40pEzHBketYRdZLv/kY0fJcsRR6
 0T3v2MFRdCuHkLZUT9oRDZBIoFtAtJaT+amJlZwqzwOHiAQJZNZfmvBORCDbCfr797kC
 9V1OCcYA06Yq7C20+QPw9cQyVkQwVU+gXXnqSmJyPRIOJNeYvGgJ92I5Httj+rbccJcH
 F8eLoFMFsUj742NuoAxUGYZP5YNULwdF5rkswbFSFKM8rmSluLTqDM/Udze96xkY1sOC
 uIAG7bIp/hPNBW10jBrrohXzUrj9HRA418JRHHhlA7Slxq7Q89SSBhkNOjL1E2pAT+nR
 +o3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DFmA45NB4Vo46drjVovLSCES63tUbbjsaSMQgf5EUCo=;
 b=aAqWI6xyUB+TLXv3PCLDh4Dt266Y6g2SF/O4dSmUziP78N9a4va0BxTWAJxsC8cyOD
 ro6l4UDHFeatQ00REr6LLy4rxneSREs/o5cn5wkcYqVt2NiO7UCoj5pfXO9451Ho9MJS
 Yta7EqQ8jAFBAjiniqu3/6Id714iMRyBiu0zr8V+FNqip1mq8UV6Lsmi3IqWMz3Y0dHU
 f06OnsSTZoUM+4mICUBOblvjdJ9GVD1L8YZRE/CjNuRRBvE7CcwqIxKbMI71j8uhtO7F
 ms9BPO/yDAueRtSqdvTl7XJwsJM8dMogYgKsig7MFXA6p1WCW5lw37L+OB+F+A+rd1bc
 PTvw==
X-Gm-Message-State: AOAM532k74pV370QEzfNJYjekKOYfp4xzj4rcMikqvqiSd7A0pgAZ7ST
 YYXSesjhV5CJ4jtXgkYY99/uBe2aLwitSsj6CrchYX4TW/6idA==
X-Google-Smtp-Source: ABdhPJw4ZZbYcnJp0MA1fq287LwOb0cWilSBdvR6CcpKTHE7nRT2Fkm6wBkQsCJMwH+Bfh+P4+lcse48gAImwYbVMf8=
X-Received: by 2002:a05:651c:88d:: with SMTP id
 d13mr2936207ljq.505.1627040255096; 
 Fri, 23 Jul 2021 04:37:35 -0700 (PDT)
MIME-Version: 1.0
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Fri, 23 Jul 2021 17:07:23 +0530
Message-ID: <CAODFaZ79FJ2tQBtw_aOuQE5iLQfdqAzCSP7bETeJ8FB9Lq4fuw@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.208.181;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lj1-f181.google.com
Subject: [apparmor] Apparmor profile: mount/umount issue [ non-root
	application ]
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

SGkgQWxsLAoKSSBoYXZlIGNyZWF0ZWQgYW4gYXBwYXJtb3IgcHJvZmlsZSBmb3IgdGhlIHByb2Nl
c3Mgd2hpY2ggZG9lcwptb3VudC91bW91bnQgYmFzZWQgb24gY2VydGFpbiBjb25kaXRpb25zLgpU
aGUgcHJvY2VzcyBpcyBydW5uaW5nIGFzIGEgIm5vbi1yb290IiB1c2VyIHdpdGggbGltaXRlZCBM
aW51eCBDYXBhYmlsaXRpZXMuCgpBcyBwZXIgKG1hbiA3IGNhcGFiaWxpdGllcykgQ0FQX1NZU19B
RE1JTiBpcyByZXF1aXJlZCBmb3IgbW91bnQgYW5kCnVubW91bnQgb3BlcmF0aW9ucy4KCldoaWxl
IHRoZSBwcm9jZXNzIHJ1bnMgYXMgZW5mb3JjZSBtb2RlLCBJIGFtIG9ic2VydmluZyB0aGUgbW91
bnQgaXNzdWUKc2F5aW5nIHRoYXQgIm11c3QgYmUgYSBzdXBlcnVzZXIgdG8gbW91bnQgJycgYW5k
CiJtdXN0IGJlIHN1cGVydXNlciB0byB1bm1vdW50IiBmb3IgbW91bnQgYW5kIHVubW91bnQgb3Bl
cmF0aW9ucy4KCk15IG9wZXJhdGluZyBzeXN0ZW0gcnVucyBvbiB1dGlsLWxpbnV4LgoKUXVlcnk6
CgotPiBTaW5jZSB3ZSBoYXZlIHJlcXVpcmVkIENBUHMgQ0FQX1NZU19BRE1JTiBpbiB0aGUgcHJv
ZmlsZSBhbmQgaXQKYXBwbGllZCB0byB0aGUgcHJvY2VzcyBhcyB3ZWxsIGJ1dCBzdGlsbCBvYnNl
cnZpbmcKICAgdGhhdCBtb3VudCBhbmQgdW5tb3VudCBmYWlscyBbICJtdXN0IGJlIHN1cGVydXNl
ciB0byBtb3VudCIgYW5kCiJtdXN0IGJlIHN1cGVydXNlciB0byB1bm1vdW50IiBdLgoKLT4gRG9l
cyBtb3VudC91bW91bnQgcmVzdHJpY3Rpb24gaXMgZG9uZSBieSB1dGlsLWxpbnV4IHBhY2thZ2U/
IEFzIHBlcgpvdXIgdW5kZXJzdGFuZGluZyBDQVBfU1lTX0FETUlOIChjYXBhYmxlKSBjaGVjawog
ICB3b3VsZCBiZSB0YWtlbiBjYXJlIG9mIGluIEtlcm5lbCBjb2RlLiBJdCBsb29rcyBsaWtlIHVz
ZXIgc3BhY2UKKHV0aWwtbGludXggcGFja2FnZSkgcmVzdHJpY3RzIHRoaXMgcGVybWlzc2lvbiBp
c3N1ZS4KICAgUGxlYXNlIGNsYXJpZnkgbXkgdW5kZXJzdGFuZGluZy4KCi0+IFdoYXQgd291bGQg
YmUgaWRlYWwgb3B0aW9ucyB0byByZXNvbHZlIHRoZSBpc3N1ZSAoICJub24tcm9vdCIgdXNlcgpk
b2VzIG1vdW50L3Vtb3VudCBvcGVyYXRpb24gKS4KClRoYW5rcwpNdXJhbGkuUwoKLS0gCkFwcEFy
bW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5n
cyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlz
dGluZm8vYXBwYXJtb3IK

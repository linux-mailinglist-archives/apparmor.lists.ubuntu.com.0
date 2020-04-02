Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id AADE519C2A9
	for <lists+apparmor@lfdr.de>; Thu,  2 Apr 2020 15:31:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1jJzvo-0002Jp-Qj; Thu, 02 Apr 2020 13:30:52 +0000
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mardy.tardi@gmail.com>) id 1jJzvn-0002Jg-NX
 for apparmor@lists.ubuntu.com; Thu, 02 Apr 2020 13:30:51 +0000
Received: by mail-lf1-f43.google.com with SMTP id z23so2715231lfh.8
 for <apparmor@lists.ubuntu.com>; Thu, 02 Apr 2020 06:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:subject:openpgp:autocrypt:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=g6W1k4G6tRtl60vihaPoGRTraQG8DppP+skyV3sr9Rs=;
 b=cTLFF0a0ukAQC7gNrDY4bGv3zLES3X5v9qkp8icOhlk54J41+f69ftosH/td1/8Z/f
 BkRRlFXbLpmjsgTLeBwGGFx9fW+aUxDC8cmKIX5t3FjvVPiraaDJtTWIIBFqLMWJ7URp
 cGNChMrd+DZ+HBLr11FMiYplvPEistN+cFpxilH9Ms2SOyfeouuBGQ4URimt585LqD1k
 JV+LRW1HHJ7c4cBbxkrLBDlEf6qCG1Z4D0n0F/4RUZFVzkuQQuoPPtS7W3D3vHUIvRKD
 pbQskojQkvawh2VDnj3z1fM2R9R6deiK1vg7WP7xv7ZZJTWjR9XYM9xMtrIoz+O0GvkW
 Lkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:subject:openpgp:autocrypt:to
 :message-id:date:user-agent:mime-version:content-language
 :content-transfer-encoding;
 bh=g6W1k4G6tRtl60vihaPoGRTraQG8DppP+skyV3sr9Rs=;
 b=C6ssvap0lDT53pXqG9r22zebANfzA/wic8QRazPaOe73hMYIKc7WmPICnXYAk2rYJ8
 l32goIxXItJpsNV0wItdWc5G4NkUmvgojT2amOZXTRflg6YM6J27c2qXoblahVRnyOob
 0Ul+wdm87vRPCpd6mCfRUpRyG/aAvT2CPVreSYLo1rrFuB+jmWaUMMHaa5M44zNzxgIi
 NxcC9RkNBi1AbDytVVmovJrzLWggxuKTu/TLRQsUObR7VGj5A3rVOC4g8YiIka4SkWtj
 3adqwc/C1VX9/vygf4N+4T+nH/vRT0ggSe8SkT5yeI+HUtUnOumYXx5sgxs2w1MJitWq
 oezg==
X-Gm-Message-State: AGi0PuYif/z6zPE1tJtbEquq+qEjMI8uoQ+/BFyIgEmYYoO39FDGS+u+
 4a9rbBE9lsVoKo7radHQ26POn5xE
X-Google-Smtp-Source: APiQypLIuR5BUU6GTD1vYJudHjC/AR2ItlVECvl5VKULPvz4cbOvApm5xEtAWx8emTbt1ysaYQ2vLw==
X-Received: by 2002:ac2:4c29:: with SMTP id u9mr2198978lfq.149.1585834250745; 
 Thu, 02 Apr 2020 06:30:50 -0700 (PDT)
Received: from [192.168.1.104] ([176.59.14.0])
 by smtp.gmail.com with ESMTPSA id t13sm3817889lfc.68.2020.04.02.06.30.49
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Apr 2020 06:30:50 -0700 (PDT)
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
To: apparmor@lists.ubuntu.com
Message-ID: <33f7799a-9184-990b-01d7-d27d61d918f7@users.sourceforge.net>
Date: Thu, 2 Apr 2020 16:30:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-GB
Subject: [apparmor] Generating the profile cache on a different machine
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

SGkgYWxsIQogIEknbSB0cnlpbmcgdG8gc3BlZWQgdXAgdGhlIGZpcnN0IGRldmljZSBib290IGJ5
IGdlbmVyYXRpbmcgYSBjYWNoZSBvZgp0aGUgcHJvZmlsZXMuIFRoZSB0YXJnZXQgbWFjaGluZSBp
cyBydW5uaW5nIGEgWW9jdG8gaW1hZ2UsIHNvIGl0IHdvdWxkCmZlZWwgbmF0dXJhbCBpZiB0aGUg
cHJvZmlsZSBjYWNoZSBpcyBhbHNvIGdlbmVyYXRlZCBieSBZb2N0by4KCk15IGZpcnN0IHF1ZXN0
aW9uIGlzIHdoZXRoZXIgdGhpcyBpcyBhY3R1YWxseSBkb2FibGU6IGlzIHRoZSBiaW5hcnkKZm9y
bWF0IG9mIGEgY2FjaGVkIHByb2ZpbGUgaW5kZXBlbmRlbnQgZnJvbSB0aGUgbWFjaGluZSBhcmNo
aXRlY3R1cmUgaW4Kd2hpY2ggaXQgaXMgZ2VuZXJhdGVkPwoKQWxzbzogaXMgdGhlIGtlcm5lbCB2
ZXJzaW9uIG9mIHRoZSBob3N0IG1hY2hpbmUgKHRoYXQgaXMsIHdoZXJlIHRoZQphcHBhcm1vcl9w
YXJzZXIgY29tbWFuZCBpcyBiZWluZyBydW4pIGluZGlmZmVyZW50PyBPciBkb2VzIGl0IGhhdmUg
dG8gYmUKYXBwYXJtb3ItZW5hYmxlZD8KCkkgc2VlIHRoYXQgdGhlcmUncyBhIGAuZmVhdHVyZXNg
IGZpbGUgdW5kZXIgdGhlIGNhY2hlLyBkaXJlY3RvcnksIGJ1dAppdCdzIG5vdCBjbGVhciB0byBt
ZSBpZiBpdCdzIHJlbGF0ZWQgdG8gdGhlIGFwcGFybW9yICp1c2Vyc3BhY2UgdG9vbHMqCmZlYXR1
cmVzLCBvciB0byB0aGUga2VybmVsLiBJZiB0aGUgbGF0dGVyLCBjYW4gSSBzYWZlbHkgY29weSBp
dCBiZXR3ZWVuCmRpZmZlcmVudCBtYWNoaW5lcywgYXMgbG9uZyBhcyBJJ2xsIGhhdmUgdGhlIHNh
bWUgYXBwYXJtb3IgcGF0Y2hlcwphcHBsaWVkIHRvIGFsbCB0aGUga2VybmVscyBJIG5lZWQgdG8g
c3VwcG9ydD8KCkNpYW8sCiAgQWxiZXJ0bwoKLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBB
cm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDog
aHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

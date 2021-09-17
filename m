Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFAD40FAE7
	for <lists+apparmor@lfdr.de>; Fri, 17 Sep 2021 16:57:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mRFIg-0007OE-6t; Fri, 17 Sep 2021 14:57:14 +0000
Received: from srv1.stroeder.com ([213.240.180.113])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <michael@stroeder.com>) id 1mRFIe-0007O1-MK
 for apparmor@lists.ubuntu.com; Fri, 17 Sep 2021 14:57:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=stroeder.com;
 s=stroeder-com-20201114; t=1631890631;
 bh=69N/776tF5mAra/KAGQ200Ca3g74ANkbdGvZjeurkvs=;
 h=Date:To:From:Subject:From;
 b=qbjVc0smAWXJWpeSQqI1/vsJkSduV5HcyoKX/AO6Dbo1ylZLc+9wuq4vH1vnMQPFZ
 zeVCsmh2Sf6u5m/Qh5LHVtaS//qRc5wxdQ7uHP0dGUfvvkn+/O5TMIgHlmf3Kn7HVE
 mXqtiOQZbX1+Ewil2QG8KhiulnB2OY2XOL7HsvnYndEtfsxYFVqbyN6l5qhx/ddE3U
 hDfshpw/CmOXhtClAMuxMqlLiqHwFZ0WjUoEfgbYfVbpHRpm9+TshNHLCLg
Message-ID: <3609ccf1-0146-1632-6d30-aa68f600bfb7@stroeder.com>
Date: Fri, 17 Sep 2021 16:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
From: =?UTF-8?Q?Michael_Str=c3=b6der?= <michael@stroeder.com>
Subject: [apparmor] config check exceptions
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

SEkhCgpJIGhhdmUgdGhlIGZvbGxvd2luZyBhbnNpYmxlIHRhc2sgZm9yIGluc3RhbGxpbmcgcnN5
c2xvZyBjb25maWcgZmlsZToKCi0gbmFtZTogIkdlbmVyYXRlIHJzeXNsb2cgY29uZmlndXJhdGlv
biIKICB0ZW1wbGF0ZToKICAgIHNyYzogInJzeXNsb2cuY29uZi5qMiIKICAgIGRlc3Q6ICIvZXRj
L3JzeXNsb2cuY29uZiIKICAgIG93bmVyOiByb290CiAgICBncm91cDogcm9vdAogICAgbW9kZTog
MG8wNjQ0CiAgICB2YWxpZGF0ZTogIi91c3Ivc2Jpbi9yc3lzbG9nZCAtTiAxIC1mICVzIgogIG5v
dGlmeToKICAgIC0gInJlc3RhcnQgcnN5c2xvZyIKCkFzIHlvdSBjYW4gc2VlIHRoZSBhcmd1bWVu
dCAidmFsaWRhdGUiIGludm9rZXMgcnN5c2xvZ2QgZXhlY3V0YWJsZSB0bwpjaGVjayB0aGUgY29u
ZmlnICpiZWZvcmUqIGluc3RhbGxpbmcgaXQgdG8gdGhlIGZpbmFsIGRlc3RpbmF0aW9uLgoKVGhp
cyBsZWFkcyB0byB2aW9sYXRpb24gb2YgQXBwQXJtb3IgcHJvZmlsZQovZXRjL2FwcGFybW9yLmQv
dXNyLnNiaW4ucnN5c2xvZ2QgYWxzbyBhcHBsaWVkIHdoZW4gcnVubmluZyB0aGlzCmV4ZWN1dGFi
bGUgb25seSBmb3IgY29uZmlnIHZhbGlkYXRpb246Cgp0eXBlPUFWQyBtc2c9YXVkaXQoMTYzMTg4
MzcwMy4wNjE6MzYwMyk6IGFwcGFybW9yPSJERU5JRUQiCm9wZXJhdGlvbj0ib3BlbiIgcHJvZmls
ZT0iL3Vzci9zYmluL3JzeXNsb2dkIgpuYW1lPSIvcm9vdC8uYW5zaWJsZS90bXAvYW5zaWJsZS10
bXAtMTYzMTg4MzY5OS41MDM2NzMtOTQxNi0yNDI3NDYzNzA4Nzk5Njgvc291cmNlIgpwaWQ9MTM3
NjAgY29tbT0icnN5c2xvZ2QiIHJlcXVlc3RlZF9tYXNrPSJyIiBkZW5pZWRfbWFzaz0iciIgZnN1
aWQ9MCBvdWlkPTAKCkJ1dCBJJ2QgbGlrZSB0byBhdm9pZCBhZGRpbmcgcnVsZXMgdG8gZ3JhbnQg
cmVhZCBhY2Nlc3MgdG8KL3Jvb3QvLmFuc2libGUvdG1wLy4KCkFueSBpZGVhIGhvdyB0byBkaXNh
YmxlIHRoZSBBcHBBcm1vciBwcm9maWxlIG9ubHkgaW4gY2FzZSBvZiB0aGlzIGNvbmZpZwpjaGVj
az8KCkNpYW8sIE1pY2hhZWwuCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxp
c3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczov
L2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

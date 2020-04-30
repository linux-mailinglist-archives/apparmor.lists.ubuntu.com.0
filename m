Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B9D1BF6B1
	for <lists+apparmor@lfdr.de>; Thu, 30 Apr 2020 13:23:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1jU7HF-0005YB-ON; Thu, 30 Apr 2020 11:22:49 +0000
Received: from mail.cboltz.de ([88.99.101.17])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <opensuse@cboltz.de>) id 1jU7HD-0005Y3-BU
 for apparmor@lists.ubuntu.com; Thu, 30 Apr 2020 11:22:47 +0000
X-sprachakt.com-SMTP-Auth: no
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.cboltz.de (Postfix) with ESMTP id E29D05C0124;
 Thu, 30 Apr 2020 13:22:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.cboltz.de
Received: from mail.cboltz.de ([127.0.0.1])
 by localhost (mail.cboltz.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J89xjVQI3KyB; Thu, 30 Apr 2020 13:22:45 +0200 (CEST)
Received: from home.cboltz.de (unknown [10.10.0.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.cboltz.de (Postfix) with ESMTPSA;
 Thu, 30 Apr 2020 13:22:45 +0200 (CEST)
From: Christian Boltz <opensuse@cboltz.de>
To: yast-devel@opensuse.org
Date: Thu, 30 Apr 2020 13:22:44 +0200
Message-ID: <1794871.jzh3902Se6@tux.boltz.de.vu>
MIME-Version: 1.0
X-Face: #?nL0}JpqNtLQy@q#bRm?B?pGS8[mx6r.6[91zp@*2DZ?18)haWs5wgvi, ,
 wF/JWMTUh+6x, b7_`pW3)m~0606sDW0&'EKA}_-W+)Bz~d]k>4E9TyU}k@b&1=%yk\
Subject: [apparmor] Upcoming changes in AppArmor aa-status output
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
Cc: apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

SGVsbG8sCgpBRkFJSyB0aGUgWWFTVCBBcHBBcm1vciBtb2R1bGUgdXNlcyB0aGUgSlNPTiBvdXRw
dXQgb2YgYWEtc3RhdHVzLgoKVGhlcmUgYXJlIHR3byB1cGNvbWluZyBjaGFuZ2VzLCBhbmQgSSdk
IGxpa2UgdG8gcG9pbnQgdGhlbSBvdXQgc28gdGhhdCAKeW91IGNhbiBhZGp1c3QgdGhlIFlhU1Qg
QXBwQXJtb3IgbW9kdWxlIGlmIG5lZWRlZC4KCmEpIG5ldyBwcm9maWxlIG1vZGVzCgpCZXNpZGVz
IGNvbXBsYWluIGFuZCBlbmZvcmNlIG1vZGUsIGZ1dHVyZSBBcHBBcm1vciB2ZXJzaW9ucyAoPj0g
My4wKSAKd2lsbCBhbHNvIGhhdmUgYHVuY29uZmluZWRgLCBgbWl4ZWRgIGFuZCBga2lsbGAuCgpU
ZWNobmljYWxseSB0aGUgc3RydWN0dXJlIG9mIHRoZSBKU09OIGRvZXNuJ3QgY2hhbmdlLCBidXQg
dGhlcmUgd2lsbCBiZSAKbmV3IHZhbHVlcyBmb3IgdGhlIHN0YXR1cywgZm9yIGV4YW1wbGUKCiAg
ICAicHJvY2Vzc2VzIjogewogICAgICAgICIvdXNyL2xpYi9HQ29uZi8yL2djb25mZC0yIjogWwog
ICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAicGlkIjogIjM4OTkiLAogICAgICAgICAgICAg
ICAgInByb2ZpbGUiOiAiL3Vzci9saWIvR0NvbmYvMi9nY29uZmQtMiIsCiAgICAgICAgICAgICAg
ICAic3RhdHVzIjogImtpbGwiCiAgICAgICAgICAgIH0KICAgICAgICBdCiAgICB9CgogICAgInBy
b2ZpbGVzIjogewogICAgICAgICIvZG9lcy9ub3QvZXhpc3QiOiAia2lsbCIKICAgIH0KClNpZGUg
cXVlc3Rpb246IERvIHlvdSB0aGluayB0aGlzIHdhcnJhbnRzIGluY3JlYXNpbmcgdGhlIEpTT04g
dmVyc2lvbiAKbnVtYmVyPwoKUXVpY2sgZXhwbGFuYXRpb24gYWJvdXQgdGhlIG5ldyBtb2RlczoK
LSB1bmNvbmZpbmVkOiBzaW1pbGFyIHRvIG5vdCBoYXZpbmcgYSBwcm9maWxlLCBidXQgd2hlbiB1
c2luZyBhbiAKICB1bmNvbmZpbmVkIHByb2ZpbGUsIGl0J3MgcG9zc2libGUgdG8gcmVwbGFjZSBp
dCB3aXRoIGEgInJlYWwiIHByb2ZpbGUgCiAgbGF0ZXIsIHNvIHRoYXQgcHJvZ3JhbXMgaW5pdGlh
bGx5IHJ1bm5pbmcgdW5kZXIgYW4gdW5jb25maW5lZCBwcm9maWxlCiAgZ2V0IGEgcHJvZmlsZSBp
biBlbmZvcmNlIG1vZGUKLSBraWxsOiBzaW1pbGFyIHRvIGVuZm9yY2UsIGJ1dCBvbiBwcm9maWxl
IHZpb2xhdGlvbnMsIHRoZSBwcm9jZXNzIHdpbGwgCiAgYmUga2lsbGVkIGluc3RlYWQgb2YgImp1
c3QiIGdldHRpbmcgRVBFUk0KLSBtaXhlZDogd2hlbiB1c2luZyBzdGFja2VkIHByb2ZpbGVzLCB0
aGlzIGluZGljYXRlcyB0aGF0IGEgcHJvZ3JhbSBpcyAKICBmb3IgZXhhbXBsZSB1c2luZyBhIHN0
YWNrIG9mIHR3byBwcm9maWxlcywgb25lIGluIGNvbXBsYWluIGFuZCBvbmUgaW4gCiAgZW5mb3Jj
ZSBtb2RlLiAoVGhpcyBhbHNvIG1lYW5zIHlvdSdsbCBzZWUgIm1peGVkIiBvbmx5IGluIGFhLXN0
YXR1cwogIG91dHB1dCwgYnV0IG5ldmVyIGluIGEgcHJvZmlsZSdzICJmbGFncz0oLi4uKSIuKQoK
KEV4dGVuZGluZyB0aGUgYWEtKiB0b29scyB0byBzdXBwb3J0IHN3aXRjaGluZyB0byBraWxsIGFu
ZCB1bmNvbmZpbmVkIAptb2RlIGlzIHN0aWxsIG9uIG15IFRPRE8gbGlzdC4pCgpiKSB3aGl0ZXNw
YWNlIGNoYW5nZXMKCmFhLXN0YXR1cyB3YXMgcmV3cml0dGVuIHRvIEMsIHdoaWNoIHJlc3VsdHMg
aW4gY2hhbmdlZCB3aGl0ZXNwYWNlIGluIHRoZSAKLS1qc29uIG91dHB1dC4gQ3VycmVudGx5IC0t
cHJldHR5LWpzb24gYWxzbyByZXN1bHRzIGluICJjb21wcmVzc2VkIiAKSlNPTiwgYnV0IEkgaG9w
ZSB0aGF0IHRoaXMgd2lsbCBjaGFuZ2UgYWdhaW4gaW4gdGhlIGZ1dHVyZS4KSSdkIGd1ZXNzL2hv
cGUgdGhhdCB3aGl0ZXNwYWNlIGNoYW5nZXMgc2hvdWxkbid0IG1hdHRlciwgYnV0IHBsZWFzZSAK
Y2hlY2sgbmV2ZXJ0aGVsZXNzLgoKCkN1cnJlbnRseSB0aGUgbmV3IGFhLXN0YXR1cyBpcyBvbmx5
IGF2YWlsYWJsZSBpbiB1cHN0cmVhbSBnaXQgbWFzdGVyLgpJZiBpdCBtYWtlcyB0ZXN0aW5nIGVh
c2llciBmb3IgeW91LCBJIGNhbiBwcm92aWRlIHRoZSBjb21waWxlZCBiaW5hcnkgb3IgCnNvbWUg
ZXhhbXBsZSBvdXRwdXQuCgoKUmVnYXJkcywKCkNocmlzdGlhbiBCb2x0egotLSAKRXMga2FubiBk
YWR1cmNoCiwgZGHDnyBkZXIgUmVjaG5lciAoCndlbm4gZXIgYW4gVHJlbm4KLSB6ZWljaGVuIHVt
YnJpY2h0ICAgICAgICAgIFtSYXR0aSBlcmtsw6RydAopIGRpZSBmYWxzY2hlbiBTdGVsbGVuICAg
ICAgZGVuIEJlZ3JpZmYKZXJ3aXNjaHQgLCB6dSBnYW56IGdyw6TDnyAgICAgIlBsZW5rZW4iCi0g
bGljaGVuIEVmZmVrdGVuIGtvbW1lbiAgICBpbiBzdXNlLWxpbnV4XQohCgoKCgotLSAKQXBwQXJt
b3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdz
IG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0
aW5mby9hcHBhcm1vcgo=

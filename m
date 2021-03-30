Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A89634F21E
	for <lists+apparmor@lfdr.de>; Tue, 30 Mar 2021 22:28:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lRKy5-0003bC-PH; Tue, 30 Mar 2021 20:28:05 +0000
Received: from greymarch.letopolis.de ([37.120.179.78])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jgs-apparmor@letopolis.de>) id 1lRKy2-0003a3-0D
 for apparmor@lists.ubuntu.com; Tue, 30 Mar 2021 20:28:02 +0000
Received: from mephala (unknown [IPv6:2001:16b8:30d9:b600:a2c0:3756:90f3:9045])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest
 SHA384) (No client certificate requested)
 by greymarch.letopolis.de (Postfix) with ESMTPSA id 6D202240A4C
 for <apparmor@lists.ubuntu.com>; Tue, 30 Mar 2021 22:28:01 +0200 (CEST)
Date: Tue, 30 Mar 2021 22:28:00 +0200
From: Jonas =?UTF-8?B?R3Jvw59l?= Sundrup <jgs-apparmor@letopolis.de>
To: <apparmor@lists.ubuntu.com>
Message-ID: <20210330222800.6699c3e3@mephala>
X-Pect: The Spanish Inquisition
MIME-Version: 1.0
Subject: [apparmor] Rule to allow chmod-operations (or reduce dmesg
	suppression)
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

SGksCgpteSBkbWVzZyBzaG93cyBtZSB0aGUgZm9sbG93aW5nIG91dHB1dDoKCnR5cGU9MTQwMCBh
dWRpdCgxNjE3MTM0NzQ1Ljk2Mjo0OTgxKTogYXBwYXJtb3I9IkRFTklFRCIKb3BlcmF0aW9uPSJj
aG1vZCIgcHJvZmlsZT0iL3Vzci9saWIvc2lnbmFsLWRlc2t0b3Avc2lnbmFsLWRlc2t0b3AiCm5h
bWU9Ii92YXIvY2FjaGUvZm9udGNvbmZpZy8iIHBpZD0yNDYyNjUgY29tbT0ic2lnbmFsLWRlc2t0
b3AiCnJlcXVlc3RlZF9tYXNrPSJ3IiBkZW5pZWRfbWFzaz0idyIgZnN1aWQ9MTAwMCBvdWlkPTAK
CldoYXQgd291bGQgYmUgYSBydWxlIGFsbG93aW5nIHRoaXMgY2htb2Qgb3BlcmF0aW9uPwoKUmln
aHQgbm93IEkgYWN0dWFsbHkgZG9uJ3QgcmVhbGx5IGNhcmUgaWYgdGhlIHNvbHV0aW9uIGl0J3Mg
cmVhc29uYWJsZQpvciBub3QsIGJpZyBoYW1tZXIgd291bGQgYWxzbyBiZSBmaW5lLCBhcyBJIGFt
IGN1cnJlbnRseSBpbnZlc3RpZ2F0aW5nCndoeSB0aGUgZW50aXJldHkgb2YgdGhlIEVsZWN0cm9u
LXVuaXZlcnNlIHN1ZGRlbmx5IGRlY2lkZXMgdG8gZGllIG9uIG1lCndpdGggWzBdLgoKSGVuY2Ug
SSdtIGN1cnJlbnRseSB0cnlpbmcgdG8gd3JpdGUgYSB2ZXJ5IGxpYmVyYWwgcHJvZmlsZSB0byB0
aGVuIGxvY2sKZG93biBhZ2Fpbi4gSG93ZXZlciwgSSBmYWlsIHRvIHdyaXRlIGEgcnVsZSB0aGF0
IHJlbGlldmVzIG1lIG9mIHRoZQp3YXJuaW5nIGFib3ZlLiBJIGRvIGhhdmUgYSAKCi92YXIvY2Fj
aGUvZm9udGNvbmZpZyBydywKL3Zhci9jYWNoZS9mb250Y29uZmlnLyoqIHJ3LAoKaW4gdGhlIHBy
b2ZpbGUgSSdtIHRlc3Rpbmcgd2l0aCwgYnV0IHRoYXQgZG9lc24ndCByZXNvbHZlIGl0LiBQb3Nz
aWJseQpiZWNhdXNlIGl0J3MgYSBjaG1vZC1vcGVyYXRpb24gaW5zdGVhZCBvZiBhbgpvcGVuLW9w
ZXJhdGlvbj8gV2hpY2ggdGhlIGNvcmUgcmVmZXJlbmNlIFsxXSBzYXlzIGlzIGN1cnJlbnRseSBu
b3QKc3VwcG9ydGVkL2V4cG9zZWQ/CgpUaGF0IG1lc3NhZ2UgaXMgcHJlc2VudCA0IHRpbWVzLCBJ
IGRvdWJ0IGl0J3MgdGhlIHJvb3QgY2F1c2UsIGJ1dCBkbWVzZwppcyBub3Qgdm9pY2luZyBhbnkg
b3RoZXIgY29uY2VybnMgYmVzaWRlcyAibiBjYWxsYmFja3Mgc3VwcHJlc3NlZCIsIHNvCkknZCBs
aWtlIHRvIGdldCByaWQgb2YgaXQgdG8gdW5jb3ZlciBtb3JlIG1lc3NhZ2VzIGFzIEkgaGF2ZW4n
dCBmb3VuZAphbnkgb3RoZXIgd2F5IG9mIHJlbW92aW5nIHNhaWQgc3VwcHJlc3Npb24KKGNhdXNl
ZC9yZXBvcnRlZCBieSBrYXVkaXRkX3ByaW50a19za2IpLiBJZiB0aGVyZSBpcyBvbmUgdGhhdCBJ
IGhhdmVuJ3QKZm91bmQsIHRoYXQgd291bGQgYmUgYW4gYWx0ZXJuYXRpdmUgYXMgd2VsbCBvZiBj
b3Vyc2UuCgoKQ2FuIGFueW9uZSBoZWxwIG1lIG91dCBvbiB0aGlzIG9uZSwgcG9zc2libHk/CgoK
VGhhbmtzIHZlcnkgbXVjaCwKSm9uYXMKCgpbMF0KbGliR0wgZXJyb3I6IE1FU0EtTE9BREVSOiBm
YWlsZWQgdG8gcmV0cmlldmUgZGV2aWNlIGluZm9ybWF0aW9uCmxpYkdMIGVycm9yOiBWZXJzaW9u
IDQgb3IgbGF0ZXIgb2YgZmx1c2ggZXh0ZW5zaW9uIG5vdCBmb3VuZApsaWJHTCBlcnJvcjogZmFp
bGVkIHRvIGxvYWQgZHJpdmVyOiBpOTE1CkZhaWxlZCB0byBnZW5lcmF0ZSBtaW5pZHVtcC56c2g6
IHNlZ21lbnRhdGlvbiBmYXVsdCAoY29yZSBkdW1wZWQpCgpbMV0KaHR0cHM6Ly9naXRsYWIuY29t
L2FwcGFybW9yL2FwcGFybW9yLy0vd2lraXMvQXBwQXJtb3JfQ29yZV9Qb2xpY3lfUmVmZXJlbmNl
CgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9k
aWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20v
bWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

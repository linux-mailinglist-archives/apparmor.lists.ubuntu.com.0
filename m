Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E51FB387F13
	for <lists+apparmor@lfdr.de>; Tue, 18 May 2021 19:55:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lj3vp-0003jD-2o; Tue, 18 May 2021 17:55:01 +0000
Received: from mout02.posteo.de ([185.67.36.66])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mailinglisten@posteo.de>) id 1lj3vm-0003j1-8d
 for apparmor@lists.ubuntu.com; Tue, 18 May 2021 17:54:58 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id AC0AF2400FD
 for <apparmor@lists.ubuntu.com>; Tue, 18 May 2021 19:54:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1621360497; bh=S2v0j0z46dA8PFKD9jZJbsRImSQrq9PH/QwPU4xI0hk=;
 h=To:From:Subject:Date:From;
 b=bgVUbtXAQ2RNOajJsoXyOLRiLa1oPFk0tjmDx0OzD7hZUsw4MO42cvTg9P8HUL78G
 kXzSl1tHlHDxGkAD0L8VrXBFNbc2r/BLCCeyIRIcyeToJIF7AlQNEK0qeEEoDyyKzM
 pCHA5MEtiRygPc/OK0iQtQdRQ3YwQ0hP0L1/prBnbOFNM7vdwKFhkhrGsO6u/GaJhQ
 OWUbDWWzNqMx67pQ9w4nSAOdIxqqxXTsgnQnk3s046gWJoBEg5XOJFLHxmS2U754G5
 PHQXAPOlU21T3Aqfod2c/r3oMVS/RwMLDSfzYHEB70vYZl7ElASi6ccdGyZjQaafSx
 Yee+/8+WsgItg==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Fl3YY2T6sz9rxR
 for <apparmor@lists.ubuntu.com>; Tue, 18 May 2021 19:54:57 +0200 (CEST)
To: apparmor@lists.ubuntu.com
References: <16e8bf7f-9e53-8ad9-5183-31ecc51fc015@posteo.de>
 <2000495.NGGyWjjzmL@tux.boltz.de.vu>
From: "mailinglisten@posteo.de" <mailinglisten@posteo.de>
Message-ID: <65166ba6-2550-7596-5c74-2a3dd7255ceb@posteo.de>
Date: Tue, 18 May 2021 17:54:55 +0000
MIME-Version: 1.0
In-Reply-To: <2000495.NGGyWjjzmL@tux.boltz.de.vu>
Content-Language: de-DE
Subject: Re: [apparmor] apparmor cache dir error messages
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

QW0gMTcuMDUuMjEgdW0gMjM6NTAgc2NocmllYiBDaHJpc3RpYW4gQm9sdHo6CgoKPj4oLi4uKQo+
IEluIHRoZW9yeSB0aGUgcGFja2FnZWQgcHJlLWNvbXBpbGVkIGNhY2hlIHNob3VsZCBtYXRjaCB0
aGUga2VybmVsIHNvIAo+IHRoYXQgdGhlIGRpcmVjdG9yeSBhY3R1YWxseSBnZXRzIHVzZWQuIFlv
dXIgZXJyb3IgbWVzc2FnZSBpbmRpY2F0ZXMgdGhhdCAKPiB0aGVyZSBpcyBhIG1pc21hdGNoIC0g
ZGlkIHlvdSBpbnN0YWxsIGEgbm9uLWRlZmF1bHQga2VybmVsPwo+IChBbmQgQlRXLCB3aGljaCBk
aXN0cmlidXRpb24gZG8geW91IHVzZT8pCgpvcGVuc3VzZSBsZWFwIDE1LjIgYW5kIGFjdHVhbGx5
IEkgZG8gdXNlIGEgbm9uIGRlZmF1bHQga2VybmVsCgo+IFRoZSBkaXJlY3RvcnkgaXMgcHJvYmFi
bHkgcGFydCBvZiBhIHBhY2thZ2UgeW91J3ZlIGluc3RhbGxlZCBbMV0sIAo+IHRoZXJlZm9yZSBJ
J2QgcmVjb21tZW5kIHRvIGtlZXAgaXQuIChEZWxldGluZyBpdCB3b24ndCBicmVhayBBcHBBcm1v
ciwgCj4gYnV0IHlvdXIgcGFja2FnZSBtYW5hZ2VyIG1pZ2h0IHN0YXJ0IHRvIGNvbXBsYWluIGFi
b3V0IHRoZSBtaXNzaW5nIAo+IGZpbGVzLikKCkkgd291bGQgZXhwZWN0IGEgY2FjaGUgZGlyZWN0
b3J5IGJlbG93IC92YXIgYW5kIGFjdHVhbGx5IHRoZXJlIGlzIGFsc28gYQpjYWNoZSBkaXIsIC92
YXIvbGliL2FwcGFybW9yL2NhY2hlLyB0aGF0IGNvbnRhaW5zIGp1c3QgYSBoaWRkZW4gZmlsZWQK
bmFtZWQgLmZlYXR1cmVzLgoKV2hhdCBpcyB0aGUgYmVuZWZpdCBvZiBhIHByZS1jb21waWxlZCBj
YWNoZSBpbiBjb250cmFzdCB0byB0aGUgcHJvZmlsZXMKaW4gL2V0Yy9hcHBhcm1vci5kLz8KClRo
YW5rcyEKCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5j
b20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50
dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

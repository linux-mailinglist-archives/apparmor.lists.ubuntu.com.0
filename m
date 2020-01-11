Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A01491380F3
	for <lists+apparmor@lfdr.de>; Sat, 11 Jan 2020 11:41:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iqECR-0008LQ-5X; Sat, 11 Jan 2020 10:40:59 +0000
Received: from server00.inetadmin.eu ([109.74.156.7])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <azurit@pobox.sk>) id 1iqECP-0008LJ-6x
 for apparmor@lists.ubuntu.com; Sat, 11 Jan 2020 10:40:57 +0000
Received: from localhost (server00.inetadmin.eu [109.74.156.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: azurit@elbiahosting.sk)
 by server00.inetadmin.eu (Postfix) with ESMTPSA id 0ABD413A8E1
 for <apparmor@lists.ubuntu.com>; Sat, 11 Jan 2020 11:40:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.sk;
 s=dkiminetadmin; t=1578739256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dk50BKMdjXh8Y/p6UxWXczsYHde7vtsOCiuuFTimd90=;
 b=SFSZ2U5puuMgiABCmBXEoD2GhlIIDGt2s4SmneFb90FPbHf1TgNJrVDYiHWQCWwY8BoMcY
 n59kamDJl0ESMlrbXSI57n0u6/CAJXLs+kJA6BNxKKvmi2qXUB0fCJLGhHJzdQ/yXE0Xzu
 b2fBsFmk4uVhLcbj2O4RurIKBdYrXc8=
Received: from [217.12.54.210] ([217.12.54.210]) by webmail.inetadmin.eu
 (Horde Framework) with HTTPS; Sat, 11 Jan 2020 11:40:56 +0100
Date: Sat, 11 Jan 2020 11:40:55 +0100
Message-ID: <20200111114055.Horde.984aXMehtnxciKhdF658KMC@webmail.inetadmin.eu>
From: azurit@pobox.sk
Cc: apparmor@lists.ubuntu.com
References: <20200111082533.Horde.-q_htOKjOvSwJY_kRNitnGs@webmail.inetadmin.eu>
 <87e7a580-2566-2c6c-1ddb-16299edddd63@chicoree.fr>
In-Reply-To: <87e7a580-2566-2c6c-1ddb-16299edddd63@chicoree.fr>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
Content-Disposition: inline
Subject: Re: [apparmor] Patching a system profile for a specific user
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="Yes"
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Q2l0w6F0IFN5bHZhaW4gTGVyb3V4IDxzeWx2YWluQGNoaWNvcmVlLmZyPjoKCj4gVGhhbmtzIGF6
dXIsCj4KPiBPbiAxMS8wMS8yMDIwIDA4OjI1LCBhenVyaXRAcG9ib3guc2sgd3JvdGU6Cj4+IGp1
c3QgcHV0IHRoaXMgaW4gL2V0Yy9hcHBhcm1vci5kL2xvY2FsL3Vzci5iaW4udGh1bmRlcmJpcmQg
Ogo+PiBvd25lciBAe0hPTUV9Ly5zaWduYXR1cmUuZC8qKiByLAo+Cj4KPiBNeSBpc3N1ZSBpcyBJ
IGRvbid0IHdhbnQgdG8gY2hhbmdlIHRoZSBzeXN0ZW0gY29uZmlndXJhdGlvbi4KCgpUaGlzIGlz
bnQnIHBvc3NpYmxlLiBUaGF0IGZpbGUgaXMgdXNlZCB0byBsb2NhbCBjaGFuZ2VzIG9ubHkgYW5k
IHdvbid0ICAKYmUgcmVwbGFjZWQgd2l0aCB1cGRhdGVzLgoKCgo+ICBJIHdvdWxkIGxpa2UgdG8g
Z3JhbnQgdGhlIGV4dHJhIHBlcm1pc3Npb24gKm9ubHkqIGZvciB0aGUgdXNlciB0aGF0ICAKPiBu
ZWVkcyBpdC4KClNvIGRvIHRoaXM6Cgpvd25lciAvaG9tZS9zcGVjaWZpY191c2VyLy5zaWduYXR1
cmUuZC8qKiByLAoKCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVi
dW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3Rz
LnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

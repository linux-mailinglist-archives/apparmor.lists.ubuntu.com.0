Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 998019F7CF
	for <lists+apparmor@lfdr.de>; Wed, 28 Aug 2019 03:28:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1i2mlN-0003co-CP; Wed, 28 Aug 2019 01:28:41 +0000
Received: from secure.zestysoft.com ([63.205.203.253])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@zestysoft.com>) id 1i2mlK-0003ci-EB
 for apparmor@lists.ubuntu.com; Wed, 28 Aug 2019 01:28:38 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by secure.zestysoft.com (Postfix) with ESMTP id 574BBADC003
 for <apparmor@lists.ubuntu.com>; Tue, 27 Aug 2019 18:28:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com 574BBADC003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1566955715;
 bh=n7WxgaLi3cxQrj1SjiOvlE2UODL9tR0eD8dld28gJD8=;
 h=From:Subject:Date:To:From;
 b=MjIAogkiPk2dVRFb8EOX01TV/w27dS36UauMWaMiRbRg9ZhtihmHBSTUAQurBnxOx
 fcRL1GMSYcSRAVTyMCyhy/73iu7J31I+LIICl4z8PZicQLj+qD8bvM/II9TTdNihDJ
 VNpYVM1K49B9tPikCoYGbwb/wIMdR7CZD2B7HoAc=
X-Virus-Scanned: amavisd-new at zestysoft.com
Received: from secure.zestysoft.com ([127.0.0.1])
 by localhost (secure.zestysoft.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VLGXcXRURITR for <apparmor@lists.ubuntu.com>;
 Tue, 27 Aug 2019 18:28:29 -0700 (PDT)
Received: from ians-mbp-w.intranet.zestysoft.com
 (Ians-MBP-W.intranet.zestysoft.com [192.168.100.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by secure.zestysoft.com (Postfix) with ESMTPSA id B7884ADC002
 for <apparmor@lists.ubuntu.com>; Tue, 27 Aug 2019 18:28:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com B7884ADC002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1566955709;
 bh=n7WxgaLi3cxQrj1SjiOvlE2UODL9tR0eD8dld28gJD8=;
 h=From:Subject:Date:To:From;
 b=BpbtLtHBv+xdl5qQyGa6HrRudQ34XbjZZXb9E1fdprUJdY1wMFJBNFfOHpwMHHqkz
 NFY3pK6AI21EdV5LJVJ0hj902z2YVidAhMkH1MwqnYTFeUcJNAXBiznOddPuQBVyga
 Di74dRdvPaIFwIYvlkDN4mzZPTSnJiHa4Dj60+bo=
From: apparmor@zestysoft.com
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Message-Id: <CA288C06-5EC0-4F54-BBB8-BE3D4220338F@zestysoft.com>
Date: Tue, 27 Aug 2019 18:28:30 -0700
To: apparmor@lists.ubuntu.com
X-Mailer: Apple Mail (2.3445.104.11)
Subject: [apparmor] Status of nnp override?
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

QW55IGNoYW5jZSB0aGUgTk5QIG92ZXJyaWRlIG1hZGUgaXQgdXBzdHJlYW0/ICBJIGRvbid0IG1l
YW4gdG8gYmUgYSBuYWcgLS0gaWYgdGhlcmUgaXMgYSBzdHJpbmcgb3Igc29tZXRoaW5nIEkgY2Fu
IHNlYXJjaCBmb3IgdG8gZGlzY292ZXIgd2hlbiB0aGlzIGhhcHBlbnMsIHBsZWFzZSBwb2ludCBt
ZSBpbiB0aGUgcmlnaHQgZGlyZWN0aW9uLgoKSSBmaW5hbGx5IGhhdmUgc29tZSB0aW1lIHRvIHdv
cmsgb24gdGhlIEZ1bGxTeXN0ZW1Qb2xpY3kgc3R1ZmYgYWdhaW4gLS0gIEkga25vdyBKb2huIEpv
aGFuc2VuIG1lbnRpb25lZCB0aGF0IHRoZXJlIG1pZ2h0IGJlIGEgdGVzdCBrZXJuZWwgZm9yIHRo
ZSBubnAgb3ZlcnJpZGUgb3RoZXJ3aXNlPyAgSSB0aGluayB0aGVyZSB3YXMgYSBwcm9ibGVtIHdp
dGggdXNlcnNwYWNlIHRoYXQgY2FuIHdvcmsgd2l0aCBpdCBiYWNrIGluIEp1bmUsIGJ1dCBtYXli
ZSBwcm9ncmVzcyBoYXMgYmVlbiBtYWRlIHNpbmNlIHRoZW4/CgpBcHByZWNpYXRlIGV2ZXJ5dGhp
bmcgeW91IGd1eXMgYXJlIGRvaW5nLApJYW4KLS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBB
cm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDog
aHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

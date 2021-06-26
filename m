Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1FA3B504A
	for <lists+apparmor@lfdr.de>; Sat, 26 Jun 2021 23:31:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lxFtd-0007rO-9Q; Sat, 26 Jun 2021 21:31:25 +0000
Received: from mail-lj1-f179.google.com ([209.85.208.179])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1lxFtb-0007rH-QL
 for apparmor@lists.ubuntu.com; Sat, 26 Jun 2021 21:31:23 +0000
Received: by mail-lj1-f179.google.com with SMTP id q4so9708248ljp.13
 for <apparmor@lists.ubuntu.com>; Sat, 26 Jun 2021 14:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=SlFoLycamwYHon7bJZyMHmNc6xD0+qvfCBIKl7OBoOs=;
 b=KOA051qvYRQ83NKEIQMqbgwWPVh8kEyNuZFExKk2W3CS4bd7eRyg9qfiXYLkRJZo31
 e9/SYqkNTaUx0ZiKnvtZdhuInVSkKLlSdlWn2dPBRHRA9UIVvrn3xZ6chwi3+n1kdG8x
 +i7/EGXBswXAxcclswEi5OWZDsSUo000oLcLOktBdMwWvwWKDo0kesYHp1D2LXRBJbQi
 xkwIBLgBl99NSpkWfI+h2c7aWv/gTSXCTo+6cJrTWlrVxNHoI3TyDWRegC68Mgh4ce4Z
 Wdck6oTEo2J66j0jxqyGwKF7C3HOtcJ0tTkcxlW/EVQER/oW3EnoVLeia9g7nJCNlQdi
 B33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SlFoLycamwYHon7bJZyMHmNc6xD0+qvfCBIKl7OBoOs=;
 b=U0bGNtocE0GT5heTsgZOa/nTzAGjnoQ9U1ZCYkhj4PeZ2X7d/59NGBK9nt/tLmVG5d
 nlwhxj1l38+R1gu6scHe7G0sRVgo0r2noCQUclI3eBr55xNe2cmR2vjpek9iIVKQfgv4
 o8zm5RpeLyQ3F8K68ek+cdR0mdixC1i9YDxCaiJFcQL7Au4bnTFm/qOnXl1VSnHdOWbu
 jiI+uhTWlAoiH61djatAGnUmGYAwTfWiyU/diAjeyYJtxgQQdb/QynXlWnjYfmCJrHui
 TcTt/Q3OXaje5euo6YhaE55Q2sKNGNnd8oPWVrDgiaDvEFqt9KwEI8kMpt7+TDEwjdM1
 cbXw==
X-Gm-Message-State: AOAM53270Uq7E1sV0po18j/Z3mkv0FfBD17NodJmcnVEYZYIyDbxMVN6
 Kx5WdgwlWUXpEknxoMb9FW4aw0i1Fm7ATqL9b6QhC53SwEuU8A==
X-Google-Smtp-Source: ABdhPJyAvoNt7UF2NpkTGXqRLtL5OHQD9c4aO6vEoQIk9QsFupW6PDZZh1ft/C+iGeMb0LQ0GxkRNy3Z191vsxNr+Ek=
X-Received: by 2002:a2e:858b:: with SMTP id b11mr10664509lji.63.1624743081768; 
 Sat, 26 Jun 2021 14:31:21 -0700 (PDT)
MIME-Version: 1.0
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Sun, 27 Jun 2021 03:01:10 +0530
Message-ID: <CAODFaZ7dHuXBCCRZC0oHQHk0HneMvMF_GWHyOE7y=w-BiQpLyg@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.208.179;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lj1-f179.google.com
Subject: [apparmor] Addressing limitations in DAC
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

SGkgQWxsLAoKLSBJIHdvdWxkIGxpa2UgdG8gdW5kZXJzdGFuZCBsaW1pdGF0aW9ucyBpbiBEQUMg
d2hpY2ggYXJlIGFkZHJlc3NlZCBpbgpBcHBhcm1vci4gUGxlYXNlIHNoYXJlIGFueSBzaW1wbGUg
ZXhhbXBsZXMgdG8gdW5kZXJzdGFuZCB0aGlzIHF1ZXJ5LgotIERvZXMgY29tbWFuZCBsaW5lIGlu
amVjdGlvbiAoU0VDVlVMKSBpc3N1ZSBiZSBhZGRyZXNzZWQgaWYgd2UgdXNlCkFwcGFybW9yPyAg
SWYgc28sIGdpdmUgYSByZWFsIHRpbWUgZXhhbXBsZSBmb3IgdGhlIHJlZmVyZW5jZS4KLSBJbiBv
dGhlciB3b3JkcywgYnkgcmVzdHJpY3RpbmcgdGhlIHN5c3RlbSByZXNvdXJjZSB1c2luZyBBcHBh
cm1vciwKd2hhdCBhcmUgdGhlIG1ham9yIHNlY3VyaXR5IGxlYWtzIGFyZSB3ZSBhdm9pZGluZz8g
UGxzIHNoYXJlCmFkZGl0aW9uYWwgZGV0YWlscyBpZiBhdmFpbGFibGUuCgpUaGFua3MKTXVyYWxp
LlMKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpN
b2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

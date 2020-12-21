Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2EB2DF803
	for <lists+apparmor@lfdr.de>; Mon, 21 Dec 2020 04:28:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1krBrS-0003i9-7U; Mon, 21 Dec 2020 03:27:50 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <rdunlap@infradead.org>) id 1krBrQ-0003hy-Ot
 for apparmor@lists.ubuntu.com; Mon, 21 Dec 2020 03:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=ZJVSch0SZkzI+63yW/zf68R+PNFMBkCVh2UVvuoPHQ0=; b=FvLM4dRm+zGG/JNC13xdRx4IP4
 Lfd3/YFZN7t+hMGOFd7Ln3sVKCQSSrCkhMcuzkWMLHNQcCHxz/tQCIERYmb0Ra6OHSmScZ/hqz0dO
 aHl827ZnmMdtFzqMDuvcr8tCIIPn1wNUfcPwdUrKpN/Xx/uRn8N0FfWiz8sBaJQ71H2/XTIuYb/Rs
 twfmyKCnmEt2qY1YaVnm59DeF93stm6mIP5M4WptQ2OYYNz1srm0d5Z2NIau+FZYVXVE67nQOR8bO
 L4uJbyZ2f5JZ0MJTno/C85hWI87AGlXoBEJF9dC4API+ECvgGmF/5k+asMZsc1bSFRqYFWKLtz4Sx
 +/p550gg==;
Received: from [2601:1c0:6280:3f0::64ea] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krBrM-0007GQ-KT; Mon, 21 Dec 2020 03:27:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Sun, 20 Dec 2020 19:27:39 -0800
Message-Id: <20201221032739.11379-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [apparmor] [PATCH v2] security: apparmor: delete repeated words in
	comments
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
Cc: Randy Dunlap <rdunlap@infradead.org>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, linux-security-module@vger.kernel.org,
 Seth Arnold <seth.arnold@canonical.com>, "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

RHJvcCByZXBlYXRlZCB3b3JkcyBpbiBjb21tZW50cy4Ke2EsIHRoZW4sIHRvfQoKU2lnbmVkLW9m
Zi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+CkNjOiBKb2huIEpvaGFu
c2VuIDxqb2huLmpvaGFuc2VuQGNhbm9uaWNhbC5jb20+CkNjOiBhcHBhcm1vckBsaXN0cy51YnVu
dHUuY29tCkNjOiBKYW1lcyBNb3JyaXMgPGptb3JyaXNAbmFtZWkub3JnPgpDYzogIlNlcmdlIEUu
IEhhbGx5biIgPHNlcmdlQGhhbGx5bi5jb20+CkNjOiBsaW51eC1zZWN1cml0eS1tb2R1bGVAdmdl
ci5rZXJuZWwub3JnClJldmlld2VkLUJ5OiBTZXRoIEFybm9sZCA8c2V0aC5hcm5vbGRAY2Fub25p
Y2FsLmNvbT4KLS0tCnYyOiByZWJhc2UKCiBzZWN1cml0eS9hcHBhcm1vci9pbmNsdWRlL2ZpbGUu
aCAgfCAgICAyICstCiBzZWN1cml0eS9hcHBhcm1vci9wYXRoLmMgICAgICAgICAgfCAgICAyICst
CiBzZWN1cml0eS9hcHBhcm1vci9wb2xpY3lfdW5wYWNrLmMgfCAgICAyICstCiAzIGZpbGVzIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0tLSBsaW51eC1uZXh0LTIw
MjAxMjE4Lm9yaWcvc2VjdXJpdHkvYXBwYXJtb3IvaW5jbHVkZS9maWxlLmgKKysrIGxpbnV4LW5l
eHQtMjAyMDEyMTgvc2VjdXJpdHkvYXBwYXJtb3IvaW5jbHVkZS9maWxlLmgKQEAgLTE2Nyw3ICsx
NjcsNyBAQCBpbnQgYWFfYXVkaXRfZmlsZShzdHJ1Y3QgYWFfcHJvZmlsZSAqcHJvCiAgKiBAcGVy
bXM6IHBlcm1pc3Npb24gdGFibGUgaW5kZXhlZCBieSB0aGUgbWF0Y2hlZCBzdGF0ZSBhY2NlcHQg
ZW50cnkgb2YgQGRmYQogICogQHRyYW5zOiB0cmFuc2l0aW9uIHRhYmxlIGZvciBpbmRleGVkIGJ5
IG5hbWVkIHggdHJhbnNpdGlvbnMKICAqCi0gKiBGaWxlIHBlcm1pc3Npb24gYXJlIGRldGVybWlu
ZWQgYnkgbWF0Y2hpbmcgYSBwYXRoIGFnYWluc3QgQGRmYSBhbmQgdGhlbgorICogRmlsZSBwZXJt
aXNzaW9uIGFyZSBkZXRlcm1pbmVkIGJ5IG1hdGNoaW5nIGEgcGF0aCBhZ2FpbnN0IEBkZmEgYW5k
CiAgKiB0aGVuIHVzaW5nIHRoZSB2YWx1ZSBvZiB0aGUgYWNjZXB0IGVudHJ5IGZvciB0aGUgbWF0
Y2hpbmcgc3RhdGUgYXMKICAqIGFuIGluZGV4IGludG8gQHBlcm1zLiAgSWYgYSBuYW1lZCBleGVj
IHRyYW5zaXRpb24gaXMgcmVxdWlyZWQgaXQgaXMKICAqIGxvb2tlZCB1cCBpbiB0aGUgdHJhbnNp
dGlvbiB0YWJsZS4KLS0tIGxpbnV4LW5leHQtMjAyMDEyMTgub3JpZy9zZWN1cml0eS9hcHBhcm1v
ci9wYXRoLmMKKysrIGxpbnV4LW5leHQtMjAyMDEyMTgvc2VjdXJpdHkvYXBwYXJtb3IvcGF0aC5j
CkBAIC04Myw3ICs4Myw3IEBAIHN0YXRpYyBpbnQgZGlzY29ubmVjdChjb25zdCBzdHJ1Y3QgcGF0
aAogICoKICAqIFJldHVybnM6ICUwIGVsc2UgZXJyb3IgY29kZSBpZiBwYXRoIGxvb2t1cCBmYWls
cwogICogICAgICAgICAgV2hlbiBubyBlcnJvciB0aGUgcGF0aCBuYW1lIGlzIHJldHVybmVkIGlu
IEBuYW1lIHdoaWNoIHBvaW50cyB0bwotICogICAgICAgICAgdG8gYSBwb3NpdGlvbiBpbiBAYnVm
CisgKiAgICAgICAgICBhIHBvc2l0aW9uIGluIEBidWYKICAqLwogc3RhdGljIGludCBkX25hbWVz
cGFjZV9wYXRoKGNvbnN0IHN0cnVjdCBwYXRoICpwYXRoLCBjaGFyICpidWYsIGNoYXIgKipuYW1l
LAogCQkJICAgIGludCBmbGFncywgY29uc3QgY2hhciAqZGlzY29ubmVjdGVkKQotLS0gbGludXgt
bmV4dC0yMDIwMTIxOC5vcmlnL3NlY3VyaXR5L2FwcGFybW9yL3BvbGljeV91bnBhY2suYworKysg
bGludXgtbmV4dC0yMDIwMTIxOC9zZWN1cml0eS9hcHBhcm1vci9wb2xpY3lfdW5wYWNrLmMKQEAg
LTM5LDcgKzM5LDcgQEAKIAogLyoKICAqIFRoZSBBcHBBcm1vciBpbnRlcmZhY2UgdHJlYXRzIGRh
dGEgYXMgYSB0eXBlIGJ5dGUgZm9sbG93ZWQgYnkgdGhlCi0gKiBhY3R1YWwgZGF0YS4gIFRoZSBp
bnRlcmZhY2UgaGFzIHRoZSBub3Rpb24gb2YgYSBhIG5hbWVkIGVudHJ5CisgKiBhY3R1YWwgZGF0
YS4gIFRoZSBpbnRlcmZhY2UgaGFzIHRoZSBub3Rpb24gb2YgYSBuYW1lZCBlbnRyeQogICogd2hp
Y2ggaGFzIGEgbmFtZSAoQUFfTkFNRSB0eXBlY29kZSBmb2xsb3dlZCBieSBuYW1lIHN0cmluZykg
Zm9sbG93ZWQgYnkKICAqIHRoZSBlbnRyaWVzIHR5cGVjb2RlIGFuZCBkYXRhLiAgTmFtZWQgdHlw
ZXMgYWxsb3cgZm9yIG9wdGlvbmFsCiAgKiBlbGVtZW50cyBhbmQgZXh0ZW5zaW9ucyB0byBiZSBh
ZGRlZCBhbmQgdGVzdGVkIGZvciB3aXRob3V0IGJyZWFraW5nCgotLSAKQXBwQXJtb3IgbWFpbGlu
ZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vi
c2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBh
cm1vcgo=

Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 140C71A1141
	for <lists+apparmor@lfdr.de>; Tue,  7 Apr 2020 18:22:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1jLqzR-0005l5-Fg; Tue, 07 Apr 2020 16:22:17 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <rgoldwyn@suse.de>) id 1jLqzP-0005km-K4
 for apparmor@lists.ubuntu.com; Tue, 07 Apr 2020 16:22:15 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B2C2AAE1C;
 Tue,  7 Apr 2020 16:22:14 +0000 (UTC)
Date: Tue, 7 Apr 2020 11:22:10 -0500
From: Goldwyn Rodrigues <rgoldwyn@suse.de>
To: apparmor@lists.ubuntu.com
Message-ID: <20200407162210.vlnmrao7e7dd25xm@fiona>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Subject: [apparmor] [PATCH] mdns: Allow reading /etc/mdns.allow
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
Cc: ebischoff@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

VGhpcyBpcyBmb3IgY3VzdG9tIGNvbmZpZ3VyYXRpb24gZm9yIG1kbnMgYXMgZGVmaW5lZCBhdDoK
aHR0cHM6Ly9naXRodWIuY29tL2xhdGhpYXQvbnNzLW1kbnMvYmxvYi9tYXN0ZXIvUkVBRE1FLm1k
I2V0Y21kbnNhbGxvdwoKU2lnbmVkLW9mZi1ieTogR29sZHd5biBSb2RyaWd1ZXMgPHJnb2xkd3lu
QHN1c2UuY29tPgoKZGlmZiAtLWdpdCBhL3Byb2ZpbGVzL2FwcGFybW9yLmQvYWJzdHJhY3Rpb25z
L21kbnMgYi9wcm9maWxlcy9hcHBhcm1vci5kL2Fic3RyYWN0aW9ucy9tZG5zCmluZGV4IDJhYTZm
ZmYyLi45MTAyZDI3ZSAxMDA2NDQKLS0tIGEvcHJvZmlsZXMvYXBwYXJtb3IuZC9hYnN0cmFjdGlv
bnMvbWRucworKysgYi9wcm9maWxlcy9hcHBhcm1vci5kL2Fic3RyYWN0aW9ucy9tZG5zCkBAIC0x
MSw2ICsxMSw3IEBACiAgICMgbWRuc2QKICAgL2V0Yy9uc3NfbWRucy5jb25mIHIsCiAgIC97LHZh
ci99cnVuL21kbnNkIHcsCisgIC9ldGMvbWRucy5hbGxvdyByLAogCiAgICMgSW5jbHVkZSBhZGRp
dGlvbnMgdG8gdGhlIGFic3RyYWN0aW9uCiAgICNpbmNsdWRlIGlmIGV4aXN0cyA8YWJzdHJhY3Rp
b25zL21kbnMuZD4KCi0tIApHb2xkd3luCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFy
bW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBo
dHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6227D158157
	for <lists+apparmor@lfdr.de>; Mon, 10 Feb 2020 18:28:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1j1Cqi-00021k-1a; Mon, 10 Feb 2020 17:27:56 +0000
Received: from mail4.protonmail.ch ([185.70.40.27])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <Golden_Miller83@protonmail.ch>) id 1j1Cqg-00021b-07
 for apparmor@lists.ubuntu.com; Mon, 10 Feb 2020 17:27:54 +0000
Date: Mon, 10 Feb 2020 17:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1581355673;
 bh=2JbN/J4Vi4qyjdbIB4AsSzu0TvKQlwqf8Kk9SrVU1oM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=N1DU6WpPrjWTZCAFMTj5A8D/WWUOGUqNG8JNd9JgLrjut0BlexrAjop8t6oD4coQP
 eeyX8Cs/VkZHb4LySZ1HDtfHEjUkA/k48gsSCnBlWAlaa9RNUqf23Ck7r+SlIy2qpX
 RpfiasQkAlnIAkJ2brV610KpyZN/mfIt8Sk65CX4=
To: "mailinglisten@posteo.de" <mailinglisten@posteo.de>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Message-ID: <PToS6ey2NVr38OBojA5FOjWN0qiH1P_mHP3wlX6P_P8nvTwgtsUZPcL2KsYqG0fnJ_mx72Uo-5A3MKr5hD6CaSRS_6ZI1U6TsV6wa766QB8=@protonmail.ch>
In-Reply-To: <bf20d814-6389-94f9-cc46-af7266465ad8@posteo.de>
References: <bf20d814-6389-94f9-cc46-af7266465ad8@posteo.de>
Feedback-ID: QEdvdaLhFJaqnofhWA-dldGwsuoeDdDw7vz0UPs8r8sanA3bIt8zJdf4aDqYKSy4gJuZ0WvFYJtvq21y6ge_uQ==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-0.6 required=7.0 tests=ALL_TRUSTED,BAYES_50,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
 PLING_QUERY shortcircuit=no autolearn=no autolearn_force=no
 version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Subject: Re: [apparmor] Accessing DMI data!?
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
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
Cc: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

T24gTW9uZGF5LCBGZWJydWFyeSAxMCwgMjAyMCAzOjIzIFBNLCBtYWlsaW5nbGlzdGVuQHBvc3Rl
by5kZSA8bWFpbGluZ2xpc3RlbkBwb3N0ZW8uZGU+IHdyb3RlOgoKPiBoZWxsbywKPgo+IGkganVz
dCBkaXNjb3ZlcmVkLCBzb21lIGFwcHMgZGVzaXJlIGFjY2VzcyB0byBETUkgZGF0YSwgcHJlY2lz
ZWx5IHRvCj4gL3N5cy9kZXZpY2VzL3ZpcnR1YWwvZG1pL2lkLwo+Cj4gSW4gdGhlIGNhc2Ugb2Yg
YXVkaW8gc29mdHdhcmUgaSBjYW4gdW5kZXJzdGFuZCBpdCBtYXkgbmVlZCB0byBrbm93IG9uCj4g
d2hhdCBoYXJkd2FyZSBpdCBydW5zLgo+Cj4gYnV0IGEgd2ViIGJyb3dzZXI/IHdoeSB3b3VsZCBh
IHdlYmJyb3dzZXIgbmVlZCB0byBrbm93IHRoZSBiaW9zIHZlcnNpb24KPiBvciBjb21wdXRlciBt
b2RlbCBuYW1lPwo+Cj4gdGhlIG9uZSB3aG8gcmVhbGx5IGJlbmVmaXRzIGZyb20gc3VjaCBpbmZv
cm1hdGlvbiBpcyBhIHBvc3NibGUgYXR0YWNrZXIsCj4gdGh1cyBmb3IgYSB3ZWIgYnJvd3NlciBp
IHdvdWxkIGRlbnkgYWNjZXNzIHRvIHRoaXMgZGF0YS4KPgo+IHdoYXQgZG8geW91IHRoaW5rPwoK
VGhpcyBpcyBpbnRlbmRlZCBmb3IgY2hyb21pdW06Cmh0dHBzOi8vY2hyb21pdW0uZ29vZ2xlc291
cmNlLmNvbS9jaHJvbWl1bS9zcmMuZ2l0LysvODQ2MThlZWU5OGZkZjc1NDg5MDVlODgzZTYzZTRm
NjkzODAwZmNmYQoKSm9yZGFuCgoKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JA
bGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBz
Oi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E04AE131F0E
	for <lists+apparmor@lfdr.de>; Tue,  7 Jan 2020 06:22:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iofv0-0007Ab-Ch; Tue, 07 Jan 2020 03:52:34 +0000
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hooanon05g@gmail.com>) id 1io94A-0002i1-9q
 for apparmor@lists.ubuntu.com; Sun, 05 Jan 2020 16:47:50 +0000
Received: by mail-pf1-f174.google.com with SMTP id 4so25828832pfz.9
 for <apparmor@lists.ubuntu.com>; Sun, 05 Jan 2020 08:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:in-reply-to:references:mime-version:content-id
 :date:message-id;
 bh=xoIv5gAA6Ipl/sQym5BcgwZpPPxq2H+FtUhd1qyerKA=;
 b=QZ4Ry1wNaHUIe8UobDh0ruLKXUFoviPyi7zpPfVZFYJK6NiCrlVg7tiZY1f3RNJsbP
 rv1WbNGZxSiT9Qg1Ang064goyICIKl2/sF+ymrFRLaJ6kMIEbVp3dKIpMqo1bUWnFqBI
 7vNo1Wy/IUMHah0FoKtCJW+IdpEx4yZT1SueUfUUfx4wgz3ftnjqZgbiEUHXD9HdXL81
 II7IBgeCXC0HO2t7bbi9dekKgEWiAfFAx3rxoZ9HHpRo0uXkcCrrTtf774TpZuRlch7P
 +u6L8EtehHVgutCs9UJb7sKwtDw7rg3hh/fsaJGwC2D5YL+MNlHIt3mGR2XIJUBcleZn
 pC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:in-reply-to:references
 :mime-version:content-id:date:message-id;
 bh=xoIv5gAA6Ipl/sQym5BcgwZpPPxq2H+FtUhd1qyerKA=;
 b=ccOuL3NXKSnvqm2J/kA3P0YseqeBNrZTU0vmHp/szSR4H8dMuwmxLxhr8uEBjsW3pm
 +pzMj6AQgXpEVD1HvRUvWkiMYlEfHutLiQHYtRbNMpP1ezZvXe2SaW8o11JwiGWjh2B7
 3DVW10HhL92kq9d48cCgnexaKUTl+s0dPLtuYsPlomc3eYxxHfLO3KxZMuJluAzWnq/y
 +h02qYZjEG5CBsAd163QSGz412uJlqRs3usIoBUTK7tviCj7Bf1LF8dWMwsyraJtMG/7
 lSYDZhL54eCJfKfmuaIuYB6n7F5/HTmT8OkXRfFEaclzKa9/pR9T1GomIj33j64Fadnq
 CTfw==
X-Gm-Message-State: APjAAAXDvhwCU+qBQv/NeOr9J4WNHJ/2AKZelhRLYOTAA+sJekbPTN7Z
 +lbj51zG2ZeEkmEo/Xy/YK0=
X-Google-Smtp-Source: APXvYqwTgHyr/RmoJEnASXFFTjEwld9qrIMuzj0bKRJUqafOsqF0TVW87Ys4VzQx412plH65/Drlsw==
X-Received: by 2002:a63:360a:: with SMTP id
 d10mr104464005pga.366.1578242868626; 
 Sun, 05 Jan 2020 08:47:48 -0800 (PST)
Received: from jromail.nowhere (h219-110-240-103.catv02.itscom.jp.
 [219.110.240.103])
 by smtp.gmail.com with ESMTPSA id r62sm76587057pfc.89.2020.01.05.08.47.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 05 Jan 2020 08:47:48 -0800 (PST)
Received: from localhost ([127.0.0.1] helo=jrobl) by jrobl id 1io947-0007dC-1f
 ; Mon, 06 Jan 2020 01:47:47 +0900
From: "J. R. Okajima" <hooanon05g@gmail.com>
To: John Johansen <john.johansen@canonical.com>
In-Reply-To: <38e06865-74fa-5dd7-b166-8dbe0961e4fe@canonical.com>
References: <24238.1577448944@jrobl>
 <38e06865-74fa-5dd7-b166-8dbe0961e4fe@canonical.com>
MIME-Version: 1.0
Content-ID: <29336.1578242867.1@jrobl>
Date: Mon, 06 Jan 2020 01:47:47 +0900
Message-ID: <29337.1578242867@jrobl>
X-Mailman-Approved-At: Tue, 07 Jan 2020 03:50:58 +0000
Subject: Re: [apparmor] How does ALIAS work?
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

Sm9obiBKb2hhbnNlbjoKPiBjdXJyZW50bHkgaXQgd29ya3MgcG9vcmx5LiBXaGF0IGl0IGRvZXMg
aXQgcnVsZSByZXdyaXRpbmcgc28gdGhhdAo+IHRoZSBsZWFkaW5nIGVsZW1lbnRzIG9mIGEgcnVs
ZSAic2hvdWxkIiBiZSByZXBsYWNlZC4KCTo6Ogo+IEl0IGlzIHBvc3NpYmxlIHRvIGZpeCB0aGlz
LCBzbyB0aGF0IHRoZSBjb21waWxlciBjYW4gZG8gdGhlIHJld3JpdGUKPiBhZ2FpbnN0IHRoZSBn
ZW5lcmF0ZWQgc3RhdGUgbWFjaGluZS4gVGhpcyBoYXMgZXZlbiBiZWVuIHByb3RvdHlwZWQKPiBi
dXQgaXMgY3VycmVudGx5IGJ1Z2d5IGFuZCBuZWVkcyBhIGxvdCBtb3JlIHdvcmsgYmVmb3JlIHdl
IGNhbiBsYW5kCj4gaXQuCgpUaGFuayB5b3UgZm9yIHRoZSByZXBseS4KQnV0IEkgc3RpbGwgZG9u
J3QgZ2V0IGl0LiAgRG8geW91IG1lYW4gdGhhdAo+ID4gLSBhZGQgYW4gYWxpYXMgcnVsZSAiYWxp
YXMgLyAtPiAvdG1wLywiCmluIG15IHRlc3Qgc2NyaXB0IChhdHRhY2hlZCB0byBwcmV2aW91cyBt
YWlsKSBkb2Vzbid0IHdvcmsgYXQgYWxsPyAgQW5kCml0IHdvbid0IGJlIGZpeGVkIGVhc2lseT8K
Q291bGQgeW91IHRyeSByZXByb2R1Y2luZyB0aGUgcHJvYmxlbSBieSBteSB0ZXN0IHNjcmlwdCBp
ZiB5b3UgaGF2ZSBub3QKdHJpZWQ/CgoKSi4gUi4gT2thamltYQoKLS0gCkFwcEFybW9yIG1haWxp
bmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5ncyBvciB1bnN1
YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlzdGluZm8vYXBw
YXJtb3IK

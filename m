Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0163A724C
	for <lists+apparmor@lfdr.de>; Tue, 15 Jun 2021 01:03:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lsvbe-00067I-J6; Mon, 14 Jun 2021 23:02:58 +0000
Received: from mail-lj1-f177.google.com ([209.85.208.177])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1lsvbb-00067B-Gf
 for apparmor@lists.ubuntu.com; Mon, 14 Jun 2021 23:02:55 +0000
Received: by mail-lj1-f177.google.com with SMTP id 131so22363705ljj.3
 for <apparmor@lists.ubuntu.com>; Mon, 14 Jun 2021 16:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=ICoXU6/lWjhUYEJmxma5HgL7G655jntzBZX07aBZOLA=;
 b=gJetSSXgzDU++3pulH+HbSUL/ASIX3J0ybpIrUb6Ay9cM34ZiFqIkUXaeQ5uTcIH1y
 SC/ElxEsB274+GVJojbR7Tl8VXurEVq7v7+PZeYoOqfwWG6GwAVFVEuPUo+ngasykGEG
 Cm4Fi0Z6mlojB19PRBeBFPBEzcImuGtB5feTRH1D52nbF4CW2RNhMbU8yxRJQngq5Lfv
 No6yIwVSdRWxIez2zRLnNOciV5FR3bbtL43G28Adl5hj4W9527rIncOoXye1mUkt7d11
 AzrpaJ9kyrcrhKZsiQD0GD9F0pfRbOkw1aOONpcgFF2XDiWogscDXbjtJTpAcr+NYIMA
 aR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ICoXU6/lWjhUYEJmxma5HgL7G655jntzBZX07aBZOLA=;
 b=WAdkSpdd/kjAvIEaiOWvTHnFKs5vxbctHcH6pZN57VNsmhwORZu5maCF8n3WH++crj
 C4fH2QYcvisVRZ5NIoKB5iYK2hdz48lzyKbEtcxhuxh1mIPaVNHYJ53eHVv4xMfnswPG
 zRkPz5YB3W18PFRm5+co3AolRLN1MpC8L34HYtDgrHZ2piF3VAPyttETlWVCZub3J9ge
 87HyeCulSCW/5I5v03Freq05eod7GciOz7WY1VP/3wbbp4duCmggntTwvvhVmqcsxbKl
 bwBhRWU9Fk5AH+gwN6kPE/Wx7BdTsL1LCfnGnaFATQh4AUN86Vxm+vdbsJRPA0a7NW/G
 20zQ==
X-Gm-Message-State: AOAM530wHaCC3LnC+aqu4eOWq/NJ/39Rnd+stWZ1lih/4cNEWpNG2VOq
 b3cc9fprtOW1PfJHggQgStb8cl2QoSGOOEbARNqUn61YRMw=
X-Google-Smtp-Source: ABdhPJyzY6rbtOcJXlQxdq35i6IOloiB+Ugr/NyOr8ROrBDikI0fELLprnnE6LOeVQyVycYsROdFpS75u9/hvVQC94g=
X-Received: by 2002:a2e:5047:: with SMTP id v7mr15239260ljd.510.1623711774441; 
 Mon, 14 Jun 2021 16:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAODFaZ7Th4AxW0kdavbnNdq6+U+vNyytSm1rU5SrA1ah+BZ0+g@mail.gmail.com>
 <f438b235-da3c-86f9-a847-e60b84023ab1@schaufler-ca.com>
In-Reply-To: <f438b235-da3c-86f9-a847-e60b84023ab1@schaufler-ca.com>
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Tue, 15 Jun 2021 04:32:42 +0530
Message-ID: <CAODFaZ7YTmYuTB=QAjXevfnE=di8yqKtVK-nvTCyjhUAQRGvTA@mail.gmail.com>
To: Casey Schaufler <casey@schaufler-ca.com>, apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.208.177;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lj1-f177.google.com
Subject: Re: [apparmor] When DAC fails/invokes Apparmor Hooks with example
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

SGkgQ2FzZXksCgpJIGFtIHRyeWluZyB0byB1bmRlcnN0YW5kIHRoYXQgb25jZSBhIERBQyBjaGVj
ayBwYXNzZXMsIGl0IHdpbGwgaW52b2tlCkFwcGFybW9yIGxvZ3MuCkkgbG9hZGVkIHRoaXMgc2Ny
aXB0IHdpdGggYW4gZW1wdHkgcHJvZmlsZSBpbiBjb21wbGlhbnQgbW9kZSB0bwpjYXB0dXJlIEFw
cGFybW9yIGxvZ3MuCgpBcyBtZW50aW9uZWQsIEkgY291bGQgbm90IHNlZSBBcHBhcm1vciBsb2dz
LiBEbyBJIG5lZWQgdG8gY2hhbmdlCmFueXRoaW5nIGluIHRoZSBzY3JpcHQgdG8gaW52b2tlIEFw
cGFybW9yL0xTTSBob29rcyB0byBjb2xsZWN0CkFwcGFybW9yIGxvZ3MuCgpUaGFua3MKTXVyYWxp
LlMKCk9uIFR1ZSwgSnVuIDE1LCAyMDIxIGF0IDQ6MjQgQU0gQ2FzZXkgU2NoYXVmbGVyIDxjYXNl
eUBzY2hhdWZsZXItY2EuY29tPiB3cm90ZToKPgo+IE9uIDYvMTQvMjAyMSAzOjQ1IFBNLCBNdXJh
bGkgU2VsdmFyYWogd3JvdGU6Cj4gPiBIaSBBbGwsCj4gPgo+ID4gSW4gZ2VuZXJhbCwgQXBwYXJt
b3IgaG9va3Mgd2lsbCBiZSBjYWxsZWQgYWZ0ZXIgREFDIGNoZWNrL3ZhbGlkYXRpb24uCj4gPiBJ
IHdvdWxkIGxpa2UgdG8gdW5kZXJzdGFuZCB0aGUgdGhlb3J5IGJ5IHdyaXRpbmcgaW50byBhIHNh
bXBsZSBzY3JpcHQKPiA+IGFzIGZvbGxvd3MuCj4gPgo+ID4gQ3JlYXRlZCBhbiBlbXB0eSBwcm9m
aWxlIGZvciB0aGlzIGRlbW8uc2ggaW4gY29tcGxhaW4gbW9kZSB0byB1bmRlcnN0YW5kIHdoYXQK
PiA+IHRoZSBvcGVyYXRpb24gaGFzIGJlZW4gZG9uZSBhcyBwYXJ0IG9mIHRoZSBzY3JpcHQuCj4g
Pgo+ID4gSG93ZXZlciwgSSBjb3VsZCBub3Qgc2VlIGFueSBhcHBhcm1vciBsb2dzIChjb21wbGFp
bnQgbW9kZSBsb2dzCj4gPiBBTExPV0VEKSBmb3IgdGhpcyBzY3JpcHQgcHJvZmlsZS4KPiA+IENh
biB5b3UgcGxlYXNlIHN1Z2dlc3Qgd2hhdCBjaGFuZ2VzIG5lZWQgdG8gYmUgZG9uZSBpbiB0aGUg
c2NyaXB0IGluCj4gPiBvcmRlciB0byByZWFjaCBBcHBhcm1vciBob29rcwo+ID4gdG8gZ2V0IHRo
ZSBBcHBhcm1vciBsb2dzLgo+ID4KPiA+IEFsc28sIHBscyBhZHZpc2UgbWUgb24gaG93IHRvIGZp
bmQgd2hlbiBEQUMgd291bGQgYmUgZmFpbGVkL0RBQyBnaXZlbgo+ID4gZGV0YWlscyB0byBBcHBh
cm1vciBob29rcy4KPiA+IFBscyBzaGFyZSBhbnkgZWFzeSByZWZlcmVuY2UgY29kZSBvciBzYW1w
bGUgY29kZSBmb3IgdW5kZXJzdGFuZGluZy4KPiA+Cj4gPiAjIS9iaW4vYmFzaAo+ID4gd2hpbGUg
WyAxIF0gOyBkbwo+ID4gZWNobyAtbiAiSG93IEFwcGFybW9yIGNhbGxlZCBhZnRlciBEQUMiCj4g
PiBjYXQgL3Byb2Mvc2VsZi9hdHRyL2N1cnJlbnQKPiA+IGtpbGwgLTExIDEKPiA+IGlwdGFibGVz
IC0tbGlzdAo+ID4gcGluZyA4LjguOC44Cj4gPiBzbGVlcCA2MAo+ID4gZG9uZQo+Cj4gV2hhdCBk
byB5b3UgZXhwZWN0IHRoaXMgc2NyaXB0IHRvIGRvPwo+Cj4gPgo+ID4gVGhhbmtzCj4gPiBNdXJh
bGkuUwo+ID4KCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1
LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1
bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

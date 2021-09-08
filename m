Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE77403BB4
	for <lists+apparmor@lfdr.de>; Wed,  8 Sep 2021 16:43:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mNynY-0008TX-QA; Wed, 08 Sep 2021 14:43:36 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <georgia.garcia@canonical.com>) id 1mNynW-0008TL-FT
 for apparmor@lists.ubuntu.com; Wed, 08 Sep 2021 14:43:34 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4F5B33F30F
 for <apparmor@lists.ubuntu.com>; Wed,  8 Sep 2021 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631112214;
 bh=S90iFtOg63972/gVuRT1O7sLnZLonYFMzyzlOsE5yek=;
 h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
 Content-Type:MIME-Version;
 b=P6ERDrWd1OPwPmot/M73lAD4LyahwiiKoqrhUNngLI0TnZOiqoRTx10s6gPY4dxkt
 dmVq7/KhQcd8KI6ZAGJynL41c2SpriiF8FTXsxTKUbyOc/ue5ZN6LRfzVusmxUciW2
 yeODpMrnLUzrLwGxI8tvHNMRls7sdMLSUblpebXYs7GHGQFm5yIihlooRXywe5MnNO
 mlfu1OhK3tD+9pJKIbsnW9Zodj42AVGayxt6aRySgKhkR1TMTcJwX/Xs9+lNvO9G19
 o/kQuy0xAW9M6GWCEB+9WOULBIzRCGJqI5bFvMgAC2PjxecSm4XEX0YjCIwvOLB0yu
 /r/SXI/NkjKwQ==
Received: by mail-ej1-f70.google.com with SMTP id
 jw25-20020a17090776b900b005ca775a2a00so1129114ejc.1
 for <apparmor@lists.ubuntu.com>; Wed, 08 Sep 2021 07:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=S90iFtOg63972/gVuRT1O7sLnZLonYFMzyzlOsE5yek=;
 b=w3FoiyIKby/q8xsGKPgTdRRTjTnX15DtHXPB1I0ZCDuzsvA+1Jj3BxchPLTGpC+UUu
 5i49H+ILRrEA9mWzZbKOZOXYWJLTJxW2qIEP9i6P/jnfpWvvIaUo7P/x5LlnvFMhX2Es
 ajmO096LvN8V1MwwLq7GHRJ0R94mxh2qm1j8QtdhKreYFjwy6qwDesiWT+lK0/GDjx9p
 GXw+nrecHMeeFj+KZVGcy0kkOyajFc+Bf7hgCTwCtLC364axAB+UsVWIFJfA5G+igSNF
 nHAEqiyaGk5nGpIia5y4sc/H9ciwxGF2ugj3YpoTFRp1pZ7LRj5zFHIFXYiDJKl904Bz
 kZxg==
X-Gm-Message-State: AOAM533H5YxZvCNdr3PT0VENcfqz0HFRD9HREUKkSxE9ZO6AQAeCuz3f
 P/yJw/HO85c7cyh0EwdRQjOWTgpWty/d7N1fKlXj8JTQMWeW2ahoaRp3ehytwg6o86LEcOkBMoM
 jlkQYifxNe4qvq6tgf0TnEyYKkhlrSDsrNl913g==
X-Received: by 2002:a17:906:4346:: with SMTP id
 z6mr180582ejm.403.1631112213618; 
 Wed, 08 Sep 2021 07:43:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxinydwdmu+uTB5zd3+1Zn1kmepoCZBXeuSzSFiD4+MtTRxUHdFLy+s4jA4HQAN9BgoHSKD9A==
X-Received: by 2002:a17:906:4346:: with SMTP id
 z6mr180559ejm.403.1631112213412; 
 Wed, 08 Sep 2021 07:43:33 -0700 (PDT)
Received: from georgia ([2001:67c:1562:8007::aac:4557])
 by smtp.gmail.com with ESMTPSA id dc7sm1314527edb.46.2021.09.08.07.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 07:43:33 -0700 (PDT)
Message-ID: <50482a0b0f141f0f363baa121410c8b59c50470e.camel@canonical.com>
From: Georgia Garcia <georgia.garcia@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Wed, 08 Sep 2021 11:43:27 -0300
In-Reply-To: <20210904020732.GA4049275@millbarge>
References: <20210903213149.92758-1-georgia.garcia@canonical.com>
 <20210904020732.GA4049275@millbarge>
Organization: Canonical
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Subject: Re: [apparmor] [PATCH v2] apparmor: enable raw text policy
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
Cc: Seth Arnold <seth.arnold@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

T24gU2F0LCAyMDIxLTA5LTA0IGF0IDAyOjA3ICswMDAwLCBTZXRoIEFybm9sZCB3cm90ZToKPiBP
biBGcmksIFNlcCAwMywgMjAyMSBhdCAwNjozMTo0OVBNIC0wMzAwLCBHZW9yZ2lhIEdhcmNpYSB3
cm90ZToKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyByYXd0ZXh0X2Zv
cHMgPSB7Cj4gPiArCS5vcGVuID0gcmF3ZGF0YV9vcGVuLAo+ID4gKwkucmVhZCA9IHJhd3RleHRf
cmVhZCwKPiA+ICsJLmxsc2VlayA9IGdlbmVyaWNfZmlsZV9sbHNlZWssCj4gPiArCS5yZWxlYXNl
ID0gcmF3ZGF0YV9yZWxlYXNlLAo+ID4gK307Cj4gCj4gSGV5IEdlb3JnaWEsIEknbSBjdXJpb3Vz
IGlmIHRoZSByYXdkYXRhX29wZW4gYW5kIHJhd2RhdGFfcmVsZWFzZSBoZXJlIGFyZQo+IGNvcnJl
Y3QuIElmIHRoZXkgYXJlIGNvcnJlY3QsIGlzIHRoZXJlIGFueSBwcm9ibGVtIGlmIHRoZSBzYW1l
IHByb2Nlc3MKPiBvcGVucyBib3RoIHRoZSByYXdfdGV4dCBhbmQgdGhlIHJhd19kYXRhIGZpbGVz
PyBJcyB0aGVyZSBhbnkgcHJvYmxlbSBpZgo+IHR3byBvciBtb3JlIHByb2Nlc3NlcyBvcGVuIGJv
dGggcmF3X3RleHQgYW5kIHJhd19kYXRhPwo+IAo+IFRoYW5rcwoKSGkgU2V0aCwKCldoZW4gcmF3
ZGF0YV9vcGVuIGlzIGNhbGxlZCwgd2UgaW5jcmVhc2UgdGhlIHJlZmNvdW50IGZvciBsb2FkZGF0
YSBhbmQKZGVjcmVhc2UgaXQgZm9yIHJhd2RhdGFfcmVsZWFzZS4gVGhlIHJlc3VsdCBvZiB0aGUg
ZGVjb21wcmVzc2lvbiBpcwpzdG9yZWQgaW50byBhIG5ldyB2YXJpYWJsZSAocHJpdmF0ZSksIGFu
ZCBub3QgbG9hZGRhdGEgZGlyZWN0bHkuIAoKU28gd2hlbiB0aGVyZSdzIGEgY2FsbCBmb3IgcmF3
X2RhdGEgYW5kIHJhd190ZXh0IGJ5IHRoZSBzYW1lIHByb2Nlc3MsCnRoZSByZWZjb3VudCB3aWxs
IGJlIGluY3JlYXNlZCB0d2ljZSBhbmQgbG9hZGRhdGEgd2lsbCBiZSBkZWNvbXByZXNzZWQKdHdp
Y2UgaGF2aW5nIHRoZSByZXN1bHQgaW4gdHdvIGRpZmZlcmVudCBwcml2YXRlIHZhcmlhYmxlcy4g
VGhhdAphcHBsaWVzIGZvciB0d28gb3IgbW9yZSBwcm9jZXNzZXMgYXMgd2VsbC4KCkp1c3QgdG8g
YmUgc3VyZSwgSSB0ZXN0ZWQgdGhlc2Ugc2NlbmFyaW9zIGFuZCBpdCB3b3JrZWQgYXMgZXhwZWN0
ZWQuCgpJJ20gbm90IHN1cmUgaWYgdGhhdCdzIHRoZSBpc3N1ZXMgeW91IHdlcmUgY29uY2VybmVk
IGFib3V0IGFuZCBpZiBJCm1hZGUgbXlzZWxmIGNsZWFyLCBzbyBwbGVhc2UgbGV0IG1lIGtub3cu
IEkgY291bGQgYmUgbWlzc2luZyBzb21ldGhpbmcKdG9vIDopCgpUaGFua3MsCkdlb3JnaWEKCgot
LSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5
IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFp
bG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

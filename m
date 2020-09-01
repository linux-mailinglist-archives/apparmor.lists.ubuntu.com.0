Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2EA2585AB
	for <lists+apparmor@lfdr.de>; Tue,  1 Sep 2020 04:35:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kCw8T-0004Cj-Ue; Tue, 01 Sep 2020 02:35:01 +0000
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <sswarnas@gmail.com>) id 1kCw8R-0004Bo-LS
 for apparmor@lists.ubuntu.com; Tue, 01 Sep 2020 02:34:59 +0000
Received: by mail-pf1-f195.google.com with SMTP id k15so1800332pfc.12
 for <apparmor@lists.ubuntu.com>; Mon, 31 Aug 2020 19:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rb1/0AE5rrI44ibHQTu+F4oTTpoKgKyTw2l6th1inB4=;
 b=Xht3qpax8VRy/BQ6LnDlVYG8qQjofVxk6Qgg8a+E98CCNpC+Jfq7pHqEwvOOe1epIl
 5Mev6rEe2wPkiSRbcYF0uDIIMSe8xO8iPeEDSfqz59QOBw5Q4jBW+ELD8LvpgLYkweer
 BNoiqm+2Y0rN89hEUq5+Mb0AErQ6kZXSBl/nHAD081+agLykCrl7+v7mYVpya4kRKHWw
 T/b9Su7e7qQVRFHgClu/3jGKY07MP1I+3ueve9fS9bK7mL1+8gjwsW0bEmeGWlS+2tzJ
 r8vZF6p+4hWaFS8m6na4z53M5b22HWKaxLjJZF4p25e0h3XvhnGAvGmc3F5OVTH69juz
 Zqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rb1/0AE5rrI44ibHQTu+F4oTTpoKgKyTw2l6th1inB4=;
 b=Tbp9OC8GFhwNErEztYxpgnUwFKrPl7R8vN5SXLW6mO8MjpDnZUexpRnXnvVqFbEbPj
 YQmC3ciIbYZ70AvWgjYElggLOI/dxioVJDRyl+4Ilypuo88WvWXv2npoUQkcElO10pSn
 87MmPP4QAyulxytsBZ3+r/HstHHpL5qcfp5wvxRMBjZRxqbiXFzLRSLtQYjlxEn6PeWk
 6+wQu0OQiZ2So1Eoa4oErDtEZIIz805oe8XkRgH1mXdA4oDQqP/5WDXmQYTFUmX9bWzp
 LxCFTKK1zSKyvz2H8Uo35JzeR2sXXu8+fCf39cJp7LA7CXxEPtxxAEzwkPgNysbyvsYd
 WTpg==
X-Gm-Message-State: AOAM531Z2qs7Wa+6HGlyoBu6NS7x20kK9uNRsZaeNgs/nhhqJc7oKe+J
 OukW5IusAPYXKZYJeIKYxyc9pq3qHnUQG17m3H8=
X-Google-Smtp-Source: ABdhPJzdttKQ9rW3Dg6iIgPaEYyY9NU3fsyQhpjZX43+vFWXwFi309sWsUYSIGhHwkyDAEJxWuJUkBnyUsb0iQtPl6k=
X-Received: by 2002:a65:6119:: with SMTP id z25mr3829005pgu.52.1598927697412; 
 Mon, 31 Aug 2020 19:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAJs3c4ymSpu5esJ2BV4YGLxuug-OLsMOqite02qKgWS4HSFDNA@mail.gmail.com>
 <20200901012007.GA2884930@millbarge>
In-Reply-To: <20200901012007.GA2884930@millbarge>
From: swarna latha <sswarnas@gmail.com>
Date: Mon, 31 Aug 2020 22:34:46 -0400
Message-ID: <CAJs3c4yASMzrZ40dAsZN7q3BTbDa+M+cpbVqFCzQG8pwaz027w@mail.gmail.com>
To: Seth Arnold <seth.arnold@canonical.com>
Received-SPF: pass client-ip=209.85.210.195; envelope-from=sswarnas@gmail.com;
 helo=mail-pf1-f195.google.com
Subject: Re: [apparmor] Apparmor profile enforce issue,
 when changing from root to non-root
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
Content-Type: multipart/mixed; boundary="===============3117698014278100004=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============3117698014278100004==
Content-Type: multipart/alternative; boundary="0000000000006d05ba05ae375dd3"

--0000000000006d05ba05ae375dd3
Content-Type: text/plain; charset="UTF-8"

Hi Seth,

I am getting the complete set of libraries used by my process with status=
AUDIT, right from /etc/ld.so.cache. It looks to me as though the profile is
not applied, though i have rules allowing the /etc/ld.so cache access.

As i have these file entries in my profile, i am not getting
ALLOWED/DENIED, hence not able to regenerate the profile with these events.

Thanks,
Swarna

On Mon, Aug 31, 2020 at 9:20 PM Seth Arnold <seth.arnold@canonical.com>
wrote:

> On Mon, Aug 31, 2020 at 08:25:26PM -0400, swarna latha wrote:
> > For non-root mode, tried to add the capabilities manually, all the 36
> > capabilities it did not work. But if i add the capability, (which is to
> > grant all capabilities, the last one highlighted below) the process
> starts.
>
> What messages do you get in dmesg or audit logs when you run your service
> without the 'capability,' line?
>
> Thanks
>

--0000000000006d05ba05ae375dd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Seth,<div><br></div><div>I am getting the complete set =
of libraries used by my process with status=3D AUDIT, right from /etc/ld.so=
.cache. It looks to me as though the profile is not applied, though i have =
rules allowing the /etc/ld.so cache access.</div><div><br></div><div>As i h=
ave these file entries in my profile, i am not getting ALLOWED/DENIED, henc=
e not able to regenerate=C2=A0the profile with these events.</div><div><br>=
</div><div>Thanks,</div><div>Swarna</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 31, 2020 at 9:20 PM Se=
th Arnold &lt;<a href=3D"mailto:seth.arnold@canonical.com">seth.arnold@cano=
nical.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Mon, Aug 31, 2020 at 08:25:26PM -0400, swarna latha wrote:<br=
>
&gt; For non-root mode, tried to add the capabilities manually, all the 36<=
br>
&gt; capabilities it did not work. But if i add the capability, (which is t=
o<br>
&gt; grant all capabilities, the last one highlighted below) the process st=
arts.<br>
<br>
What messages do you get in dmesg or audit logs when you run your service<b=
r>
without the &#39;capability,&#39; line?<br>
<br>
Thanks<br>
</blockquote></div>

--0000000000006d05ba05ae375dd3--


--===============3117698014278100004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============3117698014278100004==--


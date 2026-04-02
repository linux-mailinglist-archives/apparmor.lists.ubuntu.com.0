Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kITGLvVU1Wkf4wcAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 07 Apr 2026 21:03:17 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 771053B3249
	for <lists+apparmor@lfdr.de>; Tue, 07 Apr 2026 21:03:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wABFC-0003z4-Sy; Tue, 07 Apr 2026 18:33:46 +0000
Received: from mail-dy1-f228.google.com ([74.125.82.228])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2)
 (envelope-from <keerthana.kalyanasundaram@broadcom.com>)
 id 1w8D2D-00011S-Ba
 for apparmor@lists.ubuntu.com; Thu, 02 Apr 2026 08:04:13 +0000
Received: by mail-dy1-f228.google.com with SMTP id
 5a478bee46e88-2bd5658b901so25825eec.3
 for <apparmor@lists.ubuntu.com>; Thu, 02 Apr 2026 01:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775117051; x=1775721851;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d7nijzjXaDNnCsKy/v97Lx2OqkfM3F14N1yvXZbxdLc=;
 b=SPxEUj2n9m9hB/cefq1dL0tvHEMWi5HcQcHQiQcuFGjdHmke3PhhrfNocXXS8TMUmR
 J5GYIHLOhk1GcynhyEBCJvtVdhoq3dRt9OjMW/z2tg0u7nnWtpUhgnHNEiVzOkFvaWsE
 WTSluL+hpT9R6/sLlYxpE5QOY0u1yiHN80Zr6selJtK/p4vUwyCWPPYj9XJbUqH4B5Ja
 XrJAl7RdDPvtMeeBpPTKGYbeH4VjqnakAVRjEmwnGksDK47drkdVlNyyvnZIs3QIRcTn
 ie1Lv6WBWh5/K2vb2jlB2d08zlOnLd29y2HTajCO+zccbosUyMwW+Hv+vo+oNrBWWsr5
 Lj3Q==
X-Forwarded-Encrypted: i=2;
 AJvYcCU8P6vDDrBQr/QDeV5X0ndjs1oYpv0ZW87f0+LII1K6JqI+PYtkSKK7qc3jD6XU3CrYhPwZOaFIYQ==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yycmq9TFU6Ue37xg8DWQ6STlOJAsSElLARNZydrMksgwz83dOTG
 c1YU7gSLq5Hdh3JKlVROI8aFDtM0g61rfdVRQqvsAgZ0n+figghdeD6AqjKLFL1Nu3GKWh2Cu4O
 tdkKYSmz81+Xuie5d4LV4px1YRmDKO6+1+fwdLCtd6O2SOWYg6QaRDiH45m9DgV7saZzMQzvyp3
 VXn8Rh5BPNVjavj0Ag3PXiPlsImIb+M0WMeN8CHsQVb6vgI1QjC0VRw756hjwSY6c0Mnn+DWdtM
 tofL4EyugxC3crJpgPy9yO9rOJgkW+AHKM=
X-Gm-Gg: ATEYQzwZX15nJAYH0S+50wNAvZ6oF6pWZGyPHAwR3kIeV2Hu256BmvHuczUsNW484y9
 sOFxY/XFx9hCLkTiDy1v2j5B23jQ7JS3SYRQt2FXmij0eznKMtLObkLf8QYXrZMLWaAZF6yYWaQ
 zTxMzlK+CLYIWS5UZ0DJ/LJhtTYcCmGJLwOk5V94ulcWKbrrrlj5atruA4V6yZK6wufGZ936MIg
 QOyCWk5wlmTZU5C+whdD2bIUw34i3v/uy8/bd0p9eXBBpsS9SsMvccQ+Y3nY1dBRQ+l5X3/qqTX
 lhVEM5FENGwbMBxRNBV+h5NBS9D1FhtdwFedNgY9/cfeZOVCiwtHVcBAieJmVeBk5z9m/E+kYdI
 6Ppvp7GEz0o0TKsIaZQTwWwnxQ/FfoLW8gmUuadqwqbWlQZxVR4o98p9LIKC/8E+qsf3nWcZFWh
 J073xUk+cvbxJ0SDQdDTk5OHfOnOXdZpkK9uhYwZ9+3waZH7i1YzFTwCLC1JHDC1yVTCOG0RZHR
 A==
X-Received: by 2002:a05:7301:615:b0:2c5:7e02:4bf0 with SMTP id
 5a478bee46e88-2c932bab6dfmr1438086eec.8.1775117050475; 
 Thu, 02 Apr 2026 01:04:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-15.dlp.protect.broadcom.com. [144.49.247.15])
 by smtp-relay.gmail.com with ESMTPS id
 5a478bee46e88-2ca7bf03ec3sm153141eec.24.2026.04.02.01.04.08
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Apr 2026 01:04:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-b9c12943cebso1267766b.2
 for <apparmor@lists.ubuntu.com>; Thu, 02 Apr 2026 01:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775117047; cv=none;
 d=google.com; s=arc-20240605;
 b=VFq+00ZVPsWfe6gypudGtk5Tw4FileNEH9hlNCrvU8G6yDD/Akv916If6xyGqyVSZe
 k31+b5ujuoAd3hh/5J8577dQMj+edZnQDwC3Zez4jqhNgaQgAQX0akk/FKX/NtazGm3Y
 XXWfUc3BqVXvKDlPC/Kk6ZZgjYeeCacK1U4QdIKCw6In/GT92OL4vY1iDa8a1DcECvnf
 iL+R0FZIlfTg9HA8Fxhco46+0+QWyx5nNj0XQpWJ04O+RfvmBZqsY2bOH0NZq2/ss60P
 de6zXlvvI2iGBsLKXF7cTY85izmTgz2xoli0eBpgShFdG6D8GPzRczu4k57L3NheSiCX
 xX6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=d7nijzjXaDNnCsKy/v97Lx2OqkfM3F14N1yvXZbxdLc=;
 fh=isGEYyj4MDvvhaOOPKKeBZCXLLZNGAZVI9+iy9KegvY=;
 b=I+sG768WHvRddxuC4mMBzVVeumKweFYIuLbfF6D8ZDgbkjzGNZUEkG+c1hb7arumXS
 YVXeTh7gdHR+Af+hgACAiedw+ftcrEeJM+aHaon/wMPxHS/rl/bjw91iVGXELWcUOo7C
 ogGIvJx6w3V+omuBmnFktsIQ5f+YolGqxHcoN+7aLFvhS09CuUfrK7OB1UE92KKGZMg8
 e1hj19E29g6TLQsSn3BNm5/R891hszMQ6PRVA9zNGFRY6Bat8EicU6cnHnd7R1XRvcdy
 zLVu0u2umrFWTzbWMyFZWNOlfTEbhXKCXy3iCLpPd7xxzio9D+CVxjJIQWH1u9VK7vyf
 rjlQ==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1775117047; x=1775721847; darn=lists.ubuntu.com;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d7nijzjXaDNnCsKy/v97Lx2OqkfM3F14N1yvXZbxdLc=;
 b=KpSsR8OYtOtD+fIaY/N1sPpcucimCRJEFKhrFMfyPvS/VRIK1/fqLsZpAHTvOctLOW
 YE0AW1xVjZZmMwwIAbtO7S6C0TLy1+ULmIaeRHPazwFlTJh0G68/769eAr5wsJtKeWin
 e8wE4tjqOz9u6wvKSgp4aHomjJWcVGaz1GIes=
X-Forwarded-Encrypted: i=1;
 AJvYcCWYTF2gb55w6AqAYTKNZsTflAjffp/qOcZgMtQ0l7ixP1aeyHxy05zEddYa/xgO+5+EajoGTm9YnQ==@lists.ubuntu.com
X-Received: by 2002:a05:6402:1471:b0:669:cbd2:255f with SMTP id
 4fb4d7f45d1cf-66daf429735mr1738412a12.0.1775117047004; 
 Thu, 02 Apr 2026 01:04:07 -0700 (PDT)
X-Received: by 2002:a05:6402:1471:b0:669:cbd2:255f with SMTP id
 4fb4d7f45d1cf-66daf429735mr1738395a12.0.1775117046408; Thu, 02 Apr 2026
 01:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260402054700.2798707-1-keerthana.kalyanasundaram@broadcom.com>
 <2026040249-fable-sasquatch-4864@gregkh>
In-Reply-To: <2026040249-fable-sasquatch-4864@gregkh>
From: Keerthana Kalyanasundaram <keerthana.kalyanasundaram@broadcom.com>
Date: Thu, 2 Apr 2026 13:33:53 +0530
X-Gm-Features: AQROBzC1l89xjx-SwbO4Ed504ZoHRVoiKpM_Bu_SvADGU2RpJo0ZqqhjPoiJG-M
Message-ID: <CAM8uoQ8z6oUBi20uRPrn=xuX05aHp7Pf26Q_R88scCmQ4Ma+=Q@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000000d8e3a064e75a507"
Received-SPF: pass client-ip=74.125.82.228;
 envelope-from=keerthana.kalyanasundaram@broadcom.com;
 helo=mail-dy1-f228.google.com
X-Mailman-Approved-At: Tue, 07 Apr 2026 18:33:45 +0000
Subject: Re: [apparmor] [PATCH v6.1] apparmor: fix unprivileged local user
 can do privileged policy management
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
Cc: sashal@kernel.org, ajay.kaher@broadcom.com, paul@paul-moore.com,
 Salvatore Bonaccorso <carnil@debian.org>,
 Qualys Security Advisory <qsa@qualys.com>, linux-kernel@vger.kernel.org,
 apparmor@lists.ubuntu.com, jmorris@namei.org, stable@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 vamsi-krishna.brahmajosyula@broadcom.com, alexey.makhalov@broadcom.com,
 tapas.kundu@broadcom.com, yin.ding@broadcom.com, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.99 / 15.00];
	DMARC_POLICY_REJECT(2.00)[broadcom.com : SPF not aligned (relaxed),reject];
	SIGNED_SMIME(-2.00)[];
	DATE_IN_PAST(1.00)[130];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[broadcom.com:s=google];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[keerthana.kalyanasundaram@broadcom.com,apparmor-bounces@lists.ubuntu.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:sashal@kernel.org,m:ajay.kaher@broadcom.com,m:paul@paul-moore.com,m:carnil@debian.org,m:qsa@qualys.com,m:linux-kernel@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:stable@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:vamsi-krishna.brahmajosyula@broadcom.com,m:alexey.makhalov@broadcom.com,m:tapas.kundu@broadcom.com,m:yin.ding@broadcom.com,m:serge@hallyn.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[broadcom.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:~];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[keerthana.kalyanasundaram@broadcom.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.599];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,mail.gmail.com:mid];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MISSING_XM_UA(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 771053B3249
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--0000000000000d8e3a064e75a507
Content-Type: multipart/alternative; boundary="000000000000fcf20a064e75a474"

--000000000000fcf20a064e75a474
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 11:31=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:

> On Thu, Apr 02, 2026 at 05:47:00AM +0000, Keerthana K wrote:
> > From: John Johansen <john.johansen@canonical.com>
> >
> > commit 6601e13e82841879406bf9f369032656f441a425 upstream.
>
> <snip>
>
> Does your group/company/whatever actually use apparmor?  If so, this
> isn't the only commit that needs to be backported.  I'm waiting on a
> "correct" set of 6.1.y patches from John before applying all of them to
> 6.1.y and then I can take the patch series that he gave me for 5.10.y
> and 5.15.y and will queue them up.
>
> So thanks for this backport, but it's not going to help resolve all of
> the recent fixes that went in as part of this series by just applying
> one of them.
>
> Thanks for the update, Greg. We will wait for John to queue and apply the
complete series of patches to the stable branches.

 thanks,
>
> greg k-h
>

--000000000000fcf20a064e75a474
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><br></div></div><div class=3D"gmail_=
quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
Apr 2, 2026 at 11:31=E2=80=AFAM Greg KH &lt;<a href=3D"mailto:gregkh@linuxf=
oundation.org">gregkh@linuxfoundation.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Thu, Apr 02, 2026 at 05:47:00AM=
 +0000, Keerthana K wrote:<br>
&gt; From: John Johansen &lt;<a href=3D"mailto:john.johansen@canonical.com"=
 target=3D"_blank">john.johansen@canonical.com</a>&gt;<br>
&gt; <br>
&gt; commit 6601e13e82841879406bf9f369032656f441a425 upstream.<br>
<br>
&lt;snip&gt;<br>
<br>
Does your group/company/whatever actually use apparmor?=C2=A0 If so, this<b=
r>
isn&#39;t the only commit that needs to be backported.=C2=A0 I&#39;m waitin=
g on a<br>
&quot;correct&quot; set of 6.1.y patches from John before applying all of t=
hem to<br>
6.1.y and then I can take the patch series that he gave me for 5.10.y<br>
and 5.15.y and will queue them up.<br>
<br>
So thanks for this backport, but it&#39;s not going to help resolve all of<=
br>
the recent fixes that went in as part of this series by just applying<br>
one of them.<br>
<br></blockquote><div><span class=3D"gmail_default" style=3D"font-family:ve=
rdana,sans-serif">Thanks for the update, Greg.=C2=A0</span><font face=3D"ve=
rdana, sans-serif">We will wait for John to queue and apply the complete se=
ries of patches to the stable branches.</font></div><p></p><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">=C2=A0thanks,<br>
<br>
greg k-h<br>
</blockquote></div></div>

--000000000000fcf20a064e75a474--

--0000000000000d8e3a064e75a507
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGhTCCBG2g
AwIBAgIMD+aKIot+px9krlZuMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI0MTEyODA2NDkyM1oXDTI2MTEyOTA2NDkyM1owgcMxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEWMBQGA1UEChMNQlJPQURDT00gSU5DLjEiMCAGA1UEAxMZS2VlcnRoYW5hIEthbHlhbmFz
dW5kYXJhbTE1MDMGCSqGSIb3DQEJARYma2VlcnRoYW5hLmthbHlhbmFzdW5kYXJhbUBicm9hZGNv
bS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCzJUx8cxWWLKOtWyrWjmxtNemY
IAZzJtBCZUu44YcV0VWRTEyy7ETgVKv+gsS31DMOAW6riOQk4Kq1NwaqGpWcNeN4lDbjYNgdsVd+
o9k4EYujmMl0cgM7K7hzNddW+Ay96MU9XKfPz2sgaaEg+yf7Lc4qEJAHoeB0ZjdbljIIRWD7Y/NA
zvboOGCqVTtK/MDNUbO3DM22mnISOsFdyh2D45TWDZTwu4xaGvcSWxLWmvKT/F8eOAs9WQstDJfq
Tmu6blTu87+GvJDl7ve1uoTZ2v8iJJgVmw4FHt60UKs2YygdJ0VyVdlGaqP2t1tRmfUlu7CGVl1p
CsZtHLW+HDLdAgMBAAGjggHnMIIB4zAOBgNVHQ8BAf8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGD
MEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2
c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1odHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9n
c2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJBgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgor
BgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9z
aXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWdu
LmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMDEGA1UdEQQqMCiBJmtlZXJ0aGFuYS5rYWx5YW5h
c3VuZGFyYW1AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQYMBaAFAAp
Np5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQHh8+7satHOJPcYL7AeQdvH3LpMDANBgkqhkiG
9w0BAQsFAAOCAgEAYWBk58l2FyT07DXkrrA2hlcTBcEZihWQx8/9g29moMSrBsNjKgfWEAXXBONl
VItnKxTO0LLFBDk0aORtQ77l8a5shNEChWVYr6HaQ4+yEzwgzGmYro7sX9H0WNhPYqGxkaOhvirw
pVpXqJuPEzKRu/cGLsd/0yta4ifC8tbv2NS+/0xF92mVwwFk/drV6gzbXet3UR0Oc4E8X6cuqker
//F6sqQvY8JqD4mfN+FYlRsJMJbaotK+vEh80P3H+DiIl5yMKVsV+IDp7lNqqEr8vp6x1Sd5+kqm
iw/P5dRLJ1fqzim8rqtJ/7qy6A7f9XW26mrfXgopzpH+PpyOWTNn+1WHE3Qsf56FygZkoyRkyNeg
LDRtQlfPVV4VzF2T4Isd4+38Ec+rpHUjh92yzjrf7FL1NWhk9Q7IEFNhX6Ss1VY+qawoyAwq3PCX
N38TFnsqQc+ulwWwKrr/UAidp1h/nDizvfesRK5Iy/qJ+ey9WDm2cuRgn9EKPN4hqc1KVeLWhMS5
2Q76mvXu00vebvmkm8gEOUWX/f/7sJ9OiTxEUFA914opWhBW681OZe8N3qTdG0WpE+Dwuz0tXpzB
QjeGoKexgsMfSRTmaxQT/YnlZiJPM3qfsvSl3wUoJ+GrMGtrszD3Ehg1jbcHkUM/n2fmYA4m1ObI
fGQEpn8e5I0CKl4xggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxT
aWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgwP5ooi
i36nH2SuVm4wDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEILoWo6leGIbbV8RbRxDS
wBmxNq3iVyqCm2LlUWsL4UO4MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkF
MQ8XDTI2MDQwMjA4MDQwN1owXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUD
BAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0G
CSqGSIb3DQEBAQUABIIBAHujt4b99dmfig5wAYOhUJ9QJvjVNhSdGL08Mhd+LWwYTqwrrDVYgqqX
7cYumleybjM+mciAgskWka8oqCA3V3gJ1rj7Lw4k+J4r30/Lz69pqDxDRa2CJjsHkeUrqjNDohK7
hOsLHjzejfx+qfyunpnoGCzR6eWKhSejNp4UZ2IzG/VE+3ROR3JGR20T777dLmoG5GdPON7ANcdi
pJZ0O7Pipaw/YLobgmwd8WG8YCh32RBUKuT4RxYthl7MhgX3gEOoNPXkIkChsDuWLU+N4NDWYlUr
yJEme+lSxAxDTxWvU+p1+vDxy0aaGTWbefHEhoDT9/t7Xr+DkJfF+dv01LQ=
--0000000000000d8e3a064e75a507--


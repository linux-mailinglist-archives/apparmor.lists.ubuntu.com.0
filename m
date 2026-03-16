Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFMBCqMCuGlpYAEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 16 Mar 2026 14:16:19 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C80C229A1F8
	for <lists+apparmor@lfdr.de>; Mon, 16 Mar 2026 14:16:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w27nk-0006mB-Vb; Mon, 16 Mar 2026 13:16:08 +0000
Received: from mail-dy1-f176.google.com ([74.125.82.176])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <csh0052@gmail.com>) id 1w22n6-0007o8-W5
 for apparmor@lists.ubuntu.com; Mon, 16 Mar 2026 07:55:09 +0000
Received: by mail-dy1-f176.google.com with SMTP id
 5a478bee46e88-2c0bdf1988cso1622629eec.1
 for <apparmor@lists.ubuntu.com>; Mon, 16 Mar 2026 00:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773647707; cv=none;
 d=google.com; s=arc-20240605;
 b=B4escBf7AP+OElN2189DseuCDz//72y68/Gh4mnawAf/P8E+AoD4rLhQcCUX+dIXYM
 s1tZgHQcuMBhsms+oBfGfnoFiwvhLzifN9NFkUfw7s3UriKiTsKcA6BwoIcq6Ve5woub
 G8ABGqguc4n/2LnALCNYjaisiVee/MHXktOiC7c+vuBsXSTmBmpqCzFPvz4RFb2y1e2O
 ikPm+D7tgUBzxpTD6JRE2vMXkHd2Ejh40X5X8n/3cvPxdXUO7DfcdHi7Mos2sFpSs/D+
 mjymqBNtNtnEGiCmjiP6MXsJOeyM7sSi7dKDfqLwjRQeimC1zVwf7e9qYk+EWkxRrzsM
 g9Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=MqDKudknjcEpmEFrIqCKhzo+9DVQDMO4UFHjV17J154=;
 fh=wYOcSLscvSUKLGDhFJLAXqXr6rX/2Q7mLgIn0LmuPbs=;
 b=Eck2dKDeFvflLoNS+Wtt6shGu1nmpl5W8oiR0uF/MZVPgyPeOmY+1reYcmnhvdg4O0
 i3C12L6iqA5gVFF/C5i4tfX08bI5/cH3RvAKJy5DLOKnujswnL1j7jgXjEvLLcAXx30M
 8mwVKAasHNdRFf37KKJyw4O6NOVY3edBkIqhxVd/2pJt5dZ3NYGgE7AF1EhCstSUYrWP
 jK/tdQgrx/2ZOBf8C8aejqAE5k2LjFmvcTV7Pd5g9AvqI/4kWrDCqCV6Fy1L081CjPnc
 O68it0aowJjhrZ60jQYN+K+MZ9/MqXr7xgUR9iz9+w9ctIlDwzgdlvRAe8VCBLkVgtnA
 TGKg==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773647707; x=1774252507; darn=lists.ubuntu.com;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MqDKudknjcEpmEFrIqCKhzo+9DVQDMO4UFHjV17J154=;
 b=e8uBtzOQZ+OAaTC2RIdPGL+KbcyVezG42ZiKfi3BKkY0RtIKiVdoraYXYzclgVljZT
 4P5qpn6BPnOR/atCz6IvomQhuxzpKBTuAWFLNuT0aeKHttsChd3MWcNM8I0oXo2VWVNc
 +M6QHVYP2PuhePRDEIGurodvkvUTAVN2B1qCspQwmWICRtrNuMJou5xkydVAlZuc1xTI
 l86XCX2W+S8DwaBJ4anvIIvmIjJUXkBDjMkSoXeRHHZpd1iPVfxlSerpyH2QAQv29lRn
 VQM5D19cvBL2x+JOpm42e/d9toPlh3rPwIbaaXhlWDViLu69SqmS6xwjaHRaQS1yLDzs
 gERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773647707; x=1774252507;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MqDKudknjcEpmEFrIqCKhzo+9DVQDMO4UFHjV17J154=;
 b=hoJdahgAVcyRzLUGpXTHq+CmaHjcjJ7G6xsw3kPZYv9llTnz8l3Lga7/CQMEHxUlyu
 /n5KHJXRzpPd6RDJkRHf+ltCOm5wB/sBr+SXVcNaCFRpW4UOwfXbQUOiBgJ/S4ovnN/e
 eKIfNryeTq3HopuzxpixeK8GnAHPalnNA6EowtcfCPl/K5aj9j4DO+KyFzw6jfIiRbKg
 xm50zSDyu+ffuZTrhWFh2jpgd0ozc6/0WBaUtfGEmfhMuzqs5KABukJCuNUYXEvEPhrX
 dgBCgUZCgiz31ChthhijnhTAeXqK/3ZUaXlcJl0TzKJGHEvegGR7YgdynyD4pKD40JIV
 y99g==
X-Gm-Message-State: AOJu0Ywz0m90+6+VtO25cH4+KXxbcdiMO8KSLp1Ir02aqG/7DBeZV6vq
 yL0zxVLnePUs+wA3pN6rW0qvxhqFvISo5Pu/l7CZMiJD7DwcmRQC9AOfmJc8s/epnPW+sxGA00V
 wxktwTHCA8idNPJjBdFw8Uv+d8X/u2lI=
X-Gm-Gg: ATEYQzzKIAOR6sA4v25orOmK1QDC+NDe9ugzTsCAEkkeGZu1Rbk2psGDxjFR8dbygoN
 BvgVR34uS20usBaNs0l5vHulgCOxnFKCDTidXqi5zih2Ps3vHGRgMv2INMb/3kuNPIUWjyftbZy
 B1uHGQrKJ8D08eDUqw1cbYZYOsqLY8fF/yTh8foytAaJNfCxwtYO7PJaRZHFVhbG4XN8rKOcJaE
 XS8t1F/kG1AgpEB/sXdxQT3dfyw9nb1mZFjpLsB088VloEuxt504LegyRN3rykMn5hnG29V3SUM
 NeifqSdMYMpgpcIiXj3Jwvndvr8W3nGSNxnXqBL5
X-Received: by 2002:a05:7301:19a9:b0:2be:8650:b0fc with SMTP id
 5a478bee46e88-2bea53daafemr5480213eec.5.1773647706700; Mon, 16 Mar 2026
 00:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=c-5qhqocQpC3uWDp97E3ObjXiRFhjrS9fSqQVwR0_H6cZeg@mail.gmail.com>
 <ef568d19-30b5-4373-9c65-b4597ff77a27@canonical.com>
In-Reply-To: <ef568d19-30b5-4373-9c65-b4597ff77a27@canonical.com>
From: Sang-Hoon Choi <csh0052@gmail.com>
Date: Mon, 16 Mar 2026 16:54:53 +0900
X-Gm-Features: AaiRm53Fh8BS_zJKj71vBO4n2hBVeRTkmL34kxTtWFDuQ68aX0zbb8A913HUwWY
Message-ID: <CAO=c-5oJaUViY3kFOz_wL4F5mW8jPV4ifi5T6NPZdL7fBeDcOA@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Content-Type: multipart/alternative; boundary="00000000000083bdd2064d1f89b3"
Received-SPF: pass client-ip=74.125.82.176; envelope-from=csh0052@gmail.com;
 helo=mail-dy1-f176.google.com
X-Mailman-Approved-At: Mon, 16 Mar 2026 13:16:06 +0000
Subject: Re: [apparmor] AppArmor io_uring: uring_sqpoll implemented but
	uring_cmd is missing
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.19 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[csh0052@gmail.com,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[csh0052@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	NEURAL_HAM(-0.00)[-0.107];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: C80C229A1F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--00000000000083bdd2064d1f89b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks John, that's exactly what I needed to know.

I'll note in the paper that uring_cmd support is planned
but not yet landed due to the initial implementation issues

and current priorities. Appreciate the quick response.

Best regards

2026=EB=85=84 3=EC=9B=94 16=EC=9D=BC (=EC=9B=94) PM 4:12, John Johansen <jo=
hn.johansen@canonical.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> On 3/15/26 22:48, Sang-Hoon Choi wrote:
> > Hi John,
> >
> > I noticed that AppArmor implements two of the three io_uring LSM
> > hooks but not the third:
> >
> >    security_uring_sqpoll       -> apparmor_uring_sqpoll
>  (implemented)
> >    security_uring_override_creds -> apparmor_uring_override_creds
> > (implemented)
> >    security_uring_cmd          -> (not implemented)
> >
> > SELinux implements all three, including uring_cmd (selinux_uring_cmd,
> > added August 2022).
> >
> correct
>
> > The missing uring_cmd hook means that URING_CMD operations (used by
> > ublk, NVMe passthrough, and the upcoming fuse-io-uring) are not
> > mediated by AppArmor. On Ubuntu/Debian systems, these operations go
> > through with no LSM check at all.
> >
> sadly yes
>
> > I ran into this while testing ublk in container environments. A
> > privileged container can create block devices via URING_CMD on
> > /dev/ublk-control, and AppArmor profiles that restrict device access
> > do not cover URING_CMD operations on already-open file descriptors.
> >
> correct
>
> > For context, I previously discussed the SQPOLL credential caching
> > behavior with Jens Axboe, who confirmed it is by design and pointed
> > to the LSM hooks as the correct enforcement point. Since AppArmor
> yeah, I am not fond of the credential caching behavior
>
> > already handles sqpoll and credential override, adding uring_cmd
> > seems like a natural extension.
> >
> yes, it is coming, it is just a matter of dev time.
>
> > Is there a reason uring_cmd was left out when the other two hooks
> > were added, or is this just something that hasn't been gotten to yet?
> >
>
> the initial implementation ran into problems with uring_cmd, so
> instead of delaying all uring mediation, it was split from sqpoll
> and override_creds.
>
> > I am writing a paper analyzing ublk security in containers and want
> > to accurately describe AppArmor's coverage. Any information about
> > plans for uring_cmd support would help me get the paper right.
> >
>
> yes. Support for uring_cmd is coming as well as uring_allowed. The
> issue really is just developer time. Landing new mediation requires
> not only the mediation, but also tests, and tooling etc.
>
> There is a lot happening in apparmor atm, with a lot of competing
> priorities. The single biggest push atm, has been to fix bugs,
> and performance issues, and dramatically expand the CI. This will
> put us in a better place to ensure we aren't causing regressions
> as we land new mediation.
>
> And there is a bunch of improvements to mediation coming,
> including better uring, network, namespace, task, rlimits, object
> delegation, identify delegation, and more.
>
>
>
>
>
>
>
>
> > Thanks.
> >
> > Best regards
> > Sang-Hoon Choi
> >
>
>

--=20
Sang-Hoon Choi, Ph.D.
Research Professor
SysCore Lab, Sejong University

Email: csh0052@gmail.com, security@sju.ac.kr
Phone: +82-10-9089-0052
Website: https://koreasecurity.github.io

--00000000000083bdd2064d1f89b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks John, that&#39;s exactly what I needed to know. =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<br>I&#39;ll note in the paper that uring_cmd support is plann=
ed<br>but not yet landed due to the initial implementation issues =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>and current priorities=
. Appreciate the quick response. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br><br>=
Best regards</div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">2026=EB=85=84 3=EC=9B=94 16=EC=9D=BC (=EC=
=9B=94) PM 4:12, John Johansen &lt;<a href=3D"mailto:john.johansen@canonica=
l.com">john.johansen@canonical.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 3/15/=
26 22:48, Sang-Hoon Choi wrote:<br>
&gt; Hi John,<br>
&gt; <br>
&gt; I noticed that AppArmor implements two of the three io_uring LSM<br>
&gt; hooks but not the third:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 security_uring_sqpoll=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; app=
armor_uring_sqpoll=C2=A0 =C2=A0 =C2=A0 =C2=A0(implemented)<br>
&gt;=C2=A0 =C2=A0 security_uring_override_creds -&gt; apparmor_uring_overri=
de_creds<br>
&gt; (implemented)<br>
&gt;=C2=A0 =C2=A0 security_uring_cmd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -&gt=
; (not implemented)<br>
&gt; <br>
&gt; SELinux implements all three, including uring_cmd (selinux_uring_cmd,<=
br>
&gt; added August 2022).<br>
&gt; <br>
correct<br>
<br>
&gt; The missing uring_cmd hook means that URING_CMD operations (used by<br=
>
&gt; ublk, NVMe passthrough, and the upcoming fuse-io-uring) are not<br>
&gt; mediated by AppArmor. On Ubuntu/Debian systems, these operations go<br=
>
&gt; through with no LSM check at all.<br>
&gt; <br>
sadly yes<br>
<br>
&gt; I ran into this while testing ublk in container environments. A<br>
&gt; privileged container can create block devices via URING_CMD on<br>
&gt; /dev/ublk-control, and AppArmor profiles that restrict device access<b=
r>
&gt; do not cover URING_CMD operations on already-open file descriptors.<br=
>
&gt; <br>
correct<br>
<br>
&gt; For context, I previously discussed the SQPOLL credential caching<br>
&gt; behavior with Jens Axboe, who confirmed it is by design and pointed<br=
>
&gt; to the LSM hooks as the correct enforcement point. Since AppArmor<br>
yeah, I am not fond of the credential caching behavior<br>
<br>
&gt; already handles sqpoll and credential override, adding uring_cmd<br>
&gt; seems like a natural extension.<br>
&gt; <br>
yes, it is coming, it is just a matter of dev time.<br>
<br>
&gt; Is there a reason uring_cmd was left out when the other two hooks<br>
&gt; were added, or is this just something that hasn&#39;t been gotten to y=
et?<br>
&gt; <br>
<br>
the initial implementation ran into problems with uring_cmd, so<br>
instead of delaying all uring mediation, it was split from sqpoll<br>
and override_creds.<br>
<br>
&gt; I am writing a paper analyzing ublk security in containers and want<br=
>
&gt; to accurately describe AppArmor&#39;s coverage. Any information about<=
br>
&gt; plans for uring_cmd support would help me get the paper right.<br>
&gt; <br>
<br>
yes. Support for uring_cmd is coming as well as uring_allowed. The<br>
issue really is just developer time. Landing new mediation requires<br>
not only the mediation, but also tests, and tooling etc.<br>
<br>
There is a lot happening in apparmor atm, with a lot of competing<br>
priorities. The single biggest push atm, has been to fix bugs,<br>
and performance issues, and dramatically expand the CI. This will<br>
put us in a better place to ensure we aren&#39;t causing regressions<br>
as we land new mediation.<br>
<br>
And there is a bunch of improvements to mediation coming,<br>
including better uring, network, namespace, task, rlimits, object<br>
delegation, identify delegation, and more.<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
&gt; Thanks.<br>
&gt; <br>
&gt; Best regards<br>
&gt; Sang-Hoon Choi<br>
&gt; <br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Sang-Hoon Choi, Ph.D.<br>Research Professor<br>S=
ysCore Lab, Sejong University<br><br>Email: <a href=3D"mailto:csh0052@gmail=
.com" target=3D"_blank">csh0052@gmail.com</a>, <a href=3D"mailto:security@s=
ju.ac.kr" target=3D"_blank">security@sju.ac.kr</a><br>Phone: +82-10-9089-00=
52<br>Website: <a href=3D"https://koreasecurity.github.io" target=3D"_blank=
">https://koreasecurity.github.io</a></div></div>

--00000000000083bdd2064d1f89b3--


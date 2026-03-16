Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCtKJqQCuGlpYAEAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 16 Mar 2026 14:16:20 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B91B29A206
	for <lists+apparmor@lfdr.de>; Mon, 16 Mar 2026 14:16:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w27nk-0006m3-Pg; Mon, 16 Mar 2026 13:16:08 +0000
Received: from mail-dy1-f179.google.com ([74.125.82.179])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <csh0052@gmail.com>) id 1w20ol-0003tm-Gi
 for apparmor@lists.ubuntu.com; Mon, 16 Mar 2026 05:48:43 +0000
Received: by mail-dy1-f179.google.com with SMTP id
 5a478bee46e88-2beab594d8eso5690780eec.0
 for <apparmor@lists.ubuntu.com>; Sun, 15 Mar 2026 22:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773640121; cv=none;
 d=google.com; s=arc-20240605;
 b=gU4Tjvm4ypkt+HJrIt466maxkwXeiOo5gsZnhW0tWS5pUGYPxe11MbvKLOgsOLmKti
 suB5V8BhA8pHjP1D66v7sn70dZH5RCAxS5og0Yrr2NfXgnHxl5KWtAS2CzEYQQZHSQhL
 DDseqMu9dQQhopN8sGnJUVLqPfgl6n5o9v4/mbgJzaK9BRpB60APlenqWzSYpnT83uKj
 qydp0gTQP7jRRvQt4axTCI0ylHvg0VoJRfzQTMeR35XX30Jj5Nwzn7FSyStzDCrRppoP
 xp06j10ae2bBs/fvpeMiZe1FG6K4S85mDEtXGIpBc0s2DshTduQYEczcYhsj7NDs2pdE
 eRwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=5Fv4DyJ7GlPrEC4cUruMaFrjeC/rlbs819ks9UligLc=;
 fh=5mbgT4bNvfdci0WZskUvggBUUF29oUt6GpRHDGXjR6c=;
 b=WC9u3g9YzhxTQIfPIKiSUtNIawldeWRq12+FLFO2SjDogs9AXBUfADy7Ui3xDpgyjO
 B2u2S58O0uJaF7PSoPfCkW9Pbz+iH2EzA2I1Fuh6ZJvKJl5Sg96Dzh3/oMs6HluLbmTA
 2E/NLdIWKSqUnDxb/paddOLl9oqRC6N87GWP9Dj9K5BXq/GcAlyfXdYsIVTYPKmL2lk4
 wjpxOVOgq5BZ9QKXyOBjCjvNoonHM9mGHUBx1k5UNvdf+lIJwH9sU3FPxvz5tXG+8Xo/
 a7OLn+XT8T6TYOWKpf5pghPqjBBUzDUIs/t3QycA01qomWc1ciUwpnqR0wZvi8xsrFm9
 RrnA==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773640121; x=1774244921; darn=lists.ubuntu.com;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5Fv4DyJ7GlPrEC4cUruMaFrjeC/rlbs819ks9UligLc=;
 b=KkQKZmWvmP37ZEUVsLtUwNZ8Q6wypE2PoDMcUiggDYttDAU9pxUC547XiRviO2w8L7
 fvatEPpWBb/nldQPav+rnwAwHL3XMwtI/J460lYGg/xrTB048f5mKYOQyTTkunHIYwjA
 KCQbTubDmJy3AGweUvuQLUrPdRw59Z3+y8J7KsBmWaF0qvWCnTGTQJnPBHMrhfoJD8e9
 BxblNGqhkaHXKVFP+ozZUjJ4/kMyxha9GYASVs2GJsWpbBkeD1qsi0y2e4Oj2oOV97N8
 2XnNUdy0iryr7xn1r7vCtflJVnUQ05qtXO5zIGbR6hOHiiXBUQRaqgiTegOfA1JL00yv
 SGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773640121; x=1774244921;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Fv4DyJ7GlPrEC4cUruMaFrjeC/rlbs819ks9UligLc=;
 b=cf8JSNpAKiz+6R4S/zG9Q7LMdobyw6pmu8V+vZa0/nPzkgL8W/gGSDbiIG8ED9blOL
 9HKiLpzfwWuhGmsfP1+AhU4aAOl/hTwqnVwqRn8KTOrG3hRF+hJmASb1oFbH/0F0k/NB
 Dx/UFQ7n9TzNvx6TkhrwjDHJ1SZhTfFikGc0J6yqqsam1mPv4OdH1zZ14vuwiVpOLjCF
 L+xglwMUQZ8d38q0PYnEZj1nSeKAlwUYowaSvyKhLdYNEFeeu9aU+a3VlvDrJyexQt3o
 QNaeuYdwbTnQQ6Wzp3bXwBX+keMt0eXSX3LgFxlBvT+HK0ZkDoq/8hXYrzBbzBsDXSz2
 a4XQ==
X-Gm-Message-State: AOJu0Yy7hlV46qRmAFeiuIWUr4oG3L5ebl8OWXs6igqgSHXedUdAG411
 +zeZbg0/uAKaH1l6Jc8jqgDwkTdTgOumDB1gmwe91hoYtR5S1kEjVTU308l5faHvY2SFxBneTu3
 RhXBz9tyar3htJ9IT6duO6d8eBQ1qxIQUoGN+We0=
X-Gm-Gg: ATEYQzxUjHowENcrgqdQjl3+zpMZhNW1bxOMlXbxWGku7GCIcr5hONIuQCVnhbtXkCl
 jDHs5pNZboTKyXa/rkZFeQaFn/1GbwBgMOgUKgDh7tY8vx8wUcHgzwVGSz35IMV07E6ZmLI6gIe
 Kr1KFnIqmxDlfnCFq/qksneiLSn1VzolDMApfpYnDjAhRg/Pwlf2dH4SXfTufIwrUjPidV66/KF
 nr+Wm/Ss4W+mGOc0xWtBz0LUFwKW7tBnRaic5lwRCArcoCowJtoQan1544siDdYhfEvqgtMj5sj
 RTgWmrb2g4mgKqkX7oHUh/3RWOJCRc4caszZhVer
X-Received: by 2002:a05:7300:6ca0:b0:2ba:a098:ae64 with SMTP id
 5a478bee46e88-2bea572ddd5mr5651889eec.34.1773640121184; Sun, 15 Mar 2026
 22:48:41 -0700 (PDT)
MIME-Version: 1.0
From: Sang-Hoon Choi <csh0052@gmail.com>
Date: Mon, 16 Mar 2026 14:48:29 +0900
X-Gm-Features: AaiRm53h3qYUSAwWvKW-moxQ-mBFhkM_aIo6SSRhmUare2ADfgdfpDYPLYpvjRI
Message-ID: <CAO=c-5qhqocQpC3uWDp97E3ObjXiRFhjrS9fSqQVwR0_H6cZeg@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: multipart/alternative; boundary="00000000000061f57b064d1dc588"
Received-SPF: pass client-ip=74.125.82.179; envelope-from=csh0052@gmail.com;
 helo=mail-dy1-f179.google.com
X-Mailman-Approved-At: Mon, 16 Mar 2026 13:16:06 +0000
Subject: [apparmor] AppArmor io_uring: uring_sqpoll implemented but
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
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[csh0052@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.727];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	TAGGED_RCPT(0.00)[apparmor];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 8B91B29A206
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--00000000000061f57b064d1dc588
Content-Type: text/plain; charset="UTF-8"

Hi John,

I noticed that AppArmor implements two of the three io_uring LSM
hooks but not the third:

  security_uring_sqpoll       -> apparmor_uring_sqpoll       (implemented)
  security_uring_override_creds -> apparmor_uring_override_creds
(implemented)
  security_uring_cmd          -> (not implemented)

SELinux implements all three, including uring_cmd (selinux_uring_cmd,
added August 2022).

The missing uring_cmd hook means that URING_CMD operations (used by
ublk, NVMe passthrough, and the upcoming fuse-io-uring) are not
mediated by AppArmor. On Ubuntu/Debian systems, these operations go
through with no LSM check at all.

I ran into this while testing ublk in container environments. A
privileged container can create block devices via URING_CMD on
/dev/ublk-control, and AppArmor profiles that restrict device access
do not cover URING_CMD operations on already-open file descriptors.

For context, I previously discussed the SQPOLL credential caching
behavior with Jens Axboe, who confirmed it is by design and pointed
to the LSM hooks as the correct enforcement point. Since AppArmor
already handles sqpoll and credential override, adding uring_cmd
seems like a natural extension.

Is there a reason uring_cmd was left out when the other two hooks
were added, or is this just something that hasn't been gotten to yet?

I am writing a paper analyzing ublk security in containers and want
to accurately describe AppArmor's coverage. Any information about
plans for uring_cmd support would help me get the paper right.

Thanks.

Best regards
Sang-Hoon Choi

-- 
Sang-Hoon Choi, Ph.D.
Research Professor
SysCore Lab, Sejong University

Email: csh0052@gmail.com, security@sju.ac.kr
Phone: +82-10-9089-0052
Website: https://koreasecurity.github.io

--00000000000061f57b064d1dc588
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi John,<br><br>I noticed that AppAr=
mor implements two of the three io_uring LSM<br>hooks but not the third:<br=
><br>=C2=A0 security_uring_sqpoll =C2=A0 =C2=A0 =C2=A0 -&gt; apparmor_uring=
_sqpoll =C2=A0 =C2=A0 =C2=A0 (implemented)<br>=C2=A0 security_uring_overrid=
e_creds -&gt; apparmor_uring_override_creds (implemented)<br>=C2=A0 securit=
y_uring_cmd =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; (not implemented)<br><b=
r>SELinux implements all three, including uring_cmd (selinux_uring_cmd,<br>=
added August 2022).<br><br>The missing uring_cmd hook means that URING_CMD =
operations (used by<br>ublk, NVMe passthrough, and the upcoming fuse-io-uri=
ng) are not<br>mediated by AppArmor. On Ubuntu/Debian systems, these operat=
ions go<br>through with no LSM check at all.<br><br>I ran into this while t=
esting ublk in container environments. A<br>privileged container can create=
 block devices via URING_CMD on<br>/dev/ublk-control, and AppArmor profiles=
 that restrict device access<br>do not cover URING_CMD operations on alread=
y-open file descriptors.<br><br>For context, I previously discussed the SQP=
OLL credential caching<br>behavior with Jens Axboe, who confirmed it is by =
design and pointed<br>to the LSM hooks as the correct enforcement point. Si=
nce AppArmor<br>already handles sqpoll and credential override, adding urin=
g_cmd<br>seems like a natural extension.<br><br>Is there a reason uring_cmd=
 was left out when the other two hooks<br>were added, or is this just somet=
hing that hasn&#39;t been gotten to yet?<br><br>I am writing a paper analyz=
ing ublk security in containers and want<br>to accurately describe AppArmor=
&#39;s coverage. Any information about<br>plans for uring_cmd support would=
 help me get the paper right.<br><br>Thanks.<br><br>Best regards<br></div><=
div>Sang-Hoon Choi</div><div><br></div><span class=3D"gmail_signature_prefi=
x">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">Sang-Hoon Choi, Ph.D.<br>Research Pro=
fessor<br>SysCore Lab, Sejong University<br><br>Email: <a href=3D"mailto:cs=
h0052@gmail.com" target=3D"_blank">csh0052@gmail.com</a>, <a href=3D"mailto=
:security@sju.ac.kr" target=3D"_blank">security@sju.ac.kr</a><br>Phone: +82=
-10-9089-0052<br>Website: <a href=3D"https://koreasecurity.github.io" targe=
t=3D"_blank">https://koreasecurity.github.io</a></div></div></div>
</div>

--00000000000061f57b064d1dc588--


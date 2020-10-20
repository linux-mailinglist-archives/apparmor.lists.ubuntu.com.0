Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0490B294044
	for <lists+apparmor@lfdr.de>; Tue, 20 Oct 2020 18:13:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kUuG0-00020D-2z; Tue, 20 Oct 2020 16:13:04 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <sswarnas@gmail.com>) id 1kUuFy-000206-Im
 for apparmor@lists.ubuntu.com; Tue, 20 Oct 2020 16:13:02 +0000
Received: by mail-ej1-f49.google.com with SMTP id dt13so3546997ejb.12
 for <apparmor@lists.ubuntu.com>; Tue, 20 Oct 2020 09:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1bGTnzJJiQgGXsx3m6gzcVnkOqPDZe0111bkWxPe/nw=;
 b=OUbg0kt7u5zm4nz87TbjmQy/zhsxTx/sOWMjlVk4mbmKgVSM23tRXZqfkR1PzxeCFW
 ahJbykZJoQGRbBh/+r3Hxrcsd2lcIn7+jAtL1VJ1oFSeftugMp8cRtEunZnpVBzfii5d
 oYaceQXN/U5rFP7iU9DXoQAvlYGlsl8xSMt/4UCTizaMj//Hj8Uy/u+H0/gC3jCtMCYy
 BiA0eFuyAw9tA26zGoR5mAEXoiO00fgPSEoNMa+91Me0aZ9LPCzXoSA5N11RqokQpA8C
 biLbVTtcMLj+1mBuprQDiod1yuXQurYPjHPOHPOSon/zWtwdo3gT4fcVP9UvVNXt2tBm
 dudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1bGTnzJJiQgGXsx3m6gzcVnkOqPDZe0111bkWxPe/nw=;
 b=SS/CymyGaaVGlXGmKcDk0/bvbi0lrcE+d+pk8uDa2OXMpXBGfedoH7LE0z015kabRp
 M5vnu3bsBafduqOwLS0bSQRpzuSE0kSZbAUyUy6rYUzXSMZFAUHU2qvdl5llKX1pYLbC
 9j/3lbB5kfrt8ivjqoQpcXvbJtLuWRMj6C5Vlrge/oCvE6tHSNg4Qfw3p+x1tAdz+qe+
 OjBJMGZ0IfTiYqDzRiQ3xmB8V63bWIS9FNzbPFn8fbZezRag+e2aawoDaveIulG91l9L
 iDXSHIDklPj0l+ZHvI/RMQra3H1G4gpvbxi31pPVHwD3eM2k5WJ+qOmFPr7N9v18gIND
 /naQ==
X-Gm-Message-State: AOAM531CGiaXDMRte06+nH+5m6/cXFUjhyW6vORp7mbrzq/CdaqjkZzB
 lhs8nbC3NB6hMDlI9cDkmoGkLu6FENX1YL4kSe0He9tgWX0=
X-Google-Smtp-Source: ABdhPJyIfNC9g4IWL8bQQ+ddy+A7Nd4pGP+6Xbm05XSGQVQFmeOnRTUFnfkfF3p42MsL5vwQtf9QJtmaE9RSSDbvn0Q=
X-Received: by 2002:a17:906:3ada:: with SMTP id
 z26mr3836195ejd.151.1603210381503; 
 Tue, 20 Oct 2020 09:13:01 -0700 (PDT)
MIME-Version: 1.0
From: swarna latha <sswarnas@gmail.com>
Date: Tue, 20 Oct 2020 12:12:50 -0400
Message-ID: <CAJs3c4xwqOOLPVOW8bBPrpRkFceLYdFSgWmKBtwbu1o5vj4Fhw@mail.gmail.com>
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
Received-SPF: pass client-ip=209.85.218.49; envelope-from=sswarnas@gmail.com;
 helo=mail-ej1-f49.google.com
Subject: [apparmor] Regarding apparmor in container
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
Content-Type: multipart/mixed; boundary="===============7060762382715680970=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============7060762382715680970==
Content-Type: multipart/alternative; boundary="0000000000004a313705b21c81bb"

--0000000000004a313705b21c81bb
Content-Type: text/plain; charset="UTF-8"

Hi,

We are using apparmor to generate profile for a video application running
in container.

with apparmor in complaint mode, we see the video is not streaming, and we
are not getting any apparmor logs. if we disable the apparmor profile, we
see video streaming.

Can you please let us know the reason for this behaviour... is it due to
any permission issue or performance issue...

if it is due to permission issue, why we are not getting apparmor logs in
this case.

Thanks,
Swarna

--0000000000004a313705b21c81bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>We are using apparmor to generate p=
rofile for a video application running in container.</div><div><br></div><d=
iv>with apparmor in complaint mode, we see the video is not streaming, and =
we are not getting any apparmor logs. if we disable the apparmor profile, w=
e see video streaming.</div><div><br></div><div>Can you please let us know =
the reason for this behaviour... is it due to any permission issue or perfo=
rmance issue...</div><div><br></div><div>if it is due to permission issue, =
why we=C2=A0are not getting apparmor logs in this case.</div><div><br></div=
><div>Thanks,</div><div>Swarna</div><div><br></div><div><br></div><div><br>=
</div></div>

--0000000000004a313705b21c81bb--


--===============7060762382715680970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============7060762382715680970==--


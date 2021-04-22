Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8A036779B
	for <lists+apparmor@lfdr.de>; Thu, 22 Apr 2021 04:54:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lZPTb-0001RW-Ao; Thu, 22 Apr 2021 02:53:59 +0000
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <sswarnas@gmail.com>) id 1lZPTY-0001RO-PX
 for apparmor@lists.ubuntu.com; Thu, 22 Apr 2021 02:53:56 +0000
Received: by mail-pf1-f177.google.com with SMTP id p67so25734594pfp.10
 for <apparmor@lists.ubuntu.com>; Wed, 21 Apr 2021 19:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uz0BWukTALZoDXBeEdICyrip2s6Pa0MukJVcQnP21oY=;
 b=d8P8y1cV0yPYZMu2cm6tYCp5E7Wc/pO8IjecVa/LtKrBF8aNS7NUq+OZwrVOzYCD/a
 mH3obF7nPrVI3sk33CaSCzD/WCVAql6K/40sWDtltsV37koFUm0nR3K315m95IEYUS6e
 7O+bie7eLfPqnb8n9PpJOR2MEFwsMf4Po/98kqwpTiZnFHiuS8O4JLbKotrDqXso9k4E
 8bi4IgeQVJxxYu1s6HdsO/YdIxUT1ofzqBZoWiMO20QUPjVWKeOeX596JY7A1nX1AwpR
 7AbTSeZAMLN0dGY1e7CfKvS2wm9PbpIVgqyAs6KRMOs9CmEJUO1qmkmBy7p/wRoARIQ4
 S+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uz0BWukTALZoDXBeEdICyrip2s6Pa0MukJVcQnP21oY=;
 b=T3gUPCaYWQuFY1j34/2Gci/oAL4TEl8WoC3yupGnHhtCN0H12t33sFHzko9s85J5D6
 xnhFCRnJmt1bToVwSsL3CntXzhfWEZvRovCHfs8gtfakhty3cgX0+B8ZFJxzT6kM+ZDo
 43uq7p9XY+uVRmBlnnvWTLrGgcupot/zV67vx1Jd8sm4f/TmLdhfOjRbXtrRCgbIbbAW
 8+PUIsenObI/KcsZnrDSqEWxhw6HIajmCaW8VKHCR7Euvo4UOKnRsWUt9jd9+20W42yk
 OvDDvk2yYqwQec7j9gKHRL1CIVhDZjSRTSjcImXmdqETPe5eB5Pg7/W1xmyA85dalf+a
 ckzg==
X-Gm-Message-State: AOAM530rxjtBBb78EfR5bIJQLhfnil6NfRtXgoj25z7huocSigO8plY6
 iNb98mvB2f+wbrDf+WDLMIqeHD0miDTnhI0R/rM=
X-Google-Smtp-Source: ABdhPJy49EZURVeD1Gr6/PjAkp2eN2ucHcw3Ptc1IrFMxX+G6TCS55v5fY7qGQd+drR5E+wJkbXoTNqScdZK/qan/5M=
X-Received: by 2002:a05:6a00:1aca:b029:25a:b810:94c7 with SMTP id
 f10-20020a056a001acab029025ab81094c7mr1181239pfv.15.1619060034907; Wed, 21
 Apr 2021 19:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAJs3c4xaFpc52=XGW9=Xk_mTOzZ1wcRAexFNUTbMaFKXihuWWQ@mail.gmail.com>
 <20210421225333.GA2367494@millbarge>
In-Reply-To: <20210421225333.GA2367494@millbarge>
From: swarna latha <sswarnas@gmail.com>
Date: Wed, 21 Apr 2021 22:53:43 -0400
Message-ID: <CAJs3c4z33mxCyaFoV2VEhU4GURZ=+6tXUs7aT3+JSKHPya5rqQ@mail.gmail.com>
To: Seth Arnold <seth.arnold@canonical.com>
Received-SPF: pass client-ip=209.85.210.177; envelope-from=sswarnas@gmail.com;
 helo=mail-pf1-f177.google.com
Subject: Re: [apparmor] Regarding header file for default capabilities
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
Content-Type: multipart/mixed; boundary="===============3751965506960892037=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============3751965506960892037==
Content-Type: multipart/alternative; boundary="00000000000040337505c086ca78"

--00000000000040337505c086ca78
Content-Type: text/plain; charset="UTF-8"

Hi Seth,

Thank you for your immediate response. I have followed as per your
suggestion.

My header file name is common_caps

cat common_caps:
capability chown dac_override dac_read_search fowner fsetid kill ipc_lock
sys_nice setpcap ipc_owner sys_ptrace sys_chroot,

profile Test /usr/bin/ping flags=(attach_disconnected) {
    #include "common_caps"
    capability sys_tty_config,
    capability sys_rawio,
}
we have removed the python user space utils, due to the space constraint in
our device.
so loading this profile with  sh -x /etc/apparmor/apparmor_parse.sh, and
getting below error.

AppArmor parser error for usr.bin.test at line 1: syntax error, unexpected
TOK_CAPABILITY, expecting $end

Can you please let me know if i am missing anything here.

Thanks,
Swarna


On Wed, Apr 21, 2021 at 6:53 PM Seth Arnold <seth.arnold@canonical.com>
wrote:

> On Wed, Apr 21, 2021 at 09:41:23AM -0400, swarna latha wrote:
> > Can someone throw lights on how to implement  a set of default
> > capabilities to be added in all profiles (preferably in header file)
>
> Hello Swarna, I gave advice to someone else recently that's probably
> applicable to your case, too:
>
> https://lists.ubuntu.com/archives/apparmor/2021-April/012264.html
>
> Thanks
> --
> AppArmor mailing list
> AppArmor@lists.ubuntu.com
> Modify settings or unsubscribe at:
> https://lists.ubuntu.com/mailman/listinfo/apparmor
>

--00000000000040337505c086ca78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Seth,<div><br></div><div>Thank you for your immediate r=
esponse. I have followed as per your suggestion.</div><div><br></div><div>M=
y header file name is common_caps</div><div><br></div><div>cat common_caps:=
<br></div><div>capability chown dac_override dac_read_search fowner fsetid =
kill ipc_lock sys_nice setpcap ipc_owner sys_ptrace sys_chroot,<br></div><d=
iv><br></div><div>profile Test /usr/bin/ping flags=3D(attach_disconnected) =
{<br>=C2=A0 =C2=A0 #include &quot;common_caps&quot;<br>=C2=A0 =C2=A0 capabi=
lity sys_tty_config,<br>=C2=A0 =C2=A0 capability sys_rawio,<br></div><div>}=
</div><div>we have removed the python user space utils, due to the space co=
nstraint in our device.=C2=A0</div><div></div><div>so loading this profile =
with=C2=A0=C2=A0sh -x /etc/apparmor/apparmor_parse.sh, and getting below er=
ror.</div><div><br>AppArmor parser error for usr.bin.test at line 1: syntax=
 error, unexpected TOK_CAPABILITY, expecting $end<br></div><div><br></div><=
div>Can you please let me know if i am missing anything here.</div><div><br=
></div><div>Thanks,</div><div>Swarna</div><div><br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 21, 20=
21 at 6:53 PM Seth Arnold &lt;<a href=3D"mailto:seth.arnold@canonical.com">=
seth.arnold@canonical.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Wed, Apr 21, 2021 at 09:41:23AM -0400, swarna l=
atha wrote:<br>
&gt; Can someone throw lights on how to implement=C2=A0 a set of default<br=
>
&gt; capabilities to be added in all profiles (preferably in header file)<b=
r>
<br>
Hello Swarna, I gave advice to someone else recently that&#39;s probably<br=
>
applicable to your case, too:<br>
<br>
<a href=3D"https://lists.ubuntu.com/archives/apparmor/2021-April/012264.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://lists.ubuntu.com/archives/a=
pparmor/2021-April/012264.html</a><br>
<br>
Thanks<br>
-- <br>
AppArmor mailing list<br>
<a href=3D"mailto:AppArmor@lists.ubuntu.com" target=3D"_blank">AppArmor@lis=
ts.ubuntu.com</a><br>
Modify settings or unsubscribe at: <a href=3D"https://lists.ubuntu.com/mail=
man/listinfo/apparmor" rel=3D"noreferrer" target=3D"_blank">https://lists.u=
buntu.com/mailman/listinfo/apparmor</a><br>
</blockquote></div>

--00000000000040337505c086ca78--


--===============3751965506960892037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============3751965506960892037==--


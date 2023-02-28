Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA8F6A5FD0
	for <lists+apparmor@lfdr.de>; Tue, 28 Feb 2023 20:39:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pX5oi-0006ei-Gz; Tue, 28 Feb 2023 19:39:16 +0000
Received: from mail-ua1-f41.google.com ([209.85.222.41])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1pX5og-0006eW-C6
 for apparmor@lists.ubuntu.com; Tue, 28 Feb 2023 19:39:14 +0000
Received: by mail-ua1-f41.google.com with SMTP id x40so2042569uaf.2
 for <apparmor@lists.ubuntu.com>; Tue, 28 Feb 2023 11:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+urNvWL7tHrvIxKuilVbYgJUzNTsafr9mckoojpPkeo=;
 b=b3s4rbldFXHPfyTPor3YceQvLt0SsvyQBCEOQY8TWqmVRDFKldn0DWFww8NNLDWPMw
 eR+Yyumer/JfmrcriuWJL9T733+KjlV3JlzI2Xkp6rLgF33jkccX9vtjhAxGDnyeRrF7
 fv52eEm3DvWffh8b4B1EAlFDEr6qASvsFI4l09Lj26dSA6Q4kQ0vPuF/x4krRNlFMkH1
 dCdVnNkq+ZfMwm6qzhq5ExsrP6/0v3BbpB+WA58xSA66b4RylphXzUKljsYupA885Ve/
 vYILIThBvoT5yp/vTAyPt0/lk1neUeObA+Gmx+8xfZsj8A7WbZLp7/BHCwvYXhE17JNa
 zJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+urNvWL7tHrvIxKuilVbYgJUzNTsafr9mckoojpPkeo=;
 b=AbuolWacmz0GpA/LjS5J6tkFvcO6Pbsx/cH6LhVJJr+5RwMCarS0U8T41hLluzduUx
 q6zZrPo6zs/NTb7Iy3KyObMb/VJDKatbs5xDKr5E9K7+dq+M40p9oS6E6+DW8ab5ERac
 O4ah6K7gdTYur7StH3jWqUZsnxcOLt1L4pXkyw3qnKmybTngHymfBsuEdMYusvthKsVc
 17weFFNlgVb59O10XV+iW4vyso/8b6q9oRa1zF4lLm6AKyhWPrSfq3fE3GTFPcf/ENd7
 JoVr2l3QKHYfgWtp3OFTIrB3qS4oe5fnYF0aQTh9AUpO6jl4vbisg0DuQiUFWAeK/8l4
 64Sg==
X-Gm-Message-State: AO0yUKUUqSQXnwzn4CILOyu3b18JO0gu2zByKDMVl7d/Esu9fKIOBWXW
 p8QO+gH4or7upEypczMYusBmzVGs/D7zQ5FZeSvi0YaxoNA=
X-Google-Smtp-Source: AK7set/fyXcE+8MbLLTSz2twTghewSrrlof/bWG0m/T2nmtGdCGTyFuTqerM0pBkSZoWMD7nY/Wwc4bc6untwxHtT1Y=
X-Received: by 2002:a1f:4f86:0:b0:40c:4d1:b550 with SMTP id
 d128-20020a1f4f86000000b0040c04d1b550mr2110228vkb.0.1677613152637; Tue, 28
 Feb 2023 11:39:12 -0800 (PST)
MIME-Version: 1.0
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Tue, 28 Feb 2023 14:39:01 -0500
Message-ID: <CAODFaZ6+kOJcTs6a1_08TCJ6pnqndzKBBWOK0+xb4L2gmB9ffw@mail.gmail.com>
To: apparmor@lists.ubuntu.com, John Johansen <john.johansen@canonical.com>, 
 Seth Arnold <seth.arnold@canonical.com>
Content-Type: multipart/alternative; boundary="00000000000008962e05f5c7c07e"
Received-SPF: pass client-ip=209.85.222.41;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-ua1-f41.google.com
Subject: [apparmor] Reg. Apparmor logging query
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

--00000000000008962e05f5c7c07e
Content-Type: text/plain; charset="UTF-8"

Hi John,

I added below entries in one of my profiles which runs under complain mode.
*audit /var/** wl,*

As per my script to capture Apparmor logs, I am capturing journalctl -k for
every 30 mins in my log path (for instance, /tmp/logs/).
However, I could NOT see the expected log entry for this rule audit
"/var/** wl," from journalctl -k output.

I could see the logs seen if we use *journalctl -a*, but I do not want to
copy (to avoid the space) journalctl -a for every 30 mins as it has other
additional/debug log information.

Do we have any options/configuration to get these logs from
*journalctl -k *instead
of* journalctl -a*?

Thanks
Murali.S

--00000000000008962e05f5c7c07e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi John,<br><br>I added below entries in one of my profile=
s which runs under complain mode. <br><b>audit /var/** wl,</b><br><br>As pe=
r my script to capture Apparmor logs, I am capturing journalctl -k for ever=
y 30 mins in my log path (for instance, /tmp/logs/).<br>However, I could NO=
T see the expected log entry for this rule audit &quot;/var/** wl,&quot; fr=
om=C2=A0journalctl -k=C2=A0output.=C2=A0<br><br>I could see the logs seen i=
f we use <b>journalctl -a</b>, but I do not want to copy (to avoid the spac=
e) journalctl -a for every 30 mins as it has other additional/debug=C2=A0lo=
g information.<br><br>Do we have any options/configuration to get these log=
s from <b>journalctl -k </b>instead of<b> journalctl -a</b>?<br><br>Thanks<=
br>Murali.S<br></div>

--00000000000008962e05f5c7c07e--


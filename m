Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F6372DC3D
	for <lists+apparmor@lfdr.de>; Tue, 13 Jun 2023 10:21:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q8zHJ-000060-HH; Tue, 13 Jun 2023 08:21:25 +0000
Received: from mail-vs1-f42.google.com ([209.85.217.42])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <aivazian.tigran@gmail.com>) id 1q8gFJ-0006uJ-5B
 for apparmor@lists.ubuntu.com; Mon, 12 Jun 2023 12:02:05 +0000
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-43dc0aa328dso2917735137.1
 for <apparmor@lists.ubuntu.com>; Mon, 12 Jun 2023 05:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686571323; x=1689163323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gIeNho+iq7fIieD/uaaC3C3MZzDx4EtnWzlRBh9eZ+o=;
 b=a7THlsmPARBVuXhzhi14HAL+cHx3H+b+HMY+KwHAWyVnB306A74iDPjXZKE6csTPsB
 B+bdDGNFHHk9WPYPc5NGsEgxYafyt0qHlcvElGOhaJ9+XsIwsZ5HpsS7X0DD+t5FsLmE
 2WWwj78e6erno17rzYlLGGBNVEc2S3SxyKgJtMuemuPyPCM2mcfoatNj6uwBYUq7nc3w
 0yRPEUTfQmqBSB2Uz4oA4ZFAoHa0h9ySH/tWWRuNXOkQ4n4OH+06yQRuZTrmjCxQa1nG
 k0NQI/qkhkmROAtHkSDiTy2KULtdr5U9FDMSqTzxip8LEa7WEHAjTzbOFR8O5WolEZ4B
 NuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686571323; x=1689163323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gIeNho+iq7fIieD/uaaC3C3MZzDx4EtnWzlRBh9eZ+o=;
 b=hSxscJb2u5K65lgg67kU8BW0w9c6DPJIATY2P1nrGuVd+JOPRlgk3arDz9TjEam9xF
 PJzXWMb5zgI5nnKxCIDVwFzZnYR3WPFeiyKlfwlVwgIm3kG68bLxA5ZYhpmMRpI2XaYk
 A3fk8fQgmkHJcUEevZWt+AU17xq7BBj8F0yOo2QNOHrozHZbJDlqxJnnJA5RSlOFn37v
 iez8eQkxbIa2p235LrnSSwKIaVQ19x+XjByTpCwKIHT/XuzX21QWMSEWj7ZsfyHR59/O
 BmoAhn46OHVc6+p0fcCWjG+ovtlEX6QNgn3vIYefM+vwbuUa0DR4S14vA5lrraJAWwfh
 dx/Q==
X-Gm-Message-State: AC+VfDwdhoO7DQU1sV5kRSrwKYen1YjgFMFszHXkCmhj5TDjCzoWjjDC
 FXYHGlKg2AnTB8X4ut9Xv1XgPwuCv5DjzPm5qYQ=
X-Google-Smtp-Source: ACHHUZ6pEfaoJmAwbFKgn/JZRUlvSDIpi0iYqCKwEBaSuS9odROcuyntsaQNA5lwnqTdyPOfOp5mSw2m3wd1RflmwBY=
X-Received: by 2002:a05:6102:3f91:b0:430:13cb:8156 with SMTP id
 o17-20020a0561023f9100b0043013cb8156mr4059378vsv.13.1686571323588; Mon, 12
 Jun 2023 05:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230612104524.17058-1-jlayton@kernel.org>
In-Reply-To: <20230612104524.17058-1-jlayton@kernel.org>
From: Tigran Aivazian <aivazian.tigran@gmail.com>
Date: Mon, 12 Jun 2023 12:01:52 +0100
Message-ID: <CAK+_RLkoAX_n-PPYv9zEpitbMk3DxZx2EWYaKT7YKH_wEys+ew@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000a1886905fded7cd8"
Received-SPF: pass client-ip=209.85.217.42;
 envelope-from=aivazian.tigran@gmail.com; helo=mail-vs1-f42.google.com
X-Mailman-Approved-At: Tue, 13 Jun 2023 08:21:25 +0000
Subject: Re: [apparmor] [PATCH v2 0/8] fs: add some missing ctime updates
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
Cc: linux-efi@vger.kernel.org, James Morris <jmorris@namei.org>,
 Ruihan Li <lrh2000@pku.edu.cn>, Ard Biesheuvel <ardb@kernel.org>,
 Ian Kent <raven@themaw.net>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Ritu Agarwal <rituagar@linux.ibm.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alan Stern <stern@rowland.harvard.edu>, Namjae Jeon <linkinjeon@kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Arnd Bergmann <arnd@arndb.de>, autofs@vger.kernel.org,
 apparmor@lists.ubuntu.com, Tom Talpey <tom@talpey.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 linux-security-module@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>,
 linux-fsdevel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 Brad Warrum <bwarrum@linux.ibm.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--000000000000a1886905fded7cd8
Content-Type: text/plain; charset="UTF-8"

Hi Jeff and all,

On Mon, 12 Jun 2023 at 11:45, Jeff Layton <jlayton@kernel.org> wrote:

> None of these seem to be very crucial, but it would be nice if various
> maintainers could pick these up for v6.5. Please let me know if you do,
> or would rather I shepherd the patch upstream.
>

Yes, if you could shepherd the patch upstream, that would be great, as it's
been a very long time since I did any kernel hacking, and the patch
submission procedures must have changed in a decade or two :) Thank you!

Kind regards,
Tigran

--000000000000a1886905fded7cd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jeff and all,</div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 12 Jun 2023 at 11:45, Jeff La=
yton &lt;<a href=3D"mailto:jlayton@kernel.org">jlayton@kernel.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">None of th=
ese seem to be very crucial, but it would be nice if various<br>
maintainers could pick these up for v6.5. Please let me know if you do,<br>
or would rather I shepherd the patch upstream.<br></blockquote><div><br></d=
iv><div>Yes, if you could shepherd the patch upstream, that would be great,=
 as it&#39;s been a very long time since I did any kernel hacking, and the =
patch submission procedures must have changed in a decade or two :) Thank y=
ou!</div><div><br></div><div>Kind regards,</div><div>Tigran</div></div></di=
v>

--000000000000a1886905fded7cd8--


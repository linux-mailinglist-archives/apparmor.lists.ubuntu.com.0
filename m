Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F3F83F50D
	for <lists+apparmor@lfdr.de>; Sun, 28 Jan 2024 11:49:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rU2iZ-0003FA-Q2; Sun, 28 Jan 2024 10:48:52 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <salvatore.bonaccorso@gmail.com>)
 id 1rU1uV-0007Bu-5q
 for apparmor@lists.ubuntu.com; Sun, 28 Jan 2024 09:57:07 +0000
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-33ae3154cf8so796783f8f.3
 for <apparmor@lists.ubuntu.com>; Sun, 28 Jan 2024 01:57:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706435826; x=1707040626;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Ud8TZcBqh93/4qPkrsJV4VlusZyuhk6bb71FqjjLrk=;
 b=H6UtJwK4zbFzEYQbJnC2m6biaKLrUkn1tGH11EsGGwXki/gKHo1dJfu4honpCH//zb
 JaPaQFfv6LxrJYt2zI2Wq9pyPAQXIXgjlH6z8otGHLCcubIIl2HgaAyvCokiqUZhOAL5
 wrsQQy3PA9SxxR08XyvqqdOBqTx7xpsNWXdL27sItm8POebdyhDZcMxdVvz1chHqO9dK
 X8KHtliBBktcvQ/5p1EGqSiE+kPJv5/De+H8zYUjwa2/dpeZeWCLvAcGqzUW57rXVOna
 oRf94MDNLw9iGaLA6xn1kJdAd6L3WkKzk6xQiI12kNX0U6/OFHOZv+OyiABuqUKWI1Lb
 iPrw==
X-Gm-Message-State: AOJu0YxsQSzFdnWNcLmtwYK41nW4+ONWO/YV+u07Uoh5+LZKnn2YRBVQ
 KxXCLcJXL6RPNvl+oaKqoCAXA8tIz3RxAWlrQ0lE2IasZjrCqld7
X-Google-Smtp-Source: AGHT+IHVx2SbunG+twXTLDTGR+3jmVaYt5le4qQRxshJPYE92knfjMYJcEgZfYipdddqil7MCNXP7Q==
X-Received: by 2002:adf:f607:0:b0:33a:ea33:641d with SMTP id
 t7-20020adff607000000b0033aea33641dmr773437wrp.4.1706435826333; 
 Sun, 28 Jan 2024 01:57:06 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch.
 [82.192.242.114]) by smtp.gmail.com with ESMTPSA id
 bo17-20020a056000069100b0033930068ca8sm5282962wrb.21.2024.01.28.01.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 01:57:04 -0800 (PST)
From: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
X-Google-Original-From: Salvatore Bonaccorso <salvi@eldamar.lan>
Received: by eldamar.lan (Postfix, from userid 1000)
 id B1F06BE2DE0; Sun, 28 Jan 2024 10:57:03 +0100 (CET)
Date: Sun, 28 Jan 2024 10:57:03 +0100
To: John Johansen <john.johansen@canonical.com>
Message-ID: <ZbYk7yOaAq0O8Rid@eldamar.lan>
References: <da160344-8135-4eab-9261-bb1552238ad3@debian.org>
 <8f68c83b-1856-4fa2-8408-06ae36696698@debian.org>
 <8f68c83b-1856-4fa2-8408-06ae36696698@debian.org>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <38461b24-1b42-45f7-98d6-e6e353c0d203@debian.org>
 <169271330498.34427.2191706613553030083.reportbug@pluto.milchstrasse.xx>
 <ZXDsAecCKiSuHsO2@eldamar.lan> <ZZA69zQAzpzPojD5@eldamar.lan>
 <9d6a5b2368016e2ef7b11c64b7c9db69419318ec.camel@debian.org>
 <b8bb1a0e-9b50-4f78-8473-4f0151677f25@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8bb1a0e-9b50-4f78-8473-4f0151677f25@canonical.com>
Received-SPF: pass client-ip=209.85.221.45;
 envelope-from=salvatore.bonaccorso@gmail.com; helo=mail-wr1-f45.google.com
X-Mailman-Approved-At: Sun, 28 Jan 2024 10:48:45 +0000
Subject: Re: [apparmor] Bug#1050256: AppArmor breaks locking non-fs Unix
	sockets
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
Cc: Harald Dunkel <harri@afaics.de>, John Johansen <john@apparmor.net>,
 Mathias Gibbens <gibmat@debian.org>, apparmor@lists.ubuntu.com,
 Antonio Terceiro <terceiro@debian.org>, Paul Gevers <elbrus@debian.org>,
 pkg-systemd-maintainers <pkg-systemd-maintainers@lists.alioth.debian.org>,
 1050256@bugs.debian.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi John,

On Sun, Jan 28, 2024 at 12:43:33AM -0800, John Johansen wrote:
> On 12/30/23 20:24, Mathias Gibbens wrote:
> > On Sat, 2023-12-30 at 16:44 +0100, Salvatore Bonaccorso wrote:
> > > John, did you had a chance to work on this backport for 6.1.y stable
> > > upstream so we could pick it downstream in Debian in one of the next
> > > stable imports? Cherry-picking 1cf26c3d2c4c ("apparmor: fix apparmor
> > > mediating locking non-fs unix sockets") does not work, if not
> > > havinging the work around e2967ede2297 ("apparmor: compute policydb
> > > permission on profile load") AFAICS, so that needs a 6.1.y specific
> > > backport submitted to stable@vger.kernel.org ?
> > > 
> > > I think we could have people from this bug as well providing a
> > > Tested-by when necessary. I'm not feeling confident enough to be able
> > > to provide myself such a patch to sent to stable (and you only giving
> > > an Acked-by/Reviewed-by), so if you can help out here with your
> > > upstream hat on that would be more than appreciated and welcome :)
> > > 
> > > Thanks a lot for your work!
> > 
> >    I played around with this a bit the past week as well, and came to
> > the same conclusion as Salvatore did that commits e2967ede2297 and
> > 1cf26c3d2c4c need to be cherry-picked back to the 6.1 stable tree.
> > 
> >    I've attached the two commits rebased onto 6.1.y as patches to this
> > message. Commit e2967ede2297 needed a little bit of touchup to apply
> > cleanly, and 1cf26c3d2c4c just needed adjustments for line number
> > changes. I included some comments at the top of each patch.
> > 
> >    With these two commits cherry-picked on top of the 6.1.69 kernel, I
> > can boot a bookworm system and successfully start a service within a
> > container that utilizes `PrivateNetwork=yes`. Rebooting back into an
> > unpatched vanilla 6.1.69 kernel continues to show the problem.
> > 
> >    While I didn't see any immediate issues (ie, `aa-status` and log
> > files looked OK), I don't understand the changes in the first commit
> > well enough to be confident in sending these patches for inclusion in
> > the upstream stable tree on my own.
> > 
> > Mathias
> 
> Your backports look good to me, and you can stick my acked-by on them.
> The changes are strictly more than necessary for the fix. They are
> part of a larger change set that is trying to cleanup the runtime
> code by changing the permission mapping from a runtime operation
> to something that is done only at policy load/unpack time.
> 
> The advantage of this approach is that while it is a larger change
> than strictly necessary. It is backporting patches that are already
> upstream, keep the code closer and making backports easier.
> 
> Georgia did a minimal backport fix by keeping the version as part
> of policy and doing the permission mapping at runtime. I have
> included that patch below. Its advantage is it is a minimal
> change to fix the issue.
> 
> I am happy with either version going into stable. Do you want to
> send them or do you want me to do it?
> 
> Acked-by: John Johansen <john.johansen@canonical.com>

Thanks a lot, that is *really* much appreicated!

if you can send them that would be great, because think then they come
directly from you, the trust from Greg or Sasha is higher. otherwise I
think they will then explicitly want an ack on that submission thread
from you (or pointing to this Debian downstream bug).

Greg will probably want the backport apporach of the two commits if it
feasible and we do not expect regression from it. But you are
definitively in a better position to judge this :)

Thanks again!

Regards,
Salvatore

p.s.: feel free to CC us as well in the upstream stable submission.


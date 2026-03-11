Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJrVBrjYsmlDQAAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 12 Mar 2026 16:16:08 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DC28D27416C
	for <lists+apparmor@lfdr.de>; Thu, 12 Mar 2026 16:16:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w0hRq-0003PA-GI; Thu, 12 Mar 2026 14:55:38 +0000
Received: from mail-ej1-f52.google.com ([209.85.218.52])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <geert.uytterhoeven@gmail.com>)
 id 1w0KCf-0007xX-Ds
 for apparmor@lists.ubuntu.com; Wed, 11 Mar 2026 14:06:25 +0000
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b96dc65b886so178847566b.0
 for <apparmor@lists.ubuntu.com>; Wed, 11 Mar 2026 07:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773237985; x=1773842785;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wIz9Fr5w5J45ZN4rxwvT/0kjXMGfLP1VpB2aKPOax7k=;
 b=aAvigEoMi7c4nFIfJcGItk52jIyHu7v9MLLDxEdttLkoWRmh8CDFKLm5vkaZllfjAX
 cZ+3OUq8sBOaDx6OZIfoP0uPny5HmOt4jrVx+ToZFqme1JCGjw87gNvgBvtGHGZhxiLu
 jNgJS8ilNSl7uFVdgu6tfx05WhLSdiq7kjBTa/kVFLZJy6zNOkQ9NlToTyEePnbZAMFy
 k4Qx9ychfjTBDDwFc+vrsjjCw2ISlNgIvAqI1vWquXaEUpObpo+4vK81/P0nhYSVLHTa
 Z40rU2OeYoyAqzegXsPRZb3pWvfXWzZHlRHWlocAnZQfhPhVWSJ4wCvEY1lm/JmmjUfO
 huVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhN2zYRS/QluiMqoo5YaRXxjxMqW4UMFvE4ONkTsy2CmPxT3mWkHZi0lOcxW1t5bM2mKUusSaJjg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzjtQKa/kAYKH/tENmYmqz6OpNxT2Y+4OVKeKTSRI0+fS0pqIGU
 uhFQ6oStBOZsSzoD7n9VExXB91/nexFSGQeyQ3+cF4PBj+9j8FjCs+ATeW96PMQnNxDdZQ==
X-Gm-Gg: ATEYQzxupGNRCxND5CUa5MjlSkftdktLQQTe3GxGSf5UnGhskYpUB8Cu8WX8IBBlXkM
 PjzpB0ZIA1iCw7tHM2T+/0isAx6pXOZC2G35GQNvU+SIFN4dT5qeFB3IICBXExiY33jRi2aGcC5
 LHppJC3kFfXExCaOChAEm0DbEl+My8dgScIZsX6ai/wDykCxW+5QWNv0iA5RiBrjTyutZC0iv4k
 TfQzT1NCTa0EiaEV21PJO7YSPA235I18xq08tBLF6IaV4JNDbAknp0jhFYCfZTZ55TkksDWHCz6
 1Ll4LaSKLzLJL5Ny99PLDsY+9tXoiZ1MEGR2k2nvNFGJTjwgehXaimdzPpp5Z6WyQaZ/3nwHT88
 RIoWVbLWgL88V+K1sIaWUBDT8iGErnlkx88sRZ7d5L6EJ/fB2QDPT2gdZskMZycHyQWiOyynreb
 g41VIvY8FSw0NMVbOKz9ol2CG9NcFQENKQvVqfhQsnTZ2TWHMPmYK2VwYLAl8GwoWmYf2DJ+Y=
X-Received: by 2002:a17:907:5c3:b0:b8f:c684:db37 with SMTP id
 a640c23a62f3a-b972d5246afmr165151166b.9.1773237984184; 
 Wed, 11 Mar 2026 07:06:24 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b972e14c45bsm56910366b.34.2026.03.11.07.06.21
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 07:06:22 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-660ea6ceb5aso1627818a12.0
 for <apparmor@lists.ubuntu.com>; Wed, 11 Mar 2026 07:06:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWZWDnKr7qDD7RYgkZxjFN3Eyxq4xC5SsTIRjvcp2II5XJr6uHxeu51AcADAztyHr5v/xNsSfe2dQ==@lists.ubuntu.com
X-Received: by 2002:a17:907:6d16:b0:b88:4f25:81da with SMTP id
 a640c23a62f3a-b97113ff0b9mr462021166b.0.1773237981235; Wed, 11 Mar 2026
 07:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-15-bd63b656022d@avm.de>
 <20260310100750.303af303@gandalf.local.home>
 <20260311141332.b611237d36b61b2409e66cb3@kernel.org>
 <20260311100332.6a2ce4b1@gandalf.local.home>
In-Reply-To: <20260311100332.6a2ce4b1@gandalf.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 15:06:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
X-Gm-Features: AaiRm53WEGMMLW4z34e7P-lM1qFvsCJGZ_o4JNL5NPWbhJPKmcqz6k9bJcyL--8
Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.218.52;
 envelope-from=geert.uytterhoeven@gmail.com; helo=mail-ej1-f52.google.com
X-Mailman-Approved-At: Thu, 12 Mar 2026 14:55:34 +0000
Subject: Re: [apparmor] [PATCH 15/61] trace: Prefer IS_ERR_OR_NULL over
	manual NULL check
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
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org,
 samba-technical@lists.samba.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, gfs2@lists.linux.dev, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-media@vger.kernel.org, dm-devel@lists.linux.dev,
 Philipp Hahn <phahn-oss@avm.de>, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
 linux-sound@vger.kernel.org, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 ceph-devel@vger.kernel.org, linux-omap@vger.kernel.org,
 sched-ext@lists.linux.dev, cocci@inria.fr, linux-nfs@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-s390@vger.kernel.org, v9fs@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 "Masami Hiramatsu \(Google\)" <mhiramat@kernel.org>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-modules@vger.kernel.org,
 bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[25];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,apparmor-bounces@lists.ubuntu.com];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:linux-hyperv@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-sh@vger.kernel.org,m:samba-technical@lists.samba.org,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:gfs2@lists.linux.dev,m:linux-mm@kvack.org,m:linux-sctp@vger.kernel.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-phy@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:iommu@lists.linux.dev,m:intel-wired-lan@lists.osuosl.org,m:linux-arm-kernel@lists.infradead.org,m:linux-input@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-media@vger.kernel.org,m:dm-devel@lists.linux.dev,m:phahn-oss@avm.de,m:linux-pm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:linux-sound@vger.kernel.org,m:linux-block@vger.kernel.o
 rg,m:linux-gpio@vger.kernel.org,m:mathieu.desnoyers@efficios.com,m:ceph-devel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:sched-ext@lists.linux.dev,m:cocci@inria.fr,m:linux-nfs@vger.kernel.org,m:ntfs3@lists.linux.dev,m:linux-s390@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:mhiramat@kernel.org,m:netdev@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-modules@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[apparmor];
	RCPT_COUNT_GT_50(0.00)[57];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,goodmis.org:email]
X-Rspamd-Queue-Id: DC28D27416C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Steven,

On Wed, 11 Mar 2026 at 15:03, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Wed, 11 Mar 2026 14:13:32 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
>
> > Hmm, now IS_ERR_OR_NULL() is an inline function, so it is safe.
> > But if you want to use IS_ERR_OR_NULL() here, it will be better something like
> >
> > node = rhashtable_walk_next(&iter);
> > while (!IS_ERR_OR_NULL(node)) {
> >       fprobe_remove_node_in_module(mod, node, &alist);
> >       node = rhashtable_walk_next(&iter);
> > }
>
> But now you need to have a duplicate code in order to acquire "node"
>
> I think the patch just makes the code worse.

Obviously we need a new for_each_*() helper hiding all the gory internals?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


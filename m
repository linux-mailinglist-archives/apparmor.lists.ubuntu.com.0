Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CChCC7abFGqGOwcAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 25 May 2026 20:57:58 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B23D5CDDB4
	for <lists+apparmor@lfdr.de>; Mon, 25 May 2026 20:57:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wRaUh-0000r5-6Z; Mon, 25 May 2026 18:57:43 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <petr.pavlu@suse.com>)
 id 1wRVSY-0000uI-J3
 for apparmor@lists.ubuntu.com; Mon, 25 May 2026 13:35:10 +0000
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-441209fb77eso5927327f8f.1
 for <apparmor@lists.ubuntu.com>; Mon, 25 May 2026 06:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1779716110; x=1780320910; darn=lists.ubuntu.com;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9XVHRPBSt9KXo5wrulw6nEDVPqzcFN/DF35DZwL4F0c=;
 b=U+CV7wtPd1ubZ+Xp2POAZuw26yl+4pXBp/9X2mSipfLhGxiWM8yHCiqPk0ldMe89f1
 iMOm/EocBf0tD9UD9vuwYOwlQRwFz4zrE0xVwHZM+Xfqb4EZDpETYk4eA32c89cKdaw3
 mDTl5VdzvsrZeZV6T6C9kbZjJeHtF4hBb11bRSBVUf4akubtgVUBavTzgMdhRq4Ci0wi
 S7FBP3taZQeHZyGZQ0Eyv0FeT5aN3+oNoo3GkKTcVuJDvhXzt/Y9elxQ3GSyeMHrOGQr
 il4CM12vbI3STfE3hthf/QQhFwkjoWlrtVvCtle8UYUaWrPNHDbFlRVx7oWF1/Zt7rUV
 VArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779716110; x=1780320910;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9XVHRPBSt9KXo5wrulw6nEDVPqzcFN/DF35DZwL4F0c=;
 b=KPcnHrNSFDd4w9ev5XTcI8C/l7L6kxjeHt98kbUpODgI5qW68hrBnCa1p0J2tvidlH
 mVsZw9f2S0scBTFZadzUGqN5c2QvK/YtjwDe+eQjHatWUKozVAqzLYg5vlF1whoxZex7
 QXqat43S0cQ2rNotHU1an2a6SW3XVHCvM1joSG/wVKE5HPtfHrXaS2S36+/HUV8o3bhE
 UYHuISAAooktMo0E50FnlcrEemsdghlBkzrYawZizNqNPvMP8I5n8gmDV5jFtbnj+b0R
 Q0lGwTUKKHciPP5ui0jnCJSaXqKEwWG+Gu7W9aaiO9mVQxvdxx6UPuAK5QywKS1jxBiS
 sMxw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9s3lTfGdhU+argpEw4VHtUFUiXYCTczxYFkByHt0i185WudC76ogWo9DGOexxJp1bqMl0E6d4lcg==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YybpjGachkWmnrPUnSIW5qZGpPOE6Trprs2r94ACNU3EMjcNOjs
 9Ld2lpMZIMxQgCOgI7zSr+tuf8e0rxkF9c/X6IJ6uZQJZzCipnaAc6fRiky8yB1bd3I=
X-Gm-Gg: Acq92OFMhWhwdfulce37akBn8QUgXl95BQ7Thp0y1pAQCns3LtHvHRbg284ICh8Z8ZX
 bcCERf+lWxtBiNoIk6TICzdolXhNgT0ha3g5lT1E1x39+NRbrRfBYgUMLAUx92VMH9XEsJJGBVf
 2aLocd+jRqXDG595ackuB4626DqEWYeCBs5BD+yVclLJqQ/LjcWDtO8dQNxEE0Tojffk2qGBAti
 2sP/kEHMcPXzDSGPfPKCRKJ8ZVJytHn/a/LfFmZownS2OeLjbpHemUjr++YzCktNOXx7Vc3WK+2
 Ma4blPUFXzY9usfhqZ3lisYzUUeepn7usLmIS7l1JE5Gqk/q41H7PgAqxayHsVGx1GSs0dkv2Wt
 /cwImscxMWnzFhiXR2ryvVr7jdo0l+FXBafWhvcosjdgJ3FWossZO+QHcwqJzFMDHgNNUBfGhwx
 AKs83HZMMsPck5pK6lbcx6b9eLtPtzHH+vUTrJk8kYj0XIQanW89rFLvr6DkZPhkAC4yC1NNfbu
 KsYeI0DuYgyKVKJvy7ZPTJkdrQpvNbEvkN/ufvblekqGakt5p0UmOLzmaBzT1GWlzcLZA==
X-Received: by 2002:a05:6000:2008:b0:45e:8cdc:4ee8 with SMTP id
 ffacd0b85a97d-45ea3128ccdmr31052715f8f.6.1779716109692; 
 Mon, 25 May 2026 06:35:09 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100?
 (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz.
 [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d5cb9asm29456456f8f.27.2026.05.25.06.35.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2026 06:35:09 -0700 (PDT)
Message-ID: <da358ae1-91b4-4a16-ac76-ffab99c230b9@suse.com>
Date: Mon, 25 May 2026 15:35:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kees Cook <kees@kernel.org>
References: <20260521133315.work.845-kees@kernel.org>
 <20260521133326.2465264-4-kees@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260521133326.2465264-4-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.221.53; envelope-from=petr.pavlu@suse.com;
 helo=mail-wr1-f53.google.com
X-Mailman-Approved-At: Mon, 25 May 2026 18:57:41 +0000
Subject: Re: [apparmor] [PATCH 04/11] treewide: Convert struct
 kernel_param_ops initializers to DEFINE_KERNEL_PARAM_OPS
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 linux-arch@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, James Morris <jmorris@namei.org>,
 kasan-dev@googlegroups.com, Tvrtko Ursulin <tursulin@ursulin.net>,
 linux-acpi@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-media@vger.kernel.org, Lukasz Luba <lukasz.luba@arm.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Simona Vetter <simona@ffwll.ch>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leon@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Gabriel Somlo <somlo@cmu.edu>,
 Len Brown <lenb@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jason Baron <jbaron@akamai.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jim Cromie <jim.cromie@gmail.com>,
 Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>,
 usb-storage@lists.one-eyed-alien.net, linux-pci@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-rdma@vger.kernel.org,
 Sami Tolvanen <samitolvanen@google.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Marco Elver <elver@google.com>,
 intel-gfx@lists.freedesktop.org, Corey Minyard <corey@minyard.net>,
 Borislav Petkov <bp@alien8.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 openipmi-developer@lists.sourceforge.net,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Hans de Goede <hansg@kernel.org>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 qemu-devel@nongnu.org, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>, Daniel Gomez <da.gomez@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-scsi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 linux-security-module@vger.kernel.org,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org,
 Zhang Rui <rui.zhang@intel.com>, Heiko Carstens <hca@linux.ibm.com>,
 apparmor@lists.ubuntu.com, virtualization@lists.linux.dev,
 linux-hardening@vger.kernel.org, Hannes Reinecke <hare@suse.de>,
 Benjamin Berg <benjamin.berg@intel.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Tiwei Bie <tiwei.btw@antgroup.com>, Dmitry Vyukov <dvyukov@google.com>,
 netdev@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 linux-modules@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[suse.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[suse.com:s=google];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:rafael@kernel.org,m:dri-devel@lists.freedesktop.org,m:pengpeng@iscas.ac.cn,m:srinivas.pandruvada@linux.intel.com,m:linux-arch@vger.kernel.org,m:bvanassche@acm.org,m:jgg@ziepe.ca,m:jmorris@namei.org,m:kasan-dev@googlegroups.com,m:tursulin@ursulin.net,m:linux-acpi@vger.kernel.org,m:stern@rowland.harvard.edu,m:linux-pm@vger.kernel.org,m:linux-um@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mcgrof@kernel.org,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:linux-media@vger.kernel.org,m:lukasz.luba@arm.com,m:macro@orcam.me.uk,m:dave.hansen@linux.intel.com,m:James.Bottomley@HansenPartnership.com,m:simona@ffwll.ch,m:xuanzhuo@linux.alibaba.com,m:paul@paul-moore.com,m:leon@kernel.org,m:Frank.Li@kernel.org,m:somlo@cmu.edu,m:lenb@kernel.org,m:gor@linux.ibm.com,m:jani.nikula@linux.intel.com,m:jbaron@akamai.com,m:bhelgaas@google.com,m:jim.cromie@gmail.com,m:seanjc@google.com,
 m:tglx@kernel.org,m:usb-storage@lists.one-eyed-alien.net,m:linux-pci@vger.kernel.org,m:jasowang@redhat.com,m:joonas.lahtinen@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:david.e.box@linux.intel.com,m:jirislaby@kernel.org,m:linux-rdma@vger.kernel.org,m:samitolvanen@google.com,m:ilpo.jarvinen@linux.intel.com,m:serge@hallyn.com,m:elver@google.com,m:intel-gfx@lists.freedesktop.org,m:corey@minyard.net,m:bp@alien8.de,m:rodrigo.vivi@intel.com,m:openipmi-developer@lists.sourceforge.net,m:mchehab@kernel.org,m:martin.petersen@oracle.com,m:atomlin@atomlin.com,m:hansg@kernel.org,m:kvm@vger.kernel.org,m:mst@redhat.com,m:peterz@infradead.org,m:hpa@zytor.com,m:qemu-devel@nongnu.org,m:linux-mm@kvack.org,m:glider@google.com,m:da.gomez@kernel.org,m:airlied@gmail.com,m:anton.ivanov@cambridgegreys.com,m:linux-scsi@vger.kernel.org,m:richard@nod.at,m:x86@kernel.org,m:linux-security-module@vger.kernel.org,m:eperezma@redhat.com,m:mingo@redhat.com,m:linux-serial@vger.kernel.org,m:rui.zhang@intel.co
 m,m:hca@linux.ibm.com,m:apparmor@lists.ubuntu.com,m:virtualization@lists.linux.dev,m:linux-hardening@vger.kernel.org,m:hare@suse.de,m:benjamin.berg@intel.com,m:daniel.lezcano@kernel.org,m:andriy.shevchenko@linux.intel.com,m:tiwei.btw@antgroup.com,m:dvyukov@google.com,m:netdev@vger.kernel.org,m:vkoul@kernel.org,m:dmaengine@vger.kernel.org,m:pbonzini@redhat.com,m:johannes@sipsolutions.net,m:linuxppc-dev@lists.ozlabs.org,m:linux-modules@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lists.freedesktop.org,iscas.ac.cn,linux.intel.com,vger.kernel.org,acm.org,ziepe.ca,namei.org,googlegroups.com,ursulin.net,rowland.harvard.edu,lists.infradead.org,linuxfoundation.org,linux-foundation.org,arm.com,orcam.me.uk,HansenPartnership.com,ffwll.ch,linux.alibaba.com,paul-moore.com,cmu.edu,linux.ibm.com,akamai.com,google.com,gmail.com,lists.one-eyed-alien.net,redhat.com,ideasonboard.com,hallyn.com,minyard.net,alien8.de,intel.com,lists.sourceforge.net,oracle.com,atomlin.com,infradead.org,zytor.com,nongnu.org,kvack.org,cambridgegreys.com,nod.at,lists.ubuntu.com,lists.linux.dev,suse.de,antgroup.com,sipsolutions.net,lists.ozlabs.org];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[petr.pavlu@suse.com,apparmor-bounces@lists.ubuntu.com];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:-];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[96];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.232];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 1B23D5CDDB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 3:33 PM, Kees Cook wrote:
> Using Coccinelle, rewrite every struct kernel_param_ops initializer that
> sets .get into a DEFINE_KERNEL_PARAM_OPS-family macro invocation,
> for example:
> 
> @@
> declarer name DEFINE_KERNEL_PARAM_OPS;
> identifier OPS;
> expression SET, GET;
> @@
> - const struct kernel_param_ops OPS = {
> -       .set = SET,
> -       .get = GET,
> - };
> + DEFINE_KERNEL_PARAM_OPS(OPS, SET, GET);
> 
> Using the macro for initialization means future changes can manipulate
> the struct layout and callback prototypes without having to change every
> initializer.

Nit: For consistency, I suggest also converting the few remaining
kernel_param_ops instances that specify only .set and no .get, such as
simdisk_param_ops_filename.

-- 
Thanks,
Petr


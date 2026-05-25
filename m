Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IqUIbGbFGo0OwcAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 25 May 2026 20:57:53 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 588C05CDDAB
	for <lists+apparmor@lfdr.de>; Mon, 25 May 2026 20:57:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wRaUj-0000rc-28; Mon, 25 May 2026 18:57:45 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <petr.pavlu@suse.com>)
 id 1wRYoZ-0004dU-HQ
 for apparmor@lists.ubuntu.com; Mon, 25 May 2026 17:10:07 +0000
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490388fd0dbso41525875e9.0
 for <apparmor@lists.ubuntu.com>; Mon, 25 May 2026 10:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1779729007; x=1780333807; darn=lists.ubuntu.com;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=izugkSqOYsBmSyQ8jfD9m1SVj73YG14U78pRBc6Lai0=;
 b=AydhrWKkbny0vTv1cZQT3A2Rw3FNpKWHlguc2Zzd+pbqCbuVWM5aeBitHE85Mi6omt
 LOLK4QALZk7YtrQNWuAtsTKfuL3WMpdiIC3E4hMLvGdy+roR00Y4jz0uxaHm83NbSI+9
 JlA1k616rQLk5s48tO9652LJlL+b4dVHfsx/Pn6NNLi/vQjIpbEFhOrZjuaMhYya94C9
 O7Wy0uF5eeVEvUXFc62pFABcn2im4Sb9QuH+G4+bH22906nqnPzc4cWNvEz17Uj49fOh
 YDiYdlAx5xnuEzYbpuEgXl7K7C69TY1QpPovksX1iRzxyHm/Hvoj/8AP8K4TispXlGZN
 TDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779729007; x=1780333807;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=izugkSqOYsBmSyQ8jfD9m1SVj73YG14U78pRBc6Lai0=;
 b=PVD7qHgCCjdYU4Rtx2jQxuGHyMtvFoTAyKg5Wl7RfRpMRmmxTR6JA++ovGkj1B3qge
 AiPkgPR327o/VCPINQV4D9o+xbixtrLFXuZ4tOOgL3pwAco4UEZrj1011xswa+OBDgPl
 435yd3RXQcqbuwmr0zg8nHnU8T11chtIIJfh9oLcvWyanXrNkUYG0hSo3zta0hy9gtET
 LMD/7lLa7hrKJzHJmhPy5gtyjsgDctANtsIDXEIXQdzwkJl3peAZJ9J6u9lQdAu6NFi0
 U32JbkWpkJw2UVvXdubEb1xAsE8dD/rBo4UYDac9A117NVd12UYgc0D7cRCMXW0dTwgK
 /ODA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/pxJEACuobrJd/2Xk8tgQ+go6NnC1Ue4ckUHdzi9wEZow1KzDjD8TJHik2OtQSP1sS/Uzje1hf1w==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YyiabcRIR96QNvpoCnP/glSH6Ff+ogA53wj/9gxEp2wivGuu2h+
 MUGWU5r6VHENFMDtEhdRLrStde4xTv+ZmKK5zCFCLaYMRhtDa+da/k71QtCx8n94hAc=
X-Gm-Gg: Acq92OGhI8/ImbY+NYMVoO9CBPfhfCxghQGV66u7Ai0thybioxpSTEl2QJewjpfFxUn
 Px8Ha4alD8sT1omBIHOpKQmrtYNfADeAmqBTmIrq00hve7/olkfavWamXQL9CzLo2hAp6hBIvIY
 7ft61kfxC417zw7nCtutz23Yqj8oJp7Kvo0DrqACIvcyeo9MBr6P9tOCVAi7+jkR8IWbC9oxv29
 hzF+9GObXIEho/BJZEt5P0QM1QI7vBLFG9J32EwFGRVdPf+Wvk9VFLNWQfXanbluDDM5SAE8a2M
 QAZz43xJxgtU2vHLiln+CKr5nr5hGnII6N0O3BvTXI1T9hUMMNZ0TAZHVlFtc9R8G9FmT207pca
 miDf2j0GjYaeMTky5u5DIyoIdORph1mEZqUhAKttnGRim24xBIYv+YdcyGMAtF3FuG/B36x2mAv
 +Iolt9nvSppZMvURGSdUWGaCl19HjaGYnEQerG+2OyJzHGp1F0MexsFEVAtEoqImh8lRuX0GLl3
 gDI0CGWsnl4dR1ovmkohRA3vSnU60p3ECs3UaywuRfxjKT8Yxquv8zVOQDXTuq1zXC6WN7EsEdG
 B2PKkTuLTBFfbHc=
X-Received: by 2002:a05:600c:35cf:b0:490:44eb:c1e5 with SMTP id
 5b1f17b1804b1-49044ebc257mr277307095e9.31.1779729006482; 
 Mon, 25 May 2026 10:10:06 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100?
 (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz.
 [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904526c926sm456877405e9.1.2026.05.25.10.10.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2026 10:10:06 -0700 (PDT)
Message-ID: <a192eb5c-5d16-483d-862e-d937fa1b8269@suse.com>
Date: Mon, 25 May 2026 19:10:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kees Cook <kees@kernel.org>
References: <20260521133315.work.845-kees@kernel.org>
 <20260521133326.2465264-8-kees@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260521133326.2465264-8-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.46; envelope-from=petr.pavlu@suse.com;
 helo=mail-wm1-f46.google.com
X-Mailman-Approved-At: Mon, 25 May 2026 18:57:41 +0000
Subject: Re: [apparmor] [PATCH 08/11] params: Convert generic
 kernel_param_ops .get helpers to seq_buf
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
	NEURAL_HAM(-0.00)[-0.252];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 588C05CDDAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 3:33 PM, Kees Cook wrote:
> Convert the generic struct kernel_param_ops .get helpers in
> kernel/params.c directly to the seq_buf signature, drop their legacy
> "char *" form, and refresh prototypes in <linux/moduleparam.h>:
> 
>   param_get_byte/short/ushort/int/uint/long/ulong/ullong/hexint
>   param_get_charp/bool/invbool/string
>   param_array_get
> 
> The STANDARD_PARAM_DEF() macro expands to a seq_buf body for every
> numeric helper. param_array_get() now writes element output directly
> into the parent seq_buf when the element ops provide .get; it only
> allocates the per-call PAGE_SIZE bounce buffer when the element ops
> still use the legacy .get_str path. The common "rewrite the prior
> element's trailing newline as a comma" step lives outside both
> branches so the two paths share it.
> 
> The non-core changes in this commit (arch/x86/kvm, mm/kfence,
> drivers/dma/dmatest, security/apparmor) are the small set of callers that
> directly invoke one of the converted generic helpers from their own .get
> callback (e.g. an apparmor wrapper that adds a capability check and then
> delegates to param_get_bool()). Because the helpers' signature changes
> here, these wrappers must move in lockstep. Each of them is updated
> to take "struct seq_buf *" and pass it through; param_get_debug() in
> apparmor also pulls aa_print_debug_params() (and its val_mask_to_str()
> helper, in security/apparmor/lib.c) over to seq_buf, since that is the
> only consumer. No other behavioural change is intended.
> 
> Custom .get callbacks that do not delegate to a generic helper (and
> therefore still match the .get_str signature) are routed automatically
> to the .get_str field by the DEFINE_KERNEL_PARAM_OPS _Generic dispatcher
> and are deliberately left alone here, to be changed separately within
> their respective subsystems.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> [...]
> @@ -453,36 +457,46 @@ static int param_array_set(const char *val, const struct kernel_param *kp)
>  			   arr->num ?: &temp_num);
>  }
>  
> -static int param_array_get(char *buffer, const struct kernel_param *kp)
> +static int param_array_get(struct seq_buf *s, const struct kernel_param *kp)
>  {
> -	int i, off, ret;
> -	char *elem_buf;
>  	const struct kparam_array *arr = kp->arr;
>  	struct kernel_param p = *kp;
> +	char *elem_buf = NULL;
> +	int i, ret = 0;
>  
> -	elem_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
> -	if (!elem_buf)
> -		return -ENOMEM;
> +	for (i = 0; i < (arr->num ? *arr->num : arr->max); i++) {
> +		size_t before = s->len;
>  
> -	for (i = off = 0; i < (arr->num ? *arr->num : arr->max); i++) {
>  		p.arg = arr->elem + arr->elemsize * i;
>  		check_kparam_locked(p.mod);
> -		ret = arr->ops->get_str(elem_buf, &p);
> -		if (ret < 0)
> -			goto out;
> -		ret = min(ret, (int)(PAGE_SIZE - 1 - off));
> -		if (!ret)
> +
> +		if (arr->ops->get) {
> +			ret = arr->ops->get(s, &p);
> +			if (ret < 0)
> +				goto out;
> +		} else {
> +			if (!elem_buf) {
> +				elem_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
> +				if (!elem_buf) {
> +					ret = -ENOMEM;
> +					goto out;
> +				}
> +			}
> +			ret = arr->ops->get_str(elem_buf, &p);
> +			if (ret < 0)
> +				goto out;
> +			seq_buf_putmem(s, elem_buf, ret);
> +		}
> +
> +		/* Nothing got written (e.g. overflow) — stop. */
> +		if (s->len == before)
>  			break;
> +
>  		/* Replace the previous element's trailing newline with a comma. */
> -		if (i)
> -			buffer[off - 1] = ',';
> -		memcpy(buffer + off, elem_buf, ret);
> -		off += ret;
> -		if (off == PAGE_SIZE - 1)
> -			break;
> +		if (i && s->buffer[before - 1] == '\n')
> +			s->buffer[before - 1] = ',';
>  	}
> -	buffer[off] = '\0';
> -	ret = off;
> +	ret = 0;
>  out:
>  	kfree(elem_buf);
>  	return ret;

Since you're almost completely rewriting the logic in param_array_get(),
I suggest tightening it up a bit. The function could warn or return an
error when a kernel_param_ops::get/get_str() call adds a string that
doesn't terminate with '\n', specifically, when the call adds either
a zero-length string or a non-zero-length string that ends with
a different character (unless an overflow occurred).

The updated code silently stops the loop when a get call returns
a zero-length string. Similarly, handling of a string not terminated by
'\n' is halfway there because of the added check
"s->buffer[before - 1] == '\n'".

-- 
Thanks,
Petr


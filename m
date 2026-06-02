Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fNzJDY9GH2oCjgAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 02 Jun 2026 23:09:35 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D08C163204E
	for <lists+apparmor@lfdr.de>; Tue, 02 Jun 2026 23:09:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=gmail.com header.s=20251104 header.b=NsRHBrhe;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wUPQo-0004G1-Ey; Tue, 02 Jun 2026 13:45:22 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <david.laight.linux@gmail.com>)
 id 1wUOng-0003Fd-GH
 for apparmor@lists.ubuntu.com; Tue, 02 Jun 2026 13:04:56 +0000
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso60989675e9.0
 for <apparmor@lists.ubuntu.com>; Tue, 02 Jun 2026 06:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780405496; x=1781010296; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H/8nMdqnIqVIuE86ZCCEmz0EQ1iXOszPXfKX9VZoGH4=;
 b=NsRHBrhePLef4Ff+8Jh4vZB822GKLUP1KpPKOHxMemVlyODjLYFcjLs2WXBwInprXx
 ZwrjS7HPab/vDZUwxezDUnjnXhMvvfH4k58c7OoH737HdJAVyXGYFMy2AHE+RUh7Waxb
 A1xwHQsJWeHWFpm2ZLAPYxnjPuW8YKTjI/aap2TwzvaA2I3fBWqjl5Tt/cOoVSlCXgXQ
 F7VppUVTkk729fG+DNi+6C7A0dd7ekIJKC8R/ulfCHkd+JmESdauf3SbH9i3vdA5GIhx
 gZd75k3Ynx0P0AoiGMFb8qMVtr8BPk3+sZrOkMMPZGbOMpSdNL4o0HLu3JHcaY0HXUcS
 OGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780405496; x=1781010296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H/8nMdqnIqVIuE86ZCCEmz0EQ1iXOszPXfKX9VZoGH4=;
 b=tED77yoKQPpne9/Y39gyRlQCHiY2Ec62tgTj4SYP7mcH+8JlhbN+ucy8mQW11HWwdu
 bKoApi5VLv5nnNQ9AjNKvPqHKLEhkbGr5S/h8PU2ArUNXXUzl6kv9EhrgxALy6HqxCgb
 UubSrQLJgmjP0gHXS3MrRPRjTAjhk68wqS6iUhj/VjzUsZ0XJt21U2q4MY7oHRQWGijj
 sWeNnQF+/SnzPutz0YSxH8PYiNccWZb2+bEWTWERThCsZTSfrW/8YhX79/RCMIzvO5go
 mkSm5lQpaa3pWsy89z34Yd9/QSEz1mdtNJcox6kqt2D4Qnly/CFMxXtwSEL5wWxG6370
 fUSQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+VSZoTWA3f4oWCJjJgUVlF1Qo7fJePKYxwo7B+mfcMkzMgBK6dGmJHJWdtJf4voIDz1eaIBU04+g==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwlZtiQO4Q5fNq7tYDt8TvnQyauRrGCJAFkG5a51GQ7AZ6mC0QP
 CAtl2PzBpC23iCH9KA6EQ7Go2k3Qmztu3Uns/TT/WxqQdj+ccsfb+k9Y
X-Gm-Gg: Acq92OEjZ94urt/IPL0ThjuvYTdFuI36PpfM6mWSt+ubRpkJhWPxoxn+bfo6rXAD+S1
 cZgjEaMkSB2+WilHcLe24L+PsdyDPUZTHXde9p/RwclRXjGVukyDzRtiCPoiiEj95mvm1mNTQtF
 CK+NocXriieTiBncPkqrLjpk2gy8ZYrCtCJ/g+HAGGK01plI91WMlHnlDdzK535CFiZRsTobejO
 Xoejxxh8PprCXxmryLRun1pL5Fy7KRSHjDKgi7Qc2t2FN1YzPu+KdWz3jKxcqbiq3hFoC5a0TMX
 7erCJs7OSAVe6IdqtP+PghWee9HSLMY0d0Q6qB9n+TqIlm0UlvHQdT30K2IP+nu8c9OA+SiffTH
 eeUQPxnHEwAb4J/96x9qkBS2ug5U/WsKRzCDJRdIsvuG8okF/lnCDQr0B/xeRNO5WKuXAKr+smu
 0K4xaS8PrJuokUXIe/O0c5djMBaao6iB/YnhwcdNjH8JnL9432pQgTDLAWUkut/vlogQ0hNIER+
 YKvnHni+w==
X-Received: by 2002:a05:600c:8105:b0:490:b072:1be6 with SMTP id
 5b1f17b1804b1-490b0721e0amr76565325e9.25.1780405495119; 
 Tue, 02 Jun 2026 06:04:55 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34b834esm33184301f8f.11.2026.06.02.06.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 06:04:54 -0700 (PDT)
Date: Tue, 2 Jun 2026 14:04:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20260602140451.2e3e6622@pumpkin>
In-Reply-To: <ah699hwLxIIOZ0-7@ashevche-desk.local>
References: <20260521133315.work.845-kees@kernel.org>
 <20260521133326.2465264-1-kees@kernel.org>
 <ah699hwLxIIOZ0-7@ashevche-desk.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.128.47;
 envelope-from=david.laight.linux@gmail.com; helo=mail-wm1-f47.google.com
X-Mailman-Approved-At: Tue, 02 Jun 2026 13:45:21 +0000
Subject: Re: [apparmor] [PATCH 01/11] params: bound array element output to
 the caller's page buffer
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
 usb-storage@lists.one-eyed-alien.net, linux-arch@vger.kernel.org,
 Bart Van Assche <bvanassche@acm.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 James Morris <jmorris@namei.org>, kasan-dev@googlegroups.com,
 Tvrtko Ursulin <tursulin@ursulin.net>, linux-acpi@vger.kernel.org,
 Alan Stern <stern@rowland.harvard.edu>, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 Lukasz Luba <lukasz.luba@arm.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Dave Hansen <dave.hansen@linux.intel.com>, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>,
 Simona Vetter <simona@ffwll.ch>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leon@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Gabriel Somlo <somlo@cmu.edu>,
 Len Brown <lenb@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jason Baron <jbaron@akamai.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jim Cromie <jim.cromie@gmail.com>,
 Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>,
 Kees Cook <kees@kernel.org>, linux-pci@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-rdma@vger.kernel.org,
 Sami Tolvanen <samitolvanen@google.com>,
 Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Marco Elver <elver@google.com>,
 Petr Pavlu <petr.pavlu@suse.com>, intel-gfx@lists.freedesktop.org,
 Corey Minyard <corey@minyard.net>, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
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
 Eugenio =?UTF-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org,
 Zhang Rui <rui.zhang@intel.com>, Heiko Carstens <hca@linux.ibm.com>,
 apparmor@lists.ubuntu.com, virtualization@lists.linux.dev,
 linux-hardening@vger.kernel.org, Hannes Reinecke <hare@suse.de>,
 Benjamin Berg <benjamin.berg@intel.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Tiwei Bie <tiwei.btw@antgroup.com>,
 Dmitry Vyukov <dvyukov@google.com>, netdev@vger.kernel.org,
 stable@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 linux-modules@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.99 / 15.00];
	SEM_URIBL(3.50)[lists.ubuntu.com:from_smtp];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:rafael@kernel.org,m:dri-devel@lists.freedesktop.org,m:pengpeng@iscas.ac.cn,m:srinivas.pandruvada@linux.intel.com,m:usb-storage@lists.one-eyed-alien.net,m:linux-arch@vger.kernel.org,m:bvanassche@acm.org,m:jgg@ziepe.ca,m:jmorris@namei.org,m:kasan-dev@googlegroups.com,m:tursulin@ursulin.net,m:linux-acpi@vger.kernel.org,m:stern@rowland.harvard.edu,m:linux-pm@vger.kernel.org,m:linux-um@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mcgrof@kernel.org,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:linux-media@vger.kernel.org,m:lukasz.luba@arm.com,m:macro@orcam.me.uk,m:dave.hansen@linux.intel.com,m:James.Bottomley@hansenpartnership.com,m:simona@ffwll.ch,m:xuanzhuo@linux.alibaba.com,m:paul@paul-moore.com,m:leon@kernel.org,m:Frank.Li@kernel.org,m:somlo@cmu.edu,m:lenb@kernel.org,m:gor@linux.ibm.com,m:jani.nikula@linux.intel.com,m:jbaron@akamai.com,m:bhelga
 as@google.com,m:jim.cromie@gmail.com,m:seanjc@google.com,m:tglx@kernel.org,m:kees@kernel.org,m:linux-pci@vger.kernel.org,m:jasowang@redhat.com,m:joonas.lahtinen@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:david.e.box@linux.intel.com,m:jirislaby@kernel.org,m:linux-rdma@vger.kernel.org,m:samitolvanen@google.com,m:ilpo.jarvinen@linux.intel.com,m:serge@hallyn.com,m:elver@google.com,m:petr.pavlu@suse.com,m:intel-gfx@lists.freedesktop.org,m:corey@minyard.net,m:bp@alien8.de,m:rodrigo.vivi@intel.com,m:openipmi-developer@lists.sourceforge.net,m:mchehab@kernel.org,m:martin.petersen@oracle.com,m:atomlin@atomlin.com,m:hansg@kernel.org,m:kvm@vger.kernel.org,m:mst@redhat.com,m:peterz@infradead.org,m:hpa@zytor.com,m:qemu-devel@nongnu.org,m:linux-mm@kvack.org,m:glider@google.com,m:da.gomez@kernel.org,m:airlied@gmail.com,m:anton.ivanov@cambridgegreys.com,m:linux-scsi@vger.kernel.org,m:richard@nod.at,m:x86@kernel.org,m:linux-security-module@vger.kernel.org,m:eperezma@redhat.com,m:mingo@redh
 at.com,m:linux-serial@vger.kernel.org,m:rui.zhang@intel.com,m:hca@linux.ibm.com,m:apparmor@lists.ubuntu.com,m:virtualization@lists.linux.dev,m:linux-hardening@vger.kernel.org,m:hare@suse.de,m:benjamin.berg@intel.com,m:daniel.lezcano@kernel.org,m:tiwei.btw@antgroup.com,m:dvyukov@google.com,m:netdev@vger.kernel.org,m:stable@vger.kernel.org,m:vkoul@kernel.org,m:dmaengine@vger.kernel.org,m:pbonzini@redhat.com,m:johannes@sipsolutions.net,m:linuxppc-dev@lists.ozlabs.org,m:linux-modules@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,apparmor-bounces@lists.ubuntu.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[kernel.org,lists.freedesktop.org,iscas.ac.cn,linux.intel.com,lists.one-eyed-alien.net,vger.kernel.org,acm.org,ziepe.ca,namei.org,googlegroups.com,ursulin.net,rowland.harvard.edu,lists.infradead.org,linuxfoundation.org,linux-foundation.org,arm.com,orcam.me.uk,hansenpartnership.com,ffwll.ch,linux.alibaba.com,paul-moore.com,cmu.edu,linux.ibm.com,akamai.com,google.com,gmail.com,redhat.com,ideasonboard.com,hallyn.com,suse.com,minyard.net,alien8.de,intel.com,lists.sourceforge.net,oracle.com,atomlin.com,infradead.org,zytor.com,nongnu.org,kvack.org,cambridgegreys.com,nod.at,lists.ubuntu.com,lists.linux.dev,suse.de,antgroup.com,sipsolutions.net,lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	RCPT_COUNT_GT_50(0.00)[98];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D08C163204E

On Tue, 2 Jun 2026 14:26:46 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Thu, May 21, 2026 at 06:33:14AM -0700, Kees Cook wrote:
> > 
> > param_array_get() appends each element's string representation into the
> > shared sysfs page buffer by passing buffer + off to the element getter.
> > 
> > That works for getters that only write a small bounded string, but
> > param_get_charp() and similar helpers format against PAGE_SIZE from the
> > pointer they receive. Once off is non-zero, an element getter can
> > therefore write past the end of the original sysfs page buffer.
> > 
> > Collect each element into a temporary PAGE_SIZE buffer first and then
> > copy only the remaining space into the caller's page buffer.  
> 
> ...
> 
> > +	elem_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);  
> 
> get_free_page() (or how it is called)?

The kmalloc() should be faster and I think has to be aligned.
There is another patch set to replace get_free_pages() with kmalloc().

Although all these 'show' functions should really head to using a safer
interface.
Although, at the moment, it is really difficult to find the ones that
are guaranteed to be passed a page aligned buffer.

-- David

> 
> > +	if (!elem_buf)
> > +		return -ENOMEM;
> > +
> >  	for (i = off = 0; i < (arr->num ? *arr->num : arr->max); i++) {
> > -		/* Replace \n with comma */
> > -		if (i)
> > -			buffer[off - 1] = ',';
> >  		p.arg = arr->elem + arr->elemsize * i;
> >  		check_kparam_locked(p.mod);
> > -		ret = arr->ops->get(buffer + off, &p);
> > +		ret = arr->ops->get(elem_buf, &p);
> >  		if (ret < 0)
> > -			return ret;
> > +			goto out;
> > +		ret = min(ret, (int)(PAGE_SIZE - 1 - off));  
> 
> It's usually discouraged to use castings in min/max/clamp. Can we make ret long
> or do something different here?
> 
> > +		if (!ret)
> > +			break;  
> 
> > +		/* Replace the previous element's trailing newline with a comma. */
> > +		if (i)
> > +			buffer[off - 1] = ',';  
> 
> Can't we do this after with help of strreplace()?
> 
> > +		memcpy(buffer + off, elem_buf, ret);
> >  		off += ret;
> > +		if (off == PAGE_SIZE - 1)
> > +			break;
> >  	}
> >  	buffer[off] = '\0';
> > -	return off;
> > +	ret = off;
> > +out:
> > +	kfree(elem_buf);
> > +	return ret;  
> 



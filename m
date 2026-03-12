Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCnGK0P7smmLRAAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 12 Mar 2026 18:43:31 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3E0276B7E
	for <lists+apparmor@lfdr.de>; Thu, 12 Mar 2026 18:43:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w0k46-0000Rb-Fq; Thu, 12 Mar 2026 17:43:18 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jgg@ziepe.ca>) id 1w0jJE-00085a-1r
 for apparmor@lists.ubuntu.com; Thu, 12 Mar 2026 16:54:52 +0000
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-509164dce91so11154651cf.1
 for <apparmor@lists.ubuntu.com>; Thu, 12 Mar 2026 09:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1773334491; x=1773939291; darn=lists.ubuntu.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VQXCfPVu6b6dIVECzm0C8AUD7IL7VvpSkD5+M4S95sw=;
 b=ASMqsiRfvRBSWMwdNQ7U00BxBm+uVUAr2X6ILPOUpsv9g3IIuBXRbyHEeKoaODyY5x
 RdajjaDAaSK49E0lzBR2mk3SQn4LO9S38pnV0hE9IqH8tW6Ue6fSIA+ac/UoP0C1W/vV
 H7PSpOZCh+9fCjymJE14Ef94b/4DNdklADFMnkrzmA2a7s/C7D13NgXwF6nRQ82r9y/n
 TwUbsdG2xcQ/bIfeNS+mdtOyqPyGweYznijiSpcoGOgsRohKuLB46tgJLJJZuWxqns1v
 Kd/w7KGaaX8Wq/uyPLdgtKI8R9motzNG6bOxsZHzmymQVUkgXExFk4Yahp/dPE8oMNkC
 hfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773334491; x=1773939291;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VQXCfPVu6b6dIVECzm0C8AUD7IL7VvpSkD5+M4S95sw=;
 b=c13D9lWJlvXCzeNomqCFl842/xAg6bEyBHbNfVaoW8lGcS24B2i2qGX4AzouphF35D
 4QTJBX0dIX9LZMz1TSQ0mij0DxpVjXsRXZjbacuxLHRKn4P0fghPRrInUxMQ977zjMDo
 /fuLGOeANJeMgUR3guXWmhSMxRE6O5Ibs/08rlY8OUTaYR1my9Y1eWEiA1Xp/y6snqgq
 8W45bNV9m71pQS2QPoWvifb+cxV9aVdAWd30oLhfjmGYKJq4Z2+H/7htOxMoN6W/8dOb
 EFb9ClpTYs0fuxLCRHU6PjT9duz+MeoWtyozIH12/7ZA1XxUamPzbc7oAFUWlq/SeGzQ
 RuUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQwu7PckRZCqe3RyTFWPseQzEOW30IcCCdtbEaQ+y37mao2/c/HfW44cjkvcwU3eLmGjUER7r6Dw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yyu3+mVwOQ8JgGclMjAoXzID+47Yo2OlefhtX/72DeUZLiogG6f
 T2o6MYi5rHqu6RI/82aRXMimBYP9Nm9Kait356Z8hD3S105zreThb9juOgPenqIj9UM=
X-Gm-Gg: ATEYQzxxpLd+dZcXaRkqEcFuHv35jxiGa7ZTP0oOn0l/H+3zePDmt4m21WxXK0s7ijS
 k2XMj8TOlr0jq8hizf/JMTghv+1Ce0krKYO65CYAZ4D3tMtpzE7CjOe8kj1jPjAb/WEITWaBgSd
 EtCCDVj2+DtXcM0+XFYkqcir6Fc7NPdixx/uxzaW9W6oDLC2C8n9DCEz4o6FO9tyYf9OqThkPk2
 61v9PILb7rZtemwE6PlZqNZMFGlzbGsnKxsWvLmjwKhcPBd3kWhW0fYXj/+gEmwGNf4H/BTUPjC
 N2dKVqCSh80TinpkOsyjD/4NoZji9tD9M12aVEOqdgEk64u0hmwiWtT5f4qnvxAvjwIylRdCsXB
 J4Al0QgqTBT9Cf03dDrm34Wp5v8TUpKwSaj+24zu5HgkWRGxo9ix0fbWKjlcM94rZrmKNROVDpv
 3/U0jmlzuwtbcauhofQjdg2kFGDKNRylSUx3mebR9VcGGBKXEfiuW/8qG/PtAA64Q37yrHAP4sq
 AESdKBgwLBIRfbdNXI=
X-Received: by 2002:a05:622a:289:b0:509:44c3:5ffa with SMTP id
 d75a77b69052e-50957e10673mr1403911cf.52.1773334490530; 
 Thu, 12 Mar 2026 09:54:50 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5093a119602sm36658181cf.28.2026.03.12.09.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 09:54:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1w0jJA-00000006i8N-40X9;
 Thu, 12 Mar 2026 13:54:48 -0300
Date: Thu, 12 Mar 2026 13:54:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Message-ID: <20260312165448.GN1469476@ziepe.ca>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <abBlpGKO842B3yl9@google.com> <20260312125730.GI1469476@ziepe.ca>
 <f5688b895eaebabae6545a0d9baf8f1404e8454e.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5688b895eaebabae6545a0d9baf8f1404e8454e.camel@HansenPartnership.com>
Received-SPF: pass client-ip=209.85.160.173; envelope-from=jgg@ziepe.ca;
 helo=mail-qt1-f173.google.com
X-Mailman-Approved-At: Thu, 12 Mar 2026 17:43:15 +0000
Subject: Re: [apparmor] [PATCH 00/61] treewide: Use IS_ERR_OR_NULL over
 manual NULL check - refactor
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
 ceph-devel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, intel-wired-lan@lists.osuosl.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 linux-media@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 apparmor@lists.ubuntu.com, linux-sound@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 Philipp Hahn <phahn-oss@avm.de>, linux-omap@vger.kernel.org,
 sched-ext@lists.linux.dev, cocci@inria.fr, linux-nfs@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-s390@vger.kernel.org, v9fs@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, Kuan-Wei Chiu <visitorckw@gmail.com>,
 linux-modules@vger.kernel.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ziepe.ca:s=google];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.samba.org,lists.freedesktop.org,lists.linux.dev,kvack.org,lists.infradead.org,st-md-mailman.stormreply.com,lists.osuosl.org,lists.sourceforge.net,lists.ubuntu.com,avm.de,inria.fr,gmail.com,lists.ozlabs.org];
	DMARC_NA(0.00)[ziepe.ca];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,apparmor-bounces@lists.ubuntu.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:James.Bottomley@hansenpartnership.com,m:linux-hyperv@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-sh@vger.kernel.org,m:samba-technical@lists.samba.org,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:gfs2@lists.linux.dev,m:linux-mm@kvack.org,m:linux-sctp@vger.kernel.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-phy@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:iommu@lists.linux.dev,m:intel-wired-lan@lists.osuosl.org,m:linux-arm-kernel@lists.infradead.org,m:linux-input@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:linux-ext4@vger.kernel.org,m:linux-media@vger.kernel.org,m:dm-devel@lists.linux.dev,m:linux-pm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:apparmor@lists.
 ubuntu.com,m:linux-sound@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:phahn-oss@avm.de,m:linux-omap@vger.kernel.org,m:sched-ext@lists.linux.dev,m:cocci@inria.fr,m:linux-nfs@vger.kernel.org,m:ntfs3@lists.linux.dev,m:linux-s390@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:visitorckw@gmail.com,m:linux-modules@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[ziepe.ca:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,apparmor-bounces@lists.ubuntu.com];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[56];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 4F3E0276B7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 11:32:37AM -0400, James Bottomley wrote:
> On Thu, 2026-03-12 at 09:57 -0300, Jason Gunthorpe wrote:
> > On Wed, Mar 11, 2026 at 02:40:36AM +0800, Kuan-Wei Chiu wrote:
> > 
> > > IMHO, the necessity of IS_ERR_OR_NULL() often highlights a
> > > confusing or flawed API design. It usually implies that the caller
> > > is unsure whether a failure results in an error pointer or a NULL
> > > pointer. 
> > 
> > +1
> > 
> > IS_ERR_OR_NULL() should always be looked on with suspicion. Very
> > little should be returning some tri-state 'ERR' 'NULL' 'SUCCESS'
> > pointer. What does the middle condition even mean? IS_ERR_OR_NULL()
> > implies ERR and NULL are semanticly the same, so fix the things to
> > always use ERR.
> 
> Not in any way supporting the original patch.  However, the pattern
> ERR, NULL, PTR is used extensively in the dentry code of filesystems. 
> See the try_lookup..() set of functions in fs/namei.c
> 
> The meaning is
> 
> PTR - I found it
> NULL - It definitely doesn't exist
> ERR - something went wrong during the lookup.
> 
> So I don't think you can blanket say this pattern is wrong.

Lots of places also would return ENOENT, I'd argue that is easier to
use..

But yes, I did use the word "suspicion" not blanket wrong :)

Jason


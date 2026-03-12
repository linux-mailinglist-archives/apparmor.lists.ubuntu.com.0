Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLadBeDismmWQgAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 12 Mar 2026 16:59:28 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D88CC275102
	for <lists+apparmor@lfdr.de>; Thu, 12 Mar 2026 16:59:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w0hRn-0003NL-M1; Thu, 12 Mar 2026 14:55:35 +0000
Received: from mail-qt1-f182.google.com ([209.85.160.182])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jgg@ziepe.ca>) id 1w0fbZ-0000uI-84
 for apparmor@lists.ubuntu.com; Thu, 12 Mar 2026 12:57:33 +0000
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-5094b54a250so5475801cf.2
 for <apparmor@lists.ubuntu.com>; Thu, 12 Mar 2026 05:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1773320252; x=1773925052; darn=lists.ubuntu.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J1SF1XBHkHR0j7NZVucv0LxpGoGXl67PUefLsfwpAbo=;
 b=j2T0TRB1qXeH5DOON3hr5SgVdQsDNZcTTDccuPNt1vqIhVUAhiMdFQTIfNO6qdKQKp
 Qonx3ElU2YWcpxI4zRYcHDvHRTqT3j16U3FvvuB1XDcWz65S7tuis2NCkBsbES3UI3nn
 Yl15q08YIBvBmDTae78qEudYfMOh3OD9ayv+5Ky+ejaChjorHHOeW3/Rv5N0Ykha03yw
 24fhi1Va7O7BDpCgarAXheO0ZSwZ+LjMYRsv5LuAspHbGCclkfuysftqN9BUMn9m4Vjg
 dBClOK7SyX+phtBl0/3rmFGGzxOOo2MAJrKkD9XILTXzB814Y7s38fAus06pHPrFN90L
 TQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773320252; x=1773925052;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J1SF1XBHkHR0j7NZVucv0LxpGoGXl67PUefLsfwpAbo=;
 b=aBoeR1DeDk+L2YsjOeBJcfJ9pydeysPMfsUP5/BhlFFfZo08LUKmPe0eiQTZYExQf9
 H/BYC27aq4jh08xf9oeeas6v3iRMELTdukIYhVKc+QNT2IxmI+htj8xYiMh3bGoBrtmA
 WnslMnUtqZYEssrgnSrws65MP9EAXrztJWHNk4pEXWUDtIc+YY8CXeR8jSt95Wi39XcP
 Tyz0kU+/o+glD87GouWlBUYkQUmx+e6IXHhv8heCgJfB9rMbDmBAe/8q8bSO5F2lUTMG
 N8AwvVWRFAtzOIntGBRFxq9UYJTUTkBJKB8k/05sOBd+g+rxUaDqLDSoXD2HTgFZd5hJ
 +DLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/9/PQ+aYikzG6BV7FuhyCIK0gMkSvMjotxB+CrorE2gIORpXgHoxUkPM66sypzlEwtuALXWHA0g==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YxYB4vk27tMQFn7ICiI73LAfYykny2xZXOAJ8kz5P39k0pUvIgw
 qJmF1OM1CKwRYiJwF8YBDUBFyDjKLwOqwu/xnqfCvpKYByADlHG5tuEhy3BYvOJpGAA=
X-Gm-Gg: ATEYQzxSdzvwbvGi0/1TpcljBo2Gfo362T0DW6UJohqRXxS0imvjluPIBCmuVmzIkMY
 GN/slAEq+l7FM+1Hwzw1pYllyHq38jN3s0Cccc8vndlWwcK+IisB2kujJ9+D8fAwM9YbXGXqo5n
 VtdrLVCqNv7Fd14SlVcivGvjF9w89k6uCbscFrmso+o3jQitt8YBqPYKDUlYhQ/mFk+z834WlbD
 1bEUzwitUnPxKgHI9lf3/LGUIFZ8K7bnwnffITWa8c3qrgsQV8NWma5Bz+R/rnQA2wMupsHZpHf
 1d9BSrREkt5udpyZfVPJhOcSH/g5AgNJxVY8NOgu0zgD6kne5WDTdynntoNURL5vmC0uZbDsfR5
 VshXjEEWCj6O/RdTGL64ehdOP3m1R5FcbHyZUo8pW1xi+ajQCfVJDYoZ6U6Tz6SOgfQM6J420/X
 9mvjogpjn+K0aQzrFkvEd78Qc4/cFyZKNvSo1fPi5aaHEOMb4EpEkmSXp2EH3nOIcKIB177IiHw
 ViYVSAT
X-Received: by 2002:ac8:5d4d:0:b0:509:cbc:127b with SMTP id
 d75a77b69052e-5093a1bd58fmr77950521cf.60.1773320251710; 
 Thu, 12 Mar 2026 05:57:31 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89a65bd318fsm33341196d6.8.2026.03.12.05.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 05:57:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1w0fbW-00000006fKD-1POa;
 Thu, 12 Mar 2026 09:57:30 -0300
Date: Thu, 12 Mar 2026 09:57:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Message-ID: <20260312125730.GI1469476@ziepe.ca>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <abBlpGKO842B3yl9@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abBlpGKO842B3yl9@google.com>
Received-SPF: pass client-ip=209.85.160.182; envelope-from=jgg@ziepe.ca;
 helo=mail-qt1-f182.google.com
X-Mailman-Approved-At: Thu, 12 Mar 2026 14:55:34 +0000
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
 amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-media@vger.kernel.org, dm-devel@lists.linux.dev,
 Philipp Hahn <phahn-oss@avm.de>, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
 linux-sound@vger.kernel.org, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-omap@vger.kernel.org, sched-ext@lists.linux.dev, cocci@inria.fr,
 linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev, linux-s390@vger.kernel.org,
 v9fs@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-modules@vger.kernel.org,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [1.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ziepe.ca:s=google];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:visitorckw@gmail.com,m:linux-hyperv@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-sh@vger.kernel.org,m:samba-technical@lists.samba.org,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:gfs2@lists.linux.dev,m:linux-mm@kvack.org,m:linux-sctp@vger.kernel.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-phy@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:iommu@lists.linux.dev,m:intel-wired-lan@lists.osuosl.org,m:linux-arm-kernel@lists.infradead.org,m:linux-input@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-media@vger.kernel.org,m:dm-devel@lists.linux.dev,m:phahn-oss@avm.de,m:linux-pm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:linux-sound@vger.kernel.org,m:linux-block@vger.kernel.
 org,m:linux-gpio@vger.kernel.org,m:ceph-devel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:sched-ext@lists.linux.dev,m:cocci@inria.fr,m:linux-nfs@vger.kernel.org,m:ntfs3@lists.linux.dev,m:linux-s390@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:linux-modules@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[ziepe.ca:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,apparmor-bounces@lists.ubuntu.com];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,ziepe.ca:mid]
X-Rspamd-Queue-Id: D88CC275102
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 02:40:36AM +0800, Kuan-Wei Chiu wrote:

> IMHO, the necessity of IS_ERR_OR_NULL() often highlights a confusing or
> flawed API design. It usually implies that the caller is unsure whether
> a failure results in an error pointer or a NULL pointer. 

+1

IS_ERR_OR_NULL() should always be looked on with suspicion. Very
little should be returning some tri-state 'ERR' 'NULL' 'SUCCESS'
pointer. What does the middle condition even mean? IS_ERR_OR_NULL()
implies ERR and NULL are semanticly the same, so fix the things to
always use ERR.

If you want to improve things work to get rid of the NULL checks this
script identifies. Remove ERR or NULL because only one can ever
happen, or fix the source to consistently return ERR.

Jason


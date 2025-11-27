Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F5BC8DB9C
	for <lists+apparmor@lfdr.de>; Thu, 27 Nov 2025 11:19:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vOZ5e-0002ea-NI; Thu, 27 Nov 2025 10:19:06 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <thorsten.blum@linux.dev>)
 id 1vOZ5c-0002eS-7W
 for apparmor@lists.ubuntu.com; Thu, 27 Nov 2025 10:19:04 +0000
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1764238743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dvPnaLhntHG/d2RdC9bZ8bYwRVHSPnfj1sCt8Vn6U4k=;
 b=edwv/5346M4Zrk+jt9BA/HVNtKansCBLFcY+AIFtg31SV/U+mPvEzDxs8b6YxyRW66Hiuv
 K7hhS9Zv6rQE88oGIeyH5HADEWQOf84SosprmpXNnSEdY60Ggk4ZcDJbbW0ykBE3K3LDbY
 XbWPEXB8UHGE3S5lcsDQWyBsNkqfkCw=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <1da23c89-dc2c-41cb-8260-098deb8ae917@canonical.com>
Date: Thu, 27 Nov 2025 11:18:30 +0100
Content-Transfer-Encoding: 7bit
Message-Id: <D73FFEAA-F246-4777-8CA8-32807F378423@linux.dev>
References: <20251126165701.97158-2-thorsten.blum@linux.dev>
 <1da23c89-dc2c-41cb-8260-098deb8ae917@canonical.com>
To: John Johansen <john.johansen@canonical.com>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=91.218.175.185;
 envelope-from=thorsten.blum@linux.dev; helo=out-185.mta0.migadu.com
Subject: Re: [apparmor] [PATCH RESEND] apparmor: Replace deprecated strcpy
 with memcpy in gen_symlink_name
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
Cc: Paul Moore <paul@paul-moore.com>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>,
 linux-security-module@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 27. Nov 2025, at 02:32, John Johansen wrote:
> hey Thorsten,
> 
> sorry I have actually pulled these in, and tested them. I didn't send out
> the acks yet because I have another patch that I was waiting on a proper
> signed-off-by: on.
> 
> I am going to have to pull that one so I can push. I'll add acks now but
> the push isn't going to happen for a few hours.
> 
> Acked-by: John Johansen <john.johansen@canonical.com>

Ah sorry for resending then, didn't know you looked at them already.

Thanks,
Thorsten



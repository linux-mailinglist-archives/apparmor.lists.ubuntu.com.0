Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPnACpJFumlTTgIAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:26:26 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC2A2B650C
	for <lists+apparmor@lfdr.de>; Wed, 18 Mar 2026 07:26:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w2kME-00016j-WD; Wed, 18 Mar 2026 06:26:19 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1w2kMC-00016c-O5
 for apparmor@lists.ubuntu.com; Wed, 18 Mar 2026 06:26:16 +0000
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 693833F29F
 for <apparmor@lists.ubuntu.com>; Wed, 18 Mar 2026 06:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1773815176;
 bh=RJ1HqIQjfWp+RAWEkxqUB1SzGt6UlQj+ZRDa/zLkAwc=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=G0ujsvgBxv+PNjvWACI+ZXtR+W8UTjp5ZwOdBW3KD0sXiKiTa5uIshwydTLhHg1sH
 yKh/xAYye36fpeSiRR08kTw9Iz5vdgdZyOCLhF8yRLGatWWCjHifyx7sXWtooOtJ1b
 awOKWJoc9q2e4/8BcZGN5I/LVCCT524blZnsQrI8ulAVvE+bbSVpCQ2tIPRRrLGV/l
 usvUy7nVwnVIlWOY39DiWZ4nCEeyfNTQ+Ajn1l7B47H38pktK3e0hcXmwZGt/YOZUq
 9Xp9scDapMjt3quVvtjeCUbmXVigE5Da27Ytdkq3KH1mhZm4qOlc6OoHHI72QBrynf
 4UdfHhn8g90x+UiYUOG26AJXzJrK+drh70uDDQ3Y+zqtfjbVitz8ASAYP2/PYP+XFL
 HVWNWDQDzqtOFL8y59yTfHQjWeC+rTHFmZ8bn+W758BdhcDUbb6KTfncQb4s16s385
 zdTZXSdZA4ORBm4DqJRRzBQw4ENe/xD3yRQlKMQJOJFghI2hR93lUku31PneNoyFKC
 kpJvhE8pscB5DlYKTAVVvSOHObIIJ/RHOKvB5qoc7pIieQbg+EfDtk/X3eUHLs4fFR
 D0FSrn+6fX+Z8XGiue+9Xd1078+Iz9GTpf9XlMpCkkPi0MCv904ghxQiVhioXQmV7g
 OjPxja06hltuJ4f/0wcvv7dA=
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c7381a9a932so3881049a12.3
 for <apparmor@lists.ubuntu.com>; Tue, 17 Mar 2026 23:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773815174; x=1774419974;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RJ1HqIQjfWp+RAWEkxqUB1SzGt6UlQj+ZRDa/zLkAwc=;
 b=bpJ5yInomzhbzHlFcqRUwCmo5dWgH70ujB6epna6mOC1hi8naGApbWfkzK1i/SfwLY
 3H7oFC+UaL/0fTh567CRmb0ocM6qAb3r9Uy2UTn+PHSQF/l65XVe1X00Y9tD3MOLeSfO
 CkvbleP+RQwlsJ+OupV6HVfIodnm8FnCb4L/shg7/ruMPjywGq6LY8IMs62Oxp/7Yc+P
 xyBkEs7rM2dZOesq0BP6StfFISdMMbb9v5Lf0Ofi5qmg9Sn8I3s2yA9UpZsn1wqQKU47
 uYjVvjXwjPOois9urnlIVPDwt4TZgXI+/Ihx3k/gDmorANL/eZCl9cS48PJgUul/UX4J
 I4uQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrWLWPSE9AAmEP6OjHFj1WoOb4PzcedkIFyU/5YgqUikZFIld/W/EyU9EjLQf3PXyWMfjBRWnw3w==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yxs3lauINebNOJsYRo3gfP4Onu4A/9/KCoCg8NySAR0IbmL+RSQ
 qwamkykBiCB2HhgpLPiNBbQm4mpbjU8ckhxXQGZX69nQPiUFLdeQ8k04oQfGh7FRn05xnDgi5/E
 IhTW3jaupoX18vjFvmU2PDyFiNJt6SVz1N0q06xgeKaNZGFqz9L0dzixM3bvgZ8RL1TpTrp8nUz
 R7GA==
X-Gm-Gg: ATEYQzxyxY6bTPaNmvfu4A7Hf4ER8p4kuo31Q1XErNRq0H2c4r0G8qTZM6MrUAAa+Qq
 Pn80t66vfP0NRLVjmKVE23qgPsVtMXHHDmiDBNElHssU6xdhshrLB/JrhdQLxXu1SF+d33n7WvM
 SNzwzko2QiRefu7Mfh1HbKx/YAa2kV8qDXtSF4V67yCyejhwv1baFcnXnG9bNPnQT0OkidcCMSD
 5ia4Xsx6b8V2ElrkZD1rKOjKoMrxJ98DzI44/yc1qM+SGR7H0eGZrmvLYNaRGh4gw2aY4BJ+Wb2
 x7seT07MCs/2qvWu/cCRe071vxkMACI4ahYjPbHjYo6z1kE0OSdHPLcuWhl9sRD5sBFIS3lkbSY
 UbMgUhDrsEctQUyVdWs7eqYrAejCTvObpq+17kw==
X-Received: by 2002:a05:6a00:7550:b0:82a:fc5:cd40 with SMTP id
 d2e1a72fcca58-82a6aeb0697mr1692804b3a.58.1773815174610; 
 Tue, 17 Mar 2026 23:26:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:7550:b0:82a:fc5:cd40 with SMTP id
 d2e1a72fcca58-82a6aeb0697mr1692791b3a.58.1773815174220; 
 Tue, 17 Mar 2026 23:26:14 -0700 (PDT)
Received: from [192.168.192.71] ([50.39.102.197])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-82a6b52e67csm1361918b3a.2.2026.03.17.23.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 23:26:13 -0700 (PDT)
Message-ID: <5706d93e-20ba-4c7a-8cca-2dd68ff7b256@canonical.com>
Date: Tue, 17 Mar 2026 23:26:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ryan Lee <ryan.lee@canonical.com>, apparmor@lists.ubuntu.com
References: <20260213203312.992228-1-ryan.lee@canonical.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20260213203312.992228-1-ryan.lee@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH] apparmor: make include headers self-contained
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
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[canonical.com:s=20251003];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ryan.lee@canonical.com,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.johansen@canonical.com,apparmor-bounces@lists.ubuntu.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:helo,lists.ubuntu.com:rdns,canonical.com:email,canonical.com:mid];
	NEURAL_HAM(-0.00)[-0.989];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[canonical.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	HAS_ORG_HEADER(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Queue-Id: CCC2A2B650C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/13/26 12:33, Ryan Lee wrote:
> Besides of resolving clangd IDE warnings, self-contained headers will be
> less likely to break if the surrounding includes in .c files using them
> change.
> 
> Signed-off-by: Ryan Lee <ryan.lee@canonical.com>
Acked-by: John Johansen <john.johansen@canonical.com>

> ---
>   security/apparmor/include/apparmorfs.h    | 3 +++
>   security/apparmor/include/capability.h    | 1 +
>   security/apparmor/include/ipc.h           | 1 +
>   security/apparmor/include/path.h          | 3 +++
>   security/apparmor/include/policy_unpack.h | 1 +
>   security/apparmor/include/procattr.h      | 2 ++
>   security/apparmor/include/task.h          | 5 +++++
>   7 files changed, 16 insertions(+)
> 
> This patch applies cleanly to the Ubuntu 6.17 kernel.
> 
> diff --git a/security/apparmor/include/apparmorfs.h b/security/apparmor/include/apparmorfs.h
> index 61d37ab9ee4b..ba922b918d32 100644
> --- a/security/apparmor/include/apparmorfs.h
> +++ b/security/apparmor/include/apparmorfs.h
> @@ -11,6 +11,9 @@
>   #ifndef __AA_APPARMORFS_H
>   #define __AA_APPARMORFS_H
>   
> +#include <linux/init.h>
> +#include <linux/types.h>
> +
>   extern struct path aa_null;
>   
>   enum aa_sfs_type {
> diff --git a/security/apparmor/include/capability.h b/security/apparmor/include/capability.h
> index 1ddcec2d1160..3fb8b8f2182a 100644
> --- a/security/apparmor/include/capability.h
> +++ b/security/apparmor/include/capability.h
> @@ -11,6 +11,7 @@
>   #ifndef __AA_CAPABILITY_H
>   #define __AA_CAPABILITY_H
>   
> +#include <linux/capability.h>
>   #include <linux/sched.h>
>   
>   #include "apparmorfs.h"
> diff --git a/security/apparmor/include/ipc.h b/security/apparmor/include/ipc.h
> index 72f2a6112892..0291da598881 100644
> --- a/security/apparmor/include/ipc.h
> +++ b/security/apparmor/include/ipc.h
> @@ -13,6 +13,7 @@
>   
>   #include <linux/msg.h>
>   #include <linux/sched.h>
> +#include "audit.h"
>   #include "inode.h"
>   #include "perms.h"
>   
> diff --git a/security/apparmor/include/path.h b/security/apparmor/include/path.h
> index 43e61c9f1fe2..b4adfb676a59 100644
> --- a/security/apparmor/include/path.h
> +++ b/security/apparmor/include/path.h
> @@ -11,6 +11,9 @@
>   #ifndef __AA_PATH_H
>   #define __AA_PATH_H
>   
> +#include <linux/path.h>
> +#include <linux/types.h>
> +
>   enum path_flags {
>   	PATH_IS_DIR = 0x1,		/* path is a directory */
>   	PATH_SOCK_COND = 0x2,
> diff --git a/security/apparmor/include/policy_unpack.h b/security/apparmor/include/policy_unpack.h
> index 1cb72267ea0f..7ca7d710251f 100644
> --- a/security/apparmor/include/policy_unpack.h
> +++ b/security/apparmor/include/policy_unpack.h
> @@ -16,6 +16,7 @@
>   #include <linux/dcache.h>
>   #include <linux/workqueue.h>
>   
> +#include "lib.h"
>   
>   struct aa_load_ent {
>   	struct list_head list;
> diff --git a/security/apparmor/include/procattr.h b/security/apparmor/include/procattr.h
> index 03dbfdb2f2c0..56acd1bdb634 100644
> --- a/security/apparmor/include/procattr.h
> +++ b/security/apparmor/include/procattr.h
> @@ -11,6 +11,8 @@
>   #ifndef __AA_PROCATTR_H
>   #define __AA_PROCATTR_H
>   
> +#include "label.h"
> +
>   int aa_getprocattr(struct aa_label *label, char **string, bool newline);
>   int aa_setprocattr_changehat(char *args, size_t size, int flags);
>   
> diff --git a/security/apparmor/include/task.h b/security/apparmor/include/task.h
> index ff8bed8f60b2..452d3b3baa9b 100644
> --- a/security/apparmor/include/task.h
> +++ b/security/apparmor/include/task.h
> @@ -10,6 +10,11 @@
>   #ifndef __AA_TASK_H
>   #define __AA_TASK_H
>   
> +#include <linux/sched.h>
> +
> +#include "audit.h"
> +#include "label.h"
> +
>   static inline struct aa_task_ctx *task_ctx(struct task_struct *task)
>   {
>   	return task->security + apparmor_blob_sizes.lbs_task;



Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLAOFEGVwWnuTwQAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 23 Mar 2026 20:32:17 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 686292FC529
	for <lists+apparmor@lfdr.de>; Mon, 23 Mar 2026 20:32:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w4l0F-0003fm-7J; Mon, 23 Mar 2026 19:31:55 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2)
 (envelope-from <prvs=154207a538=songliubraving@meta.com>)
 id 1w4l0E-0003fZ-00
 for apparmor@lists.ubuntu.com; Mon, 23 Mar 2026 19:31:54 +0000
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62NHGu4c381096
 for <apparmor@lists.ubuntu.com>; Mon, 23 Mar 2026 12:31:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=qEmaMrG6tQEKHABcH5kGpa1dSTH50exe6PGoRyajv9c=; b=dau72Gt3dvQN
 Jbl5OSdTRlLie7gsjtUOOGmFwPdNDx2OdKuFIEHt8cZz0kC//nK7765yvsXTEi5l
 tpAHkjjgzsZKqXlOzQVJRY6FG+Qw2rdPOXZ+dZcwhQlI68qFAS3dmH1GKyLm0I4j
 TrfOtFZgU4WHizGxN+QnfN60+hdV58LEK7ei3jrXaADUY+5MxzwOupKP52n3IBzy
 dnWRPzWGgUCw8OWMRHWFHvqb1R2HIL6IrXdaBfkvvASEXPxUTHQPbY5vKkvlrpWB
 vQHjyWNNttoIT+uPLz71hulmTcfnNhKnW/7afG5Dk8LCfa1w4UdrwIfYWQRyMv0J
 t3A9GTFdrg==
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4d38s33mqm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <apparmor@lists.ubuntu.com>; Mon, 23 Mar 2026 12:31:51 -0700 (PDT)
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-38bda0c2e91so14834581fa.2
 for <apparmor@lists.ubuntu.com>; Mon, 23 Mar 2026 12:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774294310; cv=none;
 d=google.com; s=arc-20240605;
 b=EFEFuoYeWZc1T1W6pIuZPlI2dpQSxnO7SRIi0RTrYQivjczBRPRwkiKRQe/+1UvVnX
 25Pj89sBNK/jGAa/sVlXYwrx7YaM0THc8ji+s5eLcfz1GRYDltfDdBknYX9yIDIeKeok
 OHpbCO3Z9Ge+AXtm538QfUN0misE915lS1M18NAK4T4Z0f2N9jev8BpXnQFjWMcqKfJI
 mGQHW32KpKZhyLe1u1+fRonLXvv1OfEs7yM4MxK3QGrSqcdKtDV7TpS9B9mTLiaxA1aD
 +tk0MjSCkxGCu0kUK2tFCx0vKjGpaPFbuKFjmVsrwmU79GTjoyfVy0YTVjVh1ibXl+v2
 QXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version;
 bh=qEmaMrG6tQEKHABcH5kGpa1dSTH50exe6PGoRyajv9c=;
 fh=XJrRZ3vqr4mOMwZJVvIP3iTozWth/3eYNYis3ZtDPdM=;
 b=NZIWky3+nz4IlMZUDToEU7AynFbejwKIZlaE3trv2OrX0bWoant7shFX+sTkaZeAVZ
 Lh5luts3yg8CrCu1f/eY3vs0XcszlW0q3hd4de6jm/KahNkgzuwAvrcr1wY7RCUiLyFR
 7yK/ifDcO+WgzZ4ZuzF7CSH5ofV2ziAO492O1Arbu0/ETwE0xtPPbhs76g+/W4OVy0oz
 twBHCL4/B/wyyL2O5eXbsfQokhqv2Vn+YnGmhEeSBcPm7JXslB677zgTxAsuzaT1SEVq
 58elUM93fi5YY3DIVtaVYc8weKLdH2WxMTJkNXgicDJiM0fAXCaaWdRaZXkOeBOKE8Gl
 8d/A==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774294310; x=1774899110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qEmaMrG6tQEKHABcH5kGpa1dSTH50exe6PGoRyajv9c=;
 b=o7M+1oT/TYVq1vJx/ltWRQqNpqd+ChiLS36a4FGcuLJRq9GWY9icZXaxIG6NBmAVrQ
 4mndXAQeBBs1qNWWO5IME8Wb01bNmAV31ULYcRezLmE5nh5a4lcJu8GJdDtwJWVVGO2V
 nZ2UIMYFpelSjCbzqgRi/kcU5hSrwbl32/UeUWb8lGUEA1VJtr3+Y1pbCSCcU95zyrNB
 8Fzfl93Q8U5FiXFAgwCETlOXEs9uUNetXh64WAnmqQO2sGfOhRYx4UcNC2Kw9IBriR96
 stWfkPOSZKElq0krBc8bVO+hSyT6x18hA0bXJSmISXl1YNESLmLxfTn6eg7ndvouzBYq
 QJ4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOzOM69FdopcsKud5A00vV6IouFtlHb4Vjx0y/mszmDA4f3IK5auiF2gjwgvN+zEsQAl4qRnDVIw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YzdeFV+RycaW4Mh6wrVfjvUATnlZV+bEu3X1jMaJXWJvpMPn8Hp
 WBQO1yjyIbm2BckSP4QC+btLfDdPrZF4yOu3R1ngc8H9ODCN5D1nW6O2xCgNyFGmOcrQdNlJILs
 1Qta20sOUru1pcUkUhb6rRY0cqNhVY4jlOh0lVvLwwq/pHhosHYPh4XHU539esGumyhK3oTdo7j
 Jlq0JGKTw7LNafV4+lNYQdfm+mpHK2bz2We9M=
X-Gm-Gg: ATEYQzzD/2m1+prPFvXOT+Rd3jNiRVFq8A6+xdmRyHYwDGguA2QceQ/TbZSf+8+E4yt
 ArpUnsMRMCNl191Y90taGsdDnJnPvdM/ZzhzG4bUiMyrKl/8bG1ZROALTJ+oZvt3i+vByjtt8JD
 ihdjUdxQK/7OBlxSpnM4t7SJAjn/BWjxtaK899h4+1RpUILe+7+Uskv5W3bGaKOkccru+LypQgh
 DQs6qn4hnzpugnARWs8Qg==
X-Received: by 2002:a05:651c:418e:b0:387:1ba5:99bd with SMTP id
 38308e7fff4ca-38bf972b0e5mr41075561fa.27.1774294309959; 
 Mon, 23 Mar 2026 12:31:49 -0700 (PDT)
X-Received: by 2002:a05:651c:418e:b0:387:1ba5:99bd with SMTP id
 38308e7fff4ca-38bf972b0e5mr41075301fa.27.1774294309455; Mon, 23 Mar 2026
 12:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260318184400.3502908-1-song@kernel.org>
 <20260318184400.3502908-7-song@kernel.org>
 <b720f521-e930-4f35-9505-1bfdf9e2818c@I-love.SAKURA.ne.jp>
 <4DF5C4A8-7C92-4F76-9B34-2262089E7289@meta.com>
 <33abcf34-13e2-4a37-83f3-78bb27ecbc11@I-love.SAKURA.ne.jp>
 <F0A0D13E-8208-49A4-9AC6-89AC4BF3F4FB@meta.com>
 <20260323-klappen-atemschutz-7a0af8c6b087@brauner>
 <714a614b-cfb4-4b20-af8c-df3cc56dfb92@I-love.SAKURA.ne.jp>
In-Reply-To: <714a614b-cfb4-4b20-af8c-df3cc56dfb92@I-love.SAKURA.ne.jp>
From: Song Liu <songliubraving@meta.com>
Date: Mon, 23 Mar 2026 12:31:38 -0700
X-Gm-Features: AQROBzBKFBxWkFKdSZb6aDqln1iqdiuNWYNqj8Bk3Aj5pcgV1TsyMg6HDo5_J7A
Message-ID: <CAAeYb7k+TWArOKyOomkLZ8fwqUPjha9iORpJaj4nMyN=o4ZRQg@mail.gmail.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=S+DUAYsP c=1 sm=1 tr=0 ts=69c19527 cx=c_pps
 a=7DXwzBV7yB9sQ64fpm0YNw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=crHB47gyY4rKiduisYu9:22
 a=BqB2_f_Oa2Tj43kevx4A:9 a=QEXdDO2ut3YA:10 a=eI3u7fyX2kwyfkukwWva:22
X-Proofpoint-GUID: ZYJy9ftv0CwTG_oWUb5wPZGJGA8qDM6d
X-Proofpoint-ORIG-GUID: ZYJy9ftv0CwTG_oWUb5wPZGJGA8qDM6d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0NCBTYWx0ZWRfXyYv9RqMQFzUK
 VfrJRWYeP23DCcSTjPivuenoXDk9uSwrhNquYG9iW0pW4KerNppDWKSso5QzvHbI/VJZ8g5bfKF
 IkgbPI0jcot9yLO12acoRw31dkD6EeTfphCKN16qce35V50gmq03pwEnUXamYfoDKoUdq0dMVj2
 YBBsd7gR92SZtGign5vU7U3g0+v/JEP+Wt7ddGY2FGLoN/BiFrMLf0hW2kgsjwx3LVvZAHywu4C
 fHoIXGB3laW2sg6gU01EXAYrfd/jrKE9WBOB8kVHF16BcjqzhqcP1RWD3ZEMRFgT4fMZpFPGLI+
 aAeC6TpVRmwNxrTuXEX9K+EDVNDLO8D/pbKHEnmJAGEKNFJXHYEKJg0UqJ/jlWVY2zAvnOv3PIf
 h8p4WeUx3gOz+7ibsEONhH/vz0bEZHl6H/EqfQd2jyQoReBIWxX+OtStjx6DrSGiO931aYEMuql
 1I6W5rvBO55d4EBu5Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=154207a538=songliubraving@meta.com;
 helo=mx0a-00082601.pphosted.com
Subject: Re: [apparmor] [PATCH 6/7] tomoyo: Convert from sb_mount to
	granular mount hooks
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
Cc: "herton@canonical.com" <herton@canonical.com>,
 Christian Brauner <brauner@kernel.org>, "jack@suse.cz" <jack@suse.cz>,
 "paul@paul-moore.com" <paul@paul-moore.com>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "stephen.smalley.work@gmail.com" <stephen.smalley.work@gmail.com>,
 Kernel Team <kernel-team@meta.com>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>,
 "jmorris@namei.org" <jmorris@namei.org>,
 "omosnace@redhat.com" <omosnace@redhat.com>, Song Liu <song@kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "gnoack@google.com" <gnoack@google.com>, "mic@digikod.net" <mic@digikod.net>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "takedakn@nttdata.co.jp" <takedakn@nttdata.co.jp>,
 "serge@hallyn.com" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_REJECT(2.00)[meta.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[meta.com:s=s2048-2025-q2];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:penguin-kernel@i-love.sakura.ne.jp,m:herton@canonical.com,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:selinux@vger.kernel.org,m:stephen.smalley.work@gmail.com,m:kernel-team@meta.com,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:omosnace@redhat.com,m:song@kernel.org,m:linux-security-module@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:gnoack@google.com,m:mic@digikod.net,m:linux-fsdevel@vger.kernel.org,m:takedakn@nttdata.co.jp,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[songliubraving@meta.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_NEQ_ENVFROM(0.00)[songliubraving@meta.com,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[canonical.com,kernel.org,suse.cz,paul-moore.com,vger.kernel.org,gmail.com,meta.com,lists.ubuntu.com,namei.org,redhat.com,zeniv.linux.org.uk,google.com,digikod.net,nttdata.co.jp,hallyn.com];
	DKIM_TRACE(0.00)[meta.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,i-love.sakura.ne.jp:email];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[]
X-Rspamd-Queue-Id: 686292FC529
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 3:33=E2=80=AFAM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2026/03/23 19:16, Christian Brauner wrote:
> >>> Since not all filesystems need to resolve dev_name argument, conversi=
on from dev_name
> >>> to "struct path" is up to individual filesystem. If we can use a flag=
 like FS_REQUIRES_DEV
> >>> that tells whether that filesystem will resolve dev_name argument, I =
think we can resolve
> >>> the dev_name argument before security_mount_new() is called (and can =
avoid TOCTOU).
> >>
>
> I was expecting that "struct file_system_type"->fs_flags containing FS_RE=
QUIRES_DEV
> is a sign that the dev_name argument is a pathname. But it seems that suc=
h assumption
> no longer holds true. For example, cramfs started treating dev_name like =
"mtd$num"
> as if /dev/mtdblock$num since 4.15. So, current TOMOYO logic causes mount=
 request of
> cramfs with dev_name like "mtd0" to fail.
>
> >> I guess we can add dev_path to fs_context?
> >
> > No, when and how the path is resolved is entirely up to the individual
> > filesystem and we're not hoisting the block-based specific path lookup
> > up into the VFS while leaving the other stuff per-filesystem. And it's
> > not as trivial as you want it to be either.
>
> Then, how can LSM modules know that how the requested filesystem resolves
> the dev_name argument, without embedding filesystem specific resolution
> logic into individual LSM module?

IIUC, if an LSM cares about the dev_name of a new mount, it will have to lo=
ok
into each individual filesystem. We can add a LSM hook for the filesystems =
to
call. But this will require changes to individual filesystem code. OTOH,
dev_name can probably bridge the gap as we change filesystems.

Would this work?

Thanks,
Song


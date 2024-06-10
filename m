Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D04239029F8
	for <lists+apparmor@lfdr.de>; Mon, 10 Jun 2024 22:29:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sGldp-0002p0-5J; Mon, 10 Jun 2024 20:29:21 +0000
Received: from mail-yw1-f172.google.com ([209.85.128.172])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <josef@toxicpanda.com>)
 id 1sGlNV-0001Hi-IT
 for apparmor@lists.ubuntu.com; Mon, 10 Jun 2024 20:12:29 +0000
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-62a08099115so49196877b3.0
 for <apparmor@lists.ubuntu.com>; Mon, 10 Jun 2024 13:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718050348; x=1718655148;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q8U88OhWZh1tCo+0WQ1tID8xLxoIwnJftDZHFtRwK3o=;
 b=b3J4/TZRIFBoMh5/HbFzmwt9LmNYEFLw1vSLjwti3LJHe5v7INZtJ0o+gKCpj9fOCX
 TJVyH1GFmKaauKKyf0V9d6iTHKen1y7w3DjvDMIASuZWKk/1PD+K0wY+eB22qaU2he45
 61kgA5OIwb/U5bi0Hm0BLP/gxBLNvpLFnUPHoYHvuNKw6BSJYm6oVkfHondWdEYiwzg+
 ssgG0S1Y51I5duxAOev/IRkSmWvcYftioOK6kckulJ6eUkxaOHsseYlgc35kxOp6TVpH
 wEotSbriMyImVJ5xEYk1SjZiRXRCJOAG8t+xkOxRHTYYCVmMdsuQGfR3PMACpTixCr6z
 jHiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtzQdA0TOJtNxJ/SewY1U+ctdalPpK8E8A6hP1D5zXSBSA5tyGgTopn6CRLsJPrdDbUJKtbZndJc4JohVZulZsHaEMu2xcubFS
X-Gm-Message-State: AOJu0YyoMmuenklgYEWbpzetafexPvqfmd3MIQBbvdvJWVFMl+073+bR
 snFTiS+PfAOdVDNlV9gH4mcrbkPxhXfX3DocmgpvPG+gOifavcEFrWQVe9tN7ho=
X-Google-Smtp-Source: AGHT+IHAq2uat/BxStlvycvWIMemf9chq6bKvr5RgwVh7JekY7oKEJ33MFsCJYBOa4s18l+17nIrDA==
X-Received: by 2002:a81:ef0e:0:b0:61a:f206:bad6 with SMTP id
 00721157ae682-62cd55f6755mr90104707b3.30.1718050348318; 
 Mon, 10 Jun 2024 13:12:28 -0700 (PDT)
Received: from localhost (syn-076-182-020-124.res.spectrum.com.
 [76.182.20.124]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-62ccaef2825sm17372997b3.139.2024.06.10.13.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 13:12:27 -0700 (PDT)
Date: Mon, 10 Jun 2024 16:12:27 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Jonathan Calmels <jcalmels@3xx0.net>
Message-ID: <20240610201227.GD235772@perftesting>
References: <20240609104355.442002-1-jcalmels@3xx0.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240609104355.442002-1-jcalmels@3xx0.net>
Received-SPF: none client-ip=209.85.128.172; envelope-from=josef@toxicpanda.com;
 helo=mail-yw1-f172.google.com
X-Mailman-Approved-At: Mon, 10 Jun 2024 20:29:19 +0000
Subject: Re: [apparmor] [PATCH v2 0/4] Introduce user namespace capabilities
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
Cc: Matt Bobrowski <mattbobrowski@google.com>,
 Joel Granados <j.granados@samsung.com>, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 David Howells <dhowells@redhat.com>, Song Liu <song@kernel.org>,
 keyrings@vger.kernel.org, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 linux-security-module@vger.kernel.org, Mykola Lysenko <mykolal@fb.com>,
 Paul Moore <paul@paul-moore.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, John Fastabend <john.fastabend@gmail.com>,
 James Morris <jmorris@namei.org>, Jarkko Sakkinen <jarkko@kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, KP Singh <kpsingh@kernel.org>,
 containers@lists.linux.dev, Hao Luo <haoluo@google.com>, brauner@kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, linux-kernel@vger.kernel.org,
 Eduard Zingerman <eddyz87@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>,
 ebiederm@xmission.com, Jiri Olsa <jolsa@kernel.org>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sun, Jun 09, 2024 at 03:43:33AM -0700, Jonathan Calmels wrote:
> This patch series introduces a new user namespace capability set, as
> well as some plumbing around it (i.e. sysctl, secbit, lsm support).
> 
> First patch goes over the motivations for this as well as prior art.
> 
> In summary, while user namespaces are a great success today in that they
> avoid running a lot of code as root, they also expand the attack surface
> of the kernel substantially which is often abused by attackers. 
> Methods exist to limit the creation of such namespaces [1], however,
> application developers often need to assume that user namespaces are
> available for various tasks such as sandboxing. Thus, instead of
> restricting the creation of user namespaces, we offer ways for userspace
> to limit the capabilities granted to them.
> 
> Why a new capability set and not something specific to the userns (e.g.
> ioctl_ns)?
> 
>     1. We can't really expect userspace to patch every single callsite
>     and opt-in this new security mechanism. 
> 
>     2. We don't necessarily want policies enforced at said callsites.
>     For example a service like systemd-machined or a PAM session need to
>     be able to place restrictions on any namespace spawned under it.
> 
>     3. We would need to come up with inheritance rules, querying
>     capabilities, etc. At this point we're just reinventing capability
>     sets.
> 
>     4. We can easily define interactions between capability sets, thus
>     helping with adoption (patch 2 is an example of this)
> 
> Some examples of how this could be leveraged in userspace:
> 
>     - Prevent user from getting CAP_NET_ADMIN in user namespaces under SSH:
>         echo "auth optional pam_cap.so" >> /etc/pam.d/sshd
>         echo "!cap_net_admin $USER"     >> /etc/security/capability.conf
>         capsh --secbits=$((1 << 8)) -- -c /usr/sbin/sshd
> 
>     - Prevent containers from ever getting CAP_DAC_OVERRIDE:
>         systemd-run -p CapabilityBoundingSet=~CAP_DAC_OVERRIDE \
>                     -p SecureBits=userns-strict-caps \
>                     /usr/bin/dockerd
>         systemd-run -p UserNSCapabilities=~CAP_DAC_OVERRIDE \
>                     /usr/bin/incusd
> 
>     - Kernel could be vulnerable to CAP_SYS_RAWIO exploits, prevent it:
>         sysctl -w cap_bound_userns_mask=0x1fffffdffff
> 
>     - Drop CAP_SYS_ADMIN for this shell and all the user namespaces below it:
>         bwrap --unshare-user --cap-drop CAP_SYS_ADMIN /bin/sh
> 

Where are the tests for this patchset?  I see you updated the bpf tests for the
bpf lsm bits, but there's nothing to validate this new behavior or exercise the
new ioctl you've added.  Thanks,

Josef


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D21956007
	for <lists+apparmor@lfdr.de>; Mon, 19 Aug 2024 01:08:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sfp0m-0007Dg-G3; Sun, 18 Aug 2024 23:08:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <jarkko@kernel.org>) id 1seevh-000801-94
 for apparmor@lists.ubuntu.com; Thu, 15 Aug 2024 18:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7F418CE1D34;
 Thu, 15 Aug 2024 18:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DB3C32786;
 Thu, 15 Aug 2024 18:10:29 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Aug 2024 21:10:22 +0300
Message-Id: <D3GOR6ZR0MPL.2O29DCFWQ77RA@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jann Horn" <jannh@google.com>, "Paul Moore" <paul@paul-moore.com>,
 "James Morris" <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 "John Johansen" <john.johansen@canonical.com>, "David Howells"
 <dhowells@redhat.com>, =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?=
 <mic@digikod.net>, =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 "Stephen Smalley" <stephen.smalley.work@gmail.com>, "Ondrej Mosnacek"
 <omosnace@redhat.com>, "Casey Schaufler" <casey@schaufler-ca.com>
X-Mailer: aerc 0.17.0
References: <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
 <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
In-Reply-To: <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
Received-SPF: pass client-ip=145.40.73.55; envelope-from=jarkko@kernel.org;
 helo=sin.source.kernel.org
X-Mailman-Approved-At: Sun, 18 Aug 2024 23:08:35 +0000
Subject: Re: [apparmor] [PATCH v2 1/2] KEYS: use synchronous task work for
 changing parent credentials
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
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon Aug 5, 2024 at 2:54 PM EEST, Jann Horn wrote:
> keyctl_session_to_parent() involves posting task work to the parent task,
> with work function key_change_session_keyring.
> Because the task work in the parent runs asynchronously, no errors can be
> returned back to the caller of keyctl_session_to_parent(), and therefore
> the work function key_change_session_keyring() can't be allowed to fail d=
ue
> to things like memory allocation failure or permission checks - all
> allocations and checks have to happen in the child.
>
> This is annoying for two reasons:
>
>  - It is the only reason why cred_alloc_blank() and
>    security_transfer_creds() are necessary.
>  - It means we can't do synchronous permission checks.

I agree with this premise. Also I think the code change is reasonable.

I'd like to see a comment from David tho.

BR, Jarkko


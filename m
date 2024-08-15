Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CBC953B11
	for <lists+apparmor@lfdr.de>; Thu, 15 Aug 2024 21:47:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1segQq-0003ZC-Bb; Thu, 15 Aug 2024 19:46:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <dhowells@redhat.com>) id 1segQn-0003Yw-Vg
 for apparmor@lists.ubuntu.com; Thu, 15 Aug 2024 19:46:46 +0000
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-320-ntn8nMOUNz6pSvDV7rlhtg-1; Thu,
 15 Aug 2024 15:46:38 -0400
X-MC-Unique: ntn8nMOUNz6pSvDV7rlhtg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 280C9190ECEE; Thu, 15 Aug 2024 19:46:35 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.30])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5A56419560AA; Thu, 15 Aug 2024 19:46:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
References: <20240805-remove-cred-transfer-v2-1-a2aa1d45e6b8@google.com>
 <20240805-remove-cred-transfer-v2-0-a2aa1d45e6b8@google.com>
To: Jann Horn <jannh@google.com>, Jeffrey Altman <jaltman@auristor.com>,
 openafs-devel@openafs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2494948.1723751188.1@warthog.procyon.org.uk>
Date: Thu, 15 Aug 2024 20:46:28 +0100
Message-ID: <2494949.1723751188@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dhowells@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
Subject: [apparmor] Can KEYCTL_SESSION_TO_PARENT be dropped entirely? -- was
	Re: [PATCH v2 1/2] KEYS: use synchronous task work for
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
Cc: linux-security-module@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, Ondrej Mosnacek <omosnace@redhat.com>,
 dhowells@redhat.com, Jarkko Sakkinen <jarkko@kernel.org>,
 keyrings@vger.kernel.org, =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 linux-afs@lists.infradead.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Jann Horn <jannh@google.com> wrote:

> Rewrite keyctl_session_to_parent() to run task work on the parent
> synchronously, so that any errors that happen in the task work can be
> plumbed back into the syscall return value in the child.

The main thing I worry about is if there's a way to deadlock the child and the
parent against each other.  vfork() for example.

> +	if (task_work_cancel(parent, &ctx.work)) {
> +		/*
> +		 * We got interrupted and the task work was canceled before it
> +		 * could execute.
> +		 * Use -ERESTARTNOINTR instead of -ERESTARTSYS for
> +		 * compatibility - the manpage does not list -EINTR as a
> +		 * possible error for keyctl().
> +		 */

I think returning EINTR is fine, provided that if we return EINTR, the change
didn't happen.  KEYCTL_SESSION_TO_PARENT is only used by the aklog, dlog and
klog* OpenAFS programs AFAIK, and only if "-setpag" is set as a command line
option.  It also won't be effective if you strace the program.

Maybe the AFS people can say whether it's even worth keeping the functionality
rather than just dropping KEYCTL_SESSION_TO_PARENT?

David



Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEE9B0DE2E
	for <lists+apparmor@lfdr.de>; Tue, 22 Jul 2025 16:24:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ueDuF-0001XC-49; Tue, 22 Jul 2025 14:23:47 +0000
Received: from smtprelay0011.hostedemail.com ([216.40.44.11]
 helo=relay.hostedemail.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <rostedt@goodmis.org>)
 id 1ueDuD-0001Wr-4h
 for apparmor@lists.ubuntu.com; Tue, 22 Jul 2025 14:23:45 +0000
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay04.hostedemail.com (Postfix) with ESMTP id 009731A044A;
 Tue, 22 Jul 2025 14:23:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf13.hostedemail.com (Postfix) with ESMTPA id 5FC372001E; 
 Tue, 22 Jul 2025 14:23:41 +0000 (UTC)
Date: Tue, 22 Jul 2025 10:24:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>, apparmor@lists.ubuntu.com
Message-ID: <20250722102413.52083c6e@gandalf.local.home>
In-Reply-To: <20250722100413.117462d2@gandalf.local.home>
References: <20250722100413.117462d2@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: tstywm9r9h4xms6bpc8um9j9o66e3g36
X-Spam-Status: No, score=-0.10
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 5FC372001E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/zZ/aSobjVQGUAd7jsEcxZrvkd+kE9VrQ=
X-HE-Tag: 1753194221-783310
X-HE-Meta: U2FsdGVkX1/+pY7V+uD2DWTro7Xrm4Z/iaDwMTZKKDCdKCgWn1d0TDWd6kLTDrJFBsUAS8nw6VCtsUCuDg+v/0aBKfLR8lTYaOw8OtMjPUW7Xetl4pPxe028btGvv4a+0JajdyLcfZbB+q3EcatWiGDRh1jw16YUIppc49Bjtv4/P2J10d5XJwD9QWTp2rCKYOyHomdYkmF+uvfAuupU7nbq/PhkzdrkFpH3cRpdyoRS8OGnSPtiVzVcgdVqYyMqJRwPr+fEc4fBFKYEhEmZY0m3SXvMNQEg9QGGNU+OJe1OZFEXyhkMVOwIBJ/xGOpbO0we7MAAaKtEd2iw+xD/HHdeT4l+gjs0rgCbnjf8cNJgYluLP2iPrHhJieX7qbD4
Received-SPF: pass client-ip=216.40.44.11; envelope-from=rostedt@goodmis.org;
 helo=relay.hostedemail.com
Subject: Re: [apparmor] Lockdep warning for non-static key in apparmor code
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

On Tue, 22 Jul 2025 10:04:13 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> Booting latest linux-next, I triggered this warning.
> 
> Looks to be associated to apparmor. Was there an allocated spinlock not
> initialized properly?

Yeah, you don't initialize the spin lock. Is there a reason you commented
out the spin lock initialization in 88fec3526e841 ("apparmor: make sure
unix socket labeling is correctly updated.")?

--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -508,7 +508,6 @@ static int apparmor_file_alloc_security(struct file *file)
        struct aa_file_ctx *ctx = file_ctx(file);
        struct aa_label *label = begin_current_label_crit_section();
 
-       spin_lock_init(&ctx->lock);
        rcu_assign_pointer(ctx->label, aa_get_label(label));
        end_current_label_crit_section(label);
        return 0;
@@ -1076,12 +1075,29 @@ static int apparmor_userns_create(const struct cred *cred)
        return error;
 }
 
+static int apparmor_sk_alloc_security(struct sock *sk, int family, gfp_t gfp)
+{
+       struct aa_sk_ctx *ctx = aa_sock(sk);
+       struct aa_label *label;
+       bool needput;
+
+       label = __begin_current_label_crit_section(&needput);

+       //spin_lock_init(&ctx->lock);
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

+       rcu_assign_pointer(ctx->label, aa_get_label(label));
+       rcu_assign_pointer(ctx->peer, NULL);
+       rcu_assign_pointer(ctx->peer_lastupdate, NULL);
+       __end_current_label_crit_section(label, needput);
+       return 0;
+}

-- Steve


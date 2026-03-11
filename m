Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH5eAR/esmmtQQAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 12 Mar 2026 16:39:11 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BC38F274ADE
	for <lists+apparmor@lfdr.de>; Thu, 12 Mar 2026 16:39:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1w0hRp-0003OL-9z; Thu, 12 Mar 2026 14:55:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <mhiramat@kernel.org>) id 1w0Bzg-00044B-CQ
 for apparmor@lists.ubuntu.com; Wed, 11 Mar 2026 05:20:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8E663440BC;
 Wed, 11 Mar 2026 05:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B290C4CEF7;
 Wed, 11 Mar 2026 05:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773206020;
 bh=28by/08L5sQfVInnpnws13wBN8rSRzXkYuFZbXIDejE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fBD8jk+Az9XLzjQybetTno+W1ryvU+pJL+N7BKChPP4rEV9IYqgPEFF2K1MPy7V+I
 icuIUfL/Dg5/kgC+Hmy6YXnokVmu1zBps2v+geMH037tafu9KbfbPBt55PGuheVQJI
 z4qBbYgbztbgPszs8uOt3DWOo4BLsomiZb502AAVr8RGodlkXenJkrZoPQ7T4PM4Oz
 vrK0XegnvMjvVzXWSmVe1LK/JeGbm1OZeYQWd07yKlzuY4gn+/WuMImks+j3fST4ms
 212iplG27c78T1c+7zhxUp3BWeQ6jYmUF3g5aNFDkxAetR3pCSSickOn/0/x8U56nb
 McVwjAbkgnZAA==
Date: Wed, 11 Mar 2026 14:13:32 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Message-Id: <20260311141332.b611237d36b61b2409e66cb3@kernel.org>
In-Reply-To: <20260310100750.303af303@gandalf.local.home>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-15-bd63b656022d@avm.de>
 <20260310100750.303af303@gandalf.local.home>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=172.234.252.31; envelope-from=mhiramat@kernel.org;
 helo=sea.source.kernel.org
X-Mailman-Approved-At: Thu, 12 Mar 2026 14:55:34 +0000
Subject: Re: [apparmor] [PATCH 15/61] trace: Prefer IS_ERR_OR_NULL over
 manual NULL check
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
 Masami Hiramatsu <mhiramat@kernel.org>, linux-sound@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, ceph-devel@vger.kernel.org,
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
X-Spamd-Result: default: False [4.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[34];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MV_CASE(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:linux-hyperv@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-sh@vger.kernel.org,m:samba-technical@lists.samba.org,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:gfs2@lists.linux.dev,m:linux-mm@kvack.org,m:linux-sctp@vger.kernel.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-phy@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-cifs@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:iommu@lists.linux.dev,m:intel-wired-lan@lists.osuosl.org,m:linux-arm-kernel@lists.infradead.org,m:linux-input@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-media@vger.kernel.org,m:dm-devel@lists.linux.dev,m:phahn-oss@avm.de,m:linux-pm@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:apparmor@lists.ubuntu.com,m:mhiramat@kernel.org,m:linux-sound@vger.kernel.org,m:lin
 ux-block@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:mathieu.desnoyers@efficios.com,m:ceph-devel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:sched-ext@lists.linux.dev,m:cocci@inria.fr,m:linux-nfs@vger.kernel.org,m:ntfs3@lists.linux.dev,m:linux-s390@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-usb@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:tipc-discussion@lists.sourceforge.net,m:linux-modules@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-erofs@lists.ozlabs.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mhiramat@kernel.org,apparmor-bounces@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[57];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	NEURAL_HAM(-0.00)[-0.993];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,apparmor-bounces@lists.ubuntu.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goodmis.org:email,efficios.com:email,avm.de:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: BC38F274ADE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 10 Mar 2026 10:07:50 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Tue, 10 Mar 2026 12:48:41 +0100
> Philipp Hahn <phahn-oss@avm.de> wrote:
> 
> > Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> > check.
> 
> Why?
> 
> > 
> > Change generated with coccinelle.
> > 
> > To: Steven Rostedt <rostedt@goodmis.org>
> > To: Masami Hiramatsu <mhiramat@kernel.org>
> > To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-trace-kernel@vger.kernel.org
> > Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> > ---
> >  kernel/trace/fprobe.c                | 2 +-
> >  kernel/trace/kprobe_event_gen_test.c | 2 +-
> >  kernel/trace/trace_events_hist.c     | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
> > index dcadf1d23b8a31f571392d0c49cbd22df1716b4f..a94ce810d83b90f55d1178a9bd29c78fd068df4c 100644
> > --- a/kernel/trace/fprobe.c
> > +++ b/kernel/trace/fprobe.c
> > @@ -607,7 +607,7 @@ static int fprobe_module_callback(struct notifier_block *nb,
> >  	do {
> >  		rhashtable_walk_start(&iter);
> >  
> > -		while ((node = rhashtable_walk_next(&iter)) && !IS_ERR(node))
> > +		while (!IS_ERR_OR_NULL((node = rhashtable_walk_next(&iter))))
> 
> Ug, No!
> 
> That looks so much worse than the original.

Hmm, now IS_ERR_OR_NULL() is an inline function, so it is safe.
But if you want to use IS_ERR_OR_NULL() here, it will be better something like

node = rhashtable_walk_next(&iter);
while (!IS_ERR_OR_NULL(node)) {
	fprobe_remove_node_in_module(mod, node, &alist);
	node = rhashtable_walk_next(&iter);
}

Thanks,

> 
> -- Steve
> 
> >  			fprobe_remove_node_in_module(mod, node, &alist);
> >  
> >  		rhashtable_walk_stop(&iter);
> > diff --git a/kernel/trace/kprobe_event_gen_test.c b/kernel/trace/kprobe_event_gen_test.c
> > index 5a4b722b50451bfdee42769a6d3be39c055690d1..a1735ca273f0b756aa1fcfcdab30ddad9bc51c5f 100644
> > --- a/kernel/trace/kprobe_event_gen_test.c
> > +++ b/kernel/trace/kprobe_event_gen_test.c
> > @@ -75,7 +75,7 @@ static struct trace_event_file *gen_kretprobe_test;
> >  
> >  static bool trace_event_file_is_valid(struct trace_event_file *input)
> >  {
> > -	return input && !IS_ERR(input);
> > +	return !IS_ERR_OR_NULL(input);
> >  }
> >  
> >  /*
> > diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
> > index 73ea180cad555898693e92ee397a1c9493c7c167..59df215e1dfd9349eca1c0823ed709ec7285f766 100644
> > --- a/kernel/trace/trace_events_hist.c
> > +++ b/kernel/trace/trace_events_hist.c
> > @@ -3973,7 +3973,7 @@ trace_action_create_field_var(struct hist_trigger_data *hist_data,
> >  	 */
> >  	field_var = create_target_field_var(hist_data, system, event, var);
> >  
> > -	if (field_var && !IS_ERR(field_var)) {
> > +	if (!IS_ERR_OR_NULL(field_var)) {
> >  		save_field_var(hist_data, field_var);
> >  		hist_field = field_var->var;
> >  	} else {
> > 
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>


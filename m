Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILt4JNkZE2oi7gYAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 24 May 2026 17:31:37 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC1C5C2E79
	for <lists+apparmor@lfdr.de>; Sun, 24 May 2026 17:31:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wRAMp-0007hB-4u; Sun, 24 May 2026 15:03:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <kees@kernel.org>) id 1wQ3fs-0006f1-1F
 for apparmor@lists.ubuntu.com; Thu, 21 May 2026 13:42:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 49FE544644;
 Thu, 21 May 2026 13:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0520E1F01567;
 Thu, 21 May 2026 13:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779370407;
 bh=9DxkyjgrxD9LWinSna2ujdm04pqE2VVYzct98abjlWE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lLBu0VYv1DVOqqiDkn+zDGX6xIv/gVu34M1uPUGdN7rmbG/n9JKXvAO8PRNIOME0R
 FtA0rSletCu3HRLjvhAx+RubvjrPTSmol0lPEUginf3y5FRRR8GocUJjLx27hUfLyI
 NImEQHew3UjgMkSo9n+fGBIoBi3/9LfdXVekv3PwuKg0oTG1fvrFkXkMdUuEG1eZz+
 ObXQX0R5oQnmOcWg3mJprkFUBUufSGrKS1dHEDLMEfV0r/TCfFKsIVxugSqX1M6Aw/
 jeUk2cSX/+kzc1YG0egLBt3975yHP3KR9BAsWIhHsNktke684LZrzD2app3rClIjlW
 FWpisLKv3T/Uw==
From: Kees Cook <kees@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Date: Thu, 21 May 2026 06:33:21 -0700
Message-Id: <20260521133326.2465264-8-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521133315.work.845-kees@kernel.org>
References: <20260521133315.work.845-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=25560; i=kees@kernel.org;
 h=from:subject; bh=TTC1GDQfQrqWftreUSf50GOjYvxNzKR7cl5zgIVjTkw=;
 b=owGbwMvMwCVmps19z/KJym7G02pJDFn8nIucV/i8mPOxqnfn5sfGt/4pbtvK8rDifpsIt19y0
 Z5JsaH/O0pZGMS4GGTFFFmC7NzjXDzetoe7z1WEmcPKBDKEgYtTACZSuIORYWPyAa/PBXInPlzv
 vLD8gTrnpr+/SkKXGMp8mjD1o2JWRzPDPwXeTYp/JXT37Iqff3iCtU+8lPr1Rb1ZCy3vvqkQ+3p
 pJx8A
X-Developer-Key: i=kees@kernel.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.234.252.31; envelope-from=kees@kernel.org;
 helo=sea.source.kernel.org
X-Mailman-Approved-At: Sun, 24 May 2026 15:03:45 +0000
Subject: [apparmor] [PATCH 08/11] params: Convert generic kernel_param_ops
	.get helpers to seq_buf
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 usb-storage@lists.one-eyed-alien.net, linux-arch@vger.kernel.org,
 Bart Van Assche <bvanassche@acm.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 James Morris <jmorris@namei.org>, kasan-dev@googlegroups.com,
 Tvrtko Ursulin <tursulin@ursulin.net>, linux-acpi@vger.kernel.org,
 Alan Stern <stern@rowland.harvard.edu>, linux-pm@vger.kernel.org,
 linux-um@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-media@vger.kernel.org, Lukasz Luba <lukasz.luba@arm.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Simona Vetter <simona@ffwll.ch>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leon@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Gabriel Somlo <somlo@cmu.edu>,
 Len Brown <lenb@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jason Baron <jbaron@akamai.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jim Cromie <jim.cromie@gmail.com>,
 Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>,
 Kees Cook <kees@kernel.org>, linux-pci@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-rdma@vger.kernel.org,
 Sami Tolvanen <samitolvanen@google.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Marco Elver <elver@google.com>,
 Petr Pavlu <petr.pavlu@suse.com>, intel-gfx@lists.freedesktop.org,
 Corey Minyard <corey@minyard.net>, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 openipmi-developer@lists.sourceforge.net,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Hans de Goede <hansg@kernel.org>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 qemu-devel@nongnu.org, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>, Daniel Gomez <da.gomez@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-scsi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 linux-security-module@vger.kernel.org,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org,
 Zhang Rui <rui.zhang@intel.com>, Heiko Carstens <hca@linux.ibm.com>,
 apparmor@lists.ubuntu.com, virtualization@lists.linux.dev,
 linux-hardening@vger.kernel.org, Hannes Reinecke <hare@suse.de>,
 Benjamin Berg <benjamin.berg@intel.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Tiwei Bie <tiwei.btw@antgroup.com>, Dmitry Vyukov <dvyukov@google.com>,
 netdev@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 linux-modules@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [5.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	DATE_IN_PAST(1.00)[73];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mcgrof@kernel.org,m:rafael@kernel.org,m:dri-devel@lists.freedesktop.org,m:pengpeng@iscas.ac.cn,m:srinivas.pandruvada@linux.intel.com,m:usb-storage@lists.one-eyed-alien.net,m:linux-arch@vger.kernel.org,m:bvanassche@acm.org,m:jgg@ziepe.ca,m:jmorris@namei.org,m:kasan-dev@googlegroups.com,m:tursulin@ursulin.net,m:linux-acpi@vger.kernel.org,m:stern@rowland.harvard.edu,m:linux-pm@vger.kernel.org,m:linux-um@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:linux-media@vger.kernel.org,m:lukasz.luba@arm.com,m:macro@orcam.me.uk,m:dave.hansen@linux.intel.com,m:James.Bottomley@HansenPartnership.com,m:simona@ffwll.ch,m:xuanzhuo@linux.alibaba.com,m:paul@paul-moore.com,m:leon@kernel.org,m:Frank.Li@kernel.org,m:somlo@cmu.edu,m:lenb@kernel.org,m:gor@linux.ibm.com,m:jani.nikula@linux.intel.com,m:jbaron@akamai.com,m:bhelgaas@google.com,m:jim.cromie@gmail.com
 ,m:seanjc@google.com,m:tglx@kernel.org,m:kees@kernel.org,m:linux-pci@vger.kernel.org,m:jasowang@redhat.com,m:joonas.lahtinen@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:david.e.box@linux.intel.com,m:jirislaby@kernel.org,m:linux-rdma@vger.kernel.org,m:samitolvanen@google.com,m:ilpo.jarvinen@linux.intel.com,m:serge@hallyn.com,m:elver@google.com,m:petr.pavlu@suse.com,m:intel-gfx@lists.freedesktop.org,m:corey@minyard.net,m:bp@alien8.de,m:rodrigo.vivi@intel.com,m:openipmi-developer@lists.sourceforge.net,m:mchehab@kernel.org,m:martin.petersen@oracle.com,m:atomlin@atomlin.com,m:hansg@kernel.org,m:kvm@vger.kernel.org,m:mst@redhat.com,m:peterz@infradead.org,m:hpa@zytor.com,m:qemu-devel@nongnu.org,m:linux-mm@kvack.org,m:glider@google.com,m:da.gomez@kernel.org,m:airlied@gmail.com,m:anton.ivanov@cambridgegreys.com,m:linux-scsi@vger.kernel.org,m:richard@nod.at,m:x86@kernel.org,m:linux-security-module@vger.kernel.org,m:eperezma@redhat.com,m:mingo@redhat.com,m:linux-serial@vger.kernel.or
 g,m:rui.zhang@intel.com,m:hca@linux.ibm.com,m:apparmor@lists.ubuntu.com,m:virtualization@lists.linux.dev,m:linux-hardening@vger.kernel.org,m:hare@suse.de,m:benjamin.berg@intel.com,m:daniel.lezcano@kernel.org,m:andriy.shevchenko@linux.intel.com,m:tiwei.btw@antgroup.com,m:dvyukov@google.com,m:netdev@vger.kernel.org,m:vkoul@kernel.org,m:dmaengine@vger.kernel.org,m:pbonzini@redhat.com,m:johannes@sipsolutions.net,m:linuxppc-dev@lists.ozlabs.org,m:linux-modules@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kees@kernel.org,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[kernel.org,lists.freedesktop.org,iscas.ac.cn,linux.intel.com,lists.one-eyed-alien.net,vger.kernel.org,acm.org,ziepe.ca,namei.org,googlegroups.com,ursulin.net,rowland.harvard.edu,lists.infradead.org,linuxfoundation.org,linux-foundation.org,arm.com,orcam.me.uk,HansenPartnership.com,ffwll.ch,linux.alibaba.com,paul-moore.com,cmu.edu,linux.ibm.com,akamai.com,google.com,gmail.com,redhat.com,ideasonboard.com,hallyn.com,suse.com,minyard.net,alien8.de,intel.com,lists.sourceforge.net,oracle.com,atomlin.com,infradead.org,zytor.com,nongnu.org,kvack.org,cambridgegreys.com,nod.at,lists.ubuntu.com,lists.linux.dev,suse.de,antgroup.com,sipsolutions.net,lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[97];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.532];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo]
X-Rspamd-Queue-Id: 5BC1C5C2E79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the generic struct kernel_param_ops .get helpers in
kernel/params.c directly to the seq_buf signature, drop their legacy
"char *" form, and refresh prototypes in <linux/moduleparam.h>:

  param_get_byte/short/ushort/int/uint/long/ulong/ullong/hexint
  param_get_charp/bool/invbool/string
  param_array_get

The STANDARD_PARAM_DEF() macro expands to a seq_buf body for every
numeric helper. param_array_get() now writes element output directly
into the parent seq_buf when the element ops provide .get; it only
allocates the per-call PAGE_SIZE bounce buffer when the element ops
still use the legacy .get_str path. The common "rewrite the prior
element's trailing newline as a comma" step lives outside both
branches so the two paths share it.

The non-core changes in this commit (arch/x86/kvm, mm/kfence,
drivers/dma/dmatest, security/apparmor) are the small set of callers that
directly invoke one of the converted generic helpers from their own .get
callback (e.g. an apparmor wrapper that adds a capability check and then
delegates to param_get_bool()). Because the helpers' signature changes
here, these wrappers must move in lockstep. Each of them is updated
to take "struct seq_buf *" and pass it through; param_get_debug() in
apparmor also pulls aa_print_debug_params() (and its val_mask_to_str()
helper, in security/apparmor/lib.c) over to seq_buf, since that is the
only consumer. No other behavioural change is intended.

Custom .get callbacks that do not delegate to a generic helper (and
therefore still match the .get_str signature) are routed automatically
to the .get_str field by the DEFINE_KERNEL_PARAM_OPS _Generic dispatcher
and are deliberately left alone here, to be changed separately within
their respective subsystems.

Signed-off-by: Kees Cook <kees@kernel.org>
---
 include/linux/moduleparam.h     | 26 +++++------
 security/apparmor/include/lib.h |  3 +-
 mm/kfence/core.c                |  8 ++--
 arch/x86/kvm/mmu/mmu.c          | 16 ++++---
 arch/x86/kvm/svm/avic.c         |  8 ++--
 drivers/dma/dmatest.c           | 14 +++---
 kernel/params.c                 | 80 ++++++++++++++++++++-------------
 security/apparmor/lib.c         | 27 +++++------
 security/apparmor/lsm.c         | 25 ++++++-----
 9 files changed, 114 insertions(+), 93 deletions(-)

diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index 795bc7c654ef..38acb5aef56b 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -500,61 +500,61 @@ void module_destroy_params(const struct kernel_param *params, unsigned int num);
 
 extern const struct kernel_param_ops param_ops_byte;
 int param_set_byte(const char *val, const struct kernel_param *kp);
-int param_get_byte(char *buffer, const struct kernel_param *kp);
+int param_get_byte(struct seq_buf *s, const struct kernel_param *kp);
 #define param_check_byte(name, p) __param_check(name, p, unsigned char)
 
 extern const struct kernel_param_ops param_ops_short;
 int param_set_short(const char *val, const struct kernel_param *kp);
-int param_get_short(char *buffer, const struct kernel_param *kp);
+int param_get_short(struct seq_buf *s, const struct kernel_param *kp);
 #define param_check_short(name, p) __param_check(name, p, short)
 
 extern const struct kernel_param_ops param_ops_ushort;
 int param_set_ushort(const char *val, const struct kernel_param *kp);
-int param_get_ushort(char *buffer, const struct kernel_param *kp);
+int param_get_ushort(struct seq_buf *s, const struct kernel_param *kp);
 #define param_check_ushort(name, p) __param_check(name, p, unsigned short)
 
 extern const struct kernel_param_ops param_ops_int;
 int param_set_int(const char *val, const struct kernel_param *kp);
-int param_get_int(char *buffer, const struct kernel_param *kp);
+int param_get_int(struct seq_buf *s, const struct kernel_param *kp);
 #define param_check_int(name, p) __param_check(name, p, int)
 
 extern const struct kernel_param_ops param_ops_uint;
 int param_set_uint(const char *val, const struct kernel_param *kp);
-int param_get_uint(char *buffer, const struct kernel_param *kp);
+int param_get_uint(struct seq_buf *s, const struct kernel_param *kp);
 int param_set_uint_minmax(const char *val, const struct kernel_param *kp,
 		unsigned int min, unsigned int max);
 #define param_check_uint(name, p) __param_check(name, p, unsigned int)
 
 extern const struct kernel_param_ops param_ops_long;
 int param_set_long(const char *val, const struct kernel_param *kp);
-int param_get_long(char *buffer, const struct kernel_param *kp);
+int param_get_long(struct seq_buf *s, const struct kernel_param *kp);
 #define param_check_long(name, p) __param_check(name, p, long)
 
 extern const struct kernel_param_ops param_ops_ulong;
 int param_set_ulong(const char *val, const struct kernel_param *kp);
-int param_get_ulong(char *buffer, const struct kernel_param *kp);
+int param_get_ulong(struct seq_buf *s, const struct kernel_param *kp);
 #define param_check_ulong(name, p) __param_check(name, p, unsigned long)
 
 extern const struct kernel_param_ops param_ops_ullong;
 int param_set_ullong(const char *val, const struct kernel_param *kp);
-int param_get_ullong(char *buffer, const struct kernel_param *kp);
+int param_get_ullong(struct seq_buf *s, const struct kernel_param *kp);
 #define param_check_ullong(name, p) __param_check(name, p, unsigned long long)
 
 extern const struct kernel_param_ops param_ops_hexint;
 int param_set_hexint(const char *val, const struct kernel_param *kp);
-int param_get_hexint(char *buffer, const struct kernel_param *kp);
+int param_get_hexint(struct seq_buf *s, const struct kernel_param *kp);
 #define param_check_hexint(name, p) param_check_uint(name, p)
 
 extern const struct kernel_param_ops param_ops_charp;
 int param_set_charp(const char *val, const struct kernel_param *kp);
-int param_get_charp(char *buffer, const struct kernel_param *kp);
+int param_get_charp(struct seq_buf *s, const struct kernel_param *kp);
 void param_free_charp(void *arg);
 #define param_check_charp(name, p) __param_check(name, p, char *)
 
 /* We used to allow int as well as bool.  We're taking that away! */
 extern const struct kernel_param_ops param_ops_bool;
 int param_set_bool(const char *val, const struct kernel_param *kp);
-int param_get_bool(char *buffer, const struct kernel_param *kp);
+int param_get_bool(struct seq_buf *s, const struct kernel_param *kp);
 #define param_check_bool(name, p) __param_check(name, p, bool)
 
 extern const struct kernel_param_ops param_ops_bool_enable_only;
@@ -564,7 +564,7 @@ int param_set_bool_enable_only(const char *val, const struct kernel_param *kp);
 
 extern const struct kernel_param_ops param_ops_invbool;
 int param_set_invbool(const char *val, const struct kernel_param *kp);
-int param_get_invbool(char *buffer, const struct kernel_param *kp);
+int param_get_invbool(struct seq_buf *s, const struct kernel_param *kp);
 #define param_check_invbool(name, p) __param_check(name, p, bool)
 
 /* An int, which can only be set like a bool (though it shows as an int). */
@@ -677,7 +677,7 @@ extern const struct kernel_param_ops param_array_ops;
 
 extern const struct kernel_param_ops param_ops_string;
 int param_set_copystring(const char *val, const struct kernel_param *kp);
-int param_get_string(char *buffer, const struct kernel_param *kp);
+int param_get_string(struct seq_buf *s, const struct kernel_param *kp);
 
 /* for exporting parameters in /sys/module/.../parameters */
 
diff --git a/security/apparmor/include/lib.h b/security/apparmor/include/lib.h
index 8c6ce8484552..966082075e61 100644
--- a/security/apparmor/include/lib.h
+++ b/security/apparmor/include/lib.h
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/fs.h>
 #include <linux/lsm_hooks.h>
+#include <linux/seq_buf.h>
 
 #include "match.h"
 
@@ -72,7 +73,7 @@ do {									\
 #endif
 
 int aa_parse_debug_params(const char *str);
-int aa_print_debug_params(char *buffer);
+int aa_print_debug_params(struct seq_buf *s);
 
 #define AA_ERROR(fmt, args...)						\
 	pr_err_ratelimited("AppArmor: " fmt, ##args)
diff --git a/mm/kfence/core.c b/mm/kfence/core.c
index e14102c01520..bfa936f09978 100644
--- a/mm/kfence/core.c
+++ b/mm/kfence/core.c
@@ -84,10 +84,12 @@ static int param_set_sample_interval(const char *val, const struct kernel_param
 	return 0;
 }
 
-static int param_get_sample_interval(char *buffer, const struct kernel_param *kp)
+static int param_get_sample_interval(struct seq_buf *buffer, const struct kernel_param *kp)
 {
-	if (!READ_ONCE(kfence_enabled))
-		return sprintf(buffer, "0\n");
+	if (!READ_ONCE(kfence_enabled)) {
+		seq_buf_puts(buffer, "0\n");
+		return 0;
+	}
 
 	return param_get_ulong(buffer, kp);
 }
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 996818ee9b09..5e9a2690d335 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -70,7 +70,7 @@ static uint __read_mostly nx_huge_pages_recovery_ratio = 0;
 static uint __read_mostly nx_huge_pages_recovery_ratio = 60;
 #endif
 
-static int get_nx_huge_pages(char *buffer, const struct kernel_param *kp);
+static int get_nx_huge_pages(struct seq_buf *buffer, const struct kernel_param *kp);
 static int set_nx_huge_pages(const char *val, const struct kernel_param *kp);
 static int set_nx_huge_pages_recovery_param(const char *val, const struct kernel_param *kp);
 
@@ -7493,15 +7493,19 @@ static void kvm_wake_nx_recovery_thread(struct kvm *kvm)
 		vhost_task_wake(nx_thread);
 }
 
-static int get_nx_huge_pages(char *buffer, const struct kernel_param *kp)
+static int get_nx_huge_pages(struct seq_buf *buffer, const struct kernel_param *kp)
 {
 	int val = *(int *)kp->arg;
 
-	if (nx_hugepage_mitigation_hard_disabled)
-		return sysfs_emit(buffer, "never\n");
+	if (nx_hugepage_mitigation_hard_disabled) {
+		seq_buf_puts(buffer, "never\n");
+		return 0;
+	}
 
-	if (val == -1)
-		return sysfs_emit(buffer, "auto\n");
+	if (val == -1) {
+		seq_buf_puts(buffer, "auto\n");
+		return 0;
+	}
 
 	return param_get_bool(buffer, kp);
 }
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 7907f9addff9..6c3b4626c5c1 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -77,12 +77,14 @@ static int avic_param_set(const char *val, const struct kernel_param *kp)
 	return param_set_bint(val, kp);
 }
 
-static int avic_param_get(char *buffer, const struct kernel_param *kp)
+static int avic_param_get(struct seq_buf *buffer, const struct kernel_param *kp)
 {
 	int val = *(int *)kp->arg;
 
-	if (val == AVIC_AUTO_MODE)
-		return sysfs_emit(buffer, "N\n");
+	if (val == AVIC_AUTO_MODE) {
+		seq_buf_puts(buffer, "N\n");
+		return 0;
+	}
 
 	return param_get_bool(buffer, kp);
 }
diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index a7bddadcc52d..828298faca16 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -153,14 +153,14 @@ static struct dmatest_info {
 };
 
 static int dmatest_run_set(const char *val, const struct kernel_param *kp);
-static int dmatest_run_get(char *val, const struct kernel_param *kp);
+static int dmatest_run_get(struct seq_buf *val, const struct kernel_param *kp);
 static DEFINE_KERNEL_PARAM_OPS(run_ops, dmatest_run_set, dmatest_run_get);
 static bool dmatest_run;
 module_param_cb(run, &run_ops, &dmatest_run, 0644);
 MODULE_PARM_DESC(run, "Run the test (default: false)");
 
 static int dmatest_chan_set(const char *val, const struct kernel_param *kp);
-static int dmatest_chan_get(char *val, const struct kernel_param *kp);
+static int dmatest_chan_get(struct seq_buf *val, const struct kernel_param *kp);
 static DEFINE_KERNEL_PARAM_OPS(multi_chan_ops, dmatest_chan_set,
 			       dmatest_chan_get);
 
@@ -172,7 +172,7 @@ static struct kparam_string newchan_kps = {
 module_param_cb(channel, &multi_chan_ops, &newchan_kps, 0644);
 MODULE_PARM_DESC(channel, "Bus ID of the channel to test (default: any)");
 
-static int dmatest_test_list_get(char *val, const struct kernel_param *kp);
+static int dmatest_test_list_get(struct seq_buf *val, const struct kernel_param *kp);
 static DEFINE_KERNEL_PARAM_OPS(test_list_ops, NULL, dmatest_test_list_get);
 module_param_cb(test_list, &test_list_ops, NULL, 0444);
 MODULE_PARM_DESC(test_list, "Print current test list");
@@ -274,7 +274,7 @@ static bool is_threaded_test_pending(struct dmatest_info *info)
 	return false;
 }
 
-static int dmatest_wait_get(char *val, const struct kernel_param *kp)
+static int dmatest_wait_get(struct seq_buf *val, const struct kernel_param *kp)
 {
 	struct dmatest_info *info = &test_info;
 	struct dmatest_params *params = &info->params;
@@ -1164,7 +1164,7 @@ static void start_threaded_tests(struct dmatest_info *info)
 	run_pending_tests(info);
 }
 
-static int dmatest_run_get(char *val, const struct kernel_param *kp)
+static int dmatest_run_get(struct seq_buf *val, const struct kernel_param *kp)
 {
 	struct dmatest_info *info = &test_info;
 
@@ -1292,7 +1292,7 @@ static int dmatest_chan_set(const char *val, const struct kernel_param *kp)
 	return ret;
 }
 
-static int dmatest_chan_get(char *val, const struct kernel_param *kp)
+static int dmatest_chan_get(struct seq_buf *val, const struct kernel_param *kp)
 {
 	struct dmatest_info *info = &test_info;
 
@@ -1306,7 +1306,7 @@ static int dmatest_chan_get(char *val, const struct kernel_param *kp)
 	return param_get_string(val, kp);
 }
 
-static int dmatest_test_list_get(char *val, const struct kernel_param *kp)
+static int dmatest_test_list_get(struct seq_buf *val, const struct kernel_param *kp)
 {
 	struct dmatest_info *info = &test_info;
 	struct dmatest_chan *dtc;
diff --git a/kernel/params.c b/kernel/params.c
index 4eda2d23ddf2..25f0c8d5d19f 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -212,15 +212,16 @@ char *parse_args(const char *doing,
 }
 
 /* Lazy bastard, eh? */
-#define STANDARD_PARAM_DEF(name, type, format, strtolfn)      		\
+#define STANDARD_PARAM_DEF(name, type, format, strtolfn)		\
 	int param_set_##name(const char *val, const struct kernel_param *kp) \
 	{								\
 		return strtolfn(val, 0, (type *)kp->arg);		\
 	}								\
-	int param_get_##name(char *buffer, const struct kernel_param *kp) \
+	int param_get_##name(struct seq_buf *s,				\
+			     const struct kernel_param *kp)		\
 	{								\
-		return scnprintf(buffer, PAGE_SIZE, format "\n",	\
-				*((type *)kp->arg));			\
+		seq_buf_printf(s, format "\n", *((type *)kp->arg));	\
+		return 0;						\
 	}								\
 	DEFINE_KERNEL_PARAM_OPS(param_ops_##name,			\
 				param_set_##name, param_get_##name);	\
@@ -285,9 +286,10 @@ int param_set_charp(const char *val, const struct kernel_param *kp)
 }
 EXPORT_SYMBOL(param_set_charp);
 
-int param_get_charp(char *buffer, const struct kernel_param *kp)
+int param_get_charp(struct seq_buf *s, const struct kernel_param *kp)
 {
-	return scnprintf(buffer, PAGE_SIZE, "%s\n", *((char **)kp->arg));
+	seq_buf_printf(s, "%s\n", *((char **)kp->arg));
+	return 0;
 }
 EXPORT_SYMBOL(param_get_charp);
 
@@ -312,10 +314,11 @@ int param_set_bool(const char *val, const struct kernel_param *kp)
 }
 EXPORT_SYMBOL(param_set_bool);
 
-int param_get_bool(char *buffer, const struct kernel_param *kp)
+int param_get_bool(struct seq_buf *s, const struct kernel_param *kp)
 {
 	/* Y and N chosen as being relatively non-coder friendly */
-	return sprintf(buffer, "%c\n", *(bool *)kp->arg ? 'Y' : 'N');
+	seq_buf_printf(s, "%c\n", *(bool *)kp->arg ? 'Y' : 'N');
+	return 0;
 }
 EXPORT_SYMBOL(param_get_bool);
 
@@ -365,9 +368,10 @@ int param_set_invbool(const char *val, const struct kernel_param *kp)
 }
 EXPORT_SYMBOL(param_set_invbool);
 
-int param_get_invbool(char *buffer, const struct kernel_param *kp)
+int param_get_invbool(struct seq_buf *s, const struct kernel_param *kp)
 {
-	return sprintf(buffer, "%c\n", (*(bool *)kp->arg) ? 'N' : 'Y');
+	seq_buf_printf(s, "%c\n", (*(bool *)kp->arg) ? 'N' : 'Y');
+	return 0;
 }
 EXPORT_SYMBOL(param_get_invbool);
 
@@ -453,36 +457,46 @@ static int param_array_set(const char *val, const struct kernel_param *kp)
 			   arr->num ?: &temp_num);
 }
 
-static int param_array_get(char *buffer, const struct kernel_param *kp)
+static int param_array_get(struct seq_buf *s, const struct kernel_param *kp)
 {
-	int i, off, ret;
-	char *elem_buf;
 	const struct kparam_array *arr = kp->arr;
 	struct kernel_param p = *kp;
+	char *elem_buf = NULL;
+	int i, ret = 0;
 
-	elem_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
-	if (!elem_buf)
-		return -ENOMEM;
+	for (i = 0; i < (arr->num ? *arr->num : arr->max); i++) {
+		size_t before = s->len;
 
-	for (i = off = 0; i < (arr->num ? *arr->num : arr->max); i++) {
 		p.arg = arr->elem + arr->elemsize * i;
 		check_kparam_locked(p.mod);
-		ret = arr->ops->get_str(elem_buf, &p);
-		if (ret < 0)
-			goto out;
-		ret = min(ret, (int)(PAGE_SIZE - 1 - off));
-		if (!ret)
+
+		if (arr->ops->get) {
+			ret = arr->ops->get(s, &p);
+			if (ret < 0)
+				goto out;
+		} else {
+			if (!elem_buf) {
+				elem_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
+				if (!elem_buf) {
+					ret = -ENOMEM;
+					goto out;
+				}
+			}
+			ret = arr->ops->get_str(elem_buf, &p);
+			if (ret < 0)
+				goto out;
+			seq_buf_putmem(s, elem_buf, ret);
+		}
+
+		/* Nothing got written (e.g. overflow) — stop. */
+		if (s->len == before)
 			break;
+
 		/* Replace the previous element's trailing newline with a comma. */
-		if (i)
-			buffer[off - 1] = ',';
-		memcpy(buffer + off, elem_buf, ret);
-		off += ret;
-		if (off == PAGE_SIZE - 1)
-			break;
+		if (i && s->buffer[before - 1] == '\n')
+			s->buffer[before - 1] = ',';
 	}
-	buffer[off] = '\0';
-	ret = off;
+	ret = 0;
 out:
 	kfree(elem_buf);
 	return ret;
@@ -517,10 +531,12 @@ int param_set_copystring(const char *val, const struct kernel_param *kp)
 }
 EXPORT_SYMBOL(param_set_copystring);
 
-int param_get_string(char *buffer, const struct kernel_param *kp)
+int param_get_string(struct seq_buf *s, const struct kernel_param *kp)
 {
 	const struct kparam_string *kps = kp->str;
-	return scnprintf(buffer, PAGE_SIZE, "%s\n", kps->string);
+
+	seq_buf_printf(s, "%s\n", kps->string);
+	return 0;
 }
 EXPORT_SYMBOL(param_get_string);
 
diff --git a/security/apparmor/lib.c b/security/apparmor/lib.c
index e41ff57798b2..eef136add5b4 100644
--- a/security/apparmor/lib.c
+++ b/security/apparmor/lib.c
@@ -85,37 +85,32 @@ int aa_parse_debug_params(const char *str)
 
 /**
  * val_mask_to_str - convert a perm mask to its short string
- * @str: character buffer to store string in (at least 10 characters)
- * @size: size of the @str buffer
+ * @s: seq_buf to store string in
  * @table: NUL-terminated character buffer of permission characters (NOT NULL)
  * @mask: permission mask to convert
  */
-static int val_mask_to_str(char *str, size_t size,
-			   const struct val_table_ent *table, u32 mask)
+static void val_mask_to_str(struct seq_buf *s,
+			    const struct val_table_ent *table, u32 mask)
 {
 	const struct val_table_ent *ent;
-	int total = 0;
+	bool first = true;
 
 	for (ent = table; ent->str; ent++) {
 		if (ent->value && (ent->value & mask) == ent->value) {
-			int len = scnprintf(str, size, "%s%s", total ? "," : "",
-					    ent->str);
-			size -= len;
-			str += len;
-			total += len;
+			seq_buf_printf(s, "%s%s", first ? "" : ",", ent->str);
+			first = false;
 			mask &= ~ent->value;
 		}
 	}
-
-	return total;
 }
 
-int aa_print_debug_params(char *buffer)
+int aa_print_debug_params(struct seq_buf *s)
 {
 	if (!aa_g_debug)
-		return sprintf(buffer, "N");
-	return val_mask_to_str(buffer, PAGE_SIZE, debug_values_table,
-			       aa_g_debug);
+		seq_buf_puts(s, "N");
+	else
+		val_mask_to_str(s, debug_values_table, aa_g_debug);
+	return 0;
 }
 
 bool aa_resize_str_table(struct aa_str_table *t, int newsize, gfp_t gfp)
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 8a253c743363..a6815b4bd0da 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -16,6 +16,7 @@
 #include <linux/namei.h>
 #include <linux/ptrace.h>
 #include <linux/ctype.h>
+#include <linux/seq_buf.h>
 #include <linux/sysctl.h>
 #include <linux/sysfs.h>
 #include <linux/audit.h>
@@ -1765,20 +1766,20 @@ static struct security_hook_list apparmor_hooks[] __ro_after_init = {
  */
 
 static int param_set_aabool(const char *val, const struct kernel_param *kp);
-static int param_get_aabool(char *buffer, const struct kernel_param *kp);
+static int param_get_aabool(struct seq_buf *buffer, const struct kernel_param *kp);
 #define param_check_aabool param_check_bool
 static DEFINE_KERNEL_PARAM_OPS_NOARG(param_ops_aabool, param_set_aabool,
 				     param_get_aabool);
 
 static int param_set_aauint(const char *val, const struct kernel_param *kp);
-static int param_get_aauint(char *buffer, const struct kernel_param *kp);
+static int param_get_aauint(struct seq_buf *buffer, const struct kernel_param *kp);
 #define param_check_aauint param_check_uint
 static DEFINE_KERNEL_PARAM_OPS(param_ops_aauint, param_set_aauint,
 			       param_get_aauint);
 
 static int param_set_aacompressionlevel(const char *val,
 					const struct kernel_param *kp);
-static int param_get_aacompressionlevel(char *buffer,
+static int param_get_aacompressionlevel(struct seq_buf *buffer,
 					const struct kernel_param *kp);
 #define param_check_aacompressionlevel param_check_int
 static DEFINE_KERNEL_PARAM_OPS(param_ops_aacompressionlevel,
@@ -1786,14 +1787,14 @@ static DEFINE_KERNEL_PARAM_OPS(param_ops_aacompressionlevel,
 			       param_get_aacompressionlevel);
 
 static int param_set_aalockpolicy(const char *val, const struct kernel_param *kp);
-static int param_get_aalockpolicy(char *buffer, const struct kernel_param *kp);
+static int param_get_aalockpolicy(struct seq_buf *buffer, const struct kernel_param *kp);
 #define param_check_aalockpolicy param_check_bool
 static DEFINE_KERNEL_PARAM_OPS_NOARG(param_ops_aalockpolicy,
 				     param_set_aalockpolicy,
 				     param_get_aalockpolicy);
 
 static int param_set_debug(const char *val, const struct kernel_param *kp);
-static int param_get_debug(char *buffer, const struct kernel_param *kp);
+static int param_get_debug(struct seq_buf *buffer, const struct kernel_param *kp);
 
 static int param_set_audit(const char *val, const struct kernel_param *kp);
 static int param_get_audit(char *buffer, const struct kernel_param *kp);
@@ -1868,7 +1869,7 @@ module_param_named(path_max, aa_g_path_max, aauint, S_IRUSR);
 bool aa_g_paranoid_load = IS_ENABLED(CONFIG_SECURITY_APPARMOR_PARANOID_LOAD);
 module_param_named(paranoid_load, aa_g_paranoid_load, aabool, S_IRUGO);
 
-static int param_get_aaintbool(char *buffer, const struct kernel_param *kp);
+static int param_get_aaintbool(struct seq_buf *buffer, const struct kernel_param *kp);
 static int param_set_aaintbool(const char *val, const struct kernel_param *kp);
 #define param_check_aaintbool param_check_int
 static DEFINE_KERNEL_PARAM_OPS(param_ops_aaintbool, param_set_aaintbool,
@@ -1898,7 +1899,7 @@ static int param_set_aalockpolicy(const char *val, const struct kernel_param *kp
 	return param_set_bool(val, kp);
 }
 
-static int param_get_aalockpolicy(char *buffer, const struct kernel_param *kp)
+static int param_get_aalockpolicy(struct seq_buf *buffer, const struct kernel_param *kp)
 {
 	if (!apparmor_enabled)
 		return -EINVAL;
@@ -1916,7 +1917,7 @@ static int param_set_aabool(const char *val, const struct kernel_param *kp)
 	return param_set_bool(val, kp);
 }
 
-static int param_get_aabool(char *buffer, const struct kernel_param *kp)
+static int param_get_aabool(struct seq_buf *buffer, const struct kernel_param *kp)
 {
 	if (!apparmor_enabled)
 		return -EINVAL;
@@ -1942,7 +1943,7 @@ static int param_set_aauint(const char *val, const struct kernel_param *kp)
 	return error;
 }
 
-static int param_get_aauint(char *buffer, const struct kernel_param *kp)
+static int param_get_aauint(struct seq_buf *buffer, const struct kernel_param *kp)
 {
 	if (!apparmor_enabled)
 		return -EINVAL;
@@ -1978,7 +1979,7 @@ static int param_set_aaintbool(const char *val, const struct kernel_param *kp)
  * display in the /sys filesystem, while keeping it "int" for the LSM
  * infrastructure.
  */
-static int param_get_aaintbool(char *buffer, const struct kernel_param *kp)
+static int param_get_aaintbool(struct seq_buf *buffer, const struct kernel_param *kp)
 {
 	struct kernel_param kp_local;
 	bool value;
@@ -2011,7 +2012,7 @@ static int param_set_aacompressionlevel(const char *val,
 	return error;
 }
 
-static int param_get_aacompressionlevel(char *buffer,
+static int param_get_aacompressionlevel(struct seq_buf *buffer,
 					const struct kernel_param *kp)
 {
 	if (!apparmor_enabled)
@@ -2021,7 +2022,7 @@ static int param_get_aacompressionlevel(char *buffer,
 	return param_get_int(buffer, kp);
 }
 
-static int param_get_debug(char *buffer, const struct kernel_param *kp)
+static int param_get_debug(struct seq_buf *buffer, const struct kernel_param *kp)
 {
 	if (!apparmor_enabled)
 		return -EINVAL;
-- 
2.34.1



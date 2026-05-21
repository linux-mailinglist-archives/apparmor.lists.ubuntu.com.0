Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDWpA74ZE2oi7gYAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 24 May 2026 17:31:10 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B91EE5C2E27
	for <lists+apparmor@lfdr.de>; Sun, 24 May 2026 17:31:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wRAMt-0007w5-LI; Sun, 24 May 2026 15:03:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <kees@kernel.org>) id 1wQ3fr-0006ey-W6
 for apparmor@lists.ubuntu.com; Thu, 21 May 2026 13:42:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7322F44669;
 Thu, 21 May 2026 13:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC0C1F01579;
 Thu, 21 May 2026 13:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779370407;
 bh=xwIDnz4Pf2a/0Wouv4cV1Bk8/fwt1/yHjZ8WyMRsm0E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=faqBkEGM4aU15rBNkXIkUKRG5AsCe1S2Aewj2Tv1k/O0IFENHWQB9BDl0qYlYUXx1
 yoSYnXrOdkYgaAvt93OzOSpjQt1HbLSZILUsO+WwAhtrliX5J0FzgX8CuujFmAl5jz
 X8uTF9W4laMnV0lw73DuAepv0e1Z18zWI5AlF6sh7C8rwcqpQzvp1cimaV2in+YUgi
 OE4BwyWmDWxhcTmmdjqIRpFm9oVrWPKzXOPW22NTkxkdTVTWD9EOmYqsfX8zmiSFqR
 Z0nWrODWYXeXSYKufMtwTaK1WxYbFWleRdtaUyw1XtWk0UguQM98XV3sxBpbdWcKqK
 7ltRkG3vLauMQ==
From: Kees Cook <kees@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Date: Thu, 21 May 2026 06:33:24 -0700
Message-Id: <20260521133326.2465264-11-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521133315.work.845-kees@kernel.org>
References: <20260521133315.work.845-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6078; i=kees@kernel.org;
 h=from:subject; bh=cZc+JELjQTK8ycLqZtLTkP9aHNuVqrWgrD/YlzSeCsM=;
 b=owGbwMvMwCVmps19z/KJym7G02pJDFn8nEvufDYVreO77zyVZ9nKv/dmtn67mvlTQuv4kafPq
 puKFFykO0pZGMS4GGTFFFmC7NzjXDzetoe7z1WEmcPKBDKEgYtTACZyUpThn+GuD2261nV35Y9v
 WCSkdjztcECEh/yOmilbnsu+Me2RqGb4X3Y7PuFYwqXlesy7khtcFv4xWB144Q33rOMlXKUF6Yq
 CDAA=
X-Developer-Key: i=kees@kernel.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.234.252.31; envelope-from=kees@kernel.org;
 helo=sea.source.kernel.org
X-Mailman-Approved-At: Sun, 24 May 2026 15:03:45 +0000
Subject: [apparmor] [PATCH 11/11] moduleparam: Drop legacy kernel_param_ops
	.get_str field and dispatch logic
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
	NEURAL_HAM(-0.00)[-0.491];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo]
X-Rspamd-Queue-Id: B91EE5C2E27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

All struct kernel_param_ops .get callbacks have been migrated to using
struct seq_buf. Drop the migration scaffolding.

Signed-off-by: Kees Cook <kees@kernel.org>
---
 include/linux/moduleparam.h | 37 ++--------------------
 kernel/params.c             | 62 ++++++++++---------------------------
 2 files changed, 20 insertions(+), 79 deletions(-)

diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index 38acb5aef56b..e6af6f051c93 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -66,15 +66,8 @@ struct kernel_param_ops {
 	/*
 	 * Format the parameter's value into @s.  Return 0 on success
 	 * (length derived from seq_buf_used()) or -errno on error.
-	 * Exactly one of .get and .get_str should be set; the dispatcher
-	 * WARNs and prefers .get if both are.
 	 */
 	int (*get)(struct seq_buf *s, const struct kernel_param *kp);
-	/*
-	 * Returns length written or -errno.  Buffer is 4k (ie. be short!).
-	 * Deprecated: callbacks should implement .get instead.
-	 */
-	int (*get_str)(char *buffer, const struct kernel_param *kp);
 	/* Optional function to free kp->arg when module unloaded. */
 	void (*free)(void *arg);
 };
@@ -84,33 +77,11 @@ struct kernel_param_ops {
  * any required visibility qualifiers (typically "static"):
  *
  *   static DEFINE_KERNEL_PARAM_OPS(my_ops, my_set, my_get);
- *
- * @_get may be either of:
- *   int (*)(struct seq_buf *, const struct kernel_param *) (seq_buf)
- *   int (*)(char *, const struct kernel_param *)           (legacy)
- *
- * The macro uses _Generic to route the function pointer to the
- * matching field (.get or .get_str) at compile time, leaving the
- * other field NULL. Each helper matches the wrong prototype signature
- * and returns NULL, falling through to the default branch otherwise;
- * if @_get has neither expected signature the assignment to the
- * fields gets a normal compile-time type-mismatch error.
  */
-#define _KERNEL_PARAM_OPS_GET(_get)					\
-	_Generic((_get),						\
-	    int (*)(char *, const struct kernel_param *): NULL,		\
-	    default: (_get))
-
-#define _KERNEL_PARAM_OPS_GET_STR(_get)					\
-	_Generic((_get),						\
-	    int (*)(struct seq_buf *, const struct kernel_param *): NULL, \
-	    default: (_get))
-
 #define DEFINE_KERNEL_PARAM_OPS(_name, _set, _get)			\
 	const struct kernel_param_ops _name = {				\
 		.set = (_set),						\
-		.get = _KERNEL_PARAM_OPS_GET(_get),			\
-		.get_str = _KERNEL_PARAM_OPS_GET_STR(_get),		\
+		.get = (_get),						\
 	}
 
 /* As DEFINE_KERNEL_PARAM_OPS, with KERNEL_PARAM_OPS_FL_NOARG set. */
@@ -118,16 +89,14 @@ struct kernel_param_ops {
 	const struct kernel_param_ops _name = {				\
 		.flags = KERNEL_PARAM_OPS_FL_NOARG,			\
 		.set = (_set),						\
-		.get = _KERNEL_PARAM_OPS_GET(_get),			\
-		.get_str = _KERNEL_PARAM_OPS_GET_STR(_get),		\
+		.get = (_get),						\
 	}
 
 /* As DEFINE_KERNEL_PARAM_OPS, with an additional .free callback. */
 #define DEFINE_KERNEL_PARAM_OPS_FREE(_name, _set, _get, _free)		\
 	const struct kernel_param_ops _name = {				\
 		.set = (_set),						\
-		.get = _KERNEL_PARAM_OPS_GET(_get),			\
-		.get_str = _KERNEL_PARAM_OPS_GET_STR(_get),		\
+		.get = (_get),						\
 		.free = (_free),					\
 	}
 
diff --git a/kernel/params.c b/kernel/params.c
index 25f0c8d5d19f..6b410189297b 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -461,8 +461,7 @@ static int param_array_get(struct seq_buf *s, const struct kernel_param *kp)
 {
 	const struct kparam_array *arr = kp->arr;
 	struct kernel_param p = *kp;
-	char *elem_buf = NULL;
-	int i, ret = 0;
+	int i, ret;
 
 	for (i = 0; i < (arr->num ? *arr->num : arr->max); i++) {
 		size_t before = s->len;
@@ -470,23 +469,9 @@ static int param_array_get(struct seq_buf *s, const struct kernel_param *kp)
 		p.arg = arr->elem + arr->elemsize * i;
 		check_kparam_locked(p.mod);
 
-		if (arr->ops->get) {
-			ret = arr->ops->get(s, &p);
-			if (ret < 0)
-				goto out;
-		} else {
-			if (!elem_buf) {
-				elem_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
-				if (!elem_buf) {
-					ret = -ENOMEM;
-					goto out;
-				}
-			}
-			ret = arr->ops->get_str(elem_buf, &p);
-			if (ret < 0)
-				goto out;
-			seq_buf_putmem(s, elem_buf, ret);
-		}
+		ret = arr->ops->get(s, &p);
+		if (ret < 0)
+			return ret;
 
 		/* Nothing got written (e.g. overflow) — stop. */
 		if (s->len == before)
@@ -496,10 +481,7 @@ static int param_array_get(struct seq_buf *s, const struct kernel_param *kp)
 		if (i && s->buffer[before - 1] == '\n')
 			s->buffer[before - 1] = ',';
 	}
-	ret = 0;
-out:
-	kfree(elem_buf);
-	return ret;
+	return 0;
 }
 
 static void param_array_free(void *arg)
@@ -570,32 +552,22 @@ static ssize_t param_attr_show(const struct module_attribute *mattr,
 	int count;
 	const struct param_attribute *attribute = to_param_attr(mattr);
 	const struct kernel_param_ops *ops = attribute->param->ops;
+	struct seq_buf s;
 
-	if (!ops->get && !ops->get_str)
+	if (!ops->get)
 		return -EPERM;
 
-	WARN_ON_ONCE(ops->get && ops->get_str);
-
 	kernel_param_lock(mk->mod);
-	if (ops->get) {
-		struct seq_buf s;
-
-		seq_buf_init(&s, buf, PAGE_SIZE);
-		count = ops->get(&s, attribute->param);
-		if (count >= 0) {
-			WARN_ON_ONCE(count > 0);
-			count = seq_buf_used(&s);
-			/* Make sure string is terminated. */
-			seq_buf_str(&s);
-			/*
-			 * If overflowed, reduce count by 1 for trailing
-			 * NUL byte.
-			 */
-			if (seq_buf_has_overflowed(&s))
-				count--;
-		}
-	} else {
-		count = ops->get_str(buf, attribute->param);
+	seq_buf_init(&s, buf, PAGE_SIZE);
+	count = ops->get(&s, attribute->param);
+	if (count >= 0) {
+		WARN_ON_ONCE(count > 0);
+		count = seq_buf_used(&s);
+		/* Make sure string is terminated. */
+		seq_buf_str(&s);
+		/* If overflowed, reduce count by 1 for trailing NUL byte. */
+		if (seq_buf_has_overflowed(&s))
+			count--;
 	}
 	kernel_param_unlock(mk->mod);
 	return count;
-- 
2.34.1



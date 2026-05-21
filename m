Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IcQKMsZE2oi7gYAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 24 May 2026 17:31:23 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B185C2E43
	for <lists+apparmor@lfdr.de>; Sun, 24 May 2026 17:31:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wRAMk-0007be-KD; Sun, 24 May 2026 15:03:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <kees@kernel.org>) id 1wQ3f2-00061b-VU
 for apparmor@lists.ubuntu.com; Thu, 21 May 2026 13:42:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9E93660210;
 Thu, 21 May 2026 13:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B451F000E9;
 Thu, 21 May 2026 13:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779370406;
 bh=JMvTXrLi2fecyuCzobJPBmjEJITlU0vYIW862WydbuI=;
 h=From:To:Cc:Subject:Date;
 b=ENRvP//NxlPse9MxCJOFh1AogZslAel87SB2mSCIhsf3jItcOS+woGIBwiFJXxxJO
 /vrcLfGb5f9Zgybo+8/jwPpcfxzDdtk9qobrtYv1Jx7qF2CaHOv9To+pMFVf+CxBaj
 Txk/IJPdMMNkgGbRiVQjeh8OyeTtBQ2jV3/sTZSlJcvRZB5VWyLoc9rDPU3aPLI4HL
 h0jOm1f2w6p8YOUlM5pSaTCh9uIPDhngu0K2kHqivFsRg/751UQV/kKlDAKhtjc0hL
 ruCH8xG0ElU6V7TuBi+cEWySHRlk4t3CmGbCJy8V2gQGUgE/wtg5mB81jG8Jj8LiQq
 dMkB09LzsXQtw==
From: Kees Cook <kees@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Date: Thu, 21 May 2026 06:33:13 -0700
Message-Id: <20260521133315.work.845-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8383; i=kees@kernel.org;
 h=from:subject:message-id; bh=iRiRSOifqAhDEW+rM5ucutf2vqbqOCl0n39wA2pC2nE=;
 b=owGbwMvMwCVmps19z/KJym7G02pJDFn8nPP5NjJqfrXdrfdzgRzzhL0cEUvVFLTFyz0Emuo2S
 cuk+1zsKGVhEONikBVTZAmyc49z8XjbHu4+VxFmDisTyBAGLk4BmMjpjYwMW1sezs9aJ6S4pvfM
 9cD7+tJ32F5enlDXEpZXkNZ/g4mVnZFh3zrv5UmSl4OP8839kFvnc/3g3qNPdE9ob/yzv04h4/U
 XTgA=
X-Developer-Key: i=kees@kernel.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.105.4.254; envelope-from=kees@kernel.org;
 helo=tor.source.kernel.org
X-Mailman-Approved-At: Sun, 24 May 2026 15:03:45 +0000
Subject: [apparmor] [PATCH 00/11] Convert moduleparams to seq_buf
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
X-Spamd-Result: default: False [5.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	DATE_IN_PAST(1.00)[73];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.freedesktop.org,iscas.ac.cn,linux.intel.com,lists.one-eyed-alien.net,vger.kernel.org,acm.org,ziepe.ca,namei.org,googlegroups.com,ursulin.net,rowland.harvard.edu,lists.infradead.org,linuxfoundation.org,linux-foundation.org,arm.com,orcam.me.uk,HansenPartnership.com,ffwll.ch,linux.alibaba.com,paul-moore.com,cmu.edu,linux.ibm.com,akamai.com,google.com,gmail.com,redhat.com,ideasonboard.com,hallyn.com,suse.com,minyard.net,alien8.de,intel.com,lists.sourceforge.net,oracle.com,atomlin.com,infradead.org,zytor.com,nongnu.org,kvack.org,cambridgegreys.com,nod.at,lists.ubuntu.com,lists.linux.dev,suse.de,antgroup.com,sipsolutions.net,lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mcgrof@kernel.org,m:rafael@kernel.org,m:dri-devel@lists.freedesktop.org,m:pengpeng@iscas.ac.cn,m:srinivas.pandruvada@linux.intel.com,m:usb-storage@lists.one-eyed-alien.net,m:linux-arch@vger.kernel.org,m:bvanassche@acm.org,m:jgg@ziepe.ca,m:jmorris@namei.org,m:kasan-dev@googlegroups.com,m:tursulin@ursulin.net,m:linux-acpi@vger.kernel.org,m:stern@rowland.harvard.edu,m:linux-pm@vger.kernel.org,m:linux-um@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:linux-media@vger.kernel.org,m:lukasz.luba@arm.com,m:macro@orcam.me.uk,m:dave.hansen@linux.intel.com,m:James.Bottomley@HansenPartnership.com,m:simona@ffwll.ch,m:xuanzhuo@linux.alibaba.com,m:paul@paul-moore.com,m:leon@kernel.org,m:Frank.Li@kernel.org,m:somlo@cmu.edu,m:lenb@kernel.org,m:gor@linux.ibm.com,m:jani.nikula@linux.intel.com,m:jbaron@akamai.com,m:bhelgaas@google.com,m:jim.cromie@gmail.com
 ,m:seanjc@google.com,m:tglx@kernel.org,m:kees@kernel.org,m:linux-pci@vger.kernel.org,m:jasowang@redhat.com,m:joonas.lahtinen@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:david.e.box@linux.intel.com,m:jirislaby@kernel.org,m:linux-rdma@vger.kernel.org,m:samitolvanen@google.com,m:ilpo.jarvinen@linux.intel.com,m:serge@hallyn.com,m:elver@google.com,m:petr.pavlu@suse.com,m:intel-gfx@lists.freedesktop.org,m:corey@minyard.net,m:bp@alien8.de,m:rodrigo.vivi@intel.com,m:openipmi-developer@lists.sourceforge.net,m:mchehab@kernel.org,m:martin.petersen@oracle.com,m:atomlin@atomlin.com,m:hansg@kernel.org,m:kvm@vger.kernel.org,m:mst@redhat.com,m:peterz@infradead.org,m:hpa@zytor.com,m:qemu-devel@nongnu.org,m:linux-mm@kvack.org,m:glider@google.com,m:da.gomez@kernel.org,m:airlied@gmail.com,m:anton.ivanov@cambridgegreys.com,m:linux-scsi@vger.kernel.org,m:richard@nod.at,m:x86@kernel.org,m:linux-security-module@vger.kernel.org,m:eperezma@redhat.com,m:mingo@redhat.com,m:linux-serial@vger.kernel.or
 g,m:rui.zhang@intel.com,m:hca@linux.ibm.com,m:apparmor@lists.ubuntu.com,m:virtualization@lists.linux.dev,m:linux-hardening@vger.kernel.org,m:hare@suse.de,m:benjamin.berg@intel.com,m:daniel.lezcano@kernel.org,m:andriy.shevchenko@linux.intel.com,m:tiwei.btw@antgroup.com,m:dvyukov@google.com,m:netdev@vger.kernel.org,m:vkoul@kernel.org,m:dmaengine@vger.kernel.org,m:pbonzini@redhat.com,m:johannes@sipsolutions.net,m:linuxppc-dev@lists.ozlabs.org,m:linux-modules@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,body];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER(0.00)[kees@kernel.org,apparmor-bounces@lists.ubuntu.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,apparmor-bounces@lists.ubuntu.com];
	RCPT_COUNT_GT_50(0.00)[97];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.080];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo];
	DKIM_TRACE(0.00)[kernel.org:-]
X-Rspamd-Queue-Id: 57B185C2E43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

I tried to trim the CC list here, but it's still pretty huge...

We've had a long-standing issue with "write to a string pointer" callbacks
that don't bounds check the destination (and for which the bounds is
also not part of the callback prototype, even if it is "known" to be
PAGE_SIZE, which sysfs_emit() depends on). Both moduleparams and sysfs
use this pattern. As a first step, and to test the migration method,
migrate moduleparams first.

There are 2 "mechanical" treewide patches that are handled by Coccinelle:
- treewide: Convert struct kernel_param_ops initializers to DEFINE_KERNEL_PARAM_OPS
- treewide: Convert custom kernel_param_ops .get callbacks to seq_buf via cocci

The last treewide patch is manual, and may need to be broken up into
per-subsystem patches, though I'd prefer to avoid this, as it would
extend the migration from 1 relase to at least 2 releases. (1 to
release the migration infrastructure, then 1 release to collect all the
subsystem changes, and possibly 1 more release to remove the migration
infrastructure.)

Thoughts, questions?

-Kees

Kees Cook (10):
  panic: Replace panic_print_get() with generic helper
  moduleparam: Add DEFINE_KERNEL_PARAM_OPS macro family
  treewide: Convert struct kernel_param_ops initializers to
    DEFINE_KERNEL_PARAM_OPS
  moduleparam: Rename .get field to .get_str
  moduleparam: Add seq_buf-based .get callback alongside .get_str
  moduleparam: Route DEFINE_KERNEL_PARAM_OPS get pointer via _Generic
  params: Convert generic kernel_param_ops .get helpers to seq_buf
  treewide: Convert custom kernel_param_ops .get callbacks to seq_buf
    via cocci
  treewide: Manually convert custom kernel_param_ops .get callbacks
  moduleparam: Drop legacy kernel_param_ops .get_str field and dispatch
    logic

Pengpeng Hou (1):
  params: bound array element output to the caller's page buffer

 include/linux/dynamic_debug.h                 |   8 +-
 include/linux/moduleparam.h                   |  65 +++++++---
 security/apparmor/include/lib.h               |   3 +-
 mm/kfence/core.c                              |  15 ++-
 arch/powerpc/kvm/book3s_hv.c                  |   5 +-
 arch/s390/kernel/perf_cpum_sf.c               |  12 +-
 arch/um/drivers/vfio_kern.c                   |   9 +-
 arch/um/drivers/virtio_uml.c                  |  18 +--
 arch/x86/kernel/msr.c                         |  11 +-
 arch/x86/kvm/mmu/mmu.c                        |  28 ++--
 arch/x86/kvm/svm/avic.c                       |  14 +-
 arch/x86/kvm/vmx/vmx.c                        |  24 ++--
 arch/x86/platform/uv/uv_nmi.c                 |  24 ++--
 block/disk-events.c                           |   6 +-
 drivers/acpi/button.c                         |  19 ++-
 drivers/acpi/ec.c                             |  14 +-
 drivers/acpi/sysfs.c                          | 114 ++++++++--------
 drivers/block/loop.c                          |  12 +-
 drivers/block/null_blk/main.c                 |  12 +-
 drivers/block/rnbd/rnbd-srv.c                 |   6 +-
 drivers/block/ublk_drv.c                      |  12 +-
 drivers/char/ipmi/ipmi_msghandler.c           |  12 +-
 drivers/char/ipmi/ipmi_watchdog.c             |  50 +++----
 drivers/crypto/hisilicon/hpre/hpre_main.c     |  16 +--
 drivers/crypto/hisilicon/sec2/sec_main.c      |  23 +---
 drivers/crypto/hisilicon/zip/zip_crypto.c     |   5 +-
 drivers/crypto/hisilicon/zip/zip_main.c       |  21 +--
 drivers/dma/dmatest.c                         |  34 ++---
 drivers/edac/i10nm_base.c                     |   6 +-
 drivers/firmware/efi/efi-pstore.c             |   6 +-
 drivers/firmware/qcom/qcom_scm.c              |  18 +--
 drivers/firmware/qemu_fw_cfg.c                |  40 +++---
 drivers/gpu/drm/drm_panic.c                   |  13 +-
 drivers/gpu/drm/i915/i915_mitigations.c       |  31 ++---
 drivers/gpu/drm/imagination/pvr_fw_trace.c    |   6 +-
 drivers/hid/hid-cougar.c                      |   6 +-
 drivers/hid/hid-steam.c                       |   6 +-
 drivers/infiniband/hw/hfi1/driver.c           |  12 +-
 drivers/infiniband/ulp/iser/iscsi_iser.c      |   6 +-
 drivers/infiniband/ulp/isert/ib_isert.c       |   6 +-
 drivers/infiniband/ulp/srp/ib_srp.c           |  12 +-
 drivers/infiniband/ulp/srpt/ib_srpt.c         |   5 +-
 drivers/input/misc/ati_remote2.c              |  23 ++--
 drivers/input/mouse/psmouse-base.c            |  15 ++-
 drivers/md/md.c                               |   5 +-
 drivers/media/pci/tw686x/tw686x-core.c        |   6 +-
 drivers/media/usb/uvc/uvc_driver.c            |  14 +-
 drivers/misc/lis3lv02d/lis3lv02d.c            |   5 +-
 drivers/net/wireless/ath/wil6210/main.c       |  10 +-
 drivers/nvme/host/multipath.c                 |  17 +--
 drivers/nvme/host/pci.c                       |  18 +--
 drivers/nvme/target/rdma.c                    |   5 +-
 drivers/nvme/target/tcp.c                     |   5 +-
 drivers/pci/pcie/aspm.c                       |  17 ++-
 drivers/platform/x86/acerhdf.c                |   5 +-
 drivers/power/supply/bq27xxx_battery.c        |   6 +-
 drivers/power/supply/test_power.c             | 122 +++++++++---------
 drivers/scsi/fcoe/fcoe_transport.c            |  22 ++--
 drivers/scsi/sg.c                             |   6 +-
 drivers/target/target_core_user.c             |  25 ++--
 .../processor_thermal_soc_slider.c            |  24 ++--
 drivers/thermal/intel/intel_powerclamp.c      |  34 ++---
 drivers/tty/hvc/hvc_iucv.c                    |  24 ++--
 drivers/tty/sysrq.c                           |   6 +-
 drivers/ufs/core/ufs-fault-injection.c        |  12 +-
 drivers/ufs/core/ufs-mcq.c                    |  18 +--
 drivers/ufs/core/ufs-txeq.c                   |   5 +-
 drivers/ufs/core/ufshcd.c                     |  12 +-
 drivers/usb/core/quirks.c                     |   6 +-
 drivers/usb/gadget/legacy/serial.c            |   5 +-
 drivers/usb/storage/usb.c                     |  25 ++--
 drivers/vhost/scsi.c                          |  12 +-
 drivers/virt/nitro_enclaves/ne_misc_dev.c     |   6 +-
 drivers/virtio/virtio_mmio.c                  |  27 ++--
 fs/ceph/super.c                               |  10 +-
 fs/fuse/dir.c                                 |   5 +-
 fs/nfs/namespace.c                            |  12 +-
 fs/nfs/super.c                                |   6 +-
 fs/ocfs2/dlmfs/dlmfs.c                        |   5 +-
 fs/overlayfs/copy_up.c                        |   5 +-
 fs/ubifs/super.c                              |   6 +-
 kernel/locking/locktorture.c                  |  12 +-
 kernel/panic.c                                |  11 +-
 kernel/params.c                               | 122 +++++++++---------
 kernel/power/hibernate.c                      |   6 +-
 kernel/rcu/tree.c                             |  24 ++--
 kernel/sched/ext.c                            |  11 +-
 kernel/workqueue.c                            |  18 ++-
 lib/dynamic_debug.c                           |  16 ++-
 lib/test_dynamic_debug.c                      |  12 +-
 mm/damon/lru_sort.c                           |  33 +++--
 mm/damon/reclaim.c                            |  33 +++--
 mm/damon/stat.c                               |  16 +--
 mm/memory_hotplug.c                           |  30 +++--
 mm/page_reporting.c                           |  11 +-
 mm/shuffle.c                                  |   6 +-
 mm/zswap.c                                    |  14 +-
 net/batman-adv/bat_algo.c                     |   6 +-
 net/ceph/ceph_common.c                        |  10 +-
 net/ipv4/tcp_dctcp.c                          |   6 +-
 net/sunrpc/auth.c                             |  12 +-
 net/sunrpc/svc.c                              |   5 +-
 net/sunrpc/xprtsock.c                         |  18 +--
 samples/damon/mtier.c                         |   6 +-
 samples/damon/prcl.c                          |   6 +-
 samples/damon/wsse.c                          |   6 +-
 security/apparmor/lib.c                       |  27 ++--
 security/apparmor/lsm.c                       |  75 +++++------
 sound/hda/controllers/intel.c                 |   5 +-
 sound/usb/card.c                              |   7 +-
 110 files changed, 854 insertions(+), 1066 deletions(-)

-- 
2.34.1



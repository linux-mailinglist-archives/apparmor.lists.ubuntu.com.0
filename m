Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B77945842
	for <lists+apparmor@lfdr.de>; Fri,  2 Aug 2024 08:53:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sZmAQ-00032n-Np; Fri, 02 Aug 2024 06:53:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <sashal@kernel.org>) id 1sZJAy-0005KI-98
 for apparmor@lists.ubuntu.com; Wed, 31 Jul 2024 23:56:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 208D062608;
 Wed, 31 Jul 2024 23:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894F0C116B1;
 Wed, 31 Jul 2024 23:56:09 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 31 Jul 2024 19:56:06 -0400
Message-ID: <20240731235608.3929537-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.102
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=sashal@kernel.org;
 helo=dfw.source.kernel.org
X-Mailman-Approved-At: Fri, 02 Aug 2024 06:53:32 +0000
Subject: [apparmor] [PATCH AUTOSEL 6.1 1/2] apparmor: fix possible NULL
	pointer dereference
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
Cc: Sasha Levin <sashal@kernel.org>, paul@paul-moore.com,
 apparmor@lists.ubuntu.com, Leesoo Ahn <lsahn@ooseel.net>, jmorris@namei.org,
 linux-security-module@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: Leesoo Ahn <lsahn@ooseel.net>

[ Upstream commit 3dd384108d53834002be5630132ad5c3f32166ad ]

profile->parent->dents[AAFS_PROF_DIR] could be NULL only if its parent is made
from __create_missing_ancestors(..) and 'ent->old' is NULL in
aa_replace_profiles(..).
In that case, it must return an error code and the code, -ENOENT represents
its state that the path of its parent is not existed yet.

BUG: kernel NULL pointer dereference, address: 0000000000000030
PGD 0 P4D 0
PREEMPT SMP PTI
CPU: 4 PID: 3362 Comm: apparmor_parser Not tainted 6.8.0-24-generic #24
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1 04/01/2014
RIP: 0010:aafs_create.constprop.0+0x7f/0x130
Code: 4c 63 e0 48 83 c4 18 4c 89 e0 5b 41 5c 41 5d 41 5e 41 5f 5d 31 d2 31 c9 31 f6 31 ff 45 31 c0 45 31 c9 45 31 d2 c3 cc cc cc cc <4d> 8b 55 30 4d 8d ba a0 00 00 00 4c 89 55 c0 4c 89 ff e8 7a 6a ae
RSP: 0018:ffffc9000b2c7c98 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 00000000000041ed RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc9000b2c7cd8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff82baac10
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  00007be9f22cf740(0000) GS:ffff88817bc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000030 CR3: 0000000134b08000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 ? show_regs+0x6d/0x80
 ? __die+0x24/0x80
 ? page_fault_oops+0x99/0x1b0
 ? kernelmode_fixup_or_oops+0xb2/0x140
 ? __bad_area_nosemaphore+0x1a5/0x2c0
 ? find_vma+0x34/0x60
 ? bad_area_nosemaphore+0x16/0x30
 ? do_user_addr_fault+0x2a2/0x6b0
 ? exc_page_fault+0x83/0x1b0
 ? asm_exc_page_fault+0x27/0x30
 ? aafs_create.constprop.0+0x7f/0x130
 ? aafs_create.constprop.0+0x51/0x130
 __aafs_profile_mkdir+0x3d6/0x480
 aa_replace_profiles+0x83f/0x1270
 policy_update+0xe3/0x180
 profile_load+0xbc/0x150
 ? rw_verify_area+0x47/0x140
 vfs_write+0x100/0x480
 ? __x64_sys_openat+0x55/0xa0
 ? syscall_exit_to_user_mode+0x86/0x260
 ksys_write+0x73/0x100
 __x64_sys_write+0x19/0x30
 x64_sys_call+0x7e/0x25c0
 do_syscall_64+0x7f/0x180
 entry_SYSCALL_64_after_hwframe+0x78/0x80
RIP: 0033:0x7be9f211c574
Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d d5 ea 0e 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
RSP: 002b:00007ffd26f2b8c8 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00005d504415e200 RCX: 00007be9f211c574
RDX: 0000000000001fc1 RSI: 00005d504418bc80 RDI: 0000000000000004
RBP: 0000000000001fc1 R08: 0000000000001fc1 R09: 0000000080000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00005d504418bc80
R13: 0000000000000004 R14: 00007ffd26f2b9b0 R15: 00007ffd26f2ba30
 </TASK>
Modules linked in: snd_seq_dummy snd_hrtimer qrtr snd_hda_codec_generic snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq snd_seq_device i2c_i801 snd_timer i2c_smbus qxl snd soundcore drm_ttm_helper lpc_ich ttm joydev input_leds serio_raw mac_hid binfmt_misc msr parport_pc ppdev lp parport efi_pstore nfnetlink dmi_sysfs qemu_fw_cfg ip_tables x_tables autofs4 hid_generic usbhid hid ahci libahci psmouse virtio_rng xhci_pci xhci_pci_renesas
CR2: 0000000000000030
---[ end trace 0000000000000000 ]---
RIP: 0010:aafs_create.constprop.0+0x7f/0x130
Code: 4c 63 e0 48 83 c4 18 4c 89 e0 5b 41 5c 41 5d 41 5e 41 5f 5d 31 d2 31 c9 31 f6 31 ff 45 31 c0 45 31 c9 45 31 d2 c3 cc cc cc cc <4d> 8b 55 30 4d 8d ba a0 00 00 00 4c 89 55 c0 4c 89 ff e8 7a 6a ae
RSP: 0018:ffffc9000b2c7c98 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 00000000000041ed RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc9000b2c7cd8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff82baac10
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  00007be9f22cf740(0000) GS:ffff88817bc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000030 CR3: 0000000134b08000 CR4: 00000000000006f0

Signed-off-by: Leesoo Ahn <lsahn@ooseel.net>
Signed-off-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 security/apparmor/apparmorfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 7160e7aa58b94..ce7b2f43c3193 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -1687,6 +1687,10 @@ int __aafs_profile_mkdir(struct aa_profile *profile, struct dentry *parent)
 		struct aa_profile *p;
 		p = aa_deref_parent(profile);
 		dent = prof_dir(p);
+		if (!dent) {
+			error = -ENOENT;
+			goto fail2;
+		}
 		/* adding to parent that previously didn't have children */
 		dent = aafs_create_dir("profiles", dent);
 		if (IS_ERR(dent))
-- 
2.43.0



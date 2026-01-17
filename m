Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 234F8D3BC0E
	for <lists+apparmor@lfdr.de>; Tue, 20 Jan 2026 00:52:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vhz2D-0000a5-K5; Mon, 19 Jan 2026 23:51:49 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <simon@sesa.me.uk>) id 1vh7Bg-0008I4-Fh
 for apparmor@lists.ubuntu.com; Sat, 17 Jan 2026 14:22:00 +0000
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-56367b39e3eso2799799e0c.1
 for <apparmor@lists.ubuntu.com>; Sat, 17 Jan 2026 06:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=burble.com; s=google; t=1768659719; x=1769264519; darn=lists.ubuntu.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vruqv54PA0xqcT1aOuEiuM+335OLIynSmJSGMPjisSY=;
 b=cu3FRVYJ9b3eBRuzyS/1tFt/lk/NMQvdWWrn5N8zrVwJzK5/cEJEuki4V0MCJqVuo8
 1vzeTFGUev2gGzPshnOdAXiFulYWWcLWCNs8HuHpq6jeXLmpNqMzv71je1svrPxho4Ys
 n7oQRHownaQHadSO2omkFvp45bawDfs2DbUGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768659719; x=1769264519;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vruqv54PA0xqcT1aOuEiuM+335OLIynSmJSGMPjisSY=;
 b=e6/m9OCxv+sGeVOpBDcc2hVXyB8SkvNN/ADeeRnFga8PJKDPidn6/YFQryDf1hy4Da
 HOGCJlDYEshSWFrKRIf5LzQ/GIv9zUWbkJSquFVh6ZQC0qcw8s0n+/LbwJbu4nYGHxF6
 XesGsOih9qIHLwNtkp9wmBUIOMXL4kfE+0yhyIsQ85xERuSoPw4c04CwvkQbGQ6ZmndH
 AvLgqUbE0AD4td8g6QYWquvpEsu4L6yTXOoHXZs3D5n5EKvdy0eML0Kr6lMVDoCIs6ES
 t7klzHNM4mUhC/yy92jcMom00Q81Hq9LnbRQ5nEiOycRSc+oBaPMLbUrHi58dOwm17c+
 S12Q==
X-Gm-Message-State: AOJu0YzYt4Xpb4pN7Pn/zo9FxdCsvgN/SDUoXQj/iZiQ3OliDztGu/AD
 XFHaOgjrh/AvALFOotUUb6IWANBPoqqJvzMY6NtxFv1Bz1xm0MUGEW2yeEVOB6cBn4zW0tnNrET
 8OLqwhkFjLlHJZK/1ng2YQZWvExdP4bgFvwMtf1q4ZIxtBCfi8/cWT7fq5w==
X-Gm-Gg: AY/fxX6qP6dhzlY0wAQ6uhQfiKR8IwlzvCZHyKwDYFkscLMwpZxAcL4SuhN5ec+CCVk
 6IyENG5YxYURdI5GybOrNhTlufVhOxdahlRcIra4KQlTB3BKcTfbRfSSNDGaz4/A4ljMzyepwYw
 HNw5jfXKq+b7NjS/7rbdXSoZ99D+zXF506z88AunmDF28GJMnzOE88/o/ocFqUf4f9OojkyUirs
 /yzf9sYbUK3YjrSiRGoK0eelVtPICggGQfmLj8++3qp4sawFTfKa8sgXgEG2k1BC7qUQGaksnwc
 jrZ/56mFuDeXQx4YfQWLdNzxjkmdJ69uUAOznOMTJvIbT/DtEXkgy5yImsreepqq7B5UxOqV/Q2
 8IlFYs4vK5FDBp9pQC1YnQGLbyHILl7nuF+O02jXtyUFVDA==
X-Received: by 2002:a05:6102:54a8:b0:5ea:666f:2bc4 with SMTP id
 ada2fe7eead31-5f1a4da9dd2mr2415832137.4.1768659718509; Sat, 17 Jan 2026
 06:21:58 -0800 (PST)
MIME-Version: 1.0
From: Simon Marsh <simon@burble.com>
Date: Sat, 17 Jan 2026 14:21:47 +0000
X-Gm-Features: AZwV_QjxmKzXCTBY-I8ETQRvBJIZ0qX_FcRc4Jd_L1KClQPgSzo6um3Fpz8xW64
Message-ID: <CAOaYp=V1jBqFNRFms572VjA0y2GfirODH6fLmz1x4E1O+3cdHg@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.221.172; envelope-from=simon@sesa.me.uk;
 helo=mail-vk1-f172.google.com
X-Mailman-Approved-At: Mon, 19 Jan 2026 23:51:48 +0000
Subject: [apparmor] Kernel oops / NULL pointer dereference in aa_file_perm()
	with nested containers
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

Hi,

I believe there is an apparmor related regression in kernels >= 6.17
which causes a NULL pointer dereference and kernel oops.
The oops is triggered when mounting the podman api socket mounted into
a podman container, when podman is itself nested within another
container.
More specifically, the issue appears to be related to crun's use of
SCM_RIGHTS fd passing within the nested container.

A full trace and steps to reproduce are below.

The specific commit which introduced the issue is:

commit 8b45c6c90af6702b2ad716e148b8bcd5231a8070
Merge: d2eedaa3909b 5f49c2d1f422
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Aug 4 08:17:28 2025 -0700

    Merge tag 'apparmor-pr-2025-08-04' of
git://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor

Thanks


Simon

-------

Steps used to reproduce:

- Starting with a clean Debian 13/Trixie install and installed kernel >= 6.17
- Install Incus (latest 6.20 for reference)
- Create a non-privileged debian 13 container under incus with
'security.nesting=true' enabled
- Install podman in to the incus container (from debian distribution
v5.4.2 / apt get podman)
- Attempt to run a rootful woodpecker-ci pod:

# podman run --rm -v /run/podman/podman.sock:/var/run/docker.sock -e
'WOODPECKER_SERVER=xxxxx' -e 'WOODPECKER_AGENT_SECRET=xxxx'-p
3000:3000 docker.io/woodpeckerci/woodpecker-agent:v3

Key points that trigger the issue:
 - Kernel build from 8b45c6c90af67 or later
 - Podman is using the default crun and is running nested inside a
non-privileged container
 - The podman container bind mounts the /run/podman/podman.sock UNIX socket
 - Accessing the podman UNIX socket from within the nested podman
container triggers the oops

What does work:
 - Podman on its own without nesting under incus works fine
 - All other containers that don't bind mount the podman api sock are fine
 - Using runc instead of crun (I understand runc makes less use of fd passing)
 - Kernels built against ba180a362128 or earlier (this is the commit
prior to 8b45c6c90af67)

--------

[   23.410730] BUG: kernel NULL pointer dereference, address: 0000000000000018
[   23.415415] #PF: supervisor read access in kernel mode
[   23.418171] #PF: error_code(0x0000) - not-present page
[   23.420326] PGD 0 P4D 0
[   23.421475] Oops: Oops: 0000 [#1] SMP PTI
[   23.423537] CPU: 0 UID: 1000000 PID: 1041 Comm: crun Tainted: G
   W           6.16.0+ #2 PREEMPT(lazy)
[   23.427763] Tainted: [W]=WARN
[   23.428880] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009)/Incus, BIOS unknown 02/02/2022
[   23.431757] RIP: 0010:aa_file_perm+0xad/0x530
[   23.433298] Code: 41 5e 41 5f c3 cc cc cc cc 49 8b 45 20 45 8b 7f
10 0f b7 00 66 25 00 f0 66 3d 00 c0 75 1b f7 c5 46 00 10 00 75 13 49
8b 45 18 <48> 8b 40 18 66 83 78 10 01 0f 84 93 02 00 00 41 f7 d7 41 21
ef 44
[   23.438781] RSP: 0018:ffffd17e824a7830 EFLAGS: 00010246
[   23.441003] RAX: 0000000000000000 RBX: ffff8a4e4647a600 RCX: ffff8a4e50fc0540
[   23.443693] RDX: ffff8a4e434b3580 RSI: ffff8a4e433e8840 RDI: ffffffffa0fe149d
[   23.446183] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[   23.448042] R10: 0000000000000000 R11: ffff8a4e4441a400 R12: ffff8a4e4647a600
[   23.449898] R13: ffff8a4e50fc0540 R14: 0000000000000000 R15: 0000000000000000
[   23.451936] FS:  00007f92f1750840(0000) GS:ffff8a4f083bb000(0000)
knlGS:0000000000000000
[   23.453895] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   23.455884] CR2: 0000000000000018 CR3: 0000000124ae6006 CR4: 0000000000172ef0
[   23.458558] Call Trace:
[   23.459228]  <TASK>
[   23.459725]  security_file_receive+0x3c/0xf0
[   23.460723]  receive_fd+0x1c/0xd0
[   23.461494]  scm_detach_fds+0xb4/0x1c0
[   23.462430]  __scm_recv_common.isra.0+0x63/0x170
[   23.463843]  scm_recv_unix+0x30/0x130
[   23.464717]  __unix_dgram_recvmsg+0x2d8/0x470
[   23.465786]  sock_recvmsg+0xc0/0xd0
[   23.466786]  ____sys_recvmsg+0x96/0x1f0
[   23.467849]  ___sys_recvmsg+0xb9/0xe0
[   23.468770]  __sys_recvmsg+0x84/0xe0
[   23.469781]  do_syscall_64+0x84/0x2f0
[   23.470876]  ? __sys_recvmsg+0x84/0xe0
[   23.471867]  ? do_syscall_64+0xbc/0x2f0
[   23.473114]  ? __do_sys_setns+0x27b/0x730
[   23.474211]  ? count_memcg_events+0xdd/0x1b0
[   23.475216]  ? handle_mm_fault+0x1d7/0x2e0
[   23.476049]  ? do_user_addr_fault+0x2c3/0x7f0
[   23.477073]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   23.478159] RIP: 0033:0x7f92f18d4687
[   23.479092] Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00
00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24
10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff
ff ff
[   23.483019] RSP: 002b:00007ffdb37a8210 EFLAGS: 00000202 ORIG_RAX:
000000000000002f
[   23.484568] RAX: ffffffffffffffda RBX: 00007f92f1750840 RCX: 00007f92f18d4687
[   23.486069] RDX: 0000000000000000 RSI: 00007ffdb37a8260 RDI: 0000000000000009
[   23.487775] RBP: 00007ffdb37a8260 R08: 0000000000000000 R09: 0000000000000000
[   23.489367] R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffdb37a88e0
[   23.491337] R13: 0000000000000006 R14: 00007ffdb37a88e0 R15: 000000000000000a
[   23.493306]  </TASK>
[   23.494009] Modules linked in: nft_nat nft_ct nft_fib_inet
nft_fib_ipv4 nft_fib_ipv6 nft_fib overlay veth nft_masq nft_chain_nat
nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bridge stp llc
nf_tables vhost_vsock vhost vhost_iotlb binfmt_misc nls_ascii
nls_cp437 vfat intel_rapl_msr intel_rapl_common fat kvm_intel kvm 9p
irqbypass ghash_clmulni_intel aesni_intel rapl virtio_gpu virtio_snd
virtio_dma_buf 9pnet_virtio drm_client_lib 9pnet drm_shmem_helper
snd_pcm pcspkr netfs drm_kms_helper snd_timer snd
vmw_vsock_virtio_transport soundcore vmw_vsock_virtio_transport_common
vsock virtio_input button virtio_balloon cfg80211 sg evdev joydev
rfkill efi_pstore drm configfs nfnetlink efivarfs qemu_fw_cfg
virtio_rng ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 ahci
libahci sd_mod libata virtio_scsi scsi_mod psmouse iTCO_wdt
intel_pmc_bxt iTCO_vendor_support xhci_pci watchdog xhci_hcd usbcore
serio_raw virtio_net scsi_common i2c_i801 net_failover i2c_smbus
lpc_ich failover usb_common
[   23.515238] CR2: 0000000000000018
[   23.516512] ---[ end trace 0000000000000000 ]---
[   24.700704] RIP: 0010:aa_file_perm+0xad/0x530
[   24.704323] Code: 41 5e 41 5f c3 cc cc cc cc 49 8b 45 20 45 8b 7f
10 0f b7 00 66 25 00 f0 66 3d 00 c0 75 1b f7 c5 46 00 10 00 75 13 49
8b 45 18 <48> 8b 40 18 66 83 78 10 01 0f 84 93 02 00 00 41 f7 d7 41 21
ef 44
[   24.714265] RSP: 0018:ffffd17e824a7830 EFLAGS: 00010246
[   24.716801] RAX: 0000000000000000 RBX: ffff8a4e4647a600 RCX: ffff8a4e50fc0540
[   24.719402] RDX: ffff8a4e434b3580 RSI: ffff8a4e433e8840 RDI: ffffffffa0fe149d
[   24.721554] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[   24.723600] R10: 0000000000000000 R11: ffff8a4e4441a400 R12: ffff8a4e4647a600
[   24.726066] R13: ffff8a4e50fc0540 R14: 0000000000000000 R15: 0000000000000000
[   24.728263] FS:  00007f92f1750840(0000) GS:ffff8a4f083fb000(0000)
knlGS:0000000000000000
[   24.731197] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   24.732702] CR2: 00007f63d0844ad0 CR3: 0000000124ae6004 CR4: 0000000000172ef0
[   24.734914] ------------[ cut here ]------------
[   24.736496] Voluntary context switch within RCU read-side critical section!
[   24.736531] WARNING: CPU: 1 PID: 1041 at
kernel/rcu/tree_plugin.h:332 rcu_note_context_switch+0x5b7/0x630
[   24.743269] Modules linked in: nft_nat nft_ct nft_fib_inet
nft_fib_ipv4 nft_fib_ipv6 nft_fib overlay veth nft_masq nft_chain_nat
nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bridge stp llc
nf_tables vhost_vsock vhost vhost_iotlb binfmt_misc nls_ascii
nls_cp437 vfat intel_rapl_msr intel_rapl_common fat kvm_intel kvm 9p
irqbypass ghash_clmulni_intel aesni_intel rapl virtio_gpu virtio_snd
virtio_dma_buf 9pnet_virtio drm_client_lib 9pnet drm_shmem_helper
snd_pcm pcspkr netfs drm_kms_helper snd_timer snd
vmw_vsock_virtio_transport soundcore vmw_vsock_virtio_transport_common
vsock virtio_input button virtio_balloon cfg80211 sg evdev joydev
rfkill efi_pstore drm configfs nfnetlink efivarfs qemu_fw_cfg
virtio_rng ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 ahci
libahci sd_mod libata virtio_scsi scsi_mod psmouse iTCO_wdt
intel_pmc_bxt iTCO_vendor_support xhci_pci watchdog xhci_hcd usbcore
serio_raw virtio_net scsi_common i2c_i801 net_failover i2c_smbus
lpc_ich failover usb_common
[   24.764299] CPU: 1 UID: 1000000 PID: 1041 Comm: crun Tainted: G
 D W           6.16.0+ #2 PREEMPT(lazy)
[   24.766976] Tainted: [D]=DIE, [W]=WARN
[   24.768276] Hardware name: QEMU Standard PC (Q35 + ICH9,
2009)/Incus, BIOS unknown 02/02/2022
[   24.770497] RIP: 0010:rcu_note_context_switch+0x5b7/0x630
[   24.772182] Code: ff 49 89 8d a8 00 00 00 e9 bb fc ff ff 45 85 ff
75 ef e9 b1 fc ff ff 48 c7 c7 d8 c3 f2 a0 c6 05 86 d9 cb 01 01 e8 39
72 f2 ff <0f> 0b e9 94 fa ff ff 49 83 bd a0 00 00 00 00 75 b8 e9 87 fe
ff ff
[   24.777410] RSP: 0018:ffffd17e824a7d10 EFLAGS: 00010086
[   24.779138] RAX: 0000000000000000 RBX: ffff8a4e434b3580 RCX: 0000000000000027
[   24.781297] RDX: ffff8a4eaa65ce48 RSI: 0000000000000001 RDI: ffff8a4eaa65ce40
[   24.783456] RBP: ffff8a4eaa6726c0 R08: 0000000000000000 R09: 0000000000000000
[   24.785952] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
[   24.788141] R13: ffff8a4e434b3580 R14: ffff8a4e40d23a80 R15: 0000000000000000
[   24.790163] FS:  0000000000000000(0000) GS:ffff8a4f083fb000(0000)
knlGS:0000000000000000
[   24.793136] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   24.794583] CR2: 00007f63d0844ad0 CR3: 000000010882c005 CR4: 0000000000172ef0
[   24.796278] Call Trace:
[   24.797074]  <TASK>
[   24.797871]  __schedule+0xca/0xcf0
[   24.799315]  ? _raw_spin_unlock_irqrestore+0xe/0x40
[   24.801133]  schedule+0x27/0xd0
[   24.802403]  synchronize_rcu_expedited+0x1bb/0x220
[   24.804134]  ? __pfx_autoremove_wake_function+0x10/0x10
[   24.805724]  ? __pfx_wait_rcu_exp_gp+0x10/0x10
[   24.806911]  namespace_unlock+0x243/0x310
[   24.808127]  free_nsproxy+0x16/0x190
[   24.809225]  do_exit+0x28b/0xa70
[   24.810597]  make_task_dead+0x90/0x90
[   24.812453]  rewind_stack_and_make_dead+0x16/0x20
[   24.814504] RIP: 0033:0x7f92f18d4687
[   24.815566] Code: Unable to access opcode bytes at 0x7f92f18d465d.
[   24.816987] RSP: 002b:00007ffdb37a8210 EFLAGS: 00000202 ORIG_RAX:
000000000000002f
[   24.818608] RAX: ffffffffffffffda RBX: 00007f92f1750840 RCX: 00007f92f18d4687
[   24.820307] RDX: 0000000000000000 RSI: 00007ffdb37a8260 RDI: 0000000000000009
[   24.823009] RBP: 00007ffdb37a8260 R08: 0000000000000000 R09: 0000000000000000
[   24.825036] R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffdb37a88e0
[   24.826562] R13: 0000000000000006 R14: 00007ffdb37a88e0 R15: 000000000000000a
[   24.828248]  </TASK>
[   24.828999] ---[ end trace 0000000000000000 ]---


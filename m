Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFF7A50B5F
	for <lists+apparmor@lfdr.de>; Wed,  5 Mar 2025 20:22:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tpuJx-0007q7-9w; Wed, 05 Mar 2025 19:22:21 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <ryan.lee@canonical.com>)
 id 1tpuJu-0007pz-LH
 for apparmor@lists.ubuntu.com; Wed, 05 Mar 2025 19:22:18 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 629AC3F181
 for <apparmor@lists.ubuntu.com>; Wed,  5 Mar 2025 19:22:18 +0000 (UTC)
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-abf59b0b274so428578466b.0
 for <apparmor@lists.ubuntu.com>; Wed, 05 Mar 2025 11:22:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741202538; x=1741807338;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=twfuYKBPU4j+DQLnQCGjFaKYd0nF8+Zi6EvkW/scSBc=;
 b=O3jSRcZZV1/PMpm15yas0w4Mci6wll0hlw0/RbLY5sYfGrbuUPGNUKJds+PvrDOrzI
 y3+pXscrLO8u78HsOEMp322EbjRBEu3E3FQdr6b2PCdOyXc8Nd0bdLVav1SsLx9CJhUu
 jx44sg8tzhHgNyxjDXDfmxBFf5d1/c11YBfRH2YRNqjzNmYe/VQmy7dcm9ImwdAvfQl+
 foCGwr8sd1lPcLJqLA7ssbsV4aOgWUczBMAZ/Q5nLRo25SRfxZ8utNH6aFSVA3WiFlb1
 BQdY7SAwRCTPlwRpcqW+VIK/Yg0UVdXDKeEfFIY14vdd9COvspFyH4ilC5crBIbLNZKE
 7gPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiWZNoyIEGdIi4LBDdanl/GQM8oXT+eoYlL2eL+aCXZHN09poVTnc8BrDhxKQfI9o6BXYkYd2fpA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0YwhvpqwRnKHJQUrc795pmM5HUcgFuEfECExTofig84GIYM2c81+
 ZnuEsiWYweS/W6wJfOqP4vH9niPUwsN4l0lGCevIiFoHsZV9towzrFUOo5gCx8Njo9rMphTKF0I
 53FFeh0/NUBsXdL7nsbZsH7YlI22ANCe2pd3GAgEmzYB4YwFFPG3i/y0znHP9YnpFH8YJW6b2lR
 a3P6K7PrreJd/lTFBTLMiKmvaHqTTvZrelTJ62BYAtkASlqzXb
X-Gm-Gg: ASbGncvxMptX9ZRdjRLDh0HG1biOoDBT3l/Q5wezzv3O/YlRh1BRDn8T+d+5NKMHIGj
 p2yxWqi5bKZTTZBwI5J8O2UOj2ZbibI5+MAOdARVjJOaPQv6oy4K102g7a2goXT+H6IshvEQ=
X-Received: by 2002:a17:907:9692:b0:abf:6166:d0c9 with SMTP id
 a640c23a62f3a-ac20d852cdfmr412861366b.2.1741202537868; 
 Wed, 05 Mar 2025 11:22:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqTxIqHnxh+gpljySEIAg/FU622b2IzgodyeaG54Elcvp9PmeSDuUfwAg32Q03slnb4BslFCYfMaW/HcvCUcw=
X-Received: by 2002:a17:907:9692:b0:abf:6166:d0c9 with SMTP id
 a640c23a62f3a-ac20d852cdfmr412859766b.2.1741202537486; Wed, 05 Mar 2025
 11:22:17 -0800 (PST)
MIME-Version: 1.0
References: <e54e6a2f-1178-4980-b771-4d9bafc2aa47@tnxip.de>
In-Reply-To: <e54e6a2f-1178-4980-b771-4d9bafc2aa47@tnxip.de>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Wed, 5 Mar 2025 11:22:06 -0800
X-Gm-Features: AQ5f1Jpmb9cOu4aTJuJjK-x7bzO6ToWXR0BbKvtffLxwzXZK6k733wtNsDh99AU
Message-ID: <CAKCV-6s3_7RzDfo_yGQj9ndf4ZKw_Awf8oNc6pYKXgDTxiDfjw@mail.gmail.com>
To: =?UTF-8?Q?Malte_Schr=C3=B6der?= <malte.schroeder@tnxip.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [apparmor] apparmor NULL pointer dereference on resume
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
Cc: linux-security-module@vger.kernel.org, apparmor <apparmor@lists.ubuntu.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Mar 5, 2025 at 11:11=E2=80=AFAM Malte Schr=C3=B6der <malte.schroede=
r@tnxip.de> wrote:
>
> Hi,
>
> I hope this is the right place to report this. Since 6.14-rc1 ff. resume
> from hibernate does not work anymore. Now I finally managed to get dmesg
> from when this happens (Console is frozen, but managed to login via
> network). If I read that trace correctly there seems to be some
> interaction with apparmor. I retried with apparmor disabled and the
> issue didn't trigger.

Also CC'ing the AppArmor-specific mailing list in this reply.

>
> I am happy to provide more data if required.

Could you try to reproduce this NULL pointer dereference with a clean
kernel with debug info (that I'd be able to access the source code of)
and send a symbolized stacktrace processed with
scripts/decode_stacktrace.sh?

>
> Regards
>
> /Malte
>
> ...
> [ 1981.117448] OOM killer enabled.
> [ 1981.117450] Restarting tasks ... done.
> [ 1981.119115] efivarfs: resyncing variable state
> [ 1981.119125] BUG: kernel NULL pointer dereference, address:
> 0000000000000018
> [ 1981.119127] #PF: supervisor read access in kernel mode
> [ 1981.119128] #PF: error_code(0x0000) - not-present page
> [ 1981.119130] PGD 0 P4D 0
> [ 1981.119132] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> [ 1981.119133] CPU: 0 UID: 0 PID: 20445 Comm: systemd-sleep Not tainted
> 6.14.0-rc5-highlander-00106-gef00144cf269-dirty #1
> [ 1981.119136] Hardware name: To Be Filled By O.E.M. X570 Extreme4/X570
> Extreme4, BIOS P5.60 01/18/2024
> [ 1981.119137] RIP: 0010:apparmor_file_open+0x9b/0x1f0
> [ 1981.119140] Code: c5 00 08 00 00 0f 85 4b 01 00 00 4c 89 e9 31 c0 f6
> c1 02 0f 85 fd 00 00 00 48 8b 87 88 00 00 00 4c 8d b7 88 00 00 00 48 89
> fd <48> 8b 40 18 48 8b 4f 70 0f b7 11 48 89 c7 66 89 54 24 04 48 8b 51
> [ 1981.119142] RSP: 0018:ffff9878ef633c50 EFLAGS: 00010246
> [ 1981.119144] RAX: 0000000000000000 RBX: ffff8cae8ef20500 RCX:
> 0000000000000300
> [ 1981.119145] RDX: ffff8cbcb7227538 RSI: 0000000000095fb9 RDI:
> ffff8cb05a13d680
> [ 1981.119146] RBP: ffff8cb05a13d680 R08: ffff8cbcb7227520 R09:
> 0000000000000002
> [ 1981.119147] R10: ffff8cadc0a30000 R11: 0000000000000001 R12:
> 0000000000000010
> [ 1981.119147] R13: 0000000000000300 R14: ffff8cb05a13d708 R15:
> ffff8cb06b1a4c98
> [ 1981.119148] FS:  00007f98aa8cd880(0000) GS:ffff8cbcb7200000(0000)
> knlGS:0000000000000000
> [ 1981.119150] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1981.119151] CR2: 0000000000000018 CR3: 00000004e8634000 CR4:
> 0000000000f50ef0
> [ 1981.119152] PKRU: 55555554
> [ 1981.119153] Call Trace:
> [ 1981.119154]  <TASK>
> [ 1981.119156]  ? __die_body+0x65/0xb0
> [ 1981.119159]  ? page_fault_oops+0x32b/0x3a0
> [ 1981.119161]  ? refill_obj_stock.llvm.8234991812681303024+0x5f/0x470
> [ 1981.119163]  ? local_clock_noinstr+0xc/0xb0
> [ 1981.119166]  ? do_user_addr_fault+0x61d/0x690
> [ 1981.119168]  ? local_clock_noinstr+0xc/0xb0
> [ 1981.119170]  ? exc_page_fault+0x5d/0xb0
> [ 1981.119172]  ? asm_exc_page_fault+0x26/0x30
> [ 1981.119174]  ? apparmor_file_open+0x9b/0x1f0
> [ 1981.119176]  security_file_open+0x4a/0x80
> [ 1981.119178]  do_dentry_open+0xe1/0x500
> [ 1981.119180]  kernel_file_open+0x48/0x110
> [ 1981.119182]  efivarfs_pm_notify+0xb9/0x150
> [ 1981.119184]  ? __cfi_efivarfs_actor+0x10/0x10
> [ 1981.119185]  ? fw_pm_notify+0x7b/0x120
> [ 1981.119188]  notifier_call_chain.llvm.16935409508942381779+0x8e/0x120
> [ 1981.119190]  blocking_notifier_call_chain+0x40/0x60
> [ 1981.119192]  hibernate+0x246/0x2a0
> [ 1981.119194]  state_store+0xe6/0x110
> [ 1981.119196]  kernfs_fop_write_iter.llvm.7859645527451689651+0x134/0x1c=
0
> [ 1981.119198]  vfs_write+0x2fb/0x430
> [ 1981.119201]  ksys_write+0x7e/0xf0
> [ 1981.119203]  do_syscall_64+0x58/0xf0
> [ 1981.119205]  ? irqentry_exit_to_user_mode+0x82/0xa0
> [ 1981.119207]  entry_SYSCALL_64_after_hwframe+0x50/0x58
> [ 1981.119208] RIP: 0033:0x7f98aa271e56
> [ 1981.119210] Code: 89 df e8 7d bd 00 00 8b 93 08 03 00 00 59 5e 48 83
> f8 fc 75 15 83 e2 39 83 fa 08 75 0d e8 32 ff ff ff 66 90 48 8b 45 10 0f
> 05 <48> 8b 5d f8 c9 c3 0f 1f 40 00 f3 0f 1e fa 55 48 89 e5 48 83 ec 08
> [ 1981.119211] RSP: 002b:00007fffa86c0160 EFLAGS: 00000202 ORIG_RAX:
> 0000000000000001
> [ 1981.119213] RAX: ffffffffffffffda RBX: 00007f98aa8cd880 RCX:
> 00007f98aa271e56
> [ 1981.119214] RDX: 0000000000000005 RSI: 0000556a8e281e20 RDI:
> 0000000000000007
> [ 1981.119215] RBP: 00007fffa86c0170 R08: 0000000000000000 R09:
> 0000000000000000
> [ 1981.119215] R10: 0000000000000000 R11: 0000000000000202 R12:
> 0000000000000005
> [ 1981.119216] R13: 0000556a8e281e20 R14: 0000556a8e280340 R15:
> 00007f98aa3c6ea0
> [ 1981.119218]  </TASK>
> [ 1981.119219] Modules linked in: rfcomm snd_seq_dummy snd_hrtimer
> snd_seq bnep nct6775 hwmon_vid nct6775_core cfg80211 btusb btrtl btmtk
> btbcm btintel snd_usb_audio snd_ump snd_usbmidi_lib snd_rawmidi
> snd_seq_device bluetooth rfkill snd_hda_codec_realtek
> snd_hda_scodec_component snd_hda_codec_generic snd_hda_codec_hdmi
> snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_ctxfi snd_hwdep
> wmi_bmof kvm_amd kvm snd_pcsp snd_hda_core nfnetlink ip_tables x_tables
> hid_roccat_kone hid_roccat hid_logitech_hidpp hid_logitech_dj amdgpu
> drm_panel_backlight_quirks cec mfd_core drm_buddy drm_suballoc_helper
> video drm_exec drm_display_helper gpu_sched amdxcp drm_client_lib
> drm_ttm_helper drm_kms_helper ttm wmi uhid snd_aloop snd_pcm snd_timer
> snd soundcore videodev mc
> [ 1981.119243] CR2: 0000000000000018
> [ 1981.119245] ---[ end trace 0000000000000000 ]---
> [ 1981.120124] mlx4_en: 0000:04:00.0: Port 1: Using 32 TX rings
> [ 1981.120127] mlx4_en: 0000:04:00.0: Port 1: Using 16 RX rings
> [ 1981.127944] mlx4_en: 0000:04:00.0: Port 1: Initializing port
> [ 1981.128388] mlx4_en 0000:04:00.0: registered PHC clock
> [ 1981.266201] RIP: 0010:apparmor_file_open+0x9b/0x1f0
> [ 1981.266207] Code: c5 00 08 00 00 0f 85 4b 01 00 00 4c 89 e9 31 c0 f6
> c1 02 0f 85 fd 00 00 00 48 8b 87 88 00 00 00 4c 8d b7 88 00 00 00 48 89
> fd <48> 8b 40 18 48 8b 4f 70 0f b7 11 48 89 c7 66 89 54 24 04 48 8b 51
> [ 1981.266208] RSP: 0018:ffff9878ef633c50 EFLAGS: 00010246
> [ 1981.266210] RAX: 0000000000000000 RBX: ffff8cae8ef20500 RCX:
> 0000000000000300
> [ 1981.266211] RDX: ffff8cbcb7227538 RSI: 0000000000095fb9 RDI:
> ffff8cb05a13d680
> [ 1981.266212] RBP: ffff8cb05a13d680 R08: ffff8cbcb7227520 R09:
> 0000000000000002
> [ 1981.266213] R10: ffff8cadc0a30000 R11: 0000000000000001 R12:
> 0000000000000010
> [ 1981.266214] R13: 0000000000000300 R14: ffff8cb05a13d708 R15:
> ffff8cb06b1a4c98
> [ 1981.266215] FS:  00007f98aa8cd880(0000) GS:ffff8cbcb7200000(0000)
> knlGS:0000000000000000
> [ 1981.266216] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1981.266217] CR2: 0000000000000018 CR3: 00000004e8634000 CR4:
> 0000000000f50ef0
> [ 1981.266218] PKRU: 55555554
> [ 1981.266219] note: systemd-sleep[20445] exited with irqs disabled
> ...
>
>

Ryan


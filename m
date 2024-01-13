Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF8082CD00
	for <lists+apparmor@lfdr.de>; Sat, 13 Jan 2024 15:24:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rOevk-00033M-0k; Sat, 13 Jan 2024 14:24:12 +0000
Received: from mail.ispras.ru ([83.149.199.84])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <pchelkin@ispras.ru>)
 id 1rOcvr-0002Ir-MM
 for apparmor@lists.ubuntu.com; Sat, 13 Jan 2024 12:16:11 +0000
Received: from localhost.ispras.ru (unknown [10.10.165.8])
 by mail.ispras.ru (Postfix) with ESMTPSA id 3F10640F1DE8;
 Sat, 13 Jan 2024 12:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 3F10640F1DE8
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: John Johansen <john.johansen@canonical.com>
Date: Sat, 13 Jan 2024 15:15:50 +0300
Message-ID: <20240113121556.12948-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Jan 2024 14:24:03 +0000
Subject: [apparmor] [PATCH 0/2] apparmor: fix namespace check in serialized
	stream headers from the same policy load
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
Cc: lvc-project@linuxtesting.org, Paul Moore <paul@paul-moore.com>,
 linux-kernel@vger.kernel.org, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, Fedor Pchelkin <pchelkin@ispras.ru>,
 linux-security-module@vger.kernel.org,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This series is intended to fix the supposedly invalid behaviour of
verify_header() function when checking unpacked profiles namespace
declarations.

Consider having a profiles file called 'testfile' with contents as
 profile :ns1:profile1 ... {}
 profile :ns2:profile2 ... {}

then packing it in a binary format and trying a load-replace operation
 $ apparmor_parser -Q -W -T testfile
 $ apparmor_parser -r -B /var/cache/apparmor/ac27e0ee.0/testfile

Per dmesg output this leads the profiles to be loaded into the same
namespace (trimmed for more convenient display):
 [  414.616098] audit: apparmor="STATUS" operation="profile_load" name="profile1" comm="apparmor_parser" ns="ns2"
 [  414.619304] audit: apparmor="STATUS" operation="profile_load" name="profile2" comm="apparmor_parser" ns="ns2"

while the string "ns1" unpacked inside verify_header() is leaked:

unreferenced object 0xffff888012ff9b18 (size 8):
  comm "apparmor_parser", pid 1198, jiffies 4295081077 (age 164.892s)
  hex dump (first 8 bytes):
    6e 73 31 00 80 88 ff ff                          ns1.....
  backtrace:
    [<ffffffff81ddb4b2>] __kmem_cache_alloc_node+0x1e2/0x2d0
    [<ffffffff81c47034>] __kmalloc_node_track_caller+0x54/0x170
    [<ffffffff81c224dc>] kstrdup+0x3c/0x70
    [<ffffffff83e2e4ef>] aa_unpack+0xb5f/0x1540
    [<ffffffff83e1e9c6>] aa_replace_profiles+0x1f6/0x4040
    [<ffffffff83def008>] policy_update+0x238/0x350
    [<ffffffff83def33e>] profile_replace+0x20e/0x2a0
    [<ffffffff81ead03f>] vfs_write+0x2af/0xe00
    [<ffffffff81eae556>] ksys_write+0x126/0x250
    [<ffffffff88f54426>] do_syscall_64+0x46/0xf0
    [<ffffffff890000ea>] entry_SYSCALL_64_after_hwframe+0x6e/0x76

With the following patches this situation is detected and the whole
profiles load set is denied because of the mixed namespaces.

Note that the following multiple profiles load will also fail after these
patches - quite similar to the namespace check inside aa_replace_profiles().
  profile profile1 ... {}
  profile :ns:profile2 ... {}

This behaviour may directly affect userspace part of AppArmor, though I've
not been able to find any valid use case when e.g. the user writes
  profile profile1 ... {}
  profile :ns:profile2 ... {}
and expects `profile1` to be associated with `ns`. I think it's actually
an invalid expectation so such profiles set should be also denied with a
'mixed namespaces' explaining message.

There is no difference in AppArmor regression tests with and without the
changes.


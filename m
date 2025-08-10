Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7C6B1F9EC
	for <lists+apparmor@lfdr.de>; Sun, 10 Aug 2025 14:25:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ul57A-00058j-IH; Sun, 10 Aug 2025 12:25:28 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <valoq@mailbox.org>) id 1ul578-00058S-Iy
 for apparmor@lists.ubuntu.com; Sun, 10 Aug 2025 12:25:26 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4c0H6D2ZgXz9sTZ
 for <apparmor@lists.ubuntu.com>; Sun, 10 Aug 2025 14:25:24 +0200 (CEST)
Date: Sun, 10 Aug 2025 14:25:24 +0200
From: valoq <valoq@mailbox.org>
To: apparmor@lists.ubuntu.com
Message-ID: <aJiPtAhLY2esOAkC@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MBO-RS-ID: a72e53031b8880efb29
X-MBO-RS-META: q5i8jkgdogbmeirnyrbcuzuonjxdqnbk
Received-SPF: pass client-ip=80.241.56.171; envelope-from=valoq@mailbox.org;
 helo=mout-p-201.mailbox.org
Subject: [apparmor] Upstream kernel socket path isolation
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

Recently I have been testing apparmor process isolation and came across different behaviors in regards to socket isolation, especially in regards to socket file path filtering.
From what I have gathered, the documented features in apparmor are only enforced with a kernel fully patched with all apparmor features, like what ubuntu implements.
Which means that all other linux distributions out there are currently not providing any effective process isolation through apparmor since escape path like socket communication is wide open. (the base abstraction commonly
+included allows sockets and there is no file path filter implemented in distro kernels other then ubuntu)
If I understand it correctly, the recently added aa patches for linux 6.17 will bring this feature for everyone but I would like to know if this is actually the correct assumption and if starting with kernel 6.17 the
+upstream linux kernel actually does include all required patches to provide effective isolation. Perhaps someone could point out where the differences between upstream kernel and ubuntus/apparmor kernel are documented?


During my dive into apparmor I also noticed two possible bugs or at least strange behaviors that I wanted to point out/have checked:

1.
If a profile has an include statement like:
include <abstractions/base>
and the profile is edited to comment out this line with a single # like this:
#include <abstractions/base>
then the single # is ignored and the include is interpreted anyway.
Only when several ## are put before the include or there is a space in between will the line be effectively commented out. Is this intentional?


2.
Even in a profile that does not have any file system permissions in a specific path, it is possible to list the file information of specific files.

For example, if a profile includes:
deny /home/** r,
and has no other permission for this path or any subdirectories I can still do:
/usr/bin/ls -l /home/tester/.ssh/id_ed25519_private_key
-rw------- 1 tester tester 505 Mar 25 17:32 /home/tester/.ssh/id_ed25519_private_key
From my understanding of apparmor, this should result in a permission denied error, but even on ubuntu it works
If I now try to access the file:
/usr/bin/touch /home/tester/.ssh/id_ed25519_private_key
This also succeeds in updating the metadata
-rw------- 1 tester tester 505 Aug 10 12:02 /home/tester/.ssh/id_ed25519_private_key

Im not sure there is any critical use case to exploit this, but at the very least it allows to probe for the existance of any file in the filesystem without aa permissions and reveal its metadata, which seems to contradict
+the MAC model.

Thank you


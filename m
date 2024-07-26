Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F81893DDD1
	for <lists+apparmor@lfdr.de>; Sat, 27 Jul 2024 10:14:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sXcZ8-0007GD-GY; Sat, 27 Jul 2024 08:14:10 +0000
Received: from mout01.posteo.de ([185.67.36.65])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <xoip@posteo.de>) id 1sXKGI-0001Pn-TB
 for apparmor@lists.ubuntu.com; Fri, 26 Jul 2024 12:41:30 +0000
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 77F3C240028
 for <apparmor@lists.ubuntu.com>; Fri, 26 Jul 2024 14:41:28 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4WVnS81mKxz6tm8
 for <apparmor@lists.ubuntu.com>; Fri, 26 Jul 2024 14:41:28 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 26 Jul 2024 12:41:28 +0000
From: xoip@posteo.de
To: apparmor@lists.ubuntu.com
Message-ID: <4aab8732d80fd346ec9d1b22533410a3@posteo.de>
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=185.67.36.65; envelope-from=xoip@posteo.de;
 helo=mout01.posteo.de
X-Mailman-Approved-At: Sat, 27 Jul 2024 08:14:09 +0000
Subject: [apparmor] =?utf-8?q?Specific_kernel_version_required_specific_ap?=
 =?utf-8?q?parmor-utils_version=3F?=
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

I'm testing linux 6.10.1.

apparmor-utils version is 3.0.8

auditd and apparmor are enabled.
create usr.bin.mpv profile and activate with "aa-complain usr.bin.mpv".
aa-status show its fine.

but when i want to check logs with aa-logprof.
logs are readed by i never asked to allow or denied anything.

/var/log/audit/audit.log

type=AVC msg=audit(1721996490.702:8607): apparmor="ALLOWED" 
operation="recvmsg" class="net" profile="/usr/bin/mpv" pid=822 
comm="mpv/vo" family="unix" sock_type="stream" protocol=0 
requested_mask="r>
type=SYSCALL msg=audit(1721996490.702:8607): arch=c000003e syscall=47 
success=yes exit=60 a0=3 a1=74f341ffef10 a2=40000040 a3=0 items=0 
ppid=821 pid=822 auid=1000 uid=1000 gid=1000 euid=1000 suid=10>
type=PROCTITLE msg=audit(1721996490.702:8607): proctitle="mpv"


Do i need newer version of apparmor-utils?

https://gitlab.com/apparmor/apparmor/-/wikis/Kernel_Feature_Matrix

says at 5.0 kernel "no userspace requirements."


greetings xoip


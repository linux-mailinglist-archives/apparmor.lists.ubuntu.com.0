Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qhVqNVnndGkl+wAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sat, 24 Jan 2026 16:38:01 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 410637E0C6
	for <lists+apparmor@lfdr.de>; Sat, 24 Jan 2026 16:38:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vjfhj-00009F-At; Sat, 24 Jan 2026 15:37:39 +0000
Received: from bout4.ijzerbout.nl ([91.99.166.32])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <kees@ijzerbout.nl>) id 1vjfhh-000094-VS
 for apparmor@lists.ubuntu.com; Sat, 24 Jan 2026 15:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
 t=1769269057; bh=Rc32uQo5KrfIQnSTI8rBoeop45RSkxK+IgX+gJ2AHFs=;
 h=Date:To:From:Subject:From;
 b=jKfQZftJDBAMPj20vgbtd0ia2drwTKipKdDwjSKJ7iIAMnfjAkjswjrQKxeVzzis8
 EnKbztZpDN/Fr3mZI5Yh/NEInBg3T/3pdj0WXAw4KK6Uy1sZj1rrvEmpBvzx82xQMz
 3ywgUEeJDSJvCzdmFghVNh5s1zTgwEHs/cYmJ1VtmYGfEIv1GYLpZM4M894IsNswzc
 7vXQmPP4uJbQ7+bqQcm7TIAzs1olYA5maIgD5aRsmPv+iLyQqoAxhSz2bkIaXVifsL
 JiFbqRzTJIUZ8Si1onB4kEpXI+Oy5WhOJ0SbQfI7htwdxNlTZUvTzFACuZu7tjXViO
 ElaIK1nRlPxlRI1GJ6G9udNZHZ6+TCuvdeBeo4AzzYbTyBoqtWiHqSUOT3P8i4YeBk
 TVJxPEkchGyBAQ12jPB9tOi3X2IuIKJAxAC7HI20qFiFgTAYwFa6qBTigCOwyPzopj
 l/suTXG5eU/SyeMIM+yLSNtuSVBHWRboWiCKbt6bGb48KinF6w/dpCQaGvtbSMPMmw
 r552tUPM8456wFIgXM1nWbi9D/V93NiT8llujrfUiq2mC8vkMEhvPfYdBdPhhjL6v8
 HFMc/kmUtwEAdyYGNkFEs3n3YK/G64oFCQAis0BHN6zrTv4L6RUd+b6pO1VSCMncpC
 EK7vQMHK6EMxGnNXOK8fP2hg=
Received: from [IPV6:2a10:3781:99:1:aaff:e11f:3a25:db5a] (unknown
 [IPv6:2a10:3781:99:1:aaff:e11f:3a25:db5a])
 by bout4.ijzerbout.nl (Postfix) with ESMTPSA id 5803C42175
 for <apparmor@lists.ubuntu.com>; Sat, 24 Jan 2026 16:37:37 +0100 (CET)
Message-ID: <034d652f-ebdc-4d9a-8f7f-05c5596b23e5@ijzerbout.nl>
Date: Sat, 24 Jan 2026 16:37:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
To: apparmor@lists.ubuntu.com
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=91.99.166.32; envelope-from=kees@ijzerbout.nl;
 helo=bout4.ijzerbout.nl
Subject: [apparmor] Need assistance with DENIED userns_create for non-root
 podman inside an Incus container
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.49 / 15.00];
	DMARC_POLICY_REJECT(2.00)[ijzerbout.nl : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[ijzerbout.nl:s=key];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ijzerbout.nl:-];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[kees@ijzerbout.nl,apparmor-bounces@lists.ubuntu.com];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[apparmor];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ijzerbout.nl:mid,f43:email,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 410637E0C6
X-Rspamd-Action: no action

Hi,

My setup is a Ubuntu24 with an Incus server (6.20).
One Incus container runs Fedora 43 where I want to run non-root podman.

Inside the container

[root@f43 ~]# sudo -u fedora -i
[fedora@f43 ~]$ podman run -t -i hello-world
cannot clone: Permission denied
Error: cannot re-exec process

On the Ubuntu24 host I see this in journalctl

jan 24 16:33:41 rapper kernel: audit: type=1400 
audit(1769268821.264:1554): apparmor="DENIED" operation="userns_create" 
class="namespace" info="Userns create restricted - failed to find 
unprivileged_userns profile" error=-13 
namespace="root//incus-f43_<var-lib-incus>" profile="unconfined" 
pid=2332667 comm="podman" requested="userns_create" 
denied="userns_create" target="unprivileged_userns"

My question, what do I have to do on the Ubuntu24 server to allow 
running non-root podman?
Any help or suggestion is greatly appreciated.
-- 
Kees


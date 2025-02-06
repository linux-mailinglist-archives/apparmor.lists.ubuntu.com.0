Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 13635A2AA1F
	for <lists+apparmor@lfdr.de>; Thu,  6 Feb 2025 14:39:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tg269-0005CC-4y; Thu, 06 Feb 2025 13:39:17 +0000
Received: from home.borberg.arvin.dk ([194.45.76.153])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <troels@arvin.dk>) id 1tg267-0005C4-JT
 for apparmor@lists.ubuntu.com; Thu, 06 Feb 2025 13:39:15 +0000
Received: from localhost (localhost [127.0.0.1])
 by arvin.dk (Postfix) with ESMTP id B10392598C
 for <apparmor@lists.ubuntu.com>; Thu,  6 Feb 2025 14:33:56 +0100 (CET)
X-Virus-Scanned: amavis at arvin.dk
Received: from arvin.dk ([127.0.0.1])
 by localhost (arvinserver4.home.borberg.arvin.dk [127.0.0.1]) (amavis,
 port 10024)
 with LMTP id Nly64AmmlEXS for <apparmor@lists.ubuntu.com>;
 Thu,  6 Feb 2025 14:33:55 +0100 (CET)
Received: from [192.168.1.8] (unknown [192.168.1.1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
 (No client certificate requested)
 by arvin.dk (Postfix) with ESMTPSA id 03CE11C1C9
 for <apparmor@lists.ubuntu.com>; Thu,  6 Feb 2025 14:33:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 arvin.dk 03CE11C1C9
Content-Type: multipart/alternative;
 boundary="------------0yla49lV9rs53ijZi2Hy9m08"
Message-ID: <cc1b71b7-6473-4c20-af59-ff1b6bf80bfd@arvin.dk>
Date: Thu, 6 Feb 2025 14:33:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
Content-Language: en-US
From: Troels Arvin <troels@arvin.dk>
Received-SPF: pass client-ip=194.45.76.153; envelope-from=troels@arvin.dk;
 helo=home.borberg.arvin.dk
Subject: [apparmor] Prevent log message about ALLOWED apparmor events?
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

This is a multi-part message in MIME format.
--------------0yla49lV9rs53ijZi2Hy9m08
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On some Ubuntu 22 and 24 systems, syslog is being cluttered with 
messages like this which is completely uninteresting:

Feb 05 16:17:01 myhost.example.com audit[353829]: AVC apparmor="ALLOWED" 
operation="open" profile="/usr/sbin/sssd" name="/proc/420747/cmdline" 
pid=353829 comm="sssd_nss" requested_mask="r" denied_mask="r" fsuid=0 ouid=0

I would certainly like to know about DENIED events, but how can I have 
apparmor/audit stop logging about ALLOWED events?

-- 
Regards,
Troels Arvin

--------------0yla49lV9rs53ijZi2Hy9m08
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello,<br>
      <br>
      On some Ubuntu 22 and 24 systems, syslog is being cluttered with
      messages like this which is completely uninteresting:<br>
      <br>
      Feb 05 16:17:01 myhost.example.com audit[353829]: AVC
      apparmor="ALLOWED" operation="open" profile="/usr/sbin/sssd"
      name="/proc/420747/cmdline" pid=353829 comm="sssd_nss"
      requested_mask="r" denied_mask="r" fsuid=0 ouid=0<br>
      <br>
      I would certainly like to know about DENIED events, but how can I
      have apparmor/audit stop logging about ALLOWED events?<br>
    </p>
    <p>-- <br>
      Regards,<br>
      Troels Arvin<br>
    </p>
  </body>
</html>

--------------0yla49lV9rs53ijZi2Hy9m08--


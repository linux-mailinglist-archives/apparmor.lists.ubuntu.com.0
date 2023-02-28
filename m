Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6896A6088
	for <lists+apparmor@lfdr.de>; Tue, 28 Feb 2023 21:43:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pX6oj-0003qJ-FR; Tue, 28 Feb 2023 20:43:21 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1pX6oh-0003pt-A4
 for apparmor@lists.ubuntu.com; Tue, 28 Feb 2023 20:43:19 +0000
Received: from [192.168.192.83] (unknown [50.47.134.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 68094408F1; 
 Tue, 28 Feb 2023 20:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1677616997;
 bh=01Qn+iNEFNE8xKCcccr1GQ7r6Tp50HK8sU1Duw4I8oM=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=UB5qhKfaTH68pKis7h3ruk6L757Chu1JPK5Zn/h+KK9i2uJdLD5zX2h9XfBJ2gqDl
 5wMpUEN1YUssK+gWkCMWCpl4hKnd2VUwpgG6trl4V2t5V4rm7HHVYJYbxu48Gb9Nhe
 FoF6PpERucL7ShHwWS9FIPz1dMLIEjL0fp+LqRFjRJJ1hWsqxOx4EIulh4BiRSt7Kz
 gXv98AIunRQpOD1tfpTl0qxfpV74vOrQJ6dix04qsn6WQnM/SC0VJpGXTfdkVVZQWB
 2MrcJ+Ve/ozakwSYVlWWpU3hTLjU6kw/FqvZoabSMb9bwGJ5+T1G1gbYD30u0ozN7t
 6CCAmAafiXXbQ==
Message-ID: <f9949f5a-25ce-97b7-782e-c236b38146ab@canonical.com>
Date: Tue, 28 Feb 2023 12:43:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Murali Selvaraj <murali.selvaraj2003@gmail.com>,
 apparmor@lists.ubuntu.com, Seth Arnold <seth.arnold@canonical.com>
References: <CAODFaZ6+kOJcTs6a1_08TCJ6pnqndzKBBWOK0+xb4L2gmB9ffw@mail.gmail.com>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
In-Reply-To: <CAODFaZ6+kOJcTs6a1_08TCJ6pnqndzKBBWOK0+xb4L2gmB9ffw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] Reg. Apparmor logging query
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

On 2/28/23 11:39, Murali Selvaraj wrote:
> Hi John,
> 
> I added below entries in one of my profiles which runs under complain mode.
> *audit /var/** wl,*
> 

what kernel version? I will note that there are two know bugs around auditing. One of them is fixed, the other is currently being worked on.
I am not sure if this one would be affected by the second bug but if you are seeing the messages with -a I would say no.

> As per my script to capture Apparmor logs, I am capturing journalctl -k for every 30 mins in my log path (for instance, /tmp/logs/).
> However, I could NOT see the expected log entry for this rule audit "/var/** wl," from journalctl -k output.
> 

do you know which path the journal is pulling the apparmor logs? via the audit subsystem (auditd installed) or via the kernel log path.


> I could see the logs seen if we use *journalctl -a*, but I do not want to copy (to avoid the space) journalctl -a for every 30 mins as it has other additional/debug log information.

This to me says you have auditd installed which means apparmor messages are not going to dmesg, but instead routed through audit. Since AppArmor is using the audit subsystem for logging the decision of where the messages go is up to the audit subsystem, if auditd is installed they will go there

Unfortunately at this time apparmor doesn't have finer control over this than what auditd provides. There is work to improve apparmor auditing which will allow more options but that hasn't landed yet, and the portion to would allow the complain redirect isn't even implemented yet.

> 
> Do we have any options/configuration to get these logs from *journalctl -k *instead of*journalctl -a*?
> 

you can try disabling auditd

auditctl-e0

or potentially filtering based on the transport using  journalctl -af _TRANSPORT=audit




> Thanks
> Murali.S



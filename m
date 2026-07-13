Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y2DZFIY3VWpKlgAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Mon, 13 Jul 2026 21:07:50 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE5774EA3A
	for <lists+apparmor@lfdr.de>; Mon, 13 Jul 2026 21:07:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=riseup.net header.s=squak header.b=rKi4SvjJ;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com;
	dmarc=pass (policy=none) header.from=riseup.net
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wjM02-00078u-T3; Mon, 13 Jul 2026 19:07:30 +0000
Received: from mx0.riseup.net ([198.252.153.6])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <intrigeri@riseup.net>)
 id 1wjGov-0004X8-Vo
 for apparmor@lists.ubuntu.com; Mon, 13 Jul 2026 13:35:42 +0000
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4gzNjl3sV1z9st0
 for <apparmor@lists.ubuntu.com>; Mon, 13 Jul 2026 13:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
 t=1783949739; bh=BcSdwGVWuYc4Surm6/rwUSpxycy0yIDjyUedix9oBPQ=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=rKi4SvjJ0UpjPuzBOSHwWczhFQrScAC8euaEGPM3RFyQ4PpRh/MY1nvXdCObX440q
 MYLcuXH4QEjJj7hA/5folPyXE8LWhdoSrDmiw8a53TaBc+LXfIecNMwSMtlLnhoHFn
 HlUyx4xB+/xTfnjiSaaj+TL3/IlF7xNAUQJhhb7k=
X-Riseup-User-ID: 5D479EC96751DABA280C9AD5DEBE5F12DF7E9D805B24288DED2AFE6505DAFC07
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4gzNjl1P92z1xyV
 for <apparmor@lists.ubuntu.com>; Mon, 13 Jul 2026 13:35:39 +0000 (UTC)
Received: from manticora (localhost [127.0.0.1])
 by localhost (Postfix) with ESMTP id B34DA1882427
 for <apparmor@lists.ubuntu.com>; Mon, 13 Jul 2026 15:35:36 +0200 (CEST)
Message-Id: <87tsq3ko5z.fsf@manticora>
From: intrigeri <intrigeri@riseup.net>
To: apparmor <apparmor@lists.ubuntu.com>
In-Reply-To: <75621600-a087-4888-8aaf-3011732cad1b@canonical.com>
References: <75621600-a087-4888-8aaf-3011732cad1b@canonical.com>
Date: Mon, 13 Jul 2026 15:35:36 +0200
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=198.252.153.6; envelope-from=intrigeri@riseup.net;
 helo=mx0.riseup.net
X-Mailman-Approved-At: Mon, 13 Jul 2026 19:07:29 +0000
Subject: Re: [apparmor] New co-maintainer
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[riseup.net,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	R_DKIM_ALLOW(-0.20)[riseup.net:s=squak];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NEQ_ENVFROM(0.00)[intrigeri@riseup.net,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[riseup.net:+];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[manticora:mid,lists.ubuntu.com:from_smtp,lists.ubuntu.com:helo,lists.ubuntu.com:rdns];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AE5774EA3A

Hi,

John Johansen via AppArmor (2026-06-25):
> Georgia Garcia <georgia.garcia@canonical.com> is now a co-maintainer of the apparmor project, both in userspace, and more importantly in the kernel.

Welcome Georgia into this new role!

Thank you and congrats :)
-- 
intrigeri


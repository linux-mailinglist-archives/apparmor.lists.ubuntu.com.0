Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C0D84FDE4
	for <lists+apparmor@lfdr.de>; Fri,  9 Feb 2024 21:47:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rYXme-0007rk-3G; Fri, 09 Feb 2024 20:47:40 +0000
Received: from mail-4325.protonmail.ch ([185.70.43.25])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <cati55@proton.me>) id 1rYW01-0006Op-BO
 for apparmor@lists.ubuntu.com; Fri, 09 Feb 2024 18:53:21 +0000
Date: Fri, 09 Feb 2024 18:53:07 +0000
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
From: cati55 <cati55@proton.me>
Message-ID: <6zANdI88zZClE64dIdlHTWqCAOaIss4ruafgQTZaLkAYX3BdZWHJXhP07JtLxhpq7yNVgZ5nKQJXFlZwwXrSppNSPucoYBY6gBueTVt6nWA=@proton.me>
Feedback-ID: 100631237:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 09 Feb 2024 20:47:38 +0000
Subject: [apparmor] AVC type malformed
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

When apparmor logs events with audit type AVC, the logs cannot be found by =
usual audit tools because the entry is malformed as stated in this auditd b=
ugreport
https://github.com/linux-audit/audit-userspace/issues/351#issuecomment-1932=
211875

To quite the maintainer:

> If they are going to emit an access decision as an AVC, it has to exactly=
 follow the format of an SE Linux AVC. The AppArmor kernel developers were =
given the AUDIT type block from 1500 to 1599 a long time ago so that they c=
an format their events any way they wish. The AVC they are using is type nu=
mber 1400. They should really define AUDIT_AA_DECISION 1500 (or whatever ma=
kes sense to AppArmor) and then use that.

It took me a few days to figure this one out and that didn't make apparmor =
easier to debug. If there is anything in regards to testing I can help with=
 to solve this bug, please let me know.



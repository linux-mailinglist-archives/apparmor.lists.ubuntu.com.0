Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EB0A103CC
	for <lists+apparmor@lfdr.de>; Tue, 14 Jan 2025 11:16:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tXdxc-0000PM-US; Tue, 14 Jan 2025 10:15:48 +0000
Received: from out-175.mta0.migadu.com ([91.218.175.175])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <thorsten.blum@linux.dev>)
 id 1tXdxX-0000PC-Cc
 for apparmor@lists.ubuntu.com; Tue, 14 Jan 2025 10:15:43 +0000
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <d93ed7bb-b184-4153-8084-b693eb1e2b85@canonical.com>
Date: Tue, 14 Jan 2025 11:15:27 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <1C3FAFB6-14DB-4E2D-8310-06022B2BB20A@linux.dev>
References: <20241220192243.1856-1-thorsten.blum@linux.dev>
 <d93ed7bb-b184-4153-8084-b693eb1e2b85@canonical.com>
To: John Johansen <john.johansen@canonical.com>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=91.218.175.175;
 envelope-from=thorsten.blum@linux.dev; helo=out-175.mta0.migadu.com
Subject: Re: [apparmor] [RESEND PATCH] apparmor: Use str_yes_no() helper
	function
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
Cc: Paul Moore <paul@paul-moore.com>, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>,
 linux-security-module@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 20. Dec 2024, at 21:19, John Johansen wrote:
> On 12/20/24 11:22, Thorsten Blum wrote:
>> Remove hard-coded strings by using the str_yes_no() helper function.
>> Fix a typo in a comment: s/unpritable/unprintable/
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>=20
> Hey Thorsten,
>=20
> sorry for the delay on this I am just really backlogged and will try =
to catch-up
> on the mailing list traffic this weekend.
>=20
> Acked-by: John Johansen <john.johansen@canonical.com>
>=20
> I have pulled this into my tree and it should migrate into linux-next =
soon

Hi John, I can't find this in linux-next yet. Any ideas?

Thanks,
Thorsten=


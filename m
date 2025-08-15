Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C3CB28357
	for <lists+apparmor@lfdr.de>; Fri, 15 Aug 2025 17:55:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1umwmC-0004qL-Oq; Fri, 15 Aug 2025 15:55:32 +0000
Received: from smtpd2.iitb.ac.in ([103.21.126.57] helo=smtp1.iitb.ac.in)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <akhilesh@ee.iitb.ac.in>)
 id 1umllt-0002xG-Rn
 for apparmor@lists.ubuntu.com; Fri, 15 Aug 2025 04:10:30 +0000
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
 by smtp1.iitb.ac.in (Postfix) with SMTP id BF7781018FEB
 for <apparmor@lists.ubuntu.com>; Fri, 15 Aug 2025 09:40:25 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in BF7781018FEB
Received: (qmail 10064 invoked by uid 510); 15 Aug 2025 09:40:25 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from
 <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 2.190701 secs;
 15 Aug 2025 09:40:25 +0530
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on ldns1.iitb.ac.in
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=IITB_ORIG,PROPER_IITB_MSGID,
 T_RP_MATCHES_RCVD autolearn=disabled version=3.4.1
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
 by ldns1.iitb.ac.in with SMTP; 15 Aug 2025 09:40:23 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
 by ldns1.iitb.ac.in (Postfix) with ESMTP id F0F9236003E;
 Fri, 15 Aug 2025 09:40:22 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
 (Authenticated sender: akhilesh)
 by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id C2BBA1E813F8;
 Fri, 15 Aug 2025 09:40:22 +0530 (IST)
Date: Fri, 15 Aug 2025 09:40:18 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
Message-ID: <aJ6zKriNeoM4B/km@bhairav-test.ee.iitb.ac.in>
References: <20250814165403.616195-1-chandramohan.explore@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814165403.616195-1-chandramohan.explore@gmail.com>
Received-SPF: pass client-ip=103.21.126.57;
 envelope-from=akhilesh@ee.iitb.ac.in; helo=smtp1.iitb.ac.in
X-Mailman-Approved-At: Fri, 15 Aug 2025 15:55:30 +0000
Subject: Re: [apparmor] [PATCH v2] apparmor: Remove unused value
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
Cc: paul@paul-moore.com, apparmor@lists.ubuntu.com, jmorris@namei.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 shuah@kernel.org, linux-kernel-mentees@lists.linux.dev, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Aug 14, 2025 at 10:24:01PM +0530, Chandra Mohan Sundar wrote:
> The value "new" is being assigned to NULL but that statement does not
> have effect since "new" is being overwritten in the subsequent
> fallback case.
> 
> Remove the unused value. This issue was reported by coverity static
> analyzer.

Hi Chandra. Do you have Coverity ID for this issue ?

Regards,
Akhilesh
> 
> Fixes: a9eb185be84e9 ("apparmor: fix x_table_lookup when stacking is not the first entry")
> Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
> ---
> Changes since v1:
>     Fixed the commit message and Fixes tag message formatting.
> 
>  security/apparmor/domain.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
> index 267da82afb14..9c0c7fa8de46 100644
> --- a/security/apparmor/domain.c
> +++ b/security/apparmor/domain.c
> @@ -592,7 +592,6 @@ static struct aa_label *x_to_label(struct aa_profile *profile,
>  		if (!new || **lookupname != '&')
>  			break;
>  		stack = new;
> -		new = NULL;
>  		fallthrough;	/* to X_NAME */
>  	case AA_X_NAME:
>  		if (xindex & AA_X_CHILD)
> -- 
> 2.43.0
> 
> 


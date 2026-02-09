Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG6FEIYLi2lXPQAAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 10 Feb 2026 11:42:14 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CE6119BB6
	for <lists+apparmor@lfdr.de>; Tue, 10 Feb 2026 11:42:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vplBs-0005wP-Mi; Tue, 10 Feb 2026 10:41:56 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <dan.carpenter@linaro.org>)
 id 1vpNoL-0005Kt-9E
 for apparmor@lists.ubuntu.com; Mon, 09 Feb 2026 09:44:05 +0000
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48327b8350dso22179345e9.1
 for <apparmor@lists.ubuntu.com>; Mon, 09 Feb 2026 01:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770630244; x=1771235044; darn=lists.ubuntu.com;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WCsTGNRwCHOXdV60evM4B/ieoAWEQi135YEapFnAevA=;
 b=SDcpWhzBdTABdQEBjVrT0S52uCHLgnElDwx5MgfSNROBtGEYhLbBx34ikJnDfJQZTm
 T1RYp2crE/WS4LsiciRIQ3USyW4w8mrkrQpVOBU9/1z+4KbJGHWKUQLWhVD99UydTngv
 DhW/LAgbT2eJxy9AqW0eDJ6PJHPEThvse1ZwWgXMC+Cniqx60cOcdxnhqtGLZwzVYakE
 qm1BpmPfFCoUR9OkaNmhsP+oSGKGSSnYX+rtgFH1ZIqYmJ3Pn9+8W2cxtVwFiLn1e/Hc
 3dUgP0NNw4QW8wgBCTdZMFbV9td1gUEyNf4spMrPmzfrZidxazAx7lTqcfaapFLn33Vu
 l56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770630244; x=1771235044;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WCsTGNRwCHOXdV60evM4B/ieoAWEQi135YEapFnAevA=;
 b=sGwi2quS6QIoXLSRWguIFgO/d4UDnYPM+iec/Dqh4J27doleVADk25tZl2lvlvwHB0
 SsnlY10PYmi3xLLDa1FhXJo4022zR5xGXoedCK0Gu94OGsWKkJnbiCgIFl/zB+oyIw30
 R7FTx95q+JLJFxcfvch4nGDU8cS/Ni25Gel88b+tIAK7J2aVKvhHihDLZvhY4BqpAJ9H
 GcfJsGSoW6cGVlofDY1sF0kJtFAlVteanu91pKWTGtVBf+AxCnleb9pBbgRi4R55jxJe
 k+bMBdR1zDEhxvVwKBI5n9Bszaiv0pg0iQ8dlAypnw6CLnHTbcxBRBuatDBsPskU7pQe
 0ELw==
X-Gm-Message-State: AOJu0Yzhtih0H1gLE5B5GhBsPxuawUcCmvRZxQwoMcRvyMZX+oGuk/TB
 Q1dF7IT+CGQnv6fox6d2whcZJ/howYqiDHdt5f3esII9e/krep39MKP/j3A1BDaMdjKmKndy12D
 WEEBg
X-Gm-Gg: AZuq6aL6u+L/AofwSz/ef0CCQ71obgtYA3q2/kEKri8ail8JwHw5lI+o7iz4XXkxq7A
 AZO38XOYbYxzep/1g0yfI7nPrOwKrJaeqB+/bgkTRl6O+H/DNMDB441Ul7ECn/q1Sir8K0Z2+s4
 SUOf8G0uYps/XJSI5V99stN3ezD4g4JZF7t30eYZZiWBX6cOIDZCVL2ZrHzE289MG+9/ZaKXSAA
 /PmJzyfryhITylAMdJnpw8ryPRUfrZpiomR0PtBiM/rvtqRAoUtkv2WVjU9YALM0+5pntRFKLM3
 ikpL3BQiiYRZJVs9YZh6OveAJmRmi/0SelUGDzx19qHJfui+tdkrI2EG0FacJCJT+miKnqar/Qa
 cbwLGovDILTyYog1fDSk26LheRDnJ0P1y4B/EC2v0qUfdR4+wXm8GR4V0hi99PUjj7IGFvcUWh+
 UFplSNxJ0i/8KzrzaH
X-Received: by 2002:a05:600c:6290:b0:47e:e78a:c834 with SMTP id
 5b1f17b1804b1-48320226676mr171207675e9.34.1770630244378; 
 Mon, 09 Feb 2026 01:44:04 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d2ba61sm480009135e9.1.2026.02.09.01.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 01:44:03 -0800 (PST)
Date: Mon, 9 Feb 2026 12:44:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <aYmsYRgv3VClpkjX@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
Received-SPF: pass client-ip=209.85.128.53;
 envelope-from=dan.carpenter@linaro.org; helo=mail-wm1-f53.google.com
X-Mailman-Approved-At: Tue, 10 Feb 2026 10:41:55 +0000
Subject: [apparmor] [bug report] apparmor: add support loading per
	permission tagging
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	DATE_IN_PAST(1.00)[24];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,apparmor-bounces@lists.ubuntu.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: E7CE6119BB6
X-Rspamd-Action: no action

[ Smatch checking is paused while we raise funding. #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello John Johansen,

Commit 3d28e2397af7 ("apparmor: add support loading per permission
tagging") from Apr 1, 2025 (linux-next), leads to the following
Smatch static checker warning:

	security/apparmor/policy_unpack.c:966 unpack_pdb()
	warn: unsigned 'unpack_tags(e, &pdb->tags, info)' is never less than zero.

security/apparmor/policy_unpack.c
    951 static int unpack_pdb(struct aa_ext *e, struct aa_policydb **policy,
    952                       bool required_dfa, bool required_trans,
    953                       const char **info)
    954 {
    955         struct aa_policydb *pdb;
    956         void *pos = e->pos;
    957         int i, flags, error = -EPROTO;
    958         ssize_t size;
    959         u32 version = 0;
    960 
    961         pdb = aa_alloc_pdb(GFP_KERNEL);
    962         if (!pdb)
    963                 return -ENOMEM;
    964 
    965         AA_DEBUG(DEBUG_UNPACK, "unpacking tags");
--> 966         if (unpack_tags(e, &pdb->tags, info) < 0)
                    ^^^^^^^^^^^
Signedness bug.  unpack_tags() is unsigned.

    967                 goto fail;
    968         AA_DEBUG(DEBUG_UNPACK, "done unpacking tags");
    969 
    970         size = unpack_perms_table(e, &pdb->perms);
    971         if (size < 0) {
    972                 error = size;
    973                 pdb->perms = NULL;

regards,
dan carpenter


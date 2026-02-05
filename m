Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JJ0NJzuhGkU6wMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Thu, 05 Feb 2026 20:25:16 +0100
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB08F6D2A
	for <lists+apparmor@lfdr.de>; Thu, 05 Feb 2026 20:25:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vo4yO-0001N1-O1; Thu, 05 Feb 2026 19:25:04 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <amir73il@gmail.com>)
 id 1vnvvs-0007Nl-9x
 for apparmor@lists.ubuntu.com; Thu, 05 Feb 2026 09:45:52 +0000
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6582e8831aeso1211172a12.1
 for <apparmor@lists.ubuntu.com>; Thu, 05 Feb 2026 01:45:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770284751; cv=none;
 d=google.com; s=arc-20240605;
 b=MOxhrniVSoIVPXy9a0Qy6VLt69BO/Jx3RZuwbX4clsPiEIVYKXOnO9qRiMQPD3C1oN
 x+r3/mx2fAWcsY+pxXiScMi0+N6tc6cetXD+dZIfYphuJar8RTRipGS8KOsiHlpEAXY1
 OfhebVjgK287FyQDDWxT0huXW/6ERsN4BRx0rNLpw2ds0k7XZ4KFQOlakDAcdQXA70w/
 n1fe5j1U/Uk2bLPReHqsYT9v9+zgE/eHj+S3lLGuMO/Sltgl5CehW7zF96hzXSOEC5RS
 KTEdlDCgvmk9pWmeAuYwbgWjgkM8LZsmS7ylrTv3yIokxu7A6f89xLCz8ZHShlVl1PX+
 DBbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=gTHjRNg48uqIhlFUjNVy6w29gFOiVNhUd1etS9WljNU=;
 fh=BX8oe7ein1RwY3Ah6a4W11hXtKfuEiWdcOm2up39/UE=;
 b=XmBEwWZU2rjZjevOTB/49uKWSzy0wqL/5H/bQL0LouuxHF+847v01tfOawPaPTE4qh
 gBlHaipl1asNDYVuEm7vYw2fDgJHcAFKe0TSpImNQi1ftVjQpjShOgiVkYRabsWyrDwL
 IbxECgxw6q26mS3gWvm3UmCsfl45ZJteEvxHRwWcyrRZ/vH38JpT9F8uiFI/sHaLeGg6
 yyclbzucFRvNoF1D6fVbyEJNp2REIq3jFvHIVItpNtKoNviXB65RTvWhfSTLuQqKl/Km
 LqPsZA4K8pGE3oinw8sTFH3DyZXOqKiBOYLcdc0VhjhfeqeagfcADi2SJRiN/wlbXQRG
 CTuQ==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770284751; x=1770889551; darn=lists.ubuntu.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gTHjRNg48uqIhlFUjNVy6w29gFOiVNhUd1etS9WljNU=;
 b=HQ5meKor1XLOWO2i/YGuWkAk4Ct9Sx+6EdwOwzYWZarMVvv6LDrI3xTXcKcrMA5XOj
 5ZvsadyFnKyDe/VU3gXpw4NvkfrifCXQ5ovyCjbS/EBBgLVBOWCSSUsVGJGkgyz6iwQ6
 snEL5t0zxcsi+II8IPckuhy0Sf1ny2l5HWXnl11+3DwgPXDSRC6toT8NAqPUUk3qKbav
 e2Rs+nJlrR5RbXgu4u8ZhS0J1gNio9WFcIihCvL+BT3B9y793YcXDRvoJOfcXC/m5Yu6
 zTFQ7jOwZi7uEnME7pb+zw5iCE7P1EPQ9ALtSe14TFmOgXR2dlxlSk19W0rqNTkymuCL
 IPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770284751; x=1770889551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gTHjRNg48uqIhlFUjNVy6w29gFOiVNhUd1etS9WljNU=;
 b=wcRDiHHvb9QYhsE2vYi38+OcAiYNatyMELOZvTZjieL5a+BfwePGFkkiBzEYjA8dlB
 xR0IBhtPRfKOvwuoKfY3xxjkePjW7rht4+n1U8XyeA1+UNp1LeJFk2xUHqYHvlliUEFC
 TErnNyRterXGJurheflnBTrSBE/IbiA/D9Pq3f7S1PW4jCFBiOXlngg+F4A/7lxbmo30
 EQavzXyK9gdfpYfEniYEssOIg4ca9OI2qgDN7/2X84GP9R2nmMvnAx1NpvtE9Vp2E3C+
 YOk1ijmmXC9Ig59m1dCLzAFJqTUKc4D9e0WVUjvQnWNJdc8KDT4voxBLo245R99j3OTA
 2fpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFzsMbVPQikKtipvjmjS9uXvSbAoi9YykiotUyvvgrei9aqqGL9rQ7P4GZq+9XErREKVVRXjRlOw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yzta8CK+1Gb1lZs6nHBdaRknd6Ak+ZyPBPlKjXChyBbwihbJGPY
 LugweFZ3JD8iwiGSZfQrZmZ6NUztHXI2dqFq/iWJ5Gs7GZ68SJ4FWTI8Ix7U5QT+kihFb9HOFIg
 ELV8IhvLRlZp+IkICISVpJFIiSkY9ezw=
X-Gm-Gg: AZuq6aIqkB1I2ZC7unLQHq5Qav3Jcarh+vWRYMTWgwvRV/AnJvRw1HIXpCK+lrggAa8
 zlBmRscLQ2bNY3ovhpw+lOqvc0P5sFE6X9fUv2wNgOWY++RsOC7NsyRTCq+jHuxHgEQ2YIWQQFm
 gvDVbevIs7Q6fhHvu8UtiDo7GIwhgT1H4ZVla7funFpOvsGeUnUz90Zm4DaOy99EnWtwQhMHuZV
 vvdSIbSOsa030gdOqFd7GrIhAg/AoKYIZVfYzooVoRX/MworKw/FZjVDl0ybBdPOvkw5UkVlhum
 TT07278e8XhczcwnlK0A/OvxjxKkjg==
X-Received: by 2002:a17:907:7f92:b0:b87:31d1:4131 with SMTP id
 a640c23a62f3a-b8e9f64603cmr435430866b.60.1770284751163; Thu, 05 Feb 2026
 01:45:51 -0800 (PST)
MIME-Version: 1.0
References: <20260204050726.177283-1-neilb@ownmail.net>
 <20260204050726.177283-13-neilb@ownmail.net>
In-Reply-To: <20260204050726.177283-13-neilb@ownmail.net>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 5 Feb 2026 10:45:38 +0100
X-Gm-Features: AZwV_Qg7CM-kXxjB2Qin-euJkaOUd7ni190R_n_ZLhun34eHr5T-i9uF6CbqXdo
Message-ID: <CAOQ4uxi3bNYq1b4=qL-JLi19hRwurntfLZXhUMVL003NarBdGg@mail.gmail.com>
To: NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.49; envelope-from=amir73il@gmail.com;
 helo=mail-ed1-f49.google.com
X-Mailman-Approved-At: Thu, 05 Feb 2026 19:25:00 +0000
Subject: Re: [apparmor] [PATCH 12/13] ovl: remove ovl_lock_rename_workdir()
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Paul Moore <paul@paul-moore.com>, Miklos Szeredi <miklos@szeredi.hu>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, James Morris <jmorris@namei.org>,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 linux-security-module@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, linux-unionfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil@brown.name,m:brauner@kernel.org,m:jack@suse.cz,m:paul@paul-moore.com,m:miklos@szeredi.hu,m:selinux@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:stephen.smalley.work@gmail.com,m:jlayton@kernel.org,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:linux-security-module@vger.kernel.org,m:chuck.lever@oracle.com,m:viro@zeniv.linux.org.uk,m:linux-fsdevel@vger.kernel.org,m:netfs@lists.linux.dev,m:linux-unionfs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:serge@hallyn.com,m:stephensmalleywork@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[amir73il@gmail.com,apparmor-bounces@lists.ubuntu.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amir73il@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[kernel.org,suse.cz,paul-moore.com,szeredi.hu,vger.kernel.org,lists.ubuntu.com,gmail.com,namei.org,redhat.com,oracle.com,zeniv.linux.org.uk,lists.linux.dev,hallyn.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[brown.name:email,mail.gmail.com:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: 8CB08F6D2A
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 6:09=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote:
>
> From: NeilBrown <neil@brown.name>
>
> This function is unused.
>

I am confused.
What was this "fix" fixing an unused function:

e9c70084a64e5 ovl: fail ovl_lock_rename_workdir() if either target is unhas=
hed

What am I missing?

Otherwise, feel free to add:

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks,
Amir.


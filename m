Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 989AB6B370A
	for <lists+apparmor@lfdr.de>; Fri, 10 Mar 2023 08:01:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1paWky-0005NR-D3; Fri, 10 Mar 2023 07:01:36 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <mcgrof@infradead.org>) id 1paWkw-0005ND-AT
 for apparmor@lists.ubuntu.com; Fri, 10 Mar 2023 07:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0N+SCtcY/k9CimqgVMe/YX4md4YEbNQzEDvTCcqt4bw=; b=TbHcAKwtP7qVQnyr4M3BCyYIa9
 /0zMoVu1Ym18t94ZPKH+tFOvb05xiFTdpVwC6jwn/i8aWIfnathj3m2nd+Fz/WuY6K+sj1gnbIrJw
 PLDE5rtBFWDjO8xqpWgtSV+v7c/cZooSVNk+OWZnYWUfuOpDR7H3LV29R6TOwEN1+8fpgTxENcRrN
 Vk5E2dz3TZTGLbzB/xxNiLvMzRNND6Xb1fYjLRDR9K5vOZvqInK/MTtgg8RzRwvLq61MMSRU8Kksp
 qm2jVnkmnbSN62TJt7mvrf5Uw2cddBqIVlrEL4EqgGEdcmBpFlQAduFI+Hsk2g1cx0r2tLMgsSepe
 DNHJzz+A==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1paWkT-00DKkw-B4; Fri, 10 Mar 2023 07:01:05 +0000
Date: Thu, 9 Mar 2023 23:01:05 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <ZArVscnCxYfZXwLR@bombadil.infradead.org>
References: <20230302202826.776286-1-mcgrof@kernel.org>
 <20230302202826.776286-12-mcgrof@kernel.org>
 <ZAqvQ57PmdDoNo+F@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAqvQ57PmdDoNo+F@sol.localdomain>
Subject: Re: [apparmor] [PATCH 11/11] proc_sysctl: deprecate
	register_sysctl_paths()
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
Cc: j.granados@samsung.com, jeffxu@google.com, guoren@kernel.org,
 linux-csky@vger.kernel.org, dverkamp@chromium.org, baihaowen@meizu.com,
 paul@paul-moore.com, jmorris@namei.org, willy@infradead.org,
 zhangpeng362@huawei.com, yzaikin@google.com, serge@hallyn.com,
 keescook@chromium.org, paulmck@kernel.org, linux-kernel@vger.kernel.org,
 frederic@kernel.org, apparmor@lists.ubuntu.com, wad@chromium.org,
 nixiaoming@huawei.com, tytso@mit.edu, sujiaxun@uniontech.com,
 tangmeng@uniontech.com, patches@lists.linux.dev, luto@amacapital.net,
 linux-security-module@vger.kernel.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Mar 09, 2023 at 08:17:07PM -0800, Eric Biggers wrote:
> On Thu, Mar 02, 2023 at 12:28:26PM -0800, Luis Chamberlain wrote:
> > diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
> > index 780690dc08cd..e8459fc56b50 100644
> > --- a/include/linux/sysctl.h
> > +++ b/include/linux/sysctl.h
> > @@ -221,13 +221,8 @@ extern void retire_sysctl_set(struct ctl_table_set *set);
> >  struct ctl_table_header *__register_sysctl_table(
> >  	struct ctl_table_set *set,
> >  	const char *path, struct ctl_table *table);
> > -struct ctl_table_header *__register_sysctl_paths(
> > -	struct ctl_table_set *set,
> > -	const struct ctl_path *path, struct ctl_table *table);
> >  struct ctl_table_header *register_sysctl(const char *path, struct ctl_table *table);
> >  struct ctl_table_header *register_sysctl_table(struct ctl_table * table);
> > -struct ctl_table_header *register_sysctl_paths(const struct ctl_path *path,
> > -						struct ctl_table *table);
> >  
> >  void unregister_sysctl_table(struct ctl_table_header * table);
> >  
> > @@ -277,12 +272,6 @@ static inline struct ctl_table_header *register_sysctl_mount_point(const char *p
> >  	return NULL;
> >  }
> >  
> > -static inline struct ctl_table_header *register_sysctl_paths(
> > -			const struct ctl_path *path, struct ctl_table *table)
> > -{
> > -	return NULL;
> > -}
> > -
> 
> Seems that this patch should be titled "remove register_sysctl_paths()", not
> "deprecate register_sysctl_paths()"?

Good call! Will adjust.

  Luis


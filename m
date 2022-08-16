Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B9247596CFE
	for <lists+apparmor@lfdr.de>; Wed, 17 Aug 2022 12:50:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oOGdG-0004tE-MB; Wed, 17 Aug 2022 10:50:42 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <torvalds@linuxfoundation.org>) id 1oO5hA-0004Y0-D4
 for apparmor@lists.ubuntu.com; Tue, 16 Aug 2022 23:10:00 +0000
Received: by mail-ed1-f46.google.com with SMTP id w3so15407013edc.2
 for <apparmor@lists.ubuntu.com>; Tue, 16 Aug 2022 16:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=AMn3B3jYdCVxak8yksa8T7jS8rFLGuSxkkP5+8axw1A=;
 b=Vm9rZhcUXu8DUu2U13LfpsCp0dP7Fg/9rAJeZp9YtlQ9Rq7Y9VtHRIc4gUGBrf6ABe
 +ZW0OMEq5BRJFyJbSJSx/y9p2lZo+15ohYnjJN9vM+Oe2v51uKNkPu3wDgexSVnVScq8
 +r2XB8pHGFS6YRv4syJ3wdNKjMUHxv1d12zww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=AMn3B3jYdCVxak8yksa8T7jS8rFLGuSxkkP5+8axw1A=;
 b=2VMM3+BNCN6qXIaNwm5UQcQ0A2ybTg5Z8Jo87q+Oosy5h+STGazGm8Kpotzrkhgyhe
 I1jzQcvbIuwAmYou75ZypnK8EbFrelDgeLW7hooaKrBBEjsHEAtwEl/QIREHLb/iFHri
 /C6pn2jxw3J7cUCPVpTuvHZai9bsBClQvrDve5M7ue3pdNp7oajUa4m/hkxKcPE9+FLY
 W+ytwVNLWdkDY8xFHs/aJpRqilZHy4UAaJN1Xbo381KjFKv4MxyI/QSGjHXDM8V4KCAj
 pyJwRcuB+aAsJH9CqJtuA/VEBBpU2PUwklka4YujJBJzgOV8YhO2qUmF5pN1Cu22visc
 l/Pw==
X-Gm-Message-State: ACgBeo3WJcLJrBGkAQzuqgeqQVXcaUOUyHligpOc8uS2sOy+O6yE/uH6
 v99hrE61Flvtlucwd+QcVuWymqAnyyCl4n454KY=
X-Google-Smtp-Source: AA6agR4bzP1xiDVOWIMiuMU2ucBzZoSisVqdXPYpbAxX+MZvWbGeutSgLgN8fdGXLCKH0Lh7iNLJLw==
X-Received: by 2002:a05:6402:348f:b0:43d:e568:97bd with SMTP id
 v15-20020a056402348f00b0043de56897bdmr20223731edc.279.1660691399777; 
 Tue, 16 Aug 2022 16:09:59 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 ot3-20020a170906ccc300b0072ab06bf296sm5835509ejb.23.2022.08.16.16.09.58
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 16:09:59 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id
 r83-20020a1c4456000000b003a5cb389944so144899wma.4
 for <apparmor@lists.ubuntu.com>; Tue, 16 Aug 2022 16:09:58 -0700 (PDT)
X-Received: by 2002:a05:600c:2195:b0:3a6:b3c:c100 with SMTP id
 e21-20020a05600c219500b003a60b3cc100mr383338wme.8.1660691398572; Tue, 16 Aug
 2022 16:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <YvvBs+7YUcrzwV1a@ZenIV>
 <CAHk-=wgkNwDikLfEkqLxCWR=pLi1rbPZ5eyE8FbfmXP2=r3qcw@mail.gmail.com>
 <Yvvr447B+mqbZAoe@casper.infradead.org>
 <b05cf115-e329-3c4f-dee5-e0d4f61b4cd5@schaufler-ca.com>
In-Reply-To: <b05cf115-e329-3c4f-dee5-e0d4f61b4cd5@schaufler-ca.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Aug 2022 16:09:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiRs8k0pKy36cXYnBFVCJDP5DQMf6JM7FnRJz5tF4cMBA@mail.gmail.com>
Message-ID: <CAHk-=wiRs8k0pKy36cXYnBFVCJDP5DQMf6JM7FnRJz5tF4cMBA@mail.gmail.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 17 Aug 2022 10:50:40 +0000
Subject: Re: [apparmor] Switching to iterate_shared
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
Cc: jfs-discussion@lists.sourceforge.net, Hans de Goede <hdegoede@redhat.com>,
 devel@lists.orangefs.org, apparmor@lists.ubuntu.com,
 linux-unionfs@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 codalist@coda.cs.cmu.edu, coda@cs.cmu.edu,
 linux-security-module@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>, Namjae Jeon <linkinjeon@kernel.org>,
 ocfs2-devel@oss.oracle.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Tue, Aug 16, 2022 at 3:30 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Smack passes all tests and seems perfectly content with the change.
> I can't say that the tests stress this interface.

All the security filesystems really seem to boil down to just calling
that 'proc_pident_readdir()' function with different sets of 'const
struct pid_entry' arrays.

And all that does is to make sure the pidents are filled in by that
proc_fill_cache(), which basically does a filename lookup.

And a filename lookup *already* has to be able to handle being called
in parallel, because that's how filename lookup works:

  [.. miss in dcache ..]
  lookup_slow ->
      inode_lock_shared(dir);
      __lookup_slow -> does the
      inode_unlock_shared(dir);

so as long as the proc_fill_cache() handles the d_in_lookup()
situation correctly (where we serialize on one single _name_ in the
directory), that should all be good.

And proc_fill_cache() does indeed seem to handle it right - and if it
didn't, it would be fundamentally racy with regular lookups - so I
think all those security layer proc_##LSM##_attr_dir_iterate cases can
be moved over to iterate_shared with no code change.

But again, maybe there's something really subtle I'm overlooking. Or
maybe not something subtle at all, and I'm just missing a big honking
issue.

            Linus


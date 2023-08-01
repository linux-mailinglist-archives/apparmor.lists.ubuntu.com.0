Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDE776B73C
	for <lists+apparmor@lfdr.de>; Tue,  1 Aug 2023 16:22:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qQqGV-0005LB-9k; Tue, 01 Aug 2023 14:22:23 +0000
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <alexei.starovoitov@gmail.com>) id 1qQdU2-0008GC-UR
 for apparmor@lists.ubuntu.com; Tue, 01 Aug 2023 00:43:31 +0000
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-686f090316dso3385080b3a.2
 for <apparmor@lists.ubuntu.com>; Mon, 31 Jul 2023 17:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690850609; x=1691455409;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bhtZuHVuD/5ejYMblEMyj6RnAY5Q/SWusGE7WOY4wLk=;
 b=RVDofTb81vwCNbApr9KlLqeCll9uBMlfud/WfmddUfEN0IK3PpETDcLv6Q8CrKqyGc
 vrGsvn3wQYftFQ8P0nKXwzd4g/jbOqkt02t1/eY0RzKfpUTztKsHrxEJfGaUvEBoHnza
 8oTL79e6ngOzRjUfNCcKD6awElo7WX7j9wnSP+2/XEusL/SbKzOD9YZ6R9Pc63GOWq3W
 9s8APfiP/DHZEct6jOAEcxB3S5B93mptSEUqVTSi7uPzc6ZDsZP3Fv9AJK/bqsY+UKeS
 xTw0ePYHH/dpFa9JmYBlfnqooLGD7NQpLva3ftfWSoB7LC/7+CUIcaXZ95Up8LkDp0I9
 esNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690850609; x=1691455409;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bhtZuHVuD/5ejYMblEMyj6RnAY5Q/SWusGE7WOY4wLk=;
 b=B0LeSrNGPDdJEzMqWD9hQdXr0L9pS2WdG5Jx0iIjytMtl6A3HO5PB8v2cQ1mDRJU10
 1zoK5cSAIUn0jixVpRD+uVCovdJdWv8HXPOzgn84ZPFU701vyT6RpBYDhT51efko4MuC
 RID2ity0LjeG60KM+sazqHLBs/rDvLErYZjmNV6ngiJzXKE6m/RokDS8YbOtgJ1FFZPd
 OX2EYd5hYR4+DALO6eb3qETRAHD3yBOg3nDbo/9LEOOxU1G4O9LhmISPdISWYa0/gynd
 gANmBCt/atVMbjAALtSRBXo3Yu57fQxWTrN/YjsNEv/jFkxONFP1O8T6Jtc8GohCJyGz
 WP/Q==
X-Gm-Message-State: ABy/qLZmm8fiUmRRHzEsN7zErI1+EJ1tbUChZ27rUkjpnJzpZmasgfis
 mZrczJCaIR7L0ajqVAzaJ3g=
X-Google-Smtp-Source: APBJJlEDasJjNH4eP//Am3nFp4ZsQ53OoZYJ+ckrfSoVwD3WviUA3efisvHN+OOYWAmDO2aQriVD0g==
X-Received: by 2002:a05:6a20:4a06:b0:10f:f672:6e88 with SMTP id
 fr6-20020a056a204a0600b0010ff6726e88mr9441980pzb.4.1690850608691; 
 Mon, 31 Jul 2023 17:43:28 -0700 (PDT)
Received: from MacBook-Pro-8.local ([2620:10d:c090:400::5:6cea])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a637d0f000000b00563b36264besm8688220pgc.85.2023.07.31.17.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 17:43:28 -0700 (PDT)
Date: Mon, 31 Jul 2023 17:43:23 -0700
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: Geliang Tang <geliang.tang@suse.com>
Message-ID: <20230801004323.l2npfegkq3srzff3@MacBook-Pro-8.local>
References: <cover.1690624340.git.geliang.tang@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1690624340.git.geliang.tang@suse.com>
Received-SPF: pass client-ip=209.85.210.180;
 envelope-from=alexei.starovoitov@gmail.com; helo=mail-pf1-f180.google.com
X-Mailman-Approved-At: Tue, 01 Aug 2023 14:22:22 +0000
Subject: Re: [apparmor] [RFC bpf-next v7 0/6] bpf: Force to MPTCP
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
Cc: Alexei Starovoitov <ast@kernel.org>, James Morris <jmorris@namei.org>,
 Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 Paul Moore <paul@paul-moore.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Mat Martineau <martineau@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Florent Revest <revest@chromium.org>, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, KP Singh <kpsingh@kernel.org>,
 Brendan Jackman <jackmanb@chromium.org>, Yonghong Song <yhs@fb.com>,
 Eric Paris <eparis@parisplace.org>, mptcp@lists.linux.dev,
 Hao Luo <haoluo@google.com>, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 linux-security-module@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
 Matthieu Baerts <matthieu.baerts@tessares.net>, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Sat, Jul 29, 2023 at 05:57:21PM +0800, Geliang Tang wrote:
> 
> The main idea is to add a hook in sys_socket() to change the protocol id
> from IPPROTO_TCP (or 0) to IPPROTO_MPTCP.

I still think it's a hack, but its blast radius is nicely contained.
And since I cannot propose any better I'm ok with it.

Patches 1-2 can be squashed into one.
Just like patches 3-6 as a single patch for selftests.

But before proceeding I'd like an explicit ack from netdev maintainers.


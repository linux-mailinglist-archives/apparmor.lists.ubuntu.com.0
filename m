Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E6B76C7F7
	for <lists+apparmor@lfdr.de>; Wed,  2 Aug 2023 10:07:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qR6tD-00064n-QI; Wed, 02 Aug 2023 08:07:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <pabeni@redhat.com>) id 1qR6pG-0005CZ-8f
 for apparmor@lists.ubuntu.com; Wed, 02 Aug 2023 08:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690963401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oo+8dg/DBj2V+G5oZvUMnojMP7aeWCXmA1VlhFSPE34=;
 b=SXn6W5xWy8NeVTte4GPeviFPpf2UqFaOMoJD58BA5unExfin1QiHN7Bx30n2mntnThe6pO
 HKLcdRogmd1E/GpxFp1HLd7N+E4h6iZ3ILh41epV4Gfcyftt4OfQQc73ja1yizO77Mor6r
 PMBYc6c3XwjGlMNrzxJg6jw+RLHAaf4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-vLFLlRWUPpKt_LtF15jY8A-1; Wed, 02 Aug 2023 04:03:20 -0400
X-MC-Unique: vLFLlRWUPpKt_LtF15jY8A-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-76ca3baaec8so76571485a.1
 for <apparmor@lists.ubuntu.com>; Wed, 02 Aug 2023 01:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690963400; x=1691568200;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Oo+8dg/DBj2V+G5oZvUMnojMP7aeWCXmA1VlhFSPE34=;
 b=hCceLpkO0a/5USGrmoYybqaz8eDDRxQUJ3B8rERQekmM1W42gu6LIkXGIVweK8jBt8
 oa9N+fgoZXf/soLAbhkubbeUuX8XCxpFOcekNHpeQcnKuLCZKX0t2FVFLgsrdYMwmw1O
 3AyRDg+cLtTaeeHXuAlCGbcVqcLnZr8jz4CK0bqUiFRogICclSpMxbfQ4kdm2EnOX8Ba
 eAWWyukxkU6+MbDt9yxDMxshzrWZTphgp3KASMQGKsDJJ7+XWOXEgvtgiZYOky7u4xgU
 AzwjAlOVF4ZSlYWfNe6/f7+3kxqSkd1OkAK5zy1jeEbg2lEdobajJ9aBl/iU5qhbAhDi
 ra7w==
X-Gm-Message-State: ABy/qLbNrwhKWh8Ec7cL/uaKAObJDtxApHqF91DOVv0kETDYu92YxCtI
 kaPECmowLbvAeXJyMZlg6+y/2HpPqmJMXGN9nqMOFwSml1yRYlX9pNFn17A4BASTj4lyrH8nis9
 rApw9prz+t1hYEEMb2wNw
X-Received: by 2002:a05:620a:31aa:b0:767:7a4c:1b9e with SMTP id
 bi42-20020a05620a31aa00b007677a4c1b9emr15272975qkb.7.1690963399779; 
 Wed, 02 Aug 2023 01:03:19 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFnNAWWhSXb/HktBSfXGFmabV1fvsy307saOx2MgChsfs7xTXLkVxm9csctRpjZ4apFAXP/zg==
X-Received: by 2002:a05:620a:31aa:b0:767:7a4c:1b9e with SMTP id
 bi42-20020a05620a31aa00b007677a4c1b9emr15272941qkb.7.1690963399461; 
 Wed, 02 Aug 2023 01:03:19 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-233-7.dyn.eolo.it. [146.241.233.7])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05620a132c00b0076c9cc1e107sm3299044qkj.54.2023.08.02.01.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 01:03:18 -0700 (PDT)
Message-ID: <1b51c79c59cb3ec4be95e993be9be2e5d9441670.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Geliang Tang
 <geliang.tang@suse.com>
Date: Wed, 02 Aug 2023 10:03:12 +0200
In-Reply-To: <20230801004323.l2npfegkq3srzff3@MacBook-Pro-8.local>
References: <cover.1690624340.git.geliang.tang@suse.com>
 <20230801004323.l2npfegkq3srzff3@MacBook-Pro-8.local>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 02 Aug 2023 08:07:26 +0000
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
 "Serge E. Hallyn" <serge@hallyn.com>, Florent Revest <revest@chromium.org>,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 KP Singh <kpsingh@kernel.org>, Brendan Jackman <jackmanb@chromium.org>,
 Yonghong Song <yhs@fb.com>, Eric Paris <eparis@parisplace.org>,
 mptcp@lists.linux.dev, Hao Luo <haoluo@google.com>, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 linux-security-module@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
 Matthieu Baerts <matthieu.baerts@tessares.net>, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, 2023-07-31 at 17:43 -0700, Alexei Starovoitov wrote:

> I still think it's a hack, but its blast radius is nicely contained.
> And since I cannot propose any better I'm ok with it.
>=20
> Patches 1-2 can be squashed into one.
> Just like patches 3-6 as a single patch for selftests.
>=20
> But before proceeding I'd like an explicit ack from netdev maintainers.

Just to state the obvious, I carry my personal bias on this topic due
to my background ;)

My perspective is quite similar to Alexei's one: the solution is not
extremely elegant, but is very self-contained; it looks viable to me.

WRT the specific code, I think the additional checks on the 'protocol'
value after the 'update_socket_protocol()' call should be dropped: the
user space can already provide an arbitrary value there and the later
code deal with that.

Cheers,

Paolo



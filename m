Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F5AC8C8CD
	for <lists+apparmor@lfdr.de>; Thu, 27 Nov 2025 02:33:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1vOQsY-0005YK-Ic; Thu, 27 Nov 2025 01:33:02 +0000
Received: from smtp-relay-internal-1.internal ([10.131.114.114]
 helo=smtp-relay-internal-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1vOQsW-0005Xe-6v
 for apparmor@lists.ubuntu.com; Thu, 27 Nov 2025 01:33:00 +0000
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F1AE33F125
 for <apparmor@lists.ubuntu.com>; Thu, 27 Nov 2025 01:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1764207180;
 bh=bHVUgP8TVtYbK/RH59jYqEOFLp2rfeRbE8F3eHfE2h8=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=KSznulbO5R7CwtFn1aVVyZ+zM7sLofTkFM9Myb9JIpUwKooyUKLYieBUasZ2Ab7mp
 UTmfKWKg0Hx5ZMNHG5OU6MIynkbfccW2IV6hjvVdRzXFRVVEGs8MFomuhbPIXxQdLq
 ykEjuARYZxeZ8A+sC0do10w/gG9KLxiBK0XI2/02CncDn0m0WEZemUx57fDpD8Z45r
 HiwTXk+W6l4DIb/0X6KUd7RUDD/em2sILeHlYSJHF0KcK5npGTJ8Q/t41SOXyowdOF
 nUOLwA81oceAMePyGOTjs36xlXqkNaRb/YV0ZuZprIGIhKnJi1voXQlzRrCf1ERe/m
 vLRUfvAHbQ5XqoJ17DkJAsPKuz5kQfB1PYQOZx9XxnXGPiex6g9utjG+4zPl7bpe4H
 CFrbEPFZ7aX+E+vr6l6wqoZBB/Op3pk0kPbdIjWgMhLZ/m760eXzBTUckJ6C1IZKbK
 TTmvtDjM7R7JWWDAW5tviKWUlKi2ZGaEa5EqF+H7u8MPgZCIr1jjZJP7ZgY0Bbv3wT
 OCGwBAiBYplD9GfG5pVUUA1HxTAW+JMjR3zy9E0HpJ/+GkmRsWB6R5mWDOh9nPsTXI
 0VGAa71wUCtgdYIln7ZTo9HrTmzTke62oYmkEqzFLI6vkvCqf04yUkUhjWNiR5Gse+
 2yr/U/lB1NlOQ8iSVysv48VI=
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-bbcf3bd4c8fso235648a12.0
 for <apparmor@lists.ubuntu.com>; Wed, 26 Nov 2025 17:32:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764207178; x=1764811978;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bHVUgP8TVtYbK/RH59jYqEOFLp2rfeRbE8F3eHfE2h8=;
 b=a3eW8iBMGsG1mNveSgTd+W1xk2g0+c2Lt0J0mR5INGT0Rhhry0bHWDWJdXhOHCimEa
 qcf0rFyQnDjKYoHCNMoQgNO3ncw1ob+BGhkM8OvabX6Jg2KTZ5LyC8mmOFF7okMu26le
 fBsPNKw8s9il0Jr3HK1OzZF/Zz6EIn+3bPla//dJOXC8KH6uxSwx2zRLhxA5L7QHtxln
 5xrHC00QWFRKG/6TLIQBmhwy+cx2FGrfOJXRYkrCiEDS6gm6rsBZMu0DGyvrCw4YClCu
 CzSyIeoe1M/78kv6YdGnhc8TSm04GnDdQYci6sElb9QlN87jz9ZBMvq/gI2xSrTLKUwj
 zajg==
X-Gm-Message-State: AOJu0YwXbMZ0XFzq+2TDgD0HL7/IrmnqhhKHovTjiqYwNNFadkinbt/T
 GF2LXE5s67sKhpcv84WSKVaFE1Rq/3jvLjRyhpFglmXaklXXI9ozcPE/B88x+Ep1NYY2vsIBenE
 znw23yuZekBhqnY3deSNbiWIOKCxJvfJqVCt4lRV5DRJyCXFGi2L8G8iTaeV4SqLS5ygc/4p2Vg
 ygGw==
X-Gm-Gg: ASbGncvaFnlABBB4YlbVapFFMIQHqP8DTYvQSgGMEjkR5DzBJ2MaMEb5z9VA2IO3rqw
 1NpkKz68287MmFM3KW9u6s2ibT26Yp+KbBq5QcDROLUf37TyZkEFAbXmPwLpC5jfm/IP8MNl+5i
 V2F3oDrS1j+bkTDncapuJimorBJqTGxCM84LWEZdYmOc8cJ4Smhra9qAVncZGxSbgCJyNarpd5Z
 TpKvPKcad8fr+LyiFouG64/UhonrB9hCuExjomOmLJuaDVZDDSOzk1H3igIZvwTJ27cvuxIK/h9
 7C4ngQ/qpc2r8SRMK0an9zOhS9OATkXna4TwhZMKepFZPMaWiccb05J1waPqFd7F2thnivf2cFT
 wzDara7NwZioCrLXcowOi/9PF
X-Received: by 2002:a05:6a20:734a:b0:348:b6af:5023 with SMTP id
 adf61e73a8af0-3613e3c4f74mr32471018637.10.1764207178381; 
 Wed, 26 Nov 2025 17:32:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9poROxMcqJmE/ZSFgYiynf+n9P/aaj4L9EtwLq9gxjSC4Men5EwCCzbfLvhQxV0VS86hawg==
X-Received: by 2002:a05:6a20:734a:b0:348:b6af:5023 with SMTP id
 adf61e73a8af0-3613e3c4f74mr32470984637.10.1764207177997; 
 Wed, 26 Nov 2025 17:32:57 -0800 (PST)
Received: from [192.168.192.85] ([50.47.129.42])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-be509d58e47sm86462a12.31.2025.11.26.17.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 17:32:57 -0800 (PST)
Message-ID: <1da23c89-dc2c-41cb-8260-098deb8ae917@canonical.com>
Date: Wed, 26 Nov 2025 17:32:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thorsten Blum <thorsten.blum@linux.dev>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
References: <20251126165701.97158-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <20251126165701.97158-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [apparmor] [PATCH RESEND] apparmor: Replace deprecated strcpy
 with memcpy in gen_symlink_name
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
Cc: linux-security-module@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On 11/26/25 08:57, Thorsten Blum wrote:
> strcpy() is deprecated; use memcpy() instead. Unlike strcpy(), memcpy()
> does not copy the NUL terminator from the source string, which would be
> overwritten anyway on every iteration when using strcpy(). snprintf()
> then ensures that 'char *s' is NUL-terminated.
> 
> Replace the hard-coded path length to remove the magic number 6, and add
> a comment explaining the extra 11 bytes.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

hey Thorsten,

sorry I have actually pulled these in, and tested them. I didn't send out
the acks yet because I have another patch that I was waiting on a proper
signed-off-by: on.

I am going to have to pull that one so I can push. I'll add acks now but
the push isn't going to happen for a few hours.

Acked-by: John Johansen <john.johansen@canonical.com>

>   security/apparmor/apparmorfs.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
> index 391a586d0557..4b2752200ce2 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -1602,16 +1602,20 @@ static char *gen_symlink_name(int depth, const char *dirname, const char *fname)
>   {
>   	char *buffer, *s;
>   	int error;
> -	int size = depth * 6 + strlen(dirname) + strlen(fname) + 11;
> +	const char *path = "../../";
> +	size_t path_len = strlen(path);
> +	int size;
>   
> +	/* Extra 11 bytes: "raw_data" (9) + two slashes "//" (2) */
> +	size = depth * path_len + strlen(dirname) + strlen(fname) + 11;
>   	s = buffer = kmalloc(size, GFP_KERNEL);
>   	if (!buffer)
>   		return ERR_PTR(-ENOMEM);
>   
>   	for (; depth > 0; depth--) {
> -		strcpy(s, "../../");
> -		s += 6;
> -		size -= 6;
> +		memcpy(s, path, path_len);
> +		s += path_len;
> +		size -= path_len;
>   	}
>   
>   	error = snprintf(s, size, "raw_data/%s/%s", dirname, fname);




Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id F222CAC36F3
	for <lists+apparmor@lfdr.de>; Sun, 25 May 2025 23:25:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1uJIqV-00008Z-SC; Sun, 25 May 2025 21:25:27 +0000
Received: from smtp-relay-canonical-1.internal ([10.131.114.174]
 helo=smtp-relay-canonical-1.canonical.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <john.johansen@canonical.com>)
 id 1uJIqT-00008J-Cj
 for apparmor@lists.ubuntu.com; Sun, 25 May 2025 21:25:25 +0000
Received: from [192.168.192.85] (unknown [50.39.103.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id AD7C53FF82
 for <apparmor@lists.ubuntu.com>; Sun, 25 May 2025 21:25:24 +0000 (UTC)
Message-ID: <74a4a4c8-cfe0-42e2-af97-f76ce5fb4bed@canonical.com>
Date: Sun, 25 May 2025 14:25:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: apparmor@lists.ubuntu.com
References: <20250416224209.904863-1-gabriel.totev@zetier.com>
 <cddd7197-4286-4e44-b143-88fdc263c631@canonical.com>
 <DA0H1BQ9UO2G.3ATO7SJM7L25X@gabriel.zetier.com>
 <1f65cd38-4688-45bf-950d-2e8fba6c9fa0@canonical.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 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 lT9Q
Organization: Canonical
In-Reply-To: <1f65cd38-4688-45bf-950d-2e8fba6c9fa0@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [apparmor] [PATCH 1/2] apparmor: shift ouid when mediating hard
 links in userns
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

On 5/24/25 16:16, John Johansen wrote:
> On 5/19/25 14:56, Gabriel Totev wrote:
>> On Sat May 17, 2025 at 4:40 AM EDT, John Johansen wrote:
>>> On 4/16/25 15:42, Gabriel Totev wrote:
>>>> When using AppArmor profiles inside an unprivileged container,
>>>> the link operation observes an unshifted ouid.
>>>> (tested with LXD and Incus)
>>>>
>>>> For example, root inside container and uid 1000000 outside, with
>>>> `owner /root/link l,` profile entry for ln:
>>>>
>>>> /root$ touch chain && ln chain link
>>>> ==> dmesg
>>>> apparmor="DENIED" operation="link" class="file"
>>>> namespace="root//lxd-feet_<var-snap-lxd-common-lxd>" profile="linkit"
>>>> name="/root/link" pid=1655 comm="ln" requested_mask="l" denied_mask="l"
>>>> fsuid=1000000 ouid=0 [<== should be 1000000] target="/root/chain"
>>>>
>>>> Fix by mapping inode uid of old_dentry in aa_path_link() rather than
>>>> using it directly, similarly to how it's mapped in __file_path_perm()
>>>> later in the file.
>>>
>>> so unfortunately this isn't correct. Yes some mapping needs to be
>>> done but it needs to be relative to different policy namespaces. I
>>> need to spend some time on this
>>

So I think what I am going to do, is pull this in and work on a fix on
top of it. This would at least get us consistent, and mostly right for
the most common use cases and the others are already have difficulties
wrt namespaces atm.

>> Not sure I understand... I based this patch and its sibling on similar
>> code for making path_cond structs from the lsm.c functions:
>> - apparmor_path_rename()
>> - apparmor_file_open()
>> - common_perm_cond()
>> - common_perm_rm()
>>
> yes, unfortunately those patches didn't go through me, and are also bad
> or more correctly bad dependent on the policy.
> 
>> Are hard links (and Unix sockets) different in terms of figuring out the
>> correct uid? Or should all these functions be updated to be relative to
> 
> no
> 
>> policy namespaces? Perhaps they already are and I can't tell? (not sure
>> what this would look like or how uids would be affected)
>>
> yep everything needs to be updated to properly deal with policy namespaces
> and stacking.
> 
>> I'm by no means an AppArmor expert but I'd like to understand and if
>> possible help get this fixed as it prevent Snaps from running correctly
>> in LXD/Incus containers. I've built and tested with these patches and it
>> seems to work: Snaps now don't attract spurious denials and the ouid
>> from my example above gets the correct value of 1000000 rather than 0.
>> However, I can't be totally sure I'm not introducing any regressions or
>> vulnerabilities.
>>
> so it depends on the policy being applied and at what level of the policy
> stack. There is some long term work that needs to be done here. Its a
> bit of a hack but in the short term, I think we can tag each profile with
> the correct user and mount namespace and use that for the mappings here.
> 
> That should work well enough to address the current bug. I need to spend
> some time to do some work on the namespace side, for a longer term fix
> 
>> If there's anything I can do to help with this effort, please let me know!
>>
>>>>
>>>> Signed-off-by: Gabriel Totev <gabriel.totev@zetier.com>
>>>> ---
>>>>    security/apparmor/file.c | 6 ++++--
>>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/security/apparmor/file.c b/security/apparmor/file.c
>>>> index 5c984792cbf0..ecd36199337c 100644
>>>> --- a/security/apparmor/file.c
>>>> +++ b/security/apparmor/file.c
>>>> @@ -430,9 +430,11 @@ int aa_path_link(const struct cred *subj_cred,
>>>>    {
>>>>        struct path link = { .mnt = new_dir->mnt, .dentry = new_dentry };
>>>>        struct path target = { .mnt = new_dir->mnt, .dentry = old_dentry };
>>>> +    struct inode *inode = d_backing_inode(old_dentry);
>>>> +    vfsuid_t vfsuid = i_uid_into_vfsuid(mnt_idmap(target.mnt), inode);
>>>>        struct path_cond cond = {
>>>> -        d_backing_inode(old_dentry)->i_uid,
>>>> -        d_backing_inode(old_dentry)->i_mode
>>>> +        .uid = vfsuid_into_kuid(vfsuid),
>>>> +        .mode = inode->i_mode,
>>>>        };
>>>>        char *buffer = NULL, *buffer2 = NULL;
>>>>        struct aa_profile *profile;
>>
> 
> 



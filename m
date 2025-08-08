Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E21B1F634
	for <lists+apparmor@lfdr.de>; Sat,  9 Aug 2025 22:37:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ukqJC-0005Md-M9; Sat, 09 Aug 2025 20:36:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <sashal@kernel.org>) id 1ukPAh-0001g6-RX
 for apparmor@lists.ubuntu.com; Fri, 08 Aug 2025 15:38:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 458575C6956;
 Fri,  8 Aug 2025 15:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB241C4CEED;
 Fri,  8 Aug 2025 15:30:56 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Date: Fri,  8 Aug 2025 11:30:41 -0400
Message-Id: <20250808153054.1250675-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=sashal@kernel.org;
 helo=dfw.source.kernel.org
X-Mailman-Approved-At: Sat, 09 Aug 2025 20:36:53 +0000
Subject: [apparmor] [PATCH AUTOSEL 6.16-6.6] apparmor: shift ouid when
	mediating hard links in userns
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
Cc: Sasha Levin <sashal@kernel.org>, apparmor@lists.ubuntu.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

From: Gabriel Totev <gabriel.totev@zetier.com>

[ Upstream commit c5bf96d20fd787e4909b755de4705d52f3458836 ]

When using AppArmor profiles inside an unprivileged container,
the link operation observes an unshifted ouid.
(tested with LXD and Incus)

For example, root inside container and uid 1000000 outside, with
`owner /root/link l,` profile entry for ln:

/root$ touch chain && ln chain link
==> dmesg
apparmor="DENIED" operation="link" class="file"
namespace="root//lxd-feet_<var-snap-lxd-common-lxd>" profile="linkit"
name="/root/link" pid=1655 comm="ln" requested_mask="l" denied_mask="l"
fsuid=1000000 ouid=0 [<== should be 1000000] target="/root/chain"

Fix by mapping inode uid of old_dentry in aa_path_link() rather than
using it directly, similarly to how it's mapped in __file_path_perm()
later in the file.

Signed-off-by: Gabriel Totev <gabriel.totev@zetier.com>
Signed-off-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Clear Bug Fix**: This fixes a real bug where AppArmor incorrectly
   reports the unshifted uid when mediating hard link operations inside
   user namespaces/containers. The commit message provides a concrete
   example showing ouid=0 instead of the expected ouid=1000000 in
   container logs.

2. **Security Impact**: This is a security-relevant bug that causes
   AppArmor policy enforcement to behave incorrectly in containerized
   environments. The owner-based AppArmor rules (like `owner /root/link
   l,`) won't work correctly because the uid comparison is done with the
   wrong (unshifted) value.

3. **Minimal and Contained Fix**: The change is small and surgical - it
   only modifies the aa_path_link() function to properly map the inode
   uid through the mount's idmapping, following the exact same pattern
   already used in __file_path_perm():
   - Uses `i_uid_into_vfsuid(mnt_idmap(target.mnt), inode)` to get the
     vfsuid
   - Converts it back with `vfsuid_into_kuid(vfsuid)` for the path_cond
     structure

4. **No New Features or Architecture Changes**: This is purely a bug fix
   that makes aa_path_link() consistent with how __file_path_perm()
   already handles uid mapping. No new functionality is added.

5. **Container/User Namespace Compatibility**: With the widespread use
   of containers (LXD, Incus, Docker with userns), this bug affects many
   production systems. The fix ensures AppArmor policies work correctly
   in these environments.

6. **Low Risk**: The change follows an established pattern in the
   codebase (from __file_path_perm) and only affects the specific case
   of hard link permission checks in user namespaces. The risk of
   regression is minimal.

7. **Clear Testing**: The commit message indicates this was tested with
   LXD and Incus containers, showing the issue is reproducible and the
   fix validated.

The code change is straightforward - replacing direct access to
`d_backing_inode(old_dentry)->i_uid` with proper idmapping-aware
conversion that respects user namespace uid shifts. This makes
aa_path_link() consistent with other AppArmor file operations that
already handle idmapped mounts correctly.

 security/apparmor/file.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/file.c b/security/apparmor/file.c
index d52a5b14dad4..62bc46e03758 100644
--- a/security/apparmor/file.c
+++ b/security/apparmor/file.c
@@ -423,9 +423,11 @@ int aa_path_link(const struct cred *subj_cred,
 {
 	struct path link = { .mnt = new_dir->mnt, .dentry = new_dentry };
 	struct path target = { .mnt = new_dir->mnt, .dentry = old_dentry };
+	struct inode *inode = d_backing_inode(old_dentry);
+	vfsuid_t vfsuid = i_uid_into_vfsuid(mnt_idmap(target.mnt), inode);
 	struct path_cond cond = {
-		d_backing_inode(old_dentry)->i_uid,
-		d_backing_inode(old_dentry)->i_mode
+		.uid = vfsuid_into_kuid(vfsuid),
+		.mode = inode->i_mode,
 	};
 	char *buffer = NULL, *buffer2 = NULL;
 	struct aa_profile *profile;
-- 
2.39.5



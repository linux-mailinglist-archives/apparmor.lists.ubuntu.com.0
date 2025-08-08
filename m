Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F56FB1F635
	for <lists+apparmor@lfdr.de>; Sat,  9 Aug 2025 22:37:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1ukqJC-0005Ml-Rj; Sat, 09 Aug 2025 20:36:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
 by lists.ubuntu.com with esmtp (Exim 4.86_2)
 (envelope-from <sashal@kernel.org>) id 1ukPBK-0001si-SW
 for apparmor@lists.ubuntu.com; Fri, 08 Aug 2025 15:38:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A8A12A56A50;
 Fri,  8 Aug 2025 15:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4DBC4CEF6;
 Fri,  8 Aug 2025 15:31:21 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Date: Fri,  8 Aug 2025 11:30:52 -0400
Message-Id: <20250808153054.1250675-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808153054.1250675-1-sashal@kernel.org>
References: <20250808153054.1250675-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=147.75.193.91; envelope-from=sashal@kernel.org;
 helo=nyc.source.kernel.org
X-Mailman-Approved-At: Sat, 09 Aug 2025 20:36:53 +0000
Subject: [apparmor] [PATCH AUTOSEL 6.16-6.12] apparmor: fix x_table_lookup
	when stacking is not the first entry
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

From: John Johansen <john.johansen@canonical.com>

[ Upstream commit a9eb185be84e998aa9a99c7760534ccc06216705 ]

x_table_lookup currently does stacking during label_parse() if the
target specifies a stack but its only caller ensures that it will
never be used with stacking.

Refactor to slightly simplify the code in x_to_label(), this
also fixes a long standing problem where x_to_labels check on stacking
is only on the first element to the table option list, instead of
the element that is found and used.

Signed-off-by: John Johansen <john.johansen@canonical.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

## Bug Fix Analysis

### 1. **Critical Bug Fix**
This fixes a **long-standing bug** in AppArmor's domain transition
handling where stacking directives would fail when they weren't the
first entry in the transition table. The commit message explicitly
states this fixes a "long standing problem" where the stacking check was
only performed on the first element rather than the element actually
found and used.

### 2. **Security Impact**
- **Policy Bypass Risk**: The bug could cause incorrect security
  profiles to be applied during domain transitions, potentially allowing
  unauthorized access
- **Inconsistent Enforcement**: Applications might not receive the
  correct stacked security context, leading to security policy
  violations
- **Profile Selection Errors**: Wrong profiles could be selected when
  stacking is involved, compromising the intended security boundaries

### 3. **Small and Contained Fix**
The changes are:
- Limited to two functions in a single file
  (`security/apparmor/domain.c`)
- Focused on fixing the logic flow without introducing new features
- Clear refactoring that separates concerns properly

### 4. **Low Regression Risk**
- The fix simplifies the code by properly separating lookup from
  stacking logic
- Changes from `aa_label_parse()` to `aa_label_merge()` for stacking is
  the correct semantic operation
- Proper resource management with `aa_put_label(stack)` prevents memory
  leaks
- The refactored loop in `x_table_lookup()` is cleaner and easier to
  understand

### 5. **Real-World Impact**
This bug would manifest in production systems where:
- AppArmor profiles use stacking features
- The stacking directive appears after other entries in the transition
  table
- Domain transitions are critical for security isolation

### 6. **Clear Problem and Solution**
The commit clearly identifies:
- **Problem**: Stacking check only on first element, not the found
  element
- **Solution**: Proper separation of lookup and stacking logic, checking
  the actual found entry

### 7. **Maintainer Authorship**
The commit is authored by John Johansen, the AppArmor maintainer,
indicating authoritative understanding of the subsystem and the fix's
importance.

This is exactly the type of commit that stable trees should include: a
clear bug fix for a security-relevant subsystem that could cause policy
enforcement failures in production systems, with minimal code changes
and low regression risk.

 security/apparmor/domain.c | 52 +++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 5939bd9a9b9b..08ca9057f82b 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -508,6 +508,7 @@ static const char *next_name(int xtype, const char *name)
  * @name: returns: name tested to find label (NOT NULL)
  *
  * Returns: refcounted label, or NULL on failure (MAYBE NULL)
+ *          @name will always be set with the last name tried
  */
 struct aa_label *x_table_lookup(struct aa_profile *profile, u32 xindex,
 				const char **name)
@@ -517,6 +518,7 @@ struct aa_label *x_table_lookup(struct aa_profile *profile, u32 xindex,
 	struct aa_label *label = NULL;
 	u32 xtype = xindex & AA_X_TYPE_MASK;
 	int index = xindex & AA_X_INDEX_MASK;
+	const char *next;
 
 	AA_BUG(!name);
 
@@ -524,25 +526,27 @@ struct aa_label *x_table_lookup(struct aa_profile *profile, u32 xindex,
 	/* TODO: move lookup parsing to unpack time so this is a straight
 	 *       index into the resultant label
 	 */
-	for (*name = rules->file->trans.table[index]; !label && *name;
-	     *name = next_name(xtype, *name)) {
+	for (next = rules->file->trans.table[index]; next;
+	     next = next_name(xtype, next)) {
+		const char *lookup = (*next == '&') ? next + 1 : next;
+		*name = next;
 		if (xindex & AA_X_CHILD) {
-			struct aa_profile *new_profile;
-			/* release by caller */
-			new_profile = aa_find_child(profile, *name);
-			if (new_profile)
-				label = &new_profile->label;
+			/* TODO: switich to parse to get stack of child */
+			struct aa_profile *new = aa_find_child(profile, lookup);
+
+			if (new)
+				/* release by caller */
+				return &new->label;
 			continue;
 		}
-		label = aa_label_parse(&profile->label, *name, GFP_KERNEL,
+		label = aa_label_parse(&profile->label, lookup, GFP_KERNEL,
 				       true, false);
-		if (IS_ERR(label))
-			label = NULL;
+		if (!IS_ERR_OR_NULL(label))
+			/* release by caller */
+			return label;
 	}
 
-	/* released by caller */
-
-	return label;
+	return NULL;
 }
 
 /**
@@ -567,9 +571,9 @@ static struct aa_label *x_to_label(struct aa_profile *profile,
 	struct aa_ruleset *rules = list_first_entry(&profile->rules,
 						    typeof(*rules), list);
 	struct aa_label *new = NULL;
+	struct aa_label *stack = NULL;
 	struct aa_ns *ns = profile->ns;
 	u32 xtype = xindex & AA_X_TYPE_MASK;
-	const char *stack = NULL;
 
 	switch (xtype) {
 	case AA_X_NONE:
@@ -578,13 +582,14 @@ static struct aa_label *x_to_label(struct aa_profile *profile,
 		break;
 	case AA_X_TABLE:
 		/* TODO: fix when perm mapping done at unload */
-		stack = rules->file->trans.table[xindex & AA_X_INDEX_MASK];
-		if (*stack != '&') {
-			/* released by caller */
-			new = x_table_lookup(profile, xindex, lookupname);
-			stack = NULL;
+		/* released by caller
+		 * if null for both stack and direct want to try fallback
+		 */
+		new = x_table_lookup(profile, xindex, lookupname);
+		if (!new || **lookupname != '&')
 			break;
-		}
+		stack = new;
+		new = NULL;
 		fallthrough;	/* to X_NAME */
 	case AA_X_NAME:
 		if (xindex & AA_X_CHILD)
@@ -599,6 +604,7 @@ static struct aa_label *x_to_label(struct aa_profile *profile,
 		break;
 	}
 
+	/* fallback transition check */
 	if (!new) {
 		if (xindex & AA_X_INHERIT) {
 			/* (p|c|n)ix - don't change profile but do
@@ -617,12 +623,12 @@ static struct aa_label *x_to_label(struct aa_profile *profile,
 		/* base the stack on post domain transition */
 		struct aa_label *base = new;
 
-		new = aa_label_parse(base, stack, GFP_KERNEL, true, false);
-		if (IS_ERR(new))
-			new = NULL;
+		new = aa_label_merge(base, stack, GFP_KERNEL);
+		/* null on error */
 		aa_put_label(base);
 	}
 
+	aa_put_label(stack);
 	/* released by caller */
 	return new;
 }
-- 
2.39.5



Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from lists.ubuntu.com (lists.ubuntu.com [185.125.189.65])
	by mail.lfdr.de (Postfix) with ESMTPS id 1150182991E
	for <lists+apparmor@lfdr.de>; Wed, 10 Jan 2024 12:31:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.ubuntu.com)
	by lists.ubuntu.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1rNWnZ-00082l-5H; Wed, 10 Jan 2024 11:31:05 +0000
Received: from mail-dm6nam11on2059.outbound.protection.outlook.com
 ([40.107.223.59] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by lists.ubuntu.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.86_2) (envelope-from <Neeraj.Upadhyay@amd.com>)
 id 1rNWfF-0007I0-8l
 for apparmor@lists.ubuntu.com; Wed, 10 Jan 2024 11:22:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wb8VQJ7ghzzhy3jqXG+fRpKCQmEljT+fkQw4JOqfqcMxE6jD+oektfSYE+rb1K7374R80fTYeg4IAGbnd2A1VGSEdQGyWZ8mC/pzRfB+54TB41zyJNt8IyNdZJhP8qbxXHot7CVbEwcI4rLTW0AhEcdPMngOzgW4z+E6kUWqCOfkCRrfiwiUHsecA/Uw8WvJzs1sY4UbhC7+O3zzDzYBVrvP/OdgKljIyYR0B9H0MfKCRQp7EefYa1XY749vgOQVF8nwOZcgh8PbFoqwkm+zVkzelNDH98ClFf+vBqt6z45tJxnDQacB7bkoTIUFDCrHlOaNZCIuqLsOT16hxX+Eqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rr1bPkkatKxkHaiM++UqjLMrfR19DsIFy2nmaWSHlo=;
 b=LEpmWi3HAf77LLR00WhSxvFzWykUnW9inXgo+LI8WvNbT137SVCdaJtVioSaYeG5kMB5tE+hCz5gRoj9vU6Ynb4zlSgXuYgC9cqLFnI2ICOAvxWHfd8dWoqy5duvg6b6JsGvuSJ70ILpTWBSZt40G3eBmCMiPhvCfYZ2Khh9OAiGnG8mU6Wq+rGVUuf0dDQKjVCybCPw/TxYb0RPujn+5eOwo4gJ+TdfTV/KFyHxgXo5W1H9Sh2ptA1biJKRaKly2bJrw1BAy2qcTp8ebP2v69R/YCvK2imD0JGsBWrBX5eSm3Qg8wuRjqM3j+UxI3rhsVIP6qqlb0ke1Mj3X7B7Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=canonical.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
Received: from CY5PR19CA0005.namprd19.prod.outlook.com (2603:10b6:930:15::27)
 by DM6PR12MB4878.namprd12.prod.outlook.com (2603:10b6:5:1b8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Wed, 10 Jan
 2024 11:22:24 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:15:cafe::eb) by CY5PR19CA0005.outlook.office365.com
 (2603:10b6:930:15::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18 via Frontend
 Transport; Wed, 10 Jan 2024 11:22:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Wed, 10 Jan 2024 11:22:24 +0000
Received: from BLR-L-NUPADHYA.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 10 Jan
 2024 05:22:19 -0600
From: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
To: <john.johansen@canonical.com>, <paul@paul-moore.com>, <jmorris@namei.org>, 
 <serge@hallyn.com>
Date: Wed, 10 Jan 2024 16:48:52 +0530
Message-ID: <20240110111856.87370-5-Neeraj.Upadhyay@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f184a2d6-7892-4e43-a0cd-cab638c3d5c2@amd.com>
References: <f184a2d6-7892-4e43-a0cd-cab638c3d5c2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|DM6PR12MB4878:EE_
X-MS-Office365-Filtering-Correlation-Id: ece1ef0e-692e-47e8-8735-08dc11ce6b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xIgFn61mU9HrI1F0+Il5rxpxkDzhX3MdDgvh7RBt4dkQdiK3CZWd9ZGBm1v9hscAMAZvEJFiHEZdoaSBMExMTruBunO/p7H859/tVEe3vud5JEvbnZDkddrcDOWmxRDPkcx1nTXJ4GIGAaC6TZbtgrGjcvxpwgzE01aBPoUp2yI21ajr3XbXRJf9Z8LebtWgtW//OxxlosRUCEhH7oTVN10MY30sNCICE1V/hKBB40TIKIZ3aTOfhEkD9olXEOXq5V2N8r91hAT7wSRrYJOeuIo7MCkVhFyxjFNHz3gC0Oycwv4dvv64q64CyR5vf2x185JpWg2rpEr13M2f4wjAO9lcswwPwsYLgKxcmHPSeJMtrT50z9yMDfMHSLrE7cuZ/6mZT2NSK8/dZlhK9IqAHkd3E6FNYtFGPStNfeqZEwv1ph7GBKMsirJyN3mKdm+ONMviZjECC+X/OCl+mLFxJ0rc8mjKopkbOWRK9optNd4iQpNGyZFgr9hlgE94b5Ukw1sxd6FfOAWWPJ1A0x9zDoC7SvwUMqaK/S0Rn/BH+gBJK5B8MYFVYsNkJfzmoTLF7i9mzEXc0RPOq/zk8/k5pD1paM2Pyp0NEhpe7vUyw5BpCgv894Q/4i5YT4Rx8c2Yju4XECir5fGDN2IMk/7Lfhfr+UdNXa3LRrFk9Xlh8tUimvYnZEOd+8a2RkOfSBFsjRyQBD4egLY2Rn9hPY+veDYLuhLrF0wg2VXJ2usSZTDNvNfq3aUk9w4MtxWAwwRs9frKAYtZlIxktbIkAOveFw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(82310400011)(451199024)(186009)(1800799012)(64100799003)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(16526019)(478600001)(7696005)(426003)(336012)(6666004)(2616005)(1076003)(26005)(82740400003)(81166007)(86362001)(356005)(36756003)(41300700001)(70586007)(4326008)(83380400001)(36860700001)(5660300002)(4744005)(7416002)(2906002)(47076005)(8936002)(8676002)(110136005)(70206006)(54906003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 11:22:24.4832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ece1ef0e-692e-47e8-8735-08dc11ce6b99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4878
X-Mailman-Approved-At: Wed, 10 Jan 2024 11:31:00 +0000
Subject: [apparmor] [RFC 5/9] apparmor: Switch intree labels to percpu mode
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
Cc: mjguzik@gmail.com, paulmck@kernel.org, boqun.feng@gmail.com,
 apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org,
 Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>,
 linux-security-module@vger.kernel.org, Santosh.Shukla@amd.com,
 gautham.shenoy@amd.com, Ananth.Narayan@amd.com,
 raghavendra.kodsarathimmappa@amd.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

Now that we have an infrastructure to reclaim
the percpu labels, switch intree labels to
percpu mode, to improve the ref scalability.

Signed-off-by: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
---
 security/apparmor/label.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/security/apparmor/label.c b/security/apparmor/label.c
index aa9e6eac3ecc..1299262f54e1 100644
--- a/security/apparmor/label.c
+++ b/security/apparmor/label.c
@@ -710,6 +710,8 @@ static struct aa_label *__label_insert(struct aa_labelset *ls,
 	rb_link_node(&label->node, parent, new);
 	rb_insert_color(&label->node, &ls->root);
 	label->flags |= FLAG_IN_TREE;
+	percpu_ref_switch_to_percpu(&label->count);
+	aa_label_reclaim_add_label(label);
 
 	return aa_get_label(label);
 }
-- 
2.34.1



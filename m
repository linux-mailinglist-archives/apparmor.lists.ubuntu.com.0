Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B95E473335
	for <lists+apparmor@lfdr.de>; Mon, 13 Dec 2021 18:48:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1mwpR5-0000EB-Ck; Mon, 13 Dec 2021 17:48:27 +0000
Received: from sonic315-26.consmr.mail.ne1.yahoo.com ([66.163.190.152])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <casey@schaufler-ca.com>) id 1mwpR3-0000E3-U3
 for apparmor@lists.ubuntu.com; Mon, 13 Dec 2021 17:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1639417704; bh=cjPrhDffCvwRQBucdMrxD6qvzH1dRniqru1x2FiBZtY=;
 h=Date:To:Cc:From:Subject:References:From:Subject:Reply-To;
 b=OeC9es2marCGR8Fshu8tUjeWGqQal5cfcXs2cDlqc1johcyxo6azVW//nYJArnL5d7a+iAk7Ff9l/srM3VkUY3Fn6YBwd1gOWKyyESKJAFc2cYYR9axELZLVdzCo81YhughPVk463Vdz+tnzw6/UmVKfDGyBmbjMU+m4cpay9eSmEoqVxISrM9jDPokUCvQJFbx3GhJxaLj0lkZAwLy561s1bwwlLxpi0zRCMyMaTtTnYV7us6oJX3U0aV5E9ldca/4iqiOdR8WCN0XRy6jt0WNOXDSjZXwKLkxRwXDLaWhYikp8dPd4WaQNErAtVugUVxY+hlqEEHd7G5h5QCF1ZA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1639417704; bh=sI51i+FnXlzXoTZ8RpGNxny1vln+kDNvXmoB7cO+8+4=;
 h=X-Sonic-MF:Date:To:From:Subject:From:Subject;
 b=p72Lva1nlaxqEqYDsmc0dof38r/C72Cgm+q9Tf3iSxj/YubsNZvPCflq4w/TUgxYYqIOrhjNVWYIcekiIuXWV/oxRKChfX+jWWVRIc3uEnTWs5qVCXWoK2F5bly6DUKUwZSmdIiQFGNPWoIsvOZuFuHm2yDZHS2jdsI0uMq4hdhNC0QSFg9CeJ8FPxBER40F8zfe4gQV4FpRooxSn7w86pEiaqL2N9IEILinsRc5dfP78YvzFYuG/cOoNy/T3enXOk18g7B/kvSl6amI9dFVELxiL1HCYA84RnhMUZHbwVFjFL3RHCSO/i65SBYgCFc/5W6JjjPzuyO+htinA/ybpg==
X-YMail-OSG: LKhTTtwVM1kGF4move5I8aqY_witCbTMyhke1U1Ht34QVvMcDBldmm4mfUAljK8
 cJXjQgvOheMvKOSJSI.hJrT7d_dwq87jTxvwK1TrGeZ8hceOf8MRp1P_oq0_4uDIELrobgq2Kp8o
 iExtin0uDLJImOav_Lopz0qfUScwVVsV6XaIbGXYrbVS6C.Iq3d89LvD798jSFuLF_VTY88wVYOv
 1vAaSuzYAKhHx0zUVZ3ibn7xGa76Iromjpj6oiKV6AOr.ckrdz10feCQry2AO2ULeehNPXkiWDQA
 3FuWeFd9JvHm2MTbQx0R8Il0vzTdD3dEo1gnD30xc3H.XPbW.0VNaF28cbiOmWaaqZD4HBtZ5TQN
 cWO6yED2P6ncXx7bL6VW_YmRpxsnnM4NjLZ6SmwBnC1ny8neF5AmTfNylLNw3pX1kdI6JqNJXron
 6BGN3enXKpC1fDojBLqeWNCCNtWG9EnltJUi04myrmuec.CA2JeKA54SIrlLHvZMZa61hIRv1fB4
 ghqQ3ACfV46d7HZYL6R87uXa.UU_sUr5EQSONE6cxxVcDEpGt1t3g5d6E9iQIroQPyAPdzpCaXxi
 1O3mGnC04CxEe2ZEd1ZWPHKDQEmsuyykIaX03QLF5n_7F3zt_pbs.6GFs45CykfUOlZbnp1IYprO
 jDja4lqgnGpP7cG1n96a_u6EwNR2FN3tXTvYEm2pBXyEckcDGFntOSnvznZxAgyxi_CuNF8tCw0j
 hkTlxpCP_z1as7fszShk5U8j4U_JA5YkAZgS7aAcP4AzIxwhWPZPWSuSx_HloDZXXeuvyK1X2QSs
 .XuSPF4moj0UfOM.GyjTwgY7GqrARTp2pNlOCOH9jqk7g9_FAN8qHR.rvbz.7XN9s4EhTaiipV6t
 fd.oilB8PAdG1uY_hCl_RP9N3lbQEtSdq2ZCWKpQKEp3K4lJm1IavntpWZi1cA_pn.6svc3.NkUv
 nG9A_EV_oPZaAjwzj3W7R2J4mKVSIMBgTzEqGYMQlIq838wmQCc9_pEYEwr6p_6q7RnH99eRvzdL
 S_2M9bxI2OC30c0.oNGTlTS99vFd7CsfZWpPL9Bkhj2DHEXHhzT_6kCny865RJ5DAyMsUL.olX6L
 rFGqJDHJ1ECb9x8V1zJ9y1ZZPLDnNft16aZzx5FZGpzbu0YRK5TV581o29RWmIsm.nuFxr_FpRzb
 lznztrqja61ic7VYfxIwUu5l3nYzrE5Tyudt0DBe6xaUitO5LOzHziTbYbC8zGJSnoQitl70jBll
 7tKpqFHn49Zujju9BxRVCfotwopK0GARVQIu40NUgWYTlKUENg9_lHqjwwDqHTFxE.mJeBEeIDPJ
 QofayBMyrrpLJgj3lpNKlpHm_udoSLwvH8sJGyOHo85pBfmhaJrOb2b_.dwHUajt5dZgYO.Q1R56
 vQshTBXU0d.Yeu1iAZ2H7yLFNH_fWa89tQvQwiUiU5IjoZNfLLQpi9_wS7SCa_roJnCmVv1kVVEy
 bZ6StxjhqeMIA_8nVaYJe1lKEF9Qq3vUSedSORCev6R9XyxURf..V4qcQFqi3rBSUx8d6lJcb77r
 YVNCR4mDPpBT6ZNJPoYGwj14f5lKIJp1JbwFlz9KTgsc28uXEoDGxsCfObVPasFtEYiY75.5ihbB
 LGKT71u11caawCS_NQvfQjzmp6fIF9_w7AVgc1GXTrXMhv3d0xE3cbL6UEcBhkl8LCtzNbWIs.b8
 02NYuMLY8pBFm0mklWocwje5gDCA3Y82Unza7tqEHtF7IoAQKSnR19S.DoTpAf0aCCUPmQUg0WC6
 rnHRCFPXuqXp4I3g.MJPoJ09QrCk65wO_XovvyF3hPOU2tqKzpvYuttZxo_BpAOGN.zz_On6Iw_v
 xR6hvKWwvrmKQzcPXN8JZBPHkDyQFWQMXrnIYID8P2YQrqokLdakye0Utq0QxgM24po6R2AT6wdq
 UOKc00UVkS_gKIZXgQqhKmJFGUGTWnbYqTeu.EVg1PyIr_k5.Jq8af2BjjU4Gz9rszHDDbC9Gh7i
 GN.jmMDfTGZuTAcEIaO.eUtwtcXgEIKVl8ThP1M6KMQYKcvw_januzJ3TUemm8_Q5Q_zMj21fW_s
 6907rJxEpa.eh1KRaLfM2OV95Yk8Sm_THJPkrYiBetc_hkgJ.kqVH04DNXbTM_8akHfRj3lZLL2w
 dp5rNpFgYSsR9BbLvbka4LiSM.feQAiuxuALg.nbaZ0TPvYJtzfq5n.8p3CVnIFX4Kft2eCMQ1he
 y8s.fozK6WU9o9dG7S0O08645a67qi8mQqYAVkjPwq5qgTx5wurauEWtsRA0iA9w-
X-Sonic-MF: <casey@schaufler-ca.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.ne1.yahoo.com with HTTP; Mon, 13 Dec 2021 17:48:24 +0000
Received: by kubenode510.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 93fa1b9b47080ea1d1dabab4c5b4a867; 
 Mon, 13 Dec 2021 17:48:22 +0000 (UTC)
Message-ID: <068c959c-4c27-2231-021a-e8cb4e26499b@schaufler-ca.com>
Date: Mon, 13 Dec 2021 09:48:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: John Johansen <john.johansen@canonical.com>,
 "apparmor@lists.ubuntu.com" <apparmor@lists.ubuntu.com>
From: Casey Schaufler <casey@schaufler-ca.com>
References: <068c959c-4c27-2231-021a-e8cb4e26499b.ref@schaufler-ca.com>
X-Mailer: WebService/1.1.19415
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
Subject: [apparmor] Pesky '=' in subj= of audit in mainline
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

VGhlIFVidW50dSBrZXJuZWwgaGFzICJzdWJqPXVuY29uZmluZWQiIGluIGl0cyBhdWRpdCByZWNv
cmRzLgpUaGUgTGludXMgdjUuMTYtcmM0IGtlcm5lbCBoYXMgInN1Ymo9PXVuY29uZmluZWQiLgoK
SSBzZWUgaW4gdGhlIHVwc3RyZWFtIHdoZXJlIHRoZSBleHRyYSAiPSIgY29tZXMgZnJvbSwgYnV0
IEkKZG9uJ3Qgc2VlIGhvdyB0byBnZXQgdG8gdGhhdCBjb2RlLiBJIGhhdmUgbm90IGxvb2tlZCBp
bnRvIHRoZQpwYXRjaGVzIFVidW50dSBpcyB1c2luZywgYnV0IHRoZXJlIG11c3QgYmUgc29tZXRo
aW5nLgoKCi0tIApBcHBBcm1vciBtYWlsaW5nIGxpc3QKQXBwQXJtb3JAbGlzdHMudWJ1bnR1LmNv
bQpNb2RpZnkgc2V0dGluZ3Mgb3IgdW5zdWJzY3JpYmUgYXQ6IGh0dHBzOi8vbGlzdHMudWJ1bnR1
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2FwcGFybW9yCg==

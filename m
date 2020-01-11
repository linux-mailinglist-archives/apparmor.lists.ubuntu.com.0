Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id C7722138154
	for <lists+apparmor@lfdr.de>; Sat, 11 Jan 2020 13:14:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1iqFfG-0005jZ-RY; Sat, 11 Jan 2020 12:14:50 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1iqFfD-0005jT-UJ
 for apparmor@lists.ubuntu.com; Sat, 11 Jan 2020 12:14:47 +0000
Received: from static-50-53-33-191.bvtn.or.frontiernet.net ([50.53.33.191]
 helo=[192.168.192.153]) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>)
 id 1iqFfD-0001tx-GO; Sat, 11 Jan 2020 12:14:47 +0000
To: Sylvain Leroux <sylvain@chicoree.fr>, apparmor@lists.ubuntu.com
References: <f189a6f3-80f8-6acc-62c3-06408bcef190@chicoree.fr>
From: John Johansen <john.johansen@canonical.com>
Organization: Canonical
Message-ID: <b4b16361-4dd8-f0a3-b4c1-d0f396cdd5ae@canonical.com>
Date: Sat, 11 Jan 2020 04:14:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <f189a6f3-80f8-6acc-62c3-06408bcef190@chicoree.fr>
Content-Language: en-GB
Subject: Re: [apparmor] Patching a system profile for a specific user
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

T24gMS8xMC8yMCAyOjA3IFBNLCBTeWx2YWluIExlcm91eCB3cm90ZToKPiAtLS0tLUJFR0lOIFBH
UCBTSUdORUQgTUVTU0FHRS0tLS0tCj4gSGFzaDogU0hBMjU2Cj4gCj4gCj4gSGkgZXZlcnlvbmUs
Cj4gCj4gSSdtIGEgc2Vhc29uZWQgTGludXggYWRtaW5pc3RyYXRvciBidXQgSSBoYXZlIGxpdHRs
ZSBwcmlvciBleHBlcmllbmNlCj4gd2l0aCBBcHBBcm1vci4gIEZXSVcsIEkgYWxyZWFkeSBoYXZl
IGFza2VkIHRoaXMgcXVlc3Rpb24gb24gdGhlCj4gU3VwZXJVc2VyIFN0YWNrRXhjaGFuZ2Ugd2Vi
IHNpdGUgdGhpcyBhZnRlcm5vb24gWzFdLCAgYnV0IGl0IHJlY2VpdmVkCj4gbGl0dGxlIGludGVy
ZXN0LCBhbmQgSSBub3cgaGF2ZSBsaXR0bGUgaG9wZXMgdG8gaGF2ZSBhbiBhbnN3ZXIgdGhlcmUu
Cj4gCj4gT3VyIExpbnV4IERlYmlhbiBib3hlcyBoYXZlIGEgc3RhbmRhcmQgcG9saWN5IGZvciB0
aGUgVGh1bmRlcmJpcmQKPiBlbWFpbCBjbGllbnQgaW4gYC9ldGMvYXBwYXJtb3IuZC91c3IuYmlu
LnRodW5kZXJiaXJkYAo+IAo+IE9uZSB1c2VyIG5lZWRzIFRodW5kZXJiaXJkIHRvIGhhdmUgcmVh
ZCBhY2Nlc3MgdG8gdGhlIGZpbGVzIHN0b3JlZCBpbgo+IGhpcyBgJHtIT01FfS9zaWduYXR1cmUu
ZC9gIGZvbGRlci4gSXMgdGhlcmUgYSB3YXkgdG8gY3JlYXRlIGEKPiB1c2VyLXNwZWNpZmljIHBy
b2ZpbGUgdGhhdCBfaW5jbHVkZXNfIHRoZSBkZWZhdWx0IHByb2ZpbGUgc2V0dGluZ3MsCj4gYnV0
IGdyYW50aW5nIGV4dHJhIGFjY2VzcyB0aGUgdGhlIG5lZWRlZCBmaWxlcz8gSSBkaWRuJ3QgZmlu
ZCBhbnkKPiByZWZlcmVuY2UgYWJvdXQgdGhhdCBwYXJ0aWN1bGFyIHVzZSBjYXNlLCBhbmQgbXkg
Zmlyc3QgYXR0ZW1wdHMgd2VyZQo+IHVuc3VjY2Vzc2Z1bC4gQnV0IEkgY2FuJ3Qgc2F5IGlmIG15
IHN5bnRheCB3YXMgd3JvbmcsIG9mIGlmIHRoaXMKPiB3YXNuJ3QgcG9zc2libGUgYXQgYWxsLiBI
ZXJlIHdoYXQgSSB0cmllZDoKPiAKPiAKPiBgYGAKPiAkIGNhdCAiJHtIT01FfS8uYXBwYXJtb3Iu
ZC91c3IuYmluLnRodW5kZXJiaXJkIgo+IAo+ICNpbmNsdWRlIDwvZXRjL2FwcGFybW9yLmQvdXNy
LmJpbi50aHVuZGVyYmlyZD4KPiAKPiBwcm9maWxlIHRodW5kZXJiaXJkIEB7dGh1bmRlcmJpcmRf
ZXhlY3V0YWJsZX0gewo+ICAgb3duZXIgQHtIT01FfS8uc2lnbmF0dXJlLmQvKiogciwKPiB9Cj4g
Cj4gJCBzdWRvIHN5c3RlbWN0bCByZXN0YXJ0IGFwcGFybW9yCj4gCj4gYGBgCj4gCj4gCj4gVGhp
cyBkb2Vzbid0IHNlZW0gdG8gY2hhbmdlIGFueXRoaW5nLiBBdCBzdWNoIHBvaW50IEkgZG9uJ3Qg
dGhpbmsgdGhlCj4gdXNlci1zcGVjaWZpYyBwcm9maWxlIGlzIHJlYWQgYXQgYWxsLiAKPiAKCmNv
cnJlY3QuIHVzZXIgZGVmaW5lZCBwb2xpY3kgaXMgbm90IHlldCBzdXBwb3J0ZWQsIGJ1dCBpcyBv
biB0aGUgcm9hZCBtYXAsCmFuZCBpcyBzb21ldGhpbmcgd2UgaGF2ZSBiZWVuIHdvcmtpbmcgdG93
YXJkcywgc2V2ZXJhbCBvZiB0aGUgbmVjZXNzYXJ5CnBhcnRzIGxpa2UgcG9saWN5IG5hbWVzcGFj
ZSwgYW5kIHN0YWNraW5nIGhhdmUgbGFuZGVkIGJ1dCB0aGVyZSBpcwpzdGlsbCBzb21lIHdvcmsg
dG8gYmUgZG9uZS4KCj4gQ291bGQgeW91IGhlbHAgbWUgZml4aW5nIHRoYXQ/CgptYXliZS4gSXQg
ZGVwZW5kcyBvbiB3aGF0IGlzIGNvbnNpZGVyZWQgYW4gYWNjZXB0YWJsZSBzb2x1dGlvbiB0byB5
b3UuClVuZm9ydHVuYXRlbHkgYXRtIHRoaXMgaXMgbm90IG5pY2UgYW5kIHNpbXBsZSB0byBkbywg
dGhlIHNpbmdsZSBydWxlCnN1Z2dlc3RlZCBpbiB0aGUgb3RoZXIgZW1haWwgaXMgdGhlIGVhc3kg
c29sdXRpb24gYXRtLgoKClRoZXJlIGFyZSBhIGNvdXBsZSBkaWZmZXJlbnQgYXBwcm9hY2hlcyB0
byB0aGlzLCBhbmQgY3VycmVudGx5IGFsbCBvZgp0aGVtIHJlcXVpcmUgYSBzeXMgYWRtaW4gZGVm
aW5lZCBwb2xpY3ksIGFuZCBhIHdheSB0byBhdHRhY2ggdGhlCnBvbGljeSB0byB0aGUgdXNlci4K
ClRoZSBiYXNpYyBpZGVhIGlzIHRoYXQgeW91IGNyZWF0ZSBhIHBvbGljeSBuYW1lc3BhY2UoMSkg
Zm9yIHRoZSB1c2VyCndobyBoYXMgc3BlY2lhbCBwb2xpY3kgYW5kIHBsYWNlIHRoZSB1c2VyIGlu
dG8gdGhhdCBuYW1lc3BhY2UuCgpBIGNob2ljZSB3aWxsIGFsc28gaGF2ZSB0byBiZSBtYWRlIHdo
ZXRoZXIgcmVndWxhciBzeXN0ZW0gcG9saWN5CnNob3VsZCBhcHBseSB0byB0aGUgdXNlciwgYW5k
IHdoZXRoZXIgcHJvZmlsZSBzdGFja2luZygyKSBjYW4gYmUgdXNlZApvciBub3QuCgpUaGlzIGlz
IGFsbCBjbGVhciBhcyBtdWQgSSBhbSBzdXJlLiBTbyBhIHNob3J0IGV4cGxhbmF0aW9uIG9mIGVh
Y2gKCgoxLiBQb2xpY3kgbmFtZXNwYWNlcwpUaGUgcG9saWN5IG5hbWVzcGFjZSBhbGxvd3MgZm9y
IHlvdSB0byBoYXZlIGRpZmZlcmVudCB2ZXJzaW9uIG9mIHBvbGljeQpsb2FkZWQgYXQgdGhlIHNh
bWUgdGltZS4gVGhpcyBjb3VsZCBiZSBkaWZmZXJlbnQgdmVyc2lvbnMgb2YgYSBwcm9maWxlCmxp
a2UgdGh1bmRlcmJpcmQgb3IgYW4gZW50aXJlbHkgZGlmZmVyZW50IHNldCBvZiBwcm9maWxlcy4g
UG9saWN5Cm5hbWVzcGFjZXMgYXJlIGhpZXJhcmNoaWNhbC4gVGhlcmUgaXMgdGhlIHJvb3QgbmFt
ZXNwYWNlIHRoYXQgc3lzdGVtCnBvbGljeSBpcyBsb2FkZWQgaW50by4KClBvbGljeSBuYW1lc3Bh
Y2VzIGhhdmUgYSBuYW1lIHRoYXQgY3VycmVudGx5IGFsd2F5cyBiZWdpbnMgd2l0aCBhCjogYW5k
IGVuZHMgd2l0aCA6IG9yIDovLyAodGhleSBjYW4gYmUgdXNlZCBpbnRlcmNoYW5nZWFibHkgc28g
aXQKZG9lc24ndCBtYXR0ZXIgd2hpY2ggeW91IHVzZSkKCmVnLgogIDp1c2VyX3RvbTp0aHVuZGVy
YmlyZAogIDp1c2VyX3RvbTovL3RodW5kZXJiaXJkCgpDdXJyZW50bHkgcG9saWN5IG5hbWVzcGFj
ZXMgaGF2ZSB0aGUgbGltaXRhdGlvbiB0aGF0IG9uY2UgYSBwcm9jZXNzCmVudGVycyB0aGUgbmFt
ZXNwYWNlLCB0aGUgcGFyZW50IG5hbWVzcGFjZSBpcyBub3QgdmlzaWJsZSB0byB0YXNrcwp3aXRo
aW4gdGhlIG5hbWVzcGFjZS4gVGhlIG5hbWUgb2YgdGhlIG5hbWVzcGFjZSBpcyBub3QgdmlzaWJs
ZSBlaXRoZXIKc28gdG8gdGhlIHRhc2tzIHdpdGhpbiB0aGUgbmFtZXNwYWNlIHRoZXkgd2lsbCBq
dXN0IHNlZQoKICB0aHVuZGVyYmlyZAppbnN0ZWFkIG9mCiAgOnVzZXJfdG9tOnRodW5kZXJiaXJk
CgphZG1pbiB0YXNrcyBpbiB0aGUgcGFyZW50IG5hbWVzcGFjZSBjYW4gc2VlIGV2ZXJ5IHRoaW5n
LiBUaGlzIHdvcmtzCndlbGwgZm9yIHN5c3RlbSBjb250YWluZXJzIGxpa2UgTFhELCBidXQgdGhl
cmUgYXJlIHNpdHVhdGlvbnMgd2hlcmUKdGhpcyBpc24ndCB3aGF0IHlvdSB3YW50ICh5ZXMgd2Ug
aGF2ZSBwbGFucyB0byBmaXggdGhpcykuCgpJIHNob3VsZCBub3RlIHRoYXQgZWFjaCBwb2xpY3kg
bmFtZXNwYWNlIGdldHMgaXQgb3duIHVuY29uZmluZWQuIFNvCnRoYXQgdGFza3MgY2FuIGJlIHB1
dCBpbnRvIGEgZGlmZmVyZW50IG5hbWVzcGFjZSBhbmQgc3RpbGwgYmUKYmUgdW5jb25maW5lZCwg
YW5kIHdpbGwgYXR0YWNoIHRvIHRoYXQgcG9saWN5IG5hbWVzcGFjZXMgcHJvZmlsZXMuCgoKU28g
aG93IGRvIHdlIGNyZWF0ZSBhIHBvbGljeSBuYW1lc3BhY2UgYW5kIHB1dCBhIHRhc2sgaW50byBp
dD8KCllvdSBjYW4gY3JlYXRlIGEgcG9saWN5IG5hbWVzcGFjZSBtYW51YWxseSB1c2luZyB0aGUg
c2hlbGwgdXNpbmcKbWtkaXIgKDEpLCBvciB0aGUgYmVzdCBzb2x1dGlvbiBmb3IgeW91LCBieSBs
b2FkaW5nIHBvbGljeSBpbnRvIGl0LgoKQ3JlYXRpbmcgYSBwcm9maWxlIHdpdGggdGhlIGJlbG93
IHRlbXBsYXRlIGluIC9ldGMvYXBwYXJtb3IuZC8Kd2lsbCBjcmVhdGUgdGhlIG5hbWVzcGFjZSBh
bmQgbG9hZCB0aGUgcHJvZmlsZSB0byBpdCBhcyBwYXJ0IG9mCnJlZ3VsYXIgcG9saWN5IGxvYWQu
Cgo6bnMxOnRodW5kZXJiaXJkIEB7dGh1bmRlcmJpcmRfZXhlY3V0YWJsZX0gewogICAuLi4KfQoK
dG8gc3RhcnQgYSB0YXNrIGluIHRoZSBuYW1lc3BhY2UgeW91IGNhbiB1c2UgYWEtZXhlYwoKYWEt
ZXhlYyAtcCA6bnMxOnRodW5kZXJiaXJkIC0tIHRodW5kZXJiaXJkCgp0aGlzIGlzIG9mIGNvdXJz
ZSBub3Qgd2hhdCB5b3Ugd2FudCBidXQgaXMgYnVpbGRpbmcgdG93YXJkIGl0LgoKCjIuIFBvbGlj
eSBzdGFja2luZwoKUG9saWN5IHN0YWNraW5nIGFsbG93cyBhIHRhc2sgdG8gYmUgY29uZmluZWQg
YnkgbXVsdGlwbGUgcHJvZmlsZXMKYXQgdGhlIHNhbWUgdGltZS4gV2hlbiBpbnRyb3NwZWN0aW5n
IHRoZSBsYWJlbCAoY29uZmluZW1lbnQpIG9mIGEKdGFzayBpdCBpcyBpZGVudGlmaWVkIGJ5IHRo
ZSBzZXF1ZW5jZSBvZiAvLyYKCmVnLgoKICBsb2dfYWRtaW4vLyZ0aHVuZGVyYmlyZAoKc3RhY2tp
bmcgY2FuIGJlIHVzZWQgaW4gY29uanVuY3Rpb24gd2l0aCBwb2xpY3kgbmFtZXNwYWNlcyB0byBh
bGxvdwpzb21lIHRhc2tzIHRvIGJlIGNvbmZpbmVkIGJ5IGJvdGggdGhlIHN5c3RlbSBwb2xpY3kg
YW5kIGJ5IHRoZSBhCmN1c3RvbSB1c2VyIHBvbGljeSBhdCB0aGUgc2FtZSB0aW1lLgoKVGhpcyBk
b2VzIGhhdmUgYSBsaW1pdGF0aW9uIGhvd2V2ZXIgaW4gdGhhdCBpZiB0aGUgc3lzdGVtIGhhcyBh
CnRodW5kZXJiaXJkIHBvbGljeSBhbmQgdGhlIHVzZXIgaGFzIGEgdGh1bmRlcmJpcmQgcG9saWN5
IHRoZXkgd2lsbApib3RoIGdldCBhcHBsaWVkIGF0IHRoZSBzYW1lIHRpbWUuCgogIHRodW5kZXJi
aXJkLy8mOnVzZXJfam9lOnRodW5kZXJiaXJkCgp3aGVuIHByb2ZpbGVzIGFyZSBzdGFja2VkLCB5
b3UgZ2V0IHRoZSBib29sZWFuIGludGVyc2VjdGlvbiBvZgpwZXJtaXNzaW9ucyBzbyB5b3VyIHVz
ZXIgd29uJ3QgZ2V0IHRoZSBleHRlbmRlZCBwZXJtaXNzaW9ucyBmcm9tCjp1c2VyX2pvZTp0aHVu
ZGVyYmlyZCBiZWNhdXNlIHRoZSBzeXN0ZW0gdGh1bmRlcmJpcmQgcHJvZmlsZQpkb2Vzbid0IGhh
dmUgdGhlbSBhbmQgd2lsbCBlbmQgdXAgZGVueWluZyB0aGVtLgoKCllvdSBjYW4gcGxheSB3aXRo
IHN0YWNraW5nIGJ5IHVzaW5nIGFhLWV4ZWMKCmVnLgoKICBhYS1leGVjIC1wIHVuY29uZmluZWQv
LyY6dXNlcl9qb2U6dGh1bmRlcmJpcmQgLS0gdGh1bmRlcmJpcmQKCgozLiBQbGFjaW5nIGEgdXNl
ciBpbnRvIHRoZSBuYW1lc3BhY2UuCgpZb3UgaGF2ZSAyIHdheXMgdG8gcHV0IHRoZSB1c2VyIGlu
dG8gdGhlIG5hbWVzcGFjZSBhdXRvbWF0aWNhbGx5LAp5b3UgY2FuIHVzZSBwYW1fYXBwYXJtb3Io
Mykgb3IgbW9kaWZ5IHRoZSB1c2VycyBzaGVsbC4KClRoZSB1c2Ugb2YgcGFtX2FwcGFybW9yIGlz
IG5vdCBjdXJyZW50bHkgcmVjb21tZW5kZWQgYmVjYXVzZSBhbnkKdGhpbmcgdGhhdCBjYWxscyB0
aGUgcGFtIHN0YWNrIG11c3QgYmUgY29uZmluZWQgYnkgYSBwcm9maWxlIHdpdGgKYWxsIHRoZSB0
cmFuc2l0aW9ucyBkZWZpbmVkIGFzIGhhdHMuIFRoaXMgbWVhbnMgZm9yIG1vc3QgdXNlIGNhc2Vz
CnRvdGFsIHN5c3RlbSBjb25maW5lbWVudC4gWW91IGNhbiBzZWUgbW9yZSBkZXRhaWxzIGJ5IGxv
b2tpbmcgYXQKdGhlIHJlZmVyZW5jZWQgd2lraSBwYWdlLgoKClRoZSBvdGhlciBzb2x1dGlvbiBp
cyB0byBtb2RpZnkgdGhlIHVzZXJzIHNoZWxsIHRvIGEgY3VzdG9tCnNoZWxsIHRoYXQgd3JhcHMg
dGhlIGFhLWV4ZWMgY29tbWFuZC4gU29tZXRoaW5nIGxpa2UKCiAgJCBjYXQgL2Jpbi9zcGVjaWFs
X2Jhc2gKICAjISAvYmluL2Jhc2gKCiAgL3Vzci9iaW4vYWEtZXhlYyAtcCA6bnMxOnVuY29uZmlu
ZWQgLS0gL2Jpbi9iYXNoCgpBbmQgdGhlbiBtb2RpZnkgL2V0Yy9wYXNzd2QgZm9yIHRoYXQgdXNl
ciwgc28gdXNpbmcgdGhlIHVzZXIKZm9vIGFzIGFuIGV4YW1wbGUgeW91IHdvdWxkIGhhdmUKCiAg
Zm9vOng6MTAwMToxMDAxOiwsLDovaG9tZS9mb286L2Jpbi9zcGVjaWFsX2Jhc2gKCgo0LiBQdXR0
aW5nIGl0IGFsbCB0b2dldGhlcgoKWW91IG5vdyBoYXZlIHR3byBjaG9pY2VzLCBlaXRoZXIgdXNp
bmcgc3RhY2tpbmcgKyBuYW1lc3BhY2VzIE9SCmp1c3QgbmFtZXNwYWNlcy4KCgo0LjEgSnVzdCBu
YW1lc3BhY2VzCgptYWtlIGNvcGllcyBvZiBhbGwgdGhlIHN5c3RlbSBwb2xpY3kgYW5kIG1vZGlm
eSBpdCB0byB1c2UgYQpwb2xpY3kgbmFtZXNwYWNlLgoKWW91IHNldCB1cCB0aGUgdXNlciB0cmFu
c2l0aW9uIGFzIGFib3ZlLgoKVGhpcyBhcHByb2FjaCBoYXMgdGhlIGlzc3VlIHRoYXQgaXBjIHJ1
bGVzIG1heSBmYWlsIGJlY2F1c2UKcHJvZmlsZSBhbmQgOm5zMTpwcm9maWxlIGFyZSBub3QgcmVj
b2duaXplZCBhcyBiZWluZyB0aGUgc2FtZQoKCjQuMiBTdGFja2luZyArIG5hbWVzcGFjZXMKCllv
dSB3aWxsIG5lZWQgdHdvIHVzZXIgbmFtZXNwYWNlcyBhIGRlZmF1bHQgbmFtZXNwYWNlIGZvciBt
b3N0CnVzZXJzIGFuZCBhIGN1c3RvbSBuYW1lc3BhY2UgZm9yIHRoZSBtb2RpZmllZCBwcm9maWxl
LgoKTW92ZSB0aGUgdGh1bmRlcmJpcmQgcHJvZmlsZSBpbnRvIHRoZSBkZWZhdWx0IG5hbWVzcGFj
ZSBhbmQKdGhlbiBjb3B5IHRoYXQgaW50byB0aGUgY3VzdG9tIG5hbWVzcGFjZS4gTW9kaWZ5IGJv
dGggcHJvZmlsZXMKZ2l2aW5nIHRoZW0gdW5pcXVlIG5hbWVzcGFjZSBuYW1lcy4gSGVyZSBJIHdp
bGwganVzdCB1c2UgImRlZmF1bHQiCmFuZCAiY3VzdG9tIi4gQnV0IHlvdSBjYW4gY2hvb3NlIHdo
YXQgZXZlciB5b3Ugd2FudAoKOmRlZmF1bHQ6dGh1bmRlcmJpcmQgQHt0aHVuZGVyYmlyZF9leGVj
dXRhYmxlfSB7CiAgIC4uLgp9Cgo6Y3VzdG9tOnRodW5kZXJiaXJkIEB7dGh1bmRlcmJpcmRfZXhl
Y3V0YWJsZX0gewogICAuLi4KfQoKbWFrZSB5b3VyIG1vZGlmaWNhdGlvbiB0byB0aGUgOmN1c3Rv
bTp0aHVuZGVyYmlyZCBwcm9maWxlLgoKU2V0dXAgdHdvIHdyYXBwZXJzIHNpbWlsYXIgdG8gc2V0
dGluZyB1cCB0aGUgbmFtZXNwYWNlcwoKICAkIGNhdCAvYmluL2RlZmF1bHRfYmFzaAogICMhIC9i
aW4vYmFzaAoKICAvdXNyL2Jpbi9hYS1leGVjIC1wIDpkZWZhdWx0OnVuY29uZmluZWQgLS0gL2Jp
bi9iYXNoCgogICQgY2F0IC9iaW4vY3VzdG9tX2Jhc2gKICAjISAvYmluL2Jhc2gKCiAgL3Vzci9i
aW4vYWEtZXhlYyAtcCA6Y3VzdG9tOnVuY29uZmluZWQgLS0gL2Jpbi9iYXNoCgphbmQgY2hhbmdl
IGFsbCB1c2VycyBzaGVsbHMgdG8gdXNlIGRlZmF1bHRfYmFzaCBvciBjdXN0b20uCgoKWWVwIGl0
cyBncm9zcy4gU29ycnkuCgpTbyB3aGF0IGFyZSB3ZSBkb2luZyB0byBmaXggdGhpcz8gVGhlIGFy
ZSBtdWx0aXBsZSBpbXByb3ZlbWVudHMKY29taW5nIHRoYXQgd2lsbCBtYWtlIHRoaXMgYSBsb3Qg
ZWFzaWVyLiBJIGNhbid0IGNvbW1pdCB0byBhCnRpbWUgZnJhbWUgZm9yIGFueSBvZiB0aGVtLgoK
MS4gVXBkYXRlZCBwYW1fYXBwYXJtb3IgdGhhdCB3aWxsIGJlIGFibGUgdG8gdXNlIG5ld2VyIGFw
aXMuCiAgIEFsbG93aW5nIHlvdSB0byBjb25maWd1cmUgc2V0dGluZyB1cCBuYW1lc3BhY2VzIGZv
ciB1c2Vycy4KCjIuIE9wZW5pbmcgdXAgcHJvZmlsZSBsb2FkcyB0byB1c2Vycy4gVXNlcnMgd2ls
bCBvbmx5IGJlIGFibGUKICAgdG8gbG9hZCBwb2xpY3kgdG8gYSB1c2VyIHNwZWNpZmljIG5hbWVz
cGFjZS4gQW5kIHBvbGljeQogICB3aWxsIGhhdmUgdG8gYmUgc2V0dXAgdG8gYWxsb3cgaXQsIGJ1
dCB1c2VyIGRlZmluZWQgcG9saWN5CiAgIGlzIGNvbWluZy4gSG9wZWZ1bGx5IHRoaXMgeWVhci4K
CjMuIEEgdXNlciBhdHRhY2htZW50IGNvbmRpdGlvbmFsLCBhbGxvd2luZyB5b3UgdG8gZGVmaW5l
IHN5c3RlbQogICBwcm9maWxlcyBmb3IgZGlmZmVyZW50IHVzZXJzLgoKCndoZW4gY29tYmluZWQg
dGhpcyB3aWxsIHByb3ZpZGUgYSBsb3Qgb2YgZmxleGliaWxpdHkgd2l0aCBob3cKdG8gZGVhbCB3
aXRoIHN0dWZmIGxpa2UgdGhpcy4KCgoKCigxKTogaHR0cHM6Ly9naXRsYWIuY29tL2FwcGFybW9y
L2FwcGFybW9yLy0vd2lraXMvQXBwQXJtb3JOYW1lc3BhY2VzCigyKTogaHR0cHM6Ly9naXRsYWIu
Y29tL2FwcGFybW9yL2FwcGFybW9yLy0vd2lraXMvQXBwQXJtb3JTdGFja2luZwooMyk6IGh0dHBz
Oi8vZ2l0bGFiLmNvbS9hcHBhcm1vci9hcHBhcm1vci8tL3dpa2lzL3BhbV9hcHBhcm1vcgoKPiAK
PiBUaGFua3MgYSBsb3QsCj4gLSAtIFN5bHZhaW4gTGVyb3V4Cj4gCj4gCj4gCj4gWzFdCj4gaHR0
cHM6Ly9zdXBlcnVzZXIuY29tL3F1ZXN0aW9ucy8xNTE2MTgxL2NvbmZpZ3VyZS1hcHBhcm1vci10
by1hbGxvdy1maWxlLWFjY2Vzcy1vbi1hLXBlci11c2VyLWJhc2lzCj4gCj4gLSAtLSAKPiAtIC0t
IFN5bHZhaW4gTGVyb3V4Cj4gLSAtLSBzeWx2YWluQGNoaWNvcmVlLmZyCj4gLSAtLSBodHRwOi8v
d3d3LmNoaWNvcmVlLmZyCj4gLS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KPiAKPiBpUUpJ
QkFFQkNBQXlGaUVFbDViUmQxZUxtenkvd1RaV3ExZ2ZIUjloeFNJRkFsNFk5YlVVSEhONWJIWmhh
VzVBCj4gWTJocFkyOXlaV1V1Wm5JQUNna1FxMWdmSFI5aHhTSVRzUS85RTJmRGgyTHRNL3Jsa0to
RThvSWtlV1FDdnYwYgo+IGQ5MVRXbXZWcDVOMFhGdHJ4U1dyTFJHclFUdXdJaFlHVVBRV243Rlg1
TS85eWlxTzJaZHhUY3kvVlo1V0s1bUUKPiAxNi9RSHppVThId0xMKzRlR1pBSExJNVE4MUZqcTJa
eDJMeWluMjFyNnRpUW4vVGMxQ01TNVdxbmtVcU1VWjNWCj4gSmpSWG1Rd2ZnK1ZBenNZOHcrbERW
SzFpRlJOemNHdmNDYmlFY0RTelhzQitRZkVBNVIweHRUQjVaNjMrVTdLdwo+IHoycUcxWDhTcGNJ
Sk1nZzdNN3Y2eDJ3bDhMS05FbmIvUG9YZmRYK0hWMEtCaCtJUmlwSmsvc2dDeXVKczE5Y2QKPiBo
Z2RDdEdWYk9LeE0rZGFUWm5INkRLVlduQ3VqYVRUbzVrQlZQZHV1RENGeUJUN2lQMWhVd2UwOE5u
QzhybUxjCj4geDZXK2dzUTZZWjFVUW8vMzZpSFhVckYrdG9oc1NuMEp2SlI0eXUxWEViOTNqdGhu
blplV0ZqK25hWC9EQWJBYQo+IG03ZkFxZ1V3SE15RVR6M3hJUnh3ZEtUYy93UU9oKzJyVmY4M0pX
ZnVJeVYwSGF1SzlKTXNYalM1ZEtaWUgzZnAKPiBpSEE2bVptT1B3OFpsV2NTek9QN0pZYklKU2Qv
RS9HNm11ZExMOENSR2hDc2h1WCtkWG5MQkRKRFpKVnpxY2g2Cj4gNmhHS1NoSzFmeUdJRDVOVTJp
RW11eWVvK0tncFNIQnUyQVkydWhxbU5mUEV3S2VPUHlGNll6VTlOTnpqQ3FoNgo+IE8zVDZ1UTFy
VUZzbGo5S05NdnVDcXV2SUpyM003OXJ5a0xrVDZwbnlUa0JhajcyTm5BNE0vaFZOaTJJclN1QXoK
PiBDWit0UW5XWlpuM0dHbHM9Cj4gPTVBUVcKPiAtLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0K
PiAKCgotLSAKQXBwQXJtb3IgbWFpbGluZyBsaXN0CkFwcEFybW9yQGxpc3RzLnVidW50dS5jb20K
TW9kaWZ5IHNldHRpbmdzIG9yIHVuc3Vic2NyaWJlIGF0OiBodHRwczovL2xpc3RzLnVidW50dS5j
b20vbWFpbG1hbi9saXN0aW5mby9hcHBhcm1vcgo=

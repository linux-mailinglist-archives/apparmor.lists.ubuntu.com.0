Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id E18501F56EB
	for <lists+apparmor@lfdr.de>; Wed, 10 Jun 2020 16:41:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1jj1uR-00080u-BZ; Wed, 10 Jun 2020 14:40:55 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>) id 1jj1uP-000809-Ce
 for apparmor@lists.ubuntu.com; Wed, 10 Jun 2020 14:40:53 +0000
Received: from static-50-53-52-215.bvtn.or.frontiernet.net ([50.53.52.215]
 helo=[192.168.192.153]) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <john.johansen@canonical.com>)
 id 1jj1uO-0005fZ-H7; Wed, 10 Jun 2020 14:40:52 +0000
To: Stefan Hundhammer <shundhammer@suse.de>,
 Christian Boltz <opensuse@cboltz.de>
References: <1794871.jzh3902Se6@tux.boltz.de.vu>
 <06f9ced030aae366686a3f681b476b32@suse.de>
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; prefer-encrypt=mutual; keydata=
 LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgptUUlOQkU1bXJQb0JFQURB
 azE5UHNnVmdCS2tJbW1SMmlzUFE2bzdLSmhUVEtqSmR3VmJrV1NuTm4rbzZVcDVrCm5LUDFm
 NDlFQlFsY2VXZzF5cC9Od2JSOGFkK2VTRU8vdW1hL0srUHFXdkJwdEtDOVNXRDk3Rkc0dUI0
 L2Nhb20KTEVVOTdzTFFNdG52R1dkeHJ4VlJHTTRhbnpXWU1neno1VFptSWlWVFo0M091NVZw
 YVMxVnoxWlN4UDNoL3hLTgpaci9UY1c1V1FhaTh1M1BXVm5ia2poU1pQSHYxQmdoTjY5cXhF
 UG9tckpCbTFnbXR4M1ppVm1GWGx1d1RtVGdKCk9rcEZvbDduYkowaWxuWUhyQTdTWDNDdFIx
 dXBlVXBNYS9XSWFuVk85NldkVGpISElhNDNmYmhtUXViZTR0eFMKM0ZjUUxPSlZxUXN4NmxF
 OUI3cUFwcG05aFExMHFQV3dkZlB5LyswVzZBV3ROdTVBU2lHVkNJbld6bDJIQnFZZAovWmxs
 OTN6VXErTklvQ244c0RBTTlpSCt3dGFHRGNKeXdJR0luK2VkS050SzcyQU1nQ2hUZy9qMVpv
 V0g2WmVXClBqdVVmdWJWelp0bzFGTW9HSi9TRjRNbWRRRzFpUU50ZjRzRlpiRWdYdXk5Y0dp
 MmJvbUYwenZ5QkpTQU5weGwKS05CRFlLek42S3owOUhVQWtqbEZNTmdvbUwvY2pxZ0FCdEF4
 NTlMK2RWSVpmYUYyODFwSWNVWnp3dmg1K0pvRwplT1c1dUJTTWJFN0wzOG5zem9veWtJSjVY
 ckFjaGtKeE5mejdrK0ZuUWVLRWtOekVkMkxXYzNRRjRCUVpZUlQ2ClBISGdhM1JneWtXNSsx
 d1RNcUpJTGRtdGFQYlhyRjNGdm5WMExSUGN2NHhLeDdCM2ZHbTd5Z2Rvb3dBUkFRQUIKdEIx
 S2IyaHVJRXB2YUdGdWMyVnVJRHhxYjJodVFHcHFiWGd1Ym1WMFBva0NPZ1FUQVFvQUpBSWJB
 d1VMQ1FnSApBd1VWQ2drSUN3VVdBZ01CQUFJZUFRSVhnQVVDVG8wWVZ3SVpBUUFLQ1JBRkx6
 WndHTlhEMkx4SkQvOVRKWkNwCndsbmNUZ1llcmFFTWVEZmtXdjhjMUlzTTFqMEFtRTRWdEwr
 ZkU3ODBaVlA5Z2tqZ2tkWVN4dDdlY0VUUFRLTWEKWlNpc3JsMVJ3cVUwb29nWGRYUVNweHJH
 SDAxaWN1LzJuMGpjWVNxWUtnZ1B4eTc4QkdzMkxacTRYUGZKVFptSApaR25YR3EvZURyL21T
 bmowYWF2QkptTVo2amJpUHo2eUh0QllQWjlmZG84YnRjendQNDFZZVdvSXUyNi84SUk2CmYw
 WG0zVkM1b0FhOHY3UmQrUldaYThUTXdsaHpIRXh4ZWwzanRJN0l6ek9zbm1FOS84RG0wQVJE
 NWlUTENYd1IKMWN3SS9KOUJGL1MxWHY4UE4xaHVUM0l0Q05kYXRncDh6cW9Ka2dQVmptdnlM
 NjRRM2ZFa1liZkhPV3NhYmE5LwprQVZ0Qk56OVJURmg3SUhEZkVDVmFUb3VqQmQ3QnRQcXIr
 cUlqV0ZhZEpEM0k1ZUxDVkp2VnJyb2xyQ0FUbEZ0Ck4zWWtRczZKbjFBaUlWSVUzYkhSOEdq
 ZXZnejVMbDZTQ0dIZ1Jya3lScG5TWWFVL3VMZ24zN042QVl4aS9RQUwKK2J5M0N5RUZManpX
 QUV2eVE4YnEzSXVjbjdKRWJoUy9KLy9kVXFMb2VVZjh0c0dpMDB6bXJJVFpZZUZZQVJoUQpN
 dHNmaXpJclZEdHoxaVBmL1pNcDVnUkJuaXlqcFhuMTMxY20zTTNndjZIclFzQUdubjhBSnJ1
 OEdEaTVYSllJCmNvLzEreC9xRWlOMm5DbGFBT3BiaHpOMmVVdlBEWTVXMHEzYkEvWnAybWZH
 NTJ2YlJJK3RRMEJyMUhkL3ZzbnQKVUhPOTAzbU1aZXAyTnpOM0JaNXFFdlB2RzRyVzVacTJE
 cHliV2JRclNtOW9iaUJLYjJoaGJuTmxiaUE4YW05bwpiaTVxYjJoaGJuTmxia0JqWVc1dmJt
 bGpZV3d1WTI5dFBva0NOd1FUQVFvQUlRVUNUbzBYV2dJYkF3VUxDUWdICkF3VVZDZ2tJQ3dV
 V0FnTUJBQUllQVFJWGdBQUtDUkFGTHpad0dOWEQySXRNRC85anliYzg3ZE00dUFIazZ5Tk0K
 TjBZL0JGbW10VFdWc09CaHFPbm9iNGkzOEJyRE8yQzFoUUNQQ1FlNExMczEvNHB0ZW92UXQ4
 QjJGeXJQVmp3Zwo3alpUSE5LNzRyNmxDQ1Z4eDN5dTFCN1U5UG80VlRrY3NsVmIxL3FtV3V4
 OFhXY040eXZrVHFsTCtHeHB5Sm45CjlaWmZmWEpjNk9oNlRtT2ZiS0d2TXV1djVhclNJQTNK
 SEZMZjlhTHZadEExaXNKVXI3cFM5YXBnOXVUVUdVcDcKd2ZWMFdUNlQzZUczbXRVVTJ1cDVK
 VjQ4NTBMMDVqSFM2dVdpZS9ZK3lmSk9iaXlyeE4vNlpxVzVHb25oTEJxLwptc3pjVjV2QlQz
 QkRWZTNSdkY2WGRNOU9oUG4xK1k4MXg1NCt2UTExM044aUx3RjdHR2ExNFp5SVZBTlpEMEkw
 CkhqUnZhMmsvUnFJUlR6S3l1UEg1cGtsY0tIVlBFRk1tT3pNVCtGT294Tmp2Uys3K3dHMktN
 RFlFbUhQcjFQSkIKWlNaZUh6SzE5dGZhbFBNcHBGeGkrc3lZTGFnTjBtQjdKSFF3WTdjclV1
 T0RoeWNxNjBZVnoxdGFFeWd1M1l2MgoyL0kxRUNHSHZLSEc2d2M5MG80M0MvZWxIRUNYbkVo
 N3RLcGxEY3BJQytPQ21NeEtIaFI0NitYY1p2Z3c0RGdiCjdjYTgzZVFSM0NHODlMdlFwVzJM
 TEtFRUJEajdoWmhrTGJra1BSWm0zdzhKWTQ0YXc4VnRneFdkblNFTUNMeEwKSU9OaDZ1Wjcv
 L0RZVnRjSWFNSllrZWJhWnRHZENwMElnVVpiMjQvVmR2WkNZYk82MkhrLzNWbzFuWHdIVUVz
 Mwo2RC92MWJUMFJaRmk2OUxnc0NjT2N4NGdZTGtDRFFST1pxejZBUkFBb3F3NmtrQmhXeU0x
 ZnZnYW1BVmplWjZuCktFZm5SV2JrQzk0TDFFc0pMdXAzV2IyWDBBQk5PSFNrYlNENHBBdUMy
 dEtGL0VHQnQ1Q1A3UWRWS1JHY1F6QWQKNmIyYzFJZHk5Ukx3Nnc0Z2krbm4vZDFQbTFra1lo
 a1NpNXpXYUlnMG01UlFVaytFbDh6a2Y1dGNFLzFOMFo1TwpLMkpoandGdTViWDBhMGw0Y0ZH
 V1ZRRWNpVk1ES1J0eE1qRXRrM1N4RmFsbTZaZFEycHAyODIyY2xucTR6WjltCld1MWQyd2F4
 aXorYjVJYTR3ZURZYTduNDFVUmNCRVViSkFnbmljSmtKdENUd3lJeElXMktuVnlPcmp2a1F6
 SUIKdmFQMEZkUDJ2dlpvUE1kbENJek9sSWtQTGd4RTBJV3VlVFhlQkpoTnMwMXBiOGJMcW1U
 SU1sdTRMdkJFTEEvdgplaWFqajVzOHk1NDJIL2FIc2ZCZjRNUVVoSHhPL0JaVjdoMDZLU1Vm
 SWFZN09nQWdLdUdOQjNVaWFJVVM1K2E5CmduRU9RTER4S1J5L2E3UTF2OVMrTnZ4KzdqOGlI
 M2prUUpoeFQ2WkJoWkdSeDBna0gzVCtGMG5ORG01TmFKVXMKYXN3Z0pycUZaa1VHZDJNcm0x
 cW5Ld1hpQXQ4U0ljRU5kcTMzUjBLS0tSQzgwWGd3ajhKbjMwdlhMU0crTk8xRwpIMFVNY0F4
 TXd5L3B2azZMVTVKR2paUjczSjVVTFZoSDRNTGJEZ2dEM21QYWlHOCtmb3RUckpVUHFxaGc5
 aHlVCkVQcFlHN3NxdDc0WG43OStDRVpjakxIenlsNnZBRkUyVzBreGxMdFF0VVpVSE8zNmFm
 RnY4cUdwTzNacVB2akIKVXVhdFhGNnR2VVFDd2YzSDZYTUFFUUVBQVlrQ0h3UVlBUW9BQ1FV
 Q1RtYXMrZ0liREFBS0NSQUZMelp3R05YRAoyRC9YRC8wZGRNLzRhaTFiK1RsMWp6bkthalgz
 a0crTWVFWWVJNGY0MHZjbzNyT0xyblJHRk9jYnl5ZlZGNjlNCktlcGllNE93b0kxamNUVTBB
 RGVjbmJXbkROSHByMFNjenhCTXJvM2Juckxoc212anVuVFlJdnNzQlp0QjRhVkoKanVMSUxQ
 VWxuaEZxYTdmYlZxMFpRamJpVi9ydDJqQkVOZG05cGJKWjZHam5wWUljQWJQQ0NhL2ZmTDQv
 U1FSUwpZSFhvaEdpaVM0eTVqQlRtSzVsdGZld0xPdzAyZmtleEgrSUpGcnJHQlhEU2c2bjJT
 Z3hubisrTkYzNGZYY205CnBpYXczbUtzSUNtKzBoZE5oNGFmR1o2SVdWOFBHMnRlb29WRHA0
 ZFlpaCsreFgvWFM4ekJDYzFPOXc0bnpsUDIKZ0t6bHFTV2JoaVdwaWZSSkJGYTRXdEFlSlRk
 WFlkMzdqL0JJNFJXV2hueXc3YUFQTkdqMzN5dEdITlVmNlJvMgovanRqNHRGMXkvUUZYcWpK
 Ry93R2pwZHRSZmJ0VWpxTEhJc3ZmUE5OSnEvOTU4cDc0bmRBQ2lkbFdTSHpqK09wCjI2S3Bi
 Rm5td05PMHBzaVVzbmh2SEZ3UE8vdkFibDNSc1I1KzBSbytodnMyY0VtUXV2OXIvYkRsQ2Zw
 enAydDMKY0srcmh4VXFpc094OERaZnoxQm5rYW9DUkZidnZ2ays3TC9mb21QbnRHUGtxSmNp
 WUU4VEdIa1p3MWhPa3UrNApPb00yR0I1bkVEbGorMlRGL2pMUStFaXBYOVBrUEpZdnhmUmxD
 NmRLOFBLS2ZYOUtkZm1BSWNnSGZuVjFqU24rCjh5SDJkakJQdEtpcVcwSjY5YUlzeXg3aVYv
 MDNwYVBDakpoN1hxOXZBenlkTjVVL1VBPT0KPTZQL2IKLS0tLS1FTkQgUEdQIFBVQkxJQyBL
 RVkgQkxPQ0stLS0tLQo=
Organization: Canonical
Message-ID: <464826e3-803e-1710-88ac-2fd13c3f7bca@canonical.com>
Date: Wed, 10 Jun 2020 07:40:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <06f9ced030aae366686a3f681b476b32@suse.de>
Content-Type: multipart/mixed; boundary="------------73CDA8A9139690D6E2F175F9"
Content-Language: en-US
Subject: Re: [apparmor] [yast-devel] Upcoming changes in AppArmor aa-status
 output
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
Cc: apparmor@lists.ubuntu.com, yast-devel@opensuse.org
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

This is a multi-part message in MIME format.
--------------73CDA8A9139690D6E2F175F9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 5/4/20 1:08 AM, Stefan Hundhammer wrote:
> On 2020-04-30 13:22, Christian Boltz wrote:
>> Hello,
>>
>> AFAIK the YaST AppArmor module uses the JSON output of aa-status.
>>
>> There are two upcoming changes, and I'd like to point them out so that
>> you can adjust the YaST AppArmor module if needed.
> 
> This time PLEASE remember to also bump the JSON version number of that output. We had to do a pretty ugly hot fix for that last time, and it was just coincidence that this did not conflict with the previous version.
> 

the JSON version was bumped to 2

attached is an example output of aa-status, along with the corresponding pretty json and compressed json output using the new unconfined, kill, mixed, and prompt modes

--------------73CDA8A9139690D6E2F175F9
Content-Type: text/plain; charset=UTF-8;
 name="aa-status.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="aa-status.txt"

YXBwYXJtb3IgbW9kdWxlIGlzIGxvYWRlZC4KNDUgcHJvZmlsZXMgYXJlIGxvYWRlZC4KNDAg
cHJvZmlsZXMgYXJlIGluIGVuZm9yY2UgbW9kZS4KICAgL3NuYXAvY29yZS85Mjg5L3Vzci9s
aWIvc25hcGQvc25hcC1jb25maW5lCiAgIC9zbmFwL2NvcmUvOTI4OS91c3IvbGliL3NuYXBk
L3NuYXAtY29uZmluZS8vbW91bnQtbmFtZXNwYWNlLWNhcHR1cmUtaGVscGVyCiAgIC91c3Iv
YmluL2V2aW5jZQogICAvdXNyL2Jpbi9ldmluY2UtcHJldmlld2VyCiAgIC91c3IvYmluL2V2
aW5jZS1wcmV2aWV3ZXIvL3Nhbml0aXplZF9oZWxwZXIKICAgL3Vzci9iaW4vZXZpbmNlLXRo
dW1ibmFpbGVyCiAgIC91c3IvYmluL2V2aW5jZS8vc2FuaXRpemVkX2hlbHBlcgogICAvdXNy
L2Jpbi9tYW4KICAgL3Vzci9saWIvTmV0d29ya01hbmFnZXIvbm0tZGhjcC1jbGllbnQuYWN0
aW9uCiAgIC91c3IvbGliL05ldHdvcmtNYW5hZ2VyL25tLWRoY3AtaGVscGVyCiAgIC91c3Iv
bGliL2Nvbm5tYW4vc2NyaXB0cy9kaGNsaWVudC1zY3JpcHQKICAgL3Vzci9saWIvY3Vwcy9i
YWNrZW5kL2N1cHMtcGRmCiAgIC91c3IvbGliL3NuYXBkL3NuYXAtY29uZmluZQogICAvdXNy
L2xpYi9zbmFwZC9zbmFwLWNvbmZpbmUvL21vdW50LW5hbWVzcGFjZS1jYXB0dXJlLWhlbHBl
cgogICAvdXNyL3NiaW4vY3Vwcy1icm93c2VkCiAgIC91c3Ivc2Jpbi9jdXBzZAogICAvdXNy
L3NiaW4vY3Vwc2QvL3RoaXJkX3BhcnR5CiAgIC91c3Ivc2Jpbi90Y3BkdW1wCiAgIC97LHVz
ci99c2Jpbi9kaGNsaWVudAogICA6bnM6Zm9vCiAgIGZpcmVmb3gKICAgZmlyZWZveC8vYnJv
d3Nlcl9qYXZhCiAgIGZpcmVmb3gvL2Jyb3dzZXJfb3BlbmpkawogICBmaXJlZm94Ly9sc2Jf
cmVsZWFzZQogICBmaXJlZm94Ly9zYW5pdGl6ZWRfaGVscGVyCiAgIGlwcHVzYnhkCiAgIGxp
YnJlb2ZmaWNlLXNlbmRkb2MKICAgbGlicmVvZmZpY2Utc29mZmljZS8vZ3BnCiAgIGxpYnJl
b2ZmaWNlLXhwZGZpbXBvcnQKICAgbHNiX3JlbGVhc2UKICAgbWFuX2ZpbHRlcgogICBtYW5f
Z3JvZmYKICAgbnZpZGlhX21vZHByb2JlCiAgIG52aWRpYV9tb2Rwcm9iZS8va21vZAogICBz
bmFwLXVwZGF0ZS1ucy5jb3JlCiAgIHNuYXAtdXBkYXRlLW5zLnNuYXAtc3RvcmUKICAgc25h
cC5jb3JlLmhvb2suY29uZmlndXJlCiAgIHNuYXAuc25hcC1zdG9yZS5zbmFwLXN0b3JlCiAg
IHNuYXAuc25hcC1zdG9yZS51YnVudHUtc29mdHdhcmUKICAgc25hcC5zbmFwLXN0b3JlLnVi
dW50dS1zb2Z0d2FyZS1sb2NhbC1maWxlCjIgcHJvZmlsZXMgYXJlIGluIGNvbXBsYWluIG1v
ZGUuCiAgIGxpYnJlb2ZmaWNlLW9vcHNsYXNoCiAgIGxpYnJlb2ZmaWNlLXNvZmZpY2UKMSBw
cm9maWxlcyBhcmUgaW4ga2lsbCBtb2RlLgogICBleGFtcGxlCjEgcHJvZmlsZXMgYXJlIGlu
IHVuY29uZmluZWQgbW9kZS4KICAgdGVzdAoxIHByb2ZpbGVzIGFyZSBpbiBwcm9tcHQgbW9k
ZS4KICAgaW50ZXJhY3RpdmUKOCBwcm9jZXNzZXMgaGF2ZSBwcm9maWxlcyBkZWZpbmVkLgoy
IHByb2Nlc3NlcyBhcmUgaW4gZW5mb3JjZSBtb2RlLgogICAvdXNyL3NiaW4vY3Vwcy1icm93
c2VkICg2MjQpIAogICAvdXNyL3NiaW4vY3Vwc2QgKDUyMCkgCjAgcHJvY2Vzc2VzIGFyZSBp
biBjb21wbGFpbiBtb2RlLgoxIHByb2Nlc3NlcyBhcmUgdW5jb25maW5lZCBidXQgaGF2ZSBh
IHByb2ZpbGUgZGVmaW5lZC4KICAgL3Vzci9iaW4vYmFzaCAoMTQ2NikgdGVzdAoxIHByb2Nl
c3NlcyBhcmUgaW4gbWl4ZWQgbW9kZS4KICAgL3Vzci9iaW4vY2F0ICgxNTAyKSBpbnRlcmFj
dGl2ZS8vJjpuczpmb28KMSBwcm9jZXNzZXMgYXJlIGluIGtpbGwgbW9kZS4KICAgL3Vzci9i
aW4vY2F0ICgxNDc0KSBleGFtcGxlCjMgcHJvY2Vzc2VzIGFyZSBpbiBwcm9tcHQgbW9kZS4K
ICAgL3Vzci9iaW4vY2F0ICgxNDc1KSBpbnRlcmFjdGl2ZQogICAvdXNyL2Jpbi9jYXQgKDE0
OTkpIGludGVyYWN0aXZlLy8mOm5zOnVuY29uZmluZWQKICAgL3Vzci9iaW4vY2F0ICgxNDk3
KSBpbnRlcmFjdGl2ZS8vJnVuY29uZmluZWQK
--------------73CDA8A9139690D6E2F175F9
Content-Type: application/json;
 name="aa-status.json"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="aa-status.json"

eyJ2ZXJzaW9uIjogIjIiLCAicHJvZmlsZXMiOiB7Ii9zbmFwL2NvcmUvOTI4OS91c3IvbGli
L3NuYXBkL3NuYXAtY29uZmluZSI6ICJlbmZvcmNlIiwgIi9zbmFwL2NvcmUvOTI4OS91c3Iv
bGliL3NuYXBkL3NuYXAtY29uZmluZS8vbW91bnQtbmFtZXNwYWNlLWNhcHR1cmUtaGVscGVy
IjogImVuZm9yY2UiLCAiL3Vzci9iaW4vZXZpbmNlIjogImVuZm9yY2UiLCAiL3Vzci9iaW4v
ZXZpbmNlLXByZXZpZXdlciI6ICJlbmZvcmNlIiwgIi91c3IvYmluL2V2aW5jZS1wcmV2aWV3
ZXIvL3Nhbml0aXplZF9oZWxwZXIiOiAiZW5mb3JjZSIsICIvdXNyL2Jpbi9ldmluY2UtdGh1
bWJuYWlsZXIiOiAiZW5mb3JjZSIsICIvdXNyL2Jpbi9ldmluY2UvL3Nhbml0aXplZF9oZWxw
ZXIiOiAiZW5mb3JjZSIsICIvdXNyL2Jpbi9tYW4iOiAiZW5mb3JjZSIsICIvdXNyL2xpYi9O
ZXR3b3JrTWFuYWdlci9ubS1kaGNwLWNsaWVudC5hY3Rpb24iOiAiZW5mb3JjZSIsICIvdXNy
L2xpYi9OZXR3b3JrTWFuYWdlci9ubS1kaGNwLWhlbHBlciI6ICJlbmZvcmNlIiwgIi91c3Iv
bGliL2Nvbm5tYW4vc2NyaXB0cy9kaGNsaWVudC1zY3JpcHQiOiAiZW5mb3JjZSIsICIvdXNy
L2xpYi9jdXBzL2JhY2tlbmQvY3Vwcy1wZGYiOiAiZW5mb3JjZSIsICIvdXNyL2xpYi9zbmFw
ZC9zbmFwLWNvbmZpbmUiOiAiZW5mb3JjZSIsICIvdXNyL2xpYi9zbmFwZC9zbmFwLWNvbmZp
bmUvL21vdW50LW5hbWVzcGFjZS1jYXB0dXJlLWhlbHBlciI6ICJlbmZvcmNlIiwgIi91c3Iv
c2Jpbi9jdXBzLWJyb3dzZWQiOiAiZW5mb3JjZSIsICIvdXNyL3NiaW4vY3Vwc2QiOiAiZW5m
b3JjZSIsICIvdXNyL3NiaW4vY3Vwc2QvL3RoaXJkX3BhcnR5IjogImVuZm9yY2UiLCAiL3Vz
ci9zYmluL3RjcGR1bXAiOiAiZW5mb3JjZSIsICIveyx1c3IvfXNiaW4vZGhjbGllbnQiOiAi
ZW5mb3JjZSIsICI6bnM6Zm9vIjogImVuZm9yY2UiLCAiZmlyZWZveCI6ICJlbmZvcmNlIiwg
ImZpcmVmb3gvL2Jyb3dzZXJfamF2YSI6ICJlbmZvcmNlIiwgImZpcmVmb3gvL2Jyb3dzZXJf
b3BlbmpkayI6ICJlbmZvcmNlIiwgImZpcmVmb3gvL2xzYl9yZWxlYXNlIjogImVuZm9yY2Ui
LCAiZmlyZWZveC8vc2FuaXRpemVkX2hlbHBlciI6ICJlbmZvcmNlIiwgImlwcHVzYnhkIjog
ImVuZm9yY2UiLCAibGlicmVvZmZpY2Utc2VuZGRvYyI6ICJlbmZvcmNlIiwgImxpYnJlb2Zm
aWNlLXNvZmZpY2UvL2dwZyI6ICJlbmZvcmNlIiwgImxpYnJlb2ZmaWNlLXhwZGZpbXBvcnQi
OiAiZW5mb3JjZSIsICJsc2JfcmVsZWFzZSI6ICJlbmZvcmNlIiwgIm1hbl9maWx0ZXIiOiAi
ZW5mb3JjZSIsICJtYW5fZ3JvZmYiOiAiZW5mb3JjZSIsICJudmlkaWFfbW9kcHJvYmUiOiAi
ZW5mb3JjZSIsICJudmlkaWFfbW9kcHJvYmUvL2ttb2QiOiAiZW5mb3JjZSIsICJzbmFwLXVw
ZGF0ZS1ucy5jb3JlIjogImVuZm9yY2UiLCAic25hcC11cGRhdGUtbnMuc25hcC1zdG9yZSI6
ICJlbmZvcmNlIiwgInNuYXAuY29yZS5ob29rLmNvbmZpZ3VyZSI6ICJlbmZvcmNlIiwgInNu
YXAuc25hcC1zdG9yZS5zbmFwLXN0b3JlIjogImVuZm9yY2UiLCAic25hcC5zbmFwLXN0b3Jl
LnVidW50dS1zb2Z0d2FyZSI6ICJlbmZvcmNlIiwgInNuYXAuc25hcC1zdG9yZS51YnVudHUt
c29mdHdhcmUtbG9jYWwtZmlsZSI6ICJlbmZvcmNlIiwgImxpYnJlb2ZmaWNlLW9vcHNsYXNo
IjogImNvbXBsYWluIiwgImxpYnJlb2ZmaWNlLXNvZmZpY2UiOiAiY29tcGxhaW4iLCAiZXhh
bXBsZSI6ICJraWxsIiwgInRlc3QiOiAidW5jb25maW5lZCIsICJpbnRlcmFjdGl2ZSI6ICJw
cm9tcHQifSwgInByb2Nlc3NlcyI6IHsiL3Vzci9zYmluL2N1cHMtYnJvd3NlZCI6IFt7InBy
b2ZpbGUiOiAiL3Vzci9zYmluL2N1cHMtYnJvd3NlZCIsICJwaWQiOiAiNjI0IiwgInN0YXR1
cyI6ICJlbmZvcmNlIn1dLCAiL3Vzci9zYmluL2N1cHNkIjogW3sicHJvZmlsZSI6ICIvdXNy
L3NiaW4vY3Vwc2QiLCAicGlkIjogIjUyMCIsICJzdGF0dXMiOiAiZW5mb3JjZSJ9XSwgIi91
c3IvYmluL2Jhc2giOiBbeyJwcm9maWxlIjogInRlc3QiLCAicGlkIjogIjE0NjYiLCAic3Rh
dHVzIjogInVuY29uZmluZWQifV0sICIvdXNyL2Jpbi9jYXQiOiBbeyJwcm9maWxlIjogImlu
dGVyYWN0aXZlLy8mOm5zOmZvbyIsICJwaWQiOiAiMTUwMiIsICJzdGF0dXMiOiAibWl4ZWQi
fV0sICIvdXNyL2Jpbi9jYXQiOiBbeyJwcm9maWxlIjogImV4YW1wbGUiLCAicGlkIjogIjE0
NzQiLCAic3RhdHVzIjogImtpbGwifV0sICIvdXNyL2Jpbi9jYXQiOiBbeyJwcm9maWxlIjog
ImludGVyYWN0aXZlIiwgInBpZCI6ICIxNDc1IiwgInN0YXR1cyI6ICJwcm9tcHQifSwgeyJw
cm9maWxlIjogImludGVyYWN0aXZlLy8mdW5jb25maW5lZCIsICJwaWQiOiAiMTQ5NyIsICJz
dGF0dXMiOiAicHJvbXB0In0sIHsicHJvZmlsZSI6ICJpbnRlcmFjdGl2ZS8vJjpuczp1bmNv
bmZpbmVkIiwgInBpZCI6ICIxNDk5IiwgInN0YXR1cyI6ICJwcm9tcHQifV19fQo=
--------------73CDA8A9139690D6E2F175F9
Content-Type: text/plain; charset=UTF-8;
 name="aa-status.prettyjson"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="aa-status.prettyjson"

ewoJInZlcnNpb24iOgkiMiIsCgkicHJvZmlsZXMiOgl7CgkJIi9zbmFwL2NvcmUvOTI4OS91
c3IvbGliL3NuYXBkL3NuYXAtY29uZmluZSI6CSJlbmZvcmNlIiwKCQkiL3NuYXAvY29yZS85
Mjg5L3Vzci9saWIvc25hcGQvc25hcC1jb25maW5lLy9tb3VudC1uYW1lc3BhY2UtY2FwdHVy
ZS1oZWxwZXIiOgkiZW5mb3JjZSIsCgkJIi91c3IvYmluL2V2aW5jZSI6CSJlbmZvcmNlIiwK
CQkiL3Vzci9iaW4vZXZpbmNlLXByZXZpZXdlciI6CSJlbmZvcmNlIiwKCQkiL3Vzci9iaW4v
ZXZpbmNlLXByZXZpZXdlci8vc2FuaXRpemVkX2hlbHBlciI6CSJlbmZvcmNlIiwKCQkiL3Vz
ci9iaW4vZXZpbmNlLXRodW1ibmFpbGVyIjoJImVuZm9yY2UiLAoJCSIvdXNyL2Jpbi9ldmlu
Y2UvL3Nhbml0aXplZF9oZWxwZXIiOgkiZW5mb3JjZSIsCgkJIi91c3IvYmluL21hbiI6CSJl
bmZvcmNlIiwKCQkiL3Vzci9saWIvTmV0d29ya01hbmFnZXIvbm0tZGhjcC1jbGllbnQuYWN0
aW9uIjoJImVuZm9yY2UiLAoJCSIvdXNyL2xpYi9OZXR3b3JrTWFuYWdlci9ubS1kaGNwLWhl
bHBlciI6CSJlbmZvcmNlIiwKCQkiL3Vzci9saWIvY29ubm1hbi9zY3JpcHRzL2RoY2xpZW50
LXNjcmlwdCI6CSJlbmZvcmNlIiwKCQkiL3Vzci9saWIvY3Vwcy9iYWNrZW5kL2N1cHMtcGRm
IjoJImVuZm9yY2UiLAoJCSIvdXNyL2xpYi9zbmFwZC9zbmFwLWNvbmZpbmUiOgkiZW5mb3Jj
ZSIsCgkJIi91c3IvbGliL3NuYXBkL3NuYXAtY29uZmluZS8vbW91bnQtbmFtZXNwYWNlLWNh
cHR1cmUtaGVscGVyIjoJImVuZm9yY2UiLAoJCSIvdXNyL3NiaW4vY3Vwcy1icm93c2VkIjoJ
ImVuZm9yY2UiLAoJCSIvdXNyL3NiaW4vY3Vwc2QiOgkiZW5mb3JjZSIsCgkJIi91c3Ivc2Jp
bi9jdXBzZC8vdGhpcmRfcGFydHkiOgkiZW5mb3JjZSIsCgkJIi91c3Ivc2Jpbi90Y3BkdW1w
IjoJImVuZm9yY2UiLAoJCSIveyx1c3IvfXNiaW4vZGhjbGllbnQiOgkiZW5mb3JjZSIsCgkJ
Ijpuczpmb28iOgkiZW5mb3JjZSIsCgkJImZpcmVmb3giOgkiZW5mb3JjZSIsCgkJImZpcmVm
b3gvL2Jyb3dzZXJfamF2YSI6CSJlbmZvcmNlIiwKCQkiZmlyZWZveC8vYnJvd3Nlcl9vcGVu
amRrIjoJImVuZm9yY2UiLAoJCSJmaXJlZm94Ly9sc2JfcmVsZWFzZSI6CSJlbmZvcmNlIiwK
CQkiZmlyZWZveC8vc2FuaXRpemVkX2hlbHBlciI6CSJlbmZvcmNlIiwKCQkiaXBwdXNieGQi
OgkiZW5mb3JjZSIsCgkJImxpYnJlb2ZmaWNlLXNlbmRkb2MiOgkiZW5mb3JjZSIsCgkJImxp
YnJlb2ZmaWNlLXNvZmZpY2UvL2dwZyI6CSJlbmZvcmNlIiwKCQkibGlicmVvZmZpY2UteHBk
ZmltcG9ydCI6CSJlbmZvcmNlIiwKCQkibHNiX3JlbGVhc2UiOgkiZW5mb3JjZSIsCgkJIm1h
bl9maWx0ZXIiOgkiZW5mb3JjZSIsCgkJIm1hbl9ncm9mZiI6CSJlbmZvcmNlIiwKCQkibnZp
ZGlhX21vZHByb2JlIjoJImVuZm9yY2UiLAoJCSJudmlkaWFfbW9kcHJvYmUvL2ttb2QiOgki
ZW5mb3JjZSIsCgkJInNuYXAtdXBkYXRlLW5zLmNvcmUiOgkiZW5mb3JjZSIsCgkJInNuYXAt
dXBkYXRlLW5zLnNuYXAtc3RvcmUiOgkiZW5mb3JjZSIsCgkJInNuYXAuY29yZS5ob29rLmNv
bmZpZ3VyZSI6CSJlbmZvcmNlIiwKCQkic25hcC5zbmFwLXN0b3JlLnNuYXAtc3RvcmUiOgki
ZW5mb3JjZSIsCgkJInNuYXAuc25hcC1zdG9yZS51YnVudHUtc29mdHdhcmUiOgkiZW5mb3Jj
ZSIsCgkJInNuYXAuc25hcC1zdG9yZS51YnVudHUtc29mdHdhcmUtbG9jYWwtZmlsZSI6CSJl
bmZvcmNlIiwKCQkibGlicmVvZmZpY2Utb29wc2xhc2giOgkiY29tcGxhaW4iLAoJCSJsaWJy
ZW9mZmljZS1zb2ZmaWNlIjoJImNvbXBsYWluIiwKCQkiZXhhbXBsZSI6CSJraWxsIiwKCQki
dGVzdCI6CSJ1bmNvbmZpbmVkIiwKCQkiaW50ZXJhY3RpdmUiOgkicHJvbXB0IgoJfSwKCSJw
cm9jZXNzZXMiOgl7CgkJIi91c3Ivc2Jpbi9jdXBzLWJyb3dzZWQiOglbewoJCQkJInByb2Zp
bGUiOgkiL3Vzci9zYmluL2N1cHMtYnJvd3NlZCIsCgkJCQkicGlkIjoJIjYyNCIsCgkJCQki
c3RhdHVzIjoJImVuZm9yY2UiCgkJCX1dLAoJCSIvdXNyL3NiaW4vY3Vwc2QiOglbewoJCQkJ
InByb2ZpbGUiOgkiL3Vzci9zYmluL2N1cHNkIiwKCQkJCSJwaWQiOgkiNTIwIiwKCQkJCSJz
dGF0dXMiOgkiZW5mb3JjZSIKCQkJfV0sCgkJIi91c3IvYmluL2Jhc2giOglbewoJCQkJInBy
b2ZpbGUiOgkidGVzdCIsCgkJCQkicGlkIjoJIjE0NjYiLAoJCQkJInN0YXR1cyI6CSJ1bmNv
bmZpbmVkIgoJCQl9XSwKCQkiL3Vzci9iaW4vY2F0IjoJW3sKCQkJCSJwcm9maWxlIjoJImlu
dGVyYWN0aXZlLy8mOm5zOmZvbyIsCgkJCQkicGlkIjoJIjE1MDIiLAoJCQkJInN0YXR1cyI6
CSJtaXhlZCIKCQkJfV0sCgkJIi91c3IvYmluL2NhdCI6CVt7CgkJCQkicHJvZmlsZSI6CSJl
eGFtcGxlIiwKCQkJCSJwaWQiOgkiMTQ3NCIsCgkJCQkic3RhdHVzIjoJImtpbGwiCgkJCX1d
LAoJCSIvdXNyL2Jpbi9jYXQiOglbewoJCQkJInByb2ZpbGUiOgkiaW50ZXJhY3RpdmUiLAoJ
CQkJInBpZCI6CSIxNDc1IiwKCQkJCSJzdGF0dXMiOgkicHJvbXB0IgoJCQl9LCB7CgkJCQki
cHJvZmlsZSI6CSJpbnRlcmFjdGl2ZS8vJnVuY29uZmluZWQiLAoJCQkJInBpZCI6CSIxNDk3
IiwKCQkJCSJzdGF0dXMiOgkicHJvbXB0IgoJCQl9LCB7CgkJCQkicHJvZmlsZSI6CSJpbnRl
cmFjdGl2ZS8vJjpuczp1bmNvbmZpbmVkIiwKCQkJCSJwaWQiOgkiMTQ5OSIsCgkJCQkic3Rh
dHVzIjoJInByb21wdCIKCQkJfV0KCX0KfQo=
--------------73CDA8A9139690D6E2F175F9
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

LS0gCkFwcEFybW9yIG1haWxpbmcgbGlzdApBcHBBcm1vckBsaXN0cy51YnVudHUuY29tCk1vZGlm
eSBzZXR0aW5ncyBvciB1bnN1YnNjcmliZSBhdDogaHR0cHM6Ly9saXN0cy51YnVudHUuY29tL21h
aWxtYW4vbGlzdGluZm8vYXBwYXJtb3IK

--------------73CDA8A9139690D6E2F175F9--


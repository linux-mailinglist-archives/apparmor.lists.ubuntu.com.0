Return-Path: <apparmor-bounces@lists.ubuntu.com>
X-Original-To: lists+apparmor@lfdr.de
Delivered-To: lists+apparmor@lfdr.de
Received: from huckleberry.canonical.com (huckleberry.canonical.com [91.189.94.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 833CE643E4E
	for <lists+apparmor@lfdr.de>; Tue,  6 Dec 2022 09:16:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=huckleberry.canonical.com)
	by huckleberry.canonical.com with esmtp (Exim 4.86_2)
	(envelope-from <apparmor-bounces@lists.ubuntu.com>)
	id 1p2T85-0001M4-79; Tue, 06 Dec 2022 08:16:41 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by huckleberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <rmoar@google.com>) id 1p2FCM-00077L-G0
 for apparmor@lists.ubuntu.com; Mon, 05 Dec 2022 17:24:10 +0000
Received: by mail-oi1-f171.google.com with SMTP id r11so8114218oie.13
 for <apparmor@lists.ubuntu.com>; Mon, 05 Dec 2022 09:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IQAEMzBbdOAR8h8xDm7DaAJioHIFFGxMlY7wT+t3r9A=;
 b=CcUB3kyBXg68bQ8CX1W2T3uWr+iqJ57H/GSJnDvXU1EaqCxDcO9b/XoL587/UNJGhy
 TwWDnCZr2N5uGGLDSVjYPsDF21g+YLdm4erujlBGypCcf2M28z11jdS/Q7V4/JBNpPEM
 tbZzEkKBgJWrryNqr+F1JLGzeUgsDxCXnlk3hrfc8FKYQETn6Fi4k30ZCEJWGsw09zoz
 PE9Qja6edcyrJ6KRG1Jp/oAzujFOcS1XO8+pbNjQ1SrlkNOzcZjbBQ27JRDgSEueteiV
 m6nA38oAz1PaUytRcRIwKaaFPKlbwN5LaWku80+BP/lONjBkEVKd7icQf6PaMmcCsDpv
 G3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IQAEMzBbdOAR8h8xDm7DaAJioHIFFGxMlY7wT+t3r9A=;
 b=HSPvoUFBDhtHUkCQaeZP5g2A6dPDaMFbrvLI/l0Ej3TPdfWzVeiQftHKqN6vwwT36y
 r4ynx8JOLx7RLIQiu6maEDu+NKMeC+s22Nk1ufJMgB+jo29mQn5nnTyKujEwWnxTxL03
 q6rqxfZaeVbWCX0XeNN5+/OjoLd2itQ5Br9Xzoh7+zrmplQpxHEbdpnRL/qZJv1RYhc2
 pmODZbugbIHcKTn70bgNAsVjTF97OUMOlWu6om1c6nzlzTV/SbPmUMNlGOWAdf6TtBQ5
 FshxXnTW3XvrjMUqqFm/49KNi40O/LC4mk8gYddrmxoA5xC996LLqRMgCP53kRIZZbJU
 n5IA==
X-Gm-Message-State: ANoB5pmRN42fUnuqw5Js3PBqHeavKSI4qI61Qq5EYtjXdOpr6DQJhVnH
 LnGJeNhBYiwa7AC0c06ykib+zo1/AtRKskHUe2+wYA==
X-Google-Smtp-Source: AA0mqf7VJD4/cW+V7Dkv0K0dbmrbeWMHMjc52ewv444iMnrBDOAl4GhqyrDT/6IphWNebFkkf3P2uns3MxMAlDAT8YU=
X-Received: by 2002:aca:e10b:0:b0:35b:dc0a:33bb with SMTP id
 y11-20020acae10b000000b0035bdc0a33bbmr11189391oig.122.1670261048894; Mon, 05
 Dec 2022 09:24:08 -0800 (PST)
MIME-Version: 1.0
References: <20221102175959.2921063-1-rmoar@google.com>
 <20221102175959.2921063-3-rmoar@google.com>
 <3fbf707a-fc9e-18c6-dc40-ec266bd524e5@canonical.com>
 <CABVgOSkTojOjNv05aiD9tV7Vw12QOTtw9H9qCPFjjm_COdKb8w@mail.gmail.com>
 <d5dec6d1-471c-ca23-bd08-75b499556158@canonical.com>
In-Reply-To: <d5dec6d1-471c-ca23-bd08-75b499556158@canonical.com>
From: Rae Moar <rmoar@google.com>
Date: Mon, 5 Dec 2022 12:23:55 -0500
Message-ID: <CA+GJov60exVmyS93gv1n1qT=DoaVVgfcVFvEfzobi1qtLiGKhg@mail.gmail.com>
To: John Johansen <john.johansen@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 06 Dec 2022 08:16:39 +0000
Subject: Re: [apparmor] [PATCH v1 2/2] apparmor: test: make static symbols
 visible during kunit testing
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
Cc: apparmor@lists.ubuntu.com, linux-kselftest@vger.kernel.org,
 tales.aparecida@gmail.com, dlatypov@google.com, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, David Gow <davidgow@google.com>,
 skhan@linuxfoundation.org, kunit-dev@googlegroups.com
Errors-To: apparmor-bounces@lists.ubuntu.com
Sender: "AppArmor" <apparmor-bounces@lists.ubuntu.com>

On Wed, Nov 23, 2022 at 11:49 PM John Johansen
<john.johansen@canonical.com> wrote:
>
> On 11/23/22 01:19, David Gow wrote:
> > On Tue, Nov 22, 2022 at 2:20 PM John Johansen
> > <john.johansen@canonical.com> wrote:
> >>
> >> On 11/2/22 10:59, Rae Moar wrote:
> >>> Use macros, VISIBLE_IF_KUNIT and EXPORT_SYMBOL_IF_KUNIT, to allow
> >>> static symbols to be conditionally set to be visible during KUnit
> >>> testing. Remove the need to include testing file in the implementation
> >>> file. Provide example of how static symbols can be dealt with in
> >>> testing.
> >>>
> >>> Signed-off-by: Rae Moar <rmoar@google.com>
> >>> ---
> >>>    security/apparmor/Kconfig                 |  4 +-
> >>>    security/apparmor/Makefile                |  2 +
> >>>    security/apparmor/include/policy_unpack.h | 50 ++++++++++++++++
> >>>    security/apparmor/policy_unpack.c         | 72 +++++++----------------
> >>>    security/apparmor/policy_unpack_test.c    |  5 ++
> >>>    5 files changed, 80 insertions(+), 53 deletions(-)
> >>>
> >>> diff --git a/security/apparmor/Kconfig b/security/apparmor/Kconfig
> >>> index cb3496e00d8a..f334e7cccf2d 100644
> >>> --- a/security/apparmor/Kconfig
> >>> +++ b/security/apparmor/Kconfig
> >>> @@ -106,8 +106,8 @@ config SECURITY_APPARMOR_PARANOID_LOAD
> >>>          Disabling the check will speed up policy loads.
> >>>
> >>>    config SECURITY_APPARMOR_KUNIT_TEST
> >>> -     bool "Build KUnit tests for policy_unpack.c" if !KUNIT_ALL_TESTS
> >>> -     depends on KUNIT=y && SECURITY_APPARMOR
> >>> +     tristate "Build KUnit tests for policy_unpack.c" if !KUNIT_ALL_TESTS
> >>> +     depends on KUNIT && SECURITY_APPARMOR
> >>>        default KUNIT_ALL_TESTS
> >>>        help
> >>>          This builds the AppArmor KUnit tests.
> >>> diff --git a/security/apparmor/Makefile b/security/apparmor/Makefile
> >>> index ff23fcfefe19..6a92428375eb 100644
> >>> --- a/security/apparmor/Makefile
> >>> +++ b/security/apparmor/Makefile
> >>> @@ -8,6 +8,8 @@ apparmor-y := apparmorfs.o audit.o capability.o task.o ipc.o lib.o match.o \
> >>>                  resource.o secid.o file.o policy_ns.o label.o mount.o net.o
> >>>    apparmor-$(CONFIG_SECURITY_APPARMOR_HASH) += crypto.o
> >>>
> >>> +obj-$(CONFIG_SECURITY_APPARMOR_KUNIT_TEST) += policy_unpack_test.o
> >>> +
> >>>    clean-files := capability_names.h rlim_names.h net_names.h
> >>>
> >>>    # Build a lower case string table of address family names
> >>> diff --git a/security/apparmor/include/policy_unpack.h b/security/apparmor/include/policy_unpack.h
> >>> index eb5f7d7f132b..a963687bcc9b 100644
> >>> --- a/security/apparmor/include/policy_unpack.h
> >>> +++ b/security/apparmor/include/policy_unpack.h
> >>> @@ -48,6 +48,43 @@ enum {
> >>>        AAFS_LOADDATA_NDENTS            /* count of entries */
> >>>    };
> >>>
> >>> +/*
> >>> + * The AppArmor interface treats data as a type byte followed by the
> >>> + * actual data.  The interface has the notion of a named entry
> >>> + * which has a name (AA_NAME typecode followed by name string) followed by
> >>> + * the entries typecode and data.  Named types allow for optional
> >>> + * elements and extensions to be added and tested for without breaking
> >>> + * backwards compatibility.
> >>> + */
> >>> +
> >>> +enum aa_code {
> >>> +     AA_U8,
> >>> +     AA_U16,
> >>> +     AA_U32,
> >>> +     AA_U64,
> >>> +     AA_NAME,                /* same as string except it is items name */
> >>> +     AA_STRING,
> >>> +     AA_BLOB,
> >>> +     AA_STRUCT,
> >>> +     AA_STRUCTEND,
> >>> +     AA_LIST,
> >>> +     AA_LISTEND,
> >>> +     AA_ARRAY,
> >>> +     AA_ARRAYEND,
> >>> +};
> >>> +
> >>> +/*
> >>> + * aa_ext is the read of the buffer containing the serialized profile.  The
> >>> + * data is copied into a kernel buffer in apparmorfs and then handed off to
> >>> + * the unpack routines.
> >>> + */
> >>> +struct aa_ext {
> >>> +     void *start;
> >>> +     void *end;
> >>> +     void *pos;              /* pointer to current position in the buffer */
> >>> +     u32 version;
> >>> +};
> >>> +
> >>
> >> hrmmm, I prefer these symbols to be only available to the unpack code but can
> >> live with them being more widely available.
> >>
> >>>    /*
> >>>     * struct aa_loaddata - buffer of policy raw_data set
> >>>     *
> >>> @@ -126,4 +163,17 @@ static inline void aa_put_loaddata(struct aa_loaddata *data)
> >>>                kref_put(&data->count, aa_loaddata_kref);
> >>>    }
> >>>
> >>> +#if IS_ENABLED(CONFIG_KUNIT)
> >>> +bool inbounds(struct aa_ext *e, size_t size);
> >>> +size_t unpack_u16_chunk(struct aa_ext *e, char **chunk);
> >>> +bool unpack_X(struct aa_ext *e, enum aa_code code);
> >>> +bool unpack_nameX(struct aa_ext *e, enum aa_code code, const char *name);
> >>> +bool unpack_u32(struct aa_ext *e, u32 *data, const char *name);
> >>> +bool unpack_u64(struct aa_ext *e, u64 *data, const char *name);
> >>> +size_t unpack_array(struct aa_ext *e, const char *name);
> >>> +size_t unpack_blob(struct aa_ext *e, char **blob, const char *name);
> >>> +int unpack_str(struct aa_ext *e, const char **string, const char *name);
> >>> +int unpack_strdup(struct aa_ext *e, char **string, const char *name);
> >>
> >> So this is a problem. If this symbols are going to be visible outside of the
> >> unpack code they need to be prefixed with aa_ to help avoid collisions with
> >> other kernel code.
> >>
> >
> > Hmm... I agree we need some sort of way of restricting access to these symbols.
> >
> > As-is, they're _exported_ to a different symbol namespace, so it
>
> if by exported you mean static. This particular set of symbols is not
> exported in a header and each function is static. They are accessible
> to the kunit tests because of some what gross
>
> #ifdef CONFIG_SECURITY_APPARMOR_KUNIT_TEST
> #include "policy_unpack_test.c"
> #endif /* CONFIG_SECURITY_APPARMOR_KUNIT_TEST */
>
> at the end of the file. And of course this means these tests can't be
> built as a module
>
> > shouldn't be a problem during linking when built as a module, nor if
> > KUnit is disabled (due to the preprocessor step).
> >
> right
>
> > One option is to put these in a separate header (that only the test
> > and policy-unpack code include), but even that doesn't solve the
> > linking problem when built-in.
> >
> a separate header might be as a pseudo documentation step but the
> reality is that I can't see anyone else including the existing header
> so its not really required.
>
> > So I guess namespacing is the only option which solves all of these
> > problems. (It'd be nice if the symbol namespacing system worked for
> > built-ins as well as modules...)
> >
> yeah
>
> >>> +#endif
> >>> +
> >>>    #endif /* __POLICY_INTERFACE_H */
> >>> diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy_unpack.c
> >>> index 55d31bac4f35..c23aa70349aa 100644
> >>> --- a/security/apparmor/policy_unpack.c
> >>> +++ b/security/apparmor/policy_unpack.c
> >>> @@ -14,6 +14,7 @@
> >>>     */
> >>>
> >>>    #include <asm/unaligned.h>
> >>> +#include <kunit/visibility.h>
> >>>    #include <linux/ctype.h>
> >>>    #include <linux/errno.h>
> >>>    #include <linux/zlib.h>
> >>> @@ -37,43 +38,6 @@
> >>>    #define v7  7
> >>>    #define v8  8       /* full network masking */
> >>>
> >>> -/*
> >>> - * The AppArmor interface treats data as a type byte followed by the
> >>> - * actual data.  The interface has the notion of a named entry
> >>> - * which has a name (AA_NAME typecode followed by name string) followed by
> >>> - * the entries typecode and data.  Named types allow for optional
> >>> - * elements and extensions to be added and tested for without breaking
> >>> - * backwards compatibility.
> >>> - */
> >>> -
> >>> -enum aa_code {
> >>> -     AA_U8,
> >>> -     AA_U16,
> >>> -     AA_U32,
> >>> -     AA_U64,
> >>> -     AA_NAME,                /* same as string except it is items name */
> >>> -     AA_STRING,
> >>> -     AA_BLOB,
> >>> -     AA_STRUCT,
> >>> -     AA_STRUCTEND,
> >>> -     AA_LIST,
> >>> -     AA_LISTEND,
> >>> -     AA_ARRAY,
> >>> -     AA_ARRAYEND,
> >>> -};
> >>> -
> >>> -/*
> >>> - * aa_ext is the read of the buffer containing the serialized profile.  The
> >>> - * data is copied into a kernel buffer in apparmorfs and then handed off to
> >>> - * the unpack routines.
> >>> - */
> >>> -struct aa_ext {
> >>> -     void *start;
> >>> -     void *end;
> >>> -     void *pos;              /* pointer to current position in the buffer */
> >>> -     u32 version;
> >>> -};
> >>> -
> >>>    /* audit callback for unpack fields */
> >>>    static void audit_cb(struct audit_buffer *ab, void *va)
> >>>    {
> >>> @@ -199,10 +163,11 @@ struct aa_loaddata *aa_loaddata_alloc(size_t size)
> >>>    }
> >>>
> >>>    /* test if read will be in packed data bounds */
> >>> -static bool inbounds(struct aa_ext *e, size_t size)
> >>> +VISIBLE_IF_KUNIT bool inbounds(struct aa_ext *e, size_t size)
> >>>    {
> >>>        return (size <= e->end - e->pos);
> >>>    }
> >>> +EXPORT_SYMBOL_IF_KUNIT(inbounds);
> >>>
> >>>    static void *kvmemdup(const void *src, size_t len)
> >>>    {
> >>> @@ -220,7 +185,7 @@ static void *kvmemdup(const void *src, size_t len)
> >>>     *
> >>>     * Returns: the size of chunk found with the read head at the end of the chunk.
> >>>     */
> >>> -static size_t unpack_u16_chunk(struct aa_ext *e, char **chunk)
> >>> +VISIBLE_IF_KUNIT size_t unpack_u16_chunk(struct aa_ext *e, char **chunk)
> >>>    {
> >>>        size_t size = 0;
> >>>        void *pos = e->pos;
> >>> @@ -239,9 +204,10 @@ static size_t unpack_u16_chunk(struct aa_ext *e, char **chunk)
> >>>        e->pos = pos;
> >>>        return 0;
> >>>    }
> >>> +EXPORT_SYMBOL_IF_KUNIT(unpack_u16_chunk);
> >>>
> >>>    /* unpack control byte */
> >>> -static bool unpack_X(struct aa_ext *e, enum aa_code code)
> >>> +VISIBLE_IF_KUNIT bool unpack_X(struct aa_ext *e, enum aa_code code)
> >>>    {
> >>>        if (!inbounds(e, 1))
> >>>                return false;
> >>> @@ -250,6 +216,7 @@ static bool unpack_X(struct aa_ext *e, enum aa_code code)
> >>>        e->pos++;
> >>>        return true;
> >>>    }
> >>> +EXPORT_SYMBOL_IF_KUNIT(unpack_X);
> >>>
> >>>    /**
> >>>     * unpack_nameX - check is the next element is of type X with a name of @name
> >>> @@ -267,7 +234,7 @@ static bool unpack_X(struct aa_ext *e, enum aa_code code)
> >>>     *
> >>>     * Returns: false if either match fails, the read head does not move
> >>>     */
> >>> -static bool unpack_nameX(struct aa_ext *e, enum aa_code code, const char *name)
> >>> +VISIBLE_IF_KUNIT bool unpack_nameX(struct aa_ext *e, enum aa_code code, const char *name)
> >>>    {
> >>>        /*
> >>>         * May need to reset pos if name or type doesn't match
> >>> @@ -296,6 +263,7 @@ static bool unpack_nameX(struct aa_ext *e, enum aa_code code, const char *name)
> >>>        e->pos = pos;
> >>>        return false;
> >>>    }
> >>> +EXPORT_SYMBOL_IF_KUNIT(unpack_nameX);
> >>>
> >>>    static bool unpack_u8(struct aa_ext *e, u8 *data, const char *name)
> >>>    {
> >>> @@ -315,7 +283,7 @@ static bool unpack_u8(struct aa_ext *e, u8 *data, const char *name)
> >>>        return false;
> >>>    }
> >>>
> >>> -static bool unpack_u32(struct aa_ext *e, u32 *data, const char *name)
> >>> +VISIBLE_IF_KUNIT bool unpack_u32(struct aa_ext *e, u32 *data, const char *name)
> >>>    {
> >>>        void *pos = e->pos;
> >>>
> >>> @@ -332,8 +300,9 @@ static bool unpack_u32(struct aa_ext *e, u32 *data, const char *name)
> >>>        e->pos = pos;
> >>>        return false;
> >>>    }
> >>> +EXPORT_SYMBOL_IF_KUNIT(unpack_u32);
> >>>
> >>> -static bool unpack_u64(struct aa_ext *e, u64 *data, const char *name)
> >>> +VISIBLE_IF_KUNIT bool unpack_u64(struct aa_ext *e, u64 *data, const char *name)
> >>>    {
> >>>        void *pos = e->pos;
> >>>
> >>> @@ -350,8 +319,9 @@ static bool unpack_u64(struct aa_ext *e, u64 *data, const char *name)
> >>>        e->pos = pos;
> >>>        return false;
> >>>    }
> >>> +EXPORT_SYMBOL_IF_KUNIT(unpack_u64);
> >>>
> >>> -static size_t unpack_array(struct aa_ext *e, const char *name)
> >>> +VISIBLE_IF_KUNIT size_t unpack_array(struct aa_ext *e, const char *name)
> >>>    {
> >>>        void *pos = e->pos;
> >>>
> >>> @@ -368,8 +338,9 @@ static size_t unpack_array(struct aa_ext *e, const char *name)
> >>>        e->pos = pos;
> >>>        return 0;
> >>>    }
> >>> +EXPORT_SYMBOL_IF_KUNIT(unpack_array);
> >>>
> >>> -static size_t unpack_blob(struct aa_ext *e, char **blob, const char *name)
> >>> +VISIBLE_IF_KUNIT size_t unpack_blob(struct aa_ext *e, char **blob, const char *name)
> >>>    {
> >>>        void *pos = e->pos;
> >>>
> >>> @@ -390,8 +361,9 @@ static size_t unpack_blob(struct aa_ext *e, char **blob, const char *name)
> >>>        e->pos = pos;
> >>>        return 0;
> >>>    }
> >>> +EXPORT_SYMBOL_IF_KUNIT(unpack_blob);
> >>>
> >>> -static int unpack_str(struct aa_ext *e, const char **string, const char *name)
> >>> +VISIBLE_IF_KUNIT int unpack_str(struct aa_ext *e, const char **string, const char *name)
> >>>    {
> >>>        char *src_str;
> >>>        size_t size = 0;
> >>> @@ -413,8 +385,9 @@ static int unpack_str(struct aa_ext *e, const char **string, const char *name)
> >>>        e->pos = pos;
> >>>        return 0;
> >>>    }
> >>> +EXPORT_SYMBOL_IF_KUNIT(unpack_str);
> >>>
> >>> -static int unpack_strdup(struct aa_ext *e, char **string, const char *name)
> >>> +VISIBLE_IF_KUNIT int unpack_strdup(struct aa_ext *e, char **string, const char *name)
> >>>    {
> >>>        const char *tmp;
> >>>        void *pos = e->pos;
> >>> @@ -432,6 +405,7 @@ static int unpack_strdup(struct aa_ext *e, char **string, const char *name)
> >>>
> >>>        return res;
> >>>    }
> >>> +EXPORT_SYMBOL_IF_KUNIT(unpack_strdup);
> >>>
> >> Again if the symbols are going to be exported they need the aa_ prefix
> >>
> >> But I am not sure this is worth doing, exporting a lot of symbols just so the
> >> test code can be built as a module doesn't seem worth it to me.
> >>
> >
> > Again, agreed that we need to namespace these for the non-module case
> > (the symbol namespacing should be okay otherwise).
> >
> > One of the reasons behind doing this is that there are a few KUnit
> > users who can only run tests which are built as modules. In
> > particular, Android and (IIRC) Red Hat are both configuring all of
> > their kernels with KUnit built as a module, and distributing the KUnit
> > and KUnit test modules in a different package.
> >
> ah, okay
>
> > If we kept things the way there are, then it'd not be possible to
> > unconditionally _build_ the apparmor tests, but only load and run them
> > on demand (due to the way they're built into the apparmor module,
> > they'd always run when it loads). This is a no-go for Android/Red Hat,
> > so they won't ship or run the apparmor tests. (There are some other
> > tests with the same problem, notably amdgpu, but apparmor seemed a
> > nice first trial-user, as it were, having a small but non-trivial
> > number of symbols to export.)
> >
> > Thoughts?
> >
> I'm not opposed to exporting them. It has a cost and I wanted there to
> be a real need before doing it. Since that need has been explained, my
> only requirement is to make sure they are properly namespaced.
>

Hello!

Thanks to David and John for the helpful comments and sorry for the
delay in my response. It seems that there has been somewhat of an
agreement that these changes are acceptable but the symbols that will
be exported must be properly namespaced with the aa_ prefix. This
makes a lot of sense to me and I will go ahead and make a v2 with
those changes.

-Rae

> >>>
> >>>    /**
> >>> @@ -1251,7 +1225,3 @@ int aa_unpack(struct aa_loaddata *udata, struct list_head *lh,
> >>>
> >>>        return error;
> >>>    }
> >>> -
> >>> -#ifdef CONFIG_SECURITY_APPARMOR_KUNIT_TEST
> >>> -#include "policy_unpack_test.c"
> >>> -#endif /* CONFIG_SECURITY_APPARMOR_KUNIT_TEST */
> >>> diff --git a/security/apparmor/policy_unpack_test.c b/security/apparmor/policy_unpack_test.c
> >>> index 0a969b2e03db..3474fe2cd922 100644
> >>> --- a/security/apparmor/policy_unpack_test.c
> >>> +++ b/security/apparmor/policy_unpack_test.c
> >>> @@ -4,6 +4,7 @@
> >>>     */
> >>>
> >>>    #include <kunit/test.h>
> >>> +#include <kunit/visibility.h>
> >>>
> >>>    #include "include/policy.h"
> >>>    #include "include/policy_unpack.h"
> >>> @@ -43,6 +44,8 @@
> >>>    #define TEST_ARRAY_BUF_OFFSET \
> >>>        (TEST_NAMED_ARRAY_BUF_OFFSET + 3 + strlen(TEST_ARRAY_NAME) + 1)
> >>>
> >>> +MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> >>> +
> >>>    struct policy_unpack_fixture {
> >>>        struct aa_ext *e;
> >>>        size_t e_size;
> >>> @@ -605,3 +608,5 @@ static struct kunit_suite apparmor_policy_unpack_test_module = {
> >>>    };
> >>>
> >>>    kunit_test_suite(apparmor_policy_unpack_test_module);
> >>> +
> >>> +MODULE_LICENSE("GPL");
> >>
>


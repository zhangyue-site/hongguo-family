.class public final Lcom/sun/jna/Platform;
.super Ljava/lang/Object;
.source "Platform.java"


# static fields
.field public static final AIX:I = 0x7

.field public static final ANDROID:I = 0x8

.field public static final ARCH:Ljava/lang/String;

.field public static final C_LIBRARY_NAME:Ljava/lang/String;

.field public static final FREEBSD:I = 0x4

.field public static final GNU:I = 0x9

.field public static final HAS_AWT:Z

.field public static final HAS_BUFFERS:Z

.field public static final HAS_DLL_CALLBACKS:Z

.field public static final HAS_JAWT:Z

.field public static final KFREEBSD:I = 0xa

.field public static final LINUX:I = 0x1

.field public static final MAC:I = 0x0

.field public static final MATH_LIBRARY_NAME:Ljava/lang/String;

.field public static final NETBSD:I = 0xb

.field public static final OPENBSD:I = 0x5

.field public static final RESOURCE_PREFIX:Ljava/lang/String;

.field public static final RO_FIELDS:Z

.field public static final SOLARIS:I = 0x3

.field public static final UNSPECIFIED:I = -0x1

.field public static final WINDOWS:I = 0x2

.field public static final WINDOWSCE:I = 0x6

.field private static final osType:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 72
    const-string v0, "os.name"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 73
    .local v0, "osName":Ljava/lang/String;
    const-string v1, "Linux"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/16 v2, 0x8

    const/4 v3, 0x7

    const/4 v4, 0x2

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz v1, :cond_1

    .line 74
    const-string v1, "java.vm.name"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v8, "dalvik"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 75
    sput v2, Lcom/sun/jna/Platform;->osType:I

    .line 77
    const-string v1, "jna.nounpack"

    const-string v8, "true"

    invoke-static {v1, v8}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto/16 :goto_2

    .line 80
    :cond_0
    sput v7, Lcom/sun/jna/Platform;->osType:I

    goto/16 :goto_2

    .line 83
    :cond_1
    const-string v1, "AIX"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 84
    sput v3, Lcom/sun/jna/Platform;->osType:I

    goto/16 :goto_2

    .line 86
    :cond_2
    const-string v1, "Mac"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_d

    const-string v1, "Darwin"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto/16 :goto_1

    .line 89
    :cond_3
    const-string v1, "Windows CE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 90
    sput v5, Lcom/sun/jna/Platform;->osType:I

    goto/16 :goto_2

    .line 92
    :cond_4
    const-string v1, "Windows"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 93
    sput v4, Lcom/sun/jna/Platform;->osType:I

    goto :goto_2

    .line 95
    :cond_5
    const-string v1, "Solaris"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_c

    const-string v1, "SunOS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_0

    .line 98
    :cond_6
    const-string v1, "FreeBSD"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 99
    const/4 v1, 0x4

    sput v1, Lcom/sun/jna/Platform;->osType:I

    goto :goto_2

    .line 101
    :cond_7
    const-string v1, "OpenBSD"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 102
    const/4 v1, 0x5

    sput v1, Lcom/sun/jna/Platform;->osType:I

    goto :goto_2

    .line 104
    :cond_8
    const-string v1, "gnu"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 105
    const/16 v1, 0x9

    sput v1, Lcom/sun/jna/Platform;->osType:I

    goto :goto_2

    .line 107
    :cond_9
    const-string v1, "gnu/kfreebsd"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 108
    const/16 v1, 0xa

    sput v1, Lcom/sun/jna/Platform;->osType:I

    goto :goto_2

    .line 110
    :cond_a
    const-string v1, "netbsd"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 111
    const/16 v1, 0xb

    sput v1, Lcom/sun/jna/Platform;->osType:I

    goto :goto_2

    .line 114
    :cond_b
    const/4 v1, -0x1

    sput v1, Lcom/sun/jna/Platform;->osType:I

    goto :goto_2

    .line 96
    :cond_c
    :goto_0
    const/4 v1, 0x3

    sput v1, Lcom/sun/jna/Platform;->osType:I

    goto :goto_2

    .line 87
    :cond_d
    :goto_1
    sput v6, Lcom/sun/jna/Platform;->osType:I

    .line 116
    :goto_2
    const/4 v1, 0x0

    .line 118
    .local v1, "hasBuffers":Z
    :try_start_0
    const-string v8, "java.nio.Buffer"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    const/4 v1, 0x1

    .line 122
    goto :goto_3

    .line 121
    :catch_0
    move-exception v8

    .line 126
    :goto_3
    sget v8, Lcom/sun/jna/Platform;->osType:I

    if-eq v8, v5, :cond_e

    sget v8, Lcom/sun/jna/Platform;->osType:I

    if-eq v8, v2, :cond_e

    sget v2, Lcom/sun/jna/Platform;->osType:I

    if-eq v2, v3, :cond_e

    const/4 v2, 0x1

    goto :goto_4

    :cond_e
    const/4 v2, 0x0

    :goto_4
    sput-boolean v2, Lcom/sun/jna/Platform;->HAS_AWT:Z

    .line 127
    sget-boolean v2, Lcom/sun/jna/Platform;->HAS_AWT:Z

    if-eqz v2, :cond_f

    sget v2, Lcom/sun/jna/Platform;->osType:I

    if-eqz v2, :cond_f

    const/4 v2, 0x1

    goto :goto_5

    :cond_f
    const/4 v2, 0x0

    :goto_5
    sput-boolean v2, Lcom/sun/jna/Platform;->HAS_JAWT:Z

    .line 128
    sput-boolean v1, Lcom/sun/jna/Platform;->HAS_BUFFERS:Z

    .line 129
    sget v2, Lcom/sun/jna/Platform;->osType:I

    if-eq v2, v5, :cond_10

    const/4 v2, 0x1

    goto :goto_6

    :cond_10
    const/4 v2, 0x0

    :goto_6
    sput-boolean v2, Lcom/sun/jna/Platform;->RO_FIELDS:Z

    .line 130
    sget v2, Lcom/sun/jna/Platform;->osType:I

    const-string v3, "coredll"

    const-string v8, "msvcrt"

    if-ne v2, v4, :cond_11

    move-object v2, v8

    goto :goto_7

    :cond_11
    sget v2, Lcom/sun/jna/Platform;->osType:I

    if-ne v2, v5, :cond_12

    move-object v2, v3

    goto :goto_7

    :cond_12
    const-string v2, "c"

    :goto_7
    sput-object v2, Lcom/sun/jna/Platform;->C_LIBRARY_NAME:Ljava/lang/String;

    .line 131
    sget v2, Lcom/sun/jna/Platform;->osType:I

    if-ne v2, v4, :cond_13

    move-object v3, v8

    goto :goto_8

    :cond_13
    sget v2, Lcom/sun/jna/Platform;->osType:I

    if-ne v2, v5, :cond_14

    goto :goto_8

    :cond_14
    const-string v3, "m"

    :goto_8
    sput-object v3, Lcom/sun/jna/Platform;->MATH_LIBRARY_NAME:Ljava/lang/String;

    .line 132
    const-string v2, "os.arch"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget v3, Lcom/sun/jna/Platform;->osType:I

    invoke-static {v2, v3}, Lcom/sun/jna/Platform;->getCanonicalArchitecture(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    .line 134
    sget v2, Lcom/sun/jna/Platform;->osType:I

    if-ne v2, v4, :cond_15

    sget-object v2, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    const-string v3, "aarch"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_15

    const/4 v6, 0x1

    :cond_15
    sput-boolean v6, Lcom/sun/jna/Platform;->HAS_DLL_CALLBACKS:Z

    .line 135
    invoke-static {}, Lcom/sun/jna/Platform;->getNativeLibraryResourcePrefix()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/sun/jna/Platform;->RESOURCE_PREFIX:Ljava/lang/String;

    .line 136
    .end local v0    # "osName":Ljava/lang/String;
    .end local v1    # "hasBuffers":Z
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getCanonicalArchitecture(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2
    .param p0, "arch"    # Ljava/lang/String;
    .param p1, "platform"    # I

    .line 238
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 239
    const-string v0, "powerpc"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 240
    const-string p0, "ppc"

    goto :goto_2

    .line 242
    :cond_0
    const-string v0, "powerpc64"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 243
    const-string p0, "ppc64"

    goto :goto_2

    .line 245
    :cond_1
    const-string v0, "i386"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "i686"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    .line 248
    :cond_2
    const-string v0, "x86_64"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "amd64"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_0

    .line 251
    :cond_3
    const-string v0, "zarch_64"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 252
    const-string p0, "s390x"

    goto :goto_2

    .line 249
    :cond_4
    :goto_0
    const-string p0, "x86-64"

    goto :goto_2

    .line 246
    :cond_5
    :goto_1
    const-string p0, "x86"

    .line 256
    :cond_6
    :goto_2
    const-string v0, "ppc64"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "sun.cpu.endian"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "little"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 257
    const-string p0, "ppc64le"

    .line 260
    :cond_7
    const-string v0, "arm"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    if-ne p1, v0, :cond_8

    invoke-static {}, Lcom/sun/jna/Platform;->isSoftFloat()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 261
    const-string p0, "armel"

    .line 264
    :cond_8
    return-object p0
.end method

.method static getNativeLibraryResourcePrefix()Ljava/lang/String;
    .locals 4

    .line 288
    const-string v0, "jna.prefix"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 289
    .local v0, "prefix":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 290
    return-object v0

    .line 292
    :cond_0
    invoke-static {}, Lcom/sun/jna/Platform;->getOSType()I

    move-result v1

    const-string v2, "os.arch"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "os.name"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/sun/jna/Platform;->getNativeLibraryResourcePrefix(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method static getNativeLibraryResourcePrefix(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "osType"    # I
    .param p1, "arch"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .line 304
    invoke-static {p1, p0}, Lcom/sun/jna/Platform;->getCanonicalArchitecture(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    .line 305
    packed-switch p0, :pswitch_data_0

    .line 340
    :pswitch_0
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 341
    .local v0, "osPrefix":Ljava/lang/String;
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 342
    .local v1, "space":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 343
    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 334
    .end local v0    # "osPrefix":Ljava/lang/String;
    .end local v1    # "space":I
    :pswitch_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "netbsd-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 335
    .restart local v0    # "osPrefix":Ljava/lang/String;
    goto/16 :goto_1

    .line 337
    .end local v0    # "osPrefix":Ljava/lang/String;
    :pswitch_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "kfreebsd-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 338
    .restart local v0    # "osPrefix":Ljava/lang/String;
    goto/16 :goto_1

    .line 307
    .end local v0    # "osPrefix":Ljava/lang/String;
    :pswitch_3
    const-string v0, "arm"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 308
    const-string p1, "arm"

    .line 310
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "android-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 311
    .restart local v0    # "osPrefix":Ljava/lang/String;
    goto/16 :goto_1

    .line 316
    .end local v0    # "osPrefix":Ljava/lang/String;
    :pswitch_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "w32ce-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 317
    .restart local v0    # "osPrefix":Ljava/lang/String;
    goto/16 :goto_1

    .line 331
    .end local v0    # "osPrefix":Ljava/lang/String;
    :pswitch_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "openbsd-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 332
    .restart local v0    # "osPrefix":Ljava/lang/String;
    goto/16 :goto_1

    .line 328
    .end local v0    # "osPrefix":Ljava/lang/String;
    :pswitch_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "freebsd-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 329
    .restart local v0    # "osPrefix":Ljava/lang/String;
    goto :goto_1

    .line 325
    .end local v0    # "osPrefix":Ljava/lang/String;
    :pswitch_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sunos-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 326
    .restart local v0    # "osPrefix":Ljava/lang/String;
    goto :goto_1

    .line 313
    .end local v0    # "osPrefix":Ljava/lang/String;
    :pswitch_8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "win32-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 314
    .restart local v0    # "osPrefix":Ljava/lang/String;
    goto :goto_1

    .line 322
    .end local v0    # "osPrefix":Ljava/lang/String;
    :pswitch_9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "linux-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 323
    .restart local v0    # "osPrefix":Ljava/lang/String;
    goto :goto_1

    .line 319
    .end local v0    # "osPrefix":Ljava/lang/String;
    :pswitch_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "darwin-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 320
    .restart local v0    # "osPrefix":Ljava/lang/String;
    goto :goto_1

    .line 345
    .restart local v1    # "space":I
    :cond_1
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 348
    .end local v1    # "space":I
    :goto_1
    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static final getOSType()I
    .locals 1

    .line 139
    sget v0, Lcom/sun/jna/Platform;->osType:I

    return v0
.end method

.method public static final hasRuntimeExec()Z
    .locals 2

    .line 183
    invoke-static {}, Lcom/sun/jna/Platform;->isWindowsCE()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "java.vm.name"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "J9"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 184
    const/4 v0, 0x0

    return v0

    .line 185
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public static final is64Bit()Z
    .locals 4

    .line 188
    nop

    .line 189
    const-string v0, "com.ibm.vm.bitmode"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 188
    const-string v1, "sun.arch.data.model"

    invoke-static {v1, v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 190
    .local v0, "model":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 191
    const-string v1, "64"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 193
    :cond_0
    const-string v1, "x86-64"

    sget-object v2, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_3

    sget-object v1, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    .line 194
    const-string v3, "ia64"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    sget-object v1, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    .line 195
    const-string v3, "ppc64"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "ppc64le"

    sget-object v3, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    sget-object v1, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    .line 196
    const-string v3, "sparcv9"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    sget-object v1, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    .line 197
    const-string v3, "mips64"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "mips64el"

    sget-object v3, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    sget-object v1, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    .line 198
    const-string v3, "amd64"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    sget-object v1, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    .line 199
    const-string v3, "aarch64"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    .line 202
    :cond_1
    sget v1, Lcom/sun/jna/Native;->POINTER_SIZE:I

    const/16 v3, 0x8

    if-ne v1, v3, :cond_2

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_0
    return v2

    .line 200
    :cond_3
    :goto_1
    return v2
.end method

.method public static final isAIX()Z
    .locals 2

    .line 151
    sget v0, Lcom/sun/jna/Platform;->osType:I

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static final isARM()Z
    .locals 2

    .line 220
    sget-object v0, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    const-string v1, "arm"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    const-string v1, "aarch"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static final isAndroid()Z
    .locals 2

    .line 145
    sget v0, Lcom/sun/jna/Platform;->osType:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static final isFreeBSD()Z
    .locals 2

    .line 164
    sget v0, Lcom/sun/jna/Platform;->osType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static final isGNU()Z
    .locals 2

    .line 173
    sget v0, Lcom/sun/jna/Platform;->osType:I

    const/16 v1, 0x9

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static final isIntel()Z
    .locals 2

    .line 206
    sget-object v0, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    const-string v1, "x86"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    const/4 v0, 0x1

    return v0

    .line 209
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static final isLinux()Z
    .locals 2

    .line 148
    sget v0, Lcom/sun/jna/Platform;->osType:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public static final isMIPS()Z
    .locals 2

    .line 228
    sget-object v0, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    const-string v1, "mips"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    .line 229
    const-string v1, "mips64"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    .line 230
    const-string v1, "mipsel"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    .line 231
    const-string v1, "mips64el"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 234
    :cond_0
    const/4 v0, 0x0

    return v0

    .line 232
    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public static final isMac()Z
    .locals 1

    .line 142
    sget v0, Lcom/sun/jna/Platform;->osType:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static final isNetBSD()Z
    .locals 2

    .line 170
    sget v0, Lcom/sun/jna/Platform;->osType:I

    const/16 v1, 0xb

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static final isOpenBSD()Z
    .locals 2

    .line 167
    sget v0, Lcom/sun/jna/Platform;->osType:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static final isPPC()Z
    .locals 2

    .line 213
    sget-object v0, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    const-string v1, "ppc"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 214
    const/4 v0, 0x1

    return v0

    .line 216
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static final isSPARC()Z
    .locals 2

    .line 224
    sget-object v0, Lcom/sun/jna/Platform;->ARCH:Ljava/lang/String;

    const-string v1, "sparc"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static isSoftFloat()Z
    .locals 4

    .line 269
    const-class v0, Lcom/sun/jna/Platform;

    :try_start_0
    new-instance v1, Ljava/io/File;

    const-string v2, "/proc/self/exe"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 270
    .local v1, "self":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 271
    invoke-virtual {v1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/sun/jna/ELFAnalyser;->analyse(Ljava/lang/String;)Lcom/sun/jna/ELFAnalyser;

    move-result-object v2

    .line 272
    .local v2, "ahfd":Lcom/sun/jna/ELFAnalyser;
    invoke-virtual {v2}, Lcom/sun/jna/ELFAnalyser;->isArmHardFloat()Z

    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    xor-int/lit8 v0, v0, 0x1

    return v0

    .line 270
    .end local v1    # "self":Ljava/io/File;
    .end local v2    # "ahfd":Lcom/sun/jna/ELFAnalyser;
    :cond_0
    goto :goto_0

    .line 277
    :catch_0
    move-exception v1

    .line 279
    .local v1, "ex":Ljava/lang/SecurityException;
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v2, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    const-string v3, "SecurityException while analysing \'/proc/self/exe\' or the target binary."

    invoke-virtual {v0, v2, v3, v1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 274
    .end local v1    # "ex":Ljava/lang/SecurityException;
    :catch_1
    move-exception v1

    .line 276
    .local v1, "ex":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v2, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    const-string v3, "Failed to read \'/proc/self/exe\' or the target binary."

    invoke-virtual {v0, v2, v3, v1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 280
    .end local v1    # "ex":Ljava/io/IOException;
    :goto_0
    nop

    .line 281
    :goto_1
    const/4 v0, 0x0

    return v0
.end method

.method public static final isSolaris()Z
    .locals 2

    .line 161
    sget v0, Lcom/sun/jna/Platform;->osType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static final isWindows()Z
    .locals 2

    .line 158
    sget v0, Lcom/sun/jna/Platform;->osType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    sget v0, Lcom/sun/jna/Platform;->osType:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static final isWindowsCE()Z
    .locals 2

    .line 154
    sget v0, Lcom/sun/jna/Platform;->osType:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static final isX11()Z
    .locals 1

    .line 180
    invoke-static {}, Lcom/sun/jna/Platform;->isWindows()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/sun/jna/Platform;->isMac()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static final iskFreeBSD()Z
    .locals 2

    .line 176
    sget v0, Lcom/sun/jna/Platform;->osType:I

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

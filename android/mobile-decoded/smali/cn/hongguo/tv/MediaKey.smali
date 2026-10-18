.class public final Lcn/hongguo/tv/MediaKey;
.super Ljava/lang/Object;
.source "MediaKey.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decode(Ljava/lang/String;)[B
    .locals 3

    .line 9
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x800

    if-gt v0, v1, :cond_2

    .line 10
    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    .line 12
    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x2

    if-ge v1, v2, :cond_1

    .line 13
    :try_start_0
    invoke-static {p0, v1}, Lcn/hongguo/tv/MediaKey;->unwrap([BI)[B

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    if-eqz v2, :cond_0

    .line 17
    invoke-static {p0, v0}, Ljava/util/Arrays;->fill([BB)V

    .line 14
    return-object v2

    .line 12
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 16
    :cond_1
    :try_start_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Unsupported media envelope"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    :catchall_0
    move-exception v1

    invoke-static {p0, v0}, Ljava/util/Arrays;->fill([BB)V

    throw v1

    .line 9
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid media envelope"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static hex(B)I
    .locals 2

    .line 52
    const/16 v0, 0x30

    if-lt p0, v0, :cond_0

    const/16 v1, 0x39

    if-gt p0, v1, :cond_0

    sub-int/2addr p0, v0

    goto :goto_0

    :cond_0
    const/16 v0, 0x61

    if-lt p0, v0, :cond_1

    const/16 v1, 0x66

    if-gt p0, v1, :cond_1

    sub-int/2addr p0, v0

    add-int/lit8 p0, p0, 0xa

    goto :goto_0

    :cond_1
    const/4 p0, -0x1

    :goto_0
    return p0
.end method

.method private static unwrap([BI)[B
    .locals 13

    .line 20
    array-length v0, p0

    .line 21
    const/4 v1, 0x3

    const/4 v2, 0x0

    if-lt v0, v1, :cond_10

    const/16 v1, 0x200

    if-le v0, v1, :cond_0

    goto/16 :goto_9

    .line 22
    :cond_0
    const/4 v1, 0x0

    aget-byte v3, p0, v1

    const/4 v4, 0x1

    aget-byte v5, p0, v4

    xor-int/2addr v3, v5

    const/4 v5, 0x2

    aget-byte v6, p0, v5

    xor-int/2addr v3, v6

    and-int/lit16 v3, v3, 0xff

    const/16 v6, 0x30

    sub-int/2addr v3, v6

    .line 23
    sub-int v7, v0, v3

    add-int/lit8 v8, v7, -0x1

    .line 24
    nop

    .line 25
    if-lt v3, v4, :cond_f

    if-lt v8, v4, :cond_f

    add-int/lit8 v9, v8, 0x1

    if-gt v9, v0, :cond_f

    if-ge v7, v5, :cond_1

    goto/16 :goto_8

    .line 26
    :cond_1
    new-array v0, v3, [B

    .line 27
    const/4 v5, 0x0

    :goto_0
    if-ge v5, v3, :cond_2

    aget-byte v10, p0, v8

    add-int/lit8 v11, v7, -0x2

    aget-byte v11, p0, v11

    xor-int/2addr v10, v11

    add-int v11, v7, v5

    aget-byte v11, p0, v11

    xor-int/2addr v10, v11

    int-to-byte v10, v10

    aput-byte v10, v0, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 28
    :cond_2
    new-instance v3, Ljava/lang/String;

    sget-object v5, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v3, v0, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 29
    const-string v0, "app_v2"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    const-string v0, "web_v2"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto/16 :goto_7

    .line 30
    :cond_3
    invoke-static {p0, v4, v9}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p0

    .line 32
    nop

    .line 33
    const/16 v0, 0x55

    const/16 v3, 0xfa

    const/4 v5, 0x0

    :goto_1
    :try_start_0
    array-length v7, p0

    if-ge v5, v7, :cond_6

    .line 34
    aget-byte v7, p0, v5

    and-int/lit16 v7, v7, 0xff

    .line 35
    and-int/lit8 v8, v5, 0x1

    if-eqz v8, :cond_4

    move v8, v3

    move v3, v7

    goto :goto_2

    :cond_4
    move v8, v7

    move v12, v3

    move v3, v0

    move v0, v12

    .line 36
    :goto_2
    invoke-static {v5}, Ljava/lang/Integer;->bitCount(I)I

    move-result v9

    add-int/lit8 v9, v9, 0x15

    .line 37
    if-nez p1, :cond_5

    neg-int v9, v9

    :cond_5
    xor-int/2addr v0, v7

    add-int/2addr v9, v0

    int-to-byte v0, v9

    aput-byte v0, p0, v5

    .line 38
    nop

    .line 33
    add-int/lit8 v5, v5, 0x1

    move v0, v3

    move v3, v8

    goto :goto_1

    .line 40
    :cond_6
    aget-byte p1, p0, v1

    and-int/lit16 p1, p1, 0xff

    .line 41
    if-lt p1, v6, :cond_7

    const/16 v0, 0x39

    if-gt p1, v0, :cond_7

    sub-int/2addr p1, v6

    goto :goto_3

    :cond_7
    const/16 v0, 0x61

    if-lt p1, v0, :cond_8

    const/16 v0, 0x7a

    if-gt p1, v0, :cond_8

    add-int/lit8 p1, p1, -0x57

    goto :goto_3

    :cond_8
    const/4 p1, -0x1

    .line 42
    :goto_3
    if-ltz p1, :cond_d

    array-length v0, p0

    sub-int/2addr v0, p1

    sub-int/2addr v0, v4

    const/16 p1, 0x20

    if-eq v0, p1, :cond_9

    goto :goto_6

    .line 43
    :cond_9
    const/16 p1, 0x10

    new-array v0, p1, [B

    .line 44
    const/4 v3, 0x0

    :goto_4
    if-ge v3, p1, :cond_c

    .line 45
    mul-int/lit8 v4, v3, 0x2

    add-int/lit8 v5, v4, 0x1

    aget-byte v5, p0, v5

    invoke-static {v5}, Lcn/hongguo/tv/MediaKey;->hex(B)I

    move-result v5

    add-int/lit8 v4, v4, 0x2

    aget-byte v4, p0, v4

    invoke-static {v4}, Lcn/hongguo/tv/MediaKey;->hex(B)I

    move-result v4

    .line 46
    if-ltz v5, :cond_b

    if-gez v4, :cond_a

    goto :goto_5

    .line 47
    :cond_a
    shl-int/lit8 v5, v5, 0x4

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v0, v3

    .line 44
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 46
    :cond_b
    :goto_5
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([BB)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    invoke-static {p0, v1}, Ljava/util/Arrays;->fill([BB)V

    .line 46
    return-object v2

    .line 49
    :cond_c
    nop

    .line 50
    invoke-static {p0, v1}, Ljava/util/Arrays;->fill([BB)V

    .line 49
    return-object v0

    .line 50
    :cond_d
    :goto_6
    invoke-static {p0, v1}, Ljava/util/Arrays;->fill([BB)V

    .line 42
    return-object v2

    .line 50
    :catchall_0
    move-exception p1

    invoke-static {p0, v1}, Ljava/util/Arrays;->fill([BB)V

    throw p1

    .line 29
    :cond_e
    :goto_7
    return-object v2

    .line 25
    :cond_f
    :goto_8
    return-object v2

    .line 21
    :cond_10
    :goto_9
    return-object v2
.end method

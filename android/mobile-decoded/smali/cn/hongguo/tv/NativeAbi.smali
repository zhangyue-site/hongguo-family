.class final Lcn/hongguo/tv/NativeAbi;
.super Ljava/lang/Object;
.source "NativeAbi.java"


# static fields
.field static final ARM32:Ljava/lang/String; = "armeabi-v7a"

.field static final ARM64:Ljava/lang/String; = "arm64-v8a"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static installed(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 18
    if-eqz p0, :cond_0

    const-string v0, "-standalone-arm32"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "armeabi-v7a"

    goto :goto_0

    .line 19
    :cond_0
    if-eqz p0, :cond_1

    const-string v0, "-standalone-arm64"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    const-string p0, "arm64-v8a"

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    .line 20
    :goto_0
    if-eqz p0, :cond_2

    invoke-static {p0, p1}, Lcn/hongguo/tv/NativeAbi;->supported(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 21
    return-object p0

    .line 20
    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u5b89\u88c5\u7248\u672c\u4e0e\u7cfb\u7edf\u67b6\u6784\u4e0d\u5339\u914d"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static suffix(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    const-string v0, "armeabi-v7a"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "arm32"

    return-object p0

    .line 11
    :cond_0
    const-string v0, "arm64-v8a"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const-string p0, "arm64"

    return-object p0

    .line 12
    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string v0, "\u6682\u4e0d\u652f\u6301\u6b64\u7cfb\u7edf\u67b6\u6784"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static supported(Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 4

    .line 15
    const/4 v0, 0x0

    if-eqz p1, :cond_1

    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method static verifyLibraries(Ljava/util/zip/ZipFile;Ljava/lang/String;)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 24
    invoke-static {p1}, Lcn/hongguo/tv/NativeAbi;->suffix(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    const-string v0, "armeabi-v7a"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x28

    goto :goto_1

    :cond_1
    const/16 v0, 0xb7

    .line 26
    :goto_1
    const-string v4, "libhongguo_signer.so"

    const-string v5, "libhongguo_jnidispatch.so"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_2
    if-ge v6, v2, :cond_8

    aget-object v7, v4, v6

    .line 27
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "lib/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v7

    .line 28
    if-eqz v7, :cond_7

    .line 29
    const/16 v8, 0x14

    new-array v9, v8, [B

    .line 30
    invoke-virtual {p0, v7}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v7

    const/4 v10, 0x0

    :goto_3
    if-ge v10, v8, :cond_4

    rsub-int/lit8 v11, v10, 0x14

    :try_start_0
    invoke-virtual {v7, v9, v10, v11}, Ljava/io/InputStream;->read([BII)I

    move-result v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-gez v11, :cond_2

    goto :goto_5

    :cond_2
    add-int/2addr v10, v11

    goto :goto_3

    :catchall_0
    move-exception p0

    if-eqz v7, :cond_3

    :try_start_1
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_4

    :catchall_1
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_4
    throw p0

    :cond_4
    :goto_5
    if-eqz v7, :cond_5

    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 31
    :cond_5
    if-ne v10, v8, :cond_6

    aget-byte v7, v9, v5

    const/16 v8, 0x7f

    if-ne v7, v8, :cond_6

    aget-byte v7, v9, v3

    const/16 v8, 0x45

    if-ne v7, v8, :cond_6

    aget-byte v7, v9, v2

    const/16 v8, 0x4c

    if-ne v7, v8, :cond_6

    const/4 v7, 0x3

    aget-byte v7, v9, v7

    const/16 v8, 0x46

    if-ne v7, v8, :cond_6

    const/4 v7, 0x4

    aget-byte v7, v9, v7

    if-ne v7, v1, :cond_6

    const/4 v7, 0x5

    aget-byte v7, v9, v7

    if-ne v7, v3, :cond_6

    const/16 v7, 0x12

    aget-byte v7, v9, v7

    and-int/lit16 v7, v7, 0xff

    const/16 v8, 0x13

    aget-byte v8, v9, v8

    and-int/lit16 v8, v8, 0xff

    shl-int/lit8 v8, v8, 0x8

    or-int/2addr v7, v8

    if-ne v7, v0, :cond_6

    .line 26
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_2

    .line 32
    :cond_6
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u5b89\u88c5\u5305\u7ec4\u4ef6\u5b9e\u9645\u67b6\u6784\u4e0d\u5339\u914d"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 28
    :cond_7
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u5b89\u88c5\u5305\u7f3a\u5c11\u5339\u914d\u67b6\u6784\u7684\u7ec4\u4ef6"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 34
    :cond_8
    return-void
.end method

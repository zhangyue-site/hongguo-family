.class Lcn/hongguo/tv/UpdateClient;
.super Ljava/lang/Object;
.source "UpdateClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/hongguo/tv/UpdateClient$Modern24;,
        Lcn/hongguo/tv/UpdateClient$Progress;,
        Lcn/hongguo/tv/UpdateClient$Modern21;
    }
.end annotation


# instance fields
.field final abi:Ljava/lang/String;

.field volatile active:Ljava/net/HttpURLConnection;

.field volatile cancelled:Z


# direct methods
.method constructor <init>()V
    .locals 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "arm64-v8a"

    iput-object v0, p0, Lcn/hongguo/tv/UpdateClient;->abi:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcn/hongguo/tv/NativeAbi;->suffix(Ljava/lang/String;)Ljava/lang/String;

    iput-object p1, p0, Lcn/hongguo/tv/UpdateClient;->abi:Ljava/lang/String;

    return-void
.end method

.method static allowed(Ljava/net/URL;Z)Z
    .locals 3

    .line 20
    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    invoke-virtual {p0}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_7

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x1

    const-string v2, "api.github.com"

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object p0

    const-string p1, "/repos/waligoraamodio288-rgb/hongguo-desktop-releases/releases"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1

    .line 22
    :cond_2
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object p1

    const-string v2, "/repos/waligoraamodio288-rgb/hongguo-desktop-releases/releases/assets/[0-9]+"

    invoke-virtual {p1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_5

    :cond_3
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object p1

    const-string v2, "github.com"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object p1

    const-string v2, "/waligoraamodio288-rgb/hongguo-desktop-releases/releases/download/tv-v"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_5

    :cond_4
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object p1

    const-string v2, "release-assets.githubusercontent.com"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object p0

    const-string p1, "objects.githubusercontent.com"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6

    :cond_5
    const/4 v1, 0x1

    :cond_6
    return v1

    .line 20
    :cond_7
    :goto_0
    return v1
.end method

.method static apk(Landroid/content/Context;)Ljava/io/File;
    .locals 2

    .line 38
    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Lcn/hongguo/tv/UpdateClient;->directory(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    const-string v1, "update.apk"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method static architecture(Landroid/content/Context;)Ljava/lang/String;
    .locals 0
    invoke-static {p0}, Lcn/hongguo/tv/MobileArchitecture;->installed(Landroid/content/Context;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method static directory(Landroid/content/Context;)Ljava/io/File;
    .locals 2

    .line 37
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p0

    const-string v1, "app-update"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method static hash(Ljava/io/File;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 39
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/16 p0, 0x4000

    :try_start_0
    new-array p0, p0, [B

    :goto_0
    invoke-virtual {v1, p0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    const/4 v4, 0x0

    if-eq v2, v3, :cond_0

    invoke-virtual {v0, p0, v4, v2}, Ljava/security/MessageDigest;->update([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_1

    aget-byte v3, v0, v2

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v3, v6, v4

    const-string v3, "%02x"

    invoke-static {v5, v3, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :catchall_0
    move-exception p0

    :try_start_1
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v0

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_2
    throw p0
.end method

.method static version(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 40
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    iget-object p0, p0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    const-string v0, "-"

    const/4 v2, 0x2

    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p0

    aget-object p0, p0, v1

    return-object p0
.end method


# virtual methods
.method alive()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 18
    iget-boolean v0, p0, Lcn/hongguo/tv/UpdateClient;->cancelled:Z

    if-nez v0, :cond_0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "\u5df2\u53d6\u6d88\u4e0b\u8f7d"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method cancel()V
    .locals 1

    .line 17
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcn/hongguo/tv/UpdateClient;->cancelled:Z

    iget-object v0, p0, Lcn/hongguo/tv/UpdateClient;->active:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_0
    return-void
.end method

.method close()V
    .locals 2

    .line 30
    iget-object v0, p0, Lcn/hongguo/tv/UpdateClient;->active:Ljava/net/HttpURLConnection;

    const/4 v1, 0x0

    iput-object v1, p0, Lcn/hongguo/tv/UpdateClient;->active:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_0
    return-void
.end method

.method download(Landroid/content/Context;Lcn/hongguo/tv/UpdateRelease;Lcn/hongguo/tv/UpdateClient$Progress;)Ljava/io/File;
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 51
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    iget-object v0, v1, Lcn/hongguo/tv/UpdateClient;->abi:Ljava/lang/String;

    iget-object v5, v3, Lcn/hongguo/tv/UpdateRelease;->abi:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, v1, Lcn/hongguo/tv/UpdateClient;->abi:Ljava/lang/String;

    invoke-static/range {p1 .. p1}, Lcn/hongguo/tv/UpdateClient;->architecture(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 52
    invoke-static/range {p1 .. p1}, Lcn/hongguo/tv/UpdateClient;->directory(Landroid/content/Context;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u65e0\u6cd5\u521b\u5efa\u66f4\u65b0\u7f13\u5b58"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    new-instance v6, Ljava/io/File;

    const-string v0, "update.part"

    invoke-direct {v6, v5, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static/range {p1 .. p1}, Lcn/hongguo/tv/UpdateClient;->apk(Landroid/content/Context;)Ljava/io/File;

    move-result-object v7

    .line 53
    invoke-virtual {v7}, Ljava/io/File;->isFile()Z

    move-result v0

    const/16 v8, 0x64

    if-eqz v0, :cond_3

    :try_start_0
    invoke-virtual {v1, v2, v7, v3}, Lcn/hongguo/tv/UpdateClient;->verify(Landroid/content/Context;Ljava/io/File;Lcn/hongguo/tv/UpdateRelease;)V

    invoke-interface {v4, v8}, Lcn/hongguo/tv/UpdateClient$Progress;->changed(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v7

    :catch_0
    move-exception v0

    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u65e0\u6cd5\u6e05\u7406\u65e7\u66f4\u65b0\u5305"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 54
    :cond_3
    :goto_1
    invoke-virtual {v5}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v9

    iget-wide v11, v3, Lcn/hongguo/tv/UpdateRelease;->bytes:J

    const-wide/16 v13, 0x2

    mul-long v11, v11, v13

    const-wide/32 v13, 0x1000000

    add-long/2addr v11, v13

    cmp-long v0, v9, v11

    if-ltz v0, :cond_c

    .line 55
    const/4 v5, 0x0

    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v9

    invoke-virtual/range {p2 .. p2}, Lcn/hongguo/tv/UpdateRelease;->downloadUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0, v5}, Lcn/hongguo/tv/UpdateClient;->open(Ljava/lang/String;Z)Ljava/io/InputStream;

    move-result-object v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_8

    :try_start_2
    new-instance v12, Ljava/io/FileOutputStream;

    invoke-direct {v12, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    const/16 v0, 0x4000

    :try_start_3
    new-array v0, v0, [B

    const-wide/16 v13, 0x0

    move-wide v15, v13

    :goto_2
    invoke-virtual {v11, v0}, Ljava/io/InputStream;->read([B)I

    move-result v8

    const/4 v5, -0x1

    if-eq v8, v5, :cond_7

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/UpdateClient;->alive()V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v17

    sub-long v17, v17, v9

    const-wide/32 v19, 0x927c0

    cmp-long v5, v17, v19

    if-gtz v5, :cond_6

    move-wide/from16 v17, v9

    int-to-long v9, v8

    add-long/2addr v13, v9

    iget-wide v9, v3, Lcn/hongguo/tv/UpdateRelease;->bytes:J

    cmp-long v5, v13, v9

    if-gtz v5, :cond_5

    const-wide/32 v9, 0x2000000

    cmp-long v5, v13, v9

    if-gtz v5, :cond_5

    const/4 v5, 0x0

    invoke-virtual {v12, v0, v5, v8}, Ljava/io/FileOutputStream;->write([BII)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    sub-long v19, v8, v15

    const-wide/16 v21, 0xfa

    cmp-long v10, v19, v21

    if-ltz v10, :cond_4

    const-wide/16 v15, 0x64

    mul-long v15, v15, v13

    move-object v10, v6

    :try_start_4
    iget-wide v5, v3, Lcn/hongguo/tv/UpdateRelease;->bytes:J

    div-long v5, v15, v5

    long-to-int v6, v5

    invoke-interface {v4, v6}, Lcn/hongguo/tv/UpdateClient$Progress;->changed(I)V

    move-wide v15, v8

    goto :goto_3

    :cond_4
    move-object v10, v6

    :goto_3
    move-object v6, v10

    move-wide/from16 v9, v17

    const/4 v5, 0x0

    const/16 v8, 0x64

    goto :goto_2

    :cond_5
    move-object v10, v6

    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u5b89\u88c5\u5305\u5927\u5c0f\u4e0d\u5339\u914d"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_4
    throw v0

    :cond_6
    move-object v10, v6

    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u4e0b\u8f7d\u8017\u65f6\u8fc7\u957f\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u540e\u91cd\u8bd5"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :cond_7
    move-object v10, v6

    invoke-virtual {v12}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/FileDescriptor;->sync()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :try_start_5
    invoke-virtual {v12}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    if-eqz v11, :cond_8

    :try_start_6
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V

    .line 56
    :cond_8
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/UpdateClient;->alive()V

    invoke-virtual {v1, v2, v10, v3}, Lcn/hongguo/tv/UpdateClient;->verify(Landroid/content/Context;Ljava/io/File;Lcn/hongguo/tv/UpdateRelease;)V

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/UpdateClient;->alive()V

    invoke-virtual {v10, v7}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_7

    if-eqz v0, :cond_9

    const/16 v2, 0x64

    :try_start_7
    invoke-interface {v4, v2}, Lcn/hongguo/tv/UpdateClient$Progress;->changed(I)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 57
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/UpdateClient;->close()V

    .line 56
    return-object v7

    .line 57
    :catchall_0
    move-exception v0

    const/4 v5, 0x1

    goto :goto_a

    .line 56
    :cond_9
    :try_start_8
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u65e0\u6cd5\u4fdd\u5b58\u66f4\u65b0\u5305"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_7

    .line 55
    :catchall_1
    move-exception v0

    goto :goto_5

    :catchall_2
    move-exception v0

    move-object v10, v6

    :goto_5
    move-object v2, v0

    :try_start_9
    invoke-virtual {v12}, Ljava/io/FileOutputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    goto :goto_6

    :catchall_3
    move-exception v0

    move-object v3, v0

    :try_start_a
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_6
    throw v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    :catchall_4
    move-exception v0

    goto :goto_7

    :catchall_5
    move-exception v0

    move-object v10, v6

    :goto_7
    move-object v2, v0

    if-eqz v11, :cond_a

    :try_start_b
    invoke-virtual {v11}, Ljava/io/InputStream;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    goto :goto_8

    :catchall_6
    move-exception v0

    move-object v3, v0

    :try_start_c
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_a
    :goto_8
    throw v2
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_7

    .line 57
    :catchall_7
    move-exception v0

    goto :goto_9

    :catchall_8
    move-exception v0

    move-object v10, v6

    :goto_9
    const/4 v5, 0x0

    :goto_a
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/UpdateClient;->close()V

    if-nez v5, :cond_b

    invoke-virtual {v10}, Ljava/io/File;->delete()Z

    :cond_b
    throw v0

    .line 54
    :cond_c
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u5b58\u50a8\u7a7a\u95f4\u4e0d\u8db3\uff0c\u8bf7\u5148\u6e05\u7406\u7f13\u5b58"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_d
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u66f4\u65b0\u5b89\u88c5\u5305\u67b6\u6784\u4e0d\u5339\u914d"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method latest()Lcn/hongguo/tv/UpdateRelease;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 32
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x1

    :goto_0
    const/4 v3, 0x3

    if-gt v2, v3, :cond_5

    .line 33
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "https://api.github.com/repos/waligoraamodio288-rgb/hongguo-desktop-releases/releases?per_page=100&page="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v1}, Lcn/hongguo/tv/UpdateClient;->open(Ljava/lang/String;Z)Ljava/io/InputStream;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    :try_start_1
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    const/16 v5, 0x2000

    :try_start_2
    new-array v5, v5, [B

    :goto_1
    invoke-virtual {v3, v5}, Ljava/io/InputStream;->read([B)I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_1

    invoke-virtual {p0}, Lcn/hongguo/tv/UpdateClient;->alive()V

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v7

    add-int/2addr v7, v6

    const/high16 v8, 0x200000

    if-gt v7, v8, :cond_0

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v7, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u66f4\u65b0\u8d44\u6599\u8fc7\u5927"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v5, Lorg/json/JSONArray;

    const-string v6, "UTF-8"

    invoke-virtual {v4, v6}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-eqz v3, :cond_2

    :try_start_4
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    :cond_2
    invoke-virtual {p0}, Lcn/hongguo/tv/UpdateClient;->close()V

    .line 34
    iget-object v3, p0, Lcn/hongguo/tv/UpdateClient;->abi:Ljava/lang/String;

    invoke-static {v5, v0, v3}, Lcn/hongguo/tv/UpdateRelease;->newest(Lorg/json/JSONArray;Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v3

    const/16 v4, 0x64

    if-ge v3, v4, :cond_3

    iget-object v1, p0, Lcn/hongguo/tv/UpdateClient;->abi:Ljava/lang/String;

    invoke-static {v0, v1}, Lcn/hongguo/tv/UpdateRelease;->parse(Lorg/json/JSONObject;Ljava/lang/String;)Lcn/hongguo/tv/UpdateRelease;

    move-result-object v0

    return-object v0

    .line 32
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    :try_start_5
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v1

    :try_start_6
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_2
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :catchall_2
    move-exception v0

    if-eqz v3, :cond_4

    :try_start_7
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_3

    :catchall_3
    move-exception v1

    :try_start_8
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_4
    :goto_3
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    :catchall_4
    move-exception v0

    invoke-virtual {p0}, Lcn/hongguo/tv/UpdateClient;->close()V

    throw v0

    .line 35
    :cond_5
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u53d1\u884c\u8bb0\u5f55\u6682\u4e0d\u5b8c\u6574\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method open(Ljava/lang/String;Z)Ljava/io/InputStream;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 25
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x6

    if-ge v1, v2, :cond_8

    invoke-virtual {p0}, Lcn/hongguo/tv/UpdateClient;->alive()V

    invoke-static {v0, p2}, Lcn/hongguo/tv/UpdateClient;->allowed(Ljava/net/URL;Z)Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;

    iput-object v2, p0, Lcn/hongguo/tv/UpdateClient;->active:Ljava/net/HttpURLConnection;

    invoke-static {v2}, Lcn/hongguo/tv/LegacyTls;->configure(Ljava/net/HttpURLConnection;)V

    const/16 v3, 0x2710

    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v3, 0x3a98

    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    invoke-virtual {v2, p1}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const-string v3, "User-Agent"

    const-string v4, "HongguoTV-Updater"

    invoke-virtual {v2, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "X-GitHub-Api-Version"

    const-string v4, "2022-11-28"

    invoke-virtual {v2, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_0

    const-string v3, "application/vnd.github+json"

    goto :goto_1

    :cond_0
    const-string v3, "application/octet-stream"

    :goto_1
    const-string v4, "Accept"

    invoke-virtual {v2, v4, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3

    .line 26
    if-nez p2, :cond_3

    const/16 v4, 0x12d

    if-eq v3, v4, :cond_1

    const/16 v4, 0x12e

    if-eq v3, v4, :cond_1

    const/16 v4, 0x12f

    if-eq v3, v4, :cond_1

    const/16 v4, 0x133

    if-eq v3, v4, :cond_1

    const/16 v4, 0x134

    if-ne v3, v4, :cond_3

    :cond_1
    const-string v3, "Location"

    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    if-eqz v3, :cond_2

    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v0, v3}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 25
    add-int/lit8 v1, v1, 0x1

    move-object v0, v2

    goto :goto_0

    .line 26
    :cond_2
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u4e0b\u8f7d\u5730\u5740\u6682\u4e0d\u53ef\u7528"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 27
    :cond_3
    const/16 p1, 0xc8

    if-eq v3, p1, :cond_6

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    new-instance p1, Ljava/io/IOException;

    const/16 p2, 0x193

    if-eq v3, p2, :cond_5

    const/16 p2, 0x1ad

    if-ne v3, p2, :cond_4

    goto :goto_2

    :cond_4
    const-string p2, "\u65e0\u6cd5\u8fde\u63a5\u66f4\u65b0\u670d\u52a1\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u540e\u91cd\u8bd5"

    goto :goto_3

    :cond_5
    :goto_2
    const-string p2, "\u66f4\u65b0\u670d\u52a1\u6682\u65f6\u7e41\u5fd9\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    :goto_3
    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    return-object p1

    .line 25
    :cond_7
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u66f4\u65b0\u6765\u6e90\u4e0d\u5339\u914d"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 28
    :cond_8
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u4e0b\u8f7d\u8df3\u8f6c\u6b21\u6570\u8fc7\u591a"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method verify(Landroid/content/Context;Ljava/io/File;Lcn/hongguo/tv/UpdateRelease;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lcn/hongguo/tv/UpdateClient;->abi:Ljava/lang/String;

    iget-object v1, p3, Lcn/hongguo/tv/UpdateRelease;->abi:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcn/hongguo/tv/UpdateClient;->abi:Ljava/lang/String;

    invoke-static {p1}, Lcn/hongguo/tv/UpdateClient;->architecture(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 43
    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v0

    iget-wide v2, p3, Lcn/hongguo/tv/UpdateRelease;->bytes:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_4

    invoke-static {p2}, Lcn/hongguo/tv/UpdateClient;->hash(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p3, Lcn/hongguo/tv/UpdateRelease;->sha256:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 44
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x40

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageArchiveInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 45
    if-eqz v0, :cond_3

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    invoke-static {v2}, Lcn/hongguo/tv/AppOrigin;->matches([Landroid/content/pm/Signature;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, v1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    invoke-static {v2}, Lcn/hongguo/tv/AppOrigin;->matches([Landroid/content/pm/Signature;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 46
    iget v2, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    iget v1, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    if-le v2, v1, :cond_2

    iget-object v1, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p3, Lcn/hongguo/tv/UpdateRelease;->version:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-standalone-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcn/hongguo/tv/UpdateClient;->abi:Ljava/lang/String;

    invoke-static {v3}, Lcn/hongguo/tv/NativeAbi;->suffix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object p3, p3, Lcn/hongguo/tv/UpdateRelease;->version:Ljava/lang/String;

    invoke-static {p1}, Lcn/hongguo/tv/UpdateClient;->version(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1}, Lcn/hongguo/tv/UpdateRelease;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    if-lez p1, :cond_2

    .line 47
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p3, 0x18

    if-lt p1, p3, :cond_1

    invoke-static {v0}, Lcn/hongguo/tv/UpdateClient$Modern24;->minimum(Landroid/content/pm/PackageInfo;)I

    move-result p1

    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-gt p1, p3, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u6b64\u7248\u672c\u9700\u8981\u66f4\u9ad8\u7248\u672c\u7684 Android \u7cfb\u7edf"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 48
    :cond_1
    :goto_0
    new-instance p1, Ljava/util/zip/ZipFile;

    invoke-direct {p1, p2}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V

    :try_start_0
    iget-object p2, p0, Lcn/hongguo/tv/UpdateClient;->abi:Ljava/lang/String;

    invoke-static {p1, p2}, Lcn/hongguo/tv/NativeAbi;->verifyLibraries(Ljava/util/zip/ZipFile;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p1}, Ljava/util/zip/ZipFile;->close()V

    .line 49
    return-void

    .line 48
    :catchall_0
    move-exception p2

    :try_start_1
    invoke-virtual {p1}, Ljava/util/zip/ZipFile;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p1

    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw p2

    .line 46
    :cond_2
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u5b89\u88c5\u5305\u7248\u672c\u4e0d\u5339\u914d\u6216\u65e0\u9700\u66f4\u65b0"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 45
    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u5b89\u88c5\u5305\u7b7e\u540d\u6216\u5e94\u7528\u8eab\u4efd\u4e0d\u5339\u914d"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 43
    :cond_4
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u5b89\u88c5\u5305\u6821\u9a8c\u5931\u8d25\uff0c\u8bf7\u91cd\u65b0\u4e0b\u8f7d"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 42
    :cond_5
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u66f4\u65b0\u5b89\u88c5\u5305\u67b6\u6784\u4e0d\u5339\u914d"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

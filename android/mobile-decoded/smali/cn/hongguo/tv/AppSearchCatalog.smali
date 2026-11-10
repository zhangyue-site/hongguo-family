.class public Lcn/hongguo/tv/AppSearchCatalog;
.super Lcn/hongguo/tv/Catalog;
.source "AppSearchCatalog.java"


# instance fields
.field private final context:Landroid/content/Context;

.field private lastSearch:J

.field private final registration:Lcn/hongguo/tv/SearchRegistration;

.field private final signer:Lcn/hongguo/tv/NativeRequestSigner;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/io/File;)V
    .locals 0

    .line 16
    invoke-direct {p0, p2}, Lcn/hongguo/tv/Catalog;-><init>(Ljava/io/File;)V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcn/hongguo/tv/AppSearchCatalog;->context:Landroid/content/Context;

    new-instance p1, Lcn/hongguo/tv/SearchRegistration;

    iget-object p2, p0, Lcn/hongguo/tv/AppSearchCatalog;->context:Landroid/content/Context;

    invoke-direct {p1, p2}, Lcn/hongguo/tv/SearchRegistration;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcn/hongguo/tv/AppSearchCatalog;->registration:Lcn/hongguo/tv/SearchRegistration;

    new-instance p1, Lcn/hongguo/tv/NativeRequestSigner;

    iget-object p2, p0, Lcn/hongguo/tv/AppSearchCatalog;->context:Landroid/content/Context;

    invoke-direct {p1, p2}, Lcn/hongguo/tv/NativeRequestSigner;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcn/hongguo/tv/AppSearchCatalog;->signer:Lcn/hongguo/tv/NativeRequestSigner;

    return-void
.end method

.method static readBounded(Ljava/io/InputStream;)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v1, 0x2000

    new-array v1, v1, [B

    .line 50
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v3

    add-int/2addr v3, v2

    const/high16 v4, 0x200000

    if-gt v3, v4, :cond_0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string v0, "\u641c\u7d22\u6570\u636e\u8fc7\u5927"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    new-instance p0, Ljava/io/InterruptedIOException;

    const-string v0, "Search cancelled"

    invoke-direct {p0, v0}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method activateSearch()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 18
    iget-object v0, p0, Lcn/hongguo/tv/AppSearchCatalog;->registration:Lcn/hongguo/tv/SearchRegistration;

    invoke-virtual {v0}, Lcn/hongguo/tv/SearchRegistration;->activate()V

    return-void
.end method

.method fetch(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 21
    move-object/from16 v1, p0

    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/AppSearchCatalog;->searchIdentity()[Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    aget-object v3, v0, v2

    const/4 v4, 0x1

    aget-object v0, v0, v4

    .line 22
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_d

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    const/16 v7, 0xc8

    if-gt v6, v7, :cond_d

    .line 23
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    iget-wide v10, v1, Lcn/hongguo/tv/AppSearchCatalog;->lastSearch:J

    sub-long/2addr v8, v10

    const-wide/16 v10, 0x4b0

    sub-long/2addr v10, v8

    const-wide/16 v8, 0x0

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    cmp-long v6, v10, v8

    if-lez v6, :cond_0

    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V

    .line 24
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v6

    if-nez v6, :cond_c

    .line 25
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    iput-wide v8, v1, Lcn/hongguo/tv/AppSearchCatalog;->lastSearch:J

    .line 26
    const-string v6, "manju"

    move-object/from16 v8, p2

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    const/16 v6, 0x13

    goto :goto_0

    :cond_1
    const/16 v6, 0xb

    .line 27
    :goto_0
    iget-object v10, v1, Lcn/hongguo/tv/AppSearchCatalog;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v10

    .line 28
    const-string v11, "https://api5-normal-sinfonlinea.fqnovel.com/reading/bookapi/search/tab/v"

    invoke-static {v11}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    invoke-virtual {v11}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v11

    .line 29
    const-string v12, "device_id"

    filled-new-array {v12, v3}, [Ljava/lang/String;

    move-result-object v3

    const-string v12, "iid"

    filled-new-array {v12, v0}, [Ljava/lang/String;

    move-result-object v0

    const-string v12, "device_type"

    sget-object v13, Landroid/os/Build;->MODEL:Ljava/lang/String;

    filled-new-array {v12, v13}, [Ljava/lang/String;

    move-result-object v12

    const-string v13, "device_brand"

    sget-object v14, Landroid/os/Build;->BRAND:Ljava/lang/String;

    filled-new-array {v13, v14}, [Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, ""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v14, "os_api"

    filled-new-array {v14, v7}, [Ljava/lang/String;

    move-result-object v7

    const-string v14, "os_version"

    sget-object v8, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    filled-new-array {v14, v8}, [Ljava/lang/String;

    move-result-object v8

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    iget v9, v10, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v14, "*"

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v14, v10, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v14, "resolution"

    filled-new-array {v14, v9}, [Ljava/lang/String;

    move-result-object v9

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    iget v10, v10, Landroid/util/DisplayMetrics;->densityDpi:I

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const-string v14, "dpi"

    filled-new-array {v14, v10}, [Ljava/lang/String;

    move-result-object v10

    iget-object v14, v1, Lcn/hongguo/tv/AppSearchCatalog;->context:Landroid/content/Context;

    invoke-static {v14}, Lcn/hongguo/tv/UpdateClient;->architecture(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v14

    const-string v4, "host_abi"

    filled-new-array {v4, v14}, [Ljava/lang/String;

    move-result-object v4

    iget-object v14, v1, Lcn/hongguo/tv/AppSearchCatalog;->context:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v14

    iget v14, v14, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    const/16 v2, 0x258

    if-lt v14, v2, :cond_2

    const-string v14, "pad"

    goto :goto_1

    :cond_2
    const-string v14, "phone"

    :goto_1
    const-string v2, "dragon_device_type"

    filled-new-array {v2, v14}, [Ljava/lang/String;

    move-result-object v2

    iget-object v14, v1, Lcn/hongguo/tv/AppSearchCatalog;->context:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v14

    iget v14, v14, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    const-string v1, "1"

    move-object/from16 v18, v11

    const-string v11, "0"

    move-object/from16 v19, v1

    const/16 v1, 0x258

    if-lt v14, v1, :cond_3

    move-object/from16 v1, v19

    goto :goto_2

    :cond_3
    move-object v1, v11

    :goto_2
    const-string v14, "is_android_pad_screen"

    filled-new-array {v14, v1}, [Ljava/lang/String;

    move-result-object v1

    const-string v14, "query"

    filled-new-array {v14, v5}, [Ljava/lang/String;

    move-result-object v5

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move/from16 v17, v6

    const-string v6, "tab_type"

    filled-new-array {v6, v14}, [Ljava/lang/String;

    move-result-object v6

    const/16 v14, 0x22

    move-object/from16 v20, v15

    new-array v15, v14, [[Ljava/lang/String;

    const/16 v16, 0x0

    aput-object v3, v15, v16

    const/4 v3, 0x1

    aput-object v0, v15, v3

    const-string v0, "aid"

    const-string v3, "8662"

    filled-new-array {v0, v3}, [Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x2

    aput-object v0, v15, v3

    const-string v0, "app_name"

    const-string v3, "novelread"

    filled-new-array {v0, v3}, [Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x3

    aput-object v0, v15, v3

    const-string v0, "version_code"

    const-string v3, "72232"

    filled-new-array {v0, v3}, [Ljava/lang/String;

    move-result-object v0

    const/16 v21, 0x4

    aput-object v0, v15, v21

    const-string v0, "version_name"

    const-string v14, "7.2.2.32"

    filled-new-array {v0, v14}, [Ljava/lang/String;

    move-result-object v0

    const/4 v14, 0x5

    aput-object v0, v15, v14

    const-string v0, "manifest_version_code"

    filled-new-array {v0, v3}, [Ljava/lang/String;

    move-result-object v0

    const/4 v14, 0x6

    aput-object v0, v15, v14

    const-string v0, "update_version_code"

    filled-new-array {v0, v3}, [Ljava/lang/String;

    move-result-object v0

    const/4 v14, 0x7

    aput-object v0, v15, v14

    const-string v0, "pv_player"

    filled-new-array {v0, v3}, [Ljava/lang/String;

    move-result-object v0

    const/16 v3, 0x8

    aput-object v0, v15, v3

    const-string v0, "channel"

    const-string v3, "update_64"

    filled-new-array {v0, v3}, [Ljava/lang/String;

    move-result-object v0

    const/16 v3, 0x9

    aput-object v0, v15, v3

    const-string v0, "device_platform"

    const-string v3, "android"

    filled-new-array {v0, v3}, [Ljava/lang/String;

    move-result-object v0

    const/16 v14, 0xa

    aput-object v0, v15, v14

    const-string v0, "os"

    filled-new-array {v0, v3}, [Ljava/lang/String;

    move-result-object v0

    const/16 v3, 0xb

    aput-object v0, v15, v3

    const-string v0, "ssmix"

    const-string v3, "a"

    filled-new-array {v0, v3}, [Ljava/lang/String;

    move-result-object v0

    const/16 v3, 0xc

    aput-object v0, v15, v3

    const/16 v0, 0xd

    aput-object v12, v15, v0

    const/16 v0, 0xe

    aput-object v13, v15, v0

    const-string v0, "language"

    const-string v3, "zh"

    filled-new-array {v0, v3}, [Ljava/lang/String;

    move-result-object v0

    const/16 v3, 0xf

    aput-object v0, v15, v3

    const/16 v0, 0x10

    aput-object v7, v15, v0

    const/16 v0, 0x11

    aput-object v8, v15, v0

    const/16 v0, 0x12

    aput-object v9, v15, v0

    const/16 v0, 0x13

    aput-object v10, v15, v0

    const-string v0, "ac"

    const-string v3, "wifi"

    filled-new-array {v0, v3}, [Ljava/lang/String;

    move-result-object v0

    const/16 v3, 0x14

    aput-object v0, v15, v3

    const/16 v0, 0x15

    aput-object v4, v15, v0

    const/16 v0, 0x16

    aput-object v2, v15, v0

    const/16 v0, 0x17

    aput-object v1, v15, v0

    const-string v0, "compliance_status"

    filled-new-array {v0, v11}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x18

    aput-object v0, v15, v1

    const-string v0, "need_personal_recommend"

    filled-new-array {v0, v11}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x19

    aput-object v0, v15, v1

    const-string v0, "player_so_load"

    move-object/from16 v1, v19

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x1a

    aput-object v0, v15, v1

    const/16 v0, 0x1b

    aput-object v5, v15, v0

    const-string v0, "count"

    const-string v1, "20"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x1c

    aput-object v0, v15, v1

    const-string v0, "offset"

    filled-new-array {v0, v11}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x1d

    aput-object v0, v15, v1

    const/16 v0, 0x1e

    aput-object v6, v15, v0

    const-string v0, "bookshelf_search_plan"

    const-string v1, "4"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x1f

    aput-object v0, v15, v1

    const-string v0, "use_correct"

    const-string v2, "true"

    filled-new-array {v0, v2}, [Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x20

    aput-object v0, v15, v2

    const-string v0, "user_is_login"

    filled-new-array {v0, v11}, [Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x21

    aput-object v0, v15, v2

    .line 30
    const/4 v0, 0x0

    :goto_3
    const/16 v2, 0x22

    if-ge v0, v2, :cond_4

    aget-object v3, v15, v0

    const/4 v4, 0x0

    aget-object v5, v3, v4

    const/4 v4, 0x1

    aget-object v3, v3, v4

    move-object/from16 v4, v18

    invoke-virtual {v4, v5, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 31
    :cond_4
    move-object/from16 v4, v18

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v5, v20

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-wide/16 v6, 0x3e8

    div-long v6, v2, v6

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v6, "ts"

    invoke-virtual {v4, v6, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "_rticket"

    invoke-virtual {v0, v7, v6}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 32
    invoke-virtual {v4}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v4, Ljava/util/TreeMap;

    invoke-direct {v4}, Ljava/util/TreeMap;-><init>()V

    .line 33
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "com.phoenix.read/72232 (Linux; U; Android "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; zh_CN; "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "user-agent"

    invoke-interface {v4, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    const-string v6, "accept"

    const-string v7, "application/json; charset=utf-8,application/x-protobuf"

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "content-type"

    const-string v7, "application/json; charset=UTF-8"

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    const-string v6, "x-xs-from-web"

    invoke-interface {v4, v6, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "sdk-version"

    const-string v7, "2"

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "passport-sdk-version"

    const-string v7, "50561"

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "x-tt-request-tag"

    const-string v7, "t=0;n=0"

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "x-ss-req-ticket"

    invoke-interface {v4, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "x-vc-bdturing-sdk-version"

    const-string v3, "3.7.2.cn"

    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    move-object/from16 v2, p0

    iget-object v3, v2, Lcn/hongguo/tv/AppSearchCatalog;->signer:Lcn/hongguo/tv/NativeRequestSigner;

    invoke-virtual {v3, v0, v4}, Lcn/hongguo/tv/NativeRequestSigner;->sign(Ljava/lang/String;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v4, v3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 37
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Ljavax/net/ssl/HttpsURLConnection;

    invoke-static {v3}, Lcn/hongguo/tv/LegacyTls;->configure(Ljava/net/HttpURLConnection;)V

    .line 38
    const/16 v0, 0x2710

    invoke-virtual {v3, v0}, Ljavax/net/ssl/HttpsURLConnection;->setConnectTimeout(I)V

    const/16 v0, 0x3a98

    invoke-virtual {v3, v0}, Ljavax/net/ssl/HttpsURLConnection;->setReadTimeout(I)V

    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Ljavax/net/ssl/HttpsURLConnection;->setInstanceFollowRedirects(Z)V

    invoke-virtual {v3, v0}, Ljavax/net/ssl/HttpsURLConnection;->setUseCaches(Z)V

    .line 40
    :try_start_0
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v5, v4}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    :cond_5
    const-string v0, "Accept-Encoding"

    const-string v4, "identity"

    invoke-virtual {v3, v0, v4}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    invoke-virtual {v3}, Ljavax/net/ssl/HttpsURLConnection;->getResponseCode()I

    move-result v0

    const/16 v4, 0xc8

    if-ne v0, v4, :cond_b

    .line 42
    invoke-virtual {v3}, Ljavax/net/ssl/HttpsURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    :try_start_1
    invoke-static {v4}, Lcn/hongguo/tv/AppSearchCatalog;->readBounded(Ljava/io/InputStream;)[B

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    if-eqz v4, :cond_6

    :try_start_2
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 43
    :cond_6
    const-string v4, "gzip"

    invoke-virtual {v3}, Ljavax/net/ssl/HttpsURLConnection;->getContentEncoding()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_7

    array-length v4, v0

    const/4 v5, 0x1

    if-le v4, v5, :cond_8

    const/4 v4, 0x0

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    if-ne v4, v1, :cond_8

    aget-byte v1, v0, v5

    and-int/lit16 v1, v1, 0xff

    const/16 v4, 0x8b

    if-ne v1, v4, :cond_8

    :cond_7
    new-instance v1, Ljava/util/zip/GZIPInputStream;

    new-instance v4, Ljava/io/ByteArrayInputStream;

    invoke-direct {v4, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v1, v4}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    :try_start_3
    invoke-static {v1}, Lcn/hongguo/tv/AppSearchCatalog;->readBounded(Ljava/io/InputStream;)[B

    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 44
    :cond_8
    array-length v1, v0

    if-eqz v1, :cond_9

    .line 45
    new-instance v1, Lorg/json/JSONObject;

    new-instance v4, Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-direct {v4, v0, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-direct {v1, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    move/from16 v8, v17

    invoke-static {v1, v8}, Lcn/hongguo/tv/AppSearchResponse;->catalog(Lorg/json/JSONObject;I)Lorg/json/JSONObject;

    move-result-object v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 46
    invoke-virtual {v3}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 45
    return-object v0

    .line 44
    :cond_9
    :try_start_5
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u641c\u7d22\u670d\u52a1\u6682\u672a\u8fd4\u56de\u7ed3\u679c"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 43
    :catchall_0
    move-exception v0

    move-object v4, v0

    :try_start_6
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_5

    :catchall_1
    move-exception v0

    move-object v1, v0

    :try_start_7
    invoke-virtual {v4, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_5
    throw v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 42
    :catchall_2
    move-exception v0

    move-object v1, v0

    if-eqz v4, :cond_a

    :try_start_8
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    goto :goto_6

    :catchall_3
    move-exception v0

    move-object v4, v0

    :try_start_9
    invoke-virtual {v1, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_a
    :goto_6
    throw v1

    .line 41
    :cond_b
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u641c\u7d22\u670d\u52a1\u6682\u4e0d\u53ef\u7528"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 46
    :catchall_4
    move-exception v0

    invoke-virtual {v3}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    throw v0

    .line 24
    :cond_c
    move-object v2, v1

    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "Search cancelled"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 22
    :cond_d
    move-object v2, v1

    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u8bf7\u8f93\u5165\u4e0d\u8d85\u8fc7200\u5b57\u7684\u5173\u952e\u8bcd"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method requiresSearchSetup()Z
    .locals 1

    .line 17
    iget-object v0, p0, Lcn/hongguo/tv/AppSearchCatalog;->registration:Lcn/hongguo/tv/SearchRegistration;

    invoke-virtual {v0}, Lcn/hongguo/tv/SearchRegistration;->ready()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method searchIdentity()[Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 19
    iget-object v0, p0, Lcn/hongguo/tv/AppSearchCatalog;->registration:Lcn/hongguo/tv/SearchRegistration;

    invoke-virtual {v0}, Lcn/hongguo/tv/SearchRegistration;->identity()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

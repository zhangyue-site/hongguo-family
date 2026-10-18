.class public final Lcn/hongguo/tv/DirectMediaSource;
.super Ljava/lang/Object;
.source "DirectMediaSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/hongguo/tv/DirectMediaSource$Prepared;
    }
.end annotation


# static fields
.field private static final LIMIT:J = 0x2000000L


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static nested(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0

    .line 20
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    move-object p0, p1

    :goto_0
    return-object p0
.end method

.method public static prepare(Lorg/json/JSONObject;Ljava/io/File;)Lcn/hongguo/tv/DirectMediaSource$Prepared;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 22
    const/16 v0, 0x1e0

    invoke-static {p0, p1, v0}, Lcn/hongguo/tv/DirectMediaSource;->prepare(Lorg/json/JSONObject;Ljava/io/File;I)Lcn/hongguo/tv/DirectMediaSource$Prepared;

    move-result-object p0

    return-object p0
.end method

.method public static prepare(Lorg/json/JSONObject;Ljava/io/File;I)Lcn/hongguo/tv/DirectMediaSource$Prepared;
    .locals 27
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 25
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "spade_a"

    const-string v3, "codec_type"

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-nez v4, :cond_1

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->mkdirs()Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot create media cache"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 26
    :cond_1
    :goto_0
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v4

    const-wide/32 v6, 0x4000000

    cmp-long v8, v4, v6

    if-ltz v8, :cond_20

    .line 27
    new-instance v4, Lcn/hongguo/tv/DeviceDecoders;

    invoke-direct {v4}, Lcn/hongguo/tv/DeviceDecoders;-><init>()V

    move/from16 v5, p2

    invoke-static {v0, v4, v5}, Lcn/hongguo/tv/MediaTrackPolicy;->choose(Lorg/json/JSONObject;Lcn/hongguo/tv/MediaTrackPolicy$Support;I)Lorg/json/JSONObject;

    move-result-object v4

    .line 28
    const-string v5, "video_meta"

    invoke-static {v4, v5}, Lcn/hongguo/tv/DirectMediaSource;->nested(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "encrypt_info"

    invoke-static {v4, v6}, Lcn/hongguo/tv/DirectMediaSource;->nested(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 29
    const-string v7, "main_url"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 30
    const-string v8, "http://"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    const-string v10, "https://"

    const/4 v11, 0x0

    if-nez v9, :cond_2

    invoke-virtual {v7, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_2

    new-instance v9, Ljava/lang/String;

    invoke-static {v7, v11}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v7

    const-string v12, "UTF-8"

    invoke-direct {v9, v7, v12}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    move-object v7, v9

    .line 31
    :cond_2
    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/4 v9, 0x7

    invoke-virtual {v7, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 32
    :cond_3
    new-instance v8, Ljava/net/URL;

    invoke-direct {v8, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 33
    new-instance v7, Ljava/io/File;

    const-string v9, "current.enc.partial"

    invoke-direct {v7, v1, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v9, Ljava/io/File;

    const-string v10, "current.enc"

    invoke-direct {v9, v1, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v10, Ljava/io/File;

    const-string v12, "current.mp4"

    invoke-direct {v10, v1, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 34
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1f

    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1f

    invoke-virtual {v7}, Ljava/io/File;->createNewFile()Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 35
    new-instance v1, Lcn/hongguo/tv/DirectMediaSource$Prepared;

    invoke-direct {v1}, Lcn/hongguo/tv/DirectMediaSource$Prepared;-><init>()V

    .line 37
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_12

    .line 38
    const/4 v15, 0x0

    :goto_1
    const/4 v12, 0x3

    if-gt v15, v12, :cond_14

    .line 39
    :try_start_1
    invoke-virtual {v8}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v12

    const-string v11, "https"

    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_13

    invoke-virtual {v8}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object v11

    if-nez v11, :cond_13

    const-string v11, "public_origin_only"

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_d

    if-eqz v11, :cond_5

    :try_start_2
    invoke-virtual {v8}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v11

    const-string v12, "hongguoduanju.com"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v11, :cond_4

    goto :goto_2

    :cond_4
    move-object/from16 v19, v10

    goto/16 :goto_b

    .line 77
    :catchall_0
    move-exception v0

    move-object v4, v10

    goto/16 :goto_d

    .line 40
    :cond_5
    :goto_2
    :try_start_3
    invoke-virtual {v8}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v11

    check-cast v11, Ljavax/net/ssl/HttpsURLConnection;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_d

    .line 42
    :try_start_4
    invoke-static {v11}, Lcn/hongguo/tv/LegacyTls;->configure(Ljava/net/HttpURLConnection;)V

    const/16 v12, 0x3a98

    invoke-virtual {v11, v12}, Ljavax/net/ssl/HttpsURLConnection;->setConnectTimeout(I)V

    const/16 v12, 0x7530

    invoke-virtual {v11, v12}, Ljavax/net/ssl/HttpsURLConnection;->setReadTimeout(I)V

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Ljavax/net/ssl/HttpsURLConnection;->setUseCaches(Z)V

    .line 43
    invoke-virtual {v11, v12}, Ljavax/net/ssl/HttpsURLConnection;->setInstanceFollowRedirects(Z)V

    const-string v12, "User-Agent"

    const-string v0, "HongguoTV/0.1"

    invoke-virtual {v11, v12, v0}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    invoke-virtual {v11}, Ljavax/net/ssl/HttpsURLConnection;->getResponseCode()I

    move-result v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_b

    .line 45
    const/16 v12, 0x12d

    if-eq v0, v12, :cond_10

    const/16 v12, 0x12e

    if-eq v0, v12, :cond_10

    const/16 v12, 0x12f

    if-eq v0, v12, :cond_10

    const/16 v12, 0x133

    if-eq v0, v12, :cond_10

    const/16 v12, 0x134

    if-ne v0, v12, :cond_6

    move-object/from16 v20, v2

    move-object/from16 v21, v3

    move-object/from16 v23, v5

    move-object/from16 v16, v6

    move-object/from16 v19, v10

    move-object/from16 v22, v11

    goto/16 :goto_9

    .line 50
    :cond_6
    const/16 v8, 0xc8

    if-ne v0, v8, :cond_f

    .line 51
    :try_start_5
    invoke-virtual {v11}, Ljavax/net/ssl/HttpsURLConnection;->getContentLength()I

    move-result v0

    move-object v12, v5

    move-object/from16 v16, v6

    int-to-long v5, v0

    const-wide/32 v17, 0x2000000

    cmp-long v0, v5, v17

    if-gtz v0, :cond_e

    .line 52
    invoke-virtual {v11}, Ljavax/net/ssl/HttpsURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v8
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_8

    :try_start_6
    new-instance v15, Ljava/io/FileOutputStream;

    invoke-direct {v15, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_6

    .line 53
    const/high16 v0, 0x10000

    :try_start_7
    new-array v0, v0, [B
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 54
    :goto_3
    move-object/from16 v19, v10

    :try_start_8
    invoke-virtual {v8, v0}, Ljava/io/InputStream;->read([B)I

    move-result v10

    move-object/from16 v20, v2

    const/4 v2, -0x1

    if-eq v10, v2, :cond_9

    .line 55
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_8

    .line 56
    move-object/from16 v21, v3

    iget-wide v2, v1, Lcn/hongguo/tv/DirectMediaSource$Prepared;->bytes:J
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    move-object/from16 v22, v11

    move-object/from16 v23, v12

    int-to-long v11, v10

    add-long/2addr v2, v11

    cmp-long v24, v2, v17

    if-gtz v24, :cond_7

    :try_start_9
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sub-long/2addr v2, v13

    const-wide/32 v24, 0xea60

    cmp-long v26, v2, v24

    if-gtz v26, :cond_7

    .line 57
    const/4 v2, 0x0

    invoke-virtual {v15, v0, v2, v10}, Ljava/io/FileOutputStream;->write([BII)V

    iget-wide v2, v1, Lcn/hongguo/tv/DirectMediaSource$Prepared;->bytes:J

    add-long/2addr v2, v11

    iput-wide v2, v1, Lcn/hongguo/tv/DirectMediaSource$Prepared;->bytes:J

    move-object/from16 v10, v19

    move-object/from16 v2, v20

    move-object/from16 v3, v21

    move-object/from16 v11, v22

    move-object/from16 v12, v23

    goto :goto_3

    .line 56
    :cond_7
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Media download exceeds budget"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_8
    move-object/from16 v22, v11

    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "Media download cancelled"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 59
    :cond_9
    move-object/from16 v21, v3

    move-object/from16 v22, v11

    move-object/from16 v23, v12

    invoke-virtual {v15}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/FileDescriptor;->sync()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 60
    :try_start_a
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    if-eqz v8, :cond_a

    :try_start_b
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V

    .line 61
    :cond_a
    iget-wide v2, v1, Lcn/hongguo/tv/DirectMediaSource$Prepared;->bytes:J

    const-wide/16 v10, 0x20

    cmp-long v0, v2, v10

    if-ltz v0, :cond_c

    const-wide/16 v2, 0x0

    cmp-long v0, v5, v2

    if-ltz v0, :cond_b

    iget-wide v2, v1, Lcn/hongguo/tv/DirectMediaSource$Prepared;->bytes:J
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_9

    cmp-long v0, v2, v5

    if-nez v0, :cond_c

    .line 63
    :cond_b
    :try_start_c
    invoke-virtual/range {v22 .. v22}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_c

    .line 62
    goto/16 :goto_e

    .line 61
    :cond_c
    :try_start_d
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Incomplete media download"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_9

    .line 52
    :catchall_1
    move-exception v0

    goto :goto_5

    :catchall_2
    move-exception v0

    goto :goto_4

    :catchall_3
    move-exception v0

    move-object/from16 v19, v10

    :goto_4
    move-object/from16 v22, v11

    :goto_5
    move-object v1, v0

    :try_start_e
    invoke-virtual {v15}, Ljava/io/FileOutputStream;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    goto :goto_6

    :catchall_4
    move-exception v0

    move-object v2, v0

    :try_start_f
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_6
    throw v1
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    :catchall_5
    move-exception v0

    goto :goto_7

    :catchall_6
    move-exception v0

    move-object/from16 v19, v10

    move-object/from16 v22, v11

    :goto_7
    move-object v1, v0

    if-eqz v8, :cond_d

    :try_start_10
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_7

    goto :goto_8

    :catchall_7
    move-exception v0

    move-object v2, v0

    :try_start_11
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_d
    :goto_8
    throw v1

    .line 51
    :cond_e
    move-object/from16 v19, v10

    move-object/from16 v22, v11

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Media exceeds budget"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 63
    :catchall_8
    move-exception v0

    move-object/from16 v19, v10

    move-object/from16 v22, v11

    goto/16 :goto_a

    .line 50
    :cond_f
    move-object/from16 v19, v10

    move-object/from16 v22, v11

    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Media HTTP status "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 45
    :cond_10
    move-object/from16 v20, v2

    move-object/from16 v21, v3

    move-object/from16 v23, v5

    move-object/from16 v16, v6

    move-object/from16 v19, v10

    move-object/from16 v22, v11

    .line 46
    :goto_9
    const/4 v0, 0x3

    if-eq v15, v0, :cond_12

    .line 47
    const-string v0, "Location"
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_9

    move-object/from16 v11, v22

    :try_start_12
    invoke-virtual {v11, v0}, Ljavax/net/ssl/HttpsURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 48
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v8, v0}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_a

    .line 63
    :try_start_13
    invoke-virtual {v11}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_c

    .line 48
    nop

    .line 38
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, p0

    move-object v8, v2

    move-object/from16 v6, v16

    move-object/from16 v10, v19

    move-object/from16 v2, v20

    move-object/from16 v3, v21

    move-object/from16 v5, v23

    const/4 v11, 0x0

    goto/16 :goto_1

    .line 47
    :cond_11
    :try_start_14
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Missing redirect location"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 63
    :catchall_9
    move-exception v0

    move-object/from16 v11, v22

    goto :goto_a

    .line 46
    :cond_12
    move-object/from16 v11, v22

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Too many media redirects"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_a

    .line 63
    :catchall_a
    move-exception v0

    goto :goto_a

    :catchall_b
    move-exception v0

    move-object/from16 v19, v10

    :goto_a
    :try_start_15
    invoke-virtual {v11}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    throw v0

    .line 39
    :cond_13
    move-object/from16 v19, v10

    :goto_b
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Unsafe media address"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_c

    .line 77
    :catchall_c
    move-exception v0

    goto :goto_c

    :catchall_d
    move-exception v0

    move-object/from16 v19, v10

    :goto_c
    move-object/from16 v4, v19

    :goto_d
    const/4 v12, 0x0

    goto/16 :goto_12

    .line 38
    :cond_14
    move-object/from16 v20, v2

    move-object/from16 v21, v3

    move-object/from16 v23, v5

    move-object/from16 v16, v6

    move-object/from16 v19, v10

    .line 65
    :goto_e
    :try_start_16
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sub-long/2addr v2, v13

    iput-wide v2, v1, Lcn/hongguo/tv/DirectMediaSource$Prepared;->downloadMs:J

    .line 66
    invoke-virtual {v7, v9}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 67
    invoke-static {v9}, Lcn/hongguo/tv/Mp4SampleTransform;->hasEncryptedSamples(Ljava/io/File;)Z

    move-result v0

    iput-boolean v0, v1, Lcn/hongguo/tv/DirectMediaSource$Prepared;->encrypted:Z

    .line 68
    const-string v0, "unknown"

    move-object/from16 v2, v21

    invoke-virtual {v4, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v3, v23

    invoke-virtual {v3, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcn/hongguo/tv/DirectMediaSource$Prepared;->codec:Ljava/lang/String;

    .line 69
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 70
    iget-boolean v0, v1, Lcn/hongguo/tv/DirectMediaSource$Prepared;->encrypted:Z
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_11

    if-eqz v0, :cond_15

    .line 71
    move-object/from16 v0, v20

    const/4 v5, 0x0

    :try_start_17
    invoke-virtual {v4, v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v6, v16

    invoke-virtual {v6, v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcn/hongguo/tv/MediaKey;->decode(Ljava/lang/String;)[B

    move-result-object v12
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_e

    .line 72
    move-object/from16 v4, v19

    :try_start_18
    invoke-static {v9, v4, v12}, Lcn/hongguo/tv/Mp4SampleTransform;->transform(Ljava/io/File;Ljava/io/File;[B)Lcn/hongguo/tv/Mp4SampleTransform$Result;

    move-result-object v0

    iput-object v0, v1, Lcn/hongguo/tv/DirectMediaSource$Prepared;->transform:Lcn/hongguo/tv/Mp4SampleTransform$Result;
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_f

    goto :goto_f

    .line 77
    :catchall_e
    move-exception v0

    move-object/from16 v4, v19

    goto :goto_11

    .line 73
    :cond_15
    move-object/from16 v4, v19

    const/4 v5, 0x0

    :try_start_19
    invoke-virtual {v9, v4}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_10

    if-eqz v0, :cond_19

    move-object v12, v5

    .line 74
    :goto_f
    :try_start_1a
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v5

    sub-long/2addr v5, v2

    iput-wide v5, v1, Lcn/hongguo/tv/DirectMediaSource$Prepared;->transformMs:J

    .line 75
    iput-object v4, v1, Lcn/hongguo/tv/DirectMediaSource$Prepared;->file:Ljava/io/File;
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_f

    .line 77
    if-eqz v12, :cond_16

    const/4 v2, 0x0

    invoke-static {v12, v2}, Ljava/util/Arrays;->fill([BB)V

    .line 78
    :cond_16
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    :cond_17
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 79
    :cond_18
    nop

    .line 75
    return-object v1

    .line 77
    :catchall_f
    move-exception v0

    goto :goto_12

    .line 73
    :cond_19
    :try_start_1b
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot commit media"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_1a
    move-object/from16 v4, v19

    const/4 v5, 0x0

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot finish media download"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_10

    .line 77
    :catchall_10
    move-exception v0

    goto :goto_11

    :catchall_11
    move-exception v0

    move-object/from16 v4, v19

    goto :goto_10

    :catchall_12
    move-exception v0

    move-object v4, v10

    :goto_10
    const/4 v5, 0x0

    :goto_11
    move-object v12, v5

    :goto_12
    if-eqz v12, :cond_1b

    const/4 v1, 0x0

    invoke-static {v12, v1}, Ljava/util/Arrays;->fill([BB)V

    .line 78
    :cond_1b
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    :cond_1c
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 79
    :cond_1d
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1e

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 80
    :cond_1e
    throw v0

    .line 34
    :cond_1f
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Media cache is busy"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 26
    :cond_20
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Insufficient media space"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

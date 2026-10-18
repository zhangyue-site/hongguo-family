.class public final Lcn/hongguo/tv/StandaloneApi;
.super Lcn/hongguo/tv/Api;
.source "StandaloneApi.java"


# static fields
.field private static final MEDIA_LOCK:Ljava/lang/Object;


# instance fields
.field private final cache:Ljava/io/File;

.field private final cachedKeys:[Ljava/lang/String;

.field private final cachedNotes:[Ljava/lang/String;

.field private final client:Lcn/hongguo/tv/DirectContentClient;

.field private clock:J

.field private publicUntil:J

.field private series:Lorg/json/JSONObject;

.field private seriesId:Ljava/lang/String;

.field private final used:[J

.field private videoIds:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 12
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcn/hongguo/tv/StandaloneApi;->MEDIA_LOCK:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 20
    const-string v0, "http://127.0.0.1"

    const-string v1, ""

    invoke-direct {p0, v0, v1}, Lcn/hongguo/tv/Api;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    iput-object v1, p0, Lcn/hongguo/tv/StandaloneApi;->seriesId:Ljava/lang/String;

    .line 16
    filled-new-array {v1, v1}, [Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcn/hongguo/tv/StandaloneApi;->cachedKeys:[Ljava/lang/String;

    .line 17
    const/4 v0, 0x2

    new-array v0, v0, [J

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcn/hongguo/tv/StandaloneApi;->used:[J

    .line 18
    filled-new-array {v1, v1}, [Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcn/hongguo/tv/StandaloneApi;->cachedNotes:[Ljava/lang/String;

    .line 20
    new-instance v0, Lcn/hongguo/tv/DirectContentClient;

    new-instance v1, Lcn/hongguo/tv/NativeRequestSigner;

    invoke-direct {v1, p1}, Lcn/hongguo/tv/NativeRequestSigner;-><init>(Landroid/content/Context;)V

    invoke-direct {v0, v1, p1}, Lcn/hongguo/tv/DirectContentClient;-><init>(Lcn/hongguo/tv/DirectContentClient$Signer;Landroid/content/Context;)V

    iput-object v0, p0, Lcn/hongguo/tv/StandaloneApi;->client:Lcn/hongguo/tv/DirectContentClient;

    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p1

    const-string v1, "playback"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcn/hongguo/tv/StandaloneApi;->cache:Ljava/io/File;

    .line 21
    return-void

    nop

    :array_0
    .array-data 8
        0x0
        0x0
    .end array-data
.end method

.method static clearMediaFiles(Ljava/io/File;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    const-string v0, "current.enc"

    const-string v1, "current.enc.partial"

    const-string v2, "current.mp4"

    const-string v3, "current.mp4.partial"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x4

    if-ge v1, v2, :cond_2

    aget-object v2, v0, v1

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Cache cleanup failed"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method static synthetic lambda$media$1(Ljava/io/File;[ZLjava/lang/String;Ljava/lang/String;)Lcn/hongguo/tv/DirectMediaSource$Prepared;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 58
    invoke-static {p0}, Lcn/hongguo/tv/StandaloneApi;->clearMediaFiles(Ljava/io/File;)V

    const/4 v0, 0x0

    const/4 v1, 0x1

    aput-boolean v1, p1, v0

    invoke-static {p2, p3, p0}, Lcn/hongguo/tv/PublicMediaSource;->prepare(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcn/hongguo/tv/DirectMediaSource$Prepared;

    move-result-object p0

    return-object p0
.end method

.method private declared-synchronized load(Ljava/lang/String;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    monitor-enter p0

    .line 25
    if-eqz p1, :cond_4

    :try_start_0
    const-string v0, "[0-9]{8,24}"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 26
    iget-object v0, p0, Lcn/hongguo/tv/StandaloneApi;->seriesId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/hongguo/tv/StandaloneApi;->videoIds:[Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    .line 27
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcn/hongguo/tv/StandaloneApi;->client:Lcn/hongguo/tv/DirectContentClient;

    invoke-virtual {v0, p1}, Lcn/hongguo/tv/DirectContentClient;->episodes(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "video_list"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 28
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/4 v3, 0x1

    if-lt v2, v3, :cond_3

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/16 v4, 0x2710

    if-gt v2, v4, :cond_3

    .line 29
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    new-array v4, v2, [Ljava/lang/String;

    .line 30
    const/4 v5, 0x0

    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_2

    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "vid_index"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    sub-int/2addr v7, v3

    const-string v8, "vid"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-ltz v7, :cond_1

    if-ge v7, v2, :cond_1

    aget-object v8, v4, v7

    if-nez v8, :cond_1

    const-string v8, "[0-9]{8,24}"

    invoke-virtual {v6, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    aput-object v6, v4, v7

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "\u5267\u96c6\u5217\u8868\u4e0d\u5b8c\u6574"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 31
    :cond_2
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "id"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "title"

    const-string v5, "series_title"

    invoke-virtual {v0, v5, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "count"

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "intro"

    const-string v3, "series_intro"

    const-string v5, ""

    invoke-virtual {v0, v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    iput-object v0, p0, Lcn/hongguo/tv/StandaloneApi;->series:Lorg/json/JSONObject;

    .line 32
    iput-object p1, p0, Lcn/hongguo/tv/StandaloneApi;->seriesId:Ljava/lang/String;

    iput-object v4, p0, Lcn/hongguo/tv/StandaloneApi;->videoIds:[Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    monitor-exit p0

    return-void

    .line 28
    :cond_3
    :try_start_2
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "\u5267\u96c6\u5217\u8868\u6682\u4e0d\u652f\u6301"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 25
    :cond_4
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "\u5267\u96c6\u7f16\u53f7\u65e0\u6548"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 24
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method


# virtual methods
.method clearMediaCache()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 42
    sget-object v0, Lcn/hongguo/tv/StandaloneApi;->MEDIA_LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/hongguo/tv/StandaloneApi;->cache:Ljava/io/File;

    invoke-static {v1}, Lcn/hongguo/tv/StandaloneApi;->clearMediaFiles(Ljava/io/File;)V

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcn/hongguo/tv/StandaloneApi;->cache:Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "slot"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v2}, Lcn/hongguo/tv/StandaloneApi;->clearMediaFiles(Ljava/io/File;)V

    iget-object v2, p0, Lcn/hongguo/tv/StandaloneApi;->cachedKeys:[Ljava/lang/String;

    const-string v3, ""

    aput-object v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method cover(Ljava/lang/String;Lcn/hongguo/tv/MemoryProfile;)Landroid/graphics/Bitmap;
    .locals 0

    .line 40
    const/4 p1, 0x0

    return-object p1
.end method

.method independent()Z
    .locals 1

    .line 22
    const/4 v0, 0x1

    return v0
.end method

.method declared-synchronized json(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    monitor-enter p0

    .line 35
    :try_start_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 36
    const-string v0, "/health"

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    const-string v0, "service"

    const-string v1, "hongguo-tv-local"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "mode"

    const-string v1, "standalone"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    .line 37
    :cond_0
    :try_start_1
    const-string v0, "/episodes"

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "id"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcn/hongguo/tv/StandaloneApi;->load(Ljava/lang/String;)V

    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1}, Lorg/json/JSONArray;-><init>()V

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcn/hongguo/tv/StandaloneApi;->videoIds:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "number"

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    :cond_1
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "series"

    new-instance v2, Lorg/json/JSONObject;

    iget-object v3, p0, Lcn/hongguo/tv/StandaloneApi;->series:Lorg/json/JSONObject;

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "episodes"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    .line 38
    :cond_2
    :try_start_2
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "\u76ee\u5f55\u6682\u4e0d\u53ef\u7528\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method synthetic lambda$media$0$cn-hongguo-tv-StandaloneApi(Ljava/lang/String;Ljava/io/File;I)Lcn/hongguo/tv/DirectMediaSource$Prepared;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 57
    iget-object v0, p0, Lcn/hongguo/tv/StandaloneApi;->client:Lcn/hongguo/tv/DirectContentClient;

    invoke-virtual {v0, p1}, Lcn/hongguo/tv/DirectContentClient;->mediaModel(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-static {p1, p2, p3}, Lcn/hongguo/tv/DirectMediaSource;->prepare(Lorg/json/JSONObject;Ljava/io/File;I)Lcn/hongguo/tv/DirectMediaSource$Prepared;

    move-result-object p1

    return-object p1
.end method

.method synthetic lambda$media$2$cn-hongguo-tv-StandaloneApi(Ljava/io/IOException;)V
    .locals 4

    .line 59
    instance-of p1, p1, Lcn/hongguo/tv/ReadRetry$TemporaryResponse;

    if-eqz p1, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    const-wide/32 v2, 0x493e0

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcn/hongguo/tv/StandaloneApi;->publicUntil:J

    :cond_0
    return-void
.end method

.method media(Ljava/lang/String;I)Lcn/hongguo/tv/Api$Source;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 43
    const/16 v0, 0x1e0

    invoke-virtual {p0, p1, p2, v0}, Lcn/hongguo/tv/StandaloneApi;->media(Ljava/lang/String;II)Lcn/hongguo/tv/Api$Source;

    move-result-object p1

    return-object p1
.end method

.method media(Ljava/lang/String;II)Lcn/hongguo/tv/Api$Source;
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 47
    move-object/from16 v1, p0

    move/from16 v0, p2

    move/from16 v2, p3

    monitor-enter p0

    :try_start_0
    invoke-direct/range {p0 .. p1}, Lcn/hongguo/tv/StandaloneApi;->load(Ljava/lang/String;)V

    const/4 v3, 0x1

    if-lt v0, v3, :cond_8

    iget-object v4, v1, Lcn/hongguo/tv/StandaloneApi;->videoIds:[Ljava/lang/String;

    array-length v4, v4

    if-gt v0, v4, :cond_8

    iget-object v4, v1, Lcn/hongguo/tv/StandaloneApi;->videoIds:[Ljava/lang/String;

    sub-int/2addr v0, v3

    aget-object v0, v4, v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 48
    sget-object v4, Lcn/hongguo/tv/StandaloneApi;->MEDIA_LOCK:Ljava/lang/Object;

    monitor-enter v4

    .line 49
    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v5

    if-nez v5, :cond_7

    .line 50
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 51
    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_0
    const/4 v8, 0x2

    const-wide/16 v9, 0x1

    if-ge v7, v8, :cond_2

    new-instance v8, Ljava/io/File;

    iget-object v11, v1, Lcn/hongguo/tv/StandaloneApi;->cache:Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "slot"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/current.mp4"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v8, v11, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iget-object v11, v1, Lcn/hongguo/tv/StandaloneApi;->cachedKeys:[Ljava/lang/String;

    aget-object v11, v11, v7

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_0

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ":public360"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    iget-object v12, v1, Lcn/hongguo/tv/StandaloneApi;->cachedKeys:[Ljava/lang/String;

    aget-object v12, v12, v7

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    :cond_0
    invoke-virtual {v8}, Ljava/io/File;->isFile()Z

    move-result v11

    if-eqz v11, :cond_1

    invoke-virtual {v8}, Ljava/io/File;->length()J

    move-result-wide v11

    const-wide/16 v13, 0x0

    cmp-long v15, v11, v13

    if-lez v15, :cond_1

    iget-object v0, v1, Lcn/hongguo/tv/StandaloneApi;->used:[J

    iget-wide v5, v1, Lcn/hongguo/tv/StandaloneApi;->clock:J

    add-long/2addr v5, v9

    iput-wide v5, v1, Lcn/hongguo/tv/StandaloneApi;->clock:J

    aput-wide v5, v0, v7

    new-instance v0, Lcn/hongguo/tv/Api$Source;

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v5

    iget-object v6, v1, Lcn/hongguo/tv/StandaloneApi;->cachedNotes:[Ljava/lang/String;

    aget-object v6, v6, v7

    invoke-direct {v0, v2, v3, v5, v6}, Lcn/hongguo/tv/Api$Source;-><init>(Ljava/lang/String;ZLjava/util/Map;Ljava/lang/String;)V

    monitor-exit v4

    return-object v0

    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 52
    :cond_2
    iget-object v7, v1, Lcn/hongguo/tv/StandaloneApi;->used:[J

    aget-wide v11, v7, v6

    iget-object v7, v1, Lcn/hongguo/tv/StandaloneApi;->used:[J

    aget-wide v13, v7, v3

    cmp-long v7, v11, v13

    if-gtz v7, :cond_3

    const/4 v7, 0x0

    goto :goto_1

    :cond_3
    const/4 v7, 0x1

    :goto_1
    new-instance v8, Ljava/io/File;

    iget-object v11, v1, Lcn/hongguo/tv/StandaloneApi;->cache:Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "slot"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v8, v11, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 54
    iget-object v11, v1, Lcn/hongguo/tv/StandaloneApi;->cache:Ljava/io/File;

    invoke-static {v11}, Lcn/hongguo/tv/StandaloneApi;->clearMediaFiles(Ljava/io/File;)V

    invoke-static {v8}, Lcn/hongguo/tv/StandaloneApi;->clearMediaFiles(Ljava/io/File;)V

    iget-object v11, v1, Lcn/hongguo/tv/StandaloneApi;->cachedKeys:[Ljava/lang/String;

    const-string v12, ""

    aput-object v12, v11, v7

    .line 55
    new-array v11, v3, [Z

    aput-boolean v6, v11, v6

    .line 56
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v12

    iget-wide v14, v1, Lcn/hongguo/tv/StandaloneApi;->publicUntil:J

    cmp-long v16, v12, v14

    if-gez v16, :cond_4

    const/4 v12, 0x1

    goto :goto_2

    :cond_4
    const/4 v12, 0x0

    :goto_2
    new-instance v13, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda0;

    invoke-direct {v13, v1, v0, v8, v2}, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda0;-><init>(Lcn/hongguo/tv/StandaloneApi;Ljava/lang/String;Ljava/io/File;I)V

    new-instance v2, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda1;

    move-object/from16 v14, p1

    invoke-direct {v2, v8, v11, v14, v0}, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda1;-><init>(Ljava/io/File;[ZLjava/lang/String;Ljava/lang/String;)V

    new-instance v14, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda2;

    invoke-direct {v14, v1}, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda2;-><init>(Lcn/hongguo/tv/StandaloneApi;)V

    invoke-static {v12, v13, v2, v14}, Lcn/hongguo/tv/MediaFallback;->load(ZLcn/hongguo/tv/ReadRetry$Operation;Lcn/hongguo/tv/ReadRetry$Operation;Lcn/hongguo/tv/MediaFallback$Failure;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcn/hongguo/tv/DirectMediaSource$Prepared;

    .line 60
    const-string v12, ""

    aget-boolean v6, v11, v6

    if-eqz v6, :cond_5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, ":public360"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v12, "\u516c\u5f00\u5907\u7528\u7247\u6e90 \u00b7 360p"

    .line 61
    :cond_5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_6

    .line 62
    iget-object v0, v1, Lcn/hongguo/tv/StandaloneApi;->cachedKeys:[Ljava/lang/String;

    aput-object v5, v0, v7

    iget-object v0, v1, Lcn/hongguo/tv/StandaloneApi;->cachedNotes:[Ljava/lang/String;

    aput-object v12, v0, v7

    iget-object v0, v1, Lcn/hongguo/tv/StandaloneApi;->used:[J

    iget-wide v5, v1, Lcn/hongguo/tv/StandaloneApi;->clock:J

    add-long/2addr v5, v9

    iput-wide v5, v1, Lcn/hongguo/tv/StandaloneApi;->clock:J

    aput-wide v5, v0, v7

    .line 63
    new-instance v0, Lcn/hongguo/tv/Api$Source;

    iget-object v2, v2, Lcn/hongguo/tv/DirectMediaSource$Prepared;->file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v5

    invoke-direct {v0, v2, v3, v5, v12}, Lcn/hongguo/tv/Api$Source;-><init>(Ljava/lang/String;ZLjava/util/Map;Ljava/lang/String;)V

    monitor-exit v4

    return-object v0

    .line 61
    :cond_6
    invoke-static {v8}, Lcn/hongguo/tv/StandaloneApi;->clearMediaFiles(Ljava/io/File;)V

    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-direct {v0}, Ljava/io/InterruptedIOException;-><init>()V

    throw v0

    .line 49
    :cond_7
    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-direct {v0}, Ljava/io/InterruptedIOException;-><init>()V

    throw v0

    .line 64
    :catchall_0
    move-exception v0

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 47
    :cond_8
    :try_start_2
    new-instance v0, Ljava/lang/Exception;

    const-string v2, "\u5267\u96c6\u4e0d\u5b58\u5728"

    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_1
    move-exception v0

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0
.end method

.method prefetch(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 44
    invoke-virtual {p0, p1, p2, p3}, Lcn/hongguo/tv/StandaloneApi;->media(Ljava/lang/String;II)Lcn/hongguo/tv/Api$Source;

    return-void
.end method

.method ready()Z
    .locals 1

    .line 23
    const/4 v0, 0x1

    return v0
.end method

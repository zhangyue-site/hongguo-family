.class final Lcn/hongguo/tv/Recommendations;
.super Ljava/lang/Object;
.source "Recommendations.java"


# static fields
.field static final DAY:J = 0x5265c00L

.field static final GENRES:[Ljava/lang/String;


# instance fields
.field private final random:Ljava/util/Random;

.field private sampleEpisode:I

.field private sampleId:Ljava/lang/String;

.field private samplePosition:J

.field private sampleTime:J

.field private state:Lorg/json/JSONObject;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 8
    const-string v10, "\u6821\u56ed"

    const-string v11, "\u603b\u88c1"

    const-string v0, "\u4ed9\u4fa0"

    const-string v1, "\u751c\u5ba0"

    const-string v2, "\u9006\u88ad"

    const-string v3, "\u90fd\u5e02"

    const-string v4, "\u53e4\u88c5"

    const-string v5, "\u60ac\u7591"

    const-string v6, "\u91cd\u751f"

    const-string v7, "\u840c\u5b9d"

    const-string v8, "\u7384\u5e7b"

    const-string v9, "\u5bb6\u5ead"

    filled-new-array/range {v0 .. v11}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcn/hongguo/tv/Recommendations;->GENRES:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 13
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    invoke-direct {p0, p1, v0}, Lcn/hongguo/tv/Recommendations;-><init>(Ljava/lang/String;Ljava/util/Random;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/util/Random;)V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const-string v0, ""

    iput-object v0, p0, Lcn/hongguo/tv/Recommendations;->sampleId:Ljava/lang/String;

    .line 14
    iput-object p2, p0, Lcn/hongguo/tv/Recommendations;->random:Ljava/util/Random;

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    const/high16 v0, 0x10000

    if-gt p2, v0, :cond_0

    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    :goto_0
    iput-object p2, p0, Lcn/hongguo/tv/Recommendations;->state:Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/Recommendations;->state:Lorg/json/JSONObject;

    :goto_1
    return-void
.end method

.method static copyMetadata(Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 22
    const-string v0, "first_online_time"

    const-string v1, "catalog_mode"

    const-string v2, "tags"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x3

    if-ge v1, v2, :cond_1

    aget-object v2, v0, v1

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 23
    :cond_1
    return-void
.end method

.method private entry(Lorg/json/JSONObject;J)Lorg/json/JSONObject;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 28
    const-string v0, "catalog_mode"

    const-string v1, "short"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcn/hongguo/tv/Recommendations;->titles(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 29
    if-nez v2, :cond_0

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    const-string v4, "episodes"

    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "watched"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    const-string v1, "at"

    invoke-virtual {v2, v1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string p2, "genre"

    invoke-static {p1}, Lcn/hongguo/tv/Recommendations;->genre(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 30
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->length()I

    move-result p1

    const/16 p2, 0x50

    if-le p1, p2, :cond_4

    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p1

    const/4 p2, 0x0

    const-wide v3, 0x7fffffffffffffffL

    :cond_1
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    invoke-virtual {v0, p3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v5

    cmp-long v7, v5, v3

    if-gez v7, :cond_1

    move-object p2, p3

    move-wide v3, v5

    goto :goto_1

    :cond_2
    if-nez p2, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    goto :goto_0

    :cond_4
    :goto_2
    return-object v2
.end method

.method static genre(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 7

    .line 16
    const-string v0, "tags"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "catalog_mode"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "ai"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    sget-object v1, Lcn/hongguo/tv/AiCatalog;->GENRES:[Ljava/lang/String;

    array-length v3, v1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_1

    aget-object v5, v1, v4

    invoke-virtual {v0, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    return-object v5

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "title"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "intro"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 17
    :cond_2
    const-string p0, "\u4ed9\u4fa0"

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "\u4fee\u4ed9"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "\u4ed9\u95e8"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_2

    .line 18
    :cond_3
    sget-object p0, Lcn/hongguo/tv/Recommendations;->GENRES:[Ljava/lang/String;

    array-length v1, p0

    :goto_1
    if-ge v2, v1, :cond_5

    aget-object v3, p0, v2

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_4

    return-object v3

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 19
    :cond_5
    const-string p0, ""

    return-object p0

    .line 17
    :cond_6
    :goto_2
    return-object p0
.end method

.method private group(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 25
    iget-object v0, p0, Lcn/hongguo/tv/Recommendations;->state:Lorg/json/JSONObject;

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "scores"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "titles"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    const-string v2, "seen"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    iget-object v1, p0, Lcn/hongguo/tv/Recommendations;->state:Lorg/json/JSONObject;

    invoke-virtual {v1, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    return-object v0
.end method

.method static online(Lorg/json/JSONObject;J)J
    .locals 7

    .line 24
    const-string v0, "first_online_time"

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v3

    cmp-long p0, v3, v1

    if-lez p0, :cond_0

    const-wide v5, 0x174876e800L

    cmp-long p0, v3, v5

    if-gez p0, :cond_0

    const-wide/16 v5, 0x3e8

    mul-long v3, v3, v5

    :cond_0
    const-wide v5, 0x125e72e7800L

    cmp-long p0, v3, v5

    if-ltz p0, :cond_1

    cmp-long p0, v3, p1

    if-gtz p0, :cond_1

    move-wide v1, v3

    :cond_1
    return-wide v1
.end method

.method private reward(Lorg/json/JSONObject;IJ)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 33
    invoke-static {p1}, Lcn/hongguo/tv/Recommendations;->genre(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    const-string v1, "catalog_mode"

    const-string v2, "short"

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcn/hongguo/tv/Recommendations;->group(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "scores"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0, p1, v0, p3, p4}, Lcn/hongguo/tv/Recommendations;->score(Ljava/lang/String;Ljava/lang/String;J)D

    move-result-wide v3

    int-to-double p1, p2

    add-double/2addr v3, p1

    const-wide/high16 p1, 0x4014000000000000L    # 5.0

    invoke-static {p1, p2, v3, v4}, Ljava/lang/Math;->min(DD)D

    move-result-wide p1

    const-wide/high16 v3, -0x3fec000000000000L    # -5.0

    invoke-static {v3, v4, p1, p2}, Ljava/lang/Math;->max(DD)D

    move-result-wide p1

    const-string v3, "value"

    invoke-virtual {v2, v3, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "at"

    invoke-virtual {p1, p2, p3, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {v1, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-void
.end method

.method private titles(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 26
    invoke-direct {p0, p1}, Lcn/hongguo/tv/Recommendations;->group(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "titles"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method declared-synchronized early(Lorg/json/JSONObject;)Z
    .locals 7

    monitor-enter p0

    .line 50
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "catalog_mode"

    const-string v2, "short"

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcn/hongguo/tv/Recommendations;->titles(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v1, "max_ep"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x1

    if-gt v1, v2, :cond_0

    const-string v1, "watched"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v3

    const-wide/16 v5, 0xbb8

    cmp-long v1, v3, v5

    if-ltz v1, :cond_0

    const-string v1, "liked"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "engaged"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    :goto_0
    monitor-exit p0

    return v0

    .line 50
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    .line 50
    :catch_0
    move-exception p1

    goto :goto_0
.end method

.method declared-synchronized neutral()Lcn/hongguo/tv/Recommendations;
    .locals 6

    monitor-enter p0

    .line 53
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {p0}, Lcn/hongguo/tv/Recommendations;->serialize()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "short"

    const-string v2, "manju"

    const-string v3, "ai"

    filled-new-array {v1, v2, v3}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x3

    if-ge v2, v3, :cond_1

    aget-object v3, v1, v2

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_0

    const-string v4, "scores"

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    new-instance v1, Lcn/hongguo/tv/Recommendations;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcn/hongguo/tv/Recommendations;->random:Ljava/util/Random;

    invoke-direct {v1, v0, v2}, Lcn/hongguo/tv/Recommendations;-><init>(Ljava/lang/String;Ljava/util/Random;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    .line 53
    :catchall_0
    move-exception v0

    goto :goto_1

    .line 53
    :catch_0
    move-exception v0

    :try_start_1
    new-instance v0, Lcn/hongguo/tv/Recommendations;

    const-string v1, "{}"

    invoke-direct {v0, v1}, Lcn/hongguo/tv/Recommendations;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    .line 53
    :goto_1
    monitor-exit p0

    throw v0
.end method

.method declared-synchronized pick(Lorg/json/JSONArray;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Lorg/json/JSONObject;
    .locals 24

    move-object/from16 v1, p0

    move-object/from16 v0, p2

    move-wide/from16 v2, p5

    monitor-enter p0

    .line 61
    const/4 v4, 0x0

    :try_start_0
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    move-object/from16 v6, p3

    invoke-interface {v5, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-direct {v1, v0}, Lcn/hongguo/tv/Recommendations;->group(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "seen"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    const/4 v8, 0x0

    :goto_0
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v8, v9, :cond_0

    invoke-virtual {v6, v8}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v5, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    :cond_0
    invoke-direct {v1, v0}, Lcn/hongguo/tv/Recommendations;->titles(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v6}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v8

    :cond_1
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    const-string v11, "liked"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1

    invoke-interface {v5, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 62
    :cond_2
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    .line 63
    const/4 v9, 0x0

    const/4 v10, 0x0

    :goto_2
    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONArray;->length()I

    move-result v11

    const-wide/16 v12, 0x0

    if-ge v9, v11, :cond_8

    move-object/from16 v11, p1

    invoke-virtual {v11, v9}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v14

    if-nez v14, :cond_3

    move-object/from16 v15, p4

    goto :goto_3

    :cond_3
    const-string v15, "id"

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v14}, Lcn/hongguo/tv/Recommendations;->genre(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v15}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_6

    invoke-interface {v8, v15}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_6

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_4

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_6

    move-object/from16 v15, p4

    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    goto :goto_3

    :cond_4
    move-object/from16 v15, p4

    :cond_5
    invoke-virtual {v6, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v14, v2, v3}, Lcn/hongguo/tv/Recommendations;->online(Lorg/json/JSONObject;J)J

    move-result-wide v16

    cmp-long v7, v16, v12

    if-lez v7, :cond_7

    sub-long v12, v2, v16

    const-wide v16, 0x39ef8b000L

    cmp-long v7, v12, v16

    if-gtz v7, :cond_7

    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    :cond_6
    move-object/from16 v15, p4

    :cond_7
    :goto_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 64
    :cond_8
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 65
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    const-wide/16 v14, 0x0

    :goto_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_e

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/json/JSONObject;

    invoke-static {v11, v2, v3}, Lcn/hongguo/tv/Recommendations;->online(Lorg/json/JSONObject;J)J

    move-result-wide v16

    cmp-long v18, v16, v12

    if-nez v18, :cond_9

    const-wide v16, 0x7fffffffffffffffL

    goto :goto_5

    :cond_9
    sub-long v16, v2, v16

    const-wide/32 v18, 0x5265c00

    div-long v16, v16, v18

    :goto_5
    const/4 v12, 0x3

    const-wide/16 v20, 0xb4

    if-lt v10, v12, :cond_a

    cmp-long v12, v16, v20

    if-lez v12, :cond_a

    const-wide/16 v8, 0x0

    goto :goto_7

    :cond_a
    invoke-static {v11}, Lcn/hongguo/tv/Recommendations;->genre(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v0, v11, v2, v3}, Lcn/hongguo/tv/Recommendations;->score(Ljava/lang/String;Ljava/lang/String;J)D

    move-result-wide v11

    const-wide/high16 v22, 0x3fe0000000000000L    # 0.5

    mul-double v11, v11, v22

    invoke-static {v11, v12}, Ljava/lang/Math;->exp(D)D

    move-result-wide v11

    const-wide/16 v22, 0x1e

    cmp-long v13, v16, v22

    if-gtz v13, :cond_b

    const/4 v13, 0x6

    goto :goto_6

    :cond_b
    const-wide/16 v22, 0x5a

    cmp-long v13, v16, v22

    if-gtz v13, :cond_c

    const/4 v13, 0x4

    goto :goto_6

    :cond_c
    cmp-long v13, v16, v20

    if-gtz v13, :cond_d

    const/4 v13, 0x2

    goto :goto_6

    :cond_d
    const/4 v13, 0x1

    :goto_6
    int-to-double v8, v13

    mul-double v8, v8, v11

    :goto_7
    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v11

    invoke-virtual {v5, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-double/2addr v14, v8

    const-wide/16 v12, 0x0

    goto :goto_4

    .line 66
    :cond_e
    const-wide/16 v2, 0x0

    cmpg-double v0, v14, v2

    if-gtz v0, :cond_f

    monitor-exit p0

    return-object v4

    :cond_f
    :try_start_1
    iget-object v0, v1, Lcn/hongguo/tv/Recommendations;->random:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextDouble()D

    move-result-wide v2

    mul-double v2, v2, v14

    const/4 v7, 0x0

    :goto_8
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v7, v0, :cond_11

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    sub-double/2addr v2, v8

    const-wide/16 v8, 0x0

    cmpg-double v0, v2, v8

    if-gtz v0, :cond_10

    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_10
    add-int/lit8 v7, v7, 0x1

    goto :goto_8

    .line 60
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 67
    :catch_0
    move-exception v0

    :cond_11
    monitor-exit p0

    return-object v4
.end method

.method declared-synchronized query(Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;
    .locals 21

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move-object/from16 v2, p2

    move-wide/from16 v3, p3

    monitor-enter p0

    .line 55
    :try_start_0
    const-string v5, ""

    const-string v6, "ai"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    sget-object v6, Lcn/hongguo/tv/AiCatalog;->GENRES:[Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object v6, Lcn/hongguo/tv/Recommendations;->GENRES:[Ljava/lang/String;

    :goto_0
    array-length v7, v6

    const-wide v9, 0x4007eb851eb851ecL    # 2.99

    const/4 v11, 0x0

    :goto_1
    if-ge v11, v7, :cond_2

    aget-object v12, v6, v11

    invoke-virtual {v1, v0, v12, v3, v4}, Lcn/hongguo/tv/Recommendations;->score(Ljava/lang/String;Ljava/lang/String;J)D

    move-result-wide v13

    invoke-virtual {v12, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_1

    cmpl-double v15, v13, v9

    if-lez v15, :cond_1

    move-object v5, v12

    move-wide v9, v13

    :cond_1
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    :cond_2
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_3

    iget-object v6, v1, Lcn/hongguo/tv/Recommendations;->random:Ljava/util/Random;

    invoke-virtual {v6}, Ljava/util/Random;->nextDouble()D

    move-result-wide v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide v9, 0x3fe999999999999aL    # 0.8

    cmpg-double v11, v6, v9

    if-gez v11, :cond_3

    monitor-exit p0

    return-object v5

    .line 56
    :cond_3
    :try_start_1
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 57
    const-string v7, "ai"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    sget-object v7, Lcn/hongguo/tv/AiCatalog;->GENRES:[Ljava/lang/String;

    goto :goto_2

    :cond_4
    sget-object v7, Lcn/hongguo/tv/Recommendations;->GENRES:[Ljava/lang/String;

    :goto_2
    array-length v9, v7

    const-wide/16 v10, 0x0

    move-wide v13, v10

    const/4 v12, 0x0

    :goto_3
    if-ge v12, v9, :cond_7

    aget-object v15, v7, v12

    invoke-virtual {v15, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_5

    goto :goto_5

    :cond_5
    iget-object v8, v1, Lcn/hongguo/tv/Recommendations;->random:Ljava/util/Random;

    invoke-virtual {v8}, Ljava/util/Random;->nextDouble()D

    move-result-wide v17

    const-wide v19, 0x3fc999999999999aL    # 0.2

    cmpg-double v8, v17, v19

    if-gez v8, :cond_6

    const-wide/high16 v17, 0x3ff0000000000000L    # 1.0

    goto :goto_4

    :cond_6
    invoke-virtual {v1, v0, v15, v3, v4}, Lcn/hongguo/tv/Recommendations;->score(Ljava/lang/String;Ljava/lang/String;J)D

    move-result-wide v17

    const-wide v19, 0x3fe6666666666666L    # 0.7

    mul-double v17, v17, v19

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->exp(D)D

    move-result-wide v17

    :goto_4
    invoke-virtual {v5, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static/range {v17 .. v18}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-double v13, v13, v17

    :goto_5
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 58
    :cond_7
    iget-object v0, v1, Lcn/hongguo/tv/Recommendations;->random:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextDouble()D

    move-result-wide v2

    mul-double v2, v2, v13

    const/4 v0, 0x0

    :goto_6
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v0, v4, :cond_9

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v7

    sub-double/2addr v2, v7

    cmpg-double v4, v2, v10

    if-gtz v4, :cond_8

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    :goto_7
    check-cast v0, Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_8
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_9
    const/4 v0, 0x0

    :try_start_2
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_7

    .line 54
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized resetSample()V
    .locals 2

    monitor-enter p0

    .line 34
    :try_start_0
    const-string v0, ""

    iput-object v0, p0, Lcn/hongguo/tv/Recommendations;->sampleId:Ljava/lang/String;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcn/hongguo/tv/Recommendations;->sampleTime:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 34
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized sample(Lorg/json/JSONObject;IIJJJZFJ)V
    .locals 21

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move-wide/from16 v4, p4

    move-wide/from16 v6, p6

    move-wide/from16 v8, p8

    move-wide/from16 v10, p12

    monitor-enter p0

    .line 36
    :try_start_0
    const-string v12, "id"

    invoke-virtual {v0, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 37
    if-eqz p10, :cond_9

    const-wide/16 v13, 0x0

    cmp-long v15, v6, v13

    if-gtz v15, :cond_0

    goto/16 :goto_3

    .line 38
    :cond_0
    iget-wide v13, v1, Lcn/hongguo/tv/Recommendations;->sampleTime:J

    sub-long v13, v8, v13

    iget-wide v8, v1, Lcn/hongguo/tv/Recommendations;->samplePosition:J

    sub-long v8, v4, v8

    .line 39
    iget-object v15, v1, Lcn/hongguo/tv/Recommendations;->sampleId:Ljava/lang/String;

    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_7

    iget v15, v1, Lcn/hongguo/tv/Recommendations;->sampleEpisode:I

    if-ne v2, v15, :cond_7

    iget-wide v4, v1, Lcn/hongguo/tv/Recommendations;->sampleTime:J

    const-wide/16 v15, 0x0

    cmp-long v17, v4, v15

    if-lez v17, :cond_7

    cmp-long v4, v13, v15

    if-lez v4, :cond_7

    const-wide/16 v4, 0xbb8

    cmp-long v17, v13, v4

    if-gtz v17, :cond_7

    cmp-long v4, v8, v15

    if-lez v4, :cond_7

    long-to-float v4, v8

    long-to-float v5, v13

    const/high16 v15, 0x3f800000    # 1.0f

    move-object/from16 v16, v12

    move/from16 v12, p11

    invoke-static {v15, v12}, Ljava/lang/Math;->max(FF)F

    move-result v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    mul-float v5, v5, v12

    const v12, 0x44bb8000    # 1500.0f

    add-float/2addr v5, v12

    cmpg-float v4, v4, v5

    if-gtz v4, :cond_8

    .line 40
    :try_start_1
    invoke-direct {v1, v0, v10, v11}, Lcn/hongguo/tv/Recommendations;->entry(Lorg/json/JSONObject;J)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "max_ep"

    const-string v12, "max_ep"

    invoke-virtual {v4, v12}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v12

    invoke-static {v2, v12}, Ljava/lang/Math;->max(II)I

    move-result v12

    invoke-virtual {v4, v5, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v5, "watched"

    const-string v12, "watched"

    invoke-virtual {v4, v12}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v17

    const-wide/16 v19, 0x2

    mul-long v13, v13, v19

    invoke-static {v8, v9, v13, v14}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v12

    add-long v12, v17, v12

    const-wide/32 v14, 0x5265c00

    invoke-static {v14, v15, v12, v13}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v12

    invoke-virtual {v4, v5, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 41
    const-string v5, "active_ep"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    const/4 v12, 0x0

    if-eq v5, v2, :cond_1

    const-string v5, "active_ep"

    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v5, "ep_ms"

    invoke-virtual {v4, v5, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    :cond_1
    const-string v5, "ep_ms"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v13

    add-long/2addr v13, v8

    invoke-static {v6, v7, v13, v14}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    const-string v5, "ep_ms"

    invoke-virtual {v4, v5, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 42
    long-to-double v8, v8

    long-to-double v5, v6

    const-wide v13, 0x3fe999999999999aL    # 0.8

    mul-double v5, v5, v13

    cmpl-double v7, v8, v5

    if-ltz v7, :cond_6

    const-string v5, "episodes"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    const/4 v6, 0x0

    :goto_0
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v12, v7, :cond_3

    invoke-virtual {v5, v12}, Lorg/json/JSONArray;->optInt(I)I

    move-result v7

    if-ne v7, v2, :cond_2

    const/4 v6, 0x1

    :cond_2
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    :cond_3
    if-nez v6, :cond_4

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v6

    const/16 v7, 0x200

    if-ge v6, v7, :cond_4

    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 43
    :cond_4
    if-lez v3, :cond_5

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v6

    int-to-double v6, v6

    int-to-double v8, v3

    mul-double v8, v8, v13

    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v8

    cmpl-double v3, v6, v8

    if-ltz v3, :cond_5

    const-string v3, "liked"

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "liked"

    const/4 v5, 0x1

    invoke-virtual {v4, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const/4 v3, 0x4

    invoke-direct {v1, v0, v3, v10, v11}, Lcn/hongguo/tv/Recommendations;->reward(Lorg/json/JSONObject;IJ)V

    goto :goto_1

    .line 44
    :cond_5
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v3

    const/4 v5, 0x3

    if-lt v3, v5, :cond_6

    const-string v3, "liked"

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    const-string v3, "engaged"

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    const-string v3, "engaged"

    const/4 v5, 0x1

    invoke-virtual {v4, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    invoke-direct {v1, v0, v5, v10, v11}, Lcn/hongguo/tv/Recommendations;->reward(Lorg/json/JSONObject;IJ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 46
    :catch_0
    move-exception v0

    :cond_6
    :goto_1
    goto :goto_2

    .line 39
    :cond_7
    move-object/from16 v16, v12

    .line 48
    :cond_8
    :goto_2
    move-object/from16 v3, v16

    :try_start_2
    iput-object v3, v1, Lcn/hongguo/tv/Recommendations;->sampleId:Ljava/lang/String;

    iput v2, v1, Lcn/hongguo/tv/Recommendations;->sampleEpisode:I

    move-wide/from16 v2, p4

    iput-wide v2, v1, Lcn/hongguo/tv/Recommendations;->samplePosition:J

    move-wide/from16 v2, p8

    iput-wide v2, v1, Lcn/hongguo/tv/Recommendations;->sampleTime:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 49
    monitor-exit p0

    return-void

    .line 37
    :cond_9
    :goto_3
    :try_start_3
    invoke-virtual/range {p0 .. p0}, Lcn/hongguo/tv/Recommendations;->resetSample()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    .line 35
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized score(Ljava/lang/String;Ljava/lang/String;J)D
    .locals 4

    monitor-enter p0

    .line 32
    const-wide/16 v0, 0x0

    :try_start_0
    invoke-direct {p0, p1}, Lcn/hongguo/tv/Recommendations;->group(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v2, "scores"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const-string p2, "value"

    invoke-virtual {p1, p2, v0, v1}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v2

    const-string p2, "at"

    invoke-virtual {p1, p2, p3, p4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide p1

    sub-long/2addr p3, p1

    const-wide/16 p1, 0x0

    invoke-static {p1, p2, p3, p4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    long-to-double p1, p1

    const-wide p3, 0x4194997000000000L    # 8.64E7

    div-double/2addr p1, p3

    const-wide p3, 0x3fef0a3d70a3d70aL    # 0.97

    invoke-static {p3, p4, p1, p2}, Ljava/lang/Math;->pow(DD)D

    move-result-wide p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    mul-double v0, v2, p1

    :goto_0
    monitor-exit p0

    return-wide v0

    .line 32
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    .line 32
    :catch_0
    move-exception p1

    goto :goto_0
.end method

.method declared-synchronized serialize()Ljava/lang/String;
    .locals 5

    monitor-enter p0

    .line 69
    :try_start_0
    iget-object v0, p0, Lcn/hongguo/tv/Recommendations;->state:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/high16 v2, 0x10000

    if-le v1, v2, :cond_1

    :try_start_1
    const-string v0, "short"

    const-string v1, "manju"

    const-string v2, "ai"

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x3

    if-ge v1, v2, :cond_0

    aget-object v2, v0, v1

    invoke-direct {p0, v2}, Lcn/hongguo/tv/Recommendations;->group(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "titles"

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_0
    :try_start_2
    iget-object v0, p0, Lcn/hongguo/tv/Recommendations;->state:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_1
    monitor-exit p0

    return-object v0

    .line 69
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized shown(Lorg/json/JSONObject;)V
    .locals 6

    monitor-enter p0

    .line 52
    :try_start_0
    const-string v0, "catalog_mode"

    const-string v1, "short"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0}, Lcn/hongguo/tv/Recommendations;->group(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "seen"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v2, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const/4 v3, 0x0

    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_1

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/16 v5, 0x3c

    if-ge v4, v5, :cond_1

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0}, Lcn/hongguo/tv/Recommendations;->group(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "seen"

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 52
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    .line 52
    :catch_0
    move-exception p1

    :goto_1
    monitor-exit p0

    return-void
.end method

.method declared-synchronized skipped(Lorg/json/JSONObject;J)V
    .locals 3

    monitor-enter p0

    .line 51
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lcn/hongguo/tv/Recommendations;->entry(Lorg/json/JSONObject;J)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/Recommendations;->early(Lorg/json/JSONObject;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "skipped"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "skipped"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const/4 v0, -0x2

    invoke-direct {p0, p1, v0, p2, p3}, Lcn/hongguo/tv/Recommendations;->reward(Lorg/json/JSONObject;IJ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 51
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    .line 51
    :catch_0
    move-exception p1

    :cond_0
    :goto_0
    monitor-exit p0

    return-void
.end method

.class Lcn/hongguo/tv/Catalog;
.super Ljava/lang/Object;
.source "Catalog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/hongguo/tv/Catalog$Result;
    }
.end annotation


# static fields
.field private static final ENDPOINT:Ljava/lang/String; = "https://api5-sinfonlinea.novelfm.com/novelfm/bookmall/search/page/v1/?device_platform=android&aid=3040&manifest_version_code=628&update_version_code=62832"


# instance fields
.field private final cache:Lcn/hongguo/tv/CatalogCache;

.field private final coverAddresses:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private lastRequest:J


# direct methods
.method constructor <init>()V
    .locals 1

    .line 25
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcn/hongguo/tv/Catalog;-><init>(Ljava/io/File;)V

    return-void
.end method

.method constructor <init>(Ljava/io/File;)V
    .locals 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcn/hongguo/tv/Catalog;->coverAddresses:Ljava/util/Map;

    .line 26
    new-instance v0, Lcn/hongguo/tv/CatalogCache;

    invoke-direct {v0, p1}, Lcn/hongguo/tv/CatalogCache;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lcn/hongguo/tv/Catalog;->cache:Lcn/hongguo/tv/CatalogCache;

    return-void
.end method

.method static allowedCover(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .line 180
    const-string v0, ""

    :try_start_0
    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 181
    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 182
    if-eqz v2, :cond_5

    invoke-virtual {v1}, Ljava/net/URI;->getUserInfo()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_5

    invoke-virtual {v1}, Ljava/net/URI;->getPort()I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_5

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x2000

    if-le v3, v4, :cond_0

    goto :goto_3

    .line 183
    :cond_0
    const-string v3, "https"

    invoke-virtual {v1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, "http"

    invoke-virtual {v1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    return-object v0

    .line 184
    :cond_1
    const-string v1, "byteimg.com"

    const-string v3, "fqnovelpic.com"

    const-string v4, "novelfmpic.com"

    filled-new-array {v1, v3, v4}, [Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    const/4 v5, 0x3

    if-ge v4, v5, :cond_6

    aget-object v5, v1, v4

    .line 185
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_1

    .line 184
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 186
    :cond_3
    :goto_1
    const-string v1, "^http:"

    const-string v2, "https:"

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 187
    const/16 v1, 0x23

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 188
    if-gez v1, :cond_4

    goto :goto_2

    :cond_4
    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    return-object p0

    .line 182
    :cond_5
    :goto_3
    return-object v0

    .line 191
    :catch_0
    move-exception p0

    :cond_6
    nop

    .line 192
    return-object v0
.end method

.method private collect(Ljava/lang/Object;ILorg/json/JSONArray;Ljava/util/Set;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I",
            "Lorg/json/JSONArray;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 140
    const/16 v0, 0x10

    if-gt p2, v0, :cond_13

    .line 141
    instance-of v0, p1, Lorg/json/JSONArray;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 142
    check-cast p1, Lorg/json/JSONArray;

    .line 143
    nop

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v1, v0, :cond_11

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v2, p2, 0x1

    invoke-direct {p0, v0, v2, p3, p4}, Lcn/hongguo/tv/Catalog;->collect(Ljava/lang/Object;ILorg/json/JSONArray;Ljava/util/Set;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 144
    :cond_0
    instance-of v0, p1, Lorg/json/JSONObject;

    if-eqz v0, :cond_11

    .line 145
    check-cast p1, Lorg/json/JSONObject;

    .line 146
    const-string v0, "book_id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    const-string v0, "book_name"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 147
    const-string p2, "book_id"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 148
    const-string v0, "book_name"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 149
    const-string v2, "[0-9]{8,24}"

    invoke-virtual {p2, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d

    instance-of v2, v0, Ljava/lang/String;

    if-eqz v2, :cond_d

    .line 150
    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 151
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_c

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xc8

    if-gt v2, v3, :cond_c

    .line 152
    invoke-interface {p4, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p4

    if-nez p4, :cond_1

    return-void

    .line 153
    :cond_1
    const-string p4, "chapter_number"

    invoke-virtual {p1, p4}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p4

    .line 154
    if-eqz p4, :cond_2

    sget-object v2, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq p4, v2, :cond_2

    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "0"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    const-string p4, "serial_count"

    invoke-virtual {p1, p4}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p4

    .line 155
    :cond_3
    if-eqz p4, :cond_5

    sget-object v2, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-ne p4, v2, :cond_4

    goto :goto_1

    :cond_4
    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p4

    goto :goto_2

    :cond_5
    :goto_1
    const-string p4, "0"

    .line 156
    :goto_2
    const-string v2, "[0-9]{1,5}"

    invoke-virtual {p4, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 157
    invoke-static {p4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p4

    .line 158
    if-ltz p4, :cond_a

    const/16 v2, 0x2710

    if-gt p4, v2, :cond_a

    .line 159
    const-string v2, "abstract"

    const-string v3, ""

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 160
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x7d0

    if-le v3, v4, :cond_6

    invoke-virtual {v2, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 161
    :cond_6
    const-string v3, "thumb_url"

    const-string v4, "thumb_pic"

    const-string v5, ""

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcn/hongguo/tv/Catalog;->allowedCover(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 162
    iget-object v4, p0, Lcn/hongguo/tv/Catalog;->coverAddresses:Ljava/util/Map;

    monitor-enter v4

    .line 163
    :try_start_0
    iget-object v5, p0, Lcn/hongguo/tv/Catalog;->coverAddresses:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v5

    const/16 v6, 0x258

    if-le v5, v6, :cond_7

    iget-object v5, p0, Lcn/hongguo/tv/Catalog;->coverAddresses:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->clear()V

    .line 164
    :cond_7
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_8

    iget-object v5, p0, Lcn/hongguo/tv/Catalog;->coverAddresses:Ljava/util/Map;

    invoke-interface {v5, p2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    :cond_8
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 166
    const-string v3, "tags"

    const-string v4, ""

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x12c

    if-le v4, v5, :cond_9

    invoke-virtual {v3, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    :cond_9
    const-string v1, "first_online_time"

    const-wide/16 v4, 0x0

    invoke-virtual {p1, v1, v4, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 167
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "id"

    invoke-virtual {p1, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "title"

    invoke-virtual {p1, p2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "count"

    invoke-virtual {p1, p2, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "intro"

    invoke-virtual {p1, p2, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "tags"

    invoke-virtual {p1, p2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "first_online_time"

    invoke-virtual {p1, p2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p3, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 168
    goto :goto_4

    .line 165
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    .line 158
    :cond_a
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "\u5267\u96c6\u6570\u91cf\u65e0\u6548"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 156
    :cond_b
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "\u5267\u96c6\u6570\u91cf\u65e0\u6548"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 151
    :cond_c
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "\u77ed\u5267\u8d44\u6599\u6709\u8bef"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 149
    :cond_d
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "\u77ed\u5267\u8d44\u6599\u6709\u8bef"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 169
    :cond_e
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    .line 170
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 171
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 172
    instance-of v2, v1, Lorg/json/JSONArray;

    if-nez v2, :cond_f

    instance-of v2, v1, Lorg/json/JSONObject;

    if-eqz v2, :cond_10

    :cond_f
    add-int/lit8 v2, p2, 0x1

    invoke-direct {p0, v1, v2, p3, p4}, Lcn/hongguo/tv/Catalog;->collect(Ljava/lang/Object;ILorg/json/JSONArray;Ljava/util/Set;)V

    .line 173
    :cond_10
    goto :goto_3

    .line 144
    :cond_11
    nop

    .line 176
    :cond_12
    :goto_4
    return-void

    .line 140
    :cond_13
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "\u76ee\u5f55\u683c\u5f0f\u6682\u4e0d\u652f\u6301"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static connection(Ljava/lang/String;)Ljava/net/HttpURLConnection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 207
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;

    .line 208
    invoke-static {p0}, Lcn/hongguo/tv/LegacyTls;->configure(Ljava/net/HttpURLConnection;)V

    .line 209
    const/16 v0, 0x2710

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 210
    const/16 v0, 0x4e20

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 211
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 212
    return-object p0
.end method

.method private static read(Ljava/net/HttpURLConnection;I)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 216
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 217
    const/16 v1, 0x2000

    :try_start_1
    new-array v1, v1, [B

    .line 219
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_2

    .line 220
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_1

    .line 221
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v3

    add-int/2addr v3, v2

    if-gt v3, p1, :cond_0

    .line 222
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 221
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    const-string v1, "\u8fd4\u56de\u5185\u5bb9\u8fc7\u5927"

    invoke-direct {p1, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 220
    :cond_1
    new-instance p1, Ljava/io/InterruptedIOException;

    const-string v1, "Catalog cancelled"

    invoke-direct {p1, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 224
    :cond_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 225
    :try_start_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 224
    :cond_3
    return-object p1

    .line 216
    :catchall_0
    move-exception p1

    :try_start_3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception p1

    if-eqz p0, :cond_4

    :try_start_5
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_4
    :goto_2
    throw p1
.end method


# virtual methods
.method declared-synchronized browsePage(Ljava/lang/String;Ljava/lang/String;Z)Lcn/hongguo/tv/Catalog$Result;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    monitor-enter p0

    .line 34
    :try_start_0
    invoke-static {p1, p2}, Lcn/hongguo/tv/PublicCategories;->path(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "browse:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p2}, Lcn/hongguo/tv/CatalogCache;->key(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lcn/hongguo/tv/Catalog;->now()J

    move-result-wide v1

    .line 36
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_5

    .line 37
    iget-object v3, p0, Lcn/hongguo/tv/Catalog;->cache:Lcn/hongguo/tv/CatalogCache;

    invoke-virtual {v3, p1, v1, v2}, Lcn/hongguo/tv/CatalogCache;->get(Ljava/lang/String;J)Lcn/hongguo/tv/CatalogCache$Entry;

    move-result-object v3

    .line 38
    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez p3, :cond_0

    if-eqz v3, :cond_0

    iget-boolean p3, v3, Lcn/hongguo/tv/CatalogCache$Entry;->restored:Z

    if-nez p3, :cond_0

    iget-wide v6, v3, Lcn/hongguo/tv/CatalogCache$Entry;->savedAt:J

    sub-long/2addr v1, v6

    const-wide/32 v6, 0x927c0

    cmp-long p3, v1, v6

    if-gez p3, :cond_0

    new-instance p1, Lcn/hongguo/tv/Catalog$Result;

    invoke-virtual {v3}, Lcn/hongguo/tv/CatalogCache$Entry;->items()Lorg/json/JSONArray;

    move-result-object p2

    invoke-direct {p1, p2, v5, v4}, Lcn/hongguo/tv/Catalog$Result;-><init>(Lorg/json/JSONArray;ZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    .line 40
    :cond_0
    :try_start_1
    invoke-virtual {p0, v0, p2}, Lcn/hongguo/tv/Catalog;->fetchBrowse(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p2

    .line 41
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Thread;->isInterrupted()Z

    move-result p3

    if-nez p3, :cond_1

    .line 42
    iget-object p3, p0, Lcn/hongguo/tv/Catalog;->cache:Lcn/hongguo/tv/CatalogCache;

    invoke-virtual {p0}, Lcn/hongguo/tv/Catalog;->now()J

    move-result-wide v0

    invoke-virtual {p3, p1, p2, v0, v1}, Lcn/hongguo/tv/CatalogCache;->put(Ljava/lang/String;Lorg/json/JSONArray;J)V

    new-instance p3, Lcn/hongguo/tv/Catalog$Result;

    new-instance v0, Lorg/json/JSONArray;

    invoke-virtual {p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v0, p2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-direct {p3, v0, v5, v5}, Lcn/hongguo/tv/Catalog$Result;-><init>(Lorg/json/JSONArray;ZZ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p3

    .line 41
    :cond_1
    :try_start_2
    new-instance p2, Ljava/io/InterruptedIOException;

    const-string p3, "Catalog cancelled"

    invoke-direct {p2, p3}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 43
    :catch_0
    move-exception p2

    .line 44
    :try_start_3
    instance-of p3, p2, Ljava/lang/InterruptedException;

    if-nez p3, :cond_4

    instance-of p3, p2, Ljava/io/InterruptedIOException;

    if-eqz p3, :cond_2

    instance-of p3, p2, Ljava/net/SocketTimeoutException;

    if-eqz p3, :cond_4

    :cond_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Thread;->isInterrupted()Z

    move-result p3

    if-nez p3, :cond_4

    .line 45
    iget-object p3, p0, Lcn/hongguo/tv/Catalog;->cache:Lcn/hongguo/tv/CatalogCache;

    invoke-virtual {p0}, Lcn/hongguo/tv/Catalog;->now()J

    move-result-wide v0

    invoke-virtual {p3, p1, v0, v1}, Lcn/hongguo/tv/CatalogCache;->get(Ljava/lang/String;J)Lcn/hongguo/tv/CatalogCache$Entry;

    move-result-object p1

    if-eqz p1, :cond_3

    new-instance p2, Lcn/hongguo/tv/Catalog$Result;

    invoke-virtual {p1}, Lcn/hongguo/tv/CatalogCache$Entry;->items()Lorg/json/JSONArray;

    move-result-object p1

    invoke-direct {p2, p1, v4, v4}, Lcn/hongguo/tv/Catalog$Result;-><init>(Lorg/json/JSONArray;ZZ)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-object p2

    :cond_3
    :try_start_4
    throw p2

    .line 44
    :cond_4
    throw p2

    .line 36
    :cond_5
    new-instance p1, Ljava/io/InterruptedIOException;

    const-string p2, "Catalog cancelled"

    invoke-direct {p1, p2}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 34
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Unknown public genre"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 33
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method cover(Ljava/lang/String;Lcn/hongguo/tv/MemoryProfile;)Landroid/graphics/Bitmap;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 197
    iget-object v0, p0, Lcn/hongguo/tv/Catalog;->coverAddresses:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcn/hongguo/tv/Catalog;->coverAddresses:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 198
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 199
    :cond_0
    invoke-static {p1}, Lcn/hongguo/tv/Catalog;->connection(Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object p1

    .line 201
    :try_start_1
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    const/16 v2, 0xc8

    if-eq v1, v2, :cond_1

    .line 203
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 201
    return-object v0

    .line 202
    :cond_1
    :try_start_2
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :try_start_3
    invoke-static {v0, p2}, Lcn/hongguo/tv/PosterImages;->read(Ljava/io/InputStream;Lcn/hongguo/tv/MemoryProfile;)Landroid/graphics/Bitmap;

    move-result-object p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v0, :cond_2

    :try_start_4
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 203
    :cond_2
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 202
    return-object p2

    :catchall_0
    move-exception p2

    if-eqz v0, :cond_3

    :try_start_5
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v0

    :try_start_6
    invoke-virtual {p2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_0
    throw p2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 203
    :catchall_2
    move-exception p2

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p2

    .line 197
    :catchall_3
    move-exception p1

    :try_start_7
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    throw p1
.end method

.method fetch(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 94
    const-string v0, "application/json"

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 95
    iget-wide v3, p0, Lcn/hongguo/tv/Catalog;->lastRequest:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x4b0

    sub-long/2addr v3, v1

    const-wide/16 v1, 0x0

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    cmp-long v5, v3, v1

    if-lez v5, :cond_0

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 96
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, p0, Lcn/hongguo/tv/Catalog;->lastRequest:J

    .line 97
    const-string v1, "manju"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/16 v1, 0xa

    if-eqz p2, :cond_1

    const/16 p2, 0xd

    goto :goto_0

    :cond_1
    const/16 p2, 0xa

    .line 98
    :goto_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "type"

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    const/16 v3, 0x27

    const-string v5, "tab_type"

    invoke-virtual {v2, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    .line 99
    const-string v3, "default_tab_type"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "bottom_type"

    invoke-virtual {v1, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "search_tab_id"

    invoke-virtual {v1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    .line 100
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "limit"

    const/16 v6, 0x14

    invoke-virtual {v2, v3, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "offset"

    const/4 v6, 0x0

    invoke-virtual {v2, v3, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "query"

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    .line 101
    const-string v2, "search_ctx_info"

    const-string v3, ""

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v2, "search_entrance"

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    .line 102
    const-string v1, "search_id"

    invoke-virtual {p1, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v1, "sub_tab_type"

    const/16 v2, 0x1f

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1, v5, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p1

    .line 103
    const-string p2, "https://api5-sinfonlinea.novelfm.com/novelfm/bookmall/search/page/v1/?device_platform=android&aid=3040&manifest_version_code=628&update_version_code=62832"

    invoke-static {p2}, Lcn/hongguo/tv/Catalog;->connection(Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object p2

    .line 105
    :try_start_0
    const-string v1, "POST"

    invoke-virtual {p2, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 106
    invoke-virtual {p2, v4}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 107
    const-string v1, "Content-Type"

    invoke-virtual {p2, v1, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    const-string v1, "Accept"

    invoke-virtual {p2, v1, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    const-string v0, "User-Agent"

    const-string v1, "HongguoTV-MetadataValidation/0.1"

    invoke-virtual {p2, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    .line 111
    array-length v0, p1

    invoke-virtual {p2, v0}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 112
    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    :try_start_1
    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_2

    :try_start_2
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 113
    :cond_2
    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1

    const/16 v0, 0xc8

    if-ne p1, v0, :cond_3

    .line 114
    new-instance p1, Lorg/json/JSONObject;

    new-instance v0, Ljava/lang/String;

    const/high16 v1, 0x200000

    invoke-static {p2, v1}, Lcn/hongguo/tv/Catalog;->read(Ljava/net/HttpURLConnection;I)[B

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-direct {p1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 115
    nop

    .line 117
    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 115
    return-object p1

    .line 113
    :cond_3
    :try_start_3
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "\u76ee\u5f55\u670d\u52a1\u6682\u4e0d\u53ef\u7528\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 112
    :catchall_0
    move-exception p1

    if-eqz v0, :cond_4

    :try_start_4
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_5
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_4
    :goto_1
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 117
    :catchall_2
    move-exception p1

    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 118
    throw p1
.end method

.method fetchAi(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 79
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcn/hongguo/tv/Catalog;->lastRequest:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x4b0

    sub-long/2addr v2, v0

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    cmp-long v4, v2, v0

    if-lez v4, :cond_0

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 80
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcn/hongguo/tv/Catalog;->lastRequest:J

    .line 81
    invoke-static {p1}, Lcn/hongguo/tv/AiCatalog;->path(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 82
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "https://hongguoduanju.com/category/ai-drama"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcn/hongguo/tv/Catalog;->connection(Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object v1

    .line 84
    :try_start_0
    const-string v2, "User-Agent"

    const-string v3, "HongguoTV/0.5.1"

    invoke-virtual {v1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    const/16 v3, 0xc8

    if-ne v2, v3, :cond_6

    .line 86
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 87
    new-instance v3, Ljava/lang/String;

    const/high16 v4, 0x200000

    invoke-static {v1, v4}, Lcn/hongguo/tv/Catalog;->read(Ljava/net/HttpURLConnection;I)[B

    move-result-object v4

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v4, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {v3, v2}, Lcn/hongguo/tv/AiCatalog;->parse(Ljava/lang/String;Ljava/util/Map;)Lorg/json/JSONArray;

    move-result-object v3

    .line 88
    iget-object v4, p0, Lcn/hongguo/tv/Catalog;->coverAddresses:Ljava/util/Map;

    monitor-enter v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v5, p0, Lcn/hongguo/tv/Catalog;->coverAddresses:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v5

    const/16 v6, 0x258

    if-le v5, v6, :cond_1

    iget-object v5, p0, Lcn/hongguo/tv/Catalog;->coverAddresses:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->clear()V

    :cond_1
    iget-object v5, p0, Lcn/hongguo/tv/Catalog;->coverAddresses:Ljava/util/Map;

    invoke-interface {v5, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 89
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "\u5168\u90e8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    .line 90
    :cond_2
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v2, v4, :cond_4

    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "title"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "tags"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 91
    :cond_4
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 90
    return-object v0

    .line 91
    :cond_5
    :goto_1
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 89
    return-object v3

    .line 88
    :catchall_0
    move-exception p1

    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw p1

    .line 85
    :cond_6
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "AI catalog unavailable"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 91
    :catchall_1
    move-exception p1

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p1
.end method

.method fetchBrowse(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 49
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcn/hongguo/tv/Catalog;->lastRequest:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x4b0

    sub-long/2addr v2, v0

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    cmp-long v4, v2, v0

    if-lez v4, :cond_0

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 50
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcn/hongguo/tv/Catalog;->lastRequest:J

    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "https://hongguoduanju.com"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcn/hongguo/tv/Catalog;->connection(Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object p1

    .line 53
    :try_start_0
    const-string v0, "User-Agent"

    const-string v1, "HongguoTV/0.5.5"

    invoke-virtual {p1, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_2

    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 56
    new-instance v1, Ljava/lang/String;

    const/high16 v2, 0x200000

    invoke-static {p1, v2}, Lcn/hongguo/tv/Catalog;->read(Ljava/net/HttpURLConnection;I)[B

    move-result-object v2

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {v1, v0, p2}, Lcn/hongguo/tv/AiCatalog;->parse(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p2

    .line 57
    iget-object v1, p0, Lcn/hongguo/tv/Catalog;->coverAddresses:Ljava/util/Map;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v2, p0, Lcn/hongguo/tv/Catalog;->coverAddresses:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    const/16 v3, 0x258

    if-le v2, v3, :cond_1

    iget-object v2, p0, Lcn/hongguo/tv/Catalog;->coverAddresses:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    :cond_1
    iget-object v2, p0, Lcn/hongguo/tv/Catalog;->coverAddresses:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    nop

    .line 59
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 58
    return-object p2

    .line 57
    :catchall_0
    move-exception p2

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw p2

    .line 54
    :cond_2
    new-instance p2, Ljava/lang/Exception;

    const-string v0, "Public catalog unavailable"

    invoke-direct {p2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 59
    :catchall_1
    move-exception p2

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p2
.end method

.method now()J
    .locals 2

    .line 32
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method parse(Lorg/json/JSONObject;)Lorg/json/JSONArray;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 122
    const-string v0, "code"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Number;

    if-eqz v1, :cond_5

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmpl-double v4, v0, v2

    if-nez v4, :cond_5

    .line 125
    const-string v0, "data"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 126
    const-string v0, "\u76ee\u5f55\u6570\u636e\u4e0d\u5b8c\u6574"

    if-eqz p1, :cond_4

    const-string v1, "search_data"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 127
    const-string v2, "has_more"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 128
    instance-of v3, v2, Ljava/lang/Boolean;

    const/4 v4, 0x1

    if-nez v3, :cond_1

    instance-of v3, v2, Ljava/lang/Integer;

    if-eqz v3, :cond_0

    move-object v3, v2

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v3, v4, :cond_0

    goto :goto_0

    .line 129
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "\u76ee\u5f55\u5206\u9875\u4fe1\u606f\u4e0d\u5b8c\u6574"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 131
    :cond_1
    :goto_0
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 132
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    const/4 v5, 0x0

    invoke-direct {p0, p1, v5, v3, v1}, Lcn/hongguo/tv/Catalog;->collect(Ljava/lang/Object;ILorg/json/JSONArray;Ljava/util/Set;)V

    .line 133
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result p1

    const/16 v1, 0x14

    if-gt p1, v1, :cond_3

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result p1

    if-nez p1, :cond_2

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    .line 136
    :cond_2
    return-object v3

    .line 134
    :cond_3
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 126
    :cond_4
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1

    .line 123
    :cond_5
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "\u76ee\u5f55\u670d\u52a1\u6682\u672a\u8fd4\u56de\u7ed3\u679c\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method declared-synchronized search(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    monitor-enter p0

    .line 61
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p1, p2, v0}, Lcn/hongguo/tv/Catalog;->searchPage(Ljava/lang/String;Ljava/lang/String;Z)Lcn/hongguo/tv/Catalog$Result;

    move-result-object p1

    iget-object p1, p1, Lcn/hongguo/tv/Catalog$Result;->items:Lorg/json/JSONArray;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    .line 61
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized searchPage(Ljava/lang/String;Ljava/lang/String;Z)Lcn/hongguo/tv/Catalog$Result;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    monitor-enter p0

    .line 63
    :try_start_0
    invoke-static {p1, p2}, Lcn/hongguo/tv/CatalogCache;->key(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 64
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v1

    if-nez v1, :cond_7

    .line 65
    invoke-virtual {p0}, Lcn/hongguo/tv/Catalog;->now()J

    move-result-wide v1

    iget-object v3, p0, Lcn/hongguo/tv/Catalog;->cache:Lcn/hongguo/tv/CatalogCache;

    invoke-virtual {v3, v0, v1, v2}, Lcn/hongguo/tv/CatalogCache;->get(Ljava/lang/String;J)Lcn/hongguo/tv/CatalogCache$Entry;

    move-result-object v3

    .line 67
    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez p3, :cond_0

    if-eqz v3, :cond_0

    iget-boolean p3, v3, Lcn/hongguo/tv/CatalogCache$Entry;->restored:Z

    if-nez p3, :cond_0

    iget-wide v6, v3, Lcn/hongguo/tv/CatalogCache$Entry;->savedAt:J

    sub-long/2addr v1, v6

    const-wide/32 v6, 0x927c0

    cmp-long p3, v1, v6

    if-gez p3, :cond_0

    new-instance p1, Lcn/hongguo/tv/Catalog$Result;

    invoke-virtual {v3}, Lcn/hongguo/tv/CatalogCache$Entry;->items()Lorg/json/JSONArray;

    move-result-object p2

    invoke-direct {p1, p2, v5, v4}, Lcn/hongguo/tv/Catalog$Result;-><init>(Lorg/json/JSONArray;ZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    .line 69
    :cond_0
    :try_start_1
    const-string p3, "ai"

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/Catalog;->fetchAi(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1, p2}, Lcn/hongguo/tv/Catalog;->fetch(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcn/hongguo/tv/Catalog;->parse(Lorg/json/JSONObject;)Lorg/json/JSONArray;

    move-result-object p1

    :goto_0
    const/4 p3, 0x0

    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge p3, v1, :cond_2

    invoke-virtual {p1, p3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "catalog_mode"

    invoke-virtual {v1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    add-int/lit8 p3, p3, 0x1

    goto :goto_1

    .line 70
    :cond_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result p2

    if-nez p2, :cond_3

    .line 71
    iget-object p2, p0, Lcn/hongguo/tv/Catalog;->cache:Lcn/hongguo/tv/CatalogCache;

    invoke-virtual {p0}, Lcn/hongguo/tv/Catalog;->now()J

    move-result-wide v1

    invoke-virtual {p2, v0, p1, v1, v2}, Lcn/hongguo/tv/CatalogCache;->put(Ljava/lang/String;Lorg/json/JSONArray;J)V

    new-instance p2, Lcn/hongguo/tv/Catalog$Result;

    new-instance p3, Lorg/json/JSONArray;

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-direct {p2, p3, v5, v5}, Lcn/hongguo/tv/Catalog$Result;-><init>(Lorg/json/JSONArray;ZZ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p2

    .line 70
    :cond_3
    :try_start_2
    new-instance p1, Ljava/io/InterruptedIOException;

    const-string p2, "Catalog cancelled"

    invoke-direct {p1, p2}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 72
    :catch_0
    move-exception p1

    .line 73
    :try_start_3
    instance-of p2, p1, Ljava/lang/InterruptedException;

    if-nez p2, :cond_6

    instance-of p2, p1, Ljava/io/InterruptedIOException;

    if-eqz p2, :cond_4

    instance-of p2, p1, Ljava/net/SocketTimeoutException;

    if-eqz p2, :cond_6

    :cond_4
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result p2

    if-nez p2, :cond_6

    .line 74
    iget-object p2, p0, Lcn/hongguo/tv/Catalog;->cache:Lcn/hongguo/tv/CatalogCache;

    invoke-virtual {p0}, Lcn/hongguo/tv/Catalog;->now()J

    move-result-wide v1

    invoke-virtual {p2, v0, v1, v2}, Lcn/hongguo/tv/CatalogCache;->get(Ljava/lang/String;J)Lcn/hongguo/tv/CatalogCache$Entry;

    move-result-object p2

    if-eqz p2, :cond_5

    new-instance p1, Lcn/hongguo/tv/Catalog$Result;

    invoke-virtual {p2}, Lcn/hongguo/tv/CatalogCache$Entry;->items()Lorg/json/JSONArray;

    move-result-object p2

    invoke-direct {p1, p2, v4, v4}, Lcn/hongguo/tv/Catalog$Result;-><init>(Lorg/json/JSONArray;ZZ)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-object p1

    .line 75
    :cond_5
    :try_start_4
    throw p1

    .line 73
    :cond_6
    throw p1

    .line 64
    :cond_7
    new-instance p1, Ljava/io/InterruptedIOException;

    const-string p2, "Catalog cancelled"

    invoke-direct {p1, p2}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 62
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

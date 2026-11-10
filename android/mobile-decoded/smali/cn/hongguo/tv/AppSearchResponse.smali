.class final Lcn/hongguo/tv/AppSearchResponse;
.super Ljava/lang/Object;
.source "AppSearchResponse.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static catalog(Lorg/json/JSONObject;I)Lorg/json/JSONObject;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 12
    const-string v0, "code"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/Number;

    if-eqz v1, :cond_e

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmpl-double v5, v1, v3

    if-nez v5, :cond_e

    .line 13
    const-string v1, "search_tabs"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 14
    const-string v1, "\u641c\u7d22\u6570\u636e\u4e0d\u5b8c\u6574"

    if-eqz p0, :cond_d

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/16 v3, 0x20

    if-gt v2, v3, :cond_d

    .line 15
    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_1

    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :cond_0

    const-string v5, "tab_type"

    const/4 v6, -0x1

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v5

    if-ne v5, p1, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    .line 16
    :goto_1
    if-eqz v4, :cond_c

    .line 17
    const-string p0, "data"

    invoke-virtual {v4, p0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    if-eqz p1, :cond_b

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    const/16 v5, 0x64

    if-gt v3, v5, :cond_b

    .line 18
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 19
    const/4 v5, 0x0

    :goto_2
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_8

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v6

    const/16 v7, 0x14

    if-ge v6, v7, :cond_8

    .line 20
    invoke-virtual {p1, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    if-nez v6, :cond_2

    goto/16 :goto_3

    .line 21
    :cond_2
    const-string v7, "video_data"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    if-eqz v6, :cond_7

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-nez v7, :cond_3

    goto/16 :goto_3

    .line 22
    :cond_3
    invoke-virtual {v6, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    if-nez v6, :cond_4

    goto/16 :goto_3

    .line 23
    :cond_4
    const-string v7, "series_id"

    const-string v8, ""

    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v9, "title"

    invoke-virtual {v6, v9, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    .line 24
    const-string v10, "episode_cnt"

    invoke-virtual {v6, v10, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v10

    .line 25
    const-string v11, "[0-9]{8,24}"

    invoke-virtual {v7, v11}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_7

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_7

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v11

    const/16 v12, 0xc8

    if-gt v11, v12, :cond_7

    if-ltz v10, :cond_7

    const/16 v11, 0x2710

    if-gt v10, v11, :cond_7

    invoke-interface {v3, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_5

    goto :goto_3

    .line 26
    :cond_5
    const-string v11, "video_desc"

    invoke-virtual {v6, v11, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v12

    const/16 v13, 0x7d0

    if-le v12, v13, :cond_6

    invoke-virtual {v11, v2, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    .line 27
    :cond_6
    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12}, Lorg/json/JSONObject;-><init>()V

    const-string v13, "book_id"

    invoke-virtual {v12, v13, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v12, "book_name"

    invoke-virtual {v7, v12, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v9, "chapter_number"

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v7

    .line 28
    const-string v9, "abstract"

    invoke-virtual {v7, v9, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v9, "cover"

    invoke-virtual {v6, v9, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "cover_url"

    invoke-virtual {v6, v9, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcn/hongguo/tv/Catalog;->allowedCover(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v8, "thumb_url"

    invoke-virtual {v7, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v6

    .line 27
    invoke-virtual {v1, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 19
    :cond_7
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_2

    .line 31
    :cond_8
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    const-string v5, "has_more"

    if-nez v3, :cond_a

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p1

    if-gtz p1, :cond_9

    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_9

    goto :goto_4

    :cond_9
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u641c\u7d22\u7ed3\u679c\u683c\u5f0f\u6682\u4e0d\u652f\u6301"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 32
    :cond_a
    :goto_4
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p1

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "search_data"

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {v0, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    .line 17
    :cond_b
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 16
    :cond_c
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u641c\u7d22\u5206\u7c7b\u672a\u8fd4\u56de"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 14
    :cond_d
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 12
    :cond_e
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u641c\u7d22\u670d\u52a1\u6682\u672a\u8fd4\u56de\u7ed3\u679c"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

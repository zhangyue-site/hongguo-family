.class final Lcn/hongguo/tv/MediaTrackPolicy;
.super Ljava/lang/Object;
.source "MediaTrackPolicy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/hongguo/tv/MediaTrackPolicy$Support;
    }
.end annotation


# static fields
.field static final LIMIT:J = 0x2000000L


# direct methods
.method constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static choose(Lorg/json/JSONObject;Lcn/hongguo/tv/MediaTrackPolicy$Support;)Lorg/json/JSONObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 19
    const/16 v0, 0x1e0

    invoke-static {p0, p1, v0}, Lcn/hongguo/tv/MediaTrackPolicy;->choose(Lorg/json/JSONObject;Lcn/hongguo/tv/MediaTrackPolicy$Support;I)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method static choose(Lorg/json/JSONObject;Lcn/hongguo/tv/MediaTrackPolicy$Support;I)Lorg/json/JSONObject;
    .locals 27
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 22
    const/4 v1, 0x0

    if-nez p2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 23
    :goto_0
    const/16 v3, 0x438

    if-eqz v2, :cond_1

    const/16 v4, 0x438

    goto :goto_1

    :cond_1
    move/from16 v4, p2

    .line 24
    :goto_1
    const/16 v5, 0x1e0

    const/16 v6, 0x2d0

    if-eq v4, v5, :cond_3

    if-eq v4, v6, :cond_3

    if-ne v4, v3, :cond_2

    goto :goto_2

    :cond_2
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid quality ceiling"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 25
    :cond_3
    :goto_2
    const-string v7, "video_list"

    move-object/from16 v8, p0

    invoke-virtual {v8, v7}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 26
    instance-of v8, v7, Lorg/json/JSONArray;

    if-eqz v8, :cond_4

    check-cast v7, Lorg/json/JSONArray;

    goto :goto_4

    .line 27
    :cond_4
    instance-of v8, v7, Lorg/json/JSONObject;

    if-eqz v8, :cond_1c

    new-instance v8, Lorg/json/JSONArray;

    invoke-direct {v8}, Lorg/json/JSONArray;-><init>()V

    check-cast v7, Lorg/json/JSONObject;

    invoke-virtual {v7}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v9

    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    invoke-virtual {v8, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_3

    :cond_5
    move-object v7, v8

    .line 29
    :goto_4
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v8

    const/16 v9, 0x20

    if-gt v8, v9, :cond_1b

    .line 30
    nop

    .line 31
    const/4 v8, 0x0

    const-wide v9, 0x7fffffffffffffffL

    const/4 v11, 0x0

    :goto_5
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-ge v11, v12, :cond_19

    .line 32
    invoke-virtual {v7, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v12

    const-string v13, "video_meta"

    invoke-static {v12, v13}, Lcn/hongguo/tv/MediaTrackPolicy;->nested(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    .line 33
    const-string v14, "size"

    move-object/from16 p0, v7

    const-wide/16 v6, 0x0

    move v15, v4

    invoke-virtual {v12, v14, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v3

    invoke-virtual {v13, v14, v3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v3

    cmp-long v14, v3, v6

    if-lez v14, :cond_17

    const-wide/32 v16, 0x2000000

    cmp-long v14, v3, v16

    if-lez v14, :cond_6

    move-object/from16 v24, v8

    move-wide/from16 v25, v9

    move v1, v15

    const/16 v0, 0x438

    const/16 v3, 0x2d0

    goto/16 :goto_9

    .line 34
    :cond_6
    invoke-static {v12}, Lcn/hongguo/tv/MediaTrackPolicy;->codec(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcn/hongguo/tv/MediaTrackPolicy;->mime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    if-nez v14, :cond_7

    move-object/from16 v24, v8

    move-wide/from16 v25, v9

    move v1, v15

    const/16 v0, 0x438

    const/16 v3, 0x2d0

    goto/16 :goto_9

    .line 35
    :cond_7
    const-string v0, "width"

    invoke-virtual {v12, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v6

    const-string v7, "vwidth"

    invoke-virtual {v12, v7, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v6

    invoke-virtual {v13, v0, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {v13, v7, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    .line 36
    const-string v6, "height"

    invoke-virtual {v12, v6, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    const-string v1, "vheight"

    invoke-virtual {v12, v1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    invoke-virtual {v13, v6, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v6

    invoke-virtual {v13, v1, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    .line 37
    const-string v6, "fps"

    move-object/from16 v24, v8

    const-wide/16 v7, 0x0

    move-wide/from16 v25, v9

    invoke-virtual {v12, v6, v7, v8}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v9

    invoke-virtual {v13, v6, v9, v10}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v22

    .line 38
    if-lez v0, :cond_16

    if-lez v1, :cond_16

    cmpg-double v6, v22, v7

    if-ltz v6, :cond_16

    invoke-static/range {v22 .. v23}, Ljava/lang/Double;->isNaN(D)Z

    move-result v6

    if-nez v6, :cond_16

    invoke-static/range {v22 .. v23}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v6

    if-eqz v6, :cond_8

    move v1, v15

    const/16 v0, 0x438

    const/16 v3, 0x2d0

    goto/16 :goto_9

    .line 39
    :cond_8
    move-object/from16 v18, p1

    move-object/from16 v19, v14

    move/from16 v20, v0

    move/from16 v21, v1

    invoke-interface/range {v18 .. v23}, Lcn/hongguo/tv/MediaTrackPolicy$Support;->supports(Ljava/lang/String;IID)Z

    move-result v6

    if-nez v6, :cond_9

    move v1, v15

    const/16 v0, 0x438

    const/16 v3, 0x2d0

    goto/16 :goto_9

    .line 41
    :cond_9
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 42
    move v1, v15

    if-gt v6, v1, :cond_15

    if-ne v1, v5, :cond_a

    const/16 v7, 0x356

    goto :goto_6

    :cond_a
    const/16 v7, 0x2d0

    if-ne v1, v7, :cond_b

    const/16 v7, 0x500

    goto :goto_6

    :cond_b
    const/16 v7, 0x780

    :goto_6
    if-le v0, v7, :cond_c

    const/16 v0, 0x438

    const/16 v3, 0x2d0

    goto/16 :goto_9

    .line 43
    :cond_c
    if-eqz v2, :cond_d

    const/16 v0, 0x2d0

    if-le v6, v0, :cond_d

    const-wide/32 v7, 0x1000000

    cmp-long v0, v3, v7

    if-lez v0, :cond_d

    const/16 v0, 0x438

    const/16 v3, 0x2d0

    goto :goto_9

    .line 44
    :cond_d
    if-lez v6, :cond_11

    const/16 v0, 0x438

    if-lt v6, v0, :cond_e

    const/4 v7, 0x0

    goto :goto_7

    :cond_e
    const/16 v7, 0x2d0

    if-lt v6, v7, :cond_f

    const/4 v7, 0x1

    goto :goto_7

    :cond_f
    if-lt v6, v5, :cond_10

    const/4 v7, 0x2

    goto :goto_7

    :cond_10
    const/4 v7, 0x3

    goto :goto_7

    :cond_11
    const/16 v0, 0x438

    const/4 v7, 0x4

    .line 45
    :goto_7
    int-to-long v7, v7

    mul-long v7, v7, v16

    const-wide/16 v9, 0x2

    mul-long v7, v7, v9

    add-long/2addr v7, v3

    const-string v3, "video/avc"

    invoke-virtual {v14, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    const-wide/16 v16, 0x0

    :cond_12
    add-long v7, v7, v16

    .line 46
    if-eqz v2, :cond_13

    const/16 v3, 0x2d0

    if-le v6, v3, :cond_14

    const-wide/32 v9, 0x14000000

    add-long/2addr v7, v9

    goto :goto_8

    :cond_13
    const/16 v3, 0x2d0

    .line 47
    :cond_14
    :goto_8
    cmp-long v4, v7, v25

    if-gez v4, :cond_18

    move-wide v9, v7

    move-object v8, v12

    goto :goto_a

    .line 42
    :cond_15
    const/16 v0, 0x438

    const/16 v3, 0x2d0

    goto :goto_9

    .line 38
    :cond_16
    move v1, v15

    const/16 v0, 0x438

    const/16 v3, 0x2d0

    goto :goto_9

    .line 33
    :cond_17
    move-object/from16 v24, v8

    move-wide/from16 v25, v9

    move v1, v15

    const/16 v0, 0x438

    const/16 v3, 0x2d0

    .line 31
    :cond_18
    :goto_9
    move-object/from16 v8, v24

    move-wide/from16 v9, v25

    :goto_a
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v7, p0

    move v4, v1

    const/4 v1, 0x0

    const/16 v3, 0x438

    const/16 v6, 0x2d0

    goto/16 :goto_5

    .line 49
    :cond_19
    move-object/from16 v24, v8

    if-eqz v24, :cond_1a

    .line 50
    return-object v24

    .line 49
    :cond_1a
    new-instance v0, Ljava/io/IOException;

    const-string v1, "No supported media track within budget"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 29
    :cond_1b
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Too many media tracks"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 28
    :cond_1c
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid media track list"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static codec(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 3

    .line 12
    const-string v0, "video_meta"

    invoke-static {p0, v0}, Lcn/hongguo/tv/MediaTrackPolicy;->nested(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, ""

    const-string v2, "codec_type"

    invoke-virtual {p0, v2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static mime(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 14
    const-string v0, "h264"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "video/avc"

    if-nez v0, :cond_3

    const-string v0, "avc"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "avc1"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 15
    :cond_0
    const-string v0, "bytevc1"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "video/hevc"

    if-nez v0, :cond_2

    const-string v0, "hevc"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "h265"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "hev1"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "hvc1"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_0

    .line 16
    :cond_1
    const/4 p0, 0x0

    return-object p0

    .line 15
    :cond_2
    :goto_0
    return-object v1

    .line 14
    :cond_3
    :goto_1
    return-object v1
.end method

.method static nested(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 0

    .line 11
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    move-object p0, p1

    :goto_0
    return-object p0
.end method

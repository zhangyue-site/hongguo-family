.class final Lcn/hongguo/tv/DeviceDecoders;
.super Ljava/lang/Object;
.source "DeviceDecoders.java"

# interfaces
.implements Lcn/hongguo/tv/MediaTrackPolicy$Support;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/hongguo/tv/DeviceDecoders$Modern29;
    }
.end annotation


# instance fields
.field private final codecs:[Landroid/media/MediaCodecInfo;


# direct methods
.method constructor <init>()V
    .locals 2

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/media/MediaCodecList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/media/MediaCodecList;-><init>(I)V

    invoke-virtual {v0}, Landroid/media/MediaCodecList;->getCodecInfos()[Landroid/media/MediaCodecInfo;

    move-result-object v0

    iput-object v0, p0, Lcn/hongguo/tv/DeviceDecoders;->codecs:[Landroid/media/MediaCodecInfo;

    return-void
.end method

.method private static hardware(Landroid/media/MediaCodecInfo;)Z
    .locals 2

    .line 22
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    invoke-static {p0}, Lcn/hongguo/tv/DeviceDecoders$Modern29;->hardware(Landroid/media/MediaCodecInfo;)Z

    move-result p0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcn/hongguo/tv/DeviceDecoders;->legacyHardware(Ljava/lang/String;)Z

    move-result p0

    :goto_0
    return p0
.end method

.method static legacyHardware(Ljava/lang/String;)Z
    .locals 2

    .line 15
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 16
    const-string v1, "omx."

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "c2."

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 17
    :cond_1
    const-string v1, "omx.google."

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "c2.android."

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 18
    const-string v1, "omx.ffmpeg."

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "c2.ffmpeg."

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 19
    const-string v1, ".sw."

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, ".sw"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "software"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    nop

    .line 16
    :goto_0
    return v0
.end method


# virtual methods
.method public supports(Ljava/lang/String;IID)Z
    .locals 18

    .line 28
    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move-wide/from16 v4, p4

    if-lez v2, :cond_c

    if-lez v3, :cond_c

    const-wide/16 v7, 0x0

    cmpg-double v0, v4, v7

    if-ltz v0, :cond_c

    invoke-static/range {p4 .. p5}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-static/range {p4 .. p5}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-eqz v0, :cond_0

    move-object/from16 v11, p0

    const/4 v1, 0x0

    goto/16 :goto_9

    .line 29
    :cond_0
    invoke-static/range {p2 .. p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/16 v9, 0x1e0

    if-gt v0, v9, :cond_2

    const-string v0, "video/hevc"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v9, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v9, 0x1

    .line 30
    :goto_1
    move-object/from16 v11, p0

    iget-object v12, v11, Lcn/hongguo/tv/DeviceDecoders;->codecs:[Landroid/media/MediaCodecInfo;

    array-length v13, v12

    const/4 v14, 0x0

    :goto_2
    if-ge v14, v13, :cond_b

    aget-object v15, v12, v14

    .line 31
    invoke-virtual {v15}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v0

    if-nez v0, :cond_a

    if-eqz v9, :cond_3

    invoke-static {v15}, Lcn/hongguo/tv/DeviceDecoders;->hardware(Landroid/media/MediaCodecInfo;)Z

    move-result v0

    if-nez v0, :cond_3

    move-wide/from16 v16, v7

    const/4 v8, 0x1

    goto/16 :goto_8

    .line 32
    :cond_3
    invoke-virtual {v15}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v6

    array-length v10, v6

    const/4 v7, 0x0

    :goto_3
    if-ge v7, v10, :cond_9

    aget-object v0, v6, v7

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 33
    :try_start_0
    invoke-virtual {v15, v0}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v0

    .line 34
    const-string v8, "secure-playback"

    invoke-virtual {v0, v8}, Landroid/media/MediaCodecInfo$CodecCapabilities;->isFeatureRequired(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_7

    const-string v8, "tunneled-playback"

    invoke-virtual {v0, v8}, Landroid/media/MediaCodecInfo$CodecCapabilities;->isFeatureRequired(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    const/4 v8, 0x1

    const-wide/16 v16, 0x0

    goto :goto_7

    .line 35
    :cond_4
    invoke-virtual {v0}, Landroid/media/MediaCodecInfo$CodecCapabilities;->getVideoCapabilities()Landroid/media/MediaCodecInfo$VideoCapabilities;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2

    .line 36
    if-lez v2, :cond_6

    if-lez v3, :cond_6

    if-eqz v0, :cond_6

    .line 37
    const-wide/16 v16, 0x0

    cmpl-double v8, v4, v16

    if-lez v8, :cond_5

    :try_start_1
    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/media/MediaCodecInfo$VideoCapabilities;->areSizeAndRateSupported(IID)Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_4

    :cond_5
    invoke-virtual {v0, v2, v3}, Landroid/media/MediaCodecInfo$VideoCapabilities;->isSizeSupported(II)Z

    move-result v0
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    if-nez v0, :cond_6

    :goto_4
    const/4 v8, 0x1

    goto :goto_7

    .line 40
    :catch_0
    move-exception v0

    goto :goto_5

    :catch_1
    move-exception v0

    :goto_5
    const/4 v8, 0x1

    goto :goto_7

    .line 39
    :cond_6
    const/4 v8, 0x1

    return v8

    .line 34
    :cond_7
    const/4 v8, 0x1

    const-wide/16 v16, 0x0

    goto :goto_7

    .line 40
    :catch_2
    move-exception v0

    goto :goto_6

    :catch_3
    move-exception v0

    :goto_6
    const/4 v8, 0x1

    const-wide/16 v16, 0x0

    goto :goto_7

    .line 32
    :cond_8
    const/4 v8, 0x1

    const-wide/16 v16, 0x0

    :goto_7
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    :cond_9
    const/4 v8, 0x1

    const-wide/16 v16, 0x0

    goto :goto_8

    .line 31
    :cond_a
    move-wide/from16 v16, v7

    const/4 v8, 0x1

    .line 30
    :goto_8
    add-int/lit8 v14, v14, 0x1

    move-wide/from16 v7, v16

    goto/16 :goto_2

    .line 42
    :cond_b
    const/4 v1, 0x0

    return v1

    .line 28
    :cond_c
    move-object/from16 v11, p0

    const/4 v1, 0x0

    :goto_9
    return v1
.end method

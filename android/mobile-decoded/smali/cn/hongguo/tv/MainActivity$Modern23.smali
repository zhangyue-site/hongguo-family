.class final Lcn/hongguo/tv/MainActivity$Modern23;
.super Ljava/lang/Object;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/hongguo/tv/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Modern23"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 348
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static currentSpeed(Landroid/media/MediaPlayer;)F
    .locals 0

    .line 349
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getPlaybackParams()Landroid/media/PlaybackParams;

    move-result-object p0

    invoke-virtual {p0}, Landroid/media/PlaybackParams;->getSpeed()F

    move-result p0

    return p0
.end method

.method static speed(Landroid/media/MediaPlayer;F)V
    .locals 4

    .line 351
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getPlaybackParams()Landroid/media/PlaybackParams;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/PlaybackParams;->allowDefaults()Landroid/media/PlaybackParams;

    move-result-object v0

    .line 352
    invoke-virtual {v0}, Landroid/media/PlaybackParams;->getSpeed()F

    move-result v1

    sub-float/2addr v1, p1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const v2, 0x3a83126f    # 0.001f

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    return-void

    .line 353
    :cond_0
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v1

    .line 357
    if-eqz v1, :cond_1

    :try_start_0
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->pause()V

    .line 358
    :cond_1
    new-instance v2, Landroid/media/PlaybackParams;

    invoke-direct {v2}, Landroid/media/PlaybackParams;-><init>()V

    invoke-virtual {v2}, Landroid/media/PlaybackParams;->allowDefaults()Landroid/media/PlaybackParams;

    move-result-object v2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3}, Landroid/media/PlaybackParams;->setPitch(F)Landroid/media/PlaybackParams;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/media/PlaybackParams;->setAudioFallbackMode(I)Landroid/media/PlaybackParams;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/media/PlaybackParams;->setSpeed(F)Landroid/media/PlaybackParams;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/media/MediaPlayer;->setPlaybackParams(Landroid/media/PlaybackParams;)V

    .line 359
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getPlaybackParams()Landroid/media/PlaybackParams;

    move-result-object v2

    invoke-virtual {v2}, Landroid/media/PlaybackParams;->getSpeed()F

    move-result v2

    sub-float/2addr v2, p1

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result p1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const v2, 0x3c23d70a    # 0.01f

    cmpl-float p1, p1, v2

    if-gtz p1, :cond_4

    .line 365
    if-eqz v1, :cond_2

    invoke-virtual {p0}, Landroid/media/MediaPlayer;->start()V

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Landroid/media/MediaPlayer;->pause()V

    .line 367
    :cond_3
    :goto_0
    return-void

    .line 359
    :cond_4
    :try_start_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Playback speed rejected"

    invoke-direct {p1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 365
    :catchall_0
    move-exception p1

    goto :goto_2

    .line 360
    :catch_0
    move-exception p1

    .line 361
    :try_start_2
    invoke-virtual {p0, v0}, Landroid/media/MediaPlayer;->setPlaybackParams(Landroid/media/PlaybackParams;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catch_1
    move-exception v0

    .line 362
    :goto_1
    :try_start_3
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 365
    :goto_2
    if-nez v1, :cond_5

    invoke-virtual {p0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Landroid/media/MediaPlayer;->pause()V

    goto :goto_3

    :cond_5
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->start()V

    .line 366
    :cond_6
    :goto_3
    throw p1
.end method

.class final Lcn/hongguo/tv/DeviceDecoders$Modern29;
.super Ljava/lang/Object;
.source "DeviceDecoders.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/hongguo/tv/DeviceDecoders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Modern29"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static hardware(Landroid/media/MediaCodecInfo;)Z
    .locals 1

    .line 25
    invoke-virtual {p0}, Landroid/media/MediaCodecInfo;->isHardwareAccelerated()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/media/MediaCodecInfo;->isSoftwareOnly()Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

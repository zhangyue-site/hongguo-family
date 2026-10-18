.class final Lcn/hongguo/tv/PlaybackQuality;
.super Ljava/lang/Object;
.source "PlaybackQuality.java"


# static fields
.field static final LABELS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 5
    const-string v0, "\u9ad8\u6e05\uff08\u6700\u9ad8720p\uff09"

    const-string v1, "\u8d85\u6e05\uff08\u6700\u9ad81080p\uff09"

    const-string v2, "\u81ea\u52a8\uff08\u517c\u987e\u753b\u8d28\u4e0e\u6027\u80fd\uff09"

    const-string v3, "\u7701\u6d41\uff08\u6700\u9ad8480p\uff09"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcn/hongguo/tv/PlaybackQuality;->LABELS:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static ceiling(IZ)I
    .locals 3

    .line 8
    const/16 v0, 0x1e0

    if-eqz p1, :cond_0

    const/16 p1, 0x1e0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const/16 v1, 0x2d0

    const/16 v2, 0x438

    filled-new-array {p1, v0, v1, v2}, [I

    move-result-object p1

    invoke-static {p0}, Lcn/hongguo/tv/PlaybackQuality;->index(I)I

    move-result p0

    aget p0, p1, p0

    return p0
.end method

.method static index(I)I
    .locals 1

    .line 6
    if-ltz p0, :cond_0

    sget-object v0, Lcn/hongguo/tv/PlaybackQuality;->LABELS:[Ljava/lang/String;

    array-length v0, v0

    if-ge p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

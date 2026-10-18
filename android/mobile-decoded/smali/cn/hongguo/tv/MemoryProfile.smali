.class final Lcn/hongguo/tv/MemoryProfile;
.super Ljava/lang/Object;
.source "MemoryProfile.java"


# instance fields
.field final cacheBytes:I

.field final coverWorkers:I

.field final encodedBytes:I

.field final height:I

.field final lowRam:Z

.field final width:I


# direct methods
.method constructor <init>(IZ)V
    .locals 5

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const/4 v0, 0x1

    if-nez p2, :cond_1

    const/16 p2, 0x80

    if-gt p1, p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p2, 0x1

    :goto_1
    iput-boolean p2, p0, Lcn/hongguo/tv/MemoryProfile;->lowRam:Z

    .line 9
    iget-boolean p2, p0, Lcn/hongguo/tv/MemoryProfile;->lowRam:Z

    if-eqz p2, :cond_2

    const/16 p2, 0xc0

    goto :goto_2

    :cond_2
    const/16 p2, 0x140

    :goto_2
    iput p2, p0, Lcn/hongguo/tv/MemoryProfile;->width:I

    .line 10
    iget-boolean p2, p0, Lcn/hongguo/tv/MemoryProfile;->lowRam:Z

    if-eqz p2, :cond_3

    const/16 p2, 0x120

    goto :goto_3

    :cond_3
    const/16 p2, 0x1e0

    :goto_3
    iput p2, p0, Lcn/hongguo/tv/MemoryProfile;->height:I

    .line 11
    iget-boolean p2, p0, Lcn/hongguo/tv/MemoryProfile;->lowRam:Z

    if-eqz p2, :cond_4

    const-wide/32 v1, 0x200000

    goto :goto_4

    :cond_4
    const-wide/32 v1, 0x600000

    :goto_4
    const-wide/16 v3, 0x10

    int-to-long p1, p1

    invoke-static {v3, v4, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    const-wide/16 v3, 0x400

    mul-long p1, p1, v3

    mul-long p1, p1, v3

    const-wide/16 v3, 0x18

    div-long/2addr p1, v3

    invoke-static {v1, v2, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    long-to-int p2, p1

    const/high16 p1, 0x40000

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcn/hongguo/tv/MemoryProfile;->cacheBytes:I

    .line 12
    iget-boolean p1, p0, Lcn/hongguo/tv/MemoryProfile;->lowRam:Z

    if-eqz p1, :cond_5

    const/high16 p1, 0x180000

    goto :goto_5

    :cond_5
    const/high16 p1, 0x300000

    :goto_5
    iput p1, p0, Lcn/hongguo/tv/MemoryProfile;->encodedBytes:I

    .line 13
    iget-boolean p1, p0, Lcn/hongguo/tv/MemoryProfile;->lowRam:Z

    if-eqz p1, :cond_6

    goto :goto_6

    :cond_6
    const/4 v0, 0x2

    :goto_6
    iput v0, p0, Lcn/hongguo/tv/MemoryProfile;->coverWorkers:I

    .line 14
    return-void
.end method

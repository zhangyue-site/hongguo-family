.class public final Lcn/hongguo/tv/FocusGraph;
.super Ljava/lang/Object;
.source "FocusGraph.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static move(IIII)I
    .locals 0

    .line 5
    if-gtz p1, :cond_0

    const/4 p0, -0x1

    return p0

    .line 6
    :cond_0
    if-ltz p0, :cond_3

    if-ge p0, p1, :cond_3

    if-lez p2, :cond_3

    .line 7
    nop

    .line 8
    packed-switch p3, :pswitch_data_0

    .line 12
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0

    .line 11
    :pswitch_0
    add-int p3, p0, p2

    if-ge p3, p1, :cond_1

    move p0, p3

    goto :goto_0

    :cond_1
    div-int p3, p0, p2

    add-int/lit8 p1, p1, -0x1

    div-int p2, p1, p2

    if-ge p3, p2, :cond_2

    move p0, p1

    goto :goto_0

    .line 10
    :pswitch_1
    if-lt p0, p2, :cond_2

    sub-int/2addr p0, p2

    goto :goto_0

    .line 9
    :pswitch_2
    rem-int p3, p0, p2

    add-int/lit8 p2, p2, -0x1

    if-ge p3, p2, :cond_2

    add-int/lit8 p2, p0, 0x1

    if-ge p2, p1, :cond_2

    move p0, p2

    goto :goto_0

    .line 8
    :pswitch_3
    rem-int p1, p0, p2

    if-lez p1, :cond_2

    add-int/lit8 p0, p0, -0x1

    .line 13
    :cond_2
    :goto_0
    return p0

    .line 6
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static resume(JJ)J
    .locals 4

    .line 15
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-lez v2, :cond_0

    const-wide/16 v2, 0x5dc

    sub-long/2addr p2, v2

    cmp-long v2, p0, p2

    if-ltz v2, :cond_0

    move-wide p0, v0

    :cond_0
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    return-wide p0
.end method

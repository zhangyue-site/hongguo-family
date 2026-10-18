.class public final synthetic Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda13;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/HomeFeed;

.field public final synthetic f$1:I

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/HomeFeed;II)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda13;->f$0:Lcn/hongguo/tv/HomeFeed;

    iput p2, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda13;->f$1:I

    iput p3, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda13;->f$2:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda13;->f$0:Lcn/hongguo/tv/HomeFeed;

    iget v1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda13;->f$1:I

    iget v2, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda13;->f$2:I

    invoke-virtual {v0, v1, v2}, Lcn/hongguo/tv/HomeFeed;->lambda$load$11$cn-hongguo-tv-HomeFeed(II)V

    return-void
.end method

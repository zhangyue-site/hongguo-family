.class public final synthetic Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda15;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/TvUpdater;

.field public final synthetic f$1:I

.field public final synthetic f$2:Lcn/hongguo/tv/UpdateRelease;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/TvUpdater;ILcn/hongguo/tv/UpdateRelease;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda15;->f$0:Lcn/hongguo/tv/TvUpdater;

    iput p2, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda15;->f$1:I

    iput-object p3, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda15;->f$2:Lcn/hongguo/tv/UpdateRelease;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda15;->f$0:Lcn/hongguo/tv/TvUpdater;

    iget v1, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda15;->f$1:I

    iget-object v2, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda15;->f$2:Lcn/hongguo/tv/UpdateRelease;

    invoke-virtual {v0, v1, v2}, Lcn/hongguo/tv/TvUpdater;->lambda$download$15$cn-hongguo-tv-TvUpdater(ILcn/hongguo/tv/UpdateRelease;)V

    return-void
.end method

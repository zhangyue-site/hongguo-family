.class public final synthetic Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda17;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/TvUpdater;

.field public final synthetic f$1:Lcn/hongguo/tv/UpdateClient;

.field public final synthetic f$2:I

.field public final synthetic f$3:Z


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/TvUpdater;Lcn/hongguo/tv/UpdateClient;IZ)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda17;->f$0:Lcn/hongguo/tv/TvUpdater;

    iput-object p2, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda17;->f$1:Lcn/hongguo/tv/UpdateClient;

    iput p3, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda17;->f$2:I

    iput-boolean p4, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda17;->f$3:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda17;->f$0:Lcn/hongguo/tv/TvUpdater;

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda17;->f$1:Lcn/hongguo/tv/UpdateClient;

    iget v2, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda17;->f$2:I

    iget-boolean v3, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda17;->f$3:Z

    invoke-virtual {v0, v1, v2, v3}, Lcn/hongguo/tv/TvUpdater;->lambda$check$4$cn-hongguo-tv-TvUpdater(Lcn/hongguo/tv/UpdateClient;IZ)V

    return-void
.end method

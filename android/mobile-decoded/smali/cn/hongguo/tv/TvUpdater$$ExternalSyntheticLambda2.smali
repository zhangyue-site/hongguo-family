.class public final synthetic Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/TvUpdater;

.field public final synthetic f$1:Lcn/hongguo/tv/UpdateRelease;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/TvUpdater;Lcn/hongguo/tv/UpdateRelease;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda2;->f$0:Lcn/hongguo/tv/TvUpdater;

    iput-object p2, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda2;->f$1:Lcn/hongguo/tv/UpdateRelease;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda2;->f$0:Lcn/hongguo/tv/TvUpdater;

    iget-object v1, p0, Lcn/hongguo/tv/TvUpdater$$ExternalSyntheticLambda2;->f$1:Lcn/hongguo/tv/UpdateRelease;

    invoke-virtual {v0, v1, p1, p2}, Lcn/hongguo/tv/TvUpdater;->lambda$maybeRemind$6$cn-hongguo-tv-TvUpdater(Lcn/hongguo/tv/UpdateRelease;Landroid/content/DialogInterface;I)V

    return-void
.end method

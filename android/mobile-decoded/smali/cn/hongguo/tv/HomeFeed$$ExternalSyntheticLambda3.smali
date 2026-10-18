.class public final synthetic Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/HomeFeed;

.field public final synthetic f$1:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/HomeFeed;Landroid/view/View;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda3;->f$0:Lcn/hongguo/tv/HomeFeed;

    iput-object p2, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda3;->f$1:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda3;->f$0:Lcn/hongguo/tv/HomeFeed;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda3;->f$1:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/HomeFeed;->lambda$render$15$cn-hongguo-tv-HomeFeed(Landroid/view/View;)V

    return-void
.end method

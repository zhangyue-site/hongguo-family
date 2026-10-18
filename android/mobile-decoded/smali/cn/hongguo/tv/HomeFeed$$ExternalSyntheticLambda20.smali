.class public final synthetic Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda20;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/HomeFeed;

.field public final synthetic f$1:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/HomeFeed;Lorg/json/JSONObject;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda20;->f$0:Lcn/hongguo/tv/HomeFeed;

    iput-object p2, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda20;->f$1:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda20;->f$0:Lcn/hongguo/tv/HomeFeed;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda20;->f$1:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, p1}, Lcn/hongguo/tv/HomeFeed;->lambda$bind$16$cn-hongguo-tv-HomeFeed(Lorg/json/JSONObject;Landroid/view/View;)V

    return-void
.end method

.class public final synthetic Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda18;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/HomeFeed;

.field public final synthetic f$1:I

.field public final synthetic f$2:Lorg/json/JSONObject;

.field public final synthetic f$3:Lorg/json/JSONArray;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/HomeFeed;ILorg/json/JSONObject;Lorg/json/JSONArray;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda18;->f$0:Lcn/hongguo/tv/HomeFeed;

    iput p2, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda18;->f$1:I

    iput-object p3, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda18;->f$2:Lorg/json/JSONObject;

    iput-object p4, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda18;->f$3:Lorg/json/JSONArray;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda18;->f$0:Lcn/hongguo/tv/HomeFeed;

    iget v1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda18;->f$1:I

    iget-object v2, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda18;->f$2:Lorg/json/JSONObject;

    iget-object v3, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda18;->f$3:Lorg/json/JSONArray;

    invoke-virtual {v0, v1, v2, v3}, Lcn/hongguo/tv/HomeFeed;->lambda$open$21$cn-hongguo-tv-HomeFeed(ILorg/json/JSONObject;Lorg/json/JSONArray;)V

    return-void
.end method

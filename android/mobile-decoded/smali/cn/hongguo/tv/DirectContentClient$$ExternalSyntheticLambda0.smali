.class public final synthetic Lcn/hongguo/tv/DirectContentClient$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcn/hongguo/tv/ReadRetry$Operation;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/DirectContentClient;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/DirectContentClient;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/DirectContentClient$$ExternalSyntheticLambda0;->f$0:Lcn/hongguo/tv/DirectContentClient;

    iput-object p2, p0, Lcn/hongguo/tv/DirectContentClient$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lcn/hongguo/tv/DirectContentClient$$ExternalSyntheticLambda0;->f$2:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 3

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/DirectContentClient$$ExternalSyntheticLambda0;->f$0:Lcn/hongguo/tv/DirectContentClient;

    iget-object v1, p0, Lcn/hongguo/tv/DirectContentClient$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lcn/hongguo/tv/DirectContentClient$$ExternalSyntheticLambda0;->f$2:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lcn/hongguo/tv/DirectContentClient;->lambda$post$0$cn-hongguo-tv-DirectContentClient(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

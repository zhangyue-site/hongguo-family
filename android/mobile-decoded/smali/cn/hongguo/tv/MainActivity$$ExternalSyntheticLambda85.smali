.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda85;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcn/hongguo/tv/MainActivity$Done;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;

.field public final synthetic f$1:Lcn/hongguo/tv/Api;

.field public final synthetic f$2:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;Lcn/hongguo/tv/Api;Landroid/widget/TextView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda85;->f$0:Lcn/hongguo/tv/MainActivity;

    iput-object p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda85;->f$1:Lcn/hongguo/tv/Api;

    iput-object p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda85;->f$2:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final run(Lorg/json/JSONObject;)V
    .locals 3

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda85;->f$0:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda85;->f$1:Lcn/hongguo/tv/Api;

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda85;->f$2:Landroid/widget/TextView;

    invoke-virtual {v0, v1, v2, p1}, Lcn/hongguo/tv/MainActivity;->lambda$settings$57$cn-hongguo-tv-MainActivity(Lcn/hongguo/tv/Api;Landroid/widget/TextView;Lorg/json/JSONObject;)V

    return-void
.end method

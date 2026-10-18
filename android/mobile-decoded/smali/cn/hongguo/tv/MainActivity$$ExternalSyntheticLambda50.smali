.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda50;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;

.field public final synthetic f$1:Z

.field public final synthetic f$2:I

.field public final synthetic f$3:Lorg/json/JSONObject;

.field public final synthetic f$4:Lorg/json/JSONArray;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;ZILorg/json/JSONObject;Lorg/json/JSONArray;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda50;->f$0:Lcn/hongguo/tv/MainActivity;

    iput-boolean p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda50;->f$1:Z

    iput p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda50;->f$2:I

    iput-object p4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda50;->f$3:Lorg/json/JSONObject;

    iput-object p5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda50;->f$4:Lorg/json/JSONArray;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda50;->f$0:Lcn/hongguo/tv/MainActivity;

    iget-boolean v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda50;->f$1:Z

    iget v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda50;->f$2:I

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda50;->f$3:Lorg/json/JSONObject;

    iget-object v4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda50;->f$4:Lorg/json/JSONArray;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcn/hongguo/tv/MainActivity;->lambda$renderEpisodePage$55$cn-hongguo-tv-MainActivity(ZILorg/json/JSONObject;Lorg/json/JSONArray;)V

    return-void
.end method

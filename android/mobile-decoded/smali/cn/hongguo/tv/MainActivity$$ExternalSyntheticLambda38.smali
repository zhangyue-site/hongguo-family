.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;

.field public final synthetic f$1:I

.field public final synthetic f$2:Z

.field public final synthetic f$3:Lorg/json/JSONObject;

.field public final synthetic f$4:Z

.field public final synthetic f$5:Ljava/lang/String;

.field public final synthetic f$6:Lorg/json/JSONObject;

.field public final synthetic f$7:Lorg/json/JSONArray;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;IZLorg/json/JSONObject;ZLjava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONArray;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;->f$0:Lcn/hongguo/tv/MainActivity;

    iput p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;->f$1:I

    iput-boolean p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;->f$2:Z

    iput-object p4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;->f$3:Lorg/json/JSONObject;

    iput-boolean p5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;->f$4:Z

    iput-object p6, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;->f$5:Ljava/lang/String;

    iput-object p7, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;->f$6:Lorg/json/JSONObject;

    iput-object p8, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;->f$7:Lorg/json/JSONArray;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;->f$0:Lcn/hongguo/tv/MainActivity;

    iget v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;->f$1:I

    iget-boolean v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;->f$2:Z

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;->f$3:Lorg/json/JSONObject;

    iget-boolean v4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;->f$4:Z

    iget-object v5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;->f$5:Ljava/lang/String;

    iget-object v6, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;->f$6:Lorg/json/JSONObject;

    iget-object v7, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda38;->f$7:Lorg/json/JSONArray;

    invoke-virtual/range {v0 .. v7}, Lcn/hongguo/tv/MainActivity;->lambda$recommendNext$69$cn-hongguo-tv-MainActivity(IZLorg/json/JSONObject;ZLjava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONArray;)V

    return-void
.end method

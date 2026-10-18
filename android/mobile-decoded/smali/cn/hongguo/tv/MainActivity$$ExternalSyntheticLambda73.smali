.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$10:Lorg/json/JSONObject;

.field public final synthetic f$2:I

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Lcn/hongguo/tv/Recommendations;

.field public final synthetic f$5:Ljava/lang/String;

.field public final synthetic f$6:J

.field public final synthetic f$7:Ljava/lang/String;

.field public final synthetic f$8:Lcn/hongguo/tv/Api;

.field public final synthetic f$9:Z


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;Ljava/lang/String;ILjava/lang/String;Lcn/hongguo/tv/Recommendations;Ljava/lang/String;JLjava/lang/String;Lcn/hongguo/tv/Api;ZLorg/json/JSONObject;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$0:Lcn/hongguo/tv/MainActivity;

    iput-object p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$1:Ljava/lang/String;

    iput p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$2:I

    iput-object p4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$3:Ljava/lang/String;

    iput-object p5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$4:Lcn/hongguo/tv/Recommendations;

    iput-object p6, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$5:Ljava/lang/String;

    iput-wide p7, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$6:J

    iput-object p9, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$7:Ljava/lang/String;

    iput-object p10, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$8:Lcn/hongguo/tv/Api;

    iput-boolean p11, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$9:Z

    iput-object p12, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$10:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 12

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$0:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$1:Ljava/lang/String;

    iget v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$2:I

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$3:Ljava/lang/String;

    iget-object v4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$4:Lcn/hongguo/tv/Recommendations;

    iget-object v5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$5:Ljava/lang/String;

    iget-wide v6, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$6:J

    iget-object v8, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$7:Ljava/lang/String;

    iget-object v9, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$8:Lcn/hongguo/tv/Api;

    iget-boolean v10, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$9:Z

    iget-object v11, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda73;->f$10:Lorg/json/JSONObject;

    invoke-virtual/range {v0 .. v11}, Lcn/hongguo/tv/MainActivity;->lambda$recommendNext$71$cn-hongguo-tv-MainActivity(Ljava/lang/String;ILjava/lang/String;Lcn/hongguo/tv/Recommendations;Ljava/lang/String;JLjava/lang/String;Lcn/hongguo/tv/Api;ZLorg/json/JSONObject;)V

    return-void
.end method

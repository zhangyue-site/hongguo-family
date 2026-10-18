.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda49;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;

.field public final synthetic f$1:Landroid/widget/LinearLayout;

.field public final synthetic f$2:Lorg/json/JSONObject;

.field public final synthetic f$3:Lorg/json/JSONArray;

.field public final synthetic f$4:I

.field public final synthetic f$5:I

.field public final synthetic f$6:Z


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;Landroid/widget/LinearLayout;Lorg/json/JSONObject;Lorg/json/JSONArray;IIZ)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda49;->f$0:Lcn/hongguo/tv/MainActivity;

    iput-object p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda49;->f$1:Landroid/widget/LinearLayout;

    iput-object p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda49;->f$2:Lorg/json/JSONObject;

    iput-object p4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda49;->f$3:Lorg/json/JSONArray;

    iput p5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda49;->f$4:I

    iput p6, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda49;->f$5:I

    iput-boolean p7, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda49;->f$6:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda49;->f$0:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda49;->f$1:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda49;->f$2:Lorg/json/JSONObject;

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda49;->f$3:Lorg/json/JSONArray;

    iget v4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda49;->f$4:I

    iget v5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda49;->f$5:I

    iget-boolean v6, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda49;->f$6:Z

    invoke-virtual/range {v0 .. v6}, Lcn/hongguo/tv/MainActivity;->lambda$renderEpisodePage$54$cn-hongguo-tv-MainActivity(Landroid/widget/LinearLayout;Lorg/json/JSONObject;Lorg/json/JSONArray;IIZ)V

    return-void
.end method

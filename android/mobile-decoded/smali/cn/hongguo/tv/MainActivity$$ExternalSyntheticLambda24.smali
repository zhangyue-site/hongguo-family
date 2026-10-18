.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda24;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcn/hongguo/tv/MainActivity$Done;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;

.field public final synthetic f$1:Lorg/json/JSONObject;

.field public final synthetic f$2:Landroid/widget/TextView;

.field public final synthetic f$3:Landroid/widget/LinearLayout;

.field public final synthetic f$4:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;Lorg/json/JSONObject;Landroid/widget/TextView;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda24;->f$0:Lcn/hongguo/tv/MainActivity;

    iput-object p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda24;->f$1:Lorg/json/JSONObject;

    iput-object p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda24;->f$2:Landroid/widget/TextView;

    iput-object p4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda24;->f$3:Landroid/widget/LinearLayout;

    iput-object p5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda24;->f$4:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final run(Lorg/json/JSONObject;)V
    .locals 6

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda24;->f$0:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda24;->f$1:Lorg/json/JSONObject;

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda24;->f$2:Landroid/widget/TextView;

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda24;->f$3:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda24;->f$4:Landroid/widget/LinearLayout;

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lcn/hongguo/tv/MainActivity;->lambda$detail$52$cn-hongguo-tv-MainActivity(Lorg/json/JSONObject;Landroid/widget/TextView;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Lorg/json/JSONObject;)V

    return-void
.end method

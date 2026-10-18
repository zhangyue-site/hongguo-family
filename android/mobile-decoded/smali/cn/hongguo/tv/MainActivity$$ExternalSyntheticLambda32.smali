.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda32;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;

.field public final synthetic f$1:Landroid/widget/LinearLayout;

.field public final synthetic f$2:Lorg/json/JSONArray;

.field public final synthetic f$3:Landroid/view/View;

.field public final synthetic f$4:I


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;Landroid/widget/LinearLayout;Lorg/json/JSONArray;Landroid/view/View;I)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda32;->f$0:Lcn/hongguo/tv/MainActivity;

    iput-object p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda32;->f$1:Landroid/widget/LinearLayout;

    iput-object p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda32;->f$2:Lorg/json/JSONArray;

    iput-object p4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda32;->f$3:Landroid/view/View;

    iput p5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda32;->f$4:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda32;->f$0:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda32;->f$1:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda32;->f$2:Lorg/json/JSONArray;

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda32;->f$3:Landroid/view/View;

    iget v4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda32;->f$4:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lcn/hongguo/tv/MainActivity;->lambda$renderCards$33$cn-hongguo-tv-MainActivity(Landroid/widget/LinearLayout;Lorg/json/JSONArray;Landroid/view/View;I)V

    return-void
.end method

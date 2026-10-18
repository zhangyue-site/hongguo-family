.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda93;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;

.field public final synthetic f$1:I

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Lcn/hongguo/tv/Api;

.field public final synthetic f$4:Landroid/widget/ImageView;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;ILjava/lang/String;Lcn/hongguo/tv/Api;Landroid/widget/ImageView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda93;->f$0:Lcn/hongguo/tv/MainActivity;

    iput p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda93;->f$1:I

    iput-object p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda93;->f$2:Ljava/lang/String;

    iput-object p4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda93;->f$3:Lcn/hongguo/tv/Api;

    iput-object p5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda93;->f$4:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda93;->f$0:Lcn/hongguo/tv/MainActivity;

    iget v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda93;->f$1:I

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda93;->f$2:Ljava/lang/String;

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda93;->f$3:Lcn/hongguo/tv/Api;

    iget-object v4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda93;->f$4:Landroid/widget/ImageView;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcn/hongguo/tv/MainActivity;->lambda$loadCover$39$cn-hongguo-tv-MainActivity(ILjava/lang/String;Lcn/hongguo/tv/Api;Landroid/widget/ImageView;)V

    return-void
.end method

.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda90;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;

.field public final synthetic f$1:Landroid/graphics/Bitmap;

.field public final synthetic f$2:I

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Landroid/widget/ImageView;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;Landroid/graphics/Bitmap;ILjava/lang/String;Landroid/widget/ImageView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda90;->f$0:Lcn/hongguo/tv/MainActivity;

    iput-object p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda90;->f$1:Landroid/graphics/Bitmap;

    iput p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda90;->f$2:I

    iput-object p4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda90;->f$3:Ljava/lang/String;

    iput-object p5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda90;->f$4:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda90;->f$0:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda90;->f$1:Landroid/graphics/Bitmap;

    iget v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda90;->f$2:I

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda90;->f$3:Ljava/lang/String;

    iget-object v4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda90;->f$4:Landroid/widget/ImageView;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcn/hongguo/tv/MainActivity;->lambda$loadCover$38$cn-hongguo-tv-MainActivity(Landroid/graphics/Bitmap;ILjava/lang/String;Landroid/widget/ImageView;)V

    return-void
.end method

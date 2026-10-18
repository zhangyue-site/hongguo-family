.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda92;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;

.field public final synthetic f$1:I

.field public final synthetic f$2:Lcn/hongguo/tv/Api;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Lcn/hongguo/tv/MainActivity$Done;

.field public final synthetic f$5:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;ILcn/hongguo/tv/Api;Ljava/lang/String;Lcn/hongguo/tv/MainActivity$Done;Landroid/widget/TextView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda92;->f$0:Lcn/hongguo/tv/MainActivity;

    iput p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda92;->f$1:I

    iput-object p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda92;->f$2:Lcn/hongguo/tv/Api;

    iput-object p4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda92;->f$3:Ljava/lang/String;

    iput-object p5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda92;->f$4:Lcn/hongguo/tv/MainActivity$Done;

    iput-object p6, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda92;->f$5:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda92;->f$0:Lcn/hongguo/tv/MainActivity;

    iget v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda92;->f$1:I

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda92;->f$2:Lcn/hongguo/tv/Api;

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda92;->f$3:Ljava/lang/String;

    iget-object v4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda92;->f$4:Lcn/hongguo/tv/MainActivity$Done;

    iget-object v5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda92;->f$5:Landroid/widget/TextView;

    invoke-virtual/range {v0 .. v5}, Lcn/hongguo/tv/MainActivity;->lambda$request$12$cn-hongguo-tv-MainActivity(ILcn/hongguo/tv/Api;Ljava/lang/String;Lcn/hongguo/tv/MainActivity$Done;Landroid/widget/TextView;)V

    return-void
.end method

.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda76;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;

.field public final synthetic f$1:I

.field public final synthetic f$2:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;ILandroid/widget/TextView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda76;->f$0:Lcn/hongguo/tv/MainActivity;

    iput p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda76;->f$1:I

    iput-object p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda76;->f$2:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda76;->f$0:Lcn/hongguo/tv/MainActivity;

    iget v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda76;->f$1:I

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda76;->f$2:Landroid/widget/TextView;

    invoke-virtual {v0, v1, v2}, Lcn/hongguo/tv/MainActivity;->lambda$home$29$cn-hongguo-tv-MainActivity(ILandroid/widget/TextView;)V

    return-void
.end method

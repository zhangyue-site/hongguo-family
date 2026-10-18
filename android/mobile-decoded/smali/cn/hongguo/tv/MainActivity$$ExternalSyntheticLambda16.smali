.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda16;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;

.field public final synthetic f$1:I

.field public final synthetic f$2:Landroid/widget/TextView;

.field public final synthetic f$3:Ljava/lang/Exception;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;ILandroid/widget/TextView;Ljava/lang/Exception;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda16;->f$0:Lcn/hongguo/tv/MainActivity;

    iput p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda16;->f$1:I

    iput-object p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda16;->f$2:Landroid/widget/TextView;

    iput-object p4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda16;->f$3:Ljava/lang/Exception;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda16;->f$0:Lcn/hongguo/tv/MainActivity;

    iget v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda16;->f$1:I

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda16;->f$2:Landroid/widget/TextView;

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda16;->f$3:Ljava/lang/Exception;

    invoke-virtual {v0, v1, v2, v3}, Lcn/hongguo/tv/MainActivity;->lambda$request$11$cn-hongguo-tv-MainActivity(ILandroid/widget/TextView;Ljava/lang/Exception;)V

    return-void
.end method

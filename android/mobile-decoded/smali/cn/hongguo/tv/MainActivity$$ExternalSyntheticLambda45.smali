.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda45;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# instance fields
.field public final synthetic f$0:Ljava/util/ArrayList;

.field public final synthetic f$1:I

.field public final synthetic f$2:Lcn/hongguo/tv/MainActivity$PageUi;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;ILcn/hongguo/tv/MainActivity$PageUi;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda45;->f$0:Ljava/util/ArrayList;

    iput p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda45;->f$1:I

    iput-object p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda45;->f$2:Lcn/hongguo/tv/MainActivity$PageUi;

    return-void
.end method


# virtual methods
.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 6

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda45;->f$0:Ljava/util/ArrayList;

    iget v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda45;->f$1:I

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda45;->f$2:Lcn/hongguo/tv/MainActivity$PageUi;

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcn/hongguo/tv/MainActivity;->lambda$shell$19(Ljava/util/ArrayList;ILcn/hongguo/tv/MainActivity$PageUi;Landroid/view/View;ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

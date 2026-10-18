.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# instance fields
.field public final synthetic f$0:I

.field public final synthetic f$1:Lcn/hongguo/tv/MainActivity$PageUi;


# direct methods
.method public synthetic constructor <init>(ILcn/hongguo/tv/MainActivity$PageUi;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;->f$0:I

    iput-object p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;->f$1:Lcn/hongguo/tv/MainActivity$PageUi;

    return-void
.end method


# virtual methods
.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 0
    iget v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;->f$0:I

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;->f$1:Lcn/hongguo/tv/MainActivity$PageUi;

    invoke-static {v0, v1, p1, p2, p3}, Lcn/hongguo/tv/MainActivity;->lambda$home$23(ILcn/hongguo/tv/MainActivity$PageUi;Landroid/view/View;ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

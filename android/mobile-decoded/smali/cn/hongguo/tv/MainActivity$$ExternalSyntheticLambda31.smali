.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda31;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;

.field public final synthetic f$1:Landroid/view/View$OnFocusChangeListener;

.field public final synthetic f$2:Lcn/hongguo/tv/MainActivity$PageUi;

.field public final synthetic f$3:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;Landroid/view/View$OnFocusChangeListener;Lcn/hongguo/tv/MainActivity$PageUi;Landroid/widget/TextView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda31;->f$0:Lcn/hongguo/tv/MainActivity;

    iput-object p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda31;->f$1:Landroid/view/View$OnFocusChangeListener;

    iput-object p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda31;->f$2:Lcn/hongguo/tv/MainActivity$PageUi;

    iput-object p4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda31;->f$3:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final onFocusChange(Landroid/view/View;Z)V
    .locals 6

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda31;->f$0:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda31;->f$1:Landroid/view/View$OnFocusChangeListener;

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda31;->f$2:Lcn/hongguo/tv/MainActivity$PageUi;

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda31;->f$3:Landroid/widget/TextView;

    move-object v4, p1

    move v5, p2

    invoke-virtual/range {v0 .. v5}, Lcn/hongguo/tv/MainActivity;->lambda$renderCards$32$cn-hongguo-tv-MainActivity(Landroid/view/View$OnFocusChangeListener;Lcn/hongguo/tv/MainActivity$PageUi;Landroid/widget/TextView;Landroid/view/View;Z)V

    return-void
.end method

.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda78;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# instance fields
.field public final synthetic f$0:I

.field public final synthetic f$1:Ljava/util/ArrayList;

.field public final synthetic f$2:I

.field public final synthetic f$3:Lcn/hongguo/tv/MainActivity$PageUi;

.field public final synthetic f$4:Landroid/view/View;

.field public final synthetic f$5:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(ILjava/util/ArrayList;ILcn/hongguo/tv/MainActivity$PageUi;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda78;->f$0:I

    iput-object p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda78;->f$1:Ljava/util/ArrayList;

    iput p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda78;->f$2:I

    iput-object p4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda78;->f$3:Lcn/hongguo/tv/MainActivity$PageUi;

    iput-object p5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda78;->f$4:Landroid/view/View;

    iput-object p6, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda78;->f$5:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 9

    .line 0
    iget v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda78;->f$0:I

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda78;->f$1:Ljava/util/ArrayList;

    iget v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda78;->f$2:I

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda78;->f$3:Lcn/hongguo/tv/MainActivity$PageUi;

    iget-object v4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda78;->f$4:Landroid/view/View;

    iget-object v5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda78;->f$5:Landroid/view/View;

    move-object v6, p1

    move v7, p2

    move-object v8, p3

    invoke-static/range {v0 .. v8}, Lcn/hongguo/tv/MainActivity;->lambda$wireGrid$37(ILjava/util/ArrayList;ILcn/hongguo/tv/MainActivity$PageUi;Landroid/view/View;Landroid/view/View;Landroid/view/View;ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

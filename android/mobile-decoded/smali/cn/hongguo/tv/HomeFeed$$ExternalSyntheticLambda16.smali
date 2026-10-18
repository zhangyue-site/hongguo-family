.class public final synthetic Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda16;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/HomeFeed;

.field public final synthetic f$1:I

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/HomeFeed;II)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda16;->f$0:Lcn/hongguo/tv/HomeFeed;

    iput p2, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda16;->f$1:I

    iput p3, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda16;->f$2:I

    return-void
.end method


# virtual methods
.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 6

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda16;->f$0:Lcn/hongguo/tv/HomeFeed;

    iget v1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda16;->f$1:I

    iget v2, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda16;->f$2:I

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Lcn/hongguo/tv/HomeFeed;->lambda$wire$19$cn-hongguo-tv-HomeFeed(IILandroid/view/View;ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

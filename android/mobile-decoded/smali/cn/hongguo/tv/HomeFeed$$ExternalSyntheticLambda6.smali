.class public final synthetic Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/HomeFeed;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/HomeFeed;I)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda6;->f$0:Lcn/hongguo/tv/HomeFeed;

    iput p2, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda6;->f$1:I

    return-void
.end method


# virtual methods
.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda6;->f$0:Lcn/hongguo/tv/HomeFeed;

    iget v1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda6;->f$1:I

    invoke-virtual {v0, v1, p1, p2, p3}, Lcn/hongguo/tv/HomeFeed;->lambda$show$1$cn-hongguo-tv-HomeFeed(ILandroid/view/View;ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

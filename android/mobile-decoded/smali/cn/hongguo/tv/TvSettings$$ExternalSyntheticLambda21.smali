.class public final synthetic Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda21;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/TvSettings;

.field public final synthetic f$1:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda21;->f$0:Lcn/hongguo/tv/TvSettings;

    iput-object p2, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda21;->f$1:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 2

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda21;->f$0:Lcn/hongguo/tv/TvSettings;

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda21;->f$1:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1, p1, p2, p3}, Lcn/hongguo/tv/TvSettings;->lambda$page$57$cn-hongguo-tv-TvSettings(Landroid/widget/LinearLayout;Landroid/view/View;ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

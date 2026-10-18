.class public final synthetic Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda20;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/TvSettings;

.field public final synthetic f$1:Ljava/util/ArrayList;

.field public final synthetic f$2:Landroid/widget/Button;

.field public final synthetic f$3:I

.field public final synthetic f$4:Landroid/widget/ScrollView;

.field public final synthetic f$5:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/TvSettings;Ljava/util/ArrayList;Landroid/widget/Button;ILandroid/widget/ScrollView;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda20;->f$0:Lcn/hongguo/tv/TvSettings;

    iput-object p2, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda20;->f$1:Ljava/util/ArrayList;

    iput-object p3, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda20;->f$2:Landroid/widget/Button;

    iput p4, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda20;->f$3:I

    iput-object p5, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda20;->f$4:Landroid/widget/ScrollView;

    iput-object p6, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda20;->f$5:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 7

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda20;->f$0:Lcn/hongguo/tv/TvSettings;

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda20;->f$1:Ljava/util/ArrayList;

    iget-object v2, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda20;->f$2:Landroid/widget/Button;

    iget v3, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda20;->f$3:I

    iget-object v4, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda20;->f$4:Landroid/widget/ScrollView;

    iget-object v5, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda20;->f$5:Landroid/widget/LinearLayout;

    move-object v6, p1

    invoke-virtual/range {v0 .. v6}, Lcn/hongguo/tv/TvSettings;->lambda$page$56$cn-hongguo-tv-TvSettings(Ljava/util/ArrayList;Landroid/widget/Button;ILandroid/widget/ScrollView;Landroid/widget/LinearLayout;Landroid/view/View;)V

    return-void
.end method

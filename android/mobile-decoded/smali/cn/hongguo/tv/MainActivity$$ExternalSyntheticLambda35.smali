.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda35;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;

.field public final synthetic f$1:Landroid/view/View;

.field public final synthetic f$2:Z

.field public final synthetic f$3:Landroid/view/View;

.field public final synthetic f$4:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;Landroid/view/View;ZLandroid/view/View;Ljava/util/ArrayList;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda35;->f$0:Lcn/hongguo/tv/MainActivity;

    iput-object p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda35;->f$1:Landroid/view/View;

    iput-boolean p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda35;->f$2:Z

    iput-object p4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda35;->f$3:Landroid/view/View;

    iput-object p5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda35;->f$4:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda35;->f$0:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda35;->f$1:Landroid/view/View;

    iget-boolean v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda35;->f$2:Z

    iget-object v3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda35;->f$3:Landroid/view/View;

    iget-object v4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda35;->f$4:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcn/hongguo/tv/MainActivity;->lambda$renderCards$36$cn-hongguo-tv-MainActivity(Landroid/view/View;ZLandroid/view/View;Ljava/util/ArrayList;)V

    return-void
.end method

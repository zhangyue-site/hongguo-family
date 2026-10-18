.class public final synthetic Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/TvSettings$Selection;

.field public final synthetic f$1:I

.field public final synthetic f$2:Landroid/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/TvSettings$Selection;ILandroid/app/AlertDialog;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda1;->f$0:Lcn/hongguo/tv/TvSettings$Selection;

    iput p2, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda1;->f$1:I

    iput-object p3, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda1;->f$2:Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda1;->f$0:Lcn/hongguo/tv/TvSettings$Selection;

    iget v1, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda1;->f$1:I

    iget-object v2, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda1;->f$2:Landroid/app/AlertDialog;

    invoke-static {v0, v1, v2}, Lcn/hongguo/tv/TvSettings;->lambda$choose$0(Lcn/hongguo/tv/TvSettings$Selection;ILandroid/app/AlertDialog;)V

    return-void
.end method

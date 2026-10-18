.class public final synthetic Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/TvSettings;

.field public final synthetic f$1:Landroid/widget/Button;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/TvSettings;Landroid/widget/Button;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda2;->f$0:Lcn/hongguo/tv/TvSettings;

    iput-object p2, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda2;->f$1:Landroid/widget/Button;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda2;->f$0:Lcn/hongguo/tv/TvSettings;

    iget-object v1, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda2;->f$1:Landroid/widget/Button;

    invoke-virtual {v0, v1, p1}, Lcn/hongguo/tv/TvSettings;->lambda$choose$1$cn-hongguo-tv-TvSettings(Landroid/widget/Button;Landroid/content/DialogInterface;)V

    return-void
.end method

.class public final synthetic Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/Button;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/Button;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda10;->f$0:Landroid/widget/Button;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda10;->f$0:Landroid/widget/Button;

    invoke-static {v0, p1}, Lcn/hongguo/tv/TvSettings;->lambda$confirm$5(Landroid/widget/Button;Landroid/content/DialogInterface;)V

    return-void
.end method

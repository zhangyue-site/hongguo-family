.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Z

.field public final synthetic f$4:Z


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;->f$0:Lcn/hongguo/tv/MainActivity;

    iput-object p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;->f$2:Ljava/lang/String;

    iput-boolean p4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;->f$3:Z

    iput-boolean p5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;->f$4:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 7

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;->f$0:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;->f$2:Ljava/lang/String;

    iget-boolean v3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;->f$3:Z

    iget-boolean v4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda9;->f$4:Z

    move-object v5, p1

    move v6, p2

    invoke-virtual/range {v0 .. v6}, Lcn/hongguo/tv/MainActivity;->lambda$home$23$cn-hongguo-tv-MainActivity(Ljava/lang/String;Ljava/lang/String;ZZLandroid/content/DialogInterface;I)V

    return-void
.end method

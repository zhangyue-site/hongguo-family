.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda77;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;

.field public final synthetic f$1:Lcn/hongguo/tv/Api;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:I

.field public final synthetic f$4:I

.field public final synthetic f$5:I

.field public final synthetic f$6:Landroid/media/MediaPlayer;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;Lcn/hongguo/tv/Api;Ljava/lang/String;IIILandroid/media/MediaPlayer;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda77;->f$0:Lcn/hongguo/tv/MainActivity;

    iput-object p2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda77;->f$1:Lcn/hongguo/tv/Api;

    iput-object p3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda77;->f$2:Ljava/lang/String;

    iput p4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda77;->f$3:I

    iput p5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda77;->f$4:I

    iput p6, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda77;->f$5:I

    iput-object p7, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda77;->f$6:Landroid/media/MediaPlayer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda77;->f$0:Lcn/hongguo/tv/MainActivity;

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda77;->f$1:Lcn/hongguo/tv/Api;

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda77;->f$2:Ljava/lang/String;

    iget v3, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda77;->f$3:I

    iget v4, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda77;->f$4:I

    iget v5, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda77;->f$5:I

    iget-object v6, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda77;->f$6:Landroid/media/MediaPlayer;

    invoke-virtual/range {v0 .. v6}, Lcn/hongguo/tv/MainActivity;->lambda$prepareSource$75$cn-hongguo-tv-MainActivity(Lcn/hongguo/tv/Api;Ljava/lang/String;IIILandroid/media/MediaPlayer;)V

    return-void
.end method

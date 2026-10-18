.class public final synthetic Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda65;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/media/MediaPlayer$OnInfoListener;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/MainActivity;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/MainActivity;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda65;->f$0:Lcn/hongguo/tv/MainActivity;

    return-void
.end method


# virtual methods
.method public final onInfo(Landroid/media/MediaPlayer;II)Z
    .locals 1

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$$ExternalSyntheticLambda65;->f$0:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v0, p1, p2, p3}, Lcn/hongguo/tv/MainActivity;->lambda$playEpisode$90$cn-hongguo-tv-MainActivity(Landroid/media/MediaPlayer;II)Z

    move-result p1

    return p1
.end method

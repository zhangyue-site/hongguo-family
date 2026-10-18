.class Lcn/hongguo/tv/MainActivity$4;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/hongguo/tv/MainActivity;->startPlayer(Lorg/json/JSONObject;Lorg/json/JSONArray;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcn/hongguo/tv/MainActivity;

.field final synthetic val$ep:I

.field final synthetic val$position:J


# direct methods
.method constructor <init>(Lcn/hongguo/tv/MainActivity;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 255
    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$4;->this$0:Lcn/hongguo/tv/MainActivity;

    iput p2, p0, Lcn/hongguo/tv/MainActivity$4;->val$ep:I

    iput-wide p3, p0, Lcn/hongguo/tv/MainActivity$4;->val$position:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    .line 255
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 3

    .line 255
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$4;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity$4;->this$0:Lcn/hongguo/tv/MainActivity;

    iget v0, p0, Lcn/hongguo/tv/MainActivity$4;->val$ep:I

    iget-wide v1, p0, Lcn/hongguo/tv/MainActivity$4;->val$position:J

    invoke-virtual {p1, v0, v1, v2}, Lcn/hongguo/tv/MainActivity;->playEpisode(IJ)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$4;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    :goto_0
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 255
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity$4;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity$4;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    :cond_0
    return-void
.end method

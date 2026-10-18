.class Lcn/hongguo/tv/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/hongguo/tv/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcn/hongguo/tv/MainActivity;


# direct methods
.method constructor <init>(Lcn/hongguo/tv/MainActivity;)V
    .locals 0

    .line 49
    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$1;->this$0:Lcn/hongguo/tv/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 49
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$1;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$1;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-boolean v0, v0, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz v0, :cond_2

    :try_start_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$1;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    iget-object v1, p0, Lcn/hongguo/tv/MainActivity$1;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-object v1, v1, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v1

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$1;->this$0:Lcn/hongguo/tv/MainActivity;

    iget v2, v2, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    if-gez v2, :cond_0

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$1;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-object v2, v2, Lcn/hongguo/tv/MainActivity;->clock:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    int-to-long v4, v0

    invoke-static {v4, v5}, Lcn/hongguo/tv/MainActivity;->time(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " / "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    int-to-long v4, v1

    invoke-static {v4, v5}, Lcn/hongguo/tv/MainActivity;->time(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$1;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-object v2, v2, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    const/4 v3, 0x1

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setMax(I)V

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$1;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-object v2, v2, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v2}, Landroid/widget/SeekBar;->isPressed()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$1;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-object v2, v2, Lcn/hongguo/tv/MainActivity;->seek:Landroid/widget/SeekBar;

    invoke-virtual {v2, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    :cond_0
    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$1;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-boolean v2, v2, Lcn/hongguo/tv/MainActivity;->resuming:Z

    if-nez v2, :cond_1

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$1;->this$0:Lcn/hongguo/tv/MainActivity;

    int-to-long v3, v0

    iput-wide v3, v2, Lcn/hongguo/tv/MainActivity;->pendingSeek:J

    :cond_1
    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$1;->this$0:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v2, v0, v1}, Lcn/hongguo/tv/MainActivity;->sampleRecommendation(II)V

    iget-object v2, p0, Lcn/hongguo/tv/MainActivity$1;->this$0:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {v2, v0, v1}, Lcn/hongguo/tv/MainActivity;->maybePrefetch(II)V

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$1;->this$0:Lcn/hongguo/tv/MainActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcn/hongguo/tv/MainActivity;->saveProgress(Z)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_2
    :goto_0
    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$1;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-boolean v0, v0, Lcn/hongguo/tv/MainActivity;->released:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$1;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_3
    return-void
.end method

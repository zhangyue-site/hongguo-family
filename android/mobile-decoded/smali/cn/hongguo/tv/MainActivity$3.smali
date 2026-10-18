.class Lcn/hongguo/tv/MainActivity$3;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


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


# direct methods
.method constructor <init>(Lcn/hongguo/tv/MainActivity;)V
    .locals 0

    .line 252
    iput-object p1, p0, Lcn/hongguo/tv/MainActivity$3;->this$0:Lcn/hongguo/tv/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 2

    .line 252
    if-eqz p3, :cond_0

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity$3;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-boolean p1, p1, Lcn/hongguo/tv/MainActivity;->prepared:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity$3;->this$0:Lcn/hongguo/tv/MainActivity;

    iput p2, p1, Lcn/hongguo/tv/MainActivity;->seekPreview:I

    iget-object p1, p0, Lcn/hongguo/tv/MainActivity$3;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->clock:Landroid/widget/TextView;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    int-to-long v0, p2

    invoke-static {v0, v1}, Lcn/hongguo/tv/MainActivity;->time(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " / "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object p3, p0, Lcn/hongguo/tv/MainActivity$3;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-object p3, p3, Lcn/hongguo/tv/MainActivity;->player:Landroid/media/MediaPlayer;

    invoke-virtual {p3}, Landroid/media/MediaPlayer;->getDuration()I

    move-result p3

    int-to-long v0, p3

    invoke-static {v0, v1}, Lcn/hongguo/tv/MainActivity;->time(J)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1

    .line 252
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity$3;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-object p1, p1, Lcn/hongguo/tv/MainActivity;->ui:Landroid/os/Handler;

    iget-object v0, p0, Lcn/hongguo/tv/MainActivity$3;->this$0:Lcn/hongguo/tv/MainActivity;

    iget-object v0, v0, Lcn/hongguo/tv/MainActivity;->hideChrome:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    .line 252
    iget-object p1, p0, Lcn/hongguo/tv/MainActivity$3;->this$0:Lcn/hongguo/tv/MainActivity;

    invoke-virtual {p1}, Lcn/hongguo/tv/MainActivity;->commitSeekPreview()V

    return-void
.end method

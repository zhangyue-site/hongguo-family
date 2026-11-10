.class final Lcn/hongguo/tv/MediaFallback;
.super Ljava/lang/Object;
.source "MediaFallback.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/hongguo/tv/MediaFallback$Failure;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static load(Lcn/hongguo/tv/ReadRetry$Operation;Lcn/hongguo/tv/ReadRetry$Operation;Lcn/hongguo/tv/MediaFallback$Failure;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcn/hongguo/tv/ReadRetry$Operation<",
            "TT;>;",
            "Lcn/hongguo/tv/ReadRetry$Operation<",
            "TT;>;",
            "Lcn/hongguo/tv/MediaFallback$Failure;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 10
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_3

    .line 12
    :try_start_0
    invoke-interface {p0}, Lcn/hongguo/tv/ReadRetry$Operation;->run()Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 13
    :catch_0
    move-exception p0

    .line 14
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p0}, Lcn/hongguo/tv/ReadRetry;->recoverable(Ljava/lang/Exception;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 15
    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "No supported media track within budget"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 17
    :cond_0
    invoke-interface {p2, p0}, Lcn/hongguo/tv/MediaFallback$Failure;->record(Ljava/io/IOException;)V

    .line 18
    nop

    .line 20
    :try_start_1
    invoke-interface {p1}, Lcn/hongguo/tv/ReadRetry$Operation;->run()Ljava/lang/Object;

    move-result-object p0
    :try_end_1
    .catch Lcn/hongguo/tv/PlaybackUnavailable; {:try_start_1 .. :try_end_1} :catch_1

    return-object p0

    .line 21
    :catch_1
    move-exception p1

    .line 24
    instance-of p2, p0, Lcn/hongguo/tv/ReadRetry$TemporaryResponse;

    if-eqz p2, :cond_1

    .line 25
    new-instance p1, Lcn/hongguo/tv/PlaybackUnavailable;

    invoke-direct {p1, p0}, Lcn/hongguo/tv/PlaybackUnavailable;-><init>(Ljava/io/IOException;)V

    throw p1

    .line 26
    :cond_1
    throw p1

    .line 16
    :cond_2
    throw p0

    .line 10
    :cond_3
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0
.end method

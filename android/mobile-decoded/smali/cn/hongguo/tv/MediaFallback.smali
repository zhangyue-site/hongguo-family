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

.method static load(ZLcn/hongguo/tv/ReadRetry$Operation;Lcn/hongguo/tv/ReadRetry$Operation;Lcn/hongguo/tv/MediaFallback$Failure;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(Z",
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

    .line 11
    if-eqz p0, :cond_0

    invoke-interface {p2}, Lcn/hongguo/tv/ReadRetry$Operation;->run()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 12
    :cond_0
    :try_start_0
    invoke-interface {p1}, Lcn/hongguo/tv/ReadRetry$Operation;->run()Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 13
    :catch_0
    move-exception p0

    .line 14
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->isInterrupted()Z

    move-result p1

    if-nez p1, :cond_2

    invoke-static {p0}, Lcn/hongguo/tv/ReadRetry;->recoverable(Ljava/lang/Exception;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 15
    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v0, "No supported media track within budget"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 17
    :cond_1
    invoke-interface {p3, p0}, Lcn/hongguo/tv/MediaFallback$Failure;->record(Ljava/io/IOException;)V

    .line 19
    invoke-interface {p2}, Lcn/hongguo/tv/ReadRetry$Operation;->run()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 16
    :cond_2
    throw p0

    .line 10
    :cond_3
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0
.end method

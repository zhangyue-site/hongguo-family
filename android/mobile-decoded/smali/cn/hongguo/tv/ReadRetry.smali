.class final Lcn/hongguo/tv/ReadRetry;
.super Ljava/lang/Object;
.source "ReadRetry.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/hongguo/tv/ReadRetry$TemporaryResponse;,
        Lcn/hongguo/tv/ReadRetry$Sleeper;,
        Lcn/hongguo/tv/ReadRetry$Operation;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static recoverable(Ljava/lang/Exception;)Z
    .locals 1

    .line 8
    instance-of v0, p0, Lcn/hongguo/tv/ReadRetry$TemporaryResponse;

    if-nez v0, :cond_1

    instance-of v0, p0, Ljava/net/SocketTimeoutException;

    if-nez v0, :cond_1

    instance-of v0, p0, Ljava/net/SocketException;

    if-nez v0, :cond_1

    instance-of v0, p0, Ljava/net/UnknownHostException;

    if-nez v0, :cond_1

    instance-of p0, p0, Ljava/io/EOFException;

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method static run(Lcn/hongguo/tv/ReadRetry$Operation;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcn/hongguo/tv/ReadRetry$Operation<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 9
    new-instance v0, Lcn/hongguo/tv/ReadRetry$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcn/hongguo/tv/ReadRetry$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {p0, v0}, Lcn/hongguo/tv/ReadRetry;->run(Lcn/hongguo/tv/ReadRetry$Operation;Lcn/hongguo/tv/ReadRetry$Sleeper;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static run(Lcn/hongguo/tv/ReadRetry$Operation;Lcn/hongguo/tv/ReadRetry$Sleeper;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcn/hongguo/tv/ReadRetry$Operation<",
            "TT;>;",
            "Lcn/hongguo/tv/ReadRetry$Sleeper;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 11
    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x2

    if-ge v0, v1, :cond_2

    .line 12
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v1

    if-nez v1, :cond_1

    .line 13
    :try_start_0
    invoke-interface {p0}, Lcn/hongguo/tv/ReadRetry$Operation;->run()Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v1

    .line 14
    const/4 v2, 0x1

    if-eq v0, v2, :cond_0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v1}, Lcn/hongguo/tv/ReadRetry;->recoverable(Ljava/lang/Exception;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 15
    const-wide/16 v1, 0x4b0

    invoke-interface {p1, v1, v2}, Lcn/hongguo/tv/ReadRetry$Sleeper;->sleep(J)V

    .line 11
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 14
    :cond_0
    throw v1

    .line 12
    :cond_1
    new-instance p0, Ljava/io/InterruptedIOException;

    const-string p1, "Read cancelled"

    invoke-direct {p0, p1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 18
    :cond_2
    new-instance p0, Ljava/lang/AssertionError;

    const-string p1, "Unreachable retry state"

    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0
.end method

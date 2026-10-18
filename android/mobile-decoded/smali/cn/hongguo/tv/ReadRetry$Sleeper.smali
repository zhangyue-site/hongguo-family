.class interface abstract Lcn/hongguo/tv/ReadRetry$Sleeper;
.super Ljava/lang/Object;
.source "ReadRetry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/hongguo/tv/ReadRetry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "Sleeper"
.end annotation


# virtual methods
.method public abstract sleep(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method

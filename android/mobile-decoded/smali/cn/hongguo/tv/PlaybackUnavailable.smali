.class final Lcn/hongguo/tv/PlaybackUnavailable;
.super Ljava/io/IOException;
.source "PlaybackUnavailable.java"


# direct methods
.method constructor <init>()V
    .locals 1

    .line 7
    const-string v0, "Public episode unavailable"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Ljava/io/IOException;)V
    .locals 1

    .line 8
    const-string v0, "Primary source unavailable; preview has no episode"

    invoke-direct {p0, v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method static message(Ljava/lang/Exception;)Ljava/lang/String;
    .locals 1

    .line 10
    instance-of v0, p0, Lcn/hongguo/tv/PlaybackUnavailable;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 11
    const-string p0, "\u4e3b\u7247\u6e90\u6682\u672a\u8fd4\u56de\uff0c\u5907\u7528\u6e90\u4e0d\u542b\u672c\u96c6\uff0c\u8bf7\u7a0d\u540e\u91cd\u8bd5"

    return-object p0

    .line 12
    :cond_0
    if-eqz v0, :cond_1

    .line 13
    const-string p0, "\u672c\u96c6\u6682\u65e0\u53ef\u7528\u7247\u6e90\uff0c\u8bf7\u6362\u4e00\u96c6\u6216\u7a0d\u540e\u518d\u8bd5"

    goto :goto_0

    .line 14
    :cond_1
    const-string p0, "\u64ad\u653e\u8d44\u6e90\u83b7\u53d6\u6216\u51c6\u5907\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5"

    .line 12
    :goto_0
    return-object p0
.end method

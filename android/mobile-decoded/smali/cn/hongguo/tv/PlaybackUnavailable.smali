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

.method static message(Ljava/lang/Exception;)Ljava/lang/String;
    .locals 0

    .line 9
    instance-of p0, p0, Lcn/hongguo/tv/PlaybackUnavailable;

    if-eqz p0, :cond_0

    .line 10
    const-string p0, "\u672c\u96c6\u6682\u65e0\u53ef\u7528\u7247\u6e90\uff0c\u8bf7\u6362\u4e00\u96c6\u6216\u7a0d\u540e\u518d\u8bd5"

    goto :goto_0

    .line 11
    :cond_0
    const-string p0, "\u64ad\u653e\u8d44\u6e90\u83b7\u53d6\u6216\u51c6\u5907\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5"

    .line 9
    :goto_0
    return-object p0
.end method

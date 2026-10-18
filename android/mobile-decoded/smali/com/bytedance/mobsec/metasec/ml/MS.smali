.class public final Lcom/bytedance/mobsec/metasec/ml/MS;
.super Lms/bd/c/a4$a;
.source "MS.java"


# static fields
.field private static certificate:[B

.field private static state:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 4
    invoke-direct {p0}, Lms/bd/c/a4$a;-><init>()V

    return-void
.end method

.method public static a()V
    .locals 0

    .line 8
    return-void
.end method

.method public static b(IIJLjava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 10
    const/4 p1, 0x0

    sparse-switch p0, :sswitch_data_0

    .line 17
    return-object p1

    .line 15
    :sswitch_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0

    .line 12
    :sswitch_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    .line 14
    :sswitch_2
    const-string p0, "6.8.1.32"

    return-object p0

    .line 13
    :sswitch_3
    const p0, 0x10a24

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    .line 16
    :sswitch_4
    sget-object p0, Lcom/bytedance/mobsec/metasec/ml/MS;->certificate:[B

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/bytedance/mobsec/metasec/ml/MS;->certificate:[B

    invoke-virtual {p0}, [B->clone()Ljava/lang/Object;

    move-result-object p1

    :goto_0
    return-object p1

    .line 11
    :sswitch_5
    sget-object p0, Lcom/bytedance/mobsec/metasec/ml/MS;->state:Ljava/lang/String;

    return-object p0

    nop

    :sswitch_data_0
    .sparse-switch
        0x10003 -> :sswitch_5
        0x1000002 -> :sswitch_4
        0x1000010 -> :sswitch_3
        0x1000011 -> :sswitch_2
        0x2000001 -> :sswitch_1
        0x2000002 -> :sswitch_1
        0x1000000e -> :sswitch_0
    .end sparse-switch
.end method

.method public static configure(Ljava/lang/String;[B)V
    .locals 0

    .line 7
    sput-object p0, Lcom/bytedance/mobsec/metasec/ml/MS;->state:Ljava/lang/String;

    invoke-virtual {p1}, [B->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [B

    sput-object p0, Lcom/bytedance/mobsec/metasec/ml/MS;->certificate:[B

    return-void
.end method

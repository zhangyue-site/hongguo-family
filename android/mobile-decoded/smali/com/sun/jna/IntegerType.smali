.class public abstract Lcom/sun/jna/IntegerType;
.super Ljava/lang/Number;
.source "IntegerType.java"

# interfaces
.implements Lcom/sun/jna/NativeMapped;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private number:Ljava/lang/Number;

.field private size:I

.field private unsigned:Z

.field private value:J


# direct methods
.method public constructor <init>(I)V
    .locals 3
    .param p1, "size"    # I

    .line 52
    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/sun/jna/IntegerType;-><init>(IJZ)V

    .line 53
    return-void
.end method

.method public constructor <init>(IJ)V
    .locals 1
    .param p1, "size"    # I
    .param p2, "value"    # J

    .line 62
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/sun/jna/IntegerType;-><init>(IJZ)V

    .line 63
    return-void
.end method

.method public constructor <init>(IJZ)V
    .locals 0
    .param p1, "size"    # I
    .param p2, "value"    # J
    .param p4, "unsigned"    # Z

    .line 66
    invoke-direct {p0}, Ljava/lang/Number;-><init>()V

    .line 67
    iput p1, p0, Lcom/sun/jna/IntegerType;->size:I

    .line 68
    iput-boolean p4, p0, Lcom/sun/jna/IntegerType;->unsigned:Z

    .line 69
    invoke-virtual {p0, p2, p3}, Lcom/sun/jna/IntegerType;->setValue(J)V

    .line 70
    return-void
.end method

.method public constructor <init>(IZ)V
    .locals 2
    .param p1, "size"    # I
    .param p2, "unsigned"    # Z

    .line 57
    const-wide/16 v0, 0x0

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/sun/jna/IntegerType;-><init>(IJZ)V

    .line 58
    return-void
.end method

.method public static final compare(JJ)I
    .locals 1
    .param p0, "v1"    # J
    .param p2, "v2"    # J

    .line 220
    cmp-long v0, p0, p2

    if-nez v0, :cond_0

    .line 221
    const/4 v0, 0x0

    return v0

    .line 222
    :cond_0
    cmp-long v0, p0, p2

    if-gez v0, :cond_1

    .line 223
    const/4 v0, -0x1

    return v0

    .line 225
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public static compare(Lcom/sun/jna/IntegerType;J)I
    .locals 2
    .param p0, "v1"    # Lcom/sun/jna/IntegerType;
    .param p1, "v2"    # J

    .line 211
    if-nez p0, :cond_0

    .line 212
    const/4 v0, 0x1

    return v0

    .line 214
    :cond_0
    invoke-virtual {p0}, Lcom/sun/jna/IntegerType;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1, p1, p2}, Lcom/sun/jna/IntegerType;->compare(JJ)I

    move-result v0

    return v0
.end method

.method public static compare(Lcom/sun/jna/IntegerType;Lcom/sun/jna/IntegerType;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/sun/jna/IntegerType;",
            ">(TT;TT;)I"
        }
    .end annotation

    .line 188
    .local p0, "v1":Lcom/sun/jna/IntegerType;, "TT;"
    .local p1, "v2":Lcom/sun/jna/IntegerType;, "TT;"
    if-ne p0, p1, :cond_0

    .line 189
    const/4 v0, 0x0

    return v0

    .line 190
    :cond_0
    if-nez p0, :cond_1

    .line 191
    const/4 v0, 0x1

    return v0

    .line 192
    :cond_1
    if-nez p1, :cond_2

    .line 193
    const/4 v0, -0x1

    return v0

    .line 195
    :cond_2
    invoke-virtual {p0}, Lcom/sun/jna/IntegerType;->longValue()J

    move-result-wide v0

    invoke-virtual {p1}, Lcom/sun/jna/IntegerType;->longValue()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Lcom/sun/jna/IntegerType;->compare(JJ)I

    move-result v0

    return v0
.end method


# virtual methods
.method public doubleValue()D
    .locals 2

    .line 154
    iget-object v0, p0, Lcom/sun/jna/IntegerType;->number:Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "rhs"    # Ljava/lang/Object;

    .line 159
    instance-of v0, p1, Lcom/sun/jna/IntegerType;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sun/jna/IntegerType;->number:Ljava/lang/Number;

    move-object v1, p1

    check-cast v1, Lcom/sun/jna/IntegerType;

    iget-object v1, v1, Lcom/sun/jna/IntegerType;->number:Ljava/lang/Number;

    .line 160
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 159
    :goto_0
    return v0
.end method

.method public floatValue()F
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/sun/jna/IntegerType;->number:Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    return v0
.end method

.method public fromNative(Ljava/lang/Object;Lcom/sun/jna/FromNativeContext;)Ljava/lang/Object;
    .locals 3
    .param p1, "nativeValue"    # Ljava/lang/Object;
    .param p2, "context"    # Lcom/sun/jna/FromNativeContext;

    .line 125
    if-nez p1, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    .line 126
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    :goto_0
    nop

    .line 127
    .local v0, "value":J
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2}, Lcom/sun/jna/Klass;->newInstance(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/sun/jna/IntegerType;

    .line 128
    .local v2, "number":Lcom/sun/jna/IntegerType;
    invoke-virtual {v2, v0, v1}, Lcom/sun/jna/IntegerType;->setValue(J)V

    .line 129
    return-object v2
.end method

.method public hashCode()I
    .locals 1

    .line 170
    iget-object v0, p0, Lcom/sun/jna/IntegerType;->number:Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public intValue()I
    .locals 2

    .line 139
    iget-wide v0, p0, Lcom/sun/jna/IntegerType;->value:J

    long-to-int v1, v0

    return v1
.end method

.method public longValue()J
    .locals 2

    .line 144
    iget-wide v0, p0, Lcom/sun/jna/IntegerType;->value:J

    return-wide v0
.end method

.method public nativeType()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 134
    iget-object v0, p0, Lcom/sun/jna/IntegerType;->number:Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public setValue(J)V
    .locals 9
    .param p1, "value"    # J

    .line 76
    move-wide v0, p1

    .line 77
    .local v0, "truncated":J
    iput-wide p1, p0, Lcom/sun/jna/IntegerType;->value:J

    .line 78
    iget v2, p0, Lcom/sun/jna/IntegerType;->size:I

    sparse-switch v2, :sswitch_data_0

    .line 104
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unsupported size: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/sun/jna/IntegerType;->size:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 101
    :sswitch_0
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, p0, Lcom/sun/jna/IntegerType;->number:Ljava/lang/Number;

    .line 102
    goto :goto_0

    .line 94
    :sswitch_1
    iget-boolean v2, p0, Lcom/sun/jna/IntegerType;->unsigned:Z

    if-eqz v2, :cond_0

    .line 95
    const-wide v2, 0xffffffffL

    and-long/2addr v2, p1

    iput-wide v2, p0, Lcom/sun/jna/IntegerType;->value:J

    .line 97
    :cond_0
    long-to-int v2, p1

    int-to-long v0, v2

    .line 98
    long-to-int v2, p1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/sun/jna/IntegerType;->number:Ljava/lang/Number;

    .line 99
    goto :goto_0

    .line 87
    :sswitch_2
    iget-boolean v2, p0, Lcom/sun/jna/IntegerType;->unsigned:Z

    if-eqz v2, :cond_1

    .line 88
    const-wide/32 v2, 0xffff

    and-long/2addr v2, p1

    iput-wide v2, p0, Lcom/sun/jna/IntegerType;->value:J

    .line 90
    :cond_1
    long-to-int v2, p1

    int-to-short v2, v2

    int-to-long v0, v2

    .line 91
    long-to-int v2, p1

    int-to-short v2, v2

    invoke-static {v2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v2

    iput-object v2, p0, Lcom/sun/jna/IntegerType;->number:Ljava/lang/Number;

    .line 92
    goto :goto_0

    .line 80
    :sswitch_3
    iget-boolean v2, p0, Lcom/sun/jna/IntegerType;->unsigned:Z

    if-eqz v2, :cond_2

    .line 81
    const-wide/16 v2, 0xff

    and-long/2addr v2, p1

    iput-wide v2, p0, Lcom/sun/jna/IntegerType;->value:J

    .line 83
    :cond_2
    long-to-int v2, p1

    int-to-byte v2, v2

    int-to-long v0, v2

    .line 84
    long-to-int v2, p1

    int-to-byte v2, v2

    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    iput-object v2, p0, Lcom/sun/jna/IntegerType;->number:Ljava/lang/Number;

    .line 85
    nop

    .line 106
    :goto_0
    iget v2, p0, Lcom/sun/jna/IntegerType;->size:I

    const/16 v3, 0x8

    if-ge v2, v3, :cond_5

    .line 107
    iget v2, p0, Lcom/sun/jna/IntegerType;->size:I

    mul-int/lit8 v2, v2, 0x8

    const-wide/16 v3, 0x1

    shl-long v5, v3, v2

    sub-long/2addr v5, v3

    not-long v2, v5

    .line 108
    .local v2, "mask":J
    const-wide/16 v4, 0x0

    cmp-long v6, p1, v4

    if-gez v6, :cond_3

    cmp-long v6, v0, p1

    if-nez v6, :cond_4

    :cond_3
    cmp-long v6, p1, v4

    if-ltz v6, :cond_5

    and-long v6, v2, p1

    cmp-long v8, v6, v4

    if-nez v8, :cond_4

    goto :goto_1

    .line 110
    :cond_4
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Argument value 0x"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 111
    invoke-static {p1, p2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " exceeds native capacity ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/sun/jna/IntegerType;->size:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " bytes) mask=0x"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 112
    invoke-static {v2, v3}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 115
    .end local v2    # "mask":J
    :cond_5
    :goto_1
    return-void

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_3
        0x2 -> :sswitch_2
        0x4 -> :sswitch_1
        0x8 -> :sswitch_0
    .end sparse-switch
.end method

.method public toNative()Ljava/lang/Object;
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/sun/jna/IntegerType;->number:Ljava/lang/Number;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 165
    iget-object v0, p0, Lcom/sun/jna/IntegerType;->number:Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

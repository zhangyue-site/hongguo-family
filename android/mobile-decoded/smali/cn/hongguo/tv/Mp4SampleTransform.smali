.class public final Lcn/hongguo/tv/Mp4SampleTransform;
.super Ljava/lang/Object;
.source "Mp4SampleTransform.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/hongguo/tv/Mp4SampleTransform$Box;,
        Lcn/hongguo/tv/Mp4SampleTransform$Result;
    }
.end annotation


# static fields
.field public static final BUFFER_BYTES:I = 0x10000


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static boxes(Ljava/io/RandomAccessFile;JJ)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/RandomAccessFile;",
            "JJ)",
            "Ljava/util/List<",
            "Lcn/hongguo/tv/Mp4SampleTransform$Box;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-wide v2, p1

    .line 25
    :goto_0
    cmp-long p1, v2, p3

    if-gez p1, :cond_4

    .line 26
    sub-long p1, p3, v2

    const-wide/16 v4, 0x8

    cmp-long v1, p1, v4

    if-ltz v1, :cond_3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/16 v6, 0x4e20

    if-gt v1, v6, :cond_3

    .line 27
    invoke-virtual {p0, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-static {p0}, Lcn/hongguo/tv/Mp4SampleTransform;->u32(Ljava/io/RandomAccessFile;)J

    move-result-wide v6

    invoke-static {p0}, Lcn/hongguo/tv/Mp4SampleTransform;->four(Ljava/io/RandomAccessFile;)Ljava/lang/String;

    move-result-object v8

    .line 28
    const-wide/16 v9, 0x1

    cmp-long v1, v6, v9

    if-nez v1, :cond_0

    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->readLong()J

    move-result-wide v6

    const-wide/16 v4, 0x10

    goto :goto_1

    .line 29
    :cond_0
    const-wide/16 v9, 0x0

    cmp-long v1, v6, v9

    if-nez v1, :cond_1

    move-wide v6, p1

    .line 30
    :cond_1
    :goto_1
    cmp-long v1, v6, v4

    if-ltz v1, :cond_2

    cmp-long v1, v6, p1

    if-gtz v1, :cond_2

    .line 31
    new-instance p1, Lcn/hongguo/tv/Mp4SampleTransform$Box;

    add-long/2addr v4, v2

    add-long v9, v2, v6

    move-object v1, p1

    move-wide v6, v9

    invoke-direct/range {v1 .. v8}, Lcn/hongguo/tv/Mp4SampleTransform$Box;-><init>(JJJLjava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    move-wide v2, v9

    goto :goto_0

    .line 30
    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Invalid MP4 box size"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 26
    :cond_3
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Invalid MP4 box range"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 33
    :cond_4
    return-object v0
.end method

.method private static cancel()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/InterruptedIOException;
        }
    .end annotation

    .line 94
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "Media processing cancelled"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static child(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 42
    iget-wide v0, p1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    iget-wide v2, p1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->end:J

    invoke-static {p0, v0, v1, v2, v3}, Lcn/hongguo/tv/Mp4SampleTransform;->boxes(Ljava/io/RandomAccessFile;JJ)Ljava/util/List;

    move-result-object p0

    invoke-static {p0, p2}, Lcn/hongguo/tv/Mp4SampleTransform;->one(Ljava/util/List;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object p0

    return-object p0
.end method

.method private static count(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;III)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    iget-wide v0, p1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    int-to-long v2, p2

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-static {p0}, Lcn/hongguo/tv/Mp4SampleTransform;->u32(Ljava/io/RandomAccessFile;)J

    move-result-wide v0

    .line 47
    const-wide/16 v4, 0x1

    cmp-long p0, v0, v4

    if-ltz p0, :cond_0

    int-to-long p2, p3

    cmp-long p0, v0, p2

    if-gtz p0, :cond_0

    iget-wide p2, p1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    add-long/2addr p2, v2

    const-wide/16 v2, 0x4

    add-long/2addr p2, v2

    int-to-long v2, p4

    mul-long v2, v2, v0

    add-long/2addr p2, v2

    iget-wide p0, p1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->end:J

    cmp-long p4, p2, p0

    if-gtz p4, :cond_0

    .line 48
    long-to-int p0, v0

    return p0

    .line 47
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Invalid MP4 table bounds"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static four(Ljava/io/RandomAccessFile;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 44
    const/4 v0, 0x4

    new-array v0, v0, [B

    invoke-virtual {p0, v0}, Ljava/io/RandomAccessFile;->readFully([B)V

    new-instance p0, Ljava/lang/String;

    const-string v1, "US-ASCII"

    invoke-direct {p0, v0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object p0
.end method

.method public static hasEncryptedSamples(Ljava/io/File;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "r"

    invoke-direct {v0, p0, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 55
    :try_start_0
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    invoke-static {v0, v3, v4, v1, v2}, Lcn/hongguo/tv/Mp4SampleTransform;->boxes(Ljava/io/RandomAccessFile;JJ)Ljava/util/List;

    move-result-object p0

    const-string v1, "moov"

    invoke-static {p0, v1}, Lcn/hongguo/tv/Mp4SampleTransform;->one(Ljava/util/List;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object p0

    .line 56
    iget-wide v1, p0, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    iget-wide v3, p0, Lcn/hongguo/tv/Mp4SampleTransform$Box;->end:J

    invoke-static {v0, v1, v2, v3, v4}, Lcn/hongguo/tv/Mp4SampleTransform;->boxes(Ljava/io/RandomAccessFile;JJ)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcn/hongguo/tv/Mp4SampleTransform$Box;

    iget-object v2, v1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->type:Ljava/lang/String;

    const-string v3, "trak"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 57
    const-string v2, "mdia"

    invoke-static {v0, v1, v2}, Lcn/hongguo/tv/Mp4SampleTransform;->child(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v1

    const-string v2, "minf"

    invoke-static {v0, v1, v2}, Lcn/hongguo/tv/Mp4SampleTransform;->child(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v1

    const-string v2, "stbl"

    invoke-static {v0, v1, v2}, Lcn/hongguo/tv/Mp4SampleTransform;->child(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v1

    .line 58
    const-string v2, "stsd"

    invoke-static {v0, v1, v2}, Lcn/hongguo/tv/Mp4SampleTransform;->child(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v1

    .line 59
    iget-wide v2, v1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    const-wide/16 v4, 0x8

    add-long/2addr v2, v4

    iget-wide v4, v1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->end:J

    invoke-static {v0, v2, v3, v4, v5}, Lcn/hongguo/tv/Mp4SampleTransform;->boxes(Ljava/io/RandomAccessFile;JJ)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcn/hongguo/tv/Mp4SampleTransform$Box;

    iget-object v3, v2, Lcn/hongguo/tv/Mp4SampleTransform$Box;->type:Ljava/lang/String;

    const-string v4, "encv"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v2, v2, Lcn/hongguo/tv/Mp4SampleTransform$Box;->type:Ljava/lang/String;

    const-string v3, "enca"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_1

    .line 62
    :cond_2
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 59
    const/4 p0, 0x1

    return p0

    .line 61
    :cond_3
    nop

    .line 62
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 61
    const/4 p0, 0x0

    return p0

    .line 54
    :catchall_0
    move-exception p0

    :try_start_1
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v0

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw p0
.end method

.method private static one(Ljava/util/List;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcn/hongguo/tv/Mp4SampleTransform$Box;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcn/hongguo/tv/Mp4SampleTransform$Box;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 36
    nop

    .line 37
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcn/hongguo/tv/Mp4SampleTransform$Box;

    iget-object v2, v1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->type:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    if-nez v0, :cond_1

    move-object v0, v1

    goto :goto_0

    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Duplicate MP4 box"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 38
    :cond_2
    if-eqz v0, :cond_3

    .line 39
    return-object v0

    .line 38
    :cond_3
    new-instance p0, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Missing MP4 box: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static optional(Ljava/util/List;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcn/hongguo/tv/Mp4SampleTransform$Box;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcn/hongguo/tv/Mp4SampleTransform$Box;"
        }
    .end annotation

    .line 41
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcn/hongguo/tv/Mp4SampleTransform$Box;

    iget-object v1, v0, Lcn/hongguo/tv/Mp4SampleTransform$Box;->type:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method private static patch(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;Ljava/lang/String;Lcn/hongguo/tv/Mp4SampleTransform$Result;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 51
    iget-wide v0, p1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->start:J

    const-wide/16 v2, 0x4

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Ljava/io/RandomAccessFile;->seek(J)V

    const-string p1, "US-ASCII"

    invoke-virtual {p2, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/RandomAccessFile;->write([B)V

    iget p0, p3, Lcn/hongguo/tv/Mp4SampleTransform$Result;->patchedBoxes:I

    add-int/lit8 p0, p0, 0x1

    iput p0, p3, Lcn/hongguo/tv/Mp4SampleTransform$Result;->patchedBoxes:I

    .line 52
    return-void
.end method

.method private static processTrack(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;Ljava/util/List;[B[B[BLcn/hongguo/tv/Mp4SampleTransform$Result;)V
    .locals 47
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/RandomAccessFile;",
            "Lcn/hongguo/tv/Mp4SampleTransform$Box;",
            "Ljava/util/List<",
            "Lcn/hongguo/tv/Mp4SampleTransform$Box;",
            ">;[B[B[B",
            "Lcn/hongguo/tv/Mp4SampleTransform$Result;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 96
    move-object/from16 v0, p0

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    const-string v1, "mdia"

    move-object/from16 v2, p1

    invoke-static {v0, v2, v1}, Lcn/hongguo/tv/Mp4SampleTransform;->child(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v1

    const-string v2, "hdlr"

    invoke-static {v0, v1, v2}, Lcn/hongguo/tv/Mp4SampleTransform;->child(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v2

    .line 97
    iget-wide v3, v2, Lcn/hongguo/tv/Mp4SampleTransform$Box;->end:J

    iget-wide v5, v2, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    sub-long/2addr v3, v5

    const-wide/16 v5, 0xc

    cmp-long v10, v3, v5

    if-ltz v10, :cond_34

    .line 98
    iget-wide v2, v2, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    const-wide/16 v10, 0x8

    add-long/2addr v2, v10

    invoke-virtual {v0, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-static/range {p0 .. p0}, Lcn/hongguo/tv/Mp4SampleTransform;->four(Ljava/io/RandomAccessFile;)Ljava/lang/String;

    move-result-object v12

    .line 99
    const-string v13, "vide"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v3, "soun"

    if-nez v2, :cond_0

    invoke-virtual {v12, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    return-void

    .line 100
    :cond_0
    const-string v2, "minf"

    invoke-static {v0, v1, v2}, Lcn/hongguo/tv/Mp4SampleTransform;->child(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v1

    const-string v2, "stbl"

    invoke-static {v0, v1, v2}, Lcn/hongguo/tv/Mp4SampleTransform;->child(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v1

    .line 101
    iget-wide v14, v1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    iget-wide v1, v1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->end:J

    invoke-static {v0, v14, v15, v1, v2}, Lcn/hongguo/tv/Mp4SampleTransform;->boxes(Ljava/io/RandomAccessFile;JJ)Ljava/util/List;

    move-result-object v14

    .line 102
    const-string v1, "stsd"

    invoke-static {v14, v1}, Lcn/hongguo/tv/Mp4SampleTransform;->one(Ljava/util/List;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v1

    iget-wide v5, v1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    const-wide/16 v17, 0x4

    add-long v5, v5, v17

    invoke-virtual {v0, v5, v6}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-static/range {p0 .. p0}, Lcn/hongguo/tv/Mp4SampleTransform;->u32(Ljava/io/RandomAccessFile;)J

    move-result-wide v4

    const-wide/16 v19, 0x1

    cmp-long v2, v4, v19

    if-nez v2, :cond_33

    .line 103
    iget-wide v4, v1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    add-long/2addr v4, v10

    iget-wide v1, v1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->end:J

    invoke-static {v0, v4, v5, v1, v2}, Lcn/hongguo/tv/Mp4SampleTransform;->boxes(Ljava/io/RandomAccessFile;JJ)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v6, 0x1

    if-ne v2, v6, :cond_32

    .line 104
    const/4 v5, 0x0

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcn/hongguo/tv/Mp4SampleTransform$Box;

    .line 105
    iget-object v1, v4, Lcn/hongguo/tv/Mp4SampleTransform$Box;->type:Ljava/lang/String;

    const-string v2, "encv"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, v4, Lcn/hongguo/tv/Mp4SampleTransform$Box;->type:Ljava/lang/String;

    const-string v2, "enca"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    return-void

    .line 106
    :cond_1
    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x4e

    goto :goto_0

    :cond_2
    const/16 v1, 0x1c

    .line 107
    :goto_0
    invoke-virtual {v12, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-wide v2, v4, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    add-long/2addr v2, v10

    invoke-virtual {v0, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-virtual/range {p0 .. p0}, Ljava/io/RandomAccessFile;->readUnsignedShort()I

    move-result v2

    if-nez v2, :cond_3

    goto :goto_1

    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Unsupported audio sample entry version"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_4
    :goto_1
    iget-wide v2, v4, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    int-to-long v10, v1

    add-long/2addr v2, v10

    iget-wide v10, v4, Lcn/hongguo/tv/Mp4SampleTransform$Box;->end:J

    invoke-static {v0, v2, v3, v10, v11}, Lcn/hongguo/tv/Mp4SampleTransform;->boxes(Ljava/io/RandomAccessFile;JJ)Ljava/util/List;

    move-result-object v1

    .line 109
    const-string v2, "sinf"

    invoke-static {v1, v2}, Lcn/hongguo/tv/Mp4SampleTransform;->one(Ljava/util/List;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v10

    const-string v2, "frma"

    invoke-static {v0, v10, v2}, Lcn/hongguo/tv/Mp4SampleTransform;->child(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v2

    .line 110
    iget-wide v2, v2, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    invoke-virtual {v0, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-static/range {p0 .. p0}, Lcn/hongguo/tv/Mp4SampleTransform;->four(Ljava/io/RandomAccessFile;)Ljava/lang/String;

    move-result-object v11

    .line 111
    const-string v2, "avc1"

    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    const-string v3, "hvc1"

    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    const-string v3, "hev1"

    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    const-string v3, "mp4a"

    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    goto :goto_2

    :cond_5
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Unsupported original codec"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_6
    :goto_2
    nop

    .line 113
    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v15, 0x4

    if-eqz v3, :cond_9

    .line 114
    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    const-string v3, "avcC"

    goto :goto_3

    :cond_7
    const-string v3, "hvcC"

    :goto_3
    invoke-static {v1, v3}, Lcn/hongguo/tv/Mp4SampleTransform;->one(Ljava/util/List;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v1

    .line 115
    iget-wide v5, v1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/4 v1, 0x4

    goto :goto_4

    :cond_8
    const/16 v1, 0x15

    :goto_4
    int-to-long v1, v1

    add-long/2addr v5, v1

    invoke-virtual {v0, v5, v6}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-virtual/range {p0 .. p0}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v1

    and-int/lit8 v1, v1, 0x3

    const/4 v6, 0x1

    add-int/2addr v1, v6

    move v5, v1

    goto :goto_5

    .line 113
    :cond_9
    const/4 v5, 0x0

    .line 117
    :goto_5
    const-string v3, "senc"

    invoke-static {v14, v3}, Lcn/hongguo/tv/Mp4SampleTransform;->one(Ljava/util/List;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v1

    iget-wide v6, v1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    invoke-virtual {v0, v6, v7}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-virtual/range {p0 .. p0}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v2

    .line 118
    if-nez v2, :cond_31

    .line 119
    invoke-static/range {p0 .. p0}, Lcn/hongguo/tv/Mp4SampleTransform;->u32(Ljava/io/RandomAccessFile;)J

    move-result-wide v6

    .line 120
    cmp-long v2, v6, v19

    if-ltz v2, :cond_30

    iget-wide v1, v1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->end:J

    invoke-virtual/range {p0 .. p0}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v25

    sub-long v1, v1, v25

    const-wide/16 v21, 0x8

    mul-long v21, v21, v6

    cmp-long v25, v1, v21

    if-nez v25, :cond_30

    .line 121
    invoke-virtual/range {p0 .. p0}, Ljava/io/RandomAccessFile;->readLong()J

    move-result-wide v21

    .line 123
    move-wide/from16 v1, v19

    :goto_6
    cmp-long v25, v1, v6

    if-gez v25, :cond_b

    invoke-virtual/range {p0 .. p0}, Ljava/io/RandomAccessFile;->readLong()J

    move-result-wide v25

    add-long v27, v21, v1

    cmp-long v29, v25, v27

    if-nez v29, :cond_a

    add-long v1, v1, v19

    goto :goto_6

    :cond_a
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Non-incrementing sample IV"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 124
    :cond_b
    const-string v1, "stsz"

    invoke-static {v14, v1}, Lcn/hongguo/tv/Mp4SampleTransform;->one(Ljava/util/List;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v1

    move-object/from16 v25, v3

    iget-wide v2, v1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    add-long v2, v2, v17

    invoke-virtual {v0, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-static/range {p0 .. p0}, Lcn/hongguo/tv/Mp4SampleTransform;->u32(Ljava/io/RandomAccessFile;)J

    move-result-wide v2

    move-object/from16 v26, v4

    move/from16 v27, v5

    invoke-static/range {p0 .. p0}, Lcn/hongguo/tv/Mp4SampleTransform;->u32(Ljava/io/RandomAccessFile;)J

    move-result-wide v4

    .line 125
    cmp-long v28, v4, v19

    if-ltz v28, :cond_2f

    const-wide/32 v28, 0x186a0

    cmp-long v30, v4, v28

    if-gtz v30, :cond_2f

    cmp-long v28, v4, v6

    if-nez v28, :cond_2f

    const-wide/32 v6, 0x1000000

    cmp-long v28, v2, v6

    if-gtz v28, :cond_2f

    .line 126
    const-wide/16 v28, 0x0

    cmp-long v30, v2, v28

    if-nez v30, :cond_d

    iget-wide v6, v1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    const-wide/16 v23, 0xc

    add-long v6, v6, v23

    mul-long v17, v17, v4

    add-long v6, v6, v17

    move-wide/from16 v17, v2

    iget-wide v1, v1, Lcn/hongguo/tv/Mp4SampleTransform$Box;->end:J

    cmp-long v3, v6, v1

    if-gtz v3, :cond_c

    goto :goto_7

    :cond_c
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Truncated sample sizes"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    move-wide/from16 v17, v2

    .line 127
    :goto_7
    long-to-int v7, v4

    new-array v6, v7, [I

    .line 128
    const/4 v1, 0x0

    :goto_8
    if-ge v1, v7, :cond_10

    if-nez v30, :cond_e

    invoke-static/range {p0 .. p0}, Lcn/hongguo/tv/Mp4SampleTransform;->u32(Ljava/io/RandomAccessFile;)J

    move-result-wide v2

    goto :goto_9

    :cond_e
    move-wide/from16 v2, v17

    :goto_9
    cmp-long v23, v2, v19

    if-ltz v23, :cond_f

    const-wide/32 v23, 0x1000000

    cmp-long v31, v2, v23

    if-gtz v31, :cond_f

    long-to-int v3, v2

    aput v3, v6, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_f
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid sample size"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 129
    :cond_10
    const-string v1, "co64"

    invoke-static {v14, v1}, Lcn/hongguo/tv/Mp4SampleTransform;->optional(Ljava/util/List;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v1

    if-eqz v1, :cond_11

    const/4 v2, 0x1

    goto :goto_a

    :cond_11
    const/4 v2, 0x0

    :goto_a
    if-nez v2, :cond_12

    const-string v1, "stco"

    invoke-static {v14, v1}, Lcn/hongguo/tv/Mp4SampleTransform;->one(Ljava/util/List;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v1

    .line 130
    :cond_12
    const/16 v17, 0x8

    if-eqz v2, :cond_13

    const/16 v3, 0x8

    goto :goto_b

    :cond_13
    const/4 v3, 0x4

    :goto_b
    move-object/from16 v18, v10

    const v10, 0x186a0

    invoke-static {v0, v1, v15, v10, v3}, Lcn/hongguo/tv/Mp4SampleTransform;->count(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;III)I

    move-result v10

    new-array v3, v10, [J

    .line 131
    const/4 v1, 0x0

    :goto_c
    if-ge v1, v10, :cond_15

    if-eqz v2, :cond_14

    invoke-virtual/range {p0 .. p0}, Ljava/io/RandomAccessFile;->readLong()J

    move-result-wide v23

    goto :goto_d

    :cond_14
    invoke-static/range {p0 .. p0}, Lcn/hongguo/tv/Mp4SampleTransform;->u32(Ljava/io/RandomAccessFile;)J

    move-result-wide v23

    :goto_d
    aput-wide v23, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 132
    :cond_15
    const-string v1, "stsc"

    invoke-static {v14, v1}, Lcn/hongguo/tv/Mp4SampleTransform;->one(Ljava/util/List;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v1

    const/16 v2, 0x2710

    move-object/from16 v23, v14

    const/16 v14, 0xc

    invoke-static {v0, v1, v15, v2, v14}, Lcn/hongguo/tv/Mp4SampleTransform;->count(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;III)I

    move-result v14

    new-array v15, v14, [I

    new-array v2, v14, [I

    .line 133
    const/4 v1, 0x0

    :goto_e
    if-ge v1, v14, :cond_19

    .line 134
    move-object/from16 v30, v11

    move-object/from16 v24, v12

    invoke-static/range {p0 .. p0}, Lcn/hongguo/tv/Mp4SampleTransform;->u32(Ljava/io/RandomAccessFile;)J

    move-result-wide v11

    move-object/from16 v31, v13

    move/from16 v32, v14

    invoke-static/range {p0 .. p0}, Lcn/hongguo/tv/Mp4SampleTransform;->u32(Ljava/io/RandomAccessFile;)J

    move-result-wide v13

    invoke-static/range {p0 .. p0}, Lcn/hongguo/tv/Mp4SampleTransform;->u32(Ljava/io/RandomAccessFile;)J

    move-result-wide v33

    .line 135
    cmp-long v35, v11, v19

    if-ltz v35, :cond_18

    move-object/from16 v37, v6

    move/from16 v36, v7

    int-to-long v6, v10

    cmp-long v38, v11, v6

    if-gtz v38, :cond_18

    cmp-long v6, v13, v19

    if-ltz v6, :cond_18

    cmp-long v6, v13, v4

    if-gtz v6, :cond_18

    cmp-long v6, v33, v19

    if-nez v6, :cond_18

    if-nez v1, :cond_16

    if-nez v35, :cond_18

    :cond_16
    if-lez v1, :cond_17

    add-int/lit8 v6, v1, -0x1

    aget v6, v15, v6

    int-to-long v6, v6

    cmp-long v33, v11, v6

    if-lez v33, :cond_18

    .line 136
    :cond_17
    long-to-int v6, v11

    aput v6, v15, v1

    long-to-int v6, v13

    aput v6, v2, v1

    .line 133
    add-int/lit8 v1, v1, 0x1

    move-object/from16 v12, v24

    move-object/from16 v11, v30

    move-object/from16 v13, v31

    move/from16 v14, v32

    move/from16 v7, v36

    move-object/from16 v6, v37

    goto :goto_e

    .line 135
    :cond_18
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid chunk mapping"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 138
    :cond_19
    move-object/from16 v37, v6

    move/from16 v36, v7

    move-object/from16 v30, v11

    move-object/from16 v24, v12

    move-object/from16 v31, v13

    move/from16 v32, v14

    iget v1, v9, Lcn/hongguo/tv/Mp4SampleTransform$Result;->peakTableBytes:I

    mul-int/lit8 v7, v36, 0x4

    mul-int/lit8 v4, v10, 0x8

    add-int/2addr v7, v4

    mul-int/lit8 v14, v32, 0x8

    add-int/2addr v7, v14

    invoke-static {v1, v7}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, v9, Lcn/hongguo/tv/Mp4SampleTransform$Result;->peakTableBytes:I

    .line 139
    const-string v1, "AES/CTR/NoPadding"

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v7

    new-instance v11, Ljavax/crypto/spec/SecretKeySpec;

    const-string v1, "AES"

    move-object/from16 v4, p3

    invoke-direct {v11, v4, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 140
    nop

    .line 141
    const/4 v1, 0x0

    const/4 v4, 0x0

    const/4 v12, 0x0

    :goto_f
    if-ge v12, v10, :cond_29

    .line 142
    invoke-static {}, Lcn/hongguo/tv/Mp4SampleTransform;->cancel()V

    move v13, v4

    :goto_10
    add-int/lit8 v4, v13, 0x1

    move/from16 v14, v32

    if-ge v4, v14, :cond_1a

    aget v5, v15, v4

    add-int/lit8 v6, v12, 0x1

    if-gt v5, v6, :cond_1a

    move v13, v4

    move/from16 v32, v14

    goto :goto_10

    .line 143
    :cond_1a
    aget-wide v4, v3, v12

    .line 144
    move v6, v1

    move-wide/from16 v32, v4

    const/4 v5, 0x0

    :goto_11
    aget v1, v2, v13

    if-ge v5, v1, :cond_28

    .line 145
    move/from16 v4, v36

    if-ge v6, v4, :cond_27

    .line 146
    aget v1, v37, v6

    .line 147
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v34

    const/16 v35, 0x0

    :goto_12
    invoke-interface/range {v34 .. v34}, Ljava/util/Iterator;->hasNext()Z

    move-result v36

    if-eqz v36, :cond_1d

    invoke-interface/range {v34 .. v34}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v36

    move-object/from16 v38, v2

    move-object/from16 v2, v36

    check-cast v2, Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-object/from16 v36, v3

    move/from16 p3, v4

    iget-wide v3, v2, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    cmp-long v39, v32, v3

    if-ltz v39, :cond_1b

    iget-wide v2, v2, Lcn/hongguo/tv/Mp4SampleTransform$Box;->end:J

    move/from16 v39, v5

    int-to-long v4, v1

    sub-long/2addr v2, v4

    cmp-long v4, v32, v2

    if-gtz v4, :cond_1c

    const/16 v35, 0x1

    goto :goto_13

    :cond_1b
    move/from16 v39, v5

    :cond_1c
    :goto_13
    move/from16 v4, p3

    move-object/from16 v3, v36

    move-object/from16 v2, v38

    move/from16 v5, v39

    goto :goto_12

    .line 148
    :cond_1d
    move-object/from16 v38, v2

    move-object/from16 v36, v3

    move/from16 p3, v4

    move/from16 v39, v5

    if-eqz v35, :cond_26

    .line 149
    const/16 v2, 0x10

    new-array v2, v2, [B

    int-to-long v3, v6

    add-long v3, v21, v3

    .line 150
    const/4 v5, 0x7

    :goto_14
    if-ltz v5, :cond_1e

    move/from16 v34, v6

    long-to-int v6, v3

    int-to-byte v6, v6

    aput-byte v6, v2, v5

    ushr-long v3, v3, v17

    add-int/lit8 v5, v5, -0x1

    move/from16 v6, v34

    goto :goto_14

    .line 151
    :cond_1e
    move/from16 v34, v6

    new-instance v3, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v3, v2}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    const/4 v2, 0x2

    invoke-virtual {v7, v2, v11, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 152
    const/4 v2, 0x0

    const/4 v6, 0x0

    .line 153
    :goto_15
    if-ge v2, v1, :cond_1f

    .line 154
    invoke-static {}, Lcn/hongguo/tv/Mp4SampleTransform;->cancel()V

    move-object/from16 v5, p4

    array-length v3, v5

    sub-int v4, v1, v2

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    move/from16 v35, v10

    move-object/from16 v40, v11

    int-to-long v10, v2

    add-long v10, v32, v10

    invoke-virtual {v0, v10, v11}, Ljava/io/RandomAccessFile;->seek(J)V

    const/4 v10, 0x0

    invoke-virtual {v0, v5, v10, v4}, Ljava/io/RandomAccessFile;->readFully([BII)V

    add-int v11, v2, v4

    .line 155
    const/4 v3, 0x0

    const/16 v16, 0x0

    move v2, v1

    move-object v1, v7

    move v10, v2

    move-object/from16 v2, p4

    move-object/from16 v41, v25

    move-object/from16 v25, v36

    move/from16 v43, p3

    move-object/from16 v42, v26

    move/from16 v44, v27

    move/from16 v26, v39

    move-object/from16 v5, p5

    move/from16 p1, v11

    move/from16 v27, v34

    move-object/from16 v34, v37

    const/16 v36, 0x1

    move v11, v6

    move/from16 v6, v16

    invoke-virtual/range {v1 .. v6}, Ljavax/crypto/Cipher;->update([BII[BI)I

    move-result v1

    int-to-long v2, v11

    add-long v2, v32, v2

    invoke-virtual {v0, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    const/4 v2, 0x0

    invoke-virtual {v0, v8, v2, v1}, Ljava/io/RandomAccessFile;->write([BII)V

    add-int v6, v11, v1

    .line 156
    move/from16 v2, p1

    move v1, v10

    move-object/from16 v36, v25

    move/from16 v10, v35

    move-object/from16 v11, v40

    move-object/from16 v25, v41

    move-object/from16 v26, v42

    move/from16 v34, v27

    move/from16 v27, v44

    goto :goto_15

    .line 157
    :cond_1f
    move/from16 v43, p3

    move/from16 v35, v10

    move-object/from16 v40, v11

    move-object/from16 v41, v25

    move-object/from16 v42, v26

    move/from16 v44, v27

    move/from16 v27, v34

    move-object/from16 v25, v36

    move-object/from16 v34, v37

    move/from16 v26, v39

    const/4 v2, 0x0

    const/16 v36, 0x1

    move v10, v1

    move v11, v6

    invoke-virtual {v7, v8, v2}, Ljavax/crypto/Cipher;->doFinal([BI)I

    move-result v1

    int-to-long v3, v11

    add-long v3, v32, v3

    invoke-virtual {v0, v3, v4}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-virtual {v0, v8, v2, v1}, Ljava/io/RandomAccessFile;->write([BII)V

    add-int v6, v11, v1

    .line 158
    if-ne v6, v10, :cond_25

    .line 159
    move/from16 v3, v44

    if-eqz v3, :cond_24

    .line 160
    int-to-long v4, v10

    add-long v4, v32, v4

    move/from16 v44, v3

    move-wide/from16 v2, v32

    .line 161
    :goto_16
    cmp-long v1, v2, v4

    if-gez v1, :cond_23

    .line 162
    sub-long v45, v4, v2

    move-object/from16 p1, v7

    move/from16 v6, v44

    int-to-long v7, v6

    const-string v1, "Invalid video sample framing"

    cmp-long v11, v45, v7

    if-ltz v11, :cond_22

    .line 163
    invoke-virtual {v0, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    move-wide/from16 v44, v28

    const/4 v11, 0x0

    :goto_17
    if-ge v11, v6, :cond_20

    shl-long v44, v44, v17

    move/from16 v16, v6

    invoke-virtual/range {p0 .. p0}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v6

    move/from16 p3, v13

    move/from16 v37, v14

    int-to-long v13, v6

    or-long v44, v44, v13

    add-int/lit8 v11, v11, 0x1

    move/from16 v13, p3

    move/from16 v6, v16

    move/from16 v14, v37

    goto :goto_17

    .line 164
    :cond_20
    move/from16 v16, v6

    move/from16 p3, v13

    move/from16 v37, v14

    add-long/2addr v2, v7

    cmp-long v6, v44, v19

    if-ltz v6, :cond_21

    sub-long v6, v4, v2

    cmp-long v8, v44, v6

    if-gtz v8, :cond_21

    add-long v2, v2, v44

    .line 165
    move-object/from16 v7, p1

    move/from16 v13, p3

    move-object/from16 v8, p5

    move/from16 v44, v16

    move/from16 v14, v37

    goto :goto_16

    .line 164
    :cond_21
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 162
    :cond_22
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 161
    :cond_23
    move-object/from16 p1, v7

    move/from16 p3, v13

    move/from16 v37, v14

    move/from16 v16, v44

    goto :goto_18

    .line 159
    :cond_24
    move/from16 v16, v3

    move-object/from16 p1, v7

    move/from16 p3, v13

    move/from16 v37, v14

    .line 167
    :goto_18
    int-to-long v1, v10

    add-long v32, v32, v1

    add-int/lit8 v6, v27, 0x1

    .line 144
    add-int/lit8 v5, v26, 0x1

    move-object/from16 v7, p1

    move/from16 v13, p3

    move-object/from16 v8, p5

    move/from16 v27, v16

    move-object/from16 v3, v25

    move/from16 v10, v35

    move/from16 v14, v37

    move-object/from16 v2, v38

    move-object/from16 v11, v40

    move-object/from16 v25, v41

    move-object/from16 v26, v42

    move/from16 v36, v43

    move-object/from16 v37, v34

    goto/16 :goto_11

    .line 158
    :cond_25
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Sample output length mismatch"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 148
    :cond_26
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Sample outside media data"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 145
    :cond_27
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Chunk mapping exceeds samples"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 141
    :cond_28
    move-object/from16 v38, v2

    move-object/from16 p1, v7

    move/from16 v35, v10

    move-object/from16 v40, v11

    move/from16 p3, v13

    move-object/from16 v41, v25

    move-object/from16 v42, v26

    move/from16 v16, v27

    move/from16 v43, v36

    move-object/from16 v34, v37

    const/16 v36, 0x1

    move-object/from16 v25, v3

    move/from16 v27, v6

    move/from16 v37, v14

    add-int/lit8 v12, v12, 0x1

    move/from16 v4, p3

    move-object/from16 v8, p5

    move/from16 v1, v27

    move/from16 v32, v37

    move-object/from16 v25, v41

    move/from16 v36, v43

    move/from16 v27, v16

    move-object/from16 v37, v34

    goto/16 :goto_f

    .line 170
    :cond_29
    move-object/from16 v41, v25

    move-object/from16 v42, v26

    move/from16 v43, v36

    move/from16 v2, v43

    if-ne v1, v2, :cond_2e

    .line 171
    move-object/from16 v2, v24

    move-object/from16 v3, v31

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2a

    iget v2, v9, Lcn/hongguo/tv/Mp4SampleTransform$Result;->videoSamples:I

    add-int/2addr v2, v1

    iput v2, v9, Lcn/hongguo/tv/Mp4SampleTransform$Result;->videoSamples:I

    goto :goto_19

    :cond_2a
    iget v2, v9, Lcn/hongguo/tv/Mp4SampleTransform$Result;->audioSamples:I

    add-int/2addr v2, v1

    iput v2, v9, Lcn/hongguo/tv/Mp4SampleTransform$Result;->audioSamples:I

    .line 172
    :goto_19
    move-object/from16 v2, v30

    move-object/from16 v1, v42

    invoke-static {v0, v1, v2, v9}, Lcn/hongguo/tv/Mp4SampleTransform;->patch(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;Ljava/lang/String;Lcn/hongguo/tv/Mp4SampleTransform$Result;)V

    const-string v1, "free"

    move-object/from16 v2, v18

    invoke-static {v0, v2, v1, v9}, Lcn/hongguo/tv/Mp4SampleTransform;->patch(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;Ljava/lang/String;Lcn/hongguo/tv/Mp4SampleTransform$Result;)V

    .line 173
    invoke-interface/range {v23 .. v23}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcn/hongguo/tv/Mp4SampleTransform$Box;

    iget-object v4, v3, Lcn/hongguo/tv/Mp4SampleTransform$Box;->type:Ljava/lang/String;

    move-object/from16 v5, v41

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2b

    iget-object v4, v3, Lcn/hongguo/tv/Mp4SampleTransform$Box;->type:Ljava/lang/String;

    const-string v6, "saiz"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2b

    iget-object v4, v3, Lcn/hongguo/tv/Mp4SampleTransform$Box;->type:Ljava/lang/String;

    const-string v6, "saio"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2c

    :cond_2b
    invoke-static {v0, v3, v1, v9}, Lcn/hongguo/tv/Mp4SampleTransform;->patch(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;Ljava/lang/String;Lcn/hongguo/tv/Mp4SampleTransform$Result;)V

    :cond_2c
    move-object/from16 v41, v5

    goto :goto_1a

    .line 174
    :cond_2d
    return-void

    .line 170
    :cond_2e
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Incomplete sample mapping"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 125
    :cond_2f
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid sample count or size"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 120
    :cond_30
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Unsupported IV table"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 118
    :cond_31
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Unsupported sample encryption layout"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 103
    :cond_32
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid sample description"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 102
    :cond_33
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Multiple sample descriptions unsupported"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 97
    :cond_34
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid handler"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static transform(Ljava/io/File;Ljava/io/File;[B)Lcn/hongguo/tv/Mp4SampleTransform$Result;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 65
    move-object/from16 v0, p2

    array-length v1, v0

    const/16 v2, 0x10

    if-ne v1, v2, :cond_e

    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_e

    .line 66
    new-instance v8, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".partial"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v8, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 67
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_d

    invoke-virtual {v8}, Ljava/io/File;->createNewFile()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 68
    nop

    .line 69
    new-instance v9, Lcn/hongguo/tv/Mp4SampleTransform$Result;

    invoke-direct {v9}, Lcn/hongguo/tv/Mp4SampleTransform$Result;-><init>()V

    .line 70
    const/high16 v1, 0x10000

    new-array v10, v1, [B

    const v1, 0x10010

    new-array v11, v1, [B

    .line 72
    const/4 v12, 0x0

    :try_start_0
    new-instance v13, Ljava/io/RandomAccessFile;

    const-string v1, "r"

    move-object/from16 v2, p0

    invoke-direct {v13, v2, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    :try_start_1
    new-instance v14, Ljava/io/RandomAccessFile;

    const-string v1, "rw"

    invoke-direct {v14, v8, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 73
    :try_start_2
    invoke-virtual {v13}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v1

    iput-wide v1, v9, Lcn/hongguo/tv/Mp4SampleTransform$Result;->fileBytes:J

    .line 74
    iget-wide v1, v9, Lcn/hongguo/tv/Mp4SampleTransform$Result;->fileBytes:J

    const-wide/16 v3, 0x20

    cmp-long v5, v1, v3

    if-ltz v5, :cond_b

    iget-wide v1, v9, Lcn/hongguo/tv/Mp4SampleTransform$Result;->fileBytes:J

    const-wide/32 v3, 0x10000000

    cmp-long v5, v1, v3

    if-gtz v5, :cond_b

    .line 75
    :goto_0
    invoke-virtual {v13, v10}, Ljava/io/RandomAccessFile;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    invoke-static {}, Lcn/hongguo/tv/Mp4SampleTransform;->cancel()V

    invoke-virtual {v14, v10, v12, v1}, Ljava/io/RandomAccessFile;->write([BII)V

    goto :goto_0

    .line 76
    :cond_0
    invoke-virtual {v14}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    invoke-static {v14, v3, v4, v1, v2}, Lcn/hongguo/tv/Mp4SampleTransform;->boxes(Ljava/io/RandomAccessFile;JJ)Ljava/util/List;

    move-result-object v1

    .line 77
    const-string v2, "moof"

    invoke-static {v1, v2}, Lcn/hongguo/tv/Mp4SampleTransform;->optional(Ljava/util/List;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v2

    if-nez v2, :cond_a

    .line 78
    const-string v2, "moov"

    invoke-static {v1, v2}, Lcn/hongguo/tv/Mp4SampleTransform;->one(Ljava/util/List;Ljava/lang/String;)Lcn/hongguo/tv/Mp4SampleTransform$Box;

    move-result-object v2

    .line 79
    iget-wide v3, v2, Lcn/hongguo/tv/Mp4SampleTransform$Box;->end:J

    iget-wide v5, v2, Lcn/hongguo/tv/Mp4SampleTransform$Box;->start:J

    sub-long/2addr v3, v5

    const-wide/32 v5, 0x400000

    cmp-long v7, v3, v5

    if-gtz v7, :cond_9

    .line 80
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcn/hongguo/tv/Mp4SampleTransform$Box;

    iget-object v4, v3, Lcn/hongguo/tv/Mp4SampleTransform$Box;->type:Ljava/lang/String;

    const-string v5, "mdat"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v15, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 81
    :cond_2
    invoke-virtual {v15}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_8

    .line 82
    nop

    .line 83
    iget-wide v3, v2, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    iget-wide v1, v2, Lcn/hongguo/tv/Mp4SampleTransform$Box;->end:J

    invoke-static {v14, v3, v4, v1, v2}, Lcn/hongguo/tv/Mp4SampleTransform;->boxes(Ljava/io/RandomAccessFile;JJ)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v16

    const/4 v1, 0x0

    :goto_2
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcn/hongguo/tv/Mp4SampleTransform$Box;

    iget-object v3, v2, Lcn/hongguo/tv/Mp4SampleTransform$Box;->type:Ljava/lang/String;

    const-string v4, "trak"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 84
    add-int/lit8 v7, v1, 0x1

    const/4 v1, 0x4

    if-gt v7, v1, :cond_3

    .line 85
    move-object v1, v14

    move-object v3, v15

    move-object/from16 v4, p2

    move-object v5, v10

    move-object v6, v11

    move/from16 v17, v7

    move-object v7, v9

    invoke-static/range {v1 .. v7}, Lcn/hongguo/tv/Mp4SampleTransform;->processTrack(Ljava/io/RandomAccessFile;Lcn/hongguo/tv/Mp4SampleTransform$Box;Ljava/util/List;[B[B[BLcn/hongguo/tv/Mp4SampleTransform$Result;)V

    move/from16 v1, v17

    goto :goto_3

    .line 84
    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Too many MP4 tracks"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 83
    :cond_4
    :goto_3
    goto :goto_2

    .line 87
    :cond_5
    iget v0, v9, Lcn/hongguo/tv/Mp4SampleTransform$Result;->videoSamples:I

    if-eqz v0, :cond_7

    .line 88
    invoke-virtual {v14}, Ljava/io/RandomAccessFile;->getFD()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/FileDescriptor;->sync()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 89
    :try_start_3
    invoke-virtual {v14}, Ljava/io/RandomAccessFile;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :try_start_4
    invoke-virtual {v13}, Ljava/io/RandomAccessFile;->close()V

    .line 90
    move-object/from16 v0, p1

    invoke-virtual {v8, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    if-eqz v0, :cond_6

    .line 91
    nop

    .line 92
    invoke-static {v10, v12}, Ljava/util/Arrays;->fill([BB)V

    invoke-static {v11, v12}, Ljava/util/Arrays;->fill([BB)V

    .line 91
    return-object v9

    .line 90
    :cond_6
    :try_start_5
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot commit processed media"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 87
    :cond_7
    :try_start_6
    new-instance v0, Ljava/io/IOException;

    const-string v1, "No supported encrypted video samples"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_8
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Missing media data"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 79
    :cond_9
    new-instance v0, Ljava/io/IOException;

    const-string v1, "MP4 metadata outside budget"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_a
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Fragmented MP4 is not supported"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 74
    :cond_b
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Media file outside budget"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 72
    :catchall_0
    move-exception v0

    move-object v1, v0

    :try_start_7
    invoke-virtual {v14}, Ljava/io/RandomAccessFile;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_4

    :catchall_1
    move-exception v0

    move-object v2, v0

    :try_start_8
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_4
    throw v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :catchall_2
    move-exception v0

    move-object v1, v0

    :try_start_9
    invoke-virtual {v13}, Ljava/io/RandomAccessFile;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    goto :goto_5

    :catchall_3
    move-exception v0

    move-object v2, v0

    :try_start_a
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_5
    throw v1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 92
    :catchall_4
    move-exception v0

    invoke-static {v10, v12}, Ljava/util/Arrays;->fill([BB)V

    invoke-static {v11, v12}, Ljava/util/Arrays;->fill([BB)V

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_c

    invoke-virtual {v8}, Ljava/io/File;->delete()Z

    move-result v1

    if-nez v1, :cond_c

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot remove failed media partial"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    throw v0

    .line 67
    :cond_d
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Output already exists"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 65
    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid transform input"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static u32(Ljava/io/RandomAccessFile;)J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 43
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->readInt()I

    move-result p0

    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

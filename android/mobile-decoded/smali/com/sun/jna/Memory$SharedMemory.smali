.class Lcom/sun/jna/Memory$SharedMemory;
.super Lcom/sun/jna/Memory;
.source "Memory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sun/jna/Memory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SharedMemory"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sun/jna/Memory;


# direct methods
.method public constructor <init>(Lcom/sun/jna/Memory;JJ)V
    .locals 2
    .param p2, "offset"    # J
    .param p4, "size"    # J

    .line 211
    iput-object p1, p0, Lcom/sun/jna/Memory$SharedMemory;->this$0:Lcom/sun/jna/Memory;

    invoke-direct {p0}, Lcom/sun/jna/Memory;-><init>()V

    .line 212
    iput-wide p4, p0, Lcom/sun/jna/Memory$SharedMemory;->size:J

    .line 213
    iget-wide v0, p1, Lcom/sun/jna/Memory;->peer:J

    add-long/2addr v0, p2

    iput-wide v0, p0, Lcom/sun/jna/Memory$SharedMemory;->peer:J

    .line 214
    return-void
.end method


# virtual methods
.method protected boundsCheck(JJ)V
    .locals 5
    .param p1, "off"    # J
    .param p3, "sz"    # J

    .line 223
    iget-object v0, p0, Lcom/sun/jna/Memory$SharedMemory;->this$0:Lcom/sun/jna/Memory;

    iget-wide v1, p0, Lcom/sun/jna/Memory$SharedMemory;->peer:J

    iget-object v3, p0, Lcom/sun/jna/Memory$SharedMemory;->this$0:Lcom/sun/jna/Memory;

    iget-wide v3, v3, Lcom/sun/jna/Memory;->peer:J

    sub-long/2addr v1, v3

    add-long/2addr v1, p1

    invoke-virtual {v0, v1, v2, p3, p4}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 224
    return-void
.end method

.method protected declared-synchronized dispose()V
    .locals 2

    monitor-enter p0

    .line 218
    const-wide/16 v0, 0x0

    :try_start_0
    iput-wide v0, p0, Lcom/sun/jna/Memory$SharedMemory;->peer:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 219
    monitor-exit p0

    return-void

    .line 217
    .end local p0    # "this":Lcom/sun/jna/Memory$SharedMemory;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 227
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lcom/sun/jna/Memory;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " (shared from "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/sun/jna/Memory$SharedMemory;->this$0:Lcom/sun/jna/Memory;

    invoke-virtual {v1}, Lcom/sun/jna/Memory;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

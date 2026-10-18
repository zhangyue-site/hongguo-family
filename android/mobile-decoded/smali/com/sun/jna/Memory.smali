.class public Lcom/sun/jna/Memory;
.super Lcom/sun/jna/Pointer;
.source "Memory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sun/jna/Memory$SharedMemory;,
        Lcom/sun/jna/Memory$LinkedReference;
    }
.end annotation


# static fields
.field private static HEAD:Lcom/sun/jna/Memory$LinkedReference;

.field private static QUEUE:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue<",
            "Lcom/sun/jna/Memory;",
            ">;"
        }
    .end annotation
.end field

.field private static final buffers:Lcom/sun/jna/WeakMemoryHolder;


# instance fields
.field private final reference:Lcom/sun/jna/Memory$LinkedReference;

.field protected size:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 53
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    sput-object v0, Lcom/sun/jna/Memory;->QUEUE:Ljava/lang/ref/ReferenceQueue;

    .line 129
    new-instance v0, Lcom/sun/jna/WeakMemoryHolder;

    invoke-direct {v0}, Lcom/sun/jna/WeakMemoryHolder;-><init>()V

    sput-object v0, Lcom/sun/jna/Memory;->buffers:Lcom/sun/jna/WeakMemoryHolder;

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .line 249
    invoke-direct {p0}, Lcom/sun/jna/Pointer;-><init>()V

    .line 251
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/jna/Memory;->reference:Lcom/sun/jna/Memory$LinkedReference;

    .line 252
    return-void
.end method

.method public constructor <init>(J)V
    .locals 5
    .param p1, "size"    # J

    .line 236
    invoke-direct {p0}, Lcom/sun/jna/Pointer;-><init>()V

    .line 237
    iput-wide p1, p0, Lcom/sun/jna/Memory;->size:J

    .line 238
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_1

    .line 241
    invoke-static {p1, p2}, Lcom/sun/jna/Memory;->malloc(J)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/sun/jna/Memory;->peer:J

    .line 242
    iget-wide v2, p0, Lcom/sun/jna/Memory;->peer:J

    cmp-long v4, v2, v0

    if-eqz v4, :cond_0

    .line 245
    invoke-static {p0}, Lcom/sun/jna/Memory$LinkedReference;->track(Lcom/sun/jna/Memory;)Lcom/sun/jna/Memory$LinkedReference;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/jna/Memory;->reference:Lcom/sun/jna/Memory$LinkedReference;

    .line 246
    return-void

    .line 243
    :cond_0
    new-instance v0, Ljava/lang/OutOfMemoryError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot allocate "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " bytes"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/OutOfMemoryError;-><init>(Ljava/lang/String;)V

    throw v0

    .line 239
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Allocation size must be greater than zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic access$000()Ljava/lang/ref/ReferenceQueue;
    .locals 1

    .line 51
    sget-object v0, Lcom/sun/jna/Memory;->QUEUE:Ljava/lang/ref/ReferenceQueue;

    return-object v0
.end method

.method static synthetic access$100()Lcom/sun/jna/Memory$LinkedReference;
    .locals 1

    .line 51
    sget-object v0, Lcom/sun/jna/Memory;->HEAD:Lcom/sun/jna/Memory$LinkedReference;

    return-object v0
.end method

.method static synthetic access$102(Lcom/sun/jna/Memory$LinkedReference;)Lcom/sun/jna/Memory$LinkedReference;
    .locals 0
    .param p0, "x0"    # Lcom/sun/jna/Memory$LinkedReference;

    .line 51
    sput-object p0, Lcom/sun/jna/Memory;->HEAD:Lcom/sun/jna/Memory$LinkedReference;

    return-object p0
.end method

.method public static disposeAll()V
    .locals 5

    .line 140
    const-class v0, Lcom/sun/jna/Memory$LinkedReference;

    monitor-enter v0

    .line 143
    :goto_0
    :try_start_0
    sget-object v1, Lcom/sun/jna/Memory;->HEAD:Lcom/sun/jna/Memory$LinkedReference;

    move-object v2, v1

    .local v2, "entry":Lcom/sun/jna/Memory$LinkedReference;
    if-eqz v1, :cond_2

    .line 144
    sget-object v1, Lcom/sun/jna/Memory;->HEAD:Lcom/sun/jna/Memory$LinkedReference;

    invoke-virtual {v1}, Lcom/sun/jna/Memory$LinkedReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sun/jna/Memory;

    .line 146
    .local v1, "memory":Lcom/sun/jna/Memory;
    if-eqz v1, :cond_0

    .line 148
    invoke-virtual {v1}, Lcom/sun/jna/Memory;->dispose()V

    goto :goto_1

    .line 150
    :cond_0
    sget-object v3, Lcom/sun/jna/Memory;->HEAD:Lcom/sun/jna/Memory$LinkedReference;

    invoke-static {v3}, Lcom/sun/jna/Memory$LinkedReference;->access$200(Lcom/sun/jna/Memory$LinkedReference;)V

    .line 153
    :goto_1
    sget-object v3, Lcom/sun/jna/Memory;->HEAD:Lcom/sun/jna/Memory$LinkedReference;

    if-eq v3, v2, :cond_1

    .line 156
    .end local v1    # "memory":Lcom/sun/jna/Memory;
    goto :goto_0

    .line 154
    .restart local v1    # "memory":Lcom/sun/jna/Memory;
    :cond_1
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "the HEAD did not change"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 157
    .end local v1    # "memory":Lcom/sun/jna/Memory;
    .end local v2    # "entry":Lcom/sun/jna/Memory$LinkedReference;
    :cond_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 159
    sget-object v1, Lcom/sun/jna/Memory;->QUEUE:Ljava/lang/ref/ReferenceQueue;

    monitor-enter v1

    .line 163
    :goto_2
    :try_start_1
    sget-object v0, Lcom/sun/jna/Memory;->QUEUE:Ljava/lang/ref/ReferenceQueue;

    invoke-virtual {v0}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v0

    check-cast v0, Lcom/sun/jna/Memory$LinkedReference;

    move-object v2, v0

    .local v2, "stale":Lcom/sun/jna/Memory$LinkedReference;
    if-eqz v0, :cond_3

    .line 164
    invoke-static {v2}, Lcom/sun/jna/Memory$LinkedReference;->access$200(Lcom/sun/jna/Memory$LinkedReference;)V

    goto :goto_2

    .line 166
    .end local v2    # "stale":Lcom/sun/jna/Memory$LinkedReference;
    :cond_3
    monitor-exit v1

    .line 167
    return-void

    .line 166
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 157
    :catchall_1
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method

.method protected static free(J)V
    .locals 3
    .param p0, "p"    # J

    .line 880
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-eqz v2, :cond_0

    .line 881
    invoke-static {p0, p1}, Lcom/sun/jna/Native;->free(J)V

    .line 883
    :cond_0
    return-void
.end method

.method static integrityCheck()I
    .locals 7

    .line 175
    const-class v0, Lcom/sun/jna/Memory$LinkedReference;

    monitor-enter v0

    .line 176
    :try_start_0
    sget-object v1, Lcom/sun/jna/Memory;->HEAD:Lcom/sun/jna/Memory$LinkedReference;

    if-nez v1, :cond_0

    .line 177
    monitor-exit v0

    const/4 v0, 0x0

    return v0

    .line 180
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 181
    .local v1, "entries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/sun/jna/Memory$LinkedReference;>;"
    sget-object v2, Lcom/sun/jna/Memory;->HEAD:Lcom/sun/jna/Memory$LinkedReference;

    .line 183
    .local v2, "entry":Lcom/sun/jna/Memory$LinkedReference;
    :goto_0
    if-eqz v2, :cond_1

    .line 184
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 185
    invoke-static {v2}, Lcom/sun/jna/Memory$LinkedReference;->access$300(Lcom/sun/jna/Memory$LinkedReference;)Lcom/sun/jna/Memory$LinkedReference;

    move-result-object v3

    move-object v2, v3

    goto :goto_0

    .line 188
    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    .line 189
    .local v3, "index":I
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/sun/jna/Memory$LinkedReference;

    move-object v2, v4

    .line 191
    :goto_1
    if-eqz v2, :cond_3

    .line 192
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v2, :cond_2

    .line 196
    invoke-static {v2}, Lcom/sun/jna/Memory$LinkedReference;->access$400(Lcom/sun/jna/Memory$LinkedReference;)Lcom/sun/jna/Memory$LinkedReference;

    move-result-object v4

    move-object v2, v4

    .line 197
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 193
    :cond_2
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " vs. "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " at index "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 200
    :cond_3
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    monitor-exit v0

    return v4

    .line 201
    .end local v1    # "entries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/sun/jna/Memory$LinkedReference;>;"
    .end local v2    # "entry":Lcom/sun/jna/Memory$LinkedReference;
    .end local v3    # "index":I
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected static malloc(J)J
    .locals 2
    .param p0, "size"    # J

    .line 886
    invoke-static {p0, p1}, Lcom/sun/jna/Native;->malloc(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static purge()V
    .locals 1

    .line 135
    sget-object v0, Lcom/sun/jna/Memory;->buffers:Lcom/sun/jna/WeakMemoryHolder;

    invoke-virtual {v0}, Lcom/sun/jna/WeakMemoryHolder;->clean()V

    .line 136
    return-void
.end method

.method private shareReferenceIfInBounds(Lcom/sun/jna/Pointer;)Lcom/sun/jna/Pointer;
    .locals 5
    .param p1, "target"    # Lcom/sun/jna/Pointer;

    .line 905
    if-nez p1, :cond_0

    .line 906
    const/4 v0, 0x0

    return-object v0

    .line 908
    :cond_0
    iget-wide v0, p1, Lcom/sun/jna/Pointer;->peer:J

    iget-wide v2, p0, Lcom/sun/jna/Memory;->peer:J

    sub-long/2addr v0, v2

    .line 909
    .local v0, "offset":J
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-ltz v4, :cond_1

    iget-wide v2, p0, Lcom/sun/jna/Memory;->size:J

    cmp-long v4, v0, v2

    if-gez v4, :cond_1

    .line 910
    invoke-virtual {p0, v0, v1}, Lcom/sun/jna/Memory;->share(J)Lcom/sun/jna/Pointer;

    move-result-object v2

    return-object v2

    .line 912
    :cond_1
    return-object p1
.end method


# virtual methods
.method public align(I)Lcom/sun/jna/Memory;
    .locals 10
    .param p1, "byteBoundary"    # I

    .line 287
    if-lez p1, :cond_4

    .line 290
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x20

    if-ge v0, v1, :cond_3

    .line 291
    const/4 v1, 0x1

    shl-int/2addr v1, v0

    if-ne p1, v1, :cond_2

    .line 292
    int-to-long v1, p1

    const-wide/16 v3, 0x1

    sub-long/2addr v1, v3

    not-long v1, v1

    .line 294
    .local v1, "mask":J
    iget-wide v5, p0, Lcom/sun/jna/Memory;->peer:J

    and-long/2addr v5, v1

    iget-wide v7, p0, Lcom/sun/jna/Memory;->peer:J

    cmp-long v9, v5, v7

    if-eqz v9, :cond_1

    .line 295
    iget-wide v5, p0, Lcom/sun/jna/Memory;->peer:J

    int-to-long v7, p1

    add-long/2addr v5, v7

    sub-long/2addr v5, v3

    and-long v3, v5, v1

    .line 296
    .local v3, "newPeer":J
    iget-wide v5, p0, Lcom/sun/jna/Memory;->peer:J

    iget-wide v7, p0, Lcom/sun/jna/Memory;->size:J

    add-long/2addr v5, v7

    sub-long/2addr v5, v3

    .line 297
    .local v5, "newSize":J
    const-wide/16 v7, 0x0

    cmp-long v9, v5, v7

    if-lez v9, :cond_0

    .line 300
    iget-wide v7, p0, Lcom/sun/jna/Memory;->peer:J

    sub-long v7, v3, v7

    invoke-virtual {p0, v7, v8, v5, v6}, Lcom/sun/jna/Memory;->share(JJ)Lcom/sun/jna/Pointer;

    move-result-object v7

    check-cast v7, Lcom/sun/jna/Memory;

    return-object v7

    .line 298
    :cond_0
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "Insufficient memory to align to the requested boundary"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 302
    .end local v3    # "newPeer":J
    .end local v5    # "newSize":J
    :cond_1
    return-object p0

    .line 290
    .end local v1    # "mask":J
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 305
    .end local v0    # "i":I
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Byte boundary must be a power of two"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 288
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Byte boundary must be positive: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected boundsCheck(JJ)V
    .locals 5
    .param p1, "off"    # J
    .param p3, "sz"    # J

    .line 351
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_1

    .line 354
    add-long v0, p1, p3

    iget-wide v2, p0, Lcom/sun/jna/Memory;->size:J

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    .line 359
    return-void

    .line 355
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Bounds exceeds available space : size="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/sun/jna/Memory;->size:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", offset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-long v1, p1, p3

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 357
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1, v0}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 352
    .end local v0    # "msg":Ljava/lang/String;
    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid offset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public clear()V
    .locals 2

    .line 333
    iget-wide v0, p0, Lcom/sun/jna/Memory;->size:J

    invoke-virtual {p0, v0, v1}, Lcom/sun/jna/Memory;->clear(J)V

    .line 334
    return-void
.end method

.method protected declared-synchronized dispose()V
    .locals 5

    monitor-enter p0

    .line 316
    :try_start_0
    iget-wide v0, p0, Lcom/sun/jna/Memory;->peer:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    .line 318
    monitor-exit p0

    return-void

    .line 322
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/sun/jna/Memory;->peer:J

    invoke-static {v0, v1}, Lcom/sun/jna/Memory;->free(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 324
    :try_start_2
    iput-wide v2, p0, Lcom/sun/jna/Memory;->peer:J

    .line 327
    iget-object v0, p0, Lcom/sun/jna/Memory;->reference:Lcom/sun/jna/Memory$LinkedReference;

    invoke-static {v0}, Lcom/sun/jna/Memory$LinkedReference;->access$200(Lcom/sun/jna/Memory$LinkedReference;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 328
    nop

    .line 329
    monitor-exit p0

    return-void

    .line 324
    .end local p0    # "this":Lcom/sun/jna/Memory;
    :catchall_0
    move-exception v0

    :try_start_3
    iput-wide v2, p0, Lcom/sun/jna/Memory;->peer:J

    .line 327
    iget-object v1, p0, Lcom/sun/jna/Memory;->reference:Lcom/sun/jna/Memory$LinkedReference;

    invoke-static {v1}, Lcom/sun/jna/Memory$LinkedReference;->access$200(Lcom/sun/jna/Memory$LinkedReference;)V

    .line 328
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 315
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public dump()Ljava/lang/String;
    .locals 4

    .line 891
    invoke-virtual {p0}, Lcom/sun/jna/Memory;->size()J

    move-result-wide v0

    long-to-int v1, v0

    const-wide/16 v2, 0x0

    invoke-virtual {p0, v2, v3, v1}, Lcom/sun/jna/Memory;->dump(JI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected finalize()V
    .locals 0

    .line 311
    invoke-virtual {p0}, Lcom/sun/jna/Memory;->dispose()V

    .line 312
    return-void
.end method

.method public getByte(J)B
    .locals 2
    .param p1, "offset"    # J

    .line 607
    const-wide/16 v0, 0x1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 608
    invoke-super {p0, p1, p2}, Lcom/sun/jna/Pointer;->getByte(J)B

    move-result v0

    return v0
.end method

.method public getByteBuffer(JJ)Ljava/nio/ByteBuffer;
    .locals 2
    .param p1, "offset"    # J
    .param p3, "length"    # J

    .line 723
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 724
    invoke-super {p0, p1, p2, p3, p4}, Lcom/sun/jna/Pointer;->getByteBuffer(JJ)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 727
    .local v0, "b":Ljava/nio/ByteBuffer;
    sget-object v1, Lcom/sun/jna/Memory;->buffers:Lcom/sun/jna/WeakMemoryHolder;

    invoke-virtual {v1, v0, p0}, Lcom/sun/jna/WeakMemoryHolder;->put(Ljava/lang/Object;Lcom/sun/jna/Memory;)V

    .line 728
    return-object v0
.end method

.method public getChar(J)C
    .locals 2
    .param p1, "offset"    # J

    .line 621
    sget v0, Lcom/sun/jna/Native;->WCHAR_SIZE:I

    int-to-long v0, v0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 622
    invoke-super {p0, p1, p2}, Lcom/sun/jna/Pointer;->getChar(J)C

    move-result v0

    return v0
.end method

.method public getDouble(J)D
    .locals 2
    .param p1, "offset"    # J

    .line 691
    const-wide/16 v0, 0x8

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 692
    invoke-super {p0, p1, p2}, Lcom/sun/jna/Pointer;->getDouble(J)D

    move-result-wide v0

    return-wide v0
.end method

.method public getFloat(J)F
    .locals 2
    .param p1, "offset"    # J

    .line 677
    const-wide/16 v0, 0x4

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 678
    invoke-super {p0, p1, p2}, Lcom/sun/jna/Pointer;->getFloat(J)F

    move-result v0

    return v0
.end method

.method public getInt(J)I
    .locals 2
    .param p1, "offset"    # J

    .line 649
    const-wide/16 v0, 0x4

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 650
    invoke-super {p0, p1, p2}, Lcom/sun/jna/Pointer;->getInt(J)I

    move-result v0

    return v0
.end method

.method public getLong(J)J
    .locals 2
    .param p1, "offset"    # J

    .line 663
    const-wide/16 v0, 0x8

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 664
    invoke-super {p0, p1, p2}, Lcom/sun/jna/Pointer;->getLong(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getPointer(J)Lcom/sun/jna/Pointer;
    .locals 2
    .param p1, "offset"    # J

    .line 705
    sget v0, Lcom/sun/jna/Native;->POINTER_SIZE:I

    int-to-long v0, v0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 706
    invoke-super {p0, p1, p2}, Lcom/sun/jna/Pointer;->getPointer(J)Lcom/sun/jna/Pointer;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/sun/jna/Memory;->shareReferenceIfInBounds(Lcom/sun/jna/Pointer;)Lcom/sun/jna/Pointer;

    move-result-object v0

    return-object v0
.end method

.method public getShort(J)S
    .locals 2
    .param p1, "offset"    # J

    .line 635
    const-wide/16 v0, 0x2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 636
    invoke-super {p0, p1, p2}, Lcom/sun/jna/Pointer;->getShort(J)S

    move-result v0

    return v0
.end method

.method public getString(JLjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "offset"    # J
    .param p3, "encoding"    # Ljava/lang/String;

    .line 734
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 735
    invoke-super {p0, p1, p2, p3}, Lcom/sun/jna/Pointer;->getString(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getWideString(J)Ljava/lang/String;
    .locals 2
    .param p1, "offset"    # J

    .line 741
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 742
    invoke-super {p0, p1, p2}, Lcom/sun/jna/Pointer;->getWideString(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public read(J[BII)V
    .locals 4
    .param p1, "bOff"    # J
    .param p3, "buf"    # [B
    .param p4, "index"    # I
    .param p5, "length"    # I

    .line 375
    int-to-long v0, p5

    const-wide/16 v2, 0x1

    mul-long v0, v0, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 376
    invoke-super/range {p0 .. p5}, Lcom/sun/jna/Pointer;->read(J[BII)V

    .line 377
    return-void
.end method

.method public read(J[CII)V
    .locals 2
    .param p1, "bOff"    # J
    .param p3, "buf"    # [C
    .param p4, "index"    # I
    .param p5, "length"    # I

    .line 403
    sget v0, Lcom/sun/jna/Native;->WCHAR_SIZE:I

    mul-int v0, v0, p5

    int-to-long v0, v0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 404
    invoke-super/range {p0 .. p5}, Lcom/sun/jna/Pointer;->read(J[CII)V

    .line 405
    return-void
.end method

.method public read(J[DII)V
    .locals 4
    .param p1, "bOff"    # J
    .param p3, "buf"    # [D
    .param p4, "index"    # I
    .param p5, "length"    # I

    .line 459
    int-to-long v0, p5

    const-wide/16 v2, 0x8

    mul-long v0, v0, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 460
    invoke-super/range {p0 .. p5}, Lcom/sun/jna/Pointer;->read(J[DII)V

    .line 461
    return-void
.end method

.method public read(J[FII)V
    .locals 4
    .param p1, "bOff"    # J
    .param p3, "buf"    # [F
    .param p4, "index"    # I
    .param p5, "length"    # I

    .line 445
    int-to-long v0, p5

    const-wide/16 v2, 0x4

    mul-long v0, v0, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 446
    invoke-super/range {p0 .. p5}, Lcom/sun/jna/Pointer;->read(J[FII)V

    .line 447
    return-void
.end method

.method public read(J[III)V
    .locals 4
    .param p1, "bOff"    # J
    .param p3, "buf"    # [I
    .param p4, "index"    # I
    .param p5, "length"    # I

    .line 417
    int-to-long v0, p5

    const-wide/16 v2, 0x4

    mul-long v0, v0, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 418
    invoke-super/range {p0 .. p5}, Lcom/sun/jna/Pointer;->read(J[III)V

    .line 419
    return-void
.end method

.method public read(J[JII)V
    .locals 4
    .param p1, "bOff"    # J
    .param p3, "buf"    # [J
    .param p4, "index"    # I
    .param p5, "length"    # I

    .line 431
    int-to-long v0, p5

    const-wide/16 v2, 0x8

    mul-long v0, v0, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 432
    invoke-super/range {p0 .. p5}, Lcom/sun/jna/Pointer;->read(J[JII)V

    .line 433
    return-void
.end method

.method public read(J[Lcom/sun/jna/Pointer;II)V
    .locals 2
    .param p1, "bOff"    # J
    .param p3, "buf"    # [Lcom/sun/jna/Pointer;
    .param p4, "index"    # I
    .param p5, "length"    # I

    .line 473
    sget v0, Lcom/sun/jna/Native;->POINTER_SIZE:I

    mul-int v0, v0, p5

    int-to-long v0, v0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 474
    invoke-super/range {p0 .. p5}, Lcom/sun/jna/Pointer;->read(J[Lcom/sun/jna/Pointer;II)V

    .line 475
    return-void
.end method

.method public read(J[SII)V
    .locals 4
    .param p1, "bOff"    # J
    .param p3, "buf"    # [S
    .param p4, "index"    # I
    .param p5, "length"    # I

    .line 389
    int-to-long v0, p5

    const-wide/16 v2, 0x2

    mul-long v0, v0, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 390
    invoke-super/range {p0 .. p5}, Lcom/sun/jna/Pointer;->read(J[SII)V

    .line 391
    return-void
.end method

.method public setByte(JB)V
    .locals 2
    .param p1, "offset"    # J
    .param p3, "value"    # B

    .line 759
    const-wide/16 v0, 0x1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 760
    invoke-super {p0, p1, p2, p3}, Lcom/sun/jna/Pointer;->setByte(JB)V

    .line 761
    return-void
.end method

.method public setChar(JC)V
    .locals 2
    .param p1, "offset"    # J
    .param p3, "value"    # C

    .line 773
    sget v0, Lcom/sun/jna/Native;->WCHAR_SIZE:I

    int-to-long v0, v0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 774
    invoke-super {p0, p1, p2, p3}, Lcom/sun/jna/Pointer;->setChar(JC)V

    .line 775
    return-void
.end method

.method public setDouble(JD)V
    .locals 2
    .param p1, "offset"    # J
    .param p3, "value"    # D

    .line 843
    const-wide/16 v0, 0x8

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 844
    invoke-super {p0, p1, p2, p3, p4}, Lcom/sun/jna/Pointer;->setDouble(JD)V

    .line 845
    return-void
.end method

.method public setFloat(JF)V
    .locals 2
    .param p1, "offset"    # J
    .param p3, "value"    # F

    .line 829
    const-wide/16 v0, 0x4

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 830
    invoke-super {p0, p1, p2, p3}, Lcom/sun/jna/Pointer;->setFloat(JF)V

    .line 831
    return-void
.end method

.method public setInt(JI)V
    .locals 2
    .param p1, "offset"    # J
    .param p3, "value"    # I

    .line 801
    const-wide/16 v0, 0x4

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 802
    invoke-super {p0, p1, p2, p3}, Lcom/sun/jna/Pointer;->setInt(JI)V

    .line 803
    return-void
.end method

.method public setLong(JJ)V
    .locals 2
    .param p1, "offset"    # J
    .param p3, "value"    # J

    .line 815
    const-wide/16 v0, 0x8

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 816
    invoke-super {p0, p1, p2, p3, p4}, Lcom/sun/jna/Pointer;->setLong(JJ)V

    .line 817
    return-void
.end method

.method public setPointer(JLcom/sun/jna/Pointer;)V
    .locals 2
    .param p1, "offset"    # J
    .param p3, "value"    # Lcom/sun/jna/Pointer;

    .line 857
    sget v0, Lcom/sun/jna/Native;->POINTER_SIZE:I

    int-to-long v0, v0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 858
    invoke-super {p0, p1, p2, p3}, Lcom/sun/jna/Pointer;->setPointer(JLcom/sun/jna/Pointer;)V

    .line 859
    return-void
.end method

.method public setShort(JS)V
    .locals 2
    .param p1, "offset"    # J
    .param p3, "value"    # S

    .line 787
    const-wide/16 v0, 0x2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 788
    invoke-super {p0, p1, p2, p3}, Lcom/sun/jna/Pointer;->setShort(JS)V

    .line 789
    return-void
.end method

.method public setString(JLjava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "offset"    # J
    .param p3, "value"    # Ljava/lang/String;
    .param p4, "encoding"    # Ljava/lang/String;

    .line 863
    invoke-static {p3, p4}, Lcom/sun/jna/Native;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    array-length v0, v0

    int-to-long v0, v0

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 864
    invoke-super {p0, p1, p2, p3, p4}, Lcom/sun/jna/Pointer;->setString(JLjava/lang/String;Ljava/lang/String;)V

    .line 865
    return-void
.end method

.method public setWideString(JLjava/lang/String;)V
    .locals 4
    .param p1, "offset"    # J
    .param p3, "value"    # Ljava/lang/String;

    .line 869
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    int-to-long v0, v0

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    sget v2, Lcom/sun/jna/Native;->WCHAR_SIZE:I

    int-to-long v2, v2

    mul-long v0, v0, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 870
    invoke-super {p0, p1, p2, p3}, Lcom/sun/jna/Pointer;->setWideString(JLjava/lang/String;)V

    .line 871
    return-void
.end method

.method public share(J)Lcom/sun/jna/Pointer;
    .locals 2
    .param p1, "offset"    # J

    .line 262
    invoke-virtual {p0}, Lcom/sun/jna/Memory;->size()J

    move-result-wide v0

    sub-long/2addr v0, p1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->share(JJ)Lcom/sun/jna/Pointer;

    move-result-object v0

    return-object v0
.end method

.method public share(JJ)Lcom/sun/jna/Pointer;
    .locals 7
    .param p1, "offset"    # J
    .param p3, "sz"    # J

    .line 274
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 275
    new-instance v6, Lcom/sun/jna/Memory$SharedMemory;

    move-object v0, v6

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/sun/jna/Memory$SharedMemory;-><init>(Lcom/sun/jna/Memory;JJ)V

    return-object v6
.end method

.method public size()J
    .locals 2

    .line 342
    iget-wide v0, p0, Lcom/sun/jna/Memory;->size:J

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 875
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "allocated@0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/sun/jna/Memory;->peer:J

    invoke-static {v1, v2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/sun/jna/Memory;->size:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " bytes)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public valid()Z
    .locals 5

    .line 338
    iget-wide v0, p0, Lcom/sun/jna/Memory;->peer:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public write(J[BII)V
    .locals 4
    .param p1, "bOff"    # J
    .param p3, "buf"    # [B
    .param p4, "index"    # I
    .param p5, "length"    # I

    .line 491
    int-to-long v0, p5

    const-wide/16 v2, 0x1

    mul-long v0, v0, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 492
    invoke-super/range {p0 .. p5}, Lcom/sun/jna/Pointer;->write(J[BII)V

    .line 493
    return-void
.end method

.method public write(J[CII)V
    .locals 2
    .param p1, "bOff"    # J
    .param p3, "buf"    # [C
    .param p4, "index"    # I
    .param p5, "length"    # I

    .line 519
    sget v0, Lcom/sun/jna/Native;->WCHAR_SIZE:I

    mul-int v0, v0, p5

    int-to-long v0, v0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 520
    invoke-super/range {p0 .. p5}, Lcom/sun/jna/Pointer;->write(J[CII)V

    .line 521
    return-void
.end method

.method public write(J[DII)V
    .locals 4
    .param p1, "bOff"    # J
    .param p3, "buf"    # [D
    .param p4, "index"    # I
    .param p5, "length"    # I

    .line 575
    int-to-long v0, p5

    const-wide/16 v2, 0x8

    mul-long v0, v0, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 576
    invoke-super/range {p0 .. p5}, Lcom/sun/jna/Pointer;->write(J[DII)V

    .line 577
    return-void
.end method

.method public write(J[FII)V
    .locals 4
    .param p1, "bOff"    # J
    .param p3, "buf"    # [F
    .param p4, "index"    # I
    .param p5, "length"    # I

    .line 561
    int-to-long v0, p5

    const-wide/16 v2, 0x4

    mul-long v0, v0, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 562
    invoke-super/range {p0 .. p5}, Lcom/sun/jna/Pointer;->write(J[FII)V

    .line 563
    return-void
.end method

.method public write(J[III)V
    .locals 4
    .param p1, "bOff"    # J
    .param p3, "buf"    # [I
    .param p4, "index"    # I
    .param p5, "length"    # I

    .line 533
    int-to-long v0, p5

    const-wide/16 v2, 0x4

    mul-long v0, v0, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 534
    invoke-super/range {p0 .. p5}, Lcom/sun/jna/Pointer;->write(J[III)V

    .line 535
    return-void
.end method

.method public write(J[JII)V
    .locals 4
    .param p1, "bOff"    # J
    .param p3, "buf"    # [J
    .param p4, "index"    # I
    .param p5, "length"    # I

    .line 547
    int-to-long v0, p5

    const-wide/16 v2, 0x8

    mul-long v0, v0, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 548
    invoke-super/range {p0 .. p5}, Lcom/sun/jna/Pointer;->write(J[JII)V

    .line 549
    return-void
.end method

.method public write(J[Lcom/sun/jna/Pointer;II)V
    .locals 2
    .param p1, "bOff"    # J
    .param p3, "buf"    # [Lcom/sun/jna/Pointer;
    .param p4, "index"    # I
    .param p5, "length"    # I

    .line 589
    sget v0, Lcom/sun/jna/Native;->POINTER_SIZE:I

    mul-int v0, v0, p5

    int-to-long v0, v0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 590
    invoke-super/range {p0 .. p5}, Lcom/sun/jna/Pointer;->write(J[Lcom/sun/jna/Pointer;II)V

    .line 591
    return-void
.end method

.method public write(J[SII)V
    .locals 4
    .param p1, "bOff"    # J
    .param p3, "buf"    # [S
    .param p4, "index"    # I
    .param p5, "length"    # I

    .line 505
    int-to-long v0, p5

    const-wide/16 v2, 0x2

    mul-long v0, v0, v2

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/sun/jna/Memory;->boundsCheck(JJ)V

    .line 506
    invoke-super/range {p0 .. p5}, Lcom/sun/jna/Pointer;->write(J[SII)V

    .line 507
    return-void
.end method

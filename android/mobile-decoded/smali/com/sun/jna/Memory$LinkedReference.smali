.class Lcom/sun/jna/Memory$LinkedReference;
.super Ljava/lang/ref/WeakReference;
.source "Memory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sun/jna/Memory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LinkedReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ref/WeakReference<",
        "Lcom/sun/jna/Memory;",
        ">;"
    }
.end annotation


# instance fields
.field private next:Lcom/sun/jna/Memory$LinkedReference;

.field private prev:Lcom/sun/jna/Memory$LinkedReference;


# direct methods
.method private constructor <init>(Lcom/sun/jna/Memory;)V
    .locals 1
    .param p1, "referent"    # Lcom/sun/jna/Memory;

    .line 67
    invoke-static {}, Lcom/sun/jna/Memory;->access$000()Ljava/lang/ref/ReferenceQueue;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 68
    return-void
.end method

.method static synthetic access$200(Lcom/sun/jna/Memory$LinkedReference;)V
    .locals 0
    .param p0, "x0"    # Lcom/sun/jna/Memory$LinkedReference;

    .line 61
    invoke-direct {p0}, Lcom/sun/jna/Memory$LinkedReference;->unlink()V

    return-void
.end method

.method static synthetic access$300(Lcom/sun/jna/Memory$LinkedReference;)Lcom/sun/jna/Memory$LinkedReference;
    .locals 1
    .param p0, "x0"    # Lcom/sun/jna/Memory$LinkedReference;

    .line 61
    iget-object v0, p0, Lcom/sun/jna/Memory$LinkedReference;->next:Lcom/sun/jna/Memory$LinkedReference;

    return-object v0
.end method

.method static synthetic access$400(Lcom/sun/jna/Memory$LinkedReference;)Lcom/sun/jna/Memory$LinkedReference;
    .locals 1
    .param p0, "x0"    # Lcom/sun/jna/Memory$LinkedReference;

    .line 61
    iget-object v0, p0, Lcom/sun/jna/Memory$LinkedReference;->prev:Lcom/sun/jna/Memory$LinkedReference;

    return-object v0
.end method

.method static track(Lcom/sun/jna/Memory;)Lcom/sun/jna/Memory$LinkedReference;
    .locals 3
    .param p0, "instance"    # Lcom/sun/jna/Memory;

    .line 77
    invoke-static {}, Lcom/sun/jna/Memory;->access$000()Ljava/lang/ref/ReferenceQueue;

    move-result-object v0

    monitor-enter v0

    .line 81
    :goto_0
    :try_start_0
    invoke-static {}, Lcom/sun/jna/Memory;->access$000()Ljava/lang/ref/ReferenceQueue;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ref/ReferenceQueue;->poll()Ljava/lang/ref/Reference;

    move-result-object v1

    check-cast v1, Lcom/sun/jna/Memory$LinkedReference;

    move-object v2, v1

    .local v2, "stale":Lcom/sun/jna/Memory$LinkedReference;
    if-eqz v1, :cond_0

    .line 82
    invoke-direct {v2}, Lcom/sun/jna/Memory$LinkedReference;->unlink()V

    goto :goto_0

    .line 84
    .end local v2    # "stale":Lcom/sun/jna/Memory$LinkedReference;
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 87
    new-instance v0, Lcom/sun/jna/Memory$LinkedReference;

    invoke-direct {v0, p0}, Lcom/sun/jna/Memory$LinkedReference;-><init>(Lcom/sun/jna/Memory;)V

    move-object v1, v0

    .line 89
    .local v1, "entry":Lcom/sun/jna/Memory$LinkedReference;
    const-class v2, Lcom/sun/jna/Memory$LinkedReference;

    monitor-enter v2

    .line 90
    :try_start_1
    invoke-static {}, Lcom/sun/jna/Memory;->access$100()Lcom/sun/jna/Memory$LinkedReference;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 91
    invoke-static {}, Lcom/sun/jna/Memory;->access$100()Lcom/sun/jna/Memory$LinkedReference;

    move-result-object v0

    iput-object v0, v1, Lcom/sun/jna/Memory$LinkedReference;->next:Lcom/sun/jna/Memory$LinkedReference;

    .line 92
    invoke-static {}, Lcom/sun/jna/Memory;->access$100()Lcom/sun/jna/Memory$LinkedReference;

    move-result-object v0

    iput-object v1, v0, Lcom/sun/jna/Memory$LinkedReference;->prev:Lcom/sun/jna/Memory$LinkedReference;

    invoke-static {v1}, Lcom/sun/jna/Memory;->access$102(Lcom/sun/jna/Memory$LinkedReference;)Lcom/sun/jna/Memory$LinkedReference;

    goto :goto_1

    .line 94
    :cond_1
    invoke-static {v1}, Lcom/sun/jna/Memory;->access$102(Lcom/sun/jna/Memory$LinkedReference;)Lcom/sun/jna/Memory$LinkedReference;

    .line 96
    :goto_1
    monitor-exit v2

    .line 98
    return-object v1

    .line 96
    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 84
    .end local v1    # "entry":Lcom/sun/jna/Memory$LinkedReference;
    :catchall_1
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method

.method private unlink()V
    .locals 3

    .line 105
    const-class v0, Lcom/sun/jna/Memory$LinkedReference;

    monitor-enter v0

    .line 108
    :try_start_0
    invoke-static {}, Lcom/sun/jna/Memory;->access$100()Lcom/sun/jna/Memory$LinkedReference;

    move-result-object v1

    if-eq v1, p0, :cond_1

    .line 109
    iget-object v1, p0, Lcom/sun/jna/Memory$LinkedReference;->prev:Lcom/sun/jna/Memory$LinkedReference;

    if-nez v1, :cond_0

    .line 111
    monitor-exit v0

    return-void

    .line 114
    :cond_0
    iget-object v1, p0, Lcom/sun/jna/Memory$LinkedReference;->prev:Lcom/sun/jna/Memory$LinkedReference;

    iget-object v2, p0, Lcom/sun/jna/Memory$LinkedReference;->next:Lcom/sun/jna/Memory$LinkedReference;

    iput-object v2, v1, Lcom/sun/jna/Memory$LinkedReference;->next:Lcom/sun/jna/Memory$LinkedReference;

    move-object v1, v2

    .local v1, "next":Lcom/sun/jna/Memory$LinkedReference;
    goto :goto_0

    .line 116
    .end local v1    # "next":Lcom/sun/jna/Memory$LinkedReference;
    :cond_1
    invoke-static {}, Lcom/sun/jna/Memory;->access$100()Lcom/sun/jna/Memory$LinkedReference;

    move-result-object v1

    iget-object v1, v1, Lcom/sun/jna/Memory$LinkedReference;->next:Lcom/sun/jna/Memory$LinkedReference;

    invoke-static {v1}, Lcom/sun/jna/Memory;->access$102(Lcom/sun/jna/Memory$LinkedReference;)Lcom/sun/jna/Memory$LinkedReference;

    move-result-object v1

    .line 119
    .restart local v1    # "next":Lcom/sun/jna/Memory$LinkedReference;
    :goto_0
    if-eqz v1, :cond_2

    .line 120
    iget-object v2, p0, Lcom/sun/jna/Memory$LinkedReference;->prev:Lcom/sun/jna/Memory$LinkedReference;

    iput-object v2, v1, Lcom/sun/jna/Memory$LinkedReference;->prev:Lcom/sun/jna/Memory$LinkedReference;

    .line 124
    :cond_2
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/sun/jna/Memory$LinkedReference;->prev:Lcom/sun/jna/Memory$LinkedReference;

    .line 125
    .end local v1    # "next":Lcom/sun/jna/Memory$LinkedReference;
    monitor-exit v0

    .line 126
    return-void

    .line 125
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

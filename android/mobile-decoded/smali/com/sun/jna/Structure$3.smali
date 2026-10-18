.class final Lcom/sun/jna/Structure$3;
.super Lcom/sun/jna/Pointer;
.source "Structure.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sun/jna/Structure;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>(J)V
    .locals 0
    .param p1, "peer"    # J

    .line 2290
    invoke-direct {p0, p1, p2}, Lcom/sun/jna/Pointer;-><init>(J)V

    return-void
.end method


# virtual methods
.method public share(JJ)Lcom/sun/jna/Pointer;
    .locals 0
    .param p1, "offset"    # J
    .param p3, "sz"    # J

    .line 2292
    return-object p0
.end method

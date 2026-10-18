.class public final Lcn/hongguo/tv/DirectMediaSource$Prepared;
.super Ljava/lang/Object;
.source "DirectMediaSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/hongguo/tv/DirectMediaSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Prepared"
.end annotation


# instance fields
.field public bytes:J

.field public codec:Ljava/lang/String;

.field public downloadMs:J

.field public encrypted:Z

.field public file:Ljava/io/File;

.field public transform:Lcn/hongguo/tv/Mp4SampleTransform$Result;

.field public transformMs:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

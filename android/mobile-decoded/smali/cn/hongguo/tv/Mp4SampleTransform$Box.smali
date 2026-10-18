.class final Lcn/hongguo/tv/Mp4SampleTransform$Box;
.super Ljava/lang/Object;
.source "Mp4SampleTransform.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/hongguo/tv/Mp4SampleTransform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Box"
.end annotation


# instance fields
.field data:J

.field end:J

.field start:J

.field type:Ljava/lang/String;


# direct methods
.method constructor <init>(JJJLjava/lang/String;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcn/hongguo/tv/Mp4SampleTransform$Box;->start:J

    iput-wide p3, p0, Lcn/hongguo/tv/Mp4SampleTransform$Box;->data:J

    iput-wide p5, p0, Lcn/hongguo/tv/Mp4SampleTransform$Box;->end:J

    iput-object p7, p0, Lcn/hongguo/tv/Mp4SampleTransform$Box;->type:Ljava/lang/String;

    return-void
.end method

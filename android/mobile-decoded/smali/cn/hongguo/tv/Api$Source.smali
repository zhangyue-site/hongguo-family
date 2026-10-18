.class final Lcn/hongguo/tv/Api$Source;
.super Ljava/lang/Object;
.source "Api.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/hongguo/tv/Api;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Source"
.end annotation


# instance fields
.field final headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final local:Z

.field final location:Ljava/lang/String;

.field final qualityNote:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;ZLjava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 8
    const-string v0, ""

    invoke-direct {p0, p1, p2, p3, v0}, Lcn/hongguo/tv/Api$Source;-><init>(Ljava/lang/String;ZLjava/util/Map;Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;ZLjava/util/Map;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/Api$Source;->location:Ljava/lang/String;

    iput-boolean p2, p0, Lcn/hongguo/tv/Api$Source;->local:Z

    iput-object p3, p0, Lcn/hongguo/tv/Api$Source;->headers:Ljava/util/Map;

    iput-object p4, p0, Lcn/hongguo/tv/Api$Source;->qualityNote:Ljava/lang/String;

    return-void
.end method

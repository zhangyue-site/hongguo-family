.class final Lcn/hongguo/tv/CatalogCache$Entry;
.super Ljava/lang/Object;
.source "CatalogCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/hongguo/tv/CatalogCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Entry"
.end annotation


# instance fields
.field final json:Ljava/lang/String;

.field final restored:Z

.field final savedAt:J


# direct methods
.method constructor <init>(Ljava/lang/String;J)V
    .locals 1

    .line 13
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcn/hongguo/tv/CatalogCache$Entry;-><init>(Ljava/lang/String;JZ)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;JZ)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/CatalogCache$Entry;->json:Ljava/lang/String;

    iput-wide p2, p0, Lcn/hongguo/tv/CatalogCache$Entry;->savedAt:J

    iput-boolean p4, p0, Lcn/hongguo/tv/CatalogCache$Entry;->restored:Z

    return-void
.end method


# virtual methods
.method items()Lorg/json/JSONArray;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 13
    new-instance v0, Lorg/json/JSONArray;

    iget-object v1, p0, Lcn/hongguo/tv/CatalogCache$Entry;->json:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

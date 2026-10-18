.class final Lcn/hongguo/tv/Catalog$Result;
.super Ljava/lang/Object;
.source "Catalog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/hongguo/tv/Catalog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Result"
.end annotation


# instance fields
.field final fromCache:Z

.field final items:Lorg/json/JSONArray;

.field final stale:Z


# direct methods
.method constructor <init>(Lorg/json/JSONArray;ZZ)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/Catalog$Result;->items:Lorg/json/JSONArray;

    iput-boolean p2, p0, Lcn/hongguo/tv/Catalog$Result;->stale:Z

    iput-boolean p3, p0, Lcn/hongguo/tv/Catalog$Result;->fromCache:Z

    return-void
.end method


# virtual methods
.method note(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 30
    iget-boolean p1, p0, Lcn/hongguo/tv/Catalog$Result;->stale:Z

    if-eqz p1, :cond_0

    const-string p1, "\u76ee\u5f55\u6682\u4e0d\u53ef\u7528\uff0c\u663e\u793a\u4e0a\u6b21\u7ed3\u679c"

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcn/hongguo/tv/Catalog$Result;->items:Lorg/json/JSONArray;

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "\u6682\u65e0\u7ed3\u679c\uff0c\u8bf7\u6362\u4e2a\u8bcd\u641c\u7d22"

    goto :goto_0

    :cond_1
    const-string p1, ""

    :goto_0
    return-object p1
.end method

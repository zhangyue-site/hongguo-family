.class final Lcn/hongguo/tv/PublicCategories;
.super Ljava/lang/Object;
.source "PublicCategories.java"


# static fields
.field static final PATHS:[Ljava/lang/String;

.field static final REAL:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 25

    .line 5
    const-string v22, "\u7efc\u827a"

    const-string v23, "\u5267\u60c5"

    const-string v0, "\u7231\u60c5"

    const-string v1, "\u5e74\u4ee3"

    const-string v2, "\u9006\u88ad"

    const-string v3, "\u4f20\u5947"

    const-string v4, "\u6210\u957f"

    const-string v5, "\u5bb6\u5ead"

    const-string v6, "\u5bb6\u65cf"

    const-string v7, "\u840c\u5b9d"

    const-string v8, "\u60ac\u7591"

    const-string v9, "\u60ca\u609a"

    const-string v10, "\u6050\u6016"

    const-string v11, "\u5fd7\u602a"

    const-string v12, "\u53e4\u88c5"

    const-string v13, "\u7384\u5e7b"

    const-string v14, "\u5947\u5e7b"

    const-string v15, "\u90fd\u5e02"

    const-string v16, "\u9752\u6625"

    const-string v17, "\u559c\u5267"

    const-string v18, "\u79d1\u5e7b"

    const-string v19, "\u707e\u96be"

    const-string v20, "\u52a8\u4f5c\u5192\u9669"

    const-string v21, "\u6218\u4e89"

    filled-new-array/range {v0 .. v23}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcn/hongguo/tv/PublicCategories;->REAL:[Ljava/lang/String;

    .line 6
    const-string v23, "variety"

    const-string v24, "drama"

    const-string v1, "romance"

    const-string v2, "period"

    const-string v3, "comeback"

    const-string v4, "legend"

    const-string v5, "growth"

    const-string v6, "family"

    const-string v7, "clan"

    const-string v8, "cute-kids"

    const-string v9, "suspense"

    const-string v10, "thriller"

    const-string v11, "horror"

    const-string v12, "supernatural"

    const-string v13, "costume"

    const-string v14, "fantasy"

    const-string v15, "wonder"

    const-string v16, "urban"

    const-string v17, "youth"

    const-string v18, "comedy"

    const-string v19, "sci-fi"

    const-string v20, "disaster"

    const-string v21, "action-adventure"

    const-string v22, "war"

    filled-new-array/range {v1 .. v24}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcn/hongguo/tv/PublicCategories;->PATHS:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static genres(Ljava/lang/String;)[Ljava/lang/String;
    .locals 1

    .line 7
    const-string v0, "short"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcn/hongguo/tv/PublicCategories;->REAL:[Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object p0, Lcn/hongguo/tv/AiCatalog;->GENRES:[Ljava/lang/String;

    :goto_0
    return-object p0
.end method

.method static path(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 9
    const-string v0, "short"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const-string v1, "/category/real-drama"

    goto :goto_0

    :cond_0
    const-string v1, "manju"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "/category/comic-drama"

    goto :goto_0

    :cond_1
    const-string v1, "ai"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "/category/ai-drama"

    goto :goto_0

    :cond_2
    move-object v1, v2

    .line 10
    :goto_0
    if-eqz v1, :cond_7

    .line 11
    const-string v3, "\u5168\u90e8"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    return-object v1

    .line 12
    :cond_3
    invoke-static {p1}, Lcn/hongguo/tv/PublicCategories;->genres(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    sget-object p1, Lcn/hongguo/tv/PublicCategories;->PATHS:[Ljava/lang/String;

    goto :goto_1

    :cond_4
    sget-object p1, Lcn/hongguo/tv/AiCatalog;->PATHS:[Ljava/lang/String;

    .line 13
    :goto_1
    const/4 v0, 0x0

    :goto_2
    array-length v4, v3

    if-ge v0, v4, :cond_6

    aget-object v4, v3, v0

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    aget-object p1, p1, v0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 14
    :cond_6
    return-object v2

    .line 10
    :cond_7
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Unknown category type"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

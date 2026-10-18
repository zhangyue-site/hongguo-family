.class public final synthetic Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/HomeFeed;

.field public final synthetic f$1:Z

.field public final synthetic f$2:J


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/HomeFeed;ZJ)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda0;->f$0:Lcn/hongguo/tv/HomeFeed;

    iput-boolean p2, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda0;->f$1:Z

    iput-wide p3, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda0;->f$2:J

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 6

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda0;->f$0:Lcn/hongguo/tv/HomeFeed;

    iget-boolean v1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda0;->f$1:Z

    iget-wide v2, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda0;->f$2:J

    move-object v4, p1

    check-cast v4, Lorg/json/JSONObject;

    move-object v5, p2

    check-cast v5, Lorg/json/JSONObject;

    invoke-virtual/range {v0 .. v5}, Lcn/hongguo/tv/HomeFeed;->lambda$ranked$14$cn-hongguo-tv-HomeFeed(ZJLorg/json/JSONObject;Lorg/json/JSONObject;)I

    move-result p1

    return p1
.end method

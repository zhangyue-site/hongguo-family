.class public final synthetic Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda12;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/HomeFeed;

.field public final synthetic f$1:I

.field public final synthetic f$2:I

.field public final synthetic f$3:Lcn/hongguo/tv/Catalog$Result;

.field public final synthetic f$4:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/HomeFeed;IILcn/hongguo/tv/Catalog$Result;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda12;->f$0:Lcn/hongguo/tv/HomeFeed;

    iput p2, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda12;->f$1:I

    iput p3, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda12;->f$2:I

    iput-object p4, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda12;->f$3:Lcn/hongguo/tv/Catalog$Result;

    iput-object p5, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda12;->f$4:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda12;->f$0:Lcn/hongguo/tv/HomeFeed;

    iget v1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda12;->f$1:I

    iget v2, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda12;->f$2:I

    iget-object v3, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda12;->f$3:Lcn/hongguo/tv/Catalog$Result;

    iget-object v4, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda12;->f$4:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcn/hongguo/tv/HomeFeed;->lambda$load$10$cn-hongguo-tv-HomeFeed(IILcn/hongguo/tv/Catalog$Result;Ljava/lang/String;)V

    return-void
.end method

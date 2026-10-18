.class public final synthetic Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda23;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/HomeFeed;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Z

.field public final synthetic f$3:I

.field public final synthetic f$4:I


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/HomeFeed;Ljava/lang/String;ZII)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda23;->f$0:Lcn/hongguo/tv/HomeFeed;

    iput-object p2, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda23;->f$1:Ljava/lang/String;

    iput-boolean p3, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda23;->f$2:Z

    iput p4, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda23;->f$3:I

    iput p5, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda23;->f$4:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda23;->f$0:Lcn/hongguo/tv/HomeFeed;

    iget-object v1, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda23;->f$1:Ljava/lang/String;

    iget-boolean v2, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda23;->f$2:Z

    iget v3, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda23;->f$3:I

    iget v4, p0, Lcn/hongguo/tv/HomeFeed$$ExternalSyntheticLambda23;->f$4:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lcn/hongguo/tv/HomeFeed;->lambda$load$12$cn-hongguo-tv-HomeFeed(Ljava/lang/String;ZII)V

    return-void
.end method

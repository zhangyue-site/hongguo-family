.class public final synthetic Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcn/hongguo/tv/ReadRetry$Operation;


# instance fields
.field public final synthetic f$0:Lcn/hongguo/tv/StandaloneApi;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/io/File;

.field public final synthetic f$3:I


# direct methods
.method public synthetic constructor <init>(Lcn/hongguo/tv/StandaloneApi;Ljava/lang/String;Ljava/io/File;I)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda0;->f$0:Lcn/hongguo/tv/StandaloneApi;

    iput-object p2, p0, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda0;->f$2:Ljava/io/File;

    iput p4, p0, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda0;->f$3:I

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 4

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda0;->f$0:Lcn/hongguo/tv/StandaloneApi;

    iget-object v1, p0, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda0;->f$2:Ljava/io/File;

    iget v3, p0, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda0;->f$3:I

    invoke-virtual {v0, v1, v2, v3}, Lcn/hongguo/tv/StandaloneApi;->lambda$media$0$cn-hongguo-tv-StandaloneApi(Ljava/lang/String;Ljava/io/File;I)Lcn/hongguo/tv/DirectMediaSource$Prepared;

    move-result-object v0

    return-object v0
.end method

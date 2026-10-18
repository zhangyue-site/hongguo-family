.class public final synthetic Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcn/hongguo/tv/ReadRetry$Operation;


# instance fields
.field public final synthetic f$0:Ljava/io/File;

.field public final synthetic f$1:[Z

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/io/File;[ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda1;->f$0:Ljava/io/File;

    iput-object p2, p0, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda1;->f$1:[Z

    iput-object p3, p0, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda1;->f$2:Ljava/lang/String;

    iput-object p4, p0, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda1;->f$3:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()Ljava/lang/Object;
    .locals 4

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda1;->f$0:Ljava/io/File;

    iget-object v1, p0, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda1;->f$1:[Z

    iget-object v2, p0, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda1;->f$2:Ljava/lang/String;

    iget-object v3, p0, Lcn/hongguo/tv/StandaloneApi$$ExternalSyntheticLambda1;->f$3:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Lcn/hongguo/tv/StandaloneApi;->lambda$media$1(Ljava/io/File;[ZLjava/lang/String;Ljava/lang/String;)Lcn/hongguo/tv/DirectMediaSource$Prepared;

    move-result-object v0

    return-object v0
.end method

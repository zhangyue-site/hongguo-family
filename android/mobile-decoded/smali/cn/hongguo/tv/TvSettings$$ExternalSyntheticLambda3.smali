.class public final synthetic Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/util/ArrayList;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;I)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda3;->f$0:Ljava/util/ArrayList;

    iput p2, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda3;->f$1:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda3;->f$0:Ljava/util/ArrayList;

    iget v1, p0, Lcn/hongguo/tv/TvSettings$$ExternalSyntheticLambda3;->f$1:I

    invoke-static {v0, v1}, Lcn/hongguo/tv/TvSettings;->lambda$choose$2(Ljava/util/ArrayList;I)V

    return-void
.end method
